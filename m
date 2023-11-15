Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B89FC07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 13:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B61610E113;
	Wed, 15 Nov 2023 13:05:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90C310E113
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 13:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700053509; x=1731589509;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=fl2KgAOspRDSHaeQpwBvYNd0skppiXxytJbu41LdzGw=;
 b=gWzkyItmzp7OB6TG9nhh2OlZsIdqrAYuEC36BibtII2oZPsnvOucfleF
 VfjaFZUVEJHX0EsgVPAzSnO134x2qemBTGkeLAXEayCPCyM61fB4DLLM7
 oN6vMf8p6yw/VMQt5GjoAKveh70I7jg/t76kxED08cfC9bjJugIyTVr4B
 TWNrj1Jo3sY53HfmCmaog95LfldQGzoQ31cpuKHLx32MYH3vHTRkvfiUx
 DdCM/5SLPcZO3poMDmB3l9leLyLWQQH/OYdshk6HKp2cXbFfgFgYbUoUS
 AWdTF3XysKjfz2ttOb6wW+eT00gBKMsibyAs5aNrw/IaaZIpzpMmOOgqv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="375911317"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="375911317"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 05:05:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096437485"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="1096437485"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2023 05:05:03 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r3FZl-0000LE-0q;
 Wed, 15 Nov 2023 13:05:01 +0000
Date: Wed, 15 Nov 2023 21:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Message-ID: <202311152128.2R0TGUKs-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:drm-xe-next 3/15]
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c:13:25: warning: no previous
 prototype for 'intel_fbdev_fb_alloc'
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
head:   14d1d786caacdb3438d07ab86fabf2e36c8151cc
commit: 9eb20bf3156f1a9e1c73e857be09c042deb2b5a0 [3/15] drm/i915/display: split i915 specific code from intel_fbdev
config: x86_64-randconfig-004-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152128.2R0TGUKs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152128.2R0TGUKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152128.2R0TGUKs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_fbdev_fb.c:13:25: warning: no previous prototype for 'intel_fbdev_fb_alloc' [-Wmissing-prototypes]
      13 | struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
         |                         ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_fbdev_fb.c:68:5: warning: no previous prototype for 'intel_fbdev_fb_fill_info' [-Wmissing-prototypes]
      68 | int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/intel_fbdev_fb_alloc +13 drivers/gpu/drm/i915/display/intel_fbdev_fb.c

    12	
  > 13	struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
    14						     struct drm_fb_helper_surface_size *sizes)
    15	{
    16		struct drm_framebuffer *fb;
    17		struct drm_device *dev = helper->dev;
    18		struct drm_i915_private *dev_priv = to_i915(dev);
    19		struct drm_mode_fb_cmd2 mode_cmd = {};
    20		struct drm_i915_gem_object *obj;
    21		int size;
    22	
    23		/* we don't do packed 24bpp */
    24		if (sizes->surface_bpp == 24)
    25			sizes->surface_bpp = 32;
    26	
    27		mode_cmd.width = sizes->surface_width;
    28		mode_cmd.height = sizes->surface_height;
    29	
    30		mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
    31					    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
    32		mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
    33								  sizes->surface_depth);
    34	
    35		size = mode_cmd.pitches[0] * mode_cmd.height;
    36		size = PAGE_ALIGN(size);
    37	
    38		obj = ERR_PTR(-ENODEV);
    39		if (HAS_LMEM(dev_priv)) {
    40			obj = i915_gem_object_create_lmem(dev_priv, size,
    41							  I915_BO_ALLOC_CONTIGUOUS |
    42							  I915_BO_ALLOC_USER);
    43		} else {
    44			/*
    45			 * If the FB is too big, just don't use it since fbdev is not very
    46			 * important and we should probably use that space with FBC or other
    47			 * features.
    48			 *
    49			 * Also skip stolen on MTL as Wa_22018444074 mitigation.
    50			 */
    51			if (!(IS_METEORLAKE(dev_priv)) && size * 2 < dev_priv->dsm.usable_size)
    52				obj = i915_gem_object_create_stolen(dev_priv, size);
    53			if (IS_ERR(obj))
    54				obj = i915_gem_object_create_shmem(dev_priv, size);
    55		}
    56	
    57		if (IS_ERR(obj)) {
    58			drm_err(&dev_priv->drm, "failed to allocate framebuffer (%pe)\n", obj);
    59			return ERR_PTR(-ENOMEM);
    60		}
    61	
    62		fb = intel_framebuffer_create(obj, &mode_cmd);
    63		i915_gem_object_put(obj);
    64	
    65		return fb;
    66	}
    67	
  > 68	int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
