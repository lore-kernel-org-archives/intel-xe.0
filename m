Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63762606A336
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 15:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PAITUGj0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1982F10E2AC;
	Wed,  4 Nov 2026 15:02:43 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0A710E524
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 13:47:50 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48e47347279so437245f8f.1
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Nov 2026 05:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793800068; x=1794404868; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=chOAKJyoAP1QGXXxzfUXTvuj5Kz+HpMI3in4etcGZ30=;
 b=PAITUGj0K0eoCikQzNFNUrT7in/H5OkjVS1O+mELlrnbBvtKp5U5BHnnG/+ASiZUHY
 oNbuKznNtMwqiYaeolFa0225bZgbUKU9DyzfbXtjYBRYdPaJncsvobks4o2e+GHwDJR9
 XS9zFgXIDua8nt1HNMPVeWJf9CxgSHY5KJXFzL9Kgtb4limIrtWyq7RYEy5h9sCeZGep
 GIq6ZnJV2irSk++1ynfjC0lVRxPwa3Yf7c95Rir8AvKo2LGmExjpRTKK6hAgfB0u/ufK
 +0If1eQ9atMGqGGKXzDtqfC0yhA3x0GMrEgft3S7OkDxU/sDxer1ZudaVxp9mHccJLru
 3r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793800068; x=1794404868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=chOAKJyoAP1QGXXxzfUXTvuj5Kz+HpMI3in4etcGZ30=;
 b=NmTJhc4mkPRwWsSSlFtbg7irLcBqhJ4BMA5G5MXNQYmGDDZ6NZ/TR1srDM7kEtQ44a
 PpnQNI5Rw/8q6x5LhshLLfgFaTWV+EqqDqKNhxBghkBp8iY2y49hy8GUHzbmORB5SPqh
 F55sx6MUebSxsZIXt0JsICklXGu+RQ54uDUsIK6gvRjQ1Sxn+nQjCICOZkHRmAp4G/3l
 +Yhu/V1a8AL2xdi67Z1Kl88hhiSz3rYDG3FeCy1vBpIxGiw3DhDCAakgsMNm9AFTCzwP
 rVI/r78bp+KHL/j2ujCigN4d7Y1BHCSgaz+hfiTniVLh/vRZZ8gHkbqeplH1jJ92hYK0
 3tUw==
X-Forwarded-Encrypted: i=1;
 AKwUvByHuw0KL+cP6HberkcP+fsOx4DScpYYXHlflx/bzut8KndNPmYNlV6w95ezg/6YyhHSO/YSPS/5eg==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+qK3DYi1O3KGQGe8Fp5WMI0Ey+OuHJj+DnxvshoHF5EKHKrgB1
 GX0EcRMETFCH3t8K66dentwjilDRNfa4S/o6NQbTmIveUPWE0sycCmkf
X-Gm-Gg: AYBFou3VDHFR7yrdyg1hA5DeNeeF8i0b8xuy20DaunFaffjICpW22lGdvCoD2PrwtVH
 G9RCpR1LPDAVcJ6G8xLtukvF4U6uT9E6kcP0nQ5QOKcW+VJTlX5zfx5ibup8004Ha1kEk/1ir+l
 O0P++RQ7qH5NTi+d5/xzYiUHY8nIJJNT/2E4Pk7EQ8aXB1eLkbUQYjoiMUoXIrVNU3tu5p1N0xr
 i1GOnPDw9KaNuKQVjjo0uFZZ89oCJ2QcnLw3Ak8UjqvI1/9JXPkG1ttDkyyJLmiGlqKPauRoaoG
 61labfaXqqxfDzCzA1dNHNC2uBvMzEWD30z4o+FK9oydDGYyrbUBRZWpCcPCmvP0OwkCHsY5t+u
 3a1awHjHYdAAVA2YWC9IfXumyjf9YoRq4ZTl36ZValtU/OQVqBNYGyObHu/JE6R6Or7Aojc22eg
 mExFWYTlhQBMe1sxVjsUnDQ1lUGprNguenXB24htXh1pyURT+zwc7+jpgbtv/DEajZAJAe+8mEM
 638NaGBrO8+i2vwQMRGVUS2louwVFSeWlUpX+3taWYcImCFIRp4fzFPMxWIp4Ru/nzQFa3e9nsr
 rN0Vj2FMUZD6YLmW9krMtwFsQ59NyZjs3uzkMrb/26BRuNths06PXv4PDlmcYZAbC5hkXgzaMU5
 GIQ==
X-Received: by 2002:a5d:5848:0:b0:48f:bb68:4e87 with SMTP id
 ffacd0b85a97d-48fbb6850famr8447369f8f.32.1793800068424; 
 Wed, 04 Nov 2026 05:47:48 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de.
 [134.147.21.238]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fece99d67sm4033718f8f.24.2026.11.04.05.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 05:47:47 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH] drm/xe: fix CONFIGFS_FS dependency
Date: Wed,  4 Nov 2026 14:47:28 +0100
Message-ID: <20261104134728.3723002-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Nov 2026 15:02:42 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_configfs.o is pulled into the xe module only when configfs is enabled:

  xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o

With CONFIG_DRM_XE=y and CONFIG_CONFIGFS_FS=m that line becomes xe-m,
which Kbuild ignores for a built-in module, so the object is left out
while the rest of xe still calls into it:

  xe_guc.c:(.text+0x217e): undefined reference to
    `xe_configfs_get_psmi_enabled'
  xe_guc_ads.c:(.text+0x1a28): undefined reference to
    `xe_configfs_get_enable_multi_queue'

Eleven xe_configfs_* symbols are undefined in all, referenced from
xe_module.o, xe_guc.o and xe_guc_ads.o.

Require configfs to be at least as available as xe, which is what the
stanza already does for KUNIT, INTEL_VSEC and X86_PLATFORM_DEVICES.

Reproduced on v7.3, x86_64, with:

  CONFIG_DRM_XE=y
  CONFIG_CONFIGFS_FS=m
  CONFIG_DRM=y
  CONFIG_PCI=y
  CONFIG_MODULES=y

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4d7dcaff2b91..fe3061f3b4ec 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -4,6 +4,7 @@ config DRM_XE
 	depends on DRM && PCI
 	depends on KUNIT || !KUNIT
 	depends on INTEL_VSEC || !INTEL_VSEC
+	depends on CONFIGFS_FS || !CONFIGFS_FS
 	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)
 	depends on PAGE_SIZE_4KB || COMPILE_TEST || BROKEN
 	select INTERVAL_TREE
-- 
2.43.0

