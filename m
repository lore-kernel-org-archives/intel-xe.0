Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7B8C0755A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DE110E3F4;
	Mon, 27 Nov 2023 19:09:55 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DF510E3CB
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:09:50 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50943ccbbaeso6433256e87.2
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 11:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701112188; x=1701716988; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ef9oVOfhty8/qQZ3FX/EzTGrBi5Iv/MPfOBkZvyv4v4=;
 b=O0ON0E5kG6eoGqfZNuG3qbwoi5KjTlhOv65an4Mb7Xi5T7Ai5lS1qQOKdj/IjthvGx
 c+LaRL8RJ6kBA1M8pxF7J+5HqWGZcFbeZ4vlzzw2znMLe+rDPI8vzW4ngvmhZoCrH3DD
 IrVlkrT2+PW6sAyja6XtIqZKFBAPSTB7Tt8Aj9a3SaTjoDhwa0HyrmPUesRWYJ6O0JLz
 17o3mBnzY/Rb5K72WUGNXTEprQZlIhx9rCsHK20XAIiq403+S+kXiil4ER0sXdhKqIIj
 9xvoxjb9aMSlONaI1w6iFeHI9GP0vZK33zwKUrLffOG8QJBUU8lLMDuMLVpA89eDayDI
 kRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701112188; x=1701716988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ef9oVOfhty8/qQZ3FX/EzTGrBi5Iv/MPfOBkZvyv4v4=;
 b=mxIlqwTLfniGobbcclfvdWnECa3rvXtJHN2Q/e1CS2S3ty54Gh2eOPbdOQR9+5qlYn
 j1tXHgvDBvO9I4geWAfSbsAydum7Q7kjnPpBGY4JgsJ+yR9tOxL72ZcjESgJ2SrehC3F
 n+MUQwX7NHR1/ehSyuG+60RLuWQh1skPZxew56pinkwBzn9O5jWlchW5NKZpZSPBQxaE
 UGJPwu6i1QsMB25Vc27tzHHhaaTLDCcuqAK0C9w+9C0d7gNMD1SzvtWXcDACKEgDkdLw
 6xQRSUEXq5oPAAj4lo6h5+T9DAGeMv23VytwSL3OCvm2De/fTsfQDzUkIgNDw1jOXxKR
 Ex5g==
X-Gm-Message-State: AOJu0YzAVcLa6c1aWW2nRqOPM9/mV7iutRZTNMV1eUT5+PpR8UNEm9DD
 mIg0X5CRuTEdnILmvMs71PW8uNq2AXYz8jjC
X-Google-Smtp-Source: AGHT+IGS9ZXlftOWaA6PBsDSujGrJ1617nSQ24REghNhMJQsMHLwJl6n0CJK2abCbB3aGhdcR+1QiQ==
X-Received: by 2002:a19:5f5e:0:b0:50a:aa8d:1a60 with SMTP id
 a30-20020a195f5e000000b0050aaa8d1a60mr7427150lfj.48.1701112187916; 
 Mon, 27 Nov 2023 11:09:47 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 eo27-20020a056512481b00b00507a0098424sm1573810lfb.109.2023.11.27.11.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 11:09:47 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 21:09:31 +0200
Message-Id: <20231127190935.3150610-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
References: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] Revert "drm/i915/display: in
 skl_surf_address check for dpt-vma"
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

This reverts commit d192a479c592c5be260ae260429d24cf19ca7c9f.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ae6bad4407eb..a4c0a7a3523f 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1006,8 +1006,7 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * The DPT object contains only one vma, so the VMA's offset
 		 * within the DPT is always 0.
 		 */
-		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
-			    plane_state->dpt_vma->node.start);
+		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
 		return offset >> 9;
 	} else {
-- 
2.25.1

