Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6127C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 22:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC9210E714;
	Tue, 15 Jul 2025 22:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jvvpVscm";
	dkim-atps=neutral
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA6510E714
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 22:59:46 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-73ce7b40d7aso199072a34.1
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 15:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752620386; x=1753225186; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OFDftDinGJeWeNvMt3z+fTzSOMnuJXF888WFq+QttdM=;
 b=jvvpVscmIhW5WQdBa29moTPeVcCltUzAv9KvTVUVB580P64OPPwjkdO/z92OsbW4t/
 IF9mkrqHf6zWTLraYu6jFKjAfLC7jDxrnNY/rsxsCM/TOCsVWMbkF9y7l43NTwLfZBGK
 QWXBNSoo0I1awGzP7Bwui667k4CPMrvNCqGCixYOAsnrIxcryiH0HxLFvO/rRZtUN02N
 XfOPvzZEgBs9Toovxd1qyGKKlIjJXiLNdW+fZFA89FiXOyN+4sxByas7tpffxT/okO0o
 SDt/dgs4CwuU05SmWvv2xVRH+E4djaT4uvWfTsIVZNnOBwtWBeQB98kVY+ca/taTMC7Y
 7AWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620386; x=1753225186;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OFDftDinGJeWeNvMt3z+fTzSOMnuJXF888WFq+QttdM=;
 b=eVKMmgNMhzNpBINbxxTrEGlQrTRUsb6shFxYl9R2cjmXaapUxjlvml/BrxO3mJKQ2+
 hb2sLxxDK8yK31KsPNK4QPADoa5BQIkXZIEt+uIBgvZ9rPju3NG4B2o/G5QDnJOGvBgs
 4faYU+4McUEHE7wF+X77MD/cazNUP6VS93zo5LYcY4js5Rr2zX2XwEmX3uBNe8WFWN9G
 gIC2Q5bF3H0Ii7VgkT2AEEhx5rJv95SqzFxyGD/aCAIJl31JqwB0TyZsA5WN//8DWljJ
 9Lod5M/5Stt2DJtJPeuGGWAjkYl6anNALAhccd6fWeg9mpVcRvji2S4QMybZzCNtDavO
 6IRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW88NWFyNFSO5Gxb6DOZz662t1loM3PI1DxYTeylcpoj6KgnaF2mdUnmuj5OWMOoWwZjC15zwfmQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNh3CcpFAvGkR919Kp/sAGbw+jMf+iDzEHJ/RRjK2wrzi1xkWL
 t07XeFLfSQPjGyFgH0FQDm0YabxKmMsX1ihF5Y0ifZpRP0DuosIPa4cBhbpFaCRvKcOUH3Gflhd
 xcizo
X-Gm-Gg: ASbGncu9lvAc1T4GpvJ+aYdqSLAN03nC8PUnOzi8ApLdQezvhSJojtlzDbPrevSM4Q8
 GsitrcBc6X3hxuPeC+5/Fw0pvULbvyjaspWzNtq81XvT//YAlH40X8ce3J4DFuocLWdLpJ6TT4d
 8yAJISf8ETeXHFizfuQ+CKA0SkeMPkOHz7hgcd0UjavLD+nzm28x4cDzIJPkeI05Hr3tjLR/u3B
 I/1XGW0YyUYrQtqQ1j6XcdZNiL+E9D+Xprq9y5ng6BRg9lQH9W8nB8rgRQBCXd7iSMJHJO3ViGI
 tpJn3Hgo/vnSz13Y2CljlV87wU2prR+bC4hgxvHyRnJ1cuxC6R9w+nrFmHufbYCW2Icygfl9vPm
 ufGr48QCDDjl6g72QiWjsRtoIKyS1
X-Google-Smtp-Source: AGHT+IFowfVX3G4HjzfwSYl1lhCis63CfINpQgLZSZ3TnKOciDf8Pn3iqvnmzXQdfCjFJtdK0DYWAw==
X-Received: by 2002:a05:6830:98:b0:73a:8a05:cd3d with SMTP id
 46e09a7af769-73e5734d2c2mr3545805a34.0.1752620386019; 
 Tue, 15 Jul 2025 15:59:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
 by smtp.gmail.com with UTF8SMTPSA id
 46e09a7af769-73e541c3a6fsm1022866a34.57.2025.07.15.15.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:59:45 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:59:44 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe: Fix a NULL vs IS_ERR() bug in
 xe_i2c_register_adapter()
Message-ID: <65825d00-81ab-4665-af51-4fff6786a250@sabinyo.mountain>
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

The fwnode_create_software_node() function returns error pointers.  It
never returns NULL.  Update the checks to match.

Fixes: f0e53aadd702 ("drm/xe: Support for I2C attached MCUs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index db9c0340be5c..1f19718db559 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -96,8 +96,8 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	int ret;
 
 	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
-	if (!fwnode)
-		return -ENOMEM;
+	if (IS_ERR(fwnode))
+		return PTR_ERR(fwnode);
 
 	/*
 	 * Not using platform_device_register_full() here because we don't have
-- 
2.47.2

