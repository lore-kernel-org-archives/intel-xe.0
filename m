Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C5A606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VYu3QNFs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F4610E447;
	Sat, 21 Nov 2026 18:24:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB64D10E92B
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285432; x=1826821432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q44ZNLDU+Y3k+vKql2XfuU6GER5YZ/LvzPtWqWe1rcg=;
 b=VYu3QNFslIaYg+624g3BpG4PyIMmHMMtme0rAXIxne9dmVb7XtnWHgMm
 7sMaWPzFQZXftA68T0dYMTBEMy+6Iv3jpVs8wGfCjmiVbApZ1zx7eZjTN
 P6IQ7P6FZ2k+SSpWOHoIuRAxdXAu6pDOa+4S9aw0fL7vFwgXanmiyrcwe
 upF4DIGtQjtWQkCypOE8zuwk+EWACy9VpEvSutygQaOh/a9tnyRbgWfOH
 zlD2cP90RH13MQ1gVPtKQHHOb40lMFK4rCXakLb5GkKjRGx+7aDafoVUZ
 VpdJKC6EipgHtVydhtCGx7SAMZ81yUKkWM0GPNANMUAhSyX1sgH8+zsER Q==;
X-CSE-ConnectionGUID: YkdWVrmIRUqr+N1wQvV1KQ==
X-CSE-MsgGUID: +fDUc4PpTCWjVImZkPnAHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034073"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034073"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:21 -0800
X-CSE-ConnectionGUID: 9pOnGHdOSk+Onm8AmDt7Rg==
X-CSE-MsgGUID: FhvYi76CQUW7QAKf/uEoxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934451"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 17/17] drm/xe: Don't error on failed media defeature
Date: Sat, 21 Nov 2026 18:23:33 +0000
Message-ID: <20261121182317.48981-36-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182317.48981-19-stuart.summers@intel.com>
References: <20261121182317.48981-19-stuart.summers@intel.com>
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

Right now there isn't an easy way to get the version of the
GFSP firmware that will be replying to this command. For testing
purposes, don't print an error to avoid flagging CI for some
early testing.

Note this patch is not intended to be merged...

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c             | 18 +++++++++---------
 drivers/gpu/drm/xe/xe_sysctrl.c         | 10 +++++-----
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c |  6 +++---
 drivers/gpu/drm/xe/xe_sysctrl_event.c   |  2 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 25 +++++++++++++++----------
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |  3 ++-
 6 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0fb891d00b36..ac7898bfa456 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -282,7 +282,7 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
 				  &request, sizeof(request), &response, sizeof(response));
 
-	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen, true);
 	if (ret) {
 		xe_log_err(xe, SYSCTRL, ret, "failed to send page offline command\n");
 		return ret;
@@ -435,7 +435,7 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 		if (list_req)
 			list_req->index = count;
 
-		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen, true);
 		if (ret) {
 			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline data, cmd=%#x\n",
 				   cmd);
@@ -792,7 +792,7 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_COUNTER,
 				  &request, sizeof(request), response, sizeof(*response));
 
-	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen, true);
 	if (ret) {
 		xe_err(xe, "sysctrl: failed to get counter %d\n", ret);
 		return ret;
@@ -860,7 +860,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 	do {
 		memset(&response, 0, sizeof(response));
 
-		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen, true);
 		if (ret) {
 			xe_err(xe, "sysctrl: failed to get soc error %d\n", ret);
 			goto err;
@@ -983,7 +983,7 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
 				  &request, sizeof(request), &response, sizeof(response));
 
 	guard(xe_pm_runtime)(xe);
-	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen, true);
 	if (ret) {
 		xe_err(xe, "sysctrl: failed to clear counter %d\n", ret);
 		return ret;
@@ -1042,7 +1042,7 @@ int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 component, u32 *t
 				  &request, sizeof(request), &response, sizeof(response));
 
 	guard(xe_pm_runtime)(xe);
-	ret = xe_sysctrl_send_command(&xe->sc, &command, &len);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &len, true);
 	if (ret) {
 		xe_err(xe, "sysctrl: failed to get threshold %d\n", ret);
 		return ret;
@@ -1095,7 +1095,7 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
 				  &request, sizeof(request), &response, sizeof(response));
 
 	guard(xe_pm_runtime)(xe);
-	ret = xe_sysctrl_send_command(&xe->sc, &command, &len);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &len, true);
 	if (ret) {
 		xe_err(xe, "sysctrl: failed to set threshold %d\n", ret);
 		return ret;
@@ -1137,7 +1137,7 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
 				  &request, sizeof(request), &response, sizeof(response));
 	guard(xe_pm_runtime)(xe);
-	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen, true);
 	if (ret) {
 		xe_err(xe, "sysctrl: failed to get health %d\n", ret);
 		return ret;
@@ -1182,7 +1182,7 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
 				  &request, sizeof(request), &response, sizeof(response));
 	guard(xe_pm_runtime)(xe);
-	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen, true);
 	if (ret) {
 		xe_err(xe, "sysctrl: failed to set health %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index a7f8c8edd012..66b4e519d29c 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -166,7 +166,7 @@ xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
 	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
 				  &req, sizeof(req), &resp, sizeof(resp));
 
-	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len, true);
 	if (ret)
 		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
 
@@ -243,7 +243,7 @@ int xe_sysctrl_sdk_api_version(struct xe_device *xe, u16 *version)
 	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_SDK_API_VERSION,
 				  0, 0, &resp, sizeof(resp));
 
-	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len, true);
 	if (ret)
 		return ret;
 
@@ -270,7 +270,7 @@ static int sysctrl_media_defeature(struct xe_device *xe, u8 feature)
 				  XE_SYSCTRL_CMD_MEDIA_DEFEATURE,
 				  &req, sizeof(req), &resp, sizeof(resp));
 
-	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len, false);
 	if (ret)
 		return ret;
 
@@ -308,8 +308,8 @@ static int sysctrl_media_defeature_send(struct xe_device *xe, u8 feature)
 
 	ret = sysctrl_media_defeature(xe, feature);
 	if (ret) {
-		xe_err(xe, "sysctrl: failed to defeature media (0x%02x): %pe\n",
-		       feature, ERR_PTR(ret));
+		xe_info(xe, "sysctrl: failed to defeature media (0x%02x): %pe\n",
+			feature, ERR_PTR(ret));
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
index e0db099ef0ad..510c48ebd0ba 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
@@ -85,7 +85,7 @@ static ssize_t xe_sysctrl_loopback_write(struct file *file, const char __user *u
 
 	scoped_guard(mutex, &entry->lock) {
 		guard(xe_pm_runtime)(xe);
-		entry->status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
+		entry->status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len, true);
 		entry->response_len = entry->status ? 0 : out_len;
 		status = entry->status;
 	}
@@ -227,7 +227,7 @@ static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file, const char _
 
 	scoped_guard(mutex, &entry->lock) {
 		guard(xe_pm_runtime)(xe);
-		status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
+		status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len, true);
 		entry->status = status;
 	}
 
@@ -420,7 +420,7 @@ static ssize_t xe_sysctrl_mailbox_write(struct file *file, const char __user *ub
 		cmd.timeout_ms = timeout_ms;
 
 		guard(xe_pm_runtime)(xe);
-		status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
+		status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len, true);
 		entry->status = status;
 		entry->response_len = status ? 0 : out_len;
 	}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index 3239c110a66a..9ef34e0c48f9 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -24,7 +24,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
 	do {
 		memset(response, 0, sizeof(*response));
 
-		ret = xe_sysctrl_send_command(sc, command, &len);
+		ret = xe_sysctrl_send_command(sc, command, &len, true);
 		if (ret) {
 			xe_log_err(xe, SYSCTRL, ret, "Failed to get pending event\n");
 			return;
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 2af73c62d32d..0da7831c7157 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -216,7 +216,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc,
 static int sysctrl_receive_frames(struct xe_sysctrl *sc,
 				  const struct xe_sysctrl_mailbox_msg_hdr *req,
 				  void *data_out, size_t data_out_len,
-				  size_t *rdata_len, unsigned int timeout_ms)
+				  size_t *rdata_len, unsigned int timeout_ms,
+				  bool print_on_error)
 {
 	struct xe_sysctrl_mailbox_msg_hdr *hdr;
 	struct xe_device *xe = sc_to_xe(sc);
@@ -248,16 +249,17 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
 
 	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
 
-	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
-	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
-	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
+	if ((!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
+	     XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
+	     XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) &&
+	    print_on_error) {
 		xe_log_err(xe, SYSCTRL, -EPROTO,
 			   "Response header mismatch: %#x != %#x\n",
 			   hdr->data, req->data);
 		return -EPROTO;
 	}
 
-	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
+	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0 && print_on_error) {
 		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x %#x.%#x\n",
 			   XE_SYSCTRL_HDR_RESULT(hdr),
 			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req));
@@ -273,7 +275,8 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
 static int sysctrl_send_command(struct xe_sysctrl *sc,
 				const u8 *mbox_cmd, size_t cmd_size,
 				void *data_out, size_t data_out_len,
-				size_t *rdata_len, unsigned int timeout_ms)
+				size_t *rdata_len, unsigned int timeout_ms,
+				bool print_on_error)
 {
 	const struct xe_sysctrl_mailbox_msg_hdr *hdr;
 	size_t received;
@@ -289,7 +292,8 @@ static int sysctrl_send_command(struct xe_sysctrl *sc,
 	hdr = (const struct xe_sysctrl_mailbox_msg_hdr *)mbox_cmd;
 
 	ret = sysctrl_receive_frames(sc, hdr, data_out, data_out_len,
-				     &received, timeout_ms);
+				     &received, timeout_ms,
+				     print_on_error);
 	if (ret)
 		return ret;
 
@@ -349,7 +353,8 @@ void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 gr
  */
 int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 			    struct xe_sysctrl_mailbox_command *cmd,
-			    size_t *rdata_len)
+			    size_t *rdata_len,
+			    bool print_on_error)
 {
 	struct xe_device *xe = sc_to_xe(sc);
 	u8 group_id, command_code;
@@ -379,8 +384,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 
 	ret = sysctrl_send_command(sc, sc->cmd_buf, cmd_size,
 				   cmd->data_out, cmd->data_out_len, rdata_len,
-				   timeout_ms);
-	if (ret)
+				   timeout_ms, print_on_error);
+	if (ret && print_on_error)
 		xe_log_err(xe, SYSCTRL, ret, "Mailbox command failed to send %#x.%#x\n",
 			   group_id, command_code);
 
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
index 5a3dd14e3a11..165155aba297 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -28,6 +28,7 @@ void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 gr
 			       size_t response_len);
 int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 			    struct xe_sysctrl_mailbox_command *cmd,
-			    size_t *rdata_len);
+			    size_t *rdata_len,
+			    bool print_on_error);
 
 #endif
-- 
2.43.0

