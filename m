Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A6AC021B2
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 20:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE6A10E009;
	Sat, 22 Feb 2025 20:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9nWD79D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D550910E009
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 20:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740254985; x=1771790985;
 h=date:from:to:cc:subject:message-id;
 bh=wkDUmc5GsxK0thd+VqTS8FwRLelOIJGM5oFBdhHbvYE=;
 b=l9nWD79DneEiEtbH/WoFQsnVDeIHPsEszLbjeAplo2hP9169MpgE9qV3
 9FvGYx4bAr5Es9A3Q4dKqUz+4SVBQya5xd26orFJhHHyB7v76rb4JdksQ
 MXHNoTLU2PDfX+wXVcB4A3eLaUeJh5DQmb6A/zcx3+HzH3NO5q4bIhFQB
 4tCviAWsG75YAuE2x/jQFXh5ePMhiJR9vjNhA2FLv2WcFO8U7x66/I/ej
 Dhoh/lXKpNcxsM8+Up82gFqfcreL4KoS/K6UR0u/3Ia23W1FdpncqxImb
 7YRIwLq/RDKE8mI/2TLV4yTiATnPEjv7IShuT1gDP0Mv8MENLx+UqYMCF w==;
X-CSE-ConnectionGUID: wvGm3yiNT02JyBsa820cMw==
X-CSE-MsgGUID: nXtWHuAOQa29mO/03TVs3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="41315136"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; d="scan'208";a="41315136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2025 12:09:44 -0800
X-CSE-ConnectionGUID: W/PCogvKR667aQMWEWiuRA==
X-CSE-MsgGUID: tO+MG7NXQuin6T1ZFlyNOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; d="scan'208";a="115698829"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa007.fm.intel.com with ESMTP; 22 Feb 2025 12:09:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tlvoj-0006sF-0v;
 Sat, 22 Feb 2025 20:09:41 +0000
Date: Sun, 23 Feb 2025 04:09:38 +0800
From: kernel test robot <lkp@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 98c9d27ab30aa9c6451d3a34e6e297171f273e51
Message-ID: <202502230432.ut4IqfMV-lkp@intel.com>
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
branch HEAD: 98c9d27ab30aa9c6451d3a34e6e297171f273e51  drm/xe/oa: Ensure that polled read returns latest data

elapsed time: 1446m

configs tested: 71
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250222    gcc-13.2.0
arc                   randconfig-002-20250222    gcc-13.2.0
arm                   randconfig-001-20250222    gcc-14.2.0
arm                   randconfig-002-20250222    gcc-14.2.0
arm                   randconfig-003-20250222    clang-16
arm                   randconfig-004-20250222    gcc-14.2.0
arm64                 randconfig-001-20250222    gcc-14.2.0
arm64                 randconfig-002-20250222    clang-21
arm64                 randconfig-003-20250222    clang-18
arm64                 randconfig-004-20250222    clang-21
csky                  randconfig-001-20250222    gcc-14.2.0
csky                  randconfig-002-20250222    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250222    clang-17
hexagon               randconfig-002-20250222    clang-19
i386        buildonly-randconfig-001-20250222    clang-19
i386        buildonly-randconfig-002-20250222    gcc-12
i386        buildonly-randconfig-003-20250222    gcc-12
i386        buildonly-randconfig-004-20250222    clang-19
i386        buildonly-randconfig-005-20250222    gcc-12
i386        buildonly-randconfig-006-20250222    clang-19
loongarch             randconfig-001-20250222    gcc-14.2.0
loongarch             randconfig-002-20250222    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250222    gcc-14.2.0
nios2                 randconfig-002-20250222    gcc-14.2.0
parisc                randconfig-001-20250222    gcc-14.2.0
parisc                randconfig-002-20250222    gcc-14.2.0
powerpc               randconfig-001-20250222    gcc-14.2.0
powerpc               randconfig-002-20250222    gcc-14.2.0
powerpc               randconfig-003-20250222    gcc-14.2.0
powerpc64             randconfig-001-20250222    gcc-14.2.0
powerpc64             randconfig-002-20250222    clang-16
powerpc64             randconfig-003-20250222    clang-18
riscv                 randconfig-001-20250222    clang-21
riscv                 randconfig-002-20250222    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250222    gcc-14.2.0
s390                  randconfig-002-20250222    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250222    gcc-14.2.0
sh                    randconfig-002-20250222    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250222    gcc-14.2.0
sparc                 randconfig-002-20250222    gcc-14.2.0
sparc64               randconfig-001-20250222    gcc-14.2.0
sparc64               randconfig-002-20250222    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250222    gcc-12
um                    randconfig-002-20250222    gcc-12
x86_64      buildonly-randconfig-001-20250222    clang-19
x86_64      buildonly-randconfig-002-20250222    gcc-12
x86_64      buildonly-randconfig-003-20250222    gcc-12
x86_64      buildonly-randconfig-004-20250222    clang-19
x86_64      buildonly-randconfig-005-20250222    clang-19
x86_64      buildonly-randconfig-006-20250222    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250222    gcc-14.2.0
xtensa                randconfig-002-20250222    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
