Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A548CC25B78
	for <intel-xe@archiver.kernel.org>; Sat, 25 May 2024 09:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFBE10E91F;
	Sat, 25 May 2024 09:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBqEipQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40DB10E91F
 for <intel-xe@lists.freedesktop.org>; Sat, 25 May 2024 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716628265; x=1748164265;
 h=date:from:to:cc:subject:message-id;
 bh=IgM5PH8nJa0Ozs7P4KKFEog9X/qqMRxK5mQS+2YNrdU=;
 b=KBqEipQGtv6apNj/IwLSoekF9ufi0KAi+rZP19qDCXyH4K0Yh6qrreaU
 lLqJ27FZX4oDs/o7hUYMFTJ+k6+6/jY4S+KiDDI1z0yUsPg9iyvgOVPY3
 EodDJ97+3hmiImR8a7ZqkMswzJjBr6I/lSGiG90lAnSalhhWBYyCli1Zq
 +Jw7vC9GuPtlRVvjgSSNegJ31yQnrVDVbG4gkdg1StIOs90RNbZbF6FOV
 ICb7vwKXQOsAjcj41r3Dk46TTrRAxFbQwH97tFng22VOyrD7LYwq0NBk7
 wG7rJZMYqNs/Fcr5/wiVvzZzSFAA9IvETRxtq4PdXwrVUnRTHf3fkAlvb Q==;
X-CSE-ConnectionGUID: R9eWes1rSraRWQh9fzjqig==
X-CSE-MsgGUID: GRZ0Ofu1RROhlvN+n8TASQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="16837657"
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; d="scan'208";a="16837657"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2024 02:11:03 -0700
X-CSE-ConnectionGUID: Zm7WMhwtROmykS7cv95T7A==
X-CSE-MsgGUID: uVPDmFpzRVCYxBHH4SDvrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; d="scan'208";a="34756125"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 25 May 2024 02:11:02 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sAnQZ-0006kx-2z;
 Sat, 25 May 2024 09:10:59 +0000
Date: Sat, 25 May 2024 17:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD REGRESSION
 5cef84939723f96352d7087b0ea596a65fb972c6
Message-ID: <202405251728.K55Ucjwo-lkp@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 5cef84939723f96352d7087b0ea596a65fb972c6  drm/xe/vf: Treat GMDID as another runtime register

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202405250151.IbH0l8FG-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202405250703.KsT3CS4D-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/xe/xe_guc.c:630:6: error: variable 'count' is uninitialized when used here [-Werror,-Wuninitialized]
drivers/gpu/drm/xe/xe_guc.c:630:6: warning: variable 'count' is uninitialized when used here [-Wuninitialized]

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm64-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- powerpc-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- riscv-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- riscv-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- s390-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- x86_64-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized
`-- x86_64-randconfig-002-20240525
    `-- drivers-gpu-drm-xe-xe_guc.c:warning:variable-count-is-uninitialized-when-used-here

elapsed time: 1451m

configs tested: 139
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240525   gcc  
arc                   randconfig-002-20240525   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240525   gcc  
arm                   randconfig-002-20240525   gcc  
arm                   randconfig-003-20240525   clang
arm                   randconfig-004-20240525   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240525   gcc  
arm64                 randconfig-002-20240525   clang
arm64                 randconfig-003-20240525   gcc  
arm64                 randconfig-004-20240525   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240525   gcc  
csky                  randconfig-002-20240525   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240525   clang
hexagon               randconfig-002-20240525   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240524   clang
i386         buildonly-randconfig-002-20240524   clang
i386         buildonly-randconfig-003-20240524   gcc  
i386         buildonly-randconfig-004-20240524   clang
i386         buildonly-randconfig-005-20240524   clang
i386         buildonly-randconfig-006-20240524   clang
i386                                defconfig   clang
i386                  randconfig-001-20240524   clang
i386                  randconfig-002-20240524   clang
i386                  randconfig-003-20240524   clang
i386                  randconfig-004-20240524   clang
i386                  randconfig-005-20240524   gcc  
i386                  randconfig-006-20240524   clang
i386                  randconfig-011-20240524   clang
i386                  randconfig-012-20240524   gcc  
i386                  randconfig-013-20240524   gcc  
i386                  randconfig-014-20240524   clang
i386                  randconfig-015-20240524   clang
i386                  randconfig-016-20240524   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240525   gcc  
loongarch             randconfig-002-20240525   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240525   gcc  
nios2                 randconfig-002-20240525   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240525   gcc  
parisc                randconfig-002-20240525   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240525   gcc  
powerpc               randconfig-002-20240525   gcc  
powerpc               randconfig-003-20240525   gcc  
powerpc64             randconfig-001-20240525   clang
powerpc64             randconfig-002-20240525   gcc  
powerpc64             randconfig-003-20240525   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240525   gcc  
riscv                 randconfig-002-20240525   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240525   clang
s390                  randconfig-002-20240525   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240525   gcc  
sh                    randconfig-002-20240525   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240525   gcc  
sparc64               randconfig-002-20240525   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240525   gcc  
um                    randconfig-002-20240525   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240525   gcc  
xtensa                randconfig-002-20240525   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
