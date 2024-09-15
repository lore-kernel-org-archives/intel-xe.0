Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AABDC35FE7
	for <intel-xe@archiver.kernel.org>; Sun, 15 Sep 2024 03:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E2710E2D1;
	Sun, 15 Sep 2024 03:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxrmbBaD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F5E10E2CF
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Sep 2024 03:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726370252; x=1757906252;
 h=date:from:to:cc:subject:message-id;
 bh=yf1O/DWIUeriLMtEMLmxpMOWk6Cz6P58tJBgNL6v/xM=;
 b=gxrmbBaDmwKGzN+DsdGxaKR8tSN12bqb9zUkaJjd16vaCBxuPix6+oI7
 +2GtRMrQ6jk2XcYyW1xy8XAieBQwzDQPptG1ja3cyQ+IrtzYrXbZs/nLK
 nDq9TDJ7YBPA4LhwxWQUh94EVXv8Yy3FlDtrSYfH+wT9JBuFUhQ61OEZx
 PZBFquJv4vbrFfaARMz3JE1mg9nhHloQwosmHBHt/Ah8n91eYo1z9t/xK
 PVPY9Em+GSNAePC+r3jvrQCTQt1VqvLCx04uQKwcNswvDVqEErp7juIhM
 CYgVd81rvQWuyCAhTOa+4d9y6wM+yTgzCMS1j6vRvPECMxBI2fnNyp1DL Q==;
X-CSE-ConnectionGUID: 7xXzx3slTp6LaE8/BiOCHA==
X-CSE-MsgGUID: 3D3aUfpsSYSw8uhg90puMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="35819658"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; d="scan'208";a="35819658"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2024 20:17:31 -0700
X-CSE-ConnectionGUID: pJkAJJWISWSD3VoUyRprVA==
X-CSE-MsgGUID: bYJGItOHQ3WcNLdB1kq1Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; d="scan'208";a="99200305"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 14 Sep 2024 20:17:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1spflP-0008NC-2h;
 Sun, 15 Sep 2024 03:17:27 +0000
Date: Sun, 15 Sep 2024 11:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 cdb389a4c9bc2faea866b517afc3aa3faef46022
Message-ID: <202409151114.AUN7lwrY-lkp@intel.com>
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
branch HEAD: cdb389a4c9bc2faea866b517afc3aa3faef46022  drm/xe/irq: Remove unneeded semicolon

elapsed time: 1879m

configs tested: 102
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
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
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240915    gcc-12
i386        buildonly-randconfig-002-20240915    clang-18
i386        buildonly-randconfig-003-20240915    clang-18
i386        buildonly-randconfig-004-20240915    gcc-12
i386        buildonly-randconfig-005-20240915    clang-18
i386        buildonly-randconfig-006-20240915    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240915    clang-18
i386                  randconfig-002-20240915    clang-18
i386                  randconfig-003-20240915    clang-18
i386                  randconfig-004-20240915    clang-18
i386                  randconfig-005-20240915    clang-18
i386                  randconfig-006-20240915    clang-18
i386                  randconfig-011-20240915    clang-18
i386                  randconfig-012-20240915    gcc-12
i386                  randconfig-013-20240915    gcc-12
i386                  randconfig-014-20240915    clang-18
i386                  randconfig-015-20240915    gcc-12
i386                  randconfig-016-20240915    gcc-12
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
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
