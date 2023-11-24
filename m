Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F86C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 15:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668AC10E81A;
	Fri, 24 Nov 2023 15:34:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5158010E811
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 15:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700840055; x=1732376055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HBT0GnFaCbjgIUuQCY/USmeMIW9Xts6K4WrTgi77iSo=;
 b=JXeE6YJVBj/DIIIZOPiCpOJLAga9Bwj0liNRn8QlcTlsnJq3LdGRIE6Q
 KnOu5flXFMKzONsa6dIUYlQGI9fgXIpUD+j42p8pW//GiwIDE1P58H9LY
 eOVkOxkvpaCtilj2mSbr1o9GGwDszopXvb/uyox5Q//mligbFXe0U642B
 E5lfFP8Ct/Q0W3OJeo7TdGDSzVXGmvF4GOv8OJUEQrdeZRsN7vcBah9K+
 jJpursE4UYWT6zwuYwraIVmiOYqqqQ0Z9jmdhIkFUTsrc4pupZdgX0ND3
 bFpKpvSi1g9B5rapUW7HkkIrECcToHoDWGZv1XI1tdKtqs6KrsiNzqSLT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391315676"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="391315676"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:34:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="796615256"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="796615256"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.175])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:34:12 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 16:33:44 +0100
Message-ID: <20231124153345.97385-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124153345.97385-1-thomas.hellstrom@linux.intel.com>
References: <20231124153345.97385-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 3/4] drm/xe/bo: Remove leftover trace_printk()
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
Link: https://patchwork.freedesktop.org/patch/msgid/20231122110359.4087-4-thomas.hellstrom@linux.intel.com
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

