Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B47C87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 19:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CF410E3A2;
	Thu, 31 Jul 2025 19:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyCx3pnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA2410E3A2
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 19:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753989623; x=1785525623;
 h=date:from:to:cc:subject:message-id;
 bh=Qb7/gjj2r04lE203uUkLFEsplJnBtGMtwRPrSPeu98g=;
 b=QyCx3pnrKf7DoHQ9JpYrD4QmG8o9QBLmCZ/OJE+JhEPAyeFphVX0nPii
 GPxDxujAH6TkQQvlW+Y7x0vwq5CCsLtmyip21srccBAIt9JNqrcxFheFk
 9jruW0UyYZxo+GIMOWayndOdCMj57iQcSrMGb/2rSBy+bPSuAgeqAjwSN
 0nZRzArNFC3YUDpQEvFJLdSaqA7hqcbVSrIzCHOeCNTEdHWG5ybHNpY3a
 xJ4b9fHzOrv6vlQTe5FOVQuZwe+rusZdigWmwVkM1fJrAtVm/VCz5BVaS
 uTNkFPcroaK0WzXMBy7iqUYCnyGohEQ/ijLQig5GYQI/Rnu3MIJTnJ/o8 w==;
X-CSE-ConnectionGUID: GFVbgiZXSWG5rWXJLWl54w==
X-CSE-MsgGUID: fES6okJsRDS8JGVQc3dhTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56473048"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56473048"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:20:23 -0700
X-CSE-ConnectionGUID: 3JCPsJ0qSEi6mnfDIyk/iQ==
X-CSE-MsgGUID: OWU5HbM+QsO7ymuEKPx7yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163790851"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 31 Jul 2025 12:20:22 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uhYpA-00041k-0o;
 Thu, 31 Jul 2025 19:20:20 +0000
Date: Fri, 01 Aug 2025 03:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 f62408efc8669b82541295a4611494c8c8c52684
Message-ID: <202508010324.zNvcbITG-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: f62408efc8669b82541295a4611494c8c8c52684  drm/xe/vf: Disable CSC support on VF

elapsed time: 1324m

configs tested: 125
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250731    gcc-13.4.0
arc                   randconfig-002-20250731    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250731    gcc-14.3.0
arm                   randconfig-002-20250731    gcc-8.5.0
arm                   randconfig-003-20250731    gcc-8.5.0
arm                   randconfig-004-20250731    clang-22
arm                         s3c6400_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250731    gcc-8.5.0
arm64                 randconfig-002-20250731    gcc-13.4.0
arm64                 randconfig-003-20250731    gcc-10.5.0
arm64                 randconfig-004-20250731    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250731    gcc-12.5.0
csky                  randconfig-002-20250731    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250731    clang-16
hexagon               randconfig-002-20250731    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250731    gcc-12
i386        buildonly-randconfig-002-20250731    gcc-12
i386        buildonly-randconfig-003-20250731    clang-20
i386        buildonly-randconfig-004-20250731    gcc-12
i386        buildonly-randconfig-005-20250731    gcc-12
i386        buildonly-randconfig-006-20250731    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250731    gcc-13.4.0
loongarch             randconfig-002-20250731    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip27_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250731    gcc-11.5.0
nios2                 randconfig-002-20250731    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250731    gcc-8.5.0
parisc                randconfig-002-20250731    gcc-8.5.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-22
powerpc               randconfig-001-20250731    gcc-13.4.0
powerpc               randconfig-002-20250731    gcc-13.4.0
powerpc               randconfig-003-20250731    gcc-15.1.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250731    clang-22
powerpc64             randconfig-002-20250731    gcc-12.5.0
powerpc64             randconfig-003-20250731    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250731    gcc-13.4.0
riscv                 randconfig-002-20250731    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250731    clang-22
s390                  randconfig-002-20250731    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250731    gcc-10.5.0
sh                    randconfig-002-20250731    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250731    gcc-8.5.0
sparc                 randconfig-002-20250731    gcc-11.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250731    gcc-8.5.0
sparc64               randconfig-002-20250731    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250731    clang-22
um                    randconfig-002-20250731    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250731    gcc-12
x86_64      buildonly-randconfig-002-20250731    clang-20
x86_64      buildonly-randconfig-003-20250731    gcc-12
x86_64      buildonly-randconfig-004-20250731    gcc-12
x86_64      buildonly-randconfig-005-20250731    gcc-12
x86_64      buildonly-randconfig-006-20250731    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250731    gcc-14.3.0
xtensa                randconfig-002-20250731    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
