Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98D4CFD376
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 09:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A22D10E544;
	Tue,  2 Dec 2025 09:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MY2Eiq6h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53F810E544
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764667033; x=1796203033;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ZiTw+5q6e9AU6afOCOqN5N/9Kk/HJJOK19s8yhl7rr8=;
 b=MY2Eiq6horgehZ2WEw8kJSncIVNo92pPg7Y+kOs8Hr8cHQJg1Y1Oay47
 yMHrCzfGUCbhBWjd43Hr3Pni/7yItmw34Oq06oQr8X0xZWB1J8ABMm5KJ
 LsMIFm3RSpxRDxa5PLC+XxWdQRJ1m+qh7/7dM+dM24HTcogXyPjiovqso
 FgXIuEb1EW780gWfXmwftZhINnHcH+mWz4N82T/2sMgrHR2qpGnfh4ygK
 SpUZl8uiwpSOLVNnNaQwAP2xDSVt2L27hfGA4fU4JQDfu7Lij5UqfP50R
 N/ZIS05xkM396F9/1rdV5rcqrkKWghyLSgN5v32e4iL1CdzzSh+ImRSQo A==;
X-CSE-ConnectionGUID: 4kTADo8nTjaOP1wj0fPAXg==
X-CSE-MsgGUID: TRHKbva3QOqTeJmoHPP91g==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65813316"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="65813316"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 01:17:13 -0800
X-CSE-ConnectionGUID: iufQc2bbT766ThgsHZ+nhw==
X-CSE-MsgGUID: HkLh9voRTXmk3XxZ0vlg+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="231640690"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 02 Dec 2025 01:17:12 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vQMVR-000000009d3-44mO;
 Tue, 02 Dec 2025 09:17:09 +0000
Date: Tue, 02 Dec 2025 17:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-vfio] BUILD SUCCESS
 1f5556ec8b9efbb784aeb3536e147182dee73d0f
Message-ID: <202512021707.E4fXL3Ag-lkp@intel.com>
User-Agent: s-nail v14.9.25
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-vfio
branch HEAD: 1f5556ec8b9efbb784aeb3536e147182dee73d0f  vfio/xe: Add device specific vfio_pci driver variant for Intel graphics

elapsed time: 1445m

configs tested: 275
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251201    gcc-13.4.0
arc                   randconfig-001-20251202    clang-22
arc                   randconfig-002-20251201    gcc-13.4.0
arc                   randconfig-002-20251202    clang-22
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20251201    clang-22
arm                   randconfig-001-20251202    clang-22
arm                   randconfig-002-20251201    gcc-8.5.0
arm                   randconfig-002-20251202    clang-22
arm                   randconfig-003-20251201    clang-20
arm                   randconfig-003-20251202    clang-22
arm                   randconfig-004-20251201    gcc-15.1.0
arm                   randconfig-004-20251202    clang-22
arm                             rpc_defconfig    gcc-15.1.0
arm                        spear6xx_defconfig    gcc-15.1.0
arm                           sunxi_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251201    gcc-8.5.0
arm64                 randconfig-001-20251202    clang-22
arm64                 randconfig-002-20251201    clang-22
arm64                 randconfig-002-20251202    clang-22
arm64                 randconfig-003-20251201    clang-18
arm64                 randconfig-003-20251202    clang-22
arm64                 randconfig-004-20251201    gcc-14.3.0
arm64                 randconfig-004-20251202    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251201    gcc-15.1.0
csky                  randconfig-001-20251202    clang-22
csky                  randconfig-002-20251201    gcc-14.3.0
csky                  randconfig-002-20251202    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251202    clang-22
hexagon               randconfig-001-20251202    gcc-15.1.0
hexagon               randconfig-002-20251202    clang-22
hexagon               randconfig-002-20251202    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251201    clang-20
i386        buildonly-randconfig-001-20251202    clang-20
i386        buildonly-randconfig-002-20251201    clang-20
i386        buildonly-randconfig-002-20251202    clang-20
i386        buildonly-randconfig-003-20251201    clang-20
i386        buildonly-randconfig-003-20251202    clang-20
i386        buildonly-randconfig-004-20251201    clang-20
i386        buildonly-randconfig-004-20251202    clang-20
i386        buildonly-randconfig-005-20251201    clang-20
i386        buildonly-randconfig-005-20251202    clang-20
i386        buildonly-randconfig-006-20251201    gcc-14
i386        buildonly-randconfig-006-20251202    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251201    gcc-14
i386                  randconfig-001-20251202    gcc-14
i386                  randconfig-002-20251201    clang-20
i386                  randconfig-002-20251202    gcc-14
i386                  randconfig-003-20251201    clang-20
i386                  randconfig-003-20251202    gcc-14
i386                  randconfig-004-20251201    clang-20
i386                  randconfig-004-20251202    gcc-14
i386                  randconfig-005-20251201    gcc-14
i386                  randconfig-005-20251202    gcc-14
i386                  randconfig-006-20251201    gcc-14
i386                  randconfig-006-20251202    gcc-14
i386                  randconfig-007-20251201    clang-20
i386                  randconfig-007-20251202    gcc-14
i386                  randconfig-011-20251202    clang-20
i386                  randconfig-012-20251202    clang-20
i386                  randconfig-013-20251202    clang-20
i386                  randconfig-013-20251202    gcc-14
i386                  randconfig-014-20251202    clang-20
i386                  randconfig-014-20251202    gcc-14
i386                  randconfig-015-20251202    clang-20
i386                  randconfig-015-20251202    gcc-14
i386                  randconfig-016-20251202    clang-20
i386                  randconfig-017-20251202    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251202    gcc-15.1.0
loongarch             randconfig-002-20251202    clang-22
loongarch             randconfig-002-20251202    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251202    gcc-15.1.0
nios2                 randconfig-001-20251202    gcc-8.5.0
nios2                 randconfig-002-20251202    gcc-15.1.0
nios2                 randconfig-002-20251202    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251201    gcc-13.4.0
parisc                randconfig-001-20251202    clang-22
parisc                randconfig-002-20251201    gcc-15.1.0
parisc                randconfig-002-20251202    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251201    gcc-13.4.0
powerpc               randconfig-001-20251202    clang-22
powerpc               randconfig-002-20251201    gcc-10.5.0
powerpc               randconfig-002-20251202    clang-22
powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251201    gcc-14.3.0
powerpc64             randconfig-001-20251202    clang-22
powerpc64             randconfig-002-20251201    gcc-13.4.0
powerpc64             randconfig-002-20251202    clang-22
riscv                            allmodconfig    clang-16
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251202    gcc-9.5.0
riscv                 randconfig-002-20251202    clang-22
riscv                 randconfig-002-20251202    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251202    clang-17
s390                  randconfig-001-20251202    gcc-9.5.0
s390                  randconfig-002-20251202    gcc-13.4.0
s390                  randconfig-002-20251202    gcc-9.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251202    gcc-15.1.0
sh                    randconfig-001-20251202    gcc-9.5.0
sh                    randconfig-002-20251202    gcc-12.5.0
sh                    randconfig-002-20251202    gcc-9.5.0
sh                          sdk7780_defconfig    gcc-15.1.0
sh                            shmin_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251201    gcc-8.5.0
sparc                 randconfig-001-20251202    gcc-14
sparc                 randconfig-002-20251201    gcc-14.3.0
sparc                 randconfig-002-20251202    gcc-14
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251201    clang-22
sparc64               randconfig-001-20251202    gcc-14
sparc64               randconfig-002-20251201    gcc-14.3.0
sparc64               randconfig-002-20251202    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251201    gcc-14
um                    randconfig-001-20251202    gcc-14
um                    randconfig-002-20251201    gcc-14
um                    randconfig-002-20251202    gcc-14
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251202    gcc-14
x86_64      buildonly-randconfig-002-20251202    gcc-14
x86_64      buildonly-randconfig-003-20251202    clang-20
x86_64      buildonly-randconfig-003-20251202    gcc-14
x86_64      buildonly-randconfig-004-20251202    gcc-13
x86_64      buildonly-randconfig-004-20251202    gcc-14
x86_64      buildonly-randconfig-005-20251202    gcc-14
x86_64      buildonly-randconfig-006-20251202    gcc-13
x86_64      buildonly-randconfig-006-20251202    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251202    gcc-14
x86_64                randconfig-002-20251202    gcc-14
x86_64                randconfig-003-20251202    gcc-14
x86_64                randconfig-004-20251202    gcc-14
x86_64                randconfig-005-20251202    gcc-14
x86_64                randconfig-006-20251202    gcc-14
x86_64                randconfig-011-20251201    clang-20
x86_64                randconfig-011-20251202    gcc-13
x86_64                randconfig-012-20251201    gcc-14
x86_64                randconfig-012-20251202    gcc-13
x86_64                randconfig-013-20251201    gcc-14
x86_64                randconfig-013-20251202    gcc-13
x86_64                randconfig-014-20251201    gcc-14
x86_64                randconfig-014-20251202    gcc-13
x86_64                randconfig-015-20251201    clang-20
x86_64                randconfig-015-20251202    gcc-13
x86_64                randconfig-016-20251201    clang-20
x86_64                randconfig-016-20251202    gcc-13
x86_64                randconfig-071-20251202    clang-20
x86_64                randconfig-072-20251202    clang-20
x86_64                randconfig-073-20251202    clang-20
x86_64                randconfig-074-20251202    clang-20
x86_64                randconfig-075-20251202    clang-20
x86_64                randconfig-076-20251202    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251201    gcc-9.5.0
xtensa                randconfig-001-20251202    gcc-14
xtensa                randconfig-002-20251201    gcc-12.5.0
xtensa                randconfig-002-20251202    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
