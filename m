Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021D9C5CFEB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CB010F142;
	Wed, 12 Aug 2026 22:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bf6p+Maw";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F66F10F0F8
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:54:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 529EF400B2;
 Wed, 12 Aug 2026 19:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EE31F000E9;
 Wed, 12 Aug 2026 19:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786564461;
 bh=mUA84Ap8okIe0+vynR3Fp6dEDT6we2i7rg7BUwX68ZM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Bf6p+Mawi+T6wDtzI3wTnDVo/B9HMjM0lxjkw9qmD+ryj2qGEaveF3uQMGUtJUpEF
 GmuB1r4G8fIyS//Im63mSqZg1E7mFi/s4Qx7w9CzjyDq9nGh//4AFaY9gpl/ggtF2G
 0E7wjX8T6k56Wfo1XX7fDhFuphhxRUD7OztJGofZ+uWJt1/n0Z3SLGMTo0CU5Bjx7q
 ygEc70xALM+w6PSQjjmvVDqtqQsOr8yAR3NlUxBCYiWJON64baAld4w/dCCAzwfhFM
 oT56TKy0ca0ZNK36b+DBqDGZufNtJzGJRagC0Dsv9/HY6/PljF6DexqUEPEhXXEFs2
 LCSCwQKT5eKgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/10] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812193742.2170188-21-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-21-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:54:20 +0000
Message-Id: <20260812195421.15EE31F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 22:17:09 +0000
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Double `xe_pm_runtime_put(xe)` in the success path of `xe_pmt_writ=
e_reg`.
- [High] The late bind delayed work is cancelled via a `devm` action, causi=
ng a race during teardown that registers child devices on a deleted parent.
- [Medium] Using asynchronous `xe_pm_runtime_put()` during device teardown =
can leave hardware active indefinitely.
- [Medium] `wait_for_fw` places the calling process in uninterruptible slee=
p (`D` state) for up to 20 seconds.
--

--- Patch [9]: [PATCH v2 09/10] drm/xe/vsec: Support late bind fw informati=
on ---
commit 5901be98f83d9c07e1385a372c7e330c405c0188
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

CRI FW is loaded on power on.  Because of this, access to
the FW cannot be done until it is running.

Update the XE PMT probe and access to check for late bind
devices, verify, and wait for the appropriate FW state
before probe or access.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
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

[Severity: Medium]
Does this msleep() place the calling process in an uninterruptible sleep
for up to 20 seconds?

If the firmware is unresponsive, userspace processes reading or writing the
PMT sysfs interface might become unkillable and hang while calling
xe_pmt_telem_read(), xe_pmt_read_reg(), or xe_pmt_write_reg().

[ ... ]
> @@ -416,6 +488,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 =
guid, u32 reg, u32 offset)
>  	disc_addr +=3D CRI_DISCOVERY_OFFSET + inst + offset;
> =20
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret =3D -ENODATA;
> +		goto runtime_exit;
> +	}
>  	mutex_lock(&xe->pmt.lock);
> =20
>  	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> @@ -425,6 +501,9 @@ static int xe_pmt_write_reg(struct device *dev, u32 g=
uid, u32 reg, u32 offset)
>  	mutex_unlock(&xe->pmt.lock);
>  	xe_pm_runtime_put(xe);
> =20
> +runtime_exit:
> +	xe_pm_runtime_put(xe);
> +
>  dev_exit:
>  	drm_dev_exit(idx);

[Severity: High]
Will the success path fall through here and execute the newly added
runtime_exit cleanup path?

It appears that if wait_for_fw() succeeds, the function calls
xe_pm_runtime_put() once right after mutex_unlock(), and then immediately
falls through to the runtime_exit label, resulting in two sequential
xe_pm_runtime_put() calls.=20

This could drop the PM usage counter below its baseline, potentially
powering off the device prematurely while it is still in use.

[ ... ]
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

[Severity: Medium]
Should this use a synchronous put instead of an asynchronous one?

Using an asynchronous xe_pm_runtime_put() during device teardown can leave
the hardware active indefinitely. The pending async idle/suspend work can
be cancelled by pm_runtime_disable() during the device removal path.

[Severity: High]
Can this devm action race with cri_late_bind_probe_work() during teardown?

If the device is unbound during the 20-second firmware initialization
window, the driver core removes all children via device_del() before
starting devres release. The disable_delayed_work_sync() here blocks until
the work completes.

Concurrently, if cri_late_bind_probe_work() executes:

static void cri_late_bind_probe_work(struct work_struct *work)
{
	...
	if (xe_is_oobmsm_fw_ready(xe)) {
		cri_late_bind_probe(xe);
		...

It could proceed to call intel_vsec_register().

Would this register a child device on a parent that has already been
deleted, causing devres list corruption or a sysfs use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812193742.2170=
188-12-michael.j.ruhl@intel.com?part=3D9
