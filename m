Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E455CC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 11:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D6E10E76D;
	Tue, 13 Oct 2026 11:16:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA91010E7A4
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 11:16:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E3AF6600D1;
 Tue, 13 Oct 2026 11:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795EE1F000FF;
 Tue, 13 Oct 2026 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791890185;
 bh=V8FQoe1a7EihQp4OjhefduERgBwl49j+LJg4kKggIcA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ZorzAajSFKrI81IlC6dYnXsePYpOEtsaVzrMr9g18Fvz0s8Uffb+Mm7AVz8PIkQAS
 8uCH4cdAHX1ctrKxXwplX6lwnnaTlSgkt7hhUvb1MWF+KRxngAOdI92VNKXvEgH9N/
 Q66Zze6TmA4VMsXqaO1yC9WStQiBuym5ToK6Kz0Frwp538FKRbmtb4tZJn8y3oEICV
 9MNU/qcnnTPoTmqTccm8Mfj843c8+mX8v88H3+/j+i0uYpyWfpd24GSAdlPKhS/K89
 uBX3VAer5aW527gneRIBQqz9iZ/We4OiCGLu9xr79HQHbFnWFnlabiA5SBuJLJuKNr
 O3qrzvyOH8aPA==
Message-ID: <sashiko-outbox-169599@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] drm/xe: Introduce xe_wedge
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013110439.181447-5-raag.jadav@intel.com>
References: <20261013110439.181447-1-raag.jadav@intel.com>
 <20261013110439.181447-5-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:16:25 +0000
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
- [High] workqueue: deadlock in xe_gt_wedge_declare via ordered_wq self-blo=
cking
- [High] locking: flush_work() called from hardirq context in xe_mert_irq_h=
andler
- [Low] build: incomplete enum xe_wedged_mode passed by value in header
--

commit ef60a972f78fff1500b565b78fe1b7a7fdd9918d
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe: Introduce xe_wedge

Consolidate wedging implementation into a dedicated xe_wedge component
for better maintainability. While at it, rename all wedge helpers
to match with component name.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 775c826b68b42..ba10434763381 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
[ ... ]
> @@ -986,7 +993,7 @@ static void gt_reset_worker(struct work_struct *w)
> =20
>  err_fail:
>  	xe_log_err_fatal(gt, GT, err, "reset failed\n");
> -	xe_device_declare_wedged(gt_to_xe(gt));
> +	xe_wedge_declare(gt_to_xe(gt), DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RE=
COVERY_BUS_RESET);

[Severity: High]
Can this sequence cause a deadlock? The gt_reset_worker is already executing
on the gt->ordered_wq workqueue. Calling xe_wedge_declare() eventually calls
xe_gt_wedge_declare() which queues gt->wedge.worker to the same ordered_wq
and then calls flush_work(). If the ordered workqueue has max_active=3D1, w=
on't
it block permanently waiting for the newly queued item? A similar situation
exists in vf_post_migration_recovery().

>  err_pm_put:
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  }
[ ... ]
> @@ -1190,16 +1205,16 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct x=
e_gt *gt)
>  }
> =20
>  /**
> - * xe_gt_declare_wedged() - Declare GT wedged
> + * xe_gt_wedge_declare() - Declare GT wedged
>   * @gt: the GT object
>   *
>   * Wedge the GT which stops all submission, saves desired debug state, a=
nd
>   * cleans up anything which could timeout.
>   */
> -void xe_gt_declare_wedged(struct xe_gt *gt)
> +void xe_gt_wedge_declare(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> =20
> -	xe_uc_declare_wedged(&gt->uc);
> -	xe_tlb_inval_reset(&gt->tlb_inval);
> +	queue_work(gt->ordered_wq, &gt->wedge.worker);
> +	flush_work(&gt->wedge.worker);

[Severity: High]
Does this flush_work() execute in hardirq context? The function
xe_mert_irq_handler() in xe_mert.c runs in hardirq context and calls
mert_handle_cat_error(), which calls xe_wedge_declare(), ultimately leading
here. Calling a sleeping function from atomic context will cause issues.

>  }
> diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> new file mode 100644
> index 0000000000000..5fda8ce015d49
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_WEDGE_H_
> +#define _XE_WEDGE_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +enum xe_wedged_mode;
> +
> +bool xe_wedged(struct xe_device *xe);
> +void xe_wedge_declare(struct xe_device *xe, unsigned long method);
> +int xe_wedge_init(struct xe_device *xe);
> +int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);

[Severity: Low]
Is this prototype valid according to the C standard? The incomplete enum
xe_wedged_mode is being passed by value. Including xe_wedge_types.h directly
should resolve this build issue.

> +
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013110439.1814=
47-1-raag.jadav@intel.com?part=3D4
