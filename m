Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478CDD2629F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0576A10E23A;
	Tue, 20 Jan 2026 20:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfnU0r0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEFC10E220
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768940184; x=1800476184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C633H7x8pyYoe1aAfzObwOBZzE67vng0lpfEYkouKHI=;
 b=WfnU0r0CbLZqkXHDRu0GsZVuWr4Ykssgt8fxCEY1Sj6T+VJjeJPVBBsO
 6Hl+zhr2B7DMSjdp1pKK74ke2WVohjPwjLCr0V+4bdXJKs1k4yhLVu1n/
 3O8KwsW3dWunRZaiWqhw4FkTZcZ6XVopK/o4kKCY3pgZKIoBgwp4cxoOm
 sehKSqx9TvKKOAgpFV6QvFodlD3csXKTLQiMQ9sQSmu/zW4DPgpT+bmb9
 4aCk16wVst43ZJgUSUz7v2/Tg4m4wSyRJNmHJYwN+KX3dWvJuFN67wWj1
 OWz83ForSR3cB+Vn+C8Z2g9L/y8RQcCMSQfLPercm/gZc8sS6yLdaHrGx g==;
X-CSE-ConnectionGUID: gTpVZf4TSQuZQ69M0xNlIA==
X-CSE-MsgGUID: J0s4H5k3S3G46TqbbSsgaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87574659"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87574659"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:16:24 -0800
X-CSE-ConnectionGUID: oeOYgT/xRveV85xMckS1WQ==
X-CSE-MsgGUID: MEUmTBvqSymetF/zGSnwyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210373504"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa003.jf.intel.com with ESMTP; 20 Jan 2026 12:16:24 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3 5/6] drm/xe/uc: Drop xe_guc_sanitize in favor of managed
 cleanup
Date: Tue, 20 Jan 2026 15:16:20 -0500
Message-Id: <20260120201621.2442803-6-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120201621.2442803-1-zhanjun.dong@intel.com>
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
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

Manual sanitization is redundant as the driver has transitioned to using
device-managed actions for GuC state cleanup.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 3f63c2a7e86d..39101120d43a 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -171,7 +171,6 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
-	xe_guc_sanitize(&uc->guc);
 	return err;
 }
 
@@ -229,7 +228,6 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
-	xe_guc_sanitize(&uc->guc);
 	return ret;
 }
 
-- 
2.34.1

