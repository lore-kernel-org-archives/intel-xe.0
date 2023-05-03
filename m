Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074F2C77B75
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 17:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D310A10E357;
	Wed,  3 May 2023 17:49:34 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD6E10E32A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 17:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683136173; x=1714672173;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QTRSRa7p1qdGbkyCVRA0G7fFvWLMHS4yHDkDxbb6VxY=;
 b=PtdRhDyamhz/zyLiehdoeZFNYVKfrD4eXlzPLcQhKKbeqLvT2kk8zolG
 61CVaMGqz19EjIEJnuRra8cAzQT4/9UJLPGLfc5iYweNAf/JgeqI75bhx
 QoODODOdiJwyrYcGcBZREWU73sT7pX17XaCNohmPhU3AoJYciGGuUKUUf
 en+aTwBRMR/lbNkQD1VfdLdayx/q9QOVs7zzgjDwpryUVgHDny18l2PSE
 rGImeXsn5Zmxq2zwGHY4f+IhWbe2D5q8laxYwUj2s6sNsi/IpfXy7Tcne
 8art0FfmH1Zgy0U6PHRxjcgS22vG8f0PCHHchXtG7KMSU/3WdIyVhtJze A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="376787130"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="376787130"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 10:49:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="699494719"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="699494719"
Received: from cjcamach-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.34.25])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 10:49:31 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 14:49:22 -0300
Message-Id: <20230503174922.252111-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Include only relevant header in
 xe_module.h
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

Things defined in <linux/init.h> are not really used by that header.
Replace that with <linux/types.h>, to have bool and u32 available.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_module.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 86916c176382..7169907c3365 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -3,7 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#include <linux/init.h>
+#include <linux/types.h>
 
 /* Module modprobe variables */
 extern bool enable_guc;
-- 
2.40.0

