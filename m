Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B3ACDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 06:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D885610E049;
	Wed, 24 Jun 2026 06:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myRhUJtQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDA210E049
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782283412; x=1813819412;
 h=date:from:to:cc:subject:message-id;
 bh=KqPeNAsHhMlhdvQLaSpw0uY91fvPgBH72zabF8HjmrU=;
 b=myRhUJtQzX8J/BJpck2HRHLOyxWRZt911rbjSqqcaSmca7aV/pvQoFT5
 wEVSAw/LMwSZGJtl70m0K/X3yPN6Sd/fWzsIQtjImNsrb7VVhCv20GIbd
 dRY5mlhLSgIiXZP5WcJ/B65vcKp2ue6MsH6NxEDHg/J0JGwn7EaJmNMuB
 fGaUBCNm52RJnvX8WLJBs7F85SZOdh2DtEeQGfVcDcm3nO2QaMw3bGuqB
 E1hSebn55SiUlf5SK4+dNxUgJCf76q6/wezmZpd8WMOxKJ7LWYKxsjptI
 gsV9/QUCa/eRMJEglQ8loFDcoAfHK5gnaTIbYqLhk45tn6m4gJZXyEgPh Q==;
X-CSE-ConnectionGUID: wZDMxFiaR1KAagyP5z1PeA==
X-CSE-MsgGUID: y8TriF2KSLOftccKLUEgKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93395447"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="93395447"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 23:43:32 -0700
X-CSE-ConnectionGUID: ijXVNwgTR6Gy7CrQ8FlPmg==
X-CSE-MsgGUID: nxOGabVTRCuCnsvJVbS4SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="287876516"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 23 Jun 2026 23:43:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wcHKa-000000003Ab-0Lwg;
 Wed, 24 Jun 2026 06:43:28 +0000
Date: Wed, 24 Jun 2026 14:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 692689c97bbb99f191926ec596c9193d95189702
Message-ID: <202606241432.d5wvRYsB-lkp@intel.com>
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
branch HEAD: 692689c97bbb99f191926ec596c9193d95189702  drm/xe/mmio: Prefer tile-based WARN message

elapsed time: 722m

configs tested: 189
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260624    gcc-15.2.0
arc                   randconfig-002-20260624    gcc-15.2.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260624    gcc-15.2.0
arm                   randconfig-002-20260624    gcc-15.2.0
arm                   randconfig-003-20260624    gcc-15.2.0
arm                   randconfig-004-20260624    gcc-15.2.0
arm                        vexpress_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260624    clang-21
arm64                 randconfig-002-20260624    clang-21
arm64                 randconfig-003-20260624    clang-21
arm64                 randconfig-004-20260624    clang-21
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260624    clang-21
csky                  randconfig-002-20260624    clang-21
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260624    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260624    gcc-11.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260624    gcc-12
i386        buildonly-randconfig-002-20260624    gcc-12
i386        buildonly-randconfig-003-20260624    gcc-12
i386        buildonly-randconfig-004-20260624    gcc-12
i386        buildonly-randconfig-005-20260624    gcc-12
i386        buildonly-randconfig-006-20260624    gcc-12
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260624    clang-22
i386                  randconfig-002-20260624    clang-22
i386                  randconfig-003-20260624    clang-22
i386                  randconfig-004-20260624    clang-22
i386                  randconfig-005-20260624    clang-22
i386                  randconfig-006-20260624    clang-22
i386                  randconfig-007-20260624    clang-22
i386                  randconfig-011-20260624    clang-22
i386                  randconfig-012-20260624    clang-22
i386                  randconfig-013-20260624    clang-22
i386                  randconfig-014-20260624    clang-22
i386                  randconfig-015-20260624    clang-22
i386                  randconfig-016-20260624    clang-22
i386                  randconfig-017-20260624    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260624    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260624    gcc-11.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260624    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260624    gcc-11.5.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260624    gcc-16.1.0
parisc                randconfig-002-20260624    gcc-16.1.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                     asp8347_defconfig    clang-23
powerpc               randconfig-001-20260624    gcc-16.1.0
powerpc               randconfig-002-20260624    gcc-16.1.0
powerpc64             randconfig-001-20260624    gcc-16.1.0
powerpc64             randconfig-002-20260624    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-18
riscv                 randconfig-001-20260624    clang-18
riscv                          randconfig-002    clang-18
riscv                 randconfig-002-20260624    clang-18
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-18
s390                  randconfig-001-20260624    clang-18
s390                           randconfig-002    clang-18
s390                  randconfig-002-20260624    clang-18
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-18
sh                    randconfig-001-20260624    clang-18
sh                             randconfig-002    clang-18
sh                    randconfig-002-20260624    clang-18
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260624    gcc-14.3.0
sparc                 randconfig-002-20260624    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260624    gcc-14.3.0
sparc64               randconfig-002-20260624    gcc-14.3.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260624    gcc-14.3.0
um                    randconfig-002-20260624    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260624    clang-22
x86_64      buildonly-randconfig-002-20260624    clang-22
x86_64      buildonly-randconfig-003-20260624    clang-22
x86_64      buildonly-randconfig-004-20260624    clang-22
x86_64      buildonly-randconfig-005-20260624    clang-22
x86_64      buildonly-randconfig-006-20260624    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260624    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260624    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260624    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260624    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260624    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260624    clang-22
x86_64                randconfig-011-20260624    gcc-14
x86_64                randconfig-012-20260624    gcc-14
x86_64                randconfig-013-20260624    gcc-14
x86_64                randconfig-014-20260624    gcc-14
x86_64                randconfig-015-20260624    gcc-14
x86_64                randconfig-016-20260624    gcc-14
x86_64                randconfig-071-20260624    gcc-14
x86_64                randconfig-072-20260624    gcc-14
x86_64                randconfig-073-20260624    gcc-14
x86_64                randconfig-074-20260624    gcc-14
x86_64                randconfig-075-20260624    gcc-14
x86_64                randconfig-076-20260624    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260624    gcc-14.3.0
xtensa                randconfig-002-20260624    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
