Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BA3C7EE2D
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 17:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28A510E712;
	Fri,  3 Mar 2023 17:07:22 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4978F10E710
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 17:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677863240; x=1709399240;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MO9QqF73Whz1Yg9PXoFvZxLQEK0Me5v+r+/jl3YGg4s=;
 b=BTjCzjpNzN2OYLaBl2Rrs9xSIyUK/42eKKIgiwfIUVV2IJrQRzni6iIK
 B/Ifp+5kteZja04woYJ62Mht/9ma37LY+pZ5bT56EYFusTcfq6BFaGUy5
 ckoOqlpl+fPB02B9JXaP8RiKR8HK+96vMfRoxXZ/drVzkJqbcYZLyPY/a
 8R9OoZ05LUpauwfRjLEOq3QCA8fChgSQFm/6lP1AynJxWrWpOukUNjb0C
 7PEKC5PCK09tePd3jyhTO8dwA78j/gUf481sbWiEDEHv3kP3uMGc2eQub
 xV4zLF4vAbhOHBQj0eLwgLudSTkn30l/x38asUtTYu9w7pvtWRuFudTxr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="314751503"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="314751503"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 09:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="739564394"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="739564394"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 09:06:04 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 09:05:55 -0800
Message-Id: <20230303170555.91242-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix size of xe_eu_mask_t
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

XE_MAX_DSS_FUSE_REGS was being used to calculate the size of
xe_eu_mask_t while it should use XE_MAX_EU_FUSE_REGS.
There are no know issues about this but fixing it anyways.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index b01edd3fdc4d5..74b4e6776bf16 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -31,7 +31,7 @@ enum xe_gt_type {
 #define XE_MAX_EU_FUSE_REGS	1
 
 typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
-typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
+typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
 
 struct xe_mmio_range {
 	u32 start;
-- 
2.39.2

