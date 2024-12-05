Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E423E7716D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 01:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3829910E0BB;
	Thu,  5 Dec 2024 01:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtY0r8zk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4928F10E0BB
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 01:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733361483; x=1764897483;
 h=date:from:to:cc:subject:message-id;
 bh=sZclpT7uXi05uKxuZjM+6hSl2ViExgwxYnRxJhxR58Y=;
 b=XtY0r8zk5MAfOil/qOFwxBd0XAgscr3wtz9EYyo2ONv20+7OqUSsIE3B
 vGDoO2rplQ3DxEh1yUTJvdsTj7R9jShSl4+TtCtuoa2qJgbBBrbuKs8bR
 V+yTT1F/7uVHGFGjQ6MRRX9VwWHXkxJI/fmpLTAzGDyoHbaLvko/uG2bU
 fiVtf0jP7MjzfbiBGr0PxbFOpU9+/qa1PPf3nx4oBSqayxqSUQ/T9Hgc5
 XbYzB7r7FvrI1OG5RaIqjBUjjs84x2teUGUUWSI/PQOe9g9Teup5xgd5U
 SbFnZxcqW/nlmTR3QXl/+PvThLyTmhsFxvsWIwBKK9f31CS6Z87DbGpbz w==;
X-CSE-ConnectionGUID: CTbTHKYiS9SCRm9jNHynuw==
X-CSE-MsgGUID: sUNCxzzTQbOWxMw52pVAuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33572023"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33572023"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 17:18:03 -0800
X-CSE-ConnectionGUID: llyuv3ekSNOOIUUlG2vvsQ==
X-CSE-MsgGUID: dvbXGdJ9QdCWdwzCQh/+aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="98394599"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 04 Dec 2024 17:18:02 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tJ0V7-0003dr-2A;
 Thu, 05 Dec 2024 01:17:59 +0000
Date: Thu, 05 Dec 2024 09:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 7cbd0f7cfa2685860f85f0d4fbf817d287b65bcf
Message-ID: <202412050948.erRtWhM9-lkp@intel.com>
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
branch HEAD: 7cbd0f7cfa2685860f85f0d4fbf817d287b65bcf  drm/i915/display: Use struct intel_display instead of struct drm_i915_private

elapsed time: 724m

configs tested: 164
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              alldefconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    clang-18
arc                        nsimosci_defconfig    clang-20
arc                            randconfig-001    clang-20
arc                   randconfig-001-20241204    gcc-13.2.0
arc                   randconfig-001-20241205    clang-20
arc                            randconfig-002    clang-20
arc                   randconfig-002-20241204    gcc-13.2.0
arc                   randconfig-002-20241205    clang-20
arc                           tb10x_defconfig    clang-20
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g4_defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-18
arm                           imxrt_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                        multi_v7_defconfig    gcc-14.2.0
arm                         mv78xx0_defconfig    clang-17
arm                           omap1_defconfig    clang-20
arm                         orion5x_defconfig    clang-20
arm                          pxa910_defconfig    gcc-14.2.0
arm                            randconfig-001    clang-20
arm                   randconfig-001-20241204    clang-20
arm                   randconfig-001-20241205    clang-20
arm                            randconfig-002    clang-20
arm                   randconfig-002-20241204    clang-20
arm                   randconfig-002-20241205    clang-20
arm                            randconfig-003    clang-20
arm                   randconfig-003-20241204    clang-14
arm                   randconfig-003-20241205    clang-20
arm                            randconfig-004    clang-20
arm                   randconfig-004-20241204    gcc-14.2.0
arm                   randconfig-004-20241205    clang-20
arm                         s5pv210_defconfig    gcc-14.2.0
arm                          sp7021_defconfig    clang-20
arm                           spitz_defconfig    gcc-14.2.0
arm                       versatile_defconfig    clang-20
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                          randconfig-001    clang-20
arm64                 randconfig-001-20241204    gcc-14.2.0
arm64                 randconfig-001-20241205    clang-20
arm64                          randconfig-002    clang-20
arm64                 randconfig-002-20241204    gcc-14.2.0
arm64                 randconfig-002-20241205    clang-20
arm64                          randconfig-003    clang-20
arm64                 randconfig-003-20241204    gcc-14.2.0
arm64                 randconfig-003-20241205    clang-20
arm64                          randconfig-004    clang-20
arm64                 randconfig-004-20241204    gcc-14.2.0
arm64                 randconfig-004-20241205    clang-20
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-12
i386        buildonly-randconfig-001-20241205    clang-19
i386                 buildonly-randconfig-002    clang-19
i386                 buildonly-randconfig-002    gcc-12
i386        buildonly-randconfig-002-20241205    clang-19
i386                 buildonly-randconfig-003    clang-19
i386                 buildonly-randconfig-003    gcc-12
i386        buildonly-randconfig-003-20241205    clang-19
i386                 buildonly-randconfig-004    gcc-12
i386        buildonly-randconfig-004-20241205    clang-19
i386                 buildonly-randconfig-005    gcc-12
i386        buildonly-randconfig-005-20241205    clang-19
i386                 buildonly-randconfig-006    gcc-12
i386        buildonly-randconfig-006-20241205    clang-19
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                           virt_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-20
mips                         bigsur_defconfig    clang-17
mips                          eyeq6_defconfig    clang-20
mips                          rb532_defconfig    clang-17
nios2                             allnoconfig    gcc-14.2.0
openrisc                         alldefconfig    clang-20
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
powerpc                     akebono_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-20
powerpc                       ebony_defconfig    clang-18
powerpc                    ge_imp3a_defconfig    clang-18
powerpc                       holly_defconfig    clang-20
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    clang-18
powerpc                     mpc5200_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                     tqm8548_defconfig    clang-20
powerpc                     tqm8555_defconfig    clang-20
powerpc                        warp_defconfig    clang-17
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        dreamcast_defconfig    clang-17
sh                        dreamcast_defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    clang-18
sh                         ecovec24_defconfig    clang-20
sh                          kfr2r09_defconfig    clang-20
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    clang-20
sh                           se7206_defconfig    clang-17
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7722_defconfig    clang-17
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                             shx3_defconfig    clang-20
sh                          urquell_defconfig    gcc-14.2.0
sparc                            alldefconfig    clang-18
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20241205    clang-19
x86_64      buildonly-randconfig-002-20241205    clang-19
x86_64      buildonly-randconfig-003-20241205    clang-19
x86_64      buildonly-randconfig-004-20241205    clang-19
x86_64      buildonly-randconfig-005-20241205    clang-19
x86_64      buildonly-randconfig-006-20241205    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
