Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733ECC5DF66
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 02:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1565910E24F;
	Fri, 14 Aug 2026 02:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYnOCaHx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E3D10E24F
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 02:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786674478; x=1818210478;
 h=date:from:to:cc:subject:message-id;
 bh=ice2nGg5ojESOJfaLynO/BXzawQhdWCsRA40DOg4M0o=;
 b=BYnOCaHxIraJuh7jpeYVy5yrQBDfr5bHKSdQbLIxgnPg1MluCOWGRSyd
 dMMhhQPLBoEEtwHY+vhHJriYH2hAZBbE6NFRXh1hAUKZ9SBdjfFaEm8XI
 osS/a5aUMe+8lrImjDP14eTit9A7So6EI+jwMLbD8PxtUDh9rYHNp9tXv
 xqYSfzZ5M/dovr9yMf2v73dEssS1C+m4hutkfTrYtt0yI7e+j5GR2hQst
 Xf6pFusfE4HbvD4k0S3Ht+rUMRgeCvpSq3Z1nYJkNvKTvuxq49cjkMn1c
 m4Yb46iDJV+IlpifTCfmtATVJwFGdx8Yc4ZmuJKBxTLil5tB+QOmAnbyN w==;
X-CSE-ConnectionGUID: 6sCMhygoSu2OJHOn7m/rCA==
X-CSE-MsgGUID: xGGDxjGaSy2Lu5VsYY9zMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87118096"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87118096"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 19:27:58 -0700
X-CSE-ConnectionGUID: DJL/vo2WQaa1LO/TSg1pqg==
X-CSE-MsgGUID: cEejbwBBTniKowCnnJ3tqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="288893216"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 13 Aug 2026 19:27:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wuheE-00000000XSY-1Wwe;
 Fri, 14 Aug 2026 02:27:54 +0000
Date: Fri, 14 Aug 2026 10:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 1c4d0c45d762539f174cf1d74b2cb21d18e71363
Message-ID: <202608141052.Jiyq7SIv-lkp@intel.com>
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
branch HEAD: 1c4d0c45d762539f174cf1d74b2cb21d18e71363  drm/xe/mcr: Take vcs1/vecs1 into account for first media slice

elapsed time: 745m

configs tested: 15
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
alpha           defconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc          allyesconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
i386         allmodconfig    gcc-14
loongarch       defconfig    clang-24
mips       rs90_defconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
parisc       allmodconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
parisc          defconfig    gcc-16.1.0
sh              defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
