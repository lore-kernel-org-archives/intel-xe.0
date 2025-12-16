Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40161D5B874
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 00:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F343410E5D3;
	Tue, 16 Dec 2025 00:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DLC6O38n";
	dkim-atps=neutral
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BEF10E5DC
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 00:03:02 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-78ab039ddb4so40332737b3.3
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 16:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765843381; x=1766448181; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X3fuzXH5SEfyeqaUBVlqx0NH11f8VqTdNd2pukYtUTI=;
 b=DLC6O38nSWRVv769MbRCVawqoIkd7EOU1X8W4Dko9ZdcY5LSWsprvGUGXaOnkHzUhv
 +xrZIXHxLA2AACDwNM5LxzfQkyrZCEwpnDsjSG1pP3NRRgqTtgI071LUWPNrvREsdhUR
 ZpNhO5+XjLHzBYwTwn4imNe8ESbTJeYNOkjOfYcovjodhkBVW/Ft8N/U9ppyrswjAYGF
 ChdJnfFzm9Bf/y8Nlep6qMASOwoE3u1ONtfIE+L6YT42fCPZofcxJKIuzXGY33o0B2Bg
 15z5JrGrf1+GKUMtJKXNxYLHUUf0/HXXjgpbw7lcGIu36Vb4LwUOE5EiC/oYx6ajVF2a
 ERwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765843381; x=1766448181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X3fuzXH5SEfyeqaUBVlqx0NH11f8VqTdNd2pukYtUTI=;
 b=D2Mr0k6e7CYgRy0+BGW6Nz181M5t3rVCWGRFiEhrt6Q5QYggeJjXvuoeWN2pPk0Vvh
 zHTNdBRcrr2KUxuqhdfbam+UDoImwIZoQc1inw9KDkWOVjz4CzwXlnY2qQDM6kDakXzV
 Yt5xmgo8d8pCHWi5Hy9/CIWAKQDlhHCXkgpMrNWZ7ulldVI30Bb5NK2HijufnFMThgcf
 LzTVnjwr/tqPZGkC7xeRQTmBj/qGIwYtpPStr5TDmJ34ySbJpsJGuOtU//lGI5Q3tsHW
 MfglNR+v+xvlU10udkSZ5u+O7lSG5KSVLdMueJ/lUyblHy0dy28uvX72XhSG5Z2iJJJs
 3x0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV+H25eXzLkzaU+T8QHLbaJXrzR4Oh+cM7wNNCnOpHx2NoThX5GvAf7sbkyGLyL3JtR8ubDrvohQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy43MvtWF3zrej5tQQppgElzGwfNcirP4YmZI+envXaA7+kRvlZ
 lMwxGd3AjvYxia9NerZpFQDW37/THx7ga1hPxmWhQcYmYbXA4lIPMT4V
X-Gm-Gg: AY/fxX6E8rGyeV0J8J4owAASzd5courAO8F0q5pZJfWUfLjuHsihMX9eUM+TFzlbXfP
 lCpXDePj7aedNJL6nL8NwBjaXuq/2+q/yE2eiY8z3XvXfSqMtNx/2kk4wC1UNe48t9DPnanasgU
 Oav2NHhw+drn90zbBD5O5GJFr2FCsCW1OBeV63ZuS4SEgVwwNiugy/cdr9ueUrDWLQb2bydHdKn
 8dFzwHXMxBVSEt5RqoVGFqrE8D0mHcGAivBwdak37g5evxkoXO8LwVBjrmcNw1cd6c3gzu0RSpn
 M/OylZOcHW8Oe8oDC2JzA/kWIgRdKoyadjLF0yZiSc1+lPSqXgmhWIQ3jtvvFBS2FZuudSDuSAe
 SNShTB6dJZXJlVt6GWDkiAeukRhPJXUQr1ThQ5O5CuycYxo0Pi2/mIbUUjH47lslxd5DHYQ620m
 J69F2YWw==
X-Google-Smtp-Source: AGHT+IHU3vVA2SYJElE2obpcVI0gnvNEkzHvH2Jecy5LnMGranUYJKQCbTFXNsf82RxNUZqqx3bXJg==
X-Received: by 2002:a05:690c:9c07:b0:786:8410:31dc with SMTP id
 00721157ae682-78e66e750b1mr103406167b3.53.1765843380840; 
 Mon, 15 Dec 2025 16:03:00 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:6b0:1f10:bc87:9bd7])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78e748ef4fdsm33347247b3.15.2025.12.15.16.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 16:03:00 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Harish Chegondi <harish.chegondi@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] drm/xe/eustall: use bitmap_weighted_or() in
 xe_eu_stall_stream_init()
Date: Mon, 15 Dec 2025 19:02:58 -0500
Message-ID: <20251216000259.331293-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Commit 437cb3ded2503 ("cpumask: Introduce cpumask_weighted_or()") added
the new helper, which fits well here. Use it.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index b896b7ff5900..8bd4307afbbd 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -737,9 +737,9 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
 	u32 vaddr_offset;
 	int ret;
 
-	bitmap_or(all_xecores, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
-		  XE_MAX_DSS_FUSE_BITS);
-	num_xecores = bitmap_weight(all_xecores, XE_MAX_DSS_FUSE_BITS);
+	num_xecores = bitmap_weighted_or(all_xecores, gt->fuse_topo.g_dss_mask,
+						      gt->fuse_topo.c_dss_mask,
+						      XE_MAX_DSS_FUSE_BITS);
 	last_xecore = xe_gt_topology_mask_last_dss(all_xecores) + 1;
 
 	max_wait_num_reports = num_data_rows(per_xecore_buf_size * num_xecores);
-- 
2.43.0

