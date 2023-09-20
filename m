Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F9DC27C7B
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 21:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A05110E57C;
	Wed, 20 Sep 2023 21:26:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1533410E56C
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 21:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695245201; x=1726781201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4AKFxMNQeykjROQImgRB+UFU8mRVeud+0k9PXkxnL5o=;
 b=P8bKzB/diJKvqM/0HFMh9A/ZNaRSsQVyQ3+FgMbr7gX+3WBdzn6VyPo5
 lNzJe4JYElxD09usvSWbueF78oYtr2Mnykbb+4yd2yJtRMA223njava6W
 8fw6z/Mb5aCWKhfH0BsOiuOJA2m4Xn2tXIPF1KX8TsiiKnH7KnLEWUk3w
 950v4k1MbptM2uo9zkNgQxONti+XqlS8ze1XRX8CmrSqB9zG6ZFOl80TJ
 WuIQyeiiEUvFnNsI34RRPYM781pU2dLyVLnmppx2EnXSmWIW349CJV6Ch
 MJdeZPEnfBvruumS/iZBd3zN9wzSe6ryDfh4e7cTP+b3kexqiHa7k7Eot w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="380256271"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="380256271"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 14:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="993782149"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="993782149"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by fmsmga006.fm.intel.com with ESMTP; 20 Sep 2023 14:26:32 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 03:02:59 +0530
Message-Id: <20230920213259.3458968-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Align size to PAGE_SIZE
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
Cc: stuart.summers@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Ensure alignment with PAGE_SIZE for the size parameter
passed to __xe_bo_create_locked()

v2: move size alignment under else condition (Lucas)

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c5e4d04c4d58..59c57430918b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1218,6 +1218,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		flags |= XE_BO_INTERNAL_64K;
 		alignment = SZ_64K >> PAGE_SHIFT;
 	} else {
+		size = ALIGN(size, PAGE_SIZE);
 		alignment = SZ_4K >> PAGE_SHIFT;
 	}
 
-- 
2.25.1

