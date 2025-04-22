Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD5BC369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 18:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5910810E2CB;
	Tue, 22 Apr 2025 18:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEzsUQhA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8856F10E2CB
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 18:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745347260; x=1776883260;
 h=date:from:to:cc:subject:message-id;
 bh=sDcxwzoHuCDQPiKdCLHaDPMg27jvssfvO+JqH2dPr2g=;
 b=LEzsUQhA/cr/Vz4ViQwgU0CVKojk9UlTDrKhYxcNPxXsYps9BLQvvOeV
 5/ZoFXKBrftnHRSsP8qOB5xTL76fWRT3sGP42H0PjBHdRiX1WWsjz9nha
 HWdg1T7NusB1ZTOTGJpv+IXP2FGOnbwKlaKRd/+4GT9TUGE37kkjmSyso
 3vhaxhusjfPFbbZPha3c1LbIMaOpIFqNWQWW3haUf8m4VsPgdO8QIxQwp
 Yo/7wPrD0Gaa10jefzBbziJ/jfuKQvSHrttazTIqXblEyTTBf/FEAPQf1
 BtTXrxa6NONdsVVDmG5a7IJiDWQsjiCz0ce9cz+lKfzpBM9p/OXJymxrc w==;
X-CSE-ConnectionGUID: xdOBECgQSUSREQ+4NLskxA==
X-CSE-MsgGUID: qPt5UwKsRGS9SKud02QNhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50723884"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="50723884"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 11:40:58 -0700
X-CSE-ConnectionGUID: nikNn9SRSpKw1SZre/BK7g==
X-CSE-MsgGUID: TKaVcOkVRRWSZY4XKeDImg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="163141880"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 22 Apr 2025 11:40:57 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u7IYA-0001FV-36;
 Tue, 22 Apr 2025 18:40:54 +0000
Date: Wed, 23 Apr 2025 02:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 993a9b1f119ff8e6d89e5e32f5a86a02c7d2cf57
Message-ID: <202504230239.31OLbGol-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: 993a9b1f119ff8e6d89e5e32f5a86a02c7d2cf57  drm/xe/pm: Re-enable D3Cold by default on BMG

elapsed time: 1457m

configs tested: 128
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                   randconfig-001-20250422    gcc-8.5.0
arc                   randconfig-002-20250422    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-21
arm                           h3600_defconfig    gcc-14.2.0
arm                   randconfig-001-20250422    gcc-8.5.0
arm                   randconfig-002-20250422    gcc-8.5.0
arm                   randconfig-003-20250422    gcc-7.5.0
arm                   randconfig-004-20250422    gcc-7.5.0
arm                          sp7021_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250422    gcc-6.5.0
arm64                 randconfig-002-20250422    clang-21
arm64                 randconfig-003-20250422    clang-18
arm64                 randconfig-004-20250422    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250422    gcc-10.5.0
csky                  randconfig-002-20250422    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250422    clang-21
hexagon               randconfig-002-20250422    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250422    clang-20
i386        buildonly-randconfig-002-20250422    clang-20
i386        buildonly-randconfig-003-20250422    gcc-12
i386        buildonly-randconfig-004-20250422    gcc-12
i386        buildonly-randconfig-005-20250422    clang-20
i386        buildonly-randconfig-006-20250422    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250422    gcc-14.2.0
loongarch             randconfig-002-20250422    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250422    gcc-10.5.0
nios2                 randconfig-002-20250422    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250422    gcc-7.5.0
parisc                randconfig-002-20250422    gcc-11.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     asp8347_defconfig    clang-21
powerpc               randconfig-001-20250422    clang-21
powerpc               randconfig-002-20250422    gcc-6.5.0
powerpc               randconfig-003-20250422    clang-16
powerpc64                        alldefconfig    clang-21
powerpc64             randconfig-001-20250422    clang-21
powerpc64             randconfig-002-20250422    gcc-6.5.0
powerpc64             randconfig-003-20250422    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250422    clang-21
riscv                 randconfig-002-20250422    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250422    gcc-7.5.0
s390                  randconfig-002-20250422    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                    randconfig-001-20250422    gcc-14.2.0
sh                    randconfig-002-20250422    gcc-6.5.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250422    gcc-10.3.0
sparc                 randconfig-002-20250422    gcc-6.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250422    gcc-7.5.0
sparc64               randconfig-002-20250422    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250422    gcc-12
um                    randconfig-002-20250422    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250422    gcc-12
x86_64      buildonly-randconfig-002-20250422    clang-20
x86_64      buildonly-randconfig-003-20250422    gcc-12
x86_64      buildonly-randconfig-004-20250422    gcc-12
x86_64      buildonly-randconfig-005-20250422    clang-20
x86_64      buildonly-randconfig-006-20250422    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250422    gcc-14.2.0
xtensa                randconfig-002-20250422    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
