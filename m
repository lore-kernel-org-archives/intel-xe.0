Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC2DCD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 22:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D40110E21E;
	Wed,  6 May 2026 22:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKLasYYy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7D210E21E
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 22:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778108259; x=1809644259;
 h=date:from:to:cc:subject:message-id;
 bh=nqf5I1KB/56JVYJqcXF+rceXnxDZK37kaM1pFTnH2uY=;
 b=YKLasYYyH61yknF7wWKukjCrsdMGvLHiss5lE49ffxv+5Pst5R7W4woM
 D2E09RgssovQaUDtZ0qslJIgGs7jh7+rlRpL5bFmiTcE35Vyomxltw891
 njC/EmCACQPFDP69EGGmJCjpfxVI9Yln6OIjC003g0eOi+AYQ1a+g7YOv
 4AM8Dn+cRu9U+w6DjZTio3Zgy+nirV6jCaDAIoE/xuj0ACXLZqHIHO0gr
 VWTyii9jTM2H/oVWvh7zHV0I/kJS0NYySgRBj+pOxkOuQpVm352OfF8mJ
 +Qodd4RcB0RIBI6AzM9zGyr7Q3IQf3gEyzVnMRXDoutW919KaipxfACRP w==;
X-CSE-ConnectionGUID: eZAL5VYzRtqXnC/Vkly25Q==
X-CSE-MsgGUID: VCcDjQHSSGWHVptG2poFlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101727577"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="101727577"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:57:38 -0700
X-CSE-ConnectionGUID: 1E43NMXYSFuyK5qTylRlfA==
X-CSE-MsgGUID: l1fjPOKUR42JEN6VgseXDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="274415426"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 06 May 2026 15:57:36 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wKlBO-000000001If-1Z0s;
 Wed, 06 May 2026 22:57:34 +0000
Date: Thu, 07 May 2026 06:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 e68a60f9e6a602684f335ede8af1170c13998b37
Message-ID: <202605070618.zUeuXlf7-lkp@intel.com>
User-Agent: s-nail v14.9.25
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
branch HEAD: e68a60f9e6a602684f335ede8af1170c13998b37  drm/xe/cri: Add new PCI IDs

elapsed time: 725m

configs tested: 247
configs skipped: 19

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260506    gcc-12.5.0
arc                   randconfig-001-20260507    gcc-14.3.0
arc                   randconfig-002-20260506    gcc-12.5.0
arc                   randconfig-002-20260507    gcc-14.3.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260506    gcc-12.5.0
arm                   randconfig-002-20260506    gcc-12.5.0
arm                   randconfig-002-20260507    gcc-14.3.0
arm                   randconfig-003-20260506    gcc-12.5.0
arm                   randconfig-004-20260506    gcc-12.5.0
arm                   randconfig-004-20260507    gcc-14.3.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-15.2.0
arm64                 randconfig-001-20260506    gcc-15.2.0
arm64                 randconfig-001-20260507    gcc-15.2.0
arm64                          randconfig-002    gcc-15.2.0
arm64                 randconfig-002-20260506    gcc-15.2.0
arm64                 randconfig-002-20260507    gcc-15.2.0
arm64                          randconfig-003    gcc-15.2.0
arm64                 randconfig-003-20260506    gcc-15.2.0
arm64                 randconfig-003-20260507    gcc-15.2.0
arm64                          randconfig-004    gcc-15.2.0
arm64                 randconfig-004-20260506    gcc-15.2.0
arm64                 randconfig-004-20260507    gcc-15.2.0
csky                             alldefconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    gcc-15.2.0
csky                  randconfig-001-20260506    gcc-15.2.0
csky                  randconfig-001-20260507    gcc-15.2.0
csky                           randconfig-002    gcc-15.2.0
csky                  randconfig-002-20260506    gcc-15.2.0
csky                  randconfig-002-20260507    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260506    clang-23
hexagon               randconfig-001-20260506    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260506    clang-23
hexagon               randconfig-002-20260506    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    clang-20
i386        buildonly-randconfig-001-20260506    clang-20
i386        buildonly-randconfig-001-20260506    gcc-14
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260506    clang-20
i386        buildonly-randconfig-002-20260506    gcc-14
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260506    clang-20
i386                 buildonly-randconfig-004    clang-20
i386        buildonly-randconfig-004-20260506    clang-20
i386                 buildonly-randconfig-005    clang-20
i386        buildonly-randconfig-005-20260506    clang-20
i386                 buildonly-randconfig-006    clang-20
i386        buildonly-randconfig-006-20260506    clang-20
i386        buildonly-randconfig-006-20260506    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260506    gcc-14
i386                  randconfig-002-20260506    gcc-14
i386                  randconfig-003-20260506    gcc-14
i386                  randconfig-004-20260506    gcc-14
i386                  randconfig-005-20260506    gcc-14
i386                  randconfig-006-20260506    gcc-14
i386                  randconfig-007-20260506    gcc-14
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260506    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260506    clang-20
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260506    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260506    clang-20
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260506    clang-20
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260506    clang-20
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260506    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260506    clang-23
loongarch             randconfig-001-20260506    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260506    clang-23
loongarch             randconfig-002-20260506    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         apollo_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                       lemote2f_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260506    clang-23
nios2                 randconfig-001-20260506    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260506    clang-23
nios2                 randconfig-002-20260506    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
openrisc                       virt_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260506    gcc-13.4.0
parisc                randconfig-001-20260507    gcc-8.5.0
parisc                         randconfig-002    gcc-13.4.0
parisc                randconfig-002-20260506    gcc-13.4.0
parisc                randconfig-002-20260507    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260506    gcc-13.4.0
powerpc               randconfig-001-20260507    gcc-8.5.0
powerpc                        randconfig-002    gcc-13.4.0
powerpc               randconfig-002-20260506    gcc-13.4.0
powerpc               randconfig-002-20260507    gcc-8.5.0
powerpc64             randconfig-001-20260506    gcc-13.4.0
powerpc64             randconfig-001-20260507    gcc-8.5.0
powerpc64                      randconfig-002    gcc-13.4.0
powerpc64             randconfig-002-20260506    gcc-13.4.0
powerpc64             randconfig-002-20260507    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260506    gcc-8.5.0
riscv                 randconfig-002-20260506    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260506    gcc-8.5.0
s390                  randconfig-002-20260506    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260506    gcc-8.5.0
sh                    randconfig-002-20260506    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260506    gcc-11.5.0
sparc                 randconfig-001-20260507    gcc-12.5.0
sparc                 randconfig-002-20260506    gcc-11.5.0
sparc                 randconfig-002-20260507    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260507    gcc-12.5.0
sparc64               randconfig-002-20260507    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260506    gcc-11.5.0
um                    randconfig-001-20260507    gcc-12.5.0
um                    randconfig-002-20260507    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260506    clang-20
x86_64      buildonly-randconfig-002-20260506    clang-20
x86_64      buildonly-randconfig-003-20260506    clang-20
x86_64      buildonly-randconfig-004-20260506    clang-20
x86_64      buildonly-randconfig-005-20260506    clang-20
x86_64      buildonly-randconfig-006-20260506    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260506    clang-20
x86_64                randconfig-001-20260506    gcc-13
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260506    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260506    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260506    clang-20
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260506    clang-20
x86_64                randconfig-005-20260506    gcc-13
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260506    clang-20
x86_64                randconfig-011-20260506    clang-20
x86_64                randconfig-012-20260506    clang-20
x86_64                randconfig-013-20260506    clang-20
x86_64                randconfig-014-20260506    clang-20
x86_64                randconfig-015-20260506    clang-20
x86_64                randconfig-016-20260506    clang-20
x86_64                randconfig-071-20260506    clang-20
x86_64                randconfig-071-20260507    clang-20
x86_64                randconfig-072-20260506    clang-20
x86_64                randconfig-072-20260507    clang-20
x86_64                randconfig-073-20260506    clang-20
x86_64                randconfig-073-20260507    clang-20
x86_64                randconfig-074-20260506    clang-20
x86_64                randconfig-074-20260507    clang-20
x86_64                randconfig-075-20260506    clang-20
x86_64                randconfig-075-20260507    clang-20
x86_64                randconfig-076-20260506    clang-20
x86_64                randconfig-076-20260507    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260506    gcc-11.5.0
xtensa                randconfig-001-20260507    gcc-12.5.0
xtensa                randconfig-002-20260506    gcc-11.5.0
xtensa                randconfig-002-20260507    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
