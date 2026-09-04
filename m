Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBADC79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 15:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD67A10E130;
	Fri,  4 Sep 2026 15:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UXbGC/DZ";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D9510E130
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 15:57:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B67E2600C8;
 Fri,  4 Sep 2026 15:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434481F00A3D;
 Fri,  4 Sep 2026 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788537458;
 bh=Zu1qWd5/dSPIHKFRw3cRfARKwKAYf0cIul/Gmy/i0DU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UXbGC/DZglIt4wEK43wfWvoAtCFj7aBOGYMA6d+6yURF4MKefc3bwu5AQo/xibBs+
 PRvkWIyfLTHwWa27bTfrU61m4L6otjYE6eq4MIRs/3bbKseb70Csrfc19DGJ6CshSg
 iHLO30IcbtbUG5Hb9ZTQx8Yl28wrwLFYF2Btbxt5QqLeoy2Bry3PTKA207om6ZU50Y
 a8B1XAWq1uuW6c2ivygZUdioxAiU0FdM7DjTa5qYt+sf6GzMtSRaiSq0aXWr0lm4SA
 /c4R/OYMJBgt5+4DnNtioJMfrD5h0zSsimNeZCq1L577rxqUh83Frcy5qVgLOiZWEd
 j/1v0b/oy4j0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904160608.2004174-6-badal.nilawar@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 15:57:37 +0000
Message-Id: <20260904155738.434481F00A3D@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing SR-IOV VF guard for CRI_DEVICE_UUID MMIO read and sysfs re=
gistration.
- [High] MMIO read of CRI_DEVICE_UUID is performed before pcode uncore_init=
 completion.
--

commit 23a0b7f2a1ab91a9391ba06e886cb50c9626ce7d
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cri: Expose device UUID through sysfs

This commit exposes a read-only sysfs attribute to report the GPU's unique
hardware identifier.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 8583b2e9ecf4c..e8db8871990b2 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -801,6 +801,9 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (IS_SRIOV_VF(xe))
>  		vf_update_device_info(xe);
> =20
> +	if (xe->info.platform =3D=3D XE_CRESCENTISLAND)
> +		xe->device_uuid =3D xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEV=
ICE_UUID);
> +

[Severity: High]
Is it safe to read this MMIO register from a Virtual Function (VF) context?

If this register is PF-only, accessing it from a VF might cause MMIO timeou=
ts
or hardware errors. Should this be guarded with !IS_SRIOV_VF(xe)?

[Severity: High]
Does this MMIO read happen too early?

The comment right below this read states that "any MMIO or lmem access from
the driver will be blocked" until pcode uncore_init is done in
xe_pcode_probe_early(). If we read the register before this initialization
completes, will it result in a bus hang or reading invalid data?

>  	/*
>  	 * Check for pcode uncore_init status to confirm if the SoC
>  	 * initialization is complete. Until done, any MMIO or lmem access from
>  	 * the driver will be blocked
>  	 */
>  	err =3D xe_pcode_probe_early(xe);

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe=
_device_sysfs.c
> index a73e0e957cb0b..a4d326159dce3 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  			return ret;
>  	}
> =20
> +	if (xe->info.platform =3D=3D XE_CRESCENTISLAND) {
> +		ret =3D devm_device_add_group(dev, &device_uuid_attr_group);
> +		if (ret)
> +			return ret;
> +	}
> +

[Severity: High]
If the device UUID cannot be read on VFs, should we prevent registering the
sysfs attribute for VFs as well?

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904160608.2004=
174-4-badal.nilawar@intel.com?part=3D2
