Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA5DC3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 09:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4248410E084;
	Mon,  8 Jan 2024 09:06:03 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881DC10E1C4
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 09:06:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d604b4b30so14018155e9.1
 for <intel-xe@lists.freedesktop.org>; Mon, 08 Jan 2024 01:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704704761; x=1705309561; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w2EyoLbnPqZmV+8zXuTXWwVH9AFKfyr2X73Q99Ksn7g=;
 b=UV5LqTbKAkaXwJikMZD+/NjF91M+GDEZUFSIrxC8+pjtVYUGucgADwdWtyCNGyJgMO
 sv2hECG7BdDDDwbmJkB1SY/mjDD6HDsoOvhtpxl+PB9TKgfn6xdldH54Nqt6kICO6lX/
 dNeWxXvcr2bQ/4s0QK1KQfRBqiatIPI3dxDCrqXdwWc6d5O6c0/YX259lcDGAeTRbS1r
 TaZ8RNUlMRNDqxyjjesqaBQDspFf4DC1o2RxPGQ+GBR27C6eYGdBlERo0nQAWBU9jn8k
 RG1ANQStK/CjlSt0FuBJy5uwlbDohGMGhU54PSjGWfQ4B6V8Ggf4+/bjHyihjRYVmMqg
 GJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704704761; x=1705309561;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w2EyoLbnPqZmV+8zXuTXWwVH9AFKfyr2X73Q99Ksn7g=;
 b=r751dCj3opXk72dfY/GM6rUEq08+wtb6cvDlA/mhwJWo9Y/i0+WU3Cr27+PBSQQe4r
 yGekhICEKW62qdB+6cVXnDfieH43CCH6EkdDY4JEwmQRRTFWtAhzx6iYj1P2ekGe9Ez3
 lCQJo3fmIwvzXWApFgq01WTn2BjpC1JENbpLtDoi/9BuXQI8SyCVN5jAAuRgrsfH4XSo
 UYEbz0vP5xkJ1IOikXPdxiDc8ZgQUiHxv3XZKKN336ATie1Z/HQAS23nZmVk6EupgZgj
 VV9gPcgDrUE42MTUaftE4qiaXy2cTvwttHLQRrgEl89TMzcC8VU2sZtl43kXjxdWALXY
 dWkw==
X-Gm-Message-State: AOJu0Yw27yvLDiVHZf98vADF594VtGta2YcbNS3D9EXdacX9cBOe4G01
 CXF3EyJQ6E4os/fzMupAAVqMfHqQE3K+ow==
X-Google-Smtp-Source: AGHT+IGCvzuvE9K9DjjuxaKem4GrCkze1n5YKKD7JDglZ2aL/3ZCSvPl+yXc9xU+sGZNscYNx6DS0w==
X-Received: by 2002:a1c:7204:0:b0:40e:4aae:7e62 with SMTP id
 n4-20020a1c7204000000b0040e4aae7e62mr12731wmc.58.1704704760955; 
 Mon, 08 Jan 2024 01:06:00 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 w5-20020a05600c474500b0040e34835a58sm10219495wmo.22.2024.01.08.01.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 01:06:00 -0800 (PST)
Date: Mon, 8 Jan 2024 12:05:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: clean up type of GUC_HXG_MSG_0_ORIGIN
Message-ID: <ec22d742-632b-426a-ac86-62641a38c907@moroto.mountain>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The GUC_HXG_MSG_0_ORIGIN definition should be unsigned.  Currently it is
defined as INT_MIN.  This doesn't cause a problem currently but it's
still worth cleaning up.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/abi/guc_messages_abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
index 3d199016cf88..c04606872e48 100644
--- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
@@ -40,7 +40,7 @@
  */
 
 #define GUC_HXG_MSG_MIN_LEN			1u
-#define GUC_HXG_MSG_0_ORIGIN			(0x1 << 31)
+#define GUC_HXG_MSG_0_ORIGIN			(0x1U << 31)
 #define   GUC_HXG_ORIGIN_HOST			0u
 #define   GUC_HXG_ORIGIN_GUC			1u
 #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
-- 
2.42.0

