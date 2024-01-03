Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65140C47074
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 01:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0D510E185;
	Wed,  3 Jan 2024 01:25:24 +0000 (UTC)
Received: from out199-8.us.a.mail.aliyun.com (out199-8.us.a.mail.aliyun.com
 [47.90.199.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C8110E185
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 01:25:21 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Vzs.HFt_1704244810; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Vzs.HFt_1704244810) by smtp.aliyun-inc.com;
 Wed, 03 Jan 2024 09:20:10 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com
Subject: [PATCH -next] drm/xe/kunit: Remove duplicated include in xe_pci.c
Date: Wed,  3 Jan 2024 09:20:09 +0800
Message-Id: <20240103012009.67352-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, lucas.demarchi@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The header files test-bug.h is included twice in xe_pci.c,
so one inclusion can be removed.

./drivers/gpu/drm/xe/tests/xe_pci.c: kunit/test-bug.h is included more than once.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 602793644f61..6d53f9fd17e4 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -9,7 +9,6 @@
 
 #include <kunit/test-bug.h>
 #include <kunit/test.h>
-#include <kunit/test-bug.h>
 #include <kunit/visibility.h>
 
 struct kunit_test_data {
-- 
2.20.1.7.g153144c

