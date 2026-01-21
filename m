Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0902AC44508
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 23:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DC610E8A0;
	Wed, 21 Jan 2026 23:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAGb2Hp9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DA410E8A0;
 Wed, 21 Jan 2026 23:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769039842; x=1800575842;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XtJqA4lxMnUiNq/ANj35j8PXYExbaJ3dQmGTH9bflHY=;
 b=CAGb2Hp99YWN0+6ELAevcUAyMGg9IgFO/QzlJ5fjNirp4QQdxz8CDKPm
 tkvbDTk8UPIH3Toa0goabzbLhUakR812pkJ4YusvLIzkmj38uULLqwzka
 pLPtbPmpZqItLJJeMLuQ9AQ9m0eaxdDCHjd+bY9ClcyDdo1Z5KJHp6YGW
 ogZMXHgCQHSwpa70OnlNDC8dv70Q73ZU1Tn7SWrtxvucMPzPjocM1G6AD
 LmvyEF4zMxk5o6Vnfm6RqL7eqOUv2TOM+i7SuAuuYQOFnb6wVe8vO/jwm
 vhkXdiqmPUP2qkcN7iqGV2+PMSDynietTnZi8J4edlfyE319BQGgS5amA w==;
X-CSE-ConnectionGUID: V5z9XgnzQvKlpxbrSBhz9A==
X-CSE-MsgGUID: 3Ispc32FSBKVvzrOilEAog==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57839346"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="57839346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 15:57:21 -0800
X-CSE-ConnectionGUID: 5PPI9BPBQSqybu2JTGeOrw==
X-CSE-MsgGUID: eTK+GWkWTf6OkFRM3qXpYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="211024389"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2026 15:57:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vii4b-00000000SB7-3rIq;
 Wed, 21 Jan 2026 23:57:17 +0000
Date: Thu, 22 Jan 2026 07:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [i915-rt v5 20/21] PREEMPT_RT injection
Message-ID: <202601220757.XPYUi6Wb-lkp@intel.com>
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
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260122/202601220757.XPYUi6Wb-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220757.XPYUi6Wb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220757.XPYUi6Wb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/tsm-core.c:16:22: warning: unused variable 'tsm_rwsem' [-Wunused-variable]
   static DECLARE_RWSEM(tsm_rwsem);
                        ^
   1 warning generated.


vim +/tsm_rwsem +16 drivers/virt/coco/tsm-core.c

603c646f001008e Dan Williams 2025-10-31  14  
603c646f001008e Dan Williams 2025-10-31  15  static struct class *tsm_class;
603c646f001008e Dan Williams 2025-10-31 @16  static DECLARE_RWSEM(tsm_rwsem);
603c646f001008e Dan Williams 2025-10-31  17  static DEFINE_IDA(tsm_ida);
603c646f001008e Dan Williams 2025-10-31  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
