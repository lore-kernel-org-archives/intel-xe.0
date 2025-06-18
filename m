Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94097C71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 19:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED9C10E46B;
	Wed, 18 Jun 2025 19:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMip6RmT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279E310E46B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 19:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750274921; x=1781810921;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lDUTYrA4Hsril5KKhF8qtfrrSOM0A8d+jmNAOlaVxnE=;
 b=UMip6RmT5BrrKkPscHREMhZnK4vOWLStyXrof2xDtLJPKhcGW1id8FLP
 ZTNcQNbp6FkmEUvSuuae6zPGssXRQPlkVnSl9VsVz+nHNgmtrIxCvAMLX
 xvceUqnfjGQJvWalKbvCDZ00qTXNF7LRXNoanf87/hD+OVi7lkM3NYLpI
 sk450Sxb27N6yZkzwM+mAdvX0c8zqkT9nJ2+1h51AIhrj8o4uLFO/CtbU
 mXsDs1dkYpna+DCc/c9DNFjY93cjfeFibJoi4/3fYG7f8QiGit+Rvy3XI
 cLUk7zjG321k3NyuXPjpCkhxnV4WdGd+wLCBLDXM1ZijV5giVaslqadqZ g==;
X-CSE-ConnectionGUID: 6ka+KTMQTQOzENPiEZvmXw==
X-CSE-MsgGUID: S675fqxeRLCoubHYKU711A==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52382316"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52382316"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 12:28:37 -0700
X-CSE-ConnectionGUID: 8txJ9FOHRymq1c0H14ygjA==
X-CSE-MsgGUID: 3hNQBGvzS1a6T5IK8CWX7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="155583432"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 12:28:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 12:28:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 12:28:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 12:28:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDH1vhRthUYmhbgISv/RBVif91B9vmwBfdOviKZ8PFtX0eogbbRwUfDCuxQtE6/ODVsJoE8uMQz3W+rA8TG52rjJpxnu7+qfSCcclApE2N7VyHgTm9uA+QB6HkkwjQkWhhRS5gEi/ujl3zc5XwD4lx4iRlmJ3KUqcSOixs1zX0FQeHxATv1Dx1hjRbif4G7DobA1/P9gHEl+zrC4lF1GXGUOL9k1PuYU8BTb1dPjVp4xnymETSosWyozJ/1YAdmd5PmpBufGaeSvGfT0koRDiLk8jSNDo6Ld0toRLFCNd9pCp/ieR5CjCH/VxELk2Ed1NnLb6OtTbLr9BSfZtaFRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao1v0RqOnBegVsoVxVAowJswonuWZZqHNb+D031LLTY=;
 b=NZS7tK3MFl5YDKE/G/3bMNMs2Px8uxt8BiFw+NeRqJE+KXbHy7pY7PLOFzaLbpxXRrwSobn7V3bCoEIMK4QgPt0gGNR/Z5GxVtAwD2viaaabbX47iwPhsgCWHji0gYhEId+Xs4QVx1WIDFGxArKz8TXRHPydw7sILMSNBylTbxyvJd59wPZ7y0hJR/2L+0qgQxz0qH4Zrs/TA0C3WQiIq9pGk+A3xbdvD+7E3N6MyLbS8/xCptYEnkmsC8UO8bCszjqp1BEY6Yenh3KH607yjUrFDM82MD+KsMdHySgfF+Bw/+2SPwqNpcBq9nl8rnT5V8DcjrY9dUYlGEGySggHVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 19:28:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 19:28:19 +0000
Date: Wed, 18 Jun 2025 14:28:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3.1] drm/xe: Simplify GuC early initialization
Message-ID: <2kauvvdfmmn6qtsha7cz54bfqmcl62pvsx7drwpcbfue2bzzat@nal2bkmcqrcu>
References: <20250617180132.7059-14-dev@lankhorst.se>
 <20250618094436.198481-2-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250618094436.198481-2-dev@lankhorst.se>
X-ClientProxiedBy: BYAPR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e886f85-5f95-4ff0-ff24-08ddae9e47c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tm+BIr0EQl1cWKkmudMwWreMdiE+Z3zActt1GBUCiNr2oNIyhljbbua4b2gx?=
 =?us-ascii?Q?6SbFZNH0rzND5thgj9QWaTc+Fju3SWe0EZZjcUu9YteQpm2qlIjKSyJjOUDs?=
 =?us-ascii?Q?jwNESUNArxto1SdYR13fNS7//S+Uv9OCU7/9ycPKgnxXCscEPaoJ5XHof4w8?=
 =?us-ascii?Q?NgIgSIdaPJwYXzM8E9IBkXFnokNcJke+ISYjopQePnDC6Lc+RUaeEnbHBVzd?=
 =?us-ascii?Q?LPJ64F3HdDiXi5s6FuFq8sz4EEuESoIns8CNrx6FC7ZG3nvaNENcjHR2e3Cz?=
 =?us-ascii?Q?Xt+CDIbVcZtCNrgARwnkPRw7wHrgcDCDEsX/w29xkeK4klcRPaCaYd9jCHUs?=
 =?us-ascii?Q?HMHhJFC8hGpsplZ+8BzvXvZr55kG3ag6OYforwMAJ487Ut4KTOGtbcqkC4fV?=
 =?us-ascii?Q?6kqTb4kEPjjvYjYlt8mP001PL7J5eVZAiEL1Wv5yXC1NJD55jsP0/RQEv08F?=
 =?us-ascii?Q?CUGaHGYhI4x7jjaFBc2BoyisDlt7QJC2HUWd/nHMNI8Btbektpkfzv8543Pd?=
 =?us-ascii?Q?z5OvhoP4A474cIa78zReFWv+6SwamZtMue0G1LL1SWUw+4AsVmg6tTqIYyPa?=
 =?us-ascii?Q?6AhzitZf2zkubk94gc3hNctYH8oKSt3H5Ob9xOTl/XbWiXrqmLWnt/m7CNDy?=
 =?us-ascii?Q?pTLLpSwfoevX61sl2qtI0eoPovxWDv6u4vYQf2dm3oEfCFeYRH/EOdh7Kxrl?=
 =?us-ascii?Q?pAHvXwjFgKED5s9ASbinClyfHlwEnPK+ktMUOx9mM2INwak3mtZhOlTcAaKq?=
 =?us-ascii?Q?a91ch3PXMVzkB3inu8l0aG0JKyMgZsU67v+01r9imXCLavrZl1MdFRsM4LOc?=
 =?us-ascii?Q?dp/xuqWluruaydLhV50skfkSuA3hmgDLZL6/7vqKIdqKsP968prcNokeaCwo?=
 =?us-ascii?Q?/yd3jErf6UL746cjGYE4syH0kHvxLhHFDWEU3onAkh9JcwjQNW6N0sFb0PTL?=
 =?us-ascii?Q?wWnRQqGu1Vr8QTTReJMle9HgACAjrGVoFG19O6skstHdB1QMJ/4tuA2+wn5i?=
 =?us-ascii?Q?sSRHyudLPXoPuCIA8w8J6xrRtJWfZK/0WjHXAw/ftmrYmPW60Jq8VDRZ0frX?=
 =?us-ascii?Q?MosXgnrMODn9yEopB0I+4IxoWEIA6kdvOiz4Z++9OyZQrIV+5UxzRrCLQ4wW?=
 =?us-ascii?Q?IdzaHGoHhCC5IEEHrnSSg4lrOkyvv2ZqG2AvobnMMzuqPdmdP9XfxsFjv+KN?=
 =?us-ascii?Q?2jwUTm+NwhXmATgSnk/CFNIKsAUoXsVUx1gJUpVnMXOUqRVtWRkpSquwKOuQ?=
 =?us-ascii?Q?45BvN/XPyHaUdpwlizNspltsxjXo5gMEqZ1fsFK3MPnyPsHj3g0rlItawqTs?=
 =?us-ascii?Q?wLPaFQHvqmiGskL9B/epKQNmAso4XptfN8u5OzKW9EXLdvBtmzoXH6sx+1rn?=
 =?us-ascii?Q?LW3mJ+HmDye/vsjOtw+2+5luZ5rv6EjoxVoIbzrDnbexPoWQMdWX/TcuyayU?=
 =?us-ascii?Q?Wa1FPe2/lrA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5vXIdgb7igDOYWixbjbaXGOTxhHEb1ii2aoS9OscGKIfhDjxlRRAKUPZCRaS?=
 =?us-ascii?Q?iPYFRvW322i60eeBEIz4OUoB8W+XwQZg/DJHp1KL5Say21FCaoZA2Day1PZ8?=
 =?us-ascii?Q?3VDXDhkBPc4jtiTfqCNWnhHZ+r2enm9QMmVekJjMEu7ZWETP/QbA+qb9JBqO?=
 =?us-ascii?Q?+w20havEjTjGAEvsMgsX45r5CuRk7gvJqCd0/U+wUlXCVBoDGTU/DEsGYpt0?=
 =?us-ascii?Q?Jnm+hxuo15RWpd8DXRr9SE+iYDUnQLkAhihMJcOrW05DUCPHRzWFP/bGzASf?=
 =?us-ascii?Q?jAH7doX1zJs8j/ul+FvLrP7kCBaR+9Ej45Tyh6wX5Ajkh/z31+a70/Fd7npG?=
 =?us-ascii?Q?/x2dcUKPLvDMuWjloGW4uJyyPaXQh2fM8DNEij26EMdu3ZFUD7cGu1NeiHCg?=
 =?us-ascii?Q?HixncB3KA5/Hpp9R4/s5kCVIsGE2FtRmnHWHRED+bZc6f1YH41lJ4AY8UHI5?=
 =?us-ascii?Q?b1pOz0FrXmMDxSFJhcp1fQkxSOw3wWxhv1sm07zTTedk7QjrGHubebkH83st?=
 =?us-ascii?Q?kE62BTM9TupAsTnllVNctVYGBy2inCO4k62fwuRMaBEOnFz7poFfAgbvkgxV?=
 =?us-ascii?Q?zRZ3g6H2GtmNuO1zEesdI/gpRe4D7z42FQdiH8hwYOZhnupyjFzdIl2JVCfG?=
 =?us-ascii?Q?aeM9PE11tKaVUiuq5t+MqZP5DSXMSHbw248LyzYVCi1HCNhhRJx34jqzPNNU?=
 =?us-ascii?Q?uJNgnkEIRAv4zcJCeZIpkiyTqnydSCrkZiiQFozFIZYuWhZarx3D+J4JeZ15?=
 =?us-ascii?Q?aY+iOI8lVo+tMSEvHsyrfwhbKvtkVEd2jzUCsUXDPeQWWNAObBKXjKplzeky?=
 =?us-ascii?Q?IqEuMyGIjQcqrdOtgFxZ5EZXxt6uS3u0Qfc7+giPNPpOUQOt6Z0MpYcBRVdh?=
 =?us-ascii?Q?juF1ECJwrD7UoNODZk1Ld150TtjXi92t2fBezrt2wsYfeyJqmj86pYOdqw2d?=
 =?us-ascii?Q?4FRsjU1G4TbHiiy/g3NKn+8I7nPXKBq0CUE7xawMnAZqP5pGsuEVUvWdLF9B?=
 =?us-ascii?Q?dKYS1tEqwRhoJmGV7h3wA9uDgireKaKjvqCFvtsQAW5E3CPwkXIy/5ZuaFXP?=
 =?us-ascii?Q?TKzG1KSpo3/zdZOKsgmXu28y9eiULPKYjeEOAuvr2QXEmVsmTYHBY+B3X4Ut?=
 =?us-ascii?Q?HP6GLp70OCq15kg/W+vDm+O8pwsWdPj5u8Q3yT2iy4J6/2lxNDn0MEBXYOkk?=
 =?us-ascii?Q?UeuJuOY9mmsS3wWAmebSjjI/iiaLuFdMjZRt/uiChZT+cohIkQ8k6P3OG5by?=
 =?us-ascii?Q?LNqcb52vjp/ZIWQsMkSoQZ51tO5MCMUJRTGBXvTZF29hYd4stzfZEmywaXDO?=
 =?us-ascii?Q?mixENKjb61ryYukjztOEu/55bPHx8wmUeqw3vAG/4wxLiJW815RF6r2+1LV9?=
 =?us-ascii?Q?8FZE8RVRzmz6v8nNjAP7HZkpmgvIQcpMnTZGMeXWYRWi4XQzCeiO5i2dLqDn?=
 =?us-ascii?Q?l0bCx2YaHL39ueRCUGNy0DjMFp6JJYvJNwb279QFYXUDglAyaKGbwYkq5pzs?=
 =?us-ascii?Q?N9QXs9LMmw8bQEgmvnI8svvsndlcxx4NIoqy/gnL2ACVuqKF1qFb1KVAuuWI?=
 =?us-ascii?Q?yhTJAZ5Gxxl93vehWtqj64rpwysm1DxZxyprnOitcxHmYsgIUYw3QUPENHzM?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e886f85-5f95-4ff0-ff24-08ddae9e47c3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 19:28:19.0237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLhkl0z/GvzbQRYV616hPH4PvukCU3/kW+kUUOyuIiEM3IuT1N/5oOQRJgy/tdyXtFcjXi+ItLkYZizHl6zI0AMtzduYqJ0gdOt8iH7HqnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7813
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

On Wed, Jun 18, 2025 at 11:44:37AM +0200, Maarten Lankhorst wrote:
>Add a 2-stage GuC init. An early one for everything that is needed
>for VF, and a full one that loads GuC and is allowed to do allocations.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>---
>Changes since v3:
>- keep xe_guc_relay_init() to allow full IGT to pass.
>
> drivers/gpu/drm/xe/xe_device.c | 17 ------------
> drivers/gpu/drm/xe/xe_gt.c     |  9 +++++-
> drivers/gpu/drm/xe/xe_guc.c    | 51 +++++++++++++++++++++-------------
> drivers/gpu/drm/xe/xe_guc.h    |  1 +
> drivers/gpu/drm/xe/xe_guc_ct.c | 28 ++++++++++++-------
> drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
> drivers/gpu/drm/xe/xe_uc.c     | 16 +++++++++++
> drivers/gpu/drm/xe/xe_uc.h     |  1 +
> 8 files changed, 77 insertions(+), 47 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 03825cc214085..ead538029b128 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -793,23 +793,6 @@ int xe_device_probe(struct xe_device *xe)
> 		err = xe_gt_init_early(gt);
> 		if (err)
> 			return err;
>-
>-		/*
>-		 * Only after this point can GT-specific MMIO operations
>-		 * (including things like communication with the GuC)
>-		 * be performed.
>-		 */
>-		xe_gt_mmio_init(gt);
>-
>-		if (IS_SRIOV_VF(xe)) {
>-			xe_guc_comm_init_early(&gt->uc.guc);
>-			err = xe_gt_sriov_vf_bootstrap(gt);
>-			if (err)
>-				return err;
>-			err = xe_gt_sriov_vf_query_config(gt);
>-			if (err)
>-				return err;

are these supposed to be squashed in the previous patch?

...

>diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>index c23e6f5e25141..b573b7731f62e 100644
>--- a/drivers/gpu/drm/xe/xe_uc.h
>+++ b/drivers/gpu/drm/xe/xe_uc.h
>@@ -8,6 +8,7 @@
>
> struct xe_uc;
>
>+int xe_uc_init_noalloc(struct xe_uc *uc);
> int xe_uc_init(struct xe_uc *uc);
> int xe_uc_init_hwconfig(struct xe_uc *uc);
> int xe_uc_init_post_hwconfig(struct xe_uc *uc);

quite not happy with these multiple init. IMO we are exposing too much
from guc to be handled from the main device probe function.

I think that if we eventually balance it with not doing a double guc
load it would be good

Lucas De Marchi

>-- 
>2.45.2
>
