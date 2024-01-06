Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A70C46CD2
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jan 2024 22:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BB610E040;
	Sat,  6 Jan 2024 22:06:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB95E10E040
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jan 2024 22:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704578798; x=1736114798;
 h=date:from:to:cc:subject:message-id;
 bh=4CU072D4Hk4tKbIMp8+GTq33rfa4k1TYmCM5DCYLt0I=;
 b=EeRL8L6drXt+pDh4AuPYTD2YwDNmtfqofr3lLzlx6KmvBhbtxFrUxbI6
 WtsL+xhVcrLXcMzM4FBUCuWlwZceGltXCRY08kUykNv3qsY1yBv+NKDcr
 A5Rn/pcj5vCtv52XpHQhjlrEJE8efG0XV5dYhkITSa2F20zoFMwvkUSHp
 CdsJ9aCrf9b6j3tJRJ9eeUt2jTLgZSYvtKIHmNZl4xteb5hPc90CZ6huc
 w5Zq6IzwL9kDcsaNQXTHiOOyQPD2ANh678qxH0pWvZRamvs3/wJZYaueU
 4Ds7aV9C7uZJUVaxGhu88JHbr/bdWIaOapJi4DMBEuRgZ1n3f7tlxZ5Jj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="397407349"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; d="scan'208";a="397407349"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2024 14:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="730772934"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; d="scan'208";a="730772934"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 06 Jan 2024 14:06:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rMEoM-00034R-0Q;
 Sat, 06 Jan 2024 22:06:34 +0000
Date: Sun, 07 Jan 2024 06:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 cca0607b6f6a21bee68c092ed7ad9f3322e54523
Message-ID: <202401070601.ffrFymlN-lkp@intel.com>
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
branch HEAD: cca0607b6f6a21bee68c092ed7ad9f3322e54523  drm/xe: Fix compilation without CONFIG_KUNIT

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-randconfig-003-20240106
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-sound-soc-amd-acp-snd-acp-pci.o
|-- loongarch-allmodconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
`-- riscv-allmodconfig
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
clang_recent_errors
|-- powerpc-allmodconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
`-- x86_64-allmodconfig
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-sound-soc-amd-acp-snd-acp-pci.o

elapsed time: 1453m

configs tested: 133
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240106   gcc  
arc                   randconfig-002-20240106   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240106   gcc  
arm                   randconfig-002-20240106   gcc  
arm                   randconfig-003-20240106   gcc  
arm                   randconfig-004-20240106   gcc  
arm                       versatile_defconfig   clang
arm64                             allnoconfig   gcc  
arm64                 randconfig-001-20240106   gcc  
arm64                 randconfig-002-20240106   gcc  
arm64                 randconfig-003-20240106   gcc  
arm64                 randconfig-004-20240106   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240106   gcc  
csky                  randconfig-002-20240106   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240106   clang
hexagon               randconfig-002-20240106   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240106   gcc  
i386         buildonly-randconfig-002-20240106   gcc  
i386         buildonly-randconfig-003-20240106   gcc  
i386         buildonly-randconfig-004-20240106   gcc  
i386         buildonly-randconfig-005-20240106   gcc  
i386         buildonly-randconfig-006-20240106   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240106   gcc  
i386                  randconfig-002-20240106   gcc  
i386                  randconfig-003-20240106   gcc  
i386                  randconfig-004-20240106   gcc  
i386                  randconfig-005-20240106   gcc  
i386                  randconfig-006-20240106   gcc  
i386                  randconfig-011-20240106   clang
i386                  randconfig-012-20240106   clang
i386                  randconfig-013-20240106   clang
i386                  randconfig-014-20240106   clang
i386                  randconfig-015-20240106   clang
i386                  randconfig-016-20240106   clang
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20240106   gcc  
loongarch             randconfig-002-20240106   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20240106   gcc  
nios2                 randconfig-002-20240106   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240106   gcc  
parisc                randconfig-002-20240106   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240106   gcc  
powerpc               randconfig-002-20240106   gcc  
powerpc               randconfig-003-20240106   gcc  
powerpc64             randconfig-001-20240106   gcc  
powerpc64             randconfig-002-20240106   gcc  
powerpc64             randconfig-003-20240106   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                 randconfig-001-20240106   gcc  
riscv                 randconfig-002-20240106   gcc  
riscv                          rv32_defconfig   clang
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240106   clang
s390                  randconfig-002-20240106   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240106   gcc  
sh                    randconfig-002-20240106   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240106   gcc  
sparc64               randconfig-002-20240106   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20240106   gcc  
um                    randconfig-002-20240106   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240106   gcc  
x86_64       buildonly-randconfig-002-20240106   gcc  
x86_64       buildonly-randconfig-003-20240106   gcc  
x86_64       buildonly-randconfig-004-20240106   gcc  
x86_64       buildonly-randconfig-005-20240106   gcc  
x86_64       buildonly-randconfig-006-20240106   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240106   clang
x86_64                randconfig-002-20240106   clang
x86_64                randconfig-003-20240106   clang
x86_64                randconfig-004-20240106   clang
x86_64                randconfig-005-20240106   clang
x86_64                randconfig-006-20240106   clang
x86_64                randconfig-011-20240106   gcc  
x86_64                randconfig-012-20240106   gcc  
x86_64                randconfig-013-20240106   gcc  
x86_64                randconfig-014-20240106   gcc  
x86_64                randconfig-015-20240106   gcc  
x86_64                randconfig-016-20240106   gcc  
x86_64                randconfig-071-20240106   gcc  
x86_64                randconfig-072-20240106   gcc  
x86_64                randconfig-073-20240106   gcc  
x86_64                randconfig-074-20240106   gcc  
x86_64                randconfig-075-20240106   gcc  
x86_64                randconfig-076-20240106   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240106   gcc  
xtensa                randconfig-002-20240106   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
