Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1461D0D79C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 13:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2BC10EAF8;
	Fri, 11 Oct 2024 13:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="B3OLfkIs";
	dkim-atps=neutral
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342AC10E04D
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 16:59:22 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id
 5614622812f47-3e4d624ac28so757558b6e.2
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1728579561;
 x=1729184361; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2O3NkkjIemIsAieDahgo6WCW7UZHnrJROVrMuNKxroU=;
 b=B3OLfkIsdTDV7VX5pO/OQyViOYI21/8prf2eWYw/sZKTuJPI0vamKYARZj6kuSbxOP
 dpIFzItmFRzXPeC3NYFGu/CtIAq88cfdjXJIexPpiN9HXyre6a4nntpVuQA12pCs19zi
 yrqUfUfo/GGxBy6IwjAo0GSmOWtS3cPYNFg9XT4ru6199tjB4DSkBT9lCXvry39HKtkb
 TnoMNNbiq7OLVYuK3lR9/FUsRf9Uq6nMHIRXIE/84d9mVvYxcaUvnbMliAel1eTMa5sR
 jTxCMz9v28Se8Pms9FdPB1WcJs3kxDGzRen//N3vlC4KbaeXcwELNdm/s7+wRByNVLJo
 E9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728579561; x=1729184361;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2O3NkkjIemIsAieDahgo6WCW7UZHnrJROVrMuNKxroU=;
 b=g+gw2K+6kKvkNXoUTcmQeS0qrz+gOHTD3jvIG5MXiInOssXSmKXbjvnlQwlmtabrA+
 fhmPSSDSnCegYbBkgGDQ7pJbRHoOS3pFSQMCGaTzg3/deEevn370efvMBpFyJTc33AVH
 icSiAgGzM4jGa5X6gRF82mv+aYpKKw9Dq0qggZ318xSC5W9obWOlxKe9DtrNqx2AlavB
 37hHEx4vnnUrHt1OdBzFDQHVxAhS71BAkMiGgfbudBK1Q+nPMTy0EXFAecahl14Okiky
 7OYBnF+LVQIV+Q+EE3E582zwRrebAI6/WuYnRHMQhXJyuE6VhBCdP7qoE/KOXbiUGYaC
 ug3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3v82YGG0CNEPL9mZXDduMjb5sbJgJFa73H17gffrsxdAabW9R74OHmJ+5u4Q2rfKFDDMKWHy1cA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7ge9FhnBP6XhkpN/5oQeuLkZ34aJ2tlgkqrIp9/mhFstBa1gT
 xItv4UnaURKEJnxkloAbpypPcq31ysAwLJK5pLHsjqheKp4TNGSFvD1kaI/fHDM=
X-Google-Smtp-Source: AGHT+IEQECyAfbtTxECBBfSegcXyiHPvb+HbTmNxdnj/9M9cty89n8mvsWrqwn4N/Jko0Uax4nMEPA==
X-Received: by 2002:a05:6808:19a0:b0:3e3:9ba8:5af0 with SMTP id
 5614622812f47-3e3e66cc39dmr4801528b6e.22.1728579561189; 
 Thu, 10 Oct 2024 09:59:21 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.16])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7ea449688e3sm1238289a12.87.2024.10.10.09.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 09:59:20 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>, skhan@linuxfoundation.org,
 dan.carpenter@linaro.org, michal.wajdeczko@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V4] drm/xe/guc: Fix dereference before NULL check
Date: Thu, 10 Oct 2024 10:57:59 -0600
Message-ID: <20241010165801.3913-1-everestkc@everestkc.com.np>
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

