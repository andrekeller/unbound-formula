unbound:
  pkg.installed:
    - pkgs:
      - unbound
  service.running:
    - name: unbound.service
    - enable: True

unbound_conf:
  file.managed:
    - name: /etc/unbound/unbound.conf
    - source: salt://unbound/files/unbound.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - watch_in:
      - service: unbound
