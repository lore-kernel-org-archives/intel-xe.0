Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FE3EA4FBE
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F96F10E3AD;
	Mon, 23 Feb 2026 13:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FudybQjg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E17510E3AB;
 Mon, 23 Feb 2026 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771853408; x=1803389408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AagpAJJ9IVwA2esuYj993NoDdSnC4QUj+YjLBE7x7I0=;
 b=FudybQjgqNFzAUzCXtp3qxR7Ie5lmrq3IsylqqQCFoa66we2JBdmqdCu
 BbQM9lbXX2p/JBlIOJXuYqjFQ3kPnB0Fkpw18RgfwleUDt4Ophs9yR1Ro
 24Zikoykg63cxgyzSLP1jmqUX9JcLIjm6LtFsIX0DQnlzNLjp3rmzisHe
 3fxOo7w9SdvTXbVbM5mapEuNonLr1cWUttoV9tOHbRoY5SlY5gFC3xgSX
 BGBgCsod+OWtJ97XkiaDLxGppn9wKp2yA/UmkAtVDGTtM5TQ4tuftpiMN
 G/2SHN12Ht+ifcFKrclzX1esRuSSUbDWrK+gkzjPQSwMbToALKL+Fpf1k g==;
X-CSE-ConnectionGUID: 7UG+vS5MSkOIjJZ5Syzk7A==
X-CSE-MsgGUID: Nzsi1ZhbRXesdYOOUa8v3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72724166"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72724166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:30:08 -0800
X-CSE-ConnectionGUID: rDWNehH0TwGwVSXc+XOPfQ==
X-CSE-MsgGUID: pwMm77fjSb2xN5pqH8efEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215580350"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:30:06 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 05/14] include/drm/display/dp: Add field for storing AS SDP
 version
Date: Mon, 23 Feb 2026 18:44:17 +0530
Message-ID: <20260223131426.1638946-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223131426.1638946-1-ankit.k.nautiyal@intel.com>
References: <20251111093007.3771409-3-ankit.k.nautiyal@intel.com>
 <20260223131426.1638946-1-ankit.k.nautiyal@intel.com>
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

Add a new member to store Adaptive Sync SDP version and include it in AS
SDP logs.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 1 +
 include/drm/display/drm_dp_helper.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index a697cc227e28..9469943d8194 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3507,6 +3507,7 @@ void drm_dp_as_sdp_log(struct drm_printer *p, const struct drm_dp_as_sdp *as_sdp
 {
 	drm_printf(p, "DP SDP: AS_SDP, revision %u, length %u\n",
 		   as_sdp->revision, as_sdp->length);
+	drm_printf(p, "    version: %d\n", as_sdp->version);
 	drm_printf(p, "    vtotal: %d\n", as_sdp->vtotal);
 	drm_printf(p, "    target_rr: %d\n", as_sdp->target_rr);
 	drm_printf(p, "    duration_incr_ms: %d\n", as_sdp->duration_incr_ms);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 1d0acd58f486..c71787fc31c1 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -120,6 +120,7 @@ struct drm_dp_as_sdp {
 	unsigned char sdp_type;
 	unsigned char revision;
 	unsigned char length;
+	int version;
 	int vtotal;
 	int target_rr;
 	int duration_incr_ms;
-- 
2.45.2

