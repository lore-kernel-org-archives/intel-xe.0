Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4D8CCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 21:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED26810E568;
	Mon, 27 Oct 2025 21:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezaQYgJy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5501B10E19A
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761601377; x=1793137377;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=h6Syx2ZGGn1Mlw3DwcwGlGaroCuNIx9Ukj+0L4VcF9M=;
 b=ezaQYgJyegcvANyLl+tY3iLZnUYhHgBz/YqAqJBAEQqpd2a/StGe6dTh
 VJcZmNxNZ0OOrQf+Lqd9IK87NCvpU/WgBYQdEO+5wZm2ayQ+3b+IgDvSS
 AE3iyxqTb0jBakzBNIk0PVam5gzbA2Ls9BLmXkyIX3LUX9NGY2JPvfcHk
 g/HbLPd/f32oFil25ZD1KZkmkLjIV/dUKTaP2Sssv2ej5jJLOQfBku/KK
 RLNeHzi1+ibjopc3ts+VGqU/dB4SOnI3iVDfiivRgMLZt56vRczj2RhfG
 03RYoBoZplP962e3usZgGI4lsWb5OhTC0q1w1MA4D9lbmZEMtHIR3346O Q==;
X-CSE-ConnectionGUID: F3OiDlTDQx+SE38fhV6X0g==
X-CSE-MsgGUID: E+nlbwqpTFSxGFh1NqIyIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74368848"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74368848"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:57 -0700
X-CSE-ConnectionGUID: gLZLR3GjRi66/2z5GzbGsw==
X-CSE-MsgGUID: KmbhFwGZQFKTsvVQ+GdCtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184782348"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 6/8] workqueue: Add ordered workqueue
Date: Mon, 27 Oct 2025 14:42:50 -0700
Message-Id: <20251027214252.2455093-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027214252.2455093-1-matthew.brost@intel.com>
References: <20251027214252.2455093-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/linux/workqueue.h | 1 +
 kernel/workqueue.c        | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index dabc351cc127..e03296bb1814 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -468,6 +468,7 @@ extern struct workqueue_struct *system_power_efficient_wq;
 extern struct workqueue_struct *system_freezable_power_efficient_wq;
 extern struct workqueue_struct *system_bh_wq;
 extern struct workqueue_struct *system_bh_highpri_wq;
+extern struct workqueue_struct *system_ordered_wq;
 
 void workqueue_softirq_action(bool highpri);
 void workqueue_softirq_dead(unsigned int cpu);
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 45320e27a16c..4d14d5e5fd38 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -527,6 +527,8 @@ struct workqueue_struct *system_bh_wq;
 EXPORT_SYMBOL_GPL(system_bh_wq);
 struct workqueue_struct *system_bh_highpri_wq;
 EXPORT_SYMBOL_GPL(system_bh_highpri_wq);
+struct workqueue_struct *system_ordered_wq __ro_after_init;
+EXPORT_SYMBOL(system_ordered_wq);
 
 static int worker_thread(void *__worker);
 static void workqueue_sysfs_unregister(struct workqueue_struct *wq);
@@ -7844,11 +7846,14 @@ void __init workqueue_init_early(void)
 	system_bh_wq = alloc_workqueue("events_bh", WQ_BH | WQ_PERCPU, 0);
 	system_bh_highpri_wq = alloc_workqueue("events_bh_highpri",
 					       WQ_BH | WQ_HIGHPRI | WQ_PERCPU, 0);
+	system_ordered_wq = alloc_ordered_workqueue("ordered_events",
+						    WQ_MEM_RECLAIM);
 	BUG_ON(!system_wq || !system_percpu_wq|| !system_highpri_wq || !system_long_wq ||
 	       !system_unbound_wq || !system_freezable_wq || !system_dfl_wq ||
 	       !system_power_efficient_wq ||
 	       !system_freezable_power_efficient_wq ||
-	       !system_bh_wq || !system_bh_highpri_wq);
+	       !system_bh_wq || !system_bh_highpri_wq ||
+	       !system_ordered_wq);
 }
 
 static void __init wq_cpu_intensive_thresh_init(void)
-- 
2.34.1

