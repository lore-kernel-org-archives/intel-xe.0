Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03749C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 08:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC40010F0A4;
	Wed, 20 Mar 2024 08:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knZdmbTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08C610F0A4
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 08:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710922808; x=1742458808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JG8f2Q3csPj9tdsRFsZbZ7+iQHKuewdw58EIDaKMKHA=;
 b=knZdmbTLB1C9LrUtDE3ghM76EW7qH3cgPdWkVwm2Sc3dKPEgYEHjnqvH
 lG8Lh/sReFCwTjRAf57FY+pxEN6dhu0z9c5GZqEFIRIcNdearuJaX3JcF
 s0HivpPYzGJxz3s17PBwJ9j53I9am7cFkXnhq/go+hg5+bifzCRxZigDV
 vq6JkswcwesqI2578v18P+AdwCHv5UvjC6ZY6yQlyHXzYromnyQ8mehQU
 d47G8WtLzOGhgbqR7Cee9tBrpI5AkpYeiwsOzbyLNgT05ASj6uSALIjkO
 9TN6uKcWEOho230gjDtIh7N+iNLbFPr2s2kWQybmaPGH6uhMUsBL5bfjR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="16976838"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="16976838"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 01:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="14108791"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa009.jf.intel.com with ESMTP; 20 Mar 2024 01:20:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Use USEC_PER_MSEC rather than the hard coding
Date: Wed, 20 Mar 2024 14:03:25 +0530
Message-Id: <20240320083325.3258720-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Use USEC_PER_MSEC rather than the hard coded value of 1000.

Static analyzer Reported "casting either timeout_ms or
1000U to type u64" to avoid overflow-before-widen.
Using USEC_PER_MSEC seems better and will help with static analyzer
report cleanup.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index b324dc2a5deb..627e094c7cbe 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -74,7 +74,7 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
 	xe_mmio_write32(gt, PCODE_MAILBOX, PCODE_READY | mbox);
 
 	err = xe_mmio_wait32(gt, PCODE_MAILBOX, PCODE_READY, 0,
-			     timeout_ms * 1000, NULL, atomic);
+			     timeout_ms * USEC_PER_MSEC, NULL, atomic);
 	if (err)
 		return err;
 
-- 
2.25.1

