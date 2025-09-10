Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F06CCA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 23:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FB010E9EA;
	Wed, 10 Sep 2025 23:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEhs8O5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF0910E9EA
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 23:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757546178; x=1789082178;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=9aOxjr11JbWeRsCcuR3pvqpQ2x8opRYC+Cx28BGCnS8=;
 b=cEhs8O5Av11BKkCXkKy7Ctv7pJ4fdFo89snS2fsn3yIJlvCYqZaC55Mr
 S9SEs+GfF5o6WTbFJlXmXDYdcBs4Ep9B7YLAy96d1dpJ1O/9GbIAlJQaV
 OhJRkPOkKZFNd6a82FIeIfyM1zxBh4tLb6MM1MslReuQ+8SXU6n9fnY+n
 Gdu2/tTEDdJGKdiOf59v7xT2jdwZqvMCYyMeIP9D1JzsnY+qIWeDIIuIG
 7oypbOw+2qqAuvj0j0IF6B4gJnV8Y/yblr4LGXajYU2gMA7/1OwKeO22i
 YvQtIvQLZqlBk2AKcdjj+xrG2xtO3R69YCBkRMJoMuCbaXW2ki34kz7Ey g==;
X-CSE-ConnectionGUID: aXEQfq24QLWJYb5fUU4v4w==
X-CSE-MsgGUID: dCVWNfyhTtqiLrDfrsQ5+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63699083"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63699083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 16:16:17 -0700
X-CSE-ConnectionGUID: eDasrrH0RdSrYgdw1txesg==
X-CSE-MsgGUID: iitMak+ISfKDFegrY6t8NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="173429375"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2025 16:16:15 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uwU2v-0006Lx-0k;
 Wed, 10 Sep 2025 23:16:13 +0000
Date: Thu, 11 Sep 2025 07:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: [drm-xe:drm-xe-next 12/13]
 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h:46:9: warning:
 variable 'err' is uninitialized when used here
Message-ID: <202509110707.feCc83AG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   844150c255c94230aec41f88db8e2875cb97439e
commit: 1f1541720f651727591411e68c16299de0447b43 [12/13] drm/xe: Rework instances of variants of xe_bo_create_locked()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250911/202509110707.feCc83AG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110707.feCc83AG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110707.feCc83AG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_fbc.c:47:
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h:46:9: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
      46 |         return err;
         |                ^~~
   drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h:25:9: note: initialize the variable 'err' to silence this warning
      25 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +/err +46 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h

c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  18  
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  19  static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  20  						       struct i915_stolen_fb *fb,
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  21  						       u32 size, u32 align,
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  22  						       u32 start, u32 end)
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  23  {
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  24  	struct xe_bo *bo;
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  25  	int err;
62742d12663145 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Lucas De Marchi     2024-03-22  26  	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  27  
48b1f11c95e8c9 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Matthew Auld        2024-04-12  28  	if (start < SZ_4K)
48b1f11c95e8c9 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Matthew Auld        2024-04-12  29  		start = SZ_4K;
48b1f11c95e8c9 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Matthew Auld        2024-04-12  30  
48b1f11c95e8c9 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Matthew Auld        2024-04-12  31  	if (align) {
8ea8c918e7dbd5 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Vinod Govindapillai 2024-01-12  32  		size = ALIGN(size, align);
48b1f11c95e8c9 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Matthew Auld        2024-04-12  33  		start = ALIGN(start, align);
48b1f11c95e8c9 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Matthew Auld        2024-04-12  34  	}
8ea8c918e7dbd5 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Vinod Govindapillai 2024-01-12  35  
1f1541720f6517 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h Thomas Hellström    2025-09-08  36  	bo = xe_bo_create_pin_range_novm(xe, xe_device_get_root_tile(xe),
1f1541720f6517 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h Thomas Hellström    2025-09-08  37  					 size, start, end, ttm_bo_type_kernel, flags);
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  38  	if (IS_ERR(bo)) {
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  39  		err = PTR_ERR(bo);
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  40  		bo = NULL;
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  41  		return err;
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  42  	}
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  43  
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  44  	fb->bo = bo;
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  45  
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13 @46  	return err;
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  47  }
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  48  

:::::: The code at line 46 was first introduced by commit
:::::: c5a2eadd729ba3538f77ea2e055ca1f2efe82092 drm/xe/display: Xe stolen memory handling for fbc support

:::::: TO: Jouni Högander <jouni.hogander@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
