Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A5BEE7FE3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 12:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6BA10E8A3;
	Fri,  8 Sep 2023 12:24:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5708C10E0B8
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694175877; x=1725711877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uaxKD3vzOoOUAvcH39BdyMWlxrWkeoS3dz7/6lx2sCA=;
 b=a2Km11i+rRUNaob2vjo7V/ANcgiv25OozNANs2yg2T4ERQw/uzBQ0ByL
 7zomzSTPSHRhccxBKJ/Piu+Bl/kdE/G5L6uDZKbfnbuNCjG48LVaGTN82
 umP5Rrd4+6icBZMnxBcl4706lRHzgM/pnWRLI0QpEnhCdYK67TvBjfaar
 thHKbhlcJ14t23+PUFAIK/UqhUKeXo6NzblH/hYn4ffL5eWCpsG9gLG0e
 Ey7l8SmPSBhcz4EqeNoGz89OQL0yc5cmSSLnow6vCF+WBwZ/ZGETulS6I
 jSqU1YMvsuzTiPw+WeXQAXRar2Pn8WdrHoe/jOZL5osd1Jv0hCRP3hHyE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441650051"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="441650051"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692244179"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="692244179"
Received: from akorchin-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.73])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:35 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 15:24:07 +0300
Message-Id: <20230908122415.1886366-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908122415.1886366-1-jouni.hogander@intel.com>
References: <20230908122415.1886366-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 03/11] drm/xe: Add macro to get i915 device
 from xe_bo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add helper macro to kill couple of #ifdefs

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index f6ee920303af..2ea9ad423170 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -70,4 +70,7 @@ struct xe_bo {
 	bool created;
 };
 
+#define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
+#define intel_bo_to_i915(bo) to_i915(intel_bo_to_drm_bo(bo)->dev)
+
 #endif
-- 
2.34.1

