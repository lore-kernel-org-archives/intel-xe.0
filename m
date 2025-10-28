Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECF2CCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 15:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653A410E5F5;
	Tue, 28 Oct 2025 15:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJsvWSGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1488410E5F5
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761665902; x=1793201902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XUfvR5ePQ5OCVWFVYmytY/Q5CyTNrPD3ygeAd3lCz9Y=;
 b=JJsvWSGd1zI87u9yf2KJCMycFnq6sINiii/wwfbV0ce5xgCYamqKBAqZ
 m+6xCV3HKya9UU9vAtdlOgcxIZu8qAVUbFnfL7nCZS/koHsuffxbTfSmD
 OPRBk9e9l+r9hBqTov9RUwfJuJfMDiT5Pmt3XkzCoz2j3QndUNvfpQcVT
 GQ0Tt3HxI8jBZT4p6WdQHDjk9CFB0CnlJ4V4GjzvSIFgX3U+CuhuSQxQY
 YUTrxMwIvROq+6YrLC9KDJAySKLlnWGQ5woW8R+cFrYWe09G3qSgfk++0
 ZTzX3VaGJ7Ala6Lp1NGJppcNL/E1baIt9afZZSV08F66GW/YzpwWtNezj Q==;
X-CSE-ConnectionGUID: MjyVyskUTn2WvgHSjaztcw==
X-CSE-MsgGUID: sV4vBqmSSHOmzz+UoLMkbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63806305"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63806305"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 08:38:22 -0700
X-CSE-ConnectionGUID: Y+GPshkXSnKrcqJY48wIug==
X-CSE-MsgGUID: E5EPiTVvQ/2pxCqJNZBalg==
X-ExtLoop1: 1
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa003.fm.intel.com with ESMTP; 28 Oct 2025 08:38:21 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3] drm/xe/uc: Add stop on hardware initialization error
Date: Tue, 28 Oct 2025 11:38:20 -0400
Message-Id: <20251028153820.3139977-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

On hardware init fail, the hardware might no longer response, add GuC stop
to clean up exec_queue items.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
v3: Switch to xe_guc_stop
v2: Switch to xe_guc_ct_stop
---
 drivers/gpu/drm/xe/xe_uc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 465bda355443..00ca5883e006 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -173,6 +173,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
+	xe_guc_stop(&uc->guc);
 	xe_guc_sanitize(&uc->guc);
 	return err;
 }
@@ -228,6 +229,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
+	xe_guc_stop(&uc->guc);
 	xe_guc_sanitize(&uc->guc);
 	return ret;
 }
-- 
2.34.1

