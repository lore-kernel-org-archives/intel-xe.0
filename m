Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AAFC41513
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1A010EBF6;
	Fri, 12 Jul 2024 21:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcjQL1aV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0B810EAFB
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720819766; x=1752355766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FSH6v2gJkqMKRcjAqOsfjkcq/lKOoAA9JMo3OqMi/pU=;
 b=kcjQL1aVoHCXArXitFS9oqagJZRQIkAD3FFhPWOVYLhr5aOhq82ZaX5R
 hM8670kBdnDBRZc+3WfFBvNUmVfYjbvId+XJ9pge3cBvUhpF95Zgd31yM
 U0oB+78zjEPV6m0YTnTkvzLfjZCoar76Cvbg7uWtol5x/YpoYRpQEVQIo
 DUN1yTaqy4JhpeI8Lf2/MUouOi4JdJUuFc2zs+YBHDZWJOrqepGhoVw/K
 KqUA/rMaVttDMdnsEU3ZDbYH9Ux4k7se9IWrqhPkP1Ay+r+7NBv5U9BAM
 JzVXEVaKcXMSd3G2ymyAoB0fdHU8626SY1aRWUHdnHVGyMjMODM6o+h1L Q==;
X-CSE-ConnectionGUID: AJ8omWc4RnmjGS+rOdQFHg==
X-CSE-MsgGUID: ou9YrTW/RWGmJ986P1fIHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17990165"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="17990165"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:26 -0700
X-CSE-ConnectionGUID: 1arsAv+OT7qNh1lIaUsjnA==
X-CSE-MsgGUID: ut1ZizOATY2ayRarfwg36A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="53864592"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:27 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [RFC 07/14] drm/xe/pxp: Add GSC session initialization support
Date: Fri, 12 Jul 2024 14:28:51 -0700
Message-ID: <20240712212901.2684239-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
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

A session is initialized (i.e. started) by sending a message to the GSC.

Note that this patch is meant to be squashed with the follow-up patches
that implement the other pieces of the session initialization and queue
setup flow. It is separate for now for ease of review.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h | 21 ++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.c            | 49 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.h            |  1 +
 3 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
index dddabeb4046e..e12670bfe26f 100644
--- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
+++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
@@ -50,6 +50,7 @@ struct pxp_cmd_header {
 } __packed;
 
 #define PXP42_CMDID_INVALIDATE_STREAM_KEY 0x00000007
+#define PXP43_CMDID_INIT_SESSION 0x00000036
 #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
 
 /* PXP-Input-Packet: HUC Auth-only */
@@ -64,6 +65,26 @@ struct pxp43_huc_auth_out {
 	struct pxp_cmd_header header;
 } __packed;
 
+/* PXP-Input-Packet: Init PXP session */
+struct pxp43_create_arb_in {
+	struct pxp_cmd_header header;
+		/* header.stream_id fields for vesion 4.3 of Init PXP session: */
+		#define PXP43_INIT_SESSION_VALID BIT(0)
+		#define PXP43_INIT_SESSION_APPTYPE BIT(1)
+		#define PXP43_INIT_SESSION_APPID GENMASK(17, 2)
+	u32 protection_mode;
+		#define PXP43_INIT_SESSION_PROTECTION_ARB 0x2
+	u32 sub_session_id;
+	u32 init_flags;
+	u32 rsvd[12];
+} __packed;
+
+/* PXP-Input-Packet: Init PXP session */
+struct pxp43_create_arb_out {
+	struct pxp_cmd_header header;
+	u32 rsvd[8];
+} __packed;
+
 /* PXP-Input-Packet: Invalidate Stream Key */
 struct pxp42_inv_stream_key_in {
 	struct pxp_cmd_header header;
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index e54e51e75567..9c76eeb5535c 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -26,6 +26,8 @@
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_gt_regs.h"
 
+#define ARB_SESSION 0xF /* TODO: move to UAPI */
+
 static int create_vcs_context(struct xe_pxp *pxp)
 {
 	struct xe_gt *gt = pxp->gt;
@@ -448,6 +450,53 @@ static int gsccs_send_message(struct xe_pxp *pxp, void *msg_in, size_t msg_in_si
 	return ret;
 }
 
+/**
+ * xe_pxp_submit_session_init - submits a PXP GSC session initialization
+ * @pxp: the xe_pxp structure
+ * @id: the session to initialize
+ *
+ * Submit a message to the GSC FW to initialize (i.e. start) a PXP session.
+ *
+ * Returns 0 if the submission is successful, an errno value otherwise.
+ */
+int xe_pxp_submit_session_init(struct xe_pxp *pxp, int id)
+{
+	struct xe_device *xe = pxp->xe;
+	struct pxp43_create_arb_in msg_in = {0};
+	struct pxp43_create_arb_out msg_out = {0};
+	int ret;
+
+	msg_in.header.api_version = PXP_APIVER(4, 3);
+	msg_in.header.command_id = PXP43_CMDID_INIT_SESSION;
+	msg_in.header.stream_id = (FIELD_PREP(PXP43_INIT_SESSION_APPID, id) |
+				   FIELD_PREP(PXP43_INIT_SESSION_VALID, 1) |
+				   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
+	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
+
+	if (id == ARB_SESSION)
+		msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
+
+	ret = gsccs_send_message(pxp, &msg_in, sizeof(msg_in), &msg_out, sizeof(msg_out));
+	if (ret) {
+		drm_err(&xe->drm, "Failed to init session %d, ret=[%d]\n", id, ret);
+	} else if (msg_out.header.status != 0) {
+		if (is_fw_err_platform_config(msg_out.header.status)) {
+			drm_info_once(&xe->drm,
+				      "PXP init-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
+				      id, msg_out.header.status,
+				      fw_err_to_string(msg_out.header.status));
+		} else {
+			drm_dbg(&xe->drm, "PXP init-session-%d failed 0x%08x:%st:\n",
+				id, msg_out.header.status,
+				fw_err_to_string(msg_out.header.status));
+			drm_dbg(&xe->drm, "     cmd-detail: ID=[0x%08x],API-Ver-[0x%08x]\n",
+				msg_in.header.command_id, msg_in.header.api_version);
+		}
+	}
+
+	return ret;
+}
+
 /**
  * xe_pxp_submit_session_invalidation - submits a PXP GSC invalidation
  * @pxp: the xe_pxp structure
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
index 7f26f1bd90dc..cbd2a39915d3 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.h
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
@@ -13,6 +13,7 @@ struct xe_pxp;
 int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
 void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
 
+int xe_pxp_submit_session_init(struct xe_pxp *pxp, int id);
 int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
 int xe_pxp_submit_session_invalidation(struct xe_pxp *pxp, u32 session_id);
 
-- 
2.43.0

