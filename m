Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F85EB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 11:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141D710E1E9;
	Mon, 19 Jun 2023 11:00:43 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069B810E1E8
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687172441; x=1718708441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bs6f2WtaPGz3v7mcbnkhouXRiAnSUmMbqBT92F6QT5I=;
 b=XPepOdKl4EuBSDsRpUkZQPDef5MxR3QI9OLWulS7mvuhURh5TFkEwI2j
 N4ZGR40aNmvQWJ/0pMmb6E30uUFSOwan4TMrlQCEcV4B3ZPURgqnR5Y3i
 oPeTbt/evpaZFHa7W0cE5RTREODL3YMPJDhxJ/pJ8DeWeGrInw995grQy
 6VecQDnx4rMKUvQC5paJHHpZQjiN4t8qZipfuflxJj/65EbWg3on6XkiE
 nvSs7BB5w4sGshHsHfdQu8fIo56cvRYWeYnFkSEGdT5QuZBLg0Ii4bJeZ
 MRBTUMI/Q61cStJi198N83GVI5HklsX7ErlIjSsu39IA18ctxmf6B8qrR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="339941717"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="339941717"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="803579274"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="803579274"
Received: from lsuareza-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.23.111])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:00:39 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 12:00:20 +0100
Message-ID: <20230619110018.53538-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230619110018.53538-8-matthew.auld@intel.com>
References: <20230619110018.53538-8-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 1/6] drm/xe/bo: consider bo->flags in
 xe_bo_migrate()
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

For VRAM allocations the bo->flags can control some characteristics of
the underlying memory, like whether it needs to be contiguous, and in
the future whether it needs to be in the CPU visible portion. Rather use
add_vram() in xe_bo_migrate() which should take care of such things for
us.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b9f4b61381ca..71a14e1f25be 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1852,6 +1852,7 @@ static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
  */
 int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
 {
+	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
@@ -1876,6 +1877,18 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
 	placement.placement = &requested;
 	placement.busy_placement = &requested;
 
+	/*
+	 * Stolen needs to be handled like below VRAM handling if we ever need
+	 * to support it.
+	 */
+	drm_WARN_ON(&xe->drm, mem_type == XE_PL_STOLEN);
+
+	if (mem_type_is_vram(mem_type)) {
+		u32 c = 0;
+
+		add_vram(xe, bo, &requested, bo->flags, mem_type, &c);
+	}
+
 	return ttm_bo_validate(&bo->ttm, &placement, &ctx);
 }
 
-- 
2.41.0

