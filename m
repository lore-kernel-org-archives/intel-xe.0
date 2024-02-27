Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B5BC54E41
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 02:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD02710F299;
	Tue, 27 Feb 2024 02:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MY1aoCcX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E956A10F297
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 02:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709001809; x=1740537809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hx/FPfdqCeOLk1ZbFyyflEicaTf4uHg2be8xh084gYk=;
 b=MY1aoCcXQvqXATCCThjvvpIh9ttQye3aavhi6NvHHJVK5649HHE/u/Gq
 iu08yoyu2/Cvkyt6H++ZUKQUeI1ZKu76ZLUBXsINwuZQoSPlptRZDY7ES
 ZWgeWDV8/tp3r7sarlp8yB2tNjlqWYrjsD7qJdP8u0Xi8eMwVvZyH31Lo
 othS4w1d1NH4rXvkoMgRRZNtUTCgho/6NtvZ6ImbOSNp26oiUp33N9H6V
 IgND5bzwO+dUR1YQyGyeMR8IueLZK2H1lrklLHHdP4NiR8mq5c2frr0uW
 ygJCd7dQeaVuWvrwMfDoLN2ZJiy1ypQiU9GnhCF7u1hjjAUv9mkfaivXq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6275538"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6275538"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 18:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7094014"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 18:43:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/3] drm/xe: Validate user fence during creation
Date: Mon, 26 Feb 2024 18:43:36 -0800
Message-Id: <20240227024337.141585-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227024337.141585-1-matthew.brost@intel.com>
References: <20240227024337.141585-1-matthew.brost@intel.com>
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

Fail invalidate addresses during user fence creation.

Fixes: dd08ebf6c352 drm/xe: ("Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index da8799bf7237..022e158d28d9 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -52,14 +52,18 @@ static struct user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 					    u64 value)
 {
 	struct user_fence *ufence;
+	u64 __user *ptr = u64_to_user_ptr(addr);
+
+	if (!access_ok(ptr, sizeof(ptr)))
+		return ERR_PTR(-EFAULT);
 
 	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
 	if (!ufence)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	ufence->xe = xe;
 	kref_init(&ufence->refcount);
-	ufence->addr = u64_to_user_ptr(addr);
+	ufence->addr = ptr;
 	ufence->value = value;
 	ufence->mm = current->mm;
 	mmgrab(ufence->mm);
@@ -181,8 +185,8 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		} else {
 			sync->ufence = user_fence_create(xe, sync_in.addr,
 							 sync_in.timeline_value);
-			if (XE_IOCTL_DBG(xe, !sync->ufence))
-				return -ENOMEM;
+			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
+				return PTR_ERR(sync->ufence);
 		}
 
 		break;
-- 
2.34.1

