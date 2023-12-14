Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D074AC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 11:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7401C10E904;
	Thu, 14 Dec 2023 11:24:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC88410E904
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702553070; x=1734089070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1XnLLkaZ0ewUjMB8I13iMhmyhHVTccwnH9G76UH+0b8=;
 b=Cv/YziZ6N64jGJCL2P+eWGXQLENM53W5HpxzpNd2aHbXApE/UMCxRFrX
 pFnc6QnRUtVXiqm/FJf/2Wi2OJpCaIXivqPlznad9B22ZmqEnZckczuGa
 coKX6UCh978tJbW4eU+XR0nGKzfrxRmgaWbXCfIiLI9Lzmtipuan/kWuL
 XwTSXyYBXEJGymjgRvGdL12Rv7coCinMG05JTCzX3YUZkK95qqxR3cMSs
 iKBdTgg2PgyZenASUs0MvzTZGcyb/kCygWN45k3JMw/q/Sh6LFyvEj1FZ
 KzxRT8EiW8Pp3CA9NU+8Xy650sglZN5oGEwdR7mprdbVbFEUmv90+5cbu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1940163"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1940163"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="17714162"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:28 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 02/10] fixup! drm/xe/uapi: Reject bo creation of unaligned
 size
Date: Thu, 14 Dec 2023 17:01:36 +0530
Message-Id: <20231214113144.251726-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231214113144.251726-1-riana.tauro@intel.com>
References: <20231214113144.251726-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index bb6f6424e06f..9f6d571d7fa9 100644
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
2.40.0

