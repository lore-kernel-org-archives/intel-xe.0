Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A78C88E7C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 12:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A5E10E416;
	Mon, 26 Jan 2026 12:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="fl3PEyZP";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A02410E411
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 12:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769431931;
 bh=ps0hYh4CEfwjO0Bf7CHwUoWsi7tS2ONDIHEr5mTTQTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fl3PEyZP2I9MrPgFDn+uO7jjp/r0gmKmVPRhaCilZguFLjnKrR13KnbR6spXXLzTB
 li76feMxiLMaxDkZH4rNsLo4H9gj45rhJYVbdkbseZOJOFdVg86C8uiQYKuqGf5Z1b
 h2q5Use+uh4wP6kch3AHmmHVHKzkRxaNgFXGYa65CxGAgFqADFAsqj0DNLs0RUQCQl
 xNCjxIF2wTkdxju56MZfKB1K3wPHIba/niBjouvm2ML9/7zee4FIo/IiVb6EZNQJ07
 3EEfSN+B4Ud/6MASdUqSPCxAd9ITpOpQjkPDB5+HmPVnAltMjHBPOMNY6Rw6QsQVoM
 ugBs+zhj31GfA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC PATCH 2/3] drm/xe: Set the bits in PASID to enable ATS.
Date: Mon, 26 Jan 2026 13:52:06 +0100
Message-ID: <20260126125207.1119351-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126125207.1119351-1-dev@lankhorst.se>
References: <20260126125207.1119351-1-dev@lankhorst.se>
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

If the PCI device claims to support ATS, use it and set the
relevant bits in the context.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h | 1 +
 drivers/gpu/drm/xe/xe_lrc.c             | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index b5eff383902c5..959b3f7db91f6 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -18,6 +18,7 @@
 #define CTX_TIMESTAMP_UDW		(0x24 + 1)
 #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
 #define CTX_ACC_CTR_THOLD		(0x2a + 1)
+#define CTX_SYS_PASID			(0x2c + 1)
 #define CTX_ASID			(0x2e + 1)
 #define CTX_PDP0_UDW			(0x30 + 1)
 #define CTX_PDP0_LDW			(0x32 + 1)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f4f31bc240d93..fa911ea80c772 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -32,6 +32,8 @@
 #include "xe_vm.h"
 #include "xe_wa.h"
 
+#define LRC_SYS_PASID_ENABLE_ATS		BIT(31)
+
 #define LRC_VALID				BIT_ULL(0)
 #define LRC_PRIVILEGE				BIT_ULL(8)
 #define LRC_ADDRESSING_MODE			GENMASK_ULL(4, 3)
@@ -1557,6 +1559,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (xe->info.has_asid && vm)
 		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
 
+	/* If possible, enable ATS to offload the IOMMU TLB */
+	if (to_pci_dev(xe->drm.dev)->ats_enabled)
+		xe_lrc_write_ctx_reg(lrc, CTX_SYS_PASID, LRC_SYS_PASID_ENABLE_ATS);
+
 	lrc->desc = LRC_VALID;
 	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
 	/* TODO: Priority */
-- 
2.51.0

