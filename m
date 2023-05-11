Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EE9C83005
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E3910E5A7;
	Thu, 11 May 2023 03:47:37 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA7310E595
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776851; x=1715312851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y8PTlpzPYRdIT/ZD0sp5RQw74XXLaTNoI0PTJDovxZY=;
 b=BP4epsfFc2ZpzhsKvvIdBtcE30mggEzAF8BHoK8buOspFbPmluAhHJ+q
 FhQu5VmP7+YZmhpgX+yRcTub6cF6uJsTjDPCTVi2M/dQPbrlkb8T6+5bC
 uk8CwnsHP9tHYu42CWimjLWx0sMjHx5GIxl57eRdtXUqs0MXHI4hTpxmg
 DlulMoSEX7m4E4wxOfCXjGQyIk4uzKPI/4+GJ6Y70RlI+3Z07kn8iVcR8
 oDJKRwgRzC3zE8Eo0vHYxCC09loUQI5vQ5Gxuu+BfI9F5TYxN29cFGtYh
 gDVuiYUB1gIYYMS83YYzzvO7NIKZ1C2sG6i6PAh5vQPtvns0tGLztfKVc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850647"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850647"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203230"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203230"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:13 -0700
Message-Id: <20230511034722.1929038-18-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 17/26] drm/xe/irq: Actually call
 xe_irq_postinstall()
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

The xe_irq_postinstall() never actually gets called after installing the
interrupt handler.  This oversight seems to get papered over due to the
fact that the (misnamed) xe_gt_irq_postinstall does more than it really
should and gets called in the middle of the GT initialization.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 02f44b58ce3e..2549fd9fb5cd 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -588,6 +588,8 @@ int xe_irq_install(struct xe_device *xe)
 		return err;
 	}
 
+	xe_irq_postinstall(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, irq_uninstall, xe);
 	if (err)
 		return err;
-- 
2.40.0

