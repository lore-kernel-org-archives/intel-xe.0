Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15DBCCD189
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932C610E8ED;
	Wed,  8 Oct 2025 21:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjeY4yD5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3354410E8EA
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959943; x=1791495943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=91fGDIjEI+bf7GDKgyE18AfUMzubQ5JidOAf0iOP0ho=;
 b=hjeY4yD5SQdd1DzyLJRG+bQxZNKQ2oT6Tgv1H7sJIYuVshBt7jiac+/C
 M9p/32eRuglTZGGZOVlhEaSS1dYQi4Z42G5s/VjBhG9v5V8y5P7OqN5iZ
 y/RH6BdIf2QFdKOqi9TotlSoTS+NMNdOr90E9arJdaog36BqXdSgtcn8D
 LekwgiQ3I9sk7QvcR1OVcaprDVjbUhcMuk5U3yNl9DvtXMUT0KWu9KOT5
 7ksiOBXfKZE067DAbA7MB0VWm55NYUYxjzkWatd25/J3pJo7EG2fI4gPx
 gUfwCsSYLSkwomljaTA4QE1sRhw5lAxAWvKRTKzl8OZseduHEYxtCn8lG Q==;
X-CSE-ConnectionGUID: AOcQOrYLQ1Chwf3JfaynPQ==
X-CSE-MsgGUID: kKHy+eRGTayt74dHFAF/Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726875"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726875"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:43 -0700
X-CSE-ConnectionGUID: rKDT9mVvTAWEv9PWZ3Opew==
X-CSE-MsgGUID: iLGJ8eb7QVuTj/0u9AtlpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635214"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 29/34] drm/xe/vf: Workaround for race condition in GuC
 firmware during VF pause
Date: Wed,  8 Oct 2025 14:45:27 -0700
Message-Id: <20251008214532.3442967-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

A race condition exists where a paused VF's H2G request can be processed
and subsequently rejected. This rejection results in a FAST_REQ failure
being delivered to the KMD, which then terminates the CT via a dead
worker and triggers a GT reset—an undesirable outcome.

This workaround mitigates the issue by checking if a VF post-migration
recovery is in progress and aborting these adverse actions accordingly.
The GuC firmware will address this bug in an upcoming release. Once that
version is available and VF migration depends on it, this workaround can
be safely removed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3472e4ea2609..3ae1e8db143a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1398,6 +1398,10 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 		fast_req_report(ct, fence);
 
+		/* FIXME: W/A race in the GuC, will get in firmware soon */
+		if (xe_gt_recovery_pending(gt))
+			return 0;
+
 		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
 
 		return -EPROTO;
-- 
2.34.1

