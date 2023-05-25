Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92811C7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFCA10E780;
	Thu, 25 May 2023 21:34:42 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1CD10E780
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050479; x=1716586479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=74eTHo/yJj+OJL3l6T/X0ZQH1Va8zcy8AxhoGPjbm/U=;
 b=At0+0tmSjP27TdboFo76eUs4bo3OlUYdJvh78N8jjuqhcobMp2yL8dxW
 XnWg94H94ZDvt13WWcBhibKVyXY7ci5GVRG74X5GHgafhMixooyqBMnUQ
 GsoXN9ArLuLO975pyJgmHOT2x9X+bkDWteC3QhGxT7hCyT/2zQSCDgRIT
 AyLBQusSTuPm/rymM0zKw4DYhEcvA+yrnaTHecsDKhDFsqsdQssrWZ0/t
 qDcEE9GvChOj4bhfj2EAaoODfm2BW+7GXpoiwUgfy8OZceZAJ0Cegg7eB
 LagX1pkSpw6i+csoh22hop8yCUcF4HB/iSqGpQO+GSSFhZ4sbWYepICPl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377900"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377900"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970729"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970729"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:33:49 -0700
Message-Id: <20230525213407.3907094-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525213407.3907094-1-lucas.demarchi@intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 03/21] drm/xe/rtp: Replace XE_WARN_ON
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that rule_matches() always has an xe pointer, replace the XE_WARN_ON
with the more appropriate drm_warn().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 5be25fe0e8e4..5dcdfe45f0cb 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -84,7 +84,9 @@ static bool rule_matches(const struct xe_device *xe,
 			match = r->match_func(gt, hwe);
 			break;
 		default:
-			XE_WARN_ON(r->match_type);
+			drm_warn(&xe->drm, "Invalid RTP match %u\n",
+				 r->match_type);
+			match = false;
 		}
 
 		if (!match)
-- 
2.40.1

