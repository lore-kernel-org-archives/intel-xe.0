Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02F7E7FDEF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CCD10E4A7;
	Mon,  2 Feb 2026 21:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoIE/KX7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D8010E479;
 Mon,  2 Feb 2026 21:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068663; x=1801604663;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ADXn8uglfoqp5pk0uzjV/qoNYwTIEPWZRWIPJ6UgZEA=;
 b=LoIE/KX7T2uvkBv2YJ8SKQQZn2dYRLLP8PQByFBvkyHrVUdRgPaoXxsl
 B0KfNg1rbgY2KMZ/MmLp1X+sdhnhc4xXONpS4cPh1irpauN5CUABquoQb
 bfmBxRqNsrIIAge/yHqTP3xIC23NfKIYb0yYLzcpho7ZE+K4bk1ohRUR8
 nN3Q+a8G5MuAu5Q1z69ghfu3HepATHWAKYbrDJ5Aaui45TN2ctnmSN3il
 IJTrm5THs5bKTyoNuUH3J0YjYa4nxb2hXwVJ4U9LINgVOtKnEi6+3jFjR
 vC+e/oOdaU0MsxgKgKyYgXBcUkPiaek+/rP7HrLQ31NkIg69tPBbFYady A==;
X-CSE-ConnectionGUID: SIgCKodTTiinjcAtAo/VGw==
X-CSE-MsgGUID: u4HHumv3SJGYyIfoxuWblQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58814359"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="58814359"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:23 -0800
X-CSE-ConnectionGUID: EuEXDwdnRcW9bbuzuWSPmg==
X-CSE-MsgGUID: oGlFG6DoTtmtEbbrAyZW5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209646869"
Received: from smoehrl-linux.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:22 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 02 Feb 2026 18:43:18 -0300
Subject: [PATCH 12/16] drm/xe/xe3p_lpg: Enable multi-queue feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-nvl-p-upstreaming-v1-12-653e4ff105dc@intel.com>
References: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
In-Reply-To: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Xe3p_LPG supports multi-queue on both CCS and BCS. Add the necessary
multi_queue_engine_class_mask to enable that feature.

Bspec: 74110
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index edca562462fa..9bcf7c067479 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -108,6 +108,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
 
 static const struct xe_graphics_desc graphics_xe3p = {
 	XE2_GFX_FEATURES,
+	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_ENGINE_CLASS_COMPUTE),
 };
 
 static const struct xe_graphics_desc graphics_xe3p_xpc = {

-- 
2.52.0

