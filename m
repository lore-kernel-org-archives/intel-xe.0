Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A5BC54EDA
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 18:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D0710E0AE;
	Fri, 23 May 2025 18:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aqo3jb79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BA010E16F
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 18:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748026499; x=1779562499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qo/TbN2Ehyunpxjyzuhh2gvc0UFJMu+Ke82bFt88ilg=;
 b=Aqo3jb79afS/m+81vwor2yj7nue8XbwUDwxgGq5xxU34veoEhfLS514r
 UJdTT+aWlxr8ErRZ+yLMPQZXgDHsasYsSZDASPcnrlgqmr4mtrYoJb/3X
 9Sq5MGu6EUZt30GJUHv6kiay0QhzADgtt2Iiw7Cl5CI6ZFmIkR+QZxbnx
 dULLqzxeR8KIC9dh0J0fZvA/oXPgjS8eXub9KoK6PjQN7lDWsqWv/s2Zm
 vuyd6HlpkOjyRvaEw7jwnmh4SXQoWPLxb0XTjRSksSxzKE560sftXoKhX
 aUDP/Ysk3Pb2fadE8u3y8JOGwhqn9aMQd80oN5FLFf5KowOEnjbjta8TY g==;
X-CSE-ConnectionGUID: AQASzoa4REiTzdbD6Qhihg==
X-CSE-MsgGUID: UeJDGZnVQCaAW/JosUoLSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50145874"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="50145874"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:54:55 -0700
X-CSE-ConnectionGUID: BpuOP7gRRFSuPu7CqSOfLA==
X-CSE-MsgGUID: 6gObeprnQRqMaoe9jscrmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="164491730"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:54:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH 4/5] drm/xe/lrc: Allow to add user commands on context switch
Date: Fri, 23 May 2025 11:54:38 -0700
Message-ID: <20250523-wa-bb-cmds-v1-4-40b337f71bcd@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
References: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-f7671
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

During validation it's useful to allows additional commands to be
executed on context switch. Fetch the commands from configfs (to be
added) and add them to the WA BB.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c |  6 ++++++
 drivers/gpu/drm/xe/xe_configfs.h |  6 ++++++
 drivers/gpu/drm/xe/xe_lrc.c      | 24 ++++++++++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index b27bbe203eb46..d73fe5a6666cb 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -374,6 +374,12 @@ u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
 	return engine_allowed;
 }
 
+u32 xe_configfs_get_wa_bb_cmds(struct pci_dev *pdev, enum xe_engine_class class,
+			       const u32 * const *cs)
+{
+	return 0;
+}
+
 int __init xe_configfs_init(void)
 {
 	struct config_group *root = &xe_configfs.su_group;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 050da4689d653..928dfabcecd6e 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -7,6 +7,8 @@
 
 #include <linux/types.h>
 
+#include <xe_hw_engine_types.h>
+
 struct pci_dev;
 
 #if IS_ENABLED(CONFIG_CONFIGFS_FS)
@@ -15,12 +17,16 @@ void xe_configfs_exit(void);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev);
+u32 xe_configfs_get_wa_bb_cmds(struct pci_dev *pdev, enum xe_engine_class,
+			       const u32 * const *cs);
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
 static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
 static inline u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev) { return U64_MAX; }
+static inline u32 xe_configfs_get_wa_bb_cmds(struct pci_dev *pdev, enum xe_engine_class,
+					     const u32 * const *cs) { return 0; }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index b489da4ed7ceb..0718b0c04940b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -16,6 +16,7 @@
 #include "regs/xe_lrc_layout.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue_types.h"
@@ -969,7 +970,25 @@ static size_t wa_bb_write_utilization_state(struct xe_lrc *lrc, u32 *cmd0)
 	return cmd - cmd0;
 }
 
-static void setup_wa_bb(struct xe_lrc *lrc)
+static size_t wa_bb_write_configfs_cmds(struct xe_lrc *lrc,
+					struct xe_hw_engine *hwe, u32 *cmd0)
+{
+	struct xe_device *xe = gt_to_xe(lrc->gt);
+	const u32 *user_cmds;
+	u32 *cmd = cmd0;
+	u32 count;
+
+	count = xe_configfs_get_wa_bb_cmds(to_pci_dev(xe->drm.dev),
+					   hwe->class, &user_cmds);
+	if (count) {
+		memcpy(cmd, user_cmds, count * sizeof(u32));
+		cmd += count;
+	}
+
+	return cmd - cmd0;
+}
+
+static void setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	u32 *cmd, *cmd0;
 
@@ -977,6 +996,7 @@ static void setup_wa_bb(struct xe_lrc *lrc)
 	cmd = cmd0;
 
 	cmd += wa_bb_write_utilization_state(lrc, cmd);
+	cmd += wa_bb_write_configfs_cmds(lrc, hwe, cmd);
 	*cmd++ = MI_BATCH_BUFFER_END;
 
 	xe_gt_assert(lrc->gt, cmd - cmd0 < lrc->bb_per_ctx_bo->size);
@@ -1139,7 +1159,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	map = __xe_lrc_start_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
-	setup_wa_bb(lrc);
+	setup_wa_bb(lrc, hwe);
 
 	return 0;
 

-- 
2.49.0

