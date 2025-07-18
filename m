Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBA1C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 21:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B90510EA45;
	Fri, 18 Jul 2025 21:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RSQCYqQE";
	dkim-atps=neutral
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910D510EA45
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 21:23:08 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-73e810dc01aso892618a34.0
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 14:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752873788; x=1753478588; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tK+4glzE3WnB4vC6DvcGs4atxT+1n6gCTpv11Qz3u6E=;
 b=RSQCYqQEH5U47tBhd+7p3+7xJUekzZeksJ12jn1Yc857CwKx9QLD8qTDuQi0B8IsWP
 maYd9lOLy76nINYKRvAihzF0A6Wg+RW81vd0pEUeJ0xuYqfkwtP80B944hySNJx4yQMx
 Gh1EDRV2BD1cL2TauCqMHs229RCb2lWN1AFhe4VFYCZMXjW1x6ReETHgozZuFf6tCrtz
 TwkEshfZLbNHir2ScMMK0wiRBmliubKHoqAXObgWkR6Lo93gPn2OcvaPHzcBGe0bLbWh
 ER03714aMRhDNGPRCMT8XcZkK6qushayTb/oKQuHgJGs2Ko7OS3JYohPgdBh0CnbpdJq
 rUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752873788; x=1753478588;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tK+4glzE3WnB4vC6DvcGs4atxT+1n6gCTpv11Qz3u6E=;
 b=jnwmFDhHQ19ZM2oRbbHKDEVIejM1sHV7hIeWskpbV7MG68ABFdE+Nkr2Cb5MVI7XaL
 kG8x8Xiv4FqDSx11+PfceangKbsbNHBWJVmMjWokY4qfuxpx3vilk7GyJP+24KLoCVtU
 OoGXRTk2f3qCXdsPL024OY44X6VVXDC9DJRCRNk5zKktREqUK/ppYwCSCQIA3FLAWHdf
 ihvQJDoBaWC783oldzZFYaWFeJRlN3swsGeF6LOUxyoti3vljwLf0J8HzaAPRNzs9dWv
 NuFTATSg6Okkofb4jQUoMl31tszko6uMId2WlBm1BsPPoqJhe+WvkEsiIuLSe0TRQPBi
 XZkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGTdfInEol4cReHMyqLRgTPEgStS92n8Ua7+mL6pSWujEeR4wH9GwG4VdqYH9hQptWLj0Wg1RFtA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqNuZDeq6y7OdDJhgY+DOMpv8lr5uJCVUnvv3HU2K8ENfM/JjF
 ixjBhkz7g5L4HREgEU4KaDjZS+3DJ+D7xA4MdNQ5e3FtHYXT3kcmN0Z1aYRdhCvsgJo=
X-Gm-Gg: ASbGncv0VRUPvP5mC7Q951chAfct7n5JEzkKM5/qvL3WihUraEJdf4sSi2JemdhPXMl
 fBffEU5adzt3T3v26tuzTQ3+mVdgPA6we/D2XJARyMTJB71Dsw3gO+XIMDJ64hOo3IvF5eTypqB
 ylpJm0NfaFzixUNh5sMF2kExva9k1J01dQhk7FjZQY49pHbI32KA3pX8XO1EYpebFM2vexmp9kv
 40CMkLtpZoD6eoeNwQ4MzZqNv8rYVw0ErFY8KvjQRYwSBgD4FVCsGKJW3Ut9hHsu89liisTMBI2
 CNuVZPF6N8qUSESXrUExTpk2tNrBL0jYpIpbDsVezs+B5ZRF2gC4F71mQH0yG0TA/DwmDZAfLet
 G6Chd6r4mk/c=
X-Google-Smtp-Source: AGHT+IF9VLx8mE8trvjMG7+MlGusZoBXTEIHkS13K0W7mcIBsGRVkXXT81gfglD97zg1dabcDIqGHA==
X-Received: by 2002:a05:6830:8008:b0:73c:fb75:cee5 with SMTP id
 46e09a7af769-73e65f33953mr8211210a34.0.1752873787612; 
 Fri, 18 Jul 2025 14:23:07 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
 by smtp.gmail.com with UTF8SMTPSA id
 46e09a7af769-73e83560306sm949902a34.13.2025.07.18.14.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 14:23:07 -0700 (PDT)
Date: Fri, 18 Jul 2025 16:23:05 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe: Fix an IS_ERR() vs NULL bug in
 xe_tile_alloc_vram()
Message-ID: <5449065e-9758-4711-b706-78771c0753c4@sabinyo.mountain>
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

The xe_vram_region_alloc() function returns NULL on error.  It never
returns error pointers.  Update the error checking to match.

Fixes: 4b0a5f5ce784 ("drm/xe: Unify the initialization of VRAM regions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_tile.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 0be0a5c57ef4..d49ba3401963 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -120,8 +120,8 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 		return 0;
 
 	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
-	if (IS_ERR(vram))
-		return PTR_ERR(vram);
+	if (!vram)
+		return -ENOMEM;
 	tile->mem.vram = vram;
 
 	return 0;
-- 
2.47.2

