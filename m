Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70100C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 12:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E45E10E06E;
	Mon, 18 Sep 2023 12:08:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CBC10E06E
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695038891; x=1726574891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z0GJG1BK40gnoVm9McUmJfHlrdJHs0g0ohQYtwV4LQ0=;
 b=KTyuM6MViljSCW7gO9p3P6at1jZSBhUcvu/PSlAq92MLGjOBnJZA8xxP
 h/sfhA0zppri7C3miK8HulT4LLkxf1AYCtFkjGLTsBfFvRtqVohATlI+U
 x2+IsV8RlptVUl4b7SBuCmcC52ajb8DeY5fFruY06RhhiUDocWokIfWHD
 P9jeDafNTrSl/YtF3w/vKBy1VbPnQY0JYt9VeMgk04DrPVf368gP/Rh5r
 IBF5tAHu/W4eHK+gPYedi6rrhfvX4Akn/jZ0cWxr5AVTXNV/v731gkWwk
 XNQWEBrqbLrdPanM3FjwzZzxx5fg+NyQlObCvOC7iuID/WVG1DV1QVrYt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="359887488"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="359887488"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 05:08:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="835992512"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="835992512"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2023 05:08:09 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 17:32:29 +0530
Message-Id: <20230918120229.338270-4-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
References: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 3/3] drm/i915/dmc: Use common wrapper to get step
 name
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

Use wrapper common for both xe and i915 to get the display step name.

This patch partially reverts the changes made in

commit 8c4154824537 ("FIXME: drm/i915/dmc: xe way of getting at stepping")

TODO: Find cleaner solution for rest(not stepping related) of the Fixme
      patch

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 51e0463518fb..6b9880fe3036 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -321,11 +321,8 @@ static const struct stepping_info *
 intel_get_stepping_info(struct drm_i915_private *i915,
 			struct stepping_info *si)
 {
-#ifdef I915
-	const char *step_name = intel_step_name(RUNTIME_INFO(i915)->step.display_step);
-#else
-	const char *step_name = xe_step_name(i915->info.step.display);
-#endif
+	const char *step_name = intel_get_step_name(i915);
+
 	si->stepping = step_name[0];
 	si->substepping = step_name[1];
 	return si;
-- 
2.25.1

