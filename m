Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7FEC52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A75610E9E4;
	Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGPydKFq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3036410E9E2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 19:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723231120; x=1754767120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GJIarnroTJyq9ihU46Iz6cbxiJZLJJ94cWHvMyIFftU=;
 b=mGPydKFqB+BO7URYw4ubI8xDp5L4qTwSYKSrPe4jCbPoQvw9pwBInexA
 0qho1LMKWD9z3jBJd2aDgoIe8UkQ2bVnR/pv2YQ81PlHPE8R7sVATEtq4
 hbH8QdHv/mW5mwGcoLr8GmEWvgpcY0IkUPioyVAFi8P0LAkGxm8sDs26m
 dyiJEie/Tq88J+S9be/xokGi4E/xBg3IZXB7UnseZ7h15lFZxlzgDwJPP
 2CwcmQhbERxLka5aYeb2xPDIosDtr8fxjpfSDV7eti4RajpxCAA9NC5/I
 ec2/lrs5pHlxrKcbdX3Mox+ZNyfvrw0zJ697OMryGFLoGxyijTqZvSLOU A==;
X-CSE-ConnectionGUID: XZxwjnaiT0+L++SGPXLc+Q==
X-CSE-MsgGUID: wchMvW0sT1expn/P+FZzBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32566813"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32566813"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:18:38 -0700
X-CSE-ConnectionGUID: LIgvSktSQI6lkd3Y0OSbJA==
X-CSE-MsgGUID: T5MIrXVJQsyC6BiNKSpWEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="88294754"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:18:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com
Subject: [PATCH 2/5] drm/xe: Reinit msg link when processing a message
Date: Fri,  9 Aug 2024 12:19:26 -0700
Message-Id: <20240809191929.3138956-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809191929.3138956-1-matthew.brost@intel.com>
References: <20240809191929.3138956-1-matthew.brost@intel.com>
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

Will help to avoid adding a static message twice.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index eea71c67cf2a..1c703e8423de 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -31,7 +31,7 @@ xe_sched_get_msg(struct xe_gpu_scheduler *sched)
 	msg = list_first_entry_or_null(&sched->msgs,
 				       struct xe_sched_msg, link);
 	if (msg)
-		list_del(&msg->link);
+		list_del_init(&msg->link);
 	xe_sched_msg_unlock(sched);
 
 	return msg;
-- 
2.34.1

