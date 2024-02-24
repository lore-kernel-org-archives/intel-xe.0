Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543A3C48BF6
	for <intel-xe@archiver.kernel.org>; Sat, 24 Feb 2024 11:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F1C10E063;
	Sat, 24 Feb 2024 11:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQnJHJks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EE010E063
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Feb 2024 11:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708775395; x=1740311395;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=50D7FXIN0leSNjqSF6+kBcqNxCOsENDaNQtYz6tH1Cc=;
 b=GQnJHJks+SC6ej5gnxSzmwskt5jcq1/w99sdJ+FtMfl5YZNR2Irbpqj/
 wf9x84QOSGgf7wIRFphmnPUQI/TkiHKRIL0vwnIEMyXcS+ThlP1/2oBz3
 kxBFLSPwN95FZoiIuF4TPYCfK9MX4dqyN/bul4HFshBqoicd8fbArCIzp
 6Sw/aBv34zXW+cNSMc2h9VF1mAvWMoWa6+KRJQThWpN68v6C/WdAMnnFT
 dqxw2wVYtLpxTwXXQf7QvmvIZ+q8BGdXWlx1xoYNBx7IoJsYYWty1i4OH
 ungobjUauTyn0Xn6EIwHssUo7KS3BvC1NjVTYq8ESQ64bkEzUMJYiXhCU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6915729"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6915729"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2024 03:49:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; d="scan'208";a="37181858"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 24 Feb 2024 03:49:52 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rdqXO-0008VK-12;
 Sat, 24 Feb 2024 11:49:50 +0000
Date: Sat, 24 Feb 2024 19:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [drm-xe:drm-xe-next 2/3] drivers/gpu/drm/xe/xe_ggtt.c:78:9: error:
 implicit declaration of function 'writeq'; did you mean 'writel'?
Message-ID: <202402241903.R5J8hKVI-lkp@intel.com>
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
head:   a9e483dda3efa5b9aae5d9eef94d2c3a878d9bea
commit: 3121fed0c51beb8ea7b18ab2ceff1ac9e358ac53 [2/3] drm/xe: Cleanup some layering in GGTT
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240224/202402241903.R5J8hKVI-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241903.R5J8hKVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241903.R5J8hKVI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_ggtt.c: In function 'xe_ggtt_set_pte':
>> drivers/gpu/drm/xe/xe_ggtt.c:78:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
      78 |         writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
         |         ^~~~~~
         |         writel
   cc1: some warnings being treated as errors


vim +78 drivers/gpu/drm/xe/xe_ggtt.c

dd08ebf6c3525a Matthew Brost   2023-03-30  72  
dd08ebf6c3525a Matthew Brost   2023-03-30  73  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
dd08ebf6c3525a Matthew Brost   2023-03-30  74  {
c73acc1eeba5e3 Francois Dugast 2023-09-12  75  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
c73acc1eeba5e3 Francois Dugast 2023-09-12  76  	xe_tile_assert(ggtt->tile, addr < ggtt->size);
dd08ebf6c3525a Matthew Brost   2023-03-30  77  
58e19acf0cdf3f Lucas De Marchi 2023-04-12 @78  	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
dd08ebf6c3525a Matthew Brost   2023-03-30  79  }
dd08ebf6c3525a Matthew Brost   2023-03-30  80  

:::::: The code at line 78 was first introduced by commit
:::::: 58e19acf0cdf3f18c1c868165f45d3ea626b9c3f drm/xe: Cleanup page-related defines

:::::: TO: Lucas De Marchi <lucas.demarchi@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
