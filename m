Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DF7CF9C69
	for <intel-xe@archiver.kernel.org>; Sat, 21 Sep 2024 16:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AB810E0B4;
	Sat, 21 Sep 2024 16:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMWPQPf2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D8810E0B4
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Sep 2024 16:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726936919; x=1758472919;
 h=date:from:to:cc:subject:message-id;
 bh=GcpPOvE6XxZwCIhlAzXdz50Xqm4bytV6kfqLOwxy+hg=;
 b=VMWPQPf2iu+Xfr6D7mYdCrcwszFkFHFVyMPL7JZgZVKdYf1nxuwp+Jfv
 uRTvF0Xww7zdIe/VB/GKrAhadDzj00s0DHXUJbPmo84AMIJQ57TaekMGV
 46syMVzBnNkEAII6M6PYzZQJDP08aXtJ5wJnQha2z2znVIJqQh0FA0exc
 ZwKba7lLumzKe10yIGzDWk/5RoOBSRhOBQP2d6K5Q7WwTP9VIGmBwFueC
 YrpCfVzAfhcOZk5Gr2SecwNIjD6ZG7ST8x3pwgwXyp6s+JRo8JeUy8G/j
 mY2R42+gBEvo3XAdJKnt0DvCzgLN6l8dbl6aYwNXvJNYgjk8E7o3eTZ9b A==;
X-CSE-ConnectionGUID: kfMe7u3uQdCMN17AWJhAQg==
X-CSE-MsgGUID: C/xEqE8WRDmL5ZCV2dx+gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37301719"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; d="scan'208";a="37301719"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2024 09:41:58 -0700
X-CSE-ConnectionGUID: PLbzRGABQg6088Qxn9NjUA==
X-CSE-MsgGUID: g5Un8hJqQnaksLmQDjmVAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; d="scan'208";a="93955441"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2024 09:41:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ss3BC-000Fbb-1m;
 Sat, 21 Sep 2024 16:41:54 +0000
Date: Sun, 22 Sep 2024 00:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 ec78e665e25834158bb45dd6c62452677cd5ceaf
Message-ID: <202409220004.jRByMsm0-lkp@intel.com>
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
branch HEAD: ec78e665e25834158bb45dd6c62452677cd5ceaf  drm/xe/guc: Pre-release GuC firmware v70.29.2 for PVC

elapsed time: 3029m

configs tested: 74
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                         haps_hs_defconfig    gcc-14.1.0
arm                              alldefconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                        clps711x_defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    gcc-14.1.0
arm                           omap1_defconfig    gcc-14.1.0
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                           allnoconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240921    clang-18
i386        buildonly-randconfig-002-20240921    clang-18
i386        buildonly-randconfig-003-20240921    clang-18
i386        buildonly-randconfig-004-20240921    gcc-12
i386        buildonly-randconfig-005-20240921    clang-18
i386        buildonly-randconfig-006-20240921    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240921    clang-18
i386                  randconfig-002-20240921    clang-18
i386                  randconfig-003-20240921    clang-18
i386                  randconfig-004-20240921    clang-18
i386                  randconfig-005-20240921    clang-18
i386                  randconfig-006-20240921    gcc-12
i386                  randconfig-011-20240921    clang-18
i386                  randconfig-012-20240921    clang-18
i386                  randconfig-013-20240921    gcc-11
i386                  randconfig-014-20240921    gcc-12
i386                  randconfig-015-20240921    clang-18
i386                  randconfig-016-20240921    clang-18
loongarch                         allnoconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                  cavium_octeon_defconfig    gcc-14.1.0
mips                      fuloong2e_defconfig    gcc-14.1.0
mips                           ip28_defconfig    gcc-14.1.0
mips                         rt305x_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                     asp8347_defconfig    gcc-14.1.0
powerpc                          g5_defconfig    gcc-14.1.0
powerpc                     stx_gp3_defconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         apsh4a3a_defconfig    gcc-14.1.0
sh                          rsk7264_defconfig    gcc-14.1.0
sh                     sh7710voipgw_defconfig    gcc-14.1.0
sh                   sh7770_generic_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
