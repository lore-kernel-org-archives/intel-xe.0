Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18D1C10DCE
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 03:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6011F10E661;
	Wed,  6 Dec 2023 03:17:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B75E10E661
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 03:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701832644; x=1733368644;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ts/Zsxjqah0jasKrxeazl2DdZb0Dwog9kLJD2FVNcks=;
 b=FNzVrw7eOydvGzSawmr9TIv2D+FEzufNpt4kkRxBoD/2JxaQHCT+gkVc
 4/v0P+PTrRDoDAVjSLolPEKQHj6fjcugJFgCIfupx7GRYi49KUIbL37JL
 WTsuCJEeOMMOqdfn29IynZCkM73HZf83BTCfPuykC244cD2uo4unZyUfx
 L7Stku9pzs84A4wg6d9N7bgoDv++S1/iCGXLKiICgAIEsNRJNoEwHmu/y
 ggk/jeihyzhvifwchec6faaAbw/XTi+Tzptim0kYGPWiJLuqyhWQbBJyb
 dC4jws43sH7xTu8NH2i6d0tSO1ksN/xRcU2s+zXjDT6E72HMMbzQU0szV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374181590"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="374181590"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 19:17:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018428696"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="1018428696"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 19:17:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rAiPX-000A9J-0V;
 Wed, 06 Dec 2023 03:17:19 +0000
Date: Wed, 6 Dec 2023 11:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: Animesh Manna <animesh.manna@intel.com>
Message-ID: <202312061147.C1lwjngu-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:drm-xe-next 6/6]
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c:20:54: warning: variable 'val'
 is uninitialized when used within its own initialization
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
head:   8833b1390068f7340259f5130c564cdadff5b189
commit: a8b405ffc0326c79abf737389d99c290648f381d [6/6] drm/xe/dsb: DSB implementation for xe
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231206/202312061147.C1lwjngu-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061147.C1lwjngu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061147.C1lwjngu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/display/xe_dsb_buffer.c:20:54: warning: variable 'val' is uninitialized when used within its own initialization [-Wuninitialized]
           iosys_map_wr(&dsb_buf->vma->bo->vmap, idx * 4, u32, val);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/iosys-map.h:417:16: note: expanded from macro 'iosys_map_wr'
           type__ val = (val__);                                                   \
                  ~~~    ^~~~~
   1 warning generated.


vim +/val +20 drivers/gpu/drm/xe/display/xe_dsb_buffer.c

    17	
    18	void intel_dsb_buffer_write(struct intel_dsb_buffer *dsb_buf, u32 idx, u32 val)
    19	{
  > 20		iosys_map_wr(&dsb_buf->vma->bo->vmap, idx * 4, u32, val);
    21	}
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
