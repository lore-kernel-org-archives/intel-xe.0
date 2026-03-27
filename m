Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A5210F2865
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 20:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B9D10EE61;
	Fri, 27 Mar 2026 20:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwrzJhSS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B7610EF88
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774643062; x=1806179062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RRExmY+KVZ4KGa4CItymFcVng3z4V8VcCFr6/X5BQkU=;
 b=lwrzJhSS8eJQCUmn4JkkJMiAVPPOrY5zLrs195pivwNT3ZNWmFpKJvZY
 ZHPGBdksQ1LzajZltfH9jfC0YRDN1do+/G8+2pa5zgNg41DBJU0mvmC2W
 x9bwG2tih2p9TUufKwYa1vZpRg2AZqDD8CCJCx4+f6GRJ7b7Uf2QM6oTp
 wm9PmOo6cRSMNkKe6DCop//1yZyo3/I1dUOfb5/wMYmUR0QIK4nH9k6/b
 1py/958AiMmgndvfMXFcsQL4FDTB9w4wX8jbzzypOqIzIjLJlWZ2/EyJ8
 Qr3juiYeMK0G6D7PJLxV3mZfQHkYjK/qFT8j8ufBhvZljFJMwrGcDVaQi w==;
X-CSE-ConnectionGUID: HJfzqcuoRrONQCjf0MTx8A==
X-CSE-MsgGUID: xUI8fpBLQdWsm/TUU79cIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75922256"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75922256"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 13:24:21 -0700
X-CSE-ConnectionGUID: NGbI0SZjR4K1XEj2ZxK9cw==
X-CSE-MsgGUID: 3KUw5d5ERp6FUx3NvWS2nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="230337126"
Received: from ppandiya-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.16.15])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 13:24:19 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/uc: Track uc firmware state changes
Date: Fri, 27 Mar 2026 21:24:06 +0100
Message-ID: <20260327202407.563-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Under CONFIG_DRM_XE_DEBUG_GUC print debug messages with each uc
firmware state transition to better visualize the changes.

  [drm:xe_uc_fw_change_status [xe]] Tile0: GT0: GuC UNINITIALIZED->SELECTED
  [drm:xe_uc_fw_change_status [xe]] Tile0: GT0: GuC SELECTED->AVAILABLE
  [drm:xe_uc_fw_change_status [xe]] Tile0: GT0: GuC AVAILABLE->LOADABLE
  [drm:xe_uc_fw_change_status [xe]] Tile0: GT0: GuC LOADABLE->TRANSFERRED
  [drm:xe_uc_fw_change_status [xe]] Tile0: GT0: GuC TRANSFERRED->RUNNING

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 42d290e8585a..b5a49ef9dafe 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -218,6 +218,17 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 	return gt_to_xe(uc_fw_to_gt(uc_fw));
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
+void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw, enum xe_uc_fw_status status)
+{
+	xe_gt_dbg(uc_fw_to_gt(uc_fw), "%s %s->%s\n",
+		  xe_uc_fw_type_repr(uc_fw->type),
+		  xe_uc_fw_status_repr(uc_fw->status),
+		  xe_uc_fw_status_repr(status));
+	uc_fw->__status = status;
+}
+#endif
+
 static void
 uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 {
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index 6195e353f269..bb281b72a677 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -25,11 +25,15 @@ static inline u32 xe_uc_fw_rsa_offset(struct xe_uc_fw *uc_fw)
 	return sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->css_offset;
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
+void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw, enum xe_uc_fw_status status);
+#else
 static inline void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw,
 					  enum xe_uc_fw_status status)
 {
 	uc_fw->__status = status;
 }
+#endif
 
 static inline
 const char *xe_uc_fw_status_repr(enum xe_uc_fw_status status)
-- 
2.47.1

