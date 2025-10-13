Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF3CCCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 21:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF2E10E153;
	Mon, 13 Oct 2025 21:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYaMFacD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEFD10E153
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 21:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760390072; x=1791926072;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d4gdgjlJKU3IFLXMapzpjoaIH8/JZnWwRj33njk8rhc=;
 b=jYaMFacDzffDwTuLHfe7+t01I7gZ76fyr+mlLVrgSXO7nbmJOTJe9h/+
 /9RZesIiDzVhubSeSd+4ZaGYMyXCJo04Ta7tekFEI8MCTnUCVohMNg+dR
 d+afCliAM9GDTSTpVpqAHB46R669EnURIHTiW/izkVloOxca67r+aQqIW
 G3nETrygWbs0APyFEFNGKShj+uHAAPvlDTblFLXFZoDC62LUoTftodj2O
 k6qvHLQxZIbd7CY35C7iUJkBYjvT2v9DvxhB5f/PzrVCBqs9/2nHhSo60
 eoYXLOEqvb3XliiJ+cBsKt5mdHgBZhFf9wossi2ieGc1kQXhqReMEXAHP Q==;
X-CSE-ConnectionGUID: gxwVgg58QfWjllnYk2Fiag==
X-CSE-MsgGUID: zFi9s/prRZ+g53z1Xfd0aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73143943"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73143943"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 14:14:31 -0700
X-CSE-ConnectionGUID: ZIN0QKLHR/aFymcTNyzhTw==
X-CSE-MsgGUID: zIFamCVqQXuxz/aCIjTfNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185953315"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 14:14:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 14:14:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 14:14:31 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 14:14:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmo3V5SORIyJiFrGVaYvpZDtVkcX7n2E1GnpXniH0QrmUqRh3s8mcS95R2bcJidVtDlXr7vhEDnXBeKL0gPy3/y/UkN7dqKRlDKsdSHS6cT8tOmlLytBV8kC3lxd5hipKGFlcj+dd/0iLI+Q4w7+j/tOx+kWl0VPUeMbD0+i2mvKMU9vCHPLCApH6s2nzKNROJnIYUE5fT/W/eX/Z0oRvC9FzgfOi6bRhNTp7KK49Ov6Jm6QtqoYSOe7AdeuwAbn2nbuEsaXAqDfMHaJakh8eWDMxG2HNujic04vCyIOZNO6gI67Xf8RGw7UitVknv/cj5TKy5N8r6Yjly8GilXKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rR3H3hPGgUd9/UvNdU+XAY6Rdy7Zx1vQ0si2df+tnA=;
 b=Tfn2G5FzCdrv64wYNgYuZ+80bXnpPqRsf1wSRm4uUrhqwNEnsnyqTI3nDVkBSIsNIp3WqID4hUJPMKQtcCdmpn9/q/sDGsrNXef12oMj5H4uL4dhW+GGtI7Vn5j2ShQ52KyVaHuEKNvXmCeKCR+xlMccdFEkOBddIh821Yax5U9FehEIktHewzkal/fsFinAzuw4TCW++IStv3CJsgyAyplUlnIvHINON6sHzTe3ZvAlbbKRtthbk+oHnjDN63RzeH4THoD/py4Z3MxFk77DsqzbMo+ZeSp0cDF74fmE2IL+doytd56z4iRW7fmZIlQVGphp58EUbz0MiE48G2ew5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 21:14:23 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 21:14:23 +0000
Date: Mon, 13 Oct 2025 17:14:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe: Guard against NULL GT in xe_guc.c
Message-ID: <aO1rqyoSZS4g2C5w@intel.com>
References: <20250926200917.164618-7-jonathan.cavitt@intel.com>
 <20250926200917.164618-11-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250926200917.164618-11-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL3PR11MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: a044f448-6414-437c-65e6-08de0a9d7b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GjlkSyq97hrdHp4yzV3ysQ5ZZpQdEeQjlCw0lKFdCqiovIy86I6B6xsoIKFJ?=
 =?us-ascii?Q?WFo14It2YzIPIKloPIPHpNFPJ1r2E/hnXwKcqZK5AsjIntIAKKcoohxE9gKK?=
 =?us-ascii?Q?SWC16aOZlMbtGviKE//TcSfI3C+n06puv8aD1mg5RsX6P2F3sR4XxgoceTJ3?=
 =?us-ascii?Q?SysBOv1Vz5TuenetWxohI0nWorTIpCzfLBEIztPMWixW1z1EskJ05mh12v3y?=
 =?us-ascii?Q?PYFGnRNIiDdM56o9SjnfTCh33W/5MYWa7s7LhXpZW1T1yhgYnq0GThZQZcKw?=
 =?us-ascii?Q?gYQkmHHsJ3UCEO70q6J9cnJxRJoIHSzL1x4UsUQJ8+JrnqYtLfmmeDQa4eii?=
 =?us-ascii?Q?qSLZpibMULJ5sA6PapCOsINLi1uvguvjiAk/hRbmuRfF1hd1RAGMP0MWtZWu?=
 =?us-ascii?Q?f3FO1XYYNxWIJHYphYVKLqaglNAxO6fdKzhu6U7/RdsornBGA0VEXdjpor00?=
 =?us-ascii?Q?vywOuuMnMrEYZTUJOiUY3pv2CyXH28sIvKk2Z8IU20XyqejuJ6YxsZ1VWA4x?=
 =?us-ascii?Q?x/RV6exCn3Y0LotJi7sDfaG0XoDx66pMtBCRl0vIxM5jJsD6LwVMUrEDJPfX?=
 =?us-ascii?Q?dz7UaPAysh5yKEYwT6B3RhWDwe9NOpv3VebpZOJihiPHdJ82xyqwwB2Wcj6E?=
 =?us-ascii?Q?EAV7Imt/TcidK0bcf26Pi6o+AMKfLAt7a+WgIpMobJxFkZ8nOKKGpMY2LION?=
 =?us-ascii?Q?WJRP0SZWpBF/RLJ9b8zqIDgLF+8S8gxi3mFg8YqqT0mYj6nUJkUad23nHZyk?=
 =?us-ascii?Q?ApDKwa5cAaaKErXwBqV2Y1hNzSbCTktm3/HWp6ivE2hEw2qgHZrnQ4ch1opf?=
 =?us-ascii?Q?CYyx8O9EGhCIFy1SF7d9kGBLlCM8YGWq0Pgf2IiL+ELCNfFK3VEHeanWxk9w?=
 =?us-ascii?Q?1ouci8jCM2PYqn9s9oGpmj+Vde8ZQ4j3BkSINL2BJgrXQldXEgN9a5wakOF+?=
 =?us-ascii?Q?oTGkvms0h7/fE60hayVudlHl57pGc/CpGEngcH+zoUGSZ/UOoyaBmWZmbeS9?=
 =?us-ascii?Q?YXumfcBqokHZxmfu9vuZOxQeI3gG53y4g5GqiRWrsm3U9n7s8EsmuBu9M+NK?=
 =?us-ascii?Q?zlRpsmkDpbTviRgiMDWLNvZOeXcUgm+1S+v7DQ9N0HB3fTHA1B9M3tEBeffl?=
 =?us-ascii?Q?3mn0LnHqPHGtWjgo3fdMcf3uPPX06GW3LCt73nE5V8/BbBbds85Iij2lk7yT?=
 =?us-ascii?Q?Zh2E/v5QIMhWmAWu6KSiG+By7pQ6ztHGP5913lDsanUy6/g37YTBA2zh/E/M?=
 =?us-ascii?Q?Y60mHcjx3gELsr2weTERDdcFWqGzKf68AhxqS2ob8eaIkruHWjvHItw0CGNj?=
 =?us-ascii?Q?rU6AdeBfu2PP8nIjc66OR1PZE5L+Y6M9DJd4qixt2gtIAFl9xkf1/9TyxBpx?=
 =?us-ascii?Q?hl95qPbxjorB0oRx1V86ucBgQdMc/NuwHETW/sSDbGsThtPzY1r++aRXDZPo?=
 =?us-ascii?Q?B0LluhAQAMzMvzmkN6vgSxqt+NhW6krG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h31U3bjNHJWvkzgnwDFvGs/XYOsklYO1iV+9tlSJ5WXQcDjAq3d40Tv1U+xC?=
 =?us-ascii?Q?PV1X7eyjsW6FCuT1JeXWsM1w8Qgb4fZUh4YfVQ5JHjudvBIvQUXDvrNw+TCp?=
 =?us-ascii?Q?MIuArAgSvx6xXgY91nZB5RtuugdTscDpkww0WCV3fDCHPP0737EehdO5ia2Q?=
 =?us-ascii?Q?BYFeYmOzAd4lWPNNz/Wx07aQJoih/b2lkEpPC4lHeWu6VuzTToM+r7sRMu99?=
 =?us-ascii?Q?VAO4QqZG5aY0zQ9lpAXelBdaqPtmNa04sxR3BXTMXlYohnv0g8UhlQETEXRx?=
 =?us-ascii?Q?RVCtj4w/SXdw2HlGBXpC/w9TDGVI3lNJ/VsDYbbUjMygw954ED/U/g2P+lOv?=
 =?us-ascii?Q?V3cFAL8eoKZXN2qYUd3SBhsyUQPnhpyO5jLJYb9gZmplySPJ4ZSO7W0qNhMy?=
 =?us-ascii?Q?AIz7k5OKfWi2DtPIxGb8bd9MWR1w54eyCH5HMJzwHWmPQSXUXHJaqN171OAw?=
 =?us-ascii?Q?q8WY7MMxi4RUzJWAb63rXiE28Qlk8vHaWIY8Wmg2JZlp8K42xKxHUaSN3V1z?=
 =?us-ascii?Q?U22jSwfMytYwX90kVnaGZtmocGHW5Ig7/kOCqTVXfLwkPb8LzOOu36RhZLkE?=
 =?us-ascii?Q?ohJ/jD8ilMmh0wLJmOuTcLVL86wNbz+CVr8wQgA0zgRAfwrr7DTkZ0h1i32Y?=
 =?us-ascii?Q?hplWXk/qUrW4AtNKOCvwU1nKdV73eJdo+bdzIWw1sGcFopXpVTLjuafxBkW2?=
 =?us-ascii?Q?ycwvrcXtLEhJJj3KkVLOGpZz7g08VnEhkoVUX2IRH2MJkGAwrydsa5bt+Rea?=
 =?us-ascii?Q?DAB0ypy3M1e3hawd5vqHH5dVFIhnBxsPHRTBuX38XguMl2DFZUn7IIja9ESF?=
 =?us-ascii?Q?sc7W7BxPB6rj4QhTcW52cJtRJ0liLsEi+80JZ/ACquaLID0GzbXUHGRA4i0u?=
 =?us-ascii?Q?W6Hi1p8HhK231fTK9byqsthk0uCBOTplBwCYnzx6rLryGVO7aEip0wLDS1Gr?=
 =?us-ascii?Q?BCIif3rGhN3tPT492eb1W4AezPVkowT7cg+cC1Br72yeSDl6yXSJ+AIOm1hV?=
 =?us-ascii?Q?RxFeMHLR1uW4gNCGmZhhgCGbVzx9mYm1cugr7rLyDoJ4xoIt4IS1P7O4E1tm?=
 =?us-ascii?Q?VozwZmbzx4F85xcdjssc7hB9+h8Gd0Tg8Vdz1mND6ngRbfWxPFt8LXsSuUoW?=
 =?us-ascii?Q?YXIDU4yQmIFClzLmTrRJztKeVYshDyUHXwEH88XXHmYhLLOnrWLVpJqC4UPW?=
 =?us-ascii?Q?Qc/FzFr0FXNyts5fx0IZtVuAWIwjjyKjAlAh46j2aIFU5WUMQqIR4Y+l191/?=
 =?us-ascii?Q?8vIawNwiGD9E33ZDLUNblTgF2LpTXIFjYy7BnPQOTGaPx2rxu/UUaEtD3QVb?=
 =?us-ascii?Q?PicznuOdbulGa2y15Nw5KGokbAt1bm8SZV4aMRwrGZQyMcjfGvKMk4ax9t49?=
 =?us-ascii?Q?+TYcZaNMbWG2pvBli3aXKHHaG/TDb1VP2MQssc82olpgp0afpQiD46kk65/6?=
 =?us-ascii?Q?BvxpUE/OJdCx5yz7oOevQdIgn1gEEnGlP0i3nPTYe9oxbMsFbaFrtU446KOd?=
 =?us-ascii?Q?mBfgmXbq8wbA0Bse3paPb/TsMp+kxFtVdfGnGVHzVuPXwCFol/ircbbFdowM?=
 =?us-ascii?Q?20H/WvwJnQYO7SttxNCsSQ8I7Dp0UGsnsbbqa2bimTvCoMYkzphTKcCDxuRo?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a044f448-6414-437c-65e6-08de0a9d7b70
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 21:14:23.3427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tajfbPwYCJdo1JHoKM1Tl1ShCLlUFEdXS1/LRPi6pOE1wALIGTugMgE16AwIaTYRAK3RfMISYQN02Rom/GnsyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
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

On Fri, Sep 26, 2025 at 08:09:22PM +0000, Jonathan Cavitt wrote:
> Static analysis reveals the following issue:
> xe_device_get_gt is theoretically able to return NULL in some cases, but
> several use cases don't check the return value before performing a
> dereference, resulting in a NULL pointer dereference.
> 
> Use xe_assert to assert root_gt is not NULL before dereferencing it.
> 
> While we're here, replace xe_device_get_gt(xe, 0) with the equivalent
> call xe_root_mmio_gt(xe).  There's no reason to use the flexible
> xe_device_get_gt function when we're only always tring to get GT0 here.
> 
> v2: xe_assert root_gt is not NULL (Michal, Matt)

I really don't believe this is what they suggested.
I had understood that the suggestion was to mark the case as false
positive in the tool.

> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d5adbbb013ec..38fba439f1e8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -466,10 +466,13 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>  		return 0;
>  
>  	if (gt->info.id != 0) {
> -		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
> -		struct xe_guc *root_guc = &root_gt->uc.guc;
> +		struct xe_gt *root_gt = xe_root_mmio_gt(xe);
> +		struct xe_guc *root_guc;
>  		struct xe_bo *bo;
>  
> +		xe_assert(xe, root_gt);
> +		root_guc = &root_gt->uc.guc;
> +
>  		bo = xe_bo_get(root_guc->g2g.bo);
>  		if (!bo)
>  			return -ENODEV;
> -- 
> 2.43.0
> 
