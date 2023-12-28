Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E728BC3DA6E
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 06:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848F310E090;
	Thu, 28 Dec 2023 06:49:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C0410E090
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 06:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703746195; x=1735282195;
 h=date:from:to:cc:subject:message-id;
 bh=nCoSH2qOX+Z3kRj9EXV4nU428k+lQnREoia6SM/1aA8=;
 b=bnhRY6P4UNo6NimtMnReBLlIZD0pzu35ZfviGBZNmayGx/ugsnPb1Q4y
 6IIbsOiI9stEuJXo2NR6GVyXXt+M2FT4cbkDNSDh9UO7OHB2MwHkangSX
 GHbMATU1L30q6tuiKwnawdu3UPSg7KgYxP62etouyhgqXivmjjqFDPN8P
 tNt/mYPzzvdKD5l97QUkO0QseND+THZIw8pV9/BI0CtEwcJ9jXbSAmGOy
 z8IdkD/MRiyyXoapbtkpgHbAi4WzVZiWPQhmug1lSO8u1HLfaQ6dj+5Ey
 CR3jIy9Wi6MvB9btHgy5+OeLlJ4gmpmh8BsDqy0kZO6kJDjOV6q3WCs3U A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="482699986"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="482699986"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 22:49:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="778433408"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="778433408"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 27 Dec 2023 22:49:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rIkDH-000GBb-01;
 Thu, 28 Dec 2023 06:49:51 +0000
Date: Thu, 28 Dec 2023 14:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 7b3b98d034784b125bad7aca46f9e7a3cfcde45a
Message-ID: <202312281412.tDRgVc7D-lkp@intel.com>
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
branch HEAD: 7b3b98d034784b125bad7aca46f9e7a3cfcde45a  drm/xe/xe2: Add workaround 16020183090

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- loongarch-allmodconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
|-- riscv-allmodconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
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
|-- arm64-allmodconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
|-- powerpc-allmodconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
`-- x86_64-allmodconfig
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-sound-soc-amd-acp-snd-acp-pci.o

elapsed time: 1460m

configs tested: 178
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20231227   gcc  
arc                   randconfig-002-20231227   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20231227   clang
arm                   randconfig-002-20231227   clang
arm                   randconfig-003-20231227   clang
arm                   randconfig-004-20231227   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231227   clang
arm64                 randconfig-002-20231227   clang
arm64                 randconfig-003-20231227   clang
arm64                 randconfig-004-20231227   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231227   gcc  
csky                  randconfig-002-20231227   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231227   clang
hexagon               randconfig-002-20231227   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231227   clang
i386         buildonly-randconfig-002-20231227   clang
i386         buildonly-randconfig-003-20231227   clang
i386         buildonly-randconfig-004-20231227   clang
i386         buildonly-randconfig-005-20231227   clang
i386         buildonly-randconfig-006-20231227   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231227   clang
i386                  randconfig-002-20231227   clang
i386                  randconfig-003-20231227   clang
i386                  randconfig-004-20231227   clang
i386                  randconfig-005-20231227   clang
i386                  randconfig-006-20231227   clang
i386                  randconfig-011-20231227   gcc  
i386                  randconfig-012-20231227   gcc  
i386                  randconfig-013-20231227   gcc  
i386                  randconfig-014-20231227   gcc  
i386                  randconfig-015-20231227   gcc  
i386                  randconfig-016-20231227   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231227   gcc  
loongarch             randconfig-002-20231227   gcc  
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
mips                       bmips_be_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231227   gcc  
nios2                 randconfig-002-20231227   gcc  
openrisc                         alldefconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231227   gcc  
parisc                randconfig-002-20231227   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       holly_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc               randconfig-001-20231227   clang
powerpc               randconfig-002-20231227   clang
powerpc               randconfig-003-20231227   clang
powerpc                     redwood_defconfig   gcc  
powerpc64             randconfig-001-20231227   clang
powerpc64             randconfig-002-20231227   clang
powerpc64             randconfig-003-20231227   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231227   clang
riscv                 randconfig-002-20231227   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231227   gcc  
s390                  randconfig-002-20231227   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20231227   gcc  
sh                    randconfig-002-20231227   gcc  
sh                           se7722_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231227   gcc  
sparc64               randconfig-002-20231227   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231227   clang
um                    randconfig-002-20231227   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231227   clang
x86_64       buildonly-randconfig-002-20231227   clang
x86_64       buildonly-randconfig-003-20231227   clang
x86_64       buildonly-randconfig-004-20231227   clang
x86_64       buildonly-randconfig-005-20231227   clang
x86_64       buildonly-randconfig-006-20231227   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231227   gcc  
x86_64                randconfig-002-20231227   gcc  
x86_64                randconfig-003-20231227   gcc  
x86_64                randconfig-004-20231227   gcc  
x86_64                randconfig-005-20231227   gcc  
x86_64                randconfig-006-20231227   gcc  
x86_64                randconfig-011-20231227   clang
x86_64                randconfig-012-20231227   clang
x86_64                randconfig-013-20231227   clang
x86_64                randconfig-014-20231227   clang
x86_64                randconfig-015-20231227   clang
x86_64                randconfig-016-20231227   clang
x86_64                randconfig-071-20231227   clang
x86_64                randconfig-072-20231227   clang
x86_64                randconfig-073-20231227   clang
x86_64                randconfig-074-20231227   clang
x86_64                randconfig-075-20231227   clang
x86_64                randconfig-076-20231227   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231227   gcc  
xtensa                randconfig-002-20231227   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
