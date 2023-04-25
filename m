Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC76C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 18:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7598410E4E6;
	Tue, 25 Apr 2023 18:46:26 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CF310E429
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 18:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682448383; x=1713984383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1XfqCYYpCLniXB6kvur/RXcNQ8ANLLdgmiYKNlLpsXM=;
 b=m1mdLwm5RPE64wRT2ZjyNhsI52O6GpuMkyGjBX7urlNEYqCj/A8aNHUZ
 wMasuj/mCSlSnHPHyowvXgRDTv0qek1Iz4/xijfFkVxvSmQMxuWsJz/RJ
 gtGYemuwD+lGirvmU6s+5WgDNg14mX7WEkfuCs23KYqjmEHlp/2xrl8Fd
 l0D3xXYj5O6QnOzfByeBYoxi0hOnkQrPfeeoH2puvaMn69yklz7SI7GqB
 xImJ/CaDjnbzFpzApIQIa7YGQx4XVC2ETXkfRpVeSnTM3vw/RAnJIzq7K
 m+UXM8KbfGvW8JtYUw42x9L2Fr0PGOmTEXf8sXO8p8ldKDvxbzeveBG/L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="345622160"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="345622160"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 11:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="837554608"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="837554608"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 11:46:21 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 11:46:02 -0700
Message-Id: <20230425184602.144628-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425184602.144628-1-jose.souza@intel.com>
References: <20230425184602.144628-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Set default MOCS value for copy
 cs instructions
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

copy cs instructions that dont have a explict MOCS field will use this
default MOCS value.

This was mainly copied from i915 source code.

DO_NOT_MERGE/IMPORTANT:
Matt Roper suggested that this register should be programmed in UMDs
discussion started in the mail list.

v2:
- move to xe_hw_engine.c
- remove BLIT_CCTL auxiliary macros
- removed MASKED_REG

BSpec: 45807
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  7 +++++++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 7a12b99f8c1d2..9ef0de001fb83 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -59,6 +59,13 @@
 
 #define RING_BBADDR(base)			_MMIO((base) + 0x140)
 #define RING_BBADDR_UDW(base)			_MMIO((base) + 0x168)
+
+/* CMD_CCTL comment also applies here  */
+#define BLIT_CCTL(base)				_MMIO((base) + 0x204)
+#define BLIT_CCTL_RTP(base)			_XE_RTP_REG((base) + 0x204)
+#define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
+#define   BLIT_CCTL_SRC_MOCS_MASK		REG_GENMASK(6, 1)
+
 #define RING_EXECLIST_STATUS_LO(base)		_MMIO((base) + 0x234)
 #define RING_EXECLIST_STATUS_HI(base)		_MMIO((base) + 0x234 + 4)
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b43641ea84518..0c9ca62dd237b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -277,6 +277,8 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 	const u8 mocs_read_idx = gt->mocs.uc_index;
 	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
 			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
+	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
+			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
 	const struct xe_rtp_entry engine_was[] = {
 		/*
 		 * RING_CMD_CCTL specifies the default MOCS entry that will be
@@ -295,6 +297,20 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 					   ring_cmd_cctl_val,
 					   XE_RTP_ACTION_FLAG(MASKED_REG, ENGINE_BASE)))
 		},
+		/*
+		 * Some blitter commands do not have a field for MOCS, those
+		 * commands will use MOCS index pointed by BLIT_CCTL.
+		 * BLIT_CCTL registers are needed to be programmed to un-cached.
+		 */
+		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+			       ENGINE_CLASS(COPY)),
+		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL_RTP(0),
+				 BLIT_CCTL_DST_MOCS_MASK |
+				 BLIT_CCTL_SRC_MOCS_MASK,
+				 blit_cctl_val,
+				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
 		{}
 	};
 
-- 
2.40.0

