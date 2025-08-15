Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7613CA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 14:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8860B10E96B;
	Fri, 15 Aug 2025 14:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uqd49GiT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3299310E96B
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 14:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755268476; x=1786804476;
 h=date:from:to:cc:subject:message-id;
 bh=RkEN9WNfyYXVTvAuy03+0LZhGkPP8n3wX7ZC3K7fbvc=;
 b=Uqd49GiTGR+T/BIUggYPvHYnR5yw/ZEVsIFo8ANKCjlTLZ2qc8hz7Hik
 A9ifXqTvJKEIDdUN0mRPVkKgGZOD03khXjDYGvKacYnyKwyDUHi7cbbU9
 f6ZsHQ8foOMP4WJaP3/3XF+Tas2XTf4ZDhJD7VuvagkrrJ3KFTuZF2Kh+
 TxsFGbtG8nBtFIFF5WqdGn7QNxmhF0+4j2aHpYI7BPL1K3TNSWQBdNFD3
 ScldAh0wdfhBawLhOmPoVucDS4UuY2TkcW6bfYgIu3mz8p84eyP6b7+jC
 XD88en3v0ArQ3zIgpF/HqZZa0drT/6T8pwG8GQJx6up+Lxson6XZXknSd Q==;
X-CSE-ConnectionGUID: 4lv8g+qeRou+pUfzTJOlXQ==
X-CSE-MsgGUID: LDOQ3VaYTPWxxPxaN1Ibvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57543062"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57543062"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 07:34:35 -0700
X-CSE-ConnectionGUID: rmfi8d3HSO6Qv2jl6e7LGA==
X-CSE-MsgGUID: crXQDQiZR0C90QxKqxDanA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="171152425"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa003.fm.intel.com with ESMTP; 15 Aug 2025 07:34:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1umvVK-000C1s-2u;
 Fri, 15 Aug 2025 14:34:14 +0000
Date: Fri, 15 Aug 2025 22:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 94eae6ee4c2df2031bca586405e9ec36e0b9ccf8
Message-ID: <202508152217.IGcboJl3-lkp@intel.com>
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
branch HEAD: 94eae6ee4c2df2031bca586405e9ec36e0b9ccf8  drm/xe/pf: Set VF LMEM BAR size

elapsed time: 1386m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250815    gcc-8.5.0
arc                   randconfig-002-20250815    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                         at91_dt_defconfig    clang-22
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20250815    clang-16
arm                   randconfig-002-20250815    clang-18
arm                   randconfig-003-20250815    gcc-14.3.0
arm                   randconfig-004-20250815    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250815    gcc-8.5.0
arm64                 randconfig-002-20250815    gcc-8.5.0
arm64                 randconfig-003-20250815    clang-22
arm64                 randconfig-004-20250815    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250815    gcc-15.1.0
csky                  randconfig-002-20250815    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250815    clang-22
hexagon               randconfig-002-20250815    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250815    gcc-12
i386        buildonly-randconfig-002-20250815    clang-20
i386        buildonly-randconfig-003-20250815    clang-20
i386        buildonly-randconfig-004-20250815    clang-20
i386        buildonly-randconfig-005-20250815    clang-20
i386        buildonly-randconfig-006-20250815    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250815    clang-22
loongarch             randconfig-002-20250815    clang-20
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250815    gcc-11.5.0
nios2                 randconfig-002-20250815    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250815    gcc-8.5.0
parisc                randconfig-002-20250815    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250815    gcc-11.5.0
powerpc               randconfig-002-20250815    clang-19
powerpc               randconfig-003-20250815    gcc-11.5.0
powerpc64             randconfig-001-20250815    gcc-14.3.0
powerpc64             randconfig-002-20250815    gcc-10.5.0
powerpc64             randconfig-003-20250815    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250815    gcc-12.5.0
riscv                 randconfig-002-20250815    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250815    gcc-8.5.0
s390                  randconfig-002-20250815    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250815    gcc-11.5.0
sh                    randconfig-002-20250815    gcc-12.5.0
sh                           se7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250815    gcc-11.5.0
sparc                 randconfig-002-20250815    gcc-13.4.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250815    clang-22
sparc64               randconfig-002-20250815    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250815    gcc-12
um                    randconfig-002-20250815    clang-19
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250815    clang-20
x86_64      buildonly-randconfig-002-20250815    gcc-12
x86_64      buildonly-randconfig-003-20250815    gcc-12
x86_64      buildonly-randconfig-004-20250815    clang-20
x86_64      buildonly-randconfig-005-20250815    clang-20
x86_64      buildonly-randconfig-006-20250815    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250815    gcc-8.5.0
xtensa                randconfig-002-20250815    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
