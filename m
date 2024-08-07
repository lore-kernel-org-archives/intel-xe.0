Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84720C52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 23:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5444610E60D;
	Wed,  7 Aug 2024 23:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4PrvFNc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC4B10E60D
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 23:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723074823; x=1754610823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VcNeu4HCG4YzXYQD1QYbiXKgE9TfcU2fzOh16O8AH1U=;
 b=Z4PrvFNcNzGVuwOKWMghYhjV5GlKyyVMGUPXrA5QSsYAptjNm1yOW1qc
 HyEeoBvPZ5lkiivGkK6p/8awEVI/IcqBAfvOw42pdSXxoBAsOVWB5Zp13
 eKCqssYAgx30iV0spxpOPBcmT02Y45p1S6MR8OAugZIKmX2iWzSzBoi1T
 3d/QoI+PoGHrpK76EkdPBarpzGruwAUWZFj4lJJI+pBwm96nOa/NIB1mX
 PK5oDZ3QvWsw4g1oUN60X2B6xLe0VBNvboTiNDWV4ufxYgwu0KpyDRrbw
 klHqc2I9VbCKqv+2VfnjR1X59a1c5NhoNey8SmlEq+Up1Y3Nzd/M3TGAx w==;
X-CSE-ConnectionGUID: hWFHtsxpTlmpVvrvZSpwWg==
X-CSE-MsgGUID: swClaNrpRuWQ0kMDK6CIFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31847589"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="31847589"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 16:53:42 -0700
X-CSE-ConnectionGUID: gZsyzXyxTpaPSc3XtpeZaA==
X-CSE-MsgGUID: G1oaaguaTzWVFGZPPCOQ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="56705747"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 16:53:42 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/2] drm/xe/bmg: extend WA 14018094691 to BMG
Date: Wed,  7 Aug 2024 16:53:33 -0700
Message-ID: <20240807235333.1370915-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807235333.1370915-1-daniele.ceraolospurio@intel.com>
References: <20240807235333.1370915-1-daniele.ceraolospurio@intel.com>
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

The WA applies to BMG as well, with no changes compared to LNL

v2: rebase on use of GRAPHICS_VERSION() instead of PLATFORM()

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 540d38603f32..f62cf6a4f6af 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -19,7 +19,8 @@
 		GRAPHICS_VERSION_RANGE(1270, 1274)
 		MEDIA_VERSION(1300)
 		PLATFORM(DG2)
-14018094691	GRAPHICS_VERSION(2004)
+14018094691	GRAPHICS_VERSION(2001)
+		GRAPHICS_VERSION(2004)
 14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
 18024947630	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
-- 
2.43.0

