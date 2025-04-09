Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2E1C36010
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 02:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B2910E1D3;
	Wed,  9 Apr 2025 02:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFrCpgf6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449C110E1D3;
 Wed,  9 Apr 2025 02:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744167397; x=1775703397;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T3RkhrnpKT7SqKCWSL5Ldt/b1GthSKY8cecXZIi+lwE=;
 b=PFrCpgf6O2Hr5c07Onc80pInkn5Pc1bl2oRHdjdYcp7H74SOFo0XYBzl
 NH7MowwLbZU6bchTlzrxlkUzP9cEkT3U9QHreC7RYg13TLFd0DnD6dpQU
 a+353q4NrCg2k70OqywbdWho8GfPrqtFS+sCrtOiR2Wf8HviLTY9GDEPV
 8RpE2C8e3x3BJpIdFMnLH+7ov4qELL3snpl+WWBlAWimjrMqJmr8ptGUQ
 ngDwhYgt68f/mbeXQaeWeGwYRkBUcRmc0TeAXIftcAyBZuJqbJzcOBgT0
 HOh+84apaFI0cN4tgH09GEcweKhYStXSjX9Y0zPIzhBbY3sZVi5E2uTZJ w==;
X-CSE-ConnectionGUID: Q/kza2CkRV2uaY/4HqTfKw==
X-CSE-MsgGUID: 0rGHZmBvQwG/IhOwn0/Dqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48331885"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="48331885"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 19:56:37 -0700
X-CSE-ConnectionGUID: TR7Mp3BuT4mYTCxb5sL0Hw==
X-CSE-MsgGUID: dm0jXmI5S3m3bx706QIdsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="133656439"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 08 Apr 2025 19:56:35 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u2Lc8-0008DF-35;
 Wed, 09 Apr 2025 02:56:32 +0000
Date: Wed, 9 Apr 2025 10:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 09/10] drm/i915: Add support for forcing the link bpp on
 a connector
Message-ID: <202504091033.XYeu9dAP-lkp@intel.com>
References: <20250408214342.1953197-10-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408214342.1953197-10-imre.deak@intel.com>
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

Hi Imre,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250408]
[also build test ERROR on v6.15-rc1]
[cannot apply to linus/master v6.15-rc1 v6.14 v6.14-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-i915-dp-Use-the-correct-connector-while-computing-the-link-BPP-limit-on-MST/20250409-055536
base:   next-20250408
patch link:    https://lore.kernel.org/r/20250408214342.1953197-10-imre.deak%40intel.com
patch subject: [PATCH 09/10] drm/i915: Add support for forcing the link bpp on a connector
config: i386-buildonly-randconfig-006-20250409 (https://download.01.org/0day-ci/archive/20250409/202504091033.XYeu9dAP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504091033.XYeu9dAP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504091033.XYeu9dAP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xe/xe.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
