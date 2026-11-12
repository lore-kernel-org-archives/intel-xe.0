Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA15606A323
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZQ82RnYf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878BE10E53E;
	Thu, 12 Nov 2026 06:39:36 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA3010E564
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 06:39:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9C196601E2;
 Thu, 12 Nov 2026 06:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284531F00A05;
 Thu, 12 Nov 2026 06:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794465568;
 bh=C3JaXM8dzOp4SlS/QXUdYhHmu1OwsqloCz5Sdd2aI6o=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ZQ82RnYfAtTSWucNoXBB9EOn6XHLML47sS7rJbHZpa7z6tGrMjjBwUvIXdQpJ7Y/o
 LMCRfh92YdxVqe8lMLumabreAPMgA6obozykTo1shJGpNOQFefBgurpwbiXPo7YHAe
 zIg8HhzUUrDxAkg5eoq3EDU0pfcOY6fCcmtkrZ73CGNjvq9RStf4edwSBQ9yXupell
 EkYlD1DWa2VgZcAyAkOghSBlpISsyOn2QU7BXj2jlMj1I5k5ge34B1xdNkJEVp/He+
 Jfamz+1pXNsIYpnkpQgSoy4N/a1SD4Kwy2YzMDUzD4u5JZqc/YmImaNuNYIaoHbaDm
 h1mAIhwF7L/OQ==
Message-ID: <sashiko-outbox-210530@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/8] drm/xe: Add support for wa_14028434957
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261112060701.3327125-17-riana.tauro@intel.com>
References: <20261112060701.3327125-10-riana.tauro@intel.com>
 <20261112060701.3327125-17-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 06:39:27 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/xe: ignored recovery action in hw_error_work() and
  premature DB_ECC wedge
- [Medium] drm/xe: missing xe_hw_error_work_disable() on non-internal
  AER and reset paths
--

commit 642c34207e3b3ac616a8a696d5bf4aa3f70787c9
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe: Add support for wa_14028434957

This commit adds support for wa_14028434957 on CRI, routing non-fatal
hardware errors through a direct IRQ worker to xe_ras_process_errors()
and requesting a bus reset on uncorrectable internal errors reported via
AER.

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index 472b85d0ccc34..67920751ecf14 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
[ ... ]
> @@ -87,12 +91,21 @@ static pci_ers_result_t xe_pci_error_detected(struct =
pci_dev *pdev, pci_channel_
>  	if (state =3D=3D pci_channel_io_perm_failure)
>  		return PCI_ERS_RESULT_DISCONNECT;
> =20
> -	/* If the device is already wedged or in survivability mode, do not att=
empt recovery */
> -	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
> +	/* If the device is already in survivability mode, do not attempt recov=
ery */
> +	if (xe_survivability_mode_is_boot_enabled(xe))
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

[Severity: Medium]
Can hw_error_work() race with PCIe AER handling when an AER error does not
have PCI_ERR_UNC_INTN set on the upstream port?

xe_pci_error_detected() only calls xe_hw_error_work_disable() when
is_aer_internal_error() is true, and prepare_device_for_reset() does not
disable or flush tile->hw_error_work either:

CPU0                              CPU1 (kworker)
xe_pci_error_detected()
  is_aer_internal_error() =3D=3D false
                                  hw_error_work()
                                    xe_ras_process_errors()
xe_pci_error_mmio_enabled()
  xe_ras_process_errors()
                                      xe_wedge_declare()
                                        xe_pm_runtime_get_noresume()
                                        xe_gt_wedge_declare()
xe_pci_error_resume()
  atomic_set(&xe->wedged.flag, 0) <-- clears wedged flag, GTs stay wedged

Both contexts concurrently drain XE_SYSCTRL_CMD_GET_SOC_ERROR records from
firmware, and xe_pci_error_resume() clears xe->wedged.flag while leaving
the GTs wedged and leaking the runtime PM reference that xe_wedge_fini()
only drops when wedged.flag is set.  On the pci_channel_io_frozen or
XE_RAS_RECOVERY_ACTION_RESET paths, hw_error_work() can also continue
issuing System Controller MMIO mailbox commands across
pci_disable_device() and Secondary Bus Reset if it already passed the
initial xe_wedged() check.

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
As reported by Andi Shyti on v2 [1], should hw_error_work() handle the
XE_RAS_RECOVERY_ACTION_RESET return value from xe_ras_process_errors()
instead of calling xe_wedge_declare() inside handle_device_memory_errors()?

Because hw_error_work() discards the return value of
xe_ras_process_errors(), any other path returning
XE_RAS_RECOVERY_ACTION_RESET (such as sysctrl mailbox failures, response
flooding, unknown memory error categories, or GLOBAL_UNCORR_ERROR) neither
wedges nor resets the device on the direct IRQ path.

Conversely, calling xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET)
directly in handle_device_memory_errors() affects all callers of
xe_ras_process_errors():

- During probe, xe_device_probe() -> xe_ras_init() ->
  xe_ras_process_errors() runs before xe_gt_init() and drm_dev_register(),
  so a boot-time XE_RAS_MEMORY_DB_ECC that fails handle_page_offline()
  sets xe->wedged.flag =3D 1, schedules drm_dev_wedged_event() before the D=
RM
  device is registered, and causes GuC CT sends in xe_gt_init() to fail
  with -ENOTRECOVERABLE.
- When multiple errors are returned in a batch, xe_wedge_declare() latches
  xe->wedged.flag on the first call, preventing a later
  XE_RAS_RECOVERY_ACTION_DISCONNECT error (such as Punit cold-reset or CSC
  runtime survivability) from recording its higher-severity recovery
  method.
- Even with follow-up commit "drm/xe/xe_ras: Skip double-bit ECC page
  offlining on AER path", if hw_error_work() is already in
  handle_page_offline() when xe_pci_error_detected() sets
  aer_internal_error and waits in xe_hw_error_work_disable(),
  handle_device_memory_errors() wedges the device so
  xe_pci_error_detected() sees xe_wedged(xe) and returns
  PCI_ERS_RESULT_DISCONNECT instead of performing the Secondary Bus Reset.

[1] https://lore.kernel.org/r/auIedl6plynJE3ML@zenone.zhora.eu

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112060701.3327=
125-10-riana.tauro@intel.com?part=3D7
