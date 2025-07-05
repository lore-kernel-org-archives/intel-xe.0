Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE48CC8303C
	for <intel-xe@archiver.kernel.org>; Sat,  5 Jul 2025 09:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B84310E20C;
	Sat,  5 Jul 2025 09:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5IMNnup";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7228510E20C
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Jul 2025 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751709164; x=1783245164;
 h=date:from:to:cc:subject:message-id;
 bh=S+IBL3gtdtM/tu9wges8HoQK8Mz7AaE6+BMr5GI7sHA=;
 b=L5IMNnupJaWr4HPYSZRzm7PUShGFqRPH7wBS8x0WSHUxMvglPfjskJz5
 miwUvlr15PsWPD9ZL/YtWvVdiSNYJKMV/8Dnr2uxq73OrLCEa4BcCwqgl
 pVN4Qf57F3x2+GJgeWQbH3LwckeHCYhFqAY2pDYwy9nWI5D21IKPIO1xe
 8qZ2Ph3myot5gJhRLPi85KOO0cLZkr85xMcDDCbMG4Smi8TMlRTnlvZiW
 CGd9T1/LFGuDr+NijoemQfEagtf0XMlFIIJh1ty+y9NLwWbw/i2IhBkxU
 efz7/ZE1a7TjwsbbJMsJ3AENF01rgu0/+0H1c63ATwmgo30Hlr697wiza A==;
X-CSE-ConnectionGUID: PbHpFHXWSXaj+WztLR2fuQ==
X-CSE-MsgGUID: n+3qlDPTTeajoPSLClk5zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64700350"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; d="scan'208";a="64700350"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2025 02:52:43 -0700
X-CSE-ConnectionGUID: MfF5TPlCR5OV3mpCrTRRoA==
X-CSE-MsgGUID: yTWuvZNlR5OzQjLo0VJ5Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; d="scan'208";a="159349903"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 05 Jul 2025 02:52:42 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uXzZX-0004Qt-23;
 Sat, 05 Jul 2025 09:52:39 +0000
Date: Sat, 05 Jul 2025 17:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 ccfb15b8158c11a8304204aeac354c7b1cfb18a3
Message-ID: <202507051723.wXqDwQ43-lkp@intel.com>
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
branch HEAD: ccfb15b8158c11a8304204aeac354c7b1cfb18a3  drm/xe/bmg: Add one additional PCI ID

elapsed time: 1157m

configs tested: 125
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250705    gcc-8.5.0
arc                   randconfig-002-20250705    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         orion5x_defconfig    clang-21
arm                   randconfig-001-20250705    gcc-12.4.0
arm                   randconfig-002-20250705    clang-21
arm                   randconfig-003-20250705    gcc-8.5.0
arm                   randconfig-004-20250705    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250705    gcc-10.5.0
arm64                 randconfig-002-20250705    clang-17
arm64                 randconfig-003-20250705    gcc-11.5.0
arm64                 randconfig-004-20250705    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250705    gcc-10.5.0
csky                  randconfig-002-20250705    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250705    clang-19
hexagon               randconfig-002-20250705    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250705    gcc-11
i386        buildonly-randconfig-002-20250705    clang-20
i386        buildonly-randconfig-003-20250705    gcc-12
i386        buildonly-randconfig-004-20250705    gcc-12
i386        buildonly-randconfig-005-20250705    gcc-12
i386        buildonly-randconfig-006-20250705    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250705    gcc-15.1.0
loongarch             randconfig-002-20250705    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250705    gcc-8.5.0
nios2                 randconfig-002-20250705    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250705    gcc-9.3.0
parisc                randconfig-002-20250705    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                       ppc64_defconfig    clang-21
powerpc               randconfig-001-20250705    gcc-11.5.0
powerpc               randconfig-002-20250705    gcc-9.3.0
powerpc               randconfig-003-20250705    gcc-12.4.0
powerpc64             randconfig-001-20250705    clang-21
powerpc64             randconfig-002-20250705    clang-21
powerpc64             randconfig-003-20250705    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250705    clang-21
riscv                 randconfig-002-20250705    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250705    clang-21
s390                  randconfig-002-20250705    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250705    gcc-15.1.0
sh                    randconfig-002-20250705    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250705    gcc-13.4.0
sparc                 randconfig-002-20250705    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250705    gcc-8.5.0
sparc64               randconfig-002-20250705    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250705    gcc-12
um                    randconfig-002-20250705    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250705    gcc-12
x86_64      buildonly-randconfig-002-20250705    gcc-12
x86_64      buildonly-randconfig-003-20250705    clang-20
x86_64      buildonly-randconfig-004-20250705    gcc-12
x86_64      buildonly-randconfig-005-20250705    gcc-12
x86_64      buildonly-randconfig-006-20250705    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250705    gcc-12.4.0
xtensa                randconfig-002-20250705    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
