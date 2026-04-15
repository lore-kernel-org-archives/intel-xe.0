Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0145F433D5
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 23:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F0910E7F0;
	Wed, 15 Apr 2026 23:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rrcuo1Ir";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94F210E7ED;
 Wed, 15 Apr 2026 23:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776296853; x=1807832853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WJAZyiVn11byEVWi8k1HVBUo8BZFydRALCAXuTi/2VQ=;
 b=Rrcuo1IrjCK7njglL6Y94+CyV5FxJPYB7C54OHTHZI1BunGmmjILkLkr
 CbywPTzICrZC2hawMge1Q3T9sWiEPgLoFLNPc75xTUGYQvzrxcjmzSY0G
 jtlDnH/P4QbxyCLp5IBl0KgxD+uJmLdjU+rbZGvjvZhFCePqgUV2RwPS8
 UFZo/LmQajjUdkPhJ1TfdVCwUnuOS4QQQiuIIz/wZrQ0mmiButbN/jdIj
 /nLswZRjuz3zwHGp7mQU74aFs6Yr/gb4iTzeN/akZ2IuKaB3/jnkFINX9
 n4NN9bKAse1UHH7oGoMrHToLcM5MYLNwxCP5GPZTKjxKz031dMHCgn0EU A==;
X-CSE-ConnectionGUID: PjnArxovT7+AtClfmaBY+Q==
X-CSE-MsgGUID: OJ6IY8FYQ1+ujd/c92P24g==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77403529"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77403529"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 16:47:33 -0700
X-CSE-ConnectionGUID: KkjxcDplRhaviiTGnzhtLA==
X-CSE-MsgGUID: /1ryUlh3TRmrztbgT+Y6Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235511257"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 15 Apr 2026 16:47:32 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 30/32] drm/i915/bios: parse JSL's VS/PE-O tables
Date: Thu, 16 Apr 2026 01:46:37 +0200
Message-ID: <20260415234639.3577774-31-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260415234639.3577774-1-michal.grzelak@intel.com>
References: <20260415234639.3577774-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

JSL's VS/PE-O tables' layout is identical to EHL's. Parse it same way.

Add JSL to workaround for availability of VS/PE-O parsing.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index e8fc826f361b6..79eccd21bbfb0 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2289,7 +2289,8 @@ parse_vswing_preemph_override(struct intel_display *display)
 	} else if (DISPLAY_VER(display) >= 14) {
 		parse_vswing_preemph_snps(bufs_mtrx, block);
 	} else if (DISPLAY_VER(display) == 11) {
-		if (display->platform.elkhartlake) {
+		if (display->platform.elkhartlake ||
+		    display->platform.jasperlake) {
 			parse_vswing_preemph_icl(bufs_mtrx, block);
 		} else {
 			drm_dbg_kms(display->drm, "VS/PE-O parsing not yet supported\n");
@@ -2759,7 +2760,8 @@ static void override_vswing_preemph(struct intel_bios_encoder_data *devdata)
 	} else if (DISPLAY_VER(display) >= 14) {
 		parseable = true;
 	} else if (DISPLAY_VER(display) == 11) {
-		if (display->platform.elkhartlake) {
+		if (display->platform.elkhartlake ||
+		    display->platform.jasperlake) {
 			parseable = true;
 		}
 	}
-- 
2.45.2

