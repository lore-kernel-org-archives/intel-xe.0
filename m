Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68221C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 15:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308DC10E0E4;
	Mon, 30 Oct 2023 15:15:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EDF10E0E4
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 15:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698678926; x=1730214926;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=roiNXAHOSHIAPEU2Eqg4CJBkYNrzYHIt68sjyN0OAsM=;
 b=N2xdiBkMw+qWCUW1n4YP1nKoj6o+i0D0/5xd4RXCPa3ixShbqVm0/R4m
 8ih4KCzqVJk2MrIFQ2xjfclqT8OXvtV1rCCZis95wx97VUUl3QSyFmBRn
 uhA4kG6TcWeMfEOmWF0qfxoc6Kl7PSPnBss2icUsRWEQRu6rJtHWpwHWs
 RFmeQVguM80IsKpxPxwgQUQ8emYCV34o+4JkbaIw9vcM9crBXCFRnBzH7
 JSHD7RqEUVbVp8SiUEO/wH4z9FI2rlvjOyeC3+yureAUYlAQ5xjQs3syu
 DoMECNKSCL/8inHkX91iyLqXAzqfhVj69dq92swg2+Rvo2s1XVrO6Ezy9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="385285427"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="385285427"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 08:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="8371937"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2023 08:15:21 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qxTz5-000DLz-1B;
 Mon, 30 Oct 2023 15:15:19 +0000
Date: Mon, 30 Oct 2023 23:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <202310302310.8sINH2Pc-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:drm-xe-next 963/1426]
 drivers/gpu/drm/v3d/v3d_sched.c:403:30: error: 'ULL' undeclared
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   d7eb9a5c3acda8d87699bc82add7e8d88f5f4700
commit: 394fe33ea259ba7b01dd7b24cc7e9ddf98551c56 [963/1426] drm/sched: Move schedule policy to scheduler
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231030/202310302310.8sINH2Pc-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310302310.8sINH2Pc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310302310.8sINH2Pc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_sched_init':
>> drivers/gpu/drm/v3d/v3d_sched.c:403:30: error: 'ULL' undeclared (first use in this function)
     403 |                              ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
         |                              ^~~
   drivers/gpu/drm/v3d/v3d_sched.c:403:30: note: each undeclared identifier is reported only once for each function it appears in


vim +/ULL +403 drivers/gpu/drm/v3d/v3d_sched.c

   381	
   382	int
   383	v3d_sched_init(struct v3d_dev *v3d)
   384	{
   385		int hw_jobs_limit = 1;
   386		int job_hang_limit = 0;
   387		int hang_limit_ms = 500;
   388		int ret;
   389	
   390		ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
   391				     &v3d_bin_sched_ops, NULL,
   392				     hw_jobs_limit, job_hang_limit,
   393				     msecs_to_jiffies(hang_limit_ms), NULL,
   394				     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
   395				     v3d->drm.dev);
   396		if (ret)
   397			return ret;
   398	
   399		ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
   400				     &v3d_render_sched_ops, NULL,
   401				     hw_jobs_limit, job_hang_limit,
   402				     msecs_to_jiffies(hang_limit_ms), NULL,
 > 403				     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
   404				     v3d->drm.dev);
   405		if (ret)
   406			goto fail;
   407	
   408		ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
   409				     &v3d_tfu_sched_ops, NULL,
   410				     hw_jobs_limit, job_hang_limit,
   411				     msecs_to_jiffies(hang_limit_ms), NULL,
   412				     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
   413				     v3d->drm.dev);
   414		if (ret)
   415			goto fail;
   416	
   417		if (v3d_has_csd(v3d)) {
   418			ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
   419					     &v3d_csd_sched_ops, NULL,
   420					     hw_jobs_limit, job_hang_limit,
   421					     msecs_to_jiffies(hang_limit_ms), NULL,
   422					     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
   423					     v3d->drm.dev);
   424			if (ret)
   425				goto fail;
   426	
   427			ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
   428					     &v3d_cache_clean_sched_ops, NULL,
   429					     hw_jobs_limit, job_hang_limit,
   430					     msecs_to_jiffies(hang_limit_ms), NULL,
   431					     NULL, "v3d_cache_clean",
   432					     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
   433			if (ret)
   434				goto fail;
   435		}
   436	
   437		return 0;
   438	
   439	fail:
   440		v3d_sched_fini(v3d);
   441		return ret;
   442	}
   443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
