Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312BDCCA471
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 06:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47F410E1F4;
	Thu,  9 Oct 2025 06:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEUroIss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAB610E1F4
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 06:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759989894; x=1791525894;
 h=date:from:to:cc:subject:message-id;
 bh=/xanthn/cuh8CsDI33auMb4Zm1NCSA3ZhgdAeBv5ELw=;
 b=eEUroIssfdhbMEn5fzMI0EkuQkMzEVVHEKZaEdwBh9OXqhBPCJxMbCKf
 FYklJzacGlgv0b86JckaMHq1sYtcmtY1UV3tRcklW3JbGeH1COnU8uwmW
 KxtYUpNyXb4+UU23kfa493CCwiGFCXAiZQ/CrfL9pcygdk3aNaRbg9UTx
 TWWdSWqVwd4ktNvV2K9PD2Qcjsbm9aGT3WQgPu9bWrC6rZE58Ncxar2w2
 kPN7CTuV3QoHnoT6ZcVEEwE/W78SSazKG+6hytSQvAXCjb/5BN3YyGPnb
 FRpaAGWp91u/PhtHYMu5xEhTBA6fqEIeZO/NTJGhqd00Rt1mKQEV97tHX Q==;
X-CSE-ConnectionGUID: IOx4UpfoT12twfNFkxBNRg==
X-CSE-MsgGUID: fUSUeLJSQoOS9fepuHQ1Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61898996"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="61898996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 23:04:53 -0700
X-CSE-ConnectionGUID: /GCgQ4S/QROlE3dhHx7DmQ==
X-CSE-MsgGUID: o37SoEtIT1Gdcfv6pJ++ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="180568716"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 08 Oct 2025 23:04:51 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v6jlh-00004a-0o;
 Thu, 09 Oct 2025 06:04:49 +0000
Date: Thu, 09 Oct 2025 14:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 bdc2fb17ae9952bbce28d60ebab2520ed937363d
Message-ID: <202510091411.4OJVVQaX-lkp@intel.com>
User-Agent: s-nail v14.9.25
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
branch HEAD: bdc2fb17ae9952bbce28d60ebab2520ed937363d  Revert "drm/xe/vf: Fixup CTB send buffer messages after migration"

elapsed time: 7235m

configs tested: 122
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251004    gcc-8.5.0
arc                   randconfig-002-20251004    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         at91_dt_defconfig    clang-22
arm                   randconfig-001-20251004    gcc-8.5.0
arm                   randconfig-002-20251004    gcc-15.1.0
arm                   randconfig-003-20251004    gcc-12.5.0
arm                   randconfig-004-20251004    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251004    clang-20
arm64                 randconfig-002-20251004    gcc-8.5.0
arm64                 randconfig-003-20251004    clang-22
arm64                 randconfig-004-20251004    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251004    gcc-15.1.0
csky                  randconfig-002-20251004    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251004    clang-22
hexagon               randconfig-002-20251004    clang-20
i386                             alldefconfig    gcc-14
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251004    gcc-13
i386        buildonly-randconfig-002-20251004    clang-20
i386        buildonly-randconfig-003-20251004    clang-20
i386        buildonly-randconfig-004-20251004    clang-20
i386        buildonly-randconfig-005-20251004    clang-20
i386        buildonly-randconfig-006-20251004    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251004    gcc-15.1.0
loongarch             randconfig-002-20251004    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-18
mips                        maltaup_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251004    gcc-10.5.0
nios2                 randconfig-002-20251004    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251004    gcc-8.5.0
parisc                randconfig-002-20251004    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251004    clang-22
powerpc               randconfig-002-20251004    gcc-8.5.0
powerpc               randconfig-003-20251004    clang-22
powerpc64             randconfig-001-20251004    gcc-14.3.0
powerpc64             randconfig-002-20251004    clang-22
powerpc64             randconfig-003-20251004    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251004    clang-22
riscv                 randconfig-002-20251004    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251004    gcc-8.5.0
s390                  randconfig-002-20251004    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20251004    gcc-15.1.0
sh                    randconfig-002-20251004    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251004    gcc-8.5.0
sparc                 randconfig-002-20251004    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251004    gcc-14.3.0
sparc64               randconfig-002-20251004    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251004    clang-18
um                    randconfig-002-20251004    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251004    gcc-14
x86_64      buildonly-randconfig-002-20251004    clang-20
x86_64      buildonly-randconfig-003-20251004    clang-20
x86_64      buildonly-randconfig-004-20251004    clang-20
x86_64      buildonly-randconfig-005-20251004    gcc-14
x86_64      buildonly-randconfig-006-20251004    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251004    gcc-13.4.0
xtensa                randconfig-002-20251004    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
