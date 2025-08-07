Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799B5C87FCF
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 16:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466B510E892;
	Thu,  7 Aug 2025 16:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlGto2Wn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F417A10E892
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 16:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583829; x=1786119829;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=/147DlY+5Anec8Pq7wvRIdQwIp01xCnPqi1Nb0xjGZ4=;
 b=HlGto2Wn4w+kFWOd38x2Y336dNaM6Xd54nl7sYZnrI6I5JwQ9XDOeRP3
 vmzCAzBJA7t+gOqLS3ikAt/+lGlpJVXzKrh+lzUtaLprWdUg88XIGZDRD
 D1da6avOfhnsgsUk5RIwtluc5rZ2d5zmDtgVUXiXJ/HXjXobBRLLqqJK5
 tl15ZqNMAL1a1tpejf25Kjs0qhAW9Pe9nmB+ASzcPMWbIOoDwW1pYbzIP
 8qvliAVOJl75OdbIZm0i9ZyOlqb3gQcWYDMNfKvjEPQFBGwPVCOSzLnFd
 SZQWuEOGEwpc+uQWeqGHRVl0eDn9rjZF7p6YCm7rVhuSUnVykOnoDkeE6 A==;
X-CSE-ConnectionGUID: 2qsXPHKnT2+2yTorpdZs2g==
X-CSE-MsgGUID: qV5AVT68S/y1+zwirroHUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57059224"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="57059224"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:23:49 -0700
X-CSE-ConnectionGUID: 12+G3iLAR9asl0kE9GF4Dw==
X-CSE-MsgGUID: sJUs6XucSCCFCwweCXsWQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="165896977"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2025 09:23:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uk3P7-0002yY-0D;
 Thu, 07 Aug 2025 16:23:45 +0000
Date: Fri, 08 Aug 2025 00:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Micha=C5=82?= Winiarski" <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 ad69d62588cd6bf8cddaff5e3e2eb1b8dd876d35
Message-ID: <202508080024.KKqJyzdm-lkp@intel.com>
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
branch HEAD: ad69d62588cd6bf8cddaff5e3e2eb1b8dd876d35  drm/xe/pf: Program LMTT directory pointer on all GTs within a tile

elapsed time: 1221m

configs tested: 226
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250807    clang-22
arc                   randconfig-001-20250807    gcc-13.4.0
arc                   randconfig-002-20250807    clang-22
arc                   randconfig-002-20250807    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         axm55xx_defconfig    clang-22
arm                                 defconfig    clang-19
arm                      jornada720_defconfig    clang-22
arm                   randconfig-001-20250807    clang-22
arm                   randconfig-002-20250807    clang-22
arm                   randconfig-002-20250807    gcc-10.5.0
arm                   randconfig-003-20250807    clang-22
arm                   randconfig-004-20250807    clang-22
arm                   randconfig-004-20250807    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250807    clang-22
arm64                 randconfig-001-20250807    gcc-8.5.0
arm64                 randconfig-002-20250807    clang-22
arm64                 randconfig-002-20250807    gcc-8.5.0
arm64                 randconfig-003-20250807    clang-22
arm64                 randconfig-004-20250807    clang-22
arm64                 randconfig-004-20250807    gcc-14.3.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                                defconfig    clang-22
csky                  randconfig-001-20250807    gcc-15.1.0
csky                  randconfig-002-20250807    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250807    clang-22
hexagon               randconfig-002-20250807    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250807    clang-20
i386        buildonly-randconfig-001-20250807    gcc-12
i386        buildonly-randconfig-002-20250807    clang-20
i386        buildonly-randconfig-002-20250807    gcc-12
i386        buildonly-randconfig-003-20250807    gcc-12
i386        buildonly-randconfig-004-20250807    gcc-11
i386        buildonly-randconfig-004-20250807    gcc-12
i386        buildonly-randconfig-005-20250807    gcc-12
i386        buildonly-randconfig-006-20250807    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250807    gcc-12
i386                  randconfig-002-20250807    gcc-12
i386                  randconfig-003-20250807    gcc-12
i386                  randconfig-004-20250807    gcc-12
i386                  randconfig-005-20250807    gcc-12
i386                  randconfig-006-20250807    gcc-12
i386                  randconfig-007-20250807    gcc-12
i386                  randconfig-011-20250807    clang-20
i386                  randconfig-012-20250807    clang-20
i386                  randconfig-013-20250807    clang-20
i386                  randconfig-014-20250807    clang-20
i386                  randconfig-015-20250807    clang-20
i386                  randconfig-016-20250807    clang-20
i386                  randconfig-017-20250807    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250807    clang-22
loongarch             randconfig-002-20250807    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            alldefconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250807    gcc-11.5.0
nios2                 randconfig-002-20250807    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250807    gcc-8.5.0
parisc                randconfig-002-20250807    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                    amigaone_defconfig    clang-22
powerpc                       ppc64_defconfig    clang-22
powerpc               randconfig-001-20250807    gcc-12.5.0
powerpc               randconfig-002-20250807    gcc-10.5.0
powerpc               randconfig-003-20250807    gcc-11.5.0
powerpc64             randconfig-001-20250807    gcc-11.5.0
powerpc64             randconfig-002-20250807    clang-22
powerpc64             randconfig-003-20250807    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-22
riscv                 randconfig-001-20250807    gcc-12.5.0
riscv                 randconfig-002-20250807    gcc-12.5.0
riscv                 randconfig-002-20250807    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-12
s390                  randconfig-001-20250807    clang-22
s390                  randconfig-001-20250807    gcc-12.5.0
s390                  randconfig-002-20250807    clang-22
s390                  randconfig-002-20250807    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250807    gcc-12.5.0
sh                    randconfig-001-20250807    gcc-14.3.0
sh                    randconfig-002-20250807    gcc-12.5.0
sh                    randconfig-002-20250807    gcc-9.5.0
sh                           se7721_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250807    gcc-12.5.0
sparc                 randconfig-001-20250807    gcc-14.3.0
sparc                 randconfig-002-20250807    gcc-12.5.0
sparc                 randconfig-002-20250807    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250807    clang-22
sparc64               randconfig-001-20250807    gcc-12.5.0
sparc64               randconfig-002-20250807    clang-22
sparc64               randconfig-002-20250807    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250807    gcc-12
um                    randconfig-001-20250807    gcc-12.5.0
um                    randconfig-002-20250807    gcc-11
um                    randconfig-002-20250807    gcc-12.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250807    clang-20
x86_64      buildonly-randconfig-001-20250807    gcc-11
x86_64      buildonly-randconfig-002-20250807    gcc-11
x86_64      buildonly-randconfig-002-20250807    gcc-12
x86_64      buildonly-randconfig-003-20250807    clang-20
x86_64      buildonly-randconfig-003-20250807    gcc-11
x86_64      buildonly-randconfig-004-20250807    clang-20
x86_64      buildonly-randconfig-004-20250807    gcc-11
x86_64      buildonly-randconfig-005-20250807    gcc-11
x86_64      buildonly-randconfig-006-20250807    gcc-11
x86_64      buildonly-randconfig-006-20250807    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250807    gcc-12
x86_64                randconfig-002-20250807    gcc-12
x86_64                randconfig-003-20250807    gcc-12
x86_64                randconfig-004-20250807    gcc-12
x86_64                randconfig-005-20250807    gcc-12
x86_64                randconfig-006-20250807    gcc-12
x86_64                randconfig-007-20250807    gcc-12
x86_64                randconfig-008-20250807    gcc-12
x86_64                randconfig-071-20250807    clang-20
x86_64                randconfig-072-20250807    clang-20
x86_64                randconfig-073-20250807    clang-20
x86_64                randconfig-074-20250807    clang-20
x86_64                randconfig-075-20250807    clang-20
x86_64                randconfig-076-20250807    clang-20
x86_64                randconfig-077-20250807    clang-20
x86_64                randconfig-078-20250807    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250807    gcc-12.5.0
xtensa                randconfig-001-20250807    gcc-15.1.0
xtensa                randconfig-002-20250807    gcc-12.5.0
xtensa                randconfig-002-20250807    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
