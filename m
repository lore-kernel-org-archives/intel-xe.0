Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8569FFCA194
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 21:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DA710E5CC;
	Mon,  9 Mar 2026 21:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+djrTSV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1472210E5C7
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773092412; x=1804628412;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jpHb0D4xvDjBCQ04MDUJGlq2onmxOLUcTRrqHyQ/nfU=;
 b=a+djrTSVT+7ODUXonr5FQMJ6ChapSnNPl9ULgOUqCqmouzQM/mw9JCMj
 eRTp9OnfxMI8Cf8EhoKnpaagbWUad1+H2ufdtdqPFrd5EYZ36xyIceRtE
 7JBdctKexi1l/nsp7c80fGVlHzFQtMt9Bg8ZyyxVB0KHMdZrEmtGKDKQx
 vViL+e8yF4xX7u3zWpXptqeIHAvfUbTQ1JGbppUo34MAyWWuboGogQ5dO
 +UJfQZPJ01c+7EChmbibP4ffdKjPMnwsQiuvlj6KdFJwbbKCZYvtFOsD6
 u2FJpgDgPmX5EPmZ2h7uFULG3rWUSigOUK3lQkkfNOw+kc5wWZQ8JIErT w==;
X-CSE-ConnectionGUID: j3NnlCiKSm2VtZ+fc+tosQ==
X-CSE-MsgGUID: BZAne5r1TF2HbStTx7f++w==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="91702267"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="91702267"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:40:12 -0700
X-CSE-ConnectionGUID: sGWNRqihQZyYGIe7xLyjEw==
X-CSE-MsgGUID: tsBlwKFTQB2xjLtjCq+bVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="216346718"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:40:11 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 09 Mar 2026 18:39:45 -0300
Subject: [PATCH v4 2/8] drm/xe: Drop unused IS_PLATFORM_STEP() and
 IS_SUBPLATFORM_STEP()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-extra-nvl-p-enabling-patches-v4-2-2e7fcead971a@intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v4-0-2e7fcead971a@intel.com>
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v4-0-2e7fcead971a@intel.com>
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
index 3e04e80e0815..615218d775b1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -82,16 +82,6 @@ enum xe_wedged_mode {
 
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

