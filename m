Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC76EC3DA47
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 10:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDE710EA1E;
	Thu, 11 Jul 2024 10:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nO6BVYkZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1B010EA1E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 10:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720693641; x=1752229641;
 h=date:from:to:cc:subject:message-id;
 bh=WH8dHolGi+BUgdQHr32QB7QFlFipVBgCPVr/RltRFlY=;
 b=nO6BVYkZGzX6KrjXFfK2I6cenZZQlfXYHM19udZ7YLbCjSyhBMQF8tLh
 0ldjfeB8DJBl3ZuhItwmBJdjp0Jhjn1ZixtcUsfs81GPtHNnii7buEwNg
 pr55Cdi3Jqw7ORJH1D3BSMCATQE8EG1/kGVMJqDkDW8V7lvTpR5fctH4o
 zygFVi+Os15ArvJbpuGvUP6CnQvMLCAuenaYM+tP4mERkZ0cVwJ18PhuG
 uNw6V5Nftil6uPF1MtX6GlvLEMtcymOp9hiBsubmwnA48LO0w6r5bQszu
 rv8mFXp7OrFQrnL8DkvFjWVo5kltcfvmO+RqHD5LKLppGcMe3+5qoYON1 A==;
X-CSE-ConnectionGUID: aYdCtOmQQhyUUPrM0PY8Tg==
X-CSE-MsgGUID: y6mB4J9cRY6UORxxZOgLVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="43481899"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="43481899"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 03:27:20 -0700
X-CSE-ConnectionGUID: xJpPgyGwTAqGzqaiDeSQGA==
X-CSE-MsgGUID: rruiRDoIRAOMDAid893dIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48280483"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2024 03:27:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sRr1B-000Z9W-11;
 Thu, 11 Jul 2024 10:27:17 +0000
Date: Thu, 11 Jul 2024 18:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 33891539f9d6f245e93a76e3fb5791338180374f
Message-ID: <202407111821.BzXqb1ih-lkp@intel.com>
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
branch HEAD: 33891539f9d6f245e93a76e3fb5791338180374f  drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal

elapsed time: 1442m

configs tested: 244
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240711   gcc-13.2.0
arc                   randconfig-002-20240711   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.3.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.3.0
arm                       aspeed_g4_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                   milbeaut_m10v_defconfig   gcc-13.2.0
arm                            mps2_defconfig   clang-19
arm                            qcom_defconfig   clang-19
arm                   randconfig-001-20240711   clang-19
arm                   randconfig-001-20240711   gcc-13.2.0
arm                   randconfig-002-20240711   gcc-13.2.0
arm                   randconfig-002-20240711   gcc-13.3.0
arm                   randconfig-003-20240711   clang-19
arm                   randconfig-003-20240711   gcc-13.2.0
arm                   randconfig-004-20240711   gcc-13.2.0
arm                   randconfig-004-20240711   gcc-13.3.0
arm                          sp7021_defconfig   clang-19
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   clang-19
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240711   clang-19
arm64                 randconfig-001-20240711   gcc-13.2.0
arm64                 randconfig-002-20240711   gcc-13.2.0
arm64                 randconfig-003-20240711   gcc-13.2.0
arm64                 randconfig-004-20240711   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240711   gcc-13.2.0
csky                  randconfig-001-20240711   gcc-13.3.0
csky                  randconfig-002-20240711   gcc-13.2.0
csky                  randconfig-002-20240711   gcc-13.3.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240711   clang-19
hexagon               randconfig-002-20240711   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240710   clang-18
i386         buildonly-randconfig-001-20240711   gcc-13
i386         buildonly-randconfig-002-20240710   gcc-13
i386         buildonly-randconfig-002-20240711   gcc-13
i386         buildonly-randconfig-003-20240710   gcc-11
i386         buildonly-randconfig-003-20240711   gcc-13
i386         buildonly-randconfig-004-20240710   gcc-11
i386         buildonly-randconfig-004-20240711   gcc-13
i386         buildonly-randconfig-005-20240710   clang-18
i386         buildonly-randconfig-005-20240711   gcc-13
i386         buildonly-randconfig-006-20240710   clang-18
i386         buildonly-randconfig-006-20240711   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240710   clang-18
i386                  randconfig-001-20240711   gcc-13
i386                  randconfig-002-20240710   gcc-11
i386                  randconfig-002-20240711   gcc-13
i386                  randconfig-003-20240710   gcc-13
i386                  randconfig-003-20240711   gcc-13
i386                  randconfig-004-20240710   clang-18
i386                  randconfig-004-20240711   gcc-13
i386                  randconfig-005-20240710   clang-18
i386                  randconfig-005-20240711   gcc-13
i386                  randconfig-006-20240710   clang-18
i386                  randconfig-006-20240711   gcc-13
i386                  randconfig-011-20240710   gcc-13
i386                  randconfig-011-20240711   gcc-13
i386                  randconfig-012-20240710   gcc-12
i386                  randconfig-012-20240711   gcc-13
i386                  randconfig-013-20240710   gcc-12
i386                  randconfig-013-20240711   gcc-13
i386                  randconfig-014-20240710   gcc-13
i386                  randconfig-014-20240711   gcc-13
i386                  randconfig-015-20240710   gcc-8
i386                  randconfig-015-20240711   gcc-13
i386                  randconfig-016-20240710   clang-18
i386                  randconfig-016-20240711   gcc-13
loongarch                        allmodconfig   gcc-13.3.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240711   gcc-13.2.0
loongarch             randconfig-001-20240711   gcc-13.3.0
loongarch             randconfig-002-20240711   gcc-13.2.0
loongarch             randconfig-002-20240711   gcc-13.3.0
m68k                             allmodconfig   gcc-13.3.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.3.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5249evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.3.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.3.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                         db1xxx_defconfig   clang-19
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240711   gcc-13.2.0
nios2                 randconfig-001-20240711   gcc-13.3.0
nios2                 randconfig-002-20240711   gcc-13.2.0
nios2                 randconfig-002-20240711   gcc-13.3.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.3.0
openrisc                         allyesconfig   gcc-13.3.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.3.0
parisc                            allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.3.0
parisc                           allyesconfig   gcc-13.3.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240711   gcc-13.2.0
parisc                randconfig-001-20240711   gcc-13.3.0
parisc                randconfig-002-20240711   gcc-13.2.0
parisc                randconfig-002-20240711   gcc-13.3.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.3.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.3.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-13.3.0
powerpc                      chrp32_defconfig   gcc-13.2.0
powerpc                       ebony_defconfig   clang-19
powerpc                  mpc866_ads_defconfig   gcc-13.2.0
powerpc                      pcm030_defconfig   gcc-13.2.0
powerpc                         ps3_defconfig   clang-19
powerpc               randconfig-001-20240711   gcc-13.2.0
powerpc               randconfig-001-20240711   gcc-13.3.0
powerpc               randconfig-002-20240711   clang-19
powerpc               randconfig-002-20240711   gcc-13.2.0
powerpc               randconfig-003-20240711   clang-19
powerpc               randconfig-003-20240711   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-13.2.0
powerpc                  storcenter_defconfig   gcc-13.2.0
powerpc                     stx_gp3_defconfig   clang-19
powerpc                         wii_defconfig   clang-19
powerpc64             randconfig-001-20240711   gcc-13.2.0
powerpc64             randconfig-001-20240711   gcc-13.3.0
powerpc64             randconfig-002-20240711   clang-16
powerpc64             randconfig-002-20240711   gcc-13.2.0
powerpc64             randconfig-003-20240711   gcc-13.2.0
powerpc64             randconfig-003-20240711   gcc-13.3.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-13.3.0
riscv                             allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.3.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-13.3.0
riscv                               defconfig   gcc-13.2.0
riscv             nommu_k210_sdcard_defconfig   gcc-13.2.0
riscv                 randconfig-001-20240711   clang-14
riscv                 randconfig-001-20240711   gcc-13.2.0
riscv                 randconfig-002-20240711   gcc-13.2.0
riscv                 randconfig-002-20240711   gcc-13.3.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240711   clang-19
s390                  randconfig-001-20240711   gcc-13.2.0
s390                  randconfig-002-20240711   gcc-13.2.0
sh                               allmodconfig   gcc-13.3.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.3.0
sh                                  defconfig   gcc-13.2.0
sh                          polaris_defconfig   gcc-13.2.0
sh                    randconfig-001-20240711   gcc-13.2.0
sh                    randconfig-001-20240711   gcc-13.3.0
sh                    randconfig-002-20240711   gcc-13.2.0
sh                    randconfig-002-20240711   gcc-13.3.0
sh                           se7751_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.3.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240711   gcc-13.2.0
sparc64               randconfig-001-20240711   gcc-13.3.0
sparc64               randconfig-002-20240711   gcc-13.2.0
sparc64               randconfig-002-20240711   gcc-13.3.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240711   gcc-13.2.0
um                    randconfig-001-20240711   gcc-8
um                    randconfig-002-20240711   gcc-13.2.0
um                    randconfig-002-20240711   gcc-8
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240711   clang-18
x86_64       buildonly-randconfig-002-20240711   clang-18
x86_64       buildonly-randconfig-003-20240711   clang-18
x86_64       buildonly-randconfig-004-20240711   clang-18
x86_64       buildonly-randconfig-005-20240711   clang-18
x86_64       buildonly-randconfig-006-20240711   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240711   clang-18
x86_64                randconfig-002-20240711   clang-18
x86_64                randconfig-003-20240711   clang-18
x86_64                randconfig-004-20240711   clang-18
x86_64                randconfig-005-20240711   clang-18
x86_64                randconfig-006-20240711   clang-18
x86_64                randconfig-011-20240711   clang-18
x86_64                randconfig-012-20240711   clang-18
x86_64                randconfig-013-20240711   clang-18
x86_64                randconfig-014-20240711   clang-18
x86_64                randconfig-015-20240711   clang-18
x86_64                randconfig-016-20240711   clang-18
x86_64                randconfig-071-20240711   clang-18
x86_64                randconfig-072-20240711   clang-18
x86_64                randconfig-073-20240711   clang-18
x86_64                randconfig-074-20240711   clang-18
x86_64                randconfig-075-20240711   clang-18
x86_64                randconfig-076-20240711   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  cadence_csp_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240711   gcc-13.2.0
xtensa                randconfig-001-20240711   gcc-13.3.0
xtensa                randconfig-002-20240711   gcc-13.2.0
xtensa                randconfig-002-20240711   gcc-13.3.0
xtensa                    smp_lx200_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
