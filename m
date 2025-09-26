Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED641CAC5BD
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 20:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A9F10E139;
	Fri, 26 Sep 2025 20:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlEBqFvz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B1D10E139
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758917361; x=1790453361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qk7nD0SLUW5xStEO6qVUaCd6GETtTYFZlAdGxXT35Gw=;
 b=HlEBqFvzcOI4hyjfeCTkUEr0DhIZZgY1sv9zaYyBn3TgYDK7wk1+wecl
 I8xYjfXQ4Cvqosg8GLOt9sRrWKehR9Qax/Ua9bD4dNgA74W6rZEWdT02e
 8AfrC8B2xeH3HldqHpzA53U3hFFZB0ojbQ0zwpUqo8zBI7N1S60dkV+P4
 EEM9+7fDlEnBNBd8RrXmUnIpwxWGGCUIC80U7dPPHR10MLwDFZFldhYE5
 cSmCotRA8Gu+Iwia45JRHcslh9DZAebH22u7+yGOnUWOlZHX3Y7tFO31B
 57XgBbDYI+jZYjvaE3mXBMHnlggde5jkhRvOw1i8u3VKyIx2+335YMVou A==;
X-CSE-ConnectionGUID: qynxxDDaT9mLbd8msbC+hw==
X-CSE-MsgGUID: 0qlIoUS0TUmdhTREFA9OGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72352466"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72352466"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:09:20 -0700
X-CSE-ConnectionGUID: z+N1/j9FT0a6KU/AY0w43g==
X-CSE-MsgGUID: OIP6jkbXRjmxOQ5xiy01uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177634939"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:09:19 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 3/5] drm/xe: Don't call xe_device_get_gt twice in
 xe_hw_engine_lookup
Date: Fri, 26 Sep 2025 20:09:21 +0000
Message-ID: <20250926200917.164618-10-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926200917.164618-7-jonathan.cavitt@intel.com>
References: <20250926200917.164618-7-jonathan.cavitt@intel.com>
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

We already initialize a
struct xe_gt *gt = xe_device_get_gt(xe, eci.gt_id)
in xe_hw_engine_lookup to ensure the given gt_id is valid.
We don't need to call xe_device_get_gt again to pass the same gt to
xe_gt_hw_engine in xe_hw_engine_lookup.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1cf623b4a5bc..f4b9857d6195 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1071,7 +1071,6 @@ xe_hw_engine_lookup(struct xe_device *xe,
 	idx = array_index_nospec(eci.engine_class,
 				 ARRAY_SIZE(user_to_xe_engine_class));
 
-	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
-			       user_to_xe_engine_class[idx],
+	return xe_gt_hw_engine(gt, user_to_xe_engine_class[idx],
 			       eci.engine_instance, true);
 }
-- 
2.43.0

