Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07E4C3271E
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 02:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8A910E2C6;
	Sat,  6 Jul 2024 02:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIUqL/PY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A236C10E2C6
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jul 2024 02:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720232243; x=1751768243;
 h=date:from:to:cc:subject:message-id;
 bh=SY36nqpSChPnpyLzAm2GAnDyzgNPLMvbfed5l/PGwVY=;
 b=jIUqL/PY7sodAzt5J4bKTgPmGdxFWVk8HCoRDVMTe7yQsoFvM2Gv09SV
 840BsTCcdTeJ5oED82md9QpBExp0hzmJOVTg98m1amCJjxGgbcK3UvfrI
 fk/fMTAJgg5ODj60OLYeSbSKen9FF/KfDvD/8pD7nz5yvnq72Pq2w6yYB
 nBtDzGhsM1OI/vVoPxhgHp26p0cJExaqPD/el90RfUX1Ll+UMzkh6WWpH
 S/K6AiCCRr7f0HA4PaaQRsozr9P7juzakVaGKZIKLBZ2S2cETsq+WCLHY
 3tlVoFtjzZplbhyBno7oAwtfp8g6JsDmXfl7scSxexHMIbFXMc6WHxz9u g==;
X-CSE-ConnectionGUID: pH09KBMVQ4CNjhxdBvpwSQ==
X-CSE-MsgGUID: diR7wkuFRQSDE6sZ6SuoKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28188459"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="28188459"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 19:17:22 -0700
X-CSE-ConnectionGUID: GuGRB/8+QNikOirTni+6eA==
X-CSE-MsgGUID: yQVbZ7JuTwGXX+EvzXT4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="77744528"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 05 Jul 2024 19:17:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sPuzG-000TCu-0f;
 Sat, 06 Jul 2024 02:17:18 +0000
Date: Sat, 06 Jul 2024 10:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 c55f79f317ab428ae6d005965bc07e37496f209f
Message-ID: <202407061011.dflnh0Bf-lkp@intel.com>
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
branch HEAD: c55f79f317ab428ae6d005965bc07e37496f209f  drm/i915: disable fbc due to Wa_16023588340

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202407051904.cZVyDRlA-lkp@intel.com

Unverified Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/xe/xe_gt.c: generated/xe_wa_oob.h is included more than once.

Warning ids grouped by kconfigs:

recent_errors
|-- openrisc-randconfig-r123-20240705
|   `-- drivers-gpu-drm-xe-xe_pt.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
`-- x86_64-allnoconfig
    `-- drivers-gpu-drm-xe-xe_gt.c:generated-xe_wa_oob.h-is-included-more-than-once.

elapsed time: 993m

configs tested: 199
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240706   gcc-13.2.0
arc                   randconfig-002-20240706   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                   randconfig-001-20240706   gcc-13.2.0
arm                   randconfig-002-20240706   gcc-13.2.0
arm                   randconfig-003-20240706   gcc-13.2.0
arm                   randconfig-004-20240706   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240706   gcc-13.2.0
arm64                 randconfig-002-20240706   gcc-13.2.0
arm64                 randconfig-003-20240706   gcc-13.2.0
arm64                 randconfig-004-20240706   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240706   gcc-13.2.0
csky                  randconfig-002-20240706   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240705   gcc-13
i386         buildonly-randconfig-001-20240706   clang-18
i386         buildonly-randconfig-002-20240705   gcc-9
i386         buildonly-randconfig-002-20240706   clang-18
i386         buildonly-randconfig-003-20240705   gcc-11
i386         buildonly-randconfig-003-20240706   clang-18
i386         buildonly-randconfig-004-20240705   clang-18
i386         buildonly-randconfig-004-20240706   clang-18
i386         buildonly-randconfig-005-20240705   clang-18
i386         buildonly-randconfig-005-20240706   clang-18
i386         buildonly-randconfig-006-20240705   clang-18
i386         buildonly-randconfig-006-20240706   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240705   gcc-13
i386                  randconfig-001-20240706   clang-18
i386                  randconfig-002-20240705   clang-18
i386                  randconfig-002-20240706   clang-18
i386                  randconfig-003-20240705   gcc-11
i386                  randconfig-003-20240706   clang-18
i386                  randconfig-004-20240705   gcc-13
i386                  randconfig-004-20240706   clang-18
i386                  randconfig-005-20240705   clang-18
i386                  randconfig-005-20240706   clang-18
i386                  randconfig-006-20240705   clang-18
i386                  randconfig-006-20240706   clang-18
i386                  randconfig-011-20240705   gcc-13
i386                  randconfig-011-20240706   clang-18
i386                  randconfig-012-20240705   gcc-13
i386                  randconfig-012-20240706   clang-18
i386                  randconfig-013-20240705   clang-18
i386                  randconfig-013-20240706   clang-18
i386                  randconfig-014-20240705   gcc-8
i386                  randconfig-014-20240706   clang-18
i386                  randconfig-015-20240705   gcc-10
i386                  randconfig-015-20240706   clang-18
i386                  randconfig-016-20240705   clang-18
i386                  randconfig-016-20240706   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240706   gcc-13.2.0
loongarch             randconfig-002-20240706   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                          amiga_defconfig   gcc-13.2.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ci20_defconfig   gcc-13.2.0
mips                     loongson1b_defconfig   gcc-13.2.0
mips                          malta_defconfig   gcc-13.2.0
mips                       rbtx49xx_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240706   gcc-13.2.0
nios2                 randconfig-002-20240706   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240706   gcc-13.2.0
parisc                randconfig-002-20240706   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-13.2.0
powerpc                  mpc866_ads_defconfig   gcc-13.2.0
powerpc                  mpc885_ads_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240706   gcc-13.2.0
powerpc               randconfig-002-20240706   gcc-13.2.0
powerpc                     sequoia_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240706   gcc-13.2.0
powerpc64             randconfig-002-20240706   gcc-13.2.0
powerpc64             randconfig-003-20240706   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240706   gcc-13.2.0
riscv                 randconfig-002-20240706   gcc-13.2.0
s390                             alldefconfig   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240706   gcc-13.2.0
s390                  randconfig-002-20240706   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                ecovec24-romimage_defconfig   gcc-13.2.0
sh                          r7785rp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240706   gcc-13.2.0
sh                    randconfig-002-20240706   gcc-13.2.0
sh                           se7722_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240706   gcc-13.2.0
sparc64               randconfig-002-20240706   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240706   gcc-13.2.0
um                    randconfig-002-20240706   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240706   clang-18
x86_64       buildonly-randconfig-002-20240706   clang-18
x86_64       buildonly-randconfig-003-20240706   clang-18
x86_64       buildonly-randconfig-004-20240706   clang-18
x86_64       buildonly-randconfig-005-20240706   clang-18
x86_64       buildonly-randconfig-006-20240706   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240706   clang-18
x86_64                randconfig-002-20240706   clang-18
x86_64                randconfig-003-20240706   clang-18
x86_64                randconfig-004-20240706   clang-18
x86_64                randconfig-005-20240706   clang-18
x86_64                randconfig-006-20240706   clang-18
x86_64                randconfig-011-20240706   clang-18
x86_64                randconfig-012-20240706   clang-18
x86_64                randconfig-013-20240706   clang-18
x86_64                randconfig-014-20240706   clang-18
x86_64                randconfig-015-20240706   clang-18
x86_64                randconfig-016-20240706   clang-18
x86_64                randconfig-071-20240706   clang-18
x86_64                randconfig-072-20240706   clang-18
x86_64                randconfig-073-20240706   clang-18
x86_64                randconfig-074-20240706   clang-18
x86_64                randconfig-075-20240706   clang-18
x86_64                randconfig-076-20240706   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0
xtensa                generic_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240706   gcc-13.2.0
xtensa                randconfig-002-20240706   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
