Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CFBC9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951E610E911;
	Mon, 28 Sep 2026 09:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTXbNYLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C38110E840
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790587450; x=1822123450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zIkglW8bGWvR4XX/ytHEqiEWDeDzwiio8dxqvp2BmRs=;
 b=LTXbNYLnOoXrZD9AGy4knJ3gg0uriqW1AutblXC5NZKI9gjev6owFI/W
 aO3pvuLu5kLozJcEMKKRxuzq+cpiwESKeQuJITFLIkyOetM7HBT2jfZ1c
 l/1d8lS3mSAb2ac2U7YsMymMhdtKzPirk3AZpT1PRPoZrv3EwCOaAH0IA
 iXO2ZfJg15xmcuqCa0evPXsevCFypLlMMkd57+1SKvoxd4g+NlUK89G5b
 UFzDzeifd+XwUHV/1dWYmGdaW+1tfSBLmyi8TLC3VXVAEaWP72TI0zWVM
 7QVAvcIkrM7Toisb3F+1hMQZgsiPF+hECYvHmJPQexZKxaxXteulIw7tP A==;
X-CSE-ConnectionGUID: M8X6HZY/SN+xvtW1meZ7gg==
X-CSE-MsgGUID: +YXijUbAQWqvp4Z9gIipAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78845493"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78845493"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:22:20 -0700
X-CSE-ConnectionGUID: n1TyW+f4TfqKTAccFN2+bg==
X-CSE-MsgGUID: NiDwwhITSCGJL23/Md+c+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="283078049"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 02:21:30 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v4 09/12] drm/xe/pci: Report unknown GMDID versions using
 structured xe_log API
Date: Mon, 28 Sep 2026 14:51:11 +0530
Message-ID: <20260928092114.1610203-10-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
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

Replace drm_err() with xe_log_err() using the REGS component tag when
hardware reports unrecognized graphics or media IP versions during
GMDID handling.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 620f8a75086f..9089ded5fa44 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -719,8 +719,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*graphics_ip = find_graphics_ip(ver);
 	if (!*graphics_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_log_err(xe, REGS, -EINVAL,
+			   "Hardware reports unknown graphics version %u.%02u\n",
+			   ver / 100, ver % 100);
 	}
 
 	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
@@ -733,8 +734,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*media_ip = find_media_ip(ver);
 	if (!*media_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_log_err(xe, REGS, -EINVAL,
+			   "Hardware reports unknown media version %u.%02u\n",
+			   ver / 100, ver % 100);
 	}
 
 	return 0;
-- 
2.54.0

