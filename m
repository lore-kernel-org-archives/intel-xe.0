Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5CFE9B250
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 11:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E211410E56A;
	Tue, 24 Feb 2026 11:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0QTRdPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931EA10E569
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771932754; x=1803468754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C3JBanHDQrgoMABX/i89ZTISPrUVP0EtyFhtkmVogsA=;
 b=B0QTRdPwhG33kUAzXQo8fPTUwHSbuaD/1iIrzJWkBIdW3++ObBtCDeea
 kLaG85ZMJSG6dZi5fZYEAClVf04lSebVPn222vHpy6fBaHWhliMIj4OR/
 F5mqeGDvtocIvSlgzrA853tNxpIBjEgT/TvF2PmltlxXDoakSWbkFEU7y
 W1tIXwfPIIbLPKntnagHY+CeOHzSCpmMZ4HLEyNg6jWx7osNTn9aE1Be0
 WsfWkMxUOG/KlqR9df6q1c9JbyPDgdh9g5ebzsZ73Ai80XeNIYpMYOqfp
 WgGypIXZ+hRdifOiUGNeuBd7WI+nt6qsyW4iIFU9jmqfFzoa2ubVz2V6Q w==;
X-CSE-ConnectionGUID: 4tBo+GwDQZSiOQHbiwQOMQ==
X-CSE-MsgGUID: 75pBXJwIQmC1E4dg1CGBAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72918101"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72918101"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 03:32:34 -0800
X-CSE-ConnectionGUID: dHry3Yw5QMShkIXlis2GwQ==
X-CSE-MsgGUID: NRd+t4vvSzK12DF+9y3+5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="219972525"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 03:32:32 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V4 4/4] drm/xe/xe3p: Skip TD flush
Date: Tue, 24 Feb 2026 17:01:52 +0530
Message-ID: <20260224113147.1656939-10-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224113147.1656939-6-tejas.upadhyay@intel.com>
References: <20260224113147.1656939-6-tejas.upadhyay@intel.com>
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

