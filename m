Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F79CCFA04
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506EE10EA75;
	Thu, 30 Oct 2025 22:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWwhujOi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F23410EA70
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863075; x=1793399075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SzlkwYF6SVbdWuMldKnfYzpeDlsvS6Orw+bUoURssl8=;
 b=XWwhujOimAAU7BgMHNdbJwUxbhEcWKDa+IIvaCiCMPAUYcLOBFMN8hgL
 V3JiL6LTU+eDgZt5leqDEYu0U6hcjh2JIy3iRpvTXSjZ6F45WS8BvDm13
 ypb351cbktEf20skJ+v3kdixd03G8i+seV1w6TQP39PwV5wPFw4EQqmTK
 uXkL6trbmekZDsq2egykgDer1oS1u0Yf1c+7QST+9muUCHDFV+ZsFhvDe
 c84KoDDlklr0SxPuWV/6Ox5hwLvFV7SSyxF1Hx/7Hmx3CS664qvHLVgIz
 hj8UwtQm5/av7ngfyBQq7RBX8P6e/gdKCT/ydnBSTLuzjFhKdUPmimD5O g==;
X-CSE-ConnectionGUID: 0WfeB7cIROaff4e2W2R1bQ==
X-CSE-MsgGUID: XapTaHjHSQq980TbxrFaKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64059975"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64059975"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:35 -0700
X-CSE-ConnectionGUID: sCokOGe0TkqRTm95cWHXhQ==
X-CSE-MsgGUID: A4Ve/KtVRlSBYxWjkVQioQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185346569"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 17/17] drm/xe/pf: Add documentation for sriov_admin
 attributes
Date: Thu, 30 Oct 2025 23:23:48 +0100
Message-ID: <20251030222348.186658-18-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030222348.186658-1-michal.wajdeczko@intel.com>
References: <20251030222348.186658-1-michal.wajdeczko@intel.com>
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
v3: some rewording (Lucas)
---
 .../ABI/testing/sysfs-driver-intel-xe-sriov   | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-sriov

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
new file mode 100644
index 000000000000..2fd7e9b7bacc
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
@@ -0,0 +1,159 @@
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
+		matches the value of the "sriov_totalvfs" attribute.
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
+		These files expose scheduling parameters for the PF and its VFs, and
+		are visible only on Intel Xe platforms that use time-sliced GPU sharing.
+		They can be changed even if VFs are enabled and running and reflect the
+		settings of all tiles/GTs assigned to the given function.
+
+		exec_quantum_ms: (RW) unsigned integer
+			The GT execution quantum (EQ) in [ms] for the given function.
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
+			This file can be read-only if changing the priority is not
+			supported.
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

