Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86416CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 10:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5210F10E736;
	Wed, 22 Oct 2025 10:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZArs+6D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C798C10E736
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 10:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761127711; x=1792663711;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Nx3Jz8xeOXY1xMDtylLX01+++8eph4IkeO3hdE7s7Vo=;
 b=GZArs+6DDQjScoXQQ9IcqXz1O5SJb1bVr3BkvQx18utXaJZPev6GPeoD
 G1yefd1VbTeYUOcI526PwvqxGEMYgIFe3M5efhxvHu2kPAq2zRFVQE9gO
 PEGxZUikHavkNUGjSoy4qR9OIWTHMV1BmzZZ2DDMcie7BPAhuHcwz4uAn
 rZmGITlbl+ybFzaI8IQFfneGfYDlXS8AzeHgRxd9Qta+QYwS6jLVyt3QH
 NHkjY2g3xTzVkl40sHqFyzjb5XmDPwiGAFy6BfOndKTHeKLZmtdT/OZPc
 vD0aQw3UwLJEnvQM67qec2UCY/MGWKrqc6pm+bH2MvpQ8YiBxYdIo6xd1 g==;
X-CSE-ConnectionGUID: 5cFtNrTHSb2zVQgmQqEWsA==
X-CSE-MsgGUID: D6q5nSncR1SDs4W7CqCMAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66911435"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="66911435"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:08:30 -0700
X-CSE-ConnectionGUID: p2k7OdgbQiS8E8b7Efzmrg==
X-CSE-MsgGUID: bsrXsJ6ASJKzpHUd/n2IdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="187871632"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.63])
 ([10.245.244.63])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:08:31 -0700
Message-ID: <9b2419c8-efd0-41fc-98e4-f4324ac423f4@intel.com>
Date: Wed, 22 Oct 2025 11:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Avoid PM wake reference during VF migration
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20251022005538.828980-1-matthew.brost@intel.com>
 <20251022005538.828980-4-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251022005538.828980-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 22/10/2025 01:55, Matthew Brost wrote:
> Virtual Functions (VFs) do not use runtime PM. Avoid taking PM
> references during VF migration, as lockdep may get confused—VF migration
> occurs in the reclaim path, and waking a PM reference can trigger memory
> allocation warnings.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 46518e629ba3..d0b102ab6ce8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -31,7 +31,6 @@
>   #include "xe_lrc.h"
>   #include "xe_memirq.h"
>   #include "xe_mmio.h"
> -#include "xe_pm.h"
>   #include "xe_sriov.h"
>   #include "xe_sriov_vf.h"
>   #include "xe_sriov_vf_ccs.h"
> @@ -1218,7 +1217,6 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>   
>   	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>   
> -	xe_pm_runtime_get(xe);
>   	retry = vf_post_migration_shutdown(gt);
>   	if (retry)
>   		goto queue;
> @@ -1241,12 +1239,10 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>   
>   	vf_post_migration_kickstart(gt);
>   
> -	xe_pm_runtime_put(xe);
>   	xe_gt_sriov_notice(gt, "migration recovery ended\n");
>   	return;
>   fail:
>   	vf_post_migration_abort(gt);
> -	xe_pm_runtime_put(xe);
>   	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
>   	xe_device_declare_wedged(xe);
>   	return;
> @@ -1254,7 +1250,6 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>   queue:
>   	xe_gt_sriov_info(gt, "Re-queuing migration recovery\n");
>   	queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
> -	xe_pm_runtime_put(xe);
>   }
>   
>   static void migration_worker_func(struct work_struct *w)

