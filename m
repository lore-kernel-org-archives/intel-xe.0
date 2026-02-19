Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45EEE9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 11:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F3B10E012;
	Thu, 19 Feb 2026 11:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DjxuZlab";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7B010E012
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 11:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771501106; x=1803037106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C3JBanHDQrgoMABX/i89ZTISPrUVP0EtyFhtkmVogsA=;
 b=DjxuZlabzPMZuZjm2vXCpykjFI4HGSaWQ4/NUUx2DxfzCfzenU5AiICx
 d2Y1hJ0DAWogHjiY/JDnx6ZgwNtYXlOdTz4mTlLXnPjvvZmUMi6is0kqd
 C1lyqL2qw43JvEmG2VAl9v4/Vt6I0AvzJZ/xIbp+dViUhoIukCy9U3zKC
 JmJTrDviQDv9zQl/ocsRU3eikfN/vEwdQJYCOxVXf5JimPtR/qucMsgiq
 8//5DnKfuFVeu32qYQZApvcqUVoQOcCJog0TR1p0OhLkcfjNicIYWl9TY
 3Yqx0PlngEuZX5gJgQEfWI/jU7WikTBjb9j4XVLl1RqSOkiDx6gOCbAaz Q==;
X-CSE-ConnectionGUID: qSgIZPReQ6+ZvV19KwiTsg==
X-CSE-MsgGUID: dMCo8tpyS0K1q3wVyqmwrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76199670"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76199670"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 03:38:26 -0800
X-CSE-ConnectionGUID: 77qWQ1hzTvmsygX/EUiNTw==
X-CSE-MsgGUID: xyTyMEJOSd2uYm8t2QJv9g==
X-ExtLoop1: 1
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 03:38:22 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 4/4] drm/xe/xe3p: Skip TD flush
Date: Thu, 19 Feb 2026 17:07:48 +0530
Message-ID: <20260219113743.1588081-10-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
References: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
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

