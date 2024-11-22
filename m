Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEB2E6916C
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 16:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482E510EBFE;
	Fri, 22 Nov 2024 16:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQOqlKp2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F13C10EBFE
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732292378; x=1763828378;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V4Kju0U5pOs2ndjd3cRqBoU1RCzVqKmOrkrOVwnOevg=;
 b=GQOqlKp2YcoPAZyuY4yW77cgygL8V9CsXkNu7wwLMAAL3MG7P4RE9+m0
 UDuFfdGYqiazTnwoxxrKfvTMJBW/lMXKibBic4Ne8lSYdIfWcoc8z5kd/
 f3IzqxNTWEtzeHrqEbHNuh/BHbazDaUJ3wX2OG03YU/wbYtsz8F89hxeK
 sq8DLApJ5NQdSxIMYXCE/sCq9REr3BSZ+SNATL0880+xOMaNTNHjnI5+C
 RSt2/asgPYgbenss0yNi4fwGsODYkifyygrer7b9rUfsiIgI0pufo7AR8
 JzVONmJJtM0f3FauR5zupph0QS2Ps2/pSlKmUZpp0P44+v2sonxxD4sJL Q==;
X-CSE-ConnectionGUID: iwxN4wLUSrCTifqOwm9rmA==
X-CSE-MsgGUID: um7luRseReyx8rKealS2ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32379402"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="32379402"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 08:19:38 -0800
X-CSE-ConnectionGUID: 6Vzjqq5nTTiydvDU71u3Eg==
X-CSE-MsgGUID: psBPyt/dRlmXvTJzP0iBVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="90782827"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.10])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 08:19:37 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/3] drm/xe/trace: improve xe_sched_msg trace
Date: Fri, 22 Nov 2024 16:19:15 +0000
Message-ID: <20241122161914.321263-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.0
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

Also include the gt_id, that way we can ignore duplicate guc_id across
different GTs when applying some filtering.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index de682978c4bf..d5281de04d54 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -284,6 +284,7 @@ DECLARE_EVENT_CLASS(xe_sched_msg,
 			     __string(dev, __dev_name_eq(((struct xe_exec_queue *)msg->private_data)))
 			     __field(u32, opcode)
 			     __field(u16, guc_id)
+			     __field(u8, gt_id)
 			     ),
 
 		    TP_fast_assign(
@@ -291,9 +292,11 @@ DECLARE_EVENT_CLASS(xe_sched_msg,
 			   __entry->opcode = msg->opcode;
 			   __entry->guc_id =
 			   ((struct xe_exec_queue *)msg->private_data)->guc->id;
+			   __entry->gt_id =
+			   ((struct xe_exec_queue *)msg->private_data)->gt->info.id;
 			   ),
 
-		    TP_printk("dev=%s, guc_id=%d, opcode=%u", __get_str(dev), __entry->guc_id,
+		    TP_printk("dev=%s, gt=%u guc_id=%d, opcode=%u", __get_str(dev), __entry->gt_id, __entry->guc_id,
 			      __entry->opcode)
 );
 
-- 
2.47.0

