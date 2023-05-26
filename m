Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC19C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5383310E823;
	Fri, 26 May 2023 16:44:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0DE10E826
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119453; x=1716655453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hTcSaAVg+B8QbOUWj36wPhgCqa1r+5gOABrUWw231mg=;
 b=IP42GGcVtdcwDDV8TWbH5lonMh5tZW87M53nCUzGovVM2r+WEy2ggU4y
 9wGM6eucTfdLPMUiqS/3OxheRzjvFE6xmOODD9dWP2uGjP2gP00DATvc9
 XNjjH27heRrOd3n4MpUMF3eTMFdl1M3iHWOi62D1hOPVA1TECoP/ES5UK
 +WdmxfzlnL3NGdp9S0esFO0E5ut9eFn1YapXmfY18kRbkLM/ylsOWe6wZ
 7MHO/niZ7qhg13lmUG4zVmvOqsCKj3dRh0L32olbqDebJveVHi+B9lu5x
 O8fo5y8A0a/IZEI39WQH9FRMV8dIbJwXtbqI51BxNsc3nMFMpyAxBAnGW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628374"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628374"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151454"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151454"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:40 -0700
Message-Id: <20230526164358.86393-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526164358.86393-1-lucas.demarchi@intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 03/21] drm/xe/rtp: Replace XE_WARN_ON
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

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

