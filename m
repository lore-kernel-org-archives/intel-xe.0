Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD46CA5FE5
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 20:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE5010F9B7;
	Fri,  2 Oct 2026 20:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VrkUHQ1g";
	dkim-atps=neutral
Received: from mail-dy2-f40.google.com (mail-dy2-f40.google.com
 [74.125.229.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F12110F785
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 08:07:40 +0000 (UTC)
Received: by mail-dy2-f40.google.com with SMTP id
 5a478bee46e88-34ea9118159so1579604eec.3
 for <intel-xe@lists.freedesktop.org>; Fri, 02 Oct 2026 01:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790928460; x=1791533260; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Z54n6VzC+kkkl/3Ijn5IvZJnQmri9nkKbsWlxFk/GYk=;
 b=VrkUHQ1gaD82K8RsdlOEMUQ3L07BGnfLQXjJ7LPRlFO1xZIjSIhW7+Orn2eVHH89+S
 nE/IWjH+Ti1p4H799zxn9/TeQ+Y5M9cTWJDDCVQwEfJJdr9J4pA+W5TPatQfJsr2E7Cc
 HnGrcPKe3i7+VeVREBcnbQxVfrAfJ1bG55GqQa+upXZZ5oHE7pMWAWEVRzvt5a+hV9O2
 HXLe+vP2iEavKJeq0seYkT3ibGTUhkCJxNOSH90mV1LLRQJk3bGMZFow+RJFp+A5a8b2
 uIrRwVbSX37HF5ZN4KRsDmsGOYmRG2zcozvRjcRxPINBMgldUChT/i56GnQXe+Kzla/P
 +OwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790928460; x=1791533260;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Z54n6VzC+kkkl/3Ijn5IvZJnQmri9nkKbsWlxFk/GYk=;
 b=wFyLlXGEXRxMLJ6yX/ZjSCUs2P1PtvtwQyq+QEJamTqhE3A+s7gzdTmpS+jpNeksFN
 p8ZAIXc2RJQqEp0ykgOw/BgoaZrOwdbjIOKGYu/z8VQcrRSkM9mE0bwds+IoNxFZfQpn
 TwO4hrX70ZCuLOml3nCXh1TPuhrNEKHJUCtZxY0QC3AcxU45XJur8aFjQEyxBQyXrg0H
 cJXWczi+ftzF4OhrpvhJJQyksCp537z1PTfiu9iRmHsy6SiefV4Vfs5Pg4LMBKHg5iQr
 k2I6QEwEdIp6KAh+Wu7JnbdInBWcMvdNrHPaiKHcfKzp1f/7L68l/C2yRDZni3TaIdyM
 6ubA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy5fCzS9YqOwKtfXg+ThQZeYuVMHw5QQnEB9gSyj4aLKb1+umOxXqeLCPxNmYwa7IfoFziTAa7reA==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLi3PlmuimJZfBIDecsVhxpknP58OWAPW7Tdk8Q4s4L28MjxNUi
 P3SPAnsxUm7rns3cbun9jLaldmtvCu3+/9+VegISn9Ii3c/Pkfe64JEB
X-Gm-Gg: AYBFou37BW7Wbqg4MywS0w3Liw6gKu4CASXkW6MAeuApYK9b7BcuieFzTYFl/H+UiOx
 +MGrOm4rY2FbJPMXQzCh5JAg3MYTKCOaX3pbOsy0FEDoElegq4k/jAZ3rC8sYVF5Tgrs6UD4Hne
 YSVqdcBhy38QbfgFPVcQGbBFmGH2iE6vUVBbpPc4iSf1gxSw9MiICVpFmDn5rUINUPMGMTnvzRv
 u4fBTjK1Ery5MpAd/92gX7eOcRBU1pVpzFXD5G1Y6vNp7C5izsMuzQhWfhjwxMl1b1BQ4v7k/tf
 OUa2XXXBaDBCqlKkhtUAoXEniQeeZ64VdNX6aEJV1yGjcUzMJuw3NcGgVPYcF30UjKKKFaRMSKr
 wgJhNZmMmrcdweeJsezaIuoMxQyrfBD5Jx+OYoWm9w6wvoyzFNHisnZdWL6O47OiYkm6I5wixkK
 Tcv0ajkz3Ar9JLr5NBIdSE3Y52QTUG0twBS1nOp2huFcZWpd5TtJIyabYN2ZgNSkGTppjAXQokR
 8PwJ4GavXEyPDIjdw/O01vDQNsazhdlJlipf+NnVsgJTnYfZUxhgzXl5yHOjMHzLGs8O/kvF9Al
 OI6a428=
X-Received: by 2002:a05:7300:e9d7:20b0:350:7852:f7df with SMTP id
 5a478bee46e88-3507852fc50mr1336424eec.0.1790928459675; 
 Fri, 02 Oct 2026 01:07:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:1c0e:3312:2cff:28c9])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14f303e3sm5492739eec.5.2026.10.02.01.07.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 02 Oct 2026 01:07:39 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH v2] drm/xe: use resource_size() in xe_pagemap_create()
Date: Fri,  2 Oct 2026 13:36:59 +0530
Message-ID: <20261002080731.13992-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Oct 2026 20:44:45 +0000
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

Use resource_size() instead of open coding res->end - res->start + 1.

Include linux/ioport.h explicitly, since the file relies on struct
resource and now on the helper as well.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
v2: elaborate more in the commit message, and include
    linux/ioport.h. Both as per Rodrigo suggestions.

Link to v1: https://lore.kernel.org/all/20261001163328.51556-1-sinha.aryan03@gmail.com/
 drivers/gpu/drm/xe/xe_svm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index b228a737c..a9b087c43 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -3,6 +3,7 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include <linux/ioport.h>
 #include <linux/pci-p2pdma.h>
 
 #include <drm/drm_drv.h>
@@ -1848,7 +1849,7 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
 out_no_pages:
 	drm_pagemap_release_owner(&xpagemap->peer);
 out_no_owner:
-	devm_release_mem_region(dev, res->start, res->end - res->start + 1);
+	devm_release_mem_region(dev, res->start, resource_size(res));
 out_err:
 	drm_pagemap_put(dpagemap);
 	return ERR_PTR(err);
-- 
2.46.0

