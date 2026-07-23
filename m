Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B98C531FA
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8F910F207;
	Thu, 23 Jul 2026 20:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HA/tD3KI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD0810F1FE
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839098; x=1816375098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZB5WzulFwCGPfi36H4+z5TlHCRKianlqS0OXQfx6yW8=;
 b=HA/tD3KIQOYSA27KaiNVcMoUcn1BsJT4SKjr1yhm7RZilIYLt7gkgIGq
 mQENY/zKmWcgv3qlEl/E68y24P8/or1fEuD6fuCNSbxXS1cyXHMlK0WIJ
 ayufrJ+5mwSvVXsuTR1yfua/VbJCKvY1HD6H+wB+DHPxDaQz4ZDSPoM7x
 ft+a/CxhVCtIOxZyJE+m0qr3sz1nIwpq/yo8Lq/4fm/0Ej4YfSr2IbLUf
 SUgZzGbPUKtaHhZlqt1WtVS3y/35f3TDYAGW523DATFPCyEc8gwK2WCzP
 Ni3iaqiULRkwdYqVdKVHBbWxOvvekKfPMsjgiRe/lkk49UzYFU0wWsr/b A==;
X-CSE-ConnectionGUID: 2cwZtGOaTEueDVZGeIMD5Q==
X-CSE-MsgGUID: CVH4oYOdS02XN5IyLfdsWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484298"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484298"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:17 -0700
X-CSE-ConnectionGUID: QMMU3DvdQHCt6LLk+fs4vQ==
X-CSE-MsgGUID: 7L9He78pSD6/9v8YECOQEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578591"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:16 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 05/19] drm/xe/log: Add Tile/GT decorations for dmesg message
Date: Thu, 23 Jul 2026 22:37:38 +0200
Message-ID: <20260723203754.3782-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723203754.3782-1-michal.wajdeczko@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
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

Similar to what we do in our regular xe_gt|tile_err() macros,
decorate dmesg message with info about Tile/GT identifiers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_log.h | 59 +++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index ebca8874a44d..5d3f0ef4ecca 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -10,6 +10,9 @@
 
 #include "abi/xe_sigid_abi.h"
 #include "xe_any.h"
+#include "xe_gt_printk.h"
+#include "xe_printk.h"
+#include "xe_tile_printk.h"
 
 struct pci_dev;
 
@@ -26,9 +29,59 @@ __printf(6, 7)
 void xe_log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 		       const void *data, size_t len, const char *fmt, ...);
 
-#define xe_log_emit_from(any, sev, sig, comp, loc, data, len, fmt, args...) \
-	xe_log_emit(xe_any_to_pdev(any), (sev), (sig), (comp), (loc), \
-		    (data), (len), fmt, ##args)
+#define xe_log_emit_gt_dmesg(gt, sev, sigid, data, len, fmt, args...) do {		\
+	struct xe_gt *__gt__ = (gt);							\
+	xe_log_emit_tile_dmesg((__gt__)->tile, (sev), (sigid), (data), (len),		\
+			       __XE_GT_PRINTK_FMT((__gt__), fmt, ##args));		\
+} while (0)
+
+#define xe_log_emit_tile_dmesg(tile, sev, sigid, data, len, fmt, args...) do {		\
+	struct xe_tile *__tile__= (tile);						\
+	xe_log_emit_xe_dmesg((__tile__)->xe, (sev), (sigid), (data), (len),		\
+			     __XE_TILE_PRINTK_FMT((__tile__), fmt, ##args));		\
+} while (0)
+
+#define xe_log_emit_xe_dmesg(xe, sev, sigid, data, len, fmt, args...) do {		\
+	struct xe_device *__xe__ = (xe);						\
+	xe_log_emit_dmesg(xe_any_to_pdev(__xe__), (sev), (sigid), (data), (len),	\
+			  __XE_PRINTK_FMT((__xe__), fmt, ##args));			\
+} while (0)
+
+#define xe_log_emit_dmesg_from(any, sev, sig, data, len, fmt, args...) do {		\
+	typeof(any) __any_ = (any);							\
+	struct pci_dev *__pdev_ = xe_any_to_pdev(__any_);				\
+	struct xe_tile *__tile_ = xe_any_if_tile(__any_);				\
+	struct xe_device *__xe_ = xe_any_if_xe(__any_);					\
+	struct xe_gt *__gt_ = xe_any_if_gt(__any_);					\
+	int __sev_ = (sev);								\
+	int __sig_ = (sig);								\
+	const void *__data_ = (data);							\
+	size_t __len_ = (len);								\
+	if (__gt_)									\
+		xe_log_emit_gt_dmesg(__gt_, __sev_, __sig_,				\
+				     __data_, __len_, fmt, ##args);			\
+	else if (__tile_)								\
+		xe_log_emit_tile_dmesg(__tile_, __sev_, __sig_,				\
+				       __data_, __len_, fmt, ##args);			\
+	else if (__xe_)									\
+		xe_log_emit_xe_dmesg(__xe_, __sev_, __sig_,				\
+				     __data_, __len_, fmt, ##args);			\
+	else if (!__gt_ && !__tile_ && !__xe_)						\
+		xe_log_emit_dmesg(__pdev_, __sev_, __sig_,				\
+				  __data_, __len_, fmt, ##args);			\
+} while (0)
+
+#define xe_log_emit_from(any, sev, sig, comp, loc, data, len, fmt, args...) do {	\
+	typeof(any) ___any = (any);							\
+	struct pci_dev *___pdev = xe_any_to_pdev(___any);				\
+	int ___sev = (sev);								\
+	int ___sig = (sig);								\
+	const void *___data = (data);							\
+	size_t ___len = (len);								\
+	xe_log_emit_dmesg_from(___any, ___sev, ___sig, ___data, ___len, fmt, ##args);	\
+	xe_log_emit_cper(___pdev, ___sev, ___sig, (comp), (loc),			\
+			 ___data, ___len, fmt, ##args);					\
+} while (0)
 
 #define xe_log_emit_fatal(any, sig, comp, loc, data, len, fmt, args...) \
 	xe_log_emit_from((any), CPER_SEV_FATAL, (sig), (comp), (loc), \
-- 
2.47.1

