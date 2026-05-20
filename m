Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9005CD4F5E
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 05:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA5A10EEFD;
	Wed, 20 May 2026 05:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvpHo9gz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856B210E002
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 05:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779254342; x=1810790342;
 h=date:from:to:cc:subject:message-id;
 bh=2MqdiCTyi38joKYkG5V4ZDNGJfcHBOpd0GCk6S0kbLo=;
 b=JvpHo9gzOUvB1HZEEri7rmClcT41Od6VpnT6BpX9DKhRawdIa/cSwt2F
 4QM4NC0OG9RcKIXvp/q1oJt7hrOGN5QiYir0T/MrQfSycOfYJqSFylVUQ
 bJmayVb4uX3l0NfriHe119amag6uIsGC0v5H91EJ9XtpdRQD544NEBIFA
 u20QI5PXzMX94j1H0FTxoChmdkNRok94yiWDdiw9zvchMbSTBmdm8wMyj
 X10wtK0JQNE+xYR3J7u5GSK/QN661pS0Ox01TpUdCQl0RJHQQIiZeIYXL
 aA3n1oSTptI0m/nIOb1I6an8kwysVI0Xq3J+nwrf1fTiTyzAaBK/Ip0tM Q==;
X-CSE-ConnectionGUID: p06IljVmQN2DDBUMEkHAVg==
X-CSE-MsgGUID: VeBL1PcYRuuyvwvLkAAe4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79992919"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79992919"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 22:19:01 -0700
X-CSE-ConnectionGUID: uvavHZXCSmKidmJi6VQvxw==
X-CSE-MsgGUID: 19uinJ7QQO2kjQ7DG36GLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="244996298"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
 by orviesa005.jf.intel.com with ESMTP; 19 May 2026 22:18:56 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wPZK1-000000002Vn-0C28;
 Wed, 20 May 2026 05:18:27 +0000
Date: Wed, 20 May 2026 13:15:28 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 00907da2126ed785451b2a2f0fef282246dad104
Message-ID: <202605201322.SJxhH9L8-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 00907da2126ed785451b2a2f0fef282246dad104  drm/xe/multi_queue: Fix secondary queue error case

elapsed time: 752m

configs tested: 217
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260520    gcc-8.5.0
arc                   randconfig-002-20260520    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            dove_defconfig    gcc-15.2.0
arm                           omap1_defconfig    gcc-15.2.0
arm                   randconfig-001-20260520    gcc-8.5.0
arm                   randconfig-002-20260520    gcc-8.5.0
arm                   randconfig-003-20260520    gcc-8.5.0
arm                   randconfig-004-20260520    gcc-8.5.0
arm                          sp7021_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260520    gcc-10.5.0
arm64                 randconfig-001-20260520    gcc-13.4.0
arm64                 randconfig-002-20260520    gcc-10.5.0
arm64                 randconfig-003-20260520    clang-20
arm64                 randconfig-003-20260520    gcc-10.5.0
arm64                 randconfig-004-20260520    clang-16
arm64                 randconfig-004-20260520    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260520    gcc-10.5.0
csky                  randconfig-001-20260520    gcc-13.4.0
csky                  randconfig-002-20260520    gcc-10.5.0
csky                  randconfig-002-20260520    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260520    gcc-11.5.0
hexagon               randconfig-002-20260520    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260520    clang-20
i386        buildonly-randconfig-002-20260520    clang-20
i386        buildonly-randconfig-002-20260520    gcc-14
i386        buildonly-randconfig-003-20260520    clang-20
i386        buildonly-randconfig-004-20260520    clang-20
i386        buildonly-randconfig-005-20260520    clang-20
i386        buildonly-randconfig-005-20260520    gcc-13
i386        buildonly-randconfig-006-20260520    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260520    clang-20
i386                  randconfig-002-20260520    clang-20
i386                  randconfig-003-20260520    clang-20
i386                  randconfig-004-20260520    clang-20
i386                  randconfig-005-20260520    clang-20
i386                  randconfig-006-20260520    clang-20
i386                  randconfig-007-20260520    clang-20
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260520    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260520    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260520    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260520    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260520    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260520    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260520    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260520    gcc-11.5.0
loongarch             randconfig-002-20260520    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         rt305x_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260520    gcc-11.5.0
nios2                 randconfig-002-20260520    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260520    clang-23
parisc                randconfig-002-20260520    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260520    clang-23
powerpc               randconfig-002-20260520    clang-23
powerpc64             randconfig-001-20260520    clang-23
powerpc64             randconfig-002-20260520    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260520    gcc-8.5.0
sparc                 randconfig-002-20260520    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260520    gcc-8.5.0
sparc64               randconfig-002-20260520    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260520    gcc-8.5.0
um                    randconfig-002-20260520    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-14
x86_64      buildonly-randconfig-001-20260520    gcc-14
x86_64               buildonly-randconfig-002    gcc-14
x86_64      buildonly-randconfig-002-20260520    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260520    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260520    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260520    gcc-14
x86_64               buildonly-randconfig-006    gcc-14
x86_64      buildonly-randconfig-006-20260520    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260520    gcc-14
x86_64                randconfig-002-20260520    clang-20
x86_64                randconfig-002-20260520    gcc-14
x86_64                randconfig-003-20260520    gcc-14
x86_64                randconfig-004-20260520    gcc-14
x86_64                randconfig-005-20260520    gcc-12
x86_64                randconfig-005-20260520    gcc-14
x86_64                randconfig-006-20260520    clang-20
x86_64                randconfig-006-20260520    gcc-14
x86_64                randconfig-011-20260520    gcc-14
x86_64                randconfig-012-20260520    gcc-14
x86_64                randconfig-013-20260520    gcc-14
x86_64                randconfig-014-20260520    gcc-14
x86_64                randconfig-015-20260520    gcc-14
x86_64                randconfig-016-20260520    gcc-14
x86_64                randconfig-071-20260520    gcc-14
x86_64                randconfig-072-20260520    gcc-14
x86_64                randconfig-073-20260520    gcc-14
x86_64                randconfig-074-20260520    gcc-14
x86_64                randconfig-075-20260520    gcc-14
x86_64                randconfig-076-20260520    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260520    gcc-8.5.0
xtensa                randconfig-002-20260520    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
