Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1966BC46CD2
	for <intel-xe@archiver.kernel.org>; Sun, 24 Dec 2023 11:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF02A10E064;
	Sun, 24 Dec 2023 11:51:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889C210E064
 for <intel-xe@lists.freedesktop.org>; Sun, 24 Dec 2023 11:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703418671; x=1734954671;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=AsP3p2DZP1R40O6Odjs4yDgqNcGVkoIrCRALAxkzXek=;
 b=cwm8VRUZSjSYgq5lGKzmTaDe/FPjPryAlAS412RYKeRm8NFeKrHMzaH/
 1YIBa4q98SaJeoNUy6sn4RLL11+3z/1RSu7JgSLdiT4gRcEV0uQO56GtH
 CAAtjaHIANdmf/cAfgwzoGEq9G5LIu/6N2LXs2i4jSJ0mzo3SasmeUl/k
 uO7KUcrmITKJ/63z3a1uNPyttd7cBJ5T+G0rfNm67Sft3iga1HK4TtaNb
 SirT4ccYFOLPILiqt5ZytMN8Z1ByNluqOrlh6SpmZFBmJqoBfmcJOFpK6
 Zr+esIMbDxEBVIpeOfwubSo2OE6HFQXWNDzPGUfu63xhpeNBuuF9VFknh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="17800168"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; d="scan'208";a="17800168"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2023 03:51:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="753730471"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; d="scan'208";a="753730471"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 24 Dec 2023 03:51:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rHN07-000CD5-2o;
 Sun, 24 Dec 2023 11:50:44 +0000
Date: Sun, 24 Dec 2023 19:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: drivers/gpu/drm/xe/display/ext/i915_utils.c:18:5: warning: no
 previous prototype for '__i915_inject_probe_error'
Message-ID: <202312241924.vFkCL7El-lkp@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Maarten,

FYI, the error/warning still remains.

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git new
head:   f30cae3de3b138849010f4e54d8800eb1cc080b9
commit: bc75b5825064c832457e4439b3a3ee03b5464fdb drm/xe/display: Implement display support
date:   10 weeks ago
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231224/202312241924.vFkCL7El-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312241924.vFkCL7El-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312241924.vFkCL7El-lkp@intel.com/

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
