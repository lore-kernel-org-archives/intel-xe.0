Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BA1C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 13:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C88110E11D;
	Fri, 29 Dec 2023 13:59:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C997810E11D
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 13:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703858348; x=1735394348;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=xhKPSsN0hvEtNCoc4GaknfFjk8ok7sEB7nJ0p+Jhlpc=;
 b=WvYgd5vkh8y3AUm3ZRul9KVq+9Frcz3+VrJ7DqMn3I30ppBEdi8Mbllm
 iWH/tbqh3CDI0mHzsDmkrwaWzrMjjMJTNLBQeWsqVUcIqnbJYW1e49Se+
 9i4Z+Wpmjwv/DIF+EXr7sl24FoZtBz5TJj7opJCHNU/G2Iz7wgQL258gJ
 eRjWgeSeG52graCl/THXtA07r/9XD6tTyTZJYjhFzkjMUtt4+Ii9XB91v
 SUc6+CBmxO37Yegcn9MmAnjIJIqtFpGqNEePtRqiudV0QMSm+aALTsP19
 BoK6zf2Byo9/m/JZLpGgFcc8TVcLlkrptLNz1PIvQBlhXNfrOIPFWvNoF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="10035360"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; d="scan'208";a="10035360"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 05:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="849217422"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; d="scan'208";a="849217422"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 29 Dec 2023 05:59:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rJDOB-000HUZ-04;
 Fri, 29 Dec 2023 13:59:03 +0000
Date: Fri, 29 Dec 2023 21:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [drm-xe:drm-xe-next 802/1046] kismet: WARNING: unmet direct
 dependencies detected for ACPI_WMI when selected by DRM_XE
Message-ID: <202312292136.7nFLaL9f-lkp@intel.com>
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
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   7b3b98d034784b125bad7aca46f9e7a3cfcde45a
commit: 44e694958b95395bd1c41508c88c8ca141bf9bd7 [802/1046] drm/xe/display: Implement display support
config: x86_64-kismet-CONFIG_ACPI_WMI-CONFIG_DRM_XE-0-0 (https://download.01.org/0day-ci/archive/20231229/202312292136.7nFLaL9f-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231229/202312292136.7nFLaL9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312292136.7nFLaL9f-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_WMI when selected by DRM_XE
   
   WARNING: unmet direct dependencies detected for ACPI_WMI
     Depends on [n]: X86_PLATFORM_DEVICES [=n] && ACPI [=y]
     Selected by [m]:
     - DRM_XE [=m] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m && MODULES [=y] || y && KUNIT [=n]=y) && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
