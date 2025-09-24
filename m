Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16FCCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 10:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B278B10E22C;
	Wed, 24 Sep 2025 10:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Crfby5ag";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEF610E232
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 10:15:23 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso488190f8f.1
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 03:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758708922; x=1759313722; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IOhc0Qxyul5wC2rt4MIQkux7LNfnaT0nE4lQR+NyZBI=;
 b=Crfby5agSdOcaRhlU5jJYztYSuLJ7Mb+YuvA771QV8S0trtitIYwI2U0D8z9kN7Y8/
 k8v9bFP/fjXdLk48wP6CjELOQPhwZr4juLmB+lG4Arh/pkQXhcFL4y5Vdso5y4GkqOsZ
 CAmGSjN69dUs2DxNq6hfA5z/2ROph/9+fFh1jBfVlT0WCpJJ5aJBhAkvZJwJRgMY8nM7
 C8hXwgsI9JJJeNjFL0gfliuOt6u9eNAFukLKUZWsmRrRmmSo5tuFppxnNCJS8tSn/w6x
 j9id+5gXXzhOkhmoHZX87OTe9AMxMTlYkwYamVqyc3gsnw4Bkz44OFwbgh2VU54jX9c1
 Vjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758708922; x=1759313722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IOhc0Qxyul5wC2rt4MIQkux7LNfnaT0nE4lQR+NyZBI=;
 b=kT9jcQQ5zoGCnLyJzMwSeSwo1useZmFqDJES5epzzmZd3IGxD9VrSwplMkqcN1oU4v
 RhFpiP2XmHPeIh01UCPvlTrd6JLrWl8237pl4kZjs9nv5/N86aI4kCvq9AKMlROsTsay
 cMr4tSVNBIaPE08dhOi8oLXgZY2zaBHY/O/GW04yr+uZgRzywcDWWLaIRdb8ZGTiJccm
 ui04bvloZZq6llSKIxRylH0368TUJ6JePhZHTVGy8/yaw1qFadnvB9owcZqxd4ogEvXs
 oA+o6cZJPKlKz91xIF+ZMZt/tub4vWJYx8NXjrCaIpcLb1oI0SZQzXy17utPeezA8jWG
 B3hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViyNUk8oOoWWw91H7BCE8sJeHAZJYcpkBhBKm356SH7uqNgvRMKqjef5p63pIyzeCG8seliW4hiA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnH0wNvnllT7qQTHncc5l8N6i0zQx9hIqboCXzGKrCdTHPFiJP
 ioKWaHMz3NmFoOE9Wvj/ZqgPd+u2wTn0A7HlbqBiVsvuojbz4vbGR7Ff
X-Gm-Gg: ASbGnct3mRg4BVD7T64jkkel6YzBco5hnfhKstuEkriDQc1161HiG2qs0EFO/ZGtS4u
 iEA/nfN3SKjPqYXqwI80X/BWsprCFXeEnLOK6taWcMW8ERAjeiuilmyNO72kS9HgkHyqCXpqQ9q
 rgtwRyUXYyzLnz2hfOuj/q1aG+xmzwxheqeZDrayzFGvlFQPjqe8IVx9Zt3uC+l145JcMtW50SE
 2bbpgbgaBD6kAO24ZSOjNiR8U6h/ibBWQraChM8SupQ7qFQPtNKE8Ggr+puceqH17qWmqCL50Sy
 /LH6Urk5F9r6PyVUt6uiAL1+HRYGV00sjvQ+0qTlznImco5/mprcV8BotgTLonjrVbOyvl+ct5b
 XFqSNhQ9pI6NQUXm7J55VOQ==
X-Google-Smtp-Source: AGHT+IEr/rY8DYnEgjfNqtZnQLYi8AIPod0JxD4snpz+21wUk07dSh+fVo+u5hSxKvTeDXsJt+uDWA==
X-Received: by 2002:a05:6000:400f:b0:401:c55d:2d20 with SMTP id
 ffacd0b85a97d-40ad1604b9emr1380003f8f.26.1758708921561; 
 Wed, 24 Sep 2025 03:15:21 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-46e2ab31bdesm24993385e9.11.2025.09.24.03.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 03:15:21 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Badal Nilawar <badal.nilawar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/xe/xe_late_bind_fw: Fix missing initialization of
 variable offset
Date: Wed, 24 Sep 2025 11:14:32 +0100
Message-ID: <20250924101432.8689-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The variable offset is not being initialized, and it is only set inside
a for-loop if entry->name is the same as manifest_entry. In the case
where it is not initialized a non-zero check on offset is potentialy
checking a bogus uninitalized value. Fix this by initializing offset
to zero.

Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 38f3feb2aecd..4f0a529caf20 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -60,7 +60,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
 	const struct gsc_manifest_header *manifest;
 	const struct gsc_cpd_entry *entry;
 	size_t min_size = sizeof(*header);
-	u32 offset;
+	u32 offset = 0;
 	int i;
 
 	/* manifest_entry is mandatory */
-- 
2.51.0

