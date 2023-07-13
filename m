Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBB1C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 15:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB2110E6FD;
	Thu, 13 Jul 2023 15:06:37 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92E510E6FD
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689260795; x=1720796795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l3LIQch8tUCj5b2pZTIYbLqfJz0aA0d+3TYH0r+DVZM=;
 b=UYTdyFmneLAdQtJY/eF02PwJtv9ar5c9WSgHwFbmK+x23nWmHRkLmlY/
 pkJwhhH9jKXTw5Cq5sKd3DkOHEbuEffNHBd4DsnXGOYF4uvYBf1I+FOZo
 WJXFU42Y8qN7wPfmHsAG+ebMiQ6e/HPihP3hyvmag9amWgeL3zK0HQKuO
 +JA1ZdPNWP7jvLq1LaodYUYlC9Q9ILp9mh9QA6OI5/ivlDUcPEowYkdiu
 GU/8Z2APCwUORvyEXya1qHNA1KvCCXL6uwVERpiLjwS/XFWk9miofbTYE
 x/dD0GYQQ0zcBot47btNjWw1eAhU9Ep7/FSURBEiq2Vy5hkg/owfDCkpn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367856923"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="367856923"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699285555"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="699285555"
Received: from ineznano-mobl1.ger.corp.intel.com (HELO 8817c471bfcd.intel.com)
 ([10.251.221.219])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:34 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 15:06:09 +0000
Message-Id: <20230713150611.7-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713150611.7-1-francois.dugast@intel.com>
References: <20230713150611.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/7] drm/xe: Cleanup TRAILING_WHITESPACE style
 issues
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove all existing style issues of type TRAILING_WHITESPACE reported
by checkpatch.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 5eaa9bed9d12..21087f7a4609 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -482,7 +482,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
 			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
-			     /* 
+			     /*
 			      * Wa_14012342262 write-only reg, so skip
 			      * verification
 			      */
@@ -492,7 +492,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
 			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
-			     /* 
+			     /*
 			      * Wa_14012342262 write-only reg, so skip
 			      * verification
 			      */
-- 
2.34.1

