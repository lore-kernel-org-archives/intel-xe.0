Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D695CCE7AF3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A855410E148;
	Fri, 29 Sep 2023 20:38:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BAD10E143
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696019911; x=1727555911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QPbRovLsyd7xl9lxW1fbBBnW35wyIxd9wJhw7arvv3U=;
 b=ktmRxlF/PjPRVEeE4hVUdU090oVYBuR3Dn/sOZYdcqB+GJ4mUCJUrrk/
 xT47xIvgIfl62NBy512JdQsdkO/swQn6YAg6o791Q4iZBIp0kciZTaaV4
 0rf+ghKzmqFJt0nsoFIr3ywlScqBVuB42zeenoFZ6tbffnl6lcmFBTDUq
 AMsowxQ/KIb2URaa510dbVPk2ejO8419k9QOaQHGcO/parn7S1JKlDwkf
 Yh5pMbZmPm0Pk5seZWbItIQvRkwZ5aoD1K0txJINBmJ96c8tSmks3NjqO
 DJJlB4fXwmDrxUBiouY6T02TFj1UeNS6zV6LlKjm/p3Kv7dwi87OW8oPt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="448861743"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="448861743"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="743519900"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="743519900"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:06:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 29 Sep 2023 13:06:18 -0700
Message-Id: <20230929200618.3421234-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix exec queue usage for unbinds
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

Passing in a NULL exec queue to __xe_pt_unbind_vma results in the
migrate exec queue being used. This is not the intent from the VM bind
IOCTL, rather a NULL exec queue should use default VM exec queue.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 57ffac324564..26b9f2310c5e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1732,7 +1732,8 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 		if (!(vma->tile_present & BIT(id)))
 			goto next;
 
-		fence = __xe_pt_unbind_vma(tile, vma, q, first_op ? syncs : NULL,
+		fence = __xe_pt_unbind_vma(tile, vma, q ? q : vm->q[id],
+					   first_op ? syncs : NULL,
 					   first_op ? num_syncs : 0);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
-- 
2.34.1

