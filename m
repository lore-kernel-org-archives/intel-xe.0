Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3276EC87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 10:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5E710E2E4;
	Wed,  6 Aug 2025 10:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnnZQMKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FFE10E754
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 10:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754475229; x=1786011229;
 h=date:from:to:cc:subject:message-id;
 bh=QR1VCE+n9hmj4yiZEIqJyT3AiFtCctaatE0dIhpehF4=;
 b=OnnZQMKkiE/vEAB3QhVi3R8bwhiEB6ll4uuJXZiC6z5eI1kErmMkfqRf
 ChXo+tR1socig3xnk6T2ydUToD3MErz7asxZpH0VTsgpNpEUeyj8PJlud
 4cdaimGfxQcxVgZVTKUuksjRejWjzi0wp2myvYB5khgpxJA9QUi8XJGxk
 SCg4b+kkbehSwJoJdkDmyNzWLOBDsTuV7rJvDSZpbIAzOE5CBzQXtjDpL
 4cLIs2qXe/ZgS0ZLQ1aR/6KdQzOpAEp0ZYEcDXJKz3zv2Fv5U0WzT2uHA
 sKGIwt3vzldyscJ/K0m/awQCmXZWC0xXPz0NIcUaW15v6cus56LUzx0AJ w==;
X-CSE-ConnectionGUID: z3WE1psPT8yb8lPgZGbpjQ==
X-CSE-MsgGUID: I0bgjQN5TLOYarIsNonYtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="44379579"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="44379579"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 03:13:49 -0700
X-CSE-ConnectionGUID: p8/Na2VZSbeWcnhb70lobQ==
X-CSE-MsgGUID: BxOK009xQdiGXlH9Hk9rTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="163958794"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa006.jf.intel.com with ESMTP; 06 Aug 2025 03:13:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ujb9L-0001WX-0X;
 Wed, 06 Aug 2025 10:13:36 +0000
Date: Wed, 06 Aug 2025 18:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 ca0ed3b10f5dba790808107896c568cc037a74f4
Message-ID: <202508061836.kaVGPhYX-lkp@intel.com>
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
branch HEAD: ca0ed3b10f5dba790808107896c568cc037a74f4  drm/xe/configfs: Allow adding configurations for future VFs

elapsed time: 809m

configs tested: 132
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                     nsimosci_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250806    gcc-12.5.0
arc                   randconfig-002-20250806    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20250806    gcc-10.5.0
arm                   randconfig-002-20250806    gcc-13.4.0
arm                   randconfig-003-20250806    gcc-10.5.0
arm                   randconfig-004-20250806    clang-22
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250806    clang-20
arm64                 randconfig-002-20250806    clang-22
arm64                 randconfig-003-20250806    gcc-9.5.0
arm64                 randconfig-004-20250806    clang-17
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250806    gcc-10.5.0
csky                  randconfig-002-20250806    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250806    clang-18
hexagon               randconfig-002-20250806    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250806    clang-20
i386        buildonly-randconfig-002-20250806    gcc-11
i386        buildonly-randconfig-003-20250806    clang-20
i386        buildonly-randconfig-004-20250806    gcc-12
i386        buildonly-randconfig-005-20250806    gcc-12
i386        buildonly-randconfig-006-20250806    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250806    clang-18
loongarch             randconfig-002-20250806    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250806    gcc-10.5.0
nios2                 randconfig-002-20250806    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250806    gcc-15.1.0
parisc                randconfig-002-20250806    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250806    clang-22
powerpc               randconfig-002-20250806    gcc-14.3.0
powerpc               randconfig-003-20250806    clang-22
powerpc64             randconfig-001-20250806    gcc-15.1.0
powerpc64             randconfig-002-20250806    gcc-10.5.0
powerpc64             randconfig-003-20250806    clang-18
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250806    clang-20
riscv                 randconfig-002-20250806    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250806    gcc-14.3.0
s390                  randconfig-002-20250806    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250806    gcc-15.1.0
sh                    randconfig-002-20250806    gcc-10.5.0
sh                          rsk7203_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250806    gcc-11.5.0
sparc                 randconfig-002-20250806    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250806    gcc-8.5.0
sparc64               randconfig-002-20250806    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250806    clang-16
um                    randconfig-002-20250806    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250806    gcc-12
x86_64      buildonly-randconfig-002-20250806    clang-20
x86_64      buildonly-randconfig-003-20250806    gcc-12
x86_64      buildonly-randconfig-004-20250806    gcc-12
x86_64      buildonly-randconfig-005-20250806    clang-20
x86_64      buildonly-randconfig-006-20250806    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250806    gcc-13.4.0
xtensa                randconfig-002-20250806    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
