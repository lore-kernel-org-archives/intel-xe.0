Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC88A606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 22:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YyHNA3Yz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF5C10E710;
	Mon,  2 Nov 2026 22:39:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C0010E710
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 22:39:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BC50A601EF;
 Mon,  2 Nov 2026 22:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E081F00A18;
 Mon,  2 Nov 2026 22:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793659186;
 bh=p+Ea3lpHXoAlA0yml/w9MvmV53xrIrop73EwfEbR0ts=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=YyHNA3YzpUs5f/JJRNa0CBtPWFqug8kG1p2docjmAJfiI0NQcQctVBO1ckZ8yt5he
 6OCIlvzyBYvnCjpxx/MUTPQFBXXR58yJl0Y8neGsFFH02HdNU6V9smezOMkFX4pG9q
 EI3rI7MoEAQS2umRiEnxhEksu3jvWioO4XvFHiZhNtG7v2iHotYM2eXYii0OQikK9y
 gjuhEGDv0BogBQqp/DrA4nTbUDBW45L0y8jval/f7SZpejBIf+uVlurcxeM60vucTo
 xR2cuHD+OZ7vRu7RnPCXQMUsmm40VVVWDn6gSsinHtzSLoM2BYDDG+6t4JuZ2t2oVF
 eLdWhb0vwfPTg==
Message-ID: <sashiko-outbox-194295@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 13/16] drm/xe/vsec: Add PMT GUID internal access
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261102221314.119028-31-michael.j.ruhl@intel.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-31-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 22:39:45 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm/xe/vsec: missing wait_for_fw() and zero-GUID check in xe_vse=
c_get_guid()
- [Low] drm/xe/vsec: missing kernel-doc for xe_vsec_get_guid()
--

commit f5d795abace88c0eb050818c49e569b4c3a02f52
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Add PMT GUID internal access

This commit renames PUNIT_TELEMETRY_GUID to BMG_PUNIT_TELEMETRY_GUID, adds
CRI_PUNIT_TELEMETRY_GUID for Crescent Island, and introduces
xe_vsec_get_guid() to read and cache the PUNIT telemetry GUID based on the
platform.

> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index cc8e0e6bed9a8..7430185ad41a9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -490,6 +490,8 @@ struct xe_device {
>  		struct delayed_work work;
>  		/** @pmt.retry_count: late-bind probe retry */
>  		u32 retry_count;
> +		/** @pmt.punit_guid_cache: cache of the PUINT GUID */
> +		u32 punit_guid_cache;

[Severity: Low]
This isn't a bug, but there is a minor typo in the kernel-doc comment here
(PUINT instead of PUNIT).

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 5384fef5e5ac5..1ed904ec14965 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -579,6 +579,51 @@ static void vsec_disable_late_bind_work(void *arg)
>  		xe_pm_runtime_put(xe);
>  }
> =20
> +int xe_vsec_get_guid(struct xe_device *xe, u32 *guid)
> +{

[Severity: Low]
This isn't a bug, but since Documentation/gpu/xe/xe_vsec.rst pulls
kernel-doc from drivers/gpu/drm/xe/xe_vsec.c and the other exported VSEC
entry points (xe_pmt_telem_read() and xe_vsec_init()) are documented,
should xe_vsec_get_guid() also have a kernel-doc comment describing its
parameters, runtime PM and xe->pmt.lock locking expectations, and return
values?

> +	struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
> +	int ret =3D 0;
> +
> +	xe_assert(xe, !IS_SRIOV_VF(xe));
> +
> +	if (!xe_pm_runtime_get_if_active(xe))
> +		return -ENODATA;
> +
> +	mutex_lock(&xe->pmt.lock);
> +
> +	if (xe->pmt.punit_guid_cache) {
> +		*guid =3D xe->pmt.punit_guid_cache;
> +		goto unlock;
> +	}
> +
> +	switch (xe->info.platform) {
> +	case XE_BATTLEMAGE:
> +		*guid =3D xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
> +		break;
> +
> +	case XE_CRESCENTISLAND:
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		*guid =3D xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
> +		break;
> +
> +	default:
> +		*guid =3D 0;
> +		drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	/* the GUID is static, read once and cache for all requests */
> +	if (*guid)
> +		xe->pmt.punit_guid_cache =3D *guid;
> +
> +unlock:
> +	mutex_unlock(&xe->pmt.lock);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}

[Severity: Medium]
On XE_CRESCENTISLAND, can xe_vsec_get_guid() be called before the late-bound
OOBMSM firmware has finished initializing (for example, via debugfs or hwmon
after xe_vsec_init() defers discovery to cri_late_bind_probe_work(), or rig=
ht
after runtime/system resume)?

The other PMT access helpers in drivers/gpu/drm/xe/xe_vsec.c (such as
xe_pmt_telem_read() and xe_pmt_read_reg()) check wait_for_fw(xe) before
taking xe->pmt.lock, programming CRI_IDX_TELEM_DISCOVERY, and reading the
discovery window:

drivers/gpu/drm/xe/xe_vsec.c:xe_pmt_read_reg() {
	...
	xe_pm_runtime_get(xe);
	if (!wait_for_fw(xe)) {
		ret =3D -ENODATA;
		goto runtime_exit;
	}

	scoped_guard(mutex, &xe->pmt.lock) {
		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);

		*reg =3D readl(disc_addr);
	}
	...
}

Without wait_for_fw(xe) in xe_vsec_get_guid(), if reading
CRI_PUNIT_TELEMETRY_GUID before firmware is ready returns a non-zero bogus
value (such as 0xffffffff), won't xe->pmt.punit_guid_cache permanently cache
that invalid value for the lifetime of the device?

Conversely, if xe_mmio_read32() returns 0 (either before firmware is ready
or when !mmio_available(mmio)), xe_vsec_get_guid() skips caching *guid, but
ret remains 0. Should xe_vsec_get_guid() wait for firmware readiness via
wait_for_fw(xe) and return an error code when *guid is 0 (or invalid) rather
than returning 0 with *guid =3D=3D 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102221314.1190=
28-18-michael.j.ruhl@intel.com?part=3D13
