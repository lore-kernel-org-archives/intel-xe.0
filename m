Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30CBD12D50
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 12:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E6810E13C;
	Wed,  3 Dec 2025 12:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLfBpHiC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C29310E13C
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 12:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764765314; x=1796301314;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kstKcjP3gHbgEnr8+Z7ThtAXeYU/O8eB5+jtal5EkI4=;
 b=OLfBpHiCqSdydy3YOOxyrUY0B52qxtt7LPJxnlvCXrA/R/Iv2N86vCcZ
 Y8XrPEBuYTrqybCW9sz4icIv+hpLhUJL9+J3FcaEy0ZsTRDnKhg+qAytO
 3PWZWkrO1ENVTzTkfbkIPGfK90plnTWrTG0tQXmzV1nfPDK77EBZtxzJG
 BjkAI5FeFaksQaWJfe5snkhGApK37wgGx3P40RE1qJ/6tnQHlgj2LHjt6
 Dn7o9px9fMGQxxh7OExM719xKxhRrWnlWvT0498J7ekXsvufL/01/N+ub
 rNnsfdm4e/4b255SQjy17Tdw0aGwrMfVV6S/PM7H3dvSxvWAmcDUG+LoS g==;
X-CSE-ConnectionGUID: k8azvveMQxSWQvPQiYt23g==
X-CSE-MsgGUID: j5MG9XwsRUS8Un1eNxN5qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77438296"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="77438296"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 04:35:14 -0800
X-CSE-ConnectionGUID: GloMohE5Swy2VdJ7SCQZNA==
X-CSE-MsgGUID: Ku2xaNu+QGCGb3enzqHSug==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 03 Dec 2025 04:35:12 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, sk.anirban@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/throttle: Skip reason prefix while emitting array
Date: Wed,  3 Dec 2025 18:03:55 +0530
Message-ID: <20251203123355.571606-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

The newly introduced "reasons" attribute already signifies possible
reasons for throttling and makes the prefix in individual attribute
names redundant while emitting them as an array. Skip the prefix.

Fixes: 83ccde67a3f7 ("drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 096a6187ff12..570358310e97 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -137,7 +137,7 @@ static ssize_t reasons_show(struct kobject *kobj,
 		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
 
 		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
-			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
+			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name + strlen("reason_"));
 	}
 
 	if (drm_WARN_ONCE(&xe->drm, !ret, "Unknown reason: %#x\n", reasons))
-- 
2.43.0

