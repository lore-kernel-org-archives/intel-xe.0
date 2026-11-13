Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BB6606A323
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 01:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JCb4qUxm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B89F10E700;
	Fri, 13 Nov 2026 01:30:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EE310E700
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 01:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794533439; x=1826069439;
 h=date:from:to:cc:subject:message-id;
 bh=sjGs/pRvhfc/yXuEeQn6txwpIMBMx27xVvGDmzYhzRM=;
 b=JCb4qUxm2ynxAUgaoFSSV29W32MYm5szJ3PepSsbkg2farD9D5jOBb0Q
 yCkLCWLlhay/1DHRetFdO0V9SRgDpu+UzW8aR07ShyErfm2x8NubbSsID
 c3+/KSRIB/tKaIfGYpmehjy4Ze8IpfkQ8cweujhhjbfuroWRRm2T6NEoO
 +jKA3gybg6pBygtBt6GtLPTfPfzIuRi/mPZR0VKUXEkLSyH9J8m/qUHqa
 ASTLuFzEBVSDHMr/cGcTJZg11awuOncPeeT1BJlfDEFxXMkCpyabnv9Lu
 IuwgSENlO8OjxsG1tlgCQfvLDuyCyKa6p1hP2T8gzok8fzLmerx/2N0Ey w==;
X-CSE-ConnectionGUID: AkY+i2c+QTin3Fy+DdkoGw==
X-CSE-MsgGUID: dYX/tA07SoeA+64kXvSXSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3336943"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3336943"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 17:30:39 -0800
X-CSE-ConnectionGUID: mRS+ICk5R4OukczFBI0grw==
X-CSE-MsgGUID: UZkx1CyIQieDqi5umJgEDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8796762"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 12 Nov 2026 17:30:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xRg7e-000000012Hx-00Oj;
 Fri, 13 Nov 2026 01:30:34 +0000
Date: Fri, 13 Nov 2026 09:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 be73339dd9d70623b7dbc9c4e3b966824b771069
Message-ID: <20261113092944.01lvLaIR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: be73339dd9d70623b7dbc9c4e3b966824b771069  drm: xe: select configfs

elapsed time: 992m

configs tested: 263
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.2.0
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261112    clang-24
arc                   randconfig-1000-20261113    gcc-10.5.0
arc                   randconfig-1001-20261112    clang-24
arc                   randconfig-1001-20261113    gcc-10.5.0
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                             dove_defconfig    gcc-16.2.0
arm                           gemini_defconfig    gcc-16.2.0
arm                            imxrt_defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261112    clang-24
arm                   randconfig-1000-20261113    gcc-10.5.0
arm                   randconfig-1001-20261112    clang-24
arm                   randconfig-1001-20261113    gcc-10.5.0
arm                   randconfig-1002-20261112    clang-24
arm                   randconfig-1002-20261113    gcc-10.5.0
arm                   randconfig-1003-20261112    clang-24
arm                   randconfig-1003-20261113    gcc-10.5.0
arm                          s3c6400_defconfig    gcc-16.2.0
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261112    gcc-14.4.0
arm64                 randconfig-1001-20261112    gcc-14.4.0
arm64                 randconfig-1002-20261112    gcc-14.4.0
arm64                 randconfig-1003-20261112    gcc-14.4.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261112    gcc-14.4.0
csky                  randconfig-1001-20261112    gcc-14.4.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261112    clang-24
hexagon               randconfig-1000-20261113    clang-24
hexagon               randconfig-1001-20261112    clang-24
hexagon               randconfig-1001-20261113    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261112    clang-22
i386        buildonly-randconfig-1000-20261113    clang-22
i386        buildonly-randconfig-1001-20261112    clang-22
i386        buildonly-randconfig-1001-20261113    clang-22
i386        buildonly-randconfig-1002-20261112    clang-22
i386        buildonly-randconfig-1002-20261113    clang-22
i386        buildonly-randconfig-1003-20261112    clang-22
i386        buildonly-randconfig-1003-20261113    clang-22
i386        buildonly-randconfig-1004-20261112    clang-22
i386        buildonly-randconfig-1004-20261113    clang-22
i386        buildonly-randconfig-1005-20261112    clang-22
i386        buildonly-randconfig-1005-20261113    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261112    gcc-14
i386                  randconfig-1001-20261112    gcc-14
i386                  randconfig-1002-20261112    gcc-14
i386                  randconfig-1003-20261112    gcc-14
i386                  randconfig-1004-20261112    gcc-14
i386                  randconfig-1005-20261112    gcc-14
i386                  randconfig-1006-20261112    gcc-14
i386                  randconfig-1007-20261112    clang-22
i386                  randconfig-1007-20261113    clang-22
i386                  randconfig-1008-20261112    clang-22
i386                  randconfig-1008-20261113    clang-22
i386                  randconfig-1009-20261112    clang-22
i386                  randconfig-1009-20261113    clang-22
i386                  randconfig-1010-20261112    clang-22
i386                  randconfig-1010-20261113    clang-22
i386                  randconfig-1011-20261112    clang-22
i386                  randconfig-1011-20261113    clang-22
i386                  randconfig-1012-20261112    clang-22
i386                  randconfig-1012-20261113    clang-22
i386                  randconfig-1013-20261112    clang-22
i386                  randconfig-1013-20261113    clang-22
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261112    clang-24
loongarch             randconfig-1000-20261113    clang-24
loongarch             randconfig-1001-20261112    clang-24
loongarch             randconfig-1001-20261113    clang-24
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                        m5282evb_defconfig    gcc-16.2.0
m68k                             mac_defconfig    gcc-16.2.0
m68k                         mvme147_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                            ip28_defconfig    gcc-16.2.0
mips                         maltaup_defconfig    gcc-16.2.0
mips                       pic32mzda_defconfig    gcc-16.2.0
mips                        rbtx49xx_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261112    clang-24
nios2                 randconfig-1000-20261113    clang-24
nios2                 randconfig-1001-20261112    clang-24
nios2                 randconfig-1001-20261113    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261112    gcc-12.5.0
parisc                randconfig-1000-20261113    gcc-13.5.0
parisc                randconfig-1001-20261112    gcc-12.5.0
parisc                randconfig-1001-20261113    gcc-13.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                  mpc832x_rdb_defconfig    gcc-16.2.0
powerpc                       ppc64e_defconfig    gcc-16.2.0
powerpc                       ppc6xx_defconfig    gcc-16.2.0
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261112    gcc-12.5.0
powerpc               randconfig-1000-20261113    gcc-13.5.0
powerpc               randconfig-1001-20261112    gcc-12.5.0
powerpc               randconfig-1001-20261113    gcc-13.5.0
powerpc                  xes_mpc85xx_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261112    gcc-12.5.0
powerpc64             randconfig-1000-20261113    gcc-13.5.0
powerpc64             randconfig-1001-20261112    gcc-12.5.0
powerpc64             randconfig-1001-20261113    gcc-13.5.0
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261112    gcc-9.5.0
riscv                 randconfig-1000-20261113    gcc-12.5.0
riscv                 randconfig-1001-20261112    gcc-9.5.0
riscv                 randconfig-1001-20261113    gcc-12.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261112    gcc-9.5.0
s390                  randconfig-1000-20261113    gcc-12.5.0
s390                  randconfig-1001-20261112    gcc-9.5.0
s390                  randconfig-1001-20261113    gcc-12.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           kfr2r09_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261112    gcc-9.5.0
sh                    randconfig-1000-20261113    gcc-12.5.0
sh                    randconfig-1001-20261112    gcc-9.5.0
sh                    randconfig-1001-20261113    gcc-12.5.0
sh                           rsk7269_defconfig    gcc-16.2.0
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261112    gcc-8.5.0
sparc                 randconfig-1000-20261113    gcc-8.5.0
sparc                 randconfig-1001-20261112    gcc-8.5.0
sparc                 randconfig-1001-20261113    gcc-8.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261112    gcc-8.5.0
sparc64               randconfig-1000-20261113    gcc-8.5.0
sparc64               randconfig-1001-20261112    gcc-8.5.0
sparc64               randconfig-1001-20261113    gcc-8.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261112    gcc-8.5.0
um                    randconfig-1000-20261113    gcc-8.5.0
um                    randconfig-1001-20261112    gcc-8.5.0
um                    randconfig-1001-20261113    gcc-8.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261112    gcc-14
x86_64      buildonly-randconfig-1000-20261113    clang-22
x86_64      buildonly-randconfig-1001-20261112    gcc-14
x86_64      buildonly-randconfig-1001-20261113    clang-22
x86_64      buildonly-randconfig-1002-20261112    gcc-14
x86_64      buildonly-randconfig-1002-20261113    clang-22
x86_64      buildonly-randconfig-1003-20261112    gcc-14
x86_64      buildonly-randconfig-1003-20261113    clang-22
x86_64      buildonly-randconfig-1004-20261112    gcc-14
x86_64      buildonly-randconfig-1004-20261113    clang-22
x86_64      buildonly-randconfig-1005-20261112    gcc-14
x86_64      buildonly-randconfig-1005-20261113    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261112    clang-22
x86_64                randconfig-1000-20261113    clang-22
x86_64                randconfig-1001-20261112    clang-22
x86_64                randconfig-1001-20261113    clang-22
x86_64                randconfig-1002-20261112    clang-22
x86_64                randconfig-1002-20261113    clang-22
x86_64                randconfig-1003-20261112    clang-22
x86_64                randconfig-1003-20261113    clang-22
x86_64                randconfig-1004-20261112    clang-22
x86_64                randconfig-1004-20261113    clang-22
x86_64                randconfig-1005-20261112    clang-22
x86_64                randconfig-1005-20261113    clang-22
x86_64                randconfig-1006-20261112    gcc-14
x86_64                randconfig-1006-20261113    clang-22
x86_64                randconfig-1007-20261112    gcc-14
x86_64                randconfig-1007-20261113    clang-22
x86_64                randconfig-1008-20261112    gcc-14
x86_64                randconfig-1008-20261113    clang-22
x86_64                randconfig-1009-20261112    gcc-14
x86_64                randconfig-1009-20261113    clang-22
x86_64                randconfig-1010-20261112    gcc-14
x86_64                randconfig-1010-20261113    clang-22
x86_64                randconfig-1011-20261112    gcc-14
x86_64                randconfig-1011-20261113    clang-22
x86_64                randconfig-1012-20261112    clang-22
x86_64                randconfig-1012-20261113    gcc-14
x86_64                randconfig-1013-20261112    clang-22
x86_64                randconfig-1013-20261113    gcc-14
x86_64                randconfig-1014-20261112    clang-22
x86_64                randconfig-1014-20261113    gcc-14
x86_64                randconfig-1015-20261112    clang-22
x86_64                randconfig-1015-20261113    gcc-14
x86_64                randconfig-1016-20261112    clang-22
x86_64                randconfig-1016-20261113    gcc-14
x86_64                randconfig-1017-20261112    clang-22
x86_64                randconfig-1017-20261113    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261112    gcc-8.5.0
xtensa                randconfig-1000-20261113    gcc-8.5.0
xtensa                randconfig-1001-20261112    gcc-8.5.0
xtensa                randconfig-1001-20261113    gcc-8.5.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
