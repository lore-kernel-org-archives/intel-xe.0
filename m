Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A409FF887E
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 16:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F6C10E278;
	Wed, 29 Apr 2026 16:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYBKSqFu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D5610E278
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777479484; x=1809015484;
 h=date:from:to:cc:subject:message-id;
 bh=N/46HowlwlJBhYi3druyS29Dl+5aPKi9lKhE2Q6s3TI=;
 b=SYBKSqFuMVnzqPK7S+IpREaL+KOIot3hrC5qc56EpudImGdr5yGB5bLn
 c1y5Yh9ZIMZOltwEVL06MDY2qfVauHQiVOSeRffsAJ3s2ac/JLdGQkNRV
 +MeICf0m12hVUsC84KuXQNZty80zWFv7i/dlAumn6mXQLKV+VR+h7AUtm
 0KiOssf44LBtKYXHJHU+h2Ok3a/OKa9hs/SMGy5GRrskr79uBUGndnc8H
 b6oZe5DfOux1pp55g8zXRIP6ywkcqybxYsS53Bxz2MxYgkAyx4TL1RDX2
 ifSh9dzJ6eoyOsS3mlUHdqpyONrWeLFlUJnwlF66USMf+7srcF2m9Quqn w==;
X-CSE-ConnectionGUID: eYSRFML6Q8CZObg2DYecSw==
X-CSE-MsgGUID: nCPoSDD1TcORO4+tKaSopQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82020904"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="82020904"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 09:18:03 -0700
X-CSE-ConnectionGUID: eLvDQzYdRaeGqXQ8MVqK4w==
X-CSE-MsgGUID: GGeY22aLT3a6fKtzxoEmbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="257645372"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2026 09:18:02 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wI7br-00000000BEa-3Nzs;
 Wed, 29 Apr 2026 16:17:59 +0000
Date: Thu, 30 Apr 2026 00:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 3096d3e9f44afe011d2017ddade416924e1c99d5
Message-ID: <202604300052.yXYDO0Dz-lkp@intel.com>
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
branch HEAD: 3096d3e9f44afe011d2017ddade416924e1c99d5  drm/xe: Don't use UTS_RELEASE directly

elapsed time: 1135m

configs tested: 87
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
arm64       randconfig-001-20260429    clang-23
arm64       randconfig-002-20260429    gcc-8.5.0
arm64       randconfig-003-20260429    gcc-11.5.0
arm64       randconfig-004-20260429    clang-23
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky        randconfig-001-20260429    gcc-15.2.0
csky        randconfig-002-20260429    gcc-10.5.0
hexagon                 allnoconfig    clang-23
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
loongarch                 defconfig    clang-19
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
m68k                      defconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
microblaze                defconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2                     defconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
openrisc                  defconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc                    defconfig    gcc-15.2.0
parisc64                  defconfig    gcc-15.2.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc           rainier_defconfig    gcc-15.2.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
riscv                     defconfig    clang-23
riscv                randconfig-001    gcc-8.5.0
riscv       randconfig-001-20260429    clang-23
riscv                randconfig-002    clang-23
riscv       randconfig-002-20260429    clang-23
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390                      defconfig    clang-23
s390                 randconfig-001    gcc-11.5.0
s390        randconfig-001-20260429    clang-23
s390                 randconfig-002    clang-23
s390        randconfig-002-20260429    clang-17
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                        defconfig    gcc-15.2.0
sh                   randconfig-001    gcc-15.2.0
sh          randconfig-001-20260429    gcc-15.2.0
sh                   randconfig-002    gcc-14.3.0
sh          randconfig-002-20260429    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc                     defconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
sparc64                   defconfig    clang-20
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um                        defconfig    clang-23
um                   i386_defconfig    gcc-14
um                 x86_64_defconfig    clang-23
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
