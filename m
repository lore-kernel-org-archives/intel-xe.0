Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121ECC54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 13:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4ACF1131BB;
	Fri,  8 Mar 2024 13:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lIajtttA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9088C112CD2
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709905831; x=1741441831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iNOOjN3REsqKrjPyIdkn6Zg3vZnnjKevrTCvNFAoiGY=;
 b=lIajtttAQ753jGCZGI0pwmWYleaHo1mt5yFWYMuXSYJwSI8j09vL9kCM
 9qOqPy1X52048lfB7wkQg5/R+LCk+3g0oCrnikaLfRaYepxYOcMm7x2Gw
 nNBP8eZ6a0GqvXRkiRdEJuTFVBgtdKAngxYcEPd3xFsbKRxwbtE9fgExX
 iowA2/fEQ3wGG51K/jqRYPxB/izwrM6XzDAr2H1ksxJgbh11DAkkT5ttQ
 jC8dCrzn0NDmM9NGX9wxj1vzq1IG7CbR0NET4Z64q3I/b3fWgj9wId0uQ
 qWffHWPD37fw5TukreuiuAoQnnxWh7UvTdhZZVNTg0ORe/nRIptOQ6igI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15190279"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15190279"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 05:50:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10371646"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa007.fm.intel.com with ESMTP; 08 Mar 2024 05:50:29 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/xe/hdcp: Fix condition for hdcp gsc cs requirement
Date: Fri,  8 Mar 2024 19:18:18 +0530
Message-ID: <20240308134817.1940638-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

Add condition for check of hdcp gsc cs requirement rather than
assuming gsc cs to always be required when xe is loaded. It is not
required for Gen pre-MTL

Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index dcde1d0ac1f8..25c73602ef55 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -32,7 +32,7 @@ struct intel_hdcp_gsc_message {
 
 bool intel_hdcp_gsc_cs_required(struct xe_device *xe)
 {
-	return true;
+	return DISPLAY_VER(xe) >= 14;
 }
 
 bool intel_hdcp_gsc_check_status(struct xe_device *xe)
-- 
2.43.2

