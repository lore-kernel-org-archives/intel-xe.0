Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9322606A32A
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZZMeeioP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7338E10EA24;
	Mon, 16 Nov 2026 15:39:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B87410EA24
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 15:39:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 39B9A609D0;
 Mon, 16 Nov 2026 15:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4781F000C9;
 Mon, 16 Nov 2026 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794843585;
 bh=aBVLaaMEbF9Ey2fsKvEuSNeb7xIt+ZUOwvu2ALe2SsU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ZZMeeioP4xyKcFQu3kqrOonrvZke6lxcgnMRqMFdt9TF85h5+uM8Vn+XpZ2lVWxZZ
 wYy7Cb0BWcFYAhQuGcir8sK59QiHCttJxveT0K8N6gMe4JFLKS30G5Wh82rakSOOWu
 nZQ9X6L5RQJpxY9Hb129I/RdYEXD38u09aZy+MMBKqegxrWEXJUXo50jJfTCzl9KE0
 uD402FHsQceeywjUj4Hb4Cw2WLu2OoMw5eWntUg5T0kJ/TrCiNupCkQeTy0bD5govw
 IHT2GjIyQwaR2CtoNGj93FLG8DDhAv/7VQ+5iq5a9yAVLnvrHs/5rL7WH/0bIYXR6y
 bJedTatNHDkZw==
Message-ID: <sashiko-outbox-217312@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 13/17] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261116150649.368686-32-michael.j.ruhl@intel.com>
References: <20261116150649.368686-19-michael.j.ruhl@intel.com>
 <20261116150649.368686-32-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:39:44 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/xe/vsec: lock inversion holding pmt.lock in
  cri_late_bind_probe()
- [Medium] drm/xe/vsec: missing pmt.lock during CRI discovery in
  xe_vsec_init()
--

commit 32874c6df8ff2b93eb16e544520f64211460d328
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

This commit adds delayed-work polling and synchronous readiness waits so
Crescent Island PMT registration and telemetry or crashlog accesses wait
for the OOBMSM firmware to finish initializing.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 4ca41a5ef5027..fe3d8338cfc98 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c

[ ... ]

> @@ -476,6 +549,28 @@ static enum xe_vsec get_platform_info(struct xe_devi=
ce *xe)
>  	return vsec_platforms[xe->info.platform];
>  }
> =20
> +static void cri_late_bind_probe(struct xe_device *xe)
> +{
> +	struct intel_vsec_platform_info *info;
> +	struct device *dev =3D xe->drm.dev;
> +	enum xe_vsec platform;
> +
> +	platform =3D get_platform_info(xe);
> +	if (platform !=3D XE_VSEC_CRI)
> +		return;
> +
> +	info =3D &xe_vsec_info[platform];
> +	if (!info->headers)
> +		return;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	info->priv_data =3D &xe_cri_pmt_cb;
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	intel_vsec_register(dev, info);
> +}

[Severity: Medium]
Does holding xe->pmt.lock across intel_vsec_register() introduce a circular
locking dependency and potential ABBA deadlock with PMT sysfs attributes?

intel_vsec_register() adds the auxiliary device under device_lock(&auxdev->=
dev)
and synchronously runs pmt_telem_probe(), which acquires ep_lock and creates
sysfs attributes for each discovery entry.  Reading those attributes enters
intel_pmt_read() -> xe_pmt_telem_read() under the kernfs active reference
(kn->dep_map) and takes xe->pmt.lock, while unbinding or rolling back on a
later entry's probe failure drains kn->dep_map under &auxdev->dev.mutex and
ep_lock:

CPU0                              CPU1
----                              ----
lock(&xe->pmt.lock)
  lock(&auxdev->dev.mutex)
    lock(&ep_lock)
                                  lock(kn->dep_map)
                                    lock(&xe->pmt.lock)
      lock(kn->dep_map)

 *** DEADLOCK ***

CPU0: cri_late_bind_probe() -> intel_vsec_register() -> ... ->
      pmt_telem_probe() -> pmt_telem_remove() -> sysfs_remove_bin_file()
CPU1: kernfs_fop_read_iter() -> intel_pmt_read() -> xe_pmt_telem_read()

> =20
>  /**
>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>   * interface
> @@ -503,12 +598,24 @@ void xe_vsec_init(struct xe_device *xe)
> =20
>  	case XE_VSEC_CRI:
>  		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
> +
> +		xe->pmt.retry_count =3D 0;
> +		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
> +
> +		xe_pm_runtime_get_noresume(xe);
> +		if (!xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> +			queue_delayed_work(system_freezable_wq, &xe->pmt.work,
> +					   msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
> +			return;
> +		}
> +
>  		info->priv_data =3D &xe_cri_pmt_cb;
>  		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>  		break;
> =20
>  	default:
> -		break;
> +		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
> +		return;
>  	}
> =20
>  	/*
> @@ -516,5 +623,22 @@ void xe_vsec_init(struct xe_device *xe)
>  	 * resources.
>  	 */
>  	intel_vsec_register(dev, info);

[Severity: Medium]
Can a concurrent telemetry read corrupt the SoC remapper index while
intel_vsec_register() is still reading Crescent Island discovery headers?

When OOBMSM firmware is already ready in xe_vsec_init(), CRI_IDX_TELEM_DISC=
OVERY
is programmed and intel_vsec_register() is called without serialization
against xe_pmt_telem_read().  Because intel_vsec_register() registers three
cri_telemetry entries followed by two cri_crashlog entries, a reader can
open the first telemetry sysfs file as soon as entry 0 is created and
switch the remapper index away from CRI_IDX_TELEM_DISCOVERY while the
remaining headers are still being read from CRI_PMT_OFFSET:

CPU0                                  CPU1
xe_vsec_init()
  set_telem_region(...,
    CRI_IDX_TELEM_DISCOVERY)
  intel_vsec_register()
    pmt_telem_probe()
      intel_pmt_dev_create(entry 0)
                                      xe_pmt_telem_read()
                                        lock(&xe->pmt.lock)
                                        set_telem_region(..., mem_region)
      intel_pmt_dev_create(entry 1)
        pmt_get_headers()
          readl(disc_vaddr)  <-- reads wrong remapper region
                                        memcpy_fromio(...)
                                        set_telem_region(...,
                                          CRI_IDX_TELEM_DISCOVERY)
                                        unlock(&xe->pmt.lock)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116150649.3686=
86-19-michael.j.ruhl@intel.com?part=3D13
