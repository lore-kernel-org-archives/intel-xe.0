Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69454CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 19:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83C810E03F;
	Fri, 17 Oct 2025 19:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="rqnJxrJO";
	dkim-atps=neutral
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8606610E03F
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 19:46:43 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2698b5fbe5bso34532915ad.0
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760730403; x=1761335203;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Dr1peWODOMoc8e855aSUXPXrT+Ugw1OVqmj9XmlYyVI=;
 b=rqnJxrJOK4DlsvdQVCXMufb5+PVjzgA+rkailPbC55P5wvR5gmPtKVf1u4M1HxiuuV
 qY/jN8Zn13wFu3ADkMRLr459i0h9ZgMEtJyp2vV+sAzgmjaiEM9dOLR8MrEmfzIVFlWP
 xVkl7e8kEOHoNrooexppc9l5jGw7w7fQEWbsyhsnO1IopvAkTxvxW5c2vo9uKGmwSwiR
 vNmmEPjZnOI5F3QvAILV6ZxRgA/asewD7w/SihbRWj+dcFCRFVINTZQH92EJHxij9IcW
 Bcum2H9psGm99Jq5/u/zt9EcQZbNevIECsan26cHnFx1wWA3rghBIQBxBD0W4G9c20N5
 hB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760730403; x=1761335203;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dr1peWODOMoc8e855aSUXPXrT+Ugw1OVqmj9XmlYyVI=;
 b=oaQBb/xqG5xDJFxl0iWFSqhYgqnc0ovqMAeOa8cR84I3n95Ljbk7zhDgTAg35Abxcz
 +lqPLWZagmpO94An3s+q2AZvbmTqfTNKeiTMkGgc8+wEad4ryfiHNkIp16ATFjX9USix
 NsSvnN6ThkY4VS26PQQqX2K7c7SkdI26rpzN3hhmGa59pGaQtMCliNfmnpho3RtMZLW3
 0WklIy06Y+uaEpKz9z+1huhK7MDUEhgs1iAGXo7CyUIJo62PUc/NVz0hDBhLFp5m9AhJ
 BX2GvpXtYBdDG8j8QSWg2impWfxC1hQWn6HfB57/EJYXKuJAK0daTdLEFNpbcj4aldoW
 ib9Q==
X-Gm-Message-State: AOJu0YzNpRDr3GFMwMREKYmQhKPtZz1M0N0Gijxt2NPrv15ZpsnWrZSo
 iDIKv1Bsz66MywWvmVQkwXn+edMouE3x+FeyMq10x++Z+NttqgoX3UjqxLpmoTQZsQy/PNdmPXl
 OW6jAItbu15GriA==
X-Google-Smtp-Source: AGHT+IExkJdqxSTmqRHCAPkkBEWF7DmMNdK/cXIXB1TxfYVWkHSdnq0w2r1Nf0jxWEZZoJ+dJW25oyMZL+zAGQ==
X-Received: from plbkc13.prod.google.com ([2002:a17:903:33cd:b0:28e:cc8d:f602])
 (user=ryanneph job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1a0e:b0:270:ea84:324a with SMTP id
 d9443c01a7336-290ca121a70mr48156875ad.38.1760730403026; 
 Fri, 17 Oct 2025 12:46:43 -0700 (PDT)
Date: Fri, 17 Oct 2025 12:46:24 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABCd8mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNj3aI83eS0TN3EJEPTVMPExBSL5DQloOKCotS0zAqwQdGxtbUADsM
 iOVgAAAA=
X-Change-Id: 20251003-rn-cfi-ab15e1aad8cf
X-Developer-Key: i=ryanneph@google.com; a=openpgp;
 fpr=10046FDF459A0F9DD68C9C04313B8636EEDD116A
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387; i=ryanneph@google.com;
 h=from:subject:message-id; bh=0lGFfw/2rf8/pcHffzruy9bUg8j6oeCW7DHy7uEqSdg=;
 b=owEBbQKS/ZANAwAKATE7hjbu3RFqAcsmYgBo8p0gDNuv9pMSbS2bie0+GmDQnijYBxb0HESYR
 cLqzNb0rguJAjMEAAEKAB0WIQQQBG/fRZoPndaMnAQxO4Y27t0RagUCaPKdIAAKCRAxO4Y27t0R
 amZUD/45eQI7wnxvyYucDnV7SMk/y5jQYVb4lTHv9uuEvN4hJ2YNDW4IyWM1RgKsbRHuMjZod0s
 XHOklACc9yBaaHWN5uuR3AVpbbtpkiJeqzJpBPJzOqT5efN6Mo0ALnMBwgt2cbRjt9586g+aBi3
 0gM9g15KqJOFhyDYN6vf4mPK986tng67UE3ubiMMpqkJ/S2HDgN9Ughug8Ms5mzzfVHjcGDGd8R
 3aubzlnndsqufRJ/tfWinHS1Jfmu774sgTAORCSHdb03KThfZ6LLR/DLP/OgWe19fyItCUOI7k5
 0TAO5/Q1jG2aCU6QgG5aCxT2WJ1+ncbvTo0S6+acuXAY1ULNQTy77fKbrMBZTO2gr0r2wcgUmvv
 kuPtgLIEJ3niOyqC7PGj+o5Q/GvfvAngTh+T2Dr9fmDueRn1GFculkbCshI74Z9tZYeYW2Z1BXq
 v0lf8mddPYwOUiSHTyripylBPWtPfsmJ+9zTJUsBWne42kJWw6BOhgQoEKcPU0ExDlAFmjlJ9+B
 ZVg0QSCyqsl+OOzQfnzks6GQD/ETjAvo9Lvy3ZhvyS2K+d2pL4SUFbkV2pYbsdyA6OxHKHyjKGI
 TCGjccULNvQHIC9heCgo7LHO5WDYmyEG0wQn7IKfCVm9YLrFdXrTP4p8aVqKhk4bucQCGMp77j1
 RG37sdr+m3gaF5Q==
X-Mailer: b4 0.14.2
Message-ID: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
Subject: [PATCH 0/2] Fix additional sysfs node access CFI violations
From: Ryan Neph <ryanneph@google.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Ryan Neph <ryanneph@google.com>
Content-Type: text/plain; charset="utf-8"
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

There was a patch earlier to fix CFI violations upon sysfs file access,
stemming from Xe's invalid usage of device pointers instead of kobject
pointers in those sysfs file access handlers.

When CFI was disabled, it made no functional difference, because the
`struct device *` decays to a `struct kobject *` (its first member).

However, with CFI enabled this is detected and the kernel is
intentionally crashed.

The earlier patch missed a few instances of this invalid use of `struct
device *` pointers, and a few more have been added to Xe since.

This series cleans up all remaining instances, and fixes an unrelated
compiler warning issued by clang, noticed while testing.

Signed-off-by: Ryan Neph <ryanneph@google.com>
---
Ryan Neph (2):
      drm/xe/sysfs: Fix additional sysfs node access CFI violations
      drm/xe/configfs: fix clang warnings for missing parameter name

 drivers/gpu/drm/xe/xe_configfs.h           | 10 ++++++----
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c        | 24 ++++++++++++------------
 drivers/gpu/drm/xe/xe_survivability_mode.c | 15 ++++++++-------
 drivers/gpu/drm/xe/xe_vram_freq.c          | 20 ++++++++++----------
 4 files changed, 36 insertions(+), 33 deletions(-)
---
base-commit: ee74634683e4b3e526a4b014b0358796e97c7ce3
change-id: 20251003-rn-cfi-ab15e1aad8cf

Best regards,
-- 
Ryan Neph <ryanneph@google.com>

