Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB31D1D486
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 18:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F356E10E2F4;
	Thu,  8 Jan 2026 18:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="KH3S1M4M";
	dkim-atps=neutral
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A04E10E2F4
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 18:02:08 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-47d182a8c6cso23053765e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 08 Jan 2026 10:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767895327; x=1768500127; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ofstAZxnHRW0myvgwQHd5VmIucA9twRraLf9vJfmRbE=;
 b=KH3S1M4Mj8x3GnLfnYSGvqMPT7O/XkhpyThS8Ay05Rz9epeoW2O+3mJ7yz2ZfmMYOS
 MLlqER7da16hrZnbO+QkmksBuNz4Lj6Rowr8umvkddjNWuEY4L3UAJ3xZ8tawuGG2jH8
 H1zVyJUVUWnKRlUyWHRCJiDaSR3SnBUGgrDcahrOlReJ0xmBg1VDpgFdhq2Bq5F3gyWl
 qP76qPbbcSIUcl3cRebnY+nU7K5AIEIb3VRBJs5upjnIW3ozBVv2MwJemwBgc7m+wJDT
 hB+dUpNu6ipG5hf6wqhwvlf8oRrPWltIj1C5QTPs5QJQ+Cm6Mr3O4PYNdtwAyFvxXh35
 v6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767895327; x=1768500127;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ofstAZxnHRW0myvgwQHd5VmIucA9twRraLf9vJfmRbE=;
 b=agSKlRcsDmVxviuDhF4Rl4779mYh5Lc5TnPCws+wtG8aVSVfmrl7A3/c5CFpiD9LUj
 ElQ1SJeel6uiV8T4i14avRiokgcUSwC48Ir8zgBMJ3l2bWqeGUv6MFqXoWOa3tYhZA0Q
 2IIjczuEWedaX0YNl8zq6uh54fbfCGHGQGPiwUn4mrDRJ7+zCFTpVfT8KDse9BkiKe+l
 RtoRAr5aRtTlxChPf1HwsEu0/BKA6nUeC70OuO29DfwsOcRiKPN2eNwtyy2lidgW06Et
 6XVsuzgwGjKUxaqKOfVhW+71fb8J9z9IQE2k4HS/VvrgCWfAbVJG6HQYA5BCC/B78/NO
 i0Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgbEcq7Ubclp7HNRhYbgjuNC6mJIGpm8lvTpoj4z+9+p7cX7fj+jVJxTV2O1b1E8ZTjL8rwOFTBw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykUFavh/mMdnIkxtYTHOgn1qV9ZWlUOmwXGc8LgLNqZD0YD4eV
 65J0cYqxri6uQeqYFguiTZ1CbrMPkwjoWZINWLEyn6yRbWrndx4T4QQCSHJsB29pL38=
X-Gm-Gg: AY/fxX5M8pnNGLmCeIGcnfaC9dl6fKkI2L+dASdPcJ6zoDF7+viGJ0H3hBeJx5Yxxa/
 MRKlszLLUSJ37C4vwQ9Swm7vdakKoir1gyY6WXHWWfSWUK1nc4Q2YeNvDFQlSFBgyvuE2gtxhM5
 IrpUB38HmyxnjkntYemPXu4Pkzf3yc9OQnCuSd+sewzDm/WNFUT9byzBfYMG5tHzMh1PqklPLP4
 pdwH1YyUBTULfPCeC70fTf2UxlnWO8tF1ecOnfuGEw/2d0ldtRYSzGLkQQEpmzWthDbZDxsa9CA
 gs2AQ45ZY+/eNzlxt5xCYfI+LqJApSfYrtZwPBNvgmEAI8cuQ6/eKII/68puH4OqMv7lpBis83s
 +Uv6M9vSL0PAZGr0Ye5XjgPlKZ85E6aaOZ3SkH0W5lGqhLNSVe4yl38beKEUyg3v0Vk4jlp/tT2
 lIcxAh0WlS4tcc
X-Google-Smtp-Source: AGHT+IHuJPs2pwNlk9eJ8NAkY60O93gd4KzJGgDlQPNgcPwE17tnxzmYkkPIJLWzyVbgAz7j3VGjLg==
X-Received: by 2002:a05:600c:1392:b0:477:a9e:859a with SMTP id
 5b1f17b1804b1-47d84b3b5f6mr81282245e9.22.1767895326008; 
 Thu, 08 Jan 2026 10:02:06 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f6f0e15sm159929665e9.10.2026.01.08.10.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 10:02:05 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, stable@vger.kernel.org
Subject: [PATCH] drm/xe: fix WQ_MEM_RECLAIM passed as max_active to
 alloc_workqueue()
Date: Thu,  8 Jan 2026 19:01:48 +0100
Message-ID: <20260108180148.423062-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
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

Workqueue xe-ggtt-wq has been allocated using WQ_MEM_RECLAIM, but
the flag has been passed as 3rd parameter (max_active) instead
of 2nd (flags) creating the workqueue as per-cpu with max_active = 8
(the WQ_MEM_RECLAIM value).

So change this by set WQ_MEM_RECLAIM as the 2nd parameter with a
default max_active.

Fixes: 60df57e496e4 ("drm/xe: Mark GGTT work queue with WQ_MEM_RECLAIM")
Cc: stable@vger.kernel.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ef481b334af4..793d7324a395 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -322,7 +322,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
-	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_MEM_RECLAIM, 0);
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-- 
2.52.0

