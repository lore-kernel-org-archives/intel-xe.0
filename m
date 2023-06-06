Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8E1C77B73
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 11:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EB310E351;
	Tue,  6 Jun 2023 11:59:09 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D002710E330
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 11:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686052747; x=1717588747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aKtTJqOcC/kFOYx0MZ5DrlBszAaPA20hJBFhpfEOows=;
 b=bOQYRig+HxdoNmOhpCoGgMh9eM3hEUDlMei/Ybv+u1aHf8ae8Vql/v9P
 ShwYmOIJtp6KmiJ4nvH7XJ0z5IbF2utkCiVMADebi7qchvZgZgYIJk9Et
 ptrIF1cQTWqFXMGz/0LMQnvHEEsH7bzg5BkBgymn6QZTnNnSAuso2t4Dt
 0pRj+Gx87ST9w7+8pOxW46aA8EcmcUmP7KiFUAwDfosJCD9Cq3ThC9jj3
 noNhTgj4dab5xvnqJWQEtjCI6yYmsb0ZbiHTy9kU0qfEmxqPr9wFL/xt8
 9Bnc5aKREpBkEXOXCWsh9p7+uK6MMEG+DDVNYYEpmfavpGrdFDM0gA4Pc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420189836"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="420189836"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738758367"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="738758367"
Received: from akurkina-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.4.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:59:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 12:58:39 +0100
Message-Id: <20230606115839.150075-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/pt: limit PS64 where supported
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

In theory shouldn't matter since BIT(8) appears to be ignored by older
HW, however seems odd to search for a suitable 64K chunk and enable PS64
when it is not supported by HW.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index bef265715000..86fafdb8d2d5 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -603,6 +603,9 @@ xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
 static bool
 xe_pt_is_pte_ps64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
 {
+	if (GRAPHICS_VERx100(tile_to_xe(xe_walk->tile)) < 1250)
+		return false;
+
 	/* Address is within an already found 64k region */
 	if (xe_walk->found_64K && addr - xe_walk->addr_64K < SZ_64K)
 		return true;
-- 
2.40.1

