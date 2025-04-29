Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF17C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 14:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB2B10E0C2;
	Tue, 29 Apr 2025 14:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dyz0etqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B01D10E0C2
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745936093; x=1777472093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tGRvK7U6rTGeazUEQj+GlY1rI9nCWyOOzDfaByjDeqI=;
 b=dyz0etqaEKZk/s4YnGgrjXiUjSxGUa7OMplOSbnWr8z1VVj0M83Hpr4F
 v0LaeEzvn8NXJIvtY78pHc3+UMr36HA4fuWMzxlixdwC5yyP6sObjK8iQ
 mflgN/f92GyfP2CEHwsfErLxkCUZg4YEs/Ht0XvWmlM48lmyXCQBlUBaV
 6ADwzRS83XnQ+1FYu6gf3d1iEOvnZn2qqKG7bXLNUlpzlMCgAeJCL9WsZ
 fchgrTcyyKvsLvf7+Amw5mvbG6VorAzdNfJXr40isn2xnQQrmHZx9xW5n
 VgVP8haMcglqnrrg63+CmP2B5lvC46JtO7w3ABqyi1RuB30L/V56N3iZ8 g==;
X-CSE-ConnectionGUID: DKb/WMd8TkyjcGdf7boxFg==
X-CSE-MsgGUID: co2agiDaTgaMz3wxKsM73A==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47471429"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47471429"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 07:14:52 -0700
X-CSE-ConnectionGUID: n3hSrnAtSs+3SmRfN37iHA==
X-CSE-MsgGUID: qtLUQEUMSAmxnfOEVR6P2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="133737718"
Received: from intelmailrelay-02.habana-labs.com ([10.111.11.21])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 07:14:51 -0700
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 SMTP id 53TEEgjv1821898; Tue, 29 Apr 2025 17:14:42 +0300
Date: Tue, 29 Apr 2025 17:14:42 +0300
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/xe: upon page fault, use generic uc fw
 instead of guc
Message-ID: <lavciajcxm5sxdhq7a272l7zrn3l3qmv4gazx67asmelieqsbp@pds2yn254djq>
References: <20250218112702.262780-1-dafna.hirschfeld@intel.com>
 <20250218112702.262780-2-dafna.hirschfeld@intel.com>
 <aA/tNSnOE2uWjNgI@lstrano-desk.jf.intel.com>
 <4mlwidurvhnl3pimzg4qlczo6raiyiq2kc6lgbhdhoup4qmz3l@3ajazrvqcs4i>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <4mlwidurvhnl3pimzg4qlczo6raiyiq2kc6lgbhdhoup4qmz3l@3ajazrvqcs4i>
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

On 29.04.2025 15:49, Dafna Hirschfeld wrote:
>On 28.04.2025 14:03, Matthew Brost wrote:
>>On Tue, Feb 18, 2025 at 01:27:02PM +0200, Dafna Hirschfeld wrote:
>>>Future asic will have different firmware to handle page faults.
>>>Change the code in xe_gt_pagefault.c to use xe_uc_fw instead of
>>>xe_guc and add a callback to struct xe_uc_fw to send the page
>>>fault replay to the fw.
>>>
>>
>>I think this is on the right track - the current code is clearly layered
>>incorrectly.
>>
>>>Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_gt_pagefault.c | 24 ++++--------------------
>>> drivers/gpu/drm/xe/xe_gt_pagefault.h |  6 +++---
>>> drivers/gpu/drm/xe/xe_gt_types.h     |  2 ++
>>> drivers/gpu/drm/xe/xe_guc.c          | 15 +++++++++++++++
>>> drivers/gpu/drm/xe/xe_guc_ct.c       |  8 ++++----
>>> drivers/gpu/drm/xe/xe_uc_fw_types.h  |  5 +++++
>>> 6 files changed, 33 insertions(+), 27 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>index 51c4bcc769d2..c1e076e14219 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>@@ -11,13 +11,10 @@
>>> #include <drm/drm_exec.h>
>>> #include <drm/drm_managed.h>
>>>
>>>-#include "abi/guc_actions_abi.h"
>>> #include "xe_bo.h"
>>> #include "xe_gt.h"
>>> #include "xe_gt_stats.h"
>>> #include "xe_gt_tlb_invalidation.h"
>>>-#include "xe_guc.h"
>>>-#include "xe_guc_ct.h"
>>
>>Yes, removing all GuC specific code in xe_gt_pagefaul.c is a good idea.
>>
>>> #include "xe_migrate.h"
>>> #include "xe_trace_bo.h"
>>> #include "xe_vm.h"
>>>@@ -246,18 +243,6 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>> 	return err;
>>> }
>>>
>>>-static int send_pagefault_reply(struct xe_guc *guc,
>>>-				struct xe_uc_pagefault_reply *reply)
>>>-{
>>>-	u32 action[] = {
>>>-		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
>>>-		reply->dw0,
>>>-		reply->dw1,
>>>-	};
>>>-
>>>-	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>>>-}
>>>-
>>> static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
>>> {
>>> 	drm_dbg(&xe->drm, "\n\tASID: %d\n"
>>>@@ -322,9 +307,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
>>> 		PF_MSG_LEN_DW;
>>> }
>>>
>>>-int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>+int xe_pagefault_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len)
>>
>>s/xe_pagefault_handler/xe_gt_pagefault_handler/
>>
>>I think this needs a interface refactor.
>>
>>This is still assuming the 'msg' field will be the same format across
>>firmwares which I don't think is a assumption we can safely make.
>>
>>> {
>>>-	struct xe_gt *gt = guc_to_gt(guc);
>>> 	struct xe_device *xe = gt_to_xe(gt);
>>> 	struct pf_queue *pf_queue;
>>> 	unsigned long flags;
>>>@@ -336,6 +320,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>
>>> 	asid = FIELD_GET(PFD_ASID, msg[1]);
>>> 	pf_queue = gt->usm.pf_queue + (asid % NUM_PF_QUEUE);
>>>+	pf_queue->fw = fw;
>>>
>>
>>This doesn't work as if you have multiple FWs queuing up page faults
>>this could be pointing to the wrong firmware by the time the fault is
>>processed.
>
>right, but this will work if setting the FW is inside the condition 'if (!full)' right?

oh, I see now , we have 'data' holding a queue of different msg opaques that might come
from different firmwares

Dafna

>
>>
>>> 	/*
>>> 	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
>>>@@ -390,7 +375,7 @@ static void pf_queue_work_func(struct work_struct *w)
>>> 			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
>>> 			FIELD_PREP(PFR_PDATA, pf.pdata);
>>>
>>>-		send_pagefault_reply(&gt->uc.guc, &reply);
>>
>>I also don't think it is the job GT page fault layer to encode the
>>response to the firmware as that could be different between firmwares
>>too.
>>
>>So roughly I think we something along these lines...
>>
>>- The firmwares parse the fields which GT page fault handler needs to
>> understand (page_addr, asid, access_type) and passing these in as
>> arguments to xe_gt_pagefault_handler
>>- The original FW message is also passed in, we define max length for
>> this, this is just opaque data to GT page fault layer
>>- The firmware passes in vfunc for send_pagefault_reply, this accepts
>> original FW message + pass / fail value so the firmware can encode the
>> reply
>
>Why pass a vfunc instead of the FW itself like I did in this patch?
>If we pass a vfunc, then it should also accept a pointer to the FW right?
>
>Thanks,
>Dafna
>
>
>>- All the above is stored in a pf_queue entry
>>- Internally in GT page fault layer we drop looking at firmware specifc
>> 'struct pagefault' rather the new format which encodes page_addr,
>> asid, access_type, the reply vfunc, and opaque firmware data.
>>
>>This will be more data in the pf_queue but it makes the GT page fault
>>layer truly opaque to any firmware interfaces.
>>
>>Does this make sense?
>>
>>Matt
>>
>>>+		pf_queue->fw->send_pagefault_reply(gt, pf_queue->fw, &reply);
>>>
>>> 		if (time_after(jiffies, threshold) &&
>>> 		    pf_queue->tail != pf_queue->head) {
>>>@@ -664,9 +649,8 @@ static bool acc_queue_full(struct acc_queue *acc_queue)
>>> 		ACC_MSG_LEN_DW;
>>> }
>>>
>>>-int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>+int xe_access_counter_notify_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len)
>>> {
>>>-	struct xe_gt *gt = guc_to_gt(guc);
>>> 	struct acc_queue *acc_queue;
>>> 	u32 asid;
>>> 	bool full;
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
>>>index 839c065a5e4c..0c01af3b7124 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
>>>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
>>>@@ -9,11 +9,11 @@
>>> #include <linux/types.h>
>>>
>>> struct xe_gt;
>>>-struct xe_guc;
>>>+struct xe_uc_fw;
>>>
>>> int xe_gt_pagefault_init(struct xe_gt *gt);
>>> void xe_gt_pagefault_reset(struct xe_gt *gt);
>>>-int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
>>>-int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len);
>>>+int xe_pagefault_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len);
>>>+int xe_access_counter_notify_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len);
>>>
>>> #endif	/* _XE_GT_PAGEFAULT_ */
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>>index 6e66bf0e8b3f..73f7bd044828 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>@@ -249,6 +249,8 @@ struct xe_gt {
>>> 		struct pf_queue {
>>> 			/** @usm.pf_queue.gt: back pointer to GT */
>>> 			struct xe_gt *gt;
>>>+			/** @usm.pf_queue.fw the fw that handles the pf */
>>>+			struct xe_uc_fw *fw;
>>> 			/** @usm.pf_queue.data: data in the page fault queue */
>>> 			u32 *data;
>>> 			/**
>>>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>index 1619c0a52db9..1ea3678f1463 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>>@@ -5,6 +5,7 @@
>>>
>>> #include "xe_guc.h"
>>>
>>>+#include "xe_uc_fw_types.h"
>>> #include <drm/drm_managed.h>
>>>
>>> #include <generated/xe_wa_oob.h>
>>>@@ -642,6 +643,19 @@ static int vf_guc_init(struct xe_guc *guc)
>>> 	return 0;
>>> }
>>>
>>>+static int send_pagefault_reply(struct xe_gt *gt, struct xe_uc_fw *fw,
>>>+				struct xe_uc_pagefault_reply *reply)
>>>+{
>>>+	struct xe_guc *guc = container_of(fw, struct xe_guc, fw);
>>>+	u32 action[] = {
>>>+		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
>>>+		reply->dw0,
>>>+		reply->dw1,
>>>+	};
>>>+
>>>+	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>>>+}
>>>+
>>> int xe_guc_init(struct xe_guc *guc)
>>> {
>>> 	struct xe_device *xe = guc_to_xe(guc);
>>>@@ -652,6 +666,7 @@ int xe_guc_init(struct xe_guc *guc)
>>> 	ret = xe_uc_fw_init(&guc->fw);
>>> 	if (ret)
>>> 		goto out;
>>>+	guc->fw.send_pagefault_reply = &send_pagefault_reply;
>>>
>>> 	if (!xe_uc_fw_is_enabled(&guc->fw))
>>> 		return 0;
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>index 72ad576fc18e..14ff5f255d45 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>@@ -1293,15 +1293,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>> 								 adj_len);
>>> 		break;
>>> 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
>>>-		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
>>>+		ret = xe_pagefault_handler(gt, &guc->fw, payload, adj_len);
>>> 		break;
>>> 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
>>> 		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
>>> 							   adj_len);
>>> 		break;
>>> 	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
>>>-		ret = xe_guc_access_counter_notify_handler(guc, payload,
>>>-							   adj_len);
>>>+		ret = xe_access_counter_notify_handler(gt, &guc->fw, payload,
>>>+						       adj_len);
>>> 		break;
>>> 	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
>>> 		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
>>>@@ -1494,7 +1494,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>
>>> 	switch (action) {
>>> 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
>>>-		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
>>>+		ret = xe_pagefault_handler(gt, &guc->fw, payload, adj_len);
>>> 		break;
>>> 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
>>> 		__g2h_release_space(ct, len);
>>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>index d8714ccb3f78..4d82430e3274 100644
>>>--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>@@ -9,6 +9,7 @@
>>> #include <linux/types.h>
>>>
>>> struct xe_bo;
>>>+struct xe_gt;
>>>
>>> /*
>>>  * +------------+---------------------------------------------------+
>>>@@ -228,6 +229,10 @@ struct xe_uc_fw {
>>>
>>> 	/** @private_data_size: size of private data found in uC css header */
>>> 	u32 private_data_size;
>>>+
>>>+	/** a callback to send the page fault replay to the fw */
>>>+	int (*send_pagefault_reply)(struct xe_gt *gt, struct xe_uc_fw *xe_fw,
>>>+				    struct xe_uc_pagefault_reply *reply);
>>> };
>>>
>>> #endif
>>>--
>>>2.34.1
>>>
