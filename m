Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C2AD116FF
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 13:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE5410E3CA;
	Mon,  1 Dec 2025 13:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gpVOP2FC";
	dkim-atps=neutral
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4347610E3D4
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 13:06:27 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-11b6bc976d6so5682316c88.0
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Dec 2025 05:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764594386; x=1765199186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2TX/wlLLmYuma5vOh2NANsRHqz26qzJSEKdm31TE4yc=;
 b=gpVOP2FCsGyS61Y4qDsJ0FC0Zy+6Jzl5h96+JDgDlVvW5h2kBOtMb89hflYBL5XT8U
 ds1GVwMItEYLMb8s0ZzbpvsIeuV5NHIN6BimOE/VCCTuW34l98OCqqM5gpjESz5SL/Xw
 kpOeIrfBkPW8cbQ0NrC3/z7z4GCuGbUGmh1X8SraNJow9fzI3DLIcOHtwRayR82Akwwt
 +KmHcB0XPDcbl9R6T66YvoXZ/nkXirPPRzykqtY/SCBRz0jptHPf9P6VwIjF4PphqztI
 16MSwkVlgYehEbINBnobi86YLKE+CpmBxsgOcwVT2hlyudIsWLIVPC9iW9hIa+cG8PtO
 jEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764594386; x=1765199186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2TX/wlLLmYuma5vOh2NANsRHqz26qzJSEKdm31TE4yc=;
 b=VYlYaHKXrS8MUwVk7lnj66NhE7c95m17nC4uxyP965ccUQeGc1y5QhQF6MfsdfHF2P
 TEeHJm/e/Ws0g3h/IqlVOVcjRL9jbkGvu0RIeoToNCTb9nSEFCgGIQuDTnr18L2WDdb3
 hSGrfX0xnTFrlESBZMhQcNVREUsdfGUJcxNVv5YYJgQSVEwX0w4kDNluyiuWn8zCDSng
 BR+FU0FjZlONrPk39LzcjcW1CJ6f62wgCACEdc3L4r4YC3g6lengs+aIkdVD9V2AmSaf
 OwLz/BwJeHCe6OztVZwLODVCCuiHR9dAYkUQKPnh4GNCy9xLV3XckUBx5xYev1n7Sq0T
 0awQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXqhmWJgTpjsTcoNTRqRXr+x3zDx2WVYrBSeUa1dXEVDoww1wvHdYy4RWHQGIMGE8oV7w6BmOkxQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz88BenZl3IgdAOMCaxz0sDD9UlR80QWgefhfzDNzrOciagbMRr
 V/3+I9Gb7vPotd0/GnAcN8H4SaidblrbWi88zqIpj9eEY0RFlGX9M0Te
X-Gm-Gg: ASbGncsMqZSbSmuWxi0yR3T2iHl5EdnG5spthCzrzmBwk5kr8vVaJOMXABq9AoV4q+f
 t2/QbkvIfAl5TooZzcIgl9uNQ24kLvqUcLBfdLCr0d/Z3DDNHlauxF/DaDJ0wnh3yffB0d21/dU
 VgN3D6sLJOvUFHvvXHRdNCjHXDEjXpWTJOeDTmcFxMK9gDcwQfN7DFRlVC0MbF3DIrWWPqZTvwg
 LNDcep6L/V+jRJ9imyxmZjz9ICIQC+7R7jUsShtN1Mi1KWhWqkCkrbNwgkl4UoT2YbqtsuGfwXI
 0TNb2XZBqonD/ANydieN50hFqnO2Buv8+dRTXnIbnqUe3+xmQFhVGGuVWVELoaDdlNI/mY+x/Mq
 7rddgddOhkoTHLxlC7IAqUCE3QPYt0B4iN77mF+ZBuu6tCoFnaFpjx6lv8E1YEKIrU9nnHD1kv5
 964/QdijSJy90YSqkNM1YenWsNdFUuXM0OevAcOwyq7REF+H0=
X-Google-Smtp-Source: AGHT+IELXHCwA4zfY6/EPmdmiBp604fd3PcNwoTG3b6FC8M4GQ1wwLwNMb9fat2fyJpUq/i7DQD1Rw==
X-Received: by 2002:a05:7022:418b:b0:11a:468a:cf9b with SMTP id
 a92af1059eb24-11c94b0b693mr24400618c88.9.1764594386364; 
 Mon, 01 Dec 2025 05:06:26 -0800 (PST)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11dcaed5f6bsm70822054c88.1.2025.12.01.05.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 05:06:25 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 2/2] drm/i915: Add intel_gvt_driver_remove() onto error
 cleanup path
Date: Mon,  1 Dec 2025 15:05:59 +0200
Message-ID: <20251201130559.731361-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201130559.731361-1-juhapekka.heikkila@gmail.com>
References: <20251201130559.731361-1-juhapekka.heikkila@gmail.com>
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
---
 drivers/gpu/drm/i915/i915_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 0128faf2e483..f8c01d52aba8 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -908,6 +908,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	i915_gem_drain_freed_objects(i915);
 	i915_ggtt_driver_late_release(i915);
 out_cleanup_mmio:
+	intel_gvt_driver_remove(i915);
 	i915_driver_mmio_release(i915);
 out_runtime_pm_put:
 	enable_rpm_wakeref_asserts(&i915->runtime_pm);
-- 
2.43.0

