Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2113C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 09:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8AB10E7A1;
	Wed, 19 Feb 2025 09:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V/7161N6";
	dkim-atps=neutral
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC9B10E7A1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 09:29:19 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5ded46f323fso8524590a12.1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 01:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739957357; x=1740562157; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LwbbveXSj0uskeS0+SdHJlKEV7+Qy4MHNmqC+V5NYGQ=;
 b=V/7161N6kLIr8E0KSbdukmWrht6a0JG9jT5v7fmijiUh9q6esL2+F/C3PywDyyNuFB
 /gq4TShDP7JK6ABXJ4MolHHsYRFYAc2voP7zWxB4ik7gEEBZFoJVDpvCSduMv58RYekC
 3mg/mkLRZEjIvmsQThJgsypF6mEVIZDUT7Fo/fpejJJG0XdV9VTij7t4hb3fHsRHdg65
 ji0i7HQQ3I31eH8jX9qTPpN6NNXqfLmbQjKxVsu6XFNv3hWomRpV4E+yr8alK1J7YUYJ
 cmPOJDO6qOKA9yOtcTpgAJNr4/0AXf8u8JVZ4RFlgbFCyDfMlHppvNjQ5DGIrFJpBXFm
 BXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739957357; x=1740562157;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LwbbveXSj0uskeS0+SdHJlKEV7+Qy4MHNmqC+V5NYGQ=;
 b=H61Xc8uQDCclIfNMopDQ3FWYEwpdcIRC/R5tFVefgEN/32aHvqOw1UF1t3UXrKWo13
 XNi4vJJKkkcGm2gormNX6TSMBQpFfPWNEvlVkLBHx54aTVhyCTNvvr8p+mCm4s+G5Ner
 ucP5cjN5ZchjHxw+8OEJ64ZIYzd+vRq8zfbeiP0Z9DI28zlK8eoG4EuCGybj5YNuR48l
 DHNDWkL2pSSM2kH+dcYqD/iGfxufKQhEJuhM6k2n2H9ex3G+gxq90kCk5umqO3anGoAV
 sb91LiPvkQgA7z1QAHZ0mJcElfvngz3y+siSM/QVPKPsz6KLRbWzj94gge2d0ed9Yqh8
 EV+w==
X-Gm-Message-State: AOJu0YzW1et/GzQuNgHWYdxXHA+exElxJ9vHTJA/8eKcpj+1CUNQ7q9c
 1AkNSRiX85/E+mC4uUdzwlhdLJnAhv7Erh809fjS8ZB8BHWa8mcYEnY4wyaYSXI=
X-Gm-Gg: ASbGncvNOAgZLYSAiFS9O2Ref4kXUGGWuI/i0xRFbVR+EDSs547qiEjN58VnSY3VBEu
 8FuiJq4N0awIfTfziQ0dgDGkSE2rBcgLpCXw6zTBZFRSVIWfvXamUZDMVyPNlthj/38a35YdMFE
 cSBSxogKEu8rRbUW9PGuKAmhbPV7ptpHMpy/I2e+++o0kxSKB93+jp+t14i+MxthbD1rmIJ5eVF
 eHBfKPsCEbEKUvg8H1p9z0HbWvUTx4gG+1y0J+yK5kDZpv28erS2d9xUlgj/2rkKTOYOuc0d5im
 1NNeVhoj5QZJG5RjiDd8
X-Google-Smtp-Source: AGHT+IGRsJbRmM164WuBXw2p++JFEcVk6bJPRtmApZQVIt83SZs2ySTF5XL2KVoMIW+/XNy8n0SB0A==
X-Received: by 2002:a17:906:f591:b0:ab7:d77b:43b2 with SMTP id
 a640c23a62f3a-abbccebaca6mr296332166b.33.1739957357531; 
 Wed, 19 Feb 2025 01:29:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-abb77551c60sm821245566b.63.2025.02.19.01.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 01:29:17 -0800 (PST)
Date: Wed, 19 Feb 2025 12:29:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe: Introduce a new DRM driver for Intel GPUs
Message-ID: <5fd5a4b9-88ee-47f1-ac3e-32a20960c5b0@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Matthew Brost,

Commit dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
GPUs") from Mar 30, 2023 (linux-next), leads to the following Smatch
static checker warning:

drivers/gpu/drm/xe/xe_guc.c:1241 xe_guc_suspend() warn: passing possitive error code '(-110),(-71),(-6),1-268435455' to 'ERR_PTR'
drivers/gpu/drm/i915/gt/uc/intel_guc.c:698 intel_guc_suspend() warn: passing non-max range '1-268435455' to 'ERR_PTR'

drivers/gpu/drm/xe/xe_guc.c
    1231 int xe_guc_suspend(struct xe_guc *guc)
    1232 {
    1233         struct xe_gt *gt = guc_to_gt(guc);
    1234         u32 action[] = {
    1235                 XE_GUC_ACTION_CLIENT_SOFT_RESET,
    1236         };
    1237         int ret;
    1238 
    1239         ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));

The xe_guc_mmio_send() function returns this:

  1388          /* Use data from the GuC response as our return value */
  1389          return FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);

All we know about it is that it's a positive number between 0-0xfffffff.

    1240         if (ret) {
--> 1241                 xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
                                                                            ^^^
passing positives to ERR_PTR() is verboten.

    1242                 return ret;
    1243         }
    1244 
    1245         xe_guc_sanitize(guc);
    1246         return 0;
    1247 }

regards,
dan carpenter
