Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4FAF94CD3
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 06:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8225A10F163;
	Wed, 22 Apr 2026 06:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nr8NrUey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D83210F162
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 06:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776840485; x=1808376485;
 h=date:from:to:cc:subject:message-id;
 bh=PB0BKHSpssxopG9VhME5qGcT3XiQjrs1ui7UkoE/yUU=;
 b=nr8NrUey87Mmr6CIsOW/hmV1wCGeti0HUc/vdM0gNR9h9FcEsTLh82N6
 2BAnPDlEZZkn/WgD6quS6Yf8VUX4voz3gJi21ZI9S7YMfPVb6clg+vqrw
 WarOqSeDyxxYOJPf6iKGEBMBcf7fhGVjKo4/mr2UdEDTrzYJv/gGx6Mjp
 vXdLdEZIkxtBQqn3A6NhjSmiczlSH6aghVfzfPJOyen+rp/D7tCtzs7s6
 IdaglgDhLr0LUtvJfQWRRfmrAoePJMilhNWOiRUGPfPR/RwFodp/Luk3G
 /sIovereN45wFBYBL8r5dg4d/Gj+UG6/sbO5NpyLC8cUIdT4FNcpew0+8 g==;
X-CSE-ConnectionGUID: NR+8udeAStW4SQDOXctxow==
X-CSE-MsgGUID: YNV27GNQQzCx+/1ibqjdIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="76818538"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="76818538"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 23:48:05 -0700
X-CSE-ConnectionGUID: wsexOwDnQ5GqXj8oDIaJFQ==
X-CSE-MsgGUID: Lv4L57N7TMe13SVEZtPHVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="227673291"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 21 Apr 2026 23:48:04 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wFRNS-000000000F7-0HHK;
 Wed, 22 Apr 2026 06:48:02 +0000
Date: Wed, 22 Apr 2026 14:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 dc9ccf14dc2ad44e3df4928015923735f0101bfd
Message-ID: <202604221436.pisMXHhM-lkp@intel.com>
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
branch HEAD: dc9ccf14dc2ad44e3df4928015923735f0101bfd  drm/xe/pat: Introduce xe_cache_pat_idx() macro helper

elapsed time: 767m

configs tested: 61
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arc           nsimosci_hs_defconfig    gcc-15.2.0
arc         randconfig-001-20260422    gcc-9.5.0
arc         randconfig-002-20260422    gcc-11.5.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm         randconfig-001-20260422    gcc-8.5.0
arm         randconfig-002-20260422    gcc-8.5.0
arm         randconfig-003-20260422    clang-20
arm         randconfig-004-20260422    gcc-10.5.0
arm64                   allnoconfig    gcc-15.2.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
