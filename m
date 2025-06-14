Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3912C71135
	for <intel-xe@archiver.kernel.org>; Sat, 14 Jun 2025 04:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12B310E07B;
	Sat, 14 Jun 2025 04:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOtusknH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE6B10E07B
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Jun 2025 04:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749875582; x=1781411582;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F4zzCZQStaDfn9Xeb7dHKaUTAt0aWoaugxinFwVI6D8=;
 b=VOtusknHKNfwTmVzrZrnQcSWrMB0irz6a5XIt3QqKYe/nB5Nzq5DkIJC
 V2/2M6VwllWGxn5enxae+Hz5wCIpgH7zwsCy8oxFltZgQQtTD9jJAV1qE
 4jibBmEeLzYjJNQu9g1uoPOqwxDQVdtCWhzFnSrAm7BjWGmzyLZAWGj4P
 mvHFR3DlEaKGlIx8rgxg+6zzSGa5tc49KeCiUGHFw+Ch7cnKSTpKBLJ4g
 pCFOA5DGfTkokbYp6GqMmEnM27iHGbojm3AKOrqauzFxK2Yh4BqEXm1ZH
 eMtjpi4i1cOoX+3i71FXHDWokO77c5p3MOLYy485fuO08OE/bfH1t8ZE2 w==;
X-CSE-ConnectionGUID: 2aKcdwlQRz+tT1NgkxfbwA==
X-CSE-MsgGUID: zJcuSv1VTxaTpBvJ2Bwj7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63504833"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="63504833"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 21:33:00 -0700
X-CSE-ConnectionGUID: KXsPiffZSZuuDUNyoXBIvw==
X-CSE-MsgGUID: qdHoSNMRQ0CTmw7TwgFYdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="147892628"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 13 Jun 2025 21:32:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uQIZc-000DIQ-2a;
 Sat, 14 Jun 2025 04:32:56 +0000
Date: Sat, 14 Jun 2025 12:31:57 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 11/20] drm/xe: Allow CPU address mirror VMA unbind
 with gpu bindings for madvise
Message-ID: <202506141250.wwQhe2P0-lkp@intel.com>
References: <20250613125558.2607665-12-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-12-himal.prasad.ghimiray@intel.com>
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

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250613]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/Introduce-drm_gpuvm_sm_map_ops_flags-enums-for-sm_map_ops/20250614-003138
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250613125558.2607665-12-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v4 11/20] drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for madvise
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250614/202506141250.wwQhe2P0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506141250.wwQhe2P0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506141250.wwQhe2P0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/xe/xe_svm.c:945 function parameter 'vm' not described in 'xe_svm_unmap_address_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
