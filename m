Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74916C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 22:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091E910E012;
	Fri, 14 Aug 2026 22:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1DZUi2C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DE010E012
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 22:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786748124; x=1818284124;
 h=date:from:to:cc:subject:message-id;
 bh=7a8gDRxw7VjvyaDvP4xKZ4fg7o9OxiEzOY8ilZIc+Hs=;
 b=M1DZUi2Ci6iNIeLlNn78jnRyvfEw8WvnP1hrH6p9wg4Q94crGWZh0gDj
 7zhZfgnWHYfoGit4VRWsN2l+UeSfpi53iRAdsjyYKjRfdZSqmkcOzydp/
 PkUoJ7bhoncChAnlEPvCYz+GH2mUvKxARzxJoZ7hVUkLYK30xKgcP3ToI
 iw088LzUi2iRT1xmuepjC2ZYJCyqdVTEbwHh3kDTQxJdrFQcqu3IRx6Qa
 4WIcUn/pv1bDXwvJ2S+bQB71tFIaZmArASoMcRkJyNRybbJDhunfw9cFO
 r7TydeLVxssSc0aIHWJ+6UMw6uxZkgj8L2McciqcBcfqCxzLA2uk1qBk+ Q==;
X-CSE-ConnectionGUID: jf68mA3yQjGi45FMBk6IdA==
X-CSE-MsgGUID: v6YptxCqRIWEg3GTUwlwng==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="89848166"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="89848166"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 15:55:23 -0700
X-CSE-ConnectionGUID: UeFtilhTTOavGGIN/sQLmA==
X-CSE-MsgGUID: G6Vm7vp6TGea6qe2UFYrzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="263007096"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 14 Aug 2026 15:55:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wv0o4-00000000aQc-1RNw;
 Fri, 14 Aug 2026 22:55:20 +0000
Date: Sat, 15 Aug 2026 06:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 9736ca77f060472d196c118c5f14943b4606f6d3
Message-ID: <202608150637.KLhIe1Il-lkp@intel.com>
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
branch HEAD: 9736ca77f060472d196c118c5f14943b4606f6d3  drm/xe/hwmon: Enable package and vram temperatures for CRI

elapsed time: 805m

configs tested: 15
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha            allnoconfig    gcc-16.1.0
alpha           allyesconfig    gcc-16.1.0
alpha              defconfig    gcc-16.1.0
arc             allmodconfig    gcc-16.1.0
arc             allyesconfig    gcc-16.1.0
csky            allmodconfig    gcc-16.1.0
i386            allmodconfig    gcc-14
loongarch          defconfig    clang-24
nios2           allmodconfig    gcc-11.5.0
nios2            allnoconfig    gcc-11.5.0
parisc          allmodconfig    gcc-16.1.0
parisc          allyesconfig    gcc-16.1.0
parisc             defconfig    gcc-16.1.0
powerpc    tqm5200_defconfig    gcc-16.1.0
sh                 defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
