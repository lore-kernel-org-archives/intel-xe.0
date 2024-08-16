Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4448BC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 08:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E677A10E5DD;
	Fri, 16 Aug 2024 08:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i82eKm9/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C21A10E5DF
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 08:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723797506; x=1755333506;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CdwsKHIYtYJ2A1DDirGIxHnkfsaSSopKyiwtYPQCLu8=;
 b=i82eKm9/sklwN5U2HzJ5jpTLCy4pWlTYuusJb4roleMfatk4oD/x/RHR
 GeQ4lIsH83/uhf/JKBa967HI3E5HXmNV4gU8MUjowYO5VY3y0tJioi+ld
 ZfEyk+3zQtJOjS0IPuDB3dyFZwg73BvQjnCqawYgT0KlsWNdPPtMnOTsb
 262RlXJsECsIyunpbZfCJmCNLRAP3WnbW75+kMLlEs48bLzf37OIStowU
 aefwq/oInx8T/8LnDUBjU2UK+PizGAP9gDrHOQdOdZnsAn+1PaLACiXG3
 t5/21Iurs78rGZZjM2YhzC5fulCdoxEf+UvES70c1jTFYxhPk1Hi32a9z A==;
X-CSE-ConnectionGUID: tJVgqBTxQby1hCXbiUREgg==
X-CSE-MsgGUID: pWetnxJmSgy+iilPZBmbGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32660280"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="32660280"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 01:38:25 -0700
X-CSE-ConnectionGUID: ziSokZ/sSHi3QuNMYYaOxQ==
X-CSE-MsgGUID: fSXbMyytT/yEmkJj6qx/HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="90332575"
Received: from singhapo-nuc7i7bnh.iind.intel.com ([10.145.169.50])
 by orviesa002.jf.intel.com with ESMTP; 16 Aug 2024 01:38:24 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
Date: Fri, 16 Aug 2024 14:07:27 +0530
Message-Id: <20240816083727.897444-1-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Apoorva Singh <apoorva.singh@intel.com>

lrc->bo NULL check is not needed in xe_lrc_snapshot_capture() as
it is always initialized in xe_lrc_init()

Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 974a9cd8c379..aec7db39c061 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (!snapshot)
 		return NULL;
 
-	if (lrc->bo && lrc->bo->vm)
+	if (lrc->bo->vm)
 		xe_vm_get(lrc->bo->vm);
 
 	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
-- 
2.34.1

