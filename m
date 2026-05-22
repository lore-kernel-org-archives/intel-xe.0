Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFEBCD5BB5
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 14:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D378310E222;
	Fri, 22 May 2026 14:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XN64qG5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A2D10E261
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779460287; x=1810996287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vv3X4C17sbFTJAm90uma6/pehr2VQibUPE2nRf1NEHM=;
 b=XN64qG5tu3P//FjDOyrfh3tfqAH+w7upXwQf1HUed4rhtK4wRNqOr44i
 NOAiKa/ik63Xxqr+3jFWwJHeEID2rveyE8vMPjcl6/F4ZopLCPLINecAl
 RWEUVefR06VsFUZubpBV0Uq11pRwdQwrY43PewNujWMGOfYVDIAQCzryQ
 kyAwGOutIF62gCGyLtSg2H+VeNlNyxc9k+7CuwQ+YAnm9ZOZgtKA8ZmbA
 xrFvml3atn928WhfhYXKjUqKuw58cNGkLp8AOTuElElfrYegTfuM6X7qD
 MQYqyQ9EvBjxrEeK7snJnKopLcuSQ5/nBa8iaIjU402DcYNW0mAzikGJg A==;
X-CSE-ConnectionGUID: x2AKlaFCQluyRT/ntLz1/g==
X-CSE-MsgGUID: 6Tx8wK8QSRuzOxvJkIOgNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91861632"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="91861632"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:31:27 -0700
X-CSE-ConnectionGUID: K9LD7pe5QBeOaIrrEb8WNA==
X-CSE-MsgGUID: eFB7wgYwQSGNrYvOX6ukTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="240795101"
Received: from dmitriyo-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.81])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:31:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/4] drm/xe/mmio: Add check for minimal BAR size
Date: Fri, 22 May 2026 16:31:10 +0200
Message-ID: <20260522143112.10643-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522143112.10643-1-michal.wajdeczko@intel.com>
References: <20260522143112.10643-1-michal.wajdeczko@intel.com>
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

We initialized the root tile's xe_mmio structure with a new size
of 4MiB without sanity checks to see if mapped GTTMMADR_BAR was
actually at least that size.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f4086b9ae38f..3e31a2141886 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -93,13 +93,18 @@ int xe_mmio_probe_early(struct xe_device *xe)
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
-	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
 	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
 	if (!xe->mmio.regs) {
 		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
 		return -EIO;
 	}
 
+	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
+	if (xe->mmio.size < SZ_4M) {
+		xe_err(xe, "GTTMMADR_BAR is too small: %zd\n", xe->mmio.size);
+		return -EIO;
+	}
+
 	/* Setup first tile; other tiles (if present) will be setup later. */
 	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
 
-- 
2.47.1

