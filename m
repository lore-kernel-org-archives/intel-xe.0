Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D5FC5DF65
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C404B10E455;
	Wed, 12 Aug 2026 19:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j88zXlJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFB610E455
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562135; x=1818098135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z6oqNaMAn1mYsXYo5OLtLSInhIOZxl/9+elz+O0a2lc=;
 b=j88zXlJ8nZ/CCbM/NzivueuPC5yIdCemt8NpzgjbJkGv0ncK/WtQcvD6
 ZTO3kHNNRqcmsqp9zXtgk8OTmFzfYThWy+ir42OBNI21irEkbfwwRJ+zD
 87TTzTysKG1hfflPRccKbTBh9BbPkffWwenvbs+yFlA2+30w1VAySSMNH
 A9OgnFsaynpxCBjH98fKmUv/kYUElBRL8cpEPQTN/gsekYgaHr0xf7o2H
 v1PNcav1YyYS815o/h7i2irHBRBP9pg5WINEyMlpffTrZiGKRstmmGXaF
 tY5uQNiBHMoOWJ+EIugMDEVEs7TBCsTEPhA0CrZ25tXm7AzCZyBajdx2d w==;
X-CSE-ConnectionGUID: H9EOzRSfS+2z/nErpgQaqw==
X-CSE-MsgGUID: qHwHjdB2RGe/Ahlso9pxpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987560"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987560"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:35 -0700
X-CSE-ConnectionGUID: aox2LbG3QsqCUkmbcWyj4Q==
X-CSE-MsgGUID: v4ERIYvdR+uUKpI/Irj9Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892016"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v4 19/32] drm/xe: Report all probe errors using SIGID
Date: Wed, 12 Aug 2026 21:14:35 +0200
Message-ID: <20260812191450.11690-20-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

For completeness, we should catch and report all probe errors, not
just the ones that have explicit error message. Split xe_pci_probe()
function after a display check to avoid reporting -EPROBE_DEFER and
use xe_log_err_fatal() helper to report all returned errors.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b19efef1c5cd..ab4da1d9a9f1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1147,17 +1147,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
  * caller. Therefore there is no consequence on those specific callers when
  * function error injection skips the whole function.
  */
+static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *desc);
 static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
-	struct xe_probed_info probed_info = {};
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
-	const struct xe_subplatform_desc *subplatform_desc;
-	struct xe_device *xe;
-	void *group;
 	int err;
 
-	subplatform_desc = find_subplatform(desc, pdev->device);
-
 	xe_configfs_check_device(pdev);
 
 	if (desc->require_force_probe && !id_forced(pdev->device)) {
@@ -1181,6 +1176,26 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (xe_display_driver_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
+	err = __xe_pci_probe(pdev, desc);
+	if (err) {
+		xe_log_err_fatal(pdev, PROBE, err, "driver loading failed for device '%04x'\n",
+				 pdev->device);
+		return err;
+	}
+
+	return 0;
+}
+
+static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *desc)
+{
+	const struct xe_subplatform_desc *subplatform_desc;
+	struct xe_probed_info probed_info = {};
+	struct xe_device *xe;
+	void *group;
+	int err;
+
+	subplatform_desc = find_subplatform(desc, pdev->device);
+
 	/* Group all devres so xe_pci_error_slot_reset() can release them as a unit. */
 	group = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
 	if (!group)
-- 
2.47.1

