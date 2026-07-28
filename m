Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04975C54F51
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 23:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B8910EA38;
	Tue, 28 Jul 2026 23:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBYRB5wS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C2110EA38
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 23:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785281030; x=1816817030;
 h=date:from:to:cc:subject:message-id;
 bh=bVxwcy2Dv3nqNHLyh/lsv24xWhIG04mhJ+1lRnwHMEo=;
 b=UBYRB5wSRpB+Uv8QXAvPUny4QOCY0TyhExbi0Ovc2xNd49HxixQk7OBU
 S66tSDd5SRkXf39h3qZl4O67bE6kjuLt/97xrumNSxV300nn0cdpckAf6
 7CrfjoWt97PqK8UNRCbvFinq9dOXwIm7gnikdWkwv6OKicMVZJUB0pTIm
 Mjby4gWMi1BFGXwzsnJ9X9dGMZdYpqpw/FYyGH+wKwBNqbCZ+EVJsh6bp
 BW9KUEYoBppU/vBbF7RodCAqZUQ8oOm2zAW/tdwLgkIp3FJaxtsJ8dK94
 /3qco4OkdpBvluLbJmkiYL9ipqsK5rNJFk8TVSMJc4w9H/46izIAqWTU/ g==;
X-CSE-ConnectionGUID: id8AdXAoRDabf/coz40A8A==
X-CSE-MsgGUID: HdTABJTfRHqiWsby7CgDfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85008410"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="85008410"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 16:23:49 -0700
X-CSE-ConnectionGUID: NxlrRNz5RzOwytnNwfpBzQ==
X-CSE-MsgGUID: Y3y9O/MkT+6hJeNrO+AfOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="298062694"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 28 Jul 2026 16:23:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wor9G-00000000eql-1YGz;
 Tue, 28 Jul 2026 23:23:46 +0000
Date: Wed, 29 Jul 2026 07:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 04eeeb45cb61b8a3e9d785003457e550c920ba49
Message-ID: <202607290721.kySMVeG5-lkp@intel.com>
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
branch HEAD: 04eeeb45cb61b8a3e9d785003457e550c920ba49  drm/xe/pt: check no-DMA huge-pte cases before DMA segment test

elapsed time: 799m

configs tested: 101
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260728    gcc-10.5.0
arc                  randconfig-002-20260728    gcc-16.1.0
arm                  randconfig-001-20260728    clang-24
arm                  randconfig-002-20260728    gcc-8.5.0
arm                  randconfig-003-20260728    gcc-8.5.0
arm                  randconfig-004-20260728    gcc-14.3.0
arm64                randconfig-001-20260728    gcc-8.5.0
arm64                randconfig-002-20260728    clang-17
arm64                randconfig-003-20260728    clang-24
arm64                randconfig-004-20260728    gcc-8.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260728    gcc-16.1.0
csky                 randconfig-002-20260728    gcc-10.5.0
hexagon              randconfig-001-20260728    clang-24
hexagon              randconfig-002-20260728    clang-24
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260728    gcc-14
i386       buildonly-randconfig-001-20260729    gcc-14
i386       buildonly-randconfig-002-20260728    clang-22
i386       buildonly-randconfig-002-20260729    gcc-14
i386       buildonly-randconfig-003-20260728    clang-22
i386       buildonly-randconfig-003-20260729    gcc-14
i386       buildonly-randconfig-004-20260728    clang-22
i386       buildonly-randconfig-004-20260729    gcc-14
i386       buildonly-randconfig-005-20260728    gcc-13
i386       buildonly-randconfig-005-20260729    gcc-14
i386       buildonly-randconfig-006-20260728    gcc-14
i386       buildonly-randconfig-006-20260729    gcc-14
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260728    clang-22
i386                 randconfig-002-20260728    clang-22
i386                 randconfig-003-20260728    clang-22
i386                 randconfig-004-20260728    clang-22
i386                 randconfig-005-20260728    gcc-14
i386                 randconfig-006-20260728    clang-22
i386                 randconfig-007-20260728    gcc-14
i386                          randconfig-011    clang-22
i386                 randconfig-011-20260728    clang-22
i386                 randconfig-012-20260728    gcc-14
i386                 randconfig-013-20260728    gcc-14
i386                 randconfig-014-20260728    gcc-14
i386                 randconfig-015-20260728    clang-22
i386                 randconfig-016-20260728    gcc-14
i386                 randconfig-017-20260728    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260728    gcc-16.1.0
loongarch            randconfig-002-20260728    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260728    gcc-11.5.0
nios2                randconfig-002-20260728    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-8.5.0
parisc               randconfig-001-20260728    gcc-8.5.0
parisc               randconfig-002-20260728    gcc-13.4.0
powerpc              randconfig-001-20260728    clang-24
powerpc              randconfig-002-20260728    gcc-8.5.0
powerpc64            randconfig-001-20260728    gcc-10.5.0
powerpc64            randconfig-002-20260728    clang-24
riscv                         randconfig-001    gcc-13.4.0
riscv                randconfig-001-20260728    clang-20
riscv                randconfig-002-20260728    gcc-8.5.0
s390                 randconfig-001-20260728    clang-22
s390                 randconfig-002-20260728    gcc-8.5.0
sh                                 defconfig    gcc-16.1.0
sh                         landisk_defconfig    gcc-16.1.0
sh                   randconfig-001-20260728    gcc-16.1.0
sh                   randconfig-002-20260728    gcc-14.3.0
x86_64     buildonly-randconfig-001-20260728    gcc-13
x86_64     buildonly-randconfig-002-20260728    gcc-13
x86_64     buildonly-randconfig-003-20260728    gcc-13
x86_64     buildonly-randconfig-004-20260728    clang-22
x86_64     buildonly-randconfig-005-20260728    clang-22
x86_64     buildonly-randconfig-006-20260728    clang-22
x86_64               randconfig-001-20260728    gcc-12
x86_64               randconfig-002-20260728    gcc-12
x86_64               randconfig-003-20260728    gcc-12
x86_64               randconfig-004-20260728    clang-22
x86_64               randconfig-005-20260728    gcc-14
x86_64               randconfig-006-20260728    gcc-12
x86_64                        randconfig-011    gcc-14
x86_64               randconfig-011-20260728    clang-22
x86_64               randconfig-012-20260728    clang-22
x86_64               randconfig-013-20260728    clang-22
x86_64               randconfig-014-20260728    clang-22
x86_64               randconfig-015-20260728    clang-22
x86_64               randconfig-016-20260728    gcc-14
x86_64               randconfig-071-20260728    gcc-14
x86_64               randconfig-072-20260728    clang-22
x86_64               randconfig-073-20260728    clang-22
x86_64               randconfig-074-20260728    gcc-14
x86_64               randconfig-075-20260728    clang-22
x86_64               randconfig-076-20260728    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
