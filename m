Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D79C74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 03:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898AD10E6C6;
	Tue, 21 Mar 2023 03:42:47 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8FA10E6C6
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 03:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679370166; x=1710906166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r9wWKUyFK5oWk2ZnVvV1JHjsyIy0QuCedK7Tj1cyhLw=;
 b=eJTwYtn/lSgYyB6dXuedBbNzrSb6TXY4pJB4q0FdrC3mjPz0q9b2n5jm
 vSrcU3IoBvRB5Fsk+0Kx7NRtC9W3skvVh3s7gIqrPKvgmC4OqXNwGKtM5
 Cg7JdrU6ZnvCI3UqPL4UiMZl08H66mZQUFJa6Jw8VtjaDYvSGGjZUXmZ8
 NsdmJdUg23zfxgPhXgx+w9VRKQzeeuliRwts6zL/AkXQpXrTTy35olTXT
 HMTAfMsHOLZzgLff72PYoNbHt63XhG3ukCW7afV+Fk14bazdRPOa0WrGZ
 ubXXSavCT4gjRGYVbHrKKXRwutssyGIXhtiEmnDNsR4UUuB/NyZ84pKmK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="322681938"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="322681938"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 20:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="631393319"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="631393319"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 20:42:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 20 Mar 2023 20:42:47 -0700
Message-Id: <20230321034247.666767-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix potential deadlock handling page
 faults
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

Within a class the GuC will hault scheduling if the head of the queue
can't be scheduled the queue will block. This can lead to deadlock if
BCS0-7 all have faults and another engine on BCS0-7 is at head of the
GuC scheduling queue as the migration engine used to fix tthe fault will
be blocked. To work around this set the migration engine to the highest
priority when servicing page faults.

v2 (Maarten): Set priority to kernel once at creation

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 77a6d71f6e89..546711a0ec39 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -359,6 +359,8 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
 		xe_vm_close_and_put(vm);
 		return ERR_CAST(m->eng);
 	}
+	if (xe->info.supports_usm)
+		m->eng->entity->priority = DRM_SCHED_PRIORITY_KERNEL;
 
 	mutex_init(&m->job_mutex);
 
-- 
2.34.1

