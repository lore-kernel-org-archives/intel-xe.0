Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6BFD0D794
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 13:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3817D10EAE8;
	Fri, 11 Oct 2024 13:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="tV1tMXYn";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DA110E5BD
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 20:55:06 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-20ba9f3824fso46805275ad.0
 for <intel-xe@lists.freedesktop.org>; Tue, 08 Oct 2024 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc.com.np; s=everest; t=1728420906; x=1729025706;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0tFkED+mY089YHzAtW+B1O+++Bw0Z0pfmZQ8b1ZguYk=;
 b=tV1tMXYnmFaJB4EbvwVZdBUkMld7Y5n8y7YlrWWai8RdSUzv2Pty7nncsNGuYw+mxm
 qAQtu7YT/TM8vBlLUk0i2JUbIBqLmKkXoGzdY8oHnpCbYmhU3QzsCmAxOiaz7ptavaRL
 wGmKIdpMnVX5UuzkWcBTayA+Ty9z2twbTZB9ZbFHUTSmQRaAToUHX3ZllhwwdPzuukeo
 wN5lY3VLG0lINiI/m+bj3hHLakClcFpbrbqDVEKwA8j4Ans0kmo/U4dMD/53RRPEiAqY
 KHIGuOULnQSGIgyf9evxYgGhYsS8bcMutjSdoODOKcRT0cOpVtDv+rQLG/UtQlCqtE56
 l+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728420906; x=1729025706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0tFkED+mY089YHzAtW+B1O+++Bw0Z0pfmZQ8b1ZguYk=;
 b=FuYRxF7DPOISL+CG68FXUq4RjyEh6Af2diriSodA09/LenunXMxm79Gs3UWtrP8mGc
 o1cbSB/qq37mxtR093vlh92gA3Clbdqj6NGWa2Ou4cpPGjiy8RUJ6MirvRL1myIKuhAg
 iUPq+zHFYjhxXHrL+NVyDhKLLp5UrFF5ReAoKefV5cHv3VqYC5U0mESfRP1nYIz8L3A3
 Khyv9bVFIrD+ofLFFvYIFivC4Q6VMDHXBPh8HduByWdUUcIoOWSSLeSlHFRfs7Uxa+rR
 z4r5SYBgA/TsFMRMkJH5O7CXItnSEW6/JVOrFjX5GA/A4C77W4KyVZugXgOix/FyHQun
 4Hsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgSukMN5NI8kbM8XzsWOreBt/Cti9xgQzMAccFFrcoRWPgg9aR08NR85Ql0DbdpVLg28yABt1lUw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx73of1lc1WPdo1ifRybhnn813b7EdVL86xQSlc5qyXwWKPss1A
 0xYK7kmK5G0FV5CvzAxr7w3o8zuZLaubqWXP0WyJnd+H/5XGQEOaW+GupmBF5sk=
X-Google-Smtp-Source: AGHT+IG5QtndTuvxUc4EQsIUMZuzUEKCOMQYR+xtaqDBDhzPRGHOGMjKNeFwj/pDDHDOMAis6O/BGw==
X-Received: by 2002:a17:902:c411:b0:20b:9f8c:e9de with SMTP id
 d9443c01a7336-20c6376dfefmr4938325ad.13.1728420906131; 
 Tue, 08 Oct 2024 13:55:06 -0700 (PDT)
Received: from localhost.localdomain ([132.178.207.21])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20c13986787sm59611735ad.242.2024.10.08.13.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 13:55:05 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>, skhan@linuxfoundation.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/guc: Fix deference after check
Date: Tue,  8 Oct 2024 14:53:48 -0600
Message-ID: <20241008205352.4480-1-everestkc@everestkc.com.np>
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

The `if (!snapshot->copy)` evaluates to True only when `snapshot->copy`
is Null. Thus, derefrencing `snapshot->copy` inside this if block is
equivalent to Null pointer derefrencing.
The `if` condition is now changed to evaluate to true only when
`snapshot->copy` is not Null.
This issue was reported by Coverity Scan.

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 7fbc56cceaba..4e1a5e8ba1e3 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -122,7 +122,7 @@ void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
 	if (!snapshot)
 		return;
 
-	if (!snapshot->copy) {
+	if (snapshot->copy) {
 		for (i = 0; i < snapshot->num_chunks; i++)
 			kfree(snapshot->copy[i]);
 		kfree(snapshot->copy);
-- 
2.43.0

