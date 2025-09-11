Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C06ACAC58D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 11:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF7110E0E8;
	Thu, 11 Sep 2025 11:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnV9g7Ve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B0910E0E8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757589441; x=1789125441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pu2oW17JggxoVqvU1oMm/NhJZb8nm3TpoX7Fuw6DvHY=;
 b=hnV9g7Vehmfk0ZvvJzqSTKlms2rjQr5UfJxLziJV/tS9jFowlVBlzYg/
 gFMGPy8WcovO8K52Mx7d0avareLy8fF2bAlQnajZAq/vp+OwTk/3AU8HW
 /RM7rBCS+znCkVfYCKaTuVPjvMd1SikGp0gA3lj0Qeq/r/7treGb99AFr
 oIidcERkA9xipsVKHslbw4Z1g1pan0/RJxqGePATOCSOt0Sxwbw9q69Au
 ep2qkn2JJw5b5cE+a3AV1D32+n9CpsXEeYCcZk+941pet6Y9ZK+5jVB21
 bQacUG8YRSC/Euj1cKEJDG5FL12IFpqeX2s+NE4CYveQiblXPbNxB9Ygh Q==;
X-CSE-ConnectionGUID: LrNiRA5xRjiUdphWSecaHQ==
X-CSE-MsgGUID: HkdmFDubTk+F2NMxn9B9Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70172957"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="70172957"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:17:21 -0700
X-CSE-ConnectionGUID: DKs/cs98ThWc/WATTUZfwg==
X-CSE-MsgGUID: LnWXK4V+S1iYfhI2Oi+ByQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178858342"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:17:18 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	varun.gupta@intel.com
Subject: [PATCH v3] drm/xe: Fix driver reference in FLR comment
Date: Thu, 11 Sep 2025 16:47:12 +0530
Message-ID: <20250911111712.811524-1-varun.gupta@intel.com>
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

Rectify the reference of i915 to Xe in a comment.

v2: Cosmetic changes. (Karthik)
v3: Rephrased the commit message. (Karthik)

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7bba535b145..a4d12ee7d575 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -532,7 +532,7 @@ static bool xe_driver_flr_disabled(struct xe_device *xe)
  * re-init and saving/restoring (or re-populating) the wiped memory. Since we
  * perform the FLR as the very last action before releasing access to the HW
  * during the driver release flow, we don't attempt recovery at all, because
- * if/when a new instance of i915 is bound to the device it will do a full
+ * if/when a new instance of Xe is bound to the device it will do a full
  * re-init anyway.
  */
 static void __xe_driver_flr(struct xe_device *xe)
-- 
2.43.0

