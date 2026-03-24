Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B0FF532D4
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 07:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A2610E5DB;
	Tue, 24 Mar 2026 07:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rp72YC5y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C3010E5DB
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 07:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774336108; x=1805872108;
 h=date:from:to:cc:subject:message-id;
 bh=TaWJFG0Z/w1XbZihLDfBSQyXiqOPsk+CLI/Bbl0rbZA=;
 b=Rp72YC5yEuE8zoxWzT9fQx9wXzJPWkOlZvXJ0bIWMBZ/K2/87FkUq0rE
 rx2cGYtUzwm9oiOPAFUjioSbX+c/Y95I0Wxm9U74t36BFt335+L7U2zm7
 J2OZj/yAiw6C8IAlD6TqI9Qfz+cpBujKodTmfd6DgzRhupvc9bLVcFOLh
 u2IfJaI7AC17EznfVtB59T5YLd1Ky5M2jLyfAEr+oQPaoL/25z0lW64kN
 Nsfe/JoTIfyRT1jNLFwguMr3Mxc62wpvAZGP2FjHyzDfOTBvh+a9VOJB2
 u+ubSYIClRXwOZeeBdn35dJaWnvUYum8TRpbv1/qe6RuWgE/wy+ZHIzEJ Q==;
X-CSE-ConnectionGUID: 4eTxLFxkSDGlF6Z3Oc7H0w==
X-CSE-MsgGUID: Gbz0KxF5QiOZ4s2RpRhejg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79201492"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="79201492"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 00:08:27 -0700
X-CSE-ConnectionGUID: zYtQcilWQT2ZRvbiz4ca6A==
X-CSE-MsgGUID: rZm5e457QMmY2j9uoe5P4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223350276"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 24 Mar 2026 00:08:25 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w4vsE-0000000047t-3pCI;
 Tue, 24 Mar 2026 07:08:22 +0000
Date: Tue, 24 Mar 2026 15:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 87997b6c6516e049cbaf2fc6810b213d587a06b1
Message-ID: <202603241535.ppGv0cV8-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 87997b6c6516e049cbaf2fc6810b213d587a06b1  drm/xe/pf: Fix use-after-free in migration restore

elapsed time: 732m

configs tested: 167
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260324    gcc-8.5.0
arc                   randconfig-002-20260324    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260324    gcc-8.5.0
arm                   randconfig-002-20260324    gcc-8.5.0
arm                   randconfig-003-20260324    gcc-8.5.0
arm                   randconfig-004-20260324    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260324    gcc-13.4.0
arm64                 randconfig-002-20260324    gcc-13.4.0
arm64                 randconfig-003-20260324    gcc-13.4.0
arm64                 randconfig-004-20260324    gcc-13.4.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260324    gcc-13.4.0
csky                  randconfig-002-20260324    gcc-13.4.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260324    gcc-12
i386        buildonly-randconfig-002-20260324    gcc-12
i386        buildonly-randconfig-003-20260324    gcc-12
i386        buildonly-randconfig-004-20260324    gcc-12
i386        buildonly-randconfig-005-20260324    gcc-12
i386        buildonly-randconfig-006-20260324    gcc-12
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260324    clang-20
i386                  randconfig-002-20260324    clang-20
i386                  randconfig-003-20260324    clang-20
i386                  randconfig-004-20260324    clang-20
i386                  randconfig-005-20260324    clang-20
i386                  randconfig-006-20260324    clang-20
i386                  randconfig-007-20260324    clang-20
i386                  randconfig-011-20260324    gcc-13
i386                  randconfig-012-20260324    gcc-13
i386                  randconfig-013-20260324    gcc-13
i386                  randconfig-014-20260324    gcc-13
i386                  randconfig-015-20260324    gcc-13
i386                  randconfig-016-20260324    gcc-13
i386                  randconfig-017-20260324    gcc-13
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           mtx1_defconfig    clang-23
mips                          rb532_defconfig    clang-18
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260324    gcc-8.5.0
parisc                randconfig-002-20260324    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260324    gcc-8.5.0
powerpc               randconfig-002-20260324    gcc-8.5.0
powerpc64             randconfig-001-20260324    gcc-8.5.0
powerpc64             randconfig-002-20260324    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260324    clang-23
riscv                 randconfig-002-20260324    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260324    clang-23
s390                  randconfig-002-20260324    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260324    clang-23
sh                    randconfig-002-20260324    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260324    gcc-14
sparc                 randconfig-002-20260324    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260324    gcc-14
sparc64               randconfig-002-20260324    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260324    gcc-14
um                    randconfig-002-20260324    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260324    gcc-14
x86_64      buildonly-randconfig-002-20260324    gcc-14
x86_64      buildonly-randconfig-003-20260324    gcc-14
x86_64      buildonly-randconfig-004-20260324    gcc-14
x86_64      buildonly-randconfig-005-20260324    gcc-14
x86_64      buildonly-randconfig-006-20260324    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260324    clang-20
x86_64                randconfig-002-20260324    clang-20
x86_64                randconfig-003-20260324    clang-20
x86_64                randconfig-004-20260324    clang-20
x86_64                randconfig-005-20260324    clang-20
x86_64                randconfig-006-20260324    clang-20
x86_64                randconfig-011-20260324    gcc-14
x86_64                randconfig-012-20260324    gcc-14
x86_64                randconfig-013-20260324    gcc-14
x86_64                randconfig-014-20260324    gcc-14
x86_64                randconfig-015-20260324    gcc-14
x86_64                randconfig-016-20260324    gcc-14
x86_64                randconfig-071-20260324    gcc-12
x86_64                randconfig-072-20260324    gcc-12
x86_64                randconfig-073-20260324    gcc-12
x86_64                randconfig-074-20260324    gcc-12
x86_64                randconfig-075-20260324    gcc-12
x86_64                randconfig-076-20260324    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260324    gcc-14
xtensa                randconfig-002-20260324    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
