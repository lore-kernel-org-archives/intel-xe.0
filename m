Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62706C10F15
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 23:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B4A1127B0;
	Thu, 25 Apr 2024 23:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJ+LF7ve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD6D10F1E6
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 23:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714087531; x=1745623531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZfO68dl/gkEnrW/PcblncXJBgFaOVpSOkZu6MFf0jKw=;
 b=UJ+LF7veU6eQ6A0yTnvU4kc3H5lHG4LBzmqfx1TFLAA1rHWTAv2KH/FO
 VN4BXl6yp//lt81A3vFZ1RKEqtoV4/EpXdB2MV5dvEFz69PGWyZ4Du2K7
 6wtGw8IT6i/Yb+SJ7dOezIOsZzLwQmxwIEjuydS/2/mSoPNcukEuqd+KG
 MdbUU6PD5At9oCtTXTfw3K4MUikh1VS7a75Z/NeDaVHuXxTaiswZxWaCW
 dALMbIX6WmMvPQH5c6zlnsALS95VcAzoK7toJF7V7WpcSQl1pb0G3vY2R
 HDuS9MUcF28BLzxtbEC34v36bl/KSyGcVkLLandO1Dfb6dGcsPxcGXNvZ w==;
X-CSE-ConnectionGUID: MvprF7G9QhWI0BX3pGmc3Q==
X-CSE-MsgGUID: O+wGXqfgQ56aUbeh8ylmjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9970879"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9970879"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 16:25:16 -0700
X-CSE-ConnectionGUID: n+GCciXMSI2P/cSLkdL4uA==
X-CSE-MsgGUID: Nj4e8ispSIGbeMBT87lP5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56411992"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 16:25:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 4/5] drm/xe: Fix alignment in GuC exec queue state defines
Date: Thu, 25 Apr 2024 16:25:43 -0700
Message-Id: <20240425232544.1935578-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425232544.1935578-1-matthew.brost@intel.com>
References: <20240425232544.1935578-1-matthew.brost@intel.com>
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

Normalize the alignment for readability.

v3:
 - Fix typo in commit (Himal)
 - Fix EXEC_QUEUE_STATE_WEDGED too (Himal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d4aa3823410c..1945bc5ffc21 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -53,13 +53,13 @@ exec_queue_to_guc(struct xe_exec_queue *q)
  */
 #define EXEC_QUEUE_STATE_REGISTERED		(1 << 0)
 #define EXEC_QUEUE_STATE_ENABLED		(1 << 1)
-#define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
+#define EXEC_QUEUE_STATE_PENDING_ENABLE		(1 << 2)
 #define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
 #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
 #define EXEC_QUEUE_STATE_SUSPENDED		(1 << 5)
-#define EXEC_QUEUE_STATE_RESET		(1 << 6)
+#define EXEC_QUEUE_STATE_RESET			(1 << 6)
 #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
-#define EXEC_QUEUE_STATE_WEDGED		(1 << 8)
+#define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
-- 
2.34.1

