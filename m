Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905DBC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 22:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D03110F9B1;
	Fri,  3 Jul 2026 22:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzSEBcm+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAEF10F9B1
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 22:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783117821; x=1814653821;
 h=date:from:to:cc:subject:message-id;
 bh=rIxrr/WKzgLl+Uye9yMzYqL9m2iIlJSlZ1fbSrFPGhs=;
 b=fzSEBcm+kLIFfVqZck7tYm5yWo/9019d+qHalLyIvY9T8aY/6ri0/tgB
 CdvhGjcR64I0hWbT9WhFZfxeNj5UQTdKY8QWHKta3aODvpIOhMa7VasrZ
 pAFyr4n7EyngBbPw/u+XUVaO2cetRF4mzAo8n754hJwY8/pWUYdwnbXvd
 vHZSOWLIEQacs2OP66YE5mSgjUk5YWLEY7m9ytLDHSV8+ROa+5D2Ch+q9
 YsXMK9TtH6s5Q/+Z/RcVcyIEO3HPe87EbS0cebJKLTAOnLB+1PcbU1eq2
 KLiPE+Dso588J7IKoSw9JdZQpmapWefHOb2sgR0zFAPP+siGXgi0aHf2N w==;
X-CSE-ConnectionGUID: edPKnMrbQWyIICsn3ixrLA==
X-CSE-MsgGUID: GkgRqC7uT6+ffnKb23sP8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87774959"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87774959"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 15:30:20 -0700
X-CSE-ConnectionGUID: IE9llLRbQMmwGUot08lmKw==
X-CSE-MsgGUID: vhibKrEERqyN+479JGyIhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="252138934"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 03 Jul 2026 15:30:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wfmOm-00000000Cbf-2Syb;
 Fri, 03 Jul 2026 22:30:16 +0000
Date: Sat, 04 Jul 2026 06:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS WITH WARNING
 820de07bba7b7c97e0f52e1d66bf6147a25ab67f
Message-ID: <202607040647.7np2Np0Y-lkp@intel.com>
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
branch HEAD: 820de07bba7b7c97e0f52e1d66bf6147a25ab67f  drm/xe: Add tile_count to xe_probed_info

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606302210.QqcLbOEN-lkp@intel.com

    drivers/gpu/drm/xe/xe_pt.c:1430:13: warning: 'xe_pt_svm_userptr_notifier_lock' defined but not used [-Wunused-function]

Warning ids grouped by kconfigs:

recent_errors
`-- um-allyesconfig
    `-- drivers-gpu-drm-xe-xe_pt.c:warning:xe_pt_svm_userptr_notifier_lock-defined-but-not-used

elapsed time: 1443m

configs tested: 375
configs skipped: 10

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260703    gcc-16.1.0
arc                   randconfig-001-20260703    gcc-8.5.0
arc                   randconfig-001-20260704    gcc-8.5.0
arc                            randconfig-002    gcc-16.1.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260703    gcc-12.5.0
arc                   randconfig-002-20260703    gcc-16.1.0
arc                   randconfig-002-20260704    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                        keystone_defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260703    gcc-12.5.0
arm                   randconfig-001-20260703    gcc-16.1.0
arm                   randconfig-001-20260704    gcc-8.5.0
arm                            randconfig-002    gcc-15.2.0
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260703    gcc-16.1.0
arm                   randconfig-002-20260703    gcc-8.5.0
arm                   randconfig-002-20260704    gcc-8.5.0
arm                            randconfig-003    clang-23
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260703    clang-23
arm                   randconfig-003-20260703    gcc-16.1.0
arm                   randconfig-003-20260704    gcc-8.5.0
arm                            randconfig-004    gcc-13.4.0
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260703    clang-23
arm                   randconfig-004-20260703    gcc-16.1.0
arm                   randconfig-004-20260704    gcc-8.5.0
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-10.5.0
arm64                 randconfig-001-20260703    clang-23
arm64                 randconfig-001-20260703    gcc-10.5.0
arm64                 randconfig-001-20260704    gcc-16.1.0
arm64                          randconfig-002    gcc-10.5.0
arm64                 randconfig-002-20260703    gcc-10.5.0
arm64                 randconfig-002-20260703    gcc-12.5.0
arm64                 randconfig-002-20260704    gcc-16.1.0
arm64                          randconfig-003    gcc-10.5.0
arm64                 randconfig-003-20260703    gcc-10.5.0
arm64                 randconfig-003-20260704    gcc-16.1.0
arm64                          randconfig-004    gcc-10.5.0
arm64                 randconfig-004-20260703    gcc-10.5.0
arm64                 randconfig-004-20260703    gcc-8.5.0
arm64                 randconfig-004-20260704    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-10.5.0
csky                  randconfig-001-20260703    gcc-10.5.0
csky                  randconfig-001-20260703    gcc-12.5.0
csky                  randconfig-001-20260704    gcc-16.1.0
csky                           randconfig-002    gcc-10.5.0
csky                  randconfig-002-20260703    gcc-10.5.0
csky                  randconfig-002-20260704    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    clang-23
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260703    clang-23
hexagon               randconfig-001-20260703    gcc-11.5.0
hexagon               randconfig-001-20260703    gcc-16.1.0
hexagon               randconfig-001-20260704    gcc-16.1.0
hexagon                        randconfig-002    clang-23
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260703    clang-23
hexagon               randconfig-002-20260703    gcc-11.5.0
hexagon               randconfig-002-20260703    gcc-16.1.0
hexagon               randconfig-002-20260704    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260703    clang-22
i386        buildonly-randconfig-001-20260704    gcc-14
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260703    clang-22
i386        buildonly-randconfig-002-20260704    gcc-14
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260703    clang-22
i386        buildonly-randconfig-003-20260704    gcc-14
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260703    clang-22
i386        buildonly-randconfig-004-20260704    gcc-14
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260703    clang-22
i386        buildonly-randconfig-005-20260704    gcc-14
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260703    clang-22
i386        buildonly-randconfig-006-20260704    gcc-14
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260703    clang-22
i386                  randconfig-001-20260704    gcc-14
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260703    clang-22
i386                  randconfig-002-20260704    gcc-14
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260703    clang-22
i386                  randconfig-003-20260703    gcc-14
i386                  randconfig-003-20260704    gcc-14
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260703    clang-22
i386                  randconfig-004-20260704    gcc-14
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260703    clang-22
i386                  randconfig-005-20260704    gcc-14
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260703    clang-22
i386                  randconfig-006-20260704    gcc-14
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260703    clang-22
i386                  randconfig-007-20260704    gcc-14
i386                  randconfig-011-20260703    clang-22
i386                  randconfig-011-20260703    gcc-12
i386                  randconfig-012-20260703    clang-22
i386                  randconfig-012-20260703    gcc-14
i386                  randconfig-013-20260703    clang-22
i386                  randconfig-013-20260703    gcc-14
i386                  randconfig-014-20260703    clang-22
i386                  randconfig-015-20260703    clang-22
i386                  randconfig-015-20260703    gcc-14
i386                  randconfig-016-20260703    clang-22
i386                  randconfig-016-20260703    gcc-14
i386                  randconfig-017-20260703    clang-22
i386                  randconfig-017-20260703    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260703    gcc-11.5.0
loongarch             randconfig-001-20260703    gcc-16.1.0
loongarch             randconfig-001-20260704    gcc-16.1.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch                      randconfig-002    gcc-16.1.0
loongarch             randconfig-002-20260703    clang-19
loongarch             randconfig-002-20260703    gcc-11.5.0
loongarch             randconfig-002-20260703    gcc-16.1.0
loongarch             randconfig-002-20260704    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
m68k                          hp300_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                          eyeq5_defconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260703    gcc-11.5.0
nios2                 randconfig-001-20260703    gcc-16.1.0
nios2                 randconfig-001-20260703    gcc-8.5.0
nios2                 randconfig-001-20260704    gcc-16.1.0
nios2                          randconfig-002    gcc-11.5.0
nios2                          randconfig-002    gcc-8.5.0
nios2                 randconfig-002-20260703    gcc-11.5.0
nios2                 randconfig-002-20260703    gcc-16.1.0
nios2                 randconfig-002-20260704    gcc-16.1.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260703    clang-23
parisc                randconfig-001-20260703    gcc-11.5.0
parisc                randconfig-001-20260704    clang-23
parisc                randconfig-002-20260703    clang-23
parisc                randconfig-002-20260703    gcc-9.5.0
parisc                randconfig-002-20260704    clang-23
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260703    clang-23
powerpc               randconfig-001-20260703    gcc-12.5.0
powerpc               randconfig-001-20260704    clang-23
powerpc               randconfig-002-20260703    clang-23
powerpc               randconfig-002-20260703    gcc-8.5.0
powerpc               randconfig-002-20260704    clang-23
powerpc64             randconfig-001-20260703    clang-23
powerpc64             randconfig-001-20260704    clang-23
powerpc64             randconfig-002-20260703    clang-23
powerpc64             randconfig-002-20260704    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260703    gcc-9.5.0
riscv                 randconfig-001-20260704    gcc-10.5.0
riscv                 randconfig-002-20260703    gcc-9.5.0
riscv                 randconfig-002-20260704    gcc-10.5.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260703    gcc-9.5.0
s390                  randconfig-001-20260704    gcc-10.5.0
s390                  randconfig-002-20260703    gcc-9.5.0
s390                  randconfig-002-20260704    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260703    gcc-9.5.0
sh                    randconfig-001-20260704    gcc-10.5.0
sh                    randconfig-002-20260703    gcc-9.5.0
sh                    randconfig-002-20260704    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-16.1.0
sparc                 randconfig-001-20260703    gcc-11.5.0
sparc                 randconfig-001-20260703    gcc-13.4.0
sparc                 randconfig-001-20260704    gcc-16.1.0
sparc                          randconfig-002    gcc-11.5.0
sparc                 randconfig-002-20260703    gcc-11.5.0
sparc                 randconfig-002-20260704    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-12.5.0
sparc64               randconfig-001-20260703    gcc-11.5.0
sparc64               randconfig-001-20260703    gcc-8.5.0
sparc64               randconfig-001-20260704    gcc-16.1.0
sparc64                        randconfig-002    clang-20
sparc64               randconfig-002-20260703    gcc-11.5.0
sparc64               randconfig-002-20260703    gcc-15.2.0
sparc64               randconfig-002-20260704    gcc-16.1.0
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    clang-23
um                    randconfig-001-20260703    clang-19
um                    randconfig-001-20260703    gcc-11.5.0
um                    randconfig-001-20260704    gcc-16.1.0
um                             randconfig-002    clang-23
um                    randconfig-002-20260703    clang-17
um                    randconfig-002-20260703    gcc-11.5.0
um                    randconfig-002-20260704    gcc-16.1.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260703    gcc-14
x86_64      buildonly-randconfig-001-20260704    gcc-14
x86_64      buildonly-randconfig-002-20260703    gcc-14
x86_64      buildonly-randconfig-002-20260704    gcc-14
x86_64      buildonly-randconfig-003-20260703    gcc-14
x86_64      buildonly-randconfig-003-20260704    gcc-14
x86_64      buildonly-randconfig-004-20260703    gcc-14
x86_64      buildonly-randconfig-004-20260704    gcc-14
x86_64      buildonly-randconfig-005-20260703    clang-22
x86_64      buildonly-randconfig-005-20260703    gcc-14
x86_64      buildonly-randconfig-005-20260704    gcc-14
x86_64      buildonly-randconfig-006-20260703    gcc-14
x86_64      buildonly-randconfig-006-20260704    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260703    clang-22
x86_64                randconfig-001-20260703    gcc-14
x86_64                randconfig-001-20260704    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260703    clang-22
x86_64                randconfig-002-20260704    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260703    clang-22
x86_64                randconfig-003-20260704    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260703    clang-22
x86_64                randconfig-004-20260703    gcc-12
x86_64                randconfig-004-20260704    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260703    clang-22
x86_64                randconfig-005-20260703    gcc-14
x86_64                randconfig-005-20260704    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260703    clang-22
x86_64                randconfig-006-20260704    clang-22
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260703    gcc-13
x86_64                randconfig-011-20260703    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260703    gcc-14
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260703    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260703    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260703    gcc-14
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260703    clang-22
x86_64                randconfig-016-20260703    gcc-14
x86_64                randconfig-071-20260703    clang-22
x86_64                randconfig-071-20260704    gcc-14
x86_64                randconfig-072-20260703    clang-22
x86_64                randconfig-072-20260704    gcc-14
x86_64                randconfig-073-20260703    clang-22
x86_64                randconfig-073-20260703    gcc-14
x86_64                randconfig-073-20260704    gcc-14
x86_64                randconfig-074-20260703    clang-22
x86_64                randconfig-074-20260704    gcc-14
x86_64                randconfig-075-20260703    clang-22
x86_64                randconfig-075-20260704    gcc-14
x86_64                randconfig-076-20260703    clang-22
x86_64                randconfig-076-20260703    gcc-14
x86_64                randconfig-076-20260704    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                       common_defconfig    gcc-16.1.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260703    gcc-11.5.0
xtensa                randconfig-001-20260704    gcc-16.1.0
xtensa                         randconfig-002    gcc-13.4.0
xtensa                randconfig-002-20260703    gcc-11.5.0
xtensa                randconfig-002-20260704    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
