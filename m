Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD8DC3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 14:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB9410E925;
	Thu,  8 May 2025 14:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGbyc3ei";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766CA10E925
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746715510; x=1778251510;
 h=date:from:to:cc:subject:message-id;
 bh=1cWV92JYI7pkQfIiRC/5kiZ1gSLWsv/16sVQnkesf/4=;
 b=SGbyc3ei1v89n8bQed7Bfqw+tJLlN41lKqQuVHOs/2XA6PBcNZjHpcxc
 3Iyoe5LN6d0zaF62uuBNKwM10YYA7ZwFILiUYbkJOKnUh7O3Tz0Rz8YH7
 PrYbxqYx9hUWXx9mtLvUz8oW685Krwv47eIUIvMLtGvxUA6GSg3enuZG4
 mtBW8sWVpV9W+VsQ1QmWNcl/FM/yzDgAtjTF+YLz7hPv1jKLb2T9i2vG/
 1E0KKWlEFYg8a01buWLdYaDU4Kq/N7zDPfiENKmnpq2ufO4KZqR+TaOPB
 P/LoemEau5flzo2Q1eb1J4rZQX1OB47kdcR88rCUvm5s0OFowmBhypxRk w==;
X-CSE-ConnectionGUID: h6rsqRYzSDamqPovdEh8EA==
X-CSE-MsgGUID: iqYSgxM5TiSgys4zLuGWlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47761670"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="47761670"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 07:45:09 -0700
X-CSE-ConnectionGUID: ohTkFoHiQVy2bm4vwnLr4w==
X-CSE-MsgGUID: YxWoKqa7Qpi0CF5gptaSmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="141081968"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 08 May 2025 07:45:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uD2Uk-000B4J-0A;
 Thu, 08 May 2025 14:45:06 +0000
Date: Thu, 08 May 2025 22:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 252c4711973de4e4f3ecddcc18912aecfd4e537c
Message-ID: <202505082225.UUCUoKqM-lkp@intel.com>
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
branch HEAD: 252c4711973de4e4f3ecddcc18912aecfd4e537c  drm/xe/doc: Wire up PCIe Gen5 limitations

elapsed time: 1147m

configs tested: 65
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-14.2.0
alpha         allyesconfig    clang-19
alpha         allyesconfig    gcc-14.2.0
arc           allmodconfig    clang-19
arc            allnoconfig    gcc-14.2.0
arc           allyesconfig    clang-19
arm           allmodconfig    clang-19
arm            allnoconfig    clang-21
arm           allyesconfig    clang-19
arm64         allmodconfig    clang-19
arm64          allnoconfig    gcc-14.2.0
csky           allnoconfig    gcc-14.2.0
hexagon       allmodconfig    clang-17
hexagon       allmodconfig    clang-19
hexagon        allnoconfig    clang-21
hexagon       allyesconfig    clang-19
hexagon       allyesconfig    clang-21
i386          allmodconfig    clang-20
i386           allnoconfig    clang-20
i386          allyesconfig    clang-20
i386             defconfig    clang-20
loongarch     allmodconfig    gcc-14.2.0
loongarch      allnoconfig    gcc-14.2.0
m68k          allmodconfig    gcc-14.2.0
m68k           allnoconfig    gcc-14.2.0
m68k          allyesconfig    gcc-14.2.0
microblaze    allmodconfig    gcc-14.2.0
microblaze     allnoconfig    gcc-14.2.0
microblaze    allyesconfig    gcc-14.2.0
mips           allnoconfig    gcc-14.2.0
nios2          allnoconfig    gcc-14.2.0
openrisc       allnoconfig    gcc-14.2.0
openrisc      allyesconfig    gcc-14.2.0
parisc        allmodconfig    gcc-14.2.0
parisc         allnoconfig    gcc-14.2.0
parisc        allyesconfig    gcc-14.2.0
powerpc       allmodconfig    gcc-14.2.0
powerpc        allnoconfig    gcc-14.2.0
powerpc       allyesconfig    gcc-14.2.0
riscv         allmodconfig    gcc-14.2.0
riscv          allnoconfig    gcc-14.2.0
riscv         allyesconfig    gcc-14.2.0
s390          allmodconfig    clang-18
s390          allmodconfig    gcc-14.2.0
s390           allnoconfig    clang-21
s390          allyesconfig    gcc-14.2.0
sh            allmodconfig    gcc-14.2.0
sh             allnoconfig    gcc-14.2.0
sh            allyesconfig    gcc-14.2.0
sparc         allmodconfig    gcc-14.2.0
sparc          allnoconfig    gcc-14.2.0
um            allmodconfig    clang-19
um             allnoconfig    clang-21
um            allyesconfig    clang-19
um            allyesconfig    gcc-12
x86_64         allnoconfig    clang-20
x86_64        allyesconfig    clang-20
x86_64           defconfig    clang-20
x86_64               kexec    clang-20
x86_64            rhel-9.4    clang-20
x86_64        rhel-9.4-bpf    gcc-12
x86_64      rhel-9.4-kunit    gcc-12
x86_64        rhel-9.4-ltp    gcc-12
x86_64       rhel-9.4-rust    clang-20
xtensa         allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
