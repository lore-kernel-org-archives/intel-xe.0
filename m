Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB203606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 00:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iGby2erR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC8A10E0A5;
	Tue, 27 Oct 2026 00:31:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F133810F1E5
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 00:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793061097; x=1824597097;
 h=date:from:to:cc:subject:message-id;
 bh=ZfljkF+ZFL4dWfh6VDTjTqYbBVMduEKcewhqOjKmTTw=;
 b=iGby2erRupyOxkqkRi8tdkJBnsK0qVgp2IhdtsxSqy6QBjBg0OlGMkWH
 3Or3QedEykly2SikwyFQocf11LAZ9DTZMfTaceLS7NvLS3B4EbFh88bDZ
 LAdRvYPNGwmTCF0omHBUpS2zCdmqQ3VsmTL3nEM/CiuxUwjGw5YesF3GL
 pfKf5qhCzYeiL0g3GqPsFVkbGiPSFQZGTTAx0zKjIUejO5Namq6DSG9aO
 wsFQIC38LFp7MVGHa9A5qL+ts/cNmkZegGKEffHLCFb/5d9evMLS8Kdyh
 ehPae8YefotOkFwoYaFEsxwIrwDTfGtAYqONZNppd4d2+atIe690YwI84 w==;
X-CSE-ConnectionGUID: YtGXi+XHQ+iVpk7br9Wucg==
X-CSE-MsgGUID: Ur8wvJ4wRXeH2q/a2kN48Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1756339"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1756339"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 17:31:36 -0700
X-CSE-ConnectionGUID: ZZciWeNORgqY8XzwCCchzg==
X-CSE-MsgGUID: Y3Nr6MZCQlm3oMH0xoSxIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4504866"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2026 17:31:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1xLV6C-00000000Wdo-0fIw;
 Tue, 27 Oct 2026 00:31:32 +0000
Date: Tue, 27 Oct 2026 08:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 aa94849ac3d66a798046bde6784b7d58ff030764
Message-ID: <202610270831.GzxWzMBc-lkp@intel.com>
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: aa94849ac3d66a798046bde6784b7d58ff030764  drm/xe: Extend Wa_16030224309 to graphics version 35.11

elapsed time: 3524m

configs tested: 65
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                    allnoconfig    gcc-16.2.0
alpha                   allyesconfig    gcc-16.2.0
arc                     allmodconfig    gcc-16.2.0
arc                      allnoconfig    gcc-16.2.0
arc                     allyesconfig    gcc-16.2.0
arm                      allnoconfig    clang-17
arm                     allyesconfig    gcc-16.2.0
arm64                   allmodconfig    clang-24
arm64                    allnoconfig    gcc-16.2.0
csky                    allmodconfig    gcc-16.2.0
csky                     allnoconfig    gcc-16.2.0
hexagon                 allmodconfig    clang-24
hexagon                  allnoconfig    clang-24
hexagon     randconfig-1000-20261027    clang-24
hexagon     randconfig-1001-20261027    clang-24
i386                     allnoconfig    gcc-14
loongarch               allmodconfig    clang-19
loongarch                allnoconfig    clang-20
loongarch   randconfig-1000-20261027    gcc-13.5.0
loongarch   randconfig-1001-20261027    gcc-15.3.0
m68k                    allmodconfig    gcc-16.2.0
m68k                     allnoconfig    gcc-16.2.0
m68k                    allyesconfig    gcc-16.2.0
microblaze               allnoconfig    gcc-16.2.0
microblaze              allyesconfig    gcc-16.2.0
mips                    allmodconfig    gcc-16.2.0
mips                     allnoconfig    gcc-16.2.0
mips                    allyesconfig    gcc-16.2.0
nios2                   allmodconfig    gcc-11.5.0
nios2                    allnoconfig    gcc-11.5.0
nios2       randconfig-1000-20261027    gcc-8.5.0
nios2       randconfig-1001-20261027    gcc-8.5.0
openrisc                allmodconfig    gcc-16.2.0
openrisc                 allnoconfig    gcc-16.2.0
openrisc                   defconfig    gcc-16.2.0
parisc                  allmodconfig    gcc-16.2.0
parisc                   allnoconfig    gcc-16.2.0
parisc                  allyesconfig    gcc-16.2.0
parisc                     defconfig    gcc-16.2.0
parisc      randconfig-1000-20261027    gcc-12.5.0
parisc      randconfig-1001-20261027    gcc-10.5.0
powerpc                 allmodconfig    gcc-16.2.0
powerpc                  allnoconfig    gcc-16.2.0
powerpc     randconfig-1000-20261027    gcc-15.3.0
powerpc     randconfig-1001-20261027    gcc-8.5.0
powerpc64   randconfig-1000-20261027    gcc-10.5.0
powerpc64   randconfig-1001-20261027    clang-22
riscv                   allmodconfig    clang-24
riscv                    allnoconfig    gcc-16.2.0
riscv                   allyesconfig    clang-24
riscv                      defconfig    clang-24
s390                     allnoconfig    clang-24
s390                    allyesconfig    gcc-16.2.0
s390                       defconfig    clang-18
sh                      allmodconfig    gcc-16.2.0
sh                       allnoconfig    gcc-16.2.0
sh                      allyesconfig    gcc-16.2.0
sparc                    allnoconfig    gcc-16.2.0
sparc                      defconfig    gcc-16.2.0
sparc64                 allmodconfig    clang-20
um                       allnoconfig    clang-17
um                      allyesconfig    gcc-14
x86_64                   allnoconfig    clang-22
xtensa                   allnoconfig    gcc-16.2.0
xtensa                  allyesconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
