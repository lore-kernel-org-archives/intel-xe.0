Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9FFC19F32
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 14:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0321810EB0E;
	Thu, 27 Feb 2025 14:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHCk5Z5J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA8510EB0E
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740667287; x=1772203287;
 h=date:from:to:cc:subject:message-id;
 bh=LaejAi5St8z4EbsW28aOWl9Rh3ucNN6pkn1LWaAs44E=;
 b=eHCk5Z5JeROmO/rOT0eKv9xRZj3cpop6Fso1MpVocJ0pvEvJUjCw0L/6
 9b/4rzaY38Ulhw6otsTCsewloxG/5HW5NEcoDm80O5EHhk6I4QCpCAH4T
 N4v4u+siZnJ8cfJrrolGODwnfdm+vrq9DQFGdWTQDOUyoVVcdzxh9xoRn
 0M8tjumz5X5ZttUHbulBdTLtKVx9MimQtRoYe38+Uvaq4y8niXo6lMwpL
 Z8R7H6aCqX5u8ldwN5dhsPNcObFEuH3xrdXsRZMqlib2bFpSCWF17QgP1
 Nehnkpt6A6dybz9uEjWfCG+qv61xgM0KBxVtWh5/zYKeDIy7uUDeFeSnD g==;
X-CSE-ConnectionGUID: zH2RU+Y0QdmAuZhX3AjaUQ==
X-CSE-MsgGUID: ZcbGrYwvRwa+eW9wZ1GQLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52969804"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52969804"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 06:41:26 -0800
X-CSE-ConnectionGUID: sZ9UY/1kSTik8fsN7VidPg==
X-CSE-MsgGUID: vCy2s4sOS6OzNeYSskOWdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117536258"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa010.fm.intel.com with ESMTP; 27 Feb 2025 06:41:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tnf4k-000DVR-36;
 Thu, 27 Feb 2025 14:41:23 +0000
Date: Thu, 27 Feb 2025 22:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 12c2f962fe71f390951d9242725bc7e608f55927
Message-ID: <202502272246.7F1AYla3-lkp@intel.com>
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
branch HEAD: 12c2f962fe71f390951d9242725bc7e608f55927  drm/xe: cancel pending job timer before freeing scheduler

elapsed time: 1448m

configs tested: 82
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                   randconfig-001-20250226    gcc-13.2.0
arc                   randconfig-002-20250226    gcc-13.2.0
arm                   randconfig-001-20250226    gcc-14.2.0
arm                   randconfig-002-20250226    clang-21
arm                   randconfig-003-20250226    gcc-14.2.0
arm                   randconfig-004-20250226    gcc-14.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm64                 randconfig-001-20250226    gcc-14.2.0
arm64                 randconfig-002-20250226    gcc-14.2.0
arm64                 randconfig-003-20250226    clang-21
arm64                 randconfig-004-20250226    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250227    gcc-14.2.0
csky                  randconfig-002-20250227    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250227    clang-14
hexagon               randconfig-002-20250227    clang-16
i386        buildonly-randconfig-001-20250227    gcc-12
i386        buildonly-randconfig-002-20250227    gcc-11
i386        buildonly-randconfig-003-20250227    clang-19
i386        buildonly-randconfig-004-20250227    gcc-12
i386        buildonly-randconfig-005-20250227    gcc-11
i386        buildonly-randconfig-006-20250227    clang-19
loongarch             randconfig-001-20250227    gcc-14.2.0
loongarch             randconfig-002-20250227    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250227    gcc-14.2.0
nios2                 randconfig-002-20250227    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250227    gcc-14.2.0
parisc                randconfig-002-20250227    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250227    clang-19
powerpc               randconfig-002-20250227    gcc-14.2.0
powerpc               randconfig-003-20250227    clang-19
powerpc64             randconfig-001-20250227    clang-17
powerpc64             randconfig-002-20250227    clang-21
powerpc64             randconfig-003-20250227    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250227    gcc-14.2.0
riscv                 randconfig-002-20250227    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250227    clang-18
s390                  randconfig-002-20250227    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250227    gcc-14.2.0
sh                    randconfig-002-20250227    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250227    gcc-14.2.0
sparc                 randconfig-002-20250227    gcc-14.2.0
sparc64               randconfig-001-20250227    gcc-14.2.0
sparc64               randconfig-002-20250227    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250227    clang-17
um                    randconfig-002-20250227    gcc-12
x86_64      buildonly-randconfig-001-20250226    clang-19
x86_64      buildonly-randconfig-002-20250226    clang-19
x86_64      buildonly-randconfig-003-20250226    gcc-12
x86_64      buildonly-randconfig-004-20250226    clang-19
x86_64      buildonly-randconfig-005-20250226    gcc-12
x86_64      buildonly-randconfig-006-20250226    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250227    gcc-14.2.0
xtensa                randconfig-002-20250227    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
