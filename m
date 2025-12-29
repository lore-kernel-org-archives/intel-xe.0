Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B56E92FE0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Dec 2025 21:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F18610E731;
	Mon, 29 Dec 2025 21:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="d/6Ldwwf";
	dkim-atps=neutral
Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com
 [209.85.217.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6B010E731
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Dec 2025 21:59:22 +0000 (UTC)
Received: by mail-vs1-f97.google.com with SMTP id
 ada2fe7eead31-5dbdb139b5bso8424369137.2
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767045562; x=1767650362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BiToq+744uGxVUSBnz8g/fFuQu2TAsdbeOO8CU0qryc=;
 b=N+b4WL3qffGXZLfGdOwknu5ym+XvokuPi1+1nx1EPX6mqTpNuC78YS9wrRfxVIZntt
 99KYzoErOseZhL1u4fNHEm3Cs09FR9tJawOoV6C9Ri609Z/viE8kHdI3t0GaVjh9omz1
 DNQm4OMBDelOzTP/hctWYOVBXoXwEbOulRwPa5Z4CX2eh5VcOUEM3+csO5jvGna9cx5w
 bId+ton843SnkoQukI8zHMz5HIxbQ0JHx2KPz/zW78KYKjyM2T/0V+16Gh/jFKGFx52E
 559m8kNo9cF/rBukeqBAGEwni9+J8uhUnzY/xwZl1rw3ELqegxZswIcUPEShR+3EvKEF
 evgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjiZNYPVoJtdgOLVLl9vanHG5TwbCKO1ns8bsXYC1FulBNWYvBtJSp4xiPD5qNCpxXeou/+pUTKA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykdhnCtvCBXLA51l9lzpXkYrclZLtpWXpkToKeUBWPewOYiTnf
 1itji4xr9wfGu4Wdqzu5h82eJeu33XfuScJTdnAUexnRzLmGqMxYRyajGlufCC13xIFSGc4aulg
 HTzipCgmtaswIsPBwzdfybKCubjexrs6BWy7aIr2PUghS8jeNP9v/QtgG/s/QXU4/LQevt0OPnk
 M9MBY+qoOY+p6kK9yanzFWqwsgKAgSZUcFA6F2XMTTCwdhTzToSzTvOEKl4hTa256CQiFq6fPdx
 lmYA8kQCPTrzY4P9ic=
X-Gm-Gg: AY/fxX5kM4HyQZnulFguU0hotfn8ti4HSqHR5EiivfM2S9S00Pexx4r9IN9EudgP6MV
 n+BAsfa9rVZjyB8DtInhUc7dFS3WoTjmRPOYG32s4JQ4L9EhH+gIqXc6Ix2Ge1Doi2rqV7yv96D
 mXUIAH4O0MWKfseUCLheB1ig98Oub7VEEpP1wg1pHrOfv5VrHmke6BiEdRS1OL7tGpUmXt1pPUl
 h6zH2so9AqECu5kOuVKn3MHrkATufyoMg4WbmC0/e4spg04VEo2zRR04QAv8e0vwgHW2aFH+468
 Jcz8EvrtHOV1Pj1Y4T8BpgppsGtlfQsf83fu5jadhQyrASBNL/XbFjPrlUpiTrGxmfmOp1nVKOj
 JvtPVcg4/W+UTxd5cOZ6SeInJ49rf/PBOO4PvT2xdEKb5kE1rozYp35ul0sn4qnqc7v+3iUfSdi
 lYvTUVDPfYsrNYz/1qUVs3eHFHrZj/+XBZwcVocXE=
X-Google-Smtp-Source: AGHT+IEdTSXhDXiWa7gKWWg1XOoCrq4Ik/4tAqu641pNnAKbiiZHK0PgMiB4JWO9M2v3ef8REdugpxC/1a0i
X-Received: by 2002:a05:6102:3eca:b0:5dd:89af:9074 with SMTP id
 ada2fe7eead31-5eb1a680154mr11002270137.12.1767045561668; 
 Mon, 29 Dec 2025 13:59:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
 by smtp-relay.gmail.com with ESMTPS id
 ada2fe7eead31-5eb1ac12148sm4703554137.3.2025.12.29.13.59.19
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 13:59:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f4a92bf359so213337261cf.2
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767045559; x=1767650359;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BiToq+744uGxVUSBnz8g/fFuQu2TAsdbeOO8CU0qryc=;
 b=d/6Ldwwf8i/dshodFpxUpiUXQCCfE+p6JsN7krjhNhgMba2cJLOC5NWBof7AToUpKu
 FbHJlhLOeqBC7IDC+rV/IxhDq7nnhTp53mZFzeE0jy+sdoj8vEr38ARcgG2Jma6wsLqR
 2f8GrCiQ6tJPXgHY8LoIPFGmqVIjdD9Kn9MpY=
X-Forwarded-Encrypted: i=1;
 AJvYcCV0K65VPrC0oO+Odlj2QQQn5VkNd37tqC43eiz1FsQqG8xAosUxe/K1gXGfVEKybL2WBp5qDv2EnQ==@lists.freedesktop.org
X-Received: by 2002:a05:622a:4809:b0:4ee:4128:beba with SMTP id
 d75a77b69052e-4f4abccea36mr439741441cf.8.1767045558825; 
 Mon, 29 Dec 2025 13:59:18 -0800 (PST)
X-Received: by 2002:a05:622a:4809:b0:4ee:4128:beba with SMTP id
 d75a77b69052e-4f4abccea36mr439741281cf.8.1767045558450; 
 Mon, 29 Dec 2025 13:59:18 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:59:15 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] drm/xe: Use devm aperture helpers for sysfb restore on
 probe failure
Date: Mon, 29 Dec 2025 16:58:09 -0500
Message-ID: <20251229215906.3688205-4-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251229215906.3688205-1-zack.rusin@broadcom.com>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

Use devm_aperture_remove_conflicting_pci_devices() instead of the
non-devm variant to automatically restore the system framebuffer
(efifb/simpledrm) if the driver's probe fails after removing the
firmware framebuffer.

Call devm_aperture_remove_conflicting_pci_devices_done() after
successful probe to cancel the automatic restore, as the driver
is now responsible for display output.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/xe/xe_device.c | 7 ++++++-
 drivers/gpu/drm/xe/xe_pci.c    | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7d373c70f0f..ee9ae73222d9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -428,7 +428,12 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe_display_driver_set_hooks(&driver);
 
-	err = aperture_remove_conflicting_pci_devices(pdev, driver.name);
+	/*
+	 * Use devm variant to automatically restore sysfb if probe fails.
+	 * This ensures the user doesn't lose display if our probe fails
+	 * after removing the firmware framebuffer (efifb/simpledrm).
+	 */
+	err = devm_aperture_remove_conflicting_pci_devices(pdev, driver.name);
 	if (err)
 		return ERR_PTR(err);
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9c9ea10d994c..ee08a09fda6a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -6,6 +6,7 @@
 #include "xe_pci.h"
 
 #include <kunit/static_stub.h>
+#include <linux/aperture.h>
 #include <linux/device/driver.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -1058,6 +1059,12 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
+	/*
+	 * Probe succeeded - cancel the automatic sysfb restore action.
+	 * We're now responsible for display output.
+	 */
+	devm_aperture_remove_conflicting_pci_devices_done(pdev);
+
 	return 0;
 
 err_driver_cleanup:
-- 
2.48.1

