Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DACAC7EE26
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 03:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742CA10E3CE;
	Tue, 23 May 2023 03:58:52 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB7F10E3CD
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 03:58:48 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-64d247a023aso3701316b3a.2
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684814327; x=1687406327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgXsuCRRy0arg6ZZNXB1/jmzOWrfJyuy8wNpPX7/SmI=;
 b=nN22M/kgl2GGigyZd84J//xs1nkTlZt+z/96qVQPeur3LdcObNX2OZr0Fq/i7paq6G
 5i+z0bzCCienRePkJaJRVS3bQtbKZObU2qui8+TAs+d9cFKVNCMQFui7z9cjCwhqWFFU
 GiBncIKnqB8iP5L4I4QZg0NWN2rOvF19lQaeG/9EarWmYuAaU34DZA4QIMrJXcqj+cwM
 s2LVFGX8/7F9mwzHgLNn4U0jf3Q328uekjxeKlQRjJZpGoXNe+SSEagms2Lb4+lf9vNY
 QViOVnlYik0mHRAy7oC2pA8tdqYdPe9itxJJyft4Dz5B6KvZwyMKRzkRKPNzjxsN0xk3
 qHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684814327; x=1687406327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgXsuCRRy0arg6ZZNXB1/jmzOWrfJyuy8wNpPX7/SmI=;
 b=JlZl6YkojC15eWHkaVlOqgEv5UZexlQF0h1f1oiWMmnRLYGacgfkR+7xjqzfBHKx9Z
 y5MuQmEQhSXPREM7/M7/xinUK6kJt+wAoVIORsCGmxPyZxY4YEe+DKXXn8aV/n8b1bYD
 PU6i20BHkodaG9AtlmtJqXJlN/VSU0zu7nk1kbVCnwkWu8L00kezsCjfxZrUIjfcxpU7
 itBEz+wOm6qtbd0Xi7oVtcyaoFcoFBlEB3xQLPoD2iPRbJBYCbgPdk2PyqCZsFMQ50Aq
 4lbf0GyIB7qv+NAAuWVJQpSgKttL65B1UfOR/NlTVFcjon7ZahbR7pYEbOwJwXXxWG36
 8p9g==
X-Gm-Message-State: AC+VfDx3lYfXXppLJZkAV/uppPTewEezx2zdLLx1hStfT4T3C/UzZRey
 0fBgzVMkySaohc2N7qwDEeQab0wJ3TGSeQ==
X-Google-Smtp-Source: ACHHUZ7EeSFrwebI0VUjo2MUoCDu0yO41XE07GayhY1ip81nBALrKDOxjQMm2J6JCUt3ALvMka4PHA==
X-Received: by 2002:a05:6a20:7d83:b0:104:8045:c971 with SMTP id
 v3-20020a056a207d8300b001048045c971mr15956263pzj.58.1684814327036; 
 Mon, 22 May 2023 20:58:47 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 i6-20020aa78d86000000b006414289ab69sm4828615pfr.52.2023.05.22.20.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 20:58:46 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 20:58:04 -0700
Message-Id: <20230523035808.635175-5-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523035808.635175-1-kode54@gmail.com>
References: <20230523035808.635175-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/8] drm/xe: Use
 DRM_SCHED_POLICY_SINGLE_ENTITY mode
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

We create 1 GPU scheduler per entity in Xe, use
DRM_SCHED_POLICY_SINGLE_ENTITY scheduling which is designed for that
paradigm.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c   | 3 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 944dad79a037..46293c9bb6a8 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -339,7 +339,8 @@ static int execlist_engine_init(struct xe_engine *e)
 	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
-			     NULL, NULL, e->hwe->name, DRM_SCHED_POLICY_DEFAULT,
+			     NULL, NULL, e->hwe->name,
+			     DRM_SCHED_POLICY_SINGLE_ENTITY,
 			     gt_to_xe(e->gt)->drm.dev);
 	if (err)
 		goto err_free;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c147b17690dd..a7a0d9f806bd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1067,7 +1067,7 @@ static int guc_engine_init(struct xe_engine *e)
 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
-			     e->name, DRM_SCHED_POLICY_DEFAULT,
+			     e->name, DRM_SCHED_POLICY_SINGLE_ENTITY,
 			     gt_to_xe(e->gt)->drm.dev);
 	if (err)
 		goto err_free;
@@ -1168,7 +1168,6 @@ static int guc_engine_set_priority(struct xe_engine *e,
 	if (!msg)
 		return -ENOMEM;
 
-	drm_sched_entity_set_priority(e->entity, priority);
 	guc_engine_add_msg(e, msg, SET_SCHED_PROPS);
 
 	return 0;
-- 
2.40.1

