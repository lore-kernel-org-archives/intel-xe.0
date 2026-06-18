Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834B8CD98E4
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 01:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB3710E694;
	Thu, 18 Jun 2026 01:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aw7Nonbk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9112F10E694
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 01:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781745610; x=1813281610;
 h=date:from:to:cc:subject:message-id;
 bh=/v57d3aRORi0d5+CXyb6Vc+YnvOPYcN4IxJHtjuPniY=;
 b=Aw7NonbkQNY9/n3lF4drY9M0CxFSCiqlBPPAOrTjAXslcZWErF15cwu7
 LS+rj1oC2/PAptVXxLleOksRK7KGiBEdaDhlbF4wS39gDLPLr6p3SBUp9
 XmtotT8ejNzQcNkvUFyYuJsEBWeRNLFSp4gcEXIfdPYdPBh3uFwBfSdY/
 WZUp3KAhGHnBO+61bXkMIvyO1taN2INuPE1FGCo9M5uhNPrQU6UAPou5e
 dFFqq3VGo1iUJI2lTp7P/Ci8kAVjaRZodziMoJWJwJF5Zw8aAF2V76Ujd
 cABDlhg5ZBEssJUQS8m8RUq1vvOJCcRpIQb6/z4ahEcLJe3Rbzn5Q3ClS Q==;
X-CSE-ConnectionGUID: nrpKUfwoRbux16JjOBY5Gg==
X-CSE-MsgGUID: KVsy91vPQcCnTDfEXpG5bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="94069715"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="94069715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 18:20:10 -0700
X-CSE-ConnectionGUID: G0RCSSqIT+ODIMSML36vng==
X-CSE-MsgGUID: Ogba2n1uTGWjHFrEAhymWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="248288444"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 17 Jun 2026 18:20:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wa1QL-00000000V9a-3cGV;
 Thu, 18 Jun 2026 01:20:05 +0000
Date: Thu, 18 Jun 2026 09:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 ea8439751ddc3af189121100631554ebe4bbb2d4
Message-ID: <202606180939.tMemUUiF-lkp@intel.com>
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
branch HEAD: ea8439751ddc3af189121100631554ebe4bbb2d4  drm/xe/hwmon: document DG2 fan speed reporting quirk

elapsed time: 834m

configs tested: 232
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260618    gcc-15.2.0
arc                   randconfig-002-20260618    gcc-15.2.0
arc                   randconfig-002-20260618    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                       multi_v4t_defconfig    clang-19
arm                   randconfig-001-20260618    gcc-10.5.0
arm                   randconfig-001-20260618    gcc-15.2.0
arm                   randconfig-002-20260618    clang-23
arm                   randconfig-002-20260618    gcc-15.2.0
arm                   randconfig-003-20260618    gcc-13.4.0
arm                   randconfig-003-20260618    gcc-15.2.0
arm                   randconfig-004-20260618    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-15.2.0
arm64                 randconfig-001-20260618    gcc-15.2.0
arm64                          randconfig-002    gcc-15.2.0
arm64                 randconfig-002-20260618    gcc-15.2.0
arm64                          randconfig-003    gcc-15.2.0
arm64                 randconfig-003-20260618    gcc-15.2.0
arm64                          randconfig-004    gcc-15.2.0
arm64                 randconfig-004-20260618    gcc-15.2.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-15.2.0
csky                  randconfig-001-20260618    gcc-15.2.0
csky                           randconfig-002    gcc-15.2.0
csky                  randconfig-002-20260618    gcc-15.2.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    clang-23
hexagon               randconfig-001-20260617    clang-22
hexagon               randconfig-001-20260618    clang-23
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260617    clang-17
hexagon               randconfig-002-20260618    clang-23
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260618    gcc-14
i386        buildonly-randconfig-002-20260618    gcc-14
i386        buildonly-randconfig-003-20260618    gcc-14
i386        buildonly-randconfig-004-20260618    gcc-14
i386        buildonly-randconfig-005-20260618    gcc-14
i386        buildonly-randconfig-006-20260618    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260618    clang-22
i386                  randconfig-001-20260618    gcc-14
i386                  randconfig-002-20260618    clang-22
i386                  randconfig-003-20260618    clang-22
i386                  randconfig-003-20260618    gcc-14
i386                  randconfig-004-20260618    clang-22
i386                  randconfig-005-20260618    clang-22
i386                  randconfig-005-20260618    gcc-14
i386                  randconfig-006-20260618    clang-22
i386                  randconfig-006-20260618    gcc-12
i386                  randconfig-007-20260618    clang-22
i386                  randconfig-007-20260618    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    clang-23
loongarch             randconfig-001-20260617    gcc-16.1.0
loongarch             randconfig-001-20260618    clang-23
loongarch                      randconfig-002    gcc-16.1.0
loongarch             randconfig-002-20260617    clang-23
loongarch             randconfig-002-20260618    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260617    gcc-8.5.0
nios2                 randconfig-001-20260618    clang-23
nios2                          randconfig-002    gcc-8.5.0
nios2                 randconfig-002-20260617    gcc-8.5.0
nios2                 randconfig-002-20260618    clang-23
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-23
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260618    gcc-14.3.0
parisc                randconfig-001-20260618    gcc-16.1.0
parisc                randconfig-002-20260618    gcc-16.1.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                       ppc64_defconfig    clang-16
powerpc               randconfig-001-20260618    gcc-16.1.0
powerpc               randconfig-001-20260618    gcc-8.5.0
powerpc               randconfig-002-20260618    gcc-11.5.0
powerpc               randconfig-002-20260618    gcc-16.1.0
powerpc64             randconfig-001-20260618    gcc-16.1.0
powerpc64             randconfig-001-20260618    gcc-8.5.0
powerpc64             randconfig-002-20260618    clang-23
powerpc64             randconfig-002-20260618    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260618    gcc-13.4.0
riscv                 randconfig-002-20260618    gcc-13.4.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260618    gcc-13.4.0
s390                  randconfig-002-20260618    gcc-13.4.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-23
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260618    gcc-13.4.0
sh                    randconfig-002-20260618    gcc-13.4.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260618    gcc-14.3.0
sparc                 randconfig-001-20260618    gcc-16.1.0
sparc                 randconfig-002-20260618    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260618    clang-22
sparc64               randconfig-001-20260618    gcc-14.3.0
sparc64               randconfig-002-20260618    gcc-10.5.0
sparc64               randconfig-002-20260618    gcc-14.3.0
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260618    gcc-14
um                    randconfig-001-20260618    gcc-14.3.0
um                    randconfig-002-20260618    gcc-14
um                    randconfig-002-20260618    gcc-14.3.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260618    clang-22
x86_64      buildonly-randconfig-002-20260618    clang-22
x86_64      buildonly-randconfig-003-20260618    clang-22
x86_64      buildonly-randconfig-004-20260618    clang-22
x86_64      buildonly-randconfig-004-20260618    gcc-14
x86_64      buildonly-randconfig-005-20260618    clang-22
x86_64      buildonly-randconfig-006-20260618    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260618    clang-22
x86_64                randconfig-002-20260618    clang-22
x86_64                randconfig-003-20260618    clang-22
x86_64                randconfig-004-20260618    clang-22
x86_64                randconfig-005-20260618    clang-22
x86_64                randconfig-006-20260618    clang-22
x86_64                randconfig-011-20260618    gcc-14
x86_64                randconfig-012-20260618    gcc-14
x86_64                randconfig-013-20260618    gcc-14
x86_64                randconfig-014-20260618    gcc-14
x86_64                randconfig-015-20260618    gcc-14
x86_64                randconfig-016-20260618    gcc-14
x86_64                randconfig-071-20260618    clang-22
x86_64                randconfig-072-20260618    clang-22
x86_64                randconfig-073-20260618    clang-22
x86_64                randconfig-074-20260618    clang-22
x86_64                randconfig-075-20260618    clang-22
x86_64                randconfig-076-20260618    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260618    gcc-14.3.0
xtensa                randconfig-001-20260618    gcc-16.1.0
xtensa                randconfig-002-20260618    gcc-14.3.0
xtensa                randconfig-002-20260618    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
