Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE08C25B76
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 16:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D0210E0D5;
	Sat,  8 Jun 2024 16:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAfmukdg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F6110E0D5
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jun 2024 16:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717865349; x=1749401349;
 h=date:from:to:cc:subject:message-id;
 bh=cdbeAfRSgsQpGx5fOy62181Fw2aYZa+sMNfR3DlBXa0=;
 b=TAfmukdg0xEldgE2WlhckGF5AZcG/QOJy0UwBTA23/gqxfMxRYBM6qje
 Z3Hl/C9n38n4mLX0hGBuqOJrMtKy8NEWeFq/wHsTANFQC5uc2GDQKc/21
 ff3xG5BZwxQsKinrmxh2JFL3zpqYyXLX4N38yNmaqHKiQJ79iL505y4Ld
 8K8+r1e/PH3kGl/oSf19+QhSJzcKQY5078FsvrWpFkSUha5Oz5Q/GHUVT
 YuYkEO+ndntkziMUo7U8sFcCcSMIT6+rFSglmUH8FbZzxOMr2vKxt8Ues
 Ih2Uwl+fQVxfiw9nXBE1L0z+RazNXd0LFTe4/7D7d44RJfrqYr6+nFny0 g==;
X-CSE-ConnectionGUID: FJpIVe3cTM2MMJaRd4W4kA==
X-CSE-MsgGUID: MfmqIEDtS1O2r/MxZq6qUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14406274"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; d="scan'208";a="14406274"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2024 09:49:09 -0700
X-CSE-ConnectionGUID: FAlXfEweRg2ljOScFitRGg==
X-CSE-MsgGUID: s90715eARDC5GpI6C7+2qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; d="scan'208";a="39299433"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 08 Jun 2024 09:49:08 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sFzFZ-0000FD-23;
 Sat, 08 Jun 2024 16:49:05 +0000
Date: Sun, 09 Jun 2024 00:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 4468d0488ecb91639f12659f8a025139120a431b
Message-ID: <202406090005.o5sfN6zl-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 4468d0488ecb91639f12659f8a025139120a431b  drm/xe: Drop EXEC_QUEUE_FLAG_BANNED

elapsed time: 1454m

configs tested: 20
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                                allnoconfig   clang
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
