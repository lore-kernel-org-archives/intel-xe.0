Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540D9C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 18:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1492310E664;
	Tue, 29 Jul 2025 18:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LF8BjCmr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3607310E664
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 18:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753813300; x=1785349300;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PLscgCjsv1xmdF6LHCDUvHf4X23mWkwzPmenC6804kQ=;
 b=LF8BjCmrpJdtBSQBCS+Qm1lqurK/e6F1vMHPbUfmhSMYOUVw4muWgMNy
 U9h1eKuUIVBx6BsFJcm/ev6JXQWFxFazs8qCuSvHy2gZyOR5msA/nuJa7
 D9+eSpiJpE73bozWzD7aDGLwaAaEdTW5cXv0iGJXCHeIfdvNMpQgyntxC
 CIywyeJ50K6QmL7L2GapBDa3jALEHfUVTBtZ+UAOje9/XyX/rpv5FYHNZ
 x6CYcWChE+3880ACiMUDBuI6zjeKNz3g0SwMgdUd9K3Qfo5cUdlOIxa5d
 fLqtueJDtQYOr2BUzqP7wkQ3Q2G7HW3XYpmUIDcypOak13maQSTh2Ikwh w==;
X-CSE-ConnectionGUID: YFrxJ2+dQJW0Lj71rGMdSA==
X-CSE-MsgGUID: 9TagTejLTtytHJYX7A0zgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59923113"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="59923113"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 11:21:39 -0700
X-CSE-ConnectionGUID: Pm0vhd2uS++DwCicpAPv4w==
X-CSE-MsgGUID: V+YImimRTGe78U9A0LsJVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162493177"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 11:21:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe_oa: Fix unsigned to signed cast in
 xe_oa_get_oa_config
Date: Tue, 29 Jul 2025 11:21:14 -0700
Message-ID: <20250729182113.894152-2-umesh.nerlige.ramappa@intel.com>
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

Static analysis flagged an issue with casting unsigned value to signed.
Fix it by using an unsigned parameter in function definition.

Fixes: 1db9a9dc90ae ("drm/xe/oa: OA stream initialization (OAG)")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 5729e7d3e335..e166547f43e7 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -178,7 +178,7 @@ static struct xe_oa_config *xe_oa_config_get(struct xe_oa_config *oa_config)
 	return kref_get_unless_zero(&oa_config->ref) ? oa_config : NULL;
 }
 
-static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, int metrics_set)
+static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, u32 metrics_set)
 {
 	struct xe_oa_config *oa_config;
 
-- 
2.43.0

