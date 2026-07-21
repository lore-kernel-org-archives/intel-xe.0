Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478B6C44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 06:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047E410E29F;
	Tue, 21 Jul 2026 06:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0E+L10s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E3D10E29F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 06:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784614281; x=1816150281;
 h=date:from:to:cc:subject:message-id;
 bh=2y5yWgtulnt6k6xKYYPOczXthU/331APL1zhk9DyVDc=;
 b=N0E+L10soKMt3oKutSj6rvVbwza/FqZBafFeeMTP/udhyAeHje5rH2XV
 8zrDzvPK5CBnHsrtzA9DlOcQ7Zf2em6TVQmfWofRjHwJ7G4A3FO2GAmM4
 f+La06qwEWM8Tr70WPfdWKsKLGCyL/EzI7fjmMFbFRH8yS4KK5PJ5qtDG
 8nIB99Gr28nLzR0HvOaGbrsn0Ax4Nn5QxNfCyRaZr4YTxg2qdiJhOSmoa
 Mh+py9OGgFZFx3eg72xyGQBvChHcGREst0pVXbP12jOG+zIZutdYSmbFM
 x8Bot50eRtcwQYuKofh8aTq/5haYNDR/AHmZ7mSjOpnJ+PRvYoQtYsJ10 Q==;
X-CSE-ConnectionGUID: ig/QI1vQR9usVwJbKGIe2g==
X-CSE-MsgGUID: 9h3wtxX9Qsay4FJ0PXUvZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="84333287"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="84333287"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 23:11:21 -0700
X-CSE-ConnectionGUID: FXfBwtxiT8ue89IHUKPA2g==
X-CSE-MsgGUID: oRN9cAt2QCmdGMJd2Abf/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="258306429"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 20 Jul 2026 23:11:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wm3hF-00000000XG0-0lKY;
 Tue, 21 Jul 2026 06:11:17 +0000
Date: Tue, 21 Jul 2026 14:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 942cbdcc8c07dc74a8d118914fc0a23e8fe76642
Message-ID: <202607211417.O3vJJh3m-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 942cbdcc8c07dc74a8d118914fc0a23e8fe76642  drm/xe/xe_ras: Add support to query device memory errors

elapsed time: 757m

configs tested: 82
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-8.5.0
arc                  randconfig-001-20260721    gcc-8.5.0
arc                  randconfig-002-20260721    gcc-8.5.0
arm                  randconfig-001-20260721    gcc-8.5.0
arm                  randconfig-002-20260721    gcc-8.5.0
arm                  randconfig-003-20260721    gcc-8.5.0
arm                  randconfig-004-20260721    gcc-8.5.0
arm64                randconfig-001-20260721    gcc-13.4.0
arm64                randconfig-002-20260721    gcc-13.4.0
arm64                randconfig-003-20260721    gcc-13.4.0
arm64                randconfig-004-20260721    gcc-13.4.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260721    gcc-13.4.0
csky                 randconfig-002-20260721    gcc-13.4.0
hexagon              randconfig-001-20260721    gcc-8.5.0
hexagon              randconfig-002-20260721    gcc-8.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260721    gcc-14
i386       buildonly-randconfig-002-20260721    gcc-14
i386       buildonly-randconfig-003-20260721    gcc-14
i386       buildonly-randconfig-004-20260721    gcc-14
i386       buildonly-randconfig-005-20260721    gcc-14
i386       buildonly-randconfig-006-20260721    gcc-14
i386                 randconfig-001-20260721    clang-22
i386                 randconfig-002-20260721    clang-22
i386                 randconfig-003-20260721    clang-22
i386                 randconfig-004-20260721    clang-22
i386                 randconfig-005-20260721    clang-22
i386                 randconfig-006-20260721    clang-22
i386                 randconfig-007-20260721    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260721    gcc-8.5.0
loongarch            randconfig-002-20260721    gcc-8.5.0
mips                         rb532_defconfig    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260721    gcc-8.5.0
nios2                randconfig-002-20260721    gcc-8.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260721    gcc-11.5.0
parisc               randconfig-002-20260721    gcc-11.5.0
powerpc              randconfig-001-20260721    gcc-11.5.0
powerpc              randconfig-002-20260721    gcc-11.5.0
powerpc64            randconfig-001-20260721    gcc-11.5.0
powerpc64            randconfig-002-20260721    gcc-11.5.0
sh                                 defconfig    gcc-16.1.0
sparc                randconfig-001-20260721    gcc-8.5.0
sparc                randconfig-002-20260721    gcc-8.5.0
sparc64              randconfig-001-20260721    gcc-8.5.0
sparc64              randconfig-002-20260721    gcc-8.5.0
um                   randconfig-001-20260721    gcc-8.5.0
um                   randconfig-002-20260721    gcc-8.5.0
x86_64     buildonly-randconfig-001-20260721    clang-22
x86_64     buildonly-randconfig-002-20260721    clang-22
x86_64     buildonly-randconfig-003-20260721    clang-22
x86_64     buildonly-randconfig-004-20260721    clang-22
x86_64     buildonly-randconfig-005-20260721    clang-22
x86_64     buildonly-randconfig-006-20260721    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-011-20260721    clang-22
x86_64               randconfig-012-20260721    clang-22
x86_64               randconfig-013-20260721    clang-22
x86_64               randconfig-014-20260721    clang-22
x86_64               randconfig-015-20260721    clang-22
x86_64               randconfig-016-20260721    clang-22
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260721    gcc-14
x86_64               randconfig-072-20260721    gcc-14
x86_64               randconfig-073-20260721    gcc-14
x86_64               randconfig-074-20260721    gcc-14
x86_64               randconfig-075-20260721    gcc-14
x86_64               randconfig-076-20260721    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260721    gcc-8.5.0
xtensa               randconfig-002-20260721    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
