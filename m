Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AD6D374B6
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 22:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E11110EBD5;
	Fri,  5 Dec 2025 22:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebJCgJqf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B96A10EBD5
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 22:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764975175; x=1796511175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w20nhQhOj9kh/mL6HXB5unBZOy7DjAzyOjgyovQ3L1M=;
 b=ebJCgJqf+og7X0crYk3ByZwcbcfuOhWNtbwZmRe8EEINRL0eAKDjJex+
 8V4sYONFuU8ZBNv5d0JxEAfDa0SLGVvVaKSoafPDyhQHPlV2Y7iG+D5kV
 sPuyhHehHdpoxV2R5yWskYAhRZ8Xxrq1dBJicFLnJlJCvui9tI4brGPMH
 otIn/KjQWfrWsGdfApCyGpwG8FmDaY6h/6WO4lpZAq2h0TQJ7+Yk8x4cB
 CN6tGBzR7qq9AUQ5XDnbfpkbUDNJiLJHWGfG1FnJDsw476alTLNIAHEuL
 cUDHRjSD7jThR3UlPKuU5UqtmWNvUrlPMrikuE8WOF3u9ocFeLZP6pcei Q==;
X-CSE-ConnectionGUID: oyFg/ZNASQud8xuDiyBPFg==
X-CSE-MsgGUID: QTroGgfARpWzvJee0Y3ecg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70862076"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="70862076"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 14:52:55 -0800
X-CSE-ConnectionGUID: fG0iqjTCTwqhLuRR3eB6Fg==
X-CSE-MsgGUID: HEaDsAReRaOxEeRJgDtT0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="195849039"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2025 14:52:53 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v2 2/2] drm/xe/oa: Limit num_syncs to prevent oversized
 allocations
Date: Fri,  5 Dec 2025 22:48:11 +0000
Message-ID: <20251205224808.2466416-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251205224808.2466416-4-shuicheng.lin@intel.com>
References: <20251205224808.2466416-4-shuicheng.lin@intel.com>
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

The OA open parameters did not validate num_syncs, allowing
userspace to pass arbitrarily large values, potentially
leading to excessive allocations.

Add check to ensure that num_syncs does not exceed DRM_XE_MAX_SYNCS,
returning -EINVAL when the limit is violated.

v2: use XE_IOCTL_DBG() and drop duplicated check. (Ashutosh)

Fixes: c8507a25cebd ("drm/xe/oa/uapi: Define and parse OA sync properties")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index cc48663c2b48..92aa25fc0422 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1254,6 +1254,9 @@ static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
 static int xe_oa_set_prop_num_syncs(struct xe_oa *oa, u64 value,
 				    struct xe_oa_open_param *param)
 {
+	if (XE_IOCTL_DBG(oa->xe, value > DRM_XE_MAX_SYNCS))
+		return -EINVAL;
+
 	param->num_syncs = value;
 	return 0;
 }
-- 
2.50.1

