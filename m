Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E3F606A325
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 02:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BV2Gc1Ev
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41F310E69C;
	Wed, 18 Nov 2026 02:52:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F3010E5A9
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 02:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794970322; x=1826506322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FDP4KUBT+xaqY8lU5x2eGIGaSHGvCZCKn23nDzTw7D8=;
 b=BV2Gc1Ev/IsMc4q9idR6JHxNpgHFl+685rdGGHkjTglgh8ZwEuZkUfKq
 WUu8AEHofjg/HYPDq3HB+tl9uf0dJqcxYAKMs+KJBecZYKr/sEzO8xsYB
 thzhpir67A+7Z0I9dvlH1Admf59CGIKidLsEeU7rdx/8DeGTRCirQabHD
 cIw9mXh+1IkghP+1aTIRFnmVv7mfjTg6hdQD/DRQ6SPyhcB96hG4YyR39
 bDg/itbVvBn5Q3kqwz17r73Pqzn0SwS+iGH2HmQ9T3K0yLCGTRinhz5PM
 76Yqn9vgWycyJXfXMgKjjuU8TPaYvZp3nPwysYtoqwg26nJutGBtM1xGE w==;
X-CSE-ConnectionGUID: U18W2zteSamQQ1oxu+zlxw==
X-CSE-MsgGUID: RJtyPWh3TOa7h+kycfNKhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3614556"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3614556"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 18:51:52 -0800
X-CSE-ConnectionGUID: Lth+ydwYQN2oFr/QYIgf8w==
X-CSE-MsgGUID: z+dTv7O0Qb2qEKEgWRlj6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9889002"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 18:51:51 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: shekhar.chauhan@intel.com, harish.chegondi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v7 4/7] drm/xe/oa: Skip OA HW teardown on a wedged device
Date: Tue, 17 Nov 2026 18:51:45 -0800
Message-ID: <20261118025140.3782678-13-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118025140.3782678-9-umesh.nerlige.ramappa@intel.com>
References: <20261118025140.3782678-9-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Skip that HW access when the device is wedged. The OA disable also
cancels the poll timer, so cancel it when destroying the stream instead,
so that it's never left armed on a freed stream.

Skipping the HW teardown also skips the forcewake put, which accesses
the HW as well, leaking the forcewake reference. That is fine, the
device needs a reset or rebind to recover, which reinitializes
forcewake.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 3ddccc7e6f90..8ed427ad67b4 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -43,6 +43,7 @@
 #include "xe_sriov.h"
 #include "xe_sync.h"
 #include "xe_wa.h"
+#include "xe_wedge.h"
 
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
@@ -905,7 +906,12 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	mutex_destroy(&stream->stream_lock);
 
-	xe_oa_stream_hw_teardown(stream);
+	/* The poll timer may still be armed if the OA disable was skipped */
+	hrtimer_cancel(&stream->poll_check_timer);
+
+	if (!xe_wedged(stream->oa->xe))
+		xe_oa_stream_hw_teardown(stream);
+
 	xe_oa_free_oa_buffer(stream);
 	xe_oa_stream_free_resources(stream);
 }
@@ -1704,7 +1710,8 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 {
 	xe_pm_runtime_get(gt_to_xe(stream->gt));
 
-	if (stream->enabled)
+	/* A wedged device may be unresponsive, skip HW access */
+	if (stream->enabled && !xe_wedged(gt_to_xe(stream->gt)))
 		xe_oa_disable_locked(stream);
 
 	xe_oa_stream_destroy(stream);
-- 
2.55.0

