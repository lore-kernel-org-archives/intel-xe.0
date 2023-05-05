Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769A3C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 14:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5237710E034;
	Fri,  5 May 2023 14:49:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2980810E034
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 14:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683298189; x=1714834189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1BV+0SsnFwAfWrCaYxu9wrJvRXwkSlIwSShgX7e5f7s=;
 b=BMy5LWELN0mQqkiJA7b8p6uYzEoA274rEUpUNP6WdZ7aO7Z3vMoqghtK
 xu1OCSuRPcxlLHscb464XUTt1Smv1ve73AYInNXXCNoFR49Xm+Tk7bbCr
 BCiJYZ6yzpD6DefgtSRNWmpWLTFI5SEIPadx2DLo2Vd9VpyN3Tvlk1Lll
 NQw1d5Q/2gX+Iz6qKSp99EEcqmaNQkZZE0gSBgHFpOr6kEWRc39evFubg
 hEzv6xse9oetYU2c/mUdeI9Fq6//kQLkzfgRUk26q8qKm0jzIdM8sR9cy
 B9gsVRT8cxOCx2PeOgOuVvoR/2YqOpCtWGi1KjDvMxFJc4VpRWZXA9X0o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="348044359"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="348044359"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 07:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="697615193"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="697615193"
Received: from jbrophy1-mobl1.amr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.12.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 07:49:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 15:49:10 +0100
Message-Id: <20230505144910.317943-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: fix tlb_invalidation_seqno_past()
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

Checking seqno_recv >= seqno looks like it will incorrectly report true
when the seqno has wrapped (not unlikely given
TLB_INVALIDATION_SEQNO_MAX). Calling xe_gt_tlb_invalidation_wait() might
then return before the flush has been completed by the GuC.

Fix this by treating a large negative delta as an indication that the
seqno has wrapped around. Similar to how we treat a large positive delta
as an indication that the seqno_recv must have wrapped around, but in
that case the seqno has likely also signalled.

It looks like we could also potentially make the seqno use the full
32bits as supported by the GuC.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 604f189dbd70..67822b3dd353 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -251,14 +251,15 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 
 static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
 {
-	if (gt->tlb_invalidation.seqno_recv >= seqno)
-		return true;
+	if (seqno - gt->tlb_invalidation.seqno_recv <
+	    -(TLB_INVALIDATION_SEQNO_MAX / 2))
+		return false;
 
 	if (seqno - gt->tlb_invalidation.seqno_recv >
 	    (TLB_INVALIDATION_SEQNO_MAX / 2))
 		return true;
 
-	return false;
+	return gt->tlb_invalidation.seqno_recv >= seqno;
 }
 
 /**
-- 
2.40.0

