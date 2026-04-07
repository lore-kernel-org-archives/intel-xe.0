Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFE7FF513B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 20:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BF910E4C1;
	Tue,  7 Apr 2026 20:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ag/BeRR9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902DD10E4C1
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 20:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775593237; x=1807129237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lOrt+2LaP42yZ3B1bpDURZfcXn0SuRnqjpSnPDCOwv8=;
 b=ag/BeRR9XnbtgBvWZLboEnI/0lSBBDEzQTfErJS8wpUf9ps5uVawVZ9E
 wTgkqBjtv9F2d6JG1PxNeSzvqKWs/i7vfYAQ8ic4dUvEIuV01zox56Jla
 ADBm/l8wyUei5VEu9Uy5vgm+nXYM8JR8RDUIPgz6OkA08yaD1Rldup0oX
 t/y9ADjgZvc/6132+Kric3PM9V1ON0brRrcgV2OQuv7jCyJWj/UZDtxsv
 6Lcj6AG1xniD2gd9bdV5hOcorSyv3qVdDCnJSaLYYW6GScVysqmnOvkHF
 P0An29mHDC6tB1dZUOUFP8GjanySQSQDlBlhL/r6y/cJWqcxlGjSx/Aao w==;
X-CSE-ConnectionGUID: 4H75NPdnSFC4hnzE1q5kig==
X-CSE-MsgGUID: IcojS2vSTamkyMRbOal9ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87268153"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="87268153"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 13:20:36 -0700
X-CSE-ConnectionGUID: fUqYcaX+QPWtmjtDuvDbDw==
X-CSE-MsgGUID: f3xPo4qITriWfXyJQ1iqbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="233231598"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa005.jf.intel.com with ESMTP; 07 Apr 2026 13:20:35 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] drm/xe: Fix bo leak in xe_dma_buf_init_obj() on
 allocation failure
Date: Tue,  7 Apr 2026 20:15:41 +0000
Message-ID: <20260407201542.3396317-4-shuicheng.lin@intel.com>
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

When drm_gpuvm_resv_object_alloc() fails, the pre-allocated storage bo
is not freed. Add xe_bo_free(storage) before returning the error.

Fixes: eb289a5f6cc6 ("drm/xe: Convert xe_dma_buf.c for exhaustive eviction")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 7f9602b3363d..24d9d82426b9 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -271,8 +271,10 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 	int ret = 0;
 
 	dummy_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
-	if (!dummy_obj)
+	if (!dummy_obj) {
+		xe_bo_free(storage);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	dummy_obj->resv = resv;
 	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, ret) {
-- 
2.43.0

