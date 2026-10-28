Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F14606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b51/jsxu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6F810E6E4;
	Wed, 28 Oct 2026 18:29:27 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79EE910E6E4
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 18:29:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6EB7B600C8;
 Wed, 28 Oct 2026 18:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18781F01825;
 Wed, 28 Oct 2026 18:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793212160;
 bh=37hlOD8dwEh0EUXrS1Ce/KpApK2v4nHWwN4xZbJmA6E=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=b51/jsxuNeh/5Tgm0xkzoauvJZFcn7X6TovxQmObc7LS3QWLab4ZciPHu2WpcQ5A7
 2MO8jzckmat2jRDJd8Yt1H8Vv7AxaGVjmTcKwygNBAtwEy2gHZ9wHzpgT5nEpFCoQ5
 QFX1ltL3DSIsC0MWNIPy61QRoILLTgTDnnTfnRMCcoBVO8c8OYTMmQazXR1o9JkCsz
 1TUG5oZyDKyRJV9wJlHuIHDkMkJ/KoY4hb44lVTbFNnlCaM0rW7vbmu2QOBLL/b0YJ
 /79NRyIEVDiQmCHz665DXfPGxhyYGN3ypTWX7XMZ5SJpmudUlW1CdEr4+baO1S2mFJ
 10NtrOOVMdF9w==
Message-ID: <sashiko-outbox-188289@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] drm/xe/xe_late_bind_fw: Enable late binding
 support for CRI
To: "Badal Nilawar" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261028181951.1093283-11-badal.nilawar@intel.com>
References: <20261028181951.1093283-7-badal.nilawar@intel.com>
 <20261028181951.1093283-11-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 18:29:19 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: wrong Kconfig check in xe_late_bind_init() for CRI
--

commit 4506929d511f2d47da604ed04955ac5e9cacd5bb
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/xe_late_bind_fw: Enable late binding support for CRI

This commit enables late binding firmware support for fan control and ocode=
 on
Crescent Island (CRI) by setting .late_bind_mask in cri_desc.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 33e0ea0d406a0..190eaee5250eb 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -488,6 +488,8 @@ static const struct xe_device_desc cri_desc =3D {
>  	.has_sriov =3D true,
>  	.has_sysctrl =3D true,
>  	.has_temp_sentinel =3D true,
> +	.late_bind_mask =3D BIT(XE_LB_FW_FAN_CONTROL) |
> +			  BIT(XE_LB_FW_OCODE),

[Severity: Medium]
Does xe_late_bind_init() also need to be updated to check for
CONFIG_INTEL_MEI_CSC when initializing late binding on CRI?

Unlike Battlemage (bmg_desc), which sets .has_heci_cscfi =3D 1 and register=
s an
auxiliary device bound by the mei-gsc driver (CONFIG_INTEL_MEI_GSC), Cresce=
nt
Island exposes its MEI CSC controller as a standalone PCI device bound by t=
he
mei-csc driver (CONFIG_INTEL_MEI_CSC):

drivers/misc/mei/pci-csc.c:
static const struct pci_device_id mei_csc_pci_tbl[] =3D {
	{ PCI_DEVICE_DATA(INTEL, MEI_CRI, MEI_ME_CSC_CFG) },
	{ }
};

However, xe_device_probe() -> xe_late_bind_init() unconditionally checks
CONFIG_INTEL_MEI_GSC:

drivers/gpu/drm/xe/xe_late_bind_fw.c:xe_late_bind_init() {
	...
	if (!IS_ENABLED(CONFIG_INTEL_MEI_LB) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC))=
 {
		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
		return 0;
	}
	...
}

If CONFIG_INTEL_MEI_LB and CONFIG_INTEL_MEI_CSC are enabled without
CONFIG_INTEL_MEI_GSC, xe_late_bind_init() will bail out and skip loading the
fan_control and ocode firmware on CRI.

Conversely, if CONFIG_INTEL_MEI_LB and CONFIG_INTEL_MEI_GSC are enabled whi=
le
CONFIG_INTEL_MEI_CSC is disabled, xe_late_bind_init() will register the
component and queue xe_late_bind_work(), which will then sleep for
LB_INIT_TIMEOUT_MS (20 seconds) per firmware image waiting for a component
bind that never happens.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028181951.1093=
283-7-badal.nilawar@intel.com?part=3D4
