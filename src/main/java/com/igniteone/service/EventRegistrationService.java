package com.igniteone.service;

import com.igniteone.model.Event;
import com.igniteone.model.EventRegistration;
import com.igniteone.model.User;
import com.igniteone.repository.EventRegistrationRepository;
import com.igniteone.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EventRegistrationService {

    @Autowired
    private EventRegistrationRepository eventRegistrationRepository;

    @Autowired
    private EventRepository eventRepository;

    @Transactional
    public void registerForEvent(Long eventId, User user) {
        Event event = eventRepository.findById(eventId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid event Id:" + eventId));
                
        // Check if already registered
        List<EventRegistration> registrations = eventRegistrationRepository.findAll();
        boolean alreadyRegistered = registrations.stream()
                .anyMatch(r -> r.getEvent().getId().equals(eventId) && r.getUser().getId().equals(user.getId()));
                
        if (!alreadyRegistered) {
            EventRegistration registration = new EventRegistration();
            registration.setEvent(event);
            registration.setUser(user);
            eventRegistrationRepository.save(registration);
        }
    }
}
