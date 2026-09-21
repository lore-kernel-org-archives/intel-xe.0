Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEB7C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 13:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1307810E7F5;
	Mon, 21 Sep 2026 13:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pd4TQMAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6A310E7F0
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 13:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789998029; x=1821534029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xrPc8cDa9QjY+mX8n8kjHznd39Y5aCazvMMjoyK2HhU=;
 b=Pd4TQMAdFoB2Z11AEks3XR0QKs6aKFBgI/8c8wPUJHxG+ZhYeZG3SV7k
 ysRiSbZ6wfF7fYO4m9E0dXLku+az6FM4JHLNWEuOXrgGcFNi6q6KZQ8SB
 evoJyWAje6kzX/UqR0gxG4jczTj3OOz+QC91AxxOP2BLna0lmEzJVTHa/
 BtHatPrm+PKcdfkJp0y6OX6WIX+X+O7c2z/YepANrzbhVr5PsuagWuSB6
 77ZnxrzMlLcsJCkQdBmmAw4WuxRyWOeLGxYoJ/X0G99zrtYYP9GSHLfYt
 P18OkaHP0p848uQcBigqC7gDV3ryElJ3u0EnHpvXfWvjzJT8/wNuDfSXj A==;
X-CSE-ConnectionGUID: ZvQ4SHhPRAShKSqSb3ItvA==
X-CSE-MsgGUID: rbJP3J4BTne7el3xoYKmPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="116036325"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="116036325"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:40:29 -0700
X-CSE-ConnectionGUID: YePNv7vVTQWeR7/sPJ8vFA==
X-CSE-MsgGUID: NEfvFoK0RsWwiWjBRObxcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="298900000"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2026 06:40:24 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v8 09/10] drm/xe/sysctrl: Log group and command ID on mailbox
 failure
Date: Mon, 21 Sep 2026 19:09:36 +0530
Message-ID: <20260921133927.128281-21-mallesh.koujalagi@intel.com>
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

Include the mailbox group ID and command code in error logs
for command preparation and execution failures.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v5:
- Use REG_FIELD_GET instead of FIELD_GET. (Michal)
- Modify logging message.

v6:
- Move all REG_FIELD_GET to single patch.
- Update log message. (Michal)
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 4a4deac0dd31..3acad770395d 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -353,7 +353,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 				      cmd->data_in, cmd->data_in_len,
 				      &mbox_cmd, &cmd_size);
 	if (ret) {
-		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
+		xe_log_err(xe, SYSCTRL, ret, "Failed to prepare command %#x.%#x\n",
+			   group_id, command_code);
 		return ret;
 	}
 
@@ -363,7 +364,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 				   cmd->data_out, cmd->data_out_len, rdata_len,
 				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
 	if (ret)
-		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
+		xe_log_err(xe, SYSCTRL, ret, "Mailbox command failed to send %#x.%#x\n",
+			   group_id, command_code);
 
 	kfree(mbox_cmd);
 
-- 
2.48.1

