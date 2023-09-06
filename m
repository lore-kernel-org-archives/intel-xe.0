Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FE9EE14D7
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 20:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5A510E1EE;
	Wed,  6 Sep 2023 20:01:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B4010E1ED
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 20:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694030481; x=1725566481;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=At0mckdk2TWnHgjO6GI+Uy6+RUAKJRpDDkXMRx4D9Rg=;
 b=Fibopc8T5JKaCznciGIbmF9LqDH+6bk48NdHSv9l8DroHnN/3gqe8+/2
 3lnGUfXcz7uIuIDRogxN7ni4kA5LzSqj0ejG1CD9jcn3w6jHhCoqvL9+Y
 /fKXnJpe7i3kIDhQFU4Pszb0Jk0kkwkoM/ridGYHH1wn/48F8rtgWHKby
 fI0SJx8B0JhU15FzRu9kFmjUOJR5Ekk8H7p6I1XSjvC3537L/u7DJ+GCG
 wtkqwKNOTd8xCv/iCpXNcyEeMxjW8DD9W0YPQylFnZwV7nn3nUwVMlQBm
 /JhSo4jPpjPwroFKYTqocmLt080FZ45tVPyyA5LvytoTh7R3sqoA5zTrq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443557425"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="443557425"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 13:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="811807029"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="811807029"
Received: from jeknudse-mobl4.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.212.96.218])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 13:01:12 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Sep 2023 17:00:49 -0300
Message-ID: <20230906200049.49674-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906200049.49674-1-gustavo.sousa@intel.com>
References: <20230906200049.49674-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] fixup! drm/xe/display: Implement display
 support
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

The function xe_display_driver_probe_defer() is supposed to return
-EPROBE_DEFER when not yet ready to continue the probing, but the
current implementation is actually returning 1 instead of the proper
value, which would probably keep the probe operation to be attempted
again. Fix that by returning the expected value in case we need to defer
the probe.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index a453946ad108..bf475f9a7e14 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -45,7 +45,10 @@ int xe_display_driver_probe_defer(struct pci_dev *pdev)
 	if (!enable_display)
 		return 0;
 
-	return intel_display_driver_probe_defer(pdev);
+	if (intel_display_driver_probe_defer(pdev))
+		return -EPROBE_DEFER;
+
+	return 0;
 }
 
 static void xe_display_last_close(struct drm_device *dev)
-- 
2.41.0

