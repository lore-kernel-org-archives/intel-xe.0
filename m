Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEB0C47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 12:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CE410E08F;
	Wed, 17 Jan 2024 12:28:05 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jan 2024 12:28:04 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6459510E08F
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 12:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705494485; x=1737030485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NToDA8Tg+sTuPUedSqFkMMeKJWR1RrkTU/iND1bZvm4=;
 b=jl9LlTG8lNKHeTskuiPZ1QuZLk/qYwEBldfjcxMu8KqGEAMbz+8exNPK
 i+Sl3OF0Z8OE03qHeRXK+LTYwdEG2clgTyFpd42fjw0Og46WyxWFb3RtE
 dCUDf9oMEIXe2MKHEN3E+hKG7kWCMRglRhTsJ1qeiUGfgeGiTxhFrbqIk
 tP3pB0mS8RepKJItbYzy21fTSDC4X35KmhLz+ooo7zzKrF2I6ywkF/bM0
 aSJWGA8bFKQDDgaAOuM77jaKWBfvxuPvRS5QRyhbGMBLs9ETjHOvJvJKw
 debK14/AWfbXt+0jlwz+EJ96EmwW1IXAF4Ft8OJoWytg0zu1Cc35J9Va9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="43964"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="43964"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:20:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="784502324"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="784502324"
Received: from msznigir-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.230])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:20:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/5] drm/xe: make heci_gsc_irq_chip const
Date: Wed, 17 Jan 2024 14:20:41 +0200
Message-Id: <20240117122044.1544174-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240117122044.1544174-1-jani.nikula@intel.com>
References: <20240117122044.1544174-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The irq_chip definition can be const, make it so.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_heci_gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index bfdd33b9b23b..1c9d38b6f5f1 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -29,7 +29,7 @@ static void heci_gsc_irq_unmask(struct irq_data *d)
 	/* generic irq handling */
 }
 
-static struct irq_chip heci_gsc_irq_chip = {
+static const struct irq_chip heci_gsc_irq_chip = {
 	.name = "gsc_irq_chip",
 	.irq_mask = heci_gsc_irq_mask,
 	.irq_unmask = heci_gsc_irq_unmask,
-- 
2.39.2

