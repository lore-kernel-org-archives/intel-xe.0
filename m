Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29417CFD315
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 09:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC4310E3A0;
	Tue, 25 Nov 2025 09:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVlL2P+7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F7910E39D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 09:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764063843; x=1795599843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jy+5tcCV8/Z+Xcv7X4ZJeEDuZA5zc7s4LMT0zuREfko=;
 b=eVlL2P+7fo9N0zExXV5w+j9g5YCQPEHcE0/0id40WqC+Nw578fS34aGg
 V19YV0Nb0x2/UWIeWWKVzn4qrXL0q8+9qcIiIeHU1VAt29uWfI/SWx4vs
 hLS/7VBq3GSLcJ7OD4ZTLX3GR8vyJYxGMQSl2SzcZMJ8xW1BlwLNManiu
 OwRGrvW8ph+5QcQ9dvlKfj/y+pfEwd2NYREOqUXawRonbZtwT0fGP/YLr
 E1oBPj94og1f06GjK6CykOsJOzwhPvKgbywOfLvsJni29SIBrBjosIgD1
 D6VGaCqllBmDl7YtZQD0NRTa46LsTeAlbpcOAkwTf1nwUP+TobtgEuvmm g==;
X-CSE-ConnectionGUID: VhFU9LJbSg+9l+CC1QGShg==
X-CSE-MsgGUID: hb+PePBlTfmXoklWMGeoiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69934129"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="69934129"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:44:02 -0800
X-CSE-ConnectionGUID: 4odjZvH6T9SysmWNlJyZeA==
X-CSE-MsgGUID: /s+zqO0SR4mMqs6pcEubig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192405230"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk..)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:44:01 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 3/3] drm/xe/xe3p: Skip TD flush
Date: Tue, 25 Nov 2025 15:13:35 +0530
Message-Id: <20251125094335.12028-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125094335.12028-1-tejas.upadhyay@intel.com>
References: <20251125094335.12028-1-tejas.upadhyay@intel.com>
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
index 6e8335b493e8..6885cdbc7dfd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1121,6 +1121,14 @@ void xe_device_td_flush(struct xe_device *xe)
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
2.34.1

