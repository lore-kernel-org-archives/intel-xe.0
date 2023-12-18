Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F9FC4706C
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B448410E3DF;
	Mon, 18 Dec 2023 19:01:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B934810E3AD
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926047; x=1734462047;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4+KO61VaXosFXqWXPVH2T1Ozq1udKxmr+Y4kjMAXD18=;
 b=VFOwSE+OPWtCVCI9jOZiB9jDw7iZz+8AQJIrOyp24o3qRChI7Y+CeK7w
 OutlfcVb57Dq1P9VFKFE+ddKdJMMfOJC+VXbDZpL2nukq985JYxFJJ8Z3
 j1EOzdUpuzd3lCB/sacc3xTh+TVB7S2NOKrG6sDWb/eCwv/dpzJGg4eEf
 dWBsr7GkuZ9C7OYlACkfy6nzx2r4flCexd2lwy6FT2tOxkJhsPZm2DR5T
 BWE1KGteE5xkDHCXIkR+STNpJ4HVHYCYVFA5MpAbKGJgQdsHd6xr7sKE6
 ofsEaVrfMstbXh6JfnSzjRnUwL5/OKlZQEw/mvL+rzUp+e/yMkOMQ/j9S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="461984324"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="461984324"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779157426"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="779157426"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:51 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 01/10] drm/xe: Add command MI_LOAD_REGISTER_MEM
Date: Mon, 18 Dec 2023 17:53:35 +0100
Message-Id: <20231218165344.458-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231218165344.458-1-michal.wajdeczko@intel.com>
References: <20231218165344.458-1-michal.wajdeczko@intel.com>
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

We will need this shortly during context state preparation.

Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://lore.kernel.org/r/20231214185955.1791-2-michal.wajdeczko@intel.com
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
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
index b7fa3831b684..44586e612eaf 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -964,6 +964,20 @@ static int dump_mi_command(struct drm_printer *p,
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

