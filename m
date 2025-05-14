Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D84C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 09:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16F210E602;
	Wed, 14 May 2025 09:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e80x60fc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9AA10E603
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747214732; x=1778750732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TfNkSzB5lDKdoYJ8IXK/f/zXU4oTXrDLhYfb9rgXfV4=;
 b=e80x60fcw2V2J0dFCmXovl5/NAOUC6NDoNWtapUn9vUdYqh2mdTuwxjs
 Pb2k9zyHBe9spvkJDlrSQnAf9j+Jvy7xuqQIZK8xY6FR/9G8f03bLX1bV
 FHICxlcHP9gEMeloA0aUevp0YvuNMLgIrOBj6AWWSEDe19aO1BrxRVkpt
 RporndabNE5zGdXdhgOX6t1eN0BJ31HkCtyndTREIdtYlg87rHMrz/j7v
 wtb3J1UcxymSrwtMGp/YcwiDteUZxi/nMj4/76lq8fx5N7BBVnz2xTe09
 OuP+ciXszXWWJYpfzRYje2QXMcd3fCvUf6LKHfo/e7OkVqeSUM+Wladhi Q==;
X-CSE-ConnectionGUID: up0VWvYXSx67QcoKJOxbWw==
X-CSE-MsgGUID: G9gSBfJERH6VkagseFxuAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49218344"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="49218344"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 02:25:32 -0700
X-CSE-ConnectionGUID: r4G5czg4SL+a+Ffo0jWReQ==
X-CSE-MsgGUID: dBjOGmqNTPKf7rHogAJH4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="142016828"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 02:25:30 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v4 4/4] drm/xe/pf: Allow wedged_mode=2 only in debug config
Date: Wed, 14 May 2025 11:24:52 +0200
Message-Id: <20250514092452.8364-5-lukasz.laguna@intel.com>
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

The GuC reset policy is global, so changing it on PF can impact running
VFs. To avoid unintended side effects, setting wedged_mode=2 on the PF
is restricted to debug builds only.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7dfc39dd4c9c..f23d8236bddc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1189,7 +1189,8 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
-	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && (IS_SRIOV_VF(xe) ||
+		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
 		drm_dbg(&xe->drm, "wedged_mode: unsupported mode (%u) for %s\n", mode,
 			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
 		return -EPERM;
-- 
2.40.0

