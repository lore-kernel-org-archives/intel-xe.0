Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2448DE743EC
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 05:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBB710E0DD;
	Fri, 29 Sep 2023 05:15:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EE610E0DD
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 05:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695964521; x=1727500521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IXXmBfdXRPb48VaMUoKbx7qzRzN37KVEee60uSJVEXU=;
 b=T0pjGiXN78GFCfvBA76ybSOXSYBpyjZxZXAkBuZ3CyvkwsOvUpByEc6+
 w11lIKuSe9j12bO5yCzYitwxs1qXdWLexDRbDS+DZn1A3jNuZVzsOE+yD
 WZ81yIurGq3vXClYPw3VXUYPibe3PlpYToDN5JxoAtLDXc9ORsrd2TCWy
 bKYDzm7/MBgIcKP1FtDWcqsPLjZE1ZHKWMnb5TMwCnLsU/hn5ofv8Ns85
 P49RONFgfjnQjZ3Kq3r7hlJzWGXibXLUodGh0naZrdXa/rkGXwmX8acCH
 vp5GGpnW+nzEnvPvl6BwshP2b9Bf0ILoyxlKKd7GK2H7Wewp/lQzhzy4P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386099199"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="386099199"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:15:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="893306395"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="893306395"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:14:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 22:15:39 -0700
Message-Id: <20230929051539.3157441-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Leverage ComputeCS read L3 caching
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

On platforms that support read L3 caching, set the default mocs index in
CCS RING_CMD_CTL to levarage the read caching in L3.

Currently PVC and Xe2 platforms have the support.

Bspec: 72161
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index a8681089fb60..49128f640e15 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -316,22 +316,25 @@ static void
 hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 {
 	struct xe_gt *gt = hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	/*
+	 * RING_CMD_CCTL specifies the default MOCS entry that will be
+	 * used by the command streamer when executing commands that
+	 * don't have a way to explicitly specify a MOCS setting.
+	 * The default should usually reference whichever MOCS entry
+	 * corresponds to uncached behavior, although use of a WB cached
+	 * entry is recommended by the spec in certain circumstances on
+	 * specific platforms.
+	 * Bspec: 72161
+	 */
 	const u8 mocs_write_idx = gt->mocs.uc_index;
-	/* TODO: missing handling of HAS_L3_CCS_READ platforms */
-	const u8 mocs_read_idx = gt->mocs.uc_index;
+	const u8 mocs_read_idx = hwe->class == XE_ENGINE_CLASS_COMPUTE &&
+				 (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC) ?
+				 gt->mocs.wb_index : gt->mocs.uc_index;
 	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
 				REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 	const struct xe_rtp_entry_sr engine_entries[] = {
-		/*
-		 * RING_CMD_CCTL specifies the default MOCS entry that will be
-		 * used by the command streamer when executing commands that
-		 * don't have a way to explicitly specify a MOCS setting.
-		 * The default should usually reference whichever MOCS entry
-		 * corresponds to uncached behavior, although use of a WB cached
-		 * entry is recommended by the spec in certain circumstances on
-		 * specific platforms.
-		 */
 		{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
 		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED)),
 		  XE_RTP_ACTIONS(FIELD_SET(RING_CMD_CCTL(0),
-- 
2.40.1

