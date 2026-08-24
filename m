Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F05C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0030510E158;
	Mon, 24 Aug 2026 16:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k01gXOEd";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7054910E57B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:36:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E96266011F;
 Mon, 24 Aug 2026 16:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BAC1F00A3A;
 Mon, 24 Aug 2026 16:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787589416;
 bh=LZ0zDF9B07/BTTa2ZVnhSO6o135S+/F8zuEIvJItVTA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=k01gXOEdGmCht4qDQhp2PR4u5QBBct+rIhDsGY4/rrzL/y/+tepnXHz+FmtB1P9cx
 m9c5L6x4/XAL0XvPmuC28ZfHxHV+Mb650GcNMfRXC5E05Oo4erdGdjffkyCwPVPcPa
 7lMh6flmgheJvlJXZUd7SYzMzWiPXSlsi2/mYLkbFyKgkeOYrpPCLAoFpgeLs82tZ4
 ND6TUXZFx/+pn1jHS58ml3A9Jvsp0B0Nifht34Iv7uUM9vNjJCzMj342/nJaocQRyY
 7rAlYFO67aIhfahovktf4kWfnQgPLTQ2gOwGxXNUOS0VM7zr/Ejcvw7DD6IJKFgb3Z
 JW/qfvYa2LE0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/10] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824162317.2450380-21-michael.j.ruhl@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-21-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 16:36:56 +0000
Message-Id: <20260824163656.75BAC1F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Registering devm resources from a delayed work that is cancelled v=
ia a devm action causes the devm resources to be leaked and outlive the dri=
ver binding, leading to a Use-After-Free.
- [High] Holding the DRM SRCU read lock while sleeping for up to 20 seconds=
 blocks device hot-unplug and causes userspace tasks to hang unresponsively.

Pre-existing issues:
- [High] The PMT VSEC initialization does not restrict execution on Virtual=
 Functions (VFs), violating the restriction on VF access to physical SOC co=
ntrollers.
--

--- Patch [9]: [PATCH v3 09/10] drm/xe/vsec: Support late bind fw informati=
on ---
commit baf7715ba5240a405fca0471519228b0c43828df
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

This commit updates the XE PMT probe to support late bind devices by
waiting for the appropriate firmware state before proceeding with
initialization. It introduces a delayed work queue to retry the probe
and pauses telemetry reads until the firmware is ready.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 578d59048b39c..edc20c24137ed 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c

[ ... ]

> @@ -272,6 +282,56 @@ static int xe_guid_decode(u32 guid, int *index, u32 =
*offset)

[ ... ]

> +static bool wait_for_fw(struct xe_device *xe)
> +{
> +	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
> +
> +	if (xe->info.platform !=3D XE_CRESCENTISLAND)
> +		return true;
> +
> +	while (retries--) {
> +		if (xe_is_oobmsm_fw_ready(xe))
> +			return true;
> +
> +		msleep(VSEC_LATE_BIND_DELAY_MSEC);
> +	}
> +
> +	drm_warn(&xe->drm, "Late Binding failed to complete\n");
> +
> +	return false;
> +}

[ ... ]

> @@ -318,6 +378,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, =
u64 *data, loff_t user_offse

[ ... ]

>  	if (!drm_dev_enter(&xe->drm, &idx))
>  		return -ENODEV;

[ ... ]

> +	if (!wait_for_fw(xe)) {
> +		ret =3D -ENODATA;
> +		goto runtime_exit;
> +	}

[Severity: High]
Does holding the DRM SRCU read lock while sleeping block device hot-unplug?

Earlier in xe_pmt_telem_read(), drm_dev_enter() is called, which acquires
the SRCU read lock. Inside this critical section, wait_for_fw() can sleep
for up to 20 seconds using msleep().

Could this uninterruptible sleep under SRCU prevent synchronize_srcu() from
completing during drm_dev_unplug(), causing a 20-second stall and leaving
user processes unkillable?

[ ... ]

> @@ -454,12 +532,44 @@ static enum xe_vsec get_platform_info(struct xe_dev=
ice *xe)

[ ... ]

> +static void cri_late_bind_probe(struct xe_device *xe)
> +{

[ ... ]

> +	info->priv_data =3D &xe_cri_pmt_cb;
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	intel_vsec_register(dev, info);
> +}
> +
> +static void vsec_disable_late_bind_work(void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +
> +	/*
> +	 * If was work was cancelled while it was still pending, we need to
> +	 * take care of releasing the runtime reference
> +	 */
> +	if (disable_delayed_work_sync(&xe->pmt.work))
> +		xe_pm_runtime_put(xe);
> +}

[Severity: High]
Can this sequence leak devres resources and cause a use-after-free?

When the driver unbinds, devres_release_all() detaches existing resources
to a local list and executes them. vsec_disable_late_bind_work() is
registered as a devm action and runs during this process.

If vsec_disable_late_bind_work() blocks in disable_delayed_work_sync() while
the work queue is actively executing cri_late_bind_probe(), the work thread
will call intel_vsec_register(), which allocates and attaches new devm
resources.

Since devres_release_all() only processes its detached list, will these
newly added devres nodes be added to the empty devres head, leaving them
behind to outlive the driver?

[ ... ]

> @@ -467,30 +577,44 @@ void xe_vsec_init(struct xe_device *xe)
>  {
>  	struct intel_vsec_platform_info *info;
>  	struct device *dev =3D xe->drm.dev;
>  	enum xe_vsec platform;
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

[Severity: High]
This is a pre-existing issue, but does this initialization path lack an
IS_SRIOV_VF() guard before accessing physical SOC controllers?

If xe_vsec_init() is called during Virtual Function (VF) initialization, it
proceeds to access the SOC remapper and register the VSEC PMT auxiliary
device.

Since these are PF-only hardware resources, will accessing them from a VF
context result in hardware faults or MMIO timeouts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824162317.2450=
380-12-michael.j.ruhl@intel.com?part=3D9
