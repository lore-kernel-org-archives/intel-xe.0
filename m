Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49F6C87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 15:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EFE10E87B;
	Thu,  7 Aug 2025 15:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ijMzHt4T";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDA510E87B
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 15:53:46 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3b790dbb112so671825f8f.3
 for <intel-xe@lists.freedesktop.org>; Thu, 07 Aug 2025 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754582025; x=1755186825; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JOwl9OLQJAYVxduC2ayJxb7hSYBFSiSP9YcfR3LlKkM=;
 b=ijMzHt4TrCRvGAD0d/NlA/MjczqCFo0SeuqJTISY2rPfj7D5JtjrYYc7U/p0HP8dwt
 atltHTs049+DyKHm0APh+EqNcd/rTdPrCFieSkm7afRsg4rr9k7wesuXN8yfW/jPxsNv
 7TrKUGCO7zHKvKqb7qlBw8ZFlijOvrPlfzmVFvGzp1Dnar19m56cVillLMfDtijb6cjw
 y5lukL9kcpBNbgBC01dmBX7bPJKm3sBQ5OyVsS2FRusbLPWxEE/4kfCbsimk+713yTri
 pMdtDpkToQA++GXCjKjc0vSBWAtsCqmOzy5t3akM/en1A9zVevMn4OE/qJd4i694wLH5
 VdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754582025; x=1755186825;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JOwl9OLQJAYVxduC2ayJxb7hSYBFSiSP9YcfR3LlKkM=;
 b=VXvXJCs7IkL898kwY5e1k/+Gr03PEU8h4ZsMFOSxocisqvoHEyoE3bI/w3cuUGk0nI
 yVOhoR7rrOR+VH2bC0yZAKUgW4w2F+NIlVvyV/kMv6kdWiKz9Cpz+7TW2M+BXOSm5qpE
 7XQp/Ra+mGrlYfmuh2tiNnx2I7sDMzL5Vaev0d4wTLoOtllCygugK+JxFurH+HfjJPV7
 V8FHH3WSj6rjXdb+XLVkKMCbehm3E0gXf1+2qx+W+QdQtyxAPx/UrJtcw/4BOmXOpGBM
 Ne00V7mxynXw+XJJb8X6oX5QYqABK3Xk4/cuZB0NmEHk1WbJGWyxx4yH1HlnthDoGayb
 avSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3ukp8kDGXXMSc04pWWeR0YyEMHGW84gcdmEuSzyFVPKIjgrx+v81TZP1QNILHgya824TimzQUtw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU6QdgUpfFtRiYyv/SsRx4lNbfOBbMv8EikP2usTzdtRUeRbAa
 oPRDMszwM15F20bgnq84gUnit58OVs9SUu1g+Fou1Cj/F1GZbfaZtjyD/WYebGVWuCk=
X-Gm-Gg: ASbGnct/UhrLO2bwnW8oKmcBKiSr8+vxtU4OvpQ4rHu8SExiiJvqui4cr8haVQodjK9
 ypKBSZjk8A7GLEMNEk/wxgqLtszpIR4Iug+Y9TIU29ryq2yPF5WKvO9fQ7oWpMXz4cPLq4g3sw3
 0Ovxh5tkuD3wEyVrfL+p67pmcZ6TjaH8vT7qP9HRzZ98hMPlZDfsjCoK70vucp1lA308IMUSnyf
 bE+7JXtkLt742mEPEVdnVa0DFDgV0hAhwr4+lFsqL30OnNLK4bpBN5XJaEO7v6Zie/5Oe4Yw8NP
 ESZwyRxYHSW140RH+BxT88kDyBBzzTh0N5MoD/0cxqJ4bm4mDIct48nmCLg7iYtOOq6Vbe82BZn
 zyz3f72O8DpcmEX6HtyfZKHsVe9JXlv52LpVWAw==
X-Google-Smtp-Source: AGHT+IEuAgZgwkFD7Z8Xqqn2h/YYU+isAy36WnGYO+M9a5Hc0G0oFkUuedFLpME4SUzRmU7sRh6FqA==
X-Received: by 2002:a05:6000:2204:b0:3a6:d349:1b52 with SMTP id
 ffacd0b85a97d-3b8f41980femr6076763f8f.21.1754582025300; 
 Thu, 07 Aug 2025 08:53:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459dc7e1ddesm176487365e9.27.2025.08.07.08.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 08:53:44 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:53:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/xe: Fix a NULL vs IS_ERR() in
 xe_vm_add_compute_exec_queue()
Message-ID: <aJTMBdX97cof_009@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The xe_preempt_fence_create() function returns error pointers.  It
never returns NULL.  Update the error checking to match.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 432ea325677d..5c58c6d99dce 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -240,8 +240,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 
 	pfence = xe_preempt_fence_create(q, q->lr.context,
 					 ++q->lr.seqno);
-	if (!pfence) {
-		err = -ENOMEM;
+	if (IS_ERR(pfence)) {
+		err = PTR_ERR(pfence);
 		goto out_fini;
 	}
 
-- 
2.47.2

