Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2BCCA5FA3
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 06:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FCD10E7A6;
	Mon, 28 Sep 2026 06:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R6RiHklE";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EEF10E7A6
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 06:51:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 57E3540B70;
 Mon, 28 Sep 2026 06:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1063E1F000FF;
 Mon, 28 Sep 2026 06:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790578285;
 bh=an86j+QvMQvryKm/L6RODNBbYMIklpBsGJzkNVjBGzw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=R6RiHklEDuwB6tkLWg94FmU3tMxNewz4IV3GxSvaKDV82Rsnn0gHO0Z/diXH29UYZ
 QtLvZyPow7YaRGt3yBLxCEmILd8+St3gPcFRTBUtUXiPkb6S47Zo4HHVDcWAl10n9B
 8eEbVh37zjqp/Fv4uXns80G1UmRDT18HcxUwoyBK26GlgUdhrvm7LCmhkwCFG+g54I
 iZn6p1IDAVTkAn6bRBllX5IUYAoIi40jzM+/QzKjCsDA9h4K6B8iXzBztQBfq6PhXV
 WFPb7jAVKqPvsKZt0SIP0Lwo2Xw/OVAIdOy+Vz1nxMQ15nVklQU+Auw+9nrnWNov5q
 9os8nJummRsxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] drm/xe: Separate drm-ras netlink data from
 device and firmware RAS state
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260928061830.417395-11-riana.tauro@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-11-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 06:51:24 +0000
Message-Id: <20260928065125.1063E1F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/xe/ras: accidental deletion of platform check in xe_ras_init
--

commit 680ae4844f08c353c254033fac23eb66e90d2147
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe: Separate drm-ras netlink data from device and firmware RAS state

This commit separates the DRM RAS data used for netlink reporting from the
device and firmware RAS state in xe_device. It introduces a new xe_ras_state
structure to encapsulate configuration such as the disable_page_offline fla=
g.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index f1da7f983637a..f7232429080a8 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -1104,19 +1115,18 @@ void xe_ras_init(struct xe_device *xe)
>  {
>  	int ret;
> =20
> -	/*
> -	 * TODO: Replace platform check with xe->info.has_disable_vram_page_off=
line
> -	 * once the feature flag is plumbed through device info.
> -	 */
> -	if (xe->info.platform =3D=3D XE_CRESCENTISLAND)
> -		xe->ras.disable_vram_page_offline =3D
> -			xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));
> -
>  	xe_drm_ras_init(xe);
> =20
>  	if (!xe->info.has_sysctrl)
>  		return;
> =20
> +	/*
> +	 * TODO: Replace platform check with xe->info.has_disable_vram_page_off=
line
> +	 * once the feature flag is plumbed through device info.
> +	 */
> +	xe->ras.state.disable_page_offline =3D
> +		xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));

[Severity: Low]
Was the removal of the platform check intentional here?

The TODO comment mentions replacing the platform check, but it looks like t=
he
if (xe->info.platform =3D=3D XE_CRESCENTISLAND) condition was simply deleted
rather than replaced.=20

This changes the evaluation scope of the configfs policy in xe_ras_init(). =
It
will now be evaluated for all platforms that have has_sysctrl set to true,
rather than being restricted to XE_CRESCENTISLAND.

Additionally, because VFs always have has_sysctrl set to 0:

drivers/gpu/drm/xe/xe_pci.c:xe_info_init() {
    ...
	if (IS_SRIOV_VF(xe)) {
		xe->info.has_sysctrl =3D 0;
    ...
}

The policy will no longer be initialized on VFs due to the early return.
While this shouldn't have a functional impact on VFs since they don't handle
physical VRAM faults, was it intended to evaluate this policy on all other
sysctrl-capable platforms without plumbing the feature flag first?

> +
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928061830.4173=
95-8-riana.tauro@intel.com?part=3D3
