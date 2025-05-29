Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515C1C5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 15:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE5610E72E;
	Thu, 29 May 2025 15:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CctxWDcx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B410A10E72E
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748530885; x=1780066885;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Gn7AOISeKeTboW/tbw8Ji55y3xerOOKS/7McYor2Vro=;
 b=CctxWDcx4i29qpFEZqUJaJb7ahkcEHBFXu5ZpisJWXLhmWlI+I870u10
 2lnJPpMhwulLE2JrKqprqe1hM9mbvkCcHde6XqfzkHqOsA9PqgpLkd04o
 1m541d1FJxQ+E1pK8QEHbBTj420XiUBx3zIGXkHdevGKilP3xynS9omWI
 Swwv2fPVSyowPbN8cO2cPu9ZmjFDJpQtKPnCZdlV5k/+eq4ZRK0PBxubf
 fFeWdiVb9HUewN/HXag98ynADHW+/pJ3LhmvgC9g020kHFwL7toNHgWSY
 CjDvcNui4NGXUAFvPFyGrRAsEFBm3sasUFHNrVs0EBs34lHpExXcP1A/w Q==;
X-CSE-ConnectionGUID: fj5HMviOTU66MwUKnvAx/A==
X-CSE-MsgGUID: 3fnSfMXkRnCefoIW+AIo8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68020241"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="68020241"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 08:01:25 -0700
X-CSE-ConnectionGUID: /OpoRZhsRjGrohbwWs/amQ==
X-CSE-MsgGUID: //GbqX9LRC+og4ssglR6kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148742076"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 29 May 2025 08:01:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uKekz-000WnT-0A;
 Thu, 29 May 2025 15:01:21 +0000
Date: Thu, 29 May 2025 23:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 40493d97b329f8185c0f04dc0ef2b9ffc58e7f3b
Message-ID: <202505292359.VZ9td9kN-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: 40493d97b329f8185c0f04dc0ef2b9ffc58e7f3b  drm/xe: Add missing documentation of rpa_freq

elapsed time: 1339m

configs tested: 130
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.3.0
alpha                            allyesconfig    gcc-14.3.0
arc                              allmodconfig    gcc-14.3.0
arc                               allnoconfig    gcc-14.3.0
arc                              allyesconfig    gcc-14.3.0
arc                   randconfig-001-20250529    gcc-10.5.0
arc                   randconfig-002-20250529    gcc-8.5.0
arm                              allmodconfig    gcc-14.3.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.3.0
arm                   randconfig-001-20250529    clang-21
arm                   randconfig-002-20250529    gcc-8.5.0
arm                   randconfig-003-20250529    clang-21
arm                   randconfig-004-20250529    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.3.0
arm64                 randconfig-001-20250529    gcc-6.5.0
arm64                 randconfig-002-20250529    clang-21
arm64                 randconfig-003-20250529    gcc-8.5.0
arm64                 randconfig-004-20250529    gcc-8.5.0
csky                              allnoconfig    gcc-14.3.0
csky                  randconfig-001-20250529    gcc-15.1.0
csky                  randconfig-002-20250529    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250529    clang-21
hexagon               randconfig-002-20250529    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250529    gcc-12
i386        buildonly-randconfig-002-20250529    gcc-12
i386        buildonly-randconfig-003-20250529    gcc-12
i386        buildonly-randconfig-004-20250529    gcc-11
i386        buildonly-randconfig-005-20250529    clang-20
i386        buildonly-randconfig-006-20250529    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.3.0
loongarch                         allnoconfig    gcc-14.3.0
loongarch             randconfig-001-20250529    gcc-15.1.0
loongarch             randconfig-002-20250529    gcc-12.4.0
m68k                             allmodconfig    gcc-14.3.0
m68k                              allnoconfig    gcc-14.3.0
m68k                             allyesconfig    gcc-14.3.0
microblaze                       allmodconfig    gcc-14.3.0
microblaze                        allnoconfig    gcc-14.3.0
microblaze                       allyesconfig    gcc-14.3.0
mips                              allnoconfig    gcc-14.3.0
mips                          eyeq6_defconfig    clang-21
mips                         rt305x_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250529    gcc-12.4.0
nios2                 randconfig-002-20250529    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.3.0
openrisc                         allyesconfig    gcc-14.3.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-14.3.0
parisc                            allnoconfig    gcc-14.3.0
parisc                           allyesconfig    gcc-14.3.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250529    gcc-9.3.0
parisc                randconfig-002-20250529    gcc-13.3.0
parisc64                         alldefconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-14.3.0
powerpc                           allnoconfig    gcc-14.3.0
powerpc                          allyesconfig    clang-21
powerpc                  iss476-smp_defconfig    gcc-14.3.0
powerpc                 mpc836x_rdk_defconfig    clang-21
powerpc                      pasemi_defconfig    clang-21
powerpc               randconfig-001-20250529    clang-19
powerpc               randconfig-002-20250529    clang-21
powerpc               randconfig-003-20250529    clang-21
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250529    gcc-6.5.0
powerpc64             randconfig-002-20250529    clang-21
powerpc64             randconfig-003-20250529    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.3.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250529    clang-21
riscv                 randconfig-002-20250529    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.3.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250529    gcc-6.5.0
s390                  randconfig-002-20250529    gcc-9.3.0
sh                               allmodconfig    gcc-14.3.0
sh                                allnoconfig    gcc-14.3.0
sh                               allyesconfig    gcc-14.3.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-14.3.0
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250529    gcc-15.1.0
sh                    randconfig-002-20250529    gcc-12.4.0
sh                           se7750_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sh                            shmin_defconfig    gcc-14.3.0
sparc                            allmodconfig    gcc-14.3.0
sparc                             allnoconfig    gcc-14.3.0
sparc                 randconfig-001-20250529    gcc-11.5.0
sparc                 randconfig-002-20250529    gcc-11.5.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250529    gcc-11.5.0
sparc64               randconfig-002-20250529    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250529    clang-21
um                    randconfig-002-20250529    gcc-11
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250529    gcc-12
x86_64      buildonly-randconfig-002-20250529    clang-20
x86_64      buildonly-randconfig-003-20250529    gcc-12
x86_64      buildonly-randconfig-004-20250529    clang-20
x86_64      buildonly-randconfig-005-20250529    gcc-12
x86_64      buildonly-randconfig-006-20250529    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.3.0
xtensa                          iss_defconfig    gcc-14.3.0
xtensa                randconfig-001-20250529    gcc-7.5.0
xtensa                randconfig-002-20250529    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
