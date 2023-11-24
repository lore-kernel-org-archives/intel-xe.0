Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B71C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 09:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133CF10E7C5;
	Fri, 24 Nov 2023 09:11:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4210210E7C2
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700817097; x=1732353097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HBT0GnFaCbjgIUuQCY/USmeMIW9Xts6K4WrTgi77iSo=;
 b=FPkCMjreFVQrCCrQAULlU6ou39b+bRUks5i+5qNGQOc3XEX+eaBd0WqS
 46zkkJkXspI3MMZHDsjcqvc3CHEvhBYcfGUYf8zmOZjBhTjQ/LOf841Kv
 lJ1Dcz6tzfm9brYCmnX0VG15XinwA3Q/zF0KbmsGCOiyKu/AUAdcv9UdL
 VHOaHzUi8UFRE+4bsCRitnj+c9bW6LmXSqRQ83cAtSRq7D8tMUxTYI4SI
 0so4xuiH64hUw58alk3ctCzD8uN9S67zLDUEScQdGxrxI/W6TOlezlhD1
 k/cQQpahnwbvlLR98xm8x1JEfYR1Q44bAI3AXMRluivCzWiiSZ0aDGDb3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377423931"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="377423931"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 01:11:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771208065"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="771208065"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 01:11:35 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 10:11:10 +0100
Message-ID: <20231124091111.77269-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124091111.77269-1-thomas.hellstrom@linux.intel.com>
References: <20231124091111.77269-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/4] drm/xe/bo: Remove leftover trace_printk()
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

