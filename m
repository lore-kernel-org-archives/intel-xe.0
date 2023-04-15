Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDB9C7619A
	for <intel-xe@archiver.kernel.org>; Sat, 15 Apr 2023 04:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4D810E06B;
	Sat, 15 Apr 2023 04:09:29 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABDA10E06B
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Apr 2023 04:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681531767; x=1713067767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ukFzoRCe1iLnivazS33JT1w3VXSSpnjrYn38BLyplTw=;
 b=Og4uFQiCYfnYWZH/1u9+mCIDJaWkKW50/utQOdHYQ0Ftt8pJW0bOCD5A
 V40dpBgDgmSPRhc+iSowTBDIt3Hs5UvVSk9YLr5ED6vSd+Q8I3+/j2jQl
 kF5WKxOFEgDmgnwRL6fT4DCRc00NujjDo8ovWLM9jByO5j6dIdbUK4sPY
 h5xK+TFPk8o06zMPljKAWuAUVPuA1BBvO0eJmVEPR73uNuL82p+lh0pRw
 81LfRxeUjlw+ZiryJJjKgmo/1xSYJyrkuXdg6nzP3Qf+Yda9oii+BM4fb
 4BST3hlYoSyWWc+vLpk8+y/PQCcmSk7zL5gPQRBjqLsl/VmLNtAcZwuy1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="347342172"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="347342172"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 21:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="833763979"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="833763979"
Received: from mkathuri-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.85.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 21:09:25 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 14 Apr 2023 21:09:06 -0700
Message-Id: <20230415040906.13230-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415040906.13230-1-jose.souza@intel.com>
References: <20230415040906.13230-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Set default MOCS value for copy cs
 instructions
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

copy cs instructions that dont have a explict MOCS field will use this
default MOCS value.

This was mainly copied from i915 source code.

BSpec: 45807
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_wa.c               | 13 +++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index cc874348f76bc..dbc4b9f15b4e8 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -105,6 +105,15 @@
 		(REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, (write) << 1) | \
 		 REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, (read) << 1))
 
+#define BLIT_CCTL(base)				_MMIO((base) + 0x204)
+#define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 8)
+#define   BLIT_CCTL_SRC_MOCS_MASK		REG_GENMASK(6, 0)
+#define   BLIT_CCTL_MASK (BLIT_CCTL_DST_MOCS_MASK | \
+			  BLIT_CCTL_SRC_MOCS_MASK)
+#define   BLIT_CCTL_MOCS(dst, src)				       \
+		(REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, (dst) << 1) | \
+		 REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, (src) << 1))
+
 #define VDBOX_CGCTL3F10(base)			_MMIO((base) + 0x3f10)
 #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 5ef3561101466..0c12700bedde5 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -660,6 +660,19 @@ xe_wa_process_runtime_was_engine(struct xe_reg_sr *sr,
 					   CMD_CCTL_MOCS_OVERRIDE(mocs_w, mocs_r),
 					   XE_RTP_ACTION_FLAG(MASKED_REG, ENGINE_BASE))),
 		},
+		/*
+		 * Some blitter commands do not have a field for MOCS, those
+		 * commands will use MOCS index pointed by BLIT_CCTL.
+		 * BLIT_CCTL registers are needed to be programmed to un-cached.
+		 */
+		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+			       ENGINE_CLASS(COPY)),
+		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
+				 BLIT_CCTL_MASK,
+				 BLIT_CCTL_MOCS(mocs_w, mocs_r),
+				 XE_RTP_ACTION_FLAG(MASKED_REG, ENGINE_BASE)))
+		},
 		{}
 	};
 
-- 
2.40.0

