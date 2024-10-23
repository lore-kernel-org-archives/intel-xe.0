Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DCFCE8E6A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 17:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DBA10E981;
	Thu, 24 Oct 2024 17:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="SI316MoD";
	dkim-atps=neutral
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8354010E08E
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 23:36:13 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id
 d9443c01a7336-20c7edf2872so11066015ad.1
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 16:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729726573;
 x=1730331373; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2O3NkkjIemIsAieDahgo6WCW7UZHnrJROVrMuNKxroU=;
 b=SI316MoDh0Sc0yUpRaJKZ0KQQZWZ/QfQfZVqm12/7/jbWqKbZIIssZ57QlEha2l85O
 2imIDGULvA/6YLtyzfpG7oj7rw7FS2yFFO1k+Xt4gQ/+aLT/MPT8Mf7IdyInSbQIdvXC
 RMWJjPtUxTUQiWD04am5zl/TaKnztZtSJzbNgyIITY17XaDGBavvDMmAXZYShoEDBvX3
 CnUhVb+qCDlmhc2zLzSqzenPkB4KWkQxQXAjKE4tGxhUrSfmAhRFD43eZ/O8aKPBtOW+
 3h49pM4vk1jIMJVlMsfDGkV/bLqpSR4wVjWoFYdm6IhI9Wx87tLJ6ilJMhyvaPQosJI4
 hOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729726573; x=1730331373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2O3NkkjIemIsAieDahgo6WCW7UZHnrJROVrMuNKxroU=;
 b=nrT/nkB/COKzS8m0f/UlQTTaoe+sVBAE/kvYL6IP2TypXX91h0V6f5Rzo4WhrblYtF
 dUH6FWvWJ5n3c9u/pkrMk/R3TeYE64j7uw8uDq7WsuRYq7jfyAKNf0YedrSszR5I/wiB
 mAGp3ARns29ZSQd/5Yus7QdBiwYXIMM/o+R3OxxN/9hprulSE8P8bIcYy5nYoD1JEbt1
 s41xvTRfgdoZx/k+Xorr8UNH1EGaevK/EemI2adkd2f+GIFBHA5T+lfVm7Y3sHvAw2Iv
 o3ELeluJRdLXHDu4nwnjPFNp4SDAgrgfg4UaADfO2smsCF3jXGyKJR7gdEezzz3Kzzqo
 Rbrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgkOuPlYv1Nb/EH/tRMGCnhY0vcKM6eoH1iJJPJqmjNxVjYEHlGNxoo2JLhmpi94uRJSP/K+ru7w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx04ZG+03s6Tz/teqyMPGrv5ePOqk+clwKQ3fDOwxhPjjn9lZY9
 ztUmqIl0G0N5yLF5Rt46qpcXOgUvCaCDW6JKu1eqNV8p2+XgoRZUxyHe1INbXGc=
X-Google-Smtp-Source: AGHT+IHwaFUU21df+imHVfe6pTP9I9aELH11EYkAeXYd/RsFrtAI3BUr3gcBnM47ZiLm1gigdv3+Ug==
X-Received: by 2002:a17:902:ce8d:b0:20c:ea22:3317 with SMTP id
 d9443c01a7336-20fb89ffc5bmr2049015ad.29.1729726572793; 
 Wed, 23 Oct 2024 16:36:12 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.70])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20e7eee89bfsm62534695ad.29.2024.10.23.16.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 16:36:12 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>, skhan@linuxfoundation.org,
 dan.carpenter@linaro.org, michal.wajdeczko@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 RESEND] [next] drm/xe/guc: Fix dereference before NULL check
Date: Wed, 23 Oct 2024 17:33:55 -0600
Message-ID: <20241023233356.5479-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 24 Oct 2024 17:37:53 +0000
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

The pointer list->list is dereferenced before the NULL check.
Fix this by moving the NULL check outside the for loop, so that
the check is performed before the dereferencing.
The list->list pointer cannot be NULL so this has no effect on runtime.
It's just a correctness issue.

This issue was reported by Coverity Scan.
https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600335

Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into capture list")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
V3 -> V4: - Corrected the Fixes tag
          - Added Reviewed-by tag
V2 -> V3: - Changed Null to NULL in the changelog
          - Corrected typo in the changelong
          - Added more description to the changelong
	  - Fixed the link for Coverity Report
	  - Removed the space after the Fixes tag
V1 -> V2: - Combined the `!list->list` check in preexisting if statement
	  - Added Fixes tag 
	  - Added the link to the Coverity Scan report 

 drivers/gpu/drm/xe/xe_guc_capture.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 41262bda20ed..947c3a6d0e5a 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1531,7 +1531,7 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
 {
 	int i;
 
-	if (!list || list->num_regs == 0)
+	if (!list || !list->list || list->num_regs == 0)
 		return;
 
 	if (!regs)
@@ -1541,9 +1541,6 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
 		struct __guc_mmio_reg_descr desc = list->list[i];
 		u32 value;
 
-		if (!list->list)
-			return;
-
 		if (list->type == GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE) {
 			value = xe_hw_engine_mmio_read32(hwe, desc.reg);
 		} else {
-- 
2.43.0
