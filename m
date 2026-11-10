Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B47B606A337
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 19:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lEyxCfOm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E147510E321;
	Tue, 10 Nov 2026 19:08:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C741B10E321
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 19:08:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 79831416C7;
 Tue, 10 Nov 2026 19:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5111F0089F;
 Tue, 10 Nov 2026 19:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794337707;
 bh=TSj0bTdKLOv7RswHPQluFwjqU976g6ZWMqA66G0m6IQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=lEyxCfOmY5UjhBVd24ciNTW2Vp1J+LgmSx6NR0e8D4BfFJOhW5iYxTLFBR94eQ7lB
 wFcsKhwZsCis8SxVginA891py634f0gBQuTA9gWDa6shfwS6EjuEyFYw19oNX9BL7h
 Zdd/oJVcO2QrBnnUI97r0W76SLiIYWRSMH8JLTwVYLfr301J5373zgxpSsQlbHFmRX
 oqKhan69LU66yBcVo4pcyrCJbm182EXUY83kqY67xbCSwc94AndzSFmZxbqwFR/p1U
 UOvOneEXh/vLNqVPT5pXIOZqSHF+I6ObG8VmnX1bhw9V4gKJXGNCQjXVB6439DcDRG
 hHVksBXcelwRQ==
Message-ID: <sashiko-outbox-207636@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 13/17] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261110183505.694124-32-michael.j.ruhl@intel.com>
References: <20261110183505.694124-19-michael.j.ruhl@intel.com>
 <20261110183505.694124-32-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 19:08:26 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/xe/vsec: devres race and leak in cri_late_bind_probe_work()
  on remove
- [Medium] drm/xe/vsec: lock inversion holding pmt.lock in
  cri_late_bind_probe()
--

commit 9f8d57c3f4a91f9a4ba548e3f6bead5347072fe3
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

This commit adds delayed-work polling and firmware readiness checks so
Crescent Island PMT probe and register/telemetry accesses wait for OOBMSM
late-bind firmware to become ready.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 4ca41a5ef5027..f400a6d6ec8de 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -476,12 +549,50 @@ static enum xe_vsec get_platform_info(struct xe_dev=
ice *xe)
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
Can holding xe->pmt.lock across intel_vsec_register() cause a lock
inversion and ABBA deadlock with PMT sysfs attribute access and removal?

CPU0                              CPU1
----                              ----
lock(&xe->pmt.lock)
  lock(&auxdev->dev.mutex)
    lock(&ep_lock)
                                  kernfs_get_active(kn->dep_map)
                                    lock(&xe->pmt.lock)
    kernfs_drain(kn->dep_map)

 *** DEADLOCK ***

CPU0: cri_late_bind_probe() -> intel_vsec_register() ->
      auxiliary_device_add() -> pmt_telem_probe() ->
      intel_pmt_dev_register() (or pmt_telem_remove() on teardown/abort)
CPU1: intel_pmt_read() -> xe_pmt_telem_read()

intel_vsec_register() synchronously probes the PMT auxiliary devices under
device_lock(&auxdev->dev) and ep_lock, while PMT sysfs callbacks acquire
xe->pmt.lock under kernfs active protection (kn->dep_map), which PMT
removal and multi-entry probe error unwind drain under &auxdev->dev.mutex
and ep_lock.

Should xe->pmt.lock be released before calling intel_vsec_register(),
matching xe_vsec_init()?

> +
> +static void vsec_disable_late_bind_work(void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +
> +	/*
> +	 * If the queued work is canceled, the runtime reference needs to be
> +	 * released here.
> +	 */
> +	if (disable_delayed_work_sync(&xe->pmt.work))
> +		xe_pm_runtime_put(xe);
> +}
> +
>  /**
>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>   * interface
>   * @xe: valid xe instance
> + *
> + * Return:
> + * * -ENOMEM devm acction failed
> + * * 0 vsec is a best effort.  Only devm failure is tracked
>   */
> -void xe_vsec_init(struct xe_device *xe)
> +int xe_vsec_init(struct xe_device *xe)
>  {
>  	struct intel_vsec_platform_info *info;
>  	struct device *dev =3D xe->drm.dev;
> @@ -489,11 +600,11 @@ void xe_vsec_init(struct xe_device *xe)
> =20
>  	platform =3D get_platform_info(xe);
>  	if (platform =3D=3D XE_VSEC_UNKNOWN)
> -		return;
> +		return 0;
> =20
>  	info =3D &xe_vsec_info[platform];
>  	if (!info->headers)
> -		return;
> +		return 0;
> =20
>  	switch (platform) {
>  	case XE_VSEC_BMG:
> @@ -503,12 +614,26 @@ void xe_vsec_init(struct xe_device *xe)
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
> +					      msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
> +			return devm_add_action_or_reset(xe->drm.dev,
> +							vsec_disable_late_bind_work,
> +							xe);
> +		}

[Severity: High]
Can canceling xe->pmt.work from a devm action leak the VSEC auxiliary
devices and cause a use-after-free on struct xe_device if driver removal or
a late probe failure occurs while cri_late_bind_probe_work() is running?

CPU0                                    kworker
xe_pci_remove()
  xe_device_remove(xe)
  xe_pm_fini(xe)
  devres_release_all(dev)
    remove_nodes(dev, ..., &todo)
    release_nodes(dev, &todo)
                                        cri_late_bind_probe_work()
                                          cri_late_bind_probe(xe)
                                            intel_vsec_register(dev, info)
                                              ...
                                                devm_add_action_or_reset(
                                                  ...,
                                                  intel_vsec_remove_aux,
                                                  ...)
      vsec_disable_late_bind_work()
        disable_delayed_work_sync(...)
  drm_dev_put(&xe->drm) -> frees xe
                                        sysfs read -> xe_pmt_telem_read(xe)
                                          <-- use-after-free

When devres_release_all() runs, remove_nodes() splices dev->devres_head
onto a local todo list before release_nodes() invokes
vsec_disable_late_bind_work().  If cri_late_bind_probe_work() is already
running on another CPU and calls intel_vsec_register(), the new
intel_vsec_remove_aux devres actions are added to the already-drained
dev->devres_head and are never executed, leaving the PMT auxiliary devices
registered after xe is freed and causing subsequent re-probes to fail with
-EBUSY.  In addition, during xe_pci_remove(), cri_late_bind_probe_work()
can still touch MMIO and call xe_pm_runtime_put() after xe_device_remove()
and xe_pm_fini() have completed.

Can xe->pmt.work be stopped in xe_device_remove() (and on xe_device_probe()
error unwind) before devres teardown begins?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110183505.6941=
24-19-michael.j.ruhl@intel.com?part=3D13
