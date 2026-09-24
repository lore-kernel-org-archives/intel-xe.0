Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A342C98310
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED34510E711;
	Thu, 24 Sep 2026 06:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfEKcQWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3F810F2F1
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 06:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790230193; x=1821766193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UdCRZ4i5Wy7BAa+e6hiFzhujYdFw9/T4ii68bDgES/A=;
 b=EfEKcQWPEZjTPEkNKnzTMNqPuUGOuC1wEd3WVUigCbdr4Bzv4UleB2/m
 JQ9EmZbNl+5FwjSMGtorxFvCLThO8OrnQfzxEfo4jdZAK4B0M+eJRX2Ya
 0E79xD3Qs335xw8c2wEkW5VWkAHhrL2u3IzJWdnhk+kklz8Xs2Rw1WtT6
 oQ7aYe6UzCeL2KXxQ1dQT1BynoHiRRcaYICz2/PqKDD04gNoOtnA5mFTO
 vfV1Vbx3VxzLoRxZOtho88FJWfhvvy2Yaj78d9UGvbiVF7Ee4a+YO5jnR
 ElYOcLKPfzh3i4yKUrPaTSzj3w2mlDjwjWOwk2OKxFgCzG3nItSAZHMNO g==;
X-CSE-ConnectionGUID: /OWr9l3wRseyc+wIesVwlg==
X-CSE-MsgGUID: ziAsmbrTRny2nocSPgV+GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90853979"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90853979"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 23:09:53 -0700
X-CSE-ConnectionGUID: PVeaRyGPQi+uMrUXPe1Lew==
X-CSE-MsgGUID: MGay5MZrTdG5a+rNC8hATQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277096686"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 23 Sep 2026 23:09:49 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v9 09/10] drm/xe/sysctrl: Log group and command ID on mailbox
 failure
Date: Thu, 24 Sep 2026 11:39:10 +0530
Message-ID: <20260924060900.146167-21-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
References: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
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
index 753fcc026057..25425e8bb533 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -358,7 +358,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 				      cmd->data_in, cmd->data_in_len,
 				      &mbox_cmd, &cmd_size);
 	if (ret) {
-		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
+		xe_log_err(xe, SYSCTRL, ret, "Failed to prepare command %#x.%#x\n",
+			   group_id, command_code);
 		return ret;
 	}
 
@@ -368,7 +369,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 				   cmd->data_out, cmd->data_out_len, rdata_len,
 				   timeout_ms);
 	if (ret)
-		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
+		xe_log_err(xe, SYSCTRL, ret, "Mailbox command failed to send %#x.%#x\n",
+			   group_id, command_code);
 
 	kfree(mbox_cmd);
 
-- 
2.48.1

