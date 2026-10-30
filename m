Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC7F606A322
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 15:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNiKUCYP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1779710E168;
	Fri, 30 Oct 2026 15:00:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F294F10E168
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 14:59:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AD8D42B87;
 Fri, 30 Oct 2026 14:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D601F00A16;
 Fri, 30 Oct 2026 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793372399;
 bh=VvYBRBiZzhD60mCCa36U2pguEzCPFgT3E63F7IklSMA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=BNiKUCYPK3gqQ0GLk6VtUi40+g4hlKTOQOkCmA00wswhSvNyGhqft18qvlVxgLwTf
 EEGmzhtdfRu3UqJBcPwz8p9zx/BFX+iZazLtvaa0uLca/VPmHIftirSLxdos9OaRfE
 t5o6odPhOG7gCoesW4oaodmwRYbzgeUu6orwA6mdi+B+dD5f48SU+G6TmiQE+Z4ykk
 5XzkicMqDsc6M2xQAjhZzNavJr6eYHl9tueRUmVTqZZukMF2OY00dwl1QHuDaxdcuT
 rkkw+JlhcGOmthlM5bBEnzR3svre7hTLNjD1Rp+JpbR0r7tG5e9WNcAPFA/w6vk9Mo
 fWkc8jAl3l/gQ==
Message-ID: <sashiko-outbox-191136@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] drm/xe/xe_late_bind_fw: Enable late binding
 support for CRI
To: "Badal Nilawar" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261030144547.2532309-13-badal.nilawar@intel.com>
References: <20261030144547.2532309-8-badal.nilawar@intel.com>
 <20261030144547.2532309-13-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 14:59:58 +0000
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

commit 757939afc7a64783d9f3384321cd0d56046b5326
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/xe_late_bind_fw: Enable late binding support for CRI

This commit enables late binding firmware support for fan control and OCODE
on Crescent Island (CRI) by setting late_bind_mask in cri_desc.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 396204f2e3e45..3fa842c22a508 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -488,6 +488,8 @@ static const struct xe_device_desc cri_desc =3D {
>  	.has_sriov =3D true,
>  	.has_sysctrl =3D true,
>  	.has_temp_sentinel =3D true,
> +	.late_bind_mask =3D BIT(XE_LB_FW_FAN_CONTROL) |
> +			  BIT(XE_LB_FW_OCODE),

[Severity: Medium]
As reported by Sashiko on v5 [1], does xe_late_bind_init() check the right
Kconfig symbol for Crescent Island when xe_device_probe() ->
xe_late_bind_init() runs with late_bind_mask enabled in cri_desc?

In drivers/gpu/drm/xe/xe_late_bind_fw.c, xe_late_bind_init() currently gates
initialization on CONFIG_INTEL_MEI_GSC:

drivers/gpu/drm/xe/xe_late_bind_fw.c:xe_late_bind_init() {
	if (!xe->info.late_bind_mask)
		return 0;

	if (!IS_ENABLED(CONFIG_INTEL_MEI_LB) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC))=
 {
		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
		return 0;
	}
}

Unlike Battlemage (bmg_desc), which sets has_heci_cscfi =3D 1 and registers=
 an
auxiliary device bound by the mei-gsc driver under CONFIG_INTEL_MEI_GSC,
cri_desc has both has_heci_gscfi and has_heci_cscfi set to false. Instead,
Crescent Island exposes a standalone PCI MEI CSC controller bound by
mei_csc_driver under CONFIG_INTEL_MEI_CSC:

drivers/misc/mei/pci-csc.c:
static const struct pci_device_id mei_csc_pci_tbl[] =3D {
	{ PCI_DEVICE_DATA(INTEL, MEI_CRI, MEI_ME_CSC_CFG) },
	{ }
};

If CONFIG_INTEL_MEI_LB and CONFIG_INTEL_MEI_CSC are enabled while
CONFIG_INTEL_MEI_GSC is disabled, xe_late_bind_init() will bail out and skip
loading the fan_control and ocode firmware on CRI.

Conversely, if CONFIG_INTEL_MEI_LB and CONFIG_INTEL_MEI_GSC are enabled whi=
le
CONFIG_INTEL_MEI_CSC is disabled, xe_late_bind_init() will register the late
bind component and queue xe_late_bind_work(), where each payload worker wai=
ts
LB_INIT_TIMEOUT_MS (20 seconds per payload, up to 40 seconds total on the
ordered workqueue) for a component bind that never happens, stalling
xe_late_bind_wait_for_worker_completion() during xe_late_bind_pm_suspend() =
or
xe_late_bind_remove().

Should xe_late_bind_init() check CONFIG_INTEL_MEI_CSC for Crescent Island
instead of CONFIG_INTEL_MEI_GSC?

[1] https://lore.kernel.org/r/20261028181951.1093283-11-badal.nilawar@intel=
.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030144547.2532=
309-8-badal.nilawar@intel.com?part=3D5
