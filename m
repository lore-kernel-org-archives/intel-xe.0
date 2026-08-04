Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3049C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 02:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F3F10E0DB;
	Tue,  4 Aug 2026 02:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y+Ikcd3x";
	dkim-atps=neutral
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A7510E0DB
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 02:14:53 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-8486ac3f347so488934b3a.1
 for <intel-xe@lists.freedesktop.org>; Mon, 03 Aug 2026 19:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785809693; x=1786414493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZvPdnSQnHK9MlZBekxMncpAi4eS6EimZgKbBNGn7SK0=;
 b=Y+Ikcd3xtQGPqQL8fpf5ZNY9krGlOK6j5PaytRAmYIiSU2eAsYZ/mTP+c6LJD+X6Oq
 halHiCxFNb3FWhypLP3HUvuY6DM0LD0udhY5iUskMDiTm9/a1saWijdR3sZ5iOtEFXiW
 qeGoU6PM9Y0avVKi8ZcLb8NsYFpv8S62/j2uMtb86zUt4DlMT2XyN8BgaSQR0x3zwFF2
 A9FtZRlWUgV+Gl8EaAMayOl/CoWh4hIDP8lNrk/W2o7xK/nRWWe+qIfzAMAXuj32Q0ua
 dHw+P4KdK6+S9l3Y++36wnCU+L5JwGAurPWDiIe2XbwymhpwCcQ8Ggm/Q9jZBxLFUPOo
 /qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785809693; x=1786414493;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZvPdnSQnHK9MlZBekxMncpAi4eS6EimZgKbBNGn7SK0=;
 b=NKJcYdzc1SZpzHpB6WcFWoGbbpYlIKWVZ2UaSog5qMVAffKdAqNbWSlC17qV94cYKY
 j6MnmTeyLMQyjo/wD0qLWUpZcBLiJgrDhGT+wnegXi1ZjNmPkWYgr5/avQg8cCo9uF6V
 zEC1AqhiN8a/0g/v7AgYj5utmCl4p5RHDsUAghu48blL5Rh63EZrI3TtWyqpfAgA/VRa
 wJ1z6c0u0onEhAUn/k1XsCCoPO9WA/pYYPLZ+0RGzhQ/7LxLAiv3/priJD5KW32rgoh/
 TOuS8r09kKSUNGe7yveeww2RO6WTBuPNhONojrUf0Utl0vB7bCqWCPstlGBe9y65zgnn
 0pEg==
X-Gm-Message-State: AOJu0YwhYQCMYgKHUORxF50lx4SqTvVnlasKcqNF6wZgEN5ySvJ9giAs
 6VAmApuvu7d2PGeFFkEijNqkpkkfVZGf8iYG73PMpRpQXExLWG74ulRcMTWgQQ==
X-Gm-Gg: AR+sD10zf8RQD4gHnwPZm28LwlspCZdRPaZIarNgxN7um8CPPTEfA9JsTiQEvSu03N6
 jioQC3cnq0+QFF7l4wA4c7gBjNTIdF4+S6EGNYFO1cp0SYbW6MHdApiPFeKfIpz6C1fR1UCXWy7
 +oLZq8UsDFI4l2zQfgKC8EiK//Zmv6X4hloA7pwicBtwuOurm29y7qfKGgCJime4PALvzQe2pTm
 jGBzrl0R5UgJv/5jC0XIw1EYadq6ZIhpJYYBLzlnVCOJYu9PRBAM2UTBSESPtglbxZzT80VKw0t
 R7hO/ddKWTYAw0rgO82XsegzTLJXTXdI8TK74j4gc+QpYFxvra6XMib18q76py5H8MA2k7Rck7B
 /1EqnJ1BFvVE+xfXkWZipRET3DWSeMNObpiQanUQms8Y+ioMa/uVwlYGmRCEks4doNQGRb1lpgv
 yMjmi2MUPO+Bf5u27XczWSNul7nKXgK4X4nvicaywVzHopNFXacCjoekyvlcD+8NqqxF0KYB9ui
 uIjRxNUi+9fVCYJ8soW7Jl2nHmA83Id7+pCLXQ=
X-Received: by 2002:a05:6a21:a0c:b0:3c0:4179:b5d5 with SMTP id
 adf61e73a8af0-3cb6ca343c7mr1860857637.28.1785809693317; 
 Mon, 03 Aug 2026 19:14:53 -0700 (PDT)
Received: from lord ([170.246.208.189]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3153dd4f0f0sm42267698eec.2.2026.08.03.19.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 19:14:52 -0700 (PDT)
From: =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
Subject: [RFC PATCH 2/3] drm/xe: Log when a timed out TLB invalidation ack
 finally arrives
Date: Mon,  3 Aug 2026 23:14:40 -0300
Message-ID: <20260804021441.3054424-3-talesam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804021441.3054424-1-talesam@gmail.com>
References: <20260804021441.3054424-1-talesam@gmail.com>
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

When a TLB invalidation fence times out we log the timeout, but if the
ack for that seqno later shows up there is no record of it, making it
impossible to tell from logs whether the ack was lost forever or merely
(very) late.

Track the most recent timed out seqno and log how late its ack arrives,
relative to both the original request and the moment the fence was
signaled with -ETIME.

On ARL with GuC 70.53.0 this shows the acks are never lost: they
consistently arrive ~2.3s after the request, tens of milliseconds after
the TDR has already signaled the fence:

  TLB invalidation fence timeout, seqno=10992 recv=10991
  TLB invalidation late ack: seqno=10992 recv=10992, request-to-ack=2314ms, timeout-to-ack=45ms

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
Signed-off-by: Tales A. Mendonça <talesam@gmail.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 833fb92cd3e..9dd04d5bc4c 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -99,6 +99,9 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 			fence->seqno, tlb_inval->seqno_recv);
 
 		timedout_seqno = fence->seqno;
+		tlb_inval->timedout_seqno = fence->seqno;
+		tlb_inval->timedout_inval_time = fence->inval_time;
+		tlb_inval->timedout_time = ktime_get();
 
 		fence->base.error = -ETIME;
 		xe_tlb_inval_fence_signal(fence);
@@ -227,6 +230,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
 	else
 		pending_seqno = tlb_inval->seqno - 1;
 	WRITE_ONCE(tlb_inval->seqno_recv, pending_seqno);
+	tlb_inval->timedout_seqno = 0;
 
 	list_for_each_entry_safe(fence, next,
 				 &tlb_inval->pending_fences, link)
@@ -424,6 +428,18 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
 
 	WRITE_ONCE(tlb_inval->seqno_recv, seqno);
 
+	if (tlb_inval->timedout_seqno &&
+	    xe_tlb_inval_seqno_past(tlb_inval, tlb_inval->timedout_seqno)) {
+		ktime_t now = ktime_get();
+
+		drm_warn(&xe->drm,
+			 "TLB invalidation late ack: seqno=%d recv=%d, request-to-ack=%lldms, timeout-to-ack=%lldms",
+			 tlb_inval->timedout_seqno, seqno,
+			 ktime_ms_delta(now, tlb_inval->timedout_inval_time),
+			 ktime_ms_delta(now, tlb_inval->timedout_time));
+		tlb_inval->timedout_seqno = 0;
+	}
+
 	list_for_each_entry_safe(fence, next,
 				 &tlb_inval->pending_fences, link) {
 		trace_xe_tlb_inval_fence_recv(xe, fence);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 3d1797d186f..38288966254 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -102,6 +102,23 @@ struct xe_tlb_inval {
 	 * @pending_lock: protects @pending_fences and updating @seqno_recv.
 	 */
 	spinlock_t pending_lock;
+	/**
+	 * @timedout_seqno: seqno of the most recent timed out TLB
+	 * invalidation, 0 if none. Used to measure how late the ack for a
+	 * timed out invalidation actually arrives. Protected by
+	 * @pending_lock.
+	 */
+	int timedout_seqno;
+	/**
+	 * @timedout_inval_time: request time of @timedout_seqno. Protected by
+	 * @pending_lock.
+	 */
+	ktime_t timedout_inval_time;
+	/**
+	 * @timedout_time: time @timedout_seqno was signaled with -ETIME.
+	 * Protected by @pending_lock.
+	 */
+	ktime_t timedout_time;
 	/**
 	 * @fence_tdr: schedules a delayed call to xe_tlb_fence_timeout after
 	 * the timeout interval is over.
-- 
2.55.0

