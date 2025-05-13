Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446F5C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 23:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0743110E218;
	Tue, 13 May 2025 23:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RiURgbTa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1994310E218
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 23:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747178238; x=1778714238;
 h=date:from:to:cc:subject:message-id;
 bh=Uo5V1lvlC+6WI82mG9BHre/LOr1tuDIPW4JG0VINFF0=;
 b=RiURgbTahkhwG68bSaOkl/aE3tMMAr4pL2qBSALn5WfzVKI8KopP9o3c
 1TRnhESK1f4EOhKhHFuO/MWBHUZxX0OPU/bmUKsuRGS9sw1LDV8InTs/U
 7mG0rDz2gpjnaSPw6qgRrtH2Uyfrlkqn68zMYEdSfqnTdf+WmmhfP7x0w
 /llijeqMkV8diiIPdkWlpyPSRKmQ7tZd5NV85bBVbR+qGhPHFXduOWxMV
 WsieufA6SCwmKAyUxgHQ5dfW6LY++R+Xk4oPeJGo73VqSjL5eVRXtZRzy
 CmZL7Udi72Hq2udFql6uPV40LQCV1U2wX8jkNXnHdVIXeLGVFRZXhnuqE w==;
X-CSE-ConnectionGUID: 7UeDcoedTPGYWHxMR5ChAQ==
X-CSE-MsgGUID: aXoGPRarTTC0ApAZFnKUWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66600724"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="66600724"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 16:17:18 -0700
X-CSE-ConnectionGUID: JD4IBhAZSSqxP3V10VBK7A==
X-CSE-MsgGUID: gJAHYCGgSMuHI2Bsu1JdhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="142795496"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 13 May 2025 16:17:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uEys6-000GUV-1C;
 Tue, 13 May 2025 23:17:14 +0000
Date: Wed, 14 May 2025 07:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 82b98cadb01f63cdb159e596ec06866d00f8e8c7
Message-ID: <202505140716.zA785afJ-lkp@intel.com>
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
branch HEAD: 82b98cadb01f63cdb159e596ec06866d00f8e8c7  drm/xe: Add WA BB to capture active context utilization

elapsed time: 1463m

configs tested: 121
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                        nsim_700_defconfig    gcc-14.2.0
arc                   randconfig-001-20250513    gcc-14.2.0
arc                   randconfig-002-20250513    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250513    gcc-7.5.0
arm                   randconfig-002-20250513    gcc-8.5.0
arm                   randconfig-003-20250513    gcc-8.5.0
arm                   randconfig-004-20250513    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250513    clang-21
arm64                 randconfig-002-20250513    clang-21
arm64                 randconfig-003-20250513    gcc-6.5.0
arm64                 randconfig-004-20250513    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250513    gcc-14.2.0
csky                  randconfig-002-20250513    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250513    clang-21
hexagon               randconfig-002-20250513    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250513    clang-20
i386        buildonly-randconfig-002-20250513    clang-20
i386        buildonly-randconfig-003-20250513    clang-20
i386        buildonly-randconfig-004-20250513    clang-20
i386        buildonly-randconfig-005-20250513    gcc-12
i386        buildonly-randconfig-006-20250513    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250513    gcc-14.2.0
loongarch             randconfig-002-20250513    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250513    gcc-10.5.0
nios2                 randconfig-002-20250513    gcc-12.4.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250513    gcc-11.5.0
parisc                randconfig-002-20250513    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250513    clang-21
powerpc               randconfig-002-20250513    gcc-8.5.0
powerpc               randconfig-003-20250513    clang-21
powerpc64             randconfig-001-20250513    clang-21
powerpc64             randconfig-003-20250513    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250513    gcc-14.2.0
riscv                 randconfig-002-20250513    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250513    clang-21
s390                  randconfig-002-20250513    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                    randconfig-001-20250513    gcc-12.4.0
sh                    randconfig-002-20250513    gcc-14.2.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250513    gcc-11.5.0
sparc                 randconfig-002-20250513    gcc-13.3.0
sparc64               randconfig-001-20250513    gcc-11.5.0
sparc64               randconfig-002-20250513    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250513    clang-19
um                    randconfig-002-20250513    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250513    gcc-12
x86_64      buildonly-randconfig-002-20250513    gcc-12
x86_64      buildonly-randconfig-003-20250513    clang-20
x86_64      buildonly-randconfig-004-20250513    gcc-12
x86_64      buildonly-randconfig-005-20250513    clang-20
x86_64      buildonly-randconfig-006-20250513    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250513    gcc-7.5.0
xtensa                randconfig-002-20250513    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
