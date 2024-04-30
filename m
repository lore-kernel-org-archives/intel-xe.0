Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF0EC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 06:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDDB10F25C;
	Tue, 30 Apr 2024 06:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToaCwO8d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EE210F25C
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 06:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714458075; x=1745994075;
 h=date:from:to:cc:subject:message-id;
 bh=xEUnksCS1BlX5bo7flexp9oDegsSrPqLdsRaMf9nv3w=;
 b=ToaCwO8dZ8J0F8dpZd7XHvZXEvTrnxQRdP0zdQtns7FZe2reaToABvrU
 l/pKhY6dhunlXI/xaXpqc6tGeosskGmrqfVzrb0bxWlh+RF7uk5ndSeFf
 whDtGZg289VTuOLTganr+S/3q9aF1mmTwA73hwSf9noQbS3t3QvjRvbXL
 wXzBZT6K/O3eAMnaB9dWU2NGXVgshmhlqYc6BD/N39bXz/h55Auz7wHtt
 jnIEYSAeWluw9Se3Pt+hNrehMRDCUFRghUJTVQRRtskCN4Izhfv55ZKfj
 qcPG3uG0366dkUKT7mYkAz7N+cr1D7LjDxuaSrSYS+R5Cyyq+5n6YI3Kx Q==;
X-CSE-ConnectionGUID: fD8NumWuTBmSR0uTgtzPZA==
X-CSE-MsgGUID: pFj+46KcROGxti97B6YaCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="27593453"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="27593453"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 23:21:14 -0700
X-CSE-ConnectionGUID: 54gM0FEfTdO6OM8OL+jtKQ==
X-CSE-MsgGUID: mOLado3WTPC7RFutwmaqQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="26969413"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 29 Apr 2024 23:21:12 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s1grW-0007oU-0g;
 Tue, 30 Apr 2024 06:21:10 +0000
Date: Tue, 30 Apr 2024 14:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD REGRESSION
 4caf410766add8cf376a3afc910b17dd0961dd75
Message-ID: <202404301424.RQYtueW0-lkp@intel.com>
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
branch HEAD: 4caf410766add8cf376a3afc910b17dd0961dd75  drm/xe: Merge 16021540221 and 18034896535 WAs

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm64-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_gt_tlb_invalidation.c:error:variable-end-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- powerpc-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_gt_tlb_invalidation.c:error:variable-end-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- riscv-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_gt_tlb_invalidation.c:error:variable-end-is-uninitialized-when-used-here-Werror-Wuninitialized
|-- riscv-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_gt_tlb_invalidation.c:error:variable-end-is-uninitialized-when-used-here-Werror-Wuninitialized
`-- s390-allmodconfig
    `-- drivers-gpu-drm-xe-xe_gt_tlb_invalidation.c:error:variable-end-is-uninitialized-when-used-here-Werror-Wuninitialized

elapsed time: 906m

configs tested: 135
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                   randconfig-001-20240430   gcc  
arc                   randconfig-002-20240430   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240430   gcc  
arm64                 randconfig-004-20240430   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240430   gcc  
csky                  randconfig-002-20240430   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240430   gcc  
i386         buildonly-randconfig-002-20240430   clang
i386         buildonly-randconfig-003-20240430   gcc  
i386         buildonly-randconfig-004-20240430   clang
i386         buildonly-randconfig-005-20240430   clang
i386         buildonly-randconfig-006-20240430   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240430   clang
i386                  randconfig-002-20240430   gcc  
i386                  randconfig-003-20240430   gcc  
i386                  randconfig-004-20240430   gcc  
i386                  randconfig-005-20240430   gcc  
i386                  randconfig-006-20240430   gcc  
i386                  randconfig-011-20240430   gcc  
i386                  randconfig-012-20240430   clang
i386                  randconfig-013-20240430   clang
i386                  randconfig-014-20240430   gcc  
i386                  randconfig-015-20240430   gcc  
i386                  randconfig-016-20240430   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240430   gcc  
loongarch             randconfig-002-20240430   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
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
nios2                 randconfig-001-20240430   gcc  
nios2                 randconfig-002-20240430   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240430   gcc  
parisc                randconfig-002-20240430   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     kmeter1_defconfig   gcc  
powerpc               randconfig-001-20240430   gcc  
powerpc               randconfig-002-20240430   gcc  
powerpc                    sam440ep_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240430   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240430   gcc  
s390                  randconfig-002-20240430   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                    randconfig-001-20240430   gcc  
sh                    randconfig-002-20240430   gcc  
sh                           se7721_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240430   gcc  
sparc64               randconfig-002-20240430   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240430   gcc  
xtensa                randconfig-002-20240430   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
