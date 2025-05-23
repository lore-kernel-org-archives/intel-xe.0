Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55760C54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 22:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB95B10E19A;
	Fri, 23 May 2025 22:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qi9TNjH/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A52310E19A
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 22:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748037941; x=1779573941;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3SQ4b9mvlcSn5gq02pzro1J5w5A8mstVDIuSThnUHIg=;
 b=Qi9TNjH/waw5f9ygMDq1s4SoY5KScswo1IfzIrXFFTwnlSNO/GLLQQ1j
 FTDoO5a6vXrUQgF/ADLlPDJEzpjzDieEtovwxf+9m7yHWVBFKCi4p+4VS
 1987U5RtQMxoirEM1Njwj8IL3eMUZBoz7J9O9aASBPj+2HJYGLM4bN7v4
 XMnGSkkYccVSKaUZImfoQalEAGJSvjHyNgt33EdzFW0cWD7st8nRgOHBd
 AhLpTno9iFiXfUsOR7VjSb2GBhtEY7M8HonEkfcf0JG6o1CHaX+60zX3u
 +0Ky0wbmRF5c6tPC9d1fyZlVFcSKBfhQ6JIQadrAoB2CmRjl1vafl4PBD A==;
X-CSE-ConnectionGUID: zYuY77NeSi+rLXJ3gDcJNA==
X-CSE-MsgGUID: muhfutbGS1W47otDmNa5pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61153575"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="61153575"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 15:05:41 -0700
X-CSE-ConnectionGUID: 8TFKGq4FSIyyrHHqNIV5uA==
X-CSE-MsgGUID: oZA2c1PyRUCo6iWAFdZKTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="142274870"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 23 May 2025 15:05:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uIaWE-000Ql6-1e;
 Fri, 23 May 2025 22:05:34 +0000
Date: Sat, 24 May 2025 06:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: Re: [PATCH v3 07/11] drm/xe/vrsr: Enable VRSR on default VGA boot
 device
Message-ID: <202505240521.BnNwr31U-lkp@intel.com>
References: <20250523190155.2623462-8-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523190155.2623462-8-badal.nilawar@intel.com>
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

Hi Badal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250523]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge pci/next pci/for-linus linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/PCI-ACPI-Add-D3cold-Aux-Power-Limit_DSM-method/20250524-030125
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250523190155.2623462-8-badal.nilawar%40intel.com
patch subject: [PATCH v3 07/11] drm/xe/vrsr: Enable VRSR on default VGA boot device
config: s390-randconfig-001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240521.BnNwr31U-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240521.BnNwr31U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240521.BnNwr31U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_irq.c:12:
>> drivers/gpu/drm/xe/display/xe_display.h:75:64: warning: non-void function does not return a value [-Wreturn-type]
      75 | static inline bool xe_display_connected(struct xe_device *xe) {}
         |                                                                ^
   In file included from drivers/gpu/drm/xe/xe_irq.c:12:
   In file included from drivers/gpu/drm/xe/display/xe_display.h:9:
   In file included from drivers/gpu/drm/xe/xe_device.h:11:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:10:
   include/linux/pci-acpi.h:143:12: warning: unused function 'pci_acpi_request_d3cold_aux_power' [-Wunused-function]
     143 | static int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci-acpi.h:149:12: warning: unused function 'pci_acpi_add_perst_assertion_delay' [-Wunused-function]
     149 | static int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from drivers/gpu/drm/xe/xe_pm.c:17:
>> drivers/gpu/drm/xe/display/xe_display.h:75:64: warning: non-void function does not return a value [-Wreturn-type]
      75 | static inline bool xe_display_connected(struct xe_device *xe) {}
         |                                                                ^
   1 warning generated.


vim +75 drivers/gpu/drm/xe/display/xe_display.h

    74	
  > 75	static inline bool xe_display_connected(struct xe_device *xe) {}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
