Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695D0C48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F7810E30B;
	Thu, 22 Feb 2024 16:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nboL66kT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A1A10E30B
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708620984; x=1740156984;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=yEvarWs62jKAc9L4yLYxhejgXYweI15xkqK4n9+Qa90=;
 b=nboL66kTxmcDkk0C0KPIB8kecZr/WBaHOYFl6u1Q6BS5HlSYw+EeJHNa
 60bhh/JZrl2p9yyJOo5bNMh4sF+aFkokWQJBRyo0VvXe77z33PPkfwBsk
 nIG4RIOlG/oSEBOeLq9KQczO+K9q0a12rtJkgRdqoIaoIj81kc5sKo4Af
 +WjNMDaGqy0qNbdXuJFkmEowXdOOq6tfuiKlsFar2BuK5H4PsXqClwpoV
 IPx/aVrlp1/MFSLMhF71QKeMZxhjQE/MIMciq7oGmC2uoi5I+svDo3dwT
 cmXB6/CHoNhu/TjuaWjv4ErqZb7XbKnjIqNvcB8xlYyABuIjqkU7M9FR6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="5813034"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5813034"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="936874037"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="936874037"
Received: from mhaehnex-mobl1.ger.corp.intel.com (HELO [10.252.2.135])
 ([10.252.2.135])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:56:22 -0800
Message-ID: <56f79509-bb0e-493e-899b-e0df12e46f7d@intel.com>
Date: Thu, 22 Feb 2024 16:56:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] drm/xe: Convert kunit tests from mem_access to
 xe_pm_runtime
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
 <20240222163937.138342-4-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240222163937.138342-4-rodrigo.vivi@intel.com>
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

On 22/02/2024 16:39, Rodrigo Vivi wrote:
> Let's convert the kunit tests that are currently relying on
> xe_device_mem_access_{get,put} towards the direct xe_pm_runtime_{get,put}.
> While doing this we need to move the get/put calls towards the outer
> bounds of the tests to ensure consistency with the other usages of
> pm_runtime on the regular paths.
> 
> v2: include xe_pm.h in tests/xe_mocs.c and sort the include block
>      while at it.
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

r-b still stands on v2.

> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c      |  8 ++++----
>   drivers/gpu/drm/xe/tests/xe_migrate.c |  7 +++++--
>   drivers/gpu/drm/xe/tests/xe_mocs.c    | 19 +++++++++++++------
>   3 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 3436fd9cf2b2..0926a1c2eb86 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -163,7 +163,7 @@ static int ccs_test_run_device(struct xe_device *xe)
>   		return 0;
>   	}
>   
> -	xe_device_mem_access_get(xe);
> +	xe_pm_runtime_get(xe);
>   
>   	for_each_tile(tile, xe, id) {
>   		/* For igfx run only for primary tile */
> @@ -172,7 +172,7 @@ static int ccs_test_run_device(struct xe_device *xe)
>   		ccs_test_run_tile(xe, tile, test);
>   	}
>   
> -	xe_device_mem_access_put(xe);
> +	xe_pm_runtime_put(xe);
>   
>   	return 0;
>   }
> @@ -335,12 +335,12 @@ static int evict_test_run_device(struct xe_device *xe)
>   		return 0;
>   	}
>   
> -	xe_device_mem_access_get(xe);
> +	xe_pm_runtime_get(xe);
>   
>   	for_each_tile(tile, xe, id)
>   		evict_test_run_tile(xe, tile, test);
>   
> -	xe_device_mem_access_put(xe);
> +	xe_pm_runtime_put(xe);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index a6523df0f1d3..ce531498f57f 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -10,6 +10,7 @@
>   #include "tests/xe_pci_test.h"
>   
>   #include "xe_pci.h"
> +#include "xe_pm.h"
>   
>   static bool sanity_fence_failed(struct xe_device *xe, struct dma_fence *fence,
>   				const char *str, struct kunit *test)
> @@ -423,17 +424,19 @@ static int migrate_test_run_device(struct xe_device *xe)
>   	struct xe_tile *tile;
>   	int id;
>   
> +	xe_pm_runtime_get(xe);
> +
>   	for_each_tile(tile, xe, id) {
>   		struct xe_migrate *m = tile->migrate;
>   
>   		kunit_info(test, "Testing tile id %d.\n", id);
>   		xe_vm_lock(m->q->vm, true);
> -		xe_device_mem_access_get(xe);
>   		xe_migrate_sanity_test(m, test);
> -		xe_device_mem_access_put(xe);
>   		xe_vm_unlock(m->q->vm);
>   	}
>   
> +	xe_pm_runtime_put(xe);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index df5c36b70ab4..df0cbb2ddcb5 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -10,10 +10,11 @@
>   #include "tests/xe_pci_test.h"
>   #include "tests/xe_test.h"
>   
> -#include "xe_pci.h"
> +#include "xe_device.h"
>   #include "xe_gt.h"
>   #include "xe_mocs.h"
> -#include "xe_device.h"
> +#include "xe_pci.h"
> +#include "xe_pm.h"
>   
>   struct live_mocs {
>   	struct xe_mocs_info table;
> @@ -45,7 +46,6 @@ static void read_l3cc_table(struct xe_gt *gt,
>   
>   	struct kunit *test = xe_cur_kunit();
>   
> -	xe_device_mem_access_get(gt_to_xe(gt));
>   	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
>   	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
> @@ -65,7 +65,6 @@ static void read_l3cc_table(struct xe_gt *gt,
>   				   XELP_LNCFCMOCS(i).addr);
>   	}
>   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>   }
>   
>   static void read_mocs_table(struct xe_gt *gt,
> @@ -80,7 +79,6 @@ static void read_mocs_table(struct xe_gt *gt,
>   
>   	struct kunit *test = xe_cur_kunit();
>   
> -	xe_device_mem_access_get(gt_to_xe(gt));
>   	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
>   	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
> @@ -100,7 +98,6 @@ static void read_mocs_table(struct xe_gt *gt,
>   				   XELP_GLOBAL_MOCS(i).addr);
>   	}
>   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>   }
>   
>   static int mocs_kernel_test_run_device(struct xe_device *xe)
> @@ -113,6 +110,8 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
>   	unsigned int flags;
>   	int id;
>   
> +	xe_pm_runtime_get(xe);
> +
>   	for_each_gt(gt, xe, id) {
>   		flags = live_mocs_init(&mocs, gt);
>   		if (flags & HAS_GLOBAL_MOCS)
> @@ -120,6 +119,9 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
>   		if (flags & HAS_LNCF_MOCS)
>   			read_l3cc_table(gt, &mocs.table);
>   	}
> +
> +	xe_pm_runtime_put(xe);
> +
>   	return 0;
>   }
>   
> @@ -139,6 +141,8 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
>   	int id;
>   	struct kunit *test = xe_cur_kunit();
>   
> +	xe_pm_runtime_get(xe);
> +
>   	for_each_gt(gt, xe, id) {
>   		flags = live_mocs_init(&mocs, gt);
>   		kunit_info(test, "mocs_reset_test before reset\n");
> @@ -156,6 +160,9 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
>   		if (flags & HAS_LNCF_MOCS)
>   			read_l3cc_table(gt, &mocs.table);
>   	}
> +
> +	xe_pm_runtime_put(xe);
> +
>   	return 0;
>   }
>   
