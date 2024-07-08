Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1114BC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 13:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEEA10E122;
	Mon,  8 Jul 2024 13:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsbh7Lez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C895710E122
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 13:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720444466; x=1751980466;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cb/wMrNNjFSu1Y2G85fNEq6tEth/2m2yCo/AfHJAGTE=;
 b=fsbh7LezP9D+Y632Ry36M0B8IUr5M256WFVov5Gi0hb7FzKhEgQWOMER
 FouMExr2Xe+2Kw43tCvW3JIDoIop3yhoxD8VbTwG3903P+eKklyGdebRt
 AgMDiddYCLSQ1zK+NDV3M9HxD44Y3vl6PsWn3TmghibqTtLzAS74N2h+q
 cyXgY22jd5R+nnC2qNwaxShrAX0nQVgKr9qRzstn5dCSukuudJiBzlBmI
 p226HT4KReRT0zMMYrCkj1Z/LZUiIq4K7biqtEMmSxopqEUn3/rUMnc2M
 LZdRcdTJ//yj0rns7DeLHGyOBj06QjfjL0R3euJ8lX6fSSoPH1tVZxR50 A==;
X-CSE-ConnectionGUID: OxeBe7dgQtm42HTp+6EQ6w==
X-CSE-MsgGUID: 1yYWP6VoRjWYc2uojko8qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17475796"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="17475796"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 06:14:26 -0700
X-CSE-ConnectionGUID: meEFolwvRzWKQKWVAmLQZQ==
X-CSE-MsgGUID: 9Gs3yURsQ4SLKaSjA1NWQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="47574786"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 06:14:23 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal
Date: Mon,  8 Jul 2024 14:59:18 +0200
Message-ID: <20240708125918.23573-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Free arbiter allocated in intel_hdcp_gsc_init().

Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 14b8b4278317..990285aa9b26 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -160,12 +160,16 @@ void intel_hdcp_gsc_fini(struct xe_device *xe)
 {
 	struct intel_hdcp_gsc_message *hdcp_message =
 					xe->display.hdcp.hdcp_message;
+	struct i915_hdcp_arbiter *arb = xe->display.hdcp.arbiter;
 
-	if (!hdcp_message)
-		return;
+	if (hdcp_message) {
+		xe_bo_unpin_map_no_vm(hdcp_message->hdcp_bo);
+		kfree(hdcp_message);
+		xe->display.hdcp.hdcp_message = NULL;
+	}
 
-	xe_bo_unpin_map_no_vm(hdcp_message->hdcp_bo);
-	kfree(hdcp_message);
+	kfree(arb);
+	xe->display.hdcp.arbiter = NULL;
 }
 
 static int xe_gsc_send_sync(struct xe_device *xe,
-- 
2.42.0

