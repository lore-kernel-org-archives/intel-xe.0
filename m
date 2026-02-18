Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C15E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 20:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099B810E626;
	Wed, 18 Feb 2026 20:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFwpLOcK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DD310E626
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 20:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771448199; x=1802984199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U08rf5fJ4d64xJKpsDJvuKx0VsQgURfE6DcPcPvjDUo=;
 b=jFwpLOcK1atcTyGJ8hYAFayBIgn7edabclaN/Kz3IAJynEAOKWocM5Fo
 7uVZhnK/kelI02VMx706qdjaTI5QCU8hM3YGIzmG7M6NBc8IuzyNbJKHj
 0kW9aRzzQmQ8M24+88e5Cpzm9B9A2kqU0TrL4j+n+KuPD9Jcp4T2ohU4d
 er3daVF4CBoKWPtdRG3TeDsX1Fb4F/ILzmux41Kl1wQBJXbCNVTbZDj9S
 zRFMpVUF8i3ktuJQYRi+kI0QiUzpmHnvZ5t8eD/NVAG/toSKlmgoZ8m+n
 EJMx81i4HBWGit+jJbZibGcbAKFm+Q1HDdRJd7Z66vDWu2DIBLAt6Tou0 w==;
X-CSE-ConnectionGUID: h2gTTpdVTWSw8PZ0dsqaKw==
X-CSE-MsgGUID: Ubb4WGFpROKP7TYP8+Xdiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72710605"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72710605"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:39 -0800
X-CSE-ConnectionGUID: AhxUreaOS6+18nYu1K4Bkw==
X-CSE-MsgGUID: /E5obOCCQqG+7fsX9bwJ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213548283"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.18.5])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:38 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 10/10] drm/xe/pf: Add documentation for vram_quota
Date: Wed, 18 Feb 2026 21:55:52 +0100
Message-ID: <20260218205553.3561-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218205553.3561-1-michal.wajdeczko@intel.com>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add initial documentation for recently added VRAM provisioning
Xe driver specific SR-IOV sysfs files under device/sriov_admin.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: fix typo (Piotr)
---
 .../ABI/testing/sysfs-driver-intel-xe-sriov   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
index 7f5ef9eada53..1d6eaff6882f 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
@@ -129,6 +129,37 @@ Description:
 			-EIO if FW refuses to change the provisioning.
 
 
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/vram_quota
+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/profile/vram_quota
+Date:		February 2026
+KernelVersion:	7.0
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		These files allow to perform initial VFs VRAM provisioning prior to VFs
+		enabling or to change VFs VRAM provisioning once the VFs are enabled.
+		Any non-zero initial VRAM provisioning will block VFs auto-provisioning.
+		Without initial VRAM provisioning those files will show result of the
+		VRAM auto-provisioning performed by the PF once the VFs are enabled.
+		Once the VFs are disabled, all VRAM provisioning will be released.
+		These files are visible only on discrete Intel Xe platforms with VRAM
+		and are writeable only if dynamic VFs VRAM provisioning is supported.
+
+		.bulk_profile/vram_quota: (WO) unsigned integer
+			The amount of the provisioned VRAM in [bytes] for each VF.
+			Actual quota value might be aligned per HW/FW requirements.
+
+		profile/vram_quota: (RW) unsigned integer
+			The amount of the provisioned VRAM in [bytes] for this VF.
+			Actual quota value might be aligned per HW/FW requirements.
+
+			Default is 0 (unprovisioned).
+
+		Writes to these attributes may fail with errors like:
+			-EINVAL if provided input is malformed or not recognized,
+			-EPERM if change is not applicable on given HW/FW,
+			-EIO if FW refuses to change the provisioning.
+
+
 What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/stop
 Date:		October 2025
 KernelVersion:	6.19
-- 
2.47.1

