Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32F3FF6E87
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 22:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDC410E41C;
	Tue, 17 Mar 2026 22:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwqDOHcs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FEE10E41C
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773784916; x=1805320916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MMTugMnw1tJREjLR3TiLb69a+wTfM/0BKZXJSgf54kk=;
 b=NwqDOHcs4LbnEPYNyb2EaT2Uw3NlBWqgwrsJaqG0TXohrBwF2FNnrn4m
 Rl7XRLMbWtiv5zroGcaEXGaSHkCMUO+GM5Hq1DhSQnXmLyiKQAQkbbsZX
 TosDKpl9XwEf1yiHMX3Z1J0GJNji39oGtINXZCgnJAEzQPSGM7/q0R0ow
 keOgptVDgp4ROrDZiAr6f6dUOgfEiPDVvKETf1K2oEsaX+ixXJ7r2fzNf
 7v7Zn+aMDbeB/81MPc/5+dmWfuKYHfcYFurcdXHIkq1T5dod+d1FpQx2O
 Nl0i6SLDWYLz7mcot15DqFnAqoAhE1Vc3euSjrMaroYK9JWUFNL5vOC7u A==;
X-CSE-ConnectionGUID: DQWfNChmSuu6aTxtoEnwcw==
X-CSE-MsgGUID: d0X0GaiGQPu+CT7eOCs/tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74011926"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="74011926"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 15:01:56 -0700
X-CSE-ConnectionGUID: o0F1dNi5QUuROtGUo/ejZQ==
X-CSE-MsgGUID: /gnJLmyDTrG0rS93JtA02g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="245427925"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 17 Mar 2026 15:01:55 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH 4/5] drm/xe: Add missing leading underscore to include guards
Date: Tue, 17 Mar 2026 21:57:20 +0000
Message-ID: <20260317215732.2208976-11-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317215732.2208976-7-shuicheng.lin@intel.com>
References: <20260317215732.2208976-7-shuicheng.lin@intel.com>
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

Two headers use XE_<NAME>_H_ (no leading underscore) as their include
guard. Normalize them to _XE_<NAME>_H_ to match the convention used
across the xe codebase.

Files fixed:
  - xe_drm_ras.h:  XE_DRM_RAS_H_  -> _XE_DRM_RAS_H_
  - xe_hw_error.h: XE_HW_ERROR_H_ -> _XE_HW_ERROR_H_

No functional change.

Suggested-by: Nitin Gote <nitin.r.gote@intel.com>
Assisted-by: GitHub Copilot:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_ras.h  | 4 ++--
 drivers/gpu/drm/xe/xe_hw_error.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras.h b/drivers/gpu/drm/xe/xe_drm_ras.h
index 5cc8f0124411..365c70e93e82 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras.h
+++ b/drivers/gpu/drm/xe/xe_drm_ras.h
@@ -2,8 +2,8 @@
 /*
  * Copyright © 2026 Intel Corporation
  */
-#ifndef XE_DRM_RAS_H_
-#define XE_DRM_RAS_H_
+#ifndef _XE_DRM_RAS_H_
+#define _XE_DRM_RAS_H_
 
 struct xe_device;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index d86e28c5180c..5e3a11424108 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -2,8 +2,8 @@
 /*
  * Copyright © 2025 Intel Corporation
  */
-#ifndef XE_HW_ERROR_H_
-#define XE_HW_ERROR_H_
+#ifndef _XE_HW_ERROR_H_
+#define _XE_HW_ERROR_H_
 
 #include <linux/types.h>
 
-- 
2.43.0

