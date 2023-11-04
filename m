Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3625BC4332F
	for <intel-xe@archiver.kernel.org>; Sat,  4 Nov 2023 11:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD7810E0E5;
	Sat,  4 Nov 2023 11:36:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DF810E0E5
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Nov 2023 11:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699097812; x=1730633812;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=vrHrakceFbGTEd+gcbDgVKGrFvKLRsf/Y5UhRk8Mq8U=;
 b=aMItVgnNQQup0Tr2RI2qLfO2iQU+BllYkn8n27PT69iOpw4r1xH145mO
 h4MinaT+Ul0zJVb2N2qCPfsRh/Aoq8YoohYKb+tqjLgXXMwPZgvG5aGE/
 vFh5Ku7tqj5CFddHG2V1YYmqNYTVyTqkcBPGErF8sfJbxX6E/rGB9ALor
 ZMCCqBEoguuQN0tG2mM6jj+f/VZiqRJo/t6kC0FYJuvC+DxbNKeppvdXN
 hAaJIlxLMLr4tlNZysxdzNW3JVTP+M1gNvTedXPSLCnxpuLIxKt2UVNqE
 Xbp5o6spQu+boMbDVWozx5/Zv5IETj7+yV5uLA78c8tOghPeRQ2HZ/5I5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="391948535"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; d="scan'208";a="391948535"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2023 04:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="905608016"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; d="scan'208";a="905608016"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2023 04:36:50 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qzExM-0004AY-1k;
 Sat, 04 Nov 2023 11:36:48 +0000
Date: Sat, 4 Nov 2023 19:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <202311041902.rsDm3Z8h-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:drm-xe-next 1794/1905]
 drivers/gpu/drm/xe/display/ext/i915_utils.c:18:5: warning: no previous
 prototype for '__i915_inject_probe_error'
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   bfa43da8e1f181fe2f8b84b39cb8a86e54f43731
commit: bc75b5825064c832457e4439b3a3ee03b5464fdb [1794/1905] drm/xe/display: Implement display support
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041902.rsDm3Z8h-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041902.rsDm3Z8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041902.rsDm3Z8h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/display/ext/i915_utils.c:18:5: warning: no previous prototype for '__i915_inject_probe_error' [-Wmissing-prototypes]
      18 | int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/__i915_inject_probe_error +18 drivers/gpu/drm/xe/display/ext/i915_utils.c

    16	
    17	/* i915 specific, just put here for shutting it up */
  > 18	int __i915_inject_probe_error(struct drm_i915_private *i915, int err,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
