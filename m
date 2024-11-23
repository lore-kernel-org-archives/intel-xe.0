Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D70D1BDC2
	for <intel-xe@archiver.kernel.org>; Sat, 23 Nov 2024 14:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB25910E095;
	Sat, 23 Nov 2024 14:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="npp2Qj+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E5D10E095
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Nov 2024 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732373216; x=1763909216;
 h=date:from:to:cc:subject:message-id;
 bh=LKp/wssiNB0npRr15A7tSH5bOj76jVdXiDOK9NAWF+o=;
 b=npp2Qj+eemgUf2YNmQG6O5uC4aITmCXoE9RDokCuk7GYZ57z4e+DtFNC
 6gAPt1CGhUG75BSCbPx3ww6rMz84gZyvaC7fCJteMOeaTV3tqCf2U3DJs
 oVpOGWTE7Dm3icxhwaQYQ0cq8N1x4evDEbsJVTRqOchIuBGTkkowFGlmZ
 VMI3GNsAlJBW4DK5TiXIkp83iJ1gU1XltfjMXXAseA77YBPO1zV4YDK1i
 hpqYEh1qa62UkA+mo7FsJOG3KO6/oZ8MUjH1FoOtDbYtkerxg1BtEIyYL
 wJT9I8PD+AH7ztRR4rIGeLVkp+WWShtZnRVAzet3EyGLyhJAySF44qXLi Q==;
X-CSE-ConnectionGUID: cPEBUk7qToSjIKQBMoNnpw==
X-CSE-MsgGUID: t5iJzlm1QziDhBPgNumSwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="32384090"
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; d="scan'208";a="32384090"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2024 06:46:55 -0800
X-CSE-ConnectionGUID: vZ9q1oIRQP+4M8hY9TdSPw==
X-CSE-MsgGUID: 5kdrHfdSQW+8I1ZcsejyHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; d="scan'208";a="91194653"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 23 Nov 2024 06:46:54 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tErPQ-0004gz-0j;
 Sat, 23 Nov 2024 14:46:52 +0000
Date: Sat, 23 Nov 2024 22:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 d77237d345ac4fdce6558605acb84aa7a76dc9a1
Message-ID: <202411232253.4DtiUxob-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: d77237d345ac4fdce6558605acb84aa7a76dc9a1  drm/xe/ptl: Define HuC FW version for PTL

elapsed time: 1042m

configs tested: 158
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                         haps_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241123    gcc-13.2.0
arc                   randconfig-002-20241123    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-20
arm                             mxs_defconfig    clang-20
arm                   randconfig-001-20241123    gcc-14.2.0
arm                   randconfig-002-20241123    clang-20
arm                   randconfig-003-20241123    clang-20
arm                   randconfig-004-20241123    gcc-14.2.0
arm                           sama5_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241123    clang-20
arm64                 randconfig-002-20241123    gcc-14.2.0
arm64                 randconfig-003-20241123    gcc-14.2.0
arm64                 randconfig-004-20241123    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241123    gcc-14.2.0
csky                  randconfig-002-20241123    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241123    clang-20
hexagon               randconfig-002-20241123    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241123    clang-19
i386        buildonly-randconfig-002-20241123    clang-19
i386        buildonly-randconfig-003-20241123    gcc-12
i386        buildonly-randconfig-004-20241123    clang-19
i386        buildonly-randconfig-005-20241123    clang-19
i386        buildonly-randconfig-006-20241123    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241123    clang-19
i386                  randconfig-002-20241123    clang-19
i386                  randconfig-003-20241123    gcc-12
i386                  randconfig-004-20241123    clang-19
i386                  randconfig-005-20241123    clang-19
i386                  randconfig-006-20241123    clang-19
i386                  randconfig-011-20241123    gcc-12
i386                  randconfig-012-20241123    clang-19
i386                  randconfig-013-20241123    gcc-12
i386                  randconfig-014-20241123    gcc-12
i386                  randconfig-015-20241123    clang-19
i386                  randconfig-016-20241123    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241123    gcc-14.2.0
loongarch             randconfig-002-20241123    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241123    gcc-14.2.0
nios2                 randconfig-002-20241123    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20241123    gcc-14.2.0
parisc                randconfig-002-20241123    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241123    gcc-14.2.0
powerpc               randconfig-002-20241123    clang-20
powerpc               randconfig-003-20241123    clang-20
powerpc                     tqm8541_defconfig    clang-15
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241123    gcc-14.2.0
powerpc64             randconfig-002-20241123    clang-20
powerpc64             randconfig-003-20241123    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
riscv                 randconfig-001-20241123    clang-20
riscv                 randconfig-002-20241123    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-20
s390                  randconfig-001-20241123    gcc-14.2.0
s390                  randconfig-002-20241123    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20241123    gcc-14.2.0
sh                    randconfig-002-20241123    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241123    gcc-14.2.0
sparc64               randconfig-002-20241123    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241123    clang-20
um                    randconfig-002-20241123    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241123    gcc-12
x86_64      buildonly-randconfig-002-20241123    gcc-12
x86_64      buildonly-randconfig-003-20241123    gcc-11
x86_64      buildonly-randconfig-004-20241123    gcc-12
x86_64      buildonly-randconfig-005-20241123    gcc-12
x86_64      buildonly-randconfig-006-20241123    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241123    clang-19
x86_64                randconfig-002-20241123    gcc-12
x86_64                randconfig-003-20241123    clang-19
x86_64                randconfig-004-20241123    clang-19
x86_64                randconfig-005-20241123    gcc-12
x86_64                randconfig-006-20241123    clang-19
x86_64                randconfig-011-20241123    gcc-12
x86_64                randconfig-012-20241123    clang-19
x86_64                randconfig-013-20241123    gcc-12
x86_64                randconfig-014-20241123    clang-19
x86_64                randconfig-015-20241123    clang-19
x86_64                randconfig-016-20241123    gcc-12
x86_64                randconfig-071-20241123    clang-19
x86_64                randconfig-072-20241123    clang-19
x86_64                randconfig-073-20241123    gcc-12
x86_64                randconfig-074-20241123    clang-19
x86_64                randconfig-075-20241123    gcc-11
x86_64                randconfig-076-20241123    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241123    gcc-14.2.0
xtensa                randconfig-002-20241123    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
