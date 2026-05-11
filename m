Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CDBCD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0821410E71F;
	Mon, 11 May 2026 12:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDLP5NrR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9318110E712;
 Mon, 11 May 2026 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778503616; x=1810039616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YAv02i2hzqMnDJNnEXZyyeDT3XrnR1LGoe46MJCK1c8=;
 b=GDLP5NrRCu8zLufJViHZskkhTU9Grd3yZ8BYB2eqKUir+YFG6frVrjHj
 A2OoDnr7VkkZrZb8N+YhnQP/NhwvJfvL4rR36DjgFTuORz9PRaU/amJgT
 ey0fdtoj5KFmOrUJVLASS+suQEKUxM2dqdRHINSpRp3+MIEl9NLd7Rmdi
 6M3Kyj/On19RVvWIaoigGBwjEH/lj0Sjcdxxe/kuVI5IdVxjXcfJguc7U
 cGH0hxGX7g9enJIh2iXT1Qwzcr3mjy1d9vxa/2SP623SMiP0G4l3F+Yrd
 tOmjj4oRaiI95a5i5pad8TqopfXFi7c+SWtFerEuLXbT0/gmAVEykT1ic w==;
X-CSE-ConnectionGUID: FB1NRoK1Rc+U5ee+L8GouA==
X-CSE-MsgGUID: MC+ABSeRRwaWWhEsGnzlgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90764829"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90764829"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:46:56 -0700
X-CSE-ConnectionGUID: 29jwRrNyT6GSi2oFCxK//Q==
X-CSE-MsgGUID: LLgHF9yGQ/+Tzs78mdG/PA==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:46:54 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 3/4] drm/i915/dp: Set sdp_type in AS SDP unpack
Date: Mon, 11 May 2026 18:02:17 +0530
Message-ID: <20260511123218.1589830-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260511123218.1589830-1-ankit.k.nautiyal@intel.com>
References: <20260511123218.1589830-1-ankit.k.nautiyal@intel.com>
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

Add sdp_type in AS SDP unpack. Since the field sdp_type is not compared
in intel_compare_dp_as_sdp() it doesn't throw up any mismatch error yet.

In the subsequent change this field will be added along with other missing
fields for comparison.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fa3b0a1b6bc1..52ee17e9f210 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5366,6 +5366,7 @@ int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
 	if ((sdp->sdp_header.HB3 & 0x3F) != 9)
 		return -EINVAL;
 
+	as_sdp->sdp_type = sdp->sdp_header.HB1;
 	as_sdp->length = sdp->sdp_header.HB3 & DP_AS_SDP_LENGTH_MASK;
 	as_sdp->revision = sdp->sdp_header.HB2;
 	as_sdp->mode = sdp->db[0] & DP_AS_SDP_OPERATION_MODE_MASK;
-- 
2.45.2

