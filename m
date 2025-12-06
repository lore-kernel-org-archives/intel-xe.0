Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6B6D3B7DB
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 17:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F28310E0BD;
	Sat,  6 Dec 2025 17:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bf+5Zv0Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F9410E0BD
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 17:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765043936; x=1796579936;
 h=date:from:to:cc:subject:message-id;
 bh=dDWFvXoZIsepW5j8LpoTXfC6TlfhZ4djiNrlcD0brco=;
 b=bf+5Zv0Q24ZdzaL1Lgg2hlm2U9Tvvm2YjvffEghRgTgZDk/hGd9JfOfq
 pt1T3OJYSAupEr2PMAMdOmSC8zu8s6pH+EgerOpPYDsAm+3wGa+35l59x
 iJJzvCmdSKW4APgXB/hgBwP/b63Vbldyv8wJHnvgQ0hPjr70faKhMSKv7
 79zfB/WjKgueUeTqi60kea8G6UJJFnmSRjWSoo6k+Zjiw6NcWxwPoX4ft
 LNOQAJASGjj8HG7DxTW82q5CzwU6W8n8i4l42fZMYSu8z7EQ8/E56nAZK
 bSL3kLIPGjmGHXjobGEryTX7/Qi1Uyd6lYuXxivn8NMEaKM/ZqE1zkGN2 Q==;
X-CSE-ConnectionGUID: jIjPA8N2RPCWEIPyn+xNOg==
X-CSE-MsgGUID: 6lS24YIiRPulpgcbxFY2Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66937224"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="66937224"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 09:58:56 -0800
X-CSE-ConnectionGUID: dfTlMAz+QTqQJg2eD8UuYg==
X-CSE-MsgGUID: VRr/ujWAQF2PNySnC/E+lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="195636238"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 06 Dec 2025 09:58:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vRwYV-00000000IeH-3Qxp;
 Sat, 06 Dec 2025 17:58:51 +0000
Date: Sun, 07 Dec 2025 01:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 da33e457f6803dc48b2b74f8ade75c14624d85ca
Message-ID: <202512070106.7PaMbhcS-lkp@intel.com>
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
branch HEAD: da33e457f6803dc48b2b74f8ade75c14624d85ca  drm/xe/guc_ct: Assert on credits mismatch during runtime suspend

elapsed time: 1480m

configs tested: 104
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251206    gcc-8.5.0
arc                   randconfig-002-20251206    gcc-14.3.0
arm                                 defconfig    clang-22
arm                           h3600_defconfig    gcc-15.1.0
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20251206    clang-22
arm                   randconfig-002-20251206    clang-22
arm                   randconfig-003-20251206    clang-16
arm                   randconfig-004-20251206    clang-20
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251206    gcc-8.5.0
arm64                 randconfig-002-20251206    clang-22
arm64                 randconfig-003-20251206    clang-22
arm64                 randconfig-004-20251206    gcc-8.5.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251206    gcc-15.1.0
csky                  randconfig-002-20251206    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251206    clang-16
hexagon               randconfig-002-20251206    clang-22
i386                             allmodconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251206    gcc-14
i386        buildonly-randconfig-002-20251206    gcc-14
i386        buildonly-randconfig-003-20251206    clang-20
i386        buildonly-randconfig-004-20251206    clang-20
i386        buildonly-randconfig-005-20251206    clang-20
i386        buildonly-randconfig-006-20251206    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251206    clang-20
i386                  randconfig-003-20251206    gcc-14
i386                  randconfig-004-20251206    gcc-14
i386                  randconfig-005-20251206    clang-20
i386                  randconfig-007-20251206    gcc-14
i386                  randconfig-012-20251206    gcc-14
i386                  randconfig-013-20251206    gcc-14
i386                  randconfig-015-20251206    clang-20
i386                  randconfig-016-20251206    gcc-14
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251206    gcc-15.1.0
loongarch             randconfig-002-20251206    gcc-12.5.0
m68k                                defconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251206    gcc-8.5.0
nios2                 randconfig-002-20251206    gcc-8.5.0
openrisc                            defconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251206    gcc-11.5.0
parisc                randconfig-002-20251206    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20251206    gcc-11.5.0
powerpc               randconfig-002-20251206    clang-22
powerpc64             randconfig-001-20251206    gcc-15.1.0
powerpc64             randconfig-002-20251206    clang-22
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251206    clang-22
riscv                 randconfig-002-20251206    clang-19
s390                  randconfig-001-20251206    clang-22
s390                  randconfig-002-20251206    gcc-8.5.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251206    gcc-15.1.0
sh                    randconfig-002-20251206    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251206    gcc-12.5.0
sparc                 randconfig-002-20251206    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251206    clang-22
sparc64               randconfig-002-20251206    gcc-8.5.0
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251206    gcc-14
um                    randconfig-002-20251206    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251206    clang-20
x86_64      buildonly-randconfig-002-20251206    gcc-14
x86_64      buildonly-randconfig-003-20251206    clang-20
x86_64      buildonly-randconfig-004-20251206    clang-20
x86_64      buildonly-randconfig-005-20251206    gcc-13
x86_64      buildonly-randconfig-006-20251206    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251206    clang-20
x86_64                randconfig-002-20251206    gcc-14
x86_64                randconfig-003-20251206    gcc-14
x86_64                randconfig-004-20251206    gcc-14
x86_64                randconfig-005-20251206    gcc-14
x86_64                randconfig-006-20251206    gcc-14
x86_64                randconfig-071-20251206    clang-20
x86_64                randconfig-072-20251206    clang-20
x86_64                randconfig-073-20251206    gcc-14
x86_64                randconfig-074-20251206    gcc-14
x86_64                randconfig-075-20251206    gcc-14
x86_64                randconfig-076-20251206    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                randconfig-001-20251206    gcc-8.5.0
xtensa                randconfig-002-20251206    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
