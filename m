Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71512EB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 14:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456EE10E641;
	Fri, 16 Jun 2023 14:14:07 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7B310E641
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 14:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686924845; x=1718460845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3hpobZFhiCsdcVneNCQXolXZDcFfcmHQqbG2tsa/Qg8=;
 b=FTJcNcdH2YTGNWr0CShtLDNd0gz/U11gf2Qk5u3KORcgZT3sUGz8h+Qq
 V3UE0FRrhBNSgnuwP1aMZMPkuZn67VcwguWK6MezSfY1jRQe4HNN3/vTE
 BdIrBXSJsuLpa6tiPD3LX2plYPlKmwWP1GAXwhid23NRSGr9eIR0OJMl3
 7+1svHflxaNVNwdfvqqyIfFHKqU4EkrCk+ykjC8JZspIrmwf05wR8YUYs
 f26nB7gBgbb/OcoGuZW1IQbhOudOU2x7rqH1oYxH9H8M58+K1yhHGTw69
 L5PplSbOQbEUBGa9PG6LAYvmXw43O6ogrDrIvN3Z9GFIO1OWaJVnGhKPC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="422872883"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="422872883"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="707113161"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="707113161"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:13:11 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jun 2023 19:41:14 +0530
Message-Id: <20230616141115.1128000-2-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230616141115.1128000-1-anshuman.gupta@intel.com>
References: <20230616141115.1128000-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/pm: Wrap pm_runtime_suspended with
 power.lock
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

pm_runtime_suspended() doc has requirement to use it with
PM lock of @dev to get the trusted value.
Wrap pm_runtime_suspended within xe_pm_runtime_suspended()
with proper locking.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b7b57f10ba25..04c5353ba870 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -210,11 +210,23 @@ int xe_pm_runtime_put(struct xe_device *xe)
 	return pm_runtime_put_autosuspend(xe->drm.dev);
 }
 
+static bool xe_pm_runtime_suspended(struct xe_device *xe)
+{
+	unsigned long flags;
+	bool suspended;
+
+	spin_lock_irqsave(&xe->drm.dev->power.lock, flags);
+	suspended = pm_runtime_suspended(xe->drm.dev);
+	spin_unlock_irqrestore(&xe->drm.dev->power.lock, flags);
+
+	return suspended;
+}
+
 /* Return true if resume operation happened and usage count was increased */
 bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
 {
 	/* In case we are suspended we need to immediately wake up */
-	if (pm_runtime_suspended(xe->drm.dev))
+	if (xe_pm_runtime_suspended(xe))
 		return !pm_runtime_resume_and_get(xe->drm.dev);
 
 	return false;
@@ -222,6 +234,6 @@ bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
 
 int xe_pm_runtime_get_if_active(struct xe_device *xe)
 {
-	WARN_ON(pm_runtime_suspended(xe->drm.dev));
+	WARN_ON(xe_pm_runtime_suspended(xe));
 	return pm_runtime_get_if_active(xe->drm.dev, true);
 }
-- 
2.38.0

