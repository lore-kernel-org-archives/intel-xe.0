Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC1C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 18:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8458E10F697;
	Mon, 18 Mar 2024 18:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4PWFuKH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FA610F651
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710785156; x=1742321156;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qfqDoP6lgooiiuoiM31oL/exano1hKlnGXutUFfmQqs=;
 b=g4PWFuKHn6kQDG4+V361jSGOTTGqFm6puKyWhvvWhDZN8bPf1XPllbC6
 PgMyuOu6hxpuo5X/0jAsOrQOXZlF7OtyfhviMw+pnE+9/D/6dgtXYK5/I
 1RGMBbTJsL3hnzqgNbDmKlRhaeS/6MpgIYDyHaVVVlKRon1vcR/cD4GlR
 MgVqWfj6uxKvKRGZRKyTdv7PnW6ujokKjbl5QurqDKbqZDENXpAD0xoGc
 8LkMv8hgvxQraVoqHZauoJCtYr3Qve0Ze37p82vJ7F3GWiDGdl0Jhnm6C
 NLmdsfVvqgbkal5HkrM/ZqRLWs//TckQMckFMTjg+AHAMe9kHgqKtsrOj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16255910"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16255910"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13598133"
Received: from unknown (HELO mwauld-mobl1.intel.com) ([10.245.245.16])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:05:54 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 1/3] drm/xe/queue: fix engine_class bounds check
Date: Mon, 18 Mar 2024 18:05:33 +0000
Message-ID: <20240318180532.57522-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

The engine_class is the index into the user_to_xe_engine_class,
therefore it needs to be less than.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6a83bc57826a..2016c1af9633 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -440,7 +440,7 @@ find_hw_engine(struct xe_device *xe,
 {
 	u32 idx;
 
-	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
+	if (eci.engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
 		return NULL;
 
 	if (eci.gt_id >= xe->info.gt_count)
-- 
2.44.0

