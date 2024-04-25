Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40196C19F53
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 05:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E81711A167;
	Thu, 25 Apr 2024 05:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5bjgguI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D943311A165
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 05:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714024493; x=1745560493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WsKU0KSQ8oFeZQynVAHD/hY1QIb1i8perYRzzehE78s=;
 b=T5bjgguIbADWHzvVKsWvIzTektyUYZsJPAWOQqnjRf6Ert9cYqpDcamV
 8CwF/lFIdvPQuZFsG+SDpXZHJ3adk+B27JAPPdQOhPT6rBQ6/YE3c7aA8
 mud+Dp6BwLpesmkMS8sL8TZT1jmd8ndZU2Vmah4eqhWLJNGgPaAv4ptnu
 nbFLV65Ft/Film1HXFyNW/9sLEeq3KiDBJYKoOcdLDPLHYPWFFnqvaNiA
 kdDr+DWUb7oA62gnJT8Gh8rCRYJ+wzu1AILLaPzuuRb4Yj5S/hUWsX3Al
 bQnJ4eCxUhxYGVHcShGKCcJpqPAW7IQUa8g1jNcmcsGXJudsWaCvSF/3b g==;
X-CSE-ConnectionGUID: /t+wY/bFSBqYf4YmHEqZHQ==
X-CSE-MsgGUID: Vi7Dy31gRL2U1hu6isx2VQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9554286"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9554286"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:54:52 -0700
X-CSE-ConnectionGUID: 7a2ioI4kSFWX9DZkTGKA/w==
X-CSE-MsgGUID: rbZ8mg3nTPSTxvb926WDig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="55894780"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/5] drm/xe: s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
Date: Wed, 24 Apr 2024 22:55:20 -0700
Message-Id: <20240425055522.1919005-4-matthew.brost@intel.com>
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

Exec queue has replaced engine nomenclature.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b26f374ca20b..19f92a107342 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -58,7 +58,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
 #define EXEC_QUEUE_STATE_SUSPENDED		(1 << 5)
 #define EXEC_QUEUE_STATE_RESET		(1 << 6)
-#define ENGINE_STATE_KILLED		(1 << 7)
+#define EXEC_QUEUE_STATE_KILLED			(1 << 7)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -167,12 +167,12 @@ static void set_exec_queue_reset(struct xe_exec_queue *q)
 
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
 
 static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
-- 
2.34.1

