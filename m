Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9362CC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 18:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EEC11270E;
	Fri, 22 Mar 2024 18:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4wKX5nU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D401311270E
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 18:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711133917; x=1742669917;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WZQtpyNOAQO3qg2IJPJz8BT2OAZLR6XQ5Vnx6nrdM9g=;
 b=M4wKX5nU04/xJj623Pqnxol+GnRtlgCNb/qStRbap1gcDi/eP1/i14mC
 t3xkHwp2M5YKtEXTVG2gkzeolo3V9GST6a+7p2V6Jy5z4eXwrCVM61DHE
 ridOGEvT0m1h+vjyw5VLztkkt/+03JItmspPBe9S07BOekwJsJjoPFwPi
 RVH6HjhwmAaUn/wdMn8vrupcO7WKcUaoaieGpGt9yMLuRF2HrFE5JJUGa
 dp89EKQK5Tk95ytEIho2exZN9Cda3I7iUsIb8ozNtYwV3b9JLoDy3VMqe
 tyq37TXSXEuFDqh8M25lXmbb3BI+Knv7qN+E91h73Fks4EyELzkEoXljg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16833340"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="16833340"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:58:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15061258"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 11:58:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 11:58:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 11:58:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 11:58:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXOu3patQmE/VvYqy539PhFExEG9JWQE78wXo3nohVwKE+rD4/anlGlDarxKDlyeJxO0Yg3mEQ3jmbR8Ch5YxIQN0MljOhw2IutNqQc3gcoSJZ0LvqUL020i5v9vks+kttjT/5fEH9qtByicgCz49epKrdcL+FLWqcUmcZqDHRMtQAikr/KPvI96w20MF0DX6O+Ws1CGu5PtTs6melacS0X7gEmmwX6bXjc/RdM8ZwO4Szj+t/KyfFwmawH+9V8PeCI3S4S5FYsTwsAchpnVDpWlVLHzoY6jg3hDsf6GzRbFmGBOV2P37P2bq761y533Q3w4zXiooKB4Fek1bu3mzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTrP8oVKih/n3PzQfQFl0sQU8aghSSYjR2tmpwLGOg4=;
 b=EKTpcH9dRRsBxgU9MNsRgLVVb1xBgJFoZdW10HOEJvBOYjiQ7Uo+nFRtepvgj8m6xoEF5PPzzfFAzyYs4amH64GgZB5R2qCODkT2V+n+O7uaO9AayrbiW2ui6k8VXGvf58pGHSG9uyzZoqlF+llfNxrNR3rbxon2B4HkqL9GAmi9NOAdRlt7Ad6TEx2htLbk/0QMeXlFp32R2inBgmp50oewvBCxOaQq53sH24aGKz1qcBzaGsZ8bpdu/a/iJ7V8Z1T/NEpcZOrQ0+mGXGnF/lFhbrQ5jVT6GcuAdzNGdBVqlrbkdSqVqatMWbb0BnX7OXJZnszIJQWtUo/SoAKmJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 18:58:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 18:58:18 +0000
Date: Fri, 22 Mar 2024 13:58:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <matthew.brost@intel.com>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe: Use FIELD_PREP for lrc descriptor
Message-ID: <sfmwlcxvfaix62lkz3yglfn7swhrsyhz6b7n6kiry6jk3uarls@2glxlcmjgii6>
References: <20240321063453.13306-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240321063453.13306-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: 05c5dbdc-0495-4a8e-7092-08dc4aa20920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bGDso6Eb5vA3frFKsmtt2SxzITpjFD5mf7WMv5DUQGzUH0BqzewO1Po+P66fUzdQ81+zJEHZd5bjb6u9KqMWy6oDcIQFN2zMFB12SH0gz5IUSoU5IDWQIHS/rcBIAH0C0pf4lZSYEH2hCWjuamlBIu1JyFD1SpV9ksoyNiNT7bTdtlzBwVrmjEqmqxY6sG+Tz6/qQ8f8Wn/a7yzOztxdFuMQcr1ytiSqG2Hx2y3bwFtRSj0CNkruDLY2Doh4Oe7oY9m/qE1zm2kUbQ4iVhy0sMca7EDOx12gNj26yzWSFz67j92F7EU3JPKJf+I8NWoVRox/ohVZYqF/kLDj1c3LE/2Gz4f2hzZBrtN9o8ccuTHa3B2kneaOtIFAVbDXi1nhAZdrVEEShsOue2wd8/6O45arFq5S0Qe5s5FtvXr+S0zLtYK/4Is9NsmJxKLVbRqIg7t7wKD42p+y6mOYt9n4jdAFXkdvUwBSvV/cF0rsp+E17QaQlU3cVF7HP221VZMmYBT2o54yrtLeh/DkMN8WJcxmgkvIUMg7IfmfDIA9UJJ/nP1HGjwBDb5lgVgpOxR4uppinXXlZkACLCjenQGLl5UcjFXyykqtMaG51DjV+Zyrc4jftYQOIUX8mPErExVEJwGIyobsNq8BhEdjyH7y4xRklIjK9DrJOdeugoanXOM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?60xZlgOU3t9gTWVSa6y85tbxgXSWaC8h7OSMvVPBYtWF4s/36k+keGd/gAf7?=
 =?us-ascii?Q?Cw7QB/Anx682KtklQ0c5kp3lRJQrZCspU65wkQhRUCoFTC2udNldCXd21KaF?=
 =?us-ascii?Q?0ysXWLkaX14lKgCCPKl2mGqAbfFUNgw/dRByVCCZnkwGEtn4GLC3yHb4kYgz?=
 =?us-ascii?Q?GQRBL7Jpkz6ku2iZjiVrh2ey3/dYllDabALqLYFj3Jxgd/tvcspSm/whNfgD?=
 =?us-ascii?Q?sPf/5Vfd6EpSbIwywyKRS0e91UbuzDYuEoJkZKFKwEzVHReH7rOTYp6G202O?=
 =?us-ascii?Q?tkk+dTdD6o8oyIwgBGq4MEvHg4LFQK/cU4P3w/oknCprzcmsf3nrhBPmVBPe?=
 =?us-ascii?Q?gU02Pmrt8myikykHR/8kIUhJPI1GEtsv9q5jpQXz9BJYfsxH02UhUeiHHDdB?=
 =?us-ascii?Q?Ay4rPXmHV7+RVgqrbJLfsqggumg7cqApC1o4RF2wcfhQ8/ub+cKWJTgxbuBk?=
 =?us-ascii?Q?qgRxbK4aN0CfJhzGVPpypBJhXo9VIW7ppPYeuXnFC+mcPCx71xbEc9+N7udF?=
 =?us-ascii?Q?twOchcWxgdog9it5PoFrD1svwHvX80JXvSOYc7TGuHyvLY1Hic0dvYJHmgTk?=
 =?us-ascii?Q?LF9+J05XRxnA+9wRqhan0dM+3SMlWppr3YO2+/0U/LaHZbYehkW6f6VJaGk7?=
 =?us-ascii?Q?5tYwjr4oM/KJTUMxGqvjAqylCmZMESflemUnV6uN+N1PMjokZpaAV5UK4yPO?=
 =?us-ascii?Q?W1uSqg0lw8Gns/gDsAO2sUlZfVQltwmO4IK78uomC7b+9Cff+DPzevVSci6M?=
 =?us-ascii?Q?HmVk0GnepPfzoNIAjaDX70J8tF6SNp2BbDBj/a9h131bdhWSCPtQ79Txzd7l?=
 =?us-ascii?Q?e9hL0jyTqygbqB0ZOD7mgGq1TDd0I7Cj4t55yrCnkkbyDO0c1LoAOAENC6tN?=
 =?us-ascii?Q?FRxgbXsx7ysHxEXnZGT6qR6nGj2QbdHTUI0fphzxIDrmpS2pUm2RrW+vkQ4x?=
 =?us-ascii?Q?BBU94iLtkRukEpN4RA/nJuRpe9kIepLjRstoo9TsXMMfIWdoPbglEJn0lznH?=
 =?us-ascii?Q?hn130cj3jzdFEGLlcca+Wwd8a9twMHc3vqoAWtGpcuy6+rA0z9hJFRVil6lu?=
 =?us-ascii?Q?tgo291ampoCp6Jb5fjE8l3yd7abaPyTWNCLRdvJAdSaU3/FtyEEjuOQrH2m2?=
 =?us-ascii?Q?u2PoQu/ngpgaee6cLgrrwSzziaXEoYOUe5Tsd9d5iUlUSOY2MwP6x6RdjEZ2?=
 =?us-ascii?Q?WBq9qZO6fKiAPgycBWL2pI5uEixYGb88v+p/SzzndmffKeFpwrX4fLhDScMP?=
 =?us-ascii?Q?1BO89bE7S0P4WIzhq8uu1fGBW8hF0m4ryxfhxKUWv7//bNCW+O3M5y4D3DUd?=
 =?us-ascii?Q?zSVE4l7zrgLjLau3tB/H6SUvfGPCGOBNxr2YEchaz7Z0h2hvHaxz7J3ov/7i?=
 =?us-ascii?Q?x6Q8+qiL+mZZr2iIYSeAzLzxHM4zR6yaG3mFeujbuRms3KvxmepXXRwsRM18?=
 =?us-ascii?Q?h0EFDb5ZowjHzoNwrEr/v9n2NCUBigzMuJKv0erRY44VSJIJPGIG4c2XacUD?=
 =?us-ascii?Q?cMl+a8RbCvTziEcMeuvODF1tfk/xBRO27nfbcjJZhsxpnq/ZTcBAPB+IgQQI?=
 =?us-ascii?Q?sOG6ppQ+pZHQCF4q54GJCyQvanIy/q0ErzEdQSN9DA18aWgXykWC3xUz3WAa?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c5dbdc-0495-4a8e-7092-08dc4aa20920
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 18:58:17.9803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozeMWVaf6Rx67phYmTG2JrYioOmIhSNhByHLPGemrGm9DNLAI07RcWwcqLly0Iy5CF1CF/6mlS+MvHwlHDV+3JqdijjPh8kp5Bp6QAESW8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
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

On Wed, Mar 20, 2024 at 11:34:53PM -0700, Niranjana Vishwanathapura wrote:
>Use FIELD_PREP for setting lrc descriptor fields instead
>of shifting values to fields.
>
>v2: Use ULL macro variants
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 20 ++++++++++----------
> 1 file changed, 10 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 95e0f7b1ec3f..9dd706b00b3d 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -26,13 +26,13 @@
> #include "xe_sriov.h"
> #include "xe_vm.h"
>
>-#define LRC_VALID				(1 << 0)
>-#define LRC_PRIVILEGE				(1 << 8)
>-#define LRC_ADDRESSING_MODE_SHIFT		3
>+#define LRC_VALID				BIT_ULL(0)
>+#define LRC_PRIVILEGE				BIT_ULL(8)
>+#define LRC_ADDRESSING_MODE			GENMASK_ULL(4, 3)
> #define LRC_LEGACY_64B_CONTEXT			3
>
>-#define ENGINE_CLASS_SHIFT			61
>-#define ENGINE_INSTANCE_SHIFT			48
>+#define LRC_ENGINE_CLASS			GENMASK_ULL(63, 61)
>+#define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
>
> struct xe_lrc_snapshot {
> 	struct xe_bo *lrc_bo;
>@@ -797,19 +797,19 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	if (xe->info.has_asid && vm)
> 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
>
>-	lrc->desc = LRC_VALID;
>-	lrc->desc |= LRC_LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
>+	lrc->desc = FIELD_PREP(LRC_VALID, 1);

this

>+	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
> 	/* TODO: Priority */
>
> 	/* While this appears to have something about privileged batches or
> 	 * some such, it really just means PPGTT mode.
> 	 */
> 	if (vm)
>-		lrc->desc |= LRC_PRIVILEGE;
>+		lrc->desc |= FIELD_PREP(LRC_PRIVILEGE, 1);

and this

could stay as is. We usually don't use GENMASK and FIELD_PREP for 1-bit
values: git grep -e 'FIELD_PREP(.*, 1)' -- drivers/gpu/drm/xe

otherwise this is Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
> 	if (GRAPHICS_VERx100(xe) < 1250) {
>-		lrc->desc |= (u64)hwe->instance << ENGINE_INSTANCE_SHIFT;
>-		lrc->desc |= (u64)hwe->class << ENGINE_CLASS_SHIFT;
>+		lrc->desc |= FIELD_PREP(LRC_ENGINE_INSTANCE, hwe->instance);
>+		lrc->desc |= FIELD_PREP(LRC_ENGINE_CLASS, hwe->class);
> 	}
>
> 	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>-- 
>2.43.0
>
