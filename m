Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E962CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 15:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED6110EA92;
	Fri, 26 Sep 2025 15:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9m/xEM2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E827E890B2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758902391; x=1790438391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6HnWd+5ZynQYAF28Ijw3WYlLudY1X7oNf/Yann+/5Z4=;
 b=B9m/xEM24884L2cIf8uLYZGf/Ie4L/LEXlJdZHHoVTF/tFneuOLFigxF
 /HIdbrUKU+4ti79fuYDPYQU38+461frXYv6lOTR955BHRIeit+XmDRSM7
 +Tm7+lL1Ga7+lGXte46Mx9geMFu7/eFJeMT7qQYvKdSeLlqcpB/he8WGK
 vAeFwKtwUUH1gxLb3QI7XtHi/gmjcN19rbNce3mJtEZpoFrWffkMHN8wh
 QsdC4Z/ER9vlxMkwhGahItratrnMrGb9evbSQ8QLULQGZf6nCvRUMP3sw
 6lURrSqLZjRahlchYj5IMM8TEZbHjj0/XeBdCSVotUysJyrJ/U392kaoY Q==;
X-CSE-ConnectionGUID: VYiemDJvRF65cAD8t0CTgw==
X-CSE-MsgGUID: eaStvafQQ3+UtM93okAtvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="63872188"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="63872188"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:59:50 -0700
X-CSE-ConnectionGUID: m94tSSujRDGM/UNuja+R0w==
X-CSE-MsgGUID: JYy5R0wwRtaPghWIxL2IaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="182914421"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:59:50 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH 3/5] drm/xe: Don't call xe_device_get_gt twice in
 xe_hw_engine_lookup
Date: Fri, 26 Sep 2025 15:59:52 +0000
Message-ID: <20250926155948.145934-10-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926155948.145934-7-jonathan.cavitt@intel.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
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

