Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179881090255
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 16:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBBB10E143;
	Thu, 19 Mar 2026 16:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oq+UhEI8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED0B10E143
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773939276; x=1805475276;
 h=date:from:to:cc:subject:message-id;
 bh=jVKUrSzUuk5V+xwElh1lhkQT4d5e9aO4vmX2vP7C6Mw=;
 b=Oq+UhEI8F2D5HDVNAmfrmZSh3qJqdYqLX487H/VUjt395KiGnjN8r0tI
 dh/X+ghb6kVICK49d0iFfnktrDa+IdL8VSChWj6dMdnbp3RGkieu0TQnh
 70iZAxIBzsyTInwpMizg4TkAhX7fJ4/I7jMssxKCMYbVBQLGzSsJHl914
 HDNLt1YWWRbYhSTQO52rt9Yt3ZntpNsHJaGvb7/mJkcUTMSA7/WLmuhyI
 BSYI5ix9ZbEmKYKRu988Xs4yUIrHy8Qsz32X3l+5/8BVvOm6/i4fMJNO2
 s2tNmGUtFyRDFkKqzDK8vQQUAZSRRG8cmi7T06zTapSXmHoejUrxRAsPH Q==;
X-CSE-ConnectionGUID: 70+BQYMKQNymLo8ZunM5Jg==
X-CSE-MsgGUID: O768ojqLQ1eGtHEqgYV0Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74903830"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="74903830"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 09:54:35 -0700
X-CSE-ConnectionGUID: v8LPGi79T3CsAvGz6goCUg==
X-CSE-MsgGUID: TAPESg2xQyycHgwOgwPhcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="247278803"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 19 Mar 2026 09:54:34 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w3GdF-000000001NR-41ch;
 Thu, 19 Mar 2026 16:54:06 +0000
Date: Fri, 20 Mar 2026 00:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 7937ea733f79b3f25e802a0c8360bf7423856f36
Message-ID: <202603200034.uxainIIu-lkp@intel.com>
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
branch HEAD: 7937ea733f79b3f25e802a0c8360bf7423856f36  drm/xe: Fix missing runtime PM reference in ccs_mode_store

elapsed time: 1435m

configs tested: 129
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                   randconfig-001-20260319    gcc-8.5.0
arc                   randconfig-002-20260319    gcc-13.4.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    gcc-15.2.0
arm                         axm55xx_defconfig    clang-23
arm                   randconfig-001-20260319    clang-23
arm                   randconfig-002-20260319    gcc-8.5.0
arm                   randconfig-003-20260319    gcc-10.5.0
arm                   randconfig-004-20260319    gcc-11.5.0
arm                       spear13xx_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260319    clang-23
arm64                 randconfig-002-20260319    gcc-12.5.0
arm64                 randconfig-003-20260319    gcc-15.2.0
arm64                 randconfig-004-20260319    clang-16
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260319    gcc-15.2.0
csky                  randconfig-002-20260319    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon               randconfig-001-20260319    clang-23
hexagon               randconfig-002-20260319    clang-19
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260319    clang-20
i386        buildonly-randconfig-002-20260319    gcc-14
i386        buildonly-randconfig-003-20260319    gcc-14
i386        buildonly-randconfig-004-20260319    clang-20
i386        buildonly-randconfig-005-20260319    gcc-14
i386        buildonly-randconfig-006-20260319    clang-20
i386                  randconfig-001-20260319    clang-20
i386                  randconfig-002-20260319    clang-20
i386                  randconfig-003-20260319    gcc-14
i386                  randconfig-004-20260319    gcc-14
i386                  randconfig-005-20260319    clang-20
i386                  randconfig-006-20260319    clang-20
i386                  randconfig-007-20260319    gcc-13
i386                  randconfig-012-20260319    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch             randconfig-001-20260319    clang-18
loongarch             randconfig-002-20260319    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20260319    gcc-11.5.0
nios2                 randconfig-002-20260319    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260319    gcc-11.5.0
parisc                randconfig-002-20260319    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260319    clang-23
powerpc               randconfig-002-20260319    clang-16
powerpc64             randconfig-001-20260319    clang-19
powerpc64             randconfig-002-20260319    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260319    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260319    gcc-9.5.0
s390                  randconfig-002-20260319    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                    randconfig-001-20260319    gcc-10.5.0
sh                    randconfig-002-20260319    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260319    gcc-15.2.0
sparc                 randconfig-002-20260319    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64               randconfig-001-20260319    gcc-11.5.0
sparc64               randconfig-002-20260319    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                    randconfig-001-20260319    gcc-14
um                    randconfig-002-20260319    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64                randconfig-001-20260319    gcc-14
x86_64                randconfig-002-20260319    gcc-12
x86_64                randconfig-003-20260319    gcc-14
x86_64                randconfig-004-20260319    gcc-14
x86_64                randconfig-005-20260319    clang-20
x86_64                randconfig-006-20260319    clang-20
x86_64                randconfig-012-20260319    gcc-14
x86_64                randconfig-014-20260319    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260319    gcc-8.5.0
xtensa                randconfig-002-20260319    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
