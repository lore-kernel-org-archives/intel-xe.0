Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249EBD3B992
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 19:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D808710E5C9;
	Tue,  9 Dec 2025 19:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gI3NYTFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580E710E5C9
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 19:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765309927; x=1796845927;
 h=date:from:to:cc:subject:message-id;
 bh=qI/Sc8pMMCFG+2o5aqs5AdEpZpfNtPeouuvD4Ns2rek=;
 b=gI3NYTFIEpYn0TMDYqQa3fuvk1tepXPCHlVmtyX3K+ScCLVksYGu7PoZ
 xIkCEkUrPPLAcTw6Zx/4RvA5ogDC/GDhAfBUha+Ay0G0AZKNp2RmhmxJO
 EmPV/YfTHLJ0KXvQ82gYUgyg+ov1PLjgg+merj17U/8Ju8J06WU/GbrUy
 XppKduqEkjpd5XLVJ1KDoDnklnz60kweegZtA5V6sNhZyI2z3b1tQxazk
 349LfRureuIt7M8+oWBjPyp/SBhHuWElgAE3NVO0BaZWV2etytQODKl8U
 EmgsZbKTeuVaYG7lH2iZt6+t2T5CWpNgzgnZN/6wEREnQgafpu5QdfJXg g==;
X-CSE-ConnectionGUID: 2G63Sg+eTeWv+2rmJWaxrg==
X-CSE-MsgGUID: M+tpBD70Q+OCjNa9I69dnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67206340"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67206340"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 11:52:07 -0800
X-CSE-ConnectionGUID: ixdzGhhWRDei2LmIurI1+Q==
X-CSE-MsgGUID: ycYe3eGlSoCvJI+CjcrNZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="200483487"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 09 Dec 2025 11:52:06 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vT3kh-000000002DN-196L;
 Tue, 09 Dec 2025 19:52:03 +0000
Date: Wed, 10 Dec 2025 03:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 b64a14334ef3ebbcf70d11bc67d0934bdc0e390d
Message-ID: <202512100341.aEj256r6-lkp@intel.com>
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
branch HEAD: b64a14334ef3ebbcf70d11bc67d0934bdc0e390d  drm/xe/throttle: Skip reason prefix while emitting array

elapsed time: 1751m

configs tested: 278
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                     nsimosci_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251209    clang-22
arc                   randconfig-001-20251209    gcc-13.4.0
arc                   randconfig-002-20251209    clang-22
arc                   randconfig-002-20251209    gcc-9.5.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20251209    clang-19
arm                   randconfig-001-20251209    clang-22
arm                   randconfig-002-20251209    clang-20
arm                   randconfig-002-20251209    clang-22
arm                   randconfig-003-20251209    clang-22
arm                   randconfig-004-20251209    clang-22
arm                           sama5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251209    gcc-8.5.0
arm64                 randconfig-001-20251209    gcc-9.5.0
arm64                 randconfig-002-20251209    gcc-9.5.0
arm64                 randconfig-003-20251209    clang-22
arm64                 randconfig-003-20251209    gcc-9.5.0
arm64                 randconfig-004-20251209    gcc-11.5.0
arm64                 randconfig-004-20251209    gcc-9.5.0
csky                             alldefconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251209    gcc-15.1.0
csky                  randconfig-001-20251209    gcc-9.5.0
csky                  randconfig-002-20251209    gcc-15.1.0
csky                  randconfig-002-20251209    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251209    clang-22
hexagon               randconfig-002-20251209    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251209    clang-20
i386        buildonly-randconfig-001-20251209    gcc-14
i386        buildonly-randconfig-002-20251209    clang-20
i386        buildonly-randconfig-002-20251209    gcc-14
i386        buildonly-randconfig-003-20251209    gcc-14
i386        buildonly-randconfig-004-20251209    gcc-14
i386        buildonly-randconfig-005-20251209    gcc-14
i386        buildonly-randconfig-006-20251209    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251209    clang-20
i386                  randconfig-001-20251209    gcc-14
i386                  randconfig-002-20251209    clang-20
i386                  randconfig-003-20251209    clang-20
i386                  randconfig-004-20251209    clang-20
i386                  randconfig-004-20251209    gcc-14
i386                  randconfig-005-20251209    clang-20
i386                  randconfig-005-20251209    gcc-14
i386                  randconfig-006-20251209    clang-20
i386                  randconfig-007-20251209    clang-20
i386                  randconfig-007-20251209    gcc-14
i386                  randconfig-011-20251208    gcc-14
i386                  randconfig-011-20251209    gcc-14
i386                  randconfig-012-20251208    clang-20
i386                  randconfig-012-20251209    gcc-14
i386                  randconfig-013-20251208    gcc-14
i386                  randconfig-013-20251209    gcc-14
i386                  randconfig-014-20251208    gcc-14
i386                  randconfig-014-20251209    gcc-14
i386                  randconfig-015-20251208    clang-20
i386                  randconfig-015-20251209    gcc-14
i386                  randconfig-016-20251208    gcc-12
i386                  randconfig-016-20251209    gcc-14
i386                  randconfig-017-20251208    gcc-14
i386                  randconfig-017-20251209    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251209    clang-22
loongarch             randconfig-002-20251209    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-22
mips                            gpr_defconfig    gcc-15.1.0
mips                           ip22_defconfig    gcc-15.1.0
mips                           ip28_defconfig    gcc-15.1.0
mips                        omega2p_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251209    clang-22
nios2                 randconfig-001-20251209    gcc-8.5.0
nios2                 randconfig-002-20251209    clang-22
nios2                 randconfig-002-20251209    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251208    gcc-8.5.0
parisc                randconfig-001-20251209    gcc-15.1.0
parisc                randconfig-002-20251208    gcc-8.5.0
parisc                randconfig-002-20251209    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   currituck_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251208    clang-22
powerpc               randconfig-001-20251209    gcc-15.1.0
powerpc               randconfig-002-20251208    gcc-14.3.0
powerpc               randconfig-002-20251209    gcc-15.1.0
powerpc                     tqm5200_defconfig    gcc-15.1.0
powerpc                     tqm8541_defconfig    clang-22
powerpc64             randconfig-001-20251208    gcc-14.3.0
powerpc64             randconfig-001-20251209    gcc-15.1.0
powerpc64             randconfig-002-20251208    clang-22
powerpc64             randconfig-002-20251209    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251209    clang-22
riscv                 randconfig-002-20251209    clang-18
riscv                 randconfig-002-20251209    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251209    clang-22
s390                  randconfig-001-20251209    gcc-12.5.0
s390                  randconfig-002-20251209    clang-22
s390                  randconfig-002-20251209    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                        dreamcast_defconfig    gcc-15.1.0
sh                    randconfig-001-20251209    clang-22
sh                    randconfig-001-20251209    gcc-14.3.0
sh                    randconfig-002-20251209    clang-22
sh                    randconfig-002-20251209    gcc-13.4.0
sh                          sdk7780_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251209    gcc-10.5.0
sparc                 randconfig-001-20251209    gcc-11.5.0
sparc                 randconfig-002-20251209    gcc-10.5.0
sparc                 randconfig-002-20251209    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251209    clang-22
sparc64               randconfig-001-20251209    gcc-10.5.0
sparc64               randconfig-002-20251209    clang-20
sparc64               randconfig-002-20251209    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251209    gcc-10.5.0
um                    randconfig-001-20251209    gcc-14
um                    randconfig-002-20251209    gcc-10.5.0
um                    randconfig-002-20251209    gcc-14
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251208    gcc-14
x86_64      buildonly-randconfig-001-20251209    gcc-14
x86_64      buildonly-randconfig-002-20251208    clang-20
x86_64      buildonly-randconfig-002-20251209    gcc-14
x86_64      buildonly-randconfig-003-20251208    gcc-14
x86_64      buildonly-randconfig-003-20251209    gcc-14
x86_64      buildonly-randconfig-004-20251208    gcc-14
x86_64      buildonly-randconfig-004-20251209    gcc-14
x86_64      buildonly-randconfig-005-20251208    gcc-13
x86_64      buildonly-randconfig-005-20251209    gcc-14
x86_64      buildonly-randconfig-006-20251208    gcc-14
x86_64      buildonly-randconfig-006-20251209    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251208    gcc-14
x86_64                randconfig-001-20251209    gcc-14
x86_64                randconfig-002-20251208    gcc-12
x86_64                randconfig-002-20251209    gcc-14
x86_64                randconfig-003-20251208    gcc-14
x86_64                randconfig-003-20251209    gcc-14
x86_64                randconfig-004-20251208    clang-20
x86_64                randconfig-004-20251209    gcc-14
x86_64                randconfig-005-20251208    gcc-14
x86_64                randconfig-005-20251209    gcc-14
x86_64                randconfig-006-20251208    clang-20
x86_64                randconfig-006-20251209    gcc-14
x86_64                randconfig-011-20251208    clang-20
x86_64                randconfig-011-20251209    clang-20
x86_64                randconfig-012-20251208    clang-20
x86_64                randconfig-012-20251209    clang-20
x86_64                randconfig-013-20251208    gcc-14
x86_64                randconfig-013-20251209    clang-20
x86_64                randconfig-014-20251208    clang-20
x86_64                randconfig-014-20251209    clang-20
x86_64                randconfig-015-20251208    gcc-14
x86_64                randconfig-015-20251209    clang-20
x86_64                randconfig-016-20251208    clang-20
x86_64                randconfig-016-20251209    clang-20
x86_64                randconfig-071-20251208    clang-20
x86_64                randconfig-071-20251209    gcc-14
x86_64                randconfig-072-20251208    clang-20
x86_64                randconfig-072-20251209    gcc-14
x86_64                randconfig-073-20251208    clang-20
x86_64                randconfig-073-20251209    gcc-14
x86_64                randconfig-074-20251208    clang-20
x86_64                randconfig-074-20251209    gcc-14
x86_64                randconfig-075-20251208    clang-20
x86_64                randconfig-075-20251209    gcc-14
x86_64                randconfig-076-20251208    clang-20
x86_64                randconfig-076-20251209    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251209    gcc-10.5.0
xtensa                randconfig-001-20251209    gcc-13.4.0
xtensa                randconfig-002-20251209    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
