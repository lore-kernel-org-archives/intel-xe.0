Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D88C41535
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 16:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F217210E619;
	Tue,  7 Nov 2023 16:16:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1695810E614
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699373776; x=1730909776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+lYgmgygOKKQCCgzbEePfclqujQ9xyGAUPyHuTDqzsY=;
 b=HaULATRznjTngT3BlljydDXIoUzlTfWwL+JVirHEQOLG8J/2yjV7Ad/f
 DImbmxkaLl0SwPOTFy/9D54aa6x9woW8W5mXgDY3NA5IyswL0yOvZNLVF
 D5RvodFGgCMVh/cx1OiFqe2Ih2ENSmPUIbhH7LbV6gIS4LTARv/zyuaCO
 5v2i5Ao2+E4+pTl1+5oikLjnfFAL3ZX7tpfm5MBd2SI//grGSld2X47fD
 bHHblTXDFhkHT3D91SXCGe2wnA8EiZkMLL7trZEGdkDhUvAWaYnlCrYMf
 CIZGcZplZ5Ey8M0/68g53C2jf15NuT2fyIeXYiNCmsOKwscGrWpanA+To w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="386719721"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="386719721"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:16:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="797709678"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="797709678"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:16:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  7 Nov 2023 08:16:22 -0800
Message-Id: <20231107161623.135419-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107161623.135419-1-matthew.brost@intel.com>
References: <20231107161623.135419-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] drm/xe: Fix alignment in GuC exec queue
 state defines
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
index 0ca2e06d591d..9e1269dc1e5c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -60,11 +60,11 @@ exec_queue_to_guc(struct xe_exec_queue *q)
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

