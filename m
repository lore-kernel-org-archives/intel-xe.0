Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA4DC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 20:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CCC10E054;
	Fri, 26 Jul 2024 20:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJITc1kl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DE310E2F3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 20:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722026886; x=1753562886;
 h=date:from:to:cc:subject:message-id;
 bh=Jao5jyrStCvaobb+7tJV+JIE2wn6JIxMhFncryoColM=;
 b=OJITc1klfqil/h7b4jh9ANGf4cDVqUzFwqgYzJY2HwB876Ghvdj/YKhK
 54CFC0NRFZZs0vn7cnbNgSaUKv2F0gsDenDpKinruKJPvPGMvWh9W5Kdm
 7RTisQPLnT//3KYMPPP47O7mRB66mtYRKDy/FpuEvikr5lB4FtrLjS23h
 NnS4qQpBQClqWIizY3kK/r8HUgpxtN6N0iyNOQ5SXp1qEwoaJ7VTqWiSe
 9Qh5S3KowYHTxX7bn8pXpeRg2BTdEcS4q7a778OTp3r+wnTrmaHzgkJps
 QbOsg8MHqmNOSbwtRmzTN9u57tNE80YSQJEnfXHLeJMnPzkbEgN7LAbWg A==;
X-CSE-ConnectionGUID: UdIWnunrTvW+oRKYTgSFhw==
X-CSE-MsgGUID: UHRtGls0R4KebGCFfHj9Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="42365464"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="42365464"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 13:48:05 -0700
X-CSE-ConnectionGUID: PTkZ3SWdTDCJ1ul1G9Y0Sg==
X-CSE-MsgGUID: /O6RZR06QSStz+R9OYaQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="54159196"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 26 Jul 2024 13:48:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sXRr9-000pOG-29;
 Fri, 26 Jul 2024 20:48:03 +0000
Date: Sat, 27 Jul 2024 04:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 c5c046d9cd88bed8b8cce1bc7d70e2a19063a876
Message-ID: <202407270446.0DJesEiA-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: c5c046d9cd88bed8b8cce1bc7d70e2a19063a876  drm/xe: Enable SR-IOV for ADL/ATSM

elapsed time: 1452m

configs tested: 238
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              alldefconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                        nsimosci_defconfig   gcc-13.2.0
arc                   randconfig-001-20240726   gcc-13.2.0
arc                   randconfig-002-20240726   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                     am200epdkit_defconfig   gcc-13.2.0
arm                         bcm2835_defconfig   gcc-13.2.0
arm                        clps711x_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                          gemini_defconfig   clang-20
arm                        keystone_defconfig   clang-20
arm                         mv78xx0_defconfig   gcc-13.2.0
arm                        mvebu_v5_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-13.2.0
arm                          pxa168_defconfig   clang-20
arm                   randconfig-001-20240726   gcc-13.2.0
arm                   randconfig-002-20240726   gcc-13.2.0
arm                   randconfig-003-20240726   gcc-13.2.0
arm                   randconfig-004-20240726   gcc-13.2.0
arm                         s3c6400_defconfig   clang-20
arm                           sama7_defconfig   gcc-13.2.0
arm                           sunxi_defconfig   gcc-13.2.0
arm                           tegra_defconfig   gcc-13.2.0
arm                       versatile_defconfig   gcc-13.2.0
arm                    vt8500_v6_v7_defconfig   gcc-13.2.0
arm                         wpcm450_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240726   gcc-13.2.0
arm64                 randconfig-002-20240726   gcc-13.2.0
arm64                 randconfig-003-20240726   gcc-13.2.0
arm64                 randconfig-004-20240726   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240726   gcc-13.2.0
csky                  randconfig-002-20240726   gcc-13.2.0
hexagon                           allnoconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240726   gcc-13
i386         buildonly-randconfig-002-20240726   clang-18
i386         buildonly-randconfig-002-20240726   gcc-13
i386         buildonly-randconfig-003-20240726   gcc-13
i386         buildonly-randconfig-004-20240726   clang-18
i386         buildonly-randconfig-004-20240726   gcc-13
i386         buildonly-randconfig-005-20240726   gcc-13
i386         buildonly-randconfig-005-20240726   gcc-7
i386         buildonly-randconfig-006-20240726   clang-18
i386         buildonly-randconfig-006-20240726   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240726   gcc-13
i386                  randconfig-002-20240726   gcc-13
i386                  randconfig-003-20240726   clang-18
i386                  randconfig-003-20240726   gcc-13
i386                  randconfig-004-20240726   gcc-13
i386                  randconfig-005-20240726   clang-18
i386                  randconfig-005-20240726   gcc-13
i386                  randconfig-006-20240726   clang-18
i386                  randconfig-006-20240726   gcc-13
i386                  randconfig-011-20240726   gcc-13
i386                  randconfig-012-20240726   gcc-13
i386                  randconfig-012-20240726   gcc-8
i386                  randconfig-013-20240726   gcc-10
i386                  randconfig-013-20240726   gcc-13
i386                  randconfig-014-20240726   gcc-13
i386                  randconfig-015-20240726   clang-18
i386                  randconfig-015-20240726   gcc-13
i386                  randconfig-016-20240726   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch                 loongson3_defconfig   gcc-13.2.0
loongarch             randconfig-001-20240726   gcc-13.2.0
loongarch             randconfig-002-20240726   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5272c3_defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                        bcm63xx_defconfig   gcc-13.2.0
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                     decstation_defconfig   gcc-13.2.0
mips                          eyeq5_defconfig   clang-20
mips                           gcw0_defconfig   gcc-13.2.0
mips                           ip27_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                           xway_defconfig   gcc-13.2.0
nios2                         3c120_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240726   gcc-13.2.0
nios2                 randconfig-002-20240726   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                  or1klitex_defconfig   gcc-13.2.0
openrisc                 simple_smp_defconfig   gcc-13.2.0
openrisc                       virt_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240726   gcc-13.2.0
parisc                randconfig-002-20240726   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    amigaone_defconfig   gcc-13.2.0
powerpc                      arches_defconfig   gcc-13.2.0
powerpc                      bamboo_defconfig   clang-20
powerpc                       ebony_defconfig   clang-20
powerpc                      ep88xc_defconfig   gcc-13.2.0
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                      katmai_defconfig   gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig   gcc-13.2.0
powerpc                 mpc832x_rdb_defconfig   clang-20
powerpc                  mpc885_ads_defconfig   clang-20
powerpc               randconfig-002-20240726   gcc-13.2.0
powerpc               randconfig-003-20240726   gcc-13.2.0
powerpc                     taishan_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240726   gcc-13.2.0
powerpc64             randconfig-002-20240726   gcc-13.2.0
powerpc64             randconfig-003-20240726   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240726   gcc-13.2.0
riscv                 randconfig-002-20240726   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240726   gcc-13.2.0
s390                  randconfig-002-20240726   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                         apsh4a3a_defconfig   gcc-13.2.0
sh                        apsh4ad0a_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                        dreamcast_defconfig   gcc-13.2.0
sh                          r7780mp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240726   gcc-13.2.0
sh                    randconfig-002-20240726   gcc-13.2.0
sh                          rsk7201_defconfig   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                          sdk7780_defconfig   gcc-13.2.0
sh                     sh7710voipgw_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240726   gcc-13.2.0
sparc64               randconfig-002-20240726   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240726   gcc-13.2.0
um                    randconfig-002-20240726   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240726   gcc-13
x86_64       buildonly-randconfig-002-20240726   gcc-13
x86_64       buildonly-randconfig-003-20240726   gcc-13
x86_64       buildonly-randconfig-004-20240726   gcc-13
x86_64       buildonly-randconfig-005-20240726   gcc-13
x86_64       buildonly-randconfig-006-20240726   gcc-13
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240726   gcc-13
x86_64                randconfig-002-20240726   gcc-13
x86_64                randconfig-003-20240726   gcc-13
x86_64                randconfig-004-20240726   gcc-13
x86_64                randconfig-005-20240726   gcc-13
x86_64                randconfig-006-20240726   gcc-13
x86_64                randconfig-011-20240726   gcc-13
x86_64                randconfig-012-20240726   gcc-13
x86_64                randconfig-013-20240726   gcc-13
x86_64                randconfig-014-20240726   gcc-13
x86_64                randconfig-015-20240726   gcc-13
x86_64                randconfig-016-20240726   gcc-13
x86_64                randconfig-071-20240726   gcc-13
x86_64                randconfig-072-20240726   gcc-13
x86_64                randconfig-073-20240726   gcc-13
x86_64                randconfig-074-20240726   gcc-13
x86_64                randconfig-075-20240726   gcc-13
x86_64                randconfig-076-20240726   gcc-13
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240726   gcc-13.2.0
xtensa                randconfig-002-20240726   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
