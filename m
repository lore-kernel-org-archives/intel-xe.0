Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B128CD8C8C
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jun 2026 15:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9007D10E2E6;
	Sun,  7 Jun 2026 15:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwonFZX3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C9010E2E6
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Jun 2026 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780847311; x=1812383311;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=5MeDPRcE6RqsQizL+Km1dhPuSFOo3HLE07k2UnyC7kk=;
 b=hwonFZX3BCVoZY29p1Pk5ogG5t9W8J+Fi1cxR3x85qmlU4DI/0tqBQKp
 T5UMIt8SDTJYHxBluhls4B2gBFUgJU43LZm5fslp3/oN3vGARNDJJpN/t
 z/NY44CNFUXoPRPH771Qev0icu3jhayxnONEWG+hRaNdUsyhHnJhMKote
 EYacHKECaI5KaQx+NKQhDzBR6z8nNELqMfYNuPIuoFrdp8hoLx30rKKk9
 NNTcPWLA7HU2JHcIy8sPMZvKUL7eCdZGDL7KkspaW8zKCAQGLbQL+nzig
 04u3flnsNvUEZxUsCf4VzdGT67Q4Xw8wnyzYUwS00C8/z3QtNc7Waqru4 A==;
X-CSE-ConnectionGUID: SWymmpqST9a8t72AVMs/sQ==
X-CSE-MsgGUID: NUC2ULk1SiC3aJwcuXY7Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80628893"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; d="scan'208";a="80628893"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 08:48:31 -0700
X-CSE-ConnectionGUID: ZimBXs6qS8iBsDAt1K+SIg==
X-CSE-MsgGUID: +RMif5g6RY6BCozsK2aKGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; d="scan'208";a="247157685"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 07 Jun 2026 08:48:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wWFjf-00000000Hx8-0x5a;
 Sun, 07 Jun 2026 15:48:27 +0000
Date: Sun, 07 Jun 2026 23:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD REGRESSION
 b226489de47c0eba740ef8c4857aecb06e482952
Message-ID: <202606072307.hvBdgJ2j-lkp@intel.com>
User-Agent: s-nail v14.9.25
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
branch HEAD: b226489de47c0eba740ef8c4857aecb06e482952  Merge drm/drm-next into drm-xe-next

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606041255.dGo9lFkh-lkp@intel.com

    drivers/gpu/drm/xe/xe_hw_engine.c:361:6: error: initializer element is not a compile-time constant

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-003
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- i386-buildonly-randconfig-003-20260606
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- i386-randconfig-004-20260606
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- riscv-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- s390-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- um-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- x86_64-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- x86_64-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- x86_64-randconfig-073-20260606
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
|-- x86_64-randconfig-074-20260606
|   `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant
`-- x86_64-randconfig-075-20260606
    `-- drivers-gpu-drm-xe-xe_hw_engine.c:error:initializer-element-is-not-a-compile-time-constant

elapsed time: 2501m

configs tested: 192
configs skipped: 11

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260606    gcc-12.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260606    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260606    clang-17
arm                            randconfig-002    gcc-11.5.0
arm                   randconfig-002-20260606    gcc-10.5.0
arm                            randconfig-003    clang-20
arm                   randconfig-003-20260606    clang-23
arm                            randconfig-004    gcc-14.3.0
arm                   randconfig-004-20260606    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260606    gcc-8.5.0
arm64                 randconfig-002-20260606    gcc-8.5.0
arm64                 randconfig-003-20260606    clang-23
arm64                 randconfig-004-20260606    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260606    gcc-16.1.0
csky                  randconfig-002-20260606    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260606    clang-23
hexagon               randconfig-002-20260606    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260606    clang-20
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260606    clang-20
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260606    clang-20
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260606    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260606    clang-20
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260606    gcc-13
i386                                defconfig    clang-22
i386                  randconfig-001-20260606    clang-20
i386                  randconfig-002-20260606    gcc-14
i386                  randconfig-003-20260606    clang-20
i386                  randconfig-004-20260606    clang-20
i386                  randconfig-005-20260606    gcc-14
i386                  randconfig-006-20260606    clang-20
i386                  randconfig-007-20260606    clang-20
i386                  randconfig-011-20260606    clang-20
i386                  randconfig-012-20260606    gcc-14
i386                  randconfig-013-20260606    gcc-12
i386                  randconfig-014-20260606    clang-20
i386                  randconfig-015-20260606    clang-20
i386                  randconfig-016-20260606    gcc-14
i386                  randconfig-017-20260606    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260606    clang-23
loongarch             randconfig-002-20260606    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-16.1.0
m68k                        m5407c3_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260606    gcc-11.5.0
nios2                 randconfig-002-20260606    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260606    gcc-9.5.0
parisc                         randconfig-002    gcc-12.5.0
parisc                randconfig-002-20260606    gcc-11.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                        randconfig-001    gcc-10.5.0
powerpc               randconfig-001-20260606    clang-18
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260606    clang-23
powerpc64                      randconfig-001    clang-16
powerpc64             randconfig-001-20260606    gcc-8.5.0
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260606    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260606    gcc-11.5.0
riscv                 randconfig-001-20260607    clang-23
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260606    gcc-8.5.0
riscv                 randconfig-002-20260607    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-18
s390                           randconfig-001    gcc-11.5.0
s390                  randconfig-001-20260606    gcc-10.5.0
s390                  randconfig-001-20260607    clang-23
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260606    gcc-13.4.0
s390                  randconfig-002-20260607    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-16.1.0
sh                             randconfig-001    gcc-16.1.0
sh                    randconfig-001-20260606    gcc-10.5.0
sh                    randconfig-001-20260607    gcc-11.5.0
sh                             randconfig-002    gcc-14.3.0
sh                    randconfig-002-20260607    gcc-9.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260606    gcc-13.4.0
sparc                 randconfig-002-20260606    gcc-16.1.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-23
sparc64               randconfig-001-20260606    gcc-12.5.0
sparc64               randconfig-002-20260606    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260606    clang-23
um                    randconfig-002-20260606    gcc-14
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260606    clang-22
x86_64      buildonly-randconfig-002-20260606    clang-22
x86_64      buildonly-randconfig-003-20260606    gcc-14
x86_64      buildonly-randconfig-004-20260606    gcc-13
x86_64      buildonly-randconfig-005-20260606    clang-22
x86_64      buildonly-randconfig-006-20260606    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260606    gcc-14
x86_64                randconfig-002-20260606    gcc-14
x86_64                randconfig-003-20260606    gcc-14
x86_64                randconfig-004-20260606    gcc-14
x86_64                randconfig-005-20260606    gcc-14
x86_64                randconfig-006-20260606    gcc-14
x86_64                randconfig-011-20260606    clang-22
x86_64                randconfig-012-20260606    clang-22
x86_64                randconfig-013-20260606    gcc-14
x86_64                randconfig-014-20260606    clang-22
x86_64                randconfig-015-20260606    clang-22
x86_64                randconfig-016-20260606    clang-22
x86_64                randconfig-071-20260606    clang-20
x86_64                randconfig-072-20260606    gcc-14
x86_64                randconfig-073-20260606    clang-20
x86_64                randconfig-074-20260606    clang-20
x86_64                randconfig-075-20260606    clang-20
x86_64                randconfig-076-20260606    gcc-13
x86_64                          rhel-9.4-rust    clang-20
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260606    gcc-8.5.0
xtensa                randconfig-002-20260606    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
