Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFA9D0E6C8
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 08:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CA310E42F;
	Mon, 21 Oct 2024 08:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6M8JHO+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBB110E42F
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729498421; x=1761034421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C8PR45cVjVaUrGF5AaaoeF/MsoePtc/McWZmlBxx9tI=;
 b=j6M8JHO+hW/SMQyG4A7Lbpr635TvqvXr9n5be+EVaZo+1PiIWzRlfAhi
 jDmB2RnjYkSDozcjNGeJPrC+b9/INMEI2Rh/uX0wO2DzVlnHsHrtMp6FN
 93w0j9eVVIhf+lMRf21nR3TLKoeB5A9EAs4DzKCMkYp4xeOw6k/jjAEXw
 5+b/7SkC04TzcTBKSx74OZ2GZxmu979t1TndCKLKbNNeKCQoY1qWN9n0G
 nr1PggnNT2ftA+uDs7a9qzgD1sRKpWLZVyY5LGzBREpDgP0yKZPFytKHC
 I33WmvTB5NgqKBibXTRKwW4WM41zjYKhLUBrGcLqmjPxi9wMiXYi7wRCO Q==;
X-CSE-ConnectionGUID: Ac6OBt1HTPqD/ydpDllApQ==
X-CSE-MsgGUID: itNrBPCkRVqaVHKYAYEkgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="32887101"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="32887101"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 01:13:35 -0700
X-CSE-ConnectionGUID: urLd0Hs3R76dEa95bsFKBQ==
X-CSE-MsgGUID: dMCFhI3AQBSEXkpS3BNcvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79862882"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.117])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 01:13:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC] drm/xe: Add separate Kconfig file for SR-IOV options
Date: Mon, 21 Oct 2024 10:12:42 +0200
Message-Id: <20241021081242.1727-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

There are few SR-IOV config options that we want to define:

 - DRM_XE_SRIOV_VF to allow compile-out support for the SR-IOV
   Virtual Function (VF)
 - DRM_XE_SRIOV_PF to allow compile-out support for the SR-IOV
   Physical Function (PF)

and for use by PF only:

 - DRM_XE_SRIOV_DEFAULT_SCHEDULING_[FLEXIBLE|FIXED|CUSTOM]
   to select preferred scheduling method using either predefined
   parameter values, or custom values
 - DRM_XE_SRIOV_DEFAULT_PF_[EXEC_QUANTUM_MS|PREEMPT_TIMEOUT_US]
   to define default execution quantum/preempt timeout for the PF
 - DRM_XE_SRIOV_DEFAULT_VF_[EXEC_QUANTUM_MS|PREEMPT_TIMEOUT_US]
   to define default execution quantum/preempt timeout for the VF
 - DRM_XE_SRIOV_DEFAULT_POLICY_[SCHED_IF_IDLE|RESET_ENGINE]
   to define default values for advanced scheduling policies

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig       |   5 ++
 drivers/gpu/drm/xe/Kconfig.sriov | 140 +++++++++++++++++++++++++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.sriov

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index bac96c0dd66e..cd68eda9ca79 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -87,6 +87,11 @@ config DRM_XE_FORCE_PROBE
 
 	  Use "!*" to block the probe of the driver for all known devices.
 
+menu "SR-IOV Configuration"
+depends on DRM_XE
+source "drivers/gpu/drm/xe/Kconfig.sriov"
+endmenu
+
 menu "drm/Xe Debugging"
 depends on DRM_XE
 depends on EXPERT
diff --git a/drivers/gpu/drm/xe/Kconfig.sriov b/drivers/gpu/drm/xe/Kconfig.sriov
new file mode 100644
index 000000000000..3bd3eee51e9f
--- /dev/null
+++ b/drivers/gpu/drm/xe/Kconfig.sriov
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_XE_SRIOV_VF
+	bool
+	prompt "Virtual Function (VF) support"
+	default y
+	help
+	    Disable this option only if you want to compile out the SR-IOV VF support.
+	    Without SR-IOV VF support, driver can still be used in native mode.
+	    This option does not impact the support for the PF mode (if enabled).
+
+	    If in doubt, select "Y".
+
+config DRM_XE_SRIOV_PF
+	bool
+	prompt "Physical Function (PF) support" if PCI_IOV=y
+	default PCI_IOV
+	help
+	    Disable this option only if you want to compile out the SR-IOV PF support.
+	    Without SR-IOV PF support, driver can still be used in native mode.
+	    This option does not impact the support for the VF mode (if enabled).
+
+	    If in doubt, select "Y".
+
+if DRM_XE_SRIOV_PF
+
+choice
+	prompt "Default Scheduling Profile"
+	default DRM_XE_SRIOV_DEFAULT_SCHEDULING_FLEXIBLE
+	help
+	    Select preferred scheduling profile to applied by default.
+	    Choose "Flexible" if maximizing the GPU usage is preferred.
+	    Choose "Fixed" if consitent VF execution time is required.
+	    Choose "Custom" to define all scheduling parameters.
+
+	    If in doubt, select "Flexible".
+
+	config DRM_XE_SRIOV_DEFAULT_SCHEDULING_FLEXIBLE
+		bool "Flexible"
+		help
+		    Use this config to prefer flexible scheduling method.
+		    This config will predefine default scheduling parameters
+		    to maximize the GPU usage that may cause some fluctuations
+		    between VF execution slots.
+
+	config DRM_XE_SRIOV_DEFAULT_SCHEDULING_FIXED
+		bool "Fixed"
+		help
+		    Use this config to prefer fixed scheduling method.
+		    This config will predefine default scheduling parameters
+		    in a such a way that all VFs execution time slots will
+		    be consistent.
+
+	config DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM
+		bool "Custom"
+		help
+		    Use this config to define custom default scheduling parameters.
+		    This config is mostly needed only if specific scheduling
+		    parameters are required without involving any manual
+		    provisioning over sysfs or debugfs interfaces.
+
+endchoice
+
+config DRM_XE_SRIOV_DEFAULT_PF_EXEC_QUANTUM_MS
+	int
+	range 0 100000
+	prompt "Default PF execution quantum (ms)" if DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM
+	default 20 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FLEXIBLE
+	default 20 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FIXED
+	default 0 # unlimited
+	help
+	    Use this config to define default PF execution-quantum provisioning.
+	    The value (in millisecond) indicates the amount of time the workloads
+	    from the PF can run on the GPU.
+	    Value 0 represents _infinity_ execution-quantum.
+
+config DRM_XE_SRIOV_DEFAULT_PF_PREEMPT_TIMEOUT_US
+	int
+	range 0 100000000
+	prompt "Default PF preemption timeout (us)" if DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM
+	default 20000 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FLEXIBLE
+	default 20000 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FIXED
+	default 0 # unlimited
+	help
+	    Use this config to define default PF preemption timeout provisioning.
+	    The value (in microseconds) indicates the amount of time the GPU scheduler
+	    will wait for the PF workload (context) to yield to other VF.
+	    Value 0 represents _infinity_ preemption timeout.
+
+config DRM_XE_SRIOV_DEFAULT_VF_EXEC_QUANTUM_MS
+	int
+	range 0 100000
+	prompt "Default VF execution quantum (ms)" if DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM
+	default 32 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FLEXIBLE
+	default 16 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FIXED
+	default 0 # unlimited
+	help
+	    Use this config to define default VF execution-quantum provisioning.
+	    The value (in millisecond) indicates the amount of time the workloads
+	    from the VF can run on the GPU.
+	    Value 0 represents _infinity_ execution-quantum.
+
+config DRM_XE_SRIOV_DEFAULT_VF_PREEMPT_TIMEOUT_US
+	int
+	range 0 100000000
+	prompt "Default VF preemption timeout (us)" if DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM
+	default 32000 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FLEXIBLE
+	default 16000 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FIXED
+	default 0 # unlimited
+	help
+	    Use this config to define default VF preemption timeout provisioning.
+	    The value (in microseconds) indicates the amount of time the GPU scheduler
+	    will wait for the VF workload (context) to yield to other VF.
+	    Value 0 represents _infinity_ preemption timeout.
+
+config DRM_XE_SRIOV_DEFAULT_POLICY_SCHED_IF_IDLE
+	bool
+	prompt "Default schedule-if-idle policy" if DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM
+	default y if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FIXED
+	default n
+	help
+	    Enable this config to turn on the strict scheduling policy by default.
+	    When this policy is enabled, VFs that do not have work to submit are
+	    still allocated a fixed execution time-slice to ensure all active VFs
+	    execution is always consistent.
+
+	    If in doubt, say "N".
+
+config DRM_XE_SRIOV_DEFAULT_POLICY_RESET_ENGINE
+	bool
+	prompt "Default reset-engine policy" if DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM && EXPERT
+	default n
+	help
+	    Enable this config to turn on the engine reset policy by default.
+	    When this policy is enabled, GPU engines will be reset by the GuC
+	    on each VF switch to enforce cleanup of any stale HW register state.
+
+	    If in doubt, say "N".
+
+endif # DRM_XE_SRIOV_PF
-- 
2.43.0

