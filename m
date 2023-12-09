Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77434C10F04
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 18:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A06710E1CC;
	Sat,  9 Dec 2023 18:48:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBDC10E1CC
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Dec 2023 18:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702147687; x=1733683687;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Qcv3BMcwRS6unAS+l31DkzLh6IXXF4c6LNf//+waDhI=;
 b=nQAvJVoobSCHblutcuhcnzEEE2LKAif0F0iFDC2vdwD0Oqqe0aTDG+fR
 hjlmdUN1AucGxzYCOyEuaFK0ayA6ppWfsl1S2IhXCkzZuI30eYZb81aSp
 IOXiWCIH6pCrYBL+1EAFJNwlvlBV1/V4ngwtVA5SG9lj0I7unCmeHYG+M
 JaDoOTdDDjXq3wBbWzuHKJcpHeKcLV6AWcAlRQFgCaVuqvr3OO6V/Sp5b
 LVEntRrPShSh2KEmo4mM6U5/h2Q5vw4aZICodXpWMexEuEawsh762RsCI
 iQjlbCZuh4myoszrXadQfYntkek4iT9OcAeFmBSbeNOPSTNhEgeE/yMAa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="458837087"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; d="scan'208";a="458837087"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2023 10:48:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1103920876"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; d="scan'208";a="1103920876"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 09 Dec 2023 10:48:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rC2Ms-000Fm4-2K;
 Sat, 09 Dec 2023 18:48:02 +0000
Date: Sun, 10 Dec 2023 02:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [drm-xe:drm-xe-next 1052/1053]
 drivers/gpu/drm/xe/xe_gt_freq.c:201:30: warning: variable 'err' is
 uninitialized when used here
Message-ID: <202312100223.2IyYhSLJ-lkp@intel.com>
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
Cc: llvm@lists.linux.dev, intel-xe@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   1fc141d1f445b8e5ab4ff14645b0482dd98460b9
commit: 5d57684e0f5e1b8bb2484f0140a9b3a2f132f8fe [1052/1053] drm/xe: Create a xe_gt_freq component for raw management and sysfs
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231210/202312100223.2IyYhSLJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312100223.2IyYhSLJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312100223.2IyYhSLJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_gt_freq.c:201:30: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
                            kobject_name(gt->sysfs), err);
                                                     ^~~
   include/drm/drm_print.h:466:36: note: expanded from macro 'drm_warn'
           __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
                                             ^~~~~~~~~~~
   include/drm/drm_print.h:456:48: note: expanded from macro '__drm_printk'
           dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
                                                         ^~~~~~~~~~~
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                               ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/gpu/drm/xe/xe_gt_freq.c:196:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   1 warning generated.


vim +/err +201 drivers/gpu/drm/xe/xe_gt_freq.c

   186	
   187	/**
   188	 * xe_gt_freq_init - Initialize Xe Freq component
   189	 * @gt: Xe GT object
   190	 *
   191	 * It needs to be initialized after GT Sysfs and GuC PC components are ready.
   192	 */
   193	void xe_gt_freq_init(struct xe_gt *gt)
   194	{
   195		struct xe_device *xe = gt_to_xe(gt);
   196		int err;
   197	
   198		gt->freq = kobject_create_and_add("freq0", gt->sysfs);
   199		if (!gt->freq) {
   200			drm_warn(&xe->drm, "failed to add freq0 directory to %s, err: %d\n",
 > 201				 kobject_name(gt->sysfs), err);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
