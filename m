Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A75C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 14:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2149F10EB4A;
	Tue,  7 May 2024 14:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wsecaT/0";
	dkim-atps=neutral
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5546A10E93C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 14:53:48 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-34db6a299b2so2856153f8f.3
 for <intel-xe@lists.freedesktop.org>; Tue, 07 May 2024 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715093626; x=1715698426; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j7kmNI81ueJ+8K9p2euywm2F9bZhRCB2pfex1OgyyGM=;
 b=wsecaT/0YJZ5ujDZ7EKUnodpgv7UqjU2nRApmtsnF3d71AEHwvp/7aNkcjLII2gABC
 rE/VT1KAeF5xv7Nubcj7eiyKo950lFPX9SHP09SnfcYjeDkzSDQCM3wWyczqXg+5D38h
 dwfNCKGDWaj6ZDr6pvDIQRe/dp3Oiw606mV2Z8Bhras1EcISrjwDoX7WkW5u7pnskfAm
 Cv4EKfPBysugC3YxBCMy3WTS41jR0tV/7laIOXaRLDrvTQmvmfWOx6xy2TL6AZkSqJDR
 +YQ8ms11ss4WH+NjOtXURPCokponM/e5PxhPIwUGYiGOTGWzYjeQP908lsj9m3ET8pQC
 zasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715093626; x=1715698426;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j7kmNI81ueJ+8K9p2euywm2F9bZhRCB2pfex1OgyyGM=;
 b=qHDn8BuYfaYbczBBZ/8ed5FaFV4qQQEMze5jP0fZfpo0qcIz1ql/NTDwqxMlO9x+g4
 yO2Fgfw2fMlxMWWStwjH0uXctLJ5DlSl251SXFW12uQGsv5PQSv/XvoG/6+DZm420SRE
 e3cKFdRUJ36H0ZlreTJVDIgqHXZWEuFIvR7tv4OuA3jEsHzDpH8sq4sUo1GgAjLDbHA3
 SfSr11zs1eiQ5sokUe29to1+wIx4C6Wb3pIghb0n3Zfn3955/zkK0wG77BbPGhTV2LB5
 Ubz4F24f35YR6P+NbLUjep7JsONGPPda4H9TL3WQCVfgvgw9Ihmv09RhUlZbxCtBFVlx
 WwbQ==
X-Gm-Message-State: AOJu0YzGS0gyADjPOzDQ9E8zu03TkLiYWWarrDKBm7IleDgFDGS0IWHs
 B8HEasV+Wkp4Vq8/8Un3VwbxIqm6PGxk5eDjd5iFcgvPl9NjlHJtnbn94+w64cQ=
X-Google-Smtp-Source: AGHT+IGoHpXayaaktiS5UIGYOYKiKnq5pSh71Xeh2wLuSTyhEuIIUS/pHpvSW3rttQtwUKbjyl18gw==
X-Received: by 2002:adf:fc8d:0:b0:34d:9d2c:8eaa with SMTP id
 ffacd0b85a97d-34fcb3accfcmr1060f8f.67.1715093626443; 
 Tue, 07 May 2024 07:53:46 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 v7-20020a056000144700b0034c66bddea3sm13213929wrx.37.2024.05.07.07.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 07:53:45 -0700 (PDT)
Date: Tue, 7 May 2024 17:53:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: matthew.brost@intel.com
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe: Introduce a new DRM driver for Intel GPUs
Message-ID: <dfab90f9-0989-4652-9854-91a00a7d90c1@moroto.mountain>
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

	drivers/gpu/drm/xe/xe_hw_engine.c:611 read_media_fuses()
	warn: was expecting a 64 bit value instead of '((((1))) << i)'

drivers/gpu/drm/xe/xe_hw_engine.c
    582 static void read_media_fuses(struct xe_gt *gt)
    583 {
    584         struct xe_device *xe = gt_to_xe(gt);
    585         u32 media_fuse;
    586         u16 vdbox_mask;
    587         u16 vebox_mask;
    588         int i, j;
    589 
    590         xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
    591 
    592         media_fuse = xe_mmio_read32(gt, GT_VEBOX_VDBOX_DISABLE);
    593 
    594         /*
    595          * Pre-Xe_HP platforms had register bits representing absent engines,
    596          * whereas Xe_HP and beyond have bits representing present engines.
    597          * Invert the polarity on old platforms so that we can use common
    598          * handling below.
    599          */
    600         if (GRAPHICS_VERx100(xe) < 1250)
    601                 media_fuse = ~media_fuse;
    602 
    603         vdbox_mask = REG_FIELD_GET(GT_VDBOX_DISABLE_MASK, media_fuse);
    604         vebox_mask = REG_FIELD_GET(GT_VEBOX_DISABLE_MASK, media_fuse);
    605 
    606         for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
    607                 if (!(gt->info.engine_mask & BIT(i)))
    608                         continue;
    609 
    610                 if (!(BIT(j) & vdbox_mask)) {
--> 611                         gt->info.engine_mask &= ~BIT(i);

This would only be an issue on 32bit builds...  The ->engine_mask is a
u64 but BIT() is unsigned long (32 bit in this case).  So this clears
out the top 32 bits.

I think that we don't actually need 64 flags, so we could just make
gt->info.engine_mask a u32.

    612                         drm_info(&xe->drm, "vcs%u fused off\n", j);
    613                 }
    614         }
    615 
    616         for (i = XE_HW_ENGINE_VECS0, j = 0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
    617                 if (!(gt->info.engine_mask & BIT(i)))
    618                         continue;
    619 
    620                 if (!(BIT(j) & vebox_mask)) {
    621                         gt->info.engine_mask &= ~BIT(i);
    622                         drm_info(&xe->drm, "vecs%u fused off\n", j);
    623                 }
    624         }
    625 }

regards,
dan carpenter
