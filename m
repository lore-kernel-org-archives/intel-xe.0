Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BA4C3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 09:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA69310E4DC;
	Tue,  9 Jul 2024 09:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOJ1EZjr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F6110E4DC
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720519039; x=1752055039;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=miXy5nXcTiPAc7r/7+0c8TPWhzHDBYRkCTQFq7Kl2Bk=;
 b=WOJ1EZjrz4o7RbDlQ1xI4HcWC2v9KYMC+yTzMHGhDA3wvxVDRTo+q7/5
 5GktBi5d4cq+WuYJrttuhlbU705Gff3q7FsYh+w1z0x+LfQDpXhguNrzl
 BNNtUgkLdQQvZcRc+Pj0YpfNY9UbEPGuNJ6l1UmoC/x429kGc0sXH47Cy
 9wcf8BVCaPazDvRqD+hVLL9bACUtplygsaRkhh4/iPi6ytqWQfoOq9dBt
 1thaN6Ce6QMeLjjCgL4aUL7733kT0Dar/TTI5TDl5XjGqURBxxA+nTNtk
 RcKBpRdXSwmcGTc3KaYZCMUYmCkfnZEij6bLcsc31RgGfNnVo4QJocdPR A==;
X-CSE-ConnectionGUID: BXDg2SmpSd+rrdVpADPL5Q==
X-CSE-MsgGUID: FQKU1LgZQPOQwClIjMCDEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="12449134"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="12449134"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 02:57:18 -0700
X-CSE-ConnectionGUID: Vgh48zqdSLG1o8BU68ENDg==
X-CSE-MsgGUID: cHtk6CdjS06Xw2MiNexMEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="48527296"
Received: from unknown (HELO [10.245.244.94]) ([10.245.244.94])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 02:57:17 -0700
Message-ID: <6aba8e53-55fd-4573-ad0c-e8c62ebe1297@intel.com>
Date: Tue, 9 Jul 2024 10:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Proper GT TLB invalidation layering and new
 coalescing feature.
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, farah.kassabri@intel.com, michal.wajdeczko@intel.com
References: <20240708040331.766264-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240708040331.766264-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 08/07/2024 05:03, Matthew Brost wrote:
> While debuging [1] an issue was identified in which if too many GT TLB
> invalidations are issued to the GuC, the GuC can get overwhelmed to the
> point scheduling of jobs starts to stall. To avoid this, hold and
> coalesce GT TLB invalidations in the KMD if a watermark of pending
> invalidations is past. Add gitlab for this issue has also been opened
> [2].
> 
> Layering issues with GT TLB invalidations are known [3] which needed to
> be fixed first before adding this new feature.
> 
> - Patches 1-8 fix the layering.
> - Patches 9-11 add coalescing feature.
> 
> We could merge these two as seperate series if needed.
> 
> CCing various stakeholders (Farah, Michal, Nirmoy) which have raised GT
> TLB invalidation issues in the past.

Maybe worth mentioning for [1], we try to process TLB invalidations 
directly from the irq, however we also only process the g2h queue 
in-order, so if there is something other than TLB invalidation or fault 
earlier in the queue then we do nothing useful from the irq and just 
return, that is until the wq can eventually process those earlier items 
that couldn't be processed directly from the irq. In the past I have 
seen TLB timeouts where the TLB invalidation is clearly in the g2h queue 
(and has been for a while), but is stuck behind something earlier in the 
queue that needs the wq, but system is under such a heavy load that the 
wq can't be scheduled in a timely manner.

> 
> v2:
>   - Fix CI issues
>   - Clean up some of the series / patch structure
> 
> Matt
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497
> [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162
> [3] https://patchwork.freedesktop.org/series/133001/
> 
> Matthew Brost (11):
>    drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
>    drm/xe: Drop xe_gt_tlb_invalidation_wait
>    drm/xe: s/tlb_invalidation.lock/tlb_invalidation.fence_lock
>    drm/xe: Add tlb_invalidation.seqno_lock
>    drm/xe: Add xe_gt_tlb_invalidation_done_handler
>    drm/xe: Add send tlb invalidation helpers
>    drm/xe: Add xe_guc_tlb_invalidation layer
>    drm/xe: Add multi-client support for GT TLB invalidations
>    drm/xe: Add GT TLB invalidation coalescing
>    drm/xe: Add GT TLB invalidation coalesce tracepoints
>    drm/xe: Add GT TLB invalidation watermark debugfs
> 
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   drivers/gpu/drm/xe/xe_debugfs.c               |  38 ++
>   drivers/gpu/drm/xe/xe_device.c                |   3 +
>   drivers/gpu/drm/xe/xe_device_types.h          |   5 +
>   drivers/gpu/drm/xe/xe_ggtt.c                  |  21 +-
>   drivers/gpu/drm/xe/xe_ggtt_types.h            |   5 +
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 641 ++++++++++++------
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 +-
>   .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  41 ++
>   drivers/gpu/drm/xe/xe_gt_types.h              |  43 +-
>   drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
>   drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  | 145 ++++
>   drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h  |  18 +
>   drivers/gpu/drm/xe/xe_pt.c                    |  33 +-
>   drivers/gpu/drm/xe/xe_trace.h                 |  10 +
>   drivers/gpu/drm/xe/xe_vm.c                    |  45 +-
>   drivers/gpu/drm/xe/xe_vm_types.h              |   3 +
>   17 files changed, 801 insertions(+), 279 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
> 
