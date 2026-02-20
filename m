Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05154C531FF
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 10:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DF710E7E8;
	Fri, 20 Feb 2026 10:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKzXre+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702FC10E7DD
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771582620; x=1803118620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C3JBanHDQrgoMABX/i89ZTISPrUVP0EtyFhtkmVogsA=;
 b=QKzXre+zWmyCxzT5CCeE+/p18d8QTYfIsY8t/ZBvrJyP9d3CFsINv/ZO
 bYLfydD11xWHn+mhZ0NHF7b6gWgRx6DfbtnYPYc8YQZ9hyuywmyoyIbWB
 5nl06UlIUORwAOgd4wCDkl9S5KwhDcXIp3hSPWrLXzabzLKj3zHou7WIr
 AiVj5wGu1S5Wkge0NbDPmjCcUztqh9Xlz+40iF3CeLxQ5o7u4ToWQes5h
 7oYroAOBHSp8RzejfC6LxFdo0Z9FKrpd4gpg6pm2o7y3oNL3aA0g3vKjI
 tGjvM2zPPzcWD0o6buVGtAnfjm2skH/NqOwUwQ2UYW1M/nrXwZdo9DNfw Q==;
X-CSE-ConnectionGUID: FlYD/Ey+RuGGBDaaKm70Pw==
X-CSE-MsgGUID: TY4Gp6tARdSIkh7j0yOBuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72579911"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72579911"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:16:59 -0800
X-CSE-ConnectionGUID: prF+9JLHQ2Kf5AUrUoaAQQ==
X-CSE-MsgGUID: axU+HiQ3S/up/jD2tclPmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214666675"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:16:58 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V3 4/4] drm/xe/xe3p: Skip TD flush
Date: Fri, 20 Feb 2026 15:46:43 +0530
Message-ID: <20260220101638.1609775-10-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220101638.1609775-6-tejas.upadhyay@intel.com>
References: <20260220101638.1609775-6-tejas.upadhyay@intel.com>
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

