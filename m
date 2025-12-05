Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B24DD37485
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 19:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBD610EBAC;
	Fri,  5 Dec 2025 19:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdZVoruC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333CE10EBAB
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 19:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764961716; x=1796497716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uucETvw7Z7ITi87oF9D7c7f/RlanIgc35fneVQsQlSM=;
 b=kdZVoruCOTPWyZ6S34MNuTzR3x8r6AUFSai7Hd3+scvj9B42cRPBiuhE
 e778NkAW7WZ6v8mH0XAv6vPeYXAbrClIKTNWqULIgbI8RsOTO0q1YofX3
 6UaWgOWx+gPzILExlOLa2cRF9kUgpXyX91ORP/j98oq2W0awkbwD6dCKl
 kdgw6hnIT9Fh4n6mh6WJycXstTNEiJ6VfVAo5I6KrKkL9SlR74nh/S3bk
 irN3mtX2lEd+Po5KWDyL9+e9cV+kuGShsBM9v3R9S0yMEy5dU/IBJAuZ+
 cLLToSRFKrulPUIL3KCWxRm+gAWnA0pJ8OXX3HYJGL/l+8woR8YoWxvUN w==;
X-CSE-ConnectionGUID: g7h5oZKWQuyIVO0a/bJ2sQ==
X-CSE-MsgGUID: jo0Rywc1TSu2qCG2n5tczQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66188658"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66188658"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:08:36 -0800
X-CSE-ConnectionGUID: cqEIfA2zSuOusnd8NUkb1g==
X-CSE-MsgGUID: quv8BYyjTEOJHt9WM35sMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="226013775"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa002.jf.intel.com with ESMTP; 05 Dec 2025 11:08:35 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 3/3] drm/xe/oa: Limit num_syncs to prevent oversized
 allocations
Date: Fri,  5 Dec 2025 19:05:10 +0000
Message-ID: <20251205190506.2426471-8-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251205190506.2426471-5-shuicheng.lin@intel.com>
References: <20251205190506.2426471-5-shuicheng.lin@intel.com>
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

Add checks to ensure that num_syncs does not exceed XE_MAX_SYNCS,
returning -EINVAL when the limit is violated.

Fixes: c8507a25cebd ("drm/xe/oa/uapi: Define and parse OA sync properties")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index cc48663c2b48..7477c27a4ba2 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1254,6 +1254,11 @@ static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
 static int xe_oa_set_prop_num_syncs(struct xe_oa *oa, u64 value,
 				    struct xe_oa_open_param *param)
 {
+	if (value > XE_MAX_SYNCS) {
+		drm_dbg(&oa->xe->drm, "num_syncs %llu must be <= %u\n",
+			value, XE_MAX_SYNCS);
+		return -EINVAL;
+	}
 	param->num_syncs = value;
 	return 0;
 }
@@ -1404,6 +1409,12 @@ static int xe_oa_parse_syncs(struct xe_oa *oa,
 	}
 
 	if (param->num_syncs) {
+		if (param->num_syncs > XE_MAX_SYNCS) {
+			drm_dbg(&oa->xe->drm, "num_syncs %d must be <= %u\n",
+				param->num_syncs, XE_MAX_SYNCS);
+			ret = -EINVAL;
+			goto exit;
+		}
 		param->syncs = kcalloc(param->num_syncs, sizeof(*param->syncs), GFP_KERNEL);
 		if (!param->syncs) {
 			ret = -ENOMEM;
-- 
2.50.1

