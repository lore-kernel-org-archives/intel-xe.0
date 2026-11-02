Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9DD60A1DAA
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZjLbSxNy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD63410E0A6;
	Mon,  2 Nov 2026 16:40:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835E910E0A6
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793637635; x=1825173635;
 h=date:from:to:cc:subject:message-id;
 bh=HLiR55GBkgk56L6gBytWHkOt1Rl8Z8K7loJ8KVAP28g=;
 b=ZjLbSxNyvHPBCRQghPyktGDrg8Ig9/c7IxHQdNkPcCGfmshkmcgtqKMr
 vf0i7N05/Lt9dlY34wSwmcK5eTsS1oUAOQBjORjqi58T6sjzQqf38E14R
 gi0XcY3/oIjxy537taCDqxXOo+/JjPtE5kDINW+oGC1tlMKT0/eFwN2W2
 ilZ4XF1dJpseFlo9cxyCIkHIQWQOw15zwLXOosLSbkxyDj6jtZXgmIJt+
 OtBjmf5XHVjq7t4shxiS9bY/a/54r74pJQEUrftXrwsfWy36VROxMGEEj
 QuggU/Pn/N/Ogr2aKq4FcAa8byy0IZstCGCcb1QcRGRTJNjBHsXhgP9Gb g==;
X-CSE-ConnectionGUID: eKR/rsGrSi6+E4ccFs10Ww==
X-CSE-MsgGUID: 0ZX9AXNoSjiRjgKB7ZcIqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2428324"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2428324"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:40:35 -0800
X-CSE-ConnectionGUID: gAnUtdqBSRqFSuVe+NUiHQ==
X-CSE-MsgGUID: 6fkPuoORSYuMybn7bwM8Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6220804"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 02 Nov 2026 08:40:35 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xNv5D-00000000hLi-465H;
 Mon, 02 Nov 2026 16:40:31 +0000
Date: Tue, 03 Nov 2026 00:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 72fde60e3ed747d0312bae613d045d8a812dbaa4
Message-ID: <20261103004003.Nssek3GA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 72fde60e3ed747d0312bae613d045d8a812dbaa4  drm/xe/hwmon: Use overflows_type() for temperature range check

elapsed time: 3826m

configs tested: 88
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261102    gcc-10.5.0
arc                   randconfig-1001-20261102    gcc-10.5.0
arm                                allnoconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                              mxs_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261102    gcc-10.5.0
arm                   randconfig-1001-20261102    gcc-10.5.0
arm                   randconfig-1002-20261102    gcc-10.5.0
arm                   randconfig-1003-20261102    gcc-10.5.0
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261102    clang-19
hexagon               randconfig-1001-20261102    clang-19
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261102    clang-22
i386        buildonly-randconfig-1001-20261102    clang-22
i386        buildonly-randconfig-1002-20261102    clang-22
i386        buildonly-randconfig-1003-20261102    clang-22
i386        buildonly-randconfig-1004-20261102    clang-22
i386        buildonly-randconfig-1005-20261102    clang-22
i386                                 defconfig    gcc-16.2.0
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261102    clang-19
loongarch             randconfig-1001-20261102    clang-19
m68k                               allnoconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                               allnoconfig    gcc-16.2.0
mips                      decstation_defconfig    clang-24
mips                      eyeq6lplus_defconfig    clang-24
mips                            ip22_defconfig    clang-24
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261102    clang-19
nios2                 randconfig-1001-20261102    clang-19
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261102    clang-17
parisc                randconfig-1001-20261102    clang-17
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    clang-24
powerpc                      mpc512x_defconfig    clang-24
powerpc               randconfig-1000-20261102    clang-17
powerpc               randconfig-1001-20261102    clang-17
powerpc64             randconfig-1000-20261102    clang-17
powerpc64             randconfig-1001-20261102    clang-17
riscv                              allnoconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261102    clang-21
riscv                 randconfig-1001-20261102    clang-21
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261102    clang-21
s390                  randconfig-1001-20261102    clang-21
sh                                 allnoconfig    clang-24
sh                    randconfig-1000-20261102    clang-21
sh                    randconfig-1001-20261102    clang-21
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261102    gcc-15.3.0
sparc                 randconfig-1001-20261102    gcc-15.3.0
sparc                        sparc64_defconfig    clang-24
sparc64               randconfig-1000-20261102    gcc-15.3.0
sparc64               randconfig-1001-20261102    gcc-15.3.0
um                                 allnoconfig    clang-24
um                    randconfig-1000-20261102    gcc-15.3.0
um                    randconfig-1001-20261102    gcc-15.3.0
x86_64                             allnoconfig    clang-24
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
xtensa                             allnoconfig    clang-24
xtensa                randconfig-1000-20261102    gcc-15.3.0
xtensa                randconfig-1001-20261102    gcc-15.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
