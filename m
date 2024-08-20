Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63AAC531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 16:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61DE10E149;
	Tue, 20 Aug 2024 16:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhP0JrfZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E640410E149
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 16:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724171206; x=1755707206;
 h=date:from:to:cc:subject:message-id;
 bh=xKLTNU9SDf0MH+ZDZNY1a440GQN3CTNa4pYANjnYmWk=;
 b=WhP0JrfZR72IsJpVBJpiI3s2EdkUuchnTOAVNa7qa3WWEw5q1QdgNSTj
 676CdnPOdRd12NCznlTWicwY8Ywl5zXZv2wwLXe8dTX925nK1nqEo7EsH
 r/X+Fu396mrCfH6zZCMagJeHv0sEQU12L2HTS+Sk0Pwaxze/P0tequpb7
 EjccqYuccNnhEnz60OtXHwC1N7KZDirE0+YKhenvM7udymlJSjS33xqzs
 mYNvNvsIwyOQz+gP7dQsEE1Rbj5Cy84GzdGSl2cpw2k5ail1TXhCdBTqA
 x5QF4VQD5uY+F6qKiWmzZq+cE1RsQzkMf1j/whzmWRSpOqhDncJaJe3QQ w==;
X-CSE-ConnectionGUID: OmTu7+Y4SxSZkvMX+46JvQ==
X-CSE-MsgGUID: 2IvHoSK0REecrz7kMIqANg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22291479"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22291479"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 09:26:45 -0700
X-CSE-ConnectionGUID: 0Xdyocz3QlCZK1SwjqcKLQ==
X-CSE-MsgGUID: w4XNtavXSzGKcE003dmWlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65632653"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 20 Aug 2024 09:26:45 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sgRgw-000AOw-0v;
 Tue, 20 Aug 2024 16:26:42 +0000
Date: Wed, 21 Aug 2024 00:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 23683061805be368c8d1c7e7ff52abc470cac275
Message-ID: <202408210017.tVsVFzTm-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 23683061805be368c8d1c7e7ff52abc470cac275  drm/xe/lnl: Offload system clear page activity to GPU

elapsed time: 1426m

configs tested: 158
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240820   gcc-13.2.0
arc                   randconfig-002-20240820   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              alldefconfig   gcc-14.1.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                             pxa_defconfig   gcc-14.1.0
arm                   randconfig-001-20240820   clang-20
arm                   randconfig-002-20240820   clang-20
arm                   randconfig-003-20240820   clang-20
arm                   randconfig-004-20240820   clang-20
arm                         vf610m4_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240820   clang-20
arm64                 randconfig-002-20240820   clang-20
arm64                 randconfig-003-20240820   gcc-14.1.0
arm64                 randconfig-004-20240820   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240820   gcc-14.1.0
csky                  randconfig-002-20240820   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240820   clang-20
hexagon               randconfig-002-20240820   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240820   clang-18
i386         buildonly-randconfig-002-20240820   clang-18
i386         buildonly-randconfig-003-20240820   clang-18
i386         buildonly-randconfig-004-20240820   gcc-12
i386         buildonly-randconfig-005-20240820   clang-18
i386         buildonly-randconfig-006-20240820   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240820   clang-18
i386                  randconfig-002-20240820   clang-18
i386                  randconfig-003-20240820   clang-18
i386                  randconfig-004-20240820   clang-18
i386                  randconfig-005-20240820   clang-18
i386                  randconfig-006-20240820   clang-18
i386                  randconfig-011-20240820   gcc-11
i386                  randconfig-012-20240820   gcc-12
i386                  randconfig-013-20240820   gcc-12
i386                  randconfig-014-20240820   gcc-12
i386                  randconfig-015-20240820   gcc-12
i386                  randconfig-016-20240820   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240820   gcc-14.1.0
loongarch             randconfig-002-20240820   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          hp300_defconfig   gcc-14.1.0
m68k                        m5307c3_defconfig   gcc-14.1.0
m68k                          multi_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                  cavium_octeon_defconfig   gcc-14.1.0
mips                           ci20_defconfig   clang-20
mips                  decstation_64_defconfig   gcc-13.2.0
mips                  maltasmvp_eva_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240820   gcc-14.1.0
nios2                 randconfig-002-20240820   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-14.1.0
parisc                randconfig-001-20240820   gcc-14.1.0
parisc                randconfig-002-20240820   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc               randconfig-003-20240820   clang-20
powerpc                      tqm8xx_defconfig   clang-20
powerpc64             randconfig-001-20240820   gcc-14.1.0
powerpc64             randconfig-002-20240820   clang-20
powerpc64             randconfig-003-20240820   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240820   clang-20
riscv                 randconfig-002-20240820   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240820   gcc-14.1.0
s390                  randconfig-002-20240820   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                          r7780mp_defconfig   gcc-14.1.0
sh                    randconfig-001-20240820   gcc-14.1.0
sh                    randconfig-002-20240820   gcc-14.1.0
sh                           se7750_defconfig   gcc-14.1.0
sh                   sh7724_generic_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240820   gcc-14.1.0
sparc64               randconfig-002-20240820   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240820   gcc-12
um                    randconfig-002-20240820   clang-20
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240820   clang-18
x86_64       buildonly-randconfig-002-20240820   gcc-11
x86_64       buildonly-randconfig-003-20240820   clang-18
x86_64       buildonly-randconfig-004-20240820   clang-18
x86_64       buildonly-randconfig-005-20240820   clang-18
x86_64       buildonly-randconfig-006-20240820   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240820   gcc-12
x86_64                randconfig-002-20240820   gcc-12
x86_64                randconfig-003-20240820   clang-18
x86_64                randconfig-004-20240820   gcc-12
x86_64                randconfig-005-20240820   clang-18
x86_64                randconfig-006-20240820   gcc-12
x86_64                randconfig-011-20240820   clang-18
x86_64                randconfig-012-20240820   gcc-12
x86_64                randconfig-013-20240820   clang-18
x86_64                randconfig-014-20240820   clang-18
x86_64                randconfig-015-20240820   gcc-12
x86_64                randconfig-016-20240820   clang-18
x86_64                randconfig-071-20240820   gcc-12
x86_64                randconfig-072-20240820   gcc-12
x86_64                randconfig-073-20240820   gcc-12
x86_64                randconfig-074-20240820   clang-18
x86_64                randconfig-075-20240820   clang-18
x86_64                randconfig-076-20240820   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240820   gcc-14.1.0
xtensa                randconfig-002-20240820   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
