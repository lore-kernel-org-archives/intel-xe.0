Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D4BCA1009
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 18:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE5F10E1B6;
	Wed,  3 Sep 2025 18:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7GjlAAo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505B210E1B6
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 18:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756923469; x=1788459469;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/OtHMPf6jC4MynLQnLIBiv+1IcDOBHLb5TlNMDCJuEE=;
 b=d7GjlAAo+BWxs9X7hoIGXB7khxQpEcP1Tni6oKCSftGW4dyVHkjxoqi2
 dQNK2YLnR0l57kPKnF3TOcoUZHGEripDPhKldvS2rEW+kUREaBttoYiEf
 uKTc7UgApd+iYcyC/Jtljg72uH47yjifHF6ynLCmkv+gmiWlbfVP/vwdO
 Up8lEviTlweZZSDZjBiA9D3w2RxmttG1cVoxw4sr+r06ouyLJe/spcrx7
 PaKmu47WQDzmOBQ8soCesKZi1X88m4nadFcRCmlbQdGfCHen+4ikfwug8
 W76a4G98uf7fUaSmT/mFCf9S6H0kGMvdFghfCh5d82jINEkKyNX7IVnCA A==;
X-CSE-ConnectionGUID: 2gX68PIESU63q290qXxEyg==
X-CSE-MsgGUID: K4KWyeY4SRCYfskKyOOrxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59105658"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="59105658"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 11:17:49 -0700
X-CSE-ConnectionGUID: Ee4RDwwgSjaAIFBISEE4cA==
X-CSE-MsgGUID: 0JWY8H8ZR7aeFRHwCoMmCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="172105688"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 11:17:48 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Expand workaround 13011645652 to PTL, WCL
Date: Wed,  3 Sep 2025 11:15:53 -0700
Message-ID: <20250903181552.1021977-2-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Expand workaround to additional graphics architectures.

Fixes: f336d7b274b9 ("drm/xe: Expand workaround 13011645652 to PTL, WCL")
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index e990f20eccfe..710f4423726c 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -30,7 +30,8 @@
 16022287689	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
-		GRAPHICS_VERSION(3001)
+		GRAPHICS_VERSION_RANGE(3000, 3001)
+		GRAPHICS_VERSION(3003)
 14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)
 		GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION_RANGE(3000, 3001)
-- 
2.50.1

