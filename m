Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3546EC3DA45
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jul 2024 22:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2A110E0D5;
	Sat, 13 Jul 2024 22:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJ3eyPK+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B194110E0D5
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jul 2024 22:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720908231; x=1752444231;
 h=date:from:to:cc:subject:message-id;
 bh=/GLa/WP3f8Y/Ny4GM5UJndywMwsO/wcyAMl4u1EtlFc=;
 b=EJ3eyPK+j6C9MLblXxtDAniLsFb460W3HmrxN7ood43mUvQzx9gZ85xO
 j47Lgcd+fV7mDqEpqhal8hHHa2SGz5PVJBRf/Q8ra5YED8SrABLhoQoVD
 0btPnZB+XvGmahhw44rg3VYxgvLPvKLXyj0ehhPv9rS2VC80eBd0P8qyn
 6KM/wrtmwXYiSHZJ9UE8eOZ1ZSUh0i67cUZ6N4u5EKT/1kdDPzF96hKF9
 08eJ3IYn5hRCfFfc9OhIES+6q4Lc8wfcpG+XbpmnEB71gZOubmMw4UIv0
 bkCn9bM2CCZLWb9RLn7+UH9tc6xxePNOmaX7zMpmzUaP4NZg0BMAUNWC3 A==;
X-CSE-ConnectionGUID: 1Wp5/a5XSmWaGC9r9GaYbA==
X-CSE-MsgGUID: rNqd4QSSTkCz3VnDtMXkWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="12537294"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; d="scan'208";a="12537294"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2024 15:03:50 -0700
X-CSE-ConnectionGUID: pkvHdDnJSEeBujVQgC23Tg==
X-CSE-MsgGUID: N7Re/BeBTPub147tTfcqcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; d="scan'208";a="48963519"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 13 Jul 2024 15:03:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sSkqI-000cnA-1b;
 Sat, 13 Jul 2024 22:03:46 +0000
Date: Sun, 14 Jul 2024 06:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 e89b6efbf0c5726d8c1654e8e2fb02b10e31df70
Message-ID: <202407140611.n1Era8qd-lkp@intel.com>
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
branch HEAD: e89b6efbf0c5726d8c1654e8e2fb02b10e31df70  drm/xe/huc: Define BMG HuC

elapsed time: 1422m

configs tested: 139
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                   randconfig-001-20240713   gcc-13.2.0
arc                   randconfig-002-20240713   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                     davinci_all_defconfig   clang-19
arm                       imx_v4_v5_defconfig   clang-16
arm                      integrator_defconfig   clang-19
arm                          pxa168_defconfig   clang-19
arm                             pxa_defconfig   gcc-14.1.0
arm                   randconfig-001-20240713   gcc-14.1.0
arm                   randconfig-002-20240713   gcc-14.1.0
arm                   randconfig-003-20240713   clang-19
arm                   randconfig-004-20240713   clang-19
arm                             rpc_defconfig   clang-19
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240713   gcc-14.1.0
arm64                 randconfig-002-20240713   gcc-14.1.0
arm64                 randconfig-003-20240713   clang-19
arm64                 randconfig-004-20240713   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240713   gcc-14.1.0
csky                  randconfig-002-20240713   gcc-14.1.0
hexagon                          alldefconfig   clang-15
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240713   clang-19
hexagon               randconfig-002-20240713   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240713   clang-18
i386         buildonly-randconfig-002-20240713   clang-18
i386         buildonly-randconfig-003-20240713   gcc-8
i386         buildonly-randconfig-004-20240713   clang-18
i386         buildonly-randconfig-005-20240713   gcc-13
i386         buildonly-randconfig-006-20240713   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240713   gcc-10
i386                  randconfig-002-20240713   gcc-13
i386                  randconfig-003-20240713   gcc-13
i386                  randconfig-004-20240713   clang-18
i386                  randconfig-005-20240713   gcc-10
i386                  randconfig-006-20240713   gcc-12
i386                  randconfig-011-20240713   clang-18
i386                  randconfig-012-20240713   gcc-7
i386                  randconfig-013-20240713   gcc-13
i386                  randconfig-014-20240713   gcc-13
i386                  randconfig-015-20240713   gcc-11
i386                  randconfig-016-20240713   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240713   gcc-14.1.0
loongarch             randconfig-002-20240713   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                        omega2p_defconfig   clang-19
nios2                         3c120_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240713   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                    gamecube_defconfig   clang-19
powerpc                    ge_imp3a_defconfig   gcc-14.1.0
powerpc                 mpc8313_rdb_defconfig   gcc-14.1.0
powerpc                 mpc834x_itx_defconfig   clang-19
powerpc                        warp_defconfig   gcc-14.1.0
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                          sdk7780_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240713   clang-18
x86_64       buildonly-randconfig-002-20240713   clang-18
x86_64       buildonly-randconfig-003-20240713   gcc-13
x86_64       buildonly-randconfig-004-20240713   clang-18
x86_64       buildonly-randconfig-005-20240713   gcc-8
x86_64       buildonly-randconfig-006-20240713   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240713   clang-18
x86_64                randconfig-002-20240713   clang-18
x86_64                randconfig-003-20240713   clang-18
x86_64                randconfig-004-20240713   gcc-13
x86_64                randconfig-005-20240713   clang-18
x86_64                randconfig-006-20240713   clang-18
x86_64                randconfig-011-20240713   clang-18
x86_64                randconfig-012-20240713   clang-18
x86_64                randconfig-013-20240713   gcc-13
x86_64                randconfig-014-20240713   clang-18
x86_64                randconfig-015-20240713   gcc-13
x86_64                randconfig-016-20240713   gcc-13
x86_64                randconfig-071-20240713   gcc-8
x86_64                randconfig-072-20240713   gcc-8
x86_64                randconfig-073-20240713   clang-18
x86_64                randconfig-074-20240713   clang-18
x86_64                randconfig-075-20240713   gcc-13
x86_64                randconfig-076-20240713   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
