Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E61CC55172
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 05:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA3B10E0E8;
	Tue,  4 Aug 2026 05:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nw/IcfM1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EC110E0E8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 05:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785819840; x=1817355840;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=QPctwPrGc+XxZ4Ua16hjjHd2jeZcZoZy5cpGsPZpIGs=;
 b=Nw/IcfM1ptKJVuKVjV0QWCDguQwcDvoMbVqsvq4ntvInztrZgu4v2Ht6
 iXWEtygjrSW2nn3ayoA8R+Q5oCCp9Y8cTPCFKfahix2+4GosnZp3Dqi4h
 kCSHWXMdMlbVyPPMxwB02+b3hj5fdiiRt8z84MHIJ7dKtEJGV2/QUJ/vP
 xDwfmS8y8agVpPShDXSuZU4uM0YBDXdRK1Y4tlZ2CQ6j+uXsbfaX8suz7
 HLMcNDD/tD5aEzX2zj3RwtlDBUrQCahh6Bh9b4E9cRSf8Z73hwYN9ORLU
 pyEdQ2G19lVF7oFpgzYv94EHMfEveiGzMeCePsPeTIgIm4u/CMB3yZZBn w==;
X-CSE-ConnectionGUID: +AecgEYKTcqcLBpBAVtpWA==
X-CSE-MsgGUID: lY4shWKFTzeON7PPgf3+Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86131761"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86131761"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 22:03:59 -0700
X-CSE-ConnectionGUID: hozoTgDsQXOJiBG02LCzRA==
X-CSE-MsgGUID: 8WQVxf0NT2i/9O+thDumTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="286057611"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2026 22:03:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wr7Ji-000000008yr-1ncV;
 Tue, 04 Aug 2026 05:03:54 +0000
Date: Tue, 04 Aug 2026 13:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Piotr =?utf-8?Q?Pi=C3=B3rkowski"?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 0dcdade9472358d1889d9040e5648c18ca86d075
Message-ID: <202608041304.v8ZeFnyi-lkp@intel.com>
User-Agent: s-nail v14.9.25
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
branch HEAD: 0dcdade9472358d1889d9040e5648c18ca86d075  drm/xe/mert: Rate limit VF LMTT fault debug log

elapsed time: 729m

configs tested: 60
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260804    gcc-15.2.0
arc                  randconfig-002-20260804    gcc-8.5.0
arm                  randconfig-001-20260804    gcc-10.5.0
arm                  randconfig-002-20260804    gcc-15.2.0
arm                  randconfig-003-20260804    clang-17
arm                  randconfig-004-20260804    gcc-8.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260804    gcc-9.5.0
csky                 randconfig-002-20260804    gcc-11.5.0
hexagon              randconfig-001-20260804    clang-24
hexagon              randconfig-002-20260804    clang-24
i386                            allmodconfig    gcc-14
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260804    gcc-14
i386                 randconfig-002-20260804    gcc-14
i386                 randconfig-003-20260804    gcc-14
i386                 randconfig-004-20260804    gcc-14
i386                 randconfig-005-20260804    gcc-14
i386                 randconfig-006-20260804    clang-22
i386                 randconfig-007-20260804    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260804    clang-24
loongarch            randconfig-002-20260804    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260804    gcc-8.5.0
nios2                randconfig-002-20260804    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-002-20260804    gcc-8.5.0
powerpc              randconfig-001-20260804    clang-24
powerpc              randconfig-002-20260804    gcc-11.5.0
powerpc                    tqm8541_defconfig    clang-24
powerpc64            randconfig-002-20260804    gcc-8.5.0
riscv                randconfig-002-20260804    gcc-13.4.0
s390                 randconfig-002-20260804    clang-18
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260804    gcc-16.1.0
sh                   randconfig-002-20260804    gcc-16.1.0
sparc                randconfig-001-20260804    gcc-16.1.0
sparc                randconfig-002-20260804    gcc-16.1.0
sparc64              randconfig-001-20260804    clang-24
sparc64              randconfig-002-20260804    clang-20
um                   randconfig-001-20260804    gcc-14
um                   randconfig-002-20260804    gcc-14
x86_64     buildonly-randconfig-001-20260804    gcc-14
x86_64     buildonly-randconfig-002-20260804    clang-22
x86_64     buildonly-randconfig-003-20260804    gcc-14
x86_64     buildonly-randconfig-004-20260804    gcc-14
x86_64     buildonly-randconfig-005-20260804    clang-22
x86_64     buildonly-randconfig-006-20260804    clang-22
x86_64               randconfig-001-20260804    gcc-14
xtensa               randconfig-001-20260804    gcc-8.5.0
xtensa               randconfig-002-20260804    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
