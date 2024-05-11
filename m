Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44974C04FFE
	for <intel-xe@archiver.kernel.org>; Sat, 11 May 2024 10:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CE310E0C3;
	Sat, 11 May 2024 10:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+a5zrEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F2010E0C3
 for <intel-xe@lists.freedesktop.org>; Sat, 11 May 2024 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715423643; x=1746959643;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LT6Da7c4yV7kBRJbMeeyERprde8ybU+YWeO2wvVYDYw=;
 b=m+a5zrEYsjLHmhtgTf7xSAOKR0mZl8ciX8aP2wdPakbvwaz5E/V6PIUY
 fLCCjcZ+qRu9R+bEJF/3agmlURKi4J8wFh8CFGewebt/AGAhmT/tvln/H
 b3pdcHHAKf0DnqvJPFmI1fd45Be3SIXA+jxEIi8jsYJTnIVg7A5DcqPV3
 KxIFUFGmZ55ubp9IHGTk99Vvg1Sh5BgmUYNbKSGxxizOlBp60+a1pNKKO
 AFuYBU3NySgV32NWKdy8hAbZgQ6xt/F0kBzRDnQ77QdKtJFzIQ3ZpfcgO
 PTAmJvbzPhmKea81bFVM04cYF86h+eI0POQ9xeHynpV4yuSZin7kSloBe g==;
X-CSE-ConnectionGUID: YQGOzIznSDGItSFG71YTIw==
X-CSE-MsgGUID: kiREGoCjSD+irG3MXxmrMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="22823085"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; d="scan'208";a="22823085"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2024 03:34:02 -0700
X-CSE-ConnectionGUID: G0c0dGLoTZi5sT1EHAA2Tg==
X-CSE-MsgGUID: SIOyAG5mTmC5erWvfJq7JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; d="scan'208";a="29845344"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 11 May 2024 03:34:01 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s5k3B-0007Fn-2u;
 Sat, 11 May 2024 10:33:57 +0000
Date: Sat, 11 May 2024 18:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 20/20] drm/xe/display: move device_remove over to drmm
Message-ID: <202405111828.vE3DTOeD-lkp@intel.com>
References: <20240510181212.264622-42-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510181212.264622-42-matthew.auld@intel.com>
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

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm-misc/drm-misc-next next-20240510]
[cannot apply to linus/master v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/drm-drm_managed-try-to-improve-the-drmm-DOC/20240511-061452
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240510181212.264622-42-matthew.auld%40intel.com
patch subject: [PATCH 20/20] drm/xe/display: move device_remove over to drmm
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240511/202405111828.vE3DTOeD-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111828.vE3DTOeD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111828.vE3DTOeD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_device.c:18:
>> drivers/gpu/drm/xe/display/xe_display.h:50:60: warning: non-void function does not return a value [-Wreturn-type]
      50 | static inline int xe_display_probe(struct xe_device *xe) { }
         |                                                            ^
   1 warning generated.


vim +50 drivers/gpu/drm/xe/display/xe_display.h

    49	
  > 50	static inline int xe_display_probe(struct xe_device *xe) { }
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
