Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78ABD743F6
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F1310E3E6;
	Wed, 20 Nov 2024 23:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUFmlc1Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC2310E183
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 23:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732146249; x=1763682249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NpebhJOvcLGcuikbGHm+fr65Y/dZKwY7KHzSwKg+kNc=;
 b=TUFmlc1ZuCWuSv7hsxgsULooeFD1708cv5ZYRpXl9GmdYizNaUz3MenV
 9ofUPjTLlUl5ZjX3RsuKPS5AW+GQnihFTKvLTSWDiKp8+PpYL5GPP/q/O
 GdVsTEpBPd2/OPbOLcqrGv4dKdLnGaG/eVl446g0ywAqdX0PnkVXwDQGa
 h8IecHMMKHpCZM3MCcb/6XOwJD1u58rBbqfJ/CrDuVsdQMBFfnPWWK60t
 HWjpeXLaFXbbmNYbGEZfbVRkf3BxEl2ShGXvR48pCf6kRHrGCfRpUq+Di
 K7QkuvpVjqE8SWNCCE6l1NplL0zEX76WHcKKWB1I+AT7qW1bGJL3CHN7v g==;
X-CSE-ConnectionGUID: vmDtXOn3R9qMIsAyvraMNg==
X-CSE-MsgGUID: lJA7AAkGSxai7XLMrnLA/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54733280"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="54733280"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:08 -0800
X-CSE-ConnectionGUID: XXb+PZm7TCm3NI4j/ScDdg==
X-CSE-MsgGUID: abWZ8l9eSuORRlFbxI4WJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90453646"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:07 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 06/12] drm/xe/pxp: Add GSC session initialization support
Date: Wed, 20 Nov 2024 15:43:46 -0800
Message-ID: <20241120234353.1037180-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
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

v2: clean up error messages, use new ARB define (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h | 21 +++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.c            | 47 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.h            |  1 +
 3 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
index f0da65ccdda2..290e431cf10d 100644
--- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
+++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
@@ -51,6 +51,7 @@ struct pxp_cmd_header {
 } __packed;
 
 #define PXP43_CMDID_INVALIDATE_STREAM_KEY 0x00000007
+#define PXP43_CMDID_INIT_SESSION 0x00000036
 #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
 
 /* PXP-Input-Packet: HUC Auth-only */
@@ -65,6 +66,26 @@ struct pxp43_huc_auth_out {
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
index f5f6b18c1054..b50fe037c74b 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -16,6 +16,7 @@
 #include "xe_gt.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
+#include "xe_pxp.h"
 #include "xe_pxp_types.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
@@ -490,6 +491,52 @@ static int gsccs_send_message(struct xe_pxp_gsc_client_resources *gsc_res,
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
+	if (id == DRM_XE_PXP_HWDRM_DEFAULT_SESSION)
+		msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
+
+	ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
+				 &msg_out, sizeof(msg_out));
+	if (ret) {
+		drm_err(&xe->drm, "Failed to init PXP session %u (%pe)\n", id, ERR_PTR(ret));
+	} else if (msg_out.header.status != 0) {
+		ret = -EIO;
+
+		if (is_fw_err_platform_config(msg_out.header.status))
+			drm_info_once(&xe->drm,
+				      "Failed to init PXP session %u due to BIOS/SOC, s=0x%x(%s)\n",
+				      id, msg_out.header.status,
+				      fw_err_to_string(msg_out.header.status));
+		else
+			drm_dbg(&xe->drm, "Failed to init PXP session %u, s=0x%x\n",
+				id, msg_out.header.status);
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

