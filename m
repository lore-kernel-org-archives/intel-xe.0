Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CC1C87FCB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 13:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2297310E160;
	Tue, 12 Aug 2025 13:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KO0BNXQk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFA510E160
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755004602; x=1786540602;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bPuIIG8O1kM5Et3Cjz6T2n+1m9+m5/CpVcipiKfpfwo=;
 b=KO0BNXQksx8fkQPy7i678BDYLCmYDIvxGX6uSK6E9YKmpC5poHHn+PwF
 dKrR8GVxn+r+YtiECfhL7n1jx36f6QOVqQ/8jLgiJTH23Nv0xZeNVs8rJ
 J6FAEgU6bZcyw9MJy5TuNBLHiClZMYpDgvLGscCnvgC5P+K3vzGfpxnan
 qLL88DN5SD1zyO1vtsA+jk2XF3MVDHQF6e0hiK3RdkC5YXFv13qOhfwo1
 2LLtQzaCDE8j/Vr8w4XbG6JKp40LSW6OKkZjq4agGMbYqOGfY3kD4jqLI
 yPzo4sWQlWcNk8QoUCblbGABZB3sbKP+mJy2xCP9/NIdK0+rH0PoAD39F Q==;
X-CSE-ConnectionGUID: vndOZY/wRUiE8SBnCIkvZw==
X-CSE-MsgGUID: 4/00neJPQHWLDmR51zQqsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67542152"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="67542152"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 06:16:40 -0700
X-CSE-ConnectionGUID: di2pkh04QlSl3iwGbFyrnw==
X-CSE-MsgGUID: aAMP1ttaSJKm6aRa2XT0cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="166083849"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2025 06:16:36 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v5] drm/xe/pm: Disable RPM for SR-IOV VFs
Date: Tue, 12 Aug 2025 19:03:25 +0530
Message-ID: <20250812133325.14704-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

VFs without native PCIe Power Management (PM) capabilities inherit their
PF's power state as per PCIe specifications(§5.10.1 PCIe Base Spec 7.0).
Enabling Runtime Power Management (RPM) for these VFs trigger unnecessary
driver suspend/resume operations that ultimately perform no PCI-level power
transition.

Since VFs without PM capabilities cannot independently enter low-power
states, the existing RPM workflow becomes redundant:
1. Driver executes full suspend/resume sequence
2. PCI PM transition step becomes no-op
3. VF power state remains tied to PF's status

Disabling RPM for VFs eliminates this redundant processing while
maintaining proper power management through PF dependency. This
optimization ensures VFs follow their PF's power state without superfluous
runtime handling.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>

---
V4 -> V5:
- Disable RPM for VFs without checking pm_cap (Rodrigo).
- Updated commit title.

V3 -> V4:
- Fixed review comments (Rodrigo & Maarten)

V2 -> V3:
- Fixed review comments (Michal Wajdeczko).

V1 -> V2:
- Disable RPM only for VF devices when PM cap is not implemented.
---
 drivers/gpu/drm/xe/xe_pm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 5e8126ca8e27..11197402d2c6 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -247,6 +247,10 @@ static void xe_pm_runtime_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 
+	/* VFs do not support RPM. so, disable it */
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	/*
 	 * Disable the system suspend direct complete optimization.
 	 * We need to ensure that the regular device suspend/resume functions
@@ -367,6 +371,10 @@ static void xe_pm_runtime_fini(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 
+	/* VFs do not support RPM. so, disable it */
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	pm_runtime_get_sync(dev);
 	pm_runtime_forbid(dev);
 }
-- 
2.43.0

