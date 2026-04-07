Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0B8EDB7EF
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 10:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFBB10E3BD;
	Tue,  7 Apr 2026 10:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CY8UDsXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A5910E3BD;
 Tue,  7 Apr 2026 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775559009; x=1807095009;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZDeHdO9DuGjYtoaEefvd1zEz1BAvHPf5VqZY0OdzeyU=;
 b=CY8UDsXLoCfneHTJ39dx2pQiszl931Z0cJdoc7KZRP7JBxx43K9Fn0RY
 750ZKTyoKdFDsjOYOCAsIAQcPb3kkd/4VwON6/gbGll+ON4l7gHwhpdcq
 x2Jufkvf2fbfNY2UA1I3sFC3mkorkTLK7spcYlEILbBxmzeUDIZB2yP/q
 r3viLVWsQZlNLaFdJxGfIgK5O2zFo46RGtZvfdOTewhL8PN1QeN0ww7fU
 sd++4RiVbH0Du20xsjgU67KkWb7Oo6Tmx0l60kCZKTPhQEis6q+4E9/l7
 famWHTk9Wbga3vXc3GyXE4l4DM59MBGhL3e27PrdR5xCaWsEsGOgArL/c Q==;
X-CSE-ConnectionGUID: 810gq2+TTBOfmgP0U1KzRg==
X-CSE-MsgGUID: ph7Gxrs4RvKCMIhlh3j47A==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="99145271"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="99145271"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:50:08 -0700
X-CSE-ConnectionGUID: q4MzTlohT5mjYH1JtwQn4g==
X-CSE-MsgGUID: N3m8umZKRDiZ4KG0BtPrvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="233107772"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:50:06 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, uma.shankar@intel.com, luciano.coelho@intel.com,
 imre.deak@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v2] drm/i915/dmc: Reduce wakelock hold time
Date: Tue,  7 Apr 2026 16:21:02 +0530
Message-ID: <20260407105102.3730973-1-dibin.moolakadan.subrahmanian@intel.com>
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

__intel_dmc_wl_release() schedules delayed work which releases the DMC
wakelock after a fixed timeout of 50 ms. Until the delayed work runs,
the wakelock remains held and prevents entry into deeper DC states.

Reduce DMC_WAKELOCK_HOLD_TIME from 50 ms to 5 ms.
This should allow the system to enter deeper DC states sooner once MMIO
activity settles down.

Changes in v2:
- Drop detailed explanation from commit message
  and keep it concise (Suraj Kandpal, Luca Coelho)

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
---

Notes:
    RFC: https://patchwork.freedesktop.org/patch/711634/

 drivers/gpu/drm/i915/display/intel_dmc_wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
index 73a3101514f3..ddf1a1f1ebc3 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
@@ -46,7 +46,7 @@
  * atomic variant of waiting MMIO.
  */
 #define DMC_WAKELOCK_CTL_TIMEOUT_US 5000
-#define DMC_WAKELOCK_HOLD_TIME 50
+#define DMC_WAKELOCK_HOLD_TIME 5
 
 /*
  * Possible non-negative values for the enable_dmc_wl param.
-- 
2.43.0

