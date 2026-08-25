Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0BCC61DBC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D9410EB33;
	Tue, 25 Aug 2026 17:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGpiy5Dg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B4C10EB33
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787679786; x=1819215786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cojgo3Jg+QTsydC6XkUIR99jygx8Vbs8ltD4da/nw7Q=;
 b=EGpiy5DgE66C+08+qd8kI/GPT+SbF6MdVpNnL+wA42au+xaq+L81g71Y
 JAuTtHyE5RRBJXIjN1GzaEOL84IhCqgK/cJRIFVOrXPZW+FYJohMwvYGw
 KqyRMc1p8nlv3BT6XO7MbRDS3oE5zmd4NcMX9sdxhgix6JO0sWtkpsml2
 LPdnkZ/UvnRHJr0SjE0TlGTkFm1NWZJ27FerxZmQkDEVwvtLdJW8aAj7J
 snASvmgC63SnjYgccQv/5N/oYTHQToe/zVNGFSAalTEJ3a5GV0fLY6q8y
 zmJy4mf3hBsbJa6z7Maxd7YQsa3oWkAB07S0X6K5MzrD18baudbDeSajy w==;
X-CSE-ConnectionGUID: RXomG4aJT8SypTX36PIxTw==
X-CSE-MsgGUID: 4a5mxLe+S/KvUeEPYNA3Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88210839"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88210839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:43:06 -0700
X-CSE-ConnectionGUID: cCDgMdQAQlSAIkebcxdGEQ==
X-CSE-MsgGUID: IAgdW1+OR4y9Lnel98L8Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272585139"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:43:03 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com
Subject: [PATCH v2 11/11] drm/xe/ras: Report correctable errors using SIGID
Date: Tue, 25 Aug 2026 23:29:28 +0530
Message-ID: <20260825175916.1103841-24-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260825175916.1103841-13-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
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

Use xe_log_* helper to report correctable errors.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 4cd1d5eb75f4..0becfadbb4cd 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -458,8 +458,11 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 		if (!ras_counter_is_valid(xe, &errors[id]))
 			continue;
 
-		xe_warn(xe, "[RAS]: %s %s detected\n",
-			comp_to_str(component), sev_to_str(severity));
+		xe_log_from(xe, ras_sev_to_cper_sev(severity),
+			    ras_comp_to_hw_sigid(component),
+			    component,
+			    &errors[id], sizeof(errors[id]),
+			    "error detected\n");
 
 		/* Send event once per component */
 		if (sent & BIT(component))
-- 
2.54.0

