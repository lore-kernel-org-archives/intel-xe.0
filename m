Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3E2C61DC4
	for <intel-xe@archiver.kernel.org>; Sat, 29 Aug 2026 03:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052D510E061;
	Sat, 29 Aug 2026 03:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTxKXlM5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B2010E061
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Aug 2026 03:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787975389; x=1819511389;
 h=date:from:to:cc:subject:message-id;
 bh=voyfMdTBomm7xD7vvNDsYVosympymhk3FJav8ZsuZ34=;
 b=DTxKXlM5Mxec82+f2DCu4/OuOLFprq/cmaCo3z61kwjcUGK3W+Z5qx1b
 UKVkUIozGU11JXh1+5LyIcl+8UqqPq8cF7cASDrN+NcEYytBUHZgMSvc1
 uRL80OXjAnQG2Vm4c9+aTQ9Dp++bA03SHc2wV0BVo5KExPqbQE/xOBLAq
 EXyv6tBi7/IUrjQNFSS+968LSxPFx8/lgchjVBa3lHyDFKur8ANiyJRKt
 /6ar9pCXMgj2mJ05ZeXTA16WG3wfYrvd36JHWcuSJrNOB2GGshToWlLMl
 YrWyLK9Sc1q6f1jk/QeCwktWHZjpc2wWm7CDjWbuC603LU4+FQVCjv54D w==;
X-CSE-ConnectionGUID: O4QxTDmqQv2oDvHpHDtIHw==
X-CSE-MsgGUID: wsw+H0faQPqh0MfGzKM4Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="106005105"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="106005105"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 20:49:48 -0700
X-CSE-ConnectionGUID: MixHqRjXTIG+0dVL6mMKSw==
X-CSE-MsgGUID: i5Z9Y6geSoqPt5uGf1aqwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="273599668"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 28 Aug 2026 20:49:47 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1x0A4e-00000000CLs-3ZGv;
 Sat, 29 Aug 2026 03:49:44 +0000
Date: Sat, 29 Aug 2026 11:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 6a8789e948c15f6daea4961e73e8ba01016716b2
Message-ID: <202608291125.PXcj0EfJ-lkp@intel.com>
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
branch HEAD: 6a8789e948c15f6daea4961e73e8ba01016716b2  drm/xe: Add debugfs knob to control GPGPU preemption granularity

elapsed time: 737m

configs tested: 83
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-16.1.0
alpha              allyesconfig    gcc-16.1.0
alpha                 defconfig    gcc-16.1.0
arc                allmodconfig    clang-24
arc                 allnoconfig    gcc-16.1.0
arc                allyesconfig    clang-24
arc                   defconfig    gcc-16.1.0
arm                 allnoconfig    gcc-16.1.0
arm                allyesconfig    clang-24
arm                   defconfig    gcc-16.1.0
arm64              allmodconfig    clang-24
arm64               allnoconfig    gcc-16.1.0
arm64                 defconfig    gcc-16.1.0
csky               allmodconfig    gcc-16.1.0
csky                allnoconfig    gcc-16.1.0
csky                  defconfig    gcc-16.1.0
hexagon            allmodconfig    gcc-16.1.0
hexagon             allnoconfig    gcc-16.1.0
hexagon               defconfig    gcc-16.1.0
i386               allmodconfig    clang-22
i386                allnoconfig    gcc-16.1.0
i386               allyesconfig    clang-22
i386                  defconfig    gcc-16.1.0
loongarch          allmodconfig    clang-24
loongarch           allnoconfig    gcc-16.1.0
loongarch             defconfig    clang-24
m68k               allmodconfig    gcc-16.1.0
m68k                allnoconfig    gcc-16.1.0
m68k               allyesconfig    clang-24
m68k                  defconfig    clang-24
microblaze          allnoconfig    gcc-16.1.0
microblaze         allyesconfig    gcc-16.1.0
microblaze            defconfig    clang-24
mips               allmodconfig    gcc-16.1.0
mips                allnoconfig    gcc-16.1.0
mips               allyesconfig    gcc-16.1.0
nios2              allmodconfig    clang-20
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    clang-24
nios2                 defconfig    clang-24
openrisc           allmodconfig    clang-20
openrisc           allmodconfig    gcc-16.1.0
openrisc            allnoconfig    clang-24
parisc             allmodconfig    gcc-16.1.0
parisc              allnoconfig    clang-24
parisc             allyesconfig    clang-17
parisc64              defconfig    clang-24
powerpc            allmodconfig    gcc-16.1.0
powerpc             allnoconfig    clang-24
riscv              allmodconfig    clang-24
riscv               allnoconfig    clang-24
riscv              allyesconfig    clang-24
s390               allmodconfig    clang-17
s390                allnoconfig    clang-24
s390               allyesconfig    gcc-16.1.0
sh                 allmodconfig    gcc-16.1.0
sh                  allnoconfig    clang-24
sh                 allyesconfig    clang-17
sh                    defconfig    gcc-14
sparc               allnoconfig    clang-24
sparc64            allmodconfig    clang-20
sparc64               defconfig    gcc-14
um                 allmodconfig    clang-17
um                  allnoconfig    clang-24
um                 allyesconfig    gcc-16.1.0
um                    defconfig    gcc-14
um               i386_defconfig    gcc-14
um             x86_64_defconfig    gcc-14
x86_64             allmodconfig    clang-22
x86_64              allnoconfig    clang-24
x86_64             allyesconfig    clang-22
x86_64                defconfig    gcc-14
x86_64                    kexec    clang-22
x86_64                 rhel-9.4    clang-22
x86_64             rhel-9.4-bpf    gcc-14
x86_64            rhel-9.4-func    clang-22
x86_64      rhel-9.4-kselftests    clang-22
x86_64           rhel-9.4-kunit    gcc-14
x86_64             rhel-9.4-ltp    gcc-14
x86_64            rhel-9.4-rust    clang-22
xtensa              allnoconfig    clang-24
xtensa             allyesconfig    clang-20
xtensa             allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
