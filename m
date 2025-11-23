Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0C6CFA46B
	for <intel-xe@archiver.kernel.org>; Sun, 23 Nov 2025 14:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6663F10E00F;
	Sun, 23 Nov 2025 14:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ltVs8Arx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4530510E00F
 for <intel-xe@lists.freedesktop.org>; Sun, 23 Nov 2025 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763906797; x=1795442797;
 h=date:from:to:cc:subject:message-id;
 bh=XRX8j9heBjsMxbMBLAenC661ScWjy3bx9YuOrgNgb6w=;
 b=ltVs8Arxv8lUp8y8vjZ80au3rk4bNlgkB7TCwTmZ32aUEDikjiBl3Uk2
 Qyz1DS55AlBnBoX+0E53340ATP3mli7+KpZlJwXQylW2PZaAteyJdTM7Y
 nRuh5XIm6GUZwpH/bqfN1Y5R8qy5GJAFkYzss+D2wZu5ujksC29KJtJXV
 Kz5HIgwXVcLQpU7sj1x4wcczkD5U2SL1qRn+o0vfhrdyxSwlY/ajNu4RM
 fQ+GfhHfM/H6d5gHfSwUA1Bvc1rasRR9/ohnQfKsk4QVwYB+2pyF8uFoO
 /oGdyyVlhVYK9Oeai+nBZjQn4FSx+0ErZxn6nUkQ3qsRfRpzhOJo3W1q8 g==;
X-CSE-ConnectionGUID: 7pXLk7+dS+OmLIyD1NirhQ==
X-CSE-MsgGUID: X5SZopofQe6s1+IaWYZwGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="66007109"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; d="scan'208";a="66007109"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 06:06:37 -0800
X-CSE-ConnectionGUID: H0GJ7q6oSEaJNYJhuKCXhQ==
X-CSE-MsgGUID: lk5X1U1ESWOMein6hG0U8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; d="scan'208";a="191779528"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 23 Nov 2025 06:06:36 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vNAjZ-0008It-2a;
 Sun, 23 Nov 2025 14:06:33 +0000
Date: Sun, 23 Nov 2025 22:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 96b93ac214f9dd66294d975d86c5dee256faef91
Message-ID: <202511232224.nsCcALVE-lkp@intel.com>
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
branch HEAD: 96b93ac214f9dd66294d975d86c5dee256faef91  drm/xe: Fix conversion from clock ticks to milliseconds

elapsed time: 2314m

configs tested: 108
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251123    gcc-15.1.0
arc                   randconfig-002-20251123    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                         mv78xx0_defconfig    clang-19
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20251123    clang-22
arm                   randconfig-002-20251123    clang-22
arm                   randconfig-003-20251123    gcc-10.5.0
arm                   randconfig-004-20251123    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251123    gcc-8.5.0
arm64                 randconfig-002-20251123    gcc-11.5.0
arm64                 randconfig-003-20251123    clang-22
arm64                 randconfig-004-20251123    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251123    gcc-15.1.0
csky                  randconfig-002-20251123    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251122    clang-22
hexagon               randconfig-002-20251122    clang-17
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251123    clang-20
i386        buildonly-randconfig-003-20251123    gcc-14
i386                  randconfig-001-20251123    gcc-14
i386                  randconfig-002-20251123    gcc-14
i386                  randconfig-003-20251123    gcc-14
i386                  randconfig-004-20251123    gcc-14
i386                  randconfig-005-20251123    gcc-14
i386                  randconfig-006-20251123    clang-20
i386                  randconfig-007-20251123    gcc-14
i386                  randconfig-011-20251123    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251122    gcc-12.5.0
loongarch             randconfig-002-20251122    gcc-14.3.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251122    gcc-11.5.0
nios2                 randconfig-002-20251122    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251123    gcc-14.3.0
parisc                randconfig-002-20251123    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251123    clang-22
powerpc               randconfig-002-20251123    gcc-8.5.0
powerpc64             randconfig-001-20251123    clang-22
powerpc64             randconfig-002-20251123    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251123    clang-20
riscv                 randconfig-002-20251123    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251123    gcc-8.5.0
s390                  randconfig-002-20251123    clang-22
s390                       zfcpdump_defconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251123    gcc-12.5.0
sh                    randconfig-002-20251123    gcc-14.3.0
sh                          rsk7201_defconfig    gcc-15.1.0
sh                        sh7763rdp_defconfig    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251123    gcc-8.5.0
sparc                 randconfig-002-20251123    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251123    clang-22
sparc64               randconfig-002-20251123    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251123    gcc-14
um                    randconfig-002-20251123    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251123    gcc-14
x86_64      buildonly-randconfig-002-20251123    gcc-12
x86_64      buildonly-randconfig-003-20251123    gcc-14
x86_64      buildonly-randconfig-004-20251123    clang-20
x86_64      buildonly-randconfig-005-20251123    gcc-14
x86_64      buildonly-randconfig-006-20251123    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251123    gcc-14
x86_64                randconfig-012-20251123    gcc-14
x86_64                randconfig-013-20251123    clang-20
x86_64                randconfig-014-20251123    gcc-14
x86_64                randconfig-015-20251123    gcc-14
x86_64                randconfig-016-20251123    clang-20
x86_64                randconfig-072-20251123    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251123    gcc-14.3.0
xtensa                randconfig-002-20251123    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
