Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFF21099B52
	for <intel-xe@archiver.kernel.org>; Sat, 21 Mar 2026 00:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B99F10E114;
	Sat, 21 Mar 2026 00:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZqY4CCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD6810E114
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Mar 2026 00:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774052448; x=1805588448;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=9Y1BgMOHssuEW0AQQCMjM26BH++Z9z1eK0zs802eAtA=;
 b=kZqY4CCyWNW80zW66aoW2kppW59K7b8CjUc6dGCg2N/qr0EJHAseNUwV
 EAqGTXTaZpU8J9Db1cZcz3amB6oc0tf+HLDX4S1ySKDTGLdTnA1Wxvkd0
 TLt1y9RFfsg0Ybic4uXVKm82FCBR0JQdQtydZgj42YHPRDgs66z7qui6I
 6EPAZza2/+nhjaXgivYFVXWt7PIltX0OI1wqFa33JHHu0eQH9MKYmm2Sz
 C7tsdeG8Lx9cN60wMmNRzjj/tlkZEUWc9DQrmgiPoFrML3UsFojaMxxT6
 tfcdj2evC7q/sog4008Gc1D9ycvHxLKP0g+UC4Nb4PCsd5BxX5RkvYKN2 w==;
X-CSE-ConnectionGUID: E8Dy49BdTEKReakcU4B5AQ==
X-CSE-MsgGUID: Z0T/itZSTk+44otswo0xEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75263936"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; d="scan'208";a="75263936"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 17:20:47 -0700
X-CSE-ConnectionGUID: zWMQUtytR0WfICIyc07wdw==
X-CSE-MsgGUID: 4hnEmbKXRYSecJtfHv+r6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; d="scan'208";a="223648557"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 20 Mar 2026 17:20:46 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w3k55-0000000004x-2IMH;
 Sat, 21 Mar 2026 00:20:43 +0000
Date: Sat, 21 Mar 2026 08:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 65d046b2d8e0d6d855379a981869005fd6b6a41b
Message-ID: <202603210849.Q2rI4h8F-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 65d046b2d8e0d6d855379a981869005fd6b6a41b  drm/xe: Fix missing runtime PM reference in ccs_mode_store

elapsed time: 1649m

configs tested: 116
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260321    gcc-14.3.0
arc                   randconfig-002-20260321    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260321    gcc-12.5.0
arm                   randconfig-002-20260321    clang-23
arm                   randconfig-003-20260321    clang-23
arm                   randconfig-004-20260321    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260321    clang-23
arm64                 randconfig-002-20260321    clang-23
arm64                 randconfig-003-20260321    gcc-9.5.0
arm64                 randconfig-004-20260321    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260321    gcc-15.2.0
csky                  randconfig-002-20260321    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260321    clang-23
hexagon               randconfig-002-20260321    clang-23
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260321    gcc-15.2.0
loongarch             randconfig-002-20260321    clang-20
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260321    gcc-8.5.0
nios2                 randconfig-002-20260321    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                 simple_smp_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260321    gcc-8.5.0
parisc                randconfig-002-20260321    gcc-9.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260321    clang-23
powerpc               randconfig-002-20260321    clang-23
powerpc64             randconfig-001-20260321    clang-23
powerpc64             randconfig-002-20260321    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260321    gcc-15.2.0
riscv                 randconfig-002-20260321    clang-18
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260321    gcc-15.2.0
s390                  randconfig-002-20260321    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260321    gcc-15.2.0
sh                    randconfig-002-20260321    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260321    gcc-15.2.0
sparc                 randconfig-002-20260321    gcc-14.3.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260321    clang-23
sparc64               randconfig-002-20260321    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260321    gcc-14
um                    randconfig-002-20260321    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260321    clang-20
x86_64      buildonly-randconfig-002-20260321    gcc-13
x86_64      buildonly-randconfig-003-20260321    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20260321    gcc-13
x86_64                randconfig-012-20260321    gcc-14
x86_64                randconfig-013-20260321    clang-20
x86_64                randconfig-014-20260321    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260321    gcc-8.5.0
xtensa                randconfig-002-20260321    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
