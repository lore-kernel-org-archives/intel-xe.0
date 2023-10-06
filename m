Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483D1E92FFB
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1551D10E0CA;
	Fri,  6 Oct 2023 10:38:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDC910E0CD
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696588722; x=1728124722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y5ZpEvxQE3qQ6rZPn3W++qh1IRd67cC11sth8Bay0rE=;
 b=ahFFPayAMVnjY2Hm/eWD02eNQChOheB1Rlj4LbQSR+EQBadMub1hVQe3
 h/6Awtmb7WTEZaYqDD3lyZh3GyYdwE8J9tzdPvAGBwMoNACAnHvH+moiR
 rG64hQmok6bozFprppFllt7dyCeT8uWENh9PJYmpe/BY5eFGOJLxuP0cP
 3nxA5GzlwbSwi/GOrVrt59aU6YH7U5KlJLUi+Cu5yE6bq2J8txRzMidBJ
 v3QhG8cM+b9NJLrKcIMSlYg9B9B2n8lIxvck/F26IgyeiES/mF2hM2AOZ
 faNeZhRhaMc3An8K2s7ifoRyt+EbZiVWg9vsy2D/38FDPjG1MAjZIjdAP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="374070262"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="374070262"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="787348423"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="787348423"
Received: from lvroom-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.239])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 13:38:02 +0300
Message-Id: <aac88fdb737162eb3435e015368b9b98204e3f02.1696588392.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696588392.git.jani.nikula@intel.com>
References: <cover.1696588392.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/6] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The diag push/pop stuff is unnecessary leftovers.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 82d2c42629ce..391f08c1caca 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -417,10 +417,6 @@ void xe_display_pm_resume(struct xe_device *xe)
 	intel_power_domains_enable(xe);
 }
 
-/* Display info initialization */
-__diag_push();
-__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
-
 void xe_display_probe(struct xe_device *xe)
 {
 	if (!xe->info.enable_display)
@@ -435,4 +431,3 @@ void xe_display_probe(struct xe_device *xe)
 	xe->info.enable_display = false;
 	unset_display_features(xe);
 }
-__diag_pop();
-- 
2.39.2

