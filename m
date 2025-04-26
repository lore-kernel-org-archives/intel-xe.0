Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35CAC369CB
	for <intel-xe@archiver.kernel.org>; Sat, 26 Apr 2025 08:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4B810E221;
	Sat, 26 Apr 2025 08:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpg3T5nv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E2D10E221
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Apr 2025 08:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745657689; x=1777193689;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=s7kevVmE4hen9Evty3NpyfoQ60pX21o3uEWG7lg3mKk=;
 b=bpg3T5nvY/XuhaeYHv0e3NQzfLLRoOdEkWR3hJ6bau6ijqCPa6iW/WuM
 HXMMBTqHPjTUxdj1Afzwn/WoU/pn2tznZiG4urnaYNH8LTm26oXDi/roO
 RouTvY8hC5PYgGrZePFfQIxICjx4i3aF6Yt3AHYaUBuYmgc9bTJyo04qo
 TUmncOAx+1JIqOkNMQ/s9ANPJoJ2gfDgn2Zz42x91kTnYBA2/JtgDdX0z
 hwEoJZiDQ5KPieOUh6HJUQYB/rquILztbRxae5BZ0LAnZQcrD75443zr3
 6QDcxLHLGlkacpn88OKBrM9ON4cBswYwmr7g0RTJfOcpXLi9Zzpi26pZM Q==;
X-CSE-ConnectionGUID: PnrjUkO6TAefUW8fkg0bng==
X-CSE-MsgGUID: fcZPiS9kRAeFt/8c29Imqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="57957781"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; d="scan'208";a="57957781"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2025 01:54:49 -0700
X-CSE-ConnectionGUID: j29CRLpWRvSP5t6hS6Fnow==
X-CSE-MsgGUID: ry1AqL3dR1eT9zzm4RDeSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; d="scan'208";a="133616640"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 26 Apr 2025 01:54:48 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u8bJ7-0005mz-17;
 Sat, 26 Apr 2025 08:54:45 +0000
Date: Sat, 26 Apr 2025 16:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [drm-xe:drm-xe-next 1/4] ERROR: modpost: "__moddi3"
 [drivers/gpu/drm/xe/xe.ko] undefined!
Message-ID: <202504261628.EDuMMQs1-lkp@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   238ae3be582070aedd91c75f07483fbb2a77fc45
commit: c4a2e5f865b7230a9565c57c54b375b1d2ce82f5 [1/4] drm/xe: Add devcoredump chunking
config: powerpc-randconfig-003-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261628.EDuMMQs1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504261628.EDuMMQs1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504261628.EDuMMQs1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__moddi3" [drivers/gpu/drm/xe/xe.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
