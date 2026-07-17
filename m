Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CBCC4451C
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 14:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C431B10E48A;
	Fri, 17 Jul 2026 14:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAhfo6OK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C700B10E48A
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 14:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784298886; x=1815834886;
 h=date:from:to:cc:subject:message-id;
 bh=/M/Fic5aq8W3KtRZe+a1l6BhkHXp39FBCkwOqXYA84I=;
 b=WAhfo6OK+6vwSd83LlOjWMElnpJdhd75XsK5iigV4Eth3K+YAkdiT8zy
 leMPd/8ayN+Onv4KAn7bDX7+W7c8qyWNld3cxcICz6f3zl7K9d54jtJ9b
 N/iLo3EDbq9wuIPhakol1y3dUQr20J/h05bi5M9rVebe0zt8daytScrPw
 E6ZHXHiOQC+pq4/bud+5xhxMczfRhJ1nrwD71WHdCKMD2rhup3Lf/3fm4
 4spthHreMJ2Yh8Uxspp3KzhOdS8I+DZdEQwavWA0OQHnHhkum0r2JhiHx
 Ih8hmlt1ivkV29k5yT8UmZtiSUK7povhh+hPp8to7TsGmu/NU6O6r1Ys8 Q==;
X-CSE-ConnectionGUID: OZCCWofES/GkaH1cf9LmeQ==
X-CSE-MsgGUID: CEYUSYqOTa+NG0XjeMn1cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88792625"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="88792625"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:34:45 -0700
X-CSE-ConnectionGUID: gQgG3y3iTUa0CK3WAu3eZA==
X-CSE-MsgGUID: jPFCxz8TReqnZP2tGmX9hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="252408073"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2026 07:34:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wkjeD-00000000Sp2-3zAb;
 Fri, 17 Jul 2026 14:34:41 +0000
Date: Fri, 17 Jul 2026 22:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 da1124abac689cc2b1d8995e5f0a816f8a122edb
Message-ID: <202607172251.HshG6cEu-lkp@intel.com>
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
branch HEAD: da1124abac689cc2b1d8995e5f0a816f8a122edb  drm/xe/guc: Hold device ref until queue teardown completes

elapsed time: 1275m

configs tested: 89
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                   randconfig-001-20260717    gcc-11.5.0
arc                   randconfig-002-20260717    gcc-13.4.0
arc                           tb10x_defconfig    gcc-16.1.0
arm                   randconfig-001-20260717    clang-24
arm                   randconfig-002-20260717    clang-24
arm                   randconfig-003-20260717    gcc-8.5.0
arm                   randconfig-004-20260717    gcc-11.5.0
arm64                 randconfig-001-20260717    gcc-11.5.0
arm64                 randconfig-002-20260717    gcc-8.5.0
arm64                 randconfig-003-20260717    gcc-8.5.0
arm64                 randconfig-004-20260717    gcc-9.5.0
csky                             allmodconfig    gcc-16.1.0
csky                  randconfig-001-20260717    gcc-13.4.0
csky                  randconfig-002-20260717    gcc-15.2.0
hexagon                        randconfig-001    clang-17
hexagon               randconfig-001-20260717    clang-24
hexagon               randconfig-002-20260717    clang-17
i386                             allmodconfig    gcc-14
i386        buildonly-randconfig-001-20260717    gcc-14
i386        buildonly-randconfig-002-20260717    gcc-14
i386        buildonly-randconfig-003-20260717    clang-22
i386        buildonly-randconfig-004-20260717    gcc-14
i386        buildonly-randconfig-005-20260717    gcc-14
i386        buildonly-randconfig-006-20260717    clang-22
i386                  randconfig-011-20260717    clang-22
i386                  randconfig-012-20260717    clang-22
i386                  randconfig-013-20260717    clang-22
i386                  randconfig-014-20260717    clang-22
i386                  randconfig-015-20260717    clang-22
i386                  randconfig-016-20260717    gcc-14
i386                  randconfig-017-20260717    clang-22
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260717    gcc-16.1.0
loongarch             randconfig-002-20260717    clang-24
m68k                             allmodconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20260717    gcc-8.5.0
nios2                 randconfig-002-20260717    gcc-8.5.0
parisc                           allmodconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260717    gcc-10.5.0
parisc                randconfig-002-20260717    gcc-16.1.0
powerpc               randconfig-001-20260717    gcc-13.4.0
powerpc               randconfig-002-20260717    gcc-11.5.0
powerpc64             randconfig-001-20260717    gcc-15.2.0
powerpc64             randconfig-002-20260717    gcc-8.5.0
riscv                 randconfig-001-20260717    clang-17
riscv                 randconfig-002-20260717    clang-24
s390                  randconfig-001-20260717    clang-24
s390                  randconfig-002-20260717    clang-20
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260717    gcc-9.5.0
sh                    randconfig-002-20260717    gcc-16.1.0
sparc                          randconfig-001    gcc-16.1.0
sparc                 randconfig-001-20260717    gcc-8.5.0
sparc                 randconfig-002-20260717    gcc-14.3.0
sparc64               randconfig-001-20260717    clang-22
sparc64               randconfig-002-20260717    clang-24
um                    randconfig-001-20260717    clang-24
um                    randconfig-002-20260717    clang-21
x86_64      buildonly-randconfig-001-20260717    gcc-14
x86_64      buildonly-randconfig-002-20260717    gcc-14
x86_64      buildonly-randconfig-003-20260717    gcc-14
x86_64      buildonly-randconfig-004-20260717    gcc-14
x86_64      buildonly-randconfig-005-20260717    clang-22
x86_64      buildonly-randconfig-006-20260717    clang-22
x86_64                randconfig-001-20260717    clang-22
x86_64                randconfig-002-20260717    clang-22
x86_64                randconfig-003-20260717    gcc-14
x86_64                randconfig-004-20260717    gcc-14
x86_64                randconfig-005-20260717    gcc-14
x86_64                randconfig-006-20260717    gcc-13
x86_64                randconfig-011-20260717    gcc-14
x86_64                randconfig-012-20260717    gcc-14
x86_64                randconfig-013-20260717    clang-22
x86_64                randconfig-014-20260717    gcc-12
x86_64                randconfig-015-20260717    gcc-14
x86_64                randconfig-016-20260717    gcc-14
xtensa                randconfig-001-20260717    gcc-16.1.0
xtensa                randconfig-002-20260717    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
