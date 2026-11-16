Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00460606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQ5VWx9k
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E5210ECA5;
	Mon, 16 Nov 2026 15:31:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0057010F24C
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 15:31:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2B6C162EAD;
 Mon, 16 Nov 2026 15:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE1F1F000C5;
 Mon, 16 Nov 2026 15:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794843072;
 bh=0EgAhi5H9EwYbxzvonyn/0h5Me+l6k6ZIz/VEiErseY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KQ5VWx9kLbEkM5T7E0VJ96FB//2lOUo9qJWFnA+B8dasZkMmnWk465b2AfyC37e1h
 qjREHjvJYgQhYEZIOjcM084np34y6uSBA3XSTnjK7b+VNn/eZZFmt1tW4pTHtFsWaF
 x52558Cq20h1/QwRngzZARvvRAai+obsR3gM97Cfzp2TXewzPkk8eo2QT1acwBeg4e
 Zf3u0YQY0Ai0UerBM7V+mc1O4U02B/SIdLB7JRPzOh9bXFg1iQ268xLuCLOIEeHY2s
 xKQE96wpGnWeIDx+IhHE+If/ga8ulcDWZ8xKjBhRX/EbrgNQgFbwzKPJsViRsIElcz
 GS2mpiFhVr15Q==
Message-ID: <sashiko-outbox-217283@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 14/17] drm/xe/vsec: Add PMT GUID internal access
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261116150649.368686-33-michael.j.ruhl@intel.com>
References: <20261116150649.368686-19-michael.j.ruhl@intel.com>
 <20261116150649.368686-33-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:31:12 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe/vsec: missing wait_for_fw() and invalid GUID handling
  in xe_vsec_get_guid()
--

commit 632d26eff21d3d09eabbe9a46ad322beb8f8346c
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Add PMT GUID internal access

This commit renames theBattlemage telemetry guid macro to include the
platform prefix, defines the Crescent Island telemetry guid register, and
adds xe_vsec_get_guid() to read and cache the punit guid per platform.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index fe3d8338cfc98..7695bd6b6bc87 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -571,6 +571,61 @@ static void cri_late_bind_probe(struct xe_device *xe)
>  	intel_vsec_register(dev, info);
>  }
> =20
> +/**
> + * xe_vsec_get_guid - Get and cache the PUNIT guid value
> + * @xe: valid xe device
> + * @guid: returned guid
> + *
> + * Return:
> + * * -ENODATA device is not active
> + * * -EINVAL unsupported platform
> + * * 0 success
> + */
> +int xe_vsec_get_guid(struct xe_device *xe, u32 *guid)
> +{
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
Does xe_vsec_get_guid() need to call wait_for_fw(xe) before reading the
discovery table on Crescent Island?

As introduced in commit "drm/xe/vsec: Support late bind fw information",
the discovery window on Crescent Island is populated asynchronously on
power-on by late-bound firmware, so xe_pmt_telem_read(), xe_pmt_read_reg()
and xe_pmt_write_reg() all check wait_for_fw(xe) before taking xe->pmt.lock
and accessing the discovery or telemetry regions.  During probe and the
late-bind polling window, xe_pm_runtime_get_if_active() succeeds while the
firmware is not yet ready, so xe_vsec_get_guid() reads an uninitialized
discovery window.

Also, if the register read returns 0, xe_vsec_get_guid() skips caching it
but still returns 0 (success) with *guid set to 0, whereas if an
uninitialized or failed read returns a non-zero bogus value such as
0xffffffff, xe->pmt.punit_guid_cache caches it for the lifetime of the
device and causes all subsequent telemetry reads to fail in
xe_guid_decode().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116150649.3686=
86-19-michael.j.ruhl@intel.com?part=3D14
