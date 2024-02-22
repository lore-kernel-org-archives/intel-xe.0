Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E9DC54791
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C6710E9B4;
	Thu, 22 Feb 2024 16:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPmQP7vo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE7410E9B5
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708620030; x=1740156030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5ilIHpSoBsW1tOsENeYTIo7Hhmjs7Mk1dKvti3x2uBE=;
 b=OPmQP7voTV7OLOJMUqn0hEsV1HAg+N3GaocY1NzBk2K/WYeW6CdPzSLm
 uBLuHdXAoINaeCC/QHr16wjjKckLDoGxSXbIAjLYuU3ybPUQsIwymzTgd
 n97oTaM2fIo+nm4RLPy/U1l3xSiIpLECkMxkCBbXUoX+tiCOGVeGRO3L+
 58psOi2dJHTImLxtXGJNgpOUtxjD59W2bcgRODGxNi92eNbiUAQBX6Czf
 /GZEAeAjZKhK+1XXbTy3osvjcFGwHs2lwxAMXanpaDdEpFOUgclIMpb91
 QxCrZ8aWYo7utUZEEWsyngpug5dPQaxg058rka/82gVv+W+XwlDiSUJ3W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28296340"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28296340"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:40:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5490400"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:40:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:40:28 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNhlw7d6GCzAsjuIOo8qmXwQMOi9fYj491zIM4KKHhu2Q4XOLcOdyWip4aM+2s5p8UeujQ5I8xhrfDJSpS6f7dpoDre+EdZ9tbRIrYWAdEPYwyHIRly41THeAuSmY+iC4+cvtwxay6iVXM8ipD+zWeGmixaeGmJFcc3NSrt2clem8ivMAzL06mrbVYsRF7DUBN2a3YUCRmMqkho1OcAiSDp9h3CjossP3ESf2cpKcyBHNyVTFPXCbnnLIqjDCs2F/7tj1mkwM6g1opQZeAWqUKpU78lgyfz8ExP6VeSMqn66kSE+rIyiST+spwa9so83izSFHgTICO1wEjVfuzYXWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qIi8cTcFPym3A32AXJapIrJwh9SqPIP2TvWyrzpC2A=;
 b=FqGPGpPZ4Ba3eZ2ZXo6lR7CNjFvfb4zSevxQc27ZrjQ3aLdmKeusKLBXfWFmFwA7CWzq6N1GqOSmQ3wFczzdCGFUz88bgUgskY4Exk10Xcmd2BobrOYDQcZ3keG8FFcDGbSPb+/NPXGlJtNiWVittNZD+G9Vue57Pnaj0mZaG/YVRxslDYi2boW+pxq0aOYGzogm/fzwgF6pVKA/HabuVegxIs8jfo4p60dQHRPpKbSjw9z24wvpyFvrBVW/bnDnsrCyIeyVsbtRg0QqidmK/NuH5v9SKvf1XQHFZ+W2K6cya+SrSRvlNr2P6L3rlNcqLTljExXEDK+wnRV0rOMWJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 16:40:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:40:23 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 13/14] drm/xe: Convert gt_reset from mem_access to
 xe_pm_runtime
Date: Thu, 22 Feb 2024 11:39:36 -0500
Message-ID: <20240222163937.138342-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d7c88f-3922-4fdc-d60a-08dc33c4f6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MoE9a2Tu5amEltDvwcieB34uwnddoyJpX6379G0fcNYWiXTV0+cHX8hVpYSG4aianDvYe1DMrddgy/+E+Gn9ySKP7xG32NAp0gYZlDAhV7erajBFhTWQsfPJOYVRyRkDBdGxJxtclTX7ZD+6QHH77sS8vZ6AXCtU4Q8/WKF8OEVQliSCHgJzs9Hb4mChcsiAvc6am9X2jZAkMdUy5MQKD2EFdjd51XTPl2/gx4xzeEhG4ePeSONLYUToDk/UwV8odzRYV7CHpdClwNhiD+tv7f2Pf17GapjXCqm4QVVTexBZwlq/3nJX/HfigA1XxJGTiqMryrqvdcsdsUFEYGK08iT7a/NpdN/sQXHmuForuHaTmd9c+B+hvB1wTvOVTTZZF+4FsahCxnhgnil4O8ZExIm5Wfe+gZ3euKFkqb+/vJVvJfP7hCKmh/d0vjqC6o71el5FHNdre6u+M2+RUMrNvNu30FV5JOZ3v6n3Q4XONeWKfctVIaDwYi2y96l7Vz4C1rBoYCebUygf5IFzs70oXNGxmhOdQiQQVGn/bh37PfE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uo3o/QcqmFFzzV50S79XVFv2OC8a3t01VGrUUhXigdVHwCrzOw44WAxvO2Qz?=
 =?us-ascii?Q?7Mpyb5f3WTkLUqA8R8t61jztXAYvTLCA1lE6wl8t7mPT2jYueCrsZTkOYX6e?=
 =?us-ascii?Q?ZHaIl5MgpmZ0yZCBPYVxCjQh+Bytgm/Xiy4lYVJTq0TVJgYZUiDBNH53A6vf?=
 =?us-ascii?Q?GjV55hYx31SDPqdCBl12/B+7IVwnmx8KB+VlEFuxOMHEGopdGb1eqtrmeXWM?=
 =?us-ascii?Q?VBeBrDYIHdLKh9JVW8h3jjGEva3sG6+01+SjGMjKiks2KgYhq3gZMUjg4KlO?=
 =?us-ascii?Q?DateKlLskkhQXgQqOaRxB/hrLpL6UF5pjUJoiiPHG0EDFhC5UdTGi0OCytqF?=
 =?us-ascii?Q?NT0vSZCtQXs6cOpspjZ3phTnp7EsQVQ6T9jxDN2vtedhz/UH+Y/FwkPCzkvv?=
 =?us-ascii?Q?Xh9a4SUiZzh7jAH9hrU8uLlL6gwIoxoqPESoq9y2pC7D4VfHY7bDpr6i8KzZ?=
 =?us-ascii?Q?Jjt8f+eA7Gq2n3URzwObA5oJfUx2TaXngY/Gb6ng9IS6t2QPt45ernpmV9Y+?=
 =?us-ascii?Q?UjXS2UgAUDRXTv13O0DwwE0ySPKTHfF/ZYL4CglVSlguGrRSpGess3Sz/sGh?=
 =?us-ascii?Q?aoDNFAcVKxIJIQ9SvReo8C3KoDjKcnPTbdDBcmGNFN3B5X88BB8z73psIp4B?=
 =?us-ascii?Q?41tHEb7VZwe7mhGAdgrIg/tkhwKBq56MG1S3ba/4lxc8xPEnQYUgLRxGK72n?=
 =?us-ascii?Q?ttCvN48Hxf34pYua8M1prHm4FuuIoivW8j/hjAWA5i8xRK9gPf9+aOa3NS2K?=
 =?us-ascii?Q?V70Z2B232g+5qPit7dWMtmbVFgFEXoSe7rl3zL5f+N7eqzH1WAfTzgc5esac?=
 =?us-ascii?Q?qHWnSdmHaq7TgunoYE+Ny++Jv3uns30PkAH3AVTzBNeCRi2PnyaFAo1g6ieb?=
 =?us-ascii?Q?TzKgs0fA6WfK0bSI9VytfCoS/XmFPS6DaNYueV6j4/qssYhOvp3Ro3/9njh+?=
 =?us-ascii?Q?Tp7Gwe+xZuJxlf0j2l5gV7pXnhM+1b8On2qwkqbFJ76sDb8TwWAHUM8xIC8c?=
 =?us-ascii?Q?ayFur0Tub0N0URoNLSnS+Jln5QFLX/oUnlDZQGxhUfjVNGZqsu49balPYEna?=
 =?us-ascii?Q?RGh4/4NJfbRn8UjEJmn16NwE1mBUVSFmtnpY6xMw9MGJZQMe5GD1+t+pqBhS?=
 =?us-ascii?Q?4BrwSemx0AayrycHgIA5NBMn/tXqWgk3h89RVpcGul6FKqnN1ISg7Sf9darL?=
 =?us-ascii?Q?l7fhWE/X7UznXtLPbf4ISyS1T4m8nrtGsrM+etFC+wuG8URzoZx7T7L82lF9?=
 =?us-ascii?Q?mI2v+niKmuUhCdBywodTWHxv4IxvoGKEKjS425iD9auOxBG+0hAoDQgh5nOT?=
 =?us-ascii?Q?FoY4Nnfw9+2ggdkJ3WSosMnOV+YQ4v7oRTmVGn29RkvH+Uh5FTznOH4OtQqI?=
 =?us-ascii?Q?tV39KOCHYYWatGFJ9+5wZpLkFW+gdrQ+ipVwo6fyWUAE9l8S6ml5GRlpCekn?=
 =?us-ascii?Q?vwPib0RcPDuhxb20buPCdtz62tl18TqdA9PgZBjMACp80eFEVzSB4oTLr6Pt?=
 =?us-ascii?Q?ulsCvBKlRXTLElYRNU4o/PzVcIhWO0c/EIoJsmZh9k5a0Gl1d2RrxoJYM90c?=
 =?us-ascii?Q?POpMsn5BsQZo4YMH5lW6C1J91xIVTZ/F0+sNeeBGx8VmG3I7vcXFuZzigGOB?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d7c88f-3922-4fdc-d60a-08dc33c4f6fc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:40:23.2860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8dycBP1BxZszjlTK6kLN29JRmOEBk8XWluzIOQ/veLtGSiTK+AJPVTq3ClcP70bonUUDo4Q40/QbrEYO07KIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
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

We need to ensure that device is in D0 on any kind of GT reset.
We are likely already protected by outer bounds like exec,
but if exec/sched ref gets dropped on a hang, we might transition
to D3 before we are able to perform the gt_reset and recover.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index e0c79351a131..45646d3aea2d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -43,6 +43,7 @@
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_pat.h"
+#include "xe_pm.h"
 #include "xe_mocs.h"
 #include "xe_reg_sr.h"
 #include "xe_ring_ops.h"
@@ -644,9 +645,9 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_fail;
 	}
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_gt_sanitize(gt);
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -670,8 +671,8 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_out;
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(err);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	xe_gt_info(gt, "reset done\n");
 
@@ -681,7 +682,7 @@ static int gt_reset(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
-	xe_device_mem_access_put(gt_to_xe(gt));
+	xe_pm_runtime_put(gt_to_xe(gt));
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
-- 
2.43.2

