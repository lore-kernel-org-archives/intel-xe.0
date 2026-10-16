Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45775CCA464
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 10:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F6A10E219;
	Fri, 16 Oct 2026 10:33:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094FC1124D8;
 Fri, 16 Oct 2026 10:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792146801; x=1823682801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IGLi2s4B57jsORoIpOrJkutf6m7ByT90Urjly//0rxQ=;
 b=XsxhI3pzS010Xr0s8hUefIuPPmJJ8bTa9VxEMlbK8LHqBy3XehYyf8jg
 WE62zovlzyxUjYqfNk6G9c9VIhUxRwd19PoMvNLA17In3XaP2vjpYFD1E
 oJMZubjwv/1bEX6d+eudrJNcgpmVsjClHvMtzih03YwvphttWZiFibATy
 ps9N0QYoXrUv+ZjrglpL9oQBDE+OTck2/BWDWukLUffdeT3yys5ZYxeso
 2LHqmgLgAUQatoEEVfteRFFDbtYJlqeGv9sS2EgLaZDroaQPWzRSNzjPX
 KXs757u+MaStXzyEAfLGzlApWPAGhe3rW2bfBSyR8IKxWFctm9ze6749k g==;
X-CSE-ConnectionGUID: I9WCDDh6Th65bEIJaK5QkQ==
X-CSE-MsgGUID: NNjM9T9lT+yEVryxjFi3LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="930909"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="930909"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 03:33:20 -0700
X-CSE-ConnectionGUID: NkXLnaj4RRWNxf98eRj9UA==
X-CSE-MsgGUID: xOiq6lcyTRu9oletPWZkBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1872403"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 03:33:19 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, stable@vger.kernel.org
Subject: [PATCH 1/2] drm/i915/dsc: Fix QP table index calculation for bpp
 selection
Date: Fri, 16 Oct 2026 15:47:12 +0530
Message-ID: <20261016101713.230013-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261016101713.230013-1-ankit.k.nautiyal@intel.com>
References: <20261016101713.230013-1-ankit.k.nautiyal@intel.com>
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

Fix the typo in the QP index selection for a given bpp.

The QP table rows increment in steps of 0.5 bpp, meaning each integer
bpp step corresponds to 2 rows in the table. While refactoring the index
calculation to support fractional bpp, the multiplier of 2 was dropped
for the integer bpp portion.

Restore the missing factor of 2 in the integer part of the bpp calculation
to correctly align the QP selection with the table layout.

Fixes: 2df50cb46a4c ("drm/i915/dsc/mtl: Add support for fractional bpp")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 8f06c3a4d56d..7a573c2b6a7d 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -261,7 +261,7 @@ calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 		 * and so on.
 		 * 0.5 fractional part with 4 decimal precision becomes 5000
 		 */
-		bpp_i  = ((bpp - 6) + (fractional_bits < 5000 ? 0 : 1));
+		bpp_i  = (2 * (bpp - 6) + (fractional_bits < 5000 ? 0 : 1));
 
 		for (buf_i = 0; buf_i < DSC_NUM_BUF_RANGES; buf_i++) {
 			u8 range_bpg_offset;
-- 
2.50.1

