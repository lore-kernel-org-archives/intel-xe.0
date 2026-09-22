Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B9FC982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 11:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A1A10E6A6;
	Tue, 22 Sep 2026 11:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeMKY36i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5772D10E6A6
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 11:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790075674; x=1821611674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DLoO4u2ySYYJF0y8NQXD+x62fMo65pvBMsQOzP8eL+8=;
 b=aeMKY36iHGsGnUG0I0chk2DnzGUiet8cNLRf5h0mhJm6qzBU6NfkKVme
 LfUYfmaeNFFYk8jHQCeeW6ZPrmwjxGX5vFkbIPgXxJFTqUq+lUPu/LUYo
 hRjzJOQycspNzL3O1jjksgWNf+o8SWpr9VIctx9/BE+vxkUM+gxQbvS1z
 zfdvCeA92LA97AUqLOLh5hmrAc6Yn6tF6PLubehkgXWtjVWz1WM9VJeB8
 xmnceocduvXJTy1+nlFr9V69nmAwlDx9/u5edHnSToszDbqQt4fdXZlib
 YOz1eo3Ehy7G1CXkW4GhXgkxXx+dMEASgFAZHIHuvrl+LDQ6Uo2K17pPf w==;
X-CSE-ConnectionGUID: AedxFDD7Sb2mabq3lQaNWQ==
X-CSE-MsgGUID: DhDeQuxdR1Gn7P7ja2vyig==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89591251"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="89591251"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:14:34 -0700
X-CSE-ConnectionGUID: mqmXAP1fTpuj+FhWSiP8WA==
X-CSE-MsgGUID: 2tG27ulpSbesVYXUP1fYMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="273263293"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:14:29 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Mallesh.Koujalagi@intel.com, anshuman.gupta@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v1] drm/xe/sysctrl: Allow per-command mailbox response timeout
Date: Tue, 22 Sep 2026 04:14:17 -0700
Message-ID: <20260922111416.94416-2-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

xe_sysctrl_send_command() currently uses a fixed mailbox response
timeout of %XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS for all commands.

Add a timeout_ms field to struct xe_sysctrl_mailbox_command to allow
callers to override the default timeout when needed. A value of 0
preserves the existing default behavior.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 7 ++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 72baf1aa4b3a..e21848ca7594 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -334,6 +334,9 @@ void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 gr
  * If a response is expected, @cmd->data_out must point to a buffer of
  * size @cmd->data_out_len supplied by caller.
  *
+ * @cmd->timeout_ms specifies the response timeout in milliseconds.
+ * A value of 0 uses %XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS.
+ *
  * On success, @rdata_len is updated with number of valid response bytes
  * returned by firmware, bounded by @cmd->data_out_len.
  *
@@ -347,6 +350,7 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 	u8 group_id, command_code;
 	u8 *mbox_cmd = NULL;
 	size_t cmd_size = 0;
+	unsigned int timeout_ms;
 	int ret;
 
 	guard(xe_pm_runtime_noresume)(xe);
@@ -360,6 +364,7 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 
 	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
 	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
+	timeout_ms = cmd->timeout_ms ?: XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS;
 
 	might_sleep();
 
@@ -375,7 +380,7 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 
 	ret = sysctrl_send_command(sc, mbox_cmd, cmd_size,
 				   cmd->data_out, cmd->data_out_len, rdata_len,
-				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
+				   timeout_ms);
 	if (ret)
 		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
 
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index c236e5377f30..e98fa6877fec 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -105,6 +105,9 @@ struct xe_sysctrl_mailbox_command {
 
 	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
 	size_t data_out_len;
+
+	/** @timeout_ms: Response timeout in ms, or 0 for %XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS */
+	unsigned int timeout_ms;
 };
 
 /* Modify as needed */
-- 
2.43.0

