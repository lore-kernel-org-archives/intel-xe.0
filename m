Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C47CD8CAE
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6589410F772;
	Mon,  8 Jun 2026 16:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkCz0rAT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A83610F772
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937698; x=1812473698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/iC4B6RGDybX7iMmRB4vUqToXRc/kWoB3aFf3fPe0dY=;
 b=AkCz0rATtnwJXB4XN0nhleIKGVdmtgjMqgv0qK75DG3ULZ66qI9n5lqH
 +KG761SdYknTTqufKpxTpVSanXXvp9Kiha14urdLQtQ3g2+UzGRLzmEsQ
 l8V7Ab3GQ7HPvjO5p9r3bzyDizUcVyI0swSPfrS2Cu0QuKA63WEJqvWxF
 XZ9Hwq7kEIy5K6LS6UC55Fyu7HbWPKh2rwYyIXdyhvkdlkBhCbMLWX5cd
 6Te98X264ph306ZMiC8YzD6sVd/WQQ4tu7MxGKsWZKsegO01DuGCzQWbK
 IrxMJi4Crni4oWzcyYw0r6oWp9Zs8HoFzCvdhOwWPO7w3vxcit+VqghZR w==;
X-CSE-ConnectionGUID: uRqn6dy+TeGpxCSbgczMSA==
X-CSE-MsgGUID: 467YEuxxRbSwxzIgXQPp5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744580"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744580"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:58 -0700
X-CSE-ConnectionGUID: LyBZjNnRT4mdi4YvP0dAPQ==
X-CSE-MsgGUID: DtMkUK57Twm1N/6CImtBBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467610"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 15/16] drm/xe/kunit: Assume fake GGTT is online
Date: Mon,  8 Jun 2026 18:54:28 +0200
Message-ID: <20260608165429.587-16-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

As we can mimic writes to the GTTMMADR BAR, we can also assume that
the GGTT is online and allow the xe_ggtt code to update the PTEs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  3 +++
 drivers/gpu/drm/xe/xe_ggtt.c      | 12 +++---------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index dc9999397956..1dc9a012b5c1 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -489,6 +489,9 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 		struct xe_tile *tile;
 		unsigned int id;
 
+		xe_mmio_probe_early(xe);
+		xe_mmio_probe_tiles(xe);
+
 		KUNIT_ASSERT_NE(test, 0, data->ggtt.start);
 		for_each_tile(tile, xe, id)
 			KUNIT_ASSERT_EQ(test, 0,
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5f4c2ae3293a..7721507a6f39 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -410,18 +410,12 @@ static int __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	int err;
-
 	/* this is kunit only function - do not abuse! */
 	xe_tile_assert(ggtt->tile, kunit_get_current_test());
+	/* verify that we have GTTMMADR mapped */
+	xe_tile_assert(ggtt->tile, ggtt->tile->xe->mmio.regs);
 
-	err = __xe_ggtt_init_early(ggtt, start, size);
-	if (err)
-		return err;
-
-	/* we don't have GTTMMADR on kunit (yet) */
-	ggtt->flags &= ~XE_GGTT_FLAGS_ONLINE;
-	return 0;
+	return __xe_ggtt_init_early(ggtt, start, size);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
 
-- 
2.47.1

