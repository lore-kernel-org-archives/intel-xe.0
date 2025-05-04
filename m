Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60378C3ABAC
	for <intel-xe@archiver.kernel.org>; Sun,  4 May 2025 04:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16EB10E232;
	Sun,  4 May 2025 04:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbjG42ui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644A710E232
 for <intel-xe@lists.freedesktop.org>; Sun,  4 May 2025 04:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746334786; x=1777870786;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SRKI2IbAZR6ZkXCObWhCZp2YP+27WcDlZKsceAwpFbs=;
 b=KbjG42uiATyvYx/Zl50Y/st86HtdkFXyRj3k1yywG4orzzMWXmZLDvCr
 0b46aJxkVYY+GlFRlAlI6Z7YeE2Z5uf0XKbgw5Wvp11CZuUE4wGd14ZkL
 UMQiBcydAB5VQ7xqJ7XFOOkE9vRaSmGCtjp4lTyfV7ZrbTltRSVIO+bUW
 u5QO9oAzrbJTNwLtyLjsnNZIUq6rKdIIWb3u6LOXGBkIraIjzd+0dVNXG
 0onRwOjm73g/2Y0GCNlNt9D+vHXjvLlosjrRRNYRYLaMKh8EqldkRfDwo
 9uOgXP2mdeDynYgm4VcRIjqEBHqy+5TpHIDwjlVOgelUK2+l9Gh9mk4o7 w==;
X-CSE-ConnectionGUID: 6HnD+7DKTt+Y8WjLRM+OhQ==
X-CSE-MsgGUID: X4VuZUYNQW+vC4RcyD8gIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11422"; a="35586337"
X-IronPort-AV: E=Sophos;i="6.15,261,1739865600"; d="scan'208";a="35586337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2025 21:59:37 -0700
X-CSE-ConnectionGUID: FHKsK1vuQMC3AfchBmezCg==
X-CSE-MsgGUID: FDeu9kknSM+mdgEL6/l+Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,261,1739865600"; d="scan'208";a="140124610"
Received: from intelmailrelay-02.habana-labs.com ([10.111.11.21])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2025 21:59:34 -0700
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 SMTP id 5444xPjO2402506; Sun, 4 May 2025 07:59:25 +0300
Date: Sun, 4 May 2025 07:59:25 +0300
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com
Subject: Re: [PATCH] drm/xe: Fix page fault queue calculation
Message-ID: <rxxppw5ey5ynialzv6b4v6ro2hshy5qoggmjyyjiorgu64oyo2@bn4zn2rowzc7>
References: <20250501183220.72097-1-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250501183220.72097-1-stuart.summers@intel.com>
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

On 01.05.2025 18:32, Stuart Summers wrote:
>We followed up with the design architects to have a more
>precise calculation for a theoretical maximum number of
>page faults we might expect based on the number of TLBs
>available in the system. Fix the original calculation which
>did not take the number of TLBs into consideration.
>
>Fixes: 29582e0ea75c ("drm/xe: Add page queue multiplier")
>Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
>
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_pagefault.c | 17 +++++++++++------
> 1 file changed, 11 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>index 10622ca471a2..80a816c3837b 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -436,15 +436,20 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
> 				XE_MAX_EU_FUSE_BITS) * num_dss;
>
> 	/*
>-	 * user can issue separate page faults per EU and per CS
>+	 * Each TLB can report up to 32 faults. The number of TLBs is
>+	 * equal to the number of render/compute/media engines plus twice
>+	 * the number of copy engines plus the number of EUs.
> 	 *
>-	 * XXX: Multiplier required as compute UMD are getting PF queue errors
>-	 * without it. Follow on why this multiplier is required.
>+	 * Reserve enough space here to ensure we are able to cover that
>+	 * theoretical maximum.
> 	 */
>-#define PF_MULTIPLIER	8
>+#define MAX_FAULTS_PER_TLB	32
> 	pf_queue->num_dw =
>-		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW * PF_MULTIPLIER;
>-#undef PF_MULTIPLIER
>+		PF_MSG_LEN_DW * MAX_FAULTS_PER_TLB *
>+		(num_eus +
>+		 hweight64(gt->info.engine_mask) +
>+		 hweight32(xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY)));
>+#undef MAX_FAULTS_PER_TLB

the queue uses the circ-buffer API which assumes buffer size is a power of 2.
can we be sure that num_dw is a power of 2?

Thanks,
Dafna

>
> 	pf_queue->gt = gt;
> 	pf_queue->data = devm_kcalloc(xe->drm.dev, pf_queue->num_dw,
>-- 
>2.34.1
>
