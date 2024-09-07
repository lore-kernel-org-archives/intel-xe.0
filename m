Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75BCE6FE53
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 07:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A0E10E1CC;
	Sat,  7 Sep 2024 07:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxwCwW0a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB9910E1CC
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 07:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725695938; x=1757231938;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=tZkaGoZIlp9ZizjJryk/SA6Toue9+UJNqtcxwmCa3oE=;
 b=hxwCwW0aNWQRHlbg046vZvxhHVyfZegVkhGdeF9G4XPeFExHH8h3l6zU
 D+nxGyH2nbSlJAZFqRRgOnOeWjRyke+duf3BKBtDFc1E5ADqPt1yCzDrH
 ueHa5Mj5n+cA/OoYpMMAJZqsN3k3VCIQbNRZnEe3dI6t/bJVCl0ZDspFP
 dywBVRLaWcWlyETZPuT2RGXogLpkG95obdwNhAgTsy/PXUfPK3QALqLzQ
 DYPiQ9fqny8eheMPCPSHfJbmdgO4L46N+6S0noaZ4vIkLp9OZ5NrhID0U
 tHShr1+YWrRtA6uNEQS0KP5pIGM2amUKcbO6nWW8QgEsX8nWYD2+NqT3u A==;
X-CSE-ConnectionGUID: yyIToLvsTsGf+PcXDKHf+A==
X-CSE-MsgGUID: 2t2I3QqBSdGoGPQRVmnz7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="41936107"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="41936107"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2024 00:58:58 -0700
X-CSE-ConnectionGUID: QhkUeiGvRPi3k6Tu6Rt0hQ==
X-CSE-MsgGUID: ZKkftfxnRXqgfzpOXqasQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="71132354"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 07 Sep 2024 00:58:56 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1smqLO-000CJ4-1J;
 Sat, 07 Sep 2024 07:58:54 +0000
Date: Sat, 7 Sep 2024 15:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [drm-xe:drm-xe-next 3/4] drivers/gpu/drm/xe/xe_pm.c:606:26: error:
 'struct dev_pm_info' has no member named 'runtime_status'
Message-ID: <202409071530.6dcOf16E-lkp@intel.com>
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
head:   0c841e47d8d94bd0f5444a25052d86c0b1f2c2e8
commit: cb85e39dc5d1717fab82810984cce0e54712a3c2 [3/4] drm/xe: Suppress missing outer rpm protection warning
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240907/202409071530.6dcOf16E-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071530.6dcOf16E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071530.6dcOf16E-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_pm.c: In function 'xe_pm_suspending_or_resuming':
>> drivers/gpu/drm/xe/xe_pm.c:606:26: error: 'struct dev_pm_info' has no member named 'runtime_status'
     606 |         return dev->power.runtime_status == RPM_SUSPENDING ||
         |                          ^
   drivers/gpu/drm/xe/xe_pm.c:607:27: error: 'struct dev_pm_info' has no member named 'runtime_status'
     607 |                 dev->power.runtime_status == RPM_RESUMING;
         |                           ^
>> drivers/gpu/drm/xe/xe_pm.c:608:1: warning: control reaches end of non-void function [-Wreturn-type]
     608 | }
         | ^


vim +606 drivers/gpu/drm/xe/xe_pm.c

   597	
   598	/*
   599	 * Very unreliable! Should only be used to suppress the false positive case
   600	 * in the missing outer rpm protection warning.
   601	 */
   602	static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
   603	{
   604		struct device *dev = xe->drm.dev;
   605	
 > 606		return dev->power.runtime_status == RPM_SUSPENDING ||
   607			dev->power.runtime_status == RPM_RESUMING;
 > 608	}
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
