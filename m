Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1CAD2502E
	for <intel-xe@archiver.kernel.org>; Sun, 11 Jan 2026 13:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FC310E21F;
	Sun, 11 Jan 2026 13:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGExPh8i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1453310E21F
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Jan 2026 13:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768136499; x=1799672499;
 h=date:from:to:cc:subject:message-id;
 bh=CuWYPqY4RS7/ZNCDmMziecWCt9xIvaUMUbvuNQZOFMY=;
 b=RGExPh8ikBHMqyONSepBks188UOonUpnPfwH1STYWYkE//4wiJEJ+r/n
 F9StgeZSRzcc/3XGUTmuCdfF3eDnpOjfoDoQaslMQmcWyRS8pcB1w+CcS
 zotIds/E42lwF4OJa+2y2eCHj4pWYBUwAh1R6zZIqJFx6pj1GZiIyWUJo
 qBSkdW8FEyllQevDUS4V5xAtsj10Pe4pOHJqXIF0Kd4NM9zuUlEpC9Lre
 xSPdal9YPHKMM0tgQKsSTGU6azTEMwf/c03qtcREwRRHPX7X52aZH1dsO
 F73URaAusZm3T+zSnmWlt497HYwYL1WbH1j9qreqr3SR/cWi6alNm5S6P g==;
X-CSE-ConnectionGUID: 6JqaSB+MR7+21yxRgs+jrA==
X-CSE-MsgGUID: TCLJ9OrCRbKRb9SM7k5R5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="80157089"
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; d="scan'208";a="80157089"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 05:01:39 -0800
X-CSE-ConnectionGUID: H6WpiCU7RR2nDOw31nACJw==
X-CSE-MsgGUID: yK8hro78Sb2Nixb8V9UpVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; d="scan'208";a="227171805"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2026 05:01:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vev4Z-00000000A3w-1LqG;
 Sun, 11 Jan 2026 13:01:35 +0000
Date: Sun, 11 Jan 2026 21:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 bb63e7257e6341aa1e48da07b13d2d00fd899fb3
Message-ID: <202601112149.JOyoivKP-lkp@intel.com>
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
branch HEAD: bb63e7257e6341aa1e48da07b13d2d00fd899fb3  drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR

elapsed time: 880m

configs tested: 251
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260111    clang-22
arc                   randconfig-001-20260111    gcc-8.5.0
arc                   randconfig-002-20260111    clang-22
arc                   randconfig-002-20260111    gcc-10.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     davinci_all_defconfig    clang-22
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                          pxa3xx_defconfig    clang-22
arm                          pxa3xx_defconfig    gcc-15.2.0
arm                   randconfig-001-20260111    clang-22
arm                   randconfig-002-20260111    clang-22
arm                   randconfig-003-20260111    clang-22
arm                   randconfig-003-20260111    gcc-13.4.0
arm                   randconfig-004-20260111    clang-22
arm                         s5pv210_defconfig    clang-22
arm                          sp7021_defconfig    gcc-15.2.0
arm                           spitz_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260111    clang-17
arm64                 randconfig-001-20260111    gcc-12.5.0
arm64                 randconfig-002-20260111    gcc-12.5.0
arm64                 randconfig-003-20260111    clang-22
arm64                 randconfig-003-20260111    gcc-12.5.0
arm64                 randconfig-004-20260111    gcc-12.5.0
arm64                 randconfig-004-20260111    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260111    gcc-12.5.0
csky                  randconfig-002-20260111    gcc-11.5.0
csky                  randconfig-002-20260111    gcc-12.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260111    clang-22
hexagon               randconfig-002-20260111    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260111    clang-20
i386        buildonly-randconfig-002-20260111    clang-20
i386        buildonly-randconfig-002-20260111    gcc-13
i386        buildonly-randconfig-003-20260111    clang-20
i386        buildonly-randconfig-004-20260111    clang-20
i386        buildonly-randconfig-005-20260111    clang-20
i386        buildonly-randconfig-006-20260111    clang-20
i386        buildonly-randconfig-006-20260111    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260111    clang-20
i386                  randconfig-002-20260111    clang-20
i386                  randconfig-003-20260111    clang-20
i386                  randconfig-004-20260111    clang-20
i386                  randconfig-004-20260111    gcc-14
i386                  randconfig-005-20260111    clang-20
i386                  randconfig-006-20260111    clang-20
i386                  randconfig-007-20260111    clang-20
i386                  randconfig-007-20260111    gcc-14
i386                  randconfig-011-20260111    clang-20
i386                  randconfig-012-20260111    clang-20
i386                  randconfig-013-20260111    clang-20
i386                  randconfig-014-20260111    clang-20
i386                  randconfig-015-20260111    clang-20
i386                  randconfig-016-20260111    clang-20
i386                  randconfig-016-20260111    gcc-14
i386                  randconfig-017-20260111    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260111    clang-22
loongarch             randconfig-002-20260111    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                        bcm47xx_defconfig    clang-18
mips                       lemote2f_defconfig    clang-18
mips                          rb532_defconfig    clang-18
nios2                         3c120_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260111    clang-22
nios2                 randconfig-001-20260111    gcc-11.5.0
nios2                 randconfig-002-20260111    clang-22
nios2                 randconfig-002-20260111    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260111    clang-22
parisc                randconfig-001-20260111    gcc-8.5.0
parisc                randconfig-002-20260111    clang-22
parisc                randconfig-002-20260111    gcc-10.5.0
parisc64                         alldefconfig    gcc-15.2.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                     akebono_defconfig    clang-22
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                        cell_defconfig    gcc-15.2.0
powerpc                    gamecube_defconfig    clang-22
powerpc                       holly_defconfig    clang-22
powerpc                      katmai_defconfig    clang-22
powerpc                     kmeter1_defconfig    clang-22
powerpc                   microwatt_defconfig    clang-18
powerpc                 mpc832x_rdb_defconfig    gcc-15.2.0
powerpc                       ppc64_defconfig    clang-22
powerpc               randconfig-001-20260111    clang-22
powerpc               randconfig-002-20260111    clang-22
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc                     tqm8548_defconfig    gcc-15.2.0
powerpc                     tqm8555_defconfig    clang-18
powerpc64             randconfig-001-20260111    clang-22
powerpc64             randconfig-002-20260111    clang-19
powerpc64             randconfig-002-20260111    clang-22
riscv                            alldefconfig    gcc-15.2.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_k210_defconfig    clang-18
riscv                 randconfig-001-20260111    clang-22
riscv                 randconfig-001-20260111    gcc-11.5.0
riscv                 randconfig-002-20260111    clang-16
riscv                 randconfig-002-20260111    gcc-11.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260111    gcc-11.5.0
s390                  randconfig-001-20260111    gcc-8.5.0
s390                  randconfig-002-20260111    gcc-11.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                    randconfig-001-20260111    gcc-11.5.0
sh                    randconfig-002-20260111    gcc-11.5.0
sh                    randconfig-002-20260111    gcc-15.2.0
sh                      rts7751r2d1_defconfig    clang-18
sh                           se7722_defconfig    gcc-15.2.0
sh                   secureedge5410_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    gcc-15.2.0
sh                              ul2_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260111    gcc-11.5.0
sparc                 randconfig-001-20260111    gcc-8.5.0
sparc                 randconfig-002-20260111    gcc-12.5.0
sparc                 randconfig-002-20260111    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260111    gcc-8.5.0
sparc64               randconfig-002-20260111    gcc-8.5.0
sparc64               randconfig-002-20260111    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260111    clang-22
um                    randconfig-001-20260111    gcc-8.5.0
um                    randconfig-002-20260111    clang-16
um                    randconfig-002-20260111    gcc-8.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260111    clang-20
x86_64      buildonly-randconfig-002-20260111    clang-20
x86_64      buildonly-randconfig-003-20260111    clang-20
x86_64      buildonly-randconfig-004-20260111    clang-20
x86_64      buildonly-randconfig-005-20260111    clang-20
x86_64      buildonly-randconfig-006-20260111    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260111    gcc-12
x86_64                randconfig-002-20260111    gcc-12
x86_64                randconfig-002-20260111    gcc-14
x86_64                randconfig-003-20260111    gcc-12
x86_64                randconfig-003-20260111    gcc-14
x86_64                randconfig-004-20260111    clang-20
x86_64                randconfig-004-20260111    gcc-12
x86_64                randconfig-005-20260111    gcc-12
x86_64                randconfig-005-20260111    gcc-14
x86_64                randconfig-006-20260111    gcc-12
x86_64                randconfig-006-20260111    gcc-14
x86_64                randconfig-011-20260111    gcc-14
x86_64                randconfig-012-20260111    gcc-14
x86_64                randconfig-013-20260111    clang-20
x86_64                randconfig-014-20260111    clang-20
x86_64                randconfig-015-20260111    clang-20
x86_64                randconfig-016-20260111    clang-20
x86_64                randconfig-071-20260111    clang-20
x86_64                randconfig-071-20260111    gcc-14
x86_64                randconfig-072-20260111    gcc-14
x86_64                randconfig-073-20260111    clang-20
x86_64                randconfig-073-20260111    gcc-14
x86_64                randconfig-074-20260111    gcc-14
x86_64                randconfig-075-20260111    gcc-14
x86_64                randconfig-076-20260111    clang-20
x86_64                randconfig-076-20260111    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    gcc-15.2.0
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                  nommu_kc705_defconfig    clang-18
xtensa                randconfig-001-20260111    gcc-8.5.0
xtensa                randconfig-001-20260111    gcc-9.5.0
xtensa                randconfig-002-20260111    gcc-13.4.0
xtensa                randconfig-002-20260111    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
