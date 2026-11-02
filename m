Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B0606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 22:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhU/eAIr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB37810E6F9;
	Mon,  2 Nov 2026 22:23:59 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43CD10E700
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 22:23:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CD503601F0;
 Mon,  2 Nov 2026 22:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4FA1F00A16;
 Mon,  2 Nov 2026 22:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793658232;
 bh=uhiftmp3Y5VFzOkspXGcu9NbcJWv0r/R+m0wPGtBsEg=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=FhU/eAIravlEabDvzDXeudbDYHX8k1Xy+EBwvrVy8vpIj8vTQNUtHjtI5lhyIxGAO
 NC3C9r3U4YCZSFHmHa0+GLt2qesLUFWXosEwSAvzPhaPIUlOpsyho+OSSW7V2p3RYr
 I4+o/NrUaA87OyddguQI7h+Kk3CEUa/pSWbsUdqSfuqSVH68Y1rBwrOuxsNiwTbyYv
 Wq9Hv13rkwcPTKjYFfqBtFO0JFbylcq8IPKIVtH/WtClvWdysGMooAog0epDBv8XcN
 sRL0mkw3COoPb6SRK09V+SX5dQ4uuKsAKq6QFGKDb8bSGYfUlsnyBVJRWbm74B+FrC
 jyAKEWA3uRp2w==
Message-ID: <sashiko-outbox-194278@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 01/16] drm/xe/vsec: Do not register BMG PMT for VF
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261102221314.119028-19-michael.j.ruhl@intel.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-19-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 22:23:51 +0000
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
- [High] drm/xe/vsec: NULL pointer dereference in xe_pmt_telem_read() in su=
rvivability mode
--

commit ce97359d953d35ffff16565daa34557b5236e227
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Do not register BMG PMT for VF

This commit skips VSEC PMT registration on Battlemage SR-IOV VF devices,
adds a VF assertion to xe_pmt_telem_read(), and removes the NULL check on
xe->soc_remapper.set_telem_region.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index a9baf0bfe572c..178f22db40461 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -149,6 +149,8 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u=
64 *data, loff_t user_offse
>  	u32 offset;
>  	int ret;
> =20
> +	xe_assert(xe, !IS_SRIOV_VF(xe));
> +
>  	ret =3D xe_guid_decode(guid, &mem_region, &offset);
>  	if (ret)
>  		return ret;
> @@ -157,9 +159,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u=
64 *data, loff_t user_offse
> =20
>  	guard(mutex)(&xe->pmt.lock);
> =20
> -	if (!xe->soc_remapper.set_telem_region)
> -		return -ENODEV;
> -

[Severity: High]
Can removing the xe->soc_remapper.set_telem_region check here cause a NULL
function pointer dereference in xe_pmt_telem_read() when a Battlemage PF
enters boot survivability mode?

When boot survivability mode is enabled during xe_device_probe_early(),
enable_boot_survivability_mode() initializes VSEC and registers the PMT
callbacks:

drivers/gpu/drm/xe/xe_survivability_mode.c:enable_boot_survivability_mode()=
 {
	...
	xe_heci_gsc_init(xe);

	xe_vsec_init(xe);
	...
}

Then __xe_pci_probe() returns early before calling xe_device_probe():

drivers/gpu/drm/xe/xe_pci.c:__xe_pci_probe() {
	...
	err =3D xe_device_probe_early(xe);
	if (xe_survivability_mode_is_boot_enabled(xe))
		return 0;
	...
	err =3D xe_device_probe(xe);
}

Because xe_soc_remapper_init(xe) is only called inside xe_device_probe(),
xe->soc_remapper.set_telem_region remains NULL in boot survivability mode.
Meanwhile, local_pci_probe() holds a runtime PM reference, so
xe_pm_runtime_get_if_active(xe) returns true. If userspace reads the
exposed PMT telemetry or crashlog sysfs attributes, xe_pmt_telem_read()
will call xe->soc_remapper.set_telem_region(xe, mem_region) when it is
NULL.

It looks like a later patch in the series, commit 6e126caaac7b
("drm/xe/vsec: Support survivability mode for CRI"), adds a call to
xe_soc_remapper_init(xe) in enable_boot_survivability_mode(), but at this
point in the series (and if that change is not backported together with
this one), reading PMT sysfs files in boot survivability mode will crash.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102221314.1190=
28-18-michael.j.ruhl@intel.com?part=3D1
