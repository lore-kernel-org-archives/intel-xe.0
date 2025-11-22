Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC75CFC533
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 13:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4024B10E02F;
	Sat, 22 Nov 2025 13:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARqe8m/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0263410E02F
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 13:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763816982; x=1795352982;
 h=date:from:to:cc:subject:message-id;
 bh=qqi1BI9JHG9x7ipqRxuWU7NImAKm1St/bpNVAsKTr/M=;
 b=ARqe8m/oUXKdXpCAObqZ2UGd0Gln+Jip9J1tYbNFYXHYKsenXEBkyvqF
 TnHPizHeJ5GPIs44oDb5NvDtWDF8o9EmXluFhTWKpgNrEpV5uaa4Pkuii
 qZjQiL5RoIYP0i7WgknxDclmP+71CufOtAE9yrRfHx4KzgsCTUAgtXfRq
 lg27nkKgFN5gVNmT/QyWwc8jX6ABNpF2fQqMMoJ36JTINEBMGHnr5+8Il
 MA0uxbOxEwZsMYjrXCzG5YgBbh1vM+W11B1s0LTjCEmKcBzOJ/AGLsHYu
 VMdg1um9Pvl1jGUNvK7IQYSlQbBvEg9/tCIco3vw78IoIWicoZ+0JyO+n w==;
X-CSE-ConnectionGUID: +pDn/GjQTe2Cwz/G9YLIqg==
X-CSE-MsgGUID: eRjT/IFJQ9ecUY1bJ5RWkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65931569"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="65931569"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 05:09:42 -0800
X-CSE-ConnectionGUID: yyX1tqhYSKGv7R+TFnucBw==
X-CSE-MsgGUID: v0Bvhhy2ShWw2VuN03sYKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="196861215"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 22 Nov 2025 05:09:40 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vMnMw-0007WZ-1b;
 Sat, 22 Nov 2025 13:09:38 +0000
Date: Sat, 22 Nov 2025 21:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 5b38c22687d9287d85dd3bef2fa708bf62cf3895
Message-ID: <202511222121.wahE8jUa-lkp@intel.com>
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
branch HEAD: 5b38c22687d9287d85dd3bef2fa708bf62cf3895  drm/xe/irq: Handle msix vector0 interrupt

elapsed time: 1850m

configs tested: 115
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                        nsimosci_defconfig    gcc-15.1.0
arc                   randconfig-001-20251122    gcc-14.3.0
arc                   randconfig-002-20251122    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                          pxa910_defconfig    gcc-15.1.0
arm                   randconfig-001-20251122    clang-22
arm                   randconfig-002-20251122    clang-22
arm                   randconfig-003-20251122    clang-22
arm                   randconfig-004-20251122    gcc-12.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251122    gcc-8.5.0
arm64                 randconfig-002-20251122    gcc-9.5.0
arm64                 randconfig-003-20251122    gcc-10.5.0
arm64                 randconfig-004-20251122    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251122    gcc-15.1.0
csky                  randconfig-002-20251122    gcc-14.3.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251122    clang-22
hexagon               randconfig-002-20251122    clang-17
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251122    clang-20
i386        buildonly-randconfig-002-20251122    clang-20
i386        buildonly-randconfig-003-20251122    gcc-14
i386        buildonly-randconfig-004-20251122    clang-20
i386        buildonly-randconfig-005-20251122    clang-20
i386        buildonly-randconfig-006-20251122    clang-20
i386                  randconfig-001-20251122    clang-20
i386                  randconfig-002-20251122    gcc-13
i386                  randconfig-003-20251122    clang-20
i386                  randconfig-004-20251122    clang-20
i386                  randconfig-005-20251122    clang-20
i386                  randconfig-006-20251122    clang-20
i386                  randconfig-007-20251122    clang-20
i386                  randconfig-011-20251122    gcc-14
i386                  randconfig-012-20251122    clang-20
i386                  randconfig-013-20251122    clang-20
i386                  randconfig-014-20251122    gcc-14
i386                  randconfig-015-20251122    clang-20
i386                  randconfig-016-20251122    gcc-12
i386                  randconfig-017-20251122    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251122    gcc-12.5.0
loongarch             randconfig-002-20251122    gcc-14.3.0
m68k                              allnoconfig    gcc-15.1.0
m68k                          amiga_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251122    gcc-11.5.0
nios2                 randconfig-002-20251122    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251122    gcc-14.3.0
parisc                randconfig-002-20251122    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 mpc836x_rdk_defconfig    clang-22
powerpc               randconfig-001-20251122    clang-16
powerpc               randconfig-002-20251122    gcc-11.5.0
powerpc64             randconfig-001-20251122    clang-17
powerpc64             randconfig-002-20251122    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251122    clang-22
riscv                 randconfig-002-20251122    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251122    clang-16
s390                  randconfig-002-20251122    gcc-13.4.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251122    gcc-15.1.0
sh                           se7750_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251122    gcc-13.4.0
sparc                 randconfig-002-20251122    gcc-11.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251122    gcc-13.4.0
sparc64               randconfig-002-20251122    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251122    clang-22
um                    randconfig-002-20251122    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251122    gcc-14
x86_64      buildonly-randconfig-002-20251122    gcc-14
x86_64      buildonly-randconfig-003-20251122    gcc-14
x86_64      buildonly-randconfig-004-20251122    clang-20
x86_64      buildonly-randconfig-005-20251122    gcc-14
x86_64      buildonly-randconfig-006-20251122    gcc-13
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251122    gcc-14
x86_64                randconfig-072-20251122    gcc-14
x86_64                randconfig-073-20251122    clang-20
x86_64                randconfig-074-20251122    gcc-14
x86_64                randconfig-075-20251122    clang-20
x86_64                randconfig-076-20251122    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251122    gcc-12.5.0
xtensa                randconfig-002-20251122    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
