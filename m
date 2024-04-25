Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3EFC10F15
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 12:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7718A10E49F;
	Thu, 25 Apr 2024 12:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awvqEb86";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F148B10EF19
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 12:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714048410; x=1745584410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hVkRpRKKhPWgLKxKIcK0ytdP/kKk4a7yX8/ZrB0huhE=;
 b=awvqEb86zBuPBVRyKNRg9TH9nRn/nj9KYvK4BCucP1W1wanT+tOdf+7R
 2MZyOLWiiQsqYnOq7O2NbM0USjsLd6BEHgsu2BtOlgwA8af1ogEDMjR6V
 EVsiPifBv5A0YUzjSS1DXMyyn8ix9kcSxaLhL6OWAoPKNA9RTvSl0RtW3
 qdswyESEctmwy6FgxkoBBLk49q611mvd7AnFqb66uxhIvXxv5A6WDzU2y
 eFKP8X4R5dMdhUDQwAOjA6NwgiGLerVLfhTnIK2etP6nS506melXwaNKW
 dTkeVQsAlc/ryw7ywXJnE/rniHi6U5T10BptCkSN0YuFrarquryY9BUA7 A==;
X-CSE-ConnectionGUID: 5DgbaysfStCXMPygz8JsYg==
X-CSE-MsgGUID: bB2J2burSU64hSZAHkYUdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13515888"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="13515888"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 05:33:29 -0700
X-CSE-ConnectionGUID: XtVcTJmQT7eydSWKtw+4LA==
X-CSE-MsgGUID: 8dVbA3zrQQC1ifv0c/XeQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="48320831"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 05:33:28 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH] drm/xe: Add engine name to the engine reset and cat-err log
Date: Thu, 25 Apr 2024 14:18:56 +0200
Message-ID: <20240425121856.4500-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Add engine name to the engine reset and cat error log
which should be useful while debugging.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c7d38469fb46..245e29d095c0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1655,7 +1655,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
+	drm_info(&xe->drm, "Engine reset: name=%s, guc_id=%d", q->hwe->name, guc_id);
 
 	/* FIXME: Do error capture, most likely async */
 
@@ -1690,7 +1690,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	if (unlikely(!q))
 		return -EPROTO;
 
-	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
+	drm_dbg(&xe->drm, "Engine memory cat error: name=%s, guc_id=%d",
+		q->hwe->name, guc_id);
 	trace_xe_exec_queue_memory_cat_error(q);
 
 	/* Treat the same as engine reset */
-- 
2.42.0

