Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82667C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 06:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CDA10EBB5;
	Fri, 19 Apr 2024 06:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lYgq6qRN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E2610EBB5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 06:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713506994; x=1745042994;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=so+sLJApLfl6oLoQ1oPrn2PJO7mgA4HU43oVO+di3zM=;
 b=lYgq6qRNcOPiQqsJifz0n6Pk69D2ReO3frH0J1yDn5Wv2hz3BJC3susu
 H8YzUslGWpN4MQzSPdiq4rIGuTCABxl98QvumJuTYUjgtirxVmQcTeSin
 wNk+iGQr3OAkmvKDY/V75T8p4x9PSe3gIM1QDI1tbJkDKMNBNJHc7aDkw
 lcgt1AYMGo7qyrFcg1JZbA93EYygd2qI34n0tlCiC2VFzflUXncFEZk8i
 C6q5hGbo8iGrDSzaDr/DO6BxG+o4QrFBALKK1rBgjSdLqIHO4fq7gmUue
 MMgMTGC3Wrnl1sP1JzOP9enCPGAJiX98PYEZq9wPp8ufLHt0FhBjQI/ce A==;
X-CSE-ConnectionGUID: X0lFwT4WSGqRC/07oOAZ/A==
X-CSE-MsgGUID: DW/KMlR+RI+yhyeBkF0HTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="34488835"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="34488835"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 23:09:54 -0700
X-CSE-ConnectionGUID: 1Z3eR4X2RLOBd9NjrJ58uQ==
X-CSE-MsgGUID: EumrmkM2T5Gk4OcVWcGKyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="60664282"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 18 Apr 2024 23:09:53 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rxhRU-0009fN-0H;
 Fri, 19 Apr 2024 06:09:48 +0000
Date: Fri, 19 Apr 2024 14:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Subject: [drm-xe:drm-xe-next 4/10] drivers/gpu/drm/xe/xe_pm.c:72:20: sparse:
 sparse: symbol 'xe_pm_runtime_lockdep_map' was not declared. Should it be
 static?
Message-ID: <202404191329.EZzOTzwK-lkp@intel.com>
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
head:   5bc9de065b8bb9b8dd8799ecb4592d0403b54281
commit: 8ae84a27441f0267138b8a7f37eca6af481e8bc2 [4/10] drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
config: s390-randconfig-r111-20240419 (https://download.01.org/0day-ci/archive/20240419/202404191329.EZzOTzwK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240419/202404191329.EZzOTzwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404191329.EZzOTzwK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_pm.c:72:20: sparse: sparse: symbol 'xe_pm_runtime_lockdep_map' was not declared. Should it be static?

vim +/xe_pm_runtime_lockdep_map +72 drivers/gpu/drm/xe/xe_pm.c

    24	
    25	/**
    26	 * DOC: Xe Power Management
    27	 *
    28	 * Xe PM implements the main routines for both system level suspend states and
    29	 * for the opportunistic runtime suspend states.
    30	 *
    31	 * System Level Suspend (S-States) - In general this is OS initiated suspend
    32	 * driven by ACPI for achieving S0ix (a.k.a. S2idle, freeze), S3 (suspend to ram),
    33	 * S4 (disk). The main functions here are `xe_pm_suspend` and `xe_pm_resume`. They
    34	 * are the main point for the suspend to and resume from these states.
    35	 *
    36	 * PCI Device Suspend (D-States) - This is the opportunistic PCIe device low power
    37	 * state D3, controlled by the PCI subsystem and ACPI with the help from the
    38	 * runtime_pm infrastructure.
    39	 * PCI D3 is special and can mean D3hot, where Vcc power is on for keeping memory
    40	 * alive and quicker low latency resume or D3Cold where Vcc power is off for
    41	 * better power savings.
    42	 * The Vcc control of PCI hierarchy can only be controlled at the PCI root port
    43	 * level, while the device driver can be behind multiple bridges/switches and
    44	 * paired with other devices. For this reason, the PCI subsystem cannot perform
    45	 * the transition towards D3Cold. The lowest runtime PM possible from the PCI
    46	 * subsystem is D3hot. Then, if all these paired devices in the same root port
    47	 * are in D3hot, ACPI will assist here and run its own methods (_PR3 and _OFF)
    48	 * to perform the transition from D3hot to D3cold. Xe may disallow this
    49	 * transition by calling pci_d3cold_disable(root_pdev) before going to runtime
    50	 * suspend. It will be based on runtime conditions such as VRAM usage for a
    51	 * quick and low latency resume for instance.
    52	 *
    53	 * Runtime PM - This infrastructure provided by the Linux kernel allows the
    54	 * device drivers to indicate when the can be runtime suspended, so the device
    55	 * could be put at D3 (if supported), or allow deeper package sleep states
    56	 * (PC-states), and/or other low level power states. Xe PM component provides
    57	 * `xe_pm_runtime_suspend` and `xe_pm_runtime_resume` functions that PCI
    58	 * subsystem will call before transition to/from runtime suspend.
    59	 *
    60	 * Also, Xe PM provides get and put functions that Xe driver will use to
    61	 * indicate activity. In order to avoid locking complications with the memory
    62	 * management, whenever possible, these get and put functions needs to be called
    63	 * from the higher/outer levels.
    64	 * The main cases that need to be protected from the outer levels are: IOCTL,
    65	 * sysfs, debugfs, dma-buf sharing, GPU execution.
    66	 *
    67	 * This component is not responsible for GT idleness (RC6) nor GT frequency
    68	 * management (RPS).
    69	 */
    70	
    71	#ifdef CONFIG_LOCKDEP
  > 72	struct lockdep_map xe_pm_runtime_lockdep_map = {
    73		.name = "xe_pm_runtime_lockdep_map"
    74	};
    75	#endif
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
