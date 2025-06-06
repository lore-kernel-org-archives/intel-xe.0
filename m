Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBD0C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 09:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8373110EA21;
	Fri,  6 Jun 2025 09:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nx/JkKzs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C2810E348
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749202413; x=1780738413;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=j+sO/mxaJBUUOmRcxE+VqOgcicvW1WImm4A3698ZJdc=;
 b=Nx/JkKzs6aVRqegUHFOXC2Cz8sPEneljdaCUb1SEOfNhc3eNvqVimNsN
 bkYrX4+mEJLDdxLBLGyJiP3ULR2ZJmlh5PNzI8t7rdS+w5SEZr5lNF4eQ
 KTDOKzr3Bfk7UW8UTI3gbTYM8L5b8dyy7UPF+eNcr8lxS2mwwrkaivcS3
 jzjgxjxvfRGtckfBwizebamApLWUFEzU/8wzS5Gs/mNk1kGF28agx+6Ao
 zqUVIvct2NwPTGKW359UfEQaBmK8jLGiNm4FXElXPU7fwOgYRAb3N8H4/
 vqN8KcBLtHJXS11G7W5NU+ywQAzo8yZp0apD623U+KyIaBumVlD/WDbmV A==;
X-CSE-ConnectionGUID: SNQtyDU5TOGxKVlYQVFq7Q==
X-CSE-MsgGUID: 0Olr3+nCTmm6N0l+tsAHfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68788176"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="68788176"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:33:33 -0700
X-CSE-ConnectionGUID: YirRr0/uQkGR9Kcvl4DwyA==
X-CSE-MsgGUID: If6PK4AoQ16ZVZHul3l42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="146133166"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 06 Jun 2025 02:33:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uNTS5-0004tN-1c;
 Fri, 06 Jun 2025 09:33:29 +0000
Date: Fri, 06 Jun 2025 17:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 7c7c5cb5b5bf9d8ccc6a51b28687c9e7ff7f1890
Message-ID: <202506061718.Vc3c2xxW-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: 7c7c5cb5b5bf9d8ccc6a51b28687c9e7ff7f1890  drm/xe: remove unmatched xe_vm_unlock() from __xe_exec_queue_init()

elapsed time: 901m

configs tested: 127
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              alldefconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250606    gcc-8.5.0
arc                   randconfig-002-20250606    gcc-10.5.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                       imx_v6_v7_defconfig    clang-16
arm                   randconfig-001-20250606    clang-21
arm                   randconfig-002-20250606    gcc-11.5.0
arm                   randconfig-003-20250606    clang-21
arm                   randconfig-004-20250606    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250606    clang-21
arm64                 randconfig-002-20250606    gcc-15.1.0
arm64                 randconfig-003-20250606    clang-21
arm64                 randconfig-004-20250606    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250606    gcc-14.3.0
csky                  randconfig-002-20250606    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250606    clang-21
hexagon               randconfig-002-20250606    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250606    clang-20
i386        buildonly-randconfig-002-20250606    gcc-12
i386        buildonly-randconfig-003-20250606    gcc-12
i386        buildonly-randconfig-004-20250606    gcc-12
i386        buildonly-randconfig-005-20250606    gcc-12
i386        buildonly-randconfig-006-20250606    gcc-11
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250606    gcc-15.1.0
loongarch             randconfig-002-20250606    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ci20_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250606    gcc-14.2.0
nios2                 randconfig-002-20250606    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250606    gcc-11.5.0
parisc                randconfig-002-20250606    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250606    clang-21
powerpc               randconfig-002-20250606    clang-21
powerpc               randconfig-003-20250606    gcc-13.3.0
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250606    clang-21
powerpc64             randconfig-002-20250606    clang-17
powerpc64             randconfig-003-20250606    gcc-12.4.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250606    gcc-11.5.0
riscv                 randconfig-002-20250606    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250606    clang-21
s390                  randconfig-002-20250606    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250606    gcc-12.4.0
sh                    randconfig-002-20250606    gcc-10.5.0
sh                          rsk7264_defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250606    gcc-8.5.0
sparc                 randconfig-002-20250606    gcc-8.5.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250606    gcc-12.4.0
sparc64               randconfig-002-20250606    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250606    gcc-12
um                    randconfig-002-20250606    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250606    clang-20
x86_64      buildonly-randconfig-002-20250606    gcc-12
x86_64      buildonly-randconfig-003-20250606    gcc-12
x86_64      buildonly-randconfig-004-20250606    gcc-12
x86_64      buildonly-randconfig-005-20250606    gcc-12
x86_64      buildonly-randconfig-006-20250606    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250606    gcc-9.3.0
xtensa                randconfig-002-20250606    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
