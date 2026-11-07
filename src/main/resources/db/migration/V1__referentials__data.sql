INSERT INTO station(code, name, city) VALUES
    ('MSC','Marseille-Saint-Charles','Marseille'),
    ('MSB','Marseille-Blancarde','Marseille'),
    ('ABN','Aubagne','Aubagne'),
    ('CAS','Cassis','Cassis'),
    ('CTA','La Ciotat-Ceyreste','La Ciotat'),
    ('STCY','Saint-Cyr Les Lecques-La Cadière','Saint-Cyr'),
    ('BDL','Bandol','Bandol'),
    ('OLSM','Ollioules - Sanary-sur-Mer','Sanary-sur-Mer'),
    ('LSN','La Seyne-Six-Fours','La Seyne-sur-Mer'),
    ('TLN','Toulon','Toulon'),
    ('PCB','Picon Busserine','Marseille'),
    ('STMP','Sainte-Marthe en Provence','Marseille'),
    ('STJS','Saint-Joseph - Le Castellas','Marseille'),
    ('STANT','Saint-Antoine','Marseille'),
    ('SEPT','Septème','Marseille'),
    ('SIMI','Simiane','Simiane'),
    ('GARD','Gardanne','Gardanne'),
    ('AIXPCE','Aix-en-Provence','Aix-en-Provence'),
    ('AREURM','Arenc-Euroméditerranée','Marseille'),
    ('ESTQ','Estaque','Marseille'),
    ('NIOL','Niolon','Niolon'),
    ('ENSURE','La-Redonne-Ensuès', 'Ensuès-La-Redonne'),
    ('CARRRO','Carry-Le-Rouet','Carry-Le-Rouet'),
    ('SAUSSLP','Sausset-Les-Pins','Sausset-Les-Pins'),
    ('COURC','La-Couronne-Carro','Martigues'),
    ('CRST','Croix-Sainte','Martigues'),
    ('PORTDB','Port-de-Bouc','Port-de-Bouc'),
    ('FSM','Fos-sur-Mer','Fos-sur-Mer'),
    ('RASS','Rassuen','Istres'),
    ('IST','Istres','Istres');

INSERT INTO line(code,name) VALUES
    ('L01','Marseille - Istres'),
    ('L02','Istres - Marseille'),
    ('L03','Marseille - Toulon'),
    ('L04','Toulon - Marseille'),
    ('L05','Marseille - Aubagne'),
    ('L06','Aubagne - Marseille'),
    ('L07','Marseille - Aix-en-Provence'),
    ('L08','Aix-en-Provence - Marseille'),
    ('L09','Marseille - Sausset-les-Pins'),
    ('L10','Sausset-les-Pins - Marseille'),
    ('L11','Marseille - Port-de-Bouc'),
    ('L12','Port-de-Bouc - Marseille');

INSERT INTO travel_class(code,label) VALUES
    ('FIRST','First-Class'),
    ('SECOND','Second-Class');

INSERT INTO calendar(code,label,monday,tuesday,wednesday,thursday,friday,saturday,sunday,valid_from,valid_to) VALUES
    ('DAILY','Daily',TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,'2026-01-01','2026-12-31'),
    ('WEEKDAY','Weekday',TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,FALSE,'2026-01-01','2026-12-31'),
    ('WEEKEND','Weekend',FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,'2026-01-01','2026-12-31');

INSERT INTO calendar_exception(calendar_id,exception_date, exception_type) VALUES
    ((SELECT calendar_id FROM calendar WHERE code='WEEKDAY'),'2026-05-01','REMOVED'),
    ((SELECT calendar_id FROM calendar WHERE code='WEEKDAY'),'2026-05-08','REMOVED'),
    ((SELECT calendar_id FROM calendar WHERE code='WEEKDAY'),'2026-07-14','REMOVED'),
    ((SELECT calendar_id FROM calendar WHERE code='WEEKDAY'),'2026-11-11','REMOVED'),
    ((SELECT calendar_id FROM calendar WHERE code='WEEKDAY'),'2026-12-25','REMOVED');

INSERT INTO fare_period(code,label) VALUES
    ('PEAK','Rush-hour'),
    ('OFF-PEAK','Off-peak-hours'),
    ('WEEKEND','Week-end');

INSERT INTO passenger_profile(code,label) VALUES
    ('STANDARD','Full-Price'),
    ('YOUTH','Youth-Fare'),
    ('SENIOR','Senior-Fare'),
    ('SUBSCRIBER','Subscriber-Fare');

INSERT INTO train_trip(trip_number, line_id, calendar_id, train_id) VALUES
    ('TRIP-8820',(SELECT line_id FROM line WHERE code='L01'),(SELECT id FROM calendar WHERE code='DAILY'),(SELECT train_id FROM train WHERE train_number='TER-8755')),
    ('TRIP-8821',(SELECT line_id FROM line WHERE code='L01'),(SELECT id FROM calendar WHERE code='WEEKDAY'),(SELECT train_id FROM train WHERE train_number='TER-8756')),
    ('TRIP-8822',(SELECT line_id FROM line WHERE code='L01'),(SELECT id FROM calendar WHERE code='WEEKEND'),(SELECT train_id FROM train WHERE train_number='TER-8757')),

    ('TRIP-8823',(SELECT line_id FROM line WHERE code='L02'),(SELECT id FROM calendar WHERE code='DAILY'),(SELECT train_id FROM train WHERE train_number='TER-8758')),
    ('TRIP-8824',(SELECT line_id FROM line WHERE code='L02'),(SELECT id FROM calendar WHERE code='WEEKDAY'),(SELECT train_id FROM train WHERE train_number='TER-8759')),
    ('TRIP-8825',(SELECT line_id FROM line WHERE code='L02'),(SELECT id FROM calendar WHERE code='WEEKEND'),(SELECT train_id FROM train WHERE train_number='TER-8760')),

    ('TRIP-8826',(SELECT line_id FROM line WHERE code='L03'),(SELECT id FROM calendar WHERE code='DAILY'),(SELECT train_id FROM train WHERE train_number='TER-8761')),
    ('TRIP-8827',(SELECT line_id FROM line WHERE code='L03'),(SELECT id FROM calendar WHERE code='WEEKDAY'),(SELECT train_id FROM train WHERE train_number='TER-8762')),
    ('TRIP-8828',(SELECT line_id FROM line WHERE code='L03'),(SELECT id FROM calendar WHERE code='WEEKEND'),(SELECT train_id FROM train WHERE train_number='TER-8763')),

    ('TRIP-8829',(SELECT line_id FROM line WHERE code='L04'),(SELECT id FROM calendar WHERE code='DAILY'),(SELECT train_id FROM train WHERE train_number='TER-8764')),
    ('TRIP-8830',(SELECT line_id FROM line WHERE code='L04'),(SELECT id FROM calendar WHERE code='WEEKDAY'),(SELECT train_id FROM train WHERE train_number='TER-8765')),
    ('TRIP-8831',(SELECT line_id FROM line WHERE code='L04'),(SELECT id FROM calendar WHERE code='WEEKEND'),(SELECT train_id FROM train WHERE train_number='TER-8766')),

    ('TRIP-8832',(SELECT line_id FROM line WHERE code='L05'),(SELECT id FROM calendar WHERE code='DAILY'),(SELECT train_id FROM train WHERE train_number='TER-8767')),
    ('TRIP-8833',(SELECT line_id FROM line WHERE code='L05'),(SELECT id FROM calendar WHERE code='WEEKDAY'),(SELECT train_id FROM train WHERE train_number='TER-8768')),
    ('TRIP-8834',(SELECT line_id FROM line WHERE code='L05'),(SELECT id FROM calendar WHERE code='WEEKEND'),(SELECT train_id FROM train WHERE train_number='TER-8769')),

    ('TRIP-8835',(SELECT line_id FROM line WHERE code='L06'),(SELECT id FROM calendar WHERE code='DAILY'),(SELECT train_id FROM train WHERE train_number='TER-8770')),
    ('TRIP-8836',(SELECT line_id FROM line WHERE code='L06'),(SELECT id FROM calendar WHERE code='WEEKDAY'),(SELECT train_id FROM train WHERE train_number='TER-8771')),
    ('TRIP-8837',(SELECT line_id FROM line WHERE code='L06'),(SELECT id FROM calendar WHERE code='WEEKEND'),(SELECT train_id FROM train WHERE train_number='TER-8772')),

    ('TRIP-8838',(SELECT line_id FROM line WHERE code='L07'),(SELECT id FROM calendar WHERE code='DAILY'),(SELECT train_id FROM train WHERE train_number='TER-8773')),
    ('TRIP-8839',(SELECT line_id FROM line WHERE code='L07'),(SELECT id FROM calendar WHERE code='WEEKDAY'),(SELECT train_id FROM train WHERE train_number='TER-8774')),
    ('TRIP-8840',(SELECT line_id FROM line WHERE code='L07'),(SELECT id FROM calendar WHERE code='WEEKEND'),(SELECT train_id FROM train WHERE train_number='TER-8775')),

    ('TRIP-8841',(SELECT line_id FROM line WHERE code='L08'),(SELECT id FROM calendar WHERE code='DAILY'),(SELECT train_id FROM train WHERE train_number='TER-8776')),
    ('TRIP-8842',(SELECT line_id FROM line WHERE code='L08'),(SELECT id FROM calendar WHERE code='WEEKDAY'),(SELECT train_id FROM train WHERE train_number='TER-8777')),
    ('TRIP-8843',(SELECT line_id FROM line WHERE code='L08'),(SELECT id FROM calendar WHERE code='WEEKEND'),(SELECT train_id FROM train WHERE train_number='TER-8778')),

    ('TRIP-8844',(SELECT line_id FROM line WHERE code='L09'),(SELECT id FROM calendar WHERE code='DAILY'),(SELECT train_id FROM train WHERE train_number='TER-8779')),
    ('TRIP-8845',(SELECT line_id FROM line WHERE code='L09'),(SELECT id FROM calendar WHERE code='WEEKDAY'),(SELECT train_id FROM train WHERE train_number='TER-8780')),
    ('TRIP-8846',(SELECT line_id FROM line WHERE code='L09'),(SELECT id FROM calendar WHERE code='WEEKEND'),(SELECT train_id FROM train WHERE train_number='TER-8781')),

    ('TRIP-8847',(SELECT line_id FROM line WHERE code='L10'),(SELECT id FROM calendar WHERE code='DAILY'),(SELECT train_id FROM train WHERE train_number='TER-8782')),
    ('TRIP-8848',(SELECT line_id FROM line WHERE code='L10'),(SELECT id FROM calendar WHERE code='WEEKDAY'),(SELECT train_id FROM train WHERE train_number='TER-8783')),
    ('TRIP-8849',(SELECT line_id FROM line WHERE code='L10'),(SELECT id FROM calendar WHERE code='WEEKEND'),(SELECT train_id FROM train WHERE train_number='TER-8784')),

    ('TRIP-8850',(SELECT line_id FROM line WHERE code='L11'),(SELECT id FROM calendar WHERE code='DAILY'),(SELECT train_id FROM train WHERE train_number='TER-8785')),
    ('TRIP-8851',(SELECT line_id FROM line WHERE code='L11'),(SELECT id FROM calendar WHERE code='WEEKDAY'),(SELECT train_id FROM train WHERE train_number='TER-8786')),
    ('TRIP-8852',(SELECT line_id FROM line WHERE code='L11'),(SELECT id FROM calendar WHERE code='WEEKEND'),(SELECT train_id FROM train WHERE train_number='TER-8787')),

    ('TRIP-8853',(SELECT line_id FROM line WHERE code='L12'),(SELECT id FROM calendar WHERE code='DAILY'),(SELECT train_id FROM train WHERE train_number='TER-8787')),
    ('TRIP-8854',(SELECT line_id FROM line WHERE code='L12'),(SELECT id FROM calendar WHERE code='WEEKDAY'),(SELECT train_id FROM train WHERE train_number='TER-8788')),
    ('TRIP-8855',(SELECT line_id FROM line WHERE code='L12'),(SELECT id FROM calendar WHERE code='WEEKEND'),(SELECT train_id FROM train WHERE train_number='TER-8789'));


INSERT INTO stop_time(trip_id, station_id, stop_sequence, arrival_time, departure_time) VALUES

    --LINE L01 (Marseille -> Istres)
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id FROM station WHERE code='MSC'), 1, '08:00:00','08:00:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id FROM station WHERE code='AREURM'), 2, '08:06:00','08:08:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id FROM station WHERE code='ESTQ'), 3, '08:22:00','08:22:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id FROM station WHERE code='NIOL'), 4, '08:34:00','08:36:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id FROM station WHERE code='ENSURE'), 5, '08:45:00','08:47:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id FROM station WHERE code='CARRRO'), 6, '08:55:00','08:57:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id FROM station WHERE code='SAUSSLP'), 7, '09:07:00','09:22:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id FROM station WHERE code='COURC'), 8, '09:30:00','09:31:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id FROM station WHERE code='CRST'), 9, '09:39:00','09:39:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id station WHERE code='PORTDB'), 10, '09:45:00','09:45:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id FROM station WHERE code='FSM'), 11, '09:50:00','09:52:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id FROM station WHERE code='RASS'), 12, '09:57:00','09:57:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8820'), (SELECT station_id FROM station WHERE code='IST'), 13, '10:00:00','10:00:00'),

    --LINE L02 (Istres -> Marseille)
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='IST'), 1, '08:00:00','08:00:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='RASS'), 2, '08:06:00','08:08:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='FSM'), 3, '08:22:00','08:22:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='PORTDB'), 4, '08:34:00','08:36:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='CRST'), 5, '08:45:00','08:47:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='COURC'), 6, '08:55:00','08:57:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='SAUSSLP'), 7, '09:07:00','09:22:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='CARRRO'), 8, '09:30:00','09:31:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='ENSURE'), 9, '09:39:00','09:39:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='NIOL'), 10, '09:45:00','09:45:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='ESTQ'), 11, '09:50:00','09:52:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='AREURM'), 12, '09:57:00','09:57:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8823'), (SELECT station_id FROM station WHERE code='MSC'), 13, '10:00:00','10:00:00'),

    --LINE L03 (Marseille -> Toulon)
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8826'), (SELECT station_id FROM station WHERE code='MSC'), 1, '21:00:00','21:00:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8826'), (SELECT station_id FROM station WHERE code='MSB'), 2, '21:06:00','21:06:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8826'), (SELECT station_id FROM station WHERE code='ABN'), 3, '21:15:00','21:25:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8826'), (SELECT station_id FROM station WHERE code='CAS'), 4, '21:30:00','21:45:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8826'), (SELECT station_id FROM station WHERE code='CTA'), 5, '21:55:00','21:57:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8826'), (SELECT station_id FROM station WHERE code='STCY'), 6, '22:12:00','22:15:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8826'), (SELECT station_id FROM station WHERE code='BDL'), 7, '22:27:00','22:28:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8826'), (SELECT station_id FROM station WHERE code='OLSM'), 8, '22:34:00','22:35:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8826'), (SELECT station_id FROM station WHERE code='LSN'), 9, '22:43:00','22:45:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8826'), (SELECT station_id FROM station WHERE code='TLN'), 10, '22:55:00','23:00:00'),

    --LINE L04 (Toulon -> Marseille)
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8829'), (SELECT station_id FROM station WHERE code='TLN'), 1, '21:00:00','21:00:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8829'), (SELECT station_id FROM station WHERE code='LSN'), 2, '21:06:00','21:06:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8829'), (SELECT station_id FROM station WHERE code='OLSM'), 3, '21:15:00','21:25:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8829'), (SELECT station_id FROM station WHERE code='BDL'), 4, '21:30:00','21:45:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8829'), (SELECT station_id FROM station WHERE code='STCY'), 5, '21:55:00','21:57:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8829'), (SELECT station_id FROM station WHERE code='CTA'), 6, '22:12:00','22:15:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8829'), (SELECT station_id FROM station WHERE code='CAS'), 7, '22:27:00','22:28:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8829'), (SELECT station_id FROM station WHERE code='ABN'), 8, '22:34:00','22:35:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8829'), (SELECT station_id FROM station WHERE code='MSB'), 9, '22:43:00','22:45:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8829'), (SELECT station_id FROM station WHERE code='MSC'), 10, '22:55:00','23:00:00'),

    --LINE L05 (Marseille -> Aubagne)
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8832'), (SELECT station_id FROM station WHERE code='MSC'), 1, '13:00:00','13:05:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8832'), (SELECT station_id FROM station WHERE code='MSB'), 2, '13:10:00','13:20:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8832'), (SELECT station_id FROM station WHERE code='ABN'), 3, '13:35:00','13:40:00'),

    --LINE L06 (Aubagne -> Marseille)
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8835'), (SELECT station_id FROM station WHERE code='ABN'), 1, '13:00:00','13:05:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8835'), (SELECT station_id FROM station WHERE code='MSB'), 2, '13:10:00','13:20:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8835'), (SELECT station_id FROM station WHERE code='MSC'), 3, '13:35:00','13:40:00'),

    --LINE L07 (Marseille -> Aix)
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8838'), (SELECT station_id FROM station WHERE code='MSC'), 1, '16:35:00','16:40:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8838'), (SELECT station_id FROM station WHERE code='PCB'), 2, '16:47:00','16:48:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8838'), (SELECT station_id FROM station WHERE code='STMP'), 3, '16:55:00','16:56:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8838'), (SELECT station_id FROM station WHERE code='STJS'), 4, '17:15:00','17:16:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8838'), (SELECT station_id FROM station WHERE code='STANT'), 5, '17:35:00','17:37:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8838'), (SELECT station_id FROM station WHERE code='SEPT'), 6, '17:46:00','17:47:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8838'), (SELECT station_id FROM station WHERE code='SIMI'), 7, '17:52:00','17:53:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8838'), (SELECT station_id FROM station WHERE code='GARD'), 8, '18:00:00','18:02:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8838'), (SELECT station_id FROM station WHERE code='AIXPCE'), 9, '18:07:00','18:10:00'),

    --LINE L08 (Aix -> Marseille)
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8841'), (SELECT station_id FROM station WHERE code='AIXPCE'), 1, '16:35:00','16:40:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8841'), (SELECT station_id FROM station WHERE code='GARD'), 2, '16:47:00','16:48:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8841'), (SELECT station_id FROM station WHERE code='SIMI'), 3, '16:55:00','16:56:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8841'), (SELECT station_id FROM station WHERE code='SEPT'), 4, '17:15:00','17:16:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8841'), (SELECT station_id FROM station WHERE code='STANT'), 5, '17:35:00','17:37:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8841'), (SELECT station_id FROM station WHERE code='STJS'), 6, '17:46:00','17:47:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8841'), (SELECT station_id FROM station WHERE code='STMP'), 7, '17:52:00','17:53:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8841'), (SELECT station_id FROM station WHERE code='PCB'), 8, '18:00:00','18:02:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8841'), (SELECT station_id FROM station WHERE code='MSC'), 9, '18:07:00','18:10:00'),

    --LINE L09 (Marseille -> Sausset)
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8844'), (SELECT station_id FROM station WHERE code='MSC'), 1, '07:07:00','07:10:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8844'), (SELECT station_id FROM station WHERE code='AREURM'), 2, '07:15:00','07:16:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8844'), (SELECT station_id FROM station WHERE code='ESTQ'), 3, '07:25:00','07:26:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8844'), (SELECT station_id FROM station WHERE code='NIOL'), 4, '07:34:00','07:35:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8844'), (SELECT station_id FROM station WHERE code='ENSURE'), 5, '07:46:00','07:48:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8844'), (SELECT station_id FROM station WHERE code='CARRRO'), 6, '07:55:00','07:56:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8844'), (SELECT station_id FROM station WHERE code='SAUSSLP'), 7, '08:07:00','08:10:00'),

    --LINE L10 (Sausset -> Marseille)
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8847'), (SELECT station_id FROM station WHERE code='SAUSSLP'), 1, '07:07:00','07:10:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8847'), (SELECT station_id FROM station WHERE code='CARRRO'), 2, '07:15:00','07:16:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8847'), (SELECT station_id FROM station WHERE code='ENSURE'), 3, '07:25:00','07:26:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8847'), (SELECT station_id FROM station WHERE code='NIOL'), 4, '07:34:00','07:35:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8847'), (SELECT station_id FROM station WHERE code='ESTQ'), 5, '07:46:00','07:48:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8847'), (SELECT station_id FROM station WHERE code='AREURM'), 6, '07:55:00','07:56:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8847'), (SELECT station_id FROM station WHERE code='MSC'), 7, '08:07:00','08:10:00'),

    --LINE L11 (Marseille -> Port-de-Bouc)
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8850'), (SELECT station_id FROM station WHERE code='MSC'), 1, '14:07:00','14:10:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8850'), (SELECT station_id FROM station WHERE code='AREURM'), 2, '14:17:00','14:18:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8850'), (SELECT station_id FROM station WHERE code='ESTQ'), 3, '14:25:00','14:26:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8850'), (SELECT station_id FROM station WHERE code='NIOL'), 4, '14:36:00','14:38:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8850'), (SELECT station_id FROM station WHERE code='ENSURE'), 5, '14:46:00','14:47:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8850'), (SELECT station_id FROM station WHERE code='CARRRO'), 6, '14:57:00','14:58:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8850'), (SELECT station_id FROM station WHERE code='SAUSSLP'), 7, '15:07:00','15:10:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8850'), (SELECT station_id FROM station WHERE code='COURC'), 8, '15:14:00','15:14:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8850'), (SELECT station_id FROM station WHERE code='CRST'), 9, '15:24:00','15:25:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8850'), (SELECT station_id FROM station WHERE code='PORTDB'), 10, '15:36:00','15:40:00'),

    --LIGNE L12 (Port-de-Bouc -> Marseille)
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8853'), (SELECT station_id FROM station WHERE code='PORTDB'), 1, '14:07:00','14:10:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8853'), (SELECT station_id FROM station WHERE code='CRST'), 2, '14:17:00','14:18:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8853'), (SELECT station_id FROM station WHERE code='COURC'), 3, '14:25:00','14:26:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8853'), (SELECT station_id FROM station WHERE code='SAUSSLP'), 4, '14:36:00','14:38:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8853'), (SELECT station_id FROM station WHERE code='CARRRO'), 5, '14:46:00','14:47:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8853'), (SELECT station_id FROM station WHERE code='ENSURE'), 6, '14:57:00','14:58:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8853'), (SELECT station_id FROM station WHERE code='NIOL'), 7, '15:07:00','15:10:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8853'), (SELECT station_id FROM station WHERE code='ESTQ'), 8, '15:14:00','15:14:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8853'), (SELECT station_id FROM station WHERE code='AREURM'), 9, '15:24:00','15:25:00'),
    ((SELECT trip_id FROM train_trip WHERE trip_number='TRIP-8853'), (SELECT station_id FROM station WHERE code='MSC'), 10, '15:36:00','15:40:00');