Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03779C4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 23:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C306010F395;
	Wed,  1 May 2024 23:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knJLajdm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DCE10F395
 for <intel-xe@lists.freedesktop.org>; Wed,  1 May 2024 23:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714605524; x=1746141524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YLWG01y/l+DwVnyeAzx28ND+TVx5hZQxQNudXvFLQ20=;
 b=knJLajdmLfu/DbvIUbRv2rLKgNWPH1xtPd4T4KRs6u1OkhwObUhLFGwg
 G2+WjwCpd//9Sw/qut+mSQWgoNsoF7HQsdHHwTCbBN6FAqn7D9bUNZ9fM
 HmMut3u8QSD31bXVBl1nzFqeTTuqBmiOJm/0NIJAg4XQSu+hlHuhSaAtV
 qHK4z/2lna92jt+sz6ozhlc/Mq9HUMwkSiOuVAgPp9DaY7hNORluH0QuY
 PMf+v81FC39YKYW5nArcl0WZgDpnB5lErxJGxGbvfERItmEKuWM8Mkxz1
 bDWBwod3bZybAoOmfkgDyFgreYNrN0Zh0thXjyMtdzUhT49mUAOAcMV8H g==;
X-CSE-ConnectionGUID: G6EuE/ueQ/Sdp/a01Tduag==
X-CSE-MsgGUID: lcOy3cuoTBWad5Htt22Rkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14163351"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="14163351"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 16:18:44 -0700
X-CSE-ConnectionGUID: rUxOXvQpQaWQbb0d7Z2Otg==
X-CSE-MsgGUID: Fk366dRKTYabclz1N+CpWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="31408597"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 16:18:44 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [xe-for-ci v3 2/2] drm/xe/gsc: define GSC FW for LNL
Date: Wed,  1 May 2024 16:18:29 -0700
Message-ID: <20240501231829.2122219-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240501231829.2122219-1-daniele.ceraolospurio@intel.com>
References: <20240501231829.2122219-1-daniele.ceraolospurio@intel.com>
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

Interface and compatibility versions are the same as MTL.

Note that the FW is still in development and the current release is
for CI only. Theefore, we'll need to keep this patch in the xe-for-ci
branch until we get the finalized FW release.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1759
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index ed819f1df888..893794f9cd52 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -127,6 +127,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
-- 
2.43.0

