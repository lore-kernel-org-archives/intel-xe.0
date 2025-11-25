Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B78D0E6EA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 13:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A78310E403;
	Tue, 25 Nov 2025 13:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFsv6hJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0CE10E403
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764078882; x=1795614882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4cDcgQnpkOMa0aJ1CtkN1StRBjqRnuoLilQdcovEBEs=;
 b=WFsv6hJ6SuXSXJC9/VHxhRElxIvSKiyN9qKkq/iSIiqxM67cL0GNEgG5
 R5feqW45rn7HSTTn3szK+W1ka6YkgSVqHPd19czIIVKglP2LXH0JuQ9kJ
 2QaoAA7JwGz59wOd/rkzj3tFlQAVWg84UTxLpAYtneSWVe20Rx7paRJWq
 jRLk1gvNftx0IGUCHeq7yyy2OSGPv/8aTtgDvV/tA6CPV/D593/GhSRKX
 ikSog8Sqn0r8RUIJ/uV93rg944DMpIrPei8oUgbrK6pHPRtZU1MdcR1MW
 Hi/4/gIjgsrgWfoq+F2nn+/OZAzkDAJq++tJUNN+GI5K2wSlolqEqXlDA g==;
X-CSE-ConnectionGUID: YixTXD63TSqEJVLwO8OeyA==
X-CSE-MsgGUID: ksja68JTRfSoRJiDKfBkGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65802562"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65802562"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:54:42 -0800
X-CSE-ConnectionGUID: Dy/ts766TZmxGs5qDRDbkw==
X-CSE-MsgGUID: YMvRpvfiQlGHiCvRDV6WXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="196954016"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:54:40 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v10 3/4] drm/xe/vf: Disallow setting wedged mode to
 upon-any-hang
Date: Tue, 25 Nov 2025 14:54:21 +0100
Message-Id: <20251125135422.11244-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251125135422.11244-1-lukasz.laguna@intel.com>
References: <20251125135422.11244-1-lukasz.laguna@intel.com>
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
index f6216c4f83f9..da12924f191c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1302,6 +1302,11 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
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

