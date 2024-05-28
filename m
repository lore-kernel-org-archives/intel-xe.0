Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D49C27C44
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 11:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F9E10E214;
	Tue, 28 May 2024 11:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IsL0inKJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C8810E214
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716895107; x=1748431107;
 h=date:from:to:cc:subject:message-id;
 bh=qJedq5mj+aFi21bm9o3elOyQpzC3B/J4XD2xVY/DFQM=;
 b=IsL0inKJOe4RThAaaZDIF6+pGrtvXkLor3LGXXntlOMT90cexbo0Dz64
 hbDkJuYu9k0xXOTYQahPazNZ6H+F1+ypXusxJIRw/ygr6VEKCZigO979X
 UeYv8GEaE6uKd5jcH71vwpjvgcx5pcU0Z/2BwTXgDPiiuzCyjj4du9Fdc
 Mksae8agYLOwiCeS5Ak20dW4JW/QYDfu8qfW9EkIK/94MZ68Xh0hGsxo5
 RBByIH6Yt5yMVs0uqU0lF0LpGZ6dxBr/rL0n2d+mVO0bwNdS4v/OF07e/
 FC3dEnUl9ZF0YW/L+oOHjf1kKvXsn91+fMBffCR9x7/pN4L4y96rY/EiM w==;
X-CSE-ConnectionGUID: Bvqq9MNQTW66M+gv6Gzf2Q==
X-CSE-MsgGUID: 7JaF6WpsRoeGNH2/IrJkTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24646023"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="24646023"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 04:18:27 -0700
X-CSE-ConnectionGUID: wlXBEVQmSZW26XQK6Q5MoA==
X-CSE-MsgGUID: VjlWIoOpSFestLgfZdbAAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="35121111"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 28 May 2024 04:18:26 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sBuqB-000C6n-3D;
 Tue, 28 May 2024 11:18:06 +0000
Date: Tue, 28 May 2024 19:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD REGRESSION
 ce62827bc294ba5f8b3909bfa5d7dbf9de8aab6b
Message-ID: <202405281924.GQUunm1B-lkp@intel.com>
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
branch HEAD: ce62827bc294ba5f8b3909bfa5d7dbf9de8aab6b  drm/xe: Do not access xe file when updating exec queue run_ticks

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm64-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- i386-randconfig-001-20240528
|   `-- drivers-gpu-drm-xe-xe_guc.c:warning:variable-count-is-uninitialized-when-used-here
|-- i386-randconfig-011-20240528
|   `-- drivers-gpu-drm-xe-xe_guc.c:warning:variable-count-is-uninitialized-when-used-here
|-- powerpc-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- powerpc-randconfig-002-20240528
|   `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- powerpc-randconfig-003-20240528
|   `-- drivers-gpu-drm-xe-xe_guc.c:warning:variable-count-is-uninitialized-when-used-here
|-- powerpc64-randconfig-001-20240528
|   `-- drivers-gpu-drm-xe-xe_guc.c:warning:variable-count-is-uninitialized-when-used-here
|-- powerpc64-randconfig-003-20240528
|   `-- drivers-gpu-drm-xe-xe_guc.c:warning:variable-count-is-uninitialized-when-used-here
|-- riscv-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- riscv-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- s390-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized
`-- x86_64-allyesconfig
    `-- drivers-gpu-drm-xe-xe_guc.c:error:variable-count-is-uninitialized-when-used-here-Werror-Wuninitialized

elapsed time: 764m

configs tested: 154
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240528   gcc  
arc                   randconfig-002-20240528   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   clang
arm                      footbridge_defconfig   clang
arm                      jornada720_defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                   randconfig-001-20240528   gcc  
arm                   randconfig-002-20240528   gcc  
arm                   randconfig-003-20240528   clang
arm                   randconfig-004-20240528   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240528   clang
arm64                 randconfig-002-20240528   clang
arm64                 randconfig-003-20240528   gcc  
arm64                 randconfig-004-20240528   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240528   gcc  
csky                  randconfig-002-20240528   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240528   clang
hexagon               randconfig-002-20240528   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240528   gcc  
i386         buildonly-randconfig-002-20240528   clang
i386         buildonly-randconfig-003-20240528   clang
i386         buildonly-randconfig-004-20240528   clang
i386         buildonly-randconfig-005-20240528   clang
i386         buildonly-randconfig-006-20240528   clang
i386                                defconfig   clang
i386                  randconfig-001-20240528   clang
i386                  randconfig-002-20240528   clang
i386                  randconfig-003-20240528   gcc  
i386                  randconfig-004-20240528   gcc  
i386                  randconfig-005-20240528   gcc  
i386                  randconfig-006-20240528   gcc  
i386                  randconfig-011-20240528   clang
i386                  randconfig-012-20240528   gcc  
i386                  randconfig-013-20240528   gcc  
i386                  randconfig-014-20240528   clang
i386                  randconfig-015-20240528   gcc  
i386                  randconfig-016-20240528   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240528   gcc  
loongarch             randconfig-002-20240528   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                          malta_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240528   gcc  
nios2                 randconfig-002-20240528   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240528   gcc  
parisc                randconfig-002-20240528   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                      ppc40x_defconfig   clang
powerpc               randconfig-001-20240528   gcc  
powerpc               randconfig-002-20240528   clang
powerpc               randconfig-003-20240528   clang
powerpc                     tqm8555_defconfig   clang
powerpc                     tqm8560_defconfig   gcc  
powerpc64             randconfig-001-20240528   clang
powerpc64             randconfig-002-20240528   gcc  
powerpc64             randconfig-003-20240528   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240528   clang
riscv                 randconfig-002-20240528   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240528   gcc  
s390                  randconfig-002-20240528   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                    randconfig-001-20240528   gcc  
sh                    randconfig-002-20240528   gcc  
sh                             sh03_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240528   gcc  
sparc64               randconfig-002-20240528   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240528   gcc  
um                    randconfig-002-20240528   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240528   gcc  
xtensa                randconfig-002-20240528   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
