Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCB3CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0731C10E0E7;
	Thu, 30 Oct 2025 22:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6gpj7hf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1259610E0E7
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863367; x=1793399367;
 h=date:from:to:cc:subject:message-id;
 bh=SFohFXKuVlymbS60TkPoYGHEblRVhpXlL+/4tdEV6zg=;
 b=Z6gpj7hfVvE8eXv5SxcfAxMZmnzGVhrCQZP4nSEAbROWo9kZilhuGaH7
 +rPQekEDdNUgfGLk4xhp2EzmAJKxV02cCHrnnzdVvLg6LLuAygQuN+G4/
 LKYbOvzeaXjOWjECL4r8f720nZmopFz/+VzSte3S58U3E3tsx8Kg4D3o7
 i6VVavUHvpUM+/PNYg4X9PHHsNaKCzMkDwcSXRPL4iCuG+yLz9NjhnQCu
 AdjjZvfsA+fDOUi9y2p6Rds8/sMxQW3bt+HMU8CrOFCLx2esOOj2Wb9do
 gmC9nn/A9XumHYbBT6pRazeMwGWEsoKrU3s5H6qlZh3RI/fm0waQECfm1 A==;
X-CSE-ConnectionGUID: oo+8Js4aTdyIswDFdmcCuA==
X-CSE-MsgGUID: rQiwegR3QniUwg8/gyXQ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75368274"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="75368274"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:29:27 -0700
X-CSE-ConnectionGUID: 0Cp5FGUdRViWLbfuCR9JwQ==
X-CSE-MsgGUID: iA+614UPTf+r+svJKV4T3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="190425707"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2025 15:29:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vEb92-000Ma3-2c;
 Thu, 30 Oct 2025 22:29:24 +0000
Date: Fri, 31 Oct 2025 06:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 b3fbda1a630a9439c885b2a5dc5230cc49a87e9e
Message-ID: <202510310657.pIpKfOFx-lkp@intel.com>
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
branch HEAD: b3fbda1a630a9439c885b2a5dc5230cc49a87e9e  drm/xe: Do not wake device during a GT reset

elapsed time: 1596m

configs tested: 100
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251030    gcc-11.5.0
arc                   randconfig-002-20251030    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                        keystone_defconfig    gcc-15.1.0
arm                   randconfig-001-20251030    gcc-10.5.0
arm                   randconfig-002-20251030    clang-19
arm                   randconfig-003-20251030    clang-22
arm                   randconfig-004-20251030    clang-22
arm64                            alldefconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251030    gcc-12.5.0
arm64                 randconfig-002-20251030    gcc-8.5.0
arm64                 randconfig-003-20251030    clang-17
arm64                 randconfig-004-20251030    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251030    gcc-13.4.0
csky                  randconfig-002-20251030    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251030    clang-22
hexagon               randconfig-002-20251030    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251031    gcc-14
i386        buildonly-randconfig-002-20251031    gcc-14
i386        buildonly-randconfig-003-20251031    clang-20
i386        buildonly-randconfig-004-20251031    gcc-14
i386        buildonly-randconfig-005-20251031    clang-20
i386        buildonly-randconfig-006-20251031    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251030    clang-22
loongarch             randconfig-002-20251030    clang-22
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-22
mips                       bmips_be_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251030    gcc-8.5.0
nios2                 randconfig-002-20251030    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251030    gcc-8.5.0
parisc                randconfig-002-20251030    gcc-8.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    clang-19
powerpc               randconfig-001-20251030    clang-22
powerpc               randconfig-002-20251030    clang-22
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251030    gcc-8.5.0
powerpc64             randconfig-002-20251030    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                    nommu_k210_defconfig    clang-22
riscv                 randconfig-001-20251030    gcc-13.4.0
riscv                 randconfig-002-20251030    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251030    clang-17
s390                  randconfig-002-20251030    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251030    gcc-15.1.0
sh                    randconfig-002-20251030    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251030    gcc-8.5.0
sparc                 randconfig-002-20251030    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251030    gcc-11.5.0
sparc64               randconfig-002-20251030    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251030    gcc-14
um                    randconfig-002-20251030    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251030    clang-20
x86_64      buildonly-randconfig-002-20251030    gcc-14
x86_64      buildonly-randconfig-003-20251030    gcc-13
x86_64      buildonly-randconfig-004-20251030    gcc-14
x86_64      buildonly-randconfig-005-20251030    clang-20
x86_64      buildonly-randconfig-006-20251030    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251031    gcc-14
x86_64                randconfig-012-20251031    clang-20
x86_64                randconfig-013-20251031    gcc-14
x86_64                randconfig-014-20251031    gcc-14
x86_64                randconfig-015-20251031    gcc-14
x86_64                randconfig-016-20251031    clang-20
x86_64                randconfig-071-20251031    gcc-14
x86_64                randconfig-072-20251031    clang-20
x86_64                randconfig-073-20251031    gcc-14
x86_64                randconfig-074-20251031    clang-20
x86_64                randconfig-075-20251031    gcc-14
x86_64                randconfig-076-20251031    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251030    gcc-10.5.0
xtensa                randconfig-002-20251030    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
