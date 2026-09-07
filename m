Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62D6C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A413F10E499;
	Mon,  7 Sep 2026 10:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApEwk+9D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FA910E78C
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 10:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788778432; x=1820314432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cg2IsoXgMw+X3OnT66rM4OhS6/YYsGkrK8CrqqbCRU8=;
 b=ApEwk+9Dl1PzCIHZ3d1lN8tq1DlFCNMQcB3ZxoqWLGlhxW/jfOlrIe3V
 KIXvbzgifwF9E7BsXxVtwGx5DsEnrvRgejyRukWLxhF1zij/gIx4ytSPr
 abS6VQbzM6r9GeGSC94K6p62q8k/32+xf2hSKURSe1ZjMcfn/Mq20aHTB
 e/F++dTYQecbeUQO3t7dWpQOpJQec1n1Ih/EddKt6nQw/MAZMvzNA/sb3
 NgmHd9wQ0hSvXw8+7ElGXAyaVl78QoNo3gg7Ikb6UZGYw85dftBG5nFu+
 TODjwNkJ7b3e55IQ0G/GH368xuYGX91mEysScyuUzxXxJjDPH8b2WaaqK A==;
X-CSE-ConnectionGUID: 7WeXpCQKSnazTg+aib5yQg==
X-CSE-MsgGUID: OZPTTE2iQ9uZR5V4Yy6Fsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89024515"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89024515"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:53:52 -0700
X-CSE-ConnectionGUID: qqXnfk75TL2pk7SNq6MjLg==
X-CSE-MsgGUID: c0dmQINBSNy86W7SbVtHfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="308908400"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 07 Sep 2026 03:53:47 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v7 6/9] drm/xe/sysctrl: Replace FIELD_GET() with
 REG_FIELD_GET()
Date: Mon,  7 Sep 2026 16:23:20 +0530
Message-ID: <20260907105313.2208003-17-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
References: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
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

Use REG_FIELD_GET() when extracting fields from SysCtrl and
application headers. This better reflects that the masks
represent register-style bitfields and improves consistency.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v7:
- Update FIELD_PREP to REG_FIELD_PREP. (Sashiko)
- Update FIELD_GET to REG_FIELD_GET.
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 20 ++++++++++----------
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |  6 +++---
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 50bbdab072de..cdd929ebed4a 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -24,16 +24,16 @@ struct xe_sysctrl_mailbox_msg_hdr {
 } __packed;
 
 #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
-	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
+	REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
 
 #define XE_SYSCTRL_HDR_COMMAND(hdr) \
-	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
+	REG_FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
 
 #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
-	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
+	REG_FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
 
 #define XE_SYSCTRL_HDR_RESULT(hdr) \
-	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
+	REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
 
 static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
 				  unsigned int timeout_ms)
@@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
 		return -ENOMEM;
 
 	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
-	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
-				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
+	hdr->data = cpu_to_le32(REG_FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
+				REG_FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
 
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

