Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2FAC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 03:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A1410E3CF;
	Tue, 23 May 2023 03:58:54 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE4310E3CE
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 03:58:51 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-64d2c865e4eso3550271b3a.0
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 20:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684814331; x=1687406331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=830GAnjJwMVcqSTqWKrSPKqJm1sWRGmJot9Ie120tm0=;
 b=CeqormepTATNyTzRYw6Uyt82U3qgCLHRPXL5mOqGO8xBmPlqXKjmJL4NmfF0vNouUD
 Hgpq3WLZs+ncJlH/ZB2NLgV4ukNwm3Y5+9bjKiNYhArcoIWPnE8TWMTipYAbSx0frLy6
 kSmKXOpH09xlsAst/X+s4utd9R377ybtCs4UFl2eYadzmq4i3571m4K7FXC3GfTDHpD2
 ZHEecFeFRYRmpK679tEeFdxvK/mbAwprvJcvYqn0CwERPEYa8m+q+P7drUC/cXKf5gC3
 OdLR/1krF6YnKswAeAmT8/6eB8W9Ac5oMj7d7X2QNHOsuMlm2i3EEXQ6cRv9H2zZV95a
 qFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684814331; x=1687406331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=830GAnjJwMVcqSTqWKrSPKqJm1sWRGmJot9Ie120tm0=;
 b=DV1xB9T/kqBpGH5UnV7lm4EcZu34iPPx418sicq1s1AMHWkUj5vUt0Lefm2qRtgSUA
 6ONc1poELW27OW840OuoyqagZh4HYjr41R+fUZapvrjWSGtf0o8MHJmrUWPuM4Yej+h7
 exA77lc5ESt6JFqSjENLJ8EfSU+92rNBm+YgUrWlfMnwxz7M8d9IIF3HKyXW7o73536S
 5WtbEcl7ZXasx3COws4yEuy1OTIzJE20iCZ/e04FziORQqIEkyZXCYSqtcwErmEW4G3w
 lfn4CPjGLDNOfJkzchTKAvaOnA94gZJhIcrV8rH4ovVhqea46NfMwhjBdT6oMAmXyaPt
 e+xQ==
X-Gm-Message-State: AC+VfDyWNw18pMXj1mdIZuBEnQ9O/kCvJQeEK/7d8Ey1bEZ8Cu78+wCK
 i29VIDpuQ6Cr9xc4AETEjBjUfS2gdmHCTrFR
X-Google-Smtp-Source: ACHHUZ7urrQCyeIelwLlarsCcqOuYGgx24wn1bftYHmFklSUySYDto4XmNF+xhqVTTmI4ZIN92uvKg==
X-Received: by 2002:a05:6a00:1783:b0:64a:5cde:3a8c with SMTP id
 s3-20020a056a00178300b0064a5cde3a8cmr15449112pfg.28.1684814330800; 
 Mon, 22 May 2023 20:58:50 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 i6-20020aa78d86000000b006414289ab69sm4828615pfr.52.2023.05.22.20.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 20:58:50 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 20:58:07 -0700
Message-Id: <20230523035808.635175-8-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523035808.635175-1-kode54@gmail.com>
References: <20230523035808.635175-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/8] drm/xe: Only try to lock external BOs in
 VM bind
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

We only need to try to lock a BO if it's external as non-external BOs
share the dma-resv with the already locked VM. Trying to lock
non-external BOs caused an issue (list corruption) in an uncoming patch
which adds bulk LRU move. Since this code isn't needed, remove it.

v2: New commit message, s/mattthew/matthew/

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a0306526b269..0398da1ef1e2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2089,9 +2089,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 		 */
 		xe_bo_get(vbo);
 
-		tv_bo.bo = &vbo->ttm;
-		tv_bo.num_shared = 1;
-		list_add(&tv_bo.head, &objs);
+		if (!vbo->vm) {
+			tv_bo.bo = &vbo->ttm;
+			tv_bo.num_shared = 1;
+			list_add(&tv_bo.head, &objs);
+		}
 	}
 
 again:
-- 
2.40.1

