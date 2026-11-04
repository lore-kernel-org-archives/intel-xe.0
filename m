Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8B6070A83
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 21:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SZXpVtCp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A3C10E071;
	Wed,  4 Nov 2026 21:54:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD22910E2CC
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 21:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793829241; x=1825365241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9qW5V1yJbEpY7MqcbcGoU7bd7Xxuzy15mn69IYCJHlI=;
 b=SZXpVtCpxrMaZzdlt1lcDcAfJ/W7K/aSMp48W5K/yAHzGh4L7+Eqr9GP
 xtoVLw84QKTN81ShIOOgOSNioLMbOUFFT4OdscjMGhxDATVGM+PfUmn5c
 rFUCTQxCb+VVSNJQYnJ0TAfPqkrP1Qg7PYm8XUoL8DCu9LChu5LBlGqXZ
 75ZBIkrnRUWyc37D3gIVKlDKx1drmOsYUsV1/T33ElDAQuy8aR/6XNciM
 Fnemsic3M3Ce6aTPuD4ZF6oazYRBOflmJntasPaKK1/mxKUB2tEmc8dsT
 FMA3X4zNbW1ZH5WPQnmdF02HKPy59V1VWHjNfKJtbUKekiwKI5rRKAR0K w==;
X-CSE-ConnectionGUID: fSRo7q5XSMWIrisIGgZKDg==
X-CSE-MsgGUID: DlKvIBM0R/aQ9eULXEgdHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2502149"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2502149"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:53:56 -0800
X-CSE-ConnectionGUID: w6NW35GLSrmV7bRazhJOeQ==
X-CSE-MsgGUID: erN4PLIVSN6F3erpbpiixA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6831384"
Received: from dut4425arlh.fm.intel.com ([10.1.80.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:53:55 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 riana.tauro@intel.com, anoop.c.vijay@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/3] drm/xe/sysctrl: Use preallocated mailbox staging buffers
Date: Wed,  4 Nov 2026 21:53:54 +0000
Message-ID: <20261104215353.234314-6-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104215353.234314-5-stuart.summers@intel.com>
References: <20261104215353.234314-5-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Every mailbox command stages its request and response through a buffer
allocated with GFP_KERNEL. Both are bounded by the maximum mailbox
message size and the command mutex already serialises every sender, so
embed them in struct xe_sysctrl and drop the per-command allocation.

This removes the only failure mode from sysctrl_prepare_command(), so
return the command size directly, and allows commands to be sent from
contexts where a GFP_KERNEL allocation is not possible - such as the
runtime resume path, which gains a sender later in this series.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 56 +++++++++----------------
 drivers/gpu/drm/xe/xe_sysctrl_types.h   | 11 +++++
 2 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index f1a231dfec1e..2af73c62d32d 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -6,7 +6,6 @@
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/minmax.h>
-#include <linux/slab.h>
 #include <linux/sprintf.h>
 #include <linux/string.h>
 
@@ -103,36 +102,27 @@ static void sysctrl_clear_response(struct xe_sysctrl *sc)
 	xe_mmio_rmw32(sc->mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
 }
 
-static int sysctrl_prepare_command(struct xe_device *xe,
-				   u8 group_id, u8 command,
-				   const void *data_in, size_t data_in_len,
-				   u8 **mbox_cmd, size_t *cmd_size)
+static size_t sysctrl_prepare_command(struct xe_sysctrl *sc,
+				      u8 group_id, u8 command,
+				      const void *data_in, size_t data_in_len)
 {
 	struct xe_sysctrl_mailbox_msg_hdr *hdr;
-	size_t size;
-	u8 *buffer;
+	struct xe_device *xe = sc_to_xe(sc);
+
+	lockdep_assert_held(&sc->cmd_lock);
 
 	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
 
 	xe_assert(xe, data_in_len <= XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr));
 
-	size = sizeof(*hdr) + data_in_len;
-
-	buffer = kmalloc(size, GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
-	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
+	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)sc->cmd_buf;
 	hdr->data = REG_FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
 		    REG_FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
 
 	if (data_in && data_in_len)
-		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
-
-	*mbox_cmd = buffer;
-	*cmd_size = size;
+		memcpy(sc->cmd_buf + sizeof(*hdr), data_in, data_in_len);
 
-	return 0;
+	return sizeof(*hdr) + data_in_len;
 }
 
 static int sysctrl_send_frames(struct xe_sysctrl *sc,
@@ -231,14 +221,17 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
 	struct xe_sysctrl_mailbox_msg_hdr *hdr;
 	struct xe_device *xe = sc_to_xe(sc);
 	size_t remain = sizeof(*hdr) + data_out_len;
-	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);
+	u8 *buffer = sc->resp_buf;
 	size_t frame_size;
 	bool done = false;
 	int ret = 0;
 	u8 *out;
 
-	if (!buffer)
-		return -ENOMEM;
+	lockdep_assert_held(&sc->cmd_lock);
+
+	xe_assert(xe, data_out_len <= XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr));
+
+	memset(buffer, 0, remain);
 
 	out = buffer;
 	while (!done && remain) {
@@ -360,8 +353,7 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 {
 	struct xe_device *xe = sc_to_xe(sc);
 	u8 group_id, command_code;
-	u8 *mbox_cmd = NULL;
-	size_t cmd_size = 0;
+	size_t cmd_size;
 	unsigned int timeout_ms;
 	int ret;
 
@@ -380,25 +372,17 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 
 	might_sleep();
 
-	ret = sysctrl_prepare_command(xe, group_id, command_code,
-				      cmd->data_in, cmd->data_in_len,
-				      &mbox_cmd, &cmd_size);
-	if (ret) {
-		xe_log_err(xe, SYSCTRL, ret, "Failed to prepare command %#x.%#x\n",
-			   group_id, command_code);
-		return ret;
-	}
-
 	guard(mutex)(&sc->cmd_lock);
 
-	ret = sysctrl_send_command(sc, mbox_cmd, cmd_size,
+	cmd_size = sysctrl_prepare_command(sc, group_id, command_code,
+					   cmd->data_in, cmd->data_in_len);
+
+	ret = sysctrl_send_command(sc, sc->cmd_buf, cmd_size,
 				   cmd->data_out, cmd->data_out_len, rdata_len,
 				   timeout_ms);
 	if (ret)
 		xe_log_err(xe, SYSCTRL, ret, "Mailbox command failed to send %#x.%#x\n",
 			   group_id, command_code);
 
-	kfree(mbox_cmd);
-
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index f12455f2886d..605bdc62e0bf 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -58,6 +58,17 @@ struct xe_sysctrl {
 	/** @cmd_lock: Mutex protecting mailbox command operations */
 	struct mutex cmd_lock;
 
+	/**
+	 * @cmd_buf: Request staging buffer, sized to the maximum mailbox
+	 * message. Preallocated because commands are sent from the runtime
+	 * resume path, which may be entered from reclaim. Protected by
+	 * @cmd_lock.
+	 */
+	u8 cmd_buf[XE_SYSCTRL_MB_MAX_MESSAGE_SIZE];
+
+	/** @resp_buf: Response staging buffer, see @cmd_buf */
+	u8 resp_buf[XE_SYSCTRL_MB_MAX_MESSAGE_SIZE];
+
 	/** @work: Pending events worker */
 	struct work_struct work;
 
-- 
2.43.0

