Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4911FD0625
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 06:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F9E10E344;
	Wed, 11 Mar 2026 06:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwftL13R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B40F10E327;
 Wed, 11 Mar 2026 06:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773210708; x=1804746708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W1WLDV1rxSAeMPFPGTnkfwedMLnQmncibcybtFbDM5c=;
 b=EwftL13RpPem6fBgb6Fy6Uajf+7HlfjT3CAMOpfeLzaeETOt0TYMeaYO
 QZDxS1vsBitfrWtuwffOVaJcqLC09riwkA7+ego7ODB9WTDGdBODjEkv3
 YijILvX+r2d/vpQVHDq9u9ALmaCyR3bR+KC0eiKzSc7cWnkwKkpoaHXeD
 Pvlju25wXa3b2qImnRL/dDS+GI1W4cAkkTzMHiPh8dfmxZRW4DMU5A+MM
 MtLFTclCTO+2bxm2Uo3K/0VcBocTEmUadv9EPl2xoqaGoHLQS+CFTD+eL
 IPncKIjmLLrkf8TnrLT8uKJ5ZkFJ8DpMSypsC7X+ZKaOU/8Cz7Mt9kGN/ Q==;
X-CSE-ConnectionGUID: K9JE3+DMSX24zrcjyp16JA==
X-CSE-MsgGUID: ud1ZXd0lRguRVSYpVSrqlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74312439"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74312439"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:31:48 -0700
X-CSE-ConnectionGUID: UrtWPh7ARVaPVU/eldKWoA==
X-CSE-MsgGUID: 0YXcedaNSLqMhrOuxzK9Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="217061184"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:31:46 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH 1/2] drm/i915/dmc: Remove invalid PIPEDMC interrupt bits
Date: Wed, 11 Mar 2026 12:02:58 +0530
Message-ID: <20260311063259.2608206-2-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311063259.2608206-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260311063259.2608206-1-dibin.moolakadan.subrahmanian@intel.com>
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

On display version 35+ PIPEDMC_ATS_FAULT and
PIPEDMC_GTT_FAULT interrupt bits are no longer defined.

Update the interrupt mask to drop these.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index c3b411259a0c..38b284a0db82 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -509,6 +509,9 @@ static void pipedmc_clock_gating_wa(struct intel_display *display, bool enable)
 
 static u32 pipedmc_interrupt_mask(struct intel_display *display)
 {
+	if (DISPLAY_VER(display) >= 35)
+		return PIPEDMC_FLIPQ_PROG_DONE;
+
 	/*
 	 * FIXME PIPEDMC_ERROR not enabled for now due to LNL pipe B
 	 * triggering it during the first DC state transition. Figure
-- 
2.43.0

