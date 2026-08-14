Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9CDC5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72EF10F6D1;
	Fri, 14 Aug 2026 17:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQU7pK52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AE610F6CF
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727931; x=1818263931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fLBfQJc4o/JgmJacDNy9OZ2UQJ8+e5WmGMtSmhgpsAE=;
 b=WQU7pK527Vo9cUnhJBhPYlNRewV+wUxzaBCLBtugIG+vNMk19ZNofluJ
 lU16NClK7wDDDdzLMzZ3FLwgDKgOyJp0Pa+k/kGRL4RJiZAQfGb7HCrfJ
 hq1dz9UvvwP2vFBnUW5QvoHGdOmR4ijJYScrsWgCCqeQ/R3goW3woy+Qq
 E5tBESWtnU5gPyZ/uaNZu3fzhPKkjsrbNcjC84H5JHsKSAIeQWVLLGsAR
 zVUpJjYuwxfJuK/NJ4QP8nOsBlSvdUn7EWc7rz+Tt6mJHthUWh9kF4nqf
 pUWWWWqWmbeSwx+KWmrTMw8gVz+IXyputH0Pazh8KzzrMD+sCNHoYIgKB g==;
X-CSE-ConnectionGUID: bPceShw4QyyROSu6fBRR4A==
X-CSE-MsgGUID: SmWouzS9ToyS4Y2qg2mtDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464065"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464065"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:51 -0700
X-CSE-ConnectionGUID: QJBKbSDgS1a9x3TPxz070Q==
X-CSE-MsgGUID: 91YBaBY+Rv+Mr1YLejkHtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946245"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v5 19/33] drm/xe: Report all probe errors using SIGID
Date: Fri, 14 Aug 2026 19:17:45 +0200
Message-ID: <20260814171801.13347-20-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
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

