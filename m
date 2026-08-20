Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B27C5DF82
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 06:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA3310E147;
	Thu, 20 Aug 2026 06:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkhJj/AU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F6410E147
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 06:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787207471; x=1818743471;
 h=date:from:to:cc:subject:message-id;
 bh=mVA7o6bY6Myo8Tg1eLVWKr5iUbQLCWwuNgKbtIT3eIk=;
 b=OkhJj/AUaDEKzFg0ApfH1iyGSthDhv9dxht68OhvFrUOxkkfCJMzKRw1
 kYrDvHmWdkqEzLEN+vgpco5DamEMBJj8LAUssKDj63o9tNs4zginAp1/T
 gwNR/eSxRERwwxD1//2VeRLT7bvFigtucoWTz+v1b1B4tXGsVSjU0JUWO
 39gQoCCZF0qlOWJXuK2gD4EUF65jEmI+ivj6G72tSWSp8azSzZnr6oJeI
 ODiKvxsT7rs0inZMvTDeira1kYz9qzS8TIpdAeGmBTMsAarPQZF4lbbKs
 qS8krKH3wYFyiSoVE2UWvlqtgu6AytD1VQMnUEK8WgnS3gkK1YiJHnk9p g==;
X-CSE-ConnectionGUID: 1AGADA51SayLkS5tJbbL4g==
X-CSE-MsgGUID: aa0nVnOCTEi7GZ0g2RDC0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="110519390"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="110519390"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 23:31:10 -0700
X-CSE-ConnectionGUID: uZIVF7M7TfWF+HihN984jQ==
X-CSE-MsgGUID: fiCfbpWUS3qldfWENE8+sw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2026 23:31:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wwwIt-00000000i6T-0giL;
 Thu, 20 Aug 2026 06:31:07 +0000
Date: Thu, 20 Aug 2026 14:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 3d318fe4e99a627aa3c2980699e2e9f13ad18516
Message-ID: <202608201459.yvwMRL7R-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: 3d318fe4e99a627aa3c2980699e2e9f13ad18516  drm/xe: tests: fix error message in xe_migrate_sanity_test()

elapsed time: 1886m

configs tested: 171
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260819    gcc-11.5.0
arc                  randconfig-001-20260820    clang-24
arc                  randconfig-002-20260819    gcc-11.5.0
arc                  randconfig-002-20260820    clang-24
arm                  randconfig-001-20260819    gcc-11.5.0
arm                  randconfig-001-20260820    clang-24
arm                  randconfig-002-20260819    gcc-11.5.0
arm                  randconfig-002-20260820    clang-24
arm                  randconfig-003-20260819    gcc-11.5.0
arm                  randconfig-003-20260820    clang-24
arm                  randconfig-004-20260819    gcc-11.5.0
arm                  randconfig-004-20260820    clang-24
arm                          sunxi_defconfig    gcc-16.1.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260819    gcc-11.5.0
arm64                randconfig-001-20260819    gcc-14.3.0
arm64                randconfig-001-20260819    gcc-9.5.0
arm64                randconfig-002-20260819    clang-17
arm64                randconfig-002-20260819    gcc-14.3.0
arm64                randconfig-002-20260819    gcc-9.5.0
arm64                randconfig-003-20260819    clang-17
arm64                randconfig-003-20260819    gcc-14.3.0
arm64                randconfig-003-20260819    gcc-9.5.0
arm64                randconfig-004-20260819    gcc-14.3.0
arm64                randconfig-004-20260819    gcc-8.5.0
arm64                randconfig-004-20260819    gcc-9.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260819    gcc-14.3.0
csky                 randconfig-001-20260819    gcc-9.5.0
csky                 randconfig-002-20260819    gcc-11.5.0
csky                 randconfig-002-20260819    gcc-14.3.0
csky                 randconfig-002-20260819    gcc-9.5.0
hexagon                       randconfig-001    gcc-11.5.0
hexagon                       randconfig-001    gcc-14.3.0
hexagon              randconfig-001-20260819    gcc-11.5.0
hexagon              randconfig-001-20260820    gcc-14.3.0
hexagon              randconfig-002-20260819    gcc-11.5.0
hexagon              randconfig-002-20260820    gcc-14.3.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260819    gcc-14
i386       buildonly-randconfig-001-20260820    gcc-14
i386       buildonly-randconfig-002-20260819    gcc-14
i386       buildonly-randconfig-002-20260820    gcc-14
i386       buildonly-randconfig-003-20260819    gcc-14
i386       buildonly-randconfig-003-20260820    gcc-14
i386       buildonly-randconfig-004-20260819    gcc-14
i386       buildonly-randconfig-004-20260820    gcc-14
i386       buildonly-randconfig-005-20260819    gcc-14
i386       buildonly-randconfig-005-20260820    gcc-14
i386       buildonly-randconfig-006-20260819    gcc-14
i386       buildonly-randconfig-006-20260820    gcc-14
i386                 randconfig-001-20260819    gcc-14
i386                 randconfig-002-20260819    gcc-14
i386                 randconfig-003-20260819    gcc-14
i386                 randconfig-004-20260819    gcc-14
i386                 randconfig-005-20260819    gcc-14
i386                 randconfig-006-20260819    gcc-14
i386                 randconfig-007-20260819    gcc-14
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260819    gcc-14
i386                 randconfig-012-20260819    gcc-14
i386                 randconfig-013-20260819    gcc-14
i386                 randconfig-014-20260819    gcc-14
i386                 randconfig-015-20260819    gcc-14
i386                 randconfig-016-20260819    gcc-14
i386                 randconfig-017-20260819    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260819    gcc-11.5.0
loongarch            randconfig-001-20260820    gcc-14.3.0
loongarch            randconfig-002-20260819    gcc-11.5.0
loongarch            randconfig-002-20260820    gcc-14.3.0
mips                    cu1000-neo_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260819    gcc-11.5.0
nios2                randconfig-001-20260820    gcc-14.3.0
nios2                randconfig-002-20260819    gcc-11.5.0
nios2                randconfig-002-20260820    gcc-14.3.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    clang-24
parisc               randconfig-001-20260819    clang-24
parisc               randconfig-001-20260820    gcc-8.5.0
parisc               randconfig-002-20260819    clang-24
parisc               randconfig-002-20260820    gcc-8.5.0
powerpc              randconfig-001-20260819    clang-24
powerpc              randconfig-001-20260820    gcc-8.5.0
powerpc              randconfig-002-20260819    clang-24
powerpc              randconfig-002-20260820    gcc-8.5.0
powerpc64            randconfig-001-20260819    clang-24
powerpc64            randconfig-001-20260820    gcc-8.5.0
powerpc64            randconfig-002-20260819    clang-24
powerpc64            randconfig-002-20260820    gcc-8.5.0
riscv                         randconfig-001    clang-24
riscv                randconfig-001-20260819    clang-24
riscv                randconfig-001-20260819    gcc-8.5.0
riscv                randconfig-002-20260819    clang-24
riscv                randconfig-002-20260819    gcc-9.5.0
s390                 randconfig-001-20260819    clang-24
s390                 randconfig-001-20260819    gcc-14.3.0
s390                 randconfig-002-20260819    clang-24
sh                                 defconfig    gcc-16.1.0
sh                kfr2r09-romimage_defconfig    gcc-16.1.0
sh                   randconfig-001-20260819    clang-24
sh                   randconfig-001-20260819    gcc-16.1.0
sh                   randconfig-002-20260819    clang-24
sh                   randconfig-002-20260819    gcc-11.5.0
sparc                randconfig-001-20260819    gcc-10.5.0
sparc                randconfig-001-20260820    gcc-13.4.0
sparc                randconfig-002-20260819    gcc-10.5.0
sparc                randconfig-002-20260820    gcc-13.4.0
sparc64              randconfig-001-20260819    gcc-10.5.0
sparc64              randconfig-001-20260820    gcc-13.4.0
sparc64              randconfig-002-20260819    gcc-10.5.0
sparc64              randconfig-002-20260820    gcc-13.4.0
um                   randconfig-001-20260819    gcc-10.5.0
um                   randconfig-001-20260820    gcc-13.4.0
um                   randconfig-002-20260819    gcc-10.5.0
um                   randconfig-002-20260820    gcc-13.4.0
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260819    gcc-14
x86_64     buildonly-randconfig-001-20260820    gcc-14
x86_64     buildonly-randconfig-002-20260819    gcc-14
x86_64     buildonly-randconfig-002-20260820    gcc-14
x86_64     buildonly-randconfig-003-20260819    gcc-14
x86_64     buildonly-randconfig-003-20260820    gcc-14
x86_64     buildonly-randconfig-004-20260819    gcc-14
x86_64     buildonly-randconfig-004-20260820    gcc-14
x86_64     buildonly-randconfig-005-20260819    gcc-14
x86_64     buildonly-randconfig-005-20260820    gcc-14
x86_64     buildonly-randconfig-006-20260819    gcc-14
x86_64     buildonly-randconfig-006-20260820    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260819    gcc-14
x86_64               randconfig-002-20260819    gcc-14
x86_64               randconfig-003-20260819    gcc-14
x86_64               randconfig-004-20260819    gcc-14
x86_64               randconfig-005-20260819    gcc-14
x86_64               randconfig-006-20260819    gcc-14
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260819    clang-22
x86_64               randconfig-012-20260819    clang-22
x86_64               randconfig-013-20260819    clang-22
x86_64               randconfig-014-20260819    clang-22
x86_64               randconfig-015-20260819    clang-22
x86_64               randconfig-016-20260819    clang-22
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260819    clang-22
x86_64               randconfig-071-20260819    gcc-14
x86_64               randconfig-072-20260819    clang-22
x86_64               randconfig-072-20260819    gcc-14
x86_64               randconfig-073-20260819    clang-22
x86_64               randconfig-073-20260819    gcc-12
x86_64               randconfig-074-20260819    clang-22
x86_64               randconfig-075-20260819    clang-22
x86_64               randconfig-075-20260819    gcc-14
x86_64               randconfig-076-20260819    clang-22
x86_64               randconfig-076-20260819    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa                      common_defconfig    gcc-16.1.0
xtensa               randconfig-001-20260819    gcc-10.5.0
xtensa               randconfig-001-20260820    gcc-13.4.0
xtensa               randconfig-002-20260819    gcc-10.5.0
xtensa               randconfig-002-20260820    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
