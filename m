Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809F0CA6004
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 23:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2885910E1D1;
	Mon,  5 Oct 2026 23:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nlp4mLGF";
	dkim-atps=neutral
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com
 [74.125.229.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08AE10E987
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Oct 2026 22:21:52 +0000 (UTC)
Received: by mail-dl2-f42.google.com with SMTP id
 a92af1059eb24-141a5cf1370so27804c88.3
 for <intel-xe@lists.freedesktop.org>; Sat, 03 Oct 2026 15:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791066112; x=1791670912; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ld3yvAlH1ePbXKo85z4Wex4dRCKbfnZa0FcQVmSfj/w=;
 b=Nlp4mLGFQuWHTcSY1OHTRNsvW+PaKSpzs2ciIUSff0L8Dly0JeELRR80p+SJfDCaRP
 WKRHxzJVOdNaj+gLcDV01DMeFx1q2hnTwdlve4lEI4Ko031nuEDuizJ3IlXjexcOeO7z
 4EbWhC/ITITt1DgykVkCz0TBN3seJpZ0nf+tiXvpU2xiK24mZylBhKhyV3iZrzR09StN
 Fh5x9qaYbMr0KREwF8Q/zqg/KLxFw6l15EPPbAqo1VBDfwrMkhEknqBnN0xm+DQfO50R
 yfzLq2GatmO00IJ7wGNVbNKWf/tpYt8fFchqfcJ8VlU2qaN3ua//N0ihA4ZhON33BK4s
 HTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791066112; x=1791670912;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ld3yvAlH1ePbXKo85z4Wex4dRCKbfnZa0FcQVmSfj/w=;
 b=WPaCuC5EELW1Fg5pNZuZkgCcq9g07+DQxnK18vy3KOs42yn0DreetgTyB/BkQxbiHF
 FZaVe2uV4xz7VdnLF59wULEHZH3T30v4lcG8aFcyUl6LE4jn576UkHyHdjKYa+ffJAQn
 jZUoEZF7dO0ZZRTtQocVlvCQ+6eny8nN+nT8G0cWLiRmRHWFNY0hSwb6xkkv5yuQgrw5
 O3eRyVx8KEDsvCy1XVDmBQVatWxA3CjXPRLkbDXLfm4B7PehzHPeWkp0ecwozhKMyUj9
 nXn1KAgVGG3Noq0dk8FaWhdnIYkhY0rX6UB2WeDMWzsovDR5xkic78lsl9hOkh3IA6v4
 ARGQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz4mjR1XNGxu39C05PcmCuj1omaESP9JwhCql8lpPzBv80qyKpc7evH8OdakeUA/Ym4EGBJgm+YfQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mpjqOE0rDPKMg5a+5sCqOM5r9oPhTRYPWkDnrO2zJafHqkEH78
 j4HBLjIu/JDwmw4f6RwaHbzglfd9JBOaS2/nQ892z34lP36m4fCAGD4I
X-Gm-Gg: AYBFou1Sgk7SjG7J5btQO26QmvTsFfjGyNDeNcb00E7ZZh5GDc7+AnSQJSBtuetBdvC
 IB37AUqk67/uwGUtSSM4SqQt98tkAF/7QLtVr5fG6H5YXwDhFJFh5Fv02ZLUOUSRIUYIHeMn3xm
 Szp26f67mOCn9BzMN5zzt/GPivA7tIRF1LQC/jUuydumQcMWbftmK2SPxXNinC/kdV6oytlPbuX
 yGrEDoZj3f1T6frZflV//MZNpgurgyOKmuULEBZuKLSW5X8Zx8a/9YjTgacMArzlHzkkMTvEl6T
 2L0OoFOFBvZeQP6G7Pmflmzd6cVrHQ5FIVVADvhP/cJ9D4RHvyx37xdkdr5zcc0EBRMuubbp6Pt
 DvkfWYKgCa3+MfJzhK8RIDp/Qhd/sJb6RPXILqPKXf6vcrgMtLBkboxobpua5dnnFPMUZAwdK+r
 6Vw306x6LMfaR1jWvVd5+3uicerSr4w3lhtfe54t0q/dxE/ZONbznfs8CoTWxmLEyWx7G/q1lZm
 C2E//XiUMEdKEcdQ8cplr5+X+m2GMaUfxPuPM1tjuvpqfeOP30Q8Jsu5uSaTG7S8gk/NFjRwU6q
 ZIzqWCO6w+bB+L92W2o=
X-Received: by 2002:a05:701b:4281:20b0:144:fd17:3b21 with SMTP id
 a92af1059eb24-14f56160499mr12982269c88.0.1791066111712; 
 Sat, 03 Oct 2026 15:21:51 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-151fc87346bsm18452135c88.8.2026.10.03.15.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:21:51 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe: Map Wa_22016122933 buffers WC on the CPU side
Date: Sun,  4 Oct 2026 03:51:45 +0530
Message-ID: <20261003222145.67240-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 23:52:45 +0000
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

xe implements Wa_22016122933 by mapping the media GT's GuC-shared
buffers uncached on the CPU side. i915 maps the same buffers WC on the
CPU and UC on the GPU.

CPU writes through the uncached mapping are slow, and xe clears and
refills the ADS on every GuC load, so probe and every resume pay for
it. On ARL-H, xe probe takes 3.1 s with UC and 0.35 s with WC, the same
as without the workaround.

Keep XE_BO_FLAG_NEEDS_UC, which also selects XE_CACHE_NONE for the GGTT
PTEs, and add XE_BO_FLAG_FORCE_WC, which now makes the CPU mapping
write-combined when both flags are set.

Fixes: d5b0bf3f37f1 ("drm/xe: Implement Wa_22016122933")
Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
Tested on ARL-H 7d51 with this backported to 7.2.8. Probe time is dmesg
"GT0: Using GuC firmware" to "Initialized xe": 3.10 and 3.15 s with UC,
0.35-0.37 s with WC (3 boots), 0.35 s on stock Arch 7.2.8, which lacks
the workaround.

20 min of VAAPI decode with C-states 2/3 disabled (the reproducer from
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678): no TLB
invalidation timeouts and no late acks, same as with UC.

 drivers/gpu/drm/xe/xe_bo.c  | 7 ++++++-
 drivers/gpu/drm/xe/xe_guc.c | 6 ++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6921b696733..763172b252f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -533,7 +533,12 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		 * which cpu_caching is never initialized.
 		 */
 		xe_assert(xe, bo->cpu_caching == 0);
-		caching = ttm_uncached;
+		/*
+		 * With FORCE_WC also set, map WC on the CPU side. The GGTT PTEs
+		 * stay XE_CACHE_NONE because they key off NEEDS_UC alone.
+		 */
+		caching = bo->flags & XE_BO_FLAG_FORCE_WC ? ttm_write_combined :
+							    ttm_uncached;
 	}
 
 	if (ttm_bo->type != ttm_bo_type_sg)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 3ab4cb9e496..a39a42bfd0b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1476,13 +1476,15 @@ int xe_guc_suspend(struct xe_guc *guc)
  * Wa_22016122933: on the standalone media GT, memory shared between the
  * CPU and the GuC must not be mapped cached on the CPU side, otherwise
  * the CPU can read stale data written by the GuC (e.g. G2H CTB writes)
- * for multiple seconds.
+ * for multiple seconds. Map it WC on the CPU side and UC on the GPU side,
+ * as i915 does.
  *
  * Return: additional XE_BO_FLAG_* to use when allocating GuC-shared memory
  */
 u32 xe_guc_bo_wa_flags(struct xe_gt *gt)
 {
-	return XE_GT_WA(gt, 22016122933) ? XE_BO_FLAG_NEEDS_UC : 0;
+	return XE_GT_WA(gt, 22016122933) ?
+	       XE_BO_FLAG_NEEDS_UC | XE_BO_FLAG_FORCE_WC : 0;
 }
 
 void xe_guc_notify(struct xe_guc *guc)
-- 
2.56.0

