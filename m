Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCCAC5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C6610E5CD;
	Wed, 28 May 2025 09:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="LjAq31FP";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF5D10E5BB
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:13:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so4406815e9.0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 02:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748423606; x=1749028406; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+THTr2BiDJNi1zaHsXBwi0UHT98zSoGnw/j4dqNXEk=;
 b=LjAq31FP56+GYbZv1G6BSkPLMjdSA6kaUwdlLUqe8OvYXadtIum3kY5ljOW1xW+B7q
 wHSbFWex9g4C9mZg6qYwLNjScDsU0Bb7DUPZz0oA2+2NYHQYb8FphT/q0F9I73nXU3Rf
 lc6+GP4pDyc99Tav7YvQak0SFlJffovvzfVCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748423606; x=1749028406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5+THTr2BiDJNi1zaHsXBwi0UHT98zSoGnw/j4dqNXEk=;
 b=wX1lCi+KOP92jqAVmwgh+Vb7RERRT47cn+ZNZwiVKZ5X96UKIoXD0e20hB5FkcFuqG
 hs2431LEWvzDheLZutlXES0Gz/RaCoOvwiMtnCafv96cSKyLiqI1GoBHEMICb/qQbUPP
 pbxR+Y5IYn1LFonNIE36Rz2GYvbal4pG83nzC6L89/OND1Nrx0hVHr1bJrzDkc+BwcC5
 jjmY9ME8k2FSUPaVTmZngopod3u0hOgkCfBdmCOiyQaCUZMToW+9xUTar0FVy78s/dtu
 4FmifO/UnvEYQ7WJsmsinZXnHDyZdYiYC3GzuXT9i/k7I9GRNotUkRk1GKa0OWW4YP1l
 fn0w==
X-Gm-Message-State: AOJu0YwinxkeGy/cF3wz0kfcII61kOo2Fq7UFfF8LiBFURgZ1kb+sqwD
 NQ+GCgwyVymFMX2MlXqcqa5XdEHM/kwoku711DIMteGxXbkBT85AzlPEcOFQFba40ws=
X-Gm-Gg: ASbGncs07Kx40W6/O7nWklD+cih+R60J6caO6xcPK2qGm2IoCjYvRlmkGOU2eyqmKTq
 cFzCXkz5EF6nD7QWFzMU54DxumIA3/mjoqW7kUrJmvZ3kTf+sJ6KqCcs5xdTDlW9KM5dW+rksSS
 7HjzSSUK052Cec9LpgLt6Ri9A2LVjmmwl48F2uy4Xpg17CjaiwXFw4ZShyQB8xoYbZDCNZD9MMd
 BPvE4SXYc5wDs8l81GTQFggrknSJTXfOcM/nd6eAKH3//10wlkEtBb+nXOd6ol2QR5RmukFe9xD
 0Mz/P6vKzEbMuq6u/O1sMMUcXPqt+gUx8C0aqBYhngYWJGH2UxZmVL3NvBrP/4o=
X-Google-Smtp-Source: AGHT+IEbd+J+RYHqR9Kk309pbGNiIY1iuQZjmSTnREOJWpU1y1ZKvfljOzrgigN9MN+VwJgY9PMkeg==
X-Received: by 2002:a05:600c:1e0f:b0:440:69f5:f179 with SMTP id
 5b1f17b1804b1-44fd1a2db1amr34968885e9.7.1748423606322; 
 Wed, 28 May 2025 02:13:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:13:25 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Simona Vetter <simona.vetter@intel.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH 7/8] drm/vmwgfx: Add comments about drm_file.object_idr issues
Date: Wed, 28 May 2025 11:13:05 +0200
Message-ID: <20250528091307.1894940-8-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
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

idr_for_each_entry() is fine, but will prematurely terminate on
transient NULL entries. It should be switched over to idr_for_each,
which allows you to handle this explicitly.

Note that transient NULL pointers in drm_file.object_idr have been a
thing since f6cd7daecff5 ("drm: Release driver references to handle
before making it available again"), this is a really old issue.

Since it's just a premature loop terminate the impact should be fairly
benign, at least for any debugfs or fdinfo code.

Signed-off-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index c55382167c1b..438e40b92281 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -323,6 +323,7 @@ static int vmw_debugfs_gem_info_show(struct seq_file *m, void *unused)
 		rcu_read_unlock();
 
 		spin_lock(&file->table_lock);
+		/* FIXME: Use idr_for_each to handle transient NULL pointers */
 		idr_for_each_entry(&file->object_idr, gobj, id) {
 			struct vmw_bo *bo = to_vmw_bo(gobj);
 
-- 
2.49.0

