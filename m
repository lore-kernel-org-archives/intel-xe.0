Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D32C369B9
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 09:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C044F10E2DA;
	Wed, 25 Sep 2024 09:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hd6i7pKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BD410E2DA
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727257514; x=1758793514;
 h=date:from:to:cc:subject:message-id;
 bh=eVNw+hl/W0jIbzWVgAPxdzdD/E2nBg+DrrUBz/YTJS8=;
 b=hd6i7pKdtUeDH/DHB9IHqsjXeWmPMcJkwTKsc8D1SQ/3qhiV2Hh8fucm
 X5zOHOb9H7chv9GbstNIX1U89YXOpbx96KI6sn0Amxl557IwtoYTWCXlo
 979dBVC31vpCq3L6/jO07u6DXt0RQAfanGbwuyXCc5m76BRk8AEuuRb1B
 QwmqWsbjoXyInV+YeVg8PVvoMhHH8GyzxDbskXo+rIiWalOtKnq9dBHDC
 D6VqnBm5k8M0sngkWPld6F5FiJdSzgp3IIlAxrpXoQp9LzfxtEN+hflSs
 14+K4OXp071lfzjANS5GVLXi7EyJRt63DlQT/bYfLXX9y8ZdMFfUdgY6L Q==;
X-CSE-ConnectionGUID: TD1iLZwLTbOKhydTP5OsGA==
X-CSE-MsgGUID: YgMtdNQVRf+WBtBu9bGrbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26163113"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="26163113"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 02:45:13 -0700
X-CSE-ConnectionGUID: CGJp4dbbQwyxI/3h8IosEw==
X-CSE-MsgGUID: y9m3F9+tRzym/Lsy+5fgrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="72031345"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 25 Sep 2024 02:45:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1stOa5-000JQJ-2m;
 Wed, 25 Sep 2024 09:45:09 +0000
Date: Wed, 25 Sep 2024 17:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 fe4f5d4b661666a45b48fe7f95443f8fefc09c8c
Message-ID: <202409251742.Vglf7vhl-lkp@intel.com>
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
branch HEAD: fe4f5d4b661666a45b48fe7f95443f8fefc09c8c  drm/xe: Clean up VM / exec queue file lock usage.

elapsed time: 1037m

configs tested: 218
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20240925    gcc-13.2.0
arc                   randconfig-002-20240925    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                        clps711x_defconfig    gcc-14.1.0
arm                      jornada720_defconfig    clang-20
arm                        neponset_defconfig    gcc-14.1.0
arm                   randconfig-001-20240925    gcc-14.1.0
arm                   randconfig-002-20240925    clang-20
arm                   randconfig-003-20240925    clang-20
arm                   randconfig-004-20240925    gcc-14.1.0
arm                         s3c6400_defconfig    clang-20
arm                         socfpga_defconfig    gcc-14.1.0
arm                           tegra_defconfig    clang-20
arm                        vexpress_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240925    gcc-14.1.0
arm64                 randconfig-002-20240925    gcc-14.1.0
arm64                 randconfig-003-20240925    clang-20
arm64                 randconfig-004-20240925    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240925    gcc-14.1.0
csky                  randconfig-002-20240925    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20240925    clang-20
hexagon               randconfig-002-20240925    clang-20
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240925    clang-18
i386        buildonly-randconfig-002-20240925    clang-18
i386        buildonly-randconfig-003-20240925    clang-18
i386        buildonly-randconfig-004-20240925    clang-18
i386        buildonly-randconfig-004-20240925    gcc-12
i386        buildonly-randconfig-005-20240925    clang-18
i386        buildonly-randconfig-006-20240925    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240925    clang-18
i386                  randconfig-001-20240925    gcc-12
i386                  randconfig-002-20240925    clang-18
i386                  randconfig-003-20240925    clang-18
i386                  randconfig-003-20240925    gcc-12
i386                  randconfig-004-20240925    clang-18
i386                  randconfig-005-20240925    clang-18
i386                  randconfig-006-20240925    clang-18
i386                  randconfig-006-20240925    gcc-12
i386                  randconfig-011-20240925    clang-18
i386                  randconfig-011-20240925    gcc-12
i386                  randconfig-012-20240925    clang-18
i386                  randconfig-012-20240925    gcc-12
i386                  randconfig-013-20240925    clang-18
i386                  randconfig-014-20240925    clang-18
i386                  randconfig-015-20240925    clang-18
i386                  randconfig-016-20240925    clang-18
i386                  randconfig-016-20240925    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240925    gcc-14.1.0
loongarch             randconfig-002-20240925    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                       m5208evb_defconfig    clang-20
m68k                        m5407c3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm47xx_defconfig    clang-20
mips                        bcm63xx_defconfig    gcc-14.1.0
mips                         cobalt_defconfig    gcc-14.1.0
mips                           ip28_defconfig    clang-20
mips                      malta_kvm_defconfig    gcc-14.1.0
mips                        omega2p_defconfig    clang-20
mips                          rb532_defconfig    gcc-14.1.0
mips                           rs90_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240925    gcc-14.1.0
nios2                 randconfig-002-20240925    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20240925    gcc-14.1.0
parisc                randconfig-002-20240925    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                     asp8347_defconfig    clang-20
powerpc                       eiger_defconfig    gcc-14.1.0
powerpc                   microwatt_defconfig    clang-20
powerpc                     rainier_defconfig    clang-20
powerpc                     rainier_defconfig    gcc-14.1.0
powerpc               randconfig-001-20240925    gcc-14.1.0
powerpc               randconfig-002-20240925    clang-20
powerpc                     skiroot_defconfig    clang-20
powerpc                        warp_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20240925    gcc-14.1.0
powerpc64             randconfig-002-20240925    clang-20
powerpc64             randconfig-003-20240925    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    clang-20
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.1.0
riscv                 randconfig-001-20240925    clang-20
riscv                 randconfig-002-20240925    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
s390                                defconfig    gcc-12
s390                  randconfig-001-20240925    clang-20
s390                  randconfig-002-20240925    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.1.0
sh                ecovec24-romimage_defconfig    clang-20
sh                             espt_defconfig    gcc-14.1.0
sh                               j2_defconfig    gcc-14.1.0
sh                 kfr2r09-romimage_defconfig    gcc-14.1.0
sh                    randconfig-001-20240925    gcc-14.1.0
sh                    randconfig-002-20240925    gcc-14.1.0
sparc                            alldefconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.1.0
sparc64               randconfig-001-20240925    gcc-14.1.0
sparc64               randconfig-002-20240925    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240925    clang-20
um                    randconfig-002-20240925    clang-20
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240925    clang-18
x86_64      buildonly-randconfig-002-20240925    clang-18
x86_64      buildonly-randconfig-003-20240925    clang-18
x86_64      buildonly-randconfig-003-20240925    gcc-12
x86_64      buildonly-randconfig-004-20240925    clang-18
x86_64      buildonly-randconfig-005-20240925    clang-18
x86_64      buildonly-randconfig-006-20240925    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20240925    clang-18
x86_64                randconfig-001-20240925    gcc-12
x86_64                randconfig-002-20240925    clang-18
x86_64                randconfig-003-20240925    clang-18
x86_64                randconfig-003-20240925    gcc-12
x86_64                randconfig-004-20240925    clang-18
x86_64                randconfig-004-20240925    gcc-12
x86_64                randconfig-005-20240925    clang-18
x86_64                randconfig-006-20240925    clang-18
x86_64                randconfig-011-20240925    clang-18
x86_64                randconfig-012-20240925    clang-18
x86_64                randconfig-013-20240925    clang-18
x86_64                randconfig-014-20240925    clang-18
x86_64                randconfig-015-20240925    clang-18
x86_64                randconfig-016-20240925    clang-18
x86_64                randconfig-071-20240925    clang-18
x86_64                randconfig-072-20240925    clang-18
x86_64                randconfig-073-20240925    clang-18
x86_64                randconfig-074-20240925    clang-18
x86_64                randconfig-075-20240925    clang-18
x86_64                randconfig-076-20240925    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                           alldefconfig    gcc-14.1.0
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-14.1.0
xtensa                randconfig-001-20240925    gcc-14.1.0
xtensa                randconfig-002-20240925    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
