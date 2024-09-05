Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CC3CD4848
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 03:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9655D10E424;
	Thu,  5 Sep 2024 03:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VF6SXK5u";
	dkim-atps=neutral
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CCE10E3D4
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 03:08:27 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5356bb55224so242797e87.0
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Sep 2024 20:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725505706; x=1726110506; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wg90eho1NN5KHQOILS8jppGY/NSDMd/xispQJ9CCEd8=;
 b=VF6SXK5u5cTf7jpvZII0FuDmCw5vKFY5wCyNs0yLzAIcCjFYC7CXVbO6aGtd6Qw04N
 LFxhtV9yUinWRar6GpELZE1itB23px06pmiR+bPep5S95wnIPNvc9JwHJ3B9iN/Pr6nD
 /NFoiOrpQKjQUn59+2o8f4EBnJ5XTSG6cAE72UtKf6e4iWHbl4K8M/9lWDu47nWIY/qp
 gmRADF1OVgXfgZd/1K5jajzZpLib7iC6z7tPpQLg/nb0nKmZ3fr36d52HLsYYuNdVKt2
 PO7k+QAjCZvrgg7riY5LxWeMscd3RtrPqSti6HlP1VvuYIa4k/f3drPHWNbNO2scv1mo
 3ClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725505706; x=1726110506;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wg90eho1NN5KHQOILS8jppGY/NSDMd/xispQJ9CCEd8=;
 b=Fk3sEpzucTAiZmc13GjpUlD9gOfOdfRFJbp0vURWXMrSmWvi0by32+Nr7K8PK5WteF
 SgDHCgv/GBo1bOTWTGg+0rONy7Z25ABEv7z1f6/8QUDN30K44jvmxzgzV+KFBf7yHddn
 lV6FgSUA9AjWnHvV8cnetg3PbtdtRbvPcRPnG0NEQnvnAr4Xhr72b9HuvYqJ1q+65y7z
 AiG9a3XzgK33G115jU0uWJzRBVJlsn+/22wnG4zzB5ku/e/IqpxPi8Vo4TdmPPCJ+2yu
 P5GWTn/E8uz9uqNu8lyb/u+R8eWy79d+BwfnH0BTDa2MuO8bbmUENDJMOS/6nIvH8tny
 M6lw==
X-Gm-Message-State: AOJu0Yywp9E971qP8aPNcPK1YKF3zDRF5C+v3PRthVKLdKhLpmmchTXA
 CH1Cv8WEq7SnFZhRcemUOO7B1gc0TrK2K7gZNRF87J1BEIekUAX1Zfw1BHt9+Aw=
X-Google-Smtp-Source: AGHT+IFS2SH8V6BfMue9a/tZMnJv31NuvpbvMZDdc2zfWEvaj2lRGOa8zyeQpUNMbYTS6CvNIU5M1A==
X-Received: by 2002:a05:6512:3e26:b0:533:43bf:565d with SMTP id
 2adb3069b0e04-53546b45292mr13195276e87.27.1725505705252; 
 Wed, 04 Sep 2024 20:08:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535407ac190sm2485277e87.96.2024.09.04.20.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:08:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 05 Sep 2024 06:08:22 +0300
Subject: [PATCH 2/2] drm/msm: add another DRM_DISPLAY_DSC_HELPER selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-fix-dsc-helpers-v1-2-3ae4b5900f89@linaro.org>
References: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
In-Reply-To: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BCbsERjKTr7ofnF9wFZIPROtJSJ8qvwLvP3xHx0S1jE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm2SCmybu00XFAc9fujRRSrrHOHRKtSvgq5E7u+
 0ErMTKGuXaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtkgpgAKCRCLPIo+Aiko
 1Sl9B/4zozy7yVS6RWpddXd9g6pE9XQMwgmW3D/LAFsWvdrVOcU5BdpMBXwAQ+3gnaRYYaRPGGR
 PQUnF4sf1JHAdvX7eftAQDwZqm1zS8sVpf0fkr+UKSF7wHKEozTwFKwUmHkMmeFnteiAz6D/DRf
 wB+GPvicWfQLGpW3QiXxv+7da8MRnB06s/P0d8N5G5I6ivuROWVNAQVrg0auvA5blTVz71UKafL
 pnPLsSrxE0BSdm1EIJRWgbIMcyr+X5tuhR4pQlQTSJonqC0i2MymA+Qxq2tF3DK5lTU9lXDK4uT
 wRua1p5tZQAvJqJTsLuK/5Jbd1JhWE09gePQQPwqeJh+hXUK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

In the drm/msm driver both DSI and DPU subdrivers use drm_dsc_*
functions, but only DSI selects DRM_DISPLAY_DSC_HELPER symbol. Add
missing select to the DPU subdriver too.

Fixes: ca097d4d94d8 ("drm/display: split DSC helpers from DP helpers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409040129.rqhtRTeC-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 94d3ed4f7761..c8dda0ebd043 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -92,6 +92,7 @@ config DRM_MSM_DPU
 	bool "Enable DPU support in MSM DRM driver"
 	depends on DRM_MSM
 	select DRM_MSM_MDSS
+	select DRM_DISPLAY_DSC_HELPER
 	default y
 	help
 	  Compile in support for the Display Processing Unit in

-- 
2.39.2

