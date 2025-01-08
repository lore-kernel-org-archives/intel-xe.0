Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D76E77199
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 03:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB2D10E7E8;
	Wed,  8 Jan 2025 03:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ptw616Rx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10E510E7E8
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 03:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736307333; x=1767843333;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3+3m8jZZQO8yCrOA6dP/07hT49fMivsTgiKpbMS7Hj4=;
 b=Ptw616Rx9tccquTJzFoE8ByNdtlA2yy0DBANS4JQf+rKXbeura2yizId
 B/R9DVjn8oCNnF0kyA1rh+dOGTKIiRscVlaSwaXgki6Kgp7hdaGE1/IG7
 v3ac07jM46GlJrGlGLDy0/4PAajR7GPBpUKbXH7MfgoNa4xIPP6v8agIc
 aaW7b3xnzYveyfLyZT6dYLi1FSXabOj9oHlQqxTLBHo4HpgCDnInyFSpv
 kEAxw8LVTs9jJEy/9vJZSx2G7jawikwGt49mVduLPqP0TboZNM50ajv3W
 LEQTlRkufbc6U0nukTg7xN0Q51GLXZOodZ86+2fg8xqvxRzYpSrtYpppN A==;
X-CSE-ConnectionGUID: R1ba/OjMQd+B4MG86xqVwA==
X-CSE-MsgGUID: QE3WKFITROSmJ8akFUY0iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="24121553"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="24121553"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 19:35:32 -0800
X-CSE-ConnectionGUID: RzlQXuLCRW6PLayJlSCY0A==
X-CSE-MsgGUID: MaHQ3UJoQIufRm9OTaYrYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="103180496"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.241])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 19:35:32 -0800
Date: Tue, 7 Jan 2025 21:35:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v10 2/4] drm/xe: Add locks in gtidle code
Message-ID: <tjfxmo42miv4gyyvn2wscuypdt6m7getxchpgnc6lpaoa7udvs@pstg65duy6wf>
References: <20241220011910.103280-1-vinay.belgaumkar@intel.com>
 <20241220011910.103280-3-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241220011910.103280-3-vinay.belgaumkar@intel.com>
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

On Thu, Dec 19, 2024 at 05:19:08PM -0800, Vinay Belgaumkar wrote:
>Another entry point is added so PMU code can call into the gtidle
>method for residency. Add locking so that parallel calls to this
>method from sysfs and PMU don't give inconsistent gtidle states
>for c6 residency.

The update of the residency is racy regardless of having another entry
point. If you said "another entrypoint is **going** to be added, making
the problem worse", then it'd be ok. I'd reword it into something like:

The update of the residency values need to be protected by a lock to
avoid multiple entrypoints, for example when multiple userspace clients
read the sysfs file. Other in-kernel clients are going to be added to
sample these values, making the problem worse.

>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_idle.c       | 23 ++++++++++++++++++++---
> drivers/gpu/drm/xe/xe_gt_idle.h       |  1 +
> drivers/gpu/drm/xe/xe_gt_idle_types.h |  3 +++
> 3 files changed, 24 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>index fd80afeef56a..1f32ac964abe 100644
>--- a/drivers/gpu/drm/xe/xe_gt_idle.c
>+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>@@ -69,6 +69,8 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
> {
> 	u64 delta, overflow_residency, prev_residency;
>
>+	lockdep_assert_held(&gtidle->lock);
>+
> 	overflow_residency = BIT_ULL(32);

it seems this overflow logic is a a little bit over-engineered.
If the counter overflows on u32, we could had just used u32 for the
math and get the wrap around for free.


with the updated commit message:

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
> 	/*
>@@ -273,8 +275,21 @@ static ssize_t idle_status_show(struct device *dev,
>
> 	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
> }
>-static DEVICE_ATTR_RO(idle_status);
>
>+u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle)
>+{
>+	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>+	u64 residency;
>+	unsigned long flags;
>+
>+	raw_spin_lock_irqsave(&gtidle->lock, flags);
>+	residency = get_residency_ms(gtidle, gtidle->idle_residency(pc));
>+	raw_spin_unlock_irqrestore(&gtidle->lock, flags);
>+
>+	return residency;
>+}
>+
>+static DEVICE_ATTR_RO(idle_status);
> static ssize_t idle_residency_ms_show(struct device *dev,
> 				      struct device_attribute *attr, char *buff)
> {
>@@ -283,10 +298,10 @@ static ssize_t idle_residency_ms_show(struct device *dev,
> 	u64 residency;
>
> 	xe_pm_runtime_get(pc_to_xe(pc));
>-	residency = gtidle->idle_residency(pc);
>+	residency = xe_gt_idle_residency_msec(gtidle);
> 	xe_pm_runtime_put(pc_to_xe(pc));
>
>-	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
>+	return sysfs_emit(buff, "%llu\n", residency);
> }
> static DEVICE_ATTR_RO(idle_residency_ms);
>
>@@ -329,6 +344,8 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
> 	if (!kobj)
> 		return -ENOMEM;
>
>+	raw_spin_lock_init(&gtidle->lock);
>+
> 	if (xe_gt_is_media_type(gt)) {
> 		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-mc", gt->info.id);
> 		gtidle->idle_residency = xe_guc_pc_mc6_residency;
>diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
>index 4455a6501cb0..591a01e181bc 100644
>--- a/drivers/gpu/drm/xe/xe_gt_idle.h
>+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>@@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
> void xe_gt_idle_enable_pg(struct xe_gt *gt);
> void xe_gt_idle_disable_pg(struct xe_gt *gt);
> int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>+u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
>
> #endif /* _XE_GT_IDLE_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>index b8b297a3f884..a3667c567f8a 100644
>--- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>@@ -6,6 +6,7 @@
> #ifndef _XE_GT_IDLE_SYSFS_TYPES_H_
> #define _XE_GT_IDLE_SYSFS_TYPES_H_
>
>+#include <linux/spinlock.h>
> #include <linux/types.h>
>
> struct xe_guc_pc;
>@@ -31,6 +32,8 @@ struct xe_gt_idle {
> 	u64 cur_residency;
> 	/** @prev_residency: previous residency counter */
> 	u64 prev_residency;
>+	/** @lock: Lock protecting idle residency counters */
>+	raw_spinlock_t lock;
> 	/** @idle_status: get the current idle state */
> 	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
> 	/** @idle_residency: get idle residency counter */
>-- 
>2.38.1
>
