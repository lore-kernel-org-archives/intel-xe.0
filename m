Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DFCC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 21:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736E010EADE;
	Fri,  3 Nov 2023 21:34:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B4210EADE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 21:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699047297; x=1730583297;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=xvtcNs5g7UwHiNQjL1gg+wHUfnqV8W0f7NJCc49sSnM=;
 b=fymzQ2BQMKzVBhscuHP4M6SQxWCCPuN0SZY8+2OJCEpYgX8hyKqM9/0e
 4Vnsnxy8hawgsyn3ou/2vG/znrp++MqcO1ZulZTZw+GYUAAfVDFjrzY9L
 ytmYn/zzXT6e/w95uKiyxC5C8Hsyvb+DtTaqvpAMU2Ip+O0QjEw0ZmKNX
 5mP6i43NchJlbDXyZ5zk12dgcSBAg0JVhJZ7PIbMgEz+n3i4AB7tpPnAf
 0B4KQsT/1dtf4urR3+Syx/YLCXzRAAlQVwuyRub2tzIADS2m0wz5o2Hlx
 eyEA1eokqD7DqXbnCp44o994mIojCzRgsM/A4f2bZY3iBeUM+HeNA1RQS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388851803"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="388851803"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 14:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="9863024"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2023 14:34:56 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qz1ob-0002xw-3B;
 Fri, 03 Nov 2023 21:34:53 +0000
Date: Sat, 4 Nov 2023 05:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
Message-ID: <202311040523.0e7IuFDX-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:oak/drm-evictable-lru 8/11]
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:121:61: error:
 'VMW_PL_SYSTEM' undeclared; did you mean 'TTM_PL_SYSTEM'?
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
Cc: intel-xe@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru
head:   d1f59526925ae851c6abf77af8ae6f8c3cffeebd
commit: 5c7ab6e4b1aea6c20a00aeb0110f82696d5840e3 [8/11] drm: Initialize drm lru manager
config: loongarch-randconfig-002-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040523.0e7IuFDX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040523.0e7IuFDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040523.0e7IuFDX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: In function 'amdgpu_preempt_mgr_init':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:121:61: error: 'VMW_PL_SYSTEM' undeclared (first use in this function); did you mean 'TTM_PL_SYSTEM'?
     121 |         ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[VMW_PL_SYSTEM]);
         |                                                             ^~~~~~~~~~~~~
         |                                                             TTM_PL_SYSTEM
   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:121:61: note: each undeclared identifier is reported only once for each function it appears in


vim +121 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c

    92	
    93	/**
    94	 * amdgpu_preempt_mgr_init - init PREEMPT manager and DRM MM
    95	 *
    96	 * @adev: amdgpu_device pointer
    97	 *
    98	 * Allocate and initialize the GTT manager.
    99	 */
   100	int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
   101	{
   102		struct ttm_resource_manager *man = &adev->mman.preempt_mgr;
   103		struct drm_device *drm = adev_to_drm(adev);
   104		int ret;
   105	
   106		man->use_tt = true;
   107		man->func = &amdgpu_preempt_mgr_func;
   108	
   109		ttm_resource_manager_init(man, &adev->mman.bdev, (1 << 30));
   110	
   111		ret = device_create_file(adev->dev, &dev_attr_mem_info_preempt_used);
   112		if (ret) {
   113			DRM_ERROR("Failed to create device file mem_info_preempt_used\n");
   114			return ret;
   115		}
   116	
   117		ttm_set_driver_manager(&adev->mman.bdev, AMDGPU_PL_PREEMPT, man);
   118		ttm_resource_manager_set_used(man, true);
   119	
   120		drm_lru_mgr_init(&drm->lru_mgr[AMDGPU_PL_PREEMPT], (1 << 30), &drm->lru_lock);
 > 121		ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[VMW_PL_SYSTEM]);
   122		return 0;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
