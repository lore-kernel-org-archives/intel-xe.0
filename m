Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F556C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 11:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0BF10E239;
	Mon, 17 Jul 2023 11:25:51 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1475510E239
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 11:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689593149; x=1721129149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OEa3At+N6ez9yf8yyMvxXR0iZrkPsTWbOU8oks76s3A=;
 b=GLCnt71psOVVp7c/3xk6vqPMGz/qFIV4XlFacd1m/6WfZJOBOSfd145p
 GkNiN8L/HZ47/F/X9Wr2EaYNdqx9KPrA8lap72WHlqYPxAU8359PeK3Uu
 XDo1X/zt3/Ag3gnKtRdml6s6kJyA2v5AG+HZ0AeHNbioBKyY2EH88Zc3n
 ckWlYzkCK6PWe1J8VXa7HL3bfPkTfLUC6QORsddAF/+QZ1MFDzu8AEs++
 BwQwYDHHYVS3Xn+o3cj5eLa9BVCq07nc6ASqAiGUaEyaY8MwE3+CA8uSS
 x+NumpT13A2yVJD88gSaAB8st4x5IRD2Q2P9mDQ/jsMx0/3HxZYhCvkCL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="365948492"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="365948492"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:25:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="897174872"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="897174872"
Received: from kprutko-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.224])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:25:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jul 2023 12:25:10 +0100
Message-ID: <20230717112502.32379-19-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717112502.32379-12-matthew.auld@intel.com>
References: <20230717112502.32379-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v14 07/10] drm/xe: drop
 xe_device_mem_access_get() from guc_ct_send
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The callers should already be holding the mem_access reference, before
calling into this.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7200343330fa..d65cb33c1512 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -625,14 +625,10 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	XE_BUG_ON(g2h_len && g2h_fence);
 
-	xe_device_mem_access_get(ct_to_xe(ct));
-
 	mutex_lock(&ct->lock);
 	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
 	mutex_unlock(&ct->lock);
 
-	xe_device_mem_access_put(ct_to_xe(ct));
-
 	return ret;
 }
 
-- 
2.41.0

