Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6BACE8373
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 16:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30F010E55F;
	Mon, 30 Sep 2024 16:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOlGF/V4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB5F10E54E;
 Mon, 30 Sep 2024 16:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727714051; x=1759250051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/1aIVStuW8l+3g9dwYtksDvtnoCYVaR/peVmREJWaog=;
 b=VOlGF/V47/Oi0Kt8m+ndbpk7UIG5XXIQpREJFHhNO4j2tx8JcYul3mgn
 S1BT/eYjDGaJ3jeoF1Eetmdk4PrUMs4rW7mYRv3/dursaP5Mwn7wAWYry
 ThKXV2YMyDJ4SfNRyE6NF2IV6AbFHniRvTXPOlLFOsUtZfzOTdd3eHB0N
 3RsNtgy0QdUmBTp5R0zYlQfu0tt6PoZhX7+RcYA1HbqrSOcxlYRqec09R
 JtGEsBlmo4ev6vKGzSEKKPBTVx6LYRxO+Hl+RQlwAA8w6/dYIdL3Ebfy5
 CRGXGwwbAZi94482ATSwYZ61Qh6GC9xjKZQxHErc7Kjb4NhggGsn8nReY A==;
X-CSE-ConnectionGUID: X/w7tR4vS2qU4uhz3qkG/w==
X-CSE-MsgGUID: 8DUIjosxSH2UYdBObRON0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30700548"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="30700548"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 09:34:10 -0700
X-CSE-ConnectionGUID: MWpNikhPRlOcrS6pvK6Hlg==
X-CSE-MsgGUID: JTId4ECjSbujvfkwFfxIMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="110839246"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 09:34:09 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, suraj.kandpal@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 10/13] drm/i915/dp: Simplify helper to get slice count with
 joiner
Date: Mon, 30 Sep 2024 22:05:46 +0530
Message-ID: <20240930163549.416410-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930163549.416410-1-ankit.k.nautiyal@intel.com>
References: <20240930163549.416410-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

When bigjoiner is used, we need at least 2 dsc slices per pipe.
Modify the condition in intel_dp_dsc_get_slice_count() to reflect the
same.

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d8a4a6fa1514..8e091f74eb9a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1022,8 +1022,12 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
 		    drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd, false))
 			break;
 
-		/* big joiner needs small joiner to be enabled */
-		if (num_joined_pipes == 2 && test_slice_count < 4)
+		 /*
+		  * Bigjoiner needs small joiner to be enabled.
+		  * So there should be at least 2 dsc slices per pipe,
+		  * whenever bigjoiner is enabled.
+		  */
+		if (num_joined_pipes > 1 && valid_dsc_slicecount[i] < 2)
 			continue;
 
 		if (min_slice_count <= test_slice_count)
-- 
2.45.2

