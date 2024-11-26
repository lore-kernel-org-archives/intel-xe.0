Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56975D66B8E
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 23:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC2A10E0CC;
	Tue, 26 Nov 2024 23:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGp6NQUp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC6210E0CC
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 23:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732663747; x=1764199747;
 h=date:from:to:cc:subject:message-id;
 bh=iki4bFOqKjZ/BnXgLJxY/M7JgO5NqxXwRLiM+gJLAN4=;
 b=ZGp6NQUpfOH+sk/0Kto4DVZB1oUq/3hvhY7pxGsgyPJAwifc/VH2Ezkl
 LJx36EwcWREEVJluuxyY/7DxWsSxrqPEJzbPIfqAZPsk9U08jqim5X555
 NCDg+mzRExJy1gSfUmhqhCN17uLLOkcJtyjdiUYtVYHGYzFEicRC0mjps
 MPDz2FB7uWdyIsJ+SCONm1XZRRMvc+TQw4iqcfeIDwSzf5r4E9CAqceNn
 +gHnIv1QhM7M0PKjoInLhEwt5KloBLHEJidUWjwt3wLkEeGm1dH+K3FtV
 j+i1qCNyP31fzPCwhkXIqO9HVCXQLomRo3Fo0Ln+jMTVFRClguqc0OcC7 A==;
X-CSE-ConnectionGUID: X697DvZhRiS8hTW3jhai0Q==
X-CSE-MsgGUID: 67B4UjIwRx+dtj3Mknk46Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="55349932"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="55349932"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 15:29:07 -0800
X-CSE-ConnectionGUID: nHulYnWzS9qqIvwKaTJnZA==
X-CSE-MsgGUID: UEdNhEKuTSabhV9MOMTsZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="96504305"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2024 15:29:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tG4zO-0007bH-2n;
 Tue, 26 Nov 2024 23:29:02 +0000
Date: Wed, 27 Nov 2024 07:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 f161809b362f027b6d72bd998e47f8f0bad60a2e
Message-ID: <202411270703.8bPSnsZu-lkp@intel.com>
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
branch HEAD: f161809b362f027b6d72bd998e47f8f0bad60a2e  drm/xe/guc_submit: fix race around suspend_pending

elapsed time: 768m

configs tested: 166
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241126    gcc-14.2.0
arc                   randconfig-002-20241126    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    gcc-13.2.0
arm                      integrator_defconfig    gcc-13.2.0
arm                       multi_v4t_defconfig    clang-14
arm                       multi_v4t_defconfig    gcc-13.2.0
arm                        mvebu_v5_defconfig    gcc-13.2.0
arm                   randconfig-001-20241126    gcc-14.2.0
arm                   randconfig-002-20241126    gcc-14.2.0
arm                   randconfig-003-20241126    gcc-14.2.0
arm                   randconfig-004-20241126    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    clang-14
arm64                 randconfig-001-20241126    gcc-14.2.0
arm64                 randconfig-002-20241126    gcc-14.2.0
arm64                 randconfig-003-20241126    gcc-14.2.0
arm64                 randconfig-004-20241126    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241126    gcc-14.2.0
csky                  randconfig-002-20241126    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241126    gcc-14.2.0
hexagon               randconfig-002-20241126    gcc-14.2.0
i386        buildonly-randconfig-001-20241126    gcc-12
i386        buildonly-randconfig-002-20241126    gcc-12
i386        buildonly-randconfig-003-20241126    gcc-12
i386        buildonly-randconfig-004-20241126    gcc-12
i386        buildonly-randconfig-005-20241126    gcc-12
i386        buildonly-randconfig-006-20241126    gcc-12
i386                  randconfig-001-20241126    gcc-12
i386                  randconfig-002-20241126    gcc-12
i386                  randconfig-003-20241126    gcc-12
i386                  randconfig-004-20241126    gcc-12
i386                  randconfig-005-20241126    gcc-12
i386                  randconfig-006-20241126    gcc-12
i386                  randconfig-011-20241126    gcc-12
i386                  randconfig-012-20241126    gcc-12
i386                  randconfig-013-20241126    gcc-12
i386                  randconfig-014-20241126    gcc-12
i386                  randconfig-015-20241126    gcc-12
i386                  randconfig-016-20241126    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241126    gcc-14.2.0
loongarch             randconfig-002-20241126    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-13.2.0
m68k                            q40_defconfig    gcc-13.2.0
m68k                        stmark2_defconfig    gcc-13.2.0
m68k                           virt_defconfig    clang-14
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-13.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-20
mips                          eyeq6_defconfig    gcc-13.2.0
mips                     loongson1b_defconfig    gcc-13.2.0
mips                      maltaaprp_defconfig    clang-14
mips                   sb1250_swarm_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241126    gcc-14.2.0
nios2                 randconfig-002-20241126    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241126    gcc-14.2.0
parisc                randconfig-002-20241126    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   currituck_defconfig    gcc-13.2.0
powerpc                 linkstation_defconfig    gcc-13.2.0
powerpc                     mpc5200_defconfig    clang-14
powerpc                 mpc8313_rdb_defconfig    gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig    clang-14
powerpc               randconfig-001-20241126    gcc-14.2.0
powerpc               randconfig-002-20241126    gcc-14.2.0
powerpc               randconfig-003-20241126    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-13.2.0
powerpc64             randconfig-001-20241126    gcc-14.2.0
powerpc64             randconfig-002-20241126    gcc-14.2.0
powerpc64             randconfig-003-20241126    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                 randconfig-001-20241126    gcc-14.2.0
riscv                 randconfig-002-20241126    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241126    gcc-14.2.0
s390                  randconfig-002-20241126    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-13.2.0
sh                          kfr2r09_defconfig    gcc-13.2.0
sh                          landisk_defconfig    gcc-13.2.0
sh                     magicpanelr2_defconfig    gcc-13.2.0
sh                    randconfig-001-20241126    gcc-14.2.0
sh                    randconfig-002-20241126    gcc-14.2.0
sh                          rsk7203_defconfig    gcc-13.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-13.2.0
sh                            shmin_defconfig    clang-14
sh                            titan_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241126    gcc-14.2.0
sparc64               randconfig-002-20241126    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                    randconfig-001-20241126    gcc-14.2.0
um                    randconfig-002-20241126    gcc-14.2.0
x86_64      buildonly-randconfig-001-20241126    clang-19
x86_64      buildonly-randconfig-002-20241126    clang-19
x86_64      buildonly-randconfig-003-20241126    clang-19
x86_64      buildonly-randconfig-004-20241126    clang-19
x86_64      buildonly-randconfig-005-20241126    clang-19
x86_64      buildonly-randconfig-006-20241126    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241126    clang-19
x86_64                randconfig-002-20241126    clang-19
x86_64                randconfig-003-20241126    clang-19
x86_64                randconfig-004-20241126    clang-19
x86_64                randconfig-005-20241126    clang-19
x86_64                randconfig-006-20241126    clang-19
x86_64                randconfig-011-20241126    clang-19
x86_64                randconfig-012-20241126    clang-19
x86_64                randconfig-013-20241126    clang-19
x86_64                randconfig-014-20241126    clang-19
x86_64                randconfig-015-20241126    clang-19
x86_64                randconfig-016-20241126    clang-19
x86_64                randconfig-071-20241126    clang-19
x86_64                randconfig-072-20241126    clang-19
x86_64                randconfig-073-20241126    clang-19
x86_64                randconfig-074-20241126    clang-19
x86_64                randconfig-075-20241126    clang-19
x86_64                randconfig-076-20241126    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-13.2.0
xtensa                randconfig-001-20241126    gcc-14.2.0
xtensa                randconfig-002-20241126    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
