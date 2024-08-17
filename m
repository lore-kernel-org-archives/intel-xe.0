Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5E9C5321D
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 19:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0544910E0C6;
	Sat, 17 Aug 2024 19:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuOSYid1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6179510E0C6
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 19:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723921491; x=1755457491;
 h=date:from:to:cc:subject:message-id;
 bh=bRkpECTbmEkmIqqq2t6nFl5xO3ZVcyMkRBxirpevpB0=;
 b=NuOSYid1vAkXslxO5sX4aMOMP4KCj/CFR+Qr3eN2PuchvLQUtsoQ4PFb
 POW4iy7ylHEP5hhZxcV/ZPaKx7jCBsqjt1KnurhonU19q0r3yURzY5enp
 mRS43r/BsS5SLAO6F08ASq7KYCz9ls1p0ev0pL67sBCQdWgJS2+a5Qc2M
 gTWd1Leb4iV1mCxAOu9j2/hldeLXYpYq9hL2EsxPzpKaGq2z5SNIuk1IN
 PmZEeVmdYO3dRXgaYd3wpj5D/gfTOAXzge08Oba7AgQBagPlRuPw+DzVp
 l3nptCe14JYJO2ETQckZgpB/OMg8uQOe/+9EpEG2TtIsmc6EOUVa7otvO Q==;
X-CSE-ConnectionGUID: JQmP7e2eQtaan2JHvxFyyA==
X-CSE-MsgGUID: sZHh08tSQE6yum5Gdg33Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="26066244"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="26066244"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 12:04:50 -0700
X-CSE-ConnectionGUID: 8NW9AJa5R+a/3YFRuVG1cQ==
X-CSE-MsgGUID: rtghRqHkTlqELuQHLkDPbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="64938167"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 17 Aug 2024 12:04:50 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sfOjH-0007ja-1L;
 Sat, 17 Aug 2024 19:04:47 +0000
Date: Sun, 18 Aug 2024 03:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 fc7c7498db3da52efe874029a9c2ccc0ad2646ee
Message-ID: <202408180338.Adv3V081-lkp@intel.com>
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
branch HEAD: fc7c7498db3da52efe874029a9c2ccc0ad2646ee  drm/xe/mcr: Try to derive dss_per_grp from hwconfig attributes

elapsed time: 1468m

configs tested: 101
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240817   gcc-13.2.0
arc                   randconfig-002-20240817   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                     am200epdkit_defconfig   gcc-14.1.0
arm                            mmp2_defconfig   gcc-14.1.0
arm                       multi_v4t_defconfig   clang-20
arm                   randconfig-001-20240817   gcc-14.1.0
arm                   randconfig-002-20240817   clang-20
arm                   randconfig-003-20240817   clang-20
arm                   randconfig-004-20240817   gcc-14.1.0
arm                          sp7021_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240817   clang-20
arm64                 randconfig-002-20240817   gcc-14.1.0
arm64                 randconfig-003-20240817   gcc-14.1.0
arm64                 randconfig-004-20240817   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240817   gcc-14.1.0
csky                  randconfig-002-20240817   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240817   clang-20
hexagon               randconfig-002-20240817   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240817   gcc-12
i386         buildonly-randconfig-002-20240817   gcc-12
i386         buildonly-randconfig-003-20240817   clang-18
i386         buildonly-randconfig-004-20240817   gcc-12
i386         buildonly-randconfig-005-20240817   clang-18
i386         buildonly-randconfig-006-20240817   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240817   gcc-12
i386                  randconfig-002-20240817   gcc-12
i386                  randconfig-003-20240817   gcc-12
i386                  randconfig-004-20240817   clang-18
i386                  randconfig-005-20240817   gcc-12
i386                  randconfig-006-20240817   clang-18
i386                  randconfig-011-20240817   gcc-12
i386                  randconfig-012-20240817   clang-18
i386                  randconfig-013-20240817   gcc-12
i386                  randconfig-014-20240817   gcc-12
i386                  randconfig-015-20240817   gcc-12
i386                  randconfig-016-20240817   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240817   gcc-14.1.0
loongarch             randconfig-002-20240817   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                       m5475evb_defconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240817   gcc-14.1.0
nios2                 randconfig-002-20240817   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240817   gcc-14.1.0
parisc                randconfig-002-20240817   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc               randconfig-001-20240817   clang-14
powerpc               randconfig-002-20240817   gcc-14.1.0
powerpc64             randconfig-001-20240817   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240817   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
