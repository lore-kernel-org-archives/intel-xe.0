Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71A6CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 13:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7775510E1E0;
	Fri, 24 Oct 2025 13:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbEhWjDo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E4510E1E0
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 13:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761311019; x=1792847019;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xSUPV9p0rkzwVct7LHWMMcQvk72QbwU5vo4+w5Gun6k=;
 b=CbEhWjDoOerkogVGp8RRqr54kWIV/TeujYAgOK2kfThziKjsu+uqZqs6
 1jUL3C2hY8+STNt4MgvbdbN6w1HXSSWzDYuQtn7v99/hY7DtBPCTsOcKU
 uQPMbf1C85IcXJjhMSN6cUtGvHmhOqqv96H7hCWP03f/iL8Pvoh+tDqGG
 2gqVU+KgAP/r/RQ3If8nP6UeT8i4SApZaj5ygRQJFsmqqE4cgYBtcxY7D
 d3QSdYnJkAS/wdMVhTwGjFE0PGcY7fpitF/3YP76QmvlryjjfW2VZbA5w
 90tuz0cloucuba7D7Y5JVm+xZX/ltNjXgnfzcF8wn3Fpo8VJI2Uw1yJCu w==;
X-CSE-ConnectionGUID: RdEwWb7KSuGNM6Zd+yuSuA==
X-CSE-MsgGUID: sFQoG+4fS6GSSC+EhXVzzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74612221"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="74612221"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 06:03:39 -0700
X-CSE-ConnectionGUID: U4+xkbtDQKiG7icxQYHkqQ==
X-CSE-MsgGUID: AC2jcJzIQ1CkXU+Wn4fMkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="189551272"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.97])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 06:03:38 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] verbose p2p
Date: Fri, 24 Oct 2025 14:03:30 +0100
Message-ID: <20251024130329.61392-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

Do not review.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 54e42960daad..b047251674ea 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -28,7 +28,7 @@ static int xe_dma_buf_attach(struct dma_buf *dmabuf,
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 
 	if (attach->peer2peer &&
-	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
+	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, true) < 0)
 		attach->peer2peer = false;
 
 	if (!attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
-- 
2.51.0

