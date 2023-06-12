Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5112FC88CB6
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 17:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3019610E2BF;
	Mon, 12 Jun 2023 17:14:55 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4032510E2BF
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 17:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686590090; x=1718126090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VTBBi6rtbkz4wzS3C3KeNIEnV9HfBkSIbuPqs7tvVmQ=;
 b=eyK6Q42gp21PjZ/vrFBbsjPGlklY4TYgjr/rOPsRdKyZu0XWp1/6yBsh
 2Y6+xxmcGAix95EAaIijJcWj23c14qE8mhBQH9Yq+ElRiZS26sMOpYeZQ
 7OnipKAPY1aEiltmK699/3Lcdq6kxQAiEvZy3OLdXcLRHw3/C+mMGbOe8
 o+qR9Abr0HXVim8ZxTLpKBVopPubt6IAG5CPvnNHvsM7oUC7S2iPT+3HQ
 BIefltMI8CdwJl7R5HrT4Egp6xu71W+5IdgOaXLtWysuavPnC0NcsralV
 2lrgilxnGfk3MZUF+k08Er1bFXbjEX/kWyqqe/Qmcf2sTtWsaMfSlanVV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342792804"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="342792804"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688715245"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="688715245"
Received: from mgutier2-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.22.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 12 Jun 2023 18:12:22 +0100
Message-Id: <20230612171225.88689-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612171225.88689-1-matthew.auld@intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v11 09/12] drm/xe: drop
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
index 839cd68704c3..4130eb94ceac 100644
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
2.40.1

