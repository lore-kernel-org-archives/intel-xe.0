Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957F6C5AD4C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 15:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B0510E09E;
	Thu, 23 Nov 2023 15:32:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F5E10E09F
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700753556; x=1732289556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IQVd32NK4b/ysT9+vMVaDvgThqS3uN3fyEDAs4419sU=;
 b=MD/OIWkZ3OSOSv72b7dzQwTt+OTFtv7pl1SXdQIGRpkaiFsjepM0qy2F
 nKxjnQ847wYjGLHcaoTa/qG+lgQDYzxNEGOSwAkaLVuQic2qncTwX7yN2
 Tzwv0GL2Bho/7WsJTIyzuROYVypVA8HDScxtBT2dvcSh1oZAKOXO4y/jW
 Lwk3uhTHb0vVkBGORI6rZZQZ9gb008ivSky25hLNz0/x1RGapo/9SL80A
 UWaP64SjSKJnhNpCdjmZB4dhIDkcXFZOcktT3G8MqVSzos9kxGQQNRFZ3
 DW0kGSqMGPG0YnZQRxn2YA1PDR1ha8gykDGRxbFkyq1f4CjdH8UEHWrVT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377314383"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="377314383"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 07:32:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="8697389"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.177])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 07:32:32 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Nov 2023 16:31:57 +0100
Message-ID: <20231123153158.12779-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123153158.12779-1-thomas.hellstrom@linux.intel.com>
References: <20231123153158.12779-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/4] drm/xe/bo: Remove leftover trace_printk()
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

trace_printk() is not intended for production code. Remove it.

Suggested-by: Ohad Sharabi <osharabi@habana.ai>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 58213835803d..c5aa01c0861c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -785,7 +785,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	}
 
 	xe_device_mem_access_put(xe);
-	trace_printk("new_mem->mem_type=%d\n", new_mem->mem_type);
 
 out:
 	return ret;
-- 
2.41.0

