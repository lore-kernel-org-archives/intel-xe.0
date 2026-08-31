Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED25C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 10:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3147710E195;
	Mon, 31 Aug 2026 10:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imzjf4Yy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6FE10E195
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788173136; x=1819709136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HCijSmk8ihhjxyG4P4b8+GR+QXqJzPWpw5SKH/agi1E=;
 b=imzjf4YynGupsOMYhB7ZughIvkrB4FxQUuKEg4L6R6QuK4t+6sdYXWHJ
 oaj4OIYKjrRsiWlXC4Z3Nu785aZZHjlTdVzIM/M44+svCgfiulrk3niUy
 dMTAOo+90AiCMghFx9i+hOHbf+6l7dh1cc6tJCo9GI9H4XVch/TRHhV9W
 hsGI69HeV+cqjd55tj3cIoUOaFbo0mxndHm+EvgM7J9EPC7pbS3CVtdrq
 0ChKSB+kHkFl7CP0akieX4X7zwJGVtQ6E5wQw1rv1wBi8M+Qog5dl7cIH
 sXeZbj9Tm9Hzg/aOcHLP33ixbqnAzSHhIjrhzD+UA77UMRSgmXQ4p2dQo w==;
X-CSE-ConnectionGUID: CK6sfxj1QIKm+LVtDdTy2g==
X-CSE-MsgGUID: VaXwX4qfTkS+fno8cZs/6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92264641"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92264641"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 03:45:36 -0700
X-CSE-ConnectionGUID: Wz/ngXVhRQmcHLl/cWje2w==
X-CSE-MsgGUID: U2bNkPIbTFCPSgC/16sKcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="270685562"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 31 Aug 2026 03:45:31 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v6 6/9] drm/xe/sysctrl: Replace FIELD_GET() with
 REG_FIELD_GET()
Date: Mon, 31 Aug 2026 16:15:03 +0530
Message-ID: <20260831104456.1770605-17-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
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
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 8 ++++----
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 50bbdab072de..3aa868f60b38 100644
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

