Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5287A606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 22:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLRzafYt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A97510E6E3;
	Mon,  2 Nov 2026 22:46:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB33510E714
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 22:46:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 24F6F600D1;
 Mon,  2 Nov 2026 22:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEEF81F00A1A;
 Mon,  2 Nov 2026 22:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793659596;
 bh=oitM3N5mGzcbxQt+Yb+Ex+Zqcp7mZlqb5xl5xypQ2KA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=RLRzafYtosa1iDNlYrXxNGLh1JsQ2nGq8posFrHorikS4UB6N4twZvxbJEqQ24mWq
 MW8pvzbhomUqvLJ6JqHOfmRU7G8We31c1ZuesP84NLWtyEpMIiQntvSiZXWoY0OO+G
 yR+Uv88MmM97JBKBg0SbdR0WEy/1sjTCrZL2bEyx1QQI91sn7PdCy8KWSIgtekWAPP
 I/UBljppiHaPZ11thTSNjV61wTgAQlJPnZR972CB87aSPtXpTj6ZCFK5X6hJJtK8Hl
 mDCrZXf04rELfbMw9engUV6+f956P38nDAR+QaIrejsSViUBGMnUV2rqLenMQzY3TV
 LgybUzwTRxUnw==
Message-ID: <sashiko-outbox-194301@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 15/16] drm/xe/vsec: Refactor platform check
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261102221314.119028-33-michael.j.ruhl@intel.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-33-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 22:46:36 +0000
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
- [Medium] drm/xe/vsec: missing wait_for_fw() and GUID validation in xe_vse=
c_get_guid()
--

commit fd76168b193bc56ba83b5c95e6f8be66f5597b26
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Refactor platform check

This commit combines the platform checks in xe_debugfs_register() so that
both debugfs_residencies and pcode_info_debugfs are registered on Battlemage
and Crescent Island PF devices.

> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debu=
gfs.c
> index b56e4aad40696..5a82f8eab2c66 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -702,23 +702,22 @@ void xe_debugfs_register(struct xe_device *xe)
>  				 ARRAY_SIZE(debugfs_list),
>  				 root, minor);
> =20
> -	if (xe->info.platform =3D=3D XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
> -		drm_debugfs_create_files(debugfs_residencies,
> -					 ARRAY_SIZE(debugfs_residencies),
> -					 root, minor);
> -	}
> -
>  	/*
> -	 * Pcode version read from PMT is currently only supported on CRI and B=
MG platforms in PF
> -	 * mode, as both platforms support the necessary telemetry read mechani=
sm and have a fixed
> -	 * PUNIT_VERSION_OFFSET.
> +	 * Residencies and Pcode version read from PMT is currently only suppor=
ted on CRI and BMG
> +	 * platforms in PF mode.  Both platforms support the necessary telemetr=
y read mechanism
> +	 * and have a fixed offsets for the required data.
>  	 * Attempting this access on other platforms must be verified before en=
abling support.
>  	 */
>  	if (!IS_SRIOV_VF(xe) &&
> -	    (xe->info.platform =3D=3D XE_CRESCENTISLAND || xe->info.platform =
=3D=3D XE_BATTLEMAGE))
> +	    (xe->info.platform =3D=3D XE_CRESCENTISLAND || xe->info.platform =
=3D=3D XE_BATTLEMAGE)) {
> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),
> +					 root, minor);
> +
>  		drm_debugfs_create_files(pcode_info_debugfs,
>  					 ARRAY_SIZE(pcode_info_debugfs),
>  					 root, minor);
> +	}

[Severity: Medium]
With debugfs_residencies now exposed on XE_CRESCENTISLAND alongside
pcode_info_debugfs, what happens if userspace reads dgfx_pkg_residencies,
dgfx_pcie_link_residencies, or pcode_info while OOBMSM firmware
initialization (cri_late_bind_probe_work) is still pending after
xe_vsec_init()?

In read_residency_counter() (and xe_get_pcode_version()), xe_vsec_get_guid()
is called before xe_pmt_telem_read():

drivers/gpu/drm/xe/xe_debugfs.c:read_residency_counter() {
	ret =3D xe_vsec_get_guid(xe, &guid);
	if (ret) {
		drm_warn(&xe->drm, "PMT device is not available: %d\n", ret);
		return;
	}

	ret =3D xe_pmt_telem_read(xe->drm.dev, guid, &residency, offset, sizeof(re=
sidency));
}

Unlike xe_pmt_telem_read(), xe_pmt_read_reg(), and xe_pmt_write_reg(), which
all call wait_for_fw(xe) before setting the SoC remapper index and reading
the PMT window, xe_vsec_get_guid() accesses CRI_PUNIT_TELEMETRY_GUID without
waiting for firmware readiness or validating the returned GUID:

drivers/gpu/drm/xe/xe_vsec.c:xe_vsec_get_guid() {
	...
	case XE_CRESCENTISLAND:
		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
		*guid =3D xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
		break;
	...
	/* the GUID is static, read once and cache for all requests */
	if (*guid)
		xe->pmt.punit_guid_cache =3D *guid;
}

If CRI_PUNIT_TELEMETRY_GUID reads as 0 before firmware is ready,
xe_vsec_get_guid() returns 0 with *guid =3D=3D 0, and xe_pmt_telem_read() t=
hen
fails xe_guid_decode() with -ENODEV before reaching wait_for_fw(xe). If the
unready register returns a non-zero bogus value (such as 0xffffffff),
xe_vsec_get_guid() caches it in xe->pmt.punit_guid_cache, permanently
breaking subsequent telemetry reads for the lifetime of the device.

Should xe_vsec_get_guid() call wait_for_fw(xe) and validate the GUID before
caching it in xe->pmt.punit_guid_cache?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102221314.1190=
28-18-michael.j.ruhl@intel.com?part=3D15
