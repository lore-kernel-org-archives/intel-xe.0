Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0070FCCD193
	for <intel-xe@archiver.kernel.org>; Sun, 26 Oct 2025 11:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3915210E2C5;
	Sun, 26 Oct 2025 11:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ec4TIy1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF8E10E2C5
 for <intel-xe@lists.freedesktop.org>; Sun, 26 Oct 2025 11:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761477351; x=1793013351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=va++uIBAT0zR2L6HDi4JfTot7XGIWfZ/HMBncjZIWw8=;
 b=Ec4TIy1nr3GGAm0yWwf0HeRSlG+rcQPnSVrVznfY7zvfRD4qyz6tXCMB
 VZ2mgcl4GSD+o8w5GqUWNTrra3VCTPCCCfVLf44CqLAqgK2/PP19pntcH
 SqAWiYbGmy+CbOp4qbe+f9uxgyMiUnHmu86JzTYXOwSyeBcapehyppWEe
 RLiRkhY2ZNODDwV+lbrzFawD/HV9hCzzPn0TAKsInZ0yfEk/yu0IXPzMs
 0fsVGNjZC5PqgKf5EWVmX3mNKf07KFvXlYkT00aSxoUbWU6ROvqdrJDqx
 1IrfULaBuAwJMWrIFGOw9N1NmiAsgSX4oozY7O8xQlLBEtDglK5yIW+iv Q==;
X-CSE-ConnectionGUID: aPey3bvcTbW5HSwgoZQPdA==
X-CSE-MsgGUID: Kirw1CfHQneRRkODxD9kdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67414707"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67414707"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 04:15:50 -0700
X-CSE-ConnectionGUID: wN201UGBRMKXJfPKyC36KQ==
X-CSE-MsgGUID: vZTABI6JRqmih2a+0qQLgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; d="scan'208";a="184711529"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO tpalli-mobl3.intel.com)
 ([10.245.245.188])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 04:15:49 -0700
From: =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, tilak.tirumalesh.tangudu@intel.com,
 =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
Subject: [PATCH v2] drm/xe/xe3: Apply wa_14024997852
Date: Sun, 26 Oct 2025 13:15:38 +0200
Message-ID: <20251026111538.10143-1-tapani.palli@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024235248.GN1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251024235248.GN1207432@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Whitelist registers needed for userspace to control autostrip on xe3.

v2: fix GRAPHICS_VERSION to match xe3 (Matt)

Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 690bc327a363..bb2e167f6872 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -89,6 +89,13 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
 				   RING_FORCE_TO_NONPRIV_RANGE_4))
 	},
+	{ XE_RTP_NAME("14024997852"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
+			 WHITELIST(VFLSKPD,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
+	},
 };
 
 static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
-- 
2.51.0

