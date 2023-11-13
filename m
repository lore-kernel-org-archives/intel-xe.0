Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57575C4167D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 19:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2012710E40F;
	Mon, 13 Nov 2023 19:56:47 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54DF10E261
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 19:56:43 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507bd64814fso7101912e87.1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 11:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699905401; x=1700510201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4jaF0TzmJVBumej0nYWwaYSlrW84muOjaWsX60CSbs=;
 b=aWFh6CeftLNFH2Whr5fw2RBciXqupeAlx3qvM1Lz16teFOgRNNfMZna1Zp00UcDkva
 IhlvNt3WjFTIP+ZEHPzTSGKBbYGMc8GO5jYpvbwA70xLReyjvQ4lr204ZqwngMi9lK1q
 xtydpuKRusc2E0lumRt5brEKRHJnPFtNm97ZJV3c1dsVVRo9BKhjZ0R2qxWa50X5Cytc
 JFKg3327j/CWCM+vq8lVZUw7g1kFTk80uvqvnmJuULcoj7TF7MtIOKHF08LjQtw37ALM
 FT6q23aq7pdZ3sEuOsJA2lDpsHTI+mY9gbyh9PFV94oQ2MYhfdMPtPbRuGZU8SbNSL44
 AdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699905401; x=1700510201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i4jaF0TzmJVBumej0nYWwaYSlrW84muOjaWsX60CSbs=;
 b=mDwQt34Hn6EhYI5BciIc77GhYFKOub9HUrTbRdzpFFpDiDgJlhaF3fjFJOXmsKecex
 IKfDMXMji3mIQ+qNHmOew4R5xZPkwnl53m7+XeAtSVHQ3VEL94qzBgroEf+W34JopKqx
 HAyKPZT40470FVHDWaU0JG20/TxwPW6KJ7SXsgwmQhHWQY2z3XCf1AXRFe+QP0JVYUHX
 6/hJBV+UCRxL7lNwrqG5JFQSwkoUmrXrWz7otfejD8bckB1VJdlnPuPk91R+LEc1WlYP
 cSur6KuIVr5eXRH5ioMHnZAcL5Uj8eTKlDlXri5VMRX37Gui6ETlDkWYr6vuqejGZI6Y
 Yixw==
X-Gm-Message-State: AOJu0YxQq9QVL2y3hXv+njPufte5Chn3hgLZnfZ2w1U1LM6cvF492L54
 7TVPITP7hZeVX7rzI0EtPQKZ8JHxFrMC+Q==
X-Google-Smtp-Source: AGHT+IHzZVO9ZCGyDHfRGM/9wS/wvA5AJyoLBoZzol3kQRzT1op6J4n2hzhjTN0SQxA7iJlXoqM0Fg==
X-Received: by 2002:ac2:44aa:0:b0:507:a04e:3207 with SMTP id
 c10-20020ac244aa000000b00507a04e3207mr4621387lfm.6.1699905401255; 
 Mon, 13 Nov 2023 11:56:41 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 t25-20020a195f19000000b00507d478c211sm1068710lfb.76.2023.11.13.11.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 11:56:40 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Nov 2023 21:56:30 +0200
Message-Id: <20231113195633.119188-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231113195633.119188-1-juhapekka.heikkila@gmail.com>
References: <20231113195633.119188-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 3/6] drm/i915/display: in skl_surf_address
 check for dpt-vma
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

touch dpt_vma->node only if dpt-vma is not NULL

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 4553dd6bfbbd..1ed9d5a6283e 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1010,7 +1010,8 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * The DPT object contains only one vma, so the VMA's offset
 		 * within the DPT is always 0.
 		 */
-		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
+		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
+			    plane_state->dpt_vma->node.start);
 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
 		return offset >> 9;
 	} else {
-- 
2.25.1

