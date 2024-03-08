Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A35DC54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 15:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC6D11319D;
	Fri,  8 Mar 2024 15:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+F/w1uz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C6E112E8E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 15:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709913115; x=1741449115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TIwngY3tF661uUjh3gMRPBTdVLDYxDjmkRylqn5rOJU=;
 b=W+F/w1uzgoSi3QkvIXfrdTPWcR5ii4DhLYoPIZXJi6o92GPIFEuLnfm/
 jN5lsPd3jrC8QcNNhnD7BjWYhRmVB4NghERwl91CbT96yFlUqX4MyE90B
 vpruaGKaJOMJlnkk42u3BBSOM4QED9j/jHjZqDdQDzCuWCVD+TMPSXG0e
 RujZQ+cFcrmTORcZ353aJDebrs0lc1o/sU3aqwXQcE72E8l6m/MUnNuxI
 YOBRJf4achAIwPgJU07fVB6jQApv4uIo1FZ/uj/tR/XHBKeTOyL5vTCs9
 VuafeMO0yO750FT69aiBaUWMoEQQya6Eu43Qrxis5QLoubW9YssmxRJdQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4520319"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4520319"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 07:51:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="33637293"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2024 07:51:52 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/hdcp: Fix condition for hdcp gsc cs requirement
Date: Fri,  8 Mar 2024 21:19:40 +0530
Message-ID: <20240308154939.1940960-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240308134817.1940638-2-suraj.kandpal@intel.com>
References: <20240308134817.1940638-2-suraj.kandpal@intel.com>
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
required for display version < 14

--v2
-Use display version in commit message [Lucas]

Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

