Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF75D29FBC
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 00:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFC510E091;
	Thu,  7 Nov 2024 00:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJLfK70/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02AA10E091
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 00:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730941066; x=1762477066;
 h=date:from:to:cc:subject:message-id;
 bh=Bmgp7ESYhmvhhMZf8ZHA+OnEzqPyD1HLvuUlDdKijwo=;
 b=UJLfK70/hqDoKWqV+8foh3WePY6ticxIUdBr5VelY94jqAufBHeKWfVl
 yPbXXduk+Jk3bwxUc0aZ8Cmd/qg9ihNCRzA06J7pnHuQLk1+oIdwzxirA
 DDQ4ZkfsIhT3f37R2UrxYpk/s16XEIcjJhFcHwZyvj5zms1NamCojw9R6
 zqoAeFa8NbBd8fgP+KP/Wbzc3MDj0TRfTLJkpnUyoXcUrIX/4ygglrhy3
 5BIowdbW/ohNYITj6r6WoEJZObZk3WyBUtVXl4CxCAiWRAZ+KIlT+hma2
 psMuiDCVYcMqBUxII9zuA+1huCGRPXE2jaIXOZVPrC9vEypEdLI4jtzGA Q==;
X-CSE-ConnectionGUID: 71I1bh0kQauzzYyr12w3Iw==
X-CSE-MsgGUID: Zp5t2DddQTGxVeX+QMo0jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30188893"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="30188893"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 16:57:45 -0800
X-CSE-ConnectionGUID: vILPWSl8QLqN+XCiXX054A==
X-CSE-MsgGUID: 1FbNjp++QgOVOqcj79fkxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="85018058"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 06 Nov 2024 16:57:44 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t8qqE-000pak-0Q;
 Thu, 07 Nov 2024 00:57:42 +0000
Date: Thu, 07 Nov 2024 08:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 514447a1219021298329ce586536598c3b4b2dc0
Message-ID: <202411070833.3AzbeNMc-lkp@intel.com>
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
branch HEAD: 514447a1219021298329ce586536598c3b4b2dc0  drm/xe: Stop accumulating LRC timestamp on job_free

elapsed time: 1446m

configs tested: 266
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                     haps_hs_smp_defconfig    clang-20
arc                   randconfig-001-20241106    gcc-13.2.0
arc                   randconfig-001-20241107    gcc-14.2.0
arc                   randconfig-002-20241106    gcc-13.2.0
arc                   randconfig-002-20241107    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                           imxrt_defconfig    clang-20
arm                             mxs_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20241106    gcc-14.2.0
arm                   randconfig-001-20241107    gcc-14.2.0
arm                   randconfig-002-20241106    clang-20
arm                   randconfig-002-20241107    gcc-14.2.0
arm                   randconfig-003-20241106    clang-20
arm                   randconfig-003-20241107    gcc-14.2.0
arm                   randconfig-004-20241106    clang-17
arm                   randconfig-004-20241107    gcc-14.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    clang-20
arm64                 randconfig-001-20241106    gcc-14.2.0
arm64                 randconfig-001-20241107    gcc-14.2.0
arm64                 randconfig-002-20241106    gcc-14.2.0
arm64                 randconfig-002-20241107    gcc-14.2.0
arm64                 randconfig-003-20241106    clang-20
arm64                 randconfig-003-20241107    gcc-14.2.0
arm64                 randconfig-004-20241106    clang-20
arm64                 randconfig-004-20241107    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241106    gcc-14.2.0
csky                  randconfig-001-20241107    gcc-14.2.0
csky                  randconfig-002-20241106    gcc-14.2.0
csky                  randconfig-002-20241107    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241106    clang-14
hexagon               randconfig-001-20241107    gcc-14.2.0
hexagon               randconfig-002-20241106    clang-16
hexagon               randconfig-002-20241107    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241106    clang-19
i386        buildonly-randconfig-001-20241107    clang-19
i386        buildonly-randconfig-002-20241106    clang-19
i386        buildonly-randconfig-002-20241107    clang-19
i386        buildonly-randconfig-003-20241106    gcc-12
i386        buildonly-randconfig-003-20241107    clang-19
i386        buildonly-randconfig-004-20241106    clang-19
i386        buildonly-randconfig-004-20241107    clang-19
i386        buildonly-randconfig-005-20241106    clang-19
i386        buildonly-randconfig-005-20241107    clang-19
i386        buildonly-randconfig-006-20241106    gcc-12
i386        buildonly-randconfig-006-20241107    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241106    clang-19
i386                  randconfig-001-20241107    clang-19
i386                  randconfig-002-20241106    gcc-12
i386                  randconfig-002-20241107    clang-19
i386                  randconfig-003-20241106    gcc-12
i386                  randconfig-003-20241107    clang-19
i386                  randconfig-004-20241106    gcc-12
i386                  randconfig-004-20241107    clang-19
i386                  randconfig-005-20241106    clang-19
i386                  randconfig-005-20241107    clang-19
i386                  randconfig-006-20241106    clang-19
i386                  randconfig-006-20241107    clang-19
i386                  randconfig-011-20241106    gcc-12
i386                  randconfig-011-20241107    clang-19
i386                  randconfig-012-20241106    gcc-12
i386                  randconfig-012-20241107    clang-19
i386                  randconfig-013-20241106    gcc-12
i386                  randconfig-013-20241107    clang-19
i386                  randconfig-014-20241106    gcc-12
i386                  randconfig-014-20241107    clang-19
i386                  randconfig-015-20241106    clang-19
i386                  randconfig-015-20241107    clang-19
i386                  randconfig-016-20241106    clang-19
i386                  randconfig-016-20241107    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241106    gcc-14.2.0
loongarch             randconfig-001-20241107    gcc-14.2.0
loongarch             randconfig-002-20241106    gcc-14.2.0
loongarch             randconfig-002-20241107    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    clang-20
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241106    gcc-14.2.0
nios2                 randconfig-001-20241107    gcc-14.2.0
nios2                 randconfig-002-20241106    gcc-14.2.0
nios2                 randconfig-002-20241107    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241106    gcc-14.2.0
parisc                randconfig-001-20241107    gcc-14.2.0
parisc                randconfig-002-20241106    gcc-14.2.0
parisc                randconfig-002-20241107    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        cell_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                   currituck_defconfig    clang-20
powerpc                      mgcoge_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-20
powerpc                     mpc5200_defconfig    clang-20
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc                      pasemi_defconfig    clang-20
powerpc                      ppc44x_defconfig    clang-16
powerpc                      ppc64e_defconfig    clang-20
powerpc               randconfig-001-20241106    gcc-14.2.0
powerpc               randconfig-001-20241107    gcc-14.2.0
powerpc               randconfig-002-20241106    gcc-14.2.0
powerpc               randconfig-002-20241107    gcc-14.2.0
powerpc               randconfig-003-20241106    gcc-14.2.0
powerpc               randconfig-003-20241107    gcc-14.2.0
powerpc                     skiroot_defconfig    clang-20
powerpc                     tqm8555_defconfig    clang-20
powerpc64             randconfig-001-20241106    clang-20
powerpc64             randconfig-002-20241106    clang-20
powerpc64             randconfig-003-20241106    gcc-14.2.0
powerpc64             randconfig-003-20241107    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241106    gcc-14.2.0
riscv                 randconfig-001-20241107    gcc-14.2.0
riscv                 randconfig-002-20241106    clang-20
riscv                 randconfig-002-20241107    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241106    gcc-14.2.0
s390                  randconfig-001-20241107    gcc-14.2.0
s390                  randconfig-002-20241106    clang-20
s390                  randconfig-002-20241107    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    clang-20
sh                    randconfig-001-20241106    gcc-14.2.0
sh                    randconfig-001-20241107    gcc-14.2.0
sh                    randconfig-002-20241106    gcc-14.2.0
sh                    randconfig-002-20241107    gcc-14.2.0
sh                           se7712_defconfig    clang-20
sh                           se7724_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-20
sh                   sh7724_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241106    gcc-14.2.0
sparc64               randconfig-001-20241107    gcc-14.2.0
sparc64               randconfig-002-20241106    gcc-14.2.0
sparc64               randconfig-002-20241107    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241106    clang-20
um                    randconfig-001-20241107    gcc-14.2.0
um                    randconfig-002-20241106    clang-17
um                    randconfig-002-20241107    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241106    clang-19
x86_64      buildonly-randconfig-001-20241107    clang-19
x86_64      buildonly-randconfig-002-20241106    clang-19
x86_64      buildonly-randconfig-002-20241107    clang-19
x86_64      buildonly-randconfig-003-20241106    clang-19
x86_64      buildonly-randconfig-003-20241107    clang-19
x86_64      buildonly-randconfig-004-20241106    gcc-12
x86_64      buildonly-randconfig-004-20241107    clang-19
x86_64      buildonly-randconfig-005-20241106    gcc-12
x86_64      buildonly-randconfig-005-20241107    clang-19
x86_64      buildonly-randconfig-006-20241106    clang-19
x86_64      buildonly-randconfig-006-20241107    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241106    clang-19
x86_64                randconfig-001-20241107    clang-19
x86_64                randconfig-002-20241106    gcc-11
x86_64                randconfig-002-20241107    clang-19
x86_64                randconfig-003-20241106    gcc-12
x86_64                randconfig-003-20241107    clang-19
x86_64                randconfig-004-20241106    gcc-12
x86_64                randconfig-004-20241107    clang-19
x86_64                randconfig-005-20241106    clang-19
x86_64                randconfig-005-20241107    clang-19
x86_64                randconfig-006-20241106    gcc-11
x86_64                randconfig-006-20241107    clang-19
x86_64                randconfig-011-20241106    gcc-11
x86_64                randconfig-011-20241107    clang-19
x86_64                randconfig-012-20241106    gcc-12
x86_64                randconfig-012-20241107    clang-19
x86_64                randconfig-013-20241106    clang-19
x86_64                randconfig-013-20241107    clang-19
x86_64                randconfig-014-20241106    gcc-12
x86_64                randconfig-014-20241107    clang-19
x86_64                randconfig-015-20241106    gcc-12
x86_64                randconfig-015-20241107    clang-19
x86_64                randconfig-016-20241106    gcc-12
x86_64                randconfig-016-20241107    clang-19
x86_64                randconfig-071-20241106    gcc-12
x86_64                randconfig-071-20241107    clang-19
x86_64                randconfig-072-20241106    gcc-12
x86_64                randconfig-072-20241107    clang-19
x86_64                randconfig-073-20241106    clang-19
x86_64                randconfig-073-20241107    clang-19
x86_64                randconfig-074-20241106    gcc-12
x86_64                randconfig-074-20241107    clang-19
x86_64                randconfig-075-20241106    clang-19
x86_64                randconfig-075-20241107    clang-19
x86_64                randconfig-076-20241106    gcc-12
x86_64                randconfig-076-20241107    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241106    gcc-14.2.0
xtensa                randconfig-001-20241107    gcc-14.2.0
xtensa                randconfig-002-20241106    gcc-14.2.0
xtensa                randconfig-002-20241107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
