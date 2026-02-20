Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5738C5AD68
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D3310E837;
	Fri, 20 Feb 2026 17:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVikYsN5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9120B10E81C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608498; x=1803144498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=EpIum5GoKyLPV+06xSTaZGo9748pFqBnkafP4NCtd0E=;
 b=EVikYsN54ZRMVAXTwSoqqAQ7C8SKSB5WjftFPe5dXnpRwCc1/9hLpkk4
 wuzw5bYpEWlqdAVgtc+2Ytcel/ffiyIG9P9MggzJqUiGNd5BZVZM9N7Er
 sQx4MCYn9lAxPm5GbYOTOTNVfr6l9mwiw8cPNrvGjycMxYJz7rkS1R9pd
 SRZ9Q040Hv2at6aTQLVV2MzCezie5mVS62aDtqmO1s4H60r1Y1IJ+BNJb
 Sntvv3aDoEpHIfcDz9lxe+MNaAa1CVyDJcptvbCDuxmW9TWvSb++d+vmH
 AsKtB7ZlvxZU42vHoRQOOQONDkVv5q2YYJflZN8HibrdjrQKMDeeFik3c Q==;
X-CSE-ConnectionGUID: TTwuV53JRmSXj3zEu0p2cw==
X-CSE-MsgGUID: KyU20rKVQV+NfQMEii9c+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606752"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606752"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:18 -0800
X-CSE-ConnectionGUID: X/xoQ+YIQ0uaDX/+AOMQTw==
X-CSE-MsgGUID: odb98hUSR5S+b4pIxuzMxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138739"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:44 -0800
Subject: [PATCH v2 22/23] drm/xe/wa_oob: Consolidate some OOB rules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-22-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2888;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=EpIum5GoKyLPV+06xSTaZGo9748pFqBnkafP4NCtd0E=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmvrfSBy0pV+pv5wb8VdqTbbJzUFZ998wx42
 n5r1zcGyNOJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrwAKCRBNeSQFyHKQ
 BIVWD/4uLpBn1BcyuJ00B2VQ0GT5pTQII9vvGyczcWikR8+EI/2J0Huu3vmX4f3QSClavPxdM+c
 Y2wgR9iMLVGarx4UUhXM5WD0kwHSeqJjdryhVqR5C3brjnTydRS80P4Eds/CbQhCQV+5S3VYw/3
 K91673CjV5UhWZJyvxug3Ja4KEFf/KKUjoMCOMKXCIgDY1WtqdzBHtJtdAlkevpiE+nIchjU1BI
 LZCNa04DMDSfW7CZAaZS3LKRcDv81EwQAoEk00UriEusW6iFCkFSTGQ56K2EhOJ7Jti6LSrKj/H
 YUN9U130DH0H8JJ9tWNJBRTvT7q2VY8kcMFgupEV2z8dIhG2SvOCpc9lUZnDKWKoHP6tWOAZCqZ
 wy+v54CqS98QUN5PS1Nc9rA0rozysXzntaHamDI37DlkDBWdol7/gYJJiNU0+Wz+yNf2XHoFvDe
 IHYg00QVDoPET/X2j0Gev5PNRe7lu+OcE4XN5I4tS1GKUf5ZjzG0GywS1ye1UtvAB/yP4MjiwIT
 UOFn8eqg7h/R6YVpbMCBmR8edN32XcAkaj+vw/65gHmIwBfrBznzMLaJlhWHEYdh3QVuoG9pVA9
 CmzeG1u398SBaBrQjstHh1iikKtWP6VpwTukxAoayJoSsjgo7n3f8mFiMP2Wk8U7kbi3N3xlbjG
 SG24zS5fLFesJfA==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Given the new policy of allowing graphics/media IP ranges to extend over
unused IP versions, we can consolidate some of the OOB workaround rules
and simplify the table.  If new IP variants eventually show up that use
these unused versions (e.g., media version 30.01, graphics versions
20.03 / 30.02, etc.), and if an existing workaround does not extend to
that new intermediate version, the ranges will be split back apart as
part of the enablement work for that new IP version.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index c3222d9504889b5175fdfa73db0bf4e9910a277d..80b54b195f20c372a6816ce988b5e7e0b75270c2 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -24,18 +24,9 @@
 		MEDIA_VERSION(2000)
 16022287689	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
-13011645652	GRAPHICS_VERSION(2004)
-		GRAPHICS_VERSION_RANGE(3000, 3001)
-		GRAPHICS_VERSION(3003)
-		GRAPHICS_VERSION_RANGE(3004, 3005)
-14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)
-		GRAPHICS_VERSION(2004)
-		GRAPHICS_VERSION_RANGE(3000, 3005)
-22019794406	GRAPHICS_VERSION_RANGE(2001, 2002)
-		GRAPHICS_VERSION(2004)
-		GRAPHICS_VERSION_RANGE(3000, 3001)
-		GRAPHICS_VERSION(3003)
-		GRAPHICS_VERSION_RANGE(3004, 3005)
+13011645652	GRAPHICS_VERSION_RANGE(2004, 3005)
+14022293748	GRAPHICS_VERSION_RANGE(2001, 3005)
+22019794406	GRAPHICS_VERSION_RANGE(2001, 3005)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
@@ -52,18 +43,12 @@
 18013179988	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 1274)
 1508761755	GRAPHICS_VERSION(1255)
-16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
-		MEDIA_VERSION_RANGE(1301, 3000)
-		MEDIA_VERSION(3002)
-		GRAPHICS_VERSION_RANGE(3003, 3005)
-16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
-		MEDIA_VERSION_RANGE(1300, 3000)
-		MEDIA_VERSION(3002)
-		GRAPHICS_VERSION_RANGE(3003, 3005)
+16023105232	GRAPHICS_VERSION_RANGE(2001, 3005)
+		MEDIA_VERSION_RANGE(1301, 3002)
+16026508708	GRAPHICS_VERSION_RANGE(1200, 3005)
+		MEDIA_VERSION_RANGE(1300, 3002)
 14020001231	GRAPHICS_VERSION_RANGE(2001,2004), FUNC(xe_rtp_match_psmi_enabled)
-		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
-		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)
-		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
+		MEDIA_VERSION_RANGE(2000, 3002), FUNC(xe_rtp_match_psmi_enabled)
 16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
 

-- 
2.53.0

