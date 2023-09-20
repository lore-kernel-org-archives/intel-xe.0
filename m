Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E78CE79AC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 07:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC80110E163;
	Wed, 20 Sep 2023 07:22:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5740810E161
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695194527; x=1726730527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z0GJG1BK40gnoVm9McUmJfHlrdJHs0g0ohQYtwV4LQ0=;
 b=m4Xe1BT8F3KmlL39JpbmM/ORANo8Hbb26hdc6Xo+6iBqcLhFkf44WGFD
 dGJYMfimpxO6Btti7I5tKYDh19t1Wzxpej/RfRfT4OO60h2jJoG+X/3bc
 r1j8XKQieVKlPDWdZsZXKYeQe/GwVOybYYJw1fcQiFrRj6PpOMnETQlP9
 Mog0VqTSf4Mkzw0e3HaeVENxQNrHn2tJyWVbyYIiw9CbEGEj+Rt1+9xXd
 BO7Uv32q5LayDYDftkDsLyELGT2SFO3J+rM6U8R9TUvloPu19FzJopSia
 CzpsXu+K0aGtInj5WQ7rKsqwX5Q9bqGNS0+7OzrG2Fl2gSUqEpre3PcbR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383994077"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="383994077"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 00:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870264430"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="870264430"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orsmga004.jf.intel.com with ESMTP; 20 Sep 2023 00:22:05 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 12:47:00 +0530
Message-Id: <20230920071700.434195-4-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230920071700.434195-1-chaitanya.kumar.borah@intel.com>
References: <20230920071700.434195-1-chaitanya.kumar.borah@intel.com>
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

