Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F43C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 13:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3C210E78F;
	Mon, 21 Sep 2026 13:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ezxgz9O7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD1A10E7C1
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789998019; x=1821534019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bAxXYD2YtzjsSWW70k9zkVWpsFjhEW3av6E8Knrfmhs=;
 b=Ezxgz9O7T5Z02UIrS5t7LEpujvo/sQiiiFpLyaFKgTe9gpfioq0kc6Wv
 dr8Z2tcadPuvEu8j1WiuP1YMNdOoT00CaIB8lFcLGUy9H6jk99wei0eIU
 gWz1o1hECRfus5DcnpBxVd+5weOz6Z50eLlaHcQJaIlV7APR1Z7aanJ63
 ymJFcPc4yyFFhMPzPPLiijJyILRLRbpxL938G2Fb+M1RdE+P1D1EPjsUx
 fYn0RWCYxMqm4+gx+oaJcZDi68m7fB50HurKplf7kwA4Ccmj3zvyi/39c
 b/BRJzTowXMkKu+Pg6EwNMlzBvon6+vAtm/gU92v+TgProa4CLdPgBMiW w==;
X-CSE-ConnectionGUID: A6pvNuSPQNapcfMMXYu/4Q==
X-CSE-MsgGUID: 9nSCZ8eWT4WatnyzlmeLuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="116036309"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="116036309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:40:19 -0700
X-CSE-ConnectionGUID: YovSpE1WQEqYBPGJ5gl5Mg==
X-CSE-MsgGUID: WvqrakluT66CjJOYfrpyHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="298899613"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2026 06:40:13 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v8 07/10] drm/xe/sysctrl: Replace FIELD_GET() with
 REG_FIELD_GET()
Date: Mon, 21 Sep 2026 19:09:34 +0530
Message-ID: <20260921133927.128281-19-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
References: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
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

Use REG_FIELD_GET() and REG_FIELD_PREP() when working with fields
from SysCtrl and application headers. This better reflects that
the masks represent register-style bitfields and improves consistency.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v7:
- Update FIELD_PREP to REG_FIELD_PREP. (Sashiko)
- Update FIELD_GET to REG_FIELD_GET.

v8:
- Rephrase commit message. (Michal)
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 20 ++++++++++----------
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |  6 +++---
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 750178a0974b..d36bfa4167c7 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -24,16 +24,16 @@ struct xe_sysctrl_mailbox_msg_hdr {
 } __packed;
 
 #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
-	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, (hdr)->data)
+	REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, (hdr)->data)
 
 #define XE_SYSCTRL_HDR_COMMAND(hdr) \
-	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, (hdr)->data)
+	REG_FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, (hdr)->data)
 
 #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
-	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, (hdr)->data)
+	REG_FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, (hdr)->data)
 
 #define XE_SYSCTRL_HDR_RESULT(hdr) \
-	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
+	REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
 
 static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
 				  unsigned int timeout_ms)
@@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
 		return -ENOMEM;
 
 	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
-	hdr->data = FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
-		    FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
+	hdr->data = REG_FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
+		    REG_FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
 
 	if (data_in && data_in_len)
 		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
@@ -186,8 +186,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
 	}
 
 	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
-	total_frames = FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
-	curr_frame = FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
+	total_frames = REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
+	curr_frame = REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
 
 	sysctrl_read_frame(sc, out, frame_size);
 	sysctrl_clear_response(sc);
@@ -295,8 +295,8 @@ void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 gr
 {
 	struct xe_sysctrl_app_msg_hdr header = {0};
 
-	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
-		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
+	header.data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
+		      REG_FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
 
 	command->header = header;
 	command->data_in = request;
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
index f0d5e3d7f5e3..5a3dd14e3a11 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -15,13 +15,13 @@ struct xe_sysctrl;
 struct xe_sysctrl_mailbox_command;
 
 #define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
-	FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
+	REG_FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
 
 #define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
-	FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
+	REG_FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
 
 #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
-	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
+	REG_FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
 
 void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
 			       void *request, size_t request_len, void *response,
-- 
2.48.1

