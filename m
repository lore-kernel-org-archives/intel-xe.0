Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4924C02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 04:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F2510E1DF;
	Tue, 18 Feb 2025 04:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFNl6pwR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EB010E1DF
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 04:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739851673; x=1771387673;
 h=date:from:to:cc:subject:message-id;
 bh=JP7RmJFA3BeucoyvKZEViVq1t/OgDSrbvAtbWxfD3mg=;
 b=EFNl6pwRh928UCt1f6R5ky4bvELyHnfSQLQJkKzHNHmoZIeQnC1iCDxA
 aQby+vkWBXUSuc/MFrzMUDJnuH8CY+4l0yMciQRo/TxYZGA35TfUo2ay1
 r4MooYedeJd+tpZNSg0rA1t7dD+lAjqNlWmjrY8OoaTyJbvgkyC1FRBbf
 66eL77NKetDjcwXdeJ7KmoQu7puhnJZjQIQPxDoNdRBZooi3hTnO534e3
 aqtS6ho6wv/RsP1HkojSyBj/FUp7ZbA5J+PVT4l3w24YDMPRCi8WKHBZX
 F8Lbt1aBjqjYepTUhzjSFxcEwyIg3c9XG2hTa8aqonUtp6kAzTXNXZ3yB w==;
X-CSE-ConnectionGUID: k/cnQIrVQTyhn+fPW8nxgQ==
X-CSE-MsgGUID: ZUORYaFFSw6RQZHnLFlDBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="50751011"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; d="scan'208";a="50751011"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 20:07:53 -0800
X-CSE-ConnectionGUID: HmZXbhd8S3m7W/5uNpvRcQ==
X-CSE-MsgGUID: Jhkd4O69TxySkt2UHKzSoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; d="scan'208";a="114023547"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 17 Feb 2025 20:07:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tkEtb-00009L-2u;
 Tue, 18 Feb 2025 04:07:45 +0000
Date: Tue, 18 Feb 2025 12:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 339adeb10472a34bb74624958b031e490531d37c
Message-ID: <202502181232.NSlmBmm5-lkp@intel.com>
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
branch HEAD: 339adeb10472a34bb74624958b031e490531d37c  drm/xe/display: Clarify XE_IOCTL_DBG message

elapsed time: 1150m

configs tested: 120
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250217    gcc-13.2.0
arc                   randconfig-002-20250217    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-17
arm                           imxrt_defconfig    clang-19
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250217    gcc-14.2.0
arm                   randconfig-002-20250217    gcc-14.2.0
arm                   randconfig-003-20250217    gcc-14.2.0
arm                   randconfig-004-20250217    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250217    gcc-14.2.0
arm64                 randconfig-002-20250217    clang-21
arm64                 randconfig-003-20250217    clang-15
arm64                 randconfig-004-20250217    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250217    gcc-14.2.0
csky                  randconfig-002-20250217    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250217    clang-21
hexagon               randconfig-002-20250217    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250217    clang-19
i386        buildonly-randconfig-002-20250217    gcc-12
i386        buildonly-randconfig-003-20250217    clang-19
i386        buildonly-randconfig-004-20250217    gcc-12
i386        buildonly-randconfig-005-20250217    gcc-12
i386        buildonly-randconfig-006-20250217    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250217    gcc-14.2.0
loongarch             randconfig-002-20250217    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       rbtx49xx_defconfig    gcc-14.2.0
mips                         rt305x_defconfig    clang-19
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250217    gcc-14.2.0
nios2                 randconfig-002-20250217    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250217    gcc-14.2.0
parisc                randconfig-002-20250217    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250217    clang-17
powerpc               randconfig-002-20250217    clang-15
powerpc               randconfig-003-20250217    gcc-14.2.0
powerpc64             randconfig-001-20250217    clang-19
powerpc64             randconfig-002-20250217    clang-21
powerpc64             randconfig-003-20250217    clang-15
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250217    gcc-14.2.0
riscv                 randconfig-002-20250217    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250217    gcc-14.2.0
s390                  randconfig-002-20250217    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250217    gcc-14.2.0
sh                    randconfig-002-20250217    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250217    gcc-14.2.0
sparc                 randconfig-002-20250217    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250217    gcc-14.2.0
sparc64               randconfig-002-20250217    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250217    clang-19
um                    randconfig-002-20250217    clang-17
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250217    gcc-12
x86_64      buildonly-randconfig-002-20250217    clang-19
x86_64      buildonly-randconfig-003-20250217    clang-19
x86_64      buildonly-randconfig-004-20250217    gcc-12
x86_64      buildonly-randconfig-005-20250217    gcc-12
x86_64      buildonly-randconfig-006-20250217    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250217    gcc-14.2.0
xtensa                randconfig-002-20250217    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
