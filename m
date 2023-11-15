Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84554C47075
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 11:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCB910E500;
	Wed, 15 Nov 2023 11:38:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE0910E500
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 11:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700048282; x=1731584282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v52j/yfr43Zvb53AHuIHB7foUwfv159RvxId/hlQ0qA=;
 b=IT0HSvnvF2WfTOTkFm/C+c7dueqy2NplRfPTpcZEsMaAVkl7Q8OZHc3s
 dtn/2NmBrexpU7BU2ScJ/N8DXMwFU8q8wof4u9K34RuhBopERDu0BkTI8
 s5xrzP8ip1CiNDSBFN3k/pgBf8+i2lQJPQ8Rf9dIETrqpUipCF/kK9FuM
 Ytwhjd5CuSsN5q2HhR8+5TzRDiXjABLRpxATKCCriadi4QA41c8RVNF6U
 l9sNCD0tEBI7y1eQM9qbN2CcpezAR1cBwOV4pjzQ3UDVmB9TpdYea8sIk
 FxYJOetakre/l9+pCJhyeuVeXn00B0GocTbqHRccptj+eU2O/7lGyqR27 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381255312"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="381255312"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:38:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="714863102"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="714863102"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.24])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:38:01 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 12:37:47 +0100
Message-Id: <20231115113748.1949-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231115113748.1949-1-michal.wajdeczko@intel.com>
References: <20231115113748.1949-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe/guc: Fix handling of
 GUC_HXG_TYPE_NO_RESPONSE_BUSY
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

If GuC responds with the NO_RESPONSE_BUSY message, we extend
our timeout while waiting for the actual response, but we wrongly
assumed that the next message will be RESPONSE_SUCCESS, missing
that we still can get RESPONSE_FAILURE.

Change the condition for the expected message type, using only
common bits from RESPONSE_SUCCESS and RESPONSE_FAILURE (as they
differ, by ABI design, only by the last bit).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ddbe64eb0f3b..16c233f120c6 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -671,9 +671,10 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	header = xe_mmio_read32(gt, reply_reg);
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
 	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
+		u32 resp_bits = GUC_HXG_TYPE_RESPONSE_SUCCESS & GUC_HXG_TYPE_RESPONSE_FAILURE;
+		u32 resp_mask = FIELD_PREP(GUC_HXG_MSG_0_TYPE, resp_bits);
 
-		ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_TYPE,
-				     FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS),
+		ret = xe_mmio_wait32(gt, reply_reg,  resp_mask, resp_mask,
 				     1000000, &header, false);
 
 		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
-- 
2.25.1

