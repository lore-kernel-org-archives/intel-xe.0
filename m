Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFDAC56207
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 14:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD12310E323;
	Thu,  6 Aug 2026 14:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E85cg/rE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44CF10E323
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786027101; x=1817563101;
 h=date:from:to:cc:subject:message-id;
 bh=5PHof5je54ArGmeEH87uvWvBt2Hd7VEVvylSJcicGzs=;
 b=E85cg/rEte9koEWEv5Q84ChrfGGrFFcqvxK5jF29qOSG3H+xY37KTU74
 fNpHYUezZJJhXXBc20Pj+nGlYOWZWKxDSvQ3kGiA47+ZVrX62vvRi1DxM
 dsnnewrHT7OLdx26TgOXMHMPk4C4O3yEe2e28k2q6nK0k7J3POG+ef5yT
 ehxI9zuTNm/IAxEP14Jjz1mDw37nLVzcWmZcSO4552AdN3CUN2lKiA8/X
 vumQqKrGpYHqlf1UX2vxESo/kkCLBFYB4lqUgP/6LVYv9pR/UVtzXd2hC
 V6DyBMCxUJnwzTon5DaOrWFm0oxitLBZyKISTCfpUVR4reA5GErnCo6ed A==;
X-CSE-ConnectionGUID: yhQTORBvTOKxura/eGIb8w==
X-CSE-MsgGUID: W8bWdLt7Q9mfiNojKI4ynQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86830550"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="86830550"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:38:20 -0700
X-CSE-ConnectionGUID: /4WEoMO/Q9qoHNiOhSxR9Q==
X-CSE-MsgGUID: bwf/LpTXTmWSYnkE/2+7Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="258248402"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 06 Aug 2026 07:38:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wrzEe-00000000FND-09nO;
 Thu, 06 Aug 2026 14:38:16 +0000
Date: Thu, 06 Aug 2026 22:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 d1643db3b037b57f2af7f85c3821d6fe69c492f6
Message-ID: <202608062206.hFPKXLUc-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: d1643db3b037b57f2af7f85c3821d6fe69c492f6  drm/xe/uc: Apply RCS/CCS yield policy to SR-IOV VFs

elapsed time: 1553m

configs tested: 126
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260806    gcc-11.5.0
arc                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-001-20260806    gcc-11.5.0
arm                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-003-20260806    gcc-11.5.0
arm                  randconfig-004-20260806    gcc-11.5.0
arm64                randconfig-001-20260806    gcc-13.4.0
arm64                randconfig-002-20260806    gcc-13.4.0
arm64                randconfig-003-20260806    gcc-13.4.0
arm64                randconfig-004-20260806    gcc-13.4.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260806    gcc-13.4.0
csky                 randconfig-002-20260806    gcc-13.4.0
hexagon              randconfig-001-20260806    clang-24
hexagon              randconfig-002-20260806    clang-24
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260806    gcc-14
i386       buildonly-randconfig-002-20260806    gcc-14
i386       buildonly-randconfig-003-20260806    gcc-14
i386       buildonly-randconfig-004-20260806    gcc-14
i386       buildonly-randconfig-005-20260806    gcc-14
i386       buildonly-randconfig-006-20260806    gcc-14
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260806    clang-22
i386                 randconfig-002-20260806    clang-22
i386                 randconfig-003-20260806    clang-22
i386                 randconfig-004-20260806    clang-22
i386                 randconfig-005-20260806    clang-22
i386                 randconfig-006-20260806    clang-22
i386                 randconfig-007-20260806    clang-22
i386                 randconfig-011-20260806    clang-22
i386                 randconfig-012-20260806    clang-22
i386                 randconfig-013-20260806    clang-22
i386                 randconfig-014-20260806    clang-22
i386                 randconfig-015-20260806    clang-22
i386                 randconfig-016-20260806    clang-22
i386                 randconfig-017-20260806    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260806    clang-24
loongarch            randconfig-002-20260806    clang-24
m68k                      m5208evb_defconfig    gcc-16.1.0
mips                          xway_defconfig    clang-19
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260806    clang-24
nios2                randconfig-002-20260806    clang-24
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260806    gcc-8.5.0
parisc               randconfig-002-20260806    gcc-8.5.0
powerpc              randconfig-001-20260806    gcc-8.5.0
powerpc              randconfig-002-20260806    gcc-8.5.0
powerpc                    tqm5200_defconfig    gcc-16.1.0
powerpc64            randconfig-001-20260806    gcc-8.5.0
powerpc64            randconfig-002-20260806    gcc-8.5.0
riscv                         randconfig-001    gcc-13.4.0
riscv                randconfig-001-20260805    gcc-8.5.0
riscv                randconfig-001-20260806    gcc-13.4.0
riscv                randconfig-002-20260805    clang-17
riscv                randconfig-002-20260806    gcc-13.4.0
s390                 randconfig-001-20260805    gcc-8.5.0
s390                 randconfig-001-20260806    gcc-13.4.0
s390                 randconfig-002-20260805    gcc-9.5.0
s390                 randconfig-002-20260806    gcc-13.4.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260805    gcc-16.1.0
sh                   randconfig-001-20260806    gcc-13.4.0
sh                   randconfig-002-20260805    gcc-14.3.0
sh                   randconfig-002-20260806    gcc-13.4.0
sparc                         randconfig-001    gcc-8.5.0
sparc                randconfig-001-20260806    gcc-8.5.0
sparc                randconfig-002-20260806    gcc-8.5.0
sparc64              randconfig-001-20260806    gcc-8.5.0
sparc64              randconfig-002-20260806    gcc-8.5.0
um                   randconfig-001-20260806    gcc-8.5.0
um                   randconfig-002-20260806    gcc-8.5.0
x86_64              buildonly-randconfig-001    clang-22
x86_64     buildonly-randconfig-001-20260806    clang-22
x86_64     buildonly-randconfig-002-20260806    clang-22
x86_64     buildonly-randconfig-003-20260806    clang-22
x86_64     buildonly-randconfig-004-20260806    clang-22
x86_64     buildonly-randconfig-005-20260806    clang-22
x86_64     buildonly-randconfig-006-20260806    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260806    clang-22
x86_64               randconfig-002-20260806    clang-22
x86_64               randconfig-003-20260806    clang-22
x86_64               randconfig-004-20260806    clang-22
x86_64               randconfig-005-20260806    clang-22
x86_64               randconfig-006-20260806    clang-22
x86_64                        randconfig-011    clang-22
x86_64                        randconfig-011    gcc-14
x86_64               randconfig-011-20260805    gcc-14
x86_64               randconfig-011-20260806    clang-22
x86_64               randconfig-012-20260805    gcc-14
x86_64               randconfig-012-20260806    clang-22
x86_64               randconfig-013-20260805    gcc-14
x86_64               randconfig-013-20260806    clang-22
x86_64               randconfig-014-20260805    clang-22
x86_64               randconfig-014-20260806    clang-22
x86_64               randconfig-015-20260805    clang-22
x86_64               randconfig-015-20260806    clang-22
x86_64               randconfig-016-20260805    clang-22
x86_64               randconfig-016-20260806    clang-22
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260805    clang-22
x86_64               randconfig-071-20260806    gcc-14
x86_64               randconfig-072-20260805    gcc-14
x86_64               randconfig-072-20260806    gcc-14
x86_64               randconfig-073-20260805    gcc-13
x86_64               randconfig-073-20260806    gcc-14
x86_64               randconfig-074-20260805    clang-22
x86_64               randconfig-074-20260806    gcc-14
x86_64               randconfig-075-20260805    clang-22
x86_64               randconfig-075-20260806    gcc-14
x86_64               randconfig-076-20260805    clang-22
x86_64               randconfig-076-20260806    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260806    gcc-8.5.0
xtensa               randconfig-002-20260806    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
