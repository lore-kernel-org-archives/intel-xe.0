Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BAD606A325
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLPO07Aq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C4810E14C;
	Mon, 26 Oct 2026 10:09:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E777610ED96
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 10:09:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B91BA432D0;
 Mon, 26 Oct 2026 10:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813421F01280;
 Mon, 26 Oct 2026 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793009376;
 bh=gX6Gj2BJW/r/XB/MBTadEsRnGOmEB9k35lyC637POog=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=kLPO07Aq8vAwrWVB0U1oR/xb1Otu8FU+XD0jywgXPYT0Q14jsFp+Xfw9JnI3yblaJ
 cBSYtRDn0aHDRvwdjikQOX3pDF29SCYOZ2hVj+mz6mn3sqoDvDE68abcj8tsB42UZN
 hkQ6H+hxnKs34anSOmHRL3AN0zWAsEejHIq3myDNfBRSp/eqAbnNkcAnzEGYOLmSC4
 1KW7AtNhwAAr4JZY6Wpx56Pv3knynfXAXKYqqvoC3PWl79zq1ejlE0ygKYRbcaJ4ME
 1X7bQIQzs5WjloMYAi4BlR2C3UwXGQed741l0kBe86bENTlamR+PaNQTRHZqpu4NRE
 LNCVIXu65u0Jg==
Message-ID: <sashiko-outbox-184890@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors
 routed via direct IRQ
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261026060459.771448-15-riana.tauro@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-15-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 10:09:36 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/xe: ignored recovery action in hw_error_work() and premature D=
B_ECC wedge
- [High] drm/xe: race between hw_error_work() and PCIe AER reset and remova=
l paths
--

commit 599d1ef3076a9398588bb132729ba7fcc7f8f463
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_hw_error: Handle non-fatal errors routed via direct IRQ

This patch schedules hw_error_work() when non-fatal hardware errors are
routed via direct IRQ on platforms with a system controller, invokes
xe_ras_process_errors() from the worker, and declares the device wedged
with a bus reset if double-bit ECC page offlining fails.

> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_=
error.c
> index f7799c3c08aac..269ce6a19a80b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c

[ ... ]

> @@ -166,12 +170,36 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_=
err_reg) =3D=3D XE_RAS_REG_SIZE);

[ ... ]

>  static void hw_error_work(struct work_struct *work)
>  {
>  	struct xe_tile *tile =3D container_of(work, typeof(*tile), hw_error_wor=
k.work);
>  	struct xe_device *xe =3D tile_to_xe(tile);
> =20
>  	guard(xe_pm_runtime)(xe);
> +
> +	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
> +		/* If the device is in reset in AER path, skip processing hardware err=
ors */
> +		if (xe_device_is_in_reset(xe))
> +			return;

[Severity: High]
Can hw_error_work() race with the PCIe AER reset and removal paths here?

In hw_error_source_handler(), a non-fatal hardware error IRQ schedules
tile->hw_error_work with a 1-second delay, and hw_error_work() checks
xe_device_is_in_reset(xe) without synchronization before calling
xe_ras_process_errors(xe).

Although the later commit "drm/xe/xe_ras: Disable hw error worker when AER
handling is in progress" calls xe_hw_error_work_disable(xe) in
xe_pci_error_detected(), that call is gated on:

    if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev))

which only checks PCI_ERR_UNC_INTN on the upstream switch port, and is
also skipped if xe_wedged(xe) is already true.

When an AER event occurs without PCI_ERR_UNC_INTN set on the upstream
switch port (such as a fatal link or protocol error with
state =3D=3D pci_channel_io_frozen, or a non-fatal error where
xe_pci_error_mmio_enabled() runs xe_ras_process_errors(xe) and triggers
XE_RAS_RECOVERY_ACTION_RESET), xe_hw_error_work_disable(xe) is not called:

1. In drivers/gpu/drm/xe/xe_pci_error.c:prepare_device_for_reset():

    xe_device_set_in_reset(xe);

    for_each_gt(gt, xe, id) {
        xe_gt_wedge_declare(gt);
        flush_work(&gt->wedge.worker);
    }

    pci_disable_device(pdev);

If hw_error_work() passes the xe_device_is_in_reset(xe) check just before
xe_device_set_in_reset(xe) is called, xe_ras_process_errors(xe) can run
system controller MMIO mailbox transactions and TTM VRAM page offlining
concurrently with pci_disable_device(pdev) and secondary bus reset.

2. In drivers/gpu/drm/xe/xe_pci_error.c:xe_pci_error_slot_reset():

    xe_device_clear_in_reset(xe);
    pdev->driver->remove(pdev);
    devres_release_group(&pdev->dev, xe->devres_group);

Because xe_device_clear_in_reset(xe) clears xe->in_reset before
pdev->driver->remove(pdev) and devres_release_group() run, if the delayed
tile->hw_error_work fires in this window, xe_device_is_in_reset(xe) will
return false and xe_ras_process_errors(xe) will execute concurrently with
driver teardown.

Should prepare_device_for_reset() also cancel or flush tile->hw_error_work,
and should in_reset remain set across removal in xe_pci_error_slot_reset()?

> +
> +		xe_ras_process_errors(xe);
> +		return;
> +	}
> +
>  	xe_survivability_mode_runtime_enable(xe);
>  }

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index db3cbc186a514..e6a0ee468b17b 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -628,8 +628,15 @@ static u8 handle_device_memory_errors(struct xe_devi=
ce *xe, struct xe_ras_error_
>  		break;
>  	case XE_RAS_MEMORY_DB_ECC:
>  		ret =3D handle_page_offline(xe, info->sw_address, true);
> -		if (ret)
> +		/*
> +		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
> +		 * Wedge the device with a bus reset for errors that require SBR to re=
cover.
> +		 * TODO: Trigger SBR using pci_reset_bus
> +		 */
> +		if (ret) {
> +			xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
>  			return XE_RAS_RECOVERY_ACTION_RESET;
> +		}

[Severity: High]
Should theDRM_WEDGE_RECOVERY_BUS_RESET wedging be performed by the caller
based on the enum xe_ras_recovery_action return value of
xe_ras_process_errors(xe) in hw_error_work(), rather than directly inside
handle_device_memory_errors()?

Right now, hw_error_work() in drivers/gpu/drm/xe/xe_hw_error.c calls
xe_ras_process_errors(xe) and ignores its return value. Any error processed
on the direct IRQ path that returns XE_RAS_RECOVERY_ACTION_RESET outside of
XE_RAS_MEMORY_DB_ECC (such as GLOBAL_UNCORR_ERROR in
handle_core_compute_errors(), non-CSC/non-Punit errors in
handle_soc_internal_errors(), other device memory error categories, unknown
RAS components, or a sysctrl mailbox failure/flood jumping to err:) will
not trigger any reset or wedge recovery action.

Conversely, calling xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET)
directly inside handle_device_memory_errors() affects all callers of
xe_ras_process_errors(xe):

1. Multi-error severity aggregation in xe_ras_process_errors():

    /* Process and log all errors and then trigger highest recovery action =
*/
    if (action > final_action)
        final_action =3D action;

Because xe_wedge_declare() is one-shot via atomic_xchg(&xe->wedged.flag, 1),
if a XE_RAS_MEMORY_DB_ECC entry with a failing handle_page_offline() is
processed before a higher-severity XE_RAS_RECOVERY_ACTION_DISCONNECT entry
in the batch (such as a Punit error requiring DRM_WEDGE_RECOVERY_COLD_RESET
in punit_error_handler() or a CSC firmware error requiring
DRM_WEDGE_RECOVERY_VENDOR in xe_survivability_mode_runtime_enable()),
xe->wedged.method is latched to DRM_WEDGE_RECOVERY_BUS_RESET and the
higher-severity recovery method is masked.

2. Driver probe path via xe_device_probe() -> xe_ras_init() ->
xe_ras_process_errors(xe):
This runs before xe_gt_init() and drm_dev_register() to log boot-time
errors. If a boot-time XE_RAS_MEMORY_DB_ECC error fails
handle_page_offline() (for example with -EIO on a critical BO/stolen page,
-ENOMEM, or -ENOSPC), handle_device_memory_errors() calls
xe_wedge_declare(), scheduling drm_dev_wedged_event() before
drm_dev_register() and setting xe->wedged.flag, which causes
__guc_ct_send_locked() in xe_gt_init() to fail with -ENOTRECOVERABLE and
aborts probe.

3. PCIe AER path in xe_pci_error_mmio_enabled():
In the AER path, XE_RAS_RECOVERY_ACTION_RESET is handled by
ras_action_to_pci_result() -> prepare_device_for_reset(), which sets
wedged.flag without sending a wedged uevent or setting needs_flr_on_fini
because AER performs an automatic slot reset. Although the later commit
"drm/xe/ras: Skip double-bit ECC page offlining on AER path" skips DB_ECC
when ras->aer_path is set for WA 14028434957 internal errors, ras->aer_path
remains false on non-internal AER errors and on platforms without
WA 14028434957, where calling xe_wedge_declare() emits an unintended
WEDGED=3Dbus-reset uevent and sets xe->needs_flr_on_fini =3D true.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026060459.7714=
48-11-riana.tauro@intel.com?part=3D4
