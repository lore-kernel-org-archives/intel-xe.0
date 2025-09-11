Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420D5CAC58D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 10:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E346710EA6E;
	Thu, 11 Sep 2025 10:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWPJE1Kz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0EC10EA6E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 10:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757584906; x=1789120906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yGL+vxJx/w1TmbqdqxZh2t46QUiSVnW24zkqsYC3dR8=;
 b=lWPJE1KzaCqdxEhivQ2pd1o4ctO35lf0sHWYgsfaeYHvVTGm/+ZWjfWR
 WJLVwsqN4v0mlvEy4v39jQSlgR7ioEQ5M17VDtxuzk6GattFJ7nAwqA4U
 hJkt3xvY7I8JreJSr3MzBHaKJ3qhU+uISKmCdhC1LM9Q1u2eyoPoTWEYf
 S2qsId8Cbz+lGxRJRdwyVNv3BO2xU31ptTp/AhMFHvS6SMJm+ir2X6t1n
 +6h8gXkoKjPfXnI4JcCBnAML/ICv353NpwMi86b5LaorCEYCWuCvDUX8w
 aMsHW0wfy7V2nM085Y4b2FGzrPPvx96ERFVBdQEaC7c7qgBVtPIATybxi Q==;
X-CSE-ConnectionGUID: jMjpCoN8Qmaz6pdPbJEVbA==
X-CSE-MsgGUID: sM8/Xc6wS1m9J5gTZaSIzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63545813"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="63545813"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 03:01:46 -0700
X-CSE-ConnectionGUID: 67RDBxxISqqKvM8oUNWb5w==
X-CSE-MsgGUID: zdLByTHeQP+82OXYHG747g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="173553954"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 03:01:44 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	varun.gupta@intel.com
Subject: [PATCH] drm/xe: Fix driver reference in FLR comment
Date: Thu, 11 Sep 2025 15:31:38 +0530
Message-ID: <20250911100138.783960-1-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fixes the comment about the driver-initiated FLR to refer to
the 'xe' driver instead of the old 'i915' driver.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7bba535b145..76076e3f1914 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -532,7 +532,7 @@ static bool xe_driver_flr_disabled(struct xe_device *xe)
  * re-init and saving/restoring (or re-populating) the wiped memory. Since we
  * perform the FLR as the very last action before releasing access to the HW
  * during the driver release flow, we don't attempt recovery at all, because
- * if/when a new instance of i915 is bound to the device it will do a full
+ * if/when a new instance of xe is bound to the device it will do a full
  * re-init anyway.
  */
 static void __xe_driver_flr(struct xe_device *xe)
-- 
2.43.0

