Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AE1C61DD9
	for <intel-xe@archiver.kernel.org>; Sun, 30 Aug 2026 13:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B002D10E1BD;
	Sun, 30 Aug 2026 13:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQYQ4iB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690A610E1BD
 for <intel-xe@lists.freedesktop.org>; Sun, 30 Aug 2026 13:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788097722; x=1819633722;
 h=date:from:to:cc:subject:message-id;
 bh=z78Q4VquR3TkcTVQRrr4vfcn7YmUoEkm12y1WOf8Qn4=;
 b=CQYQ4iB5YX8FjdNDWPWgrOSBaqMwMpPXv8ZoEB6mWi+LSxyNHVspX66R
 +vlPkrrjzBUOGHrC1eWR6420myXVPrTTGURWRq06XJNT5wxRPAAdB9TnD
 xvMMef86L0RhMsOn9F3ZaY3ZE4gZKhfixtQOO0t6ZAOZRsz2WhbCXyUbV
 dajDhawF064L7jTjq15mY/wL6FfznHQgI8LPRRcFV3DScz4XsP8O5JleA
 Q7xXhZrtoD/0Y3i9fnd+iQWWt3GW+XkavP8d2U5r8uT09FNcqCvnTKaWQ
 fwL4awoCe3XFbXVdmJ2TvIYIN7GY0AJ5CqtQJrEFqdcNeSbvovtpti8C0 Q==;
X-CSE-ConnectionGUID: 9zej+s9JR0OzcJznSiw7OA==
X-CSE-MsgGUID: 1FXTFvFkRLWJMsZpPXACJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="98860122"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="98860122"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 06:48:41 -0700
X-CSE-ConnectionGUID: V2pjWgb/Sx+Qo7HIbvXZhA==
X-CSE-MsgGUID: 4l6eH//iRI2EvaJGfyGTKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="270506672"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 30 Aug 2026 06:48:39 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1x0ftk-00000000DvQ-4AwZ;
 Sun, 30 Aug 2026 13:48:36 +0000
Date: Sun, 30 Aug 2026 21:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 d3f1b058a77d1754d469ea4eaf43e754d43cdc4c
Message-ID: <202608302146.TBvlHz5j-lkp@intel.com>
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
branch HEAD: d3f1b058a77d1754d469ea4eaf43e754d43cdc4c  drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue GTs

elapsed time: 1174m

configs tested: 179
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-24
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260830    gcc-15.2.0
arc                   randconfig-002-20260830    gcc-15.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    clang-24
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260830    gcc-15.2.0
arm                   randconfig-002-20260830    gcc-15.2.0
arm                   randconfig-003-20260830    gcc-15.2.0
arm                   randconfig-004-20260830    gcc-15.2.0
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260830    gcc-16.1.0
arm64                 randconfig-002-20260830    gcc-16.1.0
arm64                 randconfig-003-20260830    gcc-16.1.0
arm64                 randconfig-004-20260830    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260830    gcc-16.1.0
csky                  randconfig-002-20260830    gcc-16.1.0
hexagon                          allmodconfig    clang-24
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-24
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260830    gcc-13.4.0
hexagon               randconfig-002-20260830    gcc-13.4.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260830    clang-22
i386        buildonly-randconfig-002-20260830    clang-22
i386        buildonly-randconfig-003-20260830    clang-22
i386        buildonly-randconfig-004-20260830    clang-22
i386        buildonly-randconfig-005-20260830    clang-22
i386        buildonly-randconfig-006-20260830    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260830    clang-22
i386                  randconfig-002-20260830    clang-22
i386                  randconfig-003-20260830    clang-22
i386                  randconfig-004-20260830    clang-22
i386                  randconfig-005-20260830    clang-22
i386                  randconfig-006-20260830    clang-22
i386                  randconfig-007-20260830    clang-22
i386                  randconfig-011-20260830    gcc-14
i386                  randconfig-012-20260830    gcc-14
i386                  randconfig-013-20260830    gcc-14
i386                  randconfig-014-20260830    gcc-14
i386                  randconfig-015-20260830    gcc-14
i386                  randconfig-016-20260830    gcc-14
i386                  randconfig-017-20260830    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260830    gcc-13.4.0
loongarch             randconfig-002-20260830    gcc-13.4.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                         apollo_defconfig    gcc-16.1.0
m68k                                defconfig    clang-24
m68k                          sun3x_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                     cu1830-neo_defconfig    gcc-16.1.0
mips                    maltaup_xpa_defconfig    gcc-16.1.0
mips                           xway_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-24
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260830    gcc-13.4.0
nios2                 randconfig-002-20260830    gcc-13.4.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-24
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260830    gcc-13.4.0
parisc                randconfig-002-20260830    gcc-13.4.0
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-24
powerpc                    gamecube_defconfig    gcc-16.1.0
powerpc                 linkstation_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260830    gcc-13.4.0
powerpc               randconfig-002-20260830    gcc-13.4.0
powerpc64             randconfig-001-20260830    gcc-13.4.0
powerpc64             randconfig-002-20260830    gcc-13.4.0
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260830    gcc-16.1.0
riscv                 randconfig-002-20260830    gcc-16.1.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-24
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260830    gcc-16.1.0
s390                  randconfig-002-20260830    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    gcc-16.1.0
sh                    randconfig-001-20260830    gcc-16.1.0
sh                    randconfig-002-20260830    gcc-16.1.0
sparc                             allnoconfig    clang-24
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260830    gcc-14.3.0
sparc                 randconfig-002-20260830    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260830    gcc-14.3.0
sparc64               randconfig-002-20260830    gcc-14.3.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260830    gcc-14.3.0
um                    randconfig-002-20260830    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-24
x86_64                           allyesconfig    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260830    gcc-14
x86_64                randconfig-002-20260830    gcc-14
x86_64                randconfig-003-20260830    gcc-14
x86_64                randconfig-004-20260830    gcc-14
x86_64                randconfig-005-20260830    gcc-14
x86_64                randconfig-006-20260830    gcc-14
x86_64                randconfig-011-20260830    clang-22
x86_64                randconfig-012-20260830    clang-22
x86_64                randconfig-013-20260830    clang-22
x86_64                randconfig-014-20260830    clang-22
x86_64                randconfig-015-20260830    clang-22
x86_64                randconfig-016-20260830    clang-22
x86_64                randconfig-071-20260830    gcc-14
x86_64                randconfig-072-20260830    gcc-14
x86_64                randconfig-073-20260830    gcc-14
x86_64                randconfig-074-20260830    gcc-14
x86_64                randconfig-075-20260830    gcc-14
x86_64                randconfig-076-20260830    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260830    gcc-14.3.0
xtensa                randconfig-002-20260830    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
