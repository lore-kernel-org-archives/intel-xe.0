Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0848CD6E4A
	for <intel-xe@archiver.kernel.org>; Sat, 30 May 2026 10:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEEC11277A;
	Sat, 30 May 2026 10:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxdW/ALb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9099D11277A
 for <intel-xe@lists.freedesktop.org>; Sat, 30 May 2026 10:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780138056; x=1811674056;
 h=date:from:to:cc:subject:message-id;
 bh=Qdwk/Ywqm/LB0nRqG8E1a6smRuyRdF8jSh6oxhgx3YA=;
 b=HxdW/ALbyjTBVI7Oy2MFMZg4Y6QrEpPsz0w3YaKgK4P+I0ciNcyOF+5D
 iCVVSgDDgtbwWuMzi6M/N//2QXHFVpYLE3znQ70yk4evVgMZaQ50VzQvR
 Og7XCgiuDUd3LbDqC8trRPXqcGDQJni/LjThduNewmbO4HIYz36ALbKq4
 590omuOGuIfb9lbXEFxRuRhsWc0EkALUsTQQRL+Ixo5qmRv83JbxAjVaL
 +l2odgPugBagz7JaEpTUhxuIoOLu1kFWvJCikOqSy5rRyiIIUlKGlZrXv
 C6SiT4xDNuY9pHwfwPPBRbukBD2XPrdPCOPq/3t7IuXlst7G64vOlt1lx w==;
X-CSE-ConnectionGUID: eZ1E31UiQq2Ye3PP3hqBJA==
X-CSE-MsgGUID: +I85P/Z7RJiEhVT4XqP4Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81085022"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; d="scan'208";a="81085022"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2026 03:47:35 -0700
X-CSE-ConnectionGUID: UF5wD9NWRtC7qvHC8lc0pA==
X-CSE-MsgGUID: M7aEJrA3S++EDEOU8KgGIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; d="scan'208";a="266946787"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 30 May 2026 03:47:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wTHE3-000000008L4-2sMX;
 Sat, 30 May 2026 10:47:31 +0000
Date: Sat, 30 May 2026 18:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 e324041cd4b66cfe43ca2fc0da9619c37ccfcab8
Message-ID: <202605301827.ULLCTUWO-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: e324041cd4b66cfe43ca2fc0da9619c37ccfcab8  topic/xe-for-CI: Define GuC firmware for NVL-P

elapsed time: 788m

configs tested: 169
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
arc                   randconfig-001-20260530    gcc-14.3.0
arc                   randconfig-002-20260530    gcc-14.3.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260530    gcc-14.3.0
arm                   randconfig-002-20260530    gcc-14.3.0
arm                   randconfig-003-20260530    gcc-14.3.0
arm                   randconfig-004-20260530    gcc-14.3.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260530    gcc-8.5.0
arm64                 randconfig-002-20260530    gcc-8.5.0
arm64                 randconfig-003-20260530    gcc-8.5.0
arm64                 randconfig-004-20260530    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260530    gcc-8.5.0
csky                  randconfig-002-20260530    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260530    clang-23
hexagon               randconfig-002-20260530    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260530    clang-20
i386        buildonly-randconfig-002-20260530    clang-20
i386        buildonly-randconfig-003-20260530    clang-20
i386        buildonly-randconfig-004-20260530    clang-20
i386        buildonly-randconfig-005-20260530    clang-20
i386        buildonly-randconfig-006-20260530    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260530    clang-20
i386                  randconfig-002-20260530    clang-20
i386                  randconfig-003-20260530    clang-20
i386                  randconfig-004-20260530    clang-20
i386                  randconfig-005-20260530    clang-20
i386                  randconfig-006-20260530    clang-20
i386                  randconfig-007-20260530    clang-20
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260530    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260530    clang-20
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260530    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260530    clang-20
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260530    clang-20
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260530    clang-20
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260530    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260530    clang-23
loongarch             randconfig-002-20260530    clang-23
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
mips                        qi_lb60_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260530    clang-23
nios2                 randconfig-002-20260530    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260530    gcc-8.5.0
parisc                randconfig-002-20260530    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260530    gcc-8.5.0
powerpc               randconfig-002-20260530    gcc-8.5.0
powerpc64             randconfig-001-20260530    gcc-8.5.0
powerpc64             randconfig-002-20260530    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260530    gcc-12.5.0
riscv                 randconfig-002-20260530    gcc-12.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260530    gcc-12.5.0
s390                  randconfig-002-20260530    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260530    gcc-12.5.0
sh                    randconfig-002-20260530    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260530    gcc-9.5.0
sparc                 randconfig-002-20260530    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260530    gcc-9.5.0
sparc64               randconfig-002-20260530    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260530    gcc-9.5.0
um                    randconfig-002-20260530    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260530    gcc-14
x86_64      buildonly-randconfig-002-20260530    gcc-14
x86_64      buildonly-randconfig-003-20260530    gcc-14
x86_64      buildonly-randconfig-004-20260530    gcc-14
x86_64      buildonly-randconfig-005-20260530    gcc-14
x86_64      buildonly-randconfig-006-20260530    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-011-20260530    gcc-14
x86_64                randconfig-012-20260530    gcc-14
x86_64                randconfig-013-20260530    gcc-14
x86_64                randconfig-014-20260530    gcc-14
x86_64                randconfig-015-20260530    gcc-14
x86_64                randconfig-016-20260530    gcc-14
x86_64                randconfig-071-20260530    gcc-14
x86_64                randconfig-072-20260530    gcc-14
x86_64                randconfig-073-20260530    gcc-14
x86_64                randconfig-074-20260530    gcc-14
x86_64                randconfig-075-20260530    gcc-14
x86_64                randconfig-076-20260530    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260530    gcc-9.5.0
xtensa                randconfig-002-20260530    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
