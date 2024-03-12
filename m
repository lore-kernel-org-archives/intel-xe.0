Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5C5C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 06:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2C710F277;
	Tue, 12 Mar 2024 06:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dq9W5M5c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C68810F277
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 06:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710226601; x=1741762601;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cA99E9gw4jPgrP26pWJyOehLXRTd46/XctGudwg2f7I=;
 b=dq9W5M5coKQ9G3+rqCt0AJZVgEry1ZG4yUhRXm2Bpfz2ayzum/CXv0kD
 FYtXkuFO0WalQ53xBITi/JpimUD0IpFhFKRoD6qeKnUFZul+ZanrHQGAk
 +YePQzA088pZEKH7a3fGaOL16cTyvci6/RycTiVsD0+HaO+minjYzI9S0
 Qqwt7OEQBbHZS160L1LngIS+3JLaBlsQDct6OQf/3nysb7wt0xon70bMd
 hnRBLMXN3iokF/tPZdfqBvjzUktilTI4FbEfKSuTOyaj7JoGMu42boG0h
 gnNSgHj+gakl4Fj2GiZeWEOVCZ2Z2ON3Rhl7pVg/6ywBiDV2xIRfdgKgG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="7866626"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="7866626"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 23:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="15929481"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2024 23:56:37 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe/xe_tracer: Align fence output format in ftrace log
Date: Tue, 12 Mar 2024 06:53:38 +0000
Message-Id: <20240312065338.1357531-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

The fence print in xe_sched_job class is with "0x" prefix.
Add the "0x" prefix for other fence output, so that they
could be searched in the same way.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 4ddc55527f9a..c3ac3b2bad3a 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -36,7 +36,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 			   __entry->seqno = fence->seqno;
 			   ),
 
-		    TP_printk("fence=%p, seqno=%d",
+		    TP_printk("fence=0x%p, seqno=%d",
 			      __entry->fence, __entry->seqno)
 );
 
@@ -359,7 +359,7 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
 			   __entry->fence = fence;
 			   ),
 
-		    TP_printk("ctx=0x%016llx, fence=%p, seqno=%u",
+		    TP_printk("ctx=0x%016llx, fence=0x%p, seqno=%u",
 			      __entry->ctx, __entry->fence, __entry->seqno)
 );
 
-- 
2.25.1

