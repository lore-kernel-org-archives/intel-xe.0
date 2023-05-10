Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE57EC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 13:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04E110E23D;
	Wed, 10 May 2023 13:00:37 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2790410E23D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683723636; x=1715259636;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5SgFIB85fr9+xbL/4PvzZbToZxBaSXJQOpPwa7TRAgw=;
 b=ecW963wtlG+1wSlM43DF/1pea79oEU7Bj6GXs9idjDJ5xgrO41ly119Y
 HPRZJbMQ8Llj7Rk6rszwsAX8BYgRakk1ncw7FrD5HdSqOh1gDrxsoStCe
 giYZgM++H9IFAV2YighRDGJouSHf7wMFcmYhvoMMB8cJmlKvAngl2qr0L
 e2EecAINEBlunxaomN7g9GGC0jN2snAcaCl77O+TCZtWmldsLbwyTLyPv
 CN+ynR3/uvZ5H+JxtJT88DxNZPxDcriuGMXoyShvxkS2arYvKZ4pR235Z
 vyKBf0HtXrw+tw/0bQThab6IiMqiyhMscG4OPHukezF/SgUJID0XJpxn7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353276628"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353276628"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 06:00:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788922883"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788922883"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 06:00:09 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:00:04 +0200
Message-Id: <20230510130004.28490-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Unlink display before turning off irq
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Unlinking display will lead to guc tlb inval timeout for
the fbdev vma as irqs are disabled.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 32cc83c43b2a..430bd6eb4053 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -349,9 +349,9 @@ void xe_device_remove(struct xe_device *xe)
 {
 	xe_device_remove_display(xe);
 
-	xe_irq_shutdown(xe);
-
 	xe_display_unlink(xe);
+
+	xe_irq_shutdown(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
-- 
2.39.0

