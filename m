Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1642CD6E7E
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 17:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B55C11A1DD;
	Thu,  4 Jun 2026 17:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="TPhNvEr8";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A2211A1EB
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780593312;
 bh=IGw/u+iXFAOM7KZ8CCXREKrklSTtXh62GdMqFDnhNH0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TPhNvEr8qWmrM81alMtCrLSH4mL3nv76cp8NRRq/X2IFtRMj1lJUMOz+xeKSuNMS+
 iPCox7HJaDC/a1r4VxLwopo7lD4InHHsiuZutuaRC1OtyCoF5fwvx4L0jkqpZ7xVEL
 7lstRBLo/xm4cLOYRjou4SE8eMzaQ/WzDf2oYGGkR0kiMtQpriI7Fqrw7EPcFLS92i
 sS5sTrICtucbq/hYjAZBxLhmlkRk++y/N3lVGa0lrDhQ0Sr1rOkVdZbvqnetuOqvkf
 tK7MeEFle5tkCh4rVphAfRoGKftcAKfhJWJIeJLFnwZFt+bFy6xU7CQRIKndubysbA
 /DXfcHb47zPaQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 18/24] drm/xe: Add xe_hw_engine_write_ring_tail
Date: Thu,  4 Jun 2026 19:14:54 +0200
Message-ID: <20260604171502.84047-19-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604171502.84047-1-dev@lankhorst.se>
References: <20260604171502.84047-1-dev@lankhorst.se>
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

From: Matthew Brost <matthew.brost@intel.com>

ULLS for migration jobs need to directly set hw engine ring tail, add
function to support this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-19-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 98265293f2dce..f129e6b7523f4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -282,6 +282,26 @@ static void hw_engine_fini(void *arg)
 	hwe->gt = NULL;
 }
 
+static void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val)
+{
+	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
+	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
+
+	reg.addr += hwe->mmio_base;
+
+	xe_mmio_write32(&hwe->gt->mmio, reg, val);
+}
+
+/**
+ * xe_hw_engine_write_ring_tail() - Write ring tail
+ * @hwe: engine
+ * @val: desired 32-bit value to write
+ */
+void xe_hw_engine_write_ring_tail(struct xe_hw_engine *hwe, u32 val)
+{
+	xe_hw_engine_mmio_write32(hwe, RING_TAIL(0), val);
+}
+
 /**
  * xe_hw_engine_mmio_read32() - Read engine register
  * @hwe: engine
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index c3ee37f8cfc0e..e13610a56ad72 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -77,5 +77,6 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
 enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 
 u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
+void xe_hw_engine_write_ring_tail(struct xe_hw_engine *hwe, u32 val);
 
 #endif
-- 
2.53.0

