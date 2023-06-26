Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC76EB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FF110E1E1;
	Mon, 26 Jun 2023 10:51:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DFD10E1E7
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687776677; x=1719312677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZOpx1Rr7YZJmeL5LZZHlQoRP2AQZoeYg2K7BvFUdR9A=;
 b=h82j0A9ayms2jkZTABHD1BMhLTCCr0r/wzqfajhD00rEeKW3wfX0AQ99
 EcajURj+fb7vTDHMHzb2GV8o2mNacuOdItoBTx/QHRv0VRLLDpXpmJmrv
 U2NEkqb+WIJXa9M87EEULWvQkmMVZlcwU27J3YVDj8kYP/fdKZFZ/MP1c
 ZAhe2zUPl5HR0+14itsAI3lkOjW37i7AK5VQnXxYi3IPePV7nTXqP68r4
 JxI6Yhw3fUU/+Mqls5+/U9SlFOw/zk+BjBNZIGjYpxUwL+fWo641merdp
 v7p9ljYZIY6qYflAAGXtG4I1GBxMF2M+OuyejbmvTsI71PDHjcqQfM1Hs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361279999"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361279999"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="829182846"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="829182846"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 11:50:48 +0100
Message-ID: <20230626105037.43780-25-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626105037.43780-15-matthew.auld@intel.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v12 10/13] drm/xe: drop
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
index 421bb72b2868..2fba5bbe02ed 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -607,14 +607,10 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
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

