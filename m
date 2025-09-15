Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D4ECAC58E
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 08:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D932410E33E;
	Mon, 15 Sep 2025 08:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ooy7PLjO";
	dkim-atps=neutral
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC0A10E33C;
 Mon, 15 Sep 2025 08:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1757923914; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=yDRofLuwR36Gwj6fKDMsFxxdwxwoKd4LieQPKmSPy18=;
 b=ooy7PLjOhw2zonI9qjSD1DL/60qaoMooMaVN1rDBwphXZqhZ7jktrzL9COupbK3CH2d/hhhLHAdyDxnRMiipxDvw9tEroLy2MEUbUMp98DnULbrYPtgLW3UxRolS1x8SPFGOk/JODTOjTFydeW1XmmImMPQzBNe8upFFOnl1i0k=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0WnzwkG1_1757923610 cluster:ay36) by smtp.aliyun-inc.com;
 Mon, 15 Sep 2025 16:06:50 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next 2/2] drm/xe: Remove duplicated include in xe_tlb_inval.c
Date: Mon, 15 Sep 2025 16:06:47 +0800
Message-ID: <20250915080647.669569-2-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20250915080647.669569-1-yang.lee@linux.alibaba.com>
References: <20250915080647.669569-1-yang.lee@linux.alibaba.com>
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

The header files xe_tlb_inval.h is included twice in xe_tlb_inval.c,
so one inclusion of each can be removed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=24706
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index e6e97b5a7b5c..41e80d609815 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -17,7 +17,6 @@
 #include "xe_tlb_inval.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
-#include "xe_tlb_inval.h"
 #include "xe_trace.h"
 
 /**
-- 
2.43.7

