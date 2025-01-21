Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D492EC02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 18:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BBE10E5B4;
	Tue, 21 Jan 2025 18:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHQ61vwF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820C110E5B4
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737482639; x=1769018639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2iOCqmx1xMMypiyUn42n73+31E/8k/oyy7elEK5G/jA=;
 b=cHQ61vwFpSMkT8ByoE+ZlU5rlCz5Bid5FfIklwe0a6rVH8cSC+m49/u4
 d+nCjVWUhsKiMGNhYwKLApc2px/31kfe/MT45BqhlYi0fm7bvXO6MwK3t
 7mOERG/d27+SoXfqrQARZsaSzdvmLaudCCdvnX9vtlDPpAIwEbYJpa8+T
 zbQE+p1DtLkBJgw4uzbLIR9kNALS3mg8n2VcGWFMLqNMxvO05iwqsoLDh
 mrQNFwtzpduIof5QYt80s/pLoYJ8bBQXfPPK15aJMf88q+zNCYa/wfCNf
 7Lk29xT7xBcKKLWnJJI5m1UonefmzpRs1KrAvsGsqyIlokZgTfZgxUogo w==;
X-CSE-ConnectionGUID: fL88OmgqTr2TDB2bRgxzZw==
X-CSE-MsgGUID: bg5jscRATOa7fFufig1yTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37933929"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="37933929"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 10:03:59 -0800
X-CSE-ConnectionGUID: It5AycXeT5Gyyf7yv51aAg==
X-CSE-MsgGUID: 1nDmy8YrQKSXrZ328x3HfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106663484"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 10:03:58 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/2] drm/xe/oa: Set stream->pollin in
 xe_oa_buffer_check_unlocked
Date: Tue, 21 Jan 2025 10:03:53 -0800
Message-ID: <20250121180354.3221570-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121180354.3221570-1-ashutosh.dixit@intel.com>
References: <20250121180354.3221570-1-ashutosh.dixit@intel.com>
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

We rely on stream->pollin to decide whether or not to block during
poll/read calls. However, currently there are blocking read code paths
which don't even set stream->pollin. The best place to consistently set
stream->pollin for all code paths is therefore to set it in
xe_oa_buffer_check_unlocked.

Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6a08e6c92835f..fa873f3d0a9d1 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -237,7 +237,6 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 	u32 tail, hw_tail, partial_report_size, available;
 	int report_size = stream->oa_buffer.format->size;
 	unsigned long flags;
-	bool pollin;
 
 	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
 
@@ -282,11 +281,11 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 	stream->oa_buffer.tail = tail;
 
 	available = xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->oa_buffer.head);
-	pollin = available >= stream->wait_num_reports * report_size;
+	stream->pollin = available >= stream->wait_num_reports * report_size;
 
 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
 
-	return pollin;
+	return stream->pollin;
 }
 
 static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
@@ -294,10 +293,8 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
 	struct xe_oa_stream *stream =
 		container_of(hrtimer, typeof(*stream), poll_check_timer);
 
-	if (xe_oa_buffer_check_unlocked(stream)) {
-		stream->pollin = true;
+	if (xe_oa_buffer_check_unlocked(stream))
 		wake_up(&stream->poll_wq);
-	}
 
 	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_period_ns));
 
-- 
2.47.1

