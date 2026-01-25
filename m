Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256CAE63CB1
	for <intel-xe@archiver.kernel.org>; Sun, 25 Jan 2026 17:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF5310E0A4;
	Sun, 25 Jan 2026 17:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCInzFCO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B49A10E0A4;
 Sun, 25 Jan 2026 17:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769362593; x=1800898593;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nv1wxSrtm7P0hycmz56kHy70Z0Tg3BIJ1VNF0ACAFoE=;
 b=aCInzFCOYZg3JZ4nXpwIUFtgFNAy4cNuJ0Enne9tSbnzT0RUb0veQNIO
 tITLZoRwI0+gDibqEhm6IfJnOz3GlXJMiItnKhqGCaKqTop8Dv5QT4pHB
 evELpETqCy/w6JbyLBR4YDG1tjKBCGMeB0K+4MpmgSNGl+q4eXKMxIwDr
 mrK6E4sjD5KDBrTJJ/WjHjYjD++9lCD4XAguK/5jt+zdx0AXo4xEXsyS9
 LOTq8mtpzI4WRTDa4bepYToD6lDJ7ag/wPJArvhmnih/qmwIKL/pA+hek
 Ux8KIqEY3L9UrPJagKeM9k7kFWlIM2wWVYhi0qhDf/b+g7rfzdNJPGUdO A==;
X-CSE-ConnectionGUID: d9Vcs3xnT0O9B9Oy1+mKcw==
X-CSE-MsgGUID: OWczF7xRR/GIH3t18dHKow==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="73137744"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; d="scan'208";a="73137744"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2026 09:36:33 -0800
X-CSE-ConnectionGUID: ehcMsMgnQ2Oyiy3lgNVKug==
X-CSE-MsgGUID: Dny8s/5ORwO1xDUdrwvm6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; d="scan'208";a="238139627"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 25 Jan 2026 09:36:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vk42F-00000000WJ4-0Wiz;
 Sun, 25 Jan 2026 17:36:27 +0000
Date: Mon, 26 Jan 2026 01:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev,
 "David E. Box" <david.e.box@linux.intel.com>, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 4/6] platform/x86/intel/vsec: Switch exported helpers
 from pci_dev to device
Message-ID: <202601260115.T3rBZhUE-lkp@intel.com>
References: <20260123025108.3772255-5-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123025108.3772255-5-david.e.box@linux.intel.com>
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

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0f61b1860cc3f52aef9036d7235ed1f017632193]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-intel-vsec-Refactor-base_addr-handling/20260123-105437
base:   0f61b1860cc3f52aef9036d7235ed1f017632193
patch link:    https://lore.kernel.org/r/20260123025108.3772255-5-david.e.box%40linux.intel.com
patch subject: [PATCH v4 4/6] platform/x86/intel/vsec: Switch exported helpers from pci_dev to device
config: x86_64-randconfig-074-20251025 (https://download.01.org/0day-ci/archive/20260126/202601260115.T3rBZhUE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260115.T3rBZhUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260115.T3rBZhUE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> drivers/gpu/drm/xe/xe_vsec.h:13:30: error: 'struct device' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      13 | int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
         |                              ^~~~~~
   cc1: all warnings being treated as errors


vim +13 drivers/gpu/drm/xe/xe_vsec.h

    11	
    12	void xe_vsec_init(struct xe_device *xe);
  > 13	int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
