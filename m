Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76963C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 11:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E8110E730;
	Tue, 15 Apr 2025 11:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3FtVfKq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0237B10E730
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744714819; x=1776250819;
 h=resent-to:resent-from:resent-date:resent-message-id:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=LT5PoLBy1nKQPSlnTCt2kkh9xoOP1gjQsiviCp6yTUM=;
 b=k3FtVfKqig4zvEf1HTOBRamB9eDd6BXha9gtajm2kkNiUbkM432vzhRv
 BTg4TUZs4t3lLRj683yI9KZ24zyvp6D2PLsXe74I+i07gTxWrFK9Erk09
 VSR/alhSmfIGSliQATmwNY6D5Ngd/VM9sbZ8vmdzgutK6NYcuJoTuFuuo
 nwT3psnP/3jxGm0Ket56ApD7Y7k8BLD1yz1HArGS+/BY4a7UdIUB/nBvC
 uvXvFFuW5eJVjewHUgP5dJAIebqsqXW0JuQ22Vpj2HqbdBiQNXyg5FG9w
 DLM3koaKRWrFJ9gd08YsI5gRFskU11XEZyPHiljgmc70gdCNpQ2+LA9jz Q==;
X-CSE-ConnectionGUID: F9xS3B6jQJmIl58d0IMU2Q==
X-CSE-MsgGUID: 99XXnJ39Qk6cmoWbu9dl8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45450295"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45450295"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:00:18 -0700
X-CSE-ConnectionGUID: EjINSL/MQVqUQdcFM4L+lA==
X-CSE-MsgGUID: M0F+bV/QTuigddEo2MkwaA==
X-ExtLoopCount2: 2 from 10.245.246.35
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135159809"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.35])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:00:16 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: intel-xe@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Tue, 15 Apr 2025 14:00:13 +0300
Resent-Message-ID: <87h62pr8oy.fsf@intel.com>
Received: from DM4PR11MB8178.namprd11.prod.outlook.com (2603:10b6:8:18f::20)
 by PH7PR11MB6428.namprd11.prod.outlook.com with HTTPS; Mon, 14 Apr 2025
 12:33:40 +0000
Received: from SA0PR11CA0071.namprd11.prod.outlook.com (2603:10b6:806:d2::16)
 by DM4PR11MB8178.namprd11.prod.outlook.com (2603:10b6:8:18f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 12:33:38 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:d2:cafe::a1) by SA0PR11CA0071.outlook.office365.com
 (2603:10b6:806:d2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 12:33:38 +0000
Authentication-Results: spf=fail (sender IP is 192.55.55.70)
 smtp.mailfrom=intel.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=intel.com;
Received: from edgegateway.intel.com (192.55.55.70) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 12:33:38 +0000
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 edgegateway.intel.com (10.1.192.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 05:33:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 05:33:30 -0700
Received: from orviesa004.jf.intel.com (10.64.159.144) by
 FMSMSX902.amr.corp.intel.com (10.18.84.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 05:33:30 -0700
X-CSE-ConnectionGUID: xRRiIeWNTIOkCG7JzMQb/w==
X-CSE-MsgGUID: giyuzuwYQXyfX/ZWBDAEfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134781630"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205]) by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 05:33:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <jani.nikula@intel.com>
Subject: [PATCH 3/3] drm/i915/pch: abstract fake PCH detection better
Date: Mon, 14 Apr 2025 15:33:09 +0300
Message-ID: <603a303f682d970787eecb10d9427ed1b65e2140.1744633934.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1744633934.git.jani.nikula@intel.com>
References: <cover.1744633934.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-OrganizationHeadersPreserved: fmsmsx903.amr.corp.intel.com
X-MS-Exchange-Organization-ExpirationStartTime: 14 Apr 2025 12:33:38.7268 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: fcce5286-0dbc-4442-a70a-08dd7b509533
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Exchange-Organization-AuthSource: fmsmsx902.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-SCL: 1
X-CrossPremisesHeadersPromoted: SA2PEPF000015CA.namprd03.prod.outlook.com
X-CrossPremisesHeadersFiltered: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|DM4PR11MB8178:EE_|PH7PR11MB6428:EE_
X-OriginatorOrg: intel.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: fcce5286-0dbc-4442-a70a-08dd7b509533
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|366016|7053199007|41050700001; 
X-Forefront-Antispam-Report: CIP:192.55.55.70; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:edgegateway.intel.com; PTR:edgegateway.intel.com;
 CAT:NONE; SFS:(13230040)(82310400026)(366016)(7053199007)(41050700001);
 DIR:INT; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 12:33:38.6018 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcce5286-0dbc-4442-a70a-08dd7b509533
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=46c98d88-e344-4ed4-8496-4ed7712e255d; Ip=[192.55.55.70];
 Helo=[edgegateway.intel.com]
X-MS-Exchange-CrossTenant-AuthSource: fmsmsx902.amr.corp.intel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8178
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.4456943
X-MS-Exchange-Processed-By-BccFoldering: 15.20.8632.030
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910005)(944506478)(944626604)(920097)(425001)(930097)(140003); 
X-Microsoft-Antispam-Message-Info: pSjn8b/a1dmaWztEvil9096VAPtvwB3sH4AzHVTPxHGRZxJb3UuLH3E6E58gut+asvJG6SMqfS7oDFi4NoOBUd8aUGpZykUp0LkatcN4ISA1S1h8Tl+IGCNVY2dVSb6zq3Ax/k94efo71tFp+3AL2Ur+zaI8zsBjtp0NqpvKVYszIaI707bBycCaYW8HWZFy/bchVEFKjFc3M9sNtZcfEvN3MxhuYRi/o/oTjLWdkDsU6kS1lgF1utQR0W5EvV8jXkGUMS9w/xe7gJN9ogG6Deubku8ARAsRxO/2rPdS9i57PR2ErWAhFc7vY0UR3XWW6YU+bCNntWdjh/7i8DXneZV2N4faOKGQoT/MlZAqgJ60mq08WOeoybdMWAGzb1tprbOW4tO8tTMY+WEDgeF4C6KsJfEltlQNfKBlPCkT+F8efK0eBPQZHlxv/xdsZ8jXWoesS7cwkfcn7oDUMluFLmavSVKqsH7KtgrD+y+Y2zu6ppm3kQNkX5afQG+NjerVl9GrM5HuClJsD/BNN/NA5W+f9wZvHTOWXHntft5zLLudCgq08T9s0uiDfe0cuPdG+cw9QlWVQ3fUNo/aOQaWx+cOjBSgp/BJA6pzKOz4Qj3yViI66VgWsUGPspH3PpEYfKVAAVYEcsd7WQrpLLxCmdOk8h53pFKe/SjcqYgN8DnqhHWna0W/u2WNjitrL6GPqP1RoH/pzX4E605oj05Ul+x5wUKsThfTSBMFhFDxVfNd8jBPQmzP5pE2ShHtiNB6QVStMrksC0cFmPMFakLbZYL+A+g+5ahjMdoKpNHk/5t5YRFF7klDcwULHiMXBWk8p9YMzxWKWWmleEk8Nr6KCA==
MIME-Version: 1.0
X-TUID: v6p/KMVe5up7
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
Message-ID: <20250414123309.y4SsskMtWtR50ZL0qgFglWYCdTzvictOmBmmELzDvdo@z>

Abstract detection of platforms with south display on the same PCI
device or SoC die as north display, and all around clarify what this
means. Debug log about it for good measure.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pch.c | 47 ++++++++++++++----------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pch.c b/drivers/gpu/drm/i915/display/intel_pch.c
index fec1919e5386..5035b63a4889 100644
--- a/drivers/gpu/drm/i915/display/intel_pch.c
+++ b/drivers/gpu/drm/i915/display/intel_pch.c
@@ -39,6 +39,28 @@
 #define INTEL_PCH_P3X_DEVICE_ID_TYPE		0x7000
 #define INTEL_PCH_QEMU_DEVICE_ID_TYPE		0x2900 /* qemu q35 has 2918 */
 
+/*
+ * Check for platforms where the south display is on the same PCI device or SoC
+ * die as the north display. The PCH (if it even exists) is not involved in
+ * display. Return a fake PCH type for south display handling on these
+ * platforms, without actually detecting the PCH, and PCH_NONE otherwise.
+ */
+static enum intel_pch intel_pch_fake_for_south_display(struct intel_display *display)
+{
+	enum intel_pch pch_type = PCH_NONE;
+
+	if (DISPLAY_VER(display) >= 20)
+		pch_type = PCH_LNL;
+	else if (display->platform.battlemage || display->platform.meteorlake)
+		pch_type = PCH_MTL;
+	else if (display->platform.dg2)
+		pch_type = PCH_DG2;
+	else if (display->platform.dg1)
+		pch_type = PCH_DG1;
+
+	return pch_type;
+}
+
 /* Map PCH device id to PCH type, or PCH_NONE if unknown. */
 static enum intel_pch
 intel_pch_type(const struct intel_display *display, unsigned short id)
@@ -258,25 +280,12 @@ void intel_pch_detect(struct intel_display *display)
 	unsigned short id;
 	enum intel_pch pch_type;
 
-	/*
-	 * South display engine on the same PCI device: just assign the fake
-	 * PCH.
-	 */
-	if (DISPLAY_VER(display) >= 20) {
-		display->pch_type = PCH_LNL;
-		return;
-	} else if (display->platform.battlemage || display->platform.meteorlake) {
-		/*
-		 * Both north display and south display are on the SoC die.
-		 * The real PCH (if it even exists) is uninvolved in display.
-		 */
-		display->pch_type = PCH_MTL;
-		return;
-	} else if (display->platform.dg2) {
-		display->pch_type = PCH_DG2;
-		return;
-	} else if (display->platform.dg1) {
-		display->pch_type = PCH_DG1;
+	pch_type = intel_pch_fake_for_south_display(display);
+	if (pch_type != PCH_NONE) {
+		display->pch_type = pch_type;
+		drm_dbg_kms(display->drm,
+			    "PCH not involved in display, using fake PCH type %d for south display\n",
+			    pch_type);
 		return;
 	}
 
-- 
2.39.5

