Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692B8606A321
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j2D4+Q+I
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F25510FCDA;
	Wed, 25 Nov 2026 14:58:47 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D7C10E42F
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 10:59:24 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-386c4d2e2ccso2734232eec.0
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 02:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795604363; x=1796209163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=j1FGvTIUIAFBOZYmL6OiO8sZFEbEFDfPmxmvVzyQ4O4=;
 b=j2D4+Q+IDY1Pfogzgx1+CcWYbQhYRfFRS0f4LiniHxdNHPoWaoBk93wvuGBiFCBNJ0
 i/NPJyO4w6pMZP8is6/MA0aAbf3Mo+LvSuUe/q6DY/JfRR/xWF4S4UhUMGdmQfsamoK4
 5vMA6UahyCN2Iqbd16cfCfDBH/mYwoHo9elrLTb1zBVVw4TXgc032I8HFdVIVym0xbKP
 aRBZjxUyEqM0VGEqw+dKoj4T8H1bQA8hjs/UbE7VgXNh9wZRnRF7+jH1mKfWdiiMVUAJ
 7pvgekkTtzAJUhkMSJw43w0Ezfu/2jUCosL94lVz7ZWXjaS5b7dM/njTd9Kb3wKmT61v
 MPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795604363; x=1796209163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j1FGvTIUIAFBOZYmL6OiO8sZFEbEFDfPmxmvVzyQ4O4=;
 b=giy66oh0APlMN7sciy4ZKW0O1cNBL86wsdVJucxuVj280Srg4+NyhITKgEG+5EkDyc
 UAJwIr0sJACkDxClNzSLrLecxzDx8MZLKdwScncPbt8o6P7yWc34budb+i0dWffcZmFD
 SUpeRpXw7fogYleH8odyvlI10JMjKbNAbjzOqpBYg67FDawLPLtIu1Nt1vHwC7sr10E9
 DMeMmuHPAmYW2kh07WRQQPF/+JHOmJoZKWb4RnypWUevc6forFKmBT/2nxrM52uZ4OMW
 DOLIZLBwbjOJ+KJtzBwbZIMttlkOv/pm0StFCfr9hPqnvww+/CBeQqiPLHyS2TBToKKV
 t3QQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEJdU3V9G7q2GtCzAk1aU9+aCpisIW/0jbtu8csvfCbxBHYhHuowq/VulmtRtrrT7hGwDGcOi1nNw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z94uwD6kSJFvv52hrrDVDg4rBhFREpT/ZhDlfJfTPvY25wcYRVi
 it/Ig1bj6M+tAJVN0v4byGL8jKJ2ac3a2dOjj53vPHATCdO+C+Cmi2KR
X-Gm-Gg: AZFdTZe5lZDYf1QyaPGvMEO1zzEBA0Wy4rns4i4xRJRTWYmh/KnTvClxA5hqz3kfXi/
 68Xn5oozy6Lb2ifvrPwSM0FY08WiCYoDVAmZahOEbLgEBif19S7p17fDB6RD8lKykYtR/lcNmir
 A8SM1HD7rm2iWNhI0UsEYWHTDjsZs1owp5fmMFdHpz64Nl/mqWhdXdCUm0r0wA3ClK03MG4QYtg
 Kh1wKFtcCy1CKX5S0ZYjFc9M2okFT6YhzwVrPDeCSoig9fvDrA0gBghOJUEOusmtRWnvlAcib+O
 sOB8n3ifpxEVWYnucT1ZDN5uone0YYXcH798rZ2UtRtsZqEu5ztFe/3ru1fShAEymT8PMADtEwR
 g6YJx6L3lrOZx9xNXQ+UMohndQNCpDUZe3V3Y9kE3RnqOrlJnuv1BGCr3OizcyaOXTGZdjzhMKN
 DGDY+eR+3ZMXFLBxTVPfU4V2xJbLPnNqawzEdPFOAcc1GJ5AmmIp+3E0AcdZO0zbH6YH8lHEYU/
 Gi9Yw9scEqFveGb2xNCpgxBJ7mPdJHO13tsKy3IPHIpJQMHzvvvUAdG8HlQunxdMtgAs9VmTn74
 A4W5tXVO5piho8UD779Ha1zxH4+WetlmHLaUfuls011pjWIY2w1lOVvLfXib0lRNQ2FsaM19Niz
 m+N/l6hnXTlFo8KrBnwQbmkKX7Mg=
X-Received: by 2002:a05:693c:39cc:b0:386:48c1:6c5e with SMTP id
 5a478bee46e88-38648c1719dmr15667422eec.37.1795604363311; 
 Wed, 25 Nov 2026 02:59:23 -0800 (PST)
Received: from localhost.localdomain ([2409:40f0:12f:243a:5b38:482:e2fe:5dab])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385d2b93dd9sm60114815eec.24.2026.11.25.02.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 02:59:22 -0800 (PST)
From: Torra Sowmya <sowmyatorra@gmail.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe: Remove unused userptr rebind tracepoints
Date: Wed, 25 Nov 2026 16:28:54 +0530
Message-ID: <20261125105854.48591-1-sowmyatorra@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Nov 2026 14:58:40 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The xe_vma_userptr_rebind_worker and xe_vma_userptr_rebind_exec
events were introduced without callers. Their definitions were
later moved to xe_trace_bo.h, but remain unused.

Remove both definitions while retaining the shared xe_vma event
class and the other events that use it.

With the tested x86-64 configuration, size reports a reduction of
936 bytes in xe_trace_bo.o, from 24146 to 23210 bytes: 344 bytes
in text and 592 bytes in data.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 36fc7eb65882..8be08d527ea5 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -150,16 +150,6 @@ DEFINE_EVENT(xe_vma, xe_vma_unbind,
 	     TP_ARGS(vma)
 );
 
-DEFINE_EVENT(xe_vma, xe_vma_userptr_rebind_worker,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_userptr_rebind_exec,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
 DEFINE_EVENT(xe_vma, xe_vma_rebind_worker,
 	     TP_PROTO(struct xe_vma *vma),
 	     TP_ARGS(vma)
-- 
2.47.3

