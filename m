Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2427C79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDDC10F1FF;
	Wed,  9 Sep 2026 16:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LbyZ5A7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B20210F1FF;
 Wed,  9 Sep 2026 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970663; x=1820506663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DsU4ydw5T0P+ZrcdmnOpqTmfy3uZJv7vR7jkpFSjrLU=;
 b=LbyZ5A7qSPo7ho3Fv2CGaT5SgZWxYoNJcotvb8D9PI0bYFId80unm7uN
 81MJeC/hgVRM5Vjc9sU1UPxp8caFQIqcXQaW5oCjiQbP1avrViXY/xWMj
 HKgWlatCM8Y4/C0Yi32AVayQMOf9jCGhakFZ2BlCTM+zM6TgUebBHG6i4
 4NHrH/32C5KSSq031hugIFZ85JeUsJrYjwaje8rrsPDk8Ep6VjC+pXqUg
 TaVgOpe3UGbP7YCzf1p9axB1jwsXYqxFtEG3hk0EEwcjX0YhMIausE+Fn
 ewqC9pqP7yPp55rUqi4zfjUXy4B9JdL5w58oiYi2mONFnOYAqttgbUeVZ A==;
X-CSE-ConnectionGUID: F9NM7nnRTIKdZgwOmh6GzQ==
X-CSE-MsgGUID: SCbplNddQNC6IyIYssBAdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100064549"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100064549"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:43 -0700
X-CSE-ConnectionGUID: Ymv4BgmUSHqD0qHGplM7VA==
X-CSE-MsgGUID: 837GCRK3Qra/xwTqn3p4tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275503151"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:43 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 02/13] drm/i915: Check use_flipq in
 intel_crtc_needs_vblank_work()
Date: Wed,  9 Sep 2026 19:17:19 +0300
Message-ID: <20260909161730.12969-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Check use_flipq in addition to use_dsb in
intel_crtc_needs_vblank_work(). Currently this is never the case
as we only use the vblank work for LUT updates, but we never
take the flipq path when a LUT update is needed. The plan is to
replace use_flipq/dsb with a single enum, so checking both will
make that change clearer.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 10ed9bdfee76..c7a85dce6aca 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -497,6 +497,7 @@ static bool intel_crtc_needs_vblank_work(const struct intel_crtc_state *crtc_sta
 		(intel_crtc_needs_color_update(crtc_state) &&
 		 !HAS_DOUBLE_BUFFERED_LUT(display)) &&
 		!intel_color_uses_dsb(crtc_state) &&
+		!crtc_state->use_flipq &&
 		!crtc_state->use_dsb;
 }
 
-- 
2.54.0

