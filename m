Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7C6F30952
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEE710E289;
	Thu,  5 Mar 2026 12:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOD2Nkn9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298E010E278
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772712191; x=1804248191;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=WFDNcqUAQZWMun5xmm4JwBDxWMedXx9A1Y6/fQ6ajxM=;
 b=EOD2Nkn9k8ckMTzw2oKahHQX/bIUu1OnHVNR/eIT5Ii9tdpX5ajnk+b+
 6CH53QlRWYpf68ma3oMWzjwYEiTTOsEc8zdZoq5pUkShfFw8uAl+nq80E
 Q7ZXOIN1baKFosEmpOdUnRu8SB7ClbBuWk7AuqET9ck2fkV9/MQZDdiIh
 rQFLUT4A2z2dghGtKKFowkWRa52nDxzu1Fh4pLeZRdgbdqG6mxRrAci0I
 uKjeIH7SaqVd+ygnzXqIm3y4loZlGqsS9DfpUeQXJtlYqdD6auRDPWhuu
 TgETjy9kMaAfqEO/w0isUAlcr02vLkKicGrJBzh/rA2HK8ku5+wMyTI68 w==;
X-CSE-ConnectionGUID: xi7bg/RASDujrK+zRsktVg==
X-CSE-MsgGUID: 4lkh67QISKOgHxYz/63jxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73702510"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73702510"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:11 -0800
X-CSE-ConnectionGUID: tCpKUUq/SAqYffD9x9kZFQ==
X-CSE-MsgGUID: aZbZS5MrS4WwISCJhI/pCw==
X-ExtLoop1: 1
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.218])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:10 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Mar 2026 09:02:29 -0300
Subject: [PATCH 2/7] drm/xe: Drop unused IS_PLATFORM_STEP() and
 IS_SUBPLATFORM_STEP()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-extra-nvl-p-enabling-patches-v1-2-5020d5289dea@intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
To: intel-xe@lists.freedesktop.org
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

The macros IS_PLATFORM_STEP() and IS_SUBPLATFORM_STEP() are unused now
and can be simply dropped.  Furthermore, in upcoming changes we will add
logic to read platform-level step information from PCI RevID and keeping
those macros around would potentially cause confusion.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index e9032014923d..85451cef3c25 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -81,16 +81,6 @@ enum xe_wedged_mode {
 
 #define XE_MAX_ASID	(BIT(20))
 
-#define IS_PLATFORM_STEP(_xe, _platform, min_step, max_step)	\
-	((_xe)->info.platform == (_platform) &&			\
-	 (_xe)->info.step.graphics >= (min_step) &&		\
-	 (_xe)->info.step.graphics < (max_step))
-#define IS_SUBPLATFORM_STEP(_xe, _platform, sub, min_step, max_step)	\
-	((_xe)->info.platform == (_platform) &&				\
-	 (_xe)->info.subplatform == (sub) &&				\
-	 (_xe)->info.step.graphics >= (min_step) &&			\
-	 (_xe)->info.step.graphics < (max_step))
-
 /**
  * struct xe_device - Top level struct of Xe device
  */

-- 
2.52.0

