Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433A8C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 19:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDAC10E82E;
	Fri, 16 Aug 2024 19:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAclK8Sv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF9710E82A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723834848; x=1755370848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CcbBq+QrtaFjt9/tIMyiZCFRsUPrOVJDXPKzq++rPx8=;
 b=dAclK8SvdX7OqtoaVVbUc0JblrYyofj+STKLrffJsGghATRtTCYz73Wl
 YhO83JQdC52XGUkqPgXjLm/QyTrW2H8uCVMKXgshNW2sPvQHB5ulhcYCl
 YUqwKJF0DxUFRoYoOPY7c5PCs2f8iKsNzdYGDeca0ZSLN3gnFdYAU+k31
 36MSj7IN0sjFBvM5NtwV3/jqT+8XnVC15KvDL3YMSA2a9y78GfIT0XRNa
 hyBt+KmlNXoylBU8DzxnN3uyOCSu5dsCaV03uq4HLFGtgyCODuhJiHOWQ
 HDZDb8iZtKVEcUkOt+eirdnYnsA5kdmP1CSJEewsvFoepI465abCkDYqY g==;
X-CSE-ConnectionGUID: wCcj0rhoQmutmyrWm2ibWA==
X-CSE-MsgGUID: MPboIdLgQV2K0JLC9W24Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21772453"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="21772453"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:48 -0700
X-CSE-ConnectionGUID: DSvC7cCUTtG29g/KcTcq5Q==
X-CSE-MsgGUID: IaWjJyR0TU+SDinWMYdhtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59767959"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:48 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 06/12] drm/xe/pxp: Add GSC session initialization support
Date: Fri, 16 Aug 2024 12:00:15 -0700
Message-ID: <20240816190024.2176976-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
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
 drivers/gpu/drm/xe/xe_pxp_submit.c            | 50 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.h            |  1 +
 3 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
index 4a59c564a0d0..734feb38f570 100644
--- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
+++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
@@ -50,6 +50,7 @@ struct pxp_cmd_header {
 } __packed;
 
 #define PXP43_CMDID_INVALIDATE_STREAM_KEY 0x00000007
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
 struct pxp43_inv_stream_key_in {
 	struct pxp_cmd_header header;
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index 41684d666376..c9258c861556 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -26,6 +26,8 @@
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_gt_regs.h"
 
+#define ARB_SESSION 0xF /* TODO: move to UAPI */
+
 /*
  * The VCS is used for kernel-owned GGTT submissions to issue key termination.
  * Terminations are serialized, so we only need a single queue and a single
@@ -470,6 +472,54 @@ static int gsccs_send_message(struct xe_pxp_gsc_client_resources *gsc_res,
 	return ret;
 }
 
+/**
+ * xe_pxp_submit_session_init - submits a PXP GSC session initialization
+ * @gsc_res: the pxp client resources
+ * @id: the session to initialize
+ *
+ * Submit a message to the GSC FW to initialize (i.e. start) a PXP session.
+ *
+ * Returns 0 if the submission is successful, an errno value otherwise.
+ */
+int xe_pxp_submit_session_init(struct xe_pxp_gsc_client_resources *gsc_res, u32 id)
+{
+	struct xe_device *xe = gsc_res->vm->xe;
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
+	ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
+				 &msg_out, sizeof(msg_out));
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
  * @gsc_res: the pxp client resources
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
index 48fdc9b09116..c9efda02f4b0 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.h
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
@@ -14,6 +14,7 @@ struct xe_pxp_gsc_client_resources;
 int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
 void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
 
+int xe_pxp_submit_session_init(struct xe_pxp_gsc_client_resources *gsc_res, u32 id);
 int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
 int xe_pxp_submit_session_invalidation(struct xe_pxp_gsc_client_resources *gsc_res,
 				       u32 id);
-- 
2.43.0

