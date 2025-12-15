Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F326D41D74
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 11:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF6A10E11F;
	Mon, 15 Dec 2025 11:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGsG0bKN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BC910E11F
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 11:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765796462; x=1797332462;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8Den+hqrG1us2wbTjPZdY3F8ocjKNZ5ZoXzQwejlxGw=;
 b=iGsG0bKNoPf7CxK9wLwvfHCXdbT4p51ofFNGGiesRbshrZZ9pR6VE83k
 2+9WD7zE9B864vLo4zBJjMwPoY8u/of+T3iNWC+fGvmQh5UD4uN3bUdwF
 b9qOtekTM7ASNi1bWzuw7WrBpFgqNrkUnX4dLAx7yowy8KbNrONvu2LNC
 XqShaRtRDFFQxnjJfRg9JPQAVBZ0vg3FaJOwkzRhDpmVz9pr+g0xTH4Pn
 Q+k0tjdbaPGLtLqGO2Icc98Meq+2iaiXZDdM43hzTMILVYYJwuNAUlG9F
 GLX0djdONivfTm5HDg5am30jrU04UrMrXWPioASK1tQ/YBzIGHlur1CRs Q==;
X-CSE-ConnectionGUID: 76fK98eXSQ+Qz7lHpgiv/A==
X-CSE-MsgGUID: odRtJlQPTE2aPPqdxFpxEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="71324128"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="71324128"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:01:02 -0800
X-CSE-ConnectionGUID: grGyL/1TTtKLnv51UWXVPg==
X-CSE-MsgGUID: q8I8WB6JTUqMlb90ZbjYxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="197687701"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.109])
 ([10.245.244.109])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:01:01 -0800
Message-ID: <bd00ede0e055ce7247cf7ec1d5a3f71bee350424.camel@linux.intel.com>
Subject: Re: [PATCH v2 7/7] drm/xe: Add more GT stats around pagefault mode
 switch flows
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, michal.mrozek@intel.com
Date: Mon, 15 Dec 2025 12:00:58 +0100
In-Reply-To: <20251212182847.1683222-8-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
 <20251212182847.1683222-8-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 2025-12-12 at 10:28 -0800, Matthew Brost wrote:
> Add GT stats to measure the time spent switching between pagefault
> mode
> and dma-fence mode. Also add a GT stat to indicate when pagefault
> suspend is skipped because the system is idle. These metrics will
> help
> profile pagefault workloads while 3D and display are enabled.
>=20
> v2:
> =C2=A0- Use GT stats helper functions (Francois)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_gt_stats.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 ++++++
> =C2=A0drivers/gpu/drm/xe/xe_gt_stats_types.h=C2=A0 |=C2=A0 3 +++
> =C2=A0drivers/gpu/drm/xe/xe_hw_engine_group.c | 22 +++++++++++++++++++++-
> =C2=A03 files changed, 30 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c
> b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 714045ad9354..fb2904bd0abd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -68,8 +68,14 @@ static const char *const
> stat_description[__XE_GT_STATS_NUM_IDS] =3D {
> =C2=A0	DEF_STAT_STR(SVM_2M_BIND_US, "svm_2M_bind_us"),
> =C2=A0	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 "hw_engine_group_suspend_lr_queue_count"=
),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "hw_engine_group_skip_lr_queue_count"),
> =C2=A0	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 "hw_engine_group_wait_dma_queue_count"),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "hw_engine_group_suspend_lr_queue_us"),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "hw_engine_group_wait_dma_queue_us"),
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index aada5df421e5..b92d013091d5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -45,7 +45,10 @@ enum xe_gt_stats_id {
> =C2=A0	XE_GT_STATS_ID_SVM_64K_BIND_US,
> =C2=A0	XE_GT_STATS_ID_SVM_2M_BIND_US,
> =C2=A0	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT,
> =C2=A0	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> =C2=A0	/* must be the last entry */
> =C2=A0	__XE_GT_STATS_NUM_IDS,
> =C2=A0};
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 022fc0c30d38..9a53021bbfa7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -200,7 +200,9 @@ static int
> xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> =C2=A0{
> =C2=A0	int err;
> =C2=A0	struct xe_exec_queue *q;
> +	struct xe_gt *gt =3D NULL;
> =C2=A0	bool need_resume =3D false;
> +	ktime_t start =3D xe_gt_stats_ktime_get();
> =C2=A0
> =C2=A0	lockdep_assert_held_write(&group->mode_sem);
> =C2=A0
> @@ -215,10 +217,13 @@ static int
> xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> =C2=A0			return -EAGAIN;
> =C2=A0
> =C2=A0		xe_gt_stats_incr(q->gt,
> XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> -
> +		if (idle_skip_suspend)
> +			xe_gt_stats_incr(q->gt,
> +				=09
> XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT, 1);
> =C2=A0
> =C2=A0		need_resume |=3D !idle_skip_suspend;
> =C2=A0		q->ops->suspend(q);
> +		gt =3D q->gt;
> =C2=A0	}
> =C2=A0
> =C2=A0	list_for_each_entry(q, &group->exec_queue_list,
> hw_engine_group_link) {
> @@ -230,6 +235,12 @@ static int
> xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> =C2=A0			return err;
> =C2=A0	}
> =C2=A0
> +	if (gt) {
> +		xe_gt_stats_incr(gt,
> +			=09
> XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> +				 xe_gt_stats_ktime_us_delta(start));
> +	}
> +
> =C2=A0	if (need_resume)
> =C2=A0		xe_hw_engine_group_resume_faulting_lr_jobs(group);
> =C2=A0
> @@ -250,7 +261,9 @@ static int
> xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
> =C2=A0{
> =C2=A0	long timeout;
> =C2=A0	struct xe_exec_queue *q;
> +	struct xe_gt *gt =3D NULL;
> =C2=A0	struct dma_fence *fence;
> +	ktime_t start =3D xe_gt_stats_ktime_get();
> =C2=A0
> =C2=A0	lockdep_assert_held_write(&group->mode_sem);
> =C2=A0
> @@ -262,11 +275,18 @@ static int
> xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
> =C2=A0		fence =3D xe_exec_queue_last_fence_get_for_resume(q,
> q->vm);
> =C2=A0		timeout =3D dma_fence_wait(fence, false);
> =C2=A0		dma_fence_put(fence);
> +		gt =3D q->gt;
> =C2=A0
> =C2=A0		if (timeout < 0)
> =C2=A0			return -ETIME;
> =C2=A0	}
> =C2=A0
> +	if (gt) {
> +		xe_gt_stats_incr(gt,
> +			=09
> XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> +				 xe_gt_stats_ktime_us_delta(start));
> +	}
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0

