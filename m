Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA450CC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 11:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9893F10F776;
	Tue, 13 Oct 2026 11:19:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3D910F77A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 11:19:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BF472403FC;
 Tue, 13 Oct 2026 11:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824EF1F000FF;
 Tue, 13 Oct 2026 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791890343;
 bh=fGwo524U3XuBdQorcuSJpvcCirymII0/C1GjA3FTeG4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Vc9Dh1Q7Tg2eP+54pFQcgMHWbvyPjlX9mQZlVmqrtVjNyV1wxrUwPNfV572x/ZwoC
 XeHAa+pLeqzDaKslc42I0RIznQGfI+mXjuHSGl4yfv7PSbP8L60kZsIbVYmclv5hCN
 sWFu4eKYael4lgSDQQu6z2wfyPEfRGam6LqfIIw0me4d2WgbVBYcCM9BEIkiRysa+E
 pCiClf6kONnWmA+YIo37MPqjvNoi1N9u0ICFD6IBehO+QlL7awysB5Zqa+uOXmn+A6
 4EEuPVXOaNzhtR1SQ9XsBwTwDRVWAx1U2a9tjn7ct987pztbgh4AW72T7KYien9FqQ
 K+VMoxcwBkpZw==
Message-ID: <sashiko-outbox-169604@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013110439.181447-2-raag.jadav@intel.com>
References: <20261013110439.181447-1-raag.jadav@intel.com>
 <20261013110439.181447-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:19:03 +0000
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
- [High] workqueue: self-deadlock in xe_gt_declare_wedged() when invoked fr=
om ordered_wq workers
- [High] xe: sleeping in atomic context via flush_work in xe_gt_declare_wed=
ged
- [High] drm/xe: missing memory barriers when publishing gt->initialized al=
lows workqueue corruption
--

commit f7181376c2cff07d590f539fd01106cc19cb1c8f
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/gt: Use GT ordered workqueue for wedging
   =20
This commit introduces a worker for GT-specific wedge handling and queues it
on the GT ordered workqueue to prevent disrupting the scheduler while jobs =
are
in-flight. It also introduces the for_each_initialized_gt() macro to avoid
races during probe sequences.

> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_devic=
e.h
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -139,6 +139,10 @@ static inline bool xe_device_uc_enabled(struct xe_de=
vice *xe)
>  	for_each_gt((gt__), (tile__)->xe, (id__)) \
>  		for_each_if((gt__)->tile =3D=3D (tile__))
> =20
> +#define for_each_initialized_gt(gt__, xe__, id__) \
> +	for_each_gt((gt__), (xe__), (id__)) \
> +		for_each_if(READ_ONCE((gt__)->initialized))

[Severity: High]
Does this missing acquire memory barrier allow workqueue corruption?

If a hardware error or AMC alert triggers device wedging on a different CPU
concurrently with xe_gt_init(), the for_each_initialized_gt() macro checks
this flag. However, READ_ONCE() does not emit memory barriers on all
architectures.=20

On weakly-ordered CPUs (like ARM64), a concurrent reader's speculative loads
could be hoisted before the gt->initialized check completes, causing
xe_gt_declare_wedged() to invoke queue_work() on an uninitialized workqueue=
 or
work struct.

Should this use smp_load_acquire() and smp_store_release() to guarantee
proper ordering?

> +
>  static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
>  {
>  	return &gt->pm.fw;

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c

[ ... ]

> @@ -769,6 +773,8 @@ int xe_gt_init(struct xe_gt *gt)
>  			return err;
>  	}
> =20
> +	/* Must be last */
> +	WRITE_ONCE(gt->initialized, true);

[Severity: High]
Similar to the read side, WRITE_ONCE() lacks a release memory barrier. The
CPU could reorder this store before the INIT_WORK(&gt->wedge.worker) store
earlier in xe_gt_init(). Replacing this with smp_store_release() would
ensure the GT state initialization is visible before the flag is published.

>  	return 0;
>  }

[ ... ]

> @@ -1200,6 +1214,6 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> =20
> -	xe_uc_declare_wedged(&gt->uc);
> -	xe_tlb_inval_reset(&gt->tlb_inval);
> +	queue_work(gt->ordered_wq, &gt->wedge.worker);
> +	flush_work(&gt->wedge.worker);

[Severity: High]
Can this flush_work() call create a self-deadlock?

If a worker thread already executing on gt->ordered_wq (such as
gt_reset_worker() upon a reset failure) invokes xe_device_declare_wedged(),
it will eventually call xe_gt_declare_wedged().

Since gt->ordered_wq has a concurrency level of 1, queue_work() will place
wedge.worker behind the currently executing worker. The executing worker
will then block in flush_work(), waiting for wedge.worker to complete,
resulting in an unresolvable circular dependency that hangs the workqueue.

[Severity: High]
Does this also introduce a sleeping in atomic context regression?

xe_device_declare_wedged() can be called from mert_handle_cat_error(), which
is executed by the xe_mert_irq_handler() in hardirq context (for example,
directly from dg1_irq_handler()).

The flush_work() function relies on might_sleep(). Calling a sleeping
function from an atomic hardirq context will cause a 'scheduling while
atomic' kernel panic.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013110439.1814=
47-1-raag.jadav@intel.com?part=3D1
