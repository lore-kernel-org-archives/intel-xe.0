Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31BCCCFA18
	for <intel-xe@archiver.kernel.org>; Sun,  9 Nov 2025 01:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709B510E05F;
	Sun,  9 Nov 2025 01:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTVQldfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7AB10E05F
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Nov 2025 01:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762653563; x=1794189563;
 h=date:from:to:cc:subject:message-id;
 bh=TRXjBjIosOaLL64Hj/HdHfp2MyoGsqx0LXgz/ysgjec=;
 b=DTVQldfF/PMP3ebCjW7wzf+N5sElETpSx5XZOJjimfLNDiL6ZsC83ni5
 0OzQfDFDPNXZXaFxstwR5nLCDzNlICKFRmwqPteiIr2bV0Ikp1RY7RvKT
 xa4e82vGOJ66ltGvHo2FjTwQP1DFdJ427m8cD5tdwrYdrpd92HEtWqk6I
 0d78L44EBjjeG4kKv2ZvDZnOfVpGKarXWYgJeZTbAcrjkh9o6BEGh9f+o
 TTtWd+o4z3GyKLbgpRMS9ifideCJg6bUoSWPoloxDcpVcit0AiaaVAeau
 mBoy/BQeWs9umqFV4lGi9Xtzl0aPpJAm7yuXQRUpdDo324EXHvwiUjRo2 g==;
X-CSE-ConnectionGUID: 4llsiU56Qvqxa8UvG0tlrg==
X-CSE-MsgGUID: 3D70+K3vRKq/S4R27AcKhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="87383445"
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; d="scan'208";a="87383445"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2025 17:59:23 -0800
X-CSE-ConnectionGUID: 70z5hNe5Rz+qf+OAXoA4jA==
X-CSE-MsgGUID: LX0EPBgzT7mGyJ0wAMX/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; d="scan'208";a="188206597"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 08 Nov 2025 17:59:22 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vHui7-0001g1-2z;
 Sun, 09 Nov 2025 01:59:19 +0000
Date: Sun, 09 Nov 2025 09:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 a46768ef5f91f2029a67513f43658dfa5451be4a
Message-ID: <202511090942.pPCTFEvb-lkp@intel.com>
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
branch HEAD: a46768ef5f91f2029a67513f43658dfa5451be4a  drm/xe/tests: Add KUnit tests for PF fair provisioning

elapsed time: 1858m

configs tested: 100
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251108    gcc-12.5.0
arc                   randconfig-002-20251108    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                       imx_v4_v5_defconfig    clang-22
arm                         lpc32xx_defconfig    clang-17
arm                       omap2plus_defconfig    gcc-15.1.0
arm                             pxa_defconfig    gcc-15.1.0
arm                   randconfig-001-20251108    gcc-14.3.0
arm                   randconfig-002-20251108    gcc-15.1.0
arm                   randconfig-003-20251108    clang-22
arm                   randconfig-004-20251108    gcc-10.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251109    gcc-15.1.0
arm64                 randconfig-002-20251109    gcc-12.5.0
arm64                 randconfig-003-20251109    clang-19
arm64                 randconfig-004-20251109    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251109    gcc-14.3.0
csky                  randconfig-002-20251109    gcc-11.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251108    clang-22
hexagon               randconfig-002-20251108    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251109    gcc-14
i386        buildonly-randconfig-002-20251109    gcc-13
i386                                defconfig    clang-20
i386                  randconfig-001-20251109    clang-20
i386                  randconfig-002-20251109    gcc-14
i386                  randconfig-003-20251109    clang-20
i386                  randconfig-004-20251109    clang-20
i386                  randconfig-005-20251109    gcc-14
i386                  randconfig-006-20251109    clang-20
i386                  randconfig-007-20251109    clang-20
i386                  randconfig-011-20251109    clang-20
i386                  randconfig-012-20251109    clang-20
i386                  randconfig-013-20251109    gcc-14
i386                  randconfig-014-20251109    gcc-14
i386                  randconfig-015-20251109    gcc-12
i386                  randconfig-016-20251109    gcc-14
i386                  randconfig-017-20251109    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251108    gcc-12.5.0
loongarch             randconfig-002-20251108    gcc-12.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            alldefconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251108    gcc-8.5.0
nios2                 randconfig-002-20251108    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251108    gcc-8.5.0
parisc                randconfig-002-20251108    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251108    gcc-8.5.0
powerpc               randconfig-002-20251108    gcc-9.5.0
powerpc64             randconfig-001-20251108    gcc-8.5.0
powerpc64             randconfig-002-20251108    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251108    gcc-14.3.0
sparc                 randconfig-002-20251108    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251108    clang-20
sparc64               randconfig-002-20251108    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251108    gcc-14
um                    randconfig-002-20251108    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-002-20251109    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-073-20251109    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251108    gcc-8.5.0
xtensa                randconfig-002-20251108    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
