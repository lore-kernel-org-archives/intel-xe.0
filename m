Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5ADCF3973
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 21:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769C410E126;
	Thu, 19 Sep 2024 21:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXhBSSoR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2CF10E126
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 21:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726782684; x=1758318684;
 h=date:from:to:cc:subject:message-id;
 bh=rvWaUa3dG66D5IwK9pqeIlfoJb+USkOElHEbHE3AA2Y=;
 b=FXhBSSoRc7qWVoYU7GsGG5zpAIvIH/ebn2aezYXPIhfELNv4xX6H8HYC
 99qiF8zV7Np7rRSqlnb6QsV8jkbaMB1MzB31NDmfvM0ZOmUh9n1+vh3E7
 84VsoidylPFXEUq+EjltoIqc1xcGwB9D1aoVq968TTtnYpD/9cHrPScGj
 FqiixlLFKNThrQLZmYAzqTs1FWBNPK9WryTCDo3uPBwhNkYmFYaBWvDWM
 1qdLhReZv3U/ZVMguVILa7sHJsu2V84nSVdtJtFitRg5RtTx1Tt9YEM82
 PsHL3rpT5Cc0gFQxd670eG3123OjvZtFDgxYMEfex+t4SJNTOuFhtLQIa g==;
X-CSE-ConnectionGUID: bXDhz6BdSQ+2xII09Bf5AA==
X-CSE-MsgGUID: j8Txx3sDQzaGW1Ju+yFJjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25647684"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25647684"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 14:51:24 -0700
X-CSE-ConnectionGUID: axrJulUIQ1OeySSec54FAQ==
X-CSE-MsgGUID: /oUV/ikFTuajDKQRRjJNFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="69670587"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2024 14:51:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1srP3Y-000Dj2-38;
 Thu, 19 Sep 2024 21:51:20 +0000
Date: Fri, 20 Sep 2024 05:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 6c10ba06bb1b48acce6d4d9c1e33beb9954f1788
Message-ID: <202409200518.smMziyEf-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: 6c10ba06bb1b48acce6d4d9c1e33beb9954f1788  drm/xe/oa: Fix overflow in oa batch buffer

elapsed time: 2387m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                        nsimosci_defconfig    gcc-13.2.0
arc                   randconfig-001-20240920    gcc-13.2.0
arc                   randconfig-002-20240920    gcc-13.2.0
arc                        vdk_hs38_defconfig    gcc-13.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                      footbridge_defconfig    clang-20
arm                          gemini_defconfig    clang-20
arm                          ixp4xx_defconfig    gcc-14.1.0
arm                   randconfig-001-20240920    gcc-14.1.0
arm                   randconfig-002-20240920    gcc-14.1.0
arm                   randconfig-003-20240920    gcc-14.1.0
arm                   randconfig-004-20240920    gcc-14.1.0
arm                    vt8500_v6_v7_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240920    gcc-14.1.0
arm64                 randconfig-002-20240920    clang-20
arm64                 randconfig-003-20240920    clang-20
arm64                 randconfig-004-20240920    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240920    gcc-14.1.0
csky                  randconfig-002-20240920    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20240920    clang-20
hexagon               randconfig-002-20240920    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240919    clang-18
i386        buildonly-randconfig-002-20240919    gcc-12
i386        buildonly-randconfig-003-20240919    clang-18
i386        buildonly-randconfig-004-20240919    gcc-12
i386        buildonly-randconfig-005-20240919    clang-18
i386        buildonly-randconfig-006-20240919    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240919    clang-18
i386                  randconfig-002-20240919    clang-18
i386                  randconfig-003-20240919    gcc-12
i386                  randconfig-004-20240919    clang-18
i386                  randconfig-005-20240919    clang-18
i386                  randconfig-006-20240919    clang-18
i386                  randconfig-011-20240919    gcc-12
i386                  randconfig-012-20240919    gcc-12
i386                  randconfig-013-20240919    clang-18
i386                  randconfig-014-20240919    gcc-12
i386                  randconfig-015-20240919    gcc-11
i386                  randconfig-016-20240919    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240920    gcc-14.1.0
loongarch             randconfig-002-20240920    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                       bvme6000_defconfig    gcc-14.1.0
m68k                        stmark2_defconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      malta_kvm_defconfig    gcc-13.2.0
mips                          rb532_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240920    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc                generic-64bit_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                     taishan_defconfig    clang-20
powerpc                     tqm5200_defconfig    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                           rhel-8.3-bpf    gcc-12
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                           rhel-8.3-ltp    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
