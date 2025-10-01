Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41458CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 16:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3F410E0A4;
	Wed,  1 Oct 2025 16:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVkkFaTV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9291510E0FF
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759335381; x=1790871381;
 h=date:from:to:cc:subject:message-id;
 bh=sEu6tX41pPMopvZUUcAS1wQO2eJwNr1SZW4DtbAGeBo=;
 b=ZVkkFaTVs8llra4myO/g0Aiu/YJLjMqLiaPPCIfvQlog0sK82c0Akj8J
 MGdDc33aqn6afiEsNDEG3liSXT63+//lXUcXaKtbpNiUAS+v8/Q4E9bNS
 m3/waPk8k7kfHEEnjgv49nkI/41FVBt4GSma6F92VFLmyJ5gZ0dMNnPMX
 Or52EkaQ0AqM8VQrVNf6YX+HtbmaVHv9le1qs/GXryZGgARO7G+9bNhUy
 qBGnW/c3FlvvfRu8Agy032CAUGy4MrwVOf53WWjoxxXM1IHkMqeyLdWGQ
 1M22vDVITbkUQEEHhMAFSCql/9I7PK9y8EtpJ0f693UVfkdvfqEMTVoM/ Q==;
X-CSE-ConnectionGUID: 5xglXVnTSqGmH5agSURhJw==
X-CSE-MsgGUID: ayGEruoRTA+jv+kItLX4gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61571594"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61571594"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 09:16:21 -0700
X-CSE-ConnectionGUID: af6EkNXLTYmXcacibpQx6A==
X-CSE-MsgGUID: 6LdgAEmyTUCVdYwKGGe91w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="178442208"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 01 Oct 2025 09:16:20 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v3zV3-0003AF-33;
 Wed, 01 Oct 2025 16:16:17 +0000
Date: Thu, 02 Oct 2025 00:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 d9c401d8f37cd5510cc64647b0421f95e62fe3a2
Message-ID: <202510020033.O5ZWtGji-lkp@intel.com>
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
branch HEAD: d9c401d8f37cd5510cc64647b0421f95e62fe3a2  drm/xe/sysfs: Drop redundant runtime PM usage

elapsed time: 1455m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251001    gcc-8.5.0
arc                   randconfig-002-20251001    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         assabet_defconfig    clang-18
arm                        keystone_defconfig    gcc-15.1.0
arm                   randconfig-001-20251001    gcc-14.3.0
arm                   randconfig-002-20251001    clang-22
arm                   randconfig-003-20251001    gcc-12.5.0
arm                   randconfig-004-20251001    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251001    clang-22
arm64                 randconfig-002-20251001    gcc-9.5.0
arm64                 randconfig-003-20251001    gcc-8.5.0
arm64                 randconfig-004-20251001    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251001    gcc-13.4.0
csky                  randconfig-002-20251001    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251001    clang-22
hexagon               randconfig-002-20251001    clang-22
i386        buildonly-randconfig-001-20251001    clang-20
i386        buildonly-randconfig-002-20251001    clang-20
i386        buildonly-randconfig-003-20251001    gcc-14
i386        buildonly-randconfig-004-20251001    clang-20
i386        buildonly-randconfig-005-20251001    clang-20
i386        buildonly-randconfig-006-20251001    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251001    gcc-13.4.0
loongarch             randconfig-002-20251001    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251001    gcc-11.5.0
nios2                 randconfig-002-20251001    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251001    gcc-8.5.0
parisc                randconfig-002-20251001    gcc-8.5.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      mgcoge_defconfig    clang-22
powerpc               randconfig-001-20251001    gcc-8.5.0
powerpc               randconfig-002-20251001    clang-22
powerpc               randconfig-003-20251001    clang-22
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20251001    gcc-8.5.0
powerpc64             randconfig-002-20251001    clang-22
powerpc64             randconfig-003-20251001    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251001    clang-22
riscv                 randconfig-002-20251001    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251001    clang-22
s390                  randconfig-002-20251001    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251001    gcc-13.4.0
sh                    randconfig-002-20251001    gcc-11.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251001    gcc-15.1.0
sparc                 randconfig-002-20251001    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251001    gcc-8.5.0
sparc64               randconfig-002-20251001    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251001    gcc-14
um                    randconfig-002-20251001    gcc-14
um                           x86_64_defconfig    clang-22
x86_64      buildonly-randconfig-001-20251001    clang-20
x86_64      buildonly-randconfig-002-20251001    clang-20
x86_64      buildonly-randconfig-003-20251001    clang-20
x86_64      buildonly-randconfig-004-20251001    clang-20
x86_64      buildonly-randconfig-005-20251001    clang-20
x86_64      buildonly-randconfig-006-20251001    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251001    gcc-15.1.0
xtensa                randconfig-002-20251001    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
