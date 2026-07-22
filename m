Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A859EC531BC
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 13:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C70F10EDBA;
	Wed, 22 Jul 2026 13:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pvN8QaBF";
	dkim-atps=neutral
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA7910E385
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 00:47:40 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-9693bbb962eso1464411241.2
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 17:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784681259; x=1785286059; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yQODMN13qmDTEaPxJlH5XqI9VKI8Jhu1kZxKvHl9BvM=;
 b=pvN8QaBFrDOUCIDPipffBmqANc7P3JQQ0fbuoeqjTe4Lv+jHzrLrjgeJueGjG4hV+u
 awfmH7JDuxXe+IDh6JjfwHGVHRJ6jcTpcyglPczG/XY90iaMZxacAR4n0L2KFgRwX1tc
 MUhwzBn3KQ0ssgy90HsaPvW6XdNktymNpqjnNYaZfVarHus0fhOJETK2a2OH9fA6J1ZG
 xB9f2kuGqqp7Bc2hNaPivowzdgg0MBHhiCy02+2ZPyE9n+lFIyzaVWJkWn+pzRYiT8KI
 fvZzgSKdqDKOTAkIff+yZ4+daQHwzNGli6IJCvPs8HGF3LmOaeTsy1EszVqjb9qdiRny
 IE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784681259; x=1785286059;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yQODMN13qmDTEaPxJlH5XqI9VKI8Jhu1kZxKvHl9BvM=;
 b=GwtXwsOJQH4aHu0DnDMMGsigQBGdAF509SQ4l14SGfjb64uBgIs3p293V/zrf/EE9a
 PgFrx08nM+mzlxH+MyAITXwbaEaHPTIS5NDK6UFV402lb7E9p3pQDMQ1JDgSFNl1ZK41
 MBsXLtUJIgsx2R0o7Tbt21eflnK856kF1NO1WIl5VLnzgLuRcDTrlB50SttPnJkTteO4
 Y8b/+HmBQqDAy0KWeGqeNGQOVNNEC6BVkRA8T0kN4V1x4YVa0n3yLHWxMlFNtAuez8dO
 c2dQ+nJFFRA8rZHAyi6XEK75WdaSHK6ueUAOGeFPshCCyqX1FLNTUitpXgg03g57Ww0d
 2o7Q==
X-Gm-Message-State: AOJu0Yzi7UbY8fNivmH6QPqwPNdgo3GNrkONgh551G7nwU0MBr7i8Ur8
 9o07Zu6ZjFbRQO8M3ag3B1mXtkpBtUvWuGcCWGaWUyXdurL3nsa9Y04VrMUbmQ==
X-Gm-Gg: AR+sD12sTHo04UOHUPKmbE6DkX9G36VvOcHm/5+9c97Zs4hq0SvIhd53b0raRr5TFqs
 E6VATf/FSFk9ibk3q599qi6p8Uu8SdYuVoEzpyVRgqEQRL9lT/zcnEW5IP08O3ajU6bFEIY8If1
 vRTU07FDVpNLpFwz2+hzwkpGtq/FUlLV+S55s4kQAQDV1XuMb//ID7IAAmLMbuQsydIvbhgpe9b
 5eNIVD5O9tu+Jh/Ze2vrP44NP0G4FX6kePGlPJ5/b/DqoVsVRIy+s2uBV/9uEfFTjwAh8LWOV0U
 iwoCKctvqEeUc2jpy98DvqBpwMEBngW1LY8OzCDTVxNNnqXbwJrJIyd6O/83nSHq3nPo9zlElQZ
 zz4/cLvkrBaIJI2Ic8Yojzxk5CfdybJWShswGG5HxmuCW/AGZ2rMAHDJeGoQjyYGQCNrQJ/MOz0
 RtKIwIHTp8+GjyYOr/Puk9QfErnfvSRNAFRUaDMrZpcxBkJbPB4koiFMfc3lQxkYIgS9dAUg==
X-Received: by 2002:a05:6102:5092:b0:631:4cda:3ebb with SMTP id
 ada2fe7eead31-7475370e8b5mr8061218137.24.1784681259146; 
 Tue, 21 Jul 2026 17:47:39 -0700 (PDT)
Received: from lord.bigscale.net ([170.246.211.222])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-74ad31c215bsm1346505137.2.2026.07.21.17.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 17:47:38 -0700 (PDT)
From: =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
Subject: [PATCH v1 4/4] drm/xe: Raise hw_tlb_timeout to cover observed GuC ack
 latency
Date: Tue, 21 Jul 2026 21:46:54 -0300
Message-ID: <20260722004654.744249-5-talesam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722004654.744249-1-talesam@gmail.com>
References: <20260722004654.744249-1-talesam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jul 2026 13:42:23 +0000
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

On ARL-H (Arrow Lake-H) under sustained load, TLB invalidation acks can
arrive slightly later than the current fence timeout budget:

  tlb_inval_timeout_delay() = hw_tlb_timeout (HZ/4)
                            + 2 * xe_guc_ct_queue_proc_time_jiffies()

which with the 4K H2G buffer works out to 2.25s. When that happens the
fence is force-signalled with -ETIME even though the invalidation
completes an instant later:

  xe 0000:00:02.0: [drm] *ERROR* TLB invalidation fence timeout,
      seqno=15519 recv=15518

Local instrumentation that records the request and timeout times of a
timed-out invalidation and logs the deltas when its ack finally lands
measured, over ~24h of heavy use (kernel builds, 3 VMs, browser; ~311k
invalidations at ~7.4/s):

  - 34 fence timeouts, every one followed by its ack
  - request-to-ack: 2254-2355 ms (mean 2306 ms)
  - timeout-to-ack: 2-59 ms (mean 25 ms)

i.e. the ack always arrives, and always within tens of milliseconds of
the deadline - there is no firmware stall (nothing arrives seconds
late). A prior change guaranteeing a G2H CTB drain in the timeout path
confirmed the acks are genuinely not yet delivered when the timeout
fires, ruling out lost interrupts or an unprocessed CTB entry.

Signalling -ETIME on an invalidation that completes ~25 ms later is
worse than waiting a little longer: waiters see a spurious error for an
operation that succeeds. Raise hw_tlb_timeout to HZ/2, extending the
budget to 2.5s, which covers the observed worst case (2.355s) with
~150 ms of margin and eliminated all spurious timeouts in testing on
this workload.

Signed-off-by: Tales A. Mendonça <talesam@gmail.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 91960dc4ba9..c5ceac5ab86 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -335,7 +335,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
 	struct xe_guc *guc = tlb_inval->private;
 
 	/* this reflects what HW/GuC needs to process TLB inv request */
-	const long hw_tlb_timeout = HZ / 4;
+	const long hw_tlb_timeout = HZ / 2;
 
 	/* this estimates actual delay caused by the CTB transport */
 	long delay = xe_guc_ct_queue_proc_time_jiffies(&guc->ct);
-- 
2.55.0

