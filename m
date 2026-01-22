Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5383D625E2
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 02:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1B410E044;
	Thu, 22 Jan 2026 02:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtYBGZkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEA110E040;
 Thu, 22 Jan 2026 02:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769049091; x=1800585091;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2HblUV5C8wpiJAwySPd2lXcrTYu1cGvyOm1A2rHnvVw=;
 b=TtYBGZkmrhO77cle5Osd7eozvy7GJ+t9bgbNWjOZpKKFhIMsNW/Tw3Rd
 F8kaqBC1LEcvk2ak4+1AqrlcqFWzuvInz63WB2A72LGO7CSLgjOccLwDI
 OtRWAev/tO9ZFNRCBKPIev78dEdTHlOG5/t7Fr0TORd1nUsgVdAIU7OfG
 9UEae2XtC8+6GuZhlBx/0HjqqWB6mgDEDfqSMPrkmKOcUQ9267radhbef
 f314PyMe0Mx9gbSjueaxboIz4DHqkLI71XKeJq9+0B06nz4lXyIPt6rlK
 FgJz6128KbeI3f9PaWoOVkmDMpkYAHTel3LwET+g+7CvMg+VBk93AE+tQ g==;
X-CSE-ConnectionGUID: cEd58uW9SdSqeOQV5YVDvw==
X-CSE-MsgGUID: 5PixptTWTx2giw0sXOjdpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70453298"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="70453298"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 18:31:30 -0800
X-CSE-ConnectionGUID: MQhK5G2hTFulia/P5ySCLA==
X-CSE-MsgGUID: YbA9IFSUTtWqrxBheakejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="237282220"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 21 Jan 2026 18:31:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vikTm-00000000SKV-1w1p;
 Thu, 22 Jan 2026 02:31:26 +0000
Date: Thu, 22 Jan 2026 10:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [i915-rt v5 20/21] PREEMPT_RT injection
Message-ID: <202601221037.9YksOSlP-lkp@intel.com>
References: <20260121135318.651622-21-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121135318.651622-21-dev@lankhorst.se>
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

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20260121]
[cannot apply to drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-i915-display-Fix-intel_lpe_audio_irq_handler-for-PREEMPT-RT/20260121-223353
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260121135318.651622-21-dev%40lankhorst.se
patch subject: [i915-rt v5 20/21] PREEMPT_RT injection
config: i386-buildonly-randconfig-002-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221037.9YksOSlP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221037.9YksOSlP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221037.9YksOSlP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1534,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from drivers/platform/x86/lenovo/wmi-gamezone.c:11:
>> drivers/platform/x86/lenovo/wmi-gamezone.c:34:31: warning: 'gz_chain_head' defined but not used [-Wunused-variable]
      34 | static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
         |                               ^~~~~~~~~~~~~
   include/linux/notifier.h:119:39: note: in definition of macro 'BLOCKING_NOTIFIER_HEAD'
     119 |         struct blocking_notifier_head name =                    \
         |                                       ^~~~


vim +/gz_chain_head +34 drivers/platform/x86/lenovo/wmi-gamezone.c

22024ac5366f06 Derek J. Clark 2025-07-01  33  
22024ac5366f06 Derek J. Clark 2025-07-01 @34  static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
22024ac5366f06 Derek J. Clark 2025-07-01  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
