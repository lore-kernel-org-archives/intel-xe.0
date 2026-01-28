Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E7FD3F070
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 14:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815C110E701;
	Wed, 28 Jan 2026 14:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwrQaXYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A142310E701
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769610464; x=1801146464;
 h=date:from:to:cc:subject:message-id;
 bh=/IL7zW1J8qL0Kbt+Ldx+8mqzOWTzFzNt46oj0RF6gr4=;
 b=NwrQaXYSCUufFnltDvD7CgdAyHF1HK1zUG9BX8w29ooJzOWcjQ6gBbN2
 UUkk9j6p14hQS96Dgo/En59Pmx9rqUD58/pGnDNHs8A68WqE+C8g6jQKW
 wxT9oC6yczdAL9D/8kd7muQx/BnV0ju7pzwXCTKffaSwNy+LXPoFLu0t4
 8V/sEMVfJp6PWVwN0AVUo7SYZqRx3ZndCMxq1Vo56ANduvvFKzYetjvy6
 BBSLuRCTAJtZXax0lXRXGmZtqLzj4NRcSYn3R5c6DctZDKXbwCau+JhmA
 u3CuSA6xi3itbyRs5oA+H+yH2BXn/AYwPtY8hRBLEQK5NUlaKYg+SItZu A==;
X-CSE-ConnectionGUID: MgF4UZrkT+u85AvyOaJCFg==
X-CSE-MsgGUID: ley6tQAKTdmj79DNqZ0Cew==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88396035"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="88396035"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:27:44 -0800
X-CSE-ConnectionGUID: a1pjx54bSAqtt+JDoPd7ag==
X-CSE-MsgGUID: Yl9X6mB0TRG5YfsmM9sndw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="239007079"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 28 Jan 2026 06:27:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vl6WC-00000000ZkK-0KPv;
 Wed, 28 Jan 2026 14:27:40 +0000
Date: Wed, 28 Jan 2026 22:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 96c2c72b817d70e8d110e78b0162e044a0c41f9f
Message-ID: <202601282219.J8EnSHqY-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: 96c2c72b817d70e8d110e78b0162e044a0c41f9f  drm/xe: Unregister drm device on probe error

elapsed time: 1020m

configs tested: 198
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    clang-22
arc                            hsdk_defconfig    clang-22
arc                   randconfig-001-20260128    gcc-8.5.0
arc                   randconfig-002-20260128    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g4_defconfig    clang-22
arm                         at91_dt_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260128    gcc-8.5.0
arm                   randconfig-002-20260128    gcc-8.5.0
arm                   randconfig-003-20260128    gcc-8.5.0
arm                   randconfig-004-20260128    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260128    gcc-14.3.0
arm64                 randconfig-002-20260128    gcc-14.3.0
arm64                 randconfig-003-20260128    gcc-14.3.0
arm64                 randconfig-004-20260128    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260128    gcc-14.3.0
csky                  randconfig-002-20260128    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260128    clang-22
hexagon               randconfig-002-20260128    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260128    clang-20
i386        buildonly-randconfig-001-20260128    gcc-14
i386        buildonly-randconfig-002-20260128    clang-20
i386        buildonly-randconfig-003-20260128    clang-20
i386        buildonly-randconfig-003-20260128    gcc-14
i386        buildonly-randconfig-004-20260128    clang-20
i386        buildonly-randconfig-005-20260128    clang-20
i386        buildonly-randconfig-005-20260128    gcc-14
i386        buildonly-randconfig-006-20260128    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260128    gcc-14
i386                  randconfig-002-20260128    gcc-14
i386                  randconfig-003-20260128    gcc-14
i386                  randconfig-004-20260128    gcc-14
i386                  randconfig-005-20260128    gcc-14
i386                  randconfig-006-20260128    gcc-14
i386                  randconfig-007-20260128    gcc-14
i386                  randconfig-011-20260128    clang-20
i386                  randconfig-012-20260128    clang-20
i386                  randconfig-013-20260128    clang-20
i386                  randconfig-014-20260128    clang-20
i386                  randconfig-015-20260128    clang-20
i386                  randconfig-016-20260128    clang-20
i386                  randconfig-017-20260128    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260128    clang-22
loongarch             randconfig-002-20260128    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5275evb_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260128    clang-22
nios2                 randconfig-002-20260128    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                  or1klitex_defconfig    clang-22
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260128    gcc-11.5.0
parisc                randconfig-002-20260128    gcc-11.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 linkstation_defconfig    clang-22
powerpc               randconfig-001-20260128    gcc-11.5.0
powerpc               randconfig-002-20260128    gcc-11.5.0
powerpc64             randconfig-001-20260128    gcc-11.5.0
powerpc64             randconfig-002-20260128    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260128    gcc-13.4.0
riscv                 randconfig-002-20260128    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260128    gcc-13.4.0
s390                  randconfig-002-20260128    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260128    gcc-13.4.0
sh                    randconfig-002-20260128    gcc-13.4.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260128    gcc-11.5.0
sparc                 randconfig-002-20260128    gcc-11.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260128    gcc-11.5.0
sparc64               randconfig-002-20260128    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260128    gcc-11.5.0
um                    randconfig-002-20260128    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260128    gcc-14
x86_64      buildonly-randconfig-002-20260128    gcc-14
x86_64      buildonly-randconfig-003-20260128    gcc-14
x86_64      buildonly-randconfig-004-20260128    gcc-14
x86_64      buildonly-randconfig-005-20260128    gcc-14
x86_64      buildonly-randconfig-006-20260128    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260128    gcc-13
x86_64                randconfig-002-20260128    gcc-13
x86_64                randconfig-003-20260128    gcc-13
x86_64                randconfig-004-20260128    gcc-13
x86_64                randconfig-005-20260128    gcc-13
x86_64                randconfig-006-20260128    gcc-13
x86_64                randconfig-071-20260128    clang-20
x86_64                randconfig-072-20260128    clang-20
x86_64                randconfig-073-20260128    clang-20
x86_64                randconfig-073-20260128    gcc-12
x86_64                randconfig-074-20260128    clang-20
x86_64                randconfig-074-20260128    gcc-14
x86_64                randconfig-075-20260128    clang-20
x86_64                randconfig-075-20260128    gcc-14
x86_64                randconfig-076-20260128    clang-20
x86_64                randconfig-076-20260128    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260128    gcc-11.5.0
xtensa                randconfig-002-20260128    gcc-11.5.0
xtensa                    xip_kc705_defconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
