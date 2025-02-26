Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F98C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 07:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8481A10E85F;
	Wed, 26 Feb 2025 07:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQG7jGIx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F6810E85F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 07:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740553767; x=1772089767;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=0t/VHvTaENqdaoXyMWFzFbMvRVQK6C11s5BhgblsC8E=;
 b=iQG7jGIxSPt+z6gBXx2Yokimb+EZoHKp6wlmcowPsQ5NQUONDPDTSeJ1
 RKvMNfXcGcilKKeW32E5FjJ2WaG0JuTZhQBZTBPBwGqcFF/UXasKq5gA6
 LG24s0Wu4I0DNSbw6yA0BB7mf2KxMoo2SmIM0e4k5s631KBDfweJt4oqu
 C558h7D2VVCKfvriEvbpu8vYKagMgUkrFGXO0EazRPTO/XPahjrOVYgpR
 F8TncgrXGs/nvMSNVD8XiUQeFmxIM/DjTf733jqF3bH5L+YYrwb7JKH4q
 eD//S2LSjKzfyphv+BT3zNGY8BoOt30LWYKOq9G4zeNSJ4jG0AL7GPPfh Q==;
X-CSE-ConnectionGUID: pTN7xeHzSQWqcFHaj3ULyQ==
X-CSE-MsgGUID: YmwLroJnQl+g+ErPuHYudg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41585531"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41585531"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 23:09:26 -0800
X-CSE-ConnectionGUID: ty8LNsuyQEuOApOgnt/BRg==
X-CSE-MsgGUID: w38hqABUQ42tKCC6XOchJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117106044"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa010.fm.intel.com with ESMTP; 25 Feb 2025 23:09:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tnBXJ-000BJN-0A;
 Wed, 26 Feb 2025 07:09:01 +0000
Date: Wed, 26 Feb 2025 15:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [drm-xe:drm-xe-next 9/11] drivers/gpu/drm/xe/xe_heci_gsc.c:190:9:
 warning: variable 'def' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202502261421.aNNUqfV9-lkp@intel.com>
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
head:   6b68c4542ffecc36087a9e14db8fc990c88bb01b
commit: 292b1a8a50545b47d4fafc54452147abd2d1d86c [9/11] drm/xe: Stop ignoring errors from xe_heci_gsc_init()
config: powerpc64-randconfig-001-20250226 (https://download.01.org/0day-ci/archive/20250226/202502261421.aNNUqfV9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261421.aNNUqfV9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261421.aNNUqfV9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_heci_gsc.c:190:9: warning: variable 'def' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     190 |         } else if (xe->info.platform == XE_DG1) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:30: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_heci_gsc.c:194:7: note: uninitialized use occurs here
     194 |         if (!def || !def->name) {
         |              ^~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/gpu/drm/xe/xe_heci_gsc.c:190:9: note: remove the 'if' if its condition is always true
     190 |         } else if (xe->info.platform == XE_DG1) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:23: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^
   drivers/gpu/drm/xe/xe_heci_gsc.c:176:32: note: initialize the variable 'def' to silence this warning
     176 |         const struct heci_gsc_def *def;
         |                                       ^
         |                                        = NULL
   1 warning generated.


vim +190 drivers/gpu/drm/xe/xe_heci_gsc.c

87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  172  
292b1a8a50545b Lucas De Marchi   2025-02-21  173  int xe_heci_gsc_init(struct xe_device *xe)
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  174  {
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  175  	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  176  	const struct heci_gsc_def *def;
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  177  	int ret;
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  178  
caf4ee1a44511f Lucas De Marchi   2024-11-14  179  	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
292b1a8a50545b Lucas De Marchi   2025-02-21  180  		return 0;
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  181  
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  182  	heci_gsc->irq = -1;
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  183  
e02cea83d32d3a Alexander Usyskin 2024-07-08  184  	if (xe->info.platform == XE_BATTLEMAGE) {
e02cea83d32d3a Alexander Usyskin 2024-07-08  185  		def = &heci_gsc_def_dg2;
e02cea83d32d3a Alexander Usyskin 2024-07-08  186  	} else if (xe->info.platform == XE_PVC) {
86017f3898d4ac Alexander Usyskin 2023-11-07  187  		def = &heci_gsc_def_pvc;
86017f3898d4ac Alexander Usyskin 2023-11-07  188  	} else if (xe->info.platform == XE_DG2) {
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  189  		def = &heci_gsc_def_dg2;
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28 @190  	} else if (xe->info.platform == XE_DG1) {
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  191  		def = &heci_gsc_def_dg1;
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  192  	}
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  193  
292b1a8a50545b Lucas De Marchi   2025-02-21  194  	if (!def || !def->name) {
292b1a8a50545b Lucas De Marchi   2025-02-21  195  		drm_warn(&xe->drm, "HECI is not implemented!\n");
292b1a8a50545b Lucas De Marchi   2025-02-21  196  		return 0;
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  197  	}
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  198  
292b1a8a50545b Lucas De Marchi   2025-02-21  199  	ret = devm_add_action_or_reset(xe->drm.dev, xe_heci_gsc_fini, heci_gsc);
292b1a8a50545b Lucas De Marchi   2025-02-21  200  	if (ret)
292b1a8a50545b Lucas De Marchi   2025-02-21  201  		return ret;
292b1a8a50545b Lucas De Marchi   2025-02-21  202  
d40f275d96e890 Lucas De Marchi   2025-02-21  203  	if (!def->use_polling && !xe_survivability_mode_is_enabled(xe)) {
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  204  		ret = heci_gsc_irq_setup(xe);
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  205  		if (ret)
292b1a8a50545b Lucas De Marchi   2025-02-21  206  			return ret;
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  207  	}
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  208  
292b1a8a50545b Lucas De Marchi   2025-02-21  209  	return heci_gsc_add_device(xe, def);
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  210  }
87a4c85d3a3ed5 Vitaly Lubart     2023-08-28  211  

:::::: The code at line 190 was first introduced by commit
:::::: 87a4c85d3a3ed579c86fd2612715ccb94c4001ff drm/xe/gsc: add gsc device support

:::::: TO: Vitaly Lubart <vitaly.lubart@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
