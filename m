Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18466606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4h1VM7g
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C488910E37B;
	Tue,  3 Nov 2026 06:33:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FC010E37B
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:33:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 55DB760008;
 Tue,  3 Nov 2026 06:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FC61F000C1;
 Tue,  3 Nov 2026 06:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793687631;
 bh=VksAEjuo/1phb3Hb00AVUdj/9NDzffwqQ5eAFj/kpa0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=I4h1VM7gwyNzqc/kOnuzgSliw5glyapeWI9Xn2U/JDN5vm+x/DwFEkP95takT7j9f
 kI12xvovKM8bG0SpSgstFUsw9mvtFvjxRefexxVJ2F/2GtDVBSNW6jbjsA/IDwzjVg
 jCwrYAjR8WgT6BhppH8xu3Nj5MBDkIOpQcSU7yDgk5kG27jiTyTy1+Yg4kUQ0ogZZy
 rXK5/DFxy1WCexTN52WrdgE7uxKIxUtKp2mIiVcqd7FDl45cf0EyeUg5MgG8/cDzw+
 TXpTgXAIGL6SHZpqkEuCEhss3NOEMQLe/VyuU4Xzn+VfRwWLJR+EdF/UxRtEC5aUeU
 XlSxtwGpFsoVA==
Message-ID: <sashiko-outbox-194641@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] drm/xe: Add support for wa_14028434957
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261103060929.1586783-15-riana.tauro@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
 <20261103060929.1586783-15-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:33:50 +0000
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] drm/xe: ignored recovery action in hw_error_work() and premature D=
B_ECC wedge
- [High] drm/xe: race between hw_error_work() and xe_pci_error_detected() o=
n AER
- [High] drm/xe: use-after-free of hw_error_work on xe_device_probe() failu=
re
- [Medium] drm/xe: hw_error_work not disabled during non-internal AER recov=
ery and reset
--

commit 63f8e0a3987b6eb426b195e4d8f9b906ad24b22d
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe: Add support for wa_14028434957

This commit adds support for wa_14028434957 on Crescent Island to process
non-fatal hardware errors routed via direct IRQ and uncorrectable internal
errors reported via PCIe AER.

> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_=
error.c
> index aaa2437d40bfe..8f2fb641f6ce2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
[ ... ]
> @@ -433,12 +456,12 @@ static void hw_error_source_handler(struct xe_tile =
*tile, const enum hardware_er
>  		return;
> =20
>  	/*
> -	 * Hardware errors are reported through System Controller on the platfo=
rms that
> -	 * support it, and never routed as direct IRQ to SGUnit. So we should n=
ever be
> -	 * here for those platforms.
> +	 * Non-fatal errors are routed as a direct IRQ on platforms that support
> +	 * system controller.
>  	 */
>  	if (xe->info.has_sysctrl) {
> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
> +		drm_err_ratelimited(&xe->drm, HW_ERR "Non-fatal %s reported\n", severi=
ty_str);
> +		schedule_work(&tile->hw_error_work);
>  		return;
>  	}

[Severity: High]
Can scheduling tile->hw_error_work here cause a use-after-free of struct
xe_device if xe_device_probe() fails later during initialization?

During probe, __xe_pci_probe() -> xe_device_probe() -> xe_irq_install() ->
xe_hw_error_init() initializes tile->hw_error_work and calls
process_hw_errors(), which invokes xe_hw_error_irq_handler() ->
hw_error_source_handler(). Hardware error interrupts can also fire once
xe_irq_postinstall() enables interrupts.

If a subsequent step in xe_device_probe() fails (such as xe_gt_init(),
xe_vram_memtest(), xe_heci_gsc_init(), or drm_dev_register()),
__xe_pci_probe() returns the error directly without calling
xe_device_remove():

drivers/gpu/drm/xe/xe_pci.c:__xe_pci_probe() {
	...
	err =3D xe_device_probe(xe);
	if (err)
		return err;
	...
}

Because xe_hw_error_work_disable() is only called in xe_device_remove() and=
 is
not registered via devm_add_action_or_reset() in xe_hw_error_init(), devres
teardown will run ras_fini(), unmap MMIO, and free struct xe_device while
tile->hw_error_work is still queued or running hw_error_work() ->
xe_ras_process_errors(xe).

Should xe_hw_error_init() register a devm action to disable hw_error_work on
probe failure?

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index 4ade392b47bef..c27fd22e28ac7 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
[ ... ]
> @@ -90,8 +94,14 @@ static pci_ers_result_t xe_pci_error_detected(struct p=
ci_dev *pdev, pci_channel_
>  	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
>  		return PCI_ERS_RESULT_DISCONNECT;
> =20
> -	if (is_aer_internal_error(pdev))
> +	/*
> +	 * If non-fatal error processing is in progress when uncorrectable inte=
rnal error occurs,
> +	 * flush and disable the worker to prevent further processing, as a res=
et is imminent.
> +	 */
> +	if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
>  		xe_ras_set_aer_internal_error(xe);
> +		xe_hw_error_work_disable(xe);
> +	}

[Severity: High]
What happens if hw_error_work() is already past the
xe_ras_is_aer_internal_error(xe) check when xe_pci_error_detected() runs?

In drivers/gpu/drm/xe/xe_hw_error.c:hw_error_work():

	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
		if (xe_ras_is_aer_internal_error(xe))
			return;

		xe_ras_process_errors(xe);
		return;
	}

If hw_error_work() passes xe_ras_is_aer_internal_error(xe) just before
xe_pci_error_detected() sets aer_internal_error and calls
xe_hw_error_work_disable(xe), disable_work_sync() waits for the in-progress
hw_error_work() to finish running xe_ras_process_errors(xe).

During that call, hw_error_work() drains all pending error records from the
shared System Controller firmware queue (including fatal CSC firmware errors
that enable Runtime Survivability Mode and wedge with
DRM_WEDGE_RECOVERY_VENDOR, or Punit errors that wedge with
DRM_WEDGE_RECOVERY_COLD_RESET) and discards the recovery action returned by
xe_ras_process_errors(xe).

When xe_hw_error_work_disable(xe) returns in xe_pci_error_detected(),
xe_wedged(xe) is not re-checked, so xe_pci_error_detected() returns
PCI_ERS_RESULT_CAN_RECOVER. Then xe_pci_error_mmio_enabled() calls
xe_ras_process_errors(xe) a second time on the now-empty firmware queue, ge=
ts
 the default XE_RAS_RECOVERY_ACTION_RESET (instead of
XE_RAS_RECOVERY_ACTION_DISCONNECT), and triggers a Secondary Bus Reset and
re-probe that tears down Runtime Survivability Mode sysfs and clears
xe->wedged.flag in xe_pci_error_resume().

Conversely, if hw_error_work() wedges the device on a double-bit ECC error =
via
xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET) just before
xe_pci_error_detected() checks xe_wedged(xe), xe_pci_error_detected() retur=
ns
PCI_ERS_RESULT_DISCONNECT without flushing hw_error_work() or requesting the
bus reset.

[Severity: Medium]
As reported by Sashiko on v2 [1], can tile->hw_error_work also race with PC=
Ie
AER recovery and device reset when is_aer_internal_error(pdev) is false?

In xe_pci_error_detected(), xe_hw_error_work_disable(xe) is only called when
XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev) is true.

If a non-fatal PCIe AER error occurs without PCI_ERR_UNC_INTN set on the
Upstream Switch Port (state =3D=3D pci_channel_io_normal),
xe_pci_error_mmio_enabled() runs xe_ras_process_errors(xe) while
tile->hw_error_work may still be running xe_ras_process_errors(xe)
concurrently.

Similarly, when prepare_device_for_reset() runs (either for
pci_channel_io_frozen or when ras_action_to_pci_result() requests a reset),=
 it
flushes gt->wedge.worker and calls pci_disable_device(pdev) without calling
xe_hw_error_work_disable(xe):

drivers/gpu/drm/xe/xe_pci_error.c:prepare_device_for_reset() {
	...
	for_each_gt(gt, xe, id) {
		xe_gt_wedge_declare(gt);
		flush_work(&gt->wedge.worker);
	}

	pci_disable_device(pdev);
}

If hw_error_work() already passed its initial xe_wedged(xe) check before
prepare_device_for_reset() set xe->wedged.flag, could it continue issuing
System Controller MMIO mailbox commands and page offlining while the PCI
device is disabled and undergoing Secondary Bus Reset?

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 58a0b5fa676d3..1809c3c893dee 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -671,8 +674,15 @@ static u8 handle_device_memory_errors(struct xe_devi=
ce *xe, struct xe_ras_error_
>  			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>  			    "Double-bit ECC error detected at sw address 0x%llx\n",
>  			    info->sw_address);
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
>  		break;

[Severity: High]
As reported by Andi Shyti on v2 [2], hw_error_work() ignores the recovery
action returned by xe_ras_process_errors(xe), while handle_device_memory_er=
rors()
wedges the device directly for XE_RAS_MEMORY_DB_ECC. Does placing
xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET) inside
handle_device_memory_errors() instead of handling the returned recovery act=
ion
in hw_error_work() cause regressions across the callers of
xe_ras_process_errors(xe)?

First, in drivers/gpu/drm/xe/xe_hw_error.c:hw_error_work():

	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
		if (xe_ras_is_aer_internal_error(xe))
			return;

		xe_ras_process_errors(xe);
		return;
	}

Because the return value of xe_ras_process_errors(xe) is ignored here, any
other error path in xe_ras_process_errors(xe) that returns
XE_RAS_RECOVERY_ACTION_RESET (such as sysctrl mailbox failures or response
flooding jumping to err:, unknown memory error categories hitting default: =
in
handle_device_memory_errors(), GLOBAL_UNCORR_ERROR in
handle_core_compute_errors(), non-CSC/non-Punit SoC internal errors in
handle_soc_internal_errors(), or unknown RAS components) neither wedges nor
resets the device on the direct IRQ path.

Second, xe_ras_process_errors() loops over all errors in response.arr[] to
compute the highest severity action:

	/* Process and log all errors and then trigger highest recovery action */
	if (action > final_action)
		final_action =3D action;

Because xe_wedge_declare() latches xe->wedged.flag on the first call, calli=
ng
xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET) immediately on a
XE_RAS_MEMORY_DB_ECC error prevents a subsequent higher-severity
XE_RAS_RECOVERY_ACTION_DISCONNECT error in the same batch (such as a Punit
error wedging with DRM_WEDGE_RECOVERY_COLD_RESET in punit_error_handler(), =
or
a CSC firmware error wedging with DRM_WEDGE_RECOVERY_VENDOR in
xe_survivability_mode_runtime_enable()) from recording its recovery method =
and
sending its uevent.

Third, xe_ras_init() calls xe_ras_process_errors(xe) during xe_device_probe=
()
(with aer_internal_error =3D=3D false) before xe_gt_init() and before
drm_dev_register(). Even if page offlining is skipped when aer_internal_err=
or
is true, a boot-time or warm-reset-retained XE_RAS_MEMORY_DB_ECC error duri=
ng
xe_ras_init() that fails handle_page_offline() will call
xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET) before drm_dev_register(=
),
setting xe->wedged.flag =3D 1 and causing GuC CT communication in xe_gt_ini=
t()
to fail with -ENOTRECOVERABLE.

Finally, if handle_device_memory_errors() is reached from
xe_pci_error_mmio_enabled() during PCIe AER recovery,
ras_action_to_pci_result() -> prepare_device_for_reset() intentionally sets
xe->wedged.flag without sending a wedged uevent or setting
xe->needs_flr_on_fini because the PCIe AER core performs the slot reset.
Calling xe_wedge_declare() inside handle_device_memory_errors() sends an
unintended WEDGED=3Dbus-reset uevent and sets xe->needs_flr_on_fini =3D tru=
e.

Should handle_device_memory_errors() simply return
XE_RAS_RECOVERY_ACTION_RESET and let hw_error_work() check the final_action
returned by xe_ras_process_errors(xe) and call
xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET) when final_action =3D=3D
XE_RAS_RECOVERY_ACTION_RESET?

[1] https://lore.kernel.org/r/20261026060459.771448-15-riana.tauro@intel.com
[2] https://lore.kernel.org/r/auIedl6plynJE3ML@zenone.zhora.eu

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103060929.1586=
783-9-riana.tauro@intel.com?part=3D6
