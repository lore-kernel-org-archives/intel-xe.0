Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931ABE668A7
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 02:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A7F10F132;
	Sat, 20 Dec 2025 02:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4ORI73b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D7E10F133
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Dec 2025 02:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766198917; x=1797734917;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=IenMx0DIK2vymdRctFpq7qL+XLAYYI7j1qUmQbjJEgQ=;
 b=L4ORI73boWeevqrExVSFYTDPwi5GMjGhuAC4p0URGeKLD48Gi/Lih1UK
 HXrI79XbQs8A0Ay8eaF8hj8HtIe8Pfdjal2fPfXV41NZzA0B/sM4MB+lZ
 LeQycM+yfEix9j9gY5Uhk0/PCAxf5/oesAB7/8JIhSAfN+sxj9ANlVWU/
 nw20GEtLPp/SMV1nNvH2YlhD2tFLw5RPyHOfSKl9yyATVYIVzF4SFzKgI
 zdjSp/SwHotxIiX7ecpTwlopMo6GLi1QJEudc+9e6DKibtA7L9mqy9dwm
 c7xWQr8oG6UR8llLRDE4iprZaougfd/lwRMoBtUrafgEVPVO5MwVFMYuZ w==;
X-CSE-ConnectionGUID: Dhf9hFY2RRmO7+Iyp2lrQA==
X-CSE-MsgGUID: Uolw3OW9RlWPYjzJ/JJQzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68035218"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68035218"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 18:48:36 -0800
X-CSE-ConnectionGUID: 9amIfOVcT92+bDBQIS7q4A==
X-CSE-MsgGUID: axIDBJMORwm+TvSVLPyW4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="199248393"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 19 Dec 2025 18:48:35 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vWn1F-000000004Gj-1gMh;
 Sat, 20 Dec 2025 02:48:33 +0000
Date: Sat, 20 Dec 2025 10:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 80f9c601d9c4d26f00356c0a9c461650e7089273
Message-ID: <202512201020.hLoHhwrS-lkp@intel.com>
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
branch HEAD: 80f9c601d9c4d26f00356c0a9c461650e7089273  drm/xe: Use usleep_range for accurate long-running workload timeslicing

elapsed time: 1942m

configs tested: 59
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-15.1.0
alpha         allyesconfig    gcc-15.1.0
arc            allnoconfig    gcc-15.1.0
arc           allyesconfig    clang-22
arm            allnoconfig    clang-22
arm            allnoconfig    gcc-15.1.0
arm64         allmodconfig    clang-22
arm64          allnoconfig    gcc-15.1.0
csky          allmodconfig    gcc-15.1.0
csky           allnoconfig    gcc-15.1.0
hexagon       allmodconfig    gcc-15.1.0
hexagon        allnoconfig    clang-22
hexagon        allnoconfig    gcc-15.1.0
i386          allmodconfig    clang-20
i386           allnoconfig    gcc-14
i386           allnoconfig    gcc-15.1.0
i386          allyesconfig    clang-20
loongarch     allmodconfig    clang-22
loongarch      allnoconfig    clang-22
loongarch      allnoconfig    gcc-15.1.0
m68k          allmodconfig    gcc-15.1.0
m68k           allnoconfig    gcc-15.1.0
microblaze     allnoconfig    gcc-15.1.0
microblaze    allyesconfig    gcc-15.1.0
mips           allnoconfig    gcc-15.1.0
mips          allyesconfig    gcc-15.1.0
nios2         allmodconfig    clang-22
nios2          allnoconfig    clang-22
nios2          allnoconfig    gcc-11.5.0
openrisc      allmodconfig    clang-22
openrisc       allnoconfig    clang-22
openrisc       allnoconfig    gcc-15.1.0
parisc         allnoconfig    clang-22
parisc         allnoconfig    gcc-15.1.0
powerpc        allnoconfig    clang-22
powerpc        allnoconfig    gcc-15.1.0
riscv         allmodconfig    clang-22
riscv          allnoconfig    clang-22
riscv          allnoconfig    gcc-15.1.0
s390           allnoconfig    clang-22
sh            allmodconfig    gcc-15.1.0
sh             allnoconfig    clang-22
sh             allnoconfig    gcc-15.1.0
sparc          allnoconfig    clang-22
sparc          allnoconfig    gcc-15.1.0
sparc64       allmodconfig    clang-22
um             allnoconfig    clang-22
um            allyesconfig    gcc-15.1.0
x86_64        allmodconfig    clang-20
x86_64         allnoconfig    clang-20
x86_64         allnoconfig    clang-22
x86_64        allyesconfig    clang-20
x86_64        rhel-9.4-bpf    gcc-14
x86_64      rhel-9.4-kunit    gcc-14
x86_64        rhel-9.4-ltp    gcc-14
x86_64       rhel-9.4-rust    clang-20
xtensa         allnoconfig    clang-22
xtensa         allnoconfig    gcc-15.1.0
xtensa        allyesconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
