Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245CCD3E1A8
	for <intel-xe@archiver.kernel.org>; Sat, 19 Oct 2024 02:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4042710E1A4;
	Sat, 19 Oct 2024 02:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjB1wsxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1B610E1A4
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Oct 2024 02:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729304601; x=1760840601;
 h=date:from:to:cc:subject:message-id;
 bh=UcWWbV8pebvD1ZEvuFgIJf3eZeHyjg4eCg0uGimNV0k=;
 b=kjB1wsxbbqhIzsQMfxTFiz1/qy/srKsd/P5ElM+uUvdajDrvvY1vj6AA
 cJDEg42Wu8sItf+oYQwhO5uzMUKQrz0WXpHIAFXiy23GDBfJ6pZcbuTcg
 4wdQUL7R4SE3ijgCFLl76LTdwMme59/QH0pgs/z7qrdofC3PwcPvz3BJE
 RPnTzQCpKSQE39KX+kZdUbU7sOLqIpq1he+igrVvOWNLibfNdDTwQZwr7
 TBlLlG8RSvgAF9qgpywR6BukDZSgzW4l/pe8pgYpGy+TI/jNa44+/z43r
 B8pVueheZpVJvS1a6rbAGk+fzcPZcHO4HMsR8FSzwXCeDWJxujDZ7GRGY A==;
X-CSE-ConnectionGUID: DpGGsQ9sTF+tfvSC7QHkkg==
X-CSE-MsgGUID: Im1FZbqlRrGkbRQU9A+tmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46310091"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46310091"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 19:23:20 -0700
X-CSE-ConnectionGUID: /XymrIQ1SX+zaH/aIf6xnA==
X-CSE-MsgGUID: 7GV8GKRnT+aU9aaHUkQAzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="83856476"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 18 Oct 2024 19:23:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t1z7c-000ObF-04;
 Sat, 19 Oct 2024 02:23:16 +0000
Date: Sat, 19 Oct 2024 10:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 ffafd12696d1a4c8eeb7386d798d75e1fafb4e01
Message-ID: <202410191032.ZPJBJkjT-lkp@intel.com>
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
branch HEAD: ffafd12696d1a4c8eeb7386d798d75e1fafb4e01  drm/i915/display: Don't allow tile4 framebuffer to do hflip on display20 or greater

elapsed time: 1391m

configs tested: 170
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241019    clang-16
arc                   randconfig-002-20241019    clang-16
arc                        vdk_hs38_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                         nhk8815_defconfig    clang-20
arm                       omap2plus_defconfig    clang-20
arm                   randconfig-001-20241019    clang-16
arm                   randconfig-002-20241019    clang-16
arm                   randconfig-003-20241019    clang-16
arm                   randconfig-004-20241019    clang-16
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241019    clang-16
arm64                 randconfig-002-20241019    clang-16
arm64                 randconfig-003-20241019    clang-16
arm64                 randconfig-004-20241019    clang-16
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241019    clang-16
csky                  randconfig-002-20241019    clang-16
hexagon                          alldefconfig    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241019    clang-16
hexagon               randconfig-002-20241019    clang-16
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241019    clang-18
i386        buildonly-randconfig-002-20241019    clang-18
i386        buildonly-randconfig-003-20241019    clang-18
i386        buildonly-randconfig-004-20241019    clang-18
i386        buildonly-randconfig-005-20241019    clang-18
i386        buildonly-randconfig-006-20241019    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241019    clang-18
i386                  randconfig-002-20241019    clang-18
i386                  randconfig-003-20241019    clang-18
i386                  randconfig-004-20241019    clang-18
i386                  randconfig-005-20241019    clang-18
i386                  randconfig-006-20241019    clang-18
i386                  randconfig-011-20241019    clang-18
i386                  randconfig-012-20241019    clang-18
i386                  randconfig-013-20241019    clang-18
i386                  randconfig-014-20241019    clang-18
i386                  randconfig-015-20241019    clang-18
i386                  randconfig-016-20241019    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241019    clang-16
loongarch             randconfig-002-20241019    clang-16
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    clang-20
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          eyeq5_defconfig    clang-20
mips                         rt305x_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241019    clang-16
nios2                 randconfig-002-20241019    clang-16
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    clang-20
parisc                randconfig-001-20241019    clang-16
parisc                randconfig-002-20241019    clang-16
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   currituck_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                    mvme5100_defconfig    clang-20
powerpc               randconfig-001-20241019    clang-16
powerpc               randconfig-002-20241019    clang-16
powerpc               randconfig-003-20241019    clang-16
powerpc                     tqm8541_defconfig    clang-20
powerpc64             randconfig-001-20241019    clang-16
powerpc64             randconfig-002-20241019    clang-16
powerpc64             randconfig-003-20241019    clang-16
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241019    clang-16
riscv                 randconfig-002-20241019    clang-16
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241019    clang-16
s390                  randconfig-002-20241019    clang-16
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241019    clang-16
sh                    randconfig-002-20241019    clang-16
sh                      rts7751r2d1_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241019    clang-16
sparc64               randconfig-002-20241019    clang-16
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241019    clang-16
um                    randconfig-002-20241019    clang-16
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241019    clang-18
x86_64      buildonly-randconfig-002-20241019    clang-18
x86_64      buildonly-randconfig-003-20241019    clang-18
x86_64      buildonly-randconfig-004-20241019    clang-18
x86_64      buildonly-randconfig-005-20241019    clang-18
x86_64      buildonly-randconfig-006-20241019    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241019    clang-18
x86_64                randconfig-002-20241019    clang-18
x86_64                randconfig-003-20241019    clang-18
x86_64                randconfig-004-20241019    clang-18
x86_64                randconfig-005-20241019    clang-18
x86_64                randconfig-006-20241019    clang-18
x86_64                randconfig-011-20241019    clang-18
x86_64                randconfig-012-20241019    clang-18
x86_64                randconfig-013-20241019    clang-18
x86_64                randconfig-014-20241019    clang-18
x86_64                randconfig-015-20241019    clang-18
x86_64                randconfig-016-20241019    clang-18
x86_64                randconfig-071-20241019    clang-18
x86_64                randconfig-072-20241019    clang-18
x86_64                randconfig-073-20241019    clang-18
x86_64                randconfig-074-20241019    clang-18
x86_64                randconfig-075-20241019    clang-18
x86_64                randconfig-076-20241019    clang-18
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    clang-20
xtensa                randconfig-001-20241019    clang-16
xtensa                randconfig-002-20241019    clang-16

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
