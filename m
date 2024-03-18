Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E38C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 09:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C521010E868;
	Mon, 18 Mar 2024 09:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FH4QE4gE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C09310EC36
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710754483; x=1742290483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E1Qy0pvv3oDB9PP1h6EyBOAgEbtRK0zdb0HBXunMAF8=;
 b=FH4QE4gE/kGxD6db/7GjuVDtEdSiIGojhzDa+BRa2/jQNt6WUjgYOhu+
 yKR/nXD5eCIX659SKTwjAJg/lKHlMBDBKhlPYdjf2nDtN7V1m2IR3V0MV
 7v2EyMT4JYUxF6EoYiOcFafldJxcM3MtTew4ANcrNcdJ0hMqTM0KfH73b
 9LIFbnreXNfMRUZOlWIOftojbVgavj8T5NYVGslWjMH7k7g7yTvUb3dub
 qcl7ZoPsE5/z+4QlVmD3SnYsgRz4FX+5IcpxXu1Eh7wzogtdfDFD+QYkV
 xg9ZzgAqlNRjPmQin6A2qWerSreh50L9YihBI3A1t2J2WURFNwqBUXQ8C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16103644"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16103644"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13516933"
Received: from unknown (HELO mwauld-mobl1.intel.com) ([10.245.245.16])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:34:43 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 2/2] drm/xe/client: drop bogus bo NULL check
Date: Mon, 18 Mar 2024 09:34:33 +0000
Message-ID: <20240318093431.21075-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318093431.21075-3-matthew.auld@intel.com>
References: <20240318093431.21075-3-matthew.auld@intel.com>
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

If we fished it out the list then it can't be null; the list entry is
embedded in the bo.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 59b01d838229..08f0b7c95901 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -155,7 +155,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 	/* Internal objects. */
 	spin_lock(&client->bos_lock);
 	list_for_each_entry(bo, &client->bos_list, client_link) {
-		if (!bo || !kref_get_unless_zero(&bo->ttm.base.refcount))
+		if (!kref_get_unless_zero(&bo->ttm.base.refcount))
 			continue;
 		bo_meminfo(bo, stats);
 		xe_bo_put(bo);
-- 
2.44.0

