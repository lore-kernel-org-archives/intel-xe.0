Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009FEC10F1A
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 23:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF7E10F1E6;
	Thu, 25 Apr 2024 23:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5RHzfuP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C8710F1E6
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 23:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714087530; x=1745623530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qw8/yYCL1/oF42nifZPYX+m0fXAD0eW1YeSNtxcehjo=;
 b=F5RHzfuPcXew3LbPKpbCTrGNKzVxp2XYI6mzAdoIU3WM31qGJRymVbWQ
 cv9Rq9S7CxcGEq/r+cT2xzYxTYJY6dpxZbHCDpFY9synEjjGkExOAwZwI
 AVGAe5aFXemy6HBDN1dG9IBjmawBTshmqor0Ln3ibgnQkVxQG9qjWdBpI
 3Kwg0C6kj909QEh/q36sn5HEd3CmM6b/OE4srdzMUTFGXZOjBVKeJSGIn
 jURNleWC8Sndph3szwwjDL/ro1R37eI1kBEygWBPE6IYuXgx/xEr3GuGV
 PmmSf6GfiWNpqoaFdgLFst+MtbJHd6wcFvCSBHeROytaHSMckw5DBo07Z A==;
X-CSE-ConnectionGUID: kNUw9K31SLWgMdXC7QTeFA==
X-CSE-MsgGUID: ViidkakNRky5hAFV6CNT/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9970875"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9970875"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 16:25:15 -0700
X-CSE-ConnectionGUID: CQbYLToIQ7qkIKJ9ghnWvw==
X-CSE-MsgGUID: 34+wzKXJSHChxtNOSngzVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56411980"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 16:25:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 1/5] drm/xe: s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
Date: Thu, 25 Apr 2024 16:25:40 -0700
Message-Id: <20240425232544.1935578-2-matthew.brost@intel.com>
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

Exec queue has replaced engine nomenclature.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8f409c9e0f3c..872a782337f2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -52,7 +52,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
  * engine done being processed).
  */
 #define EXEC_QUEUE_STATE_REGISTERED		(1 << 0)
-#define ENGINE_STATE_ENABLED		(1 << 1)
+#define EXEC_QUEUE_STATE_ENABLED		(1 << 1)
 #define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
 #define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
 #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
@@ -78,17 +78,17 @@ static void clear_exec_queue_registered(struct xe_exec_queue *q)
 
 static bool exec_queue_enabled(struct xe_exec_queue *q)
 {
-	return atomic_read(&q->guc->state) & ENGINE_STATE_ENABLED;
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_ENABLED;
 }
 
 static void set_exec_queue_enabled(struct xe_exec_queue *q)
 {
-	atomic_or(ENGINE_STATE_ENABLED, &q->guc->state);
+	atomic_or(EXEC_QUEUE_STATE_ENABLED, &q->guc->state);
 }
 
 static void clear_exec_queue_enabled(struct xe_exec_queue *q)
 {
-	atomic_and(~ENGINE_STATE_ENABLED, &q->guc->state);
+	atomic_and(~EXEC_QUEUE_STATE_ENABLED, &q->guc->state);
 }
 
 static bool exec_queue_pending_enable(struct xe_exec_queue *q)
-- 
2.34.1

