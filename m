Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5F3C5DF6D
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 11:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B5510E53C;
	Wed, 19 Aug 2026 11:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E8YiMc7n";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F7510EE0A
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 11:49:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E3BDE60A58;
 Wed, 19 Aug 2026 11:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF251F00A3F;
 Wed, 19 Aug 2026 11:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787140160;
 bh=3k++d9/vYnmEKywoCxdq7W30Lt563QQA1VN6oBk0qO4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=E8YiMc7nQTnFRgo/I3SdLgi0qh5VbcUmBG350DSBhVRgZ3CdA6YzOfSnHkrwhumoD
 cFUxiKnrSORcOg83/nMmC0sYw/rVEsLjMqIqi8GIMvLu0h5WH19s8z9lwWfnpdL67q
 nTKYjuvSC/m7wWKVcxPM7tBBBUvh/dfomasIq86O+n41WzV/ZN6tJ7wBMlZCTEn6ot
 ajI29AhChFNwTiSf/z9C8o16ht+0g5WSkCo1kG6MmNSRffUmLrhYBiJsCdBT1R9Hth
 xe5cIr4IZ8APDTngevU7/1MeMhgj/bdwp4R3qgxH7X7YOfJUfIOGcKc+Kql3t1+2j5
 Ahl+LwtLkd25g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/xe/pci_error: Allow debugging PCI errors
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260819113519.510853-1-raag.jadav@intel.com>
References: <20260819113519.510853-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 11:49:20 +0000
Message-Id: <20260819114920.7BF251F00A3F@smtp.kernel.org>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The device is unconditionally wedged and disconnected for fully re=
coverable, non-fatal errors when XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is s=
et.
- [Medium] The patch fails to prevent bus resets for fatal PCI errors, cont=
radicting the commit message.

Pre-existing issues:
- [Medium] Missing idempotency check before wedging execution queues leads =
to reference leaks.
--

--- Patch [1]: [PATCH v3] drm/xe/pci_error: Allow debugging PCI errors ---
commit 6e197279f5660d6825fd4f15d304684b9f2531ca
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/pci_error: Allow debugging PCI errors

Update PCI error handling path to disconnect the device when
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is set. This prevents bus
reset and preserves the device state so that it is available to
the user for debugging.

> Update PCI error handling path to disconnect the device when
> XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is set. This prevents bus
> reset and preserves the device state so that it is available to
> the user for debugging.

[Severity: Medium]
Will fatal PCIe errors still trigger a reset and destroy the hardware state?

In xe_pci_error_detected() for pci_channel_io_frozen, it unconditionally=20
returns PCI_ERS_RESULT_NEED_RESET:

drivers/gpu/drm/xe/xe_pci_error.c:xe_pci_error_detected() {
...
	case pci_channel_io_frozen:
		prepare_device_for_reset(pdev);
		return PCI_ERS_RESULT_NEED_RESET;
...
}

Since this path bypasses xe_pci_error_mmio_enabled() entirely, does the new=
=20
debug feature fail to prevent bus resets for fatal errors?

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index e41af2ac7f23b..98aa26275ad66 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -83,6 +83,12 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(stru=
ct pci_dev *pdev)
>  	xe_info(xe, "PCI error: MMIO enabled\n");
>  	action =3D xe_ras_process_errors(xe);
> =20
> +	/* User wants to debug the error, prevent reset */
> +	if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		xe_device_declare_wedged(xe);

[Severity: Medium]
This is a pre-existing issue, but does calling xe_device_declare_wedged()
multiple times leak references?

xe_device_declare_wedged() invokes xe_gt_declare_wedged() unconditionally
outside its atomic block:

drivers/gpu/drm/xe/xe_device.c:xe_device_declare_wedged() {
...
	for_each_gt(gt, xe, id)
		xe_gt_declare_wedged(gt);
...
}

This calls down to xe_guc_submit_wedge():

drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_wedge() {
...
		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
			if (xe_exec_queue_get_unless_zero(q))
				set_exec_queue_wedged(q);
...
}

This iterates over exec_queue_lookup and unconditionally takes an extra
reference on each queue every time it's called, without checking if the que=
ue
was already wedged. Since guc_submit_fini() drops only one reference per
wedged queue, does this leak exec_queue objects if xe_device_declare_wedged=
()
is called sequentially?

> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}

[Severity: High]
Does this unconditionally wedge the device and force a PCI disconnect even
for fully recoverable errors?

If a correctable error occurs, xe_ras_process_errors() will return=20
XE_RAS_RECOVERY_ACTION_RECOVERED.

Because we check xe->wedged.mode here without verifying if the action retur=
ned
by xe_ras_process_errors() actually required a reset, will we ignore the fa=
ct
that no reset was going to happen and unnecessarily break device availabili=
ty
for benign hardware events?

> +
>  	return ras_action_to_pci_result(pdev, action);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819113519.5108=
53-1-raag.jadav@intel.com?part=3D1
