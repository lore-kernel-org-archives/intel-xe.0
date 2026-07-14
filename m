Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBFEC44525
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 21:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDD910F62C;
	Fri, 17 Jul 2026 21:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qA7BYMzX";
	dkim-atps=neutral
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6330D10E078
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 22:54:34 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2ccf2360620so12768455ad.3
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 15:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784069674; x=1784674474; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:user-agent
 :message-id:date:cc:to:from:subject:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PuczVviH7I6iBF+tE/3yKvEgvc7CTglLYSZ6Ql2SVLo=;
 b=qA7BYMzX3yD7Db1pAVZlYvgINClBNY0EWAo1mDTuOeOtstwNhJwriJF6A2ghsSkbxE
 fX7u4HkfXXGYc49eWhBf9XnyOTRNT/o756H4pF3qlTT1VKLp9rfiQYLbtlBKWL79TGvG
 9xPmlqINJ+PmQnkIZAZ1L0qTPS8+05f8KxL717JNS6BkMq1TGwS8Q4y3c19IkZCjNEtm
 6OTKyxlkvuByqGePPa85T9Ta1W0lU5RolIOGrI0dd81VzlgEcUapeCbmR1kSlqOe79ry
 PsfsQV3b35+TABiPlfSTSKUYvQzNXFV8mgfV+EKG+JRIFsmw8D7gvWvB8ABzqwim6SFO
 YO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784069674; x=1784674474;
 h=content-transfer-encoding:content-type:mime-version:user-agent
 :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PuczVviH7I6iBF+tE/3yKvEgvc7CTglLYSZ6Ql2SVLo=;
 b=VihIQi3jr3JMdcqXi+1Vt0EN7PAMgbp1scvOIWFeO4KFkDR5Loe6Grq0ayJxC4Oxsx
 KLQoUBNgEZ2bZwlBeV40mf0jTMyspEqXXM3sngFlBO3gkns0hqJgWrWwXpiSF+3cNcDV
 Q6PGf/DsdR6rqy93xN1K5+hUHvcvbrMpREw1PE7IrCVi7cSV/Cut5whsD3SG7ygiAwRL
 mwvrbCKeZzTGF0w55yLdMMq2yO7p6ZWSzPGcIhno9+HyTvpfziugtqAjMLGIX1/OFMjB
 SLwxM+il8qKFaXYTnRGhVnQ6+tAvGtbBJ9Et5bm9h/NxHNIzm9uPJFRFEfcIoV01iMxs
 /kPA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqnIIS/EsWi13eJecDWzMUasNHQywkDWZRX5cFz3i8TDWn9bYVQORmoWUOxt+55sYAK1Z3vS3m+lg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx69Ay5qzVkDUmDBkdnkXfenDxALbztTEmfJyWIaAdEo5PiSxU
 +lg1JWhW1ZtqBYROIwT75w499M8+HPuBny9xesWUB19bFY3xvQLHbHH4
X-Gm-Gg: AfdE7cnL1ipavID6XFkS2eDTayj8IgNSIUTiVIpcA2Keqw5YYbavB3xPbyyvQVytxnB
 UCzPR4wF2qMx9olwjkkMm6qQde9nefJIohnIRWB4nB576a4FiheLe1t+wXA112VrksUrW6nCP0y
 lFX499K0pkuC0NqoKHS3cuCf0XiFk5t4wLF97lewGXvmdypGqgptx0gwc/jFAhWw7FF2oxGnOd7
 9StfljFYqyojUUdR2SBlN6rC7h4P4YN9dHdpnY57GerP/G3a6uGRn2XiWDh4v8h3bbkUe/PHZxN
 2iBSd245dho0pgnvXLacDEO7J0wrLszSb+FCp5k9lntpTyGer4pXpeO8dbiyjylHjtyLSS1hOVo
 zj3EsUQLrib2C7wLXrUCsluHxgofFLDtspPg9mHlKjFNR7GpdXjizrxpp6fAYlT1aALvVQ59eek
 oxseWkgteibaK06+r+WnR73n8DiWpOqsuppNjmRl6k+QF8jkNHp5Tr+6aiCsg=
X-Received: by 2002:a17:902:d985:b0:2ca:bf8e:35fe with SMTP id
 d9443c01a7336-2ce9e9ac9b7mr141747505ad.16.1784069673866; 
 Tue, 14 Jul 2026 15:54:33 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3d57bsm122411715ad.59.2026.07.14.15.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 15:54:33 -0700 (PDT)
Subject: [PATCH] drm/gpusvm: Zero HMM PFNs before scanning ranges
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 skinsburskii@gmail.com, thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Date: Tue, 14 Jul 2026 15:54:32 -0700
Message-ID: <178406967042.1113483.2116704310277917086.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 17 Jul 2026 21:05:30 +0000
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

drm_gpusvm_scan_mm() asks HMM to report the current CPU page-table
state without faulting missing entries by leaving default_flags set to
zero. The HMM PFN array is still caller-owned input/output state, and
the framework may preserve input bits while filling entries. It is not
safe for the caller to hand HMM an uninitialized array and then treat
entries without HMM_PFN_VALID as an authoritative unpopulated result.

Use kvcalloc() for the temporary PFN array so entries that are not
reported as valid start from the documented zero state. This prevents
random stack or heap contents from being interpreted as HMM PFN flags or
PFN values during the scan.

Fixes: f1d08a586482 ("drm/gpusvm: Introduce a function to scan the current migration state")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 1a8bb83bd28d..c8f489d7ff7e 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -859,7 +859,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 	const struct dev_pagemap *other = NULL;
 	int err, i;
 
-	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	pfns = kvcalloc(npages, sizeof(*pfns), GFP_KERNEL);
 	if (!pfns)
 		return DRM_GPUSVM_SCAN_UNPOPULATED;
 


