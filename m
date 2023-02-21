Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93D5C677F1
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 23:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788AD10E39C;
	Tue, 21 Feb 2023 23:34:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3A410E38E
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 23:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677022446; x=1708558446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GSSu64jM6WKXZjdG6fo7RCVbcfCR22JGOhnmZD9dBuA=;
 b=YRY/HcxbJ1woTz7Dqm9HeIiHXDFiqIeaNECWltv/Sk1Nd8VJZEPxJNCK
 8g8JoSf+L4XOM4XfgtbWp2zMJdmRyqN3t0WZE/bHH7bA/oAmCpUw9sNCp
 vOfVYqokWArrYtkNDETgU7ueTnWQozjv9y7Zkt3mVZoERITr4undQstp+
 YVo4khmoHBMmFAkoeHUErHABq7aMqYw0OqdbDP8HDbWHd95w5R/8hBjGj
 yd7QZThJJ10BC7i4NNYMCyUXhwN10RhmyfE2EBQQghLclLk3hCHvmjqSx
 /WWd+Qlx/jqY4bhW/yej766gmxVpAigCTFEwr1ZNqk8ASRjtj3mFH4xNk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="313156252"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="313156252"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621691845"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="621691845"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 15:33:47 -0800
Message-Id: <20230221233348.883897-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221233348.883897-1-lucas.demarchi@intel.com>
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe: Add missing doc for xe parameter
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix the following warning:

	../drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c:55: warning: Function
	parameter or member 'xe' not described in
	'xe_ttm_stolen_cpu_inaccessible'

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index e20c567f276f..097454f78286 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -41,6 +41,7 @@ to_stolen_mgr(struct ttm_resource_manager *man)
 /**
  * xe_ttm_stolen_cpu_inaccessible - Can we directly CPU access stolen memory for
  * this device.
+ * @xe: xe device
  *
  * On some integrated platforms we can't directly access stolen via the CPU
  * (like some normal system memory).  Also on small-bar systems for discrete,
-- 
2.39.0

