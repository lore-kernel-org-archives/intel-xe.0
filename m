Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B6DC021A0
	for <intel-xe@archiver.kernel.org>; Sat, 15 Feb 2025 21:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0086F10E16E;
	Sat, 15 Feb 2025 21:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpP+HNcB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E9010E16E
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Feb 2025 21:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739654555; x=1771190555;
 h=date:from:to:cc:subject:message-id;
 bh=vl8h2WqJQpNXSHKQxmQ30aWTfGG8hxJIIh+ae+Kh274=;
 b=GpP+HNcBqkE1MuyU+1KwsnpcCvR2h3JYzgtqCwRLAY7q1djwOu10ifg/
 skh264pAgvYwyo+knIs9+xB1+xBdosOX6CZcdgVemsMnCVNq1pa/GQNwD
 AldkZPLKuMVB2AeIAKfVXQyMllIX9GwCtkop6AOVbaHX1vdFXv/xCxusp
 i37w3hy5L7arBmPSb1EtF/68MXCx9YuEoCVlVvjByOCZAeRmtUY7wJCh5
 TjqzSAr1vlCvcS/SiqDvnWsAsglxOgWmTANvMf1vGC/DM5to8JT6eqe0o
 AzIHj2K3THSqXIeAhcghpfg83WeFpMb8b993sJKAWousApoy12lLpC3hq A==;
X-CSE-ConnectionGUID: /qhLjbKeQ/6rqAcyT4hqIg==
X-CSE-MsgGUID: qtUgBIETS0anEeaL7uttaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="51027401"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; d="scan'208";a="51027401"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2025 13:22:35 -0800
X-CSE-ConnectionGUID: WUKj9o0iRDubaGNzT5PqYg==
X-CSE-MsgGUID: xOlXIGvLR82x67p9B9sQtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114247834"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 15 Feb 2025 13:22:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tjPcN-001BBp-1I;
 Sat, 15 Feb 2025 21:22:31 +0000
Date: Sun, 16 Feb 2025 05:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 62fbc75b28a7a2e8619c575d2a0acad595345ed1
Message-ID: <202502160502.PSW1zeKb-lkp@intel.com>
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
branch HEAD: 62fbc75b28a7a2e8619c575d2a0acad595345ed1  drm/xe/hwmon: Stop ignoring errors on probe

elapsed time: 1443m

configs tested: 80
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250215    gcc-13.2.0
arc                  randconfig-002-20250215    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250215    clang-15
arm                  randconfig-002-20250215    clang-17
arm                  randconfig-003-20250215    gcc-14.2.0
arm                  randconfig-004-20250215    gcc-14.2.0
arm64                           allmodconfig    clang-18
arm64                randconfig-001-20250215    clang-21
arm64                randconfig-002-20250215    gcc-14.2.0
arm64                randconfig-003-20250215    clang-17
arm64                randconfig-004-20250215    gcc-14.2.0
csky                 randconfig-001-20250215    gcc-14.2.0
csky                 randconfig-002-20250215    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250215    clang-21
hexagon              randconfig-002-20250215    clang-21
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250215    gcc-12
i386       buildonly-randconfig-002-20250215    clang-19
i386       buildonly-randconfig-003-20250215    clang-19
i386       buildonly-randconfig-004-20250215    gcc-12
i386       buildonly-randconfig-005-20250215    clang-19
i386       buildonly-randconfig-006-20250215    clang-19
i386                               defconfig    clang-19
loongarch            randconfig-001-20250215    gcc-14.2.0
loongarch            randconfig-002-20250215    gcc-14.2.0
m68k                             allnoconfig    gcc-14.2.0
mips                             allnoconfig    gcc-14.2.0
nios2                            allnoconfig    gcc-14.2.0
nios2                randconfig-001-20250215    gcc-14.2.0
nios2                randconfig-002-20250215    gcc-14.2.0
parisc               randconfig-001-20250215    gcc-14.2.0
parisc               randconfig-002-20250215    gcc-14.2.0
powerpc              randconfig-001-20250215    gcc-14.2.0
powerpc              randconfig-002-20250215    clang-21
powerpc              randconfig-003-20250215    clang-19
powerpc64            randconfig-001-20250215    gcc-14.2.0
powerpc64            randconfig-002-20250215    clang-21
powerpc64            randconfig-003-20250215    gcc-14.2.0
riscv                randconfig-001-20250215    clang-17
riscv                randconfig-002-20250215    clang-19
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250215    gcc-14.2.0
s390                 randconfig-002-20250215    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                               allnoconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250215    gcc-14.2.0
sh                   randconfig-002-20250215    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                            allnoconfig    gcc-14.2.0
sparc                randconfig-001-20250215    gcc-14.2.0
sparc                randconfig-002-20250215    gcc-14.2.0
sparc64              randconfig-001-20250215    gcc-14.2.0
sparc64              randconfig-002-20250215    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250215    clang-21
um                   randconfig-002-20250215    clang-19
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250215    gcc-12
x86_64     buildonly-randconfig-002-20250215    clang-19
x86_64     buildonly-randconfig-003-20250215    gcc-12
x86_64     buildonly-randconfig-004-20250215    clang-19
x86_64     buildonly-randconfig-005-20250215    clang-19
x86_64     buildonly-randconfig-006-20250215    clang-19
x86_64                             defconfig    gcc-11
xtensa                           allnoconfig    gcc-14.2.0
xtensa               randconfig-001-20250215    gcc-14.2.0
xtensa               randconfig-002-20250215    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
