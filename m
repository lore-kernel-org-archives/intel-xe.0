Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45026C982EE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 18:21:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10C010E3FF;
	Mon, 21 Sep 2026 18:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jbh67QFb";
	dkim-atps=neutral
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com
 [74.125.228.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD67810E93A
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 18:21:37 +0000 (UTC)
Received: by mail-pz2-f43.google.com with SMTP id
 d2e1a72fcca58-85469e25187so1886346b3a.2
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 11:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790014897; x=1790619697; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=t5C60HPZR/rNmiGwq1B9UVhzPLHogeM3gvrGsjqTw14=;
 b=Jbh67QFbY4Dw7LnP21gGE/ZGUUiz+rfU4c6l9TwtO7MzDobf5iigpuEGPbIjgR8gWg
 zj33rzcwJwu26FaD/D6lh1UqESZmjt9uYKxZeCyXni/As9uJpkqHmLnKOt4eCZT5r4Zq
 1Wm+7FOHs1Tgq7BY/zCgTP1E2YetHb4x0oVKgAL1GDqRbyNUtT6c1zuh4iSEovs0yuLG
 KNqvmxFUj5qSJ6mdY01b9oan1wmFjdkdmBd181SWBVfjzcX+YCLOMplfahgRu+95f4H9
 R4CXQBq9aQJz6KhrktSnsss5GAps0BjMv7071RuEW+vwptXOXMFzKa8mffgSG2nopmuW
 RoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790014897; x=1790619697;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=t5C60HPZR/rNmiGwq1B9UVhzPLHogeM3gvrGsjqTw14=;
 b=rJMvIxbMyWIGPARoBIqEdPvKiYwK2h/E/O6roclDvSi784F4Va0eHhmyRRUnlbmSBy
 CBpkDYuzh44GhhDO6d486FGq3NLUdJWEz/RSOjy5qUCsM4jpp+Q8LCvGYd/KosRUtMRS
 Uh/PAofnaUZgFfWlOXZbj9ipFH401GSSQuXK5hPbECs8jeOCmQ0C8FrImjwSd8q5FMfc
 NWhUzcLwz19KVAaBZbgErd17mOC4dlGoQzWrynxaugJCqiZwwhy8tMIH+cY7BRfQPYGm
 vy5OSjLdvkYts84Pgs390V3F2ihNz56OsQFIHsGeiDbJWjVr6yolsgL3Q+GTnpXHQuLs
 Gmsw==
X-Gm-Message-State: AFuF++kwANLQWYtiQ3e95FR5+PJdfjvsiRVhSGNFo7OyvyoVZ2FxE6DI
 SWIRzMIvghXJ1M9xFovF4E1po/Lp1hETMWfdTu1JxYUpRg2X5tGrAZ2FkzS2iQoOnKM=
X-Gm-Gg: AYBFou0iYHzSUsPGBLcQokZSG/AK579vPLqrWGz4litQ99/ivsyctl0RsED8VpFwXQv
 bk85wCpQ9wqHL+wa1bTQR/59BfX4wmny9gObjcKz6e6CZWrwpWlHqEfh54FJu9aop5oE9us76kk
 IXW8ck5xjXvydpj99Sj0+4mMGhTsdSpkRYlRkZJjyVhzwvVQgfTfIDbrFzu4+jHw1QYdmpahVZD
 9pz9tobr5ORAkAaFbvzJwGBkCZh5eWmXFk6GgxJLrU6RP9242EHFP0fYmwwmS2gprktwAF4jVTp
 V/7cLh7QbZx9X8Jjn6+X9hJgJ4Y3SdMPuJbTWac8uW9JffIEgLWGwJ/RQRF0Gy8JnU0fQQ3HngL
 tkvEB+Y73A5SzHM+41aSYndS2m1+m+aWAe2Ob7lT2aF1kA0Ylkcj2erXpl45OHAbgl4ufkAxwmO
 G4vAfjgeKIvm8XQfMcqVEX6FsRJFZdnO8T3TkxYPmc/IIUH5fQ8u5G/EwkRT3FN/I27O7peosV4
 sGEky8SB555xCqFsw/PqbdSepZCtrKU9qyUEcbCTD0nAtuts9afaw4fBVcfi52x
X-Received: by 2002:a05:6a21:4688:b0:3dd:a196:3094 with SMTP id
 adf61e73a8af0-3dda1963396mr12453782637.68.1790014897143; 
 Mon, 21 Sep 2026 11:21:37 -0700 (PDT)
Received: from lord.bigscale.net ([170.246.211.25])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-144d55e8954sm38587021c88.14.2026.09.21.11.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 11:21:36 -0700 (PDT)
From: =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 stuart.summers@intel.com, julia.filipchuk@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@intel.com, navonjohnlukose@gmail.com,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
Subject: [PATCH v5 2/3] drm/xe: Log when a timed out TLB invalidation ack
 finally arrives
Date: Mon, 21 Sep 2026 15:21:20 -0300
Message-ID: <20260921182121.308217-3-talesam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921182121.308217-1-talesam@gmail.com>
References: <20260921182121.308217-1-talesam@gmail.com>
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
  TLB invalidation late ack: seqno=10992 recv=10992,
    request-to-ack=2314ms, timeout-to-ack=45ms

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
Signed-off-by: Tales A. Mendonça <talesam@gmail.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 17 +++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 737cff3664f..d865265c743 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -14,6 +14,7 @@
 #include "xe_guc_tlb_inval.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
+#include "xe_printk.h"
 #include "xe_tlb_inval.h"
 #include "xe_trace.h"
 
@@ -99,6 +100,11 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 			fence->seqno, tlb_inval->seqno_recv);
 
 		timedout_seqno = fence->seqno;
+		if (!tlb_inval->timedout_seqno) {
+			tlb_inval->timedout_seqno = fence->seqno;
+			tlb_inval->timedout_inval_time = fence->inval_time;
+			tlb_inval->timedout_time = ktime_get();
+		}
 
 		fence->base.error = -ETIME;
 		xe_tlb_inval_fence_signal(fence);
@@ -229,6 +235,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
 	else
 		pending_seqno = tlb_inval->seqno - 1;
 	WRITE_ONCE(tlb_inval->seqno_recv, pending_seqno);
+	tlb_inval->timedout_seqno = 0;
 
 	list_for_each_entry_safe(fence, next,
 				 &tlb_inval->pending_fences, link)
@@ -457,6 +464,18 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
 
 	WRITE_ONCE(tlb_inval->seqno_recv, seqno);
 
+	if (tlb_inval->timedout_seqno &&
+	    xe_tlb_inval_seqno_past(tlb_inval, tlb_inval->timedout_seqno)) {
+		ktime_t now = ktime_get();
+
+		xe_warn(xe,
+			"TLB invalidation late ack: seqno=%d recv=%d, request-to-ack=%lldms, timeout-to-ack=%lldms",
+			tlb_inval->timedout_seqno, seqno,
+			ktime_ms_delta(now, tlb_inval->timedout_inval_time),
+			ktime_ms_delta(now, tlb_inval->timedout_time));
+		tlb_inval->timedout_seqno = 0;
+	}
+
 	list_for_each_entry_safe(fence, next,
 				 &tlb_inval->pending_fences, link) {
 		trace_xe_tlb_inval_fence_recv(xe, fence);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index d77be1aedc9..80d2019fa20 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -112,6 +112,23 @@ struct xe_tlb_inval {
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

