Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90727C87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 13:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEAE10E853;
	Fri,  1 Aug 2025 13:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dac3BYDg";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8AD10E857
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 13:32:41 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4560cdf235cso11418315e9.1
 for <intel-xe@lists.freedesktop.org>; Fri, 01 Aug 2025 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754055160; x=1754659960; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2idx5QSV7SbSw8eO9muSjti0H6pMvCzwd4EGmVUbV4o=;
 b=Dac3BYDgfV2VsE7lZat+0KkdwnTnWiPYC1gt66d29BqEPONw2zLMb7elY2JxbfQWvH
 mJna2Yqx9x4jNGjqezGKjFYQzl8oLOq4D2R+G2BxuZ6PCzb2YnMk/p7ea6MCVTjUR5Xn
 ndzx/cR5wATMiFNJMA5cvnB2eqZQZ/ep6ozokdkdqW+l917WTN7Zw68P7U87byOcAAmr
 AMX61s+hSpqc1TtnZFSssz9BrtzEJck0aJmWWujSxAS4wnZ6Lz404Htpp+hyJv7N55KG
 NkX/hM/lqFscaHgSw/fD6Z1YmNtHl6qtURBY7SB/kT+QYtLDGt6Vz6uVadItPVFVTzaD
 DcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754055160; x=1754659960;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2idx5QSV7SbSw8eO9muSjti0H6pMvCzwd4EGmVUbV4o=;
 b=XFXVG4OHyyL4jVytGKFGcSycbhcJQQ9gpa/NUS2XFlJ/2NlLj+HRH1CxCAsSBi++Nf
 Vwwb6dx4UvKiU6erJ867z80QxMVpqSa7ZU2vThIF96PddTJXRT0TSte0Q726KxKdIqvn
 frznALM+7+59JJIDHbUixqR/V6hijxYuvBsWbjJTqFfG3Ut7Bknu+uQB3kGMEeLx29ya
 dT1uZIZGSiFi7SHc2HxWh/hzXOFt331dGHevsHxFCmqi8JJG2hn8pYcteYn2MkrIuAO1
 gkpWDcqTQfVSQ56jEBZ7eS7KMDl+NFXa6lGRhE6S2hC/Z3gzwR5wHFXPLocu6FuYtKYL
 jI9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu63qaujmNzshF5C43BXYn75SXTbASoUl6VoQJcNc5+lYuJIZtWeb1xeTdngwCXiIn2mbSg7wQIg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKJSiFB0HCvz7WuF+Ewy8yqIj42L4m/Qmfx5hR/UFJ83ALmWeE
 C5gYFdVu22ee3vfg5xyg+1T9Zzi612wSDNkqJGxKdGWzHBIeTufC5ttsgwDM27/vYcTg+HJZ1xo
 Epqa1
X-Gm-Gg: ASbGnctaoPCKeU3oguk7VHuvdqlfTYGASec7KEMHinxiwtMeectU0fYvCcELmAW7OyB
 DQcpnxsgSHYQvxGkSmyW9LxnkDK7y3sTBmiXL4rnRdJDUOmZwNXZrAB4mDrZ+U5TIgaeB5HMFW5
 DVLyDLf0+UaLhxa5Ko8po24YTEA80aAydyjPdOcAjGbQXFn3dsqt5dbrC3nsxNzAiUzqHKahfAJ
 ZaCP7A4CVgPQ+rE7r8eQfP/2yuVjy7UIQhFLLGK2uPgP6IGloixFMVGacjdgE8Br4Bs+XFQkK28
 2+VQoxdFARGpgrHXhvQJ3ORpzbvyt/6Nms40zTWV4YJMIBXMWbb0Ktv/lYbq22t5lA/04JmCfio
 sJgBSZvQw8WSVIUFQI1nJGaOuSwQ=
X-Google-Smtp-Source: AGHT+IFIP925vY6Yo9eRXJ5b38/MY0xKS/0uwFqRgqNx/TMNMJnubKb87tJwBNeV97YGf7Vh3ES1Gw==
X-Received: by 2002:a05:600c:810c:b0:453:6424:48a2 with SMTP id
 5b1f17b1804b1-45892b9e335mr130336025e9.10.1754055159772; 
 Fri, 01 Aug 2025 06:32:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458a7dd8cdesm42494865e9.19.2025.08.01.06.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 06:32:39 -0700 (PDT)
Date: Fri, 1 Aug 2025 16:32:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe/vf: Fix IS_ERR() vs NULL check in
 xe_sriov_vf_ccs_init()
Message-ID: <aIzB8-Y6wtZvfNQT@stanley.mountain>
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

The xe_migrate_alloc() function returns NULL on error.  It doesn't return
error pointers.  Update the checking to match.

Fixes: a843b9894705 ("drm/xe/vf: Fix VM crash during VF driver release")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index bf9fa1238462..e363240a3455 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -271,8 +271,8 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		ctx->ctx_id = ctx_id;
 
 		migrate = xe_migrate_alloc(tile);
-		if (IS_ERR(migrate)) {
-			err = PTR_ERR(migrate);
+		if (!migrate) {
+			err = -ENOMEM;
 			goto err_ret;
 		}
 
-- 
2.47.2

