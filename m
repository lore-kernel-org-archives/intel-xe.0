Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70440CAC583
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 06:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC5B10E08A;
	Thu, 11 Sep 2025 06:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9r8gSGh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55D310E08A
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 06:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757573729; x=1789109729;
 h=date:from:to:cc:subject:message-id;
 bh=KAFkdI4pS7gBCkulGaHDrw+BbI9wQ8vv3+9Jhjb3uCA=;
 b=h9r8gSGhsjaaCEtoMEH89fQe+qCQtKFnxX8cea1uh0IsgMZ1k2krwxAX
 l32oz+ekvdi/LkkhBZCfHoWQuVGQAypafsXMyTRVYYViD0mDMR8bnkLvb
 w8x61i/a942R1ESnzTnYN0joU64iSMmqzwYMPDok2qvwLM8oKRIl8S0aw
 C5U3b0sgOM2cSD7hHUwmYdNV9mhlVIKsVO4JRfBgTTfQ07yIpgjW3Pbln
 dJCGtIw1xOUWeMsEiai848CGaZ6BZ8YdGhRgGNY5mUP5KdnuxHSvfw9mA
 DhqIzB76nz7sbXyP+y7BuiFAjgFmEUSI9N7UaBR9H/OA055qmJkht3yph g==;
X-CSE-ConnectionGUID: fo+MIZTHTAC1bTMUcbs2+A==
X-CSE-MsgGUID: Tfnu/ugfQNad/9q9Mmoipw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77505658"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="77505658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:55:29 -0700
X-CSE-ConnectionGUID: lVWTol11TfCsnd0MpyUXww==
X-CSE-MsgGUID: BJ4GI9yWTOC1bh/pkjNmYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="210747605"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 10 Sep 2025 23:55:28 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uwbDG-00006u-1W;
 Thu, 11 Sep 2025 06:55:23 +0000
Date: Thu, 11 Sep 2025 14:54:51 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 fd99415ec8a80866e5e19f7835876e7b4f294946
Message-ID: <202509111440.lG55KLch-lkp@intel.com>
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
branch HEAD: fd99415ec8a80866e5e19f7835876e7b4f294946  drm/xe: Extend Wa_13011645652 to PTL-H, WCL

elapsed time: 995m

configs tested: 225
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250911    clang-22
arc                   randconfig-001-20250911    gcc-8.5.0
arc                   randconfig-002-20250911    clang-22
arc                   randconfig-002-20250911    gcc-12.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250911    clang-22
arm                   randconfig-002-20250911    clang-22
arm                   randconfig-002-20250911    gcc-14.3.0
arm                   randconfig-003-20250911    clang-22
arm                   randconfig-004-20250911    clang-16
arm                   randconfig-004-20250911    clang-22
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250911    clang-22
arm64                 randconfig-001-20250911    gcc-13.4.0
arm64                 randconfig-002-20250911    clang-22
arm64                 randconfig-002-20250911    gcc-8.5.0
arm64                 randconfig-003-20250911    clang-22
arm64                 randconfig-003-20250911    gcc-8.5.0
arm64                 randconfig-004-20250911    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250911    clang-20
csky                  randconfig-001-20250911    gcc-15.1.0
csky                  randconfig-002-20250911    clang-20
csky                  randconfig-002-20250911    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250911    clang-20
hexagon               randconfig-002-20250911    clang-20
hexagon               randconfig-002-20250911    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250910    gcc-14
i386        buildonly-randconfig-001-20250911    clang-20
i386        buildonly-randconfig-002-20250910    gcc-13
i386        buildonly-randconfig-002-20250911    clang-20
i386        buildonly-randconfig-003-20250910    clang-20
i386        buildonly-randconfig-003-20250911    clang-20
i386        buildonly-randconfig-004-20250910    clang-20
i386        buildonly-randconfig-004-20250911    clang-20
i386        buildonly-randconfig-005-20250910    gcc-14
i386        buildonly-randconfig-005-20250911    clang-20
i386        buildonly-randconfig-006-20250910    clang-20
i386        buildonly-randconfig-006-20250911    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250911    clang-20
i386                  randconfig-002-20250911    clang-20
i386                  randconfig-003-20250911    clang-20
i386                  randconfig-004-20250911    clang-20
i386                  randconfig-005-20250911    clang-20
i386                  randconfig-006-20250911    clang-20
i386                  randconfig-007-20250911    clang-20
i386                  randconfig-011-20250911    clang-20
i386                  randconfig-012-20250911    clang-20
i386                  randconfig-013-20250911    clang-20
i386                  randconfig-014-20250911    clang-20
i386                  randconfig-015-20250911    clang-20
i386                  randconfig-016-20250911    clang-20
i386                  randconfig-017-20250911    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250911    clang-20
loongarch             randconfig-001-20250911    gcc-15.1.0
loongarch             randconfig-002-20250911    clang-20
loongarch             randconfig-002-20250911    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                           ip27_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250911    clang-20
nios2                 randconfig-001-20250911    gcc-11.5.0
nios2                 randconfig-002-20250911    clang-20
nios2                 randconfig-002-20250911    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250911    clang-20
parisc                randconfig-001-20250911    gcc-8.5.0
parisc                randconfig-002-20250911    clang-20
parisc                randconfig-002-20250911    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc                     rainier_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250911    clang-20
powerpc               randconfig-001-20250911    gcc-8.5.0
powerpc               randconfig-002-20250911    clang-20
powerpc               randconfig-002-20250911    gcc-15.1.0
powerpc               randconfig-003-20250911    clang-20
powerpc               randconfig-003-20250911    gcc-8.5.0
powerpc64             randconfig-001-20250911    clang-20
powerpc64             randconfig-001-20250911    clang-22
powerpc64             randconfig-002-20250911    clang-20
powerpc64             randconfig-002-20250911    gcc-11.5.0
powerpc64             randconfig-003-20250911    clang-20
powerpc64             randconfig-003-20250911    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250910    clang-22
riscv                 randconfig-001-20250911    gcc-15.1.0
riscv                 randconfig-002-20250910    clang-22
riscv                 randconfig-002-20250911    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250910    clang-22
s390                  randconfig-001-20250911    gcc-15.1.0
s390                  randconfig-002-20250910    clang-22
s390                  randconfig-002-20250911    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250910    gcc-15.1.0
sh                    randconfig-001-20250911    gcc-15.1.0
sh                    randconfig-002-20250910    gcc-12.5.0
sh                    randconfig-002-20250911    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250910    gcc-8.5.0
sparc                 randconfig-001-20250911    gcc-15.1.0
sparc                 randconfig-002-20250910    gcc-8.5.0
sparc                 randconfig-002-20250911    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250910    gcc-8.5.0
sparc64               randconfig-001-20250911    gcc-15.1.0
sparc64               randconfig-002-20250910    gcc-12.5.0
sparc64               randconfig-002-20250911    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250910    clang-22
um                    randconfig-001-20250911    gcc-15.1.0
um                    randconfig-002-20250910    clang-22
um                    randconfig-002-20250911    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250910    gcc-14
x86_64      buildonly-randconfig-001-20250911    clang-20
x86_64      buildonly-randconfig-002-20250910    clang-20
x86_64      buildonly-randconfig-002-20250911    clang-20
x86_64      buildonly-randconfig-003-20250910    gcc-14
x86_64      buildonly-randconfig-003-20250911    clang-20
x86_64      buildonly-randconfig-004-20250910    clang-20
x86_64      buildonly-randconfig-004-20250911    clang-20
x86_64      buildonly-randconfig-005-20250910    gcc-14
x86_64      buildonly-randconfig-005-20250911    clang-20
x86_64      buildonly-randconfig-006-20250910    clang-20
x86_64      buildonly-randconfig-006-20250911    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250911    clang-20
x86_64                randconfig-002-20250911    clang-20
x86_64                randconfig-003-20250911    clang-20
x86_64                randconfig-004-20250911    clang-20
x86_64                randconfig-005-20250911    clang-20
x86_64                randconfig-006-20250911    clang-20
x86_64                randconfig-007-20250911    clang-20
x86_64                randconfig-008-20250911    clang-20
x86_64                randconfig-071-20250911    clang-20
x86_64                randconfig-072-20250911    clang-20
x86_64                randconfig-073-20250911    clang-20
x86_64                randconfig-074-20250911    clang-20
x86_64                randconfig-075-20250911    clang-20
x86_64                randconfig-076-20250911    clang-20
x86_64                randconfig-077-20250911    clang-20
x86_64                randconfig-078-20250911    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250910    gcc-8.5.0
xtensa                randconfig-001-20250911    gcc-15.1.0
xtensa                randconfig-002-20250910    gcc-10.5.0
xtensa                randconfig-002-20250911    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
