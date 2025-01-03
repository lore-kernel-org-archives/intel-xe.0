Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338B9E7718F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 04:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF6510E1E0;
	Fri,  3 Jan 2025 04:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPh1maLI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D6E10E1E0
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jan 2025 04:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735877765; x=1767413765;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=5tH5yGr6L9JxvtR62XyA3fAeZQGwPW/y5iRoKia5RvE=;
 b=dPh1maLIfRxTo7XqCgMMAVR9QMk7cuLFf4g6ljTG41aAv6/ew6iw+tEt
 c31H+U8RReTCZOJcJm8q4fZ+Jp5QMI+B+MmVHhWKQcLU67mzbgsYNK+ag
 XOoNkZCyTvX9KK4dwc/ncs3IZ48UstauyzdZ4bKt/0WoOTX1HPUBWZQ5B
 LaKLphwjlAQBQvA+/8E6l0ZbUJV1P+TV0z/em7pA3fVRQ9DvUdEDAF327
 kGuqPzQ5G0NY/KHzgj6l7U2YsN8ICn2WWMynwWRTtBv4uS3bF4X2I6I5L
 g1WU9qkzQPlGMVfYld/DseKyh2DxuPf3jcHp1mexI334fqADgWbONjlyu w==;
X-CSE-ConnectionGUID: oROjCopOT8Gjot9pnfKWYQ==
X-CSE-MsgGUID: iLusp41ZTjKv1kxodBjzmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="47540913"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="47540913"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 20:16:05 -0800
X-CSE-ConnectionGUID: fA+a0WkOS/y6NeR9sXeN8w==
X-CSE-MsgGUID: EabITtWdS0iX6MYZ2JelcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106321537"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 02 Jan 2025 20:16:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tTZ6P-0009C2-2W;
 Fri, 03 Jan 2025 04:16:01 +0000
Date: Fri, 03 Jan 2025 12:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Jos=C3=A9?= Roberto de Souza" <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 88fca61ba5e2ecd0552b9dea2500a16da12d0106
Message-ID: <202501031235.ZPhs6JCF-lkp@intel.com>
User-Agent: s-nail v14.9.24
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
branch HEAD: 88fca61ba5e2ecd0552b9dea2500a16da12d0106  Revert "drm/xe: Force write completion of MI_STORE_DATA_IMM"

elapsed time: 852m

configs tested: 209
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250102    gcc-13.2.0
arc                   randconfig-001-20250103    clang-20
arc                   randconfig-002-20250102    gcc-13.2.0
arc                   randconfig-002-20250103    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-13.2.0
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250102    gcc-14.2.0
arm                   randconfig-001-20250103    clang-20
arm                   randconfig-002-20250102    gcc-14.2.0
arm                   randconfig-002-20250103    clang-20
arm                   randconfig-003-20250102    gcc-14.2.0
arm                   randconfig-003-20250103    clang-20
arm                   randconfig-004-20250102    gcc-14.2.0
arm                   randconfig-004-20250103    clang-20
arm                          sp7021_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250102    clang-20
arm64                 randconfig-001-20250103    clang-20
arm64                 randconfig-002-20250102    gcc-14.2.0
arm64                 randconfig-002-20250103    clang-20
arm64                 randconfig-003-20250102    clang-20
arm64                 randconfig-003-20250103    clang-20
arm64                 randconfig-004-20250102    gcc-14.2.0
arm64                 randconfig-004-20250103    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250102    gcc-14.2.0
csky                  randconfig-002-20250102    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250102    clang-19
hexagon               randconfig-002-20250102    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250102    gcc-12
i386        buildonly-randconfig-002-20250102    gcc-12
i386        buildonly-randconfig-003-20250102    clang-19
i386        buildonly-randconfig-004-20250102    clang-19
i386        buildonly-randconfig-005-20250102    clang-19
i386        buildonly-randconfig-006-20250102    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250103    clang-19
i386                  randconfig-002-20250103    clang-19
i386                  randconfig-003-20250103    clang-19
i386                  randconfig-004-20250103    clang-19
i386                  randconfig-005-20250103    clang-19
i386                  randconfig-006-20250103    clang-19
i386                  randconfig-007-20250103    clang-19
i386                  randconfig-011-20250103    gcc-12
i386                  randconfig-012-20250103    gcc-12
i386                  randconfig-013-20250103    gcc-12
i386                  randconfig-014-20250103    gcc-12
i386                  randconfig-015-20250103    gcc-12
i386                  randconfig-016-20250103    gcc-12
i386                  randconfig-017-20250103    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250102    gcc-14.2.0
loongarch             randconfig-002-20250102    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-18
mips                           ip27_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250102    gcc-14.2.0
nios2                 randconfig-002-20250102    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250102    gcc-14.2.0
parisc                randconfig-002-20250102    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        cell_defconfig    gcc-13.2.0
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    gcc-13.2.0
powerpc                     mpc5200_defconfig    clang-20
powerpc               randconfig-001-20250102    clang-20
powerpc               randconfig-002-20250102    gcc-14.2.0
powerpc               randconfig-003-20250102    gcc-14.2.0
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc                     tqm8560_defconfig    gcc-13.2.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250102    gcc-14.2.0
powerpc64             randconfig-003-20250102    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250102    clang-16
riscv                 randconfig-002-20250102    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250102    clang-20
s390                  randconfig-002-20250102    clang-20
s390                       zfcpdump_defconfig    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250102    gcc-14.2.0
sh                    randconfig-002-20250102    gcc-14.2.0
sh                              ul2_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250102    gcc-14.2.0
sparc                 randconfig-002-20250102    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250102    gcc-14.2.0
sparc64               randconfig-002-20250102    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250102    clang-16
um                    randconfig-002-20250102    clang-18
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250102    gcc-12
x86_64      buildonly-randconfig-002-20250102    gcc-12
x86_64      buildonly-randconfig-003-20250102    gcc-12
x86_64      buildonly-randconfig-004-20250102    clang-19
x86_64      buildonly-randconfig-005-20250102    gcc-12
x86_64      buildonly-randconfig-006-20250102    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250103    gcc-12
x86_64                randconfig-002-20250103    gcc-12
x86_64                randconfig-003-20250103    gcc-12
x86_64                randconfig-004-20250103    gcc-12
x86_64                randconfig-005-20250103    gcc-12
x86_64                randconfig-006-20250103    gcc-12
x86_64                randconfig-007-20250103    gcc-12
x86_64                randconfig-008-20250103    gcc-12
x86_64                randconfig-071-20250103    clang-19
x86_64                randconfig-072-20250103    clang-19
x86_64                randconfig-073-20250103    clang-19
x86_64                randconfig-074-20250103    clang-19
x86_64                randconfig-075-20250103    clang-19
x86_64                randconfig-076-20250103    clang-19
x86_64                randconfig-077-20250103    clang-19
x86_64                randconfig-078-20250103    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-13.2.0
xtensa                randconfig-001-20250102    gcc-14.2.0
xtensa                randconfig-002-20250102    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
