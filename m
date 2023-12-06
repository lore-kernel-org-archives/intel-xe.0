Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1049C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 09:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01FB10E0C4;
	Wed,  6 Dec 2023 09:50:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B2B10E0C4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 09:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701856243; x=1733392243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9RdsMV8Lml92YqAMKBAmaeIF+bPbT/AYpj+ySAzbmCk=;
 b=ZuYD1rW2tqwGYYKbT7b5hsf6nbQl+2zj6a9EZkylmqfZ/LG8swtopOLX
 Lpr1a8eHxsgZd40Fwty4DA4qAYyCMddcCZHyrqs11Iaz64Uj5p+TytIMQ
 /BYWwttU61R7Cb7C8i8HUa4zwcmxOubuVGABomXlnqAzb79whJ8KRUdjD
 pekogcL2aEgdGIp2Zscu2izgAmsXHN4V6A9h4nFQYegBVIuucJNlEqWhg
 d34xB9v84LKnTzl9182eQPjKcRfsbuRnGzZvN5UFjYIWg7CSVJY9Ee3Wd
 NPc3GK4YR5djj2mxUTSbqg6KCf2aQf9DqMaceM6q2K1ETDPW7xC6zzqbI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396824246"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="396824246"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 01:50:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="12639842"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 01:50:42 -0800
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 15:23:18 +0530
Message-Id: <20231206095318.30326-1-aravind.iddamsetty@linux.intel.com>
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

v2: Use spin_lock in atomic context and spin_lock_irq in a non atomic
context (Matthew Brost)

v3: just use spin_lock_irqsave/restore

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>

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

