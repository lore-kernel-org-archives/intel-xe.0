Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4CBC369D3
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 04:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFFA10E27D;
	Fri, 25 Apr 2025 04:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqO+53+x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E5A10E27D
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 04:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745554774; x=1777090774;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=UNWZ6ALfxXDBAeCKcCZJ5iuPUicHISeWOSWcvumefKI=;
 b=eqO+53+xf3Rs2RkD0u3pz1AeSJi+AOn5Fa6EW+occdkg8NeJNgTid2Vy
 YO1CJfuPywccElzCCwZjlgBoPhGTQbCRIlnEv7PsWkEtIIE+2kdRED1Zs
 Bolghq3XFQH1CYNfsCjECovtWd1oZ4KLfZsNpi8VL9W0UtEdS/M9ESJyD
 tTv5CRPhjdsN7Dpjrn2jy9YXsPwcqFudVR/4J5okhxe17/UIUQuU73J3d
 kX0Os858/aXbcJ85t2toOc3IoCOJhNSduyz6QcX03qDrPufO5Ge+GTMGU
 M5DbbG+ZE/N2dIIXUETMKhBOB/WJ7mztGHP+2nkECkgq2Q86LFIt3koaf g==;
X-CSE-ConnectionGUID: YCjVU+dzQuqBF/a8j+hX6g==
X-CSE-MsgGUID: 0YVOaaOgQmSlycmtuC8pvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47225224"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47225224"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 21:19:33 -0700
X-CSE-ConnectionGUID: 4/48rHHwSgK2jPDPJ1D2yQ==
X-CSE-MsgGUID: v4HSPLNMRAi+N5efbR/rCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="170016452"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 24 Apr 2025 21:19:31 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u8AXB-0004pX-0P;
 Fri, 25 Apr 2025 04:19:29 +0000
Date: Fri, 25 Apr 2025 12:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [drm-xe:drm-xe-next 1/4] xe_devcoredump.c:undefined reference to
 `__moddi3'
Message-ID: <202504251238.JsNgFeFc-lkp@intel.com>
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
head:   238ae3be582070aedd91c75f07483fbb2a77fc45
commit: c4a2e5f865b7230a9565c57c54b375b1d2ce82f5 [1/4] drm/xe: Add devcoredump chunking
config: xtensa-randconfig-002-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251238.JsNgFeFc-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251238.JsNgFeFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251238.JsNgFeFc-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `xe_configfs_exit' referenced in section `.rodata' of drivers/gpu/drm/xe/xe_module.o: defined in discarded section `.exit.text' of drivers/gpu/drm/xe/xe_configfs.o
   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_devcoredump.o: in function `__xe_devcoredump_read':
>> xe_devcoredump.c:(.text+0x444): undefined reference to `__moddi3'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_devcoredump.o: in function `xe_devcoredump_read':
   xe_devcoredump.c:(.text+0x662): undefined reference to `__moddi3'
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
   `.exit.text' referenced in section `__jump_table' of drivers/mtd/maps/pcmciamtd.o: defined in discarded section `.exit.text' of drivers/mtd/maps/pcmciamtd.o
   `.exit.text' referenced in section `__jump_table' of drivers/mtd/maps/pcmciamtd.o: defined in discarded section `.exit.text' of drivers/mtd/maps/pcmciamtd.o
   `.exit.text' referenced in section `__jump_table' of drivers/pps/clients/pps-ktimer.o: defined in discarded section `.exit.text' of drivers/pps/clients/pps-ktimer.o
   `.exit.text' referenced in section `__jump_table' of drivers/pps/clients/pps-ktimer.o: defined in discarded section `.exit.text' of drivers/pps/clients/pps-ktimer.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
