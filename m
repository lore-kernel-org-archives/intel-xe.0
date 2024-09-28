Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAEBCF6491
	for <intel-xe@archiver.kernel.org>; Sat, 28 Sep 2024 18:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E2D10E0EA;
	Sat, 28 Sep 2024 18:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bjqHiF++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8D710E241
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Sep 2024 18:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727547148; x=1759083148;
 h=date:from:to:cc:subject:message-id;
 bh=4Eo+DvOYBWuzwY7BEjDFCmEvwKyg5FNeUwbsB2T/p7w=;
 b=bjqHiF++HjdNygPU6MXdXq853w/vJ4yndrRQg5dC1n5YOpQe4U6pMRrF
 DE6Pp5R+9e0iuqmsMDKY6i2Ai4BMEQlCjQMRx9dlY9nzH1hqTSeXar02t
 WTP5HxkG1R2HOE0cFMG0UH2/a6cl1abRsUw4dLd+I3FXkzrg5GR9tR5g+
 nv1oeq/Yk1Vggdzufq+2qX6JhEa7t/9NrgD3U2X+GrIwiYE/uRg5JYrVI
 NPlhuVpUxdtLDHkO4ONS3Ca2agA6QR2xZdYxbmy9bncH+1J8/tJuKInVs
 Tu3iMTuGRcLSkJUrDfHo0d3XU6OdIcnNDFNFbNRdRM7hwaQiF07pyHWVY g==;
X-CSE-ConnectionGUID: jjMl7sB/Q5OBCCgZZRf9QA==
X-CSE-MsgGUID: ux854qzNRpeKEir4cuGkaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26802091"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; d="scan'208";a="26802091"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2024 11:12:28 -0700
X-CSE-ConnectionGUID: JaLYYTNsSXG1KCodxJo8pw==
X-CSE-MsgGUID: oaLeOb49Sg+NL8ZR32lMKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; d="scan'208";a="96187013"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 28 Sep 2024 11:12:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1subvc-000NVz-0L;
 Sat, 28 Sep 2024 18:12:24 +0000
Date: Sun, 29 Sep 2024 02:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 0c8650b09a365f4a31fca1d1d1e9d99c56071128
Message-ID: <202409290220.wX3nhdQh-lkp@intel.com>
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
branch HEAD: 0c8650b09a365f4a31fca1d1d1e9d99c56071128  drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close

elapsed time: 1448m

configs tested: 135
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20240928    gcc-13.2.0
arc                   randconfig-002-20240928    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                            hisi_defconfig    gcc-14.1.0
arm                          moxart_defconfig    gcc-14.1.0
arm                   randconfig-001-20240928    gcc-14.1.0
arm                   randconfig-002-20240928    gcc-14.1.0
arm                   randconfig-003-20240928    clang-20
arm                   randconfig-004-20240928    clang-20
arm                         vf610m4_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240928    gcc-14.1.0
arm64                 randconfig-002-20240928    gcc-14.1.0
arm64                 randconfig-003-20240928    clang-20
arm64                 randconfig-004-20240928    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240928    gcc-14.1.0
csky                  randconfig-002-20240928    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20240928    clang-20
hexagon               randconfig-002-20240928    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20240928    clang-18
i386        buildonly-randconfig-002-20240928    gcc-12
i386        buildonly-randconfig-003-20240928    clang-18
i386        buildonly-randconfig-004-20240928    gcc-12
i386        buildonly-randconfig-005-20240928    gcc-12
i386        buildonly-randconfig-006-20240928    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240928    clang-18
i386                  randconfig-002-20240928    gcc-12
i386                  randconfig-003-20240928    clang-18
i386                  randconfig-004-20240928    clang-18
i386                  randconfig-005-20240928    clang-18
i386                  randconfig-006-20240928    gcc-12
i386                  randconfig-011-20240928    clang-18
i386                  randconfig-012-20240928    gcc-12
i386                  randconfig-013-20240928    clang-18
i386                  randconfig-014-20240928    clang-18
i386                  randconfig-015-20240928    clang-18
i386                  randconfig-016-20240928    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240928    gcc-14.1.0
loongarch             randconfig-002-20240928    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath79_defconfig    gcc-14.1.0
mips                           ip28_defconfig    gcc-14.1.0
mips                        maltaup_defconfig    clang-20
mips                        qi_lb60_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240928    gcc-14.1.0
nios2                 randconfig-002-20240928    gcc-14.1.0
openrisc                         alldefconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20240928    gcc-14.1.0
parisc                randconfig-002-20240928    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                      cm5200_defconfig    clang-20
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc               randconfig-001-20240928    gcc-14.1.0
powerpc               randconfig-002-20240928    gcc-14.1.0
powerpc               randconfig-003-20240928    clang-20
powerpc64             randconfig-001-20240928    clang-20
powerpc64             randconfig-002-20240928    clang-20
powerpc64             randconfig-003-20240928    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                               defconfig    clang-20
riscv                 randconfig-001-20240928    gcc-14.1.0
riscv                 randconfig-002-20240928    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
s390                  randconfig-001-20240928    clang-15
s390                  randconfig-002-20240928    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sh                    randconfig-001-20240928    gcc-14.1.0
sh                    randconfig-002-20240928    gcc-14.1.0
sh                          rsk7201_defconfig    gcc-14.1.0
sh                           se7343_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
sparc64               randconfig-001-20240928    gcc-14.1.0
sparc64               randconfig-002-20240928    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240928    clang-16
um                    randconfig-002-20240928    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20240928    gcc-14.1.0
xtensa                randconfig-002-20240928    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
