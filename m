Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8549EC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C65E10E78C;
	Mon,  7 Sep 2026 10:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgcafSAw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B0E10E78C
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 10:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788778439; x=1820314439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5fJbvwP7fmHl666KLGl376gICUnGZHSU+WYQ3R8GJAs=;
 b=MgcafSAwfcCuXhRsYRLUVNUdAhGEIaElBBQ0ecTBqLN96RJWAIPdK01V
 4SismRLxgEhQ/YQJB61QsY5qgjynCK5dOg2Eqrzpxr71HAh/P3FzgM/mr
 KSn7dCDWwdzEy7qQCUCBLAtjUZzDV+PHd5cXWdsp2NxrNfv2GseFjiUpd
 X88OkADgfYkVKQ5cJbTs0GdvEcrekQbi36Ai+9awc0zwZrUifP8U2Cb/A
 IY4Xofq4HA10QzK4pjKc+pGOLQOv7Qz9/Wz0qPxiIQy4sRxc+HCuLnMet
 Gy7VfUe5mFcXRLWtRPqKAVYAE5MrzSBqY5s/Us1r/vHii6TC0hAIGEIOW Q==;
X-CSE-ConnectionGUID: JKeLRqJ0SuCTB2s4xLCh7w==
X-CSE-MsgGUID: rI/9XEPFSb2U1cvrDFCe/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89024518"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89024518"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:53:59 -0700
X-CSE-ConnectionGUID: BSLofeB3QDSAfZOkv+giAQ==
X-CSE-MsgGUID: ceSNuivAQn6EznE/7J4dEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="308908406"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 07 Sep 2026 03:53:55 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v7 8/9] drm/xe/sysctrl: Log group and command ID on mailbox
 failure
Date: Mon,  7 Sep 2026 16:23:22 +0530
Message-ID: <20260907105313.2208003-19-mallesh.koujalagi@intel.com>
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
index 94ed2d378b89..9e86b87a07bf 100644
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

