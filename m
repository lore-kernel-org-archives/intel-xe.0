Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05FCE77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 14:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F67A10E8CC;
	Wed,  8 Jan 2025 14:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gBN1KCMM";
	dkim-atps=neutral
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8387610E8D0
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 14:38:38 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3047818ac17so147934591fa.3
 for <intel-xe@lists.freedesktop.org>; Wed, 08 Jan 2025 06:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736347057; x=1736951857; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
 b=gBN1KCMMYtUPW6nIHBKSjLVr/vn90l7BJuaxyNBKEAPAwVZWng8rMaDLaiQFYjYfPE
 gnEvjozNNHgwpbMRBashjrgtVtUYHzrYYL8y8N4TSCXPrSe27dkOu38r9obXJkSSsbi1
 oG4btBXD2OBhSdZyHorH5gH5J93iPeEDp7vDo7QNBXjAtingG2wgh4FWDdBkHf9ouoEq
 XqgPyDjprFzgnAxMiPx8imNkWLvBUmerG6amz13IMoXzFq+jjoJqIXidg0SVFmlx83wL
 w1z8hXUIwl9qjEUMcGQJ1NRn2OOLdpf53ZLbMJQujoONx1fqYeDcvO9c/cmMfFM9C7BS
 VO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736347057; x=1736951857;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
 b=aF0/4ZZb7xzuUAV5lhJHJKT0mCtZPWTuqhpzNQeDqzAo0XtyNYC52I7KPfYhjvOtEP
 ViqShEkNR+VAZEchL2LiCJ2U9xl/tuVdIa0s8ZAUznr3V/7FOgehzMn2gz2ykaH/jlTC
 mtWVTMqifPlLWayqpR3bw08nykl/YusarNFV0GHuXkuzzC9l60EaF2NP2brGQvpOKCg0
 R9XQy/yef292TJkrwnRGc9yrElaPbs/jYoHSzXhlGIimPnnNFHMf2zarjeiJVIDqQlLT
 YclTK+zVl4Nsd46WTZtnp4zaM/iiouVAqzDRf1kulIuXCVMgAacMGs31jHZNbV/36vws
 /zaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjDyB3UvBrN9OsqA2OD4H7P9JSiD3xl3Utptt8pUy9KhLg6FMI+Hw0kDGMU9D24lj3z4GMJ/++/A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhWewQ8vgXeI5BoWFCqJhOLiyZ4vnqawr8AhINx4Xnwejw9d1B
 1P7eiukSazp+xZvwwNigf1pIHENoSG6KE8dWRVYptJGHMo79x/siuk8eTSWNTn0JQr5jDMZh/fk
 4
X-Gm-Gg: ASbGnctsgGbzlKX4wX8arxYwfQXPwRfGJ+W9S7c7BcbhxNAPr5PJibFuZaI+z5e+1IT
 7YjKcMDBRHG+3/XyfZ8FziQMwAsMxJwCGgXwWURJ8QO5Bhj5GHMBsz2vSnrkgf4I+axoo9mRbv0
 VAl7EXYZkA5jSyIjay/nSDdL6P7J+HGkamKJ0RnO5gT5xi7VObXj05Jj4Hv0r7q6FqxNgqSpIJE
 CQYHtnGRIHdhqUAJhUtqRmL/gZAOYmOGERrJte0sfItbmjiWGco+YrX
X-Google-Smtp-Source: AGHT+IEeHzOxvdMOGmcpEKHTmCQ1xR9X2mBdhrRAs090fw105gW9jWt3zL5YMm4BKVnJtfcnbPIJ6g==
X-Received: by 2002:a05:600c:1c1d:b0:431:4f29:9539 with SMTP id
 5b1f17b1804b1-436e26fbaa6mr23365835e9.32.1736346727258; 
 Wed, 08 Jan 2025 06:32:07 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89e14sm22741445e9.33.2025.01.08.06.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:32:06 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 08 Jan 2025 16:31:44 +0200
Subject: [PATCH v4 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-2-918949bc2e3a@linaro.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
In-Reply-To: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=zSpYhtCfdoGV8lx5sZ6QJCKOEoZaxgqNtvMuGie1uZU=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfoxd1zaADCiqyAG6sqqGiZaCSMDvAko7Z/RAB
 qnzYaAuP/uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ36MXQAKCRAbX0TJAJUV
 VsotEACKVYOAT4FX0Zl5/UtLfxszK6yqfSpvZBETDmfriJH3iARfEmyFCwzxT5krleGndSDwyWo
 muThvi9bmeveOffXwjS8yLtngaQQXm823SZWXLksm4rnDrgYtt8neXuYFKlkIwT7bLnydJ0DaJN
 JHTd3qWl1JqaA2voGitbWcjHGm+pQsyLr2qPugi3oVy0SbKleIX4uOHpcF/bie7veTJF4NIZIwn
 78+SUdHeJnvW0KMTl+Lx3YB+0kuMf0lzwSSFNiMZh8gAngpJQRE83FncDSI9g3RDXdaIX1VHmZ5
 cx/PkZKSloNzdooFCZWaHCeEShwsSeLD2xPGWA9JRf49cKwyEso50jtquK264rKvDzrAAvWV2QT
 6XXoLhrTkffqBoOqgbrc2WQbCpi2K6lIsWiqcKWPqfpr3XSUYpRNbvq+b0xwy42+D+LgpfbhUXJ
 dpM7NrjpU5qwl3BcPEHj+6IrytmW2bX4R5o9NArIQIi1rxnExJtr5XP9GGI7U3rHuW1wnciXJJx
 ogtweTyXXFCBIQXSAf4Uxwu+GkVziAZ1KkCB0OX5wDzOScajLIhPmr0Pt05vMOZbglN4KM2y+Rl
 esuSrBYIrshvVYjjyJ5H+uB0nipBl+fsNU0e9efycXuEOiA/7n2y7TeXx2vsg422BzYLPp0aHam
 l+vjJUlVNxarFVw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index bcda0105160f1450df855281e0d932606a5095dd..55691ec44abaa53c84e73358e33df1949bb1e35c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -79,21 +79,8 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	    !drm_dp_read_lttpr_common_caps(aux, dpcd, outp->dp.lttpr.caps)) {
 		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
 
-		if (nr) {
-			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-						DP_PHY_REPEATER_MODE_TRANSPARENT);
-
-			if (nr > 0) {
-				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
-				if (ret != 1) {
-					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-								DP_PHY_REPEATER_MODE_TRANSPARENT);
-				} else {
-					outp->dp.lttpr.nr = nr;
-				}
-			}
-		}
+		if (!drm_dp_lttpr_init(aux, nr))
+			outp->dp.lttpr.nr = nr;
 	}
 
 	ret = drm_dp_read_dpcd_caps(aux, dpcd);

-- 
2.34.1

