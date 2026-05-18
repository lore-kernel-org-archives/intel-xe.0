Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B745CD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 16:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748F410E917;
	Mon, 18 May 2026 16:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZw7RG4v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AA010E90C;
 Mon, 18 May 2026 16:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779120886; x=1810656886;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=FpBnuakKpWiTL44UB0Fn2I7l4dZ+dDhNtpl0X8/qOjY=;
 b=bZw7RG4vM8uw6bBHsTwVBgzWrg71WPJHirr0bBX4FfnXiH1qwif8MvYL
 6tCPeB5JMIYwG6oR2AJ6SAG0OqiBdzH4aEddaJCy0sbbUMIL4+jR7wivy
 gMp1a6zB3ChYABJPderueipD0z91YdijM3AoZq24/5H0wf5oa8kzTrFUm
 DqYQs+WDjN4SQtuW5vxikUd4OCHrj/hUXizcRbEUjO4mcxzO5o4zJ8l4D
 go3MTAx75ub1iUKBCtXOssG4u1pFOE9ttA0ELvmRBwp9Bc1hKvfCn0NNS
 Myz8V/+236yyMnwd/888mX6gpFaUwEFAOcdbazHXmaVimJI9kdX1+/UeF g==;
X-CSE-ConnectionGUID: A2GrKFZoRD6i8mxzZUUr8g==
X-CSE-MsgGUID: Y0vw8WI4TQC7NywJdUu3Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91370626"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="91370626"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 09:14:46 -0700
X-CSE-ConnectionGUID: u5r6DI9qQA6cLVz1e4phMQ==
X-CSE-MsgGUID: dAZAFoCkTs+W1ZpeUIRQRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235219036"
Received: from aherrold-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 09:14:41 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 18 May 2026 13:14:00 -0300
Subject: [PATCH v4 1/5] drm/i915/bw: Don't call intel_dram_info() too early
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-separate-platform-from-diplay-ip-specific-bw-params-v4-1-918528006549@intel.com>
References: <20260518-separate-platform-from-diplay-ip-specific-bw-params-v4-0-918528006549@intel.com>
In-Reply-To: <20260518-separate-platform-from-diplay-ip-specific-bw-params-v4-0-918528006549@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.15-dev
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

If we end-up bailing early from intel_bw_init_hw() due to
!HAS_DISPLAY(display), the call to intel_dram_info() to initialize
dram_info will be meaningless.  Move the call to be done after that
check.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 9c3a9bbb49f6..7eef693b51ad 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -791,11 +791,13 @@ static unsigned int icl_qgv_bw(struct intel_display *display,
 
 void intel_bw_init_hw(struct intel_display *display)
 {
-	const struct dram_info *dram_info = intel_dram_info(display);
+	const struct dram_info *dram_info;
 
 	if (!HAS_DISPLAY(display))
 		return;
 
+	dram_info = intel_dram_info(display);
+
 	/*
 	 * Starting with Xe3p_LPD, the hardware tells us whether memory has ECC
 	 * enabled that would impact display bandwidth.  However, so far there

-- 
2.53.0

