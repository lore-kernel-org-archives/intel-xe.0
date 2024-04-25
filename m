Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC70C10F15
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 23:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9575110F201;
	Thu, 25 Apr 2024 23:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NcMcCW0M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605A110F201
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 23:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714087530; x=1745623530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D5FZeE0IouJ6cq7DvhagdRIQ0pkR3MaLuKHzMqfKe0E=;
 b=NcMcCW0MLHWXDmoWZepxEFU417f8+eUlabAkTgpIYd7qZbImFSKFenQm
 AcSGd7kDSsh+yuGrZEOZL8fRjPMMlzM5nHYpE1k+ZLua7xDTxqMpaZNQy
 3Sa3XLKQ6KFksEM9UrTEqSOJkbTJoJu78/MuwYyNPMh/r8jWr3K77ryTr
 6Ssfk/9JfoBWIFdM7HwfOQAYWouvA1Pk+PKiQNej9IsdFajxcLfmUQB0l
 JgCZGeXqBRMY1Jc+lSfg+adcDwerXTaXQ97mwzg/9sqoUc242Eq/H0vJC
 ZQiCbrdfSobpHHqb20tq0pa6MklPxTFjPZTsEN2wFmr1s8jT8qKMiNpjZ w==;
X-CSE-ConnectionGUID: s8RDCxNeTPOBkRbZ2pcklg==
X-CSE-MsgGUID: 7+qWJCr0TCyayZPh3fISGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9970878"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9970878"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 16:25:16 -0700
X-CSE-ConnectionGUID: +kH7m+I9Q+WOiVbeQce67w==
X-CSE-MsgGUID: IVKOA1JSSSqsjVD3HHxaUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56411989"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 16:25:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 3/5] drm/xe: s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
Date: Thu, 25 Apr 2024 16:25:42 -0700
Message-Id: <20240425232544.1935578-4-matthew.brost@intel.com>
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
index 5dab20fa6d74..d4aa3823410c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -58,7 +58,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
 #define EXEC_QUEUE_STATE_SUSPENDED		(1 << 5)
 #define EXEC_QUEUE_STATE_RESET		(1 << 6)
-#define ENGINE_STATE_KILLED		(1 << 7)
+#define EXEC_QUEUE_STATE_KILLED			(1 << 7)
 #define EXEC_QUEUE_STATE_WEDGED		(1 << 8)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
@@ -168,12 +168,12 @@ static void set_exec_queue_reset(struct xe_exec_queue *q)
 
 static bool exec_queue_killed(struct xe_exec_queue *q)
 {
-	return atomic_read(&q->guc->state) & ENGINE_STATE_KILLED;
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_KILLED;
 }
 
 static void set_exec_queue_killed(struct xe_exec_queue *q)
 {
-	atomic_or(ENGINE_STATE_KILLED, &q->guc->state);
+	atomic_or(EXEC_QUEUE_STATE_KILLED, &q->guc->state);
 }
 
 static bool exec_queue_wedged(struct xe_exec_queue *q)
@@ -189,7 +189,7 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
 static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 {
 	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
-		(EXEC_QUEUE_STATE_WEDGED | ENGINE_STATE_KILLED));
+		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED));
 }
 
 #ifdef CONFIG_PROVE_LOCKING
-- 
2.34.1

