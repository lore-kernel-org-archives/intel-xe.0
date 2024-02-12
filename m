Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571C9C48297
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 14:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224CD10E78E;
	Mon, 12 Feb 2024 14:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVcbxpar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFB510E78E
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Feb 2024 14:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707749886; x=1739285886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a1uMMbi4JJ07C/xoSUnFF59ge1VWEl7A/5s+xXd3niU=;
 b=cVcbxparaZKKj+g5fI+neWJNVOsEIqAOaBz8pLuwW5Gv36dMdlcxmHZb
 UueMTYKKh9R/OarUytXJ7Nyicat4GR0F38WQaqcYyAXObWURmEv/p3bO0
 7MbrWKWA/D2ARb9tcFN8UkFSFRMju5YAiP2+STdu+GJ6SDaZvFZzr9L2w
 WGQVHogh572OnfrirDUTpeLNNXhMnFZR5KLOuPlWN4GTaw8c9JbKNB1ON
 T6KfOngksRAb+mbrYyoEUJCBaKYAAqaWL6eoHYz82CDjATAcu37O/eTb1
 qRMeZzS5nWyElw9kFDqPjVbQ9JHPjYpl9uGK1CXbYOYNQ1/JbusV/8OS3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1861949"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="1861949"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 06:58:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="33394396"
Received: from belyakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 06:58:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/xe: use drm based debugging instead of dev
Date: Mon, 12 Feb 2024 16:57:57 +0200
Message-Id: <20240212145757.645094-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Prefer drm_dbg() over dev_dbg().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 17b3affdb6a0..2f5d179e0d00 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -442,7 +442,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		 * irq as device is inaccessible.
 		 */
 		if (master_ctl == REG_GENMASK(31, 0)) {
-			dev_dbg(tile_to_xe(tile)->drm.dev,
+			drm_dbg(&tile_to_xe(tile)->drm,
 				"Ignore this IRQ as device might be in DPC containment.\n");
 			return IRQ_HANDLED;
 		}
-- 
2.39.2

