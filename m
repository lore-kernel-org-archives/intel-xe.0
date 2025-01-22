Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927E4C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 04:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BB210E194;
	Wed, 22 Jan 2025 04:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8MJ0t0E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D24F10E283
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 04:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737518529; x=1769054529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2iOCqmx1xMMypiyUn42n73+31E/8k/oyy7elEK5G/jA=;
 b=T8MJ0t0EukWB95pkpDZ+oiMMNI/fmpCbNeKiyIhvgYTiBiYrQgYprTJQ
 hwn+IHOkfN1N8bDTiheTnAt42kmOP2qQDxT97/lfXnbh67U9Hd5fFRqOd
 Ha0B7GsJxuwdZljdrihXkacP/r38otF8qCdb7Whb3/hRm85m9Uozl2pfr
 85JJ596ZsJmMEBsLJSX/FZQGxDKoUNNb+dycZb4LV0GvrTmxaPFUC16hE
 Qf9W1CzpKJIpkyvi3uNpbwRJjzJ+KPidH6WiL/wcXtYewnLILyCaBAMRm
 vB2rmluN4JEhgcP5FYt2B3Zr0XZ+4izYIouNn8tr6boADd+Y/kh1sANly A==;
X-CSE-ConnectionGUID: wmKV5RLJQ/abgw1eP3TfsA==
X-CSE-MsgGUID: 6dPpoQIuTzOPFMpTzNcJxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38112770"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="38112770"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 20:02:08 -0800
X-CSE-ConnectionGUID: 23PPqUG/TCa4UYw+F3/6iA==
X-CSE-MsgGUID: pxC2VGJFRPi/Dhwso66Qrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112088659"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 20:02:08 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe/oa: Set stream->pollin in
 xe_oa_buffer_check_unlocked
Date: Tue, 21 Jan 2025 20:02:03 -0800
Message-ID: <20250122040204.3239397-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122040204.3239397-1-ashutosh.dixit@intel.com>
References: <20250122040204.3239397-1-ashutosh.dixit@intel.com>
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

