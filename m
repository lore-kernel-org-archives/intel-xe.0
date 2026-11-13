Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F5D606A8A6
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nks9sIeS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1C8112621;
	Fri, 13 Nov 2026 15:16:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D665811264D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794583001; x=1826119001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E4wCfg2j1DlzTX1o7uTba2Bt7yp1pocZjkSXORwwwr0=;
 b=Nks9sIeSYW88rZaTJY3y6aA9LKpmvy4m/GkRuizAbKoFKvzGJM5KEof/
 bbkEc3ps2f3Y8faafGEXyWyC/O8mb305F+ZjOWPBRmX+bv9QDJkLx8h6j
 RZk7LGtA8iQc48b/fqhpcFOM2piQdnYhKCYhLMfnMt20rmiQm31KiDIRH
 68hUavVBYbFAXB+rX9iya4LvD8A7go5qBXv2S4gwLjzhSsifWEYsybK7B
 jgmbICA2JIuoxYquCdeUzpEg0p7SA8VSMN37Bn7QProjU8GnE5BzRYLy5
 kZnVGv3VhBWiMaJvw7LedEsK92okrzyne9mXJkmHRMb8018ZHUGiZOxRX A==;
X-CSE-ConnectionGUID: yLjWw5JmR26dVFfKcKLK6w==
X-CSE-MsgGUID: zPPm47F6TEadCa1ILdOCTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3394012"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3394012"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 07:16:33 -0800
X-CSE-ConnectionGUID: gHiiz0psQcm61vogLnoyNA==
X-CSE-MsgGUID: RIpPWqMUQxeoNRB4r67Q2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8869125"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2026 07:16:31 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 2/2] drm/xe/lrc: gate per-context ATS enable behind debugfs
 knob
Date: Fri, 13 Nov 2026 20:43:24 +0530
Message-ID: <20261113151324.2806375-3-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113151324.2806375-1-naresh.kumar.g@intel.com>
References: <20261113151324.2806375-1-naresh.kumar.g@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the CTX_SYS_PASID LRC layout offset and its CTX_SYS_ATS_ENABLED
bit definition (Bspec: 67168).

When enable_ctx_ats is set via debugfs, program
CTX_SYS_ATS_ENABLED in CTX_SYS_PASID during xe_lrc_ctx_init() so newly
created contexts carry the forced ATS-enable state for hardware
validation. This is a debug-only override for ATS validation.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h | 4 ++++
 drivers/gpu/drm/xe/xe_lrc.c             | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index a2795aa9fd71..2c6138cfd3cf 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -18,6 +18,7 @@
 #define CTX_TIMESTAMP_UDW		(0x24 + 1)
 #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
 #define CTX_ACC_CTR_THOLD		(0x2a + 1)
+#define CTX_SYS_PASID			(0x2c + 1)
 #define CTX_ASID			(0x2e + 1)
 #define CTX_PDP0_UDW			(0x30 + 1)
 #define CTX_PDP0_LDW			(0x32 + 1)
@@ -48,4 +49,7 @@
 #define CTX_INDIRECT_CTX_OFFSET_MASK	REG_GENMASK(15, 6)
 #define CTX_INDIRECT_CTX_OFFSET_DEFAULT	REG_FIELD_PREP(CTX_INDIRECT_CTX_OFFSET_MASK, 0xd)
 
+/* CTX_SYS_PASID fields used for the per-context ATS enable knob */
+#define CTX_SYS_ATS_ENABLED		BIT(31)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8e4f767d7f59..1c22d731cee9 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1650,6 +1650,15 @@ int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *
 	if (xe->info.has_asid && vm)
 		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
 
+	/*
+	 * HW debug validation-only override: program CTX_SYS_PASID to force
+	 * per-context ATS enable for newly created contexts.
+	 */
+	if (xe->enable_ctx_ats) {
+		xe_lrc_write_ctx_reg(lrc, CTX_SYS_PASID, CTX_SYS_ATS_ENABLED);
+		drm_dbg(&xe->drm, "LRC: context ATS enabled via debugfs enable_ctx_ats\n");
+	}
+
 	if (GRAPHICS_VER(xe) >= 20 && hwe->class == XE_ENGINE_CLASS_RENDER)
 		xe_lrc_set_gpgpu_preemption_level(lrc, gt);
 
-- 
2.43.0

