Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9558AE743EB
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 05:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D83510E6B2;
	Fri, 29 Sep 2023 05:04:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1DB10E6B9
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 05:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695963869; x=1727499869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6VND7SNFSPGVRz2nqyrj2G6L/wC4OpcfLedXMAScPHw=;
 b=BwV8KxEv8CwtfPQeqeg/LtoOHU6pRR4+OfKBpIjoK8RoAI8EuKpMSvco
 wGax+hbgrWP9PR7GpdITdWJcjDiu5l09GIwa6W962trays8a6BRG+K3az
 N0Kk7RZUrI6EB/jZe60L5Z0hc0xVBxlyWbNlmMLFsXxf6MgjKCqaTZ0t2
 1ipBihZsZdrlLTJqnkAKurYdWiZhd3WCymL8Zi5j/9HOfxYumXaWtmnYI
 tR8LfYAkBiY2LNLrkf4y+yGWfal7XCXgHQn3jM09uhTdVU9BCjy2YNEU+
 RTGZVgwx2A+OmqW00Gz7lohdGCkr0gpLKqmKDr3HO28EZ5Nc7sPNdxKeM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="413142028"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="413142028"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="865570967"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="865570967"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 22:02:51 -0700
Message-Id: <20230929050253.3153804-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929050253.3153804-1-lucas.demarchi@intel.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/7] fixup! drm/xe/pat: Prefer the arch/IP names
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

Fix alignment

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index ea2e3fb3a843..296763594370 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -26,7 +26,7 @@
 #define XELPG_PAT_3_UC				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
 #define XELPG_PAT_1_WT				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 1)
 #define XELPG_PAT_0_WB				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 0)
-#define XELPG_INDEX_COH_MODE_MASK			REG_GENMASK(1, 0)
+#define XELPG_INDEX_COH_MODE_MASK		REG_GENMASK(1, 0)
 #define XELPG_3_COH_2W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 3)
 #define XELPG_2_COH_1W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 2)
 #define XELPG_0_COH_NON				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 0)
-- 
2.40.1

