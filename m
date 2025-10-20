Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71AFCCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E4110E4B4;
	Mon, 20 Oct 2025 18:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAT1DksX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A247410E4AC
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984701; x=1792520701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y0Gk/aeR2hlPUmtEsTT0bzVn4jLM21xF8utWhUKGiWA=;
 b=iAT1DksXP6CmlghhqiVxCD71/kDpbDkLxDbsLMIT65scwnZHv7Z73FLk
 EUqVvI+F0zqbxY6cOnQAsVRHXrnqmHEGsmHkhFE5fN7r/VuXT3+Kc3KNl
 yfqGmlq0H2oUl0RDDiLnSkXRQbnk8AUbujYR25jGe8xeDNW/mGoTCOUN0
 aRucOBb/1/JIgpWhP3ryQ1DD0DbL7YivQyWaS6Q9wrGsDMwqHbrjQe96B
 uhjbqX1UQQMioWEIKwGx8ohYbO3PlK8TcAroRnoq0VN8rtIgm1RT6Vo8Q
 VcWcJrXVfKNv4ChbC0huLjGO2jdBiAWNFP03+Y52WRGlJYHoTRyFgdqj3 Q==;
X-CSE-ConnectionGUID: GZBN8ZyZTc6Nbz0Zdukuzw==
X-CSE-MsgGUID: JJvP2dF+TZq3aWmj9j3vbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013098"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013098"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:25:01 -0700
X-CSE-ConnectionGUID: 9R8D3PCZTJmnKStfloZgrw==
X-CSE-MsgGUID: tE8NUAScRCWkCcmM3rXexw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802203"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 14/14] drm/xe/pf: Add documentation for sriov_admin attributes
Date: Mon, 20 Oct 2025 20:24:14 +0200
Message-ID: <20251020182414.576-15-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020182414.576-1-michal.wajdeczko@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
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

Add initial documentation for all recently added Xe driver
specific SR-IOV sysfs files located under device/sriov_admin.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-sriov   | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-sriov

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
new file mode 100644
index 000000000000..ac650b673270
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
@@ -0,0 +1,164 @@
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/
+Date:		October 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		This directory appears for the particular Intel Xe device when:
+
+		 - device supports SR-IOV, and
+		 - device is a Physical Function (PF), and
+		 - driver support for the SR-IOV PF is enabled on given device.
+
+		This directory is used as a root for all attributes required to
+		manage both Physical Function (PF) and Virtual Functions (VFs).
+
+
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/
+Date:		October 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		This directory holds attributes related to the SR-IOV Physical
+		Function (PF).
+
+
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf1/
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf2/
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<N>/
+Date:		October 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		These directories hold attributes related to the SR-IOV Virtual
+		Functions (VFs).
+
+		Note that the VF number <N> is 1-based as described in PCI SR-IOV
+		specification as the Xe driver follows that naming schema.
+
+		There could be "vf1", "vf2" and so on, up to "vf<N>", where <N>
+		matches value of the "sriov_totalvfs" attribute.
+
+
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/profile/exec_quantum_ms
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/profile/preempt_timeout_us
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/profile/sched_priority
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/profile/exec_quantum_ms
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/profile/preempt_timeout_us
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/profile/sched_priority
+Date:		October 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		These files represent scheduling parameters of the PF or VFs and
+		are available only for Intel Xe platforms with GPU sharing based
+		on the time-slice basis. These scheduling parameters can be changed
+		even if VFs are enabled and running. Those parameters reflects
+		settings of all tiles/GTs assigned to the given function.
+
+		exec_quantum_ms: (RW) unsigned integer
+			The GT execution quantum (EQ) in [ms] of the given function.
+			Actual quantum value might be aligned per HW/FW requirements.
+
+			Default is 0 (unlimited).
+
+		preempt_timeout_us: (RW) unsigned integer
+			The GT preemption timeout in [us] of the given function.
+			Actual timeout value might be aligned per HW/FW requirements.
+
+			Default is 0 (unlimited).
+
+		sched_priority: (RW/RO) string
+			The GT scheduling priority of the given function.
+
+			"low" - function will be scheduled on the GPU for its EQ/PT
+				only if function has any work already submitted.
+
+			"normal" - functions will be scheduled on the GPU for its EQ/PT
+				irrespective of whether it has submitted a work or not.
+
+			"high" - function will be scheduled on the GPU for its EQ/PT
+				in the next time-slice after the current one completes
+				and function has a work submitted.
+
+			Default is "low".
+
+			When read, this file will display the current and available
+			scheduling priorities. The currently active priority level will
+			be enclosed in square brackets, like:
+
+				[low] normal high
+
+			This file can be read-only if changing is currently not supported
+			for given function due to any known HW/FW limitations.
+
+		Writes to these attributes may fail with errors like:
+			-EINVAL if provided input is malformed or not recognized,
+			-EPERM if change is not applicable on given HW/FW,
+			-EIO if GuC refuses to change provisioning.
+
+		Reads from these attributes may fail with:
+			-EUCLEAN if value is not consistent across all tiles/GTs.
+
+
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/exec_quantum_ms
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/preempt_timeout_us
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/sched_priority
+Date:		October 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		These files allows bulk reconfiguration of the scheduling parameters
+		of the PF or VFs and are available only for Intel Xe platforms with
+		GPU sharing based on the time-slice basis. These scheduling parameters
+		can be changed even if VFs are enabled and running.
+
+		exec_quantum_ms: (WO) unsigned integer
+			The GT execution quantum (EQ) in [ms] to be applied to all functions.
+			See sriov_admin/{pf,vf<N>}/profile/exec_quantum_ms for more details.
+
+		preempt_timeout_us: (WO) unsigned integer
+			The GT preemption timeout (PT) in [us] to be applied to all functions.
+			See sriov_admin/{pf,vf<N>}/profile/preempt_timeout_us for more details.
+
+		sched_priority: (RW/RO) string
+			The GT scheduling priority to be applied for all functions.
+			See sriov_admin/{pf,vf<N>}/profile/sched_priority for more details.
+
+		Writes to these attributes may fail with errors like:
+			-EINVAL if provided input is malformed or not recognized,
+			-EPERM if change is not applicable on given HW/FW,
+			-EIO if GuC refuses to change provisioning.
+
+
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/stop
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/reset
+Date:		October 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		These files allow to control scheduling of the VF on the Intel Xe GPU
+		platforms. They allow to implement custom policy mechanism in case VFs
+		are misbehaving or triggering adverse events above defined thresholds.
+
+		stop: (WO) bool
+			All GT executions of given function shall be immediately stopped.
+
+		reset: (WO) bool
+			The GT executions of the given function shall be reset after
+			completing software-initiated VF FLR.
+
+		Writes to these attributes may fail with errors like:
+			-EINVAL if provided input is malformed or not recognized,
+			-EPERM if change is not applicable on given HW/FW,
+			-EIO if GuC refuses to change provisioning.
+
+
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/device
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/device
+Date:		October 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		These are symlinks to the underlying PCI device entry representing
+		given Xe SR-IOV function. For the PF, this link is always present.
+		For VFs, this link is present only for currently enabled VFs.
-- 
2.47.1

