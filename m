Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC96BC4345F
	for <intel-xe@archiver.kernel.org>; Sat, 27 Apr 2024 07:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C34910F0EE;
	Sat, 27 Apr 2024 07:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zas3FbaZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D77810F0EE
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Apr 2024 07:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714203869; x=1745739869;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=4tx/dnPyRW3DMiEhSDphf7DpC3QL3uIyP/b/AlQmUqU=;
 b=Zas3FbaZDyp4iwydGv5OdUvZ0RAnbDAF4X7zQZWXCAmsuU1RT7Fw4dKF
 H6GtHhDTXukc9HF9FHN7CBnIF+Abz4gfKkPmRKVPUEqvy/3cCuIGec4gS
 XLUOrgUl4yOpSZbHqnAuvK2fkUVVU1JAbSG0G4QjU9akJVPH7htTYZzQ/
 wYiwVDm/knGT3tyXGyubfF/zlCOa/e7SLwzm88PHguaqtw3JGL7Qjp1xQ
 CKrkqTBqabakV4PM1xsfaWMM9pJyA+FtFWQ0B8vAjXonRDLrA31smVFR3
 ECLGPHnbea1an0FIYszLDxEGOsBIBa//230OIvy1vTTx18RR327b5OmOp g==;
X-CSE-ConnectionGUID: CoMzn8liSWy9GBgbSYSfEA==
X-CSE-MsgGUID: dJ5IRT1HTV+TTqS+JFKUmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10048720"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; d="scan'208";a="10048720"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2024 00:44:28 -0700
X-CSE-ConnectionGUID: /r2CFGmkSJq/X1UZhAbMEQ==
X-CSE-MsgGUID: bdACoAuWTKiT2XF/sXyEew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; d="scan'208";a="25606418"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 27 Apr 2024 00:44:26 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s0cjQ-0004l0-0f;
 Sat, 27 Apr 2024 07:44:24 +0000
Date: Sat, 27 Apr 2024 15:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>
Subject: [drm-xe:drm-xe-next 12/13]
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:321:15: warning: variable 'end'
 is uninitialized when used here
Message-ID: <202404271550.YdQqXkUF-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   98ad158e543426561fa5df5c4387d4368601866f
commit: c4f18703629dd0112641d6974eb295a53c4a4615 [12/13] drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use this
config: powerpc-randconfig-002-20240427 (https://download.01.org/0day-ci/archive/20240427/202404271550.YdQqXkUF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271550.YdQqXkUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271550.YdQqXkUF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:9:
   In file included from drivers/gpu/drm/xe/xe_device.h:12:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:321:15: warning: variable 'end' is uninitialized when used here [-Wuninitialized]
     321 |                 end = ALIGN(end, align);
         |                             ^~~
   include/linux/align.h:8:38: note: expanded from macro 'ALIGN'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                                 ^
   include/uapi/linux/const.h:31:51: note: expanded from macro '__ALIGN_KERNEL'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
         |                                                             ^
   include/uapi/linux/const.h:32:41: note: expanded from macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                            ^
   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:308:17: note: initialize the variable 'end' to silence this warning
     308 |                 u64 align, end;
         |                               ^
         |                                = 0
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +/end +321 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c

   264	
   265	/**
   266	 * xe_gt_tlb_invalidation_range - Issue a TLB invalidation on this GT for an
   267	 * address range
   268	 *
   269	 * @gt: graphics tile
   270	 * @fence: invalidation fence which will be signal on TLB invalidation
   271	 * completion, can be NULL
   272	 * @start: start address
   273	 * @end: end address
   274	 * @asid: address space id
   275	 *
   276	 * Issue a range based TLB invalidation if supported, if not fallback to a full
   277	 * TLB invalidation. Completion of TLB is asynchronous and caller can either use
   278	 * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait for
   279	 * completion.
   280	 *
   281	 * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
   282	 * negative error code on error.
   283	 */
   284	int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
   285					 struct xe_gt_tlb_invalidation_fence *fence,
   286					 u64 start, u64 end, u32 asid)
   287	{
   288		struct xe_device *xe = gt_to_xe(gt);
   289	#define MAX_TLB_INVALIDATION_LEN	7
   290		u32 action[MAX_TLB_INVALIDATION_LEN];
   291		int len = 0;
   292	
   293		/* Execlists not supported */
   294		if (gt_to_xe(gt)->info.force_execlist) {
   295			if (fence)
   296				__invalidation_fence_signal(fence);
   297	
   298			return 0;
   299		}
   300	
   301		action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
   302		action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
   303		if (!xe->info.has_range_tlb_invalidation) {
   304			action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
   305		} else {
   306			u64 orig_start = start;
   307			u64 length = end - start;
   308			u64 align, end;
   309	
   310			if (length < SZ_4K)
   311				length = SZ_4K;
   312	
   313			/*
   314			 * We need to invalidate a higher granularity if start address
   315			 * is not aligned to length. When start is not aligned with
   316			 * length we need to find the length large enough to create an
   317			 * address mask covering the required range.
   318			 */
   319			align = roundup_pow_of_two(length);
   320			start = ALIGN_DOWN(start, align);
 > 321			end = ALIGN(end, align);
   322			length = align;
   323			while (start + length < end) {
   324				length <<= 1;
   325				start = ALIGN_DOWN(orig_start, length);
   326			}
   327	
   328			/*
   329			 * Minimum invalidation size for a 2MB page that the hardware
   330			 * expects is 16MB
   331			 */
   332			if (length >= SZ_2M) {
   333				length = max_t(u64, SZ_16M, length);
   334				start = ALIGN_DOWN(orig_start, length);
   335			}
   336	
   337			xe_gt_assert(gt, length >= SZ_4K);
   338			xe_gt_assert(gt, is_power_of_2(length));
   339			xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
   340							    ilog2(SZ_2M) + 1)));
   341			xe_gt_assert(gt, IS_ALIGNED(start, length));
   342	
   343			action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
   344			action[len++] = asid;
   345			action[len++] = lower_32_bits(start);
   346			action[len++] = upper_32_bits(start);
   347			action[len++] = ilog2(length) - ilog2(SZ_4K);
   348		}
   349	
   350		xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
   351	
   352		return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
   353	}
   354	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
