Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717A5C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 11:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176FE10E114;
	Fri,  7 Mar 2025 11:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oj9PQYCS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B59A10E114
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 11:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741346760; x=1772882760;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=3WpvT+GW4J2wks6v0DSytO1ZXVUPHUh0ouyCkpRR5zc=;
 b=Oj9PQYCS+7nxEojdVqSNDqng7NBTvT0vqN9VA4Voa9cLfRay4x8HYcrZ
 lxCUcF/kT7CUqmuOpI/2wf/AhDYX/f99bkCa3RFeEA3ua3tRYZFR2dFUL
 5vnXralFiWH3DMJdvMprKbbHr1qcYRnoL2J+wiNeuRaP2wjKtMi8G3Ybv
 FLSUwE7xy/KlK6qIUb18ULriQYTmtzch8dfAiH9tfbaWQUw5Kbb2tPISp
 TWBuA3kZBdE2lMwW4TadsrrYriWYzKmBWxrNE93kGMeTac5KWdXxGWGdQ
 C2O+BUtiL09jHDvxBjmKCTsVQwzvOx90KIh0F2GTarJswpC89WJicHsIo Q==;
X-CSE-ConnectionGUID: DWO6a+CcRWGyeppqZ28VHw==
X-CSE-MsgGUID: goAzUv+LTLOH4nxIbO3Wlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46169189"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="46169189"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 03:26:00 -0800
X-CSE-ConnectionGUID: tNH6YjEvQt25MgD9WG6gEQ==
X-CSE-MsgGUID: afqflv5OTnKjNxV/Es7Rfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119225550"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 07 Mar 2025 03:25:59 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tqVq0-0000N5-1t;
 Fri, 07 Mar 2025 11:25:56 +0000
Date: Fri, 7 Mar 2025 19:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Oak Zeng <oak.zeng@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: [drm-xe:drm-xe-next 20/32] xe_migrate.c:undefined reference to
 `__udivdi3'
Message-ID: <202503072137.G8mqBGo5-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   8e8d76f62329127b31c64a034b052fb9e30e92af
commit: 9c44fd5f6e8aa1ed944f085926044fcbf797206c [20/32] drm/xe: Add migrate layer functions for SVM support
config: powerpc-randconfig-001-20250307 (https://download.01.org/0day-ci/archive/20250307/202503072137.G8mqBGo5-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072137.G8mqBGo5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072137.G8mqBGo5-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/gpu/drm/xe/xe_migrate.o: in function `xe_migrate_vram':
>> xe_migrate.c:(.text+0x235c): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
