Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A220C52D7D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 12:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0713D10E639;
	Fri, 16 Aug 2024 12:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htF3Z59H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A8C10E639
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723813017; x=1755349017;
 h=date:from:to:cc:subject:message-id;
 bh=L2HZ4HaL6OVD9a4KauS1jAFdD/zBhrIqqhcUoNx+IYs=;
 b=htF3Z59HCK2YJhG8VRKVCDh6CPuXXihFjS1JDNRdc1AwyMKl73YSz7cl
 B+L1HXkxEbMpE0aFc8P7KVFhXvHkyshzE/TUOc1dGo6M1aRFsqxlI2XI6
 eKWEBI718FTttqxaFPJznB5aivHbxZkAY+jChS5xev16Jl+m3xDNjPIbP
 Y6hfVbSWk0l5ffjUYbmN/XVL5D7vCv8m9yOM7kYxVRmu0VjdJYc0/dwrv
 +8TIxTQo+MnLSj2CO+Pbj1mijepxdFDcRXCc7WC+UbPcc0iFhlTkCCzC3
 sRzLi8nRAZ4zYNdqXbHP1RJkAoXr+7glhFvKik/oQ/cmU3QPnB3FwTH+t Q==;
X-CSE-ConnectionGUID: tK754J6TRjiKYvLJw5i3jQ==
X-CSE-MsgGUID: dv9RX6OLQCOapOzSM/bmMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22249249"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="22249249"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 05:56:56 -0700
X-CSE-ConnectionGUID: bBtC2qcVQvi5GxxEnKj4Sg==
X-CSE-MsgGUID: 2QMiIq91Q22uWM1Q+CxOTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="64508055"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 16 Aug 2024 05:56:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sewVg-0006R0-2d;
 Fri, 16 Aug 2024 12:56:52 +0000
Date: Fri, 16 Aug 2024 20:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 f002702290fccbd473f5bb94e52f25c96917fff2
Message-ID: <202408162031.UEoMOwXl-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: f002702290fccbd473f5bb94e52f25c96917fff2  drm/xe: Hold a PM ref when GT TLB invalidations are inflight

elapsed time: 1330m

configs tested: 146
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240816   gcc-13.2.0
arc                   randconfig-002-20240816   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                        clps711x_defconfig   clang-20
arm                         lpc32xx_defconfig   clang-20
arm                          pxa910_defconfig   gcc-14.1.0
arm                   randconfig-001-20240816   clang-20
arm                   randconfig-002-20240816   clang-20
arm                   randconfig-003-20240816   clang-20
arm                   randconfig-004-20240816   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240816   clang-20
arm64                 randconfig-002-20240816   clang-20
arm64                 randconfig-003-20240816   clang-20
arm64                 randconfig-004-20240816   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240816   gcc-14.1.0
csky                  randconfig-002-20240816   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   clang-20
hexagon               randconfig-001-20240816   clang-20
hexagon               randconfig-002-20240816   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240816   gcc-12
i386         buildonly-randconfig-004-20240816   clang-18
i386         buildonly-randconfig-005-20240816   gcc-11
i386         buildonly-randconfig-006-20240816   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240816   clang-18
i386                  randconfig-002-20240816   gcc-12
i386                  randconfig-003-20240816   gcc-11
i386                  randconfig-004-20240816   gcc-12
i386                  randconfig-005-20240816   clang-18
i386                  randconfig-006-20240816   gcc-11
i386                  randconfig-011-20240816   gcc-12
i386                  randconfig-012-20240816   clang-18
i386                  randconfig-013-20240816   clang-18
i386                  randconfig-014-20240816   gcc-12
i386                  randconfig-015-20240816   gcc-12
i386                  randconfig-016-20240816   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240816   gcc-14.1.0
loongarch             randconfig-002-20240816   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240816   gcc-14.1.0
nios2                 randconfig-002-20240816   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240816   gcc-14.1.0
parisc                randconfig-002-20240816   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc               randconfig-002-20240816   clang-20
powerpc64             randconfig-001-20240816   gcc-14.1.0
powerpc64             randconfig-002-20240816   clang-20
powerpc64             randconfig-003-20240816   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240816   clang-20
riscv                 randconfig-002-20240816   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240816   gcc-14.1.0
s390                  randconfig-002-20240816   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240816   gcc-14.1.0
sh                    randconfig-002-20240816   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240816   gcc-14.1.0
sparc64               randconfig-002-20240816   gcc-14.1.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240816   clang-20
um                    randconfig-002-20240816   gcc-12
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240816   clang-18
x86_64       buildonly-randconfig-002-20240816   gcc-12
x86_64       buildonly-randconfig-003-20240816   gcc-12
x86_64       buildonly-randconfig-004-20240816   clang-18
x86_64       buildonly-randconfig-005-20240816   clang-18
x86_64       buildonly-randconfig-006-20240816   gcc-12
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240816   gcc-12
x86_64                randconfig-002-20240816   clang-18
x86_64                randconfig-003-20240816   clang-18
x86_64                randconfig-004-20240816   clang-18
x86_64                randconfig-005-20240816   clang-18
x86_64                randconfig-006-20240816   gcc-12
x86_64                randconfig-011-20240816   clang-18
x86_64                randconfig-012-20240816   gcc-12
x86_64                randconfig-013-20240816   gcc-12
x86_64                randconfig-014-20240816   clang-18
x86_64                randconfig-015-20240816   clang-18
x86_64                randconfig-016-20240816   clang-18
x86_64                randconfig-071-20240816   clang-18
x86_64                randconfig-072-20240816   gcc-11
x86_64                randconfig-073-20240816   gcc-12
x86_64                randconfig-074-20240816   clang-18
x86_64                randconfig-076-20240816   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240816   gcc-14.1.0
xtensa                randconfig-002-20240816   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
