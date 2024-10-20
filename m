Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36182D3C931
	for <intel-xe@archiver.kernel.org>; Sun, 20 Oct 2024 03:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737E810E1DF;
	Sun, 20 Oct 2024 03:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkA8gDRi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D62310E1DF
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Oct 2024 03:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729393634; x=1760929634;
 h=date:from:to:cc:subject:message-id;
 bh=pGGB6CuTV73h6JT2zCaHktoyl2lrqwrAUC2dROc96x8=;
 b=GkA8gDRiTowieByGLjHFGjiANcg3lJgHfdhgcw4w/y8hov+VTkxB3aMp
 A4ieUcLHkZY0sk9HjWgHQuig1bbdVXWcxrxuRk0dlQA3yYQZhHQ8qk5GQ
 q3cYMXl3UdrJ8zzfY2F4Pg5E3i5ckmeqIegDAXZCYau5yAyNBPDJ4N2Bs
 aZ7hfEq0nSNNO35UC/ucqxdLC/6hN4fjK0c7sSp9zGMQ9gd6sRiJpuv0i
 eowc91VyV0/S7TFgvIqyMwREFbLn5M8ANpVkIXfEOfAJ4UUeBE8S4iWJl
 4r41h9FEnkgiNKh70MJax1GzeQDHciCn77ZjD61gxR+p5eJron1vZIjvD w==;
X-CSE-ConnectionGUID: /wT63TfwQfWOOvnGtclrcQ==
X-CSE-MsgGUID: NgnfXWHpSIuFz33OnV0L0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="29111642"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="29111642"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 20:07:14 -0700
X-CSE-ConnectionGUID: lYJwSe/iSpCxN61JHuEvyQ==
X-CSE-MsgGUID: 2w9lC9xCQWamh0teJt+tEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="110042070"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 19 Oct 2024 20:07:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t2MHd-000PoX-33;
 Sun, 20 Oct 2024 03:07:09 +0000
Date: Sun, 20 Oct 2024 11:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 66426bf9e2c930683a883f82d5a471a778282569
Message-ID: <202410201109.okhszOnU-lkp@intel.com>
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
branch HEAD: 66426bf9e2c930683a883f82d5a471a778282569  drm/xe/ufence: Warn if mmget_not_zero() fails

elapsed time: 2077m

configs tested: 101
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                               allnoconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                        vdk_hs38_defconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                            dove_defconfig    clang-20
arm                          ep93xx_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                             rpc_defconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241020    gcc-12
i386        buildonly-randconfig-002-20241020    gcc-12
i386        buildonly-randconfig-003-20241020    gcc-12
i386        buildonly-randconfig-004-20241020    gcc-12
i386        buildonly-randconfig-005-20241020    gcc-12
i386        buildonly-randconfig-006-20241020    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241020    gcc-12
i386                  randconfig-002-20241020    gcc-12
i386                  randconfig-003-20241020    gcc-12
i386                  randconfig-004-20241020    gcc-12
i386                  randconfig-005-20241020    gcc-12
i386                  randconfig-006-20241020    gcc-12
i386                  randconfig-011-20241020    gcc-12
i386                  randconfig-012-20241020    gcc-12
i386                  randconfig-013-20241020    gcc-12
i386                  randconfig-014-20241020    gcc-12
i386                  randconfig-015-20241020    gcc-12
i386                  randconfig-016-20241020    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          atari_defconfig    clang-20
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                         bigsur_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    clang-20
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                     ep8248e_defconfig    clang-20
powerpc                     tqm8540_defconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                          debug_defconfig    clang-20
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         ap325rxa_defconfig    clang-20
sh                                  defconfig    gcc-12
sh                           se7780_defconfig    clang-20
sh                        sh7763rdp_defconfig    clang-20
sh                              ul2_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
