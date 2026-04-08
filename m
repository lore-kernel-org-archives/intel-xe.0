Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8CB10F995C
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 17:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99F210E6BA;
	Wed,  8 Apr 2026 17:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="No3FH4MW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1761410E6BA
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 17:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775671029; x=1807207029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+geEDsytKTlHMPwGIgT5/2tBb9MJLZ65ak7SFLQK0xM=;
 b=No3FH4MW+ZnBIEG65j3miOqt/mtHoQEFzRWWVWP7UIX3Ql0ynY4wHD6U
 wbfUNCIbd4qRMv9uy3gSeklvPKCOwbCN7WrXz4E+jkNbcPLujfm8wU4TW
 9iQ3EehhKIV6+8tAO4VeqFstlsCYgxPf2bHgowgpBabeEpuJYv4ctTObv
 sWpA+SHA0xRBdt0Yxh9XCqyF7Ii/YCH+mzSRueCMuIK6mfU02DOoGBeMl
 zOiR7pEIGBBclBh2ktKaT2dX1LdmlOxwhu4pcvtZWZZE9I+yZHpC83qcl
 ekXdI7beRauvMaKjR+eL8QChHdB9rhYPndF2mpiJoHnOGj7ty2g+rc3Jg A==;
X-CSE-ConnectionGUID: /5G54HHYRf6kwI6uTan2DA==
X-CSE-MsgGUID: fc+5q5yUT4uuBfzvwnfTyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76567693"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76567693"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:57:09 -0700
X-CSE-ConnectionGUID: R/Owxpy/Q5y5axKEQpKeqw==
X-CSE-MsgGUID: LCOD8pX7TAu5VEesvtoVuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="233418810"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 08 Apr 2026 10:57:07 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, stable@vger.kernel.org,
 Mattheq Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/4] drm/xe: Fix dma-buf attachment leak in
 xe_gem_prime_import()
Date: Wed,  8 Apr 2026 17:52:55 +0000
Message-ID: <20260408175255.3402838-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260408175255.3402838-1-shuicheng.lin@intel.com>
References: <20260408175255.3402838-1-shuicheng.lin@intel.com>
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
Reviewed-by: Mattheq Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index c0937c090d33..b9828da15897 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -378,12 +378,15 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
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

