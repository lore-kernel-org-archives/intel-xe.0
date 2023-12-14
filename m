Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D5EC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 19:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6141810E993;
	Thu, 14 Dec 2023 19:00:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6E510E2EA
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 19:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702580424; x=1734116424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kxVDgvRhZ5SIRERFUnRW/cwd6L+UnPo3+7s9zj7NQJM=;
 b=aN1d1iV/7rBBuZRFqmJtdpYGblV9qgDHE4v0sCJtLfwxT0A91ueCabRo
 OtQ8yqNBy50q2zbUvA2TTBvRuP/oUKAwiVXDBudOJkBi99s761AKmsrfA
 qtXj6kH7i4y+vb3USh0Na1MFpsL1gcjmYZsNKyWu4asu2mIIGYgcnTsfU
 fk27IdNmi8i//1ZbBJ9TJK6s37FJdfJPuivJBeIP7XvAgbZuCvBLgrd7L
 ewh9sn4nwY5Y45Fq1knvVlOH6huvbrZixg3Z03ZTNkOo7CSltfG5A0mmL
 uRJupS64jBu1K80AntEAcmeobBh7jd0eAS1nIriE6MPyLX2tJLayKYF4J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="399006371"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="399006371"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="15964768"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.198])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:16 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 01/10] drm/xe: Add command MI_LOAD_REGISTER_MEM
Date: Thu, 14 Dec 2023 19:59:46 +0100
Message-Id: <20231214185955.1791-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231214185955.1791-1-michal.wajdeczko@intel.com>
References: <20231214185955.1791-1-michal.wajdeczko@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We will need this shortly during context state preparation.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
v2: update dump_mi_command (Matt)
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h |  3 +++
 drivers/gpu/drm/xe/xe_lrc.c                      | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 1cfa96167fde..c74ceb550dce 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -56,6 +56,9 @@
 #define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_DW_LEN_DW, 5 - 2)
 #define   MI_FLUSH_DW_USE_GTT		REG_BIT(2)
 
+#define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
+#define   MI_LRM_USE_GGTT		REG_BIT(22)
+
 #define MI_BATCH_BUFFER_START		__MI_INSTR(0x31)
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index d6dfbd0bdc70..c8e242d8fb09 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -966,6 +966,20 @@ static int dump_mi_command(struct drm_printer *p,
 			drm_printf(p, " - %#6x = %#010x\n", dw[i], dw[i + 1]);
 		return numdw;
 
+	case MI_LOAD_REGISTER_MEM & MI_OPCODE:
+		drm_printf(p, "[%#010x] MI_LOAD_REGISTER_MEM: %s%s\n",
+			   inst_header,
+			   dw[0] & MI_LRI_LRM_CS_MMIO ? "CS_MMIO " : "",
+			   dw[0] & MI_LRM_USE_GGTT ? "USE_GGTT " : "");
+		if (numdw == 4)
+			drm_printf(p, " - %#6x = %#010llx\n",
+				   dw[1], ((u64)(dw[3]) << 32 | (u64)(dw[2])));
+		else
+			drm_printf(p, " - %*ph (%s)\n",
+				   (int)sizeof(u32) * (numdw - 1), dw + 1,
+				   numdw < 4 ? "truncated" : "malformed");
+		return numdw;
+
 	case MI_FORCE_WAKEUP:
 		drm_printf(p, "[%#010x] MI_FORCE_WAKEUP\n", inst_header);
 		return numdw;
-- 
2.25.1

