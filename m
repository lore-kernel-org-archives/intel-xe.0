Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500E6C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 02:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013CE10E5D3;
	Wed, 16 Sep 2026 02:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fM0mv2Mm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F186A10E29E;
 Wed, 16 Sep 2026 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789527452; x=1821063452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lRpYqCfjQWVCd9UhWuxjlLtKN7UJ7C9mmOIdNp3fAKY=;
 b=fM0mv2MmR/x2fp+LRkQaqqa3mOm0sIe7ZSUY59bWB7xE3YFeq6PQBoTB
 KbqOZ43woOd3/odQYZLnj0QHEa1u1TGj/7uNwlgc7t+dU20OkpPkJXzVK
 9CYeHhsSRtFUdjNhXrOk1F6iZHm2DnuS1KWgE3SBkqaHCNNIIc5nLflI1
 WnI/aaEi0hA/MJVOL/BMtEG4c2rW5n2Z/w22yKp+dob/cxJbAwmeEa7nJ
 6EdKtNR+1/Pua3YbXqPMjJflWtBK7ikzpHUpcsZ4hQiO7z1xbM/ZyovG9
 AdCGQL9bwBcauavmwih9K75P2cNe0K90ueoZa/DvYsi34f2yKJH5y8CJ2 Q==;
X-CSE-ConnectionGUID: mnoXEBGdR+O+KPaw7TKSeg==
X-CSE-MsgGUID: ayeqNi5qSIaQs4A+jSEpqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100498344"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100498344"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 19:57:32 -0700
X-CSE-ConnectionGUID: KdFj83BfTEqo69GQCelKuA==
X-CSE-MsgGUID: oI2WWS5oRjKp1oF+C0CX2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311473433"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 15 Sep 2026 19:57:31 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 10/10] drm/i915/dp: Bump the max Link M/N ratio to 22 for
 DISPLAY_VER >= 35
Date: Wed, 16 Sep 2026 08:27:10 +0530
Message-Id: <20260916025710.432281-11-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916025710.432281-1-suraj.kandpal@intel.com>
References: <20260916025710.432281-1-suraj.kandpal@intel.com>
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

Starting Xe3p max M/N ratio has been increased to 22.

Bspec: 68922
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9a3955c6697b..565063b2df30 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1269,6 +1269,9 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
 static int
 intel_dp_get_max_m_n_ratio(struct intel_display *display)
 {
+	if (DISPLAY_VER(display) >= 35)
+		return 22;
+
 	if (display->platform.dg2)
 		return 4;
 
-- 
2.34.1

