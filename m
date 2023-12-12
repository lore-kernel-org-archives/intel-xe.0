Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC52C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 04:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D5E10E4C8;
	Tue, 12 Dec 2023 04:01:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3FC10E54B
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 04:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702353670; x=1733889670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c7ZwKztvr1h/CUSUEficRIjht1ZukL5qyaJ1iGso6yE=;
 b=KN5xss0zC9rrzboDfNjmqpaIegjnohs7Yr6juQBdqVRhw3PneX6+7r1L
 FMfWsUkKSdzDBHu2oaMlXV1XZIIjwFzbbm37ob3LdA6AyUYzBfRhNYWwZ
 CdcmnI1kvJPO0balWuQ2VG5QYd9P+KjLnoDLfOTG1d71283wcvmnPXZXq
 PNNHv3slK9mMHjM80x7b/MFTtGaPu6DtkqIcKo0AYzO7KBfmySnK7kTFk
 lgQDtQxKg0cfle6Au84bw0ZerukiQZkXN/TmvuFU+qpE4Upk8ppck5mvl
 XIPrRSOqoHTfbEoXXprpCWxhR8VExLnEZdw6X1fkdGHwJXAivnXWVajcQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="461225918"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="461225918"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 20:01:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="723074996"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="723074996"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 20:01:10 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] fixup! drm/xe/uapi: Reject bo creation of unaligned size
Date: Mon, 11 Dec 2023 20:01:02 -0800
Message-ID: <20231212040102.2888700-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212040102.2888700-1-ashutosh.dixit@intel.com>
References: <20231212040102.2888700-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index bb6f6424e06f6..9f6d571d7fa9c 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -3,6 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include <drm/xe_drm.h>
+
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
-- 
2.41.0

