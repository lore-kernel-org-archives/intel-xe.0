Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE019D5C0D0
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 08:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D82710E743;
	Tue, 16 Dec 2025 08:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="beb8Vcxv";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E1E10E75D
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 08:08:37 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2a0bb2f093aso25035715ad.3
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 00:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765872517; x=1766477317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z5abBx1FhfvbwK3R1pPHGrJFXjLWv3LQXIdLbkDXRG4=;
 b=beb8VcxvU6m+1NnkKWWzZ8N5+hTLgvyKnA5oM1zoeg5p3UqIeUXzRpav08PrvSjoYV
 xoSio5sYZHpaGSZt87R7B00GYvDpTiwqZkQuJ319S68AkaXOaEPZ1Dd7M+DWfmfZxvoh
 HbUMQXjMZVrtsgbnmZKCg/NK7M4rk57paAqGQSvxYmlHkRhbqUIVJiX/pt26vtnygMaL
 oxvfIkQCpvhPpE1PeRdMCMQmN0GGLQFG7pF/gHX5YidC5JoMktAe13tmnglKrzikqheX
 7BJuRitpjlRrFAAr6/tm7eEncYrE2seYrQBod9sChfds0elrOQK6UIIVrKK53d2MtNMn
 2mAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765872517; x=1766477317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z5abBx1FhfvbwK3R1pPHGrJFXjLWv3LQXIdLbkDXRG4=;
 b=F2aCdVJTDJKI1kNukR/nf3cFoEFjcoB5jiKSKff5wBivxl3CgEJBfW1pXPDXjrMNJt
 EX2Fpqwhzv/oyhAPuJ98UB9bCNl/bsnks9FjRg7xjPADFzXiudjy9i2AaE9f4L8rg6Jc
 iE7fTG0teb09gM4x3I4KNX+BL976mI6+Q0xkcT/IGF1/Zi6q/iZCjKA03a7CFrleyjM+
 16FPZ7Q8uagn7YUFp/Xz2yPZQpsU5/FHdtA1mhk6dpH7YS1J7b1rUgFmzZ//KGM5wZhh
 cncnDs/4b7lH9bSwCH/ClRlJP+pl5NDKrHpojjMQBTy0Ln88YoO/wL7eUZ/khdVnWqA9
 Afew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVyuuK2wJxIGa+T57Ngao9K5jdPdclAB144zmPRMC/YPkctOO/gMY3XmLYtcmyg3NcbbTmq6e8ig==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+qmGz4f79ZI6VLRd3oJFZO1PNrElDp+muAScauK9S8WPUd353
 tTFl3vQfE/gJJ0FZXXBSDzFe07YNozczxFDdVseNeyi6sNM32Otw8OIcCZ8sYO2EaPI=
X-Gm-Gg: AY/fxX4IgFa227HxGrRhAwpn+x/QD14MvqMZ8MMrZVvJVAwf7kuaQ2U2pDF7Y7mATbX
 W3BJZkdrPkhOIe//d6t64Vx8Tk5qt7art2GBGr+ggfaOtfrRCIWoN4LmEK+zeL0a5REJN5E4g4w
 bWpiXpTdKwy9VJeHaQ4Fs8d0s79tCUQ7rWpaTeFJF+3iWQAqwPi40MmHdJT31nWmsOKqqfHIuVV
 Y7jCc6umHvSCfYCLOiYPQNquLwsKL/kC3PN73s9Ll0NM2gzvMSFB9h8Sji7vacT5PWCHBf/f0nK
 yAyVlYgU+idBzg4ZAjrYQ8OBs/+uFfWxbltwAsptxw3bFHjt7FfVte4RS9ajigFsTJZBNmB1sE4
 hGOy3k9rVie8mLwYfyEt3wDCRV+uTiImxMw6qrHI3YEqN6nAnSCHZ+eP7wdnB1nK+uDhYa2SbLU
 ESRoIrdehmLGU6ytfHwTzhznK/hSevxj6vSSp0roH6QAVbeaItDA==
X-Google-Smtp-Source: AGHT+IEYNbeVuwCVE9rbWR9F8gHHFSneRvyhL8dyMVIBzBDSJt88qS19nOG7NtEjPInluKJ8CTN1tQ==
X-Received: by 2002:a17:903:1c1:b0:2a0:afeb:fbbb with SMTP id
 d9443c01a7336-2a0afec00cbmr71890875ad.1.1765872516704; 
 Tue, 16 Dec 2025 00:08:36 -0800 (PST)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29eea04cd14sm153883445ad.86.2025.12.16.00.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 00:08:36 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>
Subject: [PATCH 2/2] drm/i915: Add intel_gvt_driver_remove() onto error
 cleanup path
Date: Tue, 16 Dec 2025 10:07:54 +0200
Message-ID: <20251216080754.221974-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216080754.221974-1-juhapekka.heikkila@gmail.com>
References: <20251216080754.221974-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add intel_gvt_driver_remove() onto error cleanup path.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Zhenyu Wang <zhenyuw.linux@gmail.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index e11189900c5a..75f503e52e70 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -922,6 +922,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	i915_gem_drain_freed_objects(i915);
 	i915_ggtt_driver_late_release(i915);
 out_cleanup_mmio:
+	intel_gvt_driver_remove(i915);
 	i915_driver_mmio_release(i915);
 out_runtime_pm_put:
 	enable_rpm_wakeref_asserts(&i915->runtime_pm);
-- 
2.43.0

