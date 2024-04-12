Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067CAC04FF8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 14:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D49C10F68E;
	Fri, 12 Apr 2024 14:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YedtRTv1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3710110F693
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 14:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712932878; x=1744468878;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SlIhtFHKeOXRQZ586ncvoB+P+6sVLwd4R0/5Q6OW7Bw=;
 b=YedtRTv1d3jahO6aSj+IuZMe5eHMW7wNt2xonP6qs5wjGwyPIMdvgAGJ
 fDe8l15gkiz9bKQZ0kNiG0pSQdaCAbKq7dmwYl8kJRF29OUS/c6PtuR+W
 0OYmTejYBGRGas6SerARRPV65ZS4Uodtnhp7IW92y2PWltoSSZqswYjtn
 Aa8CbsS75YHFD3vC14/AlBQJDNWAfX43p7e+tm7FUov/V0FqnUraGtNP0
 67XKd+ETqSY2vzdAtHhx9v2fvOXKcz77EIBd9SRkzRxCLEp9Oa4VZNOGV
 UYRAxVQHcXikxI/IXzxJKAsxyP8lbc2+S5KACg/3+sCTK+taaxsT6yPOw w==;
X-CSE-ConnectionGUID: yfF8pXwiSiKmQSO3u27EeA==
X-CSE-MsgGUID: yzugfjKfRDqsl/OUMSPCpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="25905455"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25905455"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:41:17 -0700
X-CSE-ConnectionGUID: yO7PBOl9T62O081Gs5SbYA==
X-CSE-MsgGUID: y9L13k1JQySBZ/GA6OtyiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="26059763"
Received: from mohdaris-mobl1.gar.corp.intel.com (HELO localhost)
 ([10.252.61.65])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:41:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v3 2/7] drm/xe: Incase of action add failure, remove
 sysfs only once
In-Reply-To: <x3sy3ujfkzbusyjqfdrjwrg5zvoeog6wu6d74tkonyc6own6hr@sjd2byv6ajqr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-3-himal.prasad.ghimiray@intel.com>
 <x3sy3ujfkzbusyjqfdrjwrg5zvoeog6wu6d74tkonyc6own6hr@sjd2byv6ajqr>
Date: Fri, 12 Apr 2024 17:41:08 +0300
Message-ID: <87edba4pa3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 12 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Oh... nit on commit message "Incase" is not a proper word. Same on other
> places in this series. Please use "In case" when re-spinning this series.

Or just "remove sysfs only once on action add failure" or something.

>
> Lucas De Marchi
>
> On Fri, Apr 12, 2024 at 01:32:40PM +0530, Himal Prasad Ghimiray wrote:
>>The drmm_add_action_or_reset function automatically invokes the action
>>(sysfs removal) in the event of a failure; therefore, there's no
>>necessity to call it within the return check.
>>
>>Modify the return type of xe_gt_ccs_mode_sysfs_init to int, allowing the
>>caller to pass errors up the call chain. Should sysfs creation or
>>drmm_add_action_or_reset fail, error propagation will prompt a driver
>>load abort.
>>
>>Fixes: f3bc5bb4d53d ("drm/xe: Allow userspace to configure CCS mode")
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_gt.c          |  5 ++++-
>> drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 17 +++++++----------
>> drivers/gpu/drm/xe/xe_gt_ccs_mode.h |  2 +-
>> 3 files changed, 12 insertions(+), 12 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>index 2421a8d34324..dca0e9fb3315 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>@@ -379,7 +379,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>> 			 err);
>>
>> 	/* Initialize CCS mode sysfs after early initialization of HW engines */
>>-	xe_gt_ccs_mode_sysfs_init(gt);
>>+	err = xe_gt_ccs_mode_sysfs_init(gt);
>>+	if (err)
>>+		goto err_gt_sysfs_create;
>>
>> 	/*
>> 	 * Stash hardware-reported version.  Since this register does not exist
>>@@ -395,6 +397,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>
>> err_force_wake:
>> 	dump_pat_on_error(gt);
>>+err_gt_sysfs_create:
>> 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> err_hw_fence_irq:
>> 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>index 529fc286cd06..67a5bd71770d 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>@@ -167,25 +167,22 @@ static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
>>  * and it is expected that there are no open drm clients while doing so.
>>  * The number of available compute slices is exposed to user through a per-gt
>>  * 'num_cslices' sysfs interface.
>>+ *
>>+ * Returns: Returns error value for failure and 0 for success.
>>  */
>>-void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>>+int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>> {
>> 	struct xe_device *xe = gt_to_xe(gt);
>> 	int err;
>>
>> 	if (!xe_gt_ccs_mode_enabled(gt))
>>-		return;
>>+		return 0;
>>
>> 	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
>> 	if (err) {
>>-		drm_warn(&xe->drm, "Sysfs creation for ccs_mode failed err: %d\n", err);
>>-		return;
>>+		drm_err(&xe->drm, "Sysfs creation for ccs_mode failed err: %d\n", err);
>>+		return err;
>> 	}
>>
>>-	err = drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
>>-	if (err) {
>>-		sysfs_remove_files(gt->sysfs, gt_ccs_mode_attrs);
>>-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>>-			 __func__, err);
>>-	}
>>+	return drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
>> }
>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>index f39975aaaab0..f8779852cf0d 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>@@ -12,7 +12,7 @@
>> #include "xe_platform_types.h"
>>
>> void xe_gt_apply_ccs_mode(struct xe_gt *gt);
>>-void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
>>+int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
>>
>> static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>> {
>>-- 
>>2.25.1
>>

-- 
Jani Nikula, Intel
