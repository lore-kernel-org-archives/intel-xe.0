Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB957C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5564B10E595;
	Thu, 11 May 2023 03:47:35 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1E410E591
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776851; x=1715312851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y6p1RBVAneOCxf8HhP6mt/fSvCRtwpUrrVlq8WHVSGk=;
 b=Czq7nSKnEhezPKqhEQN6olKNqdSfwHfkGtghny90fdvCXb3iW9aKLK8A
 FoUAOuE17sDLJlgIvbd/MFM+bBjpznOJdFOgeooEqOkQS24SGqGg7/9/u
 gAruj7cHwFsnQEDZuotDPVlCoHC2W8IWK4s1r8ZsVwfCBu2bYEKwUZncp
 lFhaYCvf6G+dwQq3dZIsO+liWcO8nYOPG39DhVW147Fe9HXgXa5COBf8M
 fWmPRzSBgXuYWdgCfknfKp6OizDCo00A7kbJsotlKG7v+h8hobLvUpKM9
 z5Cgjw9Sys0Nb9UUq7TG3YVmsj01Ei0rDcn1vgbMeX5w1mVZuE6IaBleL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850644"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850644"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203219"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203219"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:10 -0700
Message-Id: <20230511034722.1929038-15-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 14/26] drm/xe: Move display IRQ postinstall out
 of GT function
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Display interrupts are unrelated to the GT (and are also only relevant
to the root tile).  Move the postinstall call up a level in the
callstack.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 806121009102..494ec5567e50 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -490,8 +490,6 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
 		dg1_irq_postinstall(xe, gt);
 	else
 		xelp_irq_postinstall(xe, gt);
-
-	xe_display_irq_postinstall(xe, gt);
 }
 
 static void xe_irq_postinstall(struct xe_device *xe)
@@ -501,6 +499,8 @@ static void xe_irq_postinstall(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id)
 		xe_gt_irq_postinstall(gt);
+
+	xe_display_irq_postinstall(xe, xe_primary_mmio_gt(xe));
 }
 
 static irq_handler_t xe_irq_handler(struct xe_device *xe)
-- 
2.40.0

