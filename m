Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD824C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7006810EB10;
	Tue,  8 Sep 2026 10:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+TAKfO7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E22F10EB10
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862746; x=1820398746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kk8UCA9a3A0HFQY2UDB1MsojooNBkt4IbbHa1o8ZMVM=;
 b=S+TAKfO70mHcd3dEZzXunxstMhmYByIyFz+UhUcL3PaoieTQ7/LoKIuc
 gx5CPrSswG9/gazD1T/DqgQtgn+G+zeKaUnd0LFLBLSOnctrt6jEyEOfy
 +0WhlLBipFMnOfIZmB2ykt8htDjpJva76wofH2YFqtMd+lLsaNMJ8/CRM
 HzKUh4CNNDWhK+4eM4je4Qwi2cf1A95zuilqCFjyWxqGFK7zlDZx9OtEr
 3heUYTEhP8e3twJFNx90Aa0v6e7e9tE+CnH19i27/ftDw8lpzW8Bwbcjf
 HBJOHoIugwHZxkwmkEDQNDC+eg+Vpl7QqHPct6Ro/zWiF2MTR50ksX+Yu w==;
X-CSE-ConnectionGUID: MQVMItFuRYi9nd2gKv79UQ==
X-CSE-MsgGUID: QFNalPkBTZqUkxjF84ieOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278280"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89278280"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:19:06 -0700
X-CSE-ConnectionGUID: U/WAeDkMQRu8ct0gcAFCLQ==
X-CSE-MsgGUID: 3KDMv0WCReKxedzj15xNLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269628469"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 03:19:05 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 10/13] drm/xe/pci: Report unknown GMDID versions using
 structured xe_log API
Date: Tue,  8 Sep 2026 15:48:46 +0530
Message-ID: <20260908101849.1219614-11-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
References: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
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

Replace drm_err() with xe_log_err() using the GT component tag when
hardware reports unrecognized graphics or media IP versions during
GMDID handling.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1e04e8ef2611..249001ef77b1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -718,8 +718,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*graphics_ip = find_graphics_ip(ver);
 	if (!*graphics_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_log_err(xe, REGS, -EINVAL,
+			   "Hardware reports unknown graphics version %u.%02u\n",
+			   ver / 100, ver % 100);
 	}
 
 	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
@@ -732,8 +733,9 @@ static int handle_gmdid(struct xe_device *xe,
 
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

