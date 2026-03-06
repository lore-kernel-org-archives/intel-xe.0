Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8310FCC048
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 17:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6937210EDF5;
	Fri,  6 Mar 2026 17:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWFq6t1M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F4210EDF5
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772818129; x=1804354129;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=c8nDN7GDPTGjD6BQ0QADtnF4ZQbGDjqszhy0VlHxL6Q=;
 b=KWFq6t1MsRI8WmKCM8RxfI3FM6NGW9Lix4L5epdSJwy/YC41uXAV+eSn
 jmgIUaqcCvja5WVnGXHfYd3FqRcHGlnJmbbv3E2v3kDnfDRTjQYC/cLzm
 TqZfCM8GX+SOJXNUDIhgFW5ShZbTWCXusaY7ZfpUld/Ied8dj9wqxKhxJ
 0xMZY+MYqRy2WApEvqg3sXj3oKmI4y5llthztaFOjjL3RG6h3WHXIpZg9
 ool2s4PuGKfYQ4EpzguF/W9vZa7NR0p3pvB2jnAjSTF8rUPO4ZPNX6pFG
 xxGTGtuQJEiMyRTY4eBIwWLexnwreoRIpIIVt6uX5ocXHyiCh7r5N5OfN g==;
X-CSE-ConnectionGUID: FoIq/k+qRI6C/HkATXBv/Q==
X-CSE-MsgGUID: cYp6hOYxS2CcGt7O8KmjzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73899629"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="73899629"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:28:49 -0800
X-CSE-ConnectionGUID: 2szZ3sqXQh6FipctdqeUGA==
X-CSE-MsgGUID: TrhnHB70Qla/AC0x7PPFAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="218229610"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.22])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:28:48 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 06 Mar 2026 14:28:22 -0300
Subject: [PATCH v2 2/7] drm/xe: Drop unused IS_PLATFORM_STEP() and
 IS_SUBPLATFORM_STEP()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-extra-nvl-p-enabling-patches-v2-2-53dcfa6b44e4@intel.com>
References: <20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com>
In-Reply-To: <20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
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

The macros IS_PLATFORM_STEP() and IS_SUBPLATFORM_STEP() are unused since
commit 87c299fa3a97 ("drm/xe/guc: Port Wa_14014475959 to xe_wa and fix
it") and commit 63bbd800ff01 ("drm/xe/guc: Port
Wa_22012727170/Wa_22012727685 to xe_wa"), respectively, and we can drop
them now.  Furthermore, in upcoming changes we will add logic to read
platform-level step information from PCI RevID and keeping those macros
around would potentially cause confusion.

v2:
  - Cite commits that made the macros unused. (Matt)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

