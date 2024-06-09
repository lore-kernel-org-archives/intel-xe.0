Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A547C27C53
	for <intel-xe@archiver.kernel.org>; Sun,  9 Jun 2024 04:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801F910E119;
	Sun,  9 Jun 2024 04:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vy+wX3MB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7971F10E119
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Jun 2024 04:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717908835; x=1749444835;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZcAj0PiPzpOszmKtX+HbMcGgJHuqbHj+MLko7amaSvM=;
 b=Vy+wX3MBkzAQe6sByRW6q7GmxdYQlG+s5npJ61GQj9gTVwSLA+iFu0yV
 j0TYIl35ejsscviTfOTvR4nYrqRBsCHz2dwNaqa1+5DwNFyhw5XiTzxyn
 e6Zei/poyJ5qbHeDUX0nAHqtcZ8YSwZSxGLdZ9vAXL+pYNR248EKPvMhE
 Y6jINJPD4+N+1L4xm4lPjaq4/0NHC5k/2Rn0xSLu6S5jC4cGeGlly/t/X
 QwghUgRlgbSD/QIGRL+kFo7xBVAz1W74dapTNlXxNGJTJq4X1IcCFY0uM
 /obhx1rdR4qqeAo8nDCAdvrO8/TxxSajJjdaV82qdJESf4xeImTEIkUcK w==;
X-CSE-ConnectionGUID: eRGdjcrzTcW1yGNsxs1tIQ==
X-CSE-MsgGUID: WFJwuku9Ts6EZXS0Ybwi7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="18381291"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; d="scan'208";a="18381291"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2024 21:53:54 -0700
X-CSE-ConnectionGUID: As000kdWRbGBi4TokMrueg==
X-CSE-MsgGUID: 0pOr1j9zRna0eOLqaN/Jgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; d="scan'208";a="43279431"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2024 21:53:51 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sGAYv-0000rR-0X;
 Sun, 09 Jun 2024 04:53:49 +0000
Date: Sun, 9 Jun 2024 12:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v4 1/2] devcoredump: Add dev_coredumpm_timeout()
Message-ID: <202406091205.EPawyDRg-lkp@intel.com>
References: <20240607193220.229760-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240607193220.229760-1-jose.souza@intel.com>
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

Hi José,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on wireless/main linus/master v6.10-rc2 next-20240607]
[cannot apply to driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus wireless-next/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jos-Roberto-de-Souza/drm-xe-Increase-devcoredump-timeout/20240608-033441
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240607193220.229760-1-jose.souza%40intel.com
patch subject: [PATCH v4 1/2] devcoredump: Add dev_coredumpm_timeout()
config: i386-buildonly-randconfig-006-20240609 (https://download.01.org/0day-ci/archive/20240609/202406091205.EPawyDRg-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406091205.EPawyDRg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406091205.EPawyDRg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/remoteproc/remoteproc_coredump.c:9:
>> include/linux/devcoredump.h:79:6: warning: no previous prototype for 'dev_coredumpm_timeout' [-Wmissing-prototypes]
      79 | void dev_coredumpm_timeout(struct device *dev, struct module *owner,
         |      ^~~~~~~~~~~~~~~~~~~~~
--
   ld: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.o: in function `dev_coredumpm_timeout':
>> dpu_encoder_phys_cmd.c:(.text+0x145c): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.o: in function `dev_coredumpm_timeout':
   dpu_encoder_phys_vid.c:(.text+0x13e8): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.o: in function `dev_coredumpm_timeout':
   dpu_encoder_phys_wb.c:(.text+0xda0): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/disp/dpu1/dpu_kms.o: in function `dev_coredumpm_timeout':
   dpu_kms.c:(.text+0x8910): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/disp/msm_disp_snapshot.o: in function `dev_coredumpm_timeout':
   msm_disp_snapshot.c:(.text+0x0): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.o: in function `dev_coredumpm_timeout':
   msm_disp_snapshot_util.c:(.text+0xd8): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/msm_debugfs.o: in function `dev_coredumpm_timeout':
   msm_debugfs.c:(.text+0x534): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/msm_gpu.o: in function `dev_coredumpm_timeout':
   msm_gpu.c:(.text+0x8fc): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/msm_kms.o: in function `dev_coredumpm_timeout':
   msm_kms.c:(.text+0x108): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/dp/dp_debug.o: in function `dev_coredumpm_timeout':
   dp_debug.c:(.text+0x498): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/dp/dp_aux.o: in function `dev_coredumpm_timeout':
   dp_aux.c:(.text+0x624): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/dp/dp_catalog.o: in function `dev_coredumpm_timeout':
   dp_catalog.c:(.text+0x0): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/dp/dp_ctrl.o: in function `dev_coredumpm_timeout':
   dp_ctrl.c:(.text+0xa500): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/dp/dp_display.o: in function `dev_coredumpm_timeout':
   dp_display.c:(.text+0x16dc): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/dp/dp_drm.o: in function `dev_coredumpm_timeout':
   dp_drm.c:(.text+0x340): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/dp/dp_link.o: in function `dev_coredumpm_timeout':
   dp_link.c:(.text+0xcf4): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/dp/dp_panel.o: in function `dev_coredumpm_timeout':
   dp_panel.c:(.text+0x174): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here
   ld: drivers/gpu/drm/msm/dp/dp_audio.o: in function `dev_coredumpm_timeout':
   dp_audio.c:(.text+0x918): multiple definition of `dev_coredumpm_timeout'; drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o:dpu_encoder.c:(.text+0x1e24): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
