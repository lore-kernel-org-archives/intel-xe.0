Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA93D68BD5
	for <intel-xe@archiver.kernel.org>; Sun, 21 Dec 2025 23:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ED910E2F2;
	Sun, 21 Dec 2025 23:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXIpbeEX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE6510E2F2
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Dec 2025 23:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766360847; x=1797896847;
 h=date:from:to:cc:subject:message-id;
 bh=ofBNHMb6HUAYbW8+x11fAICD3XM1Ohr8OL0WbuwrdZk=;
 b=dXIpbeEXTNoCawvTedSkgSydk3sVp9BsivTsvp3gvu1HAR5iflgu4eKv
 jL32e0+upseVlksgpwpOTxuiemuTo2sQEEmT7Jy14wAzd4BpkUlFTjSVP
 H6FKbq7cT5O5E/zPBt+x14s1+WYAca1UA6tARoq0yxQ9e257EqzEsZWH2
 6SpCbqvuBBeWmNazupDOrNmgIHbCHa2w3kBh+MkiCPwCktVpHQHnvoB5n
 vpq5Wq+BpoO3VDybVtKYRZAN9g7YjJH55dp1gIfWG+cZPukYs2+N96YIX
 g6b3W9ImV0RK3nD6F2oa0xQZZUcEN3HwinaNm0Xo87mwBYgZz7K73OUfV Q==;
X-CSE-ConnectionGUID: 9lX7kPTPQAK7MiYRTjPEkw==
X-CSE-MsgGUID: kJOFBxsNRsuw/euRUmWtEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78940357"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; d="scan'208";a="78940357"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 15:47:26 -0800
X-CSE-ConnectionGUID: /8Tkt4kXQQ+BRRIIR1XDqQ==
X-CSE-MsgGUID: Y16IF0JzQwi5h09lKp5yWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; d="scan'208";a="199288517"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2025 15:47:24 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vXT8z-000000000JN-45Gd;
 Sun, 21 Dec 2025 23:47:21 +0000
Date: Mon, 22 Dec 2025 07:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 844758bd99a86e6a07247784727fb337c4b979ca
Message-ID: <202512220738.J6d5mREl-lkp@intel.com>
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
branch HEAD: 844758bd99a86e6a07247784727fb337c4b979ca  drm/xe: Print GuC queue submission state on engine reset

elapsed time: 3056m

configs tested: 65
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                          axs101_defconfig    gcc-15.1.0
arc                   randconfig-001-20251222    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   milbeaut_m10v_defconfig    clang-19
arm                   randconfig-001-20251222    gcc-11.5.0
arm                   randconfig-002-20251222    gcc-11.5.0
arm64                             allnoconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251222    clang-20
hexagon               randconfig-002-20251222    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251221    gcc-14
i386        buildonly-randconfig-002-20251221    clang-20
i386        buildonly-randconfig-003-20251221    gcc-14
i386        buildonly-randconfig-004-20251221    gcc-14
i386        buildonly-randconfig-005-20251221    clang-20
i386        buildonly-randconfig-006-20251221    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251222    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251222    gcc-8.5.0
parisc                randconfig-002-20251222    gcc-10.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251222    gcc-10.5.0
powerpc               randconfig-002-20251222    gcc-8.5.0
powerpc64             randconfig-001-20251222    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
s390                              allnoconfig    clang-22
s390                  randconfig-002-20251222    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251222    gcc-8.5.0
sparc                 randconfig-002-20251222    gcc-15.1.0
sparc64               randconfig-001-20251222    clang-20
sparc64               randconfig-002-20251222    gcc-8.5.0
um                                allnoconfig    clang-22
um                    randconfig-001-20251222    clang-22
um                    randconfig-002-20251222    clang-19
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251222    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
