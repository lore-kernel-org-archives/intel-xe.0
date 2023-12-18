Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57ECC46CA2
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A41B10E392;
	Mon, 18 Dec 2023 19:00:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BCF10E39A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926047; x=1734462047;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NOKXsj8xejeDZnak6upiEvLiKOcfWexLU3mzLgCPmdQ=;
 b=TRaVtV3aAAIJ1MewGZpB+g5+PI4RvBVEJ40S8tLyXYPMvA4Wj/XHUxQ+
 TAZdsNP+ATV2bD16sUme2PR9hqQFAJ1hw0ZNTMrXPevBT31n75rqf4RzS
 8kTjH0y0TmmUf9FH0eUc+E0ed9z8xJVKevNaGGwcukeJSCCNvHQj9JnCI
 b8zUQqXWi2O4MwB33aU5yGkg//i4yAekG41d885NLUTFrdDE2IASXF9c1
 8NgaZe5x66HJQNZcI5doCSHaOlfBC1zH2SpDElq6OeIfZ8BcdG+TgJGeK
 eKZ86MOl/124/Gjz55n+v8MbidwKUmBcT0F5vbva86VFWcP5+jncWGohE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="461980968"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="461980968"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:33:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="17244439"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:33:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Fix warning on impossible condition
Date: Mon, 18 Dec 2023 08:33:01 -0800
Message-Id: <20231218163301.3453285-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Having a different value for op is not possible: this is already kept
out of user-visible warning by the check in xe_wait_user_fence_ioctl()
if op > MAX_OP. The warning is useful as if this switch() is not update
when a new op is added, it should be triggered.

Fix warning as reported by 0-DAY CI Kernel:

	drivers/gpu/drm/xe/xe_wait_user_fence.c:46:2: warning: variable 'passed' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]

Closes: https://lore.kernel.org/oe-kbuild-all/202312170357.KPSinwPs-lkp@intel.com/
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index b0a7896f7fcb..a75eeba7bfe5 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -46,6 +46,7 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 		break;
 	default:
 		XE_WARN_ON("Not possible");
+		return -EINVAL;
 	}
 
 	return passed ? 0 : 1;
-- 
2.40.1

