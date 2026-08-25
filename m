Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41B2C61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 11:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A09F10E9E2;
	Tue, 25 Aug 2026 11:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThZprI01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA71210E9E2
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787655981; x=1819191981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I9tAoE8yqknwLcfc9TdxYoXy61AfmDx501GNQXfbE8o=;
 b=ThZprI01KrSL2njjSdz354ZBeijObW5V43k60y1L9Ll29z+PQzj3+J6d
 pbbG4yKBjv0Q0Z38eIW8bD3zRQzkHl/Tm4liJjjGOljK4smpjCiMsHz+K
 V2W/l6XAFocNX6+bhVRdBE48Pe3eVEoF70Wj9peFUi2+q/ntQdxyWp8Ic
 F9TNIyna80BCgvvrWgquwMPP0CTWw4nWn5hx9bYm2vYLKCyrBUiGcKv0y
 uhc7XOZ/HFjxdWd1rEAM078HruXbsaWF5P54boquj4PP7sDm0QQP8bUin
 r3ewjjybxJGVli5NVYfJh1sl6S5lSOuO8XOrB5TfDilaZhODnClLMy7B4 Q==;
X-CSE-ConnectionGUID: q8DwGKqxTbSqryV9JICWbA==
X-CSE-MsgGUID: 3Oq8Wvz2S8mXfbAn3TZEWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88248267"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88248267"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 04:06:21 -0700
X-CSE-ConnectionGUID: a/WRoCsER7u3urto/xOTbw==
X-CSE-MsgGUID: aGfClNzgRimt8xX2m0e9lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="261131367"
Received: from unknown (HELO jraag-Z790M-ITX-WiFi.iind.intel.com)
 ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 25 Aug 2026 04:06:16 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 6/7] drm/xe/sysctrl: Log group and command ID on mailbox
 failure
Date: Tue, 25 Aug 2026 16:35:49 +0530
Message-ID: <20260825110542.1359776-15-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
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

Include the mailbox group ID and command code in error logs
for command preparation and execution failures.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v5:
- Use REG_FIELD_GET instead of FIELD_GET. (Michal)
- Modify logging message.
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 6 ++++--
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 5032d766b314..f55f72fce994 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -373,7 +373,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 				      cmd->data_in, cmd->data_in_len,
 				      &mbox_cmd, &cmd_size);
 	if (ret) {
-		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
+		xe_log_err(xe, SYSCTRL, ret, "Failed to prepare command %#x.%#x\n",
+			   group_id, command_code);
 		return ret;
 	}
 
@@ -383,7 +384,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 				   cmd->data_out, cmd->data_out_len, rdata_len,
 				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
 	if (ret)
-		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
+		xe_log_err(xe, SYSCTRL, ret, "Mailbox command %#x.%#x error\n",
+			   group_id, command_code);
 
 	kfree(mbox_cmd);
 
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
index fb434cc165b2..df7dfe3b39e2 100644
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

