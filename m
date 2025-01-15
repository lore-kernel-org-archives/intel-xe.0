Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CDCC02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 22:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E78F10E115;
	Wed, 15 Jan 2025 22:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmnF+E4K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E70910E115
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 22:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736979634; x=1768515634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OACr/pc3GJsy4bZtHLBi1G4GVyvxg7SHLt45pQ0+Zvo=;
 b=YmnF+E4KXKIeKoporo7bSAdXHLvjHZp9QydWCMWw1u4Pmb7fZB7h/Wxv
 svUQefZu6MvmWO1ZfDn5VmhNVgqppoOz1izGfFuVKEQ127E9U5je7jOQx
 lYkXF7SlZcX3jcktL6e1/Vs1k4np60qzolFPiZ73PE89pzeIgu2f4I53o
 e3DPCSkeXdu1P9UyW7/NNdkOa6KQN0W4MUDKVo3CmaY8kWOWJvtNcVlwa
 A75FZhu1g+Ws2b6ME0VZvfgU4GP3sd/cyH9xgcpPf1mwIWK2oQ7aQsNbL
 Ltx4reSSvol+Io2FSo0JzZbkx0xk8xXgCHnZ/L5S8A2g8htiwL06d7Phr Q==;
X-CSE-ConnectionGUID: w6L/H3J+T/CpH5aUMHvVyA==
X-CSE-MsgGUID: vRLmGWPVQui9bFJs9Q8P8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="54879177"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="54879177"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 14:20:33 -0800
X-CSE-ConnectionGUID: 7br/SYFWR6a4bjOVbLbcOQ==
X-CSE-MsgGUID: 6KtHp2F7RAimbCUL0hzMXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="105204493"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 14:20:33 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked
Date: Wed, 15 Jan 2025 14:20:29 -0800
Message-ID: <20250115222029.3002103-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
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
---
 drivers/gpu/drm/xe/xe_oa.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index eeb96b5f49e2a..e27c1752aa57c 100644
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

