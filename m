Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA71BD0D79B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 13:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EC010EAF5;
	Fri, 11 Oct 2024 13:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="RufwUNJ3";
	dkim-atps=neutral
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABEA10E813
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 21:40:41 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id
 d2e1a72fcca58-71de9e1f431so238105b3a.3
 for <intel-xe@lists.freedesktop.org>; Wed, 09 Oct 2024 14:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc.com.np; s=everest; t=1728510040; x=1729114840;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/X1R7jziJAUOGlYud471jpMxA58653P4VmVwYBUwEFw=;
 b=RufwUNJ37r8Nb9Hql9pEJ4vZN5NDT905a4ST9lIPk883XRNIVnLi3ldxbrdOtZuB4l
 fvmwrVjJVLdsytbf0JF7Kwhy6aVRYZHPqZ/fNfUMerU5GM1oVT83Stjp6EcQfrHwbfHQ
 kyms+PvsQL2G/WoPbLer6RHMmxdwuShDOgz+blODJ8kxBi5FBjTebp0I7FYCrvxXByfe
 S7g/8a4ZfyWDAGPhYKA8jCQHxMB2GS32a6nSwiY/ZMTLHoaoLEmnooEmFI40aFBiDNyw
 /Rnz3iekwKYpAMt1itc9kMOsswnqpjnAKg0eXsgJtz0e1//mEBmU2ODHXCK8eSK3sSY2
 RQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728510040; x=1729114840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/X1R7jziJAUOGlYud471jpMxA58653P4VmVwYBUwEFw=;
 b=wnx5V0UYsgGWsbOhGdbbvt69mhLmkoL0AwZ4K0LLimPdAx1vA1psJ6a9tptJn/p9c8
 xsbp4it913lFdbPjYzIa+FJd/MWqXoM7BL48ALI8Ohn/w70hYtmnYf1vV+/QGvYMJlnQ
 Jbz735TVhrufdGqXSlNuq8sCelH33ldnblmJ1iBh7BhViv/R4UjYXSwhUv61/vXDoEms
 rlOCQ7IFLxZajDmTNQDWkwm2LlW4f0Bdi1ad33e9u4E/zAiKZ9Ykv/es+LRtPhbZvQVu
 saq5ff8W0dy5OSC6XG6T+I6cq3Hp0wubh2SHJRDiUPvmX4a5zOD71aC00PvmBOc3osR/
 6AFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR72TQEEB4W7BAnuC/ZSF/ba0XtE+GCpbTN5NzRxxnx4KeuPdDU62586zOUXzJbXQ3DQaXNWGCnQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOI8ktQp+4TsId5NZ7uejfXMklmquc1DY7XeiUcQh2+VfFLrx6
 5lLkahtpLQ3oewO4KVChU42kFA4bkzyfwdaPZOND5zZ5NfYbH0Sl2847bO9r1JE=
X-Google-Smtp-Source: AGHT+IEVjxb8q3sxQHY7BRbeLePk3SvJC2jHMCY+loRxISySa+TSK3hZmXPkiAMN30Y1g+VBgiK0xw==
X-Received: by 2002:a05:6a00:2394:b0:71e:1b6d:5a94 with SMTP id
 d2e1a72fcca58-71e1db64896mr6487949b3a.5.1728510040550; 
 Wed, 09 Oct 2024 14:40:40 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.158])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-71e03288a37sm5717000b3a.155.2024.10.09.14.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 14:40:40 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>, skhan@linuxfoundation.org,
 dan.carpenter@linaro.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V2] drm/xe/guc: Fix dereference before Null check
Date: Wed,  9 Oct 2024 15:39:20 -0600
Message-ID: <20241009213922.37962-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Oct 2024 13:55:28 +0000
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

The pointer list->list is derefrenced before the Null check.
Fix this by moving the Null check outside the for loop, so that
the check is performed before the derefrencing.

This issue was reported by Coverity Scan.
https://scan7.scan.coverity.com/#/project-view/51525/11354
?selectedIssue=1600335

Fixes: a18c696fa5cb ("drm/xe/guc: Fix dereference before Null check")

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
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

