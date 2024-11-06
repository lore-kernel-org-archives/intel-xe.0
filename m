Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D083D44D78
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 15:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD74410E714;
	Wed,  6 Nov 2024 15:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fru2FMYw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAFF10E707
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730905992; x=1762441992;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xHayUlcqysQsisM2Rtdp0w2/K447hSPhzUcNHFFxh7A=;
 b=fru2FMYwWw2HGdO9Hc44721ATfM+z55Nppptzf1YZ2/HIYX4gxzbswtn
 6IrNl1s1pe9Rk5nU2mgJ08OdGOvJ+E9zcNxdP2nvrSZASEiLSfS1CBax+
 SgBinaYjZAWxsmUvLa9wl6H7ZtEFdFUeFTs5dNSYAMdjGAmdnrCMwaarU
 l83vTu/0PeS4bz3qU7cdNJLuC494szXygFbL8C5ZHvR6kXIEJnr8NNCMT
 2BeAPZdrN+ln21Wu2AG5KvO0GBG+bCDVO9Up6UYVHs5GUYlz+jLqXQe84
 BHPQ++DCflQ4wWW51242P6OFave6pKR4etzWnuPPpEkcuuLCiA7VKT5lE A==;
X-CSE-ConnectionGUID: sXxbY3TYQ6K2k+8PLHwWvw==
X-CSE-MsgGUID: r5bhGmDjRhaunwY6gQLQAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30867680"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30867680"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:13:12 -0800
X-CSE-ConnectionGUID: IIruqZHoRyGOCc+qpB+Scg==
X-CSE-MsgGUID: tmQ59z8nTzOH3H5VmrIDYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84136789"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.98.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:13:11 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 2/5] drm/xe/guc: Add VF_CFG_SCHED_PRIORITY to KLV helper
Date: Wed,  6 Nov 2024 16:12:58 +0100
Message-Id: <20241106151301.2079-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241106151301.2079-1-michal.wajdeczko@intel.com>
References: <20241106151301.2079-1-michal.wajdeczko@intel.com>
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

Recognize new VF_CFG_SCHED_PRIORITY key in to_string() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 9d99fe266d97..146a6eda9e06 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -49,6 +49,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
 		return "begin_db_id";
 	case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
 		return "begin_ctx_id";
+	case GUC_KLV_VF_CFG_SCHED_PRIORITY_KEY:
+		return "sched_priority";
 
 	/* VF CFG threshold keys */
 #define define_threshold_key_to_string_case(TAG, NAME, ...)	\
-- 
2.43.0

