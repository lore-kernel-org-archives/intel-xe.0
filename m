Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE03C61DE5
	for <intel-xe@archiver.kernel.org>; Sat, 21 Feb 2026 11:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C9710E08A;
	Sat, 21 Feb 2026 11:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFxsH4ur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744A110E08A
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Feb 2026 11:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771673828; x=1803209828;
 h=date:from:to:cc:subject:message-id;
 bh=xDIpj78Bq/w4DCMjC4b6FfE72qCu5Inh+HOPjv5WY5A=;
 b=cFxsH4urNveuZZn2KAXMuSK8cE8lfWXD3TqjBSop5POKyn25JZCvYuPX
 mPJvfDKlJOym6r/ss6pO6spwCePzNobTKj1XyVJLWJyq4jWLS6AZyJH4i
 QQAWO+qYi6a6vfkCAsZmcOU2hmnckhu5Gn1zEOOQKm/E4Uvf7rQvfDcgz
 bHVfYbeStwuIhicocPQuCskPtyyCTaJjiFmWPftp0CQZX5mfZ/4zkLlJN
 CoZohpUaeDcC8X6F+rVZJY2rvnfEc34FpMN2CYvOU3nuE5fWGFwZxZEg6
 4Oh0HkhKUi/nkRVO/z3L8ua+MjXxa99Fv2CuhGBCFc5/SATQkEop3wES/ g==;
X-CSE-ConnectionGUID: ynsCDIwgRl6cGgCqidwCZQ==
X-CSE-MsgGUID: T2+wJXMXTwuXhfYtbk/wxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83461228"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="83461228"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 03:37:05 -0800
X-CSE-ConnectionGUID: vFsu6mNSTuSBucnsYwCZ6A==
X-CSE-MsgGUID: qya3Gw9ZSzyGG87gyYw9Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="219629180"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 21 Feb 2026 03:37:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vtlIE-000000014sq-1I0D;
 Sat, 21 Feb 2026 11:37:02 +0000
Date: Sat, 21 Feb 2026 19:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS WITH WARNING
 dfeef98e55d0e5f622886d0a9980c235ff08fd97
Message-ID: <202602211957.DETur34q-lkp@intel.com>
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
branch HEAD: dfeef98e55d0e5f622886d0a9980c235ff08fd97  drm/xe/sa: Add lockdep annotations for SA manager swap_guard

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202602210749.v7sCkR0a-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202602211614.qY5LV3ZS-lkp@intel.com

    drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:14:25: warning: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '14940110848' to '2055208960' [-Woverflow]

Unverified Warning (likely false positive, kindly check if interested):

    drivers/gpu/drm/xe/xe_sync.c:168 xe_sync_entry_parse() warn: missing unwind goto?

Warning ids grouped by kconfigs:

recent_errors
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-xe-tests-xe_gt_sriov_pf_config_kunit.c:warning:conversion-from-long-long-unsigned-int-to-resource_size_t-aka-unsigned-int-changes-value-from-to
|-- i386-randconfig-141-20260221
|   `-- drivers-gpu-drm-xe-xe_sync.c-xe_sync_entry_parse()-warn:missing-unwind-goto
|-- microblaze-allyesconfig
|   `-- drivers-gpu-drm-xe-tests-xe_gt_sriov_pf_config_kunit.c:warning:conversion-from-long-long-unsigned-int-to-resource_size_t-aka-unsigned-int-changes-value-from-to
|-- mips-allyesconfig
|   `-- drivers-gpu-drm-xe-tests-xe_gt_sriov_pf_config_kunit.c:warning:conversion-from-long-long-unsigned-int-to-resource_size_t-aka-unsigned-int-changes-value-from-to
|-- parisc-allyesconfig
|   `-- drivers-gpu-drm-xe-tests-xe_gt_sriov_pf_config_kunit.c:warning:conversion-from-long-long-unsigned-int-to-resource_size_t-aka-unsigned-int-changes-value-from-to
|-- parisc-randconfig-r071-20260221
|   `-- drivers-gpu-drm-xe-xe_sync.c-xe_sync_entry_parse()-warn:missing-unwind-goto
`-- xtensa-allyesconfig
    `-- drivers-gpu-drm-xe-tests-xe_gt_sriov_pf_config_kunit.c:warning:conversion-from-long-long-unsigned-int-to-resource_size_t-aka-unsigned-int-changes-value-from-to

elapsed time: 985m

configs tested: 222
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260221    gcc-14.3.0
arc                   randconfig-002-20260221    gcc-14.3.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260221    gcc-14.3.0
arm                   randconfig-002-20260221    gcc-14.3.0
arm                   randconfig-003-20260221    gcc-14.3.0
arm                   randconfig-004-20260221    gcc-14.3.0
arm                         s3c6400_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260221    clang-23
arm64                 randconfig-002-20260221    clang-23
arm64                 randconfig-003-20260221    clang-23
arm64                 randconfig-004-20260221    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260221    clang-23
csky                  randconfig-002-20260221    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260221    clang-23
hexagon               randconfig-002-20260221    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260221    clang-20
i386        buildonly-randconfig-002-20260221    clang-20
i386        buildonly-randconfig-003-20260221    clang-20
i386        buildonly-randconfig-004-20260221    clang-20
i386        buildonly-randconfig-005-20260221    clang-20
i386        buildonly-randconfig-006-20260221    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260221    gcc-14
i386                  randconfig-002-20260221    clang-20
i386                  randconfig-002-20260221    gcc-14
i386                  randconfig-003-20260221    gcc-12
i386                  randconfig-003-20260221    gcc-14
i386                  randconfig-004-20260221    clang-20
i386                  randconfig-004-20260221    gcc-14
i386                  randconfig-005-20260221    clang-20
i386                  randconfig-005-20260221    gcc-14
i386                  randconfig-006-20260221    gcc-14
i386                  randconfig-007-20260221    gcc-14
i386                  randconfig-011-20260221    clang-20
i386                  randconfig-011-20260221    gcc-14
i386                  randconfig-012-20260221    clang-20
i386                  randconfig-012-20260221    gcc-14
i386                  randconfig-013-20260221    gcc-14
i386                  randconfig-014-20260221    clang-20
i386                  randconfig-014-20260221    gcc-14
i386                  randconfig-015-20260221    gcc-14
i386                  randconfig-016-20260221    gcc-14
i386                  randconfig-017-20260221    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson32_defconfig    gcc-15.2.0
loongarch             randconfig-001-20260221    clang-23
loongarch             randconfig-001-20260221    gcc-15.2.0
loongarch             randconfig-002-20260221    clang-18
loongarch             randconfig-002-20260221    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.2.0
m68k                          multi_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                    maltaup_xpa_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260221    clang-23
nios2                 randconfig-001-20260221    gcc-11.5.0
nios2                 randconfig-002-20260221    clang-23
nios2                 randconfig-002-20260221    gcc-10.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260221    gcc-8.5.0
parisc                randconfig-001-20260221    gcc-9.5.0
parisc                randconfig-002-20260221    gcc-8.5.0
parisc                randconfig-002-20260221    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                     akebono_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                      chrp32_defconfig    gcc-15.2.0
powerpc                  iss476-smp_defconfig    gcc-15.2.0
powerpc                      pcm030_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260221    gcc-12.5.0
powerpc               randconfig-001-20260221    gcc-9.5.0
powerpc               randconfig-002-20260221    gcc-9.5.0
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260221    gcc-11.5.0
powerpc64             randconfig-001-20260221    gcc-9.5.0
powerpc64             randconfig-002-20260221    gcc-8.5.0
powerpc64             randconfig-002-20260221    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260221    gcc-10.5.0
riscv                 randconfig-002-20260221    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260221    gcc-10.5.0
s390                  randconfig-002-20260221    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                          lboxre2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260221    gcc-10.5.0
sh                    randconfig-002-20260221    gcc-10.5.0
sh                           se7705_defconfig    gcc-15.2.0
sh                           se7724_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260221    gcc-15.2.0
sparc                 randconfig-001-20260221    gcc-8.5.0
sparc                 randconfig-002-20260221    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260221    gcc-8.5.0
sparc64               randconfig-002-20260221    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260221    gcc-14
um                    randconfig-001-20260221    gcc-8.5.0
um                    randconfig-002-20260221    clang-23
um                    randconfig-002-20260221    gcc-8.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260221    clang-20
x86_64      buildonly-randconfig-002-20260221    clang-20
x86_64      buildonly-randconfig-003-20260221    clang-20
x86_64      buildonly-randconfig-004-20260221    clang-20
x86_64      buildonly-randconfig-005-20260221    clang-20
x86_64      buildonly-randconfig-006-20260221    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260221    clang-20
x86_64                randconfig-001-20260221    gcc-14
x86_64                randconfig-002-20260221    gcc-14
x86_64                randconfig-003-20260221    gcc-14
x86_64                randconfig-004-20260221    clang-20
x86_64                randconfig-004-20260221    gcc-14
x86_64                randconfig-005-20260221    clang-20
x86_64                randconfig-005-20260221    gcc-14
x86_64                randconfig-006-20260221    gcc-14
x86_64                randconfig-011-20260221    gcc-14
x86_64                randconfig-012-20260221    gcc-14
x86_64                randconfig-013-20260221    gcc-14
x86_64                randconfig-014-20260221    gcc-14
x86_64                randconfig-015-20260221    gcc-14
x86_64                randconfig-016-20260221    gcc-14
x86_64                randconfig-071-20260221    clang-20
x86_64                randconfig-071-20260221    gcc-14
x86_64                randconfig-072-20260221    clang-20
x86_64                randconfig-073-20260221    clang-20
x86_64                randconfig-074-20260221    clang-20
x86_64                randconfig-074-20260221    gcc-14
x86_64                randconfig-075-20260221    clang-20
x86_64                randconfig-076-20260221    clang-20
x86_64                randconfig-076-20260221    gcc-12
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260221    gcc-8.5.0
xtensa                randconfig-002-20260221    gcc-12.5.0
xtensa                randconfig-002-20260221    gcc-8.5.0
xtensa                         virt_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
