Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B96DC44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 06:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DDB10E1F7;
	Tue, 21 Jul 2026 06:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkeNLsPs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B4210E1F7
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 06:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784613797; x=1816149797;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=tceLgMxUBLciDYUWC9MW18wFYZSjrcT6p1/4JAIZeiA=;
 b=QkeNLsPs51Fk4SFuAYT3kYYnl7Sl0lsXoFTDJipEpomfj7vq2pguR64n
 Bo/cRZsRQXGNfKPY/kJkLMBDohPdGfGUmujgOKzafoZN6dlIHxOM1Dtxl
 Ji3Pgpdr401HID+pe3eKbQRm/9csiOkec0FkUhIXPoJQcpt8aB73lM2rL
 4w0OQPVSm5c5he+pEvFK46Gh2IPXEbMMsRR6CnZ7Q2D4tbsZkHMbON8k5
 BqWC2yozz0p9TUt9Nw2Lkv3u3qW2kY1JDYHi72CptObe0j05XeXF8D7xJ
 0tfLnT5TaalSbdY35ajBggX3MPh+XydilDRng8T1duk5HCZgF1KnGGWxN A==;
X-CSE-ConnectionGUID: BymWcPJ3SlmsKaywIcDv0g==
X-CSE-MsgGUID: 4qyyZPTqStmrtQWEKpMKbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="102751460"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="102751460"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 23:03:17 -0700
X-CSE-ConnectionGUID: voQoffMiT4u+cscbrRzcew==
X-CSE-MsgGUID: VIpB8yiIQs6Fwsdpie1ZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="258305464"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 20 Jul 2026 23:03:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wm3ZR-00000000XFk-1PBE;
 Tue, 21 Jul 2026 06:03:13 +0000
Date: Tue, 21 Jul 2026 14:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 57441577bac3637473da2c9644336eaa0ac5732f
Message-ID: <202607211410.gCwc9XIu-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 57441577bac3637473da2c9644336eaa0ac5732f  drm/xe/madvise: Skip invalidation for purgeable state updates

elapsed time: 749m

configs tested: 83
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-8.5.0
arc                  randconfig-001-20260721    gcc-11.5.0
arc                  randconfig-002-20260721    gcc-13.4.0
arm                  randconfig-001-20260721    clang-17
arm                  randconfig-002-20260721    gcc-8.5.0
arm                  randconfig-003-20260721    gcc-13.4.0
arm                  randconfig-004-20260721    gcc-8.5.0
arm64                randconfig-001-20260721    clang-17
arm64                randconfig-002-20260721    gcc-9.5.0
arm64                randconfig-003-20260721    gcc-8.5.0
arm64                randconfig-004-20260721    gcc-13.4.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260721    gcc-16.1.0
csky                 randconfig-002-20260721    gcc-11.5.0
hexagon              randconfig-001-20260721    clang-17
hexagon              randconfig-002-20260721    clang-17
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260721    gcc-14
i386       buildonly-randconfig-002-20260721    gcc-14
i386       buildonly-randconfig-003-20260721    clang-22
i386       buildonly-randconfig-004-20260721    clang-22
i386       buildonly-randconfig-005-20260721    gcc-14
i386       buildonly-randconfig-006-20260721    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260721    gcc-15.2.0
loongarch            randconfig-002-20260721    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260721    gcc-11.5.0
nios2                randconfig-002-20260721    gcc-8.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260721    gcc-8.5.0
parisc               randconfig-002-20260721    gcc-12.5.0
powerpc              randconfig-001-20260721    clang-24
powerpc              randconfig-002-20260721    clang-18
powerpc64            randconfig-001-20260721    gcc-11.5.0
powerpc64            randconfig-002-20260721    clang-24
riscv                              defconfig    clang-24
riscv                randconfig-001-20260721    gcc-15.2.0
riscv                randconfig-002-20260721    clang-17
s390                 randconfig-001-20260721    clang-24
s390                 randconfig-002-20260721    clang-18
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260721    gcc-13.4.0
sh                   randconfig-002-20260721    gcc-11.5.0
sparc                randconfig-001-20260721    gcc-16.1.0
sparc                randconfig-002-20260721    gcc-14.3.0
sparc64              randconfig-001-20260721    clang-24
sparc64              randconfig-002-20260721    clang-24
um                   randconfig-001-20260721    gcc-14
um                   randconfig-002-20260721    gcc-14
x86_64     buildonly-randconfig-001-20260721    gcc-14
x86_64     buildonly-randconfig-002-20260721    clang-22
x86_64     buildonly-randconfig-003-20260721    gcc-14
x86_64     buildonly-randconfig-004-20260721    clang-22
x86_64     buildonly-randconfig-005-20260721    clang-22
x86_64     buildonly-randconfig-006-20260721    gcc-14
x86_64               randconfig-001-20260721    clang-22
x86_64               randconfig-002-20260721    clang-22
x86_64               randconfig-003-20260721    gcc-14
x86_64               randconfig-004-20260721    clang-22
x86_64               randconfig-005-20260721    clang-22
x86_64               randconfig-006-20260721    gcc-13
x86_64               randconfig-011-20260721    clang-22
x86_64               randconfig-012-20260721    gcc-14
x86_64               randconfig-013-20260721    clang-22
x86_64               randconfig-014-20260721    clang-22
x86_64               randconfig-015-20260721    clang-22
x86_64               randconfig-016-20260721    clang-22
x86_64               randconfig-071-20260721    clang-22
x86_64               randconfig-072-20260721    gcc-14
x86_64               randconfig-073-20260721    gcc-14
x86_64               randconfig-074-20260721    clang-22
x86_64               randconfig-075-20260721    gcc-14
x86_64               randconfig-076-20260721    clang-22
xtensa               randconfig-002-20260721    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
