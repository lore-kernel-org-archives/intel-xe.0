Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002DAFF513C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 20:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AFE10E4C2;
	Tue,  7 Apr 2026 20:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIUZ8Z3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E562E10E4C2
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 20:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775593239; x=1807129239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nwodmheEQYwnNfMfuAng0eNZhbi/Eemg/3Wh3HnSvbU=;
 b=BIUZ8Z3I3ubJSeXKExm3UtYs0tBc5MH6uQwS1w0j81a7VMO51dGfxjWh
 hKyRobxmV7zmVOYgtW6a1RdoFnBngxXfwxiox0vq9KmyJzp1+NLUhZnXu
 F1sE1XmHVTHGoNyZY4PhYv9breiRTC6WLPBE/4ZN+ajDOeYdE70NFUo/b
 iuJxVKqzRrQ+OJhdtqlonbKeSy1oRlhUDW0qtUa3RgSbZ023WR5nd0InC
 mLSr/s4nP/Y3WgCxM0PyM53XxyG//6L9853h6oUm/dfbQ/pM4FsPSwp3p
 28tsf93kOZtwZGwBIgfvaYCkqBqNQkMNVqEU2UFK5BlBdIJ+W/PUMgcQ3 w==;
X-CSE-ConnectionGUID: ujFNtirCQTKSf11EkZoAiQ==
X-CSE-MsgGUID: 8os1XAjvRtSkqC9LymDftg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87268157"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="87268157"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 13:20:39 -0700
X-CSE-ConnectionGUID: PrT8G1H9Q+a+KT95Tdx6Jw==
X-CSE-MsgGUID: ym/+Fl0ZQ1uQf6aCMKjU1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="233231606"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa005.jf.intel.com with ESMTP; 07 Apr 2026 13:20:37 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] drm/xe: Fix dma-buf attachment leak in
 xe_gem_prime_import()
Date: Tue,  7 Apr 2026 20:15:42 +0000
Message-ID: <20260407201542.3396317-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260407201542.3396317-1-shuicheng.lin@intel.com>
References: <20260407201542.3396317-1-shuicheng.lin@intel.com>
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

When xe_dma_buf_init_obj() fails, the attachment from
dma_buf_dynamic_attach() is not detached. Add dma_buf_detach() before
returning the error. Note: we cannot use goto out_err here because
xe_dma_buf_init_obj() already frees bo on failure, and out_err would
double-free it.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 24d9d82426b9..7702a6bdaae5 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -370,12 +370,15 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 		goto out_err;
 	}
 
-	/* Errors here will take care of freeing the bo. */
+	/*
+	 * xe_dma_buf_init_obj() takes ownership of bo on both success
+	 * and failure, so we must not touch bo after this call.
+	 */
 	obj = xe_dma_buf_init_obj(dev, bo, dma_buf);
-	if (IS_ERR(obj))
+	if (IS_ERR(obj)) {
+		dma_buf_detach(dma_buf, attach);
 		return obj;
-
-
+	}
 	get_dma_buf(dma_buf);
 	obj->import_attach = attach;
 	return obj;
-- 
2.43.0

