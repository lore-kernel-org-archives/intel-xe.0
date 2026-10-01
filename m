Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6CCCA5FE6
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 20:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D6E10E6A6;
	Fri,  2 Oct 2026 20:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BFDVPMkY";
	dkim-atps=neutral
Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com
 [74.125.229.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FEF10E049
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 16:33:39 +0000 (UTC)
Received: by mail-dl2-f41.google.com with SMTP id
 a92af1059eb24-149d5ec8e96so1641802c88.3
 for <intel-xe@lists.freedesktop.org>; Thu, 01 Oct 2026 09:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790872418; x=1791477218; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1RPYD0N0OhgGTStrwI9XEfjRHAB9yKnlVpEfCkGkP/E=;
 b=BFDVPMkYjFLe0nG/EKZgoz5/LBDt+Bsy/IBPVTAuR63hlKKy1J2zREE5q0kYnC7Gno
 F3OW2yTlWphKXNUjMo1WqvnKM1+CGKaJqPpoEEvINzLASr0E5SoW3o36IX0ONDzxv33R
 1erGt0+KrTKRRO3pxaIFv2fdVbY7dgXXaCo4j65VDoTkSd3CoxQ5burrvi6e2Lhh7eTg
 Hd7yaxKy/n3lsPK0KY8Y3uF5/WiuZyGLcnRW6aDpGkoQpt0ulZtzQeWnVLWhrEfDL1nV
 xRpAshjh2tfFtYSPllzxxmJV+WaUQJRIIxDde6umBpqIbgrzqxKk5fYPyq/tnobe3cnP
 /yHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790872418; x=1791477218;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1RPYD0N0OhgGTStrwI9XEfjRHAB9yKnlVpEfCkGkP/E=;
 b=DUM3rUzQl6yYyX0Sx9Fqx+NTe9OVLqP5Ub8CVh/yMCxLeZO1UqGpwmDJpIl47A7cGi
 B8WnG7IoDEuJVM9uew7gOlQSMHXcQIIsmKenK0WCP2niAxaYD7hOMCVrH/GgAUVFLUNY
 jIuMrv/LkivUTj3ZJuXB338bXKkat9kIRf0PCs7ckz6s9oNAnHwr4xsBxDKv5le9a9Sf
 iUV76Pv7ctnEoguDvmuxV3HbANx+8ig0VlxPwLDCj+l4uZy1PShTITwRjfkvca4w8q+V
 BIVCKQ9JsuqEY8Ir04bIna5/RkVOTch7N5Cer6WUocGqA1ogkY4LLa4vy1wlT8ay74Wk
 EtSw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy/TusxLLYrVAf5e9BfpcD2b9ofQbV0XFbjOpgWMOoTZNHygRNP59xV1LQes9Ug45pMBxHWeecXjw==@lists.freedesktop.org
X-Gm-Message-State: AFuF++liTTxz1QnWa0pE/LdlXyyEcPliEH54ri09QuWdlf3u34EyYzgN
 rPEOAEU4/IoGYJ/WN2WAUttie98eV+FVnnWVobnZqmYxe2ocmYJ/32Iw
X-Gm-Gg: AYBFou2Yh+skNzc8ZI4zmVfNuxkrFhkHkMByurrzncsZDFOME6qnxLBTBkaPdL+nh1/
 92/x8biXjtJ4UJpKevv9QbAsPfFTKhe08ATLD7pOgcXNLqK5RiSLnVJjMWX15aPx8UpRh2B5fzB
 4JkZD2gPz7V6zNf6rCATJm4bsENwl2ZfdIfnNnPcB6UwR/+ngnPifhLCd7n+mHJmWAVIYoI0CaA
 Ts2++SBc9h5mjb9Ik+LYv9+rDSPlAkRLgH/XNj5NTmoipEgEiTEc13onVy91KgeUnhHnJ1zKzvo
 sik7Pvlmt7dTrslrUx1mzqIpThZotSbTr2YajVBHbEsmf7/ttliVVIpPACA3wpNu0kCwAU66rFU
 WTTZKa/DGR3WCCOOrt/URwxAoyNRH1tKduIQ6vj+p3VY1zyVf4Zsv/KSEuQF7Gn4IkBGw9uqYVR
 wPYAxGOuflOddObS2XFlCxU6I9SsVyer2BX5556MHgHYFWKM9T3Fqxs/aH79pJb2xMML9Tx7W1e
 qwP+BhZoCmqk3qftVQDuoke/FhKNMvQsu/+nUCosAlLbSdgHjVSwXX8ZLiYHrol9YqktB/OgA==
X-Received: by 2002:a05:701b:280d:b0:149:cfa4:9b3b with SMTP id
 a92af1059eb24-14d2fbcad2fmr5218644c88.3.1790872418302; 
 Thu, 01 Oct 2026 09:33:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:a4cd:e25d:fdef:4a3b])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14f265d307fsm385750c88.3.2026.10.01.09.33.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 Oct 2026 09:33:37 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] drm/xe: use resource_size() in xe_pagemap_create()
Date: Thu,  1 Oct 2026 22:03:22 +0530
Message-ID: <20261001163328.51556-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Oct 2026 20:44:45 +0000
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

The open coded res->end - res->start + 1 is what resource_size() does.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index b228a737c..e6ab5a5b3 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1848,7 +1848,7 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
 out_no_pages:
 	drm_pagemap_release_owner(&xpagemap->peer);
 out_no_owner:
-	devm_release_mem_region(dev, res->start, res->end - res->start + 1);
+	devm_release_mem_region(dev, res->start, resource_size(res));
 out_err:
 	drm_pagemap_put(dpagemap);
 	return ERR_PTR(err);
-- 
2.46.0

