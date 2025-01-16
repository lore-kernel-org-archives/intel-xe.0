Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D1EC02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 23:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F205D10E0A4;
	Thu, 16 Jan 2025 23:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CiYNGQR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21C110EA22
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 23:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737068862; x=1768604862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uAEpU2K02sNQ8ZGhjJ+Kr6EIIuyqU2W6NIkawtiuPrY=;
 b=CiYNGQR58M3hyBtPD8yD8R30EbhYr7qBpnQOL0q4tuF3bmJjMBFL/ChA
 Pl8lgyEqXbJO5EDaumXiyEebzXz14SXMRqbFloU9Ujf6zcU2h/mDE5bcV
 1MkhUOxdg3gRy6oDQhHDSpjSjC/aVqvG1gDYfzP+C4G7Ak4Ar2JooNYbS
 HZamUu17mFz3DMuEyDt63t72oYE7R22nIhhzdPv7wXF9FUfSO7g1d2qGP
 tm6E0hcvaWPkZI0UzBsfBlx26pIY77bM/6ILG0NantNLnbBkHy9wlfVTo
 UfhwWFutl1dXSo4XnueLKptRUIIz4x/O8Xvw753xwsp2obcCZSbq14cHO Q==;
X-CSE-ConnectionGUID: JV3zPSfnSIq9tZgblZsHcQ==
X-CSE-MsgGUID: YzdAKB5HQr61RAsEtA3R2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37364117"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37364117"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:41 -0800
X-CSE-ConnectionGUID: x2rEFRgnQTSoNub245nK6A==
X-CSE-MsgGUID: LvK5eZEmRIySvK27MXLVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="136474345"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:41 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v13 1/7] perf/core: Add PMU_EVENT_ATTR_ID_STRING
Date: Thu, 16 Jan 2025 15:07:12 -0800
Message-ID: <20250116230718.82460-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250116230718.82460-1-lucas.demarchi@intel.com>
References: <20250116230718.82460-1-lucas.demarchi@intel.com>
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

struct perf_pmu_events_attr has both id and event_str however zeroes
the id and only set event_str. Add another macro that allows to set both
so drivers can make use of them. The id is useful for determining the
visibility of the attributes without resorting to creating separate
groups passed via update_attr, while the event_str is still useful for
attributes like *.unit or *.scale.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/perf_event.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index cb99ec8c9e96f..423f21b51cb0f 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1923,13 +1923,16 @@ static struct perf_pmu_events_attr _var = {				\
 	.id   =  _id,							\
 };
 
-#define PMU_EVENT_ATTR_STRING(_name, _var, _str)			    \
+#define PMU_EVENT_ATTR_ID_STRING(_name, _var, _id, _str)		    \
 static struct perf_pmu_events_attr _var = {				    \
 	.attr		= __ATTR(_name, 0444, perf_event_sysfs_show, NULL), \
-	.id		= 0,						    \
+	.id		= _id,						    \
 	.event_str	= _str,						    \
 };
 
+#define PMU_EVENT_ATTR_STRING(_name, _var, _str)			\
+	PMU_EVENT_ATTR_ID_STRING(_name, _var, 0, _str)
+
 #define PMU_EVENT_ATTR_ID(_name, _show, _id)				\
 	(&((struct perf_pmu_events_attr[]) {				\
 		{ .attr = __ATTR(_name, 0444, _show, NULL),		\
-- 
2.48.0

