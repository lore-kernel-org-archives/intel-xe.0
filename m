Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338E5C41535
	for <intel-xe@archiver.kernel.org>; Sun, 17 Dec 2023 02:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE9910E03B;
	Sun, 17 Dec 2023 02:29:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4378410E03B
 for <intel-xe@lists.freedesktop.org>; Sun, 17 Dec 2023 02:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702780152; x=1734316152;
 h=date:from:to:cc:subject:message-id;
 bh=bBjgAyEGeLcRQgHIHxmGtDyESKU+X1dIW49F97c6kwQ=;
 b=K0um9d3l8kSXRh+c4ZXgqi7MPogLnYHmkJEZKPhDC6FGWmNi9yd9836m
 ce45ZXMXTclVSjdbpWlMSY8MnUBmV8quEZ+Q5JqrZzs2Gwo3aVH2YBEjZ
 1o01LVNHTHAty6XVf9pIq83slP3OF0RZuGITto6ZfoNFCRAn5ToXzhWji
 wA34xXjtfzof9WY1uuaIDBKBuq2y1ZOko/ftveKLEzaHMEMkGAUOv5d5K
 1ksbohwbMB9asM1dCxdy8AWdes44QT5sW+ZUijob1ME/XxSWylAgik6V4
 2/cGiiK+FcGn4wXiGJlfaihFZemAzU5LVDkhI+i6bYJRIV90vD2hwLkqW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="16949200"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="16949200"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 15:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="893342484"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="893342484"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2023 15:20:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rEdwv-0002KW-1N;
 Sat, 16 Dec 2023 23:20:01 +0000
Date: Sun, 17 Dec 2023 07:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [drm-xe:drm-xe-next] BUILD REGRESSION
 c54005fdd0347a17088e7ff78070a55bf9103bc4
Message-ID: <202312170729.1Y6PztrM-lkp@intel.com>
User-Agent: s-nail v14.9.24
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: c54005fdd0347a17088e7ff78070a55bf9103bc4  Merge remote-tracking branch 'drm-intel/topic/core-for-CI' into drm-xe-next

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202312170357.KPSinwPs-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/xe/xe_wait_user_fence.c:46:2: warning: variable 'passed' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- loongarch-allmodconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
|-- microblaze-allmodconfig
|   `-- drivers-gpu-drm-xe-compat-i915-headers-gem-i915_gem_object.h:error:implicit-declaration-of-function-readq
|-- parisc-allmodconfig
|   `-- drivers-gpu-drm-xe-compat-i915-headers-gem-i915_gem_object.h:error:implicit-declaration-of-function-readq
|-- s390-allmodconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
|-- sparc-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
|-- sparc64-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
|-- sparc64-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
`-- x86_64-allnoconfig
    `-- drivers-gpu-drm-xe-tests-xe_pci.c:kunit-test-bug.h-is-included-more-than-once.
clang_recent_errors
|-- i386-allmodconfig
|   |-- drivers-gpu-drm-xe-compat-i915-headers-gem-i915_gem_object.h:error:call-to-undeclared-function-readq-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-gpu-drm-xe-xe_gt_freq.c:warning:variable-err-is-uninitialized-when-used-here
|-- i386-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_gt_freq.c:warning:variable-err-is-uninitialized-when-used-here
`-- x86_64-allyesconfig
    |-- drivers-gpu-drm-xe-xe_gt_freq.c:warning:variable-err-is-uninitialized-when-used-here
    `-- drivers-gpu-drm-xe-xe_wait_user_fence.c:warning:variable-passed-is-used-uninitialized-whenever-switch-default-is-taken

elapsed time: 1474m

configs tested: 85
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231216   gcc  
i386         buildonly-randconfig-002-20231216   gcc  
i386         buildonly-randconfig-003-20231216   gcc  
i386         buildonly-randconfig-004-20231216   gcc  
i386         buildonly-randconfig-005-20231216   gcc  
i386         buildonly-randconfig-006-20231216   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231216   gcc  
i386                  randconfig-002-20231216   gcc  
i386                  randconfig-003-20231216   gcc  
i386                  randconfig-004-20231216   gcc  
i386                  randconfig-005-20231216   gcc  
i386                  randconfig-006-20231216   gcc  
i386                  randconfig-011-20231216   clang
i386                  randconfig-012-20231216   clang
i386                  randconfig-013-20231216   clang
i386                  randconfig-014-20231216   clang
i386                  randconfig-015-20231216   clang
i386                  randconfig-016-20231216   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
