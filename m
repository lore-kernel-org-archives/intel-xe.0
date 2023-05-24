Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACD0C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 09:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBF910E5C0;
	Wed, 24 May 2023 09:09:56 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B6810E5C0
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684919394; x=1716455394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FmVmyA3fJdBy30RqCmoeABBs3Ku/sJb7Bt0ZhLuBG+0=;
 b=djZX8dspMoOyTqkhgEhHJq2pY5zCOQBZv/ungUApO22MvcjwFhJ4aWF2
 7/chGz87lxnCLuSFnSvQ3yOOX2bCL2roc8j1WytbEir3iytuK1OiZYflQ
 NtH6l9i5YSi9GWeskPLB/66Kz+Igv55CHIloRB709Gd41XBORqRC5FqWp
 1vlhHpzPa/qgEUo+KU85fcZuhIi8hYfWOH9EbCg8rNc0dyQy1/mjFiQBR
 t5lUtqUeWnqx3NnCBmTFtJ7aqazn3RgnevYP6DBdeAocc7ahiQOhVFMet
 DbZ/AVbefKXebDiJIT+IH4shwgFCIf4Bpzh8wO8y7DsRUeFRDFDdLXrWa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="353531853"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="353531853"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 02:09:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="878575429"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="878575429"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 02:09:52 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 14:36:53 +0530
Message-Id: <20230524090653.1192566-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4] drm/xe/pm: Disable PM on unbounded pcie
 parent bridge
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Intel Discrete GFX cards gfx may have multiple PCIe endpoints,
they connects to root port via pcie upstream switch port(USP)
and virtual pcie switch port(VSP), sometimes VSP pcie devices
doesn't bind to pcieport driver. Without pcieport driver, pcie PM
comes without any warranty and with unbounded VSP gfx card won't
transition to low power pcie Device and Link states therefore
assert drm_warn on unbounded VSP and disable xe driver
PM support.

v2:
- Disable Xe PCI PM support. [Rodrigo]
v3:
- Changed subject and Rebase.
v4:
- %s/xe_pci_unbounded_bridge_disable_pm/xe_assert_on_unbounded_bridge.
  [Rodrigo]
- Use device_set_pm_not_required() instead of dev_pm_ops NULL assignment.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c |  1 +
 drivers/gpu/drm/xe/xe_pm.c  | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h  |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2d0d50dcd396..45bd23b879b9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -636,6 +636,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
+	xe_pm_assert_unbounded_bridge(xe);
 	subplatform_desc = find_subplatform(xe, desc);
 
 	err = xe_info_init(xe, desc, subplatform_desc);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b7b57f10ba25..c7901f379aee 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -225,3 +225,17 @@ int xe_pm_runtime_get_if_active(struct xe_device *xe)
 	WARN_ON(pm_runtime_suspended(xe->drm.dev));
 	return pm_runtime_get_if_active(xe->drm.dev, true);
 }
+
+void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_dev *bridge = pci_upstream_bridge(pdev);
+
+	if (!bridge)
+		return;
+
+	if (!bridge->driver) {
+		drm_warn(&xe->drm, "unbounded parent pci bridge, device won't support any PM support.\n");
+		device_set_pm_not_required(&pdev->dev);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6a885585f653..8418ee6faac5 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -21,5 +21,6 @@ int xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
 bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
+void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 
 #endif
-- 
2.38.0

