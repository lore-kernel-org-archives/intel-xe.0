Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02ED606A320
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8eMXMNd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F32510E593;
	Wed, 28 Oct 2026 07:40:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5804610E593
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 07:40:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 68ADC600C8;
 Wed, 28 Oct 2026 07:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E667C1F01825;
 Wed, 28 Oct 2026 07:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793173206;
 bh=k25o5kp5wgzjKEYBl7sfsaqqDUIxQeGAcsrPNUPWAbk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=k8eMXMNdwuM1R0phCVOHYRjeloKTzdUcX0yYJ+ASpTJ/0n3BnJnd+u/PQHP/yQSTq
 EfH54Bxw0gLuwPGjxKPyOxL/wMOeLbnvLHbnvTDAR36HRB+9inRjMU0N2an63sZZVp
 0Qdlw+Cj6OqRiHN2OyeDUHlVlbKhFWWSR5mNtbSISTJBs02Wzn6pZPBCjXadAmf82S
 0Pm6sm3rT8q6cEHsxi5Kc0+VxTEknjbPuEuZriBaQLdTMf6FBHG2JBgD3HV43wbyEY
 EXchfNM5L1hyxrwIufTmUOvuq8gtBSGX1YnS48i4lSgiS/zsq//VEhsk/Q71McLlsu
 1jQlJJ/wAWz7Q==
Message-ID: <sashiko-outbox-187590@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe/xe_pci_error: Wait for pcode init post SBR
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261028072803.937955-2-riana.tauro@intel.com>
References: <20261028072803.937955-2-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 07:40:05 +0000
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
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: xe_wedge_declare() skipped in xe_pci_error_slot_reset()
--

commit d17c5826371a0496850ef94bd4ecf05d8bbcfe46
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_pci_error: Wait for pcode init post SBR

This patch waits for Pcode initialization to complete after a Secondary Bus
Reset (SBR) in xe_pci_error_slot_reset() and enters runtime survivability
mode if initialization fails.

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index 9bf0da3a3d152..0675b5a8f6437 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c

[ ... ]

> @@ -112,6 +113,12 @@ static pci_ers_result_t xe_pci_error_slot_reset(stru=
ct pci_dev *pdev)
>  		return PCI_ERS_RESULT_DISCONNECT;
>  	}
> =20
> +	err =3D xe_pcode_ready(xe, true);
> +	if (err) {
> +		xe_survivability_mode_runtime_enable(xe);
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}

[Severity: Medium]
Prior to xe_pci_error_slot_reset() running, prepare_device_for_reset() is
called during PCIe error detection to block userspace access while the reset
is in progress:

drivers/gpu/drm/xe/xe_pci_error.c:prepare_device_for_reset() {
	...
	if (!atomic_xchg(&xe->wedged.flag, 1))
		xe_pm_runtime_get_noresume(xe);
	...
}

When xe_pcode_ready() fails in xe_pci_error_slot_reset(), the driver has not
yet re-probed the device, so xe_survivability_mode_runtime_enable() is call=
ed
on the existing xe_device instance where xe->wedged.flag is still 1:

xe_pci_error_slot_reset()
  -> xe_survivability_mode_runtime_enable()
       -> xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_VENDOR)

Because xe->wedged.flag is already set, xe_wedge_declare() returns early:

drivers/gpu/drm/xe/xe_wedge.c:xe_wedge_declare() {
	...
	if (atomic_xchg(&xe->wedged.flag, 1))
		return;

	xe->needs_flr_on_fini =3D true;
	xe_pm_runtime_get_noresume(xe);
	...
	if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
		xe->wedged.method =3D DRM_WEDGE_RECOVERY_NONE;
	else
		xe->wedged.method =3D method;

	schedule_work(&xe->wedged.work);
}

Will this cause xe_wedge_declare() to skip setting xe->wedged.method to
DRM_WEDGE_RECOVERY_VENDOR, skip setting xe->needs_flr_on_fini, and skip
scheduling xe->wedged.work to notify userspace via the DRM wedged uevent?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028072803.9379=
55-2-riana.tauro@intel.com?part=3D1
