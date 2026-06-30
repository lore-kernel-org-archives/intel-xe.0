Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75025C43327
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 14:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DD210E201;
	Tue, 30 Jun 2026 14:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIE6jOKD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA7010E201
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 14:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782831231; x=1814367231;
 h=date:from:to:cc:subject:message-id;
 bh=qw4ePhfZqOnnbwEqeFWaKYowxNHkiMZQUMaCnO4jq+A=;
 b=NIE6jOKDAI1JSt0M3GHFe5vXoZo2ISCiku+8KxsMngV9a154It7c+j0R
 dV+wcNwCMSISag9aze+DbDPFcje2JNrbTzCmbElNHNIZ4KSeml2d+Coa1
 UfnDp7oZh1Kqtv3iF7RBk1QE2E+F19/ybjB/Uk6zMBW3lvERg+b9Nnlwx
 X/eA8XswdoxmfyXlUDfpjbGcS40UKHxZEF14TyOfUZI5RRJvxLO/qpaLx
 TFg6F/a8x8y9NgG57ywyGb+c+s4j9sp9jmLlpxndaFgFQrlFLNk21GBTo
 aQSFoHLUz/LPhJ0O/Arcilh9fimDOJGtLZmjdzzPFoqC0u6wzZLxf86ra Q==;
X-CSE-ConnectionGUID: IDdVbUAPQq+BXaEkkvKPLA==
X-CSE-MsgGUID: zBIOl3zpTyGlridzQMg3KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83323829"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83323829"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 07:53:51 -0700
X-CSE-ConnectionGUID: 1JLbhS+JR9SHOElBVyn5sA==
X-CSE-MsgGUID: X30ZXrwFRVGZtmIb4QSq6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="282352570"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 30 Jun 2026 07:53:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1weZqM-000000008Qk-1M5H;
 Tue, 30 Jun 2026 14:53:46 +0000
Date: Tue, 30 Jun 2026 22:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [drm-xe:drm-xe-next 1/3] drivers/gpu/drm/xe/xe_pt.c:1418:13:
 warning: 'xe_pt_svm_userptr_notifier_lock' defined but not used
Message-ID: <202606302210.QqcLbOEN-lkp@intel.com>
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

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   e459a3bdeb117be496d7f229e2ea1f6c9fe4080b
commit: 80ccbd97ffee8ad2e73167d826fe7be548364365 [1/3] drm/xe/userptr: Hold notifier_lock for write on inject test path
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260630/202606302210.QqcLbOEN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606302210.QqcLbOEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606302210.QqcLbOEN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_pt.c:1418:13: warning: 'xe_pt_svm_userptr_notifier_lock' defined but not used [-Wunused-function]
    1418 | static void xe_pt_svm_userptr_notifier_lock(struct xe_vm *vm)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xe_pt_svm_userptr_notifier_lock +1418 drivers/gpu/drm/xe/xe_pt.c

  1408	
  1409	/*
  1410	 * Acquire/release the svm notifier_lock around xe_pt_svm_userptr_pre_commit()
  1411	 * and the matching late release in xe_pt_update_ops_run(). Read mode by
  1412	 * default; write mode when CONFIG_DRM_XE_USERPTR_INVAL_INJECT is on,
  1413	 * because a userptr op in this critical section may invoke the injected
  1414	 * xe_vma_userptr_force_invalidate() path that calls
  1415	 * drm_gpusvm_unmap_pages() with ctx->in_notifier=true, which requires the
  1416	 * lock held for write.
  1417	 */
> 1418	static void xe_pt_svm_userptr_notifier_lock(struct xe_vm *vm)
  1419	{
  1420	#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
  1421		down_write(&vm->svm.gpusvm.notifier_lock);
  1422	#else
  1423		xe_svm_notifier_lock(vm);
  1424	#endif
  1425	}
  1426	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
