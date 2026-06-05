Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AD4CD6E7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 15:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D02D10ED0C;
	Fri,  5 Jun 2026 15:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9f6mIus";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA8610E7F2
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780673126; x=1812209126;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=OTMLzI1XlaZDWnSTeUYaKWyeBXEZYvregqnHEncWO0E=;
 b=R9f6mIusguqBLbFSiun/RnIr9kmQ9T9U1iOLPF09ccWRMrtm1h1zNthF
 wjmzbqLi/RBka5zblwBhuZpAPqRVDiyuJaeSEYbqIgH3L0w/yMcBVHA+E
 Lh8mCSMCYvkpDvi9PnIMqbyKusC4tcLzN3hS6cHSeeUDGHdQtEBXmcxC1
 Q/b2UBb2+0jdcvk9h6AA0q08qXkoloAeTQgUlHaEF+HNql8uoZ2lnwZuh
 SlBPQm4QYbs+HHQuMQbSeQ7GuyJjlGCcm1fQRwAyacybj3Oq7HqhMzT+h
 iFdpsalBbR8WQB2P2Ak9dK9OH5QK2+jO1QPn/pfeaDrqzU+9rxzQ4aP5k g==;
X-CSE-ConnectionGUID: 6zaAs4wnRZaN9UceDKdhHQ==
X-CSE-MsgGUID: Pm6MTUDLQkOD0csuUtsp7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81363898"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81363898"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 08:25:26 -0700
X-CSE-ConnectionGUID: 2Nw4AmcoQ3ybcKx5Kxn7JA==
X-CSE-MsgGUID: KY/cwqDGTIiH8Zq3wvYBYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="242396887"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 08:25:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 08:25:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 08:25:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 08:25:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHDwFT5iR8VoMeC+ePcBRhHFGiAbsPVsSLqXbc7EB0LFVrCuExG+BQRTRbS6xojDyCt9bJmh/NGSslWF3mL7918vYXDxRmQQ9eBKEOdHpwFw0T+BVvb40OSJEHfN3JxQORaaoNSYN9O/MMVtSD+HxFKGEizt7M5YV1g1p400BQI81U3nJWCXybuYbwGmEF4YAYPmx6Oz2RwxelXInp0pmROO8uwI2RFZYQIxIo0yr7utd6sKbD3LJz2bzQlo09eDiTSs9KB50NzCbfulcqfNGNzSL78Pq3rJKl5G+lX0FmaxOuhtvzXHP4kxGjqRMgNvRUkrPLDSo5XOxBJoq942sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHq9ohqIkSLmiAtP/zeC8HzJiZxaMXFaBdAyHlwUwK8=;
 b=hhDEEdf9gasHQIoOA4o3PIWwKH+xTDhQrUlOgOBL9Cyr6frur/zVwyEzyujA3F3Q9ysOn3wwdjH0phqD/B3PNJeQCUAF129JEIfNf2D9jKhsGQcWd8f8+hyNfwOFIexJnA/AdEc8sROnlIYME4Wuq00nBD0Kw0AxxxXVMKpAU5MFGX1KtF5+6cxY0jnxw6yTFJ0ToUXGjmUNb9UP7su4bFQpQhrm4rGTjDYl7GN8NSbzYRwpkk/5QZem8fMA1Ra5yhJrsqmgn53Y9JBROZLyNb6gE3LHDRNjIKCn/4UuaDKpqlbZWSYIve7brHALlp9YX8MWJKDPnQ7Qxl7qG/xSpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DSVPR11MB9960.namprd11.prod.outlook.com (2603:10b6:8:3bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 15:25:24 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 15:25:23 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>
Subject: [PATCH] drm/xe: improve Kconfig.profile help text for scheduler
 timeouts
Date: Fri, 5 Jun 2026 10:09:52 -0400
Message-ID: <20260605140951.958172-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::12) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DSVPR11MB9960:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9c2613-afff-4a4f-fba2-08dec316a9aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: U+uozq+BDK1HcX/l2P+r0N+YMn0/WmIA1VCG+5Nq7ForMosdKmt+V34loMyW20l/ZXnfg/ufE1T11IR5Sc/qVXMq97YhDGAcRglOkldBSR9ggbkjxBsdRHGPX8oQRQeb3ieBVZE1at2c9iiFVs732fxSWeMg0yhhaq7vQZKdRq3TQZ6msx/RgXBAfMSpv6Ba3+wG9i+C8cIZ/SZPt8Xf9l8iSny/82NeA2hbetf79/gEtsrzp0EpBpg4cQUWK5d2144esWGK9pND/WMybAy2QKWCZu3FG0bgRDdc7kXs4AtTH4OC/wsbNy5TSSF8ZNNhdBKNVKKV+bXBBUCPzqxUZ4fuYNIoLNEjGccyh3MH86XhpLvHyS+1GRaG1CfBswpUKrNuplt7t248HpJhMGxz9pSe77Qgk5M0LC2LTtN34L9N6yB8J5Je8q0OiVbIhceTvQj1ccKMd0ofruHVPgmFwIQIOgOUapZBavMlVfc98bbD+qTTITskQVf20YrwwpJTXkUvP+iHjWOx5V/pI1ObB0GQxPPExAcuS3YWvH6PIKyxjfl4QBWFQ7Yh4CHTzMS0OZHfY6FIwvmgBw/Gayi3+eT9a0el78kBELPGMYoIFcdIYOLR8XB+ZhljHvJqTKYknQsRztTSKuMhw4EgeVNXn+72IH1uCEAL74Ezzo/FymD0HTXs4Jf5O9DXUmLiIa2M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4QF0EHzpWXqWKuaJ/NvKU7QCQPOAFK2Ogxt7vmPn43V2sRdAJBPjjaKDnVoX?=
 =?us-ascii?Q?OHR+Fbiz+TUeGRSpOuszFsGJ1mPmc7sPQVQoKYaquWmeJ+FW4CEFTmLRe75v?=
 =?us-ascii?Q?SvhArCfD2MbLlgfuhxhS2CQ8eJuqt6lWMeSpzVIo1zecDwZ2EzvhsHg+xCXN?=
 =?us-ascii?Q?CURVRCOSxpWhmJj+X7b4krEbMrjZc2eHlwMy4JzU/X+SMDMGw2bwrZKg9Fbu?=
 =?us-ascii?Q?NpRgkP3CbL/04ZdtuQEW13yhNDBAAcIrQSR0rjJrwAwr0FYZ11ZD7pNdiFsq?=
 =?us-ascii?Q?cCeUC0Wa1qceQXG+foUoFpkdecoXHsGnkLU0B5vzg6tVJMLq8XsJkcYssdHo?=
 =?us-ascii?Q?cNuipScnXiRzlK/34pHAIwmqzzpsj8pZm2M3h6iW10agYVIbEEHjzHcSDzlL?=
 =?us-ascii?Q?7srCbDxwNX/JAr2IAKlxS3lVQTthKqwd8IZl/kDaFtCIVAd/5ikhDgT+sHkB?=
 =?us-ascii?Q?Vo2ltAj+AYyPLwI1i6KswXuoOLmvMmZF77F1kMqPGZhnUFKhZjHS8TNH1FCI?=
 =?us-ascii?Q?rucZhjZssSa/U1t4m1lYZIZFsHuJC5nlA8C3JXTeGHcbYPV7kF4LTjcQqHnu?=
 =?us-ascii?Q?Y5OMEigj+Y/OGWMr6B7w/WEHzioAXACtgX4HGBAtgOVVZHxSUFtUY+mEI6Nx?=
 =?us-ascii?Q?SjQmk6kLu3ue3T1vF+hiDfqeaZwVbz06MxNawEKttSQqY4YVpuFYq7xsOAhb?=
 =?us-ascii?Q?nnq32Qpn8fJ31O+1DP3JE5os/ZuJyGKuBchs7jTnXhXjBKv0Pv7x4wFPxtsf?=
 =?us-ascii?Q?tGYDo7RWpVIQzTH8CieV3ZKAemqY+IjyNDF9SUclgiH7AGHSGDPllRl1h5EL?=
 =?us-ascii?Q?pSYENqhTSkvLh76gFL5otS2YaneJKrDRb+LV6pcnAM0ydXRVNgaSKBoLqJtt?=
 =?us-ascii?Q?gdUSEPHWeGV7JY9Oxj2ooAuDQPlWIE0fqmQfPsbjLpfB0Qx7k+fR7pq3pG8a?=
 =?us-ascii?Q?XUArNCrvHzhGItkbPSIvIc5ak+x4vFgigrzxTJ2mWSLdri/pZq2Ht7YiJWky?=
 =?us-ascii?Q?2/Ctrk0fCZvH3bDLDmfqzOYpV+dkZOAPKdAoLSRA8Zh51MbM64hA4K2HWtCW?=
 =?us-ascii?Q?DAl9V0KaHnYEUiuRVAHIPf/K3IgWQmOBvVdhB1lguTklfw3E0z6V6D2jflQ9?=
 =?us-ascii?Q?Io9oHb4ApBeaKzNIXSG/JNZITEf8eP9w39X/33xd0cOA96VgBBlXXgfELbU0?=
 =?us-ascii?Q?iywJo0Np6ZtrrqSJ7JC/KDhHuxUeKXL6UW8mqhukenxS9lNwO9k09hO252Gm?=
 =?us-ascii?Q?QD4SYWuyGYeY2Qa02Dzl/qEtppnsuY9i2af7cr6+GT2xd6SCx2f+C7ZoPa5H?=
 =?us-ascii?Q?pf+yQ7F4IOWGqK2Kz7B4pYqaDvkxvp/fS4NcJ6GG3jgaNVFVmCRo2rjKrRLw?=
 =?us-ascii?Q?UQsCKU5SX2PK4K+q3y4I3IfQTXCKQtm2dc80ficF2UB7uX0+GV5MFl6sK/UZ?=
 =?us-ascii?Q?lmouLjGUVETie0I8FdwjhpzNLa9ceidE3GDcMXJg6LCKMO3+uDeLWDQKdDNR?=
 =?us-ascii?Q?2/rOLvua+vEhxKvqJSNGRs7fxylDyZqafTzEfxsW9SRSNC4o1YWxKkPpwtDD?=
 =?us-ascii?Q?CXpJ5SaSs4QVHCDKX6n9cQHmd1yjZ4opmFRPHEQ/xlCpnT2VOHGfZuy/+3Ck?=
 =?us-ascii?Q?pJ9upiZEO4oBf0e8hVpXvvphOUAijzR0ETGUgpAA3qZGYBtYqHA7Zfe7ZQcK?=
 =?us-ascii?Q?QwYlRKcaqvJhDLdd0E1NaEpkJg3Ei+jVk31H760n1RU4JcTUE9WyX4oFkirG?=
 =?us-ascii?Q?Ore/BeSsFw=3D=3D?=
X-Exchange-RoutingPolicyChecked: T1KtNJwth5s9KeT4BeZbGYi+QlCnhH4ruWrqDBY8pUz0IWYEMwldjkrfDTur735pWHcGUmYlQy/MFGBgV9PyKZEm4YaZgxTDlLCQIBS5grYT+Wplr0hgLXfCXsq4FazYB2TtIhVAKjOwG3mpbJ109GgNv1G86/dmgJHbNuyYRSrPboALMoNEwl2IscRLoCKhcNgOEALQ7yfgkOMAB4X0nNWrs3rDrxOPAXiIYAmZPSFM2cpb1eAM19lmTxzCkjUKPF8LqVyBsPC2c95RrqHS8vsjkU7gLuh1eihZNu28Xz3q4Ns/yEkaENjsTiUkyAUm9f7ump5My8/8wfwFdpaDYw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9c2613-afff-4a4f-fba2-08dec316a9aa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:25:23.8769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDSluJvaPWkYMUfmCB2+/ND+dqh/AJiw8QvXyQS6ndYWgDpru2D39JaNhiObRcV1Pmhung6TtfXhZNFxAAFfaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9960
X-OriginatorOrg: intel.com
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

The existing help texts for the JOB_TIMEOUT, TIMESLICE and PREEMPT_TIMEOUT
configs were brief and did not make the role of each symbol clear:

 - _MIN / _MAX: hard bounds on the per-engine-class timeout. They are
                enforced unconditionally by the sysfs knobs, and (for
                TIMESLICE, the only one exposed via the SET_PROPERTY UAPI)
                they also bound CAP_SYS_NICE requests when
                DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT is enabled.
 - PREEMPT_TIMEOUT: the boot-time default; the JOB_TIMEOUT and TIMESLICE
                    defaults are hardcoded in the driver, not configured
                    here.

Rewrite the help texts to reflect this, naming the relevant sysfs knobs
and UAPI property explicitly.

v2: Adjusted commit message based on Sashiko's review.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Assisted-by: GitHub-Copilot:claude-opus-4.8 #v2
Reviewed-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 71 +++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 7530df998148..e07517d120e0 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -1,50 +1,71 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE_JOB_TIMEOUT_MAX
-	int "Default max job timeout (ms)"
+	int "Hard upper limit for job timeout (ms)"
 	default 10000 # milliseconds
 	help
-	  Configures the default max job timeout after which job will
-	  be forcefully taken away from scheduler.
+	  Absolute upper bound (in milliseconds) for the per-engine-class job
+	  timeout. This is the maximum value that can be written to the sysfs
+	  job_timeout_ms knob, regardless of privileges. To raise this ceiling,
+	  increase this value and rebuild the kernel.
 config DRM_XE_JOB_TIMEOUT_MIN
-	int "Default min job timeout (ms)"
+	int "Hard lower limit for job timeout (ms)"
 	default 1 # milliseconds
 	help
-	  Configures the default min job timeout after which job will
-	  be forcefully taken away from scheduler.
+	  Absolute lower bound (in milliseconds) for the per-engine-class job
+	  timeout. This is the minimum value that can be written to the sysfs
+	  job_timeout_ms knob, regardless of privileges.
+
+	  Note: the job timeout default (5000 ms) is hardcoded in the driver
+	  and is not configurable here. Use the sysfs job_timeout_ms knob at
+	  runtime to change the engine-class default.
 config DRM_XE_TIMESLICE_MAX
-	int "Default max timeslice duration (us)"
+	int "Hard upper limit for timeslice duration (us)"
 	default 10000000 # microseconds
 	help
-	  Configures the default max timeslice duration between multiple
-	  contexts by guc scheduling.
+	  Absolute upper bound (in microseconds) for the timeslice duration.
+	  This caps both the sysfs timeslice_duration_us knob and the value
+	  accepted via the DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE UAPI for
+	  processes with CAP_SYS_NICE when DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	  is enabled.
 config DRM_XE_TIMESLICE_MIN
-	int "Default min timeslice duration (us)"
+	int "Hard lower limit for timeslice duration (us)"
 	default 1 # microseconds
 	help
-	  Configures the default min timeslice duration between multiple
-	  contexts by guc scheduling.
+	  Absolute lower bound (in microseconds) for the timeslice duration.
+	  This caps both the sysfs timeslice_duration_us knob and the value
+	  accepted via the DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE UAPI for
+	  processes with CAP_SYS_NICE when DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	  is enabled.
 config DRM_XE_PREEMPT_TIMEOUT
-	int "Preempt timeout (us, jiffy granularity)"
+	int "Default preempt timeout (us, jiffy granularity)"
 	default 640000 # microseconds
 	help
-	  How long to wait (in microseconds) for a preemption event to occur
-	  when submitting a new context. If the current context does not hit
-	  an arbitration point and yield to HW before the timer expires, the
-	  HW will be reset to allow the more important context to execute.
+	  Initial per-engine-class preemption timeout (in microseconds). This
+	  is the value the driver programs at boot; it can be changed at
+	  runtime via the sysfs preempt_timeout_us knob.
+
+	  This is how long the driver waits for the current context to reach
+	  an arbitration point and yield the GPU voluntarily when a
+	  higher-priority context becomes runnable. If the context does not
+	  yield before the timer expires, the HW is reset to allow the
+	  higher-priority context to execute.
+
+	  The range userspace may write via sysfs is bounded by
+	  DRM_XE_PREEMPT_TIMEOUT_MIN and DRM_XE_PREEMPT_TIMEOUT_MAX.
 config DRM_XE_PREEMPT_TIMEOUT_MAX
-	int "Default max preempt timeout (us)"
+	int "Hard upper limit for preempt timeout (us)"
 	default 10000000 # microseconds
 	help
-	  Configures the default max preempt timeout after which context
-	  will be forcefully taken away and higher priority context will
-	  run.
+	  Absolute upper bound (in microseconds) for the per-engine-class
+	  preemption timeout. This is the maximum value that can be written to
+	  the sysfs preempt_timeout_us knob, regardless of privileges.
 config DRM_XE_PREEMPT_TIMEOUT_MIN
-	int "Default min preempt timeout (us)"
+	int "Hard lower limit for preempt timeout (us)"
 	default 1 # microseconds
 	help
-	  Configures the default min preempt timeout after which context
-	  will be forcefully taken away and higher priority context will
-	  run.
+	  Absolute lower bound (in microseconds) for the per-engine-class
+	  preemption timeout. This is the minimum value that can be written to
+	  the sysfs preempt_timeout_us knob, regardless of privileges.
 config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
 	bool "Default configuration of limitation on scheduler timeout"
 	default y
-- 
2.54.0

