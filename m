Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F26DC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF4410E521;
	Mon, 13 May 2024 08:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKtk/Pmy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E0C10E521
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 08:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715589749; x=1747125749;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZCi1M/DCu1IesvfNJWhQyiFQKYWKAmLR20aQbao0LpA=;
 b=QKtk/PmylS0KnVixRI2qI7XjQgCLtcuBSC9K7gHnp1gnOC0+f4J2gzHo
 ZsgBpfiXiSpDTMIEYV1hddsOZGYPuGHgEtD5kokNOT7npiEUDeGk0rNyd
 m7clO9W30cd0PekwQyyABZYKpbSozSJDqAceJ8/dcRbWlifNTDv4Zsgnw
 +1WvPF8qOi+i0ebX/2Nd7tyjg2dHzermjAT6tYrCgV0SrO5GWkfhit15V
 RN/oJk5JUwVcUiiQCOkT92x5CERnc0HvzX1moa26YR6Y3vg/fsxGbqCCP
 uXqYYL8S75ZtTTnHYbuj3WaSfPbNwKxeCZh8MSEw+dSyRqW+D09Mig7Hu Q==;
X-CSE-ConnectionGUID: Hu8GdEC0QceAYtgl+uuDiQ==
X-CSE-MsgGUID: RFoLTc2bQNS267onGRwC1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11452634"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11452634"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:42:29 -0700
X-CSE-ConnectionGUID: KBDfzfW8Th2ZjOVhLTy6cA==
X-CSE-MsgGUID: MQp0xE5MQqmpkvKAn696UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30306518"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:42:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/xe: Fix xe_guc_ads.h
Date: Mon, 13 May 2024 10:42:16 +0200
Message-Id: <20240513084218.2084-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240513084218.2084-1-michal.wajdeczko@intel.com>
References: <20240513084218.2084-1-michal.wajdeczko@intel.com>
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

We don't need to include xe_guc_ads_types.h here.
Use forward declaration instead.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
index 2e2531779122..2e6674c760ff 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
@@ -6,7 +6,7 @@
 #ifndef _XE_GUC_ADS_H_
 #define _XE_GUC_ADS_H_
 
-#include "xe_guc_ads_types.h"
+struct xe_guc_ads;
 
 int xe_guc_ads_init(struct xe_guc_ads *ads);
 int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
-- 
2.43.0

