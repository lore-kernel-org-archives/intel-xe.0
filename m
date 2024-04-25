Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6977C10F15
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 05:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAD211A166;
	Thu, 25 Apr 2024 05:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpeYHRtL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D5A11A164
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 05:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714024493; x=1745560493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gLtePbMbikO6sNjM2f9J+7xqpZpToAF0fC3CtI6sh7I=;
 b=JpeYHRtL1C/fxQbXaeQ6IcxixrfnQESCZtKIrC81Ot9HXXu+1i+9JsVP
 5wIvCcqrDxFjFVRwRTRvw+QhoM+OCmp1ETUSZrCDPNSz9hKt6DQAgclae
 CpEiGKvko31xo/c+Ypst+8SNz/xZpDE7dfWajhGPUyZ9xUOa5YeH23S5b
 6Xoz5ExJWFPP0KM6gxrruqDlNidzDdedXdje7W00Fy0bIp9sTz8g9FAR+
 5Y8/UZ5SquwxlHI0dU+/1lxAY4jtyyzQoiW8PcIb3oqZ5aDwKwNbpGGYm
 3vxfrVh6t8SOg47GkG6B/AqvEIz73I4+4JEVdGIi97O/wQWHYLsiErxB1 A==;
X-CSE-ConnectionGUID: aSxGRnxPSYSHm0YkGVjeHw==
X-CSE-MsgGUID: gHm+xfUMS3KnOqoOwK2TQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9554287"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9554287"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:54:52 -0700
X-CSE-ConnectionGUID: BnxJGOe7SCiQQszMI4lMVQ==
X-CSE-MsgGUID: JzOekSC5SWKXwj1Ga8DaCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="55894784"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/5] drm/xe: Fix alignment in GuC exec queue state defines
Date: Wed, 24 Apr 2024 22:55:21 -0700
Message-Id: <20240425055522.1919005-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425055522.1919005-1-matthew.brost@intel.com>
References: <20240425055522.1919005-1-matthew.brost@intel.com>
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

Normalize the aligment for readability.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 19f92a107342..28c1b9b46251 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -53,11 +53,11 @@ exec_queue_to_guc(struct xe_exec_queue *q)
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
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
-- 
2.34.1

