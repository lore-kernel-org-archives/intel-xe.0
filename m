Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A45C7EE30
	for <intel-xe@archiver.kernel.org>; Sun, 29 Jun 2025 06:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A27610E009;
	Sun, 29 Jun 2025 06:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LVRZCuzb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C9F10E009
 for <intel-xe@lists.freedesktop.org>; Sun, 29 Jun 2025 06:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751180343; x=1782716343;
 h=date:from:to:cc:subject:message-id;
 bh=btMnAq6g4NPTBhZ74iQBoRCQJNtjUQkIFRhgjzw627k=;
 b=LVRZCuzbi6eosi7k25JrK9VsMmuy9STnFUgMoH+Iwxjdg0y/ZW0HCOd8
 /ag3eKLqPBIgKRGFO3xcvxyK/HCAEFSFtl8Qq9a0KMkQqRJtz/WEqsOVG
 fm40VnHuSNOtc61Xtu/tfp2de4CgY/YEvgeNzjuCY9wL1fxV4+L+7TKVe
 sK9KK4vz+bWJeZbMuty2r8boBNk7jjRBnCx4ZVjcT8X1TGFqdiJUntzyQ
 nym3o0W1tuGZ2f6V9THfh8arW8EmflyBmtHS2+ckIbh4VTuTe2VM62ZCu
 wzkZrSAILt/unYsWYpjUjEKvOIg26puqkGybm0V2YEEI38Cok3NqwWFNV Q==;
X-CSE-ConnectionGUID: 8JTPIUOPTPSUHd30BTdgDg==
X-CSE-MsgGUID: nyQCACsOQGqawwqjRPf+ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53522773"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; d="scan'208";a="53522773"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2025 23:58:56 -0700
X-CSE-ConnectionGUID: f1sRhlCqROav8a8dzI7s1A==
X-CSE-MsgGUID: byQg0CLxTM+Gp8Dv1GzaFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; d="scan'208";a="153878647"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 28 Jun 2025 23:58:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uVm05-000Xja-0g;
 Sun, 29 Jun 2025 06:58:53 +0000
Date: Sun, 29 Jun 2025 14:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 a559434880b320b83733d739733250815aecf1b0
Message-ID: <202506291405.y5IelpHx-lkp@intel.com>
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
branch HEAD: a559434880b320b83733d739733250815aecf1b0  drm/xe: Allow dropping kunit dependency as built-in

elapsed time: 927m

configs tested: 118
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250629    gcc-8.5.0
arc                   randconfig-002-20250629    gcc-13.3.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250629    clang-21
arm                   randconfig-002-20250629    gcc-12.4.0
arm                   randconfig-003-20250629    gcc-8.5.0
arm                   randconfig-004-20250629    gcc-12.4.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250629    gcc-13.3.0
arm64                 randconfig-002-20250629    clang-19
arm64                 randconfig-003-20250629    gcc-14.3.0
arm64                 randconfig-004-20250629    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250629    gcc-15.1.0
csky                  randconfig-002-20250629    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250629    clang-21
hexagon               randconfig-002-20250629    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250629    clang-20
i386        buildonly-randconfig-002-20250629    clang-20
i386        buildonly-randconfig-003-20250629    clang-20
i386        buildonly-randconfig-004-20250629    gcc-12
i386        buildonly-randconfig-005-20250629    clang-20
i386        buildonly-randconfig-006-20250629    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                 loongson3_defconfig    gcc-15.1.0
loongarch             randconfig-001-20250629    gcc-15.1.0
loongarch             randconfig-002-20250629    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250629    gcc-9.3.0
nios2                 randconfig-002-20250629    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250629    gcc-10.5.0
parisc                randconfig-002-20250629    gcc-14.3.0
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc                      ppc6xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250629    clang-21
powerpc               randconfig-002-20250629    gcc-13.3.0
powerpc               randconfig-003-20250629    gcc-11.5.0
powerpc                     redwood_defconfig    clang-21
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250629    clang-21
powerpc64             randconfig-002-20250629    gcc-8.5.0
powerpc64             randconfig-003-20250629    clang-20
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250629    clang-17
riscv                 randconfig-002-20250629    gcc-13.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250629    clang-21
s390                  randconfig-002-20250629    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250629    gcc-15.1.0
sh                    randconfig-002-20250629    gcc-15.1.0
sh                          rsk7269_defconfig    gcc-15.1.0
sh                        sh7763rdp_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250629    gcc-10.3.0
sparc                 randconfig-002-20250629    gcc-8.5.0
sparc64               randconfig-001-20250629    gcc-8.5.0
sparc64               randconfig-002-20250629    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250629    gcc-11
um                    randconfig-002-20250629    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250629    gcc-12
x86_64      buildonly-randconfig-002-20250629    gcc-12
x86_64      buildonly-randconfig-003-20250629    clang-20
x86_64      buildonly-randconfig-004-20250629    gcc-12
x86_64      buildonly-randconfig-005-20250629    gcc-12
x86_64      buildonly-randconfig-006-20250629    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250629    gcc-8.5.0
xtensa                randconfig-002-20250629    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
