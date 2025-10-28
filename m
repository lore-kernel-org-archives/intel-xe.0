Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D51CCCF9F3
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14F410E646;
	Tue, 28 Oct 2025 17:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afLUP1J2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8DA10E642
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674357; x=1793210357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vRG1Gtl6bmTPyymwC2L428KMXP5gkDDPUq3y2BXhKbo=;
 b=afLUP1J2qZqbejxZtldeQ/axuycFOYEyL1TeATK/MGzBX/OzAUCeRo4G
 GEUJoWwudc13UTQMEhT7gHkfJiT8ACD4jmngW0cgg6a2KVxFXwTuUgd8b
 SBjCsmh1hUhKC/UjO7zFmziPAYZCu3dv8Lf011pZgbjq4CU9A1JI133jI
 EvVbQTVnb0o9DkGz8QfQ/O68O+1fJwUDAP1iKMa+e4DPUT2bv+9paqp+z
 7BpiaC+vAqH3bDXMdwUCK51SoyBtKoApHTAsMHu07Q5kkHGPUbANYmwjH
 nOSzIzLLGlViju0Z8YMcoonhLcRcvwPED8SohTbUr05Vuv0VekmL33Vh7 Q==;
X-CSE-ConnectionGUID: Qv2OisQURVWil2K3t9Kurw==
X-CSE-MsgGUID: eB4w1Nj+S9G24pRSeHrVLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687872"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687872"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:17 -0700
X-CSE-ConnectionGUID: XiebmgP7QiWG3fMzHwEorA==
X-CSE-MsgGUID: /l9wsX29SY+hh1c8DeeT8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469477"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:14 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 17/17] drm/xe/pf: Add documentation for sriov_admin
 attributes
Date: Tue, 28 Oct 2025 18:58:31 +0100
Message-ID: <20251028175832.184534-18-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028175832.184534-1-michal.wajdeczko@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
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
v2: update version (Rodrigo)
---
 .../ABI/testing/sysfs-driver-intel-xe-sriov   | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-sriov

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
new file mode 100644
index 000000000000..ac688a66bf36
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
@@ -0,0 +1,160 @@
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/
+Date:		October 2025
+KernelVersion:	6.19
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
+KernelVersion:	6.19
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
+KernelVersion:	6.19
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
+KernelVersion:	6.19
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
+			-EIO if FW refuses to change the provisioning.
+
+		Reads from these attributes may fail with:
+			-EUCLEAN if value is not consistent across all tiles/GTs.
+
+
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/exec_quantum_ms
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/preempt_timeout_us
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/sched_priority
+Date:		October 2025
+KernelVersion:	6.19
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
+			-EIO if FW refuses to change the provisioning.
+
+
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/stop
+Date:		October 2025
+KernelVersion:	6.19
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		This file allows to control scheduling of the VF on the Intel Xe GPU
+		platforms. It allows to implement custom policy mechanism in case VFs
+		are misbehaving or triggering adverse events above defined thresholds.
+
+		stop: (WO) bool
+			All GT executions of given function shall be immediately stopped.
+			To allow scheduling this VF again, the VF FLR must be triggered.
+
+		Writes to this attribute may fail with errors like:
+			-EINVAL if provided input is malformed or not recognized,
+			-EPERM if change is not applicable on given HW/FW,
+			-EIO if FW refuses to change the scheduling.
+
+
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/device
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/device
+Date:		October 2025
+KernelVersion:	6.19
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		These are symlinks to the underlying PCI device entry representing
+		given Xe SR-IOV function. For the PF, this link is always present.
+		For VFs, this link is present only for currently enabled VFs.
-- 
2.47.1

