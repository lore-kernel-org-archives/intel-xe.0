Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B20C001DF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0766610E496;
	Wed, 26 Jul 2023 16:10:07 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C64810E49E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690387799; x=1721923799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ybfvnlmOMkLETRCnjTJj36TEdeQUOj23chy9Pwae/n0=;
 b=Q2WcQZdoPs0U5GVZN3R4uYWEed/ukXadhfLYg35UA2HPzzYp7FJNLZvj
 tPnR4Vsbyyhen0kMHqp8RcOg5vh+/THC3oXtZUTBZMi7HWaTa0iDTtHyk
 sS1kCRHnFWAIlZ8tDkAaPV7Rq7urtNodp41gcHw37bYYUkdZX645ff6vd
 inFkuiXdaLxcSeMXSP2RGfHiKQEA0N2OS0OIn3pSC1no/HRh9ynDGWsK6
 oKoXqfGEzD5kHOzDxNjVZuCeaoBcPJcugTNsx1W8if7oYz/GwN0zFO3Va
 qRG7zC/SIbNf0ANBRxMAlIZiTdmwXDJy/IneS9sGGYJow0GYFF/bvgN6n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398994902"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="398994902"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057279371"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057279371"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:07:05 -0700
Message-Id: <20230726160708.3967790-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230726160708.3967790-1-lucas.demarchi@intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 07/10] fixup! drm/xe/display: Implement
 display support
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 6695908024d9..ccf83c12b545 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -70,9 +70,9 @@ initial_plane_bo(struct xe_device *xe,
 		gte += base / XE_PAGE_SIZE;
 
 		pte = ioread64(gte);
-		if (!(pte & XE_GGTT_PTE_LM)) {
+		if (!(pte & XE_GGTT_PTE_DM)) {
 			drm_err(&xe->drm,
-				"Initial plane programming missing PTE_LM bit\n");
+				"Initial plane programming missing DM bit\n");
 			return NULL;
 		}
 
-- 
2.40.1

