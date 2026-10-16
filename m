Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796A5CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 10:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6EA112738;
	Fri, 16 Oct 2026 10:33:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C94112738;
 Fri, 16 Oct 2026 10:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792146803; x=1823682803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vgMRGinTVKXG6IOU4CMgaKMnih5VOb81PNh6S/yI/HY=;
 b=aCBjQiuXPRN7jaS/xSm+hFuslwc+9mDQk5eFTaglqcAvHa2uJ8Zn0oFY
 b68cJlUPBVUlKYplapKqITT2CCD9z5XvJl8tCbQ+mC2Moehh2BMFMOeZ5
 dUsh7bRnaCTvv1wIE/mWlVUxzsNQHK/Le8S5qaFLnjjW/EWUx73WwG8PH
 qRgnBOmFbEYu98qma+EO86oJDJbrvpvvlNT6MqJke9Ag0SY88Pixh+mMd
 dP9OLvl18C4CpLVBczPkmasNRnQZxoujrkN7Y7xJ3I8MI3yrR+SGXga+d
 mokGp6SNjMat4iKWCdr6VAb58Bncagc4ACi8SjMHIg2PCRk3T3M+wfLso g==;
X-CSE-ConnectionGUID: b2wprtyNTWyjod6ULZ2Ohw==
X-CSE-MsgGUID: Dc9q4WD2Rdyfb+iDInwpsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="930915"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="930915"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 03:33:22 -0700
X-CSE-ConnectionGUID: GZ3iBV0uRpa3w3LnCxkxYA==
X-CSE-MsgGUID: dYlR+GUhSFWYF12Z+91lGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1872417"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 03:33:21 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, stable@vger.kernel.org
Subject: [PATCH 2/2] drm/i915/dsc: Fix the helper range_bpg_offset()
Date: Fri, 16 Oct 2026 15:47:13 +0530
Message-ID: <20261016101713.230013-3-ankit.k.nautiyal@intel.com>
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

The commit
3abe2824e1af ("drm/i915/dsc: Use helper to calculate range_bpg_offset")
added the helper to compute range bpg offset. There was a mistake in the
divisor which caused the helper to interpolate the offset in the reverse
direction, causing visual corruption in some panels.

Correct the divisor in the helper.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9247
Fixes: 3abe2824e1af ("drm/i915/dsc: Use helper to calculate range_bpg_offset")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: <stable@vger.kernel.org> # v6.15+
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 7a573c2b6a7d..d70c59849c39 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -122,7 +122,7 @@ static int
 get_range_bpg_offset(int bpp_low, int offset_low, int bpp_high, int offset_high, int bpp)
 {
 	return offset_low + DIV_ROUND_UP((offset_high - offset_low) * (bpp - bpp_low),
-					 (bpp_low - bpp_high));
+					 (bpp_high - bpp_low));
 }
 
 /*
-- 
2.50.1

