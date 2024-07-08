Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18416C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 18:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8CC10E232;
	Mon,  8 Jul 2024 18:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AX4rLvvo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED37010E232
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 18:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720464951; x=1752000951;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CaxGwJpURWBYIBYEh5sKpuPoPEZyiHPRhTyt/1AiKdc=;
 b=AX4rLvvoPj+cH80a33uykxiW4AAX+0XtGp6ST+pd69XC/0l/4H/iDjXA
 2jMtnFpq2WVWoRg5a8hL3J4LpWcDaHQUUdJcWpChKYcGHGUu5vYkxjcdx
 v2i/mHHnuKZb+aemtcaTKX1z0eAwq1cXPNDC/lG7PCtU8/PfGBcWbSHas
 EtVFgANLOT+ZYsFw1EZYbZ63aoFkUCnZbkCmYq8t9ZDmncnX0SraK+7Ds
 0r4I9sMlTijgt90jTIhroDQg95N9bJH69JmFGAuSiHtFRdWeh8hfWYFYE
 AvH7cstXDr5niqKy7+y97yJBaBYICVDcRYVxgHRJXweZyiQF9l3WkFPCY A==;
X-CSE-ConnectionGUID: J28uGmhLTNyEN+fu53655w==
X-CSE-MsgGUID: 0XwcfLMURiOwIZ5njjl1Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17820132"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="17820132"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 11:55:51 -0700
X-CSE-ConnectionGUID: 2zsY4okfRSyzA98P7ZAPew==
X-CSE-MsgGUID: M4dTs+8/SnyvxJoe0XGlCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="48019594"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 11:55:51 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 1/2] Reapply "drm/xe/gsc: define GSC FW for LNL"
Date: Mon,  8 Jul 2024 11:55:37 -0700
Message-ID: <20240708185538.2243957-1-daniele.ceraolospurio@intel.com>
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

Wa_22019338487 is now merged, so we can re-enable the GSC now that we
won't hit the HW issue anymore.

Note that this patch is not meant to be merged, but rather the revert
patch should be dropped from the CI topic branch. This patch is being
sent for CI and to get an ack on dropping that patch.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index a69c61f6b064..62ed413bf1c3 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -128,6 +128,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
-- 
2.43.0

