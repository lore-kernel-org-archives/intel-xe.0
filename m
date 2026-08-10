Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE9BC5AD55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 02:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352FC10E11C;
	Mon, 10 Aug 2026 02:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLyJmTMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC5F10E11C
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 02:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786328780; x=1817864780;
 h=date:from:to:cc:subject:message-id;
 bh=vuesiAH/22vvO/oYWbVgTa1V8nKxmPx64MQCMetuY5w=;
 b=XLyJmTMG2RGRTrQnebSOtqdCfBLFvAf6xRwAc4BuvYkI+JPKkyXlTsV4
 QlCjSawdKYMtuLb3H/8vNG7n3BwFwJpn+YkPObQYGXl9ioo6DRwPTp6t1
 676aeZMPC3bChTPPjVAe7GX0l69jKG/rGZ0BF2/w3R+dUykkRDjr6wF+w
 SiSOwpAETOZ6/YcOqRnKzGwvtB4Rf7a79JfVz55izLGhDgyoIEsaYaJ39
 ZPyewRLslC3bLkpy+H/PqvvPCosgR9NXm518sS9H7Ez/UMH1Nvb4kI7qz
 ehJkGzax1BsScIUTDTh1aYETHOM1UDmiCe/5FRttc4n6XWkgMXfTVDooH g==;
X-CSE-ConnectionGUID: 4o68AkibSmSKEXnME95Vew==
X-CSE-MsgGUID: G3FJod3JRqqosVKYsNPHMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="85955789"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; d="scan'208";a="85955789"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 19:26:20 -0700
X-CSE-ConnectionGUID: CW1p5wSwQGGpa1RK5x3r7g==
X-CSE-MsgGUID: jdEuT8DtSmCh+vhYNZlK+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; d="scan'208";a="261166746"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 09 Aug 2026 19:26:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wtFiR-00000000MYQ-2Wsf;
 Mon, 10 Aug 2026 02:26:15 +0000
Date: Mon, 10 Aug 2026 10:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS WITH UNVERIFIED WARNING
 136360290f314890428a3fbf31aaa8e4f1d43567
Message-ID: <202608101031.mC43sSqi-lkp@intel.com>
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
branch HEAD: 136360290f314890428a3fbf31aaa8e4f1d43567  drm/xe: Order ring writes before ring tail updates

Unverified Warning (likely false positive, kindly check if interested):

    https://lore.kernel.org/oe-kbuild/202607120341.jYqqcMOB-lkp@intel.com

    drivers/gpu/drm/xe/xe_guc_ads.c:391:49: sparse: sparse: Trying to use reserved word 'struct' as identifier

Warning ids grouped by kconfigs:

recent_errors
|-- loongarch-randconfig-r112-20260809
|   `-- drivers-gpu-drm-xe-xe_guc_ads.c:sparse:sparse:Trying-to-use-reserved-word-struct-as-identifier
`-- x86_64-randconfig-123-20260809
    `-- drivers-gpu-drm-xe-xe_guc_ads.c:sparse:sparse:Trying-to-use-reserved-word-struct-as-identifier

elapsed time: 3049m

configs tested: 98
configs skipped: 1

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260809    gcc-10.5.0
arc                  randconfig-002-20260809    gcc-12.5.0
arm                  randconfig-001-20260809    gcc-8.5.0
arm                  randconfig-002-20260809    gcc-10.5.0
arm                  randconfig-003-20260809    clang-24
arm                  randconfig-004-20260809    clang-17
arm64                randconfig-001-20260809    gcc-10.5.0
arm64                randconfig-002-20260809    gcc-12.5.0
arm64                randconfig-003-20260809    clang-19
arm64                randconfig-004-20260809    clang-24
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260809    gcc-16.1.0
csky                 randconfig-002-20260809    gcc-14.3.0
hexagon              randconfig-001-20260809    clang-17
hexagon              randconfig-002-20260809    clang-17
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260809    clang-22
i386       buildonly-randconfig-002-20260809    clang-22
i386       buildonly-randconfig-003-20260809    clang-22
i386       buildonly-randconfig-004-20260809    gcc-14
i386       buildonly-randconfig-005-20260809    gcc-14
i386       buildonly-randconfig-006-20260809    clang-22
i386                 randconfig-001-20260809    clang-22
i386                 randconfig-002-20260809    gcc-14
i386                 randconfig-003-20260809    clang-22
i386                 randconfig-004-20260809    clang-22
i386                 randconfig-005-20260809    clang-22
i386                 randconfig-006-20260809    clang-22
i386                 randconfig-007-20260809    gcc-14
i386                 randconfig-011-20260809    gcc-14
i386                 randconfig-012-20260809    clang-22
i386                 randconfig-013-20260809    gcc-14
i386                 randconfig-014-20260809    gcc-14
i386                 randconfig-015-20260809    gcc-14
i386                 randconfig-016-20260809    clang-22
i386                 randconfig-017-20260809    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260809    clang-18
loongarch            randconfig-002-20260809    gcc-12.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260809    gcc-8.5.0
nios2                randconfig-002-20260809    gcc-8.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260809    gcc-15.2.0
parisc               randconfig-002-20260809    gcc-8.5.0
powerpc              randconfig-001-20260809    clang-24
powerpc              randconfig-002-20260809    clang-24
powerpc64            randconfig-001-20260809    clang-17
powerpc64            randconfig-002-20260809    clang-24
riscv                         randconfig-001    gcc-13.4.0
riscv                randconfig-001-20260809    clang-24
riscv                randconfig-002-20260809    clang-20
s390                 randconfig-001-20260809    gcc-11.5.0
s390                 randconfig-002-20260809    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260809    gcc-16.1.0
sh                   randconfig-002-20260809    gcc-10.5.0
sparc                randconfig-001-20260809    gcc-8.5.0
sparc                randconfig-002-20260809    gcc-11.5.0
sparc64              randconfig-001-20260809    gcc-9.5.0
sparc64              randconfig-002-20260809    clang-24
um                   randconfig-001-20260809    clang-18
um                   randconfig-002-20260809    clang-17
x86_64     buildonly-randconfig-001-20260809    clang-22
x86_64     buildonly-randconfig-002-20260809    gcc-14
x86_64     buildonly-randconfig-003-20260809    gcc-14
x86_64     buildonly-randconfig-004-20260809    clang-22
x86_64     buildonly-randconfig-005-20260809    clang-22
x86_64     buildonly-randconfig-006-20260809    gcc-14
x86_64               randconfig-001-20260809    clang-22
x86_64               randconfig-002-20260809    gcc-14
x86_64               randconfig-003-20260809    clang-22
x86_64               randconfig-004-20260809    clang-22
x86_64               randconfig-005-20260809    clang-22
x86_64               randconfig-006-20260809    gcc-14
x86_64               randconfig-011-20260809    clang-22
x86_64               randconfig-012-20260809    gcc-14
x86_64               randconfig-013-20260809    gcc-14
x86_64               randconfig-014-20260809    clang-22
x86_64               randconfig-015-20260809    gcc-14
x86_64               randconfig-016-20260809    clang-22
x86_64               randconfig-071-20260809    clang-22
x86_64               randconfig-072-20260809    clang-22
x86_64               randconfig-073-20260809    clang-22
x86_64               randconfig-074-20260809    clang-22
x86_64               randconfig-075-20260809    gcc-14
x86_64               randconfig-076-20260809    clang-22
xtensa                 nommu_kc705_defconfig    gcc-16.1.0
xtensa               randconfig-001-20260809    gcc-13.4.0
xtensa               randconfig-002-20260809    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
