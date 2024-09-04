Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11971CD4F4C
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 23:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F33D10E5DE;
	Wed,  4 Sep 2024 23:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdR+DaBW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E326910E5F6
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 23:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725492712; x=1757028712;
 h=date:from:to:cc:subject:message-id;
 bh=B41cZ//4amwPjASzsXGT9wqWvRE8Jp84eBz9ScGdxDI=;
 b=UdR+DaBWz3l8biAlonTb6AuFLKfIqFZg5cnemW7MUm49vCuQZy+qF+Yq
 00V5bHjc5BcOmYAPWihqSIK7BeUkWl1EWUTa8U7R1/LO/ftisd56dOTPF
 Pb1PmBHxwhfr+fqw2X9QhdXXSEaSd6jGISOhEuh/ugkNjiJ8NL4PtM6Pi
 hiqA+1TWY0gIHg+xRxF54bhVRCaBC4JNDL3fqM2wyBI0du3TQQceqwKjY
 SOtpFXcJGYMBWYXTMrPyUct8LR7W3/8oxKH59iuY+JLhwH38/FZCAIB5a
 7QDdwou9IswyaKVcdQOndpxo4PjCNCgBLeWRf6mMTT6RlSyMDuWVOySZp A==;
X-CSE-ConnectionGUID: UMcXTGQUQB6RtiBLRG1oQQ==
X-CSE-MsgGUID: qYk5+SYFQjGzzwfnNMvYJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24376697"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="24376697"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 16:31:51 -0700
X-CSE-ConnectionGUID: ym1zJeNbQxWTWXb0Mz9pqg==
X-CSE-MsgGUID: GXT5n6FhQkKfnOdlP9GeKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="65082685"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 04 Sep 2024 16:31:50 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1slzTY-0008h1-1Z;
 Wed, 04 Sep 2024 23:31:48 +0000
Date: Thu, 05 Sep 2024 07:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 fe13fd68337512da4b7aee6326c397e817a943c7
Message-ID: <202409050730.frClztuJ-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: fe13fd68337512da4b7aee6326c397e817a943c7  drm/xe/pcode: Treat pcode as per-tile rather than per-GT

elapsed time: 1925m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                               allnoconfig   gcc-14.1.0
arc                                 defconfig   gcc-14.1.0
arm                               allnoconfig   gcc-14.1.0
arm                                 defconfig   gcc-14.1.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240904   clang-18
i386         buildonly-randconfig-002-20240904   gcc-12
i386         buildonly-randconfig-003-20240904   clang-18
i386         buildonly-randconfig-004-20240904   clang-18
i386         buildonly-randconfig-005-20240904   clang-18
i386         buildonly-randconfig-006-20240904   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240904   clang-18
i386                  randconfig-002-20240904   clang-18
i386                  randconfig-003-20240904   clang-18
i386                  randconfig-004-20240904   clang-18
i386                  randconfig-005-20240904   gcc-12
i386                  randconfig-006-20240904   gcc-12
i386                  randconfig-011-20240904   clang-18
i386                  randconfig-012-20240904   clang-18
i386                  randconfig-013-20240904   gcc-12
i386                  randconfig-014-20240904   clang-18
i386                  randconfig-015-20240904   clang-18
i386                  randconfig-016-20240904   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                            allnoconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240905   gcc-12
x86_64       buildonly-randconfig-002-20240905   gcc-12
x86_64       buildonly-randconfig-003-20240905   gcc-12
x86_64       buildonly-randconfig-004-20240905   gcc-12
x86_64       buildonly-randconfig-005-20240905   gcc-12
x86_64       buildonly-randconfig-006-20240905   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240905   gcc-12
x86_64                randconfig-002-20240905   gcc-12
x86_64                randconfig-003-20240905   gcc-12
x86_64                randconfig-004-20240905   gcc-12
x86_64                randconfig-005-20240905   gcc-12
x86_64                randconfig-006-20240905   gcc-12
x86_64                randconfig-011-20240905   gcc-12
x86_64                randconfig-012-20240905   gcc-12
x86_64                randconfig-013-20240905   gcc-12
x86_64                randconfig-014-20240905   gcc-12
x86_64                randconfig-015-20240905   gcc-12
x86_64                randconfig-016-20240905   gcc-12
x86_64                randconfig-071-20240905   gcc-12
x86_64                randconfig-072-20240905   gcc-12
x86_64                randconfig-073-20240905   gcc-12
x86_64                randconfig-074-20240905   gcc-12
x86_64                randconfig-075-20240905   gcc-12
x86_64                randconfig-076-20240905   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
