Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924C8C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 12:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4B710E781;
	Thu, 31 Jul 2025 12:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clD/AA1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2D410E46F
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 12:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753965494; x=1785501494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BpWg4DTtRWzgfdar1tODm6qUHnOm8pmr7QF0+wXFuCk=;
 b=clD/AA1SQtnoi0mlo9Oib9Fj4Gf7pv+KJN0Q0hHKHAga8TQMwLC46PJ2
 WAnhWj3TQlNNlR9JmwISmqSezu66kSzUjOcnhQfcb6OD40kbVJCW/Vs+e
 k6FqUWMW09MJ/zVeV/PKFY9TQiApLNB7Q2irDjDmnJcN0nhKqKFFCLMB+
 Bl5GFkP7/31trVhDj1AfrHpKbmqH0kbd0YveEOW4pyLVHKqOWgTgHPTj6
 tFo2Vs9zMYEYAfZbpt5ISRUzA44AEH78ksH7KZG+qJAfDZDef2ZwKKLo4
 Hi/Zp5EbBKEJsejbnn0gnLAXvoeP+PXK+nOn2et7ELYXqJ09o6kA5QV4+ Q==;
X-CSE-ConnectionGUID: bPi6UPNNQH+6/KwxBehKmw==
X-CSE-MsgGUID: kQEOrzPWQV2CXxZwj1E0JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="58911333"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="58911333"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 05:38:14 -0700
X-CSE-ConnectionGUID: NFOB1YGKRjuP8KWxArTq0g==
X-CSE-MsgGUID: GNNqFictR8yui9QbIQyTrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="162838709"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 05:38:12 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v8 3/4] drm/xe/vf: Disallow setting wedged mode to
 upon-any-hang
Date: Thu, 31 Jul 2025 14:37:55 +0200
Message-Id: <20250731123756.29259-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250731123756.29259-1-lukasz.laguna@intel.com>
References: <20250731123756.29259-1-lukasz.laguna@intel.com>
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

In upon-any-hang (2) wedged mode, engine resets need to be disabled,
which requires changing the GuC reset policy. VFs are not permitted to
do that.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f9868b3ddf15..7b0fa360d5ef 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1224,6 +1224,11 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
+		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
+			mode, xe_wedged_mode_to_string(mode),
+			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+		return -EPERM;
 	}
 
 	return 0;
-- 
2.40.0

