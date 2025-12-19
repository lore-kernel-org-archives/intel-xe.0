Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DABCD78797
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 16:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0156710F02F;
	Fri, 19 Dec 2025 16:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NH23ngfb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56C110F02B
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 16:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766160558; x=1797696558;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mjVLvTdFtb1rXinV22mTeAEq2ZzrQY/h+ewPglnA92U=;
 b=NH23ngfb+7amJum0GzH0E/aU/Qh+KjCzdoOaYVysStpBhMvzPsVnSZr0
 TsRpM0Cjkqu0VZnWbulDjW+C7q+Pjs0CxskLW+cK/BDkYl/1WBlMWMfr7
 k+5HhYRRXXphrqaUoIUM8reHdIUFWqBQ0hb0K9hrC8VMXdvzvJ8WjBeU8
 ntoTZCdO2cfx6l7pCf4gi692e6ktmFNTaFQ/W+YA/N+inHclaSlDdBHeO
 NjJ10OFQYHCwebAhc6PJfvQGG5x9sMxO9F6A5bUKb7zMleWjY2B2TAWgr
 WaFYDVSYTKv3r03qFophYbsxtVumvC2auBhZ7tPfKcuTwxHSklCVIWcKM g==;
X-CSE-ConnectionGUID: CcaE/kXJTPaQiuDnBNXKTQ==
X-CSE-MsgGUID: T3qXCT9+Rx2Fz+HA2S4nSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="85705110"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="85705110"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:09:17 -0800
X-CSE-ConnectionGUID: kvXVWXJTQzKhesQ5xgkOxQ==
X-CSE-MsgGUID: gSevdn9mTEe1GqcQLU6MAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198900716"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:09:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:09:16 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 08:09:16 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:09:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbFkU3sUK0RMzoU5gPnj9TFquio3QPZUQVT81siXJ56CbfKgmLhWv6o0L8tXcIdbNPQwZ+n6ktvMeeZOgCeFQav2ac6tA1iwCrGNQQdpSQBOUMzSUo7679x71pzP3n7qZR0X05EQemcdga00VchrZC76GHoQJW9OaSuuralBi4GweeIixp/PK92GQg72DVLKwIqXucM7h7mTsnhjHYQpY82FOx6AtY5itovPzcU7Bpc0nCEhGkdpRw5HoqzOtVpBQQUeYjrfvg27LJ7v5AnAZ7CFUtK1+XeAHOifs1/KJBSGuSk0hEtwtphF3jYzDJVY3SZ1phuClKn/FqMSo/A1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hn3FzbNOgmdlNtEhdga/CwfUv1OAmWRvxmfoxU5e8Sk=;
 b=SnArZnq8JO5PFIIVbncJqLeKXtLavg33cnCkiam9CC3sItiq3d5KBrPa/WQ0cNwLqi94aoAFPmi5ZaBeScDg+dd9bsG8JUEBY0Z8FcUSoyB2g3xheuTD4R92Y5GKrzBFCF/UjBdwBOGI799SR06xr9AP6wVZhP7RfK6/dNg3niq289i09xlzsvlZJJwURnrmp0E8DQJBX14gkaJk6CbWe+9FqbZr+jzSBcce79bd+zYUUl+Y6uVFe7mmZObQ4fUirrADe6GSXFnyDEd/8p8uEnHQvaKsvnMMfCPxz6D9ngoDfnSBDJoirVl/zlWMAyqFUFLWZ4SZ3kyEPErIZeiQMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH3PPF0515C3CD3.namprd11.prod.outlook.com (2603:10b6:518:1::d05)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 16:09:14 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:09:14 +0000
Date: Fri, 19 Dec 2025 11:09:11 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Print GuC queue submission state on engine reset
Message-ID: <aUV4p3hqylrR2hk4@intel.com>
References: <20251218224546.4057424-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251218224546.4057424-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH3PPF0515C3CD3:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7c49d8-7e61-4ec5-99a8-08de3f18f468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9bfa0DX1FQG4P3xD2EbEG+HKPGgztn4Hz3rYfBZjW1ak8xZNeHxg8Tk0+uh9?=
 =?us-ascii?Q?9vJAJ5o/42Gd9hInEOxJsD2tV5emtj8egu5GkrATJQ7wQKOp8XFf1XrFVuiC?=
 =?us-ascii?Q?IrDTJ9qMx6szXR60mNS1IbVR0ACTw5kwgsrvtftvO2dQ2C/z8jtXw3Rj4f6J?=
 =?us-ascii?Q?436iZGW15hubY9LQi8mterXrZ2hTPXKBoDa/aL9TCGSBJW1TRBSSqmGgssUi?=
 =?us-ascii?Q?+/LddjXHdaXAEW3GI9Ks9L1e/otPxwtq3aKojPuvU/hBtp0IuqehnG8jiHxm?=
 =?us-ascii?Q?sumetBjpjUzLBPZnEDF+KtM4aPOf3wtUTG+vQwLf+LVeMClT3RgaUT/1hA2E?=
 =?us-ascii?Q?nk19f4dywrTKzJNJTW4udLd+i0aIDLdHKp+/xqBV0SxM3ObjkWO2Bi6W7WR+?=
 =?us-ascii?Q?msAgQfEl8A/qZRBNQZ785RGnDRe90rNlX9L9D77mR+wpUNo219CcPkz0+5O8?=
 =?us-ascii?Q?EkLa+rMn+uGh1KHXoPKTYeNP8oC5RK2d6k+Xh9HC7oUhHRKbm8j8sLQbA8xg?=
 =?us-ascii?Q?+UcgMV/k4Smcy1qEBNGgj4VOxKltg4Hq8yvOfgUdXzp2Pq3ffypANMFGS6E1?=
 =?us-ascii?Q?2fk4n3fm2H9Hvta0BdGCqTPtCk6LZ08a6exdHkdj4OJ93S3Vn52Btuu5x7qS?=
 =?us-ascii?Q?iflmKZ171BkRRenQCjpQzkTABynvEofEOpn5qHDj+24SQGwROLytZrYhiRka?=
 =?us-ascii?Q?pTBIRcK0JcWP/bFHtwEcU2QnakZqpm8RJVNRt4IOaKcdYnb8lzElt5KlNZq+?=
 =?us-ascii?Q?VgXaOBrijG+21v9ZFJ3Vx0hI0IHUXUKCPo6nllw8t+5JRRv00mhp9cjmQq5t?=
 =?us-ascii?Q?O6mXhCBVUyG/7JmVm8dSXpdfh3dKQATBYA7AHBfaU18LQyi/usFiD6dA6Nxn?=
 =?us-ascii?Q?93KvD/GytkEWgmgpBwKYK5d8imsVcjspWzcQ6VMrpu38zZ1LOV9cn9gHlD3z?=
 =?us-ascii?Q?U3ObYHuUYvEtI6X8i9y5aChAyFlHfOINHBf4JcDfjXgAMQ46mp41oDnhPblN?=
 =?us-ascii?Q?iLXWqv0HdSijfw9XeBj9vgY9I9901fWwoP+6L49uJ3JGmp3SmsmO0V+otgCp?=
 =?us-ascii?Q?5RB6kvvuyKeOea2lbuhYeXr2sISpqzWi/M98NUJR6LT3MNj1P03n82nGYxTL?=
 =?us-ascii?Q?HPTrpbZY9KJ0n/pr4E8jyUvoyVQyANuFrTxrw0QqyNxvoYM2lrfRYZkoZSL5?=
 =?us-ascii?Q?5/GhSeLQTW4q5pLmmkVo59trdbMlVHG6Jbj0XrQh6lLRxiV3TvBYbALbijfs?=
 =?us-ascii?Q?KCB0RhHezKO5p4dmkYiwHoppzr6dNVNKiteB3RS3rDRVCipxf+7PZuXCbMg2?=
 =?us-ascii?Q?JFit214gPiIzcn8nOpuS6jjdSsHI54Gm8gkchM+nMbr86Mg3TT2j4T4J1+KF?=
 =?us-ascii?Q?jJuWI1tFW4SIRDHi7Th9l3DjSq4nUeFkGC01nPcZirp6EWDaXnoitRl41030?=
 =?us-ascii?Q?am2WNIhbw/4C/K3wEYWdnrb1XLOe3+9D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DyZ4y1L93sIDXUQePiy4Nal/inBtx++WqdEFYoTOAuGPKWnFJA0Z1MfQMCID?=
 =?us-ascii?Q?syHtC7BwkWZXivXAj5Btd7XBv9JvpGbVGPMOT6IoUEy6WoPan8y1IluL28Rf?=
 =?us-ascii?Q?zEF5zp50wEF0o//eZdIq/h5XKqxz+X1Qc0OYZIxcRuaobj3uMWA9cIP7Rgo9?=
 =?us-ascii?Q?N+dbJ/6WOFom6ZweGPvQUWVvS8FqMchOnMcg9uZS6ufFZVZf5fVIz47vzG/A?=
 =?us-ascii?Q?HAvH4qYaG4bSXdNbmp3yXpQpcR5ByLSPAzVmaff1sTv2GihPl48mWnLQIPwN?=
 =?us-ascii?Q?LYvfd1tI1NubyVqtZQ+p2BpKVyKdsi7CcuXuBLz8T27amHoXvnH26pbcumGR?=
 =?us-ascii?Q?Q3SRTsm03zJm46VaEnQIexPZ8wEqURX0gq9P6qYtPyCCZWw4kfONYZWCA1En?=
 =?us-ascii?Q?heYkeAJsBiexLivK2D8ApknV3FO8jZlAngY88jB5a+5oWbqaR2Vxd+jb7shf?=
 =?us-ascii?Q?tDQQESpm0PpCRj+TSW1Fm1fDDV5nNeIpKdS6e+qWqDdGtZPuk9XPC/vbfjEq?=
 =?us-ascii?Q?JdGE6AVxqptYHI+5vvGtHsqAba8avymLrFtmdrz/kcwjQgtQ2vIAHIMOP/9G?=
 =?us-ascii?Q?ktzX2WTvNvPOf81pVvk18o8qHqVxtsqovP55mEnkk5Ea5EdQgtwxo8BISyGB?=
 =?us-ascii?Q?lN2PSrS2pdspHkZad1hsTgSzmt6snjjA0OVODbzGEjBE8tPmPCFYlzsxxvVE?=
 =?us-ascii?Q?Y8iJTSpFvFuW4UxcIFiCAf5FIvZ1/zioU9z8qKM1Dk4DUfe+9dvsK1/p+atK?=
 =?us-ascii?Q?j29sgV2H0t7xd/+8A/IGI/9xZn4gG8u6ffjS8wPR+MZOuQzySo+evXwyegRr?=
 =?us-ascii?Q?TAH4S4amqxyz4lfiF8j6cntSj2/XVHzN5tsidY5676sAtj7MsdunT6LE3AiA?=
 =?us-ascii?Q?XNKy3upsVrRb1uCI++pN2ITcGkG/ns4LCXb/oQPrzRmFdhBkC04qEdZOsREp?=
 =?us-ascii?Q?JxjtyDDC+4R4P0yomnf24t43HnHtj88J9DI0gsSivqmy+h0A1ccfal8Tp9uB?=
 =?us-ascii?Q?CJTkI2NekwVSJ5vkVPrJiijyjgrgGAGJswLp2jgaGkE47p9maP25EdiQ905f?=
 =?us-ascii?Q?LxB9DsMUGqj1dXzfSxTwOkbSCDV0DfZAGMvT3BYszSc4UEVGKXOERF29ZRnu?=
 =?us-ascii?Q?GskauYHbwAKJyVIEn1Q9JgzMQJo4tNRUfTVElWjbV2f9KZKFcYIQJ8K+HI5Q?=
 =?us-ascii?Q?FMBna59We/atAC4VWjzoaPw8H3JCIZsBGD+FlOxsi2IARcO4nNllFrEg2B+w?=
 =?us-ascii?Q?8d2/0WyHvcg79SwvVgsePOv9mcuXRXSfXbAK5QFzc+9GGFC8EJ+ZNMoUAEHY?=
 =?us-ascii?Q?B9oBWPS7wlSjE25XbnyP9Rfr6GxULk4gpDDXucVD6Mluhrv/ffyxuAqmBDTr?=
 =?us-ascii?Q?WtVg0mP+YGeFChOpG4ND3IV9iPkmkQF12SYstBq+unzI9bt9ddcvLK3quQTQ?=
 =?us-ascii?Q?WdI3CEWjjQUJQGry2RJLEg5CruGVhY9oSOJD6nYQJV4Yy2r9gRCdSp42JmHu?=
 =?us-ascii?Q?H5xODXdofOMZd48uoOhAg1oKdnd2H37mQ1J76yqu8R1apUz/JMIZWWcTEux6?=
 =?us-ascii?Q?fRilczx0I+uMc6Q6hJn5AKyNcsktWD8IC0eNnPsbZQY0iZLpBdW5259Bbuzq?=
 =?us-ascii?Q?f0VsE7SeXkE1vjKYJvxRRex0U3p4kWURLdrNvIzHiaWfJnT+PisYzfzYV3rB?=
 =?us-ascii?Q?Lxk6zkfaWLq7mFnJzsUZ1uPcNVl9Bum8MPplDG48Au+nXMzhZcG/KpzDa1V1?=
 =?us-ascii?Q?jSc63c8xlQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7c49d8-7e61-4ec5-99a8-08de3f18f468
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:09:14.7187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAo3uC05EvCqfK5eM9HDFseS2nF2u6PSGXay7BlUK9aLL6de63rKna+qoHO+tKISVOD7pW6YTcDoKl4DQdLpkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0515C3CD3
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

On Thu, Dec 18, 2025 at 02:45:46PM -0800, Matthew Brost wrote:
> Print the GuC queue submission state when an engine reset occurs, as
> this provides clues about the cause of the reset.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 259c4e1dcae7..0b590271c326 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3080,8 +3080,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> +	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
> +		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
> +		   atomic_read(&q->guc->state));
>  
>  	trace_xe_exec_queue_reset(q);
>  
> -- 
> 2.34.1
> 
