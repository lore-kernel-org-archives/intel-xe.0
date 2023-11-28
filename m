Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA9EC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 05:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52A810E02A;
	Tue, 28 Nov 2023 05:56:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D37410E02A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 05:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701150987; x=1732686987;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=6lD55ET0/D/PC4UMK+sBAL7mJYqk00KPnm98ys5j6Gs=;
 b=fMbhI/eUvkf0qFG/+cLn3Pw1f4LIvdJy1NX5g27peaQI+F7pZToRalA4
 QX9BZWY5Gc+zJ+lCVq9NqtHkUSJVXkaLgnegddNsY0cxNrVeIuRVPXZ4b
 SkYoFuF0ChlhlKfYcVdmR/XflwIX8Mmf1L/O1VCH6brAQ7E9xH//FfMMq
 0ontFTc+fje2bUkSpqSJOSaZhMBQCVSg4VqTtB+xHvPQafbvJ/G7qbXRo
 yeDzQIySyvI5qKJca4NhRi8dzcF5AEPLR6wxgVt6jZETr5KshM9A49JlA
 +C8d0LiBvh7ctYsoEv0nBsdwX8vgKyBf0YILyPDBBaazsN5Ahc0Gwg8UD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383239676"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="383239676"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 21:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1099989744"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="1099989744"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 27 Nov 2023 21:56:25 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r7r54-00074W-2p;
 Tue, 28 Nov 2023 05:56:22 +0000
Date: Tue, 28 Nov 2023 13:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <202311281042.9kbU5vGV-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:drm-xe-next 3/3] drivers/gpu/drm/xe/xe_lrc.c:26:
 warning: "CTX_VALID" redefined
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Lucas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   30f75cb8aa11ac361220d1491262254371302f9e
commit: 50846befe4ba5c1ce589dc88087d45991f8069ba [3/3] drm/xe: Remove GEN[0-9]*_ prefixes
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20231128/202311281042.9kbU5vGV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311281042.9kbU5vGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311281042.9kbU5vGV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_lrc.c:26: warning: "CTX_VALID" redefined
      26 | #define CTX_VALID                               (1 << 0)
         | 
   In file included from arch/sparc/include/asm/mmu.h:5,
                    from include/linux/mm_types.h:23,
                    from arch/sparc/include/asm/uaccess_64.h:11,
                    from arch/sparc/include/asm/uaccess.h:8,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/irq_work.h:6,
                    from drivers/gpu/drm/xe/xe_hw_fence_types.h:11,
                    from drivers/gpu/drm/xe/xe_lrc_types.h:9,
                    from drivers/gpu/drm/xe/xe_lrc.h:8,
                    from drivers/gpu/drm/xe/xe_lrc.c:6:
   arch/sparc/include/asm/mmu_64.h:57: note: this is the location of the previous definition
      57 | #define CTX_VALID(__ctx)        \
         | 

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/CTX_VALID +26 drivers/gpu/drm/xe/xe_lrc.c

    25	
  > 26	#define CTX_VALID				(1 << 0)
    27	#define CTX_PRIVILEGE				(1 << 8)
    28	#define CTX_ADDRESSING_MODE_SHIFT		3
    29	#define LEGACY_64B_CONTEXT			3
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
