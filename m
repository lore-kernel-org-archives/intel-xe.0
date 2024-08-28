Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C60C5472D
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 08:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D549A10E4D0;
	Wed, 28 Aug 2024 08:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzE5Wzrs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C364410E4D0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724832742; x=1756368742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=edz1sulfcMO1ampBCmD/T46lirQveOWeGVKJvOsO8v0=;
 b=BzE5WzrslY+3huoOSe7OPoxA7UB22ZE0ai5m6ss27ye1FKhM/kEliBpf
 FcBOKpXdusunz3y3XMNSYGUiqmgk69tA9bVbRQIShCEu2dOW9KrYp1jHB
 //nDotrXLNPRDMyjtVQwVZ6LNhKHtW0Um168CZp2RI3gCH01Ps/amy6uj
 PcwxlDFwMcdm9zGpRyCdtnGxBPSATzTyFxj8WLvrZvLE0E+r6UXTGuhbq
 Q/1EunB8iNaFXza9UqEYwhvKWtb3+lQnjBM+9cxhqLrNl4Bfz7DsL9t8x
 LG12tvmB60/g+ERj/X2iCixgROp2S3f1YUh2nNTq83eS51zu2EIIGdc1h g==;
X-CSE-ConnectionGUID: ttPRLynQTBedu8VNId14UQ==
X-CSE-MsgGUID: LMBU6mmZR+KiprIG4qxbRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34724815"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="34724815"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:12:22 -0700
X-CSE-ConnectionGUID: lA94/NGrRT2vipnv+nBh+g==
X-CSE-MsgGUID: B3oSbb0uRvGBR7KfYXuIwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="62984663"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:12:20 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/xe/bmg: Drop force_probe requirement
Date: Wed, 28 Aug 2024 13:51:52 +0530
Message-Id: <20240828082152.3194814-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
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

Battlemage platform is sufficiently tested and found stable. CI is also
pretty stable.
Removing the force_probe requirement to enable the platform support by
default.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index fa57996f9c37..330cd2d785bc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -348,7 +348,6 @@ static const struct xe_device_desc bmg_desc = {
 	DGFX_FEATURES,
 	PLATFORM(BATTLEMAGE),
 	.has_display = true,
-	.require_force_probe = true,
 	.has_heci_cscfi = 1,
 };
 
-- 
2.34.1

