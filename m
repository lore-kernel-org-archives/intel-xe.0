Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4436CF9EDC4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 12:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC07010E2A9;
	Wed, 22 Apr 2026 12:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7GLxbVn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5EB10E2A9
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776862020; x=1808398020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lc9JmhdaHFpWZgx+i4l8Rc5WUg3sKJBonEOA9xvHeY0=;
 b=Y7GLxbVnl/ut5dZJ6347x5o+uKKaVJY8rmNGCfk29AqQORi70ARh07c4
 lTsQRgiXwcvV1H+52GWCOvECidOZ5zN+rf5JlByYLA9xcilROofFLs1Dq
 C33o+uaCzW9AodjGrmLJNj75U3Z3H30lkpMvSLtY0N9e/G/k1+FgUmi2M
 rVt92eQcP8yTwjtoQewfBwAELhTMZzAton1oUZLx+TXY2QS5BkV1lKSpG
 qzRgwkSKDg90HgxbcBs88FM9ZP6tkSjteUD2sAWvui9KAAgBuzeyO85Bb
 a+h9p48bKE7c7Pms3PBQr8eHrl925ZlNdEvpZMpcXgM2uV6yLr3+vUCBa w==;
X-CSE-ConnectionGUID: pyX4GKX0RTmQVmLBEaCiLg==
X-CSE-MsgGUID: 0rdTL82CQxmc2hC6Zs7GxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="89199676"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="89199676"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 05:47:00 -0700
X-CSE-ConnectionGUID: /jeMfcByT2Onm2NLRcnBUg==
X-CSE-MsgGUID: aJ3zJVx7RMyT3YLRg6L3YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="255605051"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 05:46:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 05:46:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 05:46:58 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 05:46:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9j/iALkN7BjxVDgDbQrd/XrfkVi6Oeux4HW1ABusf3oLzSe4fy7U3AxPYplIy5kbW0vru2oYAe/izqt2a5dAqOe0YKkeEbnUimQ2ZvZHyVqYF+Yh2Sg8AnYog1O5/Ie0NiERNxq+9HOcLXWuvuq9NhLQ3lz2S1YEaUciHK2myBuhWc91LcAc7gy304WhEaJXoJDdqLnvvzwJxD8HfJdifJJIZDK8h8s5pfjonf8Mv920nExK7+WFt6NN80J0XE/DalycCVoQ8MKGX0kFnDiTTcmGG8h6UGB3ofoyTeASzIlSuCZAe9017KFP8DTM+jNJOpN2fIq43YieCqonhVW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vf9pDjS43hxSV/XJ2m72Se7Vy9bTlJbKm/cA2IzMkQ8=;
 b=OBXKdjiChZTM6hB3mFVyg2nOZ2dv0RknSusW3sO9pq2m/TqReZ1EEWQNvM+V8/C3+PqqGzBg0dFGEp+pePpNKSbudTB0dTmRpkndXyUMd5BmCCwVDCK8Ug+fvlxoIwN2t8GhzNPvL/OTGzF/tNjqLERgRYgxCXb2qrbyvxIMIlzuY7aemCUgxUcrJQz9Ov3jCrI68LFTXnWghBpeHu1fQwo9XT43CqXRkYDbPWTYycge2+D8zeGm7eNj3p44Q+QEEmsTySiyx6ZKNkHECG1rZp9SPqus68KmnjHsb5iJWuJTPiOekAxvffBhKFfG48LKPOVBlU8a2cwDW1qTBUfkqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB8599.namprd11.prod.outlook.com (2603:10b6:510:2ff::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 12:46:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 12:46:56 +0000
Date: Wed, 22 Apr 2026 08:46:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>,
 <badal.nilawar@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v1 2/2] drm/xe/gt: Drop redundant forcewake
Message-ID: <aejDPGmswKnEluQE@intel.com>
References: <20260422121128.1002031-1-raag.jadav@intel.com>
 <20260422121128.1002031-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260422121128.1002031-3-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: da6bdbca-9c90-48c8-6f15-08dea06d3c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: ancpPvh6nll6MBxd1qWXLS91TfmzYR/CIlP9O2dnO0GwWASqj6pROcwTpWaVRjTGEjDHEW2ZiEWPrsJ6Yx6lOHNZf5FUgj/8sdmioUP+mkiCmcmkJCmwBSTz40dGgJ3gkmJaewUvsWlG0S2/TtuUIU05H8D3qFT38uKGXqJOL69FHBBn36sR0fk/NeLupF5tLATiquTBV4uU2/zftcMUHkMV16hLa4ABn32VKDfBr3b6sPrv5H6TI+C9KoMFJJGk8vg/azxGJgKZOfd8pcLPXLeW6KupjOnzoQyKgZoY1k6tVoVFIbcUm0bjHfHxm0hnmHvby4V1Speo4HEq6DDJN788m70m2gXQ8ESrgKGTpeiAPuOJWcUVs73DlyKwcUTjtqM+C+crfuxIrQd1gmwyP0gmeufkm1DdYJ90ipwKOslfhgAg/hzAYPlemPsadWVCHPBVkvxHOJw2Rc7tBOEtaJomNhNCUZ3XPkTJuBkZz5NXejUL+6vwgTH0kdLBkC7IlyQ0ubdAL+StiBdCBtDaczl74vqfZPh8+4HRjlBlmFuLFqv/XiEbGk+0zPzFzwYM14hOs7B17pDJUY0BeH7uD3VpnJTrpNmuCHUITZeb9fFZiuIWkXWVEd4H5YZ1gJH0k+kH61Y/ygUzyG4YJhdQhL64jm4je235cELwaphdjSiB2wx9qbrTx2qy81sldun9qyLxtLXRccSMS6/V907F2aoZUU/4Ov66PN/nUAiBr3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vk/CblnKORyjvKN7iQ8zfBUzkeZSn3+sGQCNItb6/ECMEDMrmmWmb/el1YBU?=
 =?us-ascii?Q?/04z+woIzo4NU8yZYaQyRVvH+/TuO1gy9h7i2jzVKBXFkN7NXRpyDFGbPTkf?=
 =?us-ascii?Q?s+KU83C8CEjZTPq2s79WgMAKwStLWrttwSMFWCJLoHnCFbEqLBk5dBVpbgoB?=
 =?us-ascii?Q?1O15EB++lSlOGhQLBchTGH7xzOrZYN7rSoMr5IBEPOoud1ItTSKCN5Fn4fJl?=
 =?us-ascii?Q?WAPKtbwk/c8EjXh488eJSlx/X4EOPyycwCyqQrvHoh59LAj92Q9Q5V179aYi?=
 =?us-ascii?Q?dfLX3jqpREfm/akcpt8h2ZaUbYPtUTI85i0GBDi5WGkm62TnZ+AEXqm2NA75?=
 =?us-ascii?Q?JOAqCC2QckYPLYf2sQKsHx/TsADlionyO9zqLNnNk1kpy7XCMQWFDYWRcJEU?=
 =?us-ascii?Q?haNczd/pVoZMY3Dlh0+KexMloa9AKydo6raAL8jLwHScyhr6AS0YuiZYx0DO?=
 =?us-ascii?Q?1w+/f7qvUW+IdCD+S6LMfPYJNkNZKTKVPWJZx0UNRygpub5dPCxQWn+2hya5?=
 =?us-ascii?Q?0CBe2uIWFcP2iuj7aacV7Tzz5USQRx2VAFPKSnXps8/pE6k8Pgz8ULam5jdh?=
 =?us-ascii?Q?iJyAj7m4g+mFhDg6JyPMDX1+0k77UYn7xNOuXtcd4uwUMQ/EFPLPAkfvwZBF?=
 =?us-ascii?Q?EudSgtCH8NVTwyzg2Lkkxi+cGRtfuMPnDcluOR9f8YAiMcqljjGMJ5PKQkZF?=
 =?us-ascii?Q?MchoQlN7nagKp2ZiPSWKZ215IRtFfSH5RVWdEm8lQsIgI8QrNTDaeOkUTRZO?=
 =?us-ascii?Q?Gzq3jxPwD34aYn3Tcdiao4mipsZZdzR/QpbqyTZjeAte25dNxPqhq0xrTb+c?=
 =?us-ascii?Q?94JK9Ox2FhQkZw7qcpqT5ACAJxZGfuuTAsAcQTPB4yGqXunqINIyXmP15Nu/?=
 =?us-ascii?Q?sFLlL554o0LmvM3+lVZBWm6Qyg2UaS7qdHP8Qi6sqnlwUMaFLgj/9OdWuhCd?=
 =?us-ascii?Q?esZPIK74dn5/V3tQEyek/+SOG4jcCd2Mb2rDo2FznJc9XSxfAZbn330HL2Br?=
 =?us-ascii?Q?xcFt3X6ICaoELOKTe7imaVzDh72rZ0lv2fsFo+Gk17s0E/ybbD9XuqMUnKZG?=
 =?us-ascii?Q?Je9NAbCMQOc4bUrcBzHwjNbF9UJWw5eyGhhzCgiTBQqNYMmFV8lnTbLPxeI/?=
 =?us-ascii?Q?sAJShYsM2obWyBD97l8kp2by8ANPi/pBvtfYFZwsCfdineX81405ETYEQzNR?=
 =?us-ascii?Q?gKZJu0pbI0/tqyOLEM6jBeU0DNJUC2xf7e1ibL/Tf/OvntHArKP171gUYwMK?=
 =?us-ascii?Q?KXGnv9AbPgzDG7jJeOQ7ddvVU8FL85X0/pqqFrUSQGk4T+o0tOvhhW0LozEA?=
 =?us-ascii?Q?C855iimU+OnPI8dRptvziX4EaknfTNpiNB44zYN0I3gKlA9hz/CNHxPgVyNN?=
 =?us-ascii?Q?WDZOfP23iC+tWzjwSQSRw4gkS/NBtLr6Or9ITQtZtX9tdr6HKWiChr7A+c+K?=
 =?us-ascii?Q?GUItVAQY38TkEJp2sEHNakYu/SeaxesOqc3jVD4qY9EOcesBZlUOb97t4MXa?=
 =?us-ascii?Q?0J0n8uzMN0uAsjAGYIry0Lm05Db/6wsoR0XAwuXIaJhAEWqVjaXdl3qp2XcT?=
 =?us-ascii?Q?G1a2nDZn0Qc/YdJTCctOIiRClqf/vM6ClI+twOTMmDIXXEcTjw8BRXO9z7Qp?=
 =?us-ascii?Q?kjtNuhibXDqhN/7tlWUivCzDUUDu9oqkdiJ8UCc5W2x00PtiX6wgrpTT/PYb?=
 =?us-ascii?Q?7abZkSYzDx4ws5IhBspz029xoM2RutJomUf6NiyQz3OjWe/8IUiBn8ue74+T?=
 =?us-ascii?Q?q1Qwovol9g=3D=3D?=
X-Exchange-RoutingPolicyChecked: WqNvPACsdCp7n7dVRDUxfjiLWoqT+Y7IgDr6EFF2/WVobKVcO5RxWf4o3qs5pHDmg5iInGCzUF05YhKwmhAbZ49iH3DB2LOIiuVdnXJppmb07LpT8UBg+2tjaqPZGHCqR+DdPCHk7ChUCmJA4tgxS/Gr7Vk/DetpFTCZoY+HkObycbLSUVf5BOzvbqYJdUTGotv0+vvHVIlWhwkD/xU3WrUjh1lXcczsOUa2Tx5xmAkKkgCz/tH0stN9bXaySTviWHR57HD8gAa2Nrj7N5AgVEHJZAYn/kxw3lTWhXJsKVqXtnuUZzwa+eitlsAXXZsKqS5perSdxr7FfaeiK1608A==
X-MS-Exchange-CrossTenant-Network-Message-Id: da6bdbca-9c90-48c8-6f15-08dea06d3c8c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 12:46:56.2661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkL6yr3FOJRe1gN/xovqUuZGQwdAhscly/OImTGjvXYYlHb72eQjB3kFYvAulWCJ9pPPL2U8gCWr39VUEdXP6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8599
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

On Wed, Apr 22, 2026 at 05:40:57PM +0530, Raag Jadav wrote:
> xe_gt_suspend_prepare() doesn't require forcewake in it's code path.
> Drop it.

Why? The commit message should explain why it doesn't need...

> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6d6f5a10fe85..168c700af701 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -1041,7 +1041,6 @@ void xe_gt_reset_async(struct xe_gt *gt)
>  
>  void xe_gt_suspend_prepare(struct xe_gt *gt)
>  {
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	xe_uc_suspend_prepare(&gt->uc);
>  }
>  
> -- 
> 2.43.0
> 
