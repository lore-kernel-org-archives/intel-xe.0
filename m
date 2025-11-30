Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116D2CFD2F6
	for <intel-xe@archiver.kernel.org>; Sun, 30 Nov 2025 01:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A85D10E23B;
	Sun, 30 Nov 2025 01:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emFSXFQX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DE010E23B
 for <intel-xe@lists.freedesktop.org>; Sun, 30 Nov 2025 01:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764466482; x=1796002482;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=mAI8zCAU88eheSjf/xsF4i59BtbUPd0pV4k4ZGhuJis=;
 b=emFSXFQX6s+DVIEFPqTWUf+H1Ae1Oj9tIccVATe27umzVFuOT66KWYNu
 Ml7LlKRngG9CcJROY9RKvzhK6dk6pwfpol+S+tEjyfQ8d4de9TPvRd/py
 YLfEoaU1GG6etsLyPzriVESjONWn8cge6BV3kXtsiCUJ1e4GfkgCi9TPU
 YibBjM86G9ipkD1X1IyxxR/Qnx081/6+nFK+dmQBIzPCC1VF4SgLb7ofO
 +yBYhtfQAYYj4DgC7B/X/9jJIwq9ijduvjcU+JGlB58beb7/rwMtLkJXh
 Lm7zg/bHvUThuf4/i/Ad5nSZwt371Xbhm+ccZZemLGNhfJ9ZHNbq7hVyZ g==;
X-CSE-ConnectionGUID: iAAeSb8DQ72lHlhtd8I5Ig==
X-CSE-MsgGUID: HasCh65WSQGsJKzwDJdEOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="77541171"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="77541171"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 17:34:42 -0800
X-CSE-ConnectionGUID: 5SlkhU88T7q1KpVB8I8UCA==
X-CSE-MsgGUID: IgXmwT3ZR9CpfemFvN92Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="193009263"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 29 Nov 2025 17:34:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vPWKj-000000007iP-2OVS;
 Sun, 30 Nov 2025 01:34:37 +0000
Date: Sun, 30 Nov 2025 09:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Micha=C5=82?= Winiarski" <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 2e38c50ae4929f0b954fee69d428db7121452867
Message-ID: <202511300924.YNc26dM0-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 2e38c50ae4929f0b954fee69d428db7121452867  vfio/xe: Add device specific vfio_pci driver variant for Intel graphics

elapsed time: 1636m

configs tested: 99
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251129    gcc-8.5.0
arc                   randconfig-002-20251129    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20251129    clang-20
arm                   randconfig-002-20251129    gcc-10.5.0
arm                   randconfig-003-20251129    gcc-13.4.0
arm                   randconfig-004-20251129    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                          randconfig-001    gcc-8.5.0
arm64                          randconfig-002    gcc-14.3.0
arm64                          randconfig-003    clang-22
arm64                          randconfig-004    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                           randconfig-001    gcc-10.5.0
csky                           randconfig-002    gcc-10.5.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon                        randconfig-001    clang-17
hexagon                        randconfig-002    clang-22
i386                              allnoconfig    gcc-14
i386                                defconfig    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    clang-18
loongarch                      randconfig-002    gcc-13.4.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251129    gcc-10.5.0
parisc                randconfig-002-20251129    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251129    gcc-8.5.0
powerpc               randconfig-002-20251129    clang-22
powerpc64             randconfig-001-20251129    gcc-8.5.0
powerpc64             randconfig-002-20251129    gcc-13.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-002-20251130    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251130    clang-22
s390                  randconfig-002-20251130    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251130    gcc-14.3.0
sh                    randconfig-002-20251130    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251130    gcc-14.3.0
sparc                 randconfig-002-20251130    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251130    clang-20
sparc64               randconfig-002-20251130    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251130    clang-22
um                    randconfig-002-20251130    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251130    gcc-14
x86_64      buildonly-randconfig-002-20251130    clang-20
x86_64      buildonly-randconfig-003-20251130    gcc-14
x86_64      buildonly-randconfig-004-20251130    gcc-14
x86_64      buildonly-randconfig-005-20251130    gcc-14
x86_64      buildonly-randconfig-006-20251130    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251130    clang-20
x86_64                randconfig-002-20251130    gcc-14
x86_64                randconfig-003-20251130    gcc-14
x86_64                randconfig-004-20251130    gcc-14
x86_64                randconfig-005-20251130    gcc-14
x86_64                randconfig-006-20251130    clang-20
x86_64                randconfig-011-20251130    clang-20
x86_64                randconfig-012-20251130    gcc-14
x86_64                randconfig-013-20251130    gcc-14
x86_64                randconfig-014-20251130    gcc-14
x86_64                randconfig-016-20251130    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251130    gcc-12.5.0
xtensa                randconfig-002-20251130    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
