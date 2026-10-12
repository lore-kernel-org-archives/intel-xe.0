Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC1BCA9ED2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 20:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893FF10E289;
	Mon, 12 Oct 2026 20:43:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7DF10E289
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 20:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791837819; x=1823373819;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pJf1syA8ptfy+EkNQVLDpExjdu6BsZWF1OG/UhzX0Rg=;
 b=HI4Btpe1Wl0j9wYJbI+b01XAd4ZU7RvdLJPHt6UHLa3BLIL11kjSGLMP
 T1H28uRbJ1L/DeioqlDyopxv2UmU4nVY/FjpuZoLb/lgQKEEo2XH5mQrf
 WjfQdU2qetba2j+J/dAondTer8DAWcMwlghWq+jpgNGztnMblafpfIPDT
 XXs2RcvqWkU0Tykux78cG41bdtyeIkTpyhPdM1hZvxD+GSdY4ZGD7nlpG
 66pWWfcTleskkBHp7GZ1NxzCfqGQy7X9j8iB2K4uNPrWdQo+8uu+j1Aeu
 oV8BNTw6MZbn9A4LuMLReOxASc3HN4ZzO9BMcaIoYuyFelvqm8Ikpeyt3 A==;
X-CSE-ConnectionGUID: 6CbWSNyYSfa0MNSP/lZMXg==
X-CSE-MsgGUID: l5DfHaSzTQCLnihZtqioLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="543196"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="543196"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 13:43:39 -0700
X-CSE-ConnectionGUID: JDrMxohaSTCqKmwRddUeGQ==
X-CSE-MsgGUID: zPdxyBfYQI60LjMZqmEj7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="907187"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 13:43:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 13:43:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 13:43:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 13:43:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BH3PG5L1cf+U3tKKGfaavVY9WbuJZ+MLXS8Uxmu+68ZS+JqC+uLT6u5W4rEYwofP+pbtlmYxDP6JfqpmUO6HP8IWKTFFYFihTOP7bC3swa6ni4p2b1JtV8AXtxyighqRs5RbIOza7e0ZKYHc9uP3teRXFYpWsBjuMQd2H+WXnN+3QPRYJPAp585NNiGfmMF+ZVME+BhDqFXzvMskSrjowdrgMOPnyntLbsI/5P0ccrDehaq+7BdznczHr84nTUlj7DsNHUnoplR7tqeD3m8XVjkYHkPzoRSrXyhvaAbOPorsy8s90g0xGgJ8Ks/NYhKAQOlN2oEDb3T5+WLl/Fw69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nV9y+f/QYbBivBQYTsrq9lUKs39kl8wjcT3Mr8JHr0c=;
 b=VRHWk77s7DIfn8XtCm9ZZ8IlfQ6SE9M0fWBjY7SWDTXMd1BpCvxhM7chAJFWpjkFWTvOo+sJanc8PwoV0h/PogArN0kfLhNQ8NWa5pm2ieDsG8v1RtcPdlNszEzvNXJd+ZRSR2CQ63SZUvSbTWjvG/PdLblo/4UgOQyJekBiolj05XufDYQjnUAwnRZMo/oD1NiXj26A/fmlQXfqNR25LcN6tpNsAd6N0+hrzfiu9sBldTIztCOh4d6IzSfQlbSttftXYvYzLDitvWgrh2pua4WOv7lq9L+HLboHEU2tF9H6/rtAvV8qfXlg51EaibQQNdbLoqzEDpY4CKUhy75kZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 by DM4PR11MB8225.namprd11.prod.outlook.com (2603:10b6:8:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Mon, 12 Oct
 2026 20:43:35 +0000
Received: from PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::fec9:8db4:c768:8289]) by PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::fec9:8db4:c768:8289%6]) with mapi id 15.21.0472.016; Mon, 12 Oct 2026
 20:43:35 +0000
Date: Mon, 12 Oct 2026 13:43:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <mallesh.koujalagi@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
Message-ID: <as1GdJaxrmUbgkGU@gsse-cloud1.jf.intel.com>
References: <20261010090718.68308-1-raag.jadav@intel.com>
 <20261010090718.68308-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261010090718.68308-2-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:a03:331::16) To PH0PR11MB4792.namprd11.prod.outlook.com
 (2603:10b6:510:32::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4792:EE_|DM4PR11MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7ae53a-35d0-42ef-f7e1-08df28a17c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|18002099003|22082099003|10067099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: TTt+CBRcxeZgD/ZYjseTUT62bgWT7Yf8Jr1vRwvBaCLR1wIiNGTDKcCshfQxJRsTqyv2u+ikp1W1NjypBca//Am3lL60b0K9HxqPLcKFyqJgC2Os4g/Hq/dWxceaTo6NJ0aWQ1nX7vj+HA7ol/+r6fGgikjumOlL+C9xRgNr8u8OLjtdTH+YwJ6vlIF64qQPbzg6XdUBTd6Ttw/Lup/CCmAW99KbhAlabn5F24NuDoudMcSZll6CMFmPF56r6ZGGTDpKIg/ET70Xw4SidUr9vHVX/tmIiwyzMxV8NDALWLC9NCTSENsOdWvU5tMHr6kh5hAaUS8x4T4KTnaPHsl9u0kFC95Yao7O9bx8c6QP4RxyFvV08X+DVTdot8steXfVw1RYkwSIus/rATpzocfUNvE3LW1dg+XOw9PjCPTpfmPJwMdII7fpOPtiZH3bIfiq9Bs0xcC7RtqyJxZLfRhqSI8YqCNeNUolgUPqeXB5dS97OqxRbEZOPjQVQVQTvq2AJ3fMpFIpL3RxWY7etF8l7eYiHkK+3oF8I9ts1QTUkMqE9e1C8ElMIE47Bm5lN02b4c25/GUFOWGtUGg0nCVCMt/3RC3Z6/YXM7cXg+m9WpiP89SWyKcXS9/PZkvZQT7NQ1iJWc1UQ41M9kwnszmkepjkJRBScX4HXDUKR2Ua0L0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hj90Bt/H8t0MfHRVd12vyjI7ZLZH3kE1kxIPR09dbgM2C5PSjm8exq+UGr5r?=
 =?us-ascii?Q?cVc8+BQMpy7gwuO1faU/bRnPTTWp9sxE5GsfqTRR6lBW5YcXIAr+3N/fkiZB?=
 =?us-ascii?Q?yT0GEpPB25cxg4UKuF2Xvu01jZN6P/wMR2OOENowUJHnwuUp5Iibj+H3Jow4?=
 =?us-ascii?Q?qKHOobUWUQEmELJvKGid56zTPe+C1SkqhQD0uk7TbOxEHrpl8vRYOY2t+xgQ?=
 =?us-ascii?Q?be8WNCcgmwRciJI6orZ83uDYbHTnoPF8JAIcAhERKzQ6mRAkOnI0nYvTkuWB?=
 =?us-ascii?Q?16/jJPCCMo+I/0OzmdG8ETNhVSocKCixJX+XeIgU2KBRNQQDbu7+3r3DQDBw?=
 =?us-ascii?Q?PvNdh297NsVoVzHKvYh/5i3CfgcrzUP7pUWCjVupzAB41nu0z4vJYuw3j0Ov?=
 =?us-ascii?Q?qECNdyTUo0N5TrwNMPtm7/fiA2X4j3gsibdtk1WXKalgvYZixQ7ZWYYn+HHp?=
 =?us-ascii?Q?tjmtgApr3OYEjaMJEvdar9fsrAudB35IWxNw6lH6qtOC122oix6rGlh4mI6S?=
 =?us-ascii?Q?IyzCV/FojFncpLzq1149pQE/A4CUE8cPEnWehxWP/LLZHCfHQ2HgMe1ShDig?=
 =?us-ascii?Q?p8KW3swWzi7+p5QKXDSF7VtjDKNLwIFxk8ZYlzfEnUzs8DCVtZl+2FbZUilM?=
 =?us-ascii?Q?4V4wcgwOk6iPfHzNQfHhIO6FbeJ5LKO8B5GyT+JOZApMfZLsKrx3nOy4e6Oa?=
 =?us-ascii?Q?ONE88AL+sQ4pigyiNxu9+ktgel2Us2G8xi2XNQ9VYAPRAfNMgzXk17E/WIjD?=
 =?us-ascii?Q?YqSHRuRTPxxdoKahhTLiuxUwjy+SpOM3l0XDt0XNtQdHhkRrzOZ57NfrKcgO?=
 =?us-ascii?Q?NYj6ma3PckT6RVu2cIPf7wktO9va7ymRcCMDjkRB95qOmcZxNYzDFPNYAThG?=
 =?us-ascii?Q?XyHM6/8GGxcAeJZiX4lk40nt5YxrWT6SX8NCqOxOaCPX282AmM56iN/KJrvB?=
 =?us-ascii?Q?djgFoU3LBVKj6RQE5gzLyDjtzq/P2NBk+4K0/fGXCCP1zqmkW5LTskolyVZj?=
 =?us-ascii?Q?WTqWQ4GkHbU2H79x7XIDawotcLX27GhgA1FhiuI0buZUhEAnpFzGyEi7PPNq?=
 =?us-ascii?Q?OwO7sJIHk1DVKpG+F3hZYknOrh46CEyOKOlx3CpQpMrGPFGeuYg+i6/+TBIA?=
 =?us-ascii?Q?K67sGhD/hH3TY34N0rCylO2AzmCGsx88txl/QR4s3pBrUYm/2xk2q1mPBvd1?=
 =?us-ascii?Q?tQKU2n4RHkHCidF2J+DKIX0GD+EZ90sVMTLAfRG0f99KFfuLynL7Y6R6J83n?=
 =?us-ascii?Q?jPVEVjIMHrj1VghkjPa5VxBkewe/k1QBTUsdsoNyFcV83I7DWY45hDaow5vl?=
 =?us-ascii?Q?sj3hU0pYEERl3lFd6PgyTtaMSHKKKhtI2Y8QtgfJvt1lNzx3WG3M+AcuxqvX?=
 =?us-ascii?Q?2JQvOJ13c+OXoe9lHywMyC9BcDx0bxuPs3eKhRCZjqO1hbEYhSOEdLvmTP8G?=
 =?us-ascii?Q?nku3/7XLMvdZnL+HKH/afU5Jur4jmGYNW0NC4Xcu42/IKm8iKlxtM2IQHT88?=
 =?us-ascii?Q?2lOJ0jt+XYJXXtCJbkKwDE/oqQx5vVNCXDcApLUcamHbGg/XjIY5roqrqqtb?=
 =?us-ascii?Q?2Qya9oAQX/OufiT2KIkzLSvG8bW04Mqj1ZN8gziR2SDFlPNaR6XUDHFTMuVn?=
 =?us-ascii?Q?u6XWS6R8COndFlexgCg8+iaLZGnAN5L/B1o7PQvCkGILIE2Op9sUKg7pbCDG?=
 =?us-ascii?Q?pAgpfQGkPa3Kmj9cMr32K9bw9uormHl5r9ibHIjg1dDgYw/RNCOJ6RbW2Eqb?=
 =?us-ascii?Q?eTzkKxZJkbqWm6zFu9TbklimnHhUXBw=3D?=
X-Exchange-RoutingPolicyChecked: UZky+C8Py3OuNp1pWBaPPpvg87rJ0cpKep0rH6b/KegeQ77gbyB9E7/7AZbMhzw4Xk1lTy8geVdTi+77Ro9R2gqvTnrDxFVmFVR4iRYMDgmAEOIJTX5TiwMOS9RVuoxV9PexHKBDMOPkMPwCdU50c7ohlWpB2aj9cvqbJ0hCm+1vnhgqo6IerD2pzDkj6iEiMl3XT427/alNQ0KYfZQ295K4LNGol1dgfC+LMaIoJxKNp20duNMhYk5YnhFS4nq/4y9vyGLAznKeQ+5LSgvi4W5O8XsB28JYr0i1Jj5dL1swf8b4KBL6/9LDi9cr9ygOBSX5RBEWtqOL19n9h+/s3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7ae53a-35d0-42ef-f7e1-08df28a17c0b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:43:34.9350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2eSWFMYmxNC43XeiSfrxYXan86nfoNJ/aonU7bofH1LCZXb8V9LdHLhJncP4pT7BqaNCESMqsz6aWTL88ydzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8225
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

On Sat, Oct 10, 2026 at 02:36:18PM +0530, Raag Jadav wrote:
> Currently, xe_gt_declare_wedged() stops GuC CT and initiates exec queue
> teardown synchronously. This can result in tdr timeout in cases where
> the device is declared wedged while jobs are still in-flight.
> 
> Introduce a worker for GT specific wedge handling and queue the teardown
> on GT ordered workqueue, so we don't disrupt the scheduler while jobs
> are still in-flight.
> 
> While at it, introduce for_each_initialized_gt() macro and use it for
> wedging GT. This helps avoid races in case the device is declared wedged
> in probe sequence before GT is initialized.
> 
> Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2: Split fixes into separate patches (Rodrigo, Michal)
> v4: Introduce for_each_initialized_gt() (Michal)
> ---
>  drivers/gpu/drm/xe/xe_device.c   |  2 +-
>  drivers/gpu/drm/xe/xe_device.h   |  4 ++++
>  drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_types.h |  9 +++++++++
>  4 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8392c9fad3c4..22ae10958d7f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1432,7 +1432,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			    WEDGED_URL, XE_BUG_URL);
>  	}
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_initialized_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);
>  
>  	if (xe_device_wedged(xe)) {
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 83d6dafab53c..9b09e627af8c 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -139,6 +139,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  	for_each_gt((gt__), (tile__)->xe, (id__)) \
>  		for_each_if((gt__)->tile == (tile__))
>  
> +#define for_each_initialized_gt(gt__, xe__, id__) \
> +	for_each_gt((gt__), (xe__), (id__)) \
> +		for_each_if((gt__)->initialized)
> +
>  static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
>  {
>  	return &gt->pm.fw;
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 775c826b68b4..d762158c0777 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -175,6 +175,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
>  }
>  
>  static void gt_reset_worker(struct work_struct *w);
> +static void gt_wedge_worker(struct work_struct *w);
>  
>  static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
>  			 long timeout_jiffies, bool force_reset)
> @@ -706,6 +707,8 @@ static void xe_gt_fini(void *arg)
>  	struct xe_gt *gt = arg;
>  	int i;
>  
> +	disable_work_sync(&gt->wedge.worker);
> +
>  	if (disable_work_sync(&gt->reset.worker))
>  		/*
>  		 * If gt_reset_worker was halted from executing, take care of
> @@ -725,6 +728,7 @@ int xe_gt_init(struct xe_gt *gt)
>  	int i;
>  
>  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
> +	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
>  
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
>  		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
> @@ -769,6 +773,8 @@ int xe_gt_init(struct xe_gt *gt)
>  			return err;
>  	}
>  
> +	/* Must be last */
> +	gt->initialized = true;
>  	return 0;
>  }
>  
> @@ -1010,6 +1016,14 @@ void xe_gt_reset_async(struct xe_gt *gt)
>  		xe_pm_runtime_put(xe);
>  }
>  
> +static void gt_wedge_worker(struct work_struct *w)
> +{
> +	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
> +
> +	xe_uc_declare_wedged(&gt->uc);
> +	xe_tlb_inval_reset(&gt->tlb_inval);
> +}
> +
>  void xe_gt_suspend_prepare(struct xe_gt *gt)
>  {
>  	xe_uc_suspend_prepare(&gt->uc);
> @@ -1200,6 +1214,5 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
>  
> -	xe_uc_declare_wedged(&gt->uc);
> -	xe_tlb_inval_reset(&gt->tlb_inval);
> +	queue_work(gt->ordered_wq, &gt->wedge.worker);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 628911346455..c00a7c171f80 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -233,6 +233,12 @@ struct xe_gt {
>  		struct work_struct worker;
>  	} reset;
>  
> +	/** @wedge: state for GT wedge */
> +	struct {
> +		/** @wedge.worker: worker for GT wedge to be done async */
> +		struct work_struct worker;
> +	} wedge;
> +
>  	/** @tlb_inval: TLB invalidation state */
>  	struct xe_tlb_inval tlb_inval;
>  
> @@ -419,6 +425,9 @@ struct xe_gt {
>  
>  	/** @eu_stall: EU stall counters subsystem per gt info */
>  	struct xe_eu_stall_gt *eu_stall;
> +
> +	/** @initialized: GT is initialized */
> +	bool initialized;
>  };
>  
>  #endif
> -- 
> 2.43.0
> 
