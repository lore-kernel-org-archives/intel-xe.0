Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3F5CCFA1E
	for <intel-xe@archiver.kernel.org>; Sun,  9 Nov 2025 10:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AFF10E029;
	Sun,  9 Nov 2025 10:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bX7X91JJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3C410E029
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Nov 2025 10:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762685735; x=1794221735;
 h=date:from:to:cc:subject:message-id;
 bh=cpWVTwTj4zZK2JgARHueoI1QVtoKYjoxB3BWlE5UNqM=;
 b=bX7X91JJ4xgymAmrscImdiawqVE8fLCr4ydwZk1IFviBu3b+WjvtyrdV
 uyzE7LUgU+NQyj+cASkaxi81ZHFBbajbrB1me1fKVppTVGXW9f9W59jAp
 HGQop9pzWRUDVs6UhN80o1NA4vj/OUxkvTaqPkC8s8ZbIhH1IrOKEWvaa
 GuGTAApAbNQLiI4ItTXwcdP8DFoY1gGkXlvTKAG0jhezzLvbGjUsZMy+1
 zpqq8v8LGE+GnsLKpSSMVInylPfEm/FcyvhQpCvBMO4di/6wqF3UsDwWd
 bCC7+Ek7YlXjCOwIj3l32ggBEmgaoKEbbf1DuPJIu0LwUsy1FkmJ4yC5c A==;
X-CSE-ConnectionGUID: Iej4aWxaTLmDfNugtpS4jg==
X-CSE-MsgGUID: z9cR3YLkQw2oRfDKo+DJyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="64855427"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; d="scan'208";a="64855427"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 02:55:35 -0800
X-CSE-ConnectionGUID: fdYswJdpQgy6ujsiR3x7CA==
X-CSE-MsgGUID: 5rN34SfzThuZFufgl8nd4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; d="scan'208";a="188274767"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 09 Nov 2025 02:55:33 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vI351-0001wV-2l;
 Sun, 09 Nov 2025 10:55:31 +0000
Date: Sun, 09 Nov 2025 18:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 0995c2fc39b0f998d40f5d276f67ae22fc1c37c3
Message-ID: <202511091851.ftuzduS1-lkp@intel.com>
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
branch HEAD: 0995c2fc39b0f998d40f5d276f67ae22fc1c37c3  drm/xe: Enforce correct user fence signaling order using

elapsed time: 2815m

configs tested: 92
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    clang-19
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-001-20251108    gcc-12.5.0
arc         randconfig-002-20251108    gcc-8.5.0
arm                    allmodconfig    gcc-15.1.0
arm                     allnoconfig    clang-22
arm                    allyesconfig    gcc-15.1.0
arm         randconfig-001-20251108    gcc-14.3.0
arm         randconfig-002-20251108    gcc-15.1.0
arm         randconfig-003-20251108    clang-22
arm         randconfig-004-20251108    gcc-10.5.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.1.0
arm64                  allyesconfig    clang-22
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky                   allyesconfig    gcc-15.1.0
hexagon                allmodconfig    clang-19
hexagon                 allnoconfig    clang-22
hexagon                allyesconfig    clang-19
hexagon     randconfig-001-20251108    clang-22
hexagon     randconfig-002-20251108    clang-22
i386                   allmodconfig    clang-20
i386                    allnoconfig    gcc-14
i386                   allyesconfig    clang-20
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch              allyesconfig    clang-22
loongarch   randconfig-001-20251108    gcc-12.5.0
loongarch   randconfig-002-20251108    gcc-12.5.0
m68k                   allmodconfig    clang-19
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    clang-19
microblaze             allmodconfig    clang-19
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    clang-19
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2                  allyesconfig    gcc-11.5.0
nios2       randconfig-001-20251108    gcc-8.5.0
nios2       randconfig-002-20251108    gcc-9.5.0
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
openrisc               allyesconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
parisc      randconfig-001-20251108    gcc-8.5.0
parisc      randconfig-002-20251108    gcc-8.5.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc                allyesconfig    clang-22
powerpc     randconfig-001-20251108    gcc-8.5.0
powerpc     randconfig-002-20251108    gcc-9.5.0
powerpc64   randconfig-001-20251108    gcc-8.5.0
powerpc64   randconfig-002-20251108    gcc-8.5.0
riscv                  allmodconfig    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sparc                  allmodconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc                  allyesconfig    gcc-15.1.0
sparc64                allmodconfig    clang-22
sparc64                allyesconfig    gcc-15.1.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    clang-19
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
