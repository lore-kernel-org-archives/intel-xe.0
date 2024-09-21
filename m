Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53842CF9C5B
	for <intel-xe@archiver.kernel.org>; Sat, 21 Sep 2024 21:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAB910E326;
	Sat, 21 Sep 2024 21:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBo2CPNB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C20810E326
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Sep 2024 21:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726953308; x=1758489308;
 h=date:from:to:cc:subject:message-id;
 bh=LT8xZXv0TEuv/nh+MeC27/tHucLSX+REV2dcJjzooEY=;
 b=XBo2CPNB7BGwutIbpE7zTdQbZ7/4HjrRj0yf48n8+BgHTthMh2l89gqZ
 2lKiCEIRFZmUF3eRV6cV777lhmlTiwYdkLujNxJ8MyY4ORSvqrNrEC+em
 VXUcsiv6n7FqIJhQtZWacmy/qsEewkX58JBiqmyDMWpfpXNXXBEMHnoVW
 YSgY01uFM2fLXSLroKBnEPpuD8PkFsJr+2OWPgI1nU1KPCeePTkhOBCoT
 OslvDIQ4C3zUAMlQTHfQKpYP7xah2aE+BiwZDanpqh8PXfauPG8LSJOF/
 YkwIXA2tXt+6VXC69QV7/q+W8mNbVKKSGwGYOW665yyNZRcD2cUFcA5Oq A==;
X-CSE-ConnectionGUID: LyOFpaIgSt+yGXkxDfvZrQ==
X-CSE-MsgGUID: fh81sQXZTQSelbwdMnxQ1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37308575"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; d="scan'208";a="37308575"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2024 14:15:08 -0700
X-CSE-ConnectionGUID: 5ZimGBTQTmudeW4oL+B9wQ==
X-CSE-MsgGUID: 8T5HNEMuTZWUy7TXECST8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; d="scan'208";a="70538019"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 21 Sep 2024 14:15:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ss7RY-000Fo4-1h;
 Sat, 21 Sep 2024 21:15:04 +0000
Date: Sun, 22 Sep 2024 05:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 35667a0330612bb25a689e4d3a687d47cede1d7a
Message-ID: <202409220527.05OZpKJv-lkp@intel.com>
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
branch HEAD: 35667a0330612bb25a689e4d3a687d47cede1d7a  drm/xe/pciid: Add new PCI id for ARL

elapsed time: 1447m

configs tested: 103
configs skipped: 3

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
arc                         haps_hs_defconfig    gcc-14.1.0
arm                              alldefconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                        clps711x_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    gcc-14.1.0
arm                           omap1_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240921    clang-18
i386        buildonly-randconfig-002-20240921    clang-18
i386        buildonly-randconfig-003-20240921    clang-18
i386        buildonly-randconfig-004-20240921    clang-18
i386        buildonly-randconfig-005-20240921    clang-18
i386        buildonly-randconfig-006-20240921    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240921    clang-18
i386                  randconfig-002-20240921    clang-18
i386                  randconfig-003-20240921    clang-18
i386                  randconfig-004-20240921    clang-18
i386                  randconfig-005-20240921    clang-18
i386                  randconfig-006-20240921    clang-18
i386                  randconfig-011-20240921    clang-18
i386                  randconfig-012-20240921    clang-18
i386                  randconfig-013-20240921    clang-18
i386                  randconfig-014-20240921    clang-18
i386                  randconfig-015-20240921    clang-18
i386                  randconfig-016-20240921    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                  cavium_octeon_defconfig    gcc-14.1.0
mips                      fuloong2e_defconfig    gcc-14.1.0
mips                           ip28_defconfig    gcc-14.1.0
mips                         rt305x_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                     asp8347_defconfig    gcc-14.1.0
powerpc                          g5_defconfig    gcc-14.1.0
powerpc                     stx_gp3_defconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         apsh4a3a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          rsk7264_defconfig    gcc-14.1.0
sh                     sh7710voipgw_defconfig    gcc-14.1.0
sh                   sh7770_generic_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
