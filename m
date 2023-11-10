Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C8BC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 06:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DC610E699;
	Fri, 10 Nov 2023 06:26:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5CA10E699
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699597604; x=1731133604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GV07kQ3kLyp1jrHLIXHeKzbAQmz++oA9r5PHbbYUyWk=;
 b=O7CeU/BeQD7Zo2pwGEwxCOUwq8XeMl6svax1eEAuOyXCjxnO6lXgu5n2
 NTeLlPxe4pwNucr3I/gVLSDqcEOTWhhwCp5N+doxAWr058RLuR8SOB8R2
 BpsQU/6xV5cnRaMb/T+qWjJSngm7sk//LA/MREn7dIacjpjwyWV30xPw1
 YBMoGCy7xBnpkW1kK9p4FDz+l0REP6liozfJmv0y5R5h4Ar0dTEnxEm5f
 jeL9CU6Oz9Sxv5dWC/xxEzfcblQ5TbMOnVtD9SeCxUJK4y+b2CJeljXe7
 suSM2AM0rS7awSvTYZaaRS2xiDO/Acj2naR+gim8qM+OepqVTR8QpvyES g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="380530759"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="380530759"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 22:26:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="740072321"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="740072321"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 22:26:22 -0800
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 11:59:07 +0530
Message-Id: <20231110062907.3604598-1-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix lockdep warning in xe_force_wake
 calls
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

Use spin_lock_irqsave, spin_unlock_irqrestore

Fix for below:
[13994.811263] ========================================================
[13994.811295] WARNING: possible irq lock inversion dependency detected
[13994.811326] 6.6.0-rc3-xe #2 Tainted: G     U
[13994.811358] --------------------------------------------------------
[13994.811388] swapper/0/0 just changed the state of lock:
[13994.811416] ffff895c7e044db8 (&cpuctx_lock){-...}-{2:2}, at:
__perf_event_read+0xb7/0x3a0
[13994.811494] but this lock took another, HARDIRQ-unsafe lock in the
past:
[13994.811528]  (&fw->lock){+.+.}-{2:2}
[13994.811544]

               and interrupts could create inverse lock ordering between
them.

[13994.811606]
               other info that might help us debug this:
[13994.811636]  Possible interrupt unsafe locking scenario:

[13994.811667]        CPU0                    CPU1
[13994.811691]        ----                    ----
[13994.811715]   lock(&fw->lock);
[13994.811744]                                local_irq_disable();
[13994.811773]                                lock(&cpuctx_lock);
[13994.811810]                                lock(&fw->lock);
[13994.811846]   <Interrupt>
[13994.811865]     lock(&cpuctx_lock);
[13994.811895]
                *** DEADLOCK ***

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 32d6c4dd2807..9bbe8a5040da 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -145,9 +145,10 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 	struct xe_gt *gt = fw_to_gt(fw);
 	struct xe_force_wake_domain *domain;
 	enum xe_force_wake_domains tmp, woken = 0;
+	unsigned long flags;
 	int ret, ret2 = 0;
 
-	spin_lock(&fw->lock);
+	spin_lock_irqsave(&fw->lock, flags);
 	for_each_fw_domain_masked(domain, domains, fw, tmp) {
 		if (!domain->ref++) {
 			woken |= BIT(domain->id);
@@ -162,7 +163,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 				   domain->id, ret);
 	}
 	fw->awake_domains |= woken;
-	spin_unlock(&fw->lock);
+	spin_unlock_irqrestore(&fw->lock, flags);
 
 	return ret2;
 }
@@ -174,9 +175,10 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 	struct xe_gt *gt = fw_to_gt(fw);
 	struct xe_force_wake_domain *domain;
 	enum xe_force_wake_domains tmp, sleep = 0;
+	unsigned long flags;
 	int ret, ret2 = 0;
 
-	spin_lock(&fw->lock);
+	spin_lock_irqsave(&fw->lock, flags);
 	for_each_fw_domain_masked(domain, domains, fw, tmp) {
 		if (!--domain->ref) {
 			sleep |= BIT(domain->id);
@@ -191,7 +193,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 				   domain->id, ret);
 	}
 	fw->awake_domains &= ~sleep;
-	spin_unlock(&fw->lock);
+	spin_unlock_irqrestore(&fw->lock, flags);
 
 	return ret2;
 }
-- 
2.25.1

