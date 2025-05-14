Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99C9C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 09:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF19C10E600;
	Wed, 14 May 2025 09:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/v0hogn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2E910E5FF
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747214729; x=1778750729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4hoZjsQAqO9DDpWyIPHQcuvZfIhiE4tVAP2zs5AddT8=;
 b=T/v0hognoDSxIrUdeQ2/f8bRgQZB1XLhuQ+yAjeg1CzMnnVphuJHYsMA
 ZLtupxoBxTXqsJwi7QWsUVE3B2deB6Oro42aRMo0VlgjDfkRtPok8eEw2
 4u5AW6nR3Mzjq7UPSlWWPPglG9woWv3oiRzgjQYaY9DyQ1DTLQKU9Gj8E
 X9TkS4wGL/r2cnzqdkECjDmBmsvj8RSTSBG002XBBSUu5oAPH1W0FphH6
 ziQ6t281Lxk5RdDkuQXP5Sx5IFK61kFuYvU1ogw/zpYI+TmVcVSO9ieIS
 I8UbgbEQnVzHOYfod542hV6d9Mtm2zoGb9YIL4rbNF1zzUDR0O9DDRRzo g==;
X-CSE-ConnectionGUID: mFcMZAioQeyPctlWLN58iQ==
X-CSE-MsgGUID: Ld6p9DQZSpqNQJCHr6Q4FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49218340"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="49218340"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 02:25:29 -0700
X-CSE-ConnectionGUID: 1RwTTJTaR5S986Utna0/Ng==
X-CSE-MsgGUID: KX8FCAQCSU+o1YWazRh0zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="142016824"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 02:25:27 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v4 3/4] drm/xe/vf: Disallow setting wedged_mode=2
Date: Wed, 14 May 2025 11:24:51 +0200
Message-Id: <20250514092452.8364-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250514092452.8364-1-lukasz.laguna@intel.com>
References: <20250514092452.8364-1-lukasz.laguna@intel.com>
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

In wedged_mode=2, engine resets need to be disabled, which requires
changing the GuC reset policy. VFs are not permitted to do that.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a8470221ff85..7dfc39dd4c9c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1189,6 +1189,10 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
+		drm_dbg(&xe->drm, "wedged_mode: unsupported mode (%u) for %s\n", mode,
+			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+		return -EPERM;
 	}
 
 	return 0;
-- 
2.40.0

