Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F7A606A31D
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 03:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIr1Mi2P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE8010E1DE;
	Fri, 23 Oct 2026 03:27:30 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC0E10E1DE
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 03:27:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 26BEB60233;
 Fri, 23 Oct 2026 03:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF071F01825;
 Fri, 23 Oct 2026 03:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792726042;
 bh=to5hf4XDkeO1fyJMgyGawnUkYu9Pf7arJw767ohpOx4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ZIr1Mi2PO2vVCLPNKns5eRywR1abdviZShmGlj5pmHTPBOw09GJ2uMJtjvyrKVtEV
 x+7HQ+zR3v4iVa9gJQybV63YAzdr1FDHfBZRod+P2lJ4txpYS2ACDcMnsOZm5kODkX
 EQl6ihtYlPL/g1FwAm9cSXerFzK1jHVudISKFM+157PlGraABTJ0IeQI2S5khcQ2Tn
 7SwC2gktAvCarMyzfIBFuGe+W7+4R+RgiRac/10FkFJZ+gq3hDvR9o6Pyds6Q2kMzt
 pMGwJBaSb8VSwP6se4xWl0XT5nScR4NVum1PXRbl/5TTuCRwiOk4fxlmpIFfsvpQsh
 PF29HdPWi1nSA==
Message-ID: <sashiko-outbox-182267@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] drm/xe: Register drm device at the end of probe
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261023030446.337222-1-raag.jadav@intel.com>
References: <20261023030446.337222-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 03:27:22 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] drm/xe: drm_dev_unplug() before xe_display_unregister() causes=
 panel UAF
- [High] drm/xe: xe_oa_register() fails before drm_dev_register() adds mino=
r kdev
- [High] drm/xe: xe_debugfs_register() uses NULL debugfs_root before drm_de=
v_register()
- [High] drm/xe: xe_display_register() runs before drm_dev_register() in pr=
obe
- [High] drm/xe: drm_dev_unplug() runs on unregistered device in xe_pci_rem=
ove()
--

commit 59e43ed89ab7b80b15dcc4432f5bc6716fd8b83a
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe: Register drm device at the end of probe

This commit moves drm_dev_register() from xe_device_probe() to the end of
__xe_pci_probe() and moves drm_dev_unplug() from xe_device_remove() to the
beginning of xe_pci_remove().

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index e1979bbcf7bc6..ad25e9833283b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1049,10 +1049,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
> =20
> -	err =3D drm_dev_register(&xe->drm, 0);
> -	if (err)
> -		return err;
> -
>  	xe_display_register(xe);

[Severity: High]
With drm_dev_register() moved to the end of __xe_pci_probe(),
xe_display_register() in drivers/gpu/drm/xe/xe_device.c now runs before
drm_dev_register(). Can xe_display_register() safely execute before the DRM
device and its connectors are registered?

In drivers/gpu/drm/i915/display/intel_display_driver.c,
xe_display_register() -> intel_display_driver_register() calls both
intel_acpi_video_register() and intel_fbdev_setup():

    intel_opregion_register(display);
    intel_acpi_video_register(display);
    ...
    intel_fbdev_setup(display);

In drivers/gpu/drm/clients/drm_fbdev_client.c, intel_fbdev_setup() ->
drm_client_setup_with_color_mode() -> drm_fbdev_client_setup() checks
whether the DRM device has been registered:

    drm_WARN(dev, !dev->registered, "Device has not been registered.\n");

Because dev->registered is only set in drm_dev_register(), this triggers a
warning during probe and runs fbdev setup before drm_modeset_register_all()
has invoked the connector late_register callbacks (which initialize panels,
DP AUX, and LSPCON).

In addition, intel_acpi_video_register() in
drivers/gpu/drm/i915/display/intel_acpi.c checks whether a native backlight
device was registered:

    drm_for_each_connector_iter(connector, &conn_iter) {
        struct intel_panel *panel =3D &to_intel_connector(connector)->panel;

        if (panel->backlight.funcs && !panel->backlight.device) {
            acpi_video_register_backlight();
            break;
        }
    }

Because panel->backlight.device is only populated during
drm_dev_register() -> drm_modeset_register_all() ->
intel_connector_register() -> intel_panel_register(), running
intel_acpi_video_register() first finds panel->backlight.device =3D=3D NULL=
 and
registers acpi_video_register_backlight() even when a native panel backlight
is present.

Furthermore, later in xe_device_probe(), xe_ras_process_errors() can call
xe_device_declare_wedged() -> drm_dev_wedged_event() when boot-time RAS
errors are present, which fails with -EINVAL in kobject_uevent_env() on
&dev->primary->kdev->kobj before drm_dev_register() has added primary->kdev.

> =20
>  	err =3D xe_oa_register(xe);

[Severity: High]
Does xe_oa_register() fail with -ENOMEM during probe when called before
drm_dev_register()?

In drivers/gpu/drm/xe/xe_oa.c, xe_oa_register() creates a sysfs subdirectory
under xe->drm.primary->kdev->kobj:

    oa->metrics_kobj =3D kobject_create_and_add("metrics",
                                              &xe->drm.primary->kdev->kobj);
    if (!oa->metrics_kobj)
        return -ENOMEM;

During xe_device_create() -> drm_dev_init() -> drm_minor_alloc() ->
drm_sysfs_minor_alloc(), xe->drm.primary->kdev is only initialized with
device_initialize(), so primary->kdev->kobj.sd is NULL until
drm_dev_register() -> drm_minor_register() calls device_add(minor->kdev) in
drivers/gpu/drm/drm_drv.c.

When xe_oa_register() runs in xe_device_probe() prior to drm_dev_register(),
sysfs_create_dir_ns() sees a NULL parent kernfs_node and fails with -ENOENT,
causing kobject_create_and_add() to return NULL and aborting probe on any
OA-capable device.

[ ... ]

> @@ -1116,8 +1110,6 @@ void xe_device_remove(struct xe_device *xe)
>  {
>  	xe_display_unregister(xe);
> =20
> -	drm_dev_unplug(&xe->drm);
> -
>  	xe_bo_pci_dev_remove_all(xe);
>  }
> =20

[Severity: Critical]
By moving drm_dev_unplug(&xe->drm) out of xe_device_remove() to the start of
xe_pci_remove(), drm_dev_unplug() now runs before xe_display_unregister().
Does this cause a use-after-free on panel->base during display shutdown on
devices with an active eDP or DSI panel?

During drm_dev_register() -> drm_modeset_register_all(), eDP and DSI
connectors allocate panel->base using __devm_drm_panel_alloc() bound to
connector->base.kdev.

When xe_pci_remove() calls drm_dev_unplug() -> drm_dev_unregister() ->
drm_modeset_unregister_all() -> drm_connector_unregister(),
drm_sysfs_connector_remove() calls device_unregister(connector->kdev). That
releases devres on connector->kdev and frees the struct drm_panel while
panel->base remains non-NULL.

Subsequently, xe_pci_remove() calls xe_device_remove() ->
xe_display_unregister() -> intel_display_driver_unregister() in
drivers/gpu/drm/i915/display/intel_display_driver.c:

    drm_kms_helper_poll_fini(display->drm);

    intel_display_driver_disable_user_access(display);

    intel_audio_deinit(display);

    drm_atomic_helper_shutdown(display->drm);

When drm_atomic_helper_shutdown() disables an active eDP or DSI output,
intel_panel_unprepare() in drivers/gpu/drm/i915/display/intel_panel.c calls
drm_panel_unprepare(panel->base), which in drivers/gpu/drm/drm_panel.c
dereferences the freed panel and locks panel->follower_lock:

    if (!panel->prepared) {
        dev_warn(panel->dev, "Skipping unprepare of already unprepared pane=
l\n");
        return;
    }

    mutex_lock(&panel->follower_lock);

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 50e4920e8e08c..a549f05e150c9 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1113,6 +1113,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  {
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> =20
> +	drm_dev_unplug(&xe->drm);
> +
>  	if (IS_SRIOV_PF(xe))
>  		xe_pci_sriov_configure(pdev, 0);

[Severity: High]
What happens in xe_pci_remove() when the device was probed in Boot
Survivability mode, or when __xe_pci_probe() jumps to err_driver_cleanup
before drm_dev_register() succeeds?

In __xe_pci_probe() in drivers/gpu/drm/xe/xe_pci.c, if Boot Survivability
mode is enabled during xe_device_probe_early(), probe returns 0 early:

    err =3D xe_device_probe_early(xe);
    if (xe_survivability_mode_is_boot_enabled(xe))
        return 0;

At that point xe->drm has DRIVER_MODESET set by xe_device_create(), but
xe_display_probe(), drmm_mode_config_init(), and drm_dev_register() have not
been called.

Because drm_dev_unplug(&xe->drm) is placed before the
xe_survivability_mode_is_boot_enabled(xe) check in xe_pci_remove(), removing
the device calls drm_dev_unplug() -> drm_dev_unregister() ->
drm_modeset_unregister_all() -> drm_connector_unregister_all() ->
drm_connector_list_iter_next() in drivers/gpu/drm/drm_connector.c:

    spin_lock_irqsave(&config->connector_list_lock, flags);
    lhead =3D old_conn ? &old_conn->head : &config->connector_list;

    do {
        if (lhead->next =3D=3D &config->connector_list) {

This locks the uninitialized connector_list_lock spinlock and dereferences a
NULL connector_list.next pointer.

Similarly, if xe_pm_init() or drm_dev_register() fails at the end of
__xe_pci_probe(), jumping to err_driver_cleanup calls xe_pci_remove() ->
drm_dev_unplug(&xe->drm) on a drm_device that was never registered.

> @@ -1291,6 +1293,11 @@ static int __xe_pci_probe(struct pci_dev *pdev, co=
nst struct xe_device_desc *des
>  	if (err)
>  		goto err_driver_cleanup;
> =20
> +	/* Must be last */
> +	err =3D drm_dev_register(&xe->drm, 0);
> +	if (err)
> +		goto err_driver_cleanup;

[Severity: High]
When drm_dev_register() is deferred until after xe_device_probe(), what
happens to xe_debugfs_register(xe) inside xe_device_probe()?

In drivers/gpu/drm/xe/xe_debugfs.c, xe_debugfs_register() retrieves the
debugfs root from the primary minor:

    struct drm_minor *minor =3D xe->drm.primary;
    struct dentry *root =3D minor->debugfs_root;

However, minor->debugfs_root is only populated when drm_dev_register() ->
drm_minor_register() calls drm_debugfs_register() in
drivers/gpu/drm/drm_debugfs.c:

    minor->debugfs_root =3D dev->debugfs_root;

When xe_debugfs_register() executes in xe_device_probe() before
drm_dev_register(), minor->debugfs_root is still NULL:

1. In drivers/gpu/drm/xe/xe_gt_debugfs.c, xe_gt_debugfs_register() hits
   xe_gt_assert(gt, minor->debugfs_root) on every GT.
2. In drivers/gpu/drm/xe/xe_pxp_debugfs.c and drivers/gpu/drm/xe/xe_psmi.c,
   xe_pxp_debugfs_register() and xe_psmi_debugfs_register() check
   if (!minor->debugfs_root) and return early without registering their
   debugfs entries.
3. xe_debugfs_register() and xe_tile_debugfs_register() pass root (NULL) as
   the parent dentry to debugfs_create_file(), debugfs_create_dir(),
   drm_debugfs_create_files(), and ttm_resource_manager_create_debugfs(),
   creating the driver's debugfs entries in the top-level /sys/kernel/debug/
   directory where they are not cleaned up on device unbind and retain
   dangling pointers to freed driver structures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023030446.3372=
22-1-raag.jadav@intel.com?part=3D1
