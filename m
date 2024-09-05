Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A420FCD4F4E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 03:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768D710E023;
	Thu,  5 Sep 2024 03:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JYM73ZzD";
	dkim-atps=neutral
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B8110E023
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 03:08:26 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-535be093a43so248483e87.3
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Sep 2024 20:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725505704; x=1726110504; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HvYt71IhRdNBRbqhn8a/BIchlxMJnpCn80h85xgik/M=;
 b=JYM73ZzD3CUVRSf/RA3NMSOk9phvAukpS8GYfEzpA4WHBOXTeZO7P+wU76IhIjDptR
 HVhaUuBPhKUyBsM6y8ZpMrUM3I3R52NpvZF5UtUpblj7/4rMhxWRqKYLNEuGckUOuynM
 9d2g9kjoeWU24tumU8habPRXY2rceCvlL+8vxDSHt6hsq81GeMTafhIB/4esGHIQ5evr
 Ymn6GT4nzUpuzv3qGebtDm50cJW91wgnGBEhYe5mRX6rFlV0pOanohWZ4ufEtDK/GBTe
 ANPV5GVpjJ7hIMYaAfqOJg5MqcciVTq/HfX8g5gyS8B1egDfJDRk6JLIYOJrawSpgHHU
 v5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725505704; x=1726110504;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HvYt71IhRdNBRbqhn8a/BIchlxMJnpCn80h85xgik/M=;
 b=CbhG1e9tqo8O9a2wBzg8Ancu9PChSioFMf+HBNfb9NEzFHPSw6+QGd7EBJtllNfrT3
 JWw836H+1YHpQBFmRnKeR8WpL6tEX2DWs2yzgANigMeUxax0dT7NuoEM0rpvW+WyKcCQ
 +3d+fk6Vovpof16Yhpa9HkbdZE+GtVJJdvdLnrFOUQbiR0mz/Xgy2UkDGBL441EaVPqv
 UL7Cvyt/DR8XxPHHfeVUP9k4oowmiPew/ppaZoHwl6y8/jtTqnI15g4xCSJlj8Rg5STj
 gyyV48O32xvE60Fy0DwgDUMTPQ1KT2giqa7Mt3QHHkRZIY4sMjpt/XWHSIfQLNfG9hld
 6H+A==
X-Gm-Message-State: AOJu0YzGjy5dcihh8FchZoNTvV1f/QYaMzRjg9V2vHkTIVtO/J2UrhFR
 rwfkH2yJRaOW5Z6JyMucusvVcF/ZKNI9BGM3vrkHMr7KXVPAUGb/VWmNANR+eGM=
X-Google-Smtp-Source: AGHT+IEiDYfVZsrNlZ5O8YNAwFl2737GXUD/v4D2IGhJ131AJFOBBx+cluZA8P+8k5TWguYcgEK3Pw==
X-Received: by 2002:a05:6512:2803:b0:535:6cf6:92f7 with SMTP id
 2adb3069b0e04-5356cf694a0mr862945e87.59.1725505703317; 
 Wed, 04 Sep 2024 20:08:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535407ac190sm2485277e87.96.2024.09.04.20.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:08:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] drm: add two missing DRM_DISPLAY_DSC_HELPER selects
Date: Thu, 05 Sep 2024 06:08:20 +0300
Message-Id: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQg2WYC/x2MQQqAIBAAvxJ7bsHKIvtKdChdcyEqXIhA/HvSc
 WBmEghFJoGpShDpYeHrLNDUFdiwnjshu8LQqlYro3r0/KITi4GOm6Jgt416UN5uZvVQqjtSUf7
 jvOT8AfRsPL1hAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=670;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=viS4n3xLp03m75Vm5VBHdsK94DFv3lMuD1s+hR1hOlM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm2SClVPVGX65kkU0QRSPr0U4aIl+tCD84SrxEb
 rkB79ppEqWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtkgpQAKCRCLPIo+Aiko
 1VFjCACTrtFG/p4A2auGtjYg3mDRqLDcCvd7/H9xfsmeO1q8pLN+lwwLJ3mcHh7moIV1ykCamfk
 vsig0eklrVMOTjUN5El/ucqiO11eIGsaFYsyJvYAHh4HaBpiFDUZO6Oz/y+yMx/l/z7jW0jt4fG
 rkXsZJ9+w1HpA4oCLrmI78gViOgVETjg47JTRFY4BNJdUkNtyuN2UeJrN/0X3aD1Fwx/ifrJRxM
 a9SKoACBKOe/SAqoiVagQCseXyMW1mN34htWl/Csxw9P7nEFrp58F60+irx09GtyQXqu6fdsALa
 E6Stjms28Tz66hYuU5tyG/6yxg3zzDxAmjK5teFd7bli8OaK
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

Add two selects for DRM_DISPLAY_DSC_HELPER which got missed in the
original commit ca097d4d94d8 ("drm/display: split DSC helpers from DP
helpers") and were later reported by LKP.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      drm/xe: select DRM_DISPLAY_DSC_HELPER
      drm/msm: add another DRM_DISPLAY_DSC_HELPER selection

 drivers/gpu/drm/msm/Kconfig | 1 +
 drivers/gpu/drm/xe/Kconfig  | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: fdadd93817f124fd0ea6ef251d4a1068b7feceba
change-id: 20240905-fix-dsc-helpers-3b8460fcb9af

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

