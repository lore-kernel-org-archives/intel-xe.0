Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DB6EA8104
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 12:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDAB10E563;
	Tue, 10 Feb 2026 12:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CswyWYk5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C4610E563
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 12:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770724961; x=1802260961;
 h=date:from:to:cc:subject:message-id;
 bh=b+1ztPPz1uvtT9QIR2r59TlL4t4O+PqrRPsTy7vuJEU=;
 b=CswyWYk5xgzWtRk7NrMUgjM/CFAM4ffiQIQx9/1q0eD7SZl/nTreXNqC
 5BjT6o7SHNyTPLN+sZcgnob99i7WjZ9Xn1b7tDWXpOF/r6IjTIGqyfkcX
 5Oqa43fyGrfsHQmLAymNXYt6XnOXKyEDl9oxZcobauDMKrE108Gl0VL6C
 or9n0pmxGfLyJZ66VWT90X+EsgUI8s9pGEW5EoFSP9xDBOxXwOrY+3Q47
 2AahGJVXgybhHOcO5KeV2oeo874nenD6mvTgqjYQ1A+EQZLNTLyCaFD0a
 P6DVyW+51woLffJuSU7/KO3LARGLIE6zYN/eZLFu2Fan1rI5szv2HUFs4 Q==;
X-CSE-ConnectionGUID: 3K6scnYVSlm/XMHL6kY1uA==
X-CSE-MsgGUID: iV+iuLVqSkyTvS0/JSTjBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71893903"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71893903"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 04:02:40 -0800
X-CSE-ConnectionGUID: 0azfAKFwQOCiBHsqcwgy6w==
X-CSE-MsgGUID: Cy9eDN1QTV2A9qqabgVhZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216860751"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 10 Feb 2026 04:02:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vpmRw-00000000oyy-1z6V;
 Tue, 10 Feb 2026 12:02:36 +0000
Date: Tue, 10 Feb 2026 20:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 a30f999681126b128a43137793ac84b6a5b7443f
Message-ID: <202602102014.Fy6lXhIr-lkp@intel.com>
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
branch HEAD: a30f999681126b128a43137793ac84b6a5b7443f  drm/xe/mmio: Avoid double-adjust in 64-bit reads

elapsed time: 769m

configs tested: 224
configs skipped: 4

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
arc                   randconfig-001-20260210    clang-20
arc                   randconfig-002-20260210    clang-20
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                         lpc32xx_defconfig    clang-22
arm                          pxa168_defconfig    clang-22
arm                             pxa_defconfig    clang-22
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20260210    clang-20
arm                   randconfig-002-20260210    clang-20
arm                   randconfig-003-20260210    clang-20
arm                   randconfig-004-20260210    clang-20
arm                           sama5_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260210    clang-22
arm64                 randconfig-002-20260210    clang-22
arm64                 randconfig-003-20260210    clang-22
arm64                 randconfig-004-20260210    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260210    clang-22
csky                  randconfig-002-20260210    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260210    clang-22
hexagon               randconfig-002-20260210    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260210    clang-20
i386        buildonly-randconfig-002-20260210    clang-20
i386        buildonly-randconfig-002-20260210    gcc-14
i386        buildonly-randconfig-003-20260210    clang-20
i386        buildonly-randconfig-003-20260210    gcc-14
i386        buildonly-randconfig-004-20260210    clang-20
i386        buildonly-randconfig-005-20260210    clang-20
i386        buildonly-randconfig-006-20260210    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260210    gcc-14
i386                  randconfig-002-20260210    gcc-14
i386                  randconfig-003-20260210    gcc-14
i386                  randconfig-004-20260210    gcc-14
i386                  randconfig-005-20260210    gcc-14
i386                  randconfig-006-20260210    gcc-14
i386                  randconfig-007-20260210    gcc-14
i386                  randconfig-011-20260210    gcc-14
i386                  randconfig-012-20260210    gcc-14
i386                  randconfig-013-20260210    gcc-14
i386                  randconfig-014-20260210    gcc-14
i386                  randconfig-015-20260210    gcc-14
i386                  randconfig-016-20260210    gcc-14
i386                  randconfig-017-20260210    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260210    clang-18
loongarch             randconfig-002-20260210    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          atari_defconfig    clang-22
m68k                                defconfig    clang-19
m68k                        mvme16x_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      bmips_stb_defconfig    clang-22
mips                         cobalt_defconfig    clang-22
mips                           ip30_defconfig    clang-22
mips                           xway_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260210    gcc-11.5.0
nios2                 randconfig-002-20260210    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260210    clang-19
parisc                randconfig-002-20260210    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      ep88xc_defconfig    clang-22
powerpc                  iss476-smp_defconfig    clang-22
powerpc                      pcm030_defconfig    clang-22
powerpc               randconfig-001-20260210    clang-19
powerpc               randconfig-002-20260210    clang-19
powerpc                        warp_defconfig    clang-22
powerpc64             randconfig-001-20260210    clang-19
powerpc64             randconfig-002-20260210    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260210    gcc-11.5.0
riscv                 randconfig-002-20260210    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260210    gcc-11.5.0
s390                  randconfig-002-20260210    gcc-11.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260210    gcc-11.5.0
sh                    randconfig-002-20260210    gcc-11.5.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260210    gcc-14.3.0
sparc                 randconfig-002-20260210    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260210    gcc-14.3.0
sparc64               randconfig-002-20260210    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260210    gcc-14.3.0
um                    randconfig-002-20260210    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260210    gcc-14
x86_64      buildonly-randconfig-002-20260210    gcc-14
x86_64      buildonly-randconfig-003-20260210    gcc-14
x86_64      buildonly-randconfig-004-20260210    gcc-14
x86_64      buildonly-randconfig-005-20260210    gcc-14
x86_64      buildonly-randconfig-006-20260210    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260210    clang-20
x86_64                randconfig-001-20260210    gcc-14
x86_64                randconfig-002-20260210    clang-20
x86_64                randconfig-002-20260210    gcc-14
x86_64                randconfig-003-20260210    clang-20
x86_64                randconfig-003-20260210    gcc-14
x86_64                randconfig-004-20260210    gcc-14
x86_64                randconfig-005-20260210    gcc-14
x86_64                randconfig-006-20260210    gcc-12
x86_64                randconfig-006-20260210    gcc-14
x86_64                randconfig-011-20260210    clang-20
x86_64                randconfig-012-20260210    clang-20
x86_64                randconfig-013-20260210    clang-20
x86_64                randconfig-014-20260210    clang-20
x86_64                randconfig-015-20260210    clang-20
x86_64                randconfig-016-20260210    clang-20
x86_64                randconfig-016-20260210    gcc-13
x86_64                randconfig-071-20260210    clang-20
x86_64                randconfig-071-20260210    gcc-14
x86_64                randconfig-072-20260210    clang-20
x86_64                randconfig-073-20260210    clang-20
x86_64                randconfig-073-20260210    gcc-14
x86_64                randconfig-074-20260210    clang-20
x86_64                randconfig-075-20260210    clang-20
x86_64                randconfig-075-20260210    gcc-14
x86_64                randconfig-076-20260210    clang-20
x86_64                randconfig-076-20260210    gcc-14
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
xtensa                  cadence_csp_defconfig    clang-22
xtensa                randconfig-001-20260210    gcc-14.3.0
xtensa                randconfig-002-20260210    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
