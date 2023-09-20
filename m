Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A835AC04FF7
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B74910E553;
	Wed, 20 Sep 2023 19:30:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D2E10E53F
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238220; x=1726774220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aSSxBiRzUitkGE8tsDNxlCTK4Ifs7a1liYx28+QN8dA=;
 b=Wra1aqmg432B2GZSIXc4v3lC6AyNojouom4B0IVhhfSFoMwzYSH2vozb
 /8zxvAMnGhgQxD4sDj8uQo2KQvacHsNNfHtTRg82nbAwTD9uWMn3RissL
 imZDGzLCS5gU1YGlFNDjM9r79x15yt+LpsQWaZqOJ8V+23p0ohRKY6Hu1
 Ix6Dq7OzQxPrc4OUtg2Zd60HKqKsbM61tacQAavxiGkD7F9B3b81DjRyj
 zyJ1vJKPsWYpUuCe8dS4pKH96u1GAzVemVyrdcsCTpAcm54Zvnx9/e891
 AhIk1/MI9qvZB3kPimlB7M0o2TBxtUk7YpQzIDZSLq3H4H2fprMWYArc7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359701236"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359701236"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870498633"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870498633"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeQmEzh+mEJAzosU4CywbRmAncgDuyhf+trgsBpz1YCVGqLT5loeSqbdXUiWdF0OmJDmXf69w1/MAOa9db9fHkB4LUJ7goW1I2WZXi/6yyLA4gr0IcWg4WwAllgIJ1vw3UaY1kgWB7ppo9PADKKlmX7Ib5njK9DYh75P2jmzbGzzEMqaJOO2tCkvvRQ3vjUnM4Ewh0sRg/q2ARgdiqJXu+GqC1Lzo0DsUGZlJBpOlAmvBNL/Hnlo1DfBfLpSFKZb6/FMr3IohG/83JtnmoDFKrMckZbsN2KqKuHV+j4FPuKZNrqF9xNRP0z8lsdZ7VFqSU++Jm8V0ibJ6TidbWLQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHGe5gA4ao1xvAye97g6M1Qd1qxS3CG+Zud9g6dGBfE=;
 b=ieHknvPquKGHep4EtmMG/jBl1cylvXRwDFFZJGBKDwn4oWVURV8W2XkIHkwWwc3Zv/0ktkvgfpubXmSKOgyHlK2tLpkjLBQTMDCzUO0JzvM95AYbfmp4gNwNxidn1mrqtF1+Eja2H3lIvUa2i8PRQrqoHr40/CYSeB+9LviukSNgwFIBQCItM6iyvV2OIIetoMyK1C+jBVCXnbbuIOyqBpU3xrfPsLzWxLjLzOUTbbfBuVlzqjPKyisS8qF96fa5BwK96oLRbJRJA2zFK9A6pWuo/MZznttJ15dKW5mzZOKfgFHVY1AHu8qxXlx3apYrJkm4DWdF5bP2PLGUQowtGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:26 -0400
Message-ID: <20230920192940.135004-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0021.prod.exchangelabs.com (2603:10b6:a02:80::34)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd7ea25-109d-44de-2d84-08dbba0fff31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cATZ9f7R4QoR8DjOaNksg29e04dnGuvhG6grum05RzXKRKg6R4IVyRdEOvZ8eFQhM9D0dL087iHZ0g4KJaQu+8RkK1mXM1x8WS04s2oWOv00lqCnGnO+QDEQVjLptMQdnwbu0OQDy5DMnXoBwVK4Wr5rlJtuy8zU8mcmbVQUVozXU61lpyDrDqqfYOVbRE6nNQR/cPGqOh4AGisOFX8WuWYHbyqH9JgNiF9nGNiCMf83ifLYbAOX5xLqbbyCF5hpQZbet5TQfgizsQl2al606YokcVrdJVN2moPJuKqACmw2Tu6hNy2gz6kiehe/AoUz2KGacRy9gXYr+cKIcE5+FnezIDjtxohZYUuo2e9d0hnvXcx58ZZGi0a3kukSaMURpCOr00ofvaZKpTnVufVsk0rmYAQkwcdyl4XiLcrwJICD2Sda6U+e7ZioUTijJmRYHZVIGbheb9UJSC7VF+NNx2hk2hHHNXA3yXOGW30rfEF5cd6aDwXh789ZwsE9cApc9BOc70a6dyoQZtkQrcXJbnlO3zoXm1sM4Br23lK1Bxm2QZf9IdN/9tHdWkxvsTo0BzRPSaLk9CpCvEI0MJAoSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(1800799009)(186009)(451199024)(2906002)(44832011)(5660300002)(4326008)(8676002)(8936002)(6916009)(1076003)(107886003)(41300700001)(6512007)(316002)(54906003)(66476007)(66946007)(6666004)(36756003)(6506007)(2616005)(83380400001)(26005)(66556008)(6486002)(478600001)(966005)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2NYTTlnUzI5c1p1cGVnQkswQ1V0QnFhQTBSUFFmUkVUZ0FMdzhxZDFrQ3dD?=
 =?utf-8?B?TU9DQVpqSDVSZE1LUGZsdzQrR0NyS1dVUzdCN0JUT1FwSFcwNmdsNStFLzdL?=
 =?utf-8?B?c0FSOFY3NXJBdjMvUkdlUlRpT0xBMWVrYkF4bndVV2xtVUczb3NBY1VPTXdm?=
 =?utf-8?B?YXVUTWNoei9wZEZPV3hqUzJWakpWclF3Z1hWYTVYVmhMQjVuZXdCaEszMWgr?=
 =?utf-8?B?a3ZsSFdFL0w3eTlvcTJNNVkyRnB0OHRXWm95YjQwZVJiNXY0c3JSelhWdWVp?=
 =?utf-8?B?dytKZHpTTVFDWTJGMGxqWFVja3RFQXJ5MS9QT0xCWDUreEdqUTJmOFluSDhW?=
 =?utf-8?B?OVMxKzRVVHlLSkdtZlhId0t2bHlZWGl5S0cvdkpkZmZtRm05dDRqakNuOERq?=
 =?utf-8?B?KzZMcytEWjRIR2FQNmdTQXEyV0hRdDExcHlvR3AvREJVNDlpemVqZlRMWmsr?=
 =?utf-8?B?Z0Uya3ZNREd5S0M3MmpXQTl3dDBMTE8zRExxVyt1WURaYVlORHhqV1laSk9E?=
 =?utf-8?B?S3VsVXNFZEFSWVgwYWJsZy9iU3g2L2pka2pnSm1HNjhYMElXbXAzTk94VHNz?=
 =?utf-8?B?cTdoeWRCS3hGaDNLVVJITWdwWklMY1FsenIzWTgweXQxOHFLT1hCWFBjYXk1?=
 =?utf-8?B?QlBBWng2YkF6NXVKdTVOaHN4amZNWHhhOGp3eEFueHRmOEdUOUhvY0FnR0F1?=
 =?utf-8?B?M1NVWFNVcTc2a1dOMW0walpLbnU4Y01ZMWhHSHR3MWJNTnozQmNScENuLzdo?=
 =?utf-8?B?WndBeHcrZW4xUk93UE93N2hVZVdMdlRLUXZSSStQWjJRNmZYbUo1RDIrTlhF?=
 =?utf-8?B?dU90aW1kenJuRCt3UnM3STdCT0dmZWNvazBKR1d6dGZ3dWdyQ1JnNjJxcjRR?=
 =?utf-8?B?ZStlb3hmdmpMTVg3S3lIUzZlRGU1dzVvYWhPT2N4dkJxclh3ZmczbU1RZHhC?=
 =?utf-8?B?V2FML2RHZGdLeFNaMnpoYXNIbUxnMVRXb1o1Mi9BRXJrSE8vSllGUE9PNEZ5?=
 =?utf-8?B?YnFOTlN1Y0R0UW1aSEpGU0dKblpOblNSbVRVNE0reFlpK3U4cDlETUF2cFlo?=
 =?utf-8?B?WENXME1vMUFUN2JvalFNbmFtV1pTNjVNYnA4MjQ1eVlWV2tkOXBtVjdTWmdZ?=
 =?utf-8?B?TU1pTVBpSU1lWjc2THR3Qm5TclhXb1dZajVTSG05QnVwSE82VGRialp5VUVP?=
 =?utf-8?B?K2N0TkN1UTEwV0VXcG0va2tXRmpQdEYvYU1vdlEwamRsbGVUaW1tVG1kSlh3?=
 =?utf-8?B?dnYzbWFPMXNqaFN3OWV3VEJLaHVxRmphNVRPNDZpdEVmRmloazZlbUcySElZ?=
 =?utf-8?B?WGZLMXNxZ0hiWjdrS1VNU2piK3JaZ3RXSUdKMW44OVFjajB3Y1ZoYnZWbFps?=
 =?utf-8?B?TGVVV0hzWjE1WHBJOXdlV0l4VE1ia1BLQVQzOFl5OWcvN3lGd0x5T2FsMkdq?=
 =?utf-8?B?UHBJOEU5UWcva2o4c21aenU3N3p0a3NwTzlNYmQ0ZDVtNkowK0loKzdILzVU?=
 =?utf-8?B?MDZRRnZEMys3cmhYb1RsRHNkRDhQb1NYTzRvTzBtYU9qNHc4U2hGTmh6M0ZM?=
 =?utf-8?B?QldFZDZmMkV3MUNvQ3Q1Q0dFN1JYY1lyQy9lVitOMFhvZWpXWERReEp1RWdD?=
 =?utf-8?B?S2NDMld2a1Ezc3oyMFAyc0NBNUwxNkkvMHhmWFBDcUE2RmFIZzdKSEVLMG5y?=
 =?utf-8?B?ZXNESThRL1p1YkZnR21KNmkyWEZFaEtpWEJybFZWM2RHSGxQblUvckZPN3N1?=
 =?utf-8?B?L1B2NWZYRTJpcEtxd0NyYUt4eWo1MVQ3dmFhRVROeU8vT005WDJ0ZUZNQURs?=
 =?utf-8?B?d2hCTHpQMFAyRzVoaXpDQW1wc2M3Y1VCSkJ2QjF3bDhtbXpaMVllMkNJRkZG?=
 =?utf-8?B?cXVBYzBPSlBpKzRWME5CdjlSU2dTTjNLK1E4OXJqd294a0k2cEJlQnhIbWVw?=
 =?utf-8?B?aUM4dno4d25nVmNlbThEcnB5VWlSK3laQ3pjWEdkcXY5eFhkYWloblZIQlhy?=
 =?utf-8?B?ODJHWTZCR25XUHVrQlBnMDdvdmwyNzJTQmNDc3dxaDcwZGdmUE5BZGk1RVFI?=
 =?utf-8?B?UXliKzZqVVNkSmNncHdzWUtMOXhNK3ZFWDlJcWtTVnJuYkkyMGFWbWI2aXcv?=
 =?utf-8?B?aFVPWkNKVDdqdTFGVmZsUHFVU3JtZk9CNDRzeFBuM0FEdjFHOTl6dzYxOExS?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd7ea25-109d-44de-2d84-08dbba0fff31
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:07.5447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SYt1bHz6rs1KvhNax6UquNU8O6WLPIQyBznpBraMtWjvywxSRpeMwWArgubpJfj8tEcvmjtUiFwOnWMTqwELA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 06/20] drm/xe/uapi: Remove MMIO ioctl
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
Cc: Francois Dugast <francois.dugast@intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Francois Dugast <francois.dugast@intel.com>

This was previously used in UMD for timestamp correlation, which can now
be done with DRM_XE_QUERY_CS_CYCLES.

Link: https://lore.kernel.org/all/20230706042044.GR6953@mdroper-desk1.amr.corp.intel.com/
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/636
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |   1 -
 drivers/gpu/drm/xe/xe_mmio.c   | 102 ---------------------------------
 include/uapi/drm/xe_drm.h      |  31 ++--------
 3 files changed, 4 insertions(+), 130 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b6bcb6c3482e..74688647f332 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -107,7 +107,6 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_DESTROY, xe_exec_queue_destroy_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC, xe_exec_ioctl, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_MMIO, xe_mmio_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3ccc0af4430b..e636e3f3456d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -422,108 +422,6 @@ int xe_mmio_init(struct xe_device *xe)
 	return 0;
 }
 
-#define VALID_MMIO_FLAGS (\
-	DRM_XE_MMIO_BITS_MASK |\
-	DRM_XE_MMIO_READ |\
-	DRM_XE_MMIO_WRITE)
-
-static const struct xe_reg mmio_read_whitelist[] = {
-	RING_TIMESTAMP(RENDER_RING_BASE),
-};
-
-int xe_mmio_ioctl(struct drm_device *dev, void *data,
-		  struct drm_file *file)
-{
-	struct xe_device *xe = to_xe_device(dev);
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
-	struct drm_xe_mmio *args = data;
-	unsigned int bits_flag, bytes;
-	struct xe_reg reg;
-	bool allowed;
-	int ret = 0;
-
-	if (XE_IOCTL_DBG(xe, args->extensions) ||
-	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, args->flags & ~VALID_MMIO_FLAGS))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_MMIO_WRITE) && args->value))
-		return -EINVAL;
-
-	allowed = capable(CAP_SYS_ADMIN);
-	if (!allowed && ((args->flags & ~DRM_XE_MMIO_BITS_MASK) == DRM_XE_MMIO_READ)) {
-		unsigned int i;
-
-		for (i = 0; i < ARRAY_SIZE(mmio_read_whitelist); i++) {
-			if (mmio_read_whitelist[i].addr == args->addr) {
-				allowed = true;
-				break;
-			}
-		}
-	}
-
-	if (XE_IOCTL_DBG(xe, !allowed))
-		return -EPERM;
-
-	bits_flag = args->flags & DRM_XE_MMIO_BITS_MASK;
-	bytes = 1 << bits_flag;
-	if (XE_IOCTL_DBG(xe, args->addr + bytes > xe->mmio.size))
-		return -EINVAL;
-
-	/*
-	 * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
-	 * multicast registers. Steering would need uapi extension.
-	 */
-	reg = XE_REG(args->addr);
-
-	xe_device_mem_access_get(xe);
-	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-
-	if (args->flags & DRM_XE_MMIO_WRITE) {
-		switch (bits_flag) {
-		case DRM_XE_MMIO_32BIT:
-			if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
-				ret = -EINVAL;
-				goto exit;
-			}
-			xe_mmio_write32(gt, reg, args->value);
-			break;
-		default:
-			drm_dbg(&xe->drm, "Invalid MMIO bit size");
-			fallthrough;
-		case DRM_XE_MMIO_8BIT: /* TODO */
-		case DRM_XE_MMIO_16BIT: /* TODO */
-			ret = -EOPNOTSUPP;
-			goto exit;
-		}
-	}
-
-	if (args->flags & DRM_XE_MMIO_READ) {
-		switch (bits_flag) {
-		case DRM_XE_MMIO_32BIT:
-			args->value = xe_mmio_read32(gt, reg);
-			break;
-		case DRM_XE_MMIO_64BIT:
-			args->value = xe_mmio_read64_2x32(gt, reg);
-			break;
-		default:
-			drm_dbg(&xe->drm, "Invalid MMIO bit size");
-			fallthrough;
-		case DRM_XE_MMIO_8BIT: /* TODO */
-		case DRM_XE_MMIO_16BIT: /* TODO */
-			ret = -EOPNOTSUPP;
-		}
-	}
-
-exit:
-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_device_mem_access_put(xe);
-
-	return ret;
-}
-
 /**
  * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
  * @gt: MMIO target GT
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 59e9f2f87074..e39d66a65c89 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -106,11 +106,10 @@ struct xe_user_extension {
 #define DRM_XE_EXEC_QUEUE_CREATE		0x06
 #define DRM_XE_EXEC_QUEUE_DESTROY		0x07
 #define DRM_XE_EXEC			0x08
-#define DRM_XE_MMIO			0x09
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0a
-#define DRM_XE_WAIT_USER_FENCE		0x0b
-#define DRM_XE_VM_MADVISE		0x0c
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
+#define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_VM_MADVISE		0x0b
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0c
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -123,7 +122,6 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
 #define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
-#define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
@@ -939,27 +937,6 @@ struct drm_xe_exec {
 	__u64 reserved[2];
 };
 
-struct drm_xe_mmio {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	__u32 addr;
-
-#define DRM_XE_MMIO_8BIT	0x0
-#define DRM_XE_MMIO_16BIT	0x1
-#define DRM_XE_MMIO_32BIT	0x2
-#define DRM_XE_MMIO_64BIT	0x3
-#define DRM_XE_MMIO_BITS_MASK	0x3
-#define DRM_XE_MMIO_READ	0x4
-#define DRM_XE_MMIO_WRITE	0x8
-	__u32 flags;
-
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 /**
  * struct drm_xe_wait_user_fence - wait user fence
  *
-- 
2.41.0

