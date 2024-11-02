Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1020E67814
	for <intel-xe@archiver.kernel.org>; Sat,  2 Nov 2024 21:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A1D10E074;
	Sat,  2 Nov 2024 21:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKJD63Zg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA7810E074
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Nov 2024 21:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730583296; x=1762119296;
 h=date:from:to:cc:subject:message-id;
 bh=YSOCKG640ALx9ULBngx5PsNQGDPP5OcGoMxue9OBhu0=;
 b=gKJD63ZgL2054dpumtD5iZR5XiyAvBUBsb4UGUYhhtQjDSc/6iTMty62
 rcs71ryq5ibPOFAe89sLiZcSRoqtUtvNITGxxZaCq9NrG9zMvyQse9eM+
 5GyQwA8CNx6gaA6LY+hhWEn/RwJdZxMJC28keUR0kfSpusqatbUg74r2W
 znZSp+CAJcQ4/EEGpfTYqbTTBYo5Lhiz/YsZaEBo61xykcU0u7/w/cvHA
 8nUrFELGSpxCarYoLDZTuZH3GpPzk31bbTa9vBg+6Ywt6iuwbFJbsVT3j
 N4uYPvvRWUzC4prRiPs8DdYHVQoIKZaL5DMaoKZOVjtPD3mw4uJTBUODh w==;
X-CSE-ConnectionGUID: HTVpfrCQQ2+t0wCKPKy/wQ==
X-CSE-MsgGUID: f83C00apTISRkEVavjw6Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30478024"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30478024"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2024 14:34:56 -0700
X-CSE-ConnectionGUID: JoSFr/mFQZukFdjhd5UYJA==
X-CSE-MsgGUID: 6fLVjWfHTl+v828TksB+tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="88036337"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 02 Nov 2024 14:34:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t7Llk-000jNB-2D;
 Sat, 02 Nov 2024 21:34:52 +0000
Date: Sun, 03 Nov 2024 05:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 a19d1db9a3fa89fabd7c83544b84f393ee9b851f
Message-ID: <202411030521.rKC4hr2y-lkp@intel.com>
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
branch HEAD: a19d1db9a3fa89fabd7c83544b84f393ee9b851f  drm/xe: Restore system memory GGTT mappings

elapsed time: 1719m

configs tested: 106
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241103    gcc-13.2.0
arc                   randconfig-002-20241103    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                         assabet_defconfig    clang-15
arm                         bcm2835_defconfig    clang-20
arm                       netwinder_defconfig    gcc-14.1.0
arm                   randconfig-001-20241103    gcc-14.1.0
arm                   randconfig-002-20241103    gcc-14.1.0
arm                   randconfig-003-20241103    clang-14
arm                   randconfig-004-20241103    clang-17
arm                         s3c6400_defconfig    gcc-14.1.0
arm                        spear6xx_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20241103    gcc-14.1.0
arm64                 randconfig-002-20241103    clang-20
arm64                 randconfig-003-20241103    gcc-14.1.0
arm64                 randconfig-004-20241103    clang-17
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20241103    gcc-14.1.0
csky                  randconfig-002-20241103    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241103    clang-20
hexagon               randconfig-002-20241103    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241102    gcc-12
i386        buildonly-randconfig-002-20241102    gcc-11
i386        buildonly-randconfig-003-20241102    clang-19
i386        buildonly-randconfig-004-20241102    clang-19
i386        buildonly-randconfig-005-20241102    gcc-11
i386        buildonly-randconfig-006-20241102    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241102    gcc-12
i386                  randconfig-002-20241102    clang-19
i386                  randconfig-003-20241102    gcc-12
i386                  randconfig-004-20241102    clang-19
i386                  randconfig-005-20241102    gcc-12
i386                  randconfig-006-20241102    gcc-12
i386                  randconfig-011-20241102    clang-19
i386                  randconfig-012-20241102    gcc-12
i386                  randconfig-013-20241102    clang-19
i386                  randconfig-014-20241102    gcc-12
i386                  randconfig-015-20241102    gcc-12
i386                  randconfig-016-20241102    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20241103    gcc-14.1.0
loongarch             randconfig-002-20241103    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                            mac_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20241103    gcc-14.1.0
nios2                 randconfig-002-20241103    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
parisc                           alldefconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                randconfig-001-20241103    gcc-14.1.0
parisc                randconfig-002-20241103    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                       ppc64_defconfig    clang-20
powerpc               randconfig-001-20241103    clang-20
powerpc               randconfig-002-20241103    clang-20
powerpc                     redwood_defconfig    clang-20
powerpc                 xes_mpc85xx_defconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                          rsk7269_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    gcc-14.1.0
xtensa                    smp_lx200_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
