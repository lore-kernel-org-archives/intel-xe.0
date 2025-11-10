Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0554CCFA1A
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8155410E480;
	Mon, 10 Nov 2025 23:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpXVJPVw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E7D10E49F
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816834; x=1794352834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+syolvU5UNcO56a5H6a0zZWWM3pyM1ldX5RsI7uRFaI=;
 b=dpXVJPVwAcuRF3dHibsJoKSwRnDXjno4YXmSQAZXwhAMGlyPMF7CfJrw
 DDwU996OVrZ1NGzfRjvNXSGU05rGLWfvFHbUcd7SupcPBf+u1BetwfsQl
 IHij3p9OhbfCMafqnA5q4bb3norUBNDzFqToJu1YYPhzHj9boa6kuni4F
 soOc8pwVmCjyIOKszJufydTLRGn/t3kSTsdoQu/0tCEagMts/+FLHxfhx
 C3uJgW+UNtyLS69IhWBA+cnpV+RpZn9yVVpKt9jNQU/MEqlGQrULOj8r+
 tMYMorN1vJxTMRt6QGeA5keWqFWpWVQnBV4Mv47ZaixeAQ0XcB+53wLUR A==;
X-CSE-ConnectionGUID: 6Oz5ZxijRFuCR2MBzed5sw==
X-CSE-MsgGUID: WyXKOG9sSjOFIbtzPzWz2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486461"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486461"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:33 -0800
X-CSE-ConnectionGUID: IcuUPjlrR1ulQ//226WyqQ==
X-CSE-MsgGUID: WdHV1uZeRGCS8FiQW4JMTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189244019"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 24/30] drm/xe/bo: Use scope-based runtime PM
Date: Mon, 10 Nov 2025 15:20:42 -0800
Message-ID: <20251110232017.1475869-56-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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

Use scope-based runtime power management in the BO code for consistency
with other parts of the driver.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b0bd31d14bb9..03d81664706a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2035,9 +2035,8 @@ static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 	struct xe_device *xe = xe_bo_device(bo);
 	int ret;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	ret = ttm_bo_vm_access(vma, addr, buf, len, write);
-	xe_pm_runtime_put(xe);
 
 	return ret;
 }
-- 
2.51.1

