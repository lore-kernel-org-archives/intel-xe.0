Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F71EC2BD09
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 23:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E1710E03E;
	Wed,  3 Jul 2024 23:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Otq3FHux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B10710E03E
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 23:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720048693; x=1751584693;
 h=date:from:to:cc:subject:message-id;
 bh=gwX/eNhA39rGQrjgE06wiVtROLDTOcHTbR8a3Xz9Fw0=;
 b=Otq3FHuxxF8AHqXjqsF1yRgS+WwBtl084c3OyUknpmjv+NF34UaV3RIR
 q3UDszENV1ziwnNgNDIfjTzQiIboEcnqV1rmd/+0hxA+jylnDVvBZ5vUe
 2Z/esxdBvIPhokUgT7KFI9ZHbKmhsnQlgnYWHWXYlkM/YBHWJ/VZKUr2V
 fjF5RHRI3NlBWXz5F+MPLPbOSVOYJOfguG0v9pA7z9A91PP1tK7GIONIk
 sNEL0m6ZzeWAqnsuixtjQFMUAhYZQmp2B3hiIiZ5gQ1EwS3dBdWC7Ay4I
 YN4WRvj2GcxpcbICkOK3YwD2FPbXs9jCexY3LP5Bv/+/ArhM7gE41LYUZ g==;
X-CSE-ConnectionGUID: Gjqk8F4USI6sVnKr5C6akQ==
X-CSE-MsgGUID: 1Sq62qEqQz+5Fo9G7zvKwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17029433"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17029433"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 16:18:13 -0700
X-CSE-ConnectionGUID: ew/cNBgVRa+vYSKsHolNyQ==
X-CSE-MsgGUID: FGJVcycvQVCQ64v3ida8kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="51261903"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 03 Jul 2024 16:18:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sP9En-000QK0-32;
 Wed, 03 Jul 2024 23:18:09 +0000
Date: Thu, 04 Jul 2024 07:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 7c0389c615b5c6aef1b0e38e30db759b3cbff885
Message-ID: <202407040717.arJN10mJ-lkp@intel.com>
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
branch HEAD: 7c0389c615b5c6aef1b0e38e30db759b3cbff885  drm/xe/guc: Demote GuC IDs usage message to debug

elapsed time: 1799m

configs tested: 108
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                   randconfig-001-20240703   gcc-13.2.0
arc                   randconfig-002-20240703   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                           h3600_defconfig   gcc-13.2.0
arm                   randconfig-001-20240703   clang-19
arm                   randconfig-002-20240703   gcc-13.2.0
arm                   randconfig-003-20240703   clang-19
arm                   randconfig-004-20240703   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240703   clang-19
arm64                 randconfig-002-20240703   gcc-13.2.0
arm64                 randconfig-003-20240703   gcc-13.2.0
arm64                 randconfig-004-20240703   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240703   gcc-13.2.0
csky                  randconfig-002-20240703   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon               randconfig-001-20240703   clang-16
hexagon               randconfig-002-20240703   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240703   clang-18
i386         buildonly-randconfig-002-20240703   gcc-13
i386         buildonly-randconfig-003-20240703   gcc-13
i386         buildonly-randconfig-004-20240703   gcc-13
i386         buildonly-randconfig-005-20240703   clang-18
i386         buildonly-randconfig-006-20240703   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240703   gcc-13
i386                  randconfig-002-20240703   clang-18
i386                  randconfig-003-20240703   gcc-13
i386                  randconfig-004-20240703   gcc-11
i386                  randconfig-005-20240703   clang-18
i386                  randconfig-006-20240703   gcc-7
i386                  randconfig-011-20240703   gcc-13
i386                  randconfig-012-20240703   gcc-13
i386                  randconfig-013-20240703   gcc-13
i386                  randconfig-014-20240703   gcc-13
i386                  randconfig-015-20240703   gcc-13
i386                  randconfig-016-20240703   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240703   gcc-13.2.0
loongarch             randconfig-002-20240703   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                          atari_defconfig   gcc-13.2.0
m68k                        stmark2_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           mtx1_defconfig   gcc-13.2.0
mips                          rm200_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240703   gcc-13.2.0
nios2                 randconfig-002-20240703   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                randconfig-001-20240703   gcc-13.2.0
parisc                randconfig-002-20240703   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                     asp8347_defconfig   gcc-13.2.0
powerpc                     ep8248e_defconfig   gcc-13.2.0
powerpc               mpc834x_itxgp_defconfig   gcc-13.2.0
powerpc                      ppc40x_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240703   clang-19
powerpc               randconfig-002-20240703   gcc-13.2.0
powerpc               randconfig-003-20240703   clang-15
powerpc64             randconfig-001-20240703   gcc-13.2.0
powerpc64             randconfig-002-20240703   gcc-13.2.0
powerpc64             randconfig-003-20240703   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-001-20240703   clang-19
riscv                 randconfig-002-20240703   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                  randconfig-001-20240703   clang-15
s390                  randconfig-002-20240703   clang-19
sh                                allnoconfig   gcc-13.2.0
sh                        edosk7760_defconfig   gcc-13.2.0
sh                    randconfig-001-20240703   gcc-13.2.0
sh                    randconfig-002-20240703   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-13.2.0
sparc64               randconfig-001-20240703   gcc-13.2.0
sparc64               randconfig-002-20240703   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240703   clang-19
um                    randconfig-002-20240703   clang-19
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240703   gcc-13.2.0
xtensa                randconfig-002-20240703   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
