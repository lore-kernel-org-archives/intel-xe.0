Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BECCCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 23:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADD210E988;
	Fri,  3 Oct 2025 23:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXusRrPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D398C10E988
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 23:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759532952; x=1791068952;
 h=date:from:to:cc:subject:message-id;
 bh=WxltsTrO1JMCgzKM7FBoK0HPHhusYIz48ftdTMFfbXo=;
 b=gXusRrPB+7GXJ51sgD6iAaFkSciafwfzykIndyFrj2iPa6GchmSTiPLv
 GzUeOmmnX1QLBWZwYy3U2zkgkD/aG2a9oz03N1KHGtW6C9tCtxqqFXjut
 +XSmUGI3imdWR7LxFoChhCQjIPvz3zSlaVhYuOHUNRecpz9Si3Z+e86Wd
 c+UcTIc52JrsrCPW9yY6xHty6vyoDKXTVSoGak4T838yFYBCLzqZfpn4W
 V12v8ntW/k4AoJB/YweL1cpjjOzsOw+NK3z1xhymEZvZabv5+RSrXtqCD
 Zanjj/ozC5Mvd4Mgc67dOvZf5H/8qW+ybG2ObDyzO39pkT9vbNhrU8vwT g==;
X-CSE-ConnectionGUID: 4jMzkFsOR2q4OevFfehDYg==
X-CSE-MsgGUID: qmyLGc/OTrypeL9HSHKV6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="60853546"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="60853546"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 16:09:11 -0700
X-CSE-ConnectionGUID: 1JnQtJf8SguE50WqjPzEig==
X-CSE-MsgGUID: WtxyMm7MSF+x1ceoS3MaOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="178530427"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 03 Oct 2025 16:09:10 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v4otf-0004xv-1B;
 Fri, 03 Oct 2025 23:09:07 +0000
Date: Sat, 04 Oct 2025 07:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 2a8fcf7cc950e6406541a3a2464192c6646392cb
Message-ID: <202510040717.GyrQlVAd-lkp@intel.com>
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
branch HEAD: 2a8fcf7cc950e6406541a3a2464192c6646392cb  drm/xe/pf: Synchronize VF FLR between all GTs

elapsed time: 1454m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                   randconfig-001-20251003    gcc-11.5.0
arc                   randconfig-002-20251003    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20251003    gcc-12.5.0
arm                   randconfig-002-20251003    clang-22
arm                   randconfig-003-20251003    gcc-13.4.0
arm                   randconfig-004-20251003    gcc-13.4.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251003    gcc-13.4.0
arm64                 randconfig-002-20251003    clang-22
arm64                 randconfig-003-20251003    gcc-10.5.0
arm64                 randconfig-004-20251003    gcc-13.4.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251003    gcc-15.1.0
csky                  randconfig-002-20251003    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251003    clang-22
hexagon               randconfig-002-20251003    clang-22
i386        buildonly-randconfig-001-20251003    gcc-14
i386        buildonly-randconfig-002-20251003    gcc-12
i386        buildonly-randconfig-003-20251003    clang-20
i386        buildonly-randconfig-004-20251003    gcc-12
i386        buildonly-randconfig-005-20251003    clang-20
i386        buildonly-randconfig-006-20251003    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251003    gcc-15.1.0
loongarch             randconfig-002-20251003    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251003    gcc-8.5.0
nios2                 randconfig-002-20251003    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251003    gcc-9.5.0
parisc                randconfig-002-20251003    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      katmai_defconfig    clang-22
powerpc               randconfig-001-20251003    clang-22
powerpc               randconfig-002-20251003    gcc-8.5.0
powerpc               randconfig-003-20251003    clang-22
powerpc                      tqm8xx_defconfig    clang-19
powerpc64                        alldefconfig    clang-22
powerpc64             randconfig-001-20251003    gcc-12.5.0
powerpc64             randconfig-002-20251003    gcc-10.5.0
powerpc64             randconfig-003-20251003    clang-18
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251003    gcc-11.5.0
riscv                 randconfig-002-20251003    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251003    clang-22
s390                  randconfig-002-20251003    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20251003    gcc-10.5.0
sh                    randconfig-002-20251003    gcc-14.3.0
sh                          rsk7201_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251003    gcc-14.3.0
sparc                 randconfig-002-20251003    gcc-13.4.0
sparc64               randconfig-001-20251003    clang-20
sparc64               randconfig-002-20251003    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251003    clang-22
um                    randconfig-002-20251003    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251003    clang-20
x86_64      buildonly-randconfig-002-20251003    gcc-14
x86_64      buildonly-randconfig-003-20251003    gcc-14
x86_64      buildonly-randconfig-004-20251003    gcc-14
x86_64      buildonly-randconfig-005-20251003    clang-20
x86_64      buildonly-randconfig-006-20251003    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251003    gcc-13.4.0
xtensa                randconfig-002-20251003    gcc-11.5.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
