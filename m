Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B53FC79F8B
	for <intel-xe@archiver.kernel.org>; Sat,  5 Sep 2026 20:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2018310E326;
	Sat,  5 Sep 2026 20:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9819b9w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867E710E326
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Sep 2026 20:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788638641; x=1820174641;
 h=date:from:to:cc:subject:message-id;
 bh=DK8exT07rW9ccfkYkYm7Bi5V58xA3lqUG/GmlTzYTY8=;
 b=l9819b9wg4RNJTacEBCfzB+POf2McXH+0OSOAL0jTFZV1lQkAThy6VuB
 O/kYeu/PlBEVQePBRtzkFuMnqkwpmVpddYbop1SSJn8P0+5mV5QADPh4T
 MipAX52zp0Rl6e9vMkym5COCANMCGLQOHSeWkX2WvqfCmQ6Az8qLX+vLn
 HSReVgJOP4H3372qVnd1EsJmSP988RLUNxjDdvDq1TYFR6jSyDv4UKlNI
 Y6j88T/UrJ0c5skxWcfoG2myGO60UZ5aD3RV3pxxjogrY6h8t34bMXZWV
 r2SHNBfI2rTlu3WhjMOBpbtdMlZhUAozqswrEdTIEJjIN90lbmstACkLL Q==;
X-CSE-ConnectionGUID: A8/ik2yXRm2wTKGmA0Yd9w==
X-CSE-MsgGUID: xy8RGxWPTLKXQSK5LUhyFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="88980996"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; d="scan'208";a="88980996"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 13:04:01 -0700
X-CSE-ConnectionGUID: Fjqg72uATWypU1Y7TwkD5g==
X-CSE-MsgGUID: Nyvi5Im4S3GJHdM+A7iRBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; d="scan'208";a="269030609"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 05 Sep 2026 13:04:00 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1x2wcI-0000000013b-0MHi;
 Sat, 05 Sep 2026 20:03:58 +0000
Date: Sun, 06 Sep 2026 04:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 6ef3eb10aea4260f752c06489a5369c2b67848b0
Message-ID: <202609060434.Fhg3K8YI-lkp@intel.com>
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
branch HEAD: 6ef3eb10aea4260f752c06489a5369c2b67848b0  drm/xe: Add fault-inject based VRAM page offline injection

elapsed time: 2271m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
