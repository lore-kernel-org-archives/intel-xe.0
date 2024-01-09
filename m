Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31DBC47077
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 23:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E7610E540;
	Tue,  9 Jan 2024 23:01:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760A210E53D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 23:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704841294; x=1736377294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rGQCC0Dx/tMMi/wg5iupne9CJN7fpalUkzyiwc2wQVU=;
 b=iHHApZyIJNVIPuq73oFahTepM7i//MiXGBbWsB0Dem+wi1jVoj5x4w5w
 YiowsYUuaAtrDbpa7x/DAFos4t/5E0PCUMhf206OnmjdPIVyJ7L+m6fGE
 CqzXSEDEJj80Bk4ZEdUv8BLQjmvGQAIgHuPPv3HmJ3CsKjv8KfcWs+KxB
 Y4bPo3nza9tENwWNZosU/uNaPqgSV9sMGhqSbPOQ5QNjch8a0Wsm5Ugr7
 UaCeVU2yaI5CcmOJ1jfytd32J2hufs4n6L9jn378Xj+VdxHH6sJAu5efT
 JlPUnItNhWnyEqYcbZvKjmL0fn4UAyo1v966uu92jHDkCHyw2gk1d8ipB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5715500"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5715500"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="852344965"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="852344965"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:01:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 3/3] drm/xe/guc: Flush G2H handler when turning off CTs
Date: Tue,  9 Jan 2024 15:01:49 -0800
Message-Id: <20240109230149.1399302-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109230149.1399302-1-matthew.brost@intel.com>
References: <20240109230149.1399302-1-matthew.brost@intel.com>
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

Make sure G2H handler is not running when changing the CT state to drop
messages or disabled. This will help prevent races in the code ensuring
that G2H are not being processed after changing the state.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5b122a926ccf..6a2baa9034c8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -333,14 +333,21 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	return err;
 }
 
+static void flush_g2h_handler(struct xe_guc_ct *ct)
+{
+	cancel_work_sync(&ct->g2h_worker);
+}
+
 void xe_guc_ct_disable(struct xe_guc_ct *ct)
 {
 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
+	flush_g2h_handler(ct);
 }
 
 void xe_guc_ct_stop(struct xe_guc_ct *ct)
 {
 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
+	flush_g2h_handler(ct);
 	xa_destroy(&ct->fence_lookup);
 }
 
-- 
2.34.1

