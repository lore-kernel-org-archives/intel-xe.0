Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7CEC531DD
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 01:54:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7838210EA59;
	Sat, 10 Aug 2024 01:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jC8yi6Op";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB5710EA57
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723254894; x=1754790894;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=o8mvUYJYr85MjVIypADxf6r6I6pnRipEeR+PXv7+Orw=;
 b=jC8yi6OpIeM8l4N/qCMt/U77JDdnzXhlxT2imHTqMOVJ/9HRao838j/W
 8sqcGAHlZXeoSsKbXN3ScIm8ENouG6oNOe9zlVirQglek3ZQkP1WgViam
 mDMM942mhsT2dL3xEKrNgzMzXDXZKfeqp/+b6mTP3s40hJhA1pLPhPwqo
 rx86Z1VUo77L5z1tQUtP2lWvdXNSKFb2UG95FZoKrUuKqaa6OFlyPoXsd
 5rYtuDdg4xMJuWdG1/iirxxJdUB3ZTNOFWAegjxPKxRZK8SvA9LIgXafo
 UkpYbEnJZl8o7hf+Ew9uHM0dsOAcByn6o+ZXyf32S6BKQ8dVw2tNg96B7 Q==;
X-CSE-ConnectionGUID: e0/8rT84TsOO9W5FHvPkFg==
X-CSE-MsgGUID: EAMjQ24tTMSDACuAEZTqoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21420032"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21420032"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:53 -0700
X-CSE-ConnectionGUID: Aoseh4hsQR+6KwxApCGfwA==
X-CSE-MsgGUID: 8up6uqsmRkmiccuZBybC0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="57813388"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 08/11] drm/xe: Drop warn on xe_guc_pc_gucrc_disable in guc pc
 fini
Date: Fri,  9 Aug 2024 18:55:41 -0700
Message-Id: <20240810015544.3443258-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810015544.3443258-1-matthew.brost@intel.com>
References: <20240810015544.3443258-1-matthew.brost@intel.com>
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

Not a big deal if CT is down as driver is unloading, no need to warn.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 32e93a8127d4..def503abeed5 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1042,7 +1042,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 		return;
 
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
-	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
+	xe_guc_pc_gucrc_disable(pc);
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 
 	/* Bind requested freq to mert_freq_cap before unload */
-- 
2.34.1

