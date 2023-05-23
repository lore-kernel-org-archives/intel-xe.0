Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61119C7EE26
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 03:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5CB10E3D2;
	Tue, 23 May 2023 03:58:56 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C7010E3CF
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 03:58:50 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64d1e96c082so3810944b3a.1
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 20:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684814329; x=1687406329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VxXBqmNADTM+tVRC1juDG7ZIBkt+SnYX+1nj3HgFs4=;
 b=c43bHMgzgIYDrSh+xb8r80MxMsVVZAlrR2AqcCrAcC2Awk6sFE1ElzOj99gbbz0E7Y
 c+vXmcegqNpOS1nOnt4don49fSgl+4tkGW3ePZkexNUggJQV2qS2T1UCUKAAZ+xPdSO3
 Xi1Yf/5N0tsKe2kpP4p8hWyfCQ0XNAylK96ED8ZIk6SaDlew76Umek/QRHNObBRsHT9t
 MM/m8LNcZk+HJoQzjaqE0alJncrdG74IczzUfJrDTfZFbSBl3OR3NcBXvM7pMhLeKMrt
 +QzKDCiknH6OGzFKlB37X18Ncqyq6v/oRNGvMPe343SnUZ7C/eLYLCOYA+zKnq/+gGDP
 LfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684814329; x=1687406329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8VxXBqmNADTM+tVRC1juDG7ZIBkt+SnYX+1nj3HgFs4=;
 b=dqdnwAWxLIY7LpaLwAfkcsgP5skaALzPZRNDJeSRcOEzVfB8xd104i42B37VruQcHs
 2qBWWEuS10XfDB/WomHEv2pVjsrXGxbK8VOn67UY5L3d6PAOC24FKtvlGcZjj/7/Z2GA
 uVWfdjPhCFQ9fezTV3UbYm4JSVLTWLXxu6RuKDf4HS7n4E5HyjdpCkBDMoywph4Vv6ki
 uC4yr/Tm0rzrgysviSGbqJbcT9yVP48wIkk4F2rj3J1Trhn4o8ZuoDj746qPsW4tEXPJ
 ULlTNx1SLejUasga8Rdva9mRijNgq2TForl3IB3SOelzLAPA+/U8+meu1klod05X5bRU
 L2rg==
X-Gm-Message-State: AC+VfDwyJ32NrLX427tWfhhzDUXVaT/X3Qq5MMznN7SpjvizBsen19wD
 i+zzvq4vJeFbfae80HRv22LcijvYBk5K7g==
X-Google-Smtp-Source: ACHHUZ7CCMjSOXDQxKLyNqdFRfci6aRxkZImRtkN15sThVdx/9AWl4RdcyUaidWWAFryjhyfZbqOXg==
X-Received: by 2002:a05:6a00:1945:b0:64c:b460:c47b with SMTP id
 s5-20020a056a00194500b0064cb460c47bmr17751080pfk.15.1684814329516; 
 Mon, 22 May 2023 20:58:49 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 i6-20020aa78d86000000b006414289ab69sm4828615pfr.52.2023.05.22.20.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 20:58:49 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 20:58:06 -0700
Message-Id: <20230523035808.635175-7-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523035808.635175-1-kode54@gmail.com>
References: <20230523035808.635175-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/8] drm/xe: Ensure LR engines are not
 persistent
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

From: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

With our ref counting scheme long running (LR) engines only close
properly if not persistent, ensure that LR engines are non-persistent.

v2: spell out LR

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index d1e84d7adbd4..91600b1e8249 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -596,7 +596,9 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 			return -ENOENT;
 
 		e = xe_engine_create(xe, vm, logical_mask,
-				     args->width, hwe, ENGINE_FLAG_PERSISTENT);
+				     args->width, hwe,
+				     xe_vm_no_dma_fences(vm) ? 0 :
+				     ENGINE_FLAG_PERSISTENT);
 		xe_vm_put(vm);
 		if (IS_ERR(e))
 			return PTR_ERR(e);
-- 
2.40.1

