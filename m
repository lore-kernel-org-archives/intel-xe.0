Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED11CE67A6E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 06:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DFB10E641;
	Tue,  3 Mar 2026 06:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZt5PXgL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD3B10E641
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 06:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772519104; x=1804055104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C3JBanHDQrgoMABX/i89ZTISPrUVP0EtyFhtkmVogsA=;
 b=jZt5PXgLAS5x686HGB7FNkgi4U46tcxekY+YiYQroiUVUeMh92eJukcZ
 WfhFHaEG0xv94QJp+kqQnxFxeO4IZNeHmb5nh16ARfHy3I/6k3+6JRhGn
 kt3UKccMYKjreG3/abPJo20f24rDGOWgrJk0qnp/veqgwQW2bNvgV1V7o
 icy6I6J7I6GX2x0ZpqTz06J6R9NAHlhO0EypsxEivoyU9eeFxaZoUlAOw
 wsrh49UFAakDhsQDzFNG52HUCtaJzh2yOAOI0AFtnTBdUuAfpWewddtR3
 msud15F5KItNircr/E8KIOl7VanN+PXuqxi3qa77qym7MN+HO7NXJUKOL w==;
X-CSE-ConnectionGUID: kQUcBJIKRx+YRv4+rMw/Og==
X-CSE-MsgGUID: wQOUmGp3RWahAHLTfIRQDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="85008906"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="85008906"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:25:04 -0800
X-CSE-ConnectionGUID: nV6eshZfQqyPqw7wKENT1A==
X-CSE-MsgGUID: R19yuA3SRFysAakcnnOCuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222383754"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:25:00 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 carl.zhang@intel.com, jose.souza@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V5 4/4] drm/xe/xe3p: Skip TD flush
Date: Tue,  3 Mar 2026 11:54:46 +0530
Message-ID: <20260303062441.1860959-10-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260303062441.1860959-6-tejas.upadhyay@intel.com>
References: <20260303062441.1860959-6-tejas.upadhyay@intel.com>
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

Xe3p has HW ability to do transient display flush so the xe driver can
enable this HW feature by default and skip the software TD flush.

Bspec: 60002
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 94c9f17da4b4..0dca20133b94 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1166,6 +1166,14 @@ void xe_device_td_flush(struct xe_device *xe)
 {
 	struct xe_gt *root_gt;
 
+	/*
+	 * From Xe3p onward the HW takes care of flush of TD entries also along
+	 * with flushing XA entries, which will be at the usual sync points,
+	 * like at the end of submission, so no manual flush is needed here.
+	 */
+	if (GRAPHICS_VER(xe) >= 35)
+		return;
+
 	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
 		return;
 
-- 
2.52.0

