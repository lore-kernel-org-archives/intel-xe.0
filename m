Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4644EE63F12
	for <intel-xe@archiver.kernel.org>; Sun, 15 Feb 2026 20:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015C710E00C;
	Sun, 15 Feb 2026 20:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjKXnQXS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E01E10E23D
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Feb 2026 20:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771187631; x=1802723631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6WvRo6I5/52UQ+WKEWyxfFpuejqsqV3Wpwc2Rujqk6g=;
 b=mjKXnQXSOZfuuXMU6CRXzeu7UodJWqxxz4MhZac+hvLqzIlEDAuMH11J
 /SFlCrx7n24f4YUdVbLdJAA3RtfSjPS6O1+TJTnG7Px5dH9F+wxb+TaKL
 wfVwJriv/iPcJtUSDoIQ7vzhbU/pWKKDKbRxPw6ZMKCoOsUt1SHFbPqFc
 NlHR9ufficG0F6wvNC9TkS12TZf6eI/+mgMV+27IBp8mlQQGnzDStDuiP
 1xUlH6nkSYavrZRO7qRKzp6gGw7H8mQvUx8cN0H5pk9nqoWdfm3KVSrjN
 WAgJHeaDwJam+W2/dglVP1NWxAh9YydgMOo0uGJ9zjzTWpr/MrxXLNBbR Q==;
X-CSE-ConnectionGUID: n+7y6GcQTpqbFOpKn3lMAw==
X-CSE-MsgGUID: aiZ18rkQQXmEo0Akug/aJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71996395"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="71996395"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:51 -0800
X-CSE-ConnectionGUID: b3GPnaCLSLKsoZbZimf92A==
X-CSE-MsgGUID: iJIpY82rStGUYFqk6mVlVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="251096619"
Received: from shealy-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:50 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 9/9] drm/xe/pf: Add documentation for vram_quota
Date: Sun, 15 Feb 2026 21:33:23 +0100
Message-ID: <20260215203323.595-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260215203323.595-1-michal.wajdeczko@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
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

Add initial documentation for recently added VRAM provisioning
Xe driver specific SR-IOV sysfs files under device/sriov_admin.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-sriov   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
index 7f5ef9eada53..14b61bd2d602 100644
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
+			Actual final value might be aligned per HW/FW requirements.
+
+		profile/vram_quota: (RW) unsigned integer
+			The amount of the provisioned VRAM in [bytes] for this VF.
+			Actual quantum value might be aligned per HW/FW requirements.
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

