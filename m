Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2952C369A3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 18:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A66310EA59;
	Thu,  3 Apr 2025 18:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3CDdItX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2A610EA4D
 for <Intel-Xe@lists.freedesktop.org>; Thu,  3 Apr 2025 18:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743706582; x=1775242582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pBfeELwxRrz41rkxa1Utrv1uB+/srrXjC9UUTnNw8lc=;
 b=S3CDdItXbYiXpsr5kOpKSHleYDGPIbdovPX4XpNQxQ2wD88Wd0q+/TVk
 go8GDaWMEhWGs99YeqjvhWutk0uRXPreKQgqbZcOUXxJpofI/wZremu6N
 FcNNA1+CE9AdLeX6DVvFUUIeM2G0X85ptZinU61Nh5odJeIOGYHfJXdsp
 HbWCSweaY4GDIdi/xi43IlA6y5iBOq3a7G7YsUuEnTRu/mMogccZvHlbp
 KZQR8TDFL7i3BMXYgJ7BCBGkXHbzUYlUqSqfHlEU4wSK2KXGXhRWsjdG0
 2vZVhu+xZG4frDLm6DtLjH7vB/90mvXFf0LCruS1bcUDKehs5yWQihO2h w==;
X-CSE-ConnectionGUID: xfWZhb3hT3qJC0F+MofqBA==
X-CSE-MsgGUID: f9iTlqetSw+pIX9iSuJAMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="32737763"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="32737763"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 11:56:21 -0700
X-CSE-ConnectionGUID: NWndkzfvTbCn3tIqcikuiA==
X-CSE-MsgGUID: rb8eqMvZQ9CAWbHT6TYoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="126895859"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2025 11:56:20 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Clint Taylor <clinton.a.taylor@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 7/8] drm/xe/ptl: Add GuC firmware definition
Date: Thu,  3 Apr 2025 11:56:17 -0700
Message-ID: <20250403185619.1555853-8-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
References: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: Clint Taylor <clinton.a.taylor@intel.com>

Define the GuC firmware to load on the platform.

Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
Tested-by: Jordan Justen <jordan.l.justen@intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241011163920.7926-1-matthew.s.atwood@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index fe1813deff00..1db598d3b1de 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -114,6 +114,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 44, 1))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 44, 1))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 44, 1))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
-- 
2.49.0

