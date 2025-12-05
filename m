Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F978D2F7E4
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 11:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A53E10EAE5;
	Fri,  5 Dec 2025 11:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kHkDd8iF";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52A310EAE5
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 11:39:17 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4779d47be12so18445455e9.2
 for <intel-xe@lists.freedesktop.org>; Fri, 05 Dec 2025 03:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764934756; x=1765539556; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ydvHPuR/TEWjlqHSyc+IuhV3845FKKl2OTvoX5xFzHs=;
 b=kHkDd8iFSlYrUZhrRj8myuMErkcKSkuoSie/BtlrVX04BB5h0VjvPH94r1+qXDxgSv
 89xtJSc3Q5/Fq414tAgtMf5pr2PYmw5365p06Ybkd3uo0g2inN65RcZFj6qJ+k0Ezc9h
 Co6R+mbpWYmOshlbex7jBDEKbVoXF3wiAntcWUxf3d71uUczNNqEy7WPya/WQYuF24Q2
 aW0v/EXL34zE7Kk7XUEiW3Ci49WIHkvvk5RLMUf9H3os/4p6c2y3rPsxgqKZR5S30O8w
 sQfiePRYtgO7wNzrsUqssRBe10PYcq25C3am0sRKi65qJAjl+93sHVEpKhp+ZA1PWjLl
 xK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764934756; x=1765539556;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ydvHPuR/TEWjlqHSyc+IuhV3845FKKl2OTvoX5xFzHs=;
 b=MToeS/D9cFaI6sZ7lcW4ehh2lRdTRkIv1cmzdTUGrK0gNY0LQQ7FNvAM8aVBBe5tdn
 Yg7HunSj3x2IaZ8eQWRO4AXOVY5zvUsKXbx8pZfIopew8IaUL1Fg3oYrrGAL+HGwdNVM
 S4BLYO4o/T26NJMddvazser61z6XCFRL6MYBWrlwI8NiCJrxJrX0K1JG5at2rJAvK76i
 og8Na4hCr7pp71tFHYRSg/ujD5K5oTbm/FCp19aO6HYJgWv2Jt1nLMOiew9He2xOLvw4
 B0e0/w+Ia94pKTUDF9uC50ZbnWR42ahYtbpGRFEqqjbg4JUZxZhbFWh1TRKpw2ECd8Qa
 1eGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwBM8YAKY7uc/gFJ2d4MksXj9zUg1bR8HawVGhNWt4nerutAQjqpwGjTGnxbVPbhK62fXbBVKUPw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ01YdeiwwGbAE9Z7oswN5kOJoDkxnOE0aPB94WcXS/AIgzFNa
 Nc/95jR2M4U3Jsd6R6rZp/FD3Z/Ho/WUXOtwIf1S5eeD4K4Hfcu8zKoFOxazL7euQak=
X-Gm-Gg: ASbGncv6KM5E+H4Qz/LZoKhe/fX8MP8j6CObpXq60xPAxEB1YXDxc+W9L5ri5GZOVQs
 EKwyMOuUGo+NR2SRG5Nr6hPRmaLSVul0Vb7lrErzmFXk/PI1O6fLuejojOQZJNq3WPH2vGvRa24
 oCvCva4poyZvxzFTexuxe0mTsEBc4751K1mUufPnNM9YIt6tDLtjyfp3XNG4Qkn8EdZbrdcx7Ll
 dTmynJphKaKE39v55V4kh4M7/ech2k5+PzM5Amc3pw5X1lLKbnZVASvGZIs/F48IfpoHbtXuxUg
 sVHlReylVN+rpBHseG0p4fu6h9O8E33swpbgYMkxzCvXRz4vYIAeogBD5CQ5trTUG91cqV5xa79
 isH2g2RTAcAFP3Vl7XWs8ISd7VMWz3U+/rpWwzJrparBPqxsn6pXpMQD1JsLkaxw1keVATwr5hB
 vFSl5aNbmcJDv1AuT551udjk+ZNb4=
X-Google-Smtp-Source: AGHT+IF/vwM9KOmX570wAov4Xy6x0tD+87+iHCXLimHTetQ/1oLM41jUaLHyTjztyr8/nNeI54dvbg==
X-Received: by 2002:a05:600c:c8c:b0:477:7bca:8b2b with SMTP id
 5b1f17b1804b1-4792aef7050mr121690165e9.15.1764934755224; 
 Fri, 05 Dec 2025 03:39:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42f7d353f8bsm8501158f8f.43.2025.12.05.03.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 03:39:14 -0800 (PST)
Date: Fri, 5 Dec 2025 14:39:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, kvm@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] vfio/xe: Fix use after free in xe_vfio_pci_alloc_file()
Message-ID: <aTLEXt_h5bWRWC0Z@stanley.mountain>
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

This code frees "migf" and then dereferences it on the next line to get
the error code.  Preserve the error code before freeing the pointer.

Fixes: 2e38c50ae492 ("vfio/xe: Add device specific vfio_pci driver variant for Intel graphics")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/vfio/pci/xe/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
index 0156b53c678b..8e1595e00e18 100644
--- a/drivers/vfio/pci/xe/main.c
+++ b/drivers/vfio/pci/xe/main.c
@@ -250,6 +250,7 @@ xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
 	struct xe_vfio_pci_migration_file *migf;
 	const struct file_operations *fops;
 	int flags;
+	int ret;
 
 	migf = kzalloc(sizeof(*migf), GFP_KERNEL_ACCOUNT);
 	if (!migf)
@@ -259,8 +260,9 @@ xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
 	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
 	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
 	if (IS_ERR(migf->filp)) {
+		ret = PTR_ERR(migf->filp);
 		kfree(migf);
-		return ERR_CAST(migf->filp);
+		return ERR_PTR(ret);
 	}
 
 	mutex_init(&migf->lock);
-- 
2.51.0

