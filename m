Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A7EC02198
	for <intel-xe@archiver.kernel.org>; Sat,  8 Feb 2025 18:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8589B10E002;
	Sat,  8 Feb 2025 18:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkRzTuXe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E0F10E002
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Feb 2025 18:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739038423; x=1770574423;
 h=date:from:to:cc:subject:message-id;
 bh=Y9psm5DSmoHEiM31HaT2gsW8HK1NjvV8j9JOSXdGeZE=;
 b=EkRzTuXeKwPgUvKVtpAAt6c7suyfUB/GE7HlyM/bvVi56i9sjy7KIup0
 kNSjN3ZuRltoWyr/YCIIMrQLl4UsD+uwE5NSlVoDcG19eo/jbGl/0aO2D
 iVdVe7LwPcoe6CSdIX9cttP9zD5nCtvSIFUcrC1CmYg1WdKwQpa14HZ+7
 Ugm24Ie5iub4+hXjY+Tw8L47LfPuUnoqVOiL7LDnk92bm5igfTGDGkQ03
 OMVjtAr0uVZxBj7XchhABEyosSMdQaEEM4R919RJy22+uYxWtiHyQMnPI
 sGcb7kr+FR23fKVe3XPU6NPtYKe41CgsAIyLJhNFupQF191QdfC6AzbKb Q==;
X-CSE-ConnectionGUID: Mnew9TB7Qfu5hsRJ5v7w1g==
X-CSE-MsgGUID: ju8PWq0gSEOoyz1k+aXtqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39554529"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; d="scan'208";a="39554529"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2025 10:13:42 -0800
X-CSE-ConnectionGUID: LcEla59XQOmi4v9YazCkYg==
X-CSE-MsgGUID: ZZE7pBaxRVOPpgJNXazNCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; d="scan'208";a="142676174"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 08 Feb 2025 10:13:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tgpKk-0010Ti-1d;
 Sat, 08 Feb 2025 18:13:38 +0000
Date: Sun, 09 Feb 2025 02:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 6bb05b3631bd81227298b291b651dc7ec6ee0145
Message-ID: <202502090234.SMJ9dnkA-lkp@intel.com>
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
branch HEAD: 6bb05b3631bd81227298b291b651dc7ec6ee0145  drm/xe: Enable SR-IOV for PTL

elapsed time: 1445m

configs tested: 190
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250208    gcc-13.2.0
arc                   randconfig-002-20250208    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-21
arm                   randconfig-001-20250208    gcc-13.2.0
arm                   randconfig-001-20250208    gcc-14.2.0
arm                   randconfig-002-20250208    clang-17
arm                   randconfig-002-20250208    gcc-13.2.0
arm                   randconfig-003-20250208    clang-21
arm                   randconfig-003-20250208    gcc-13.2.0
arm                   randconfig-004-20250208    gcc-13.2.0
arm                   randconfig-004-20250208    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250208    clang-21
arm64                 randconfig-001-20250208    gcc-13.2.0
arm64                 randconfig-002-20250208    clang-21
arm64                 randconfig-002-20250208    gcc-13.2.0
arm64                 randconfig-003-20250208    clang-21
arm64                 randconfig-003-20250208    gcc-13.2.0
arm64                 randconfig-004-20250208    clang-15
arm64                 randconfig-004-20250208    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250208    gcc-14.2.0
csky                  randconfig-002-20250208    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250208    clang-21
hexagon               randconfig-002-20250208    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250208    gcc-11
i386        buildonly-randconfig-002-20250208    clang-19
i386        buildonly-randconfig-002-20250208    gcc-11
i386        buildonly-randconfig-003-20250208    gcc-11
i386        buildonly-randconfig-003-20250208    gcc-12
i386        buildonly-randconfig-004-20250208    clang-19
i386        buildonly-randconfig-004-20250208    gcc-11
i386        buildonly-randconfig-005-20250208    clang-19
i386        buildonly-randconfig-005-20250208    gcc-11
i386        buildonly-randconfig-006-20250208    gcc-11
i386        buildonly-randconfig-006-20250208    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250208    clang-19
i386                  randconfig-002-20250208    clang-19
i386                  randconfig-003-20250208    clang-19
i386                  randconfig-004-20250208    clang-19
i386                  randconfig-005-20250208    clang-19
i386                  randconfig-006-20250208    clang-19
i386                  randconfig-007-20250208    clang-19
i386                  randconfig-011-20250208    gcc-12
i386                  randconfig-012-20250208    gcc-12
i386                  randconfig-013-20250208    gcc-12
i386                  randconfig-014-20250208    gcc-12
i386                  randconfig-015-20250208    gcc-12
i386                  randconfig-016-20250208    gcc-12
i386                  randconfig-017-20250208    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250208    gcc-14.2.0
loongarch             randconfig-002-20250208    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250208    gcc-14.2.0
nios2                 randconfig-002-20250208    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250208    gcc-14.2.0
parisc                randconfig-002-20250208    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    clang-21
powerpc                   lite5200b_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    gcc-14.2.0
powerpc                  mpc866_ads_defconfig    clang-21
powerpc               randconfig-001-20250208    clang-19
powerpc               randconfig-002-20250208    clang-17
powerpc               randconfig-003-20250208    gcc-14.2.0
powerpc                     tqm5200_defconfig    clang-21
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-21
powerpc64             randconfig-001-20250208    clang-21
powerpc64             randconfig-002-20250208    gcc-14.2.0
powerpc64             randconfig-003-20250208    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250208    gcc-14.2.0
riscv                 randconfig-002-20250208    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250208    gcc-14.2.0
s390                  randconfig-002-20250208    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250208    gcc-14.2.0
sh                    randconfig-002-20250208    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.2.0
sh                          urquell_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250208    gcc-14.2.0
sparc                 randconfig-002-20250208    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250208    gcc-14.2.0
sparc64               randconfig-002-20250208    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250208    gcc-14.2.0
um                    randconfig-002-20250208    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250208    clang-19
x86_64      buildonly-randconfig-002-20250208    clang-19
x86_64      buildonly-randconfig-002-20250208    gcc-12
x86_64      buildonly-randconfig-003-20250208    clang-19
x86_64      buildonly-randconfig-003-20250208    gcc-12
x86_64      buildonly-randconfig-004-20250208    clang-19
x86_64      buildonly-randconfig-005-20250208    clang-19
x86_64      buildonly-randconfig-006-20250208    clang-19
x86_64      buildonly-randconfig-006-20250208    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250208    clang-19
x86_64                randconfig-002-20250208    clang-19
x86_64                randconfig-003-20250208    clang-19
x86_64                randconfig-004-20250208    clang-19
x86_64                randconfig-005-20250208    clang-19
x86_64                randconfig-006-20250208    clang-19
x86_64                randconfig-007-20250208    clang-19
x86_64                randconfig-008-20250208    clang-19
x86_64                randconfig-071-20250208    gcc-12
x86_64                randconfig-072-20250208    gcc-12
x86_64                randconfig-073-20250208    gcc-12
x86_64                randconfig-074-20250208    gcc-12
x86_64                randconfig-075-20250208    gcc-12
x86_64                randconfig-076-20250208    gcc-12
x86_64                randconfig-077-20250208    gcc-12
x86_64                randconfig-078-20250208    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250208    gcc-14.2.0
xtensa                randconfig-002-20250208    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
