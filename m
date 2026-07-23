Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCE1C531D0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 22:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F1A10F223;
	Thu, 23 Jul 2026 22:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5yKzmJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C6810F223
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 22:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784844568; x=1816380568;
 h=date:from:to:cc:subject:message-id;
 bh=s3TO1gvnA/ZgPqh0GrdZgDnENzsxNGQpqNGKKx+DLdU=;
 b=P5yKzmJ8Ht8gkcP5HifFj8Zo0Z3Ck46kLspKrvVbaC5vcognzOT0vrA0
 q+IEMLMi5U0XTGZXz+6gjYVdgzjMZYkeZx9Skdfl6sKpdffh9Ko+R58+8
 Qgj1nYAviRvlclsUM7Ns3sKEcL/lxaMydEkC7DKz+B16HglOHOWAQ01lT
 lg80j4BNVem5+AKMyVRgd32skZRz+31Jjw+VsQMKyRTbqPztFnVhGL82Z
 6D1PlLfuRKkNSJwYCvJPnmJbRz1XkmVArFr6yXXc43eelZUQZJHysFD3q
 NzfTE3+o7M/4Tin7QjlwCWhSbMeMVHwzs8JZdTMM3j/OOj5PyrUkJxMBu g==;
X-CSE-ConnectionGUID: vvrmZ0yeSl+cJb/wsyrN9Q==
X-CSE-MsgGUID: qumkvARvSmCb6fjlTM4Gog==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85454801"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="85454801"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 15:09:27 -0700
X-CSE-ConnectionGUID: AEPa3FchQqu3J+C5W8zrkw==
X-CSE-MsgGUID: 43h3in0aRjWDgrXun6PIsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="283042596"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 23 Jul 2026 15:09:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wn1bP-00000000a7s-42qe;
 Thu, 23 Jul 2026 22:09:22 +0000
Date: Fri, 24 Jul 2026 06:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS WITH UNVERIFIED WARNING
 8b2d3bb766c69976da4767fb3b7299a909367f58
Message-ID: <202607240600.0NC1E5LK-lkp@intel.com>
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
branch HEAD: 8b2d3bb766c69976da4767fb3b7299a909367f58  drm/xe/nvls: Drop force_probe requirement

Unverified Warning (likely false positive, kindly check if interested):

    https://lore.kernel.org/oe-kbuild/202607120341.jYqqcMOB-lkp@intel.com

    drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: Trying to use reserved word 'struct' as identifier

Warning ids grouped by kconfigs:

recent_errors
|-- x86_64-randconfig-121-20260723
|   `-- drivers-gpu-drm-xe-xe_guc_ads.c:sparse:sparse:Trying-to-use-reserved-word-struct-as-identifier
`-- x86_64-randconfig-123-20260723
    `-- drivers-gpu-drm-xe-xe_guc_ads.c:sparse:sparse:Trying-to-use-reserved-word-struct-as-identifier

elapsed time: 836m

configs tested: 90
configs skipped: 4

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260723    gcc-8.5.0
arc                  randconfig-002-20260723    gcc-11.5.0
arm                  randconfig-001-20260723    clang-24
arm                  randconfig-002-20260723    gcc-13.4.0
arm                  randconfig-003-20260723    gcc-8.5.0
arm                  randconfig-004-20260723    gcc-13.4.0
arm64                              defconfig    gcc-16.1.0
arm64                randconfig-002-20260723    gcc-15.2.0
arm64                randconfig-003-20260723    gcc-13.4.0
arm64                randconfig-004-20260723    gcc-8.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260723    gcc-15.2.0
csky                 randconfig-002-20260723    gcc-16.1.0
hexagon              randconfig-001-20260723    clang-24
hexagon              randconfig-002-20260723    clang-17
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260723    clang-22
i386       buildonly-randconfig-002-20260723    clang-22
i386       buildonly-randconfig-003-20260723    gcc-12
i386       buildonly-randconfig-004-20260723    gcc-14
i386       buildonly-randconfig-005-20260723    gcc-14
i386       buildonly-randconfig-006-20260723    gcc-14
i386                 randconfig-001-20260723    gcc-14
i386                 randconfig-002-20260723    gcc-14
i386                 randconfig-003-20260723    clang-22
i386                 randconfig-004-20260723    gcc-14
i386                 randconfig-005-20260723    clang-22
i386                 randconfig-006-20260723    clang-22
i386                 randconfig-007-20260723    gcc-14
i386                          randconfig-011    clang-22
i386                 randconfig-011-20260723    clang-22
i386                 randconfig-012-20260723    clang-22
i386                 randconfig-013-20260723    gcc-14
i386                 randconfig-014-20260723    clang-22
i386                 randconfig-015-20260723    clang-22
i386                 randconfig-016-20260723    clang-22
i386                 randconfig-017-20260723    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260723    clang-18
loongarch            randconfig-002-20260723    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260723    gcc-8.5.0
nios2                randconfig-002-20260723    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260723    gcc-8.5.0
parisc               randconfig-002-20260723    gcc-10.5.0
powerpc              randconfig-001-20260723    gcc-8.5.0
powerpc64            randconfig-001-20260723    gcc-10.5.0
powerpc64            randconfig-002-20260723    clang-18
riscv                         randconfig-001    gcc-13.4.0
riscv                randconfig-002-20260723    gcc-15.2.0
s390                 randconfig-001-20260723    gcc-8.5.0
s390                 randconfig-002-20260723    gcc-10.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260723    gcc-15.2.0
sh                   randconfig-002-20260723    gcc-16.1.0
sparc                randconfig-001-20260723    gcc-8.5.0
sparc                randconfig-002-20260723    gcc-8.5.0
sparc64              randconfig-001-20260723    clang-20
sparc64              randconfig-002-20260723    gcc-8.5.0
um                   randconfig-001-20260723    clang-21
um                   randconfig-002-20260723    clang-24
x86_64     buildonly-randconfig-001-20260723    gcc-14
x86_64     buildonly-randconfig-002-20260723    gcc-14
x86_64     buildonly-randconfig-003-20260723    clang-22
x86_64     buildonly-randconfig-004-20260723    gcc-14
x86_64     buildonly-randconfig-005-20260723    gcc-14
x86_64     buildonly-randconfig-006-20260723    gcc-12
x86_64               randconfig-001-20260723    clang-22
x86_64               randconfig-002-20260723    clang-22
x86_64               randconfig-003-20260723    clang-22
x86_64               randconfig-004-20260723    clang-22
x86_64               randconfig-005-20260723    clang-22
x86_64               randconfig-006-20260723    gcc-14
x86_64               randconfig-011-20260723    gcc-14
x86_64               randconfig-012-20260723    gcc-14
x86_64               randconfig-013-20260723    clang-22
x86_64               randconfig-014-20260723    gcc-14
x86_64               randconfig-015-20260723    gcc-14
x86_64               randconfig-016-20260723    gcc-14
xtensa               randconfig-001-20260723    gcc-8.5.0
xtensa               randconfig-002-20260723    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
