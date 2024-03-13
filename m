Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07058C54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 18:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A861710EF6F;
	Wed, 13 Mar 2024 18:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9rh6Gnn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0CA10EF6F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 18:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710355462; x=1741891462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f5rJnJNbNTYpjCSmzLMB8Ihitr7nXiDTm66u3WNKZ9I=;
 b=K9rh6Gnnwej+YF+vOh4IsphgTTmU0RMZGQoU1liVVbkBWfpFcLmUDdLy
 9Hp8YIb8aV5tL1HDd4if8t7rwjpvoMo7ULX7A90eutkzMiPcY67s8H3we
 RIF5vc0K1iJCpNyk+LyhaOes9d/5iuxvIurrjaybAOiclZJsMXR/1wTd/
 suJX7HV8Mc+SZs2FL1C+a0eUNawe40bFzUVPkl6rGxHRe2pFlXaJwdL8j
 Jh2aJwMz0Zaw4RCKI+ONz+O9hM96PRH9QSQ0ArQ58Yag7aFnhLRj4NRiU
 UoInkirFx2X+J0XJ7gIhA91joM+XNK2HrUaXx85DS6NOFFf3gUlUbUfXq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5268790"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5268790"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 11:44:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="16613425"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 11:44:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Use xe_assert in xe_device_assert_mem_access
Date: Wed, 13 Mar 2024 11:44:30 -0700
Message-Id: <20240313184430.999397-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The implementation of xe_device_assert_mem_access has a non-zero cost.
Use xe_assert rather than XE_WARN_ON so it will compile out in non-debug
kernel builds (Kconfig CONFIG_DRM_XE_DEBUG=n).

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 919ad88f0495..b0bfe75eb59f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -666,7 +666,7 @@ bool xe_device_mem_access_ongoing(struct xe_device *xe)
  */
 void xe_device_assert_mem_access(struct xe_device *xe)
 {
-	XE_WARN_ON(xe_pm_runtime_suspended(xe));
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
 }
 
 bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
-- 
2.34.1

