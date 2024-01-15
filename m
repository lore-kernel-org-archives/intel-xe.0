Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70331C3DA79
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jan 2024 22:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF32410E398;
	Mon, 15 Jan 2024 22:31:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C9910E398
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jan 2024 22:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705357894; x=1736893894;
 h=date:from:to:cc:subject:message-id;
 bh=pYKJPu8j+siq24Age8Qntbf9HdsXnQMJulSXhJIdCuA=;
 b=gteCC1ETPmYNDHV1E6XcGEFpYMGc7KlOMej3ctgCtb6cqCUvy8vjWg/B
 VA+UAAyU7zbhq/V01z/ZGdiq3o7dOY8dVvtB+zg9Wv2vhCRI3HGYKD88b
 VqFtPCoMlStxWPJnhCRd5MaqrCMzT7GtsKKvCTJ7k9rQyUM2BO26moDSh
 p50vK6q+fxMsaxF4OOzW3l87xRMc0wfdFApt68S/nX6Q890Ld+tr7VLIp
 xTxJLDMWf1554H5xf7cBL7vkFM+tM20jrDULQtLCBOe8BP+kdTsVIeHZC
 8GlgDhcqn2WLVdzQLHeSZ5r9xvyr5WfL6NmqayhMaBEuWm6uswq2ESePd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="399376700"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="399376700"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 14:31:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="25913765"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 15 Jan 2024 14:31:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rPVUP-000ClU-1P;
 Mon, 15 Jan 2024 22:31:29 +0000
Date: Tue, 16 Jan 2024 06:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 3a1d727c0061b96ddf8e653130f94ab331e2f065
Message-ID: <202401160655.8jUpYeWU-lkp@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 3a1d727c0061b96ddf8e653130f94ab331e2f065  drm/xe: Use kstrdup while creating snapshot

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- sparc-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
`-- sparc64-allyesconfig
    `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined

elapsed time: 3440m

configs tested: 60
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20240116   gcc  
arm                            mmp2_defconfig   clang
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20240116   clang
arm                   randconfig-002-20240116   clang
arm                             rpc_defconfig   gcc  
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240115   gcc  
i386         buildonly-randconfig-002-20240115   gcc  
i386         buildonly-randconfig-003-20240115   gcc  
i386         buildonly-randconfig-004-20240115   gcc  
i386         buildonly-randconfig-005-20240115   gcc  
i386         buildonly-randconfig-006-20240115   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240115   gcc  
i386                  randconfig-002-20240115   gcc  
i386                  randconfig-003-20240115   gcc  
i386                  randconfig-004-20240115   gcc  
i386                  randconfig-005-20240115   gcc  
i386                  randconfig-006-20240115   gcc  
i386                  randconfig-011-20240115   clang
i386                  randconfig-012-20240115   clang
i386                  randconfig-013-20240115   clang
i386                  randconfig-014-20240115   clang
i386                  randconfig-015-20240115   clang
i386                  randconfig-016-20240115   clang
loongarch                        allmodconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                 linkstation_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                           se7722_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
