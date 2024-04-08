Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA7ECD1296
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 07:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D46710FA2B;
	Mon,  8 Apr 2024 07:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5yM0/RL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B0C1121A3
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 07:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712561034; x=1744097034;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mNpl91PM4IAUPo38FKjbGdntQ5BREtB3CYhEJYnSois=;
 b=O5yM0/RL1TrTVYvcCU6REvKXIMJZs4ytIfXs9UGT5LWmvrmd3fRSdQYp
 hPmtABQjHNMrJbopJl1My37RD6VRxOcJugB8yyoDLovzgbeRMDX+XI82F
 QEUJSPWGWSybSUhKu6xdA90zr93mSla1RSycL1zMINlL5D/E92rwgI2jQ
 xjziMndC6UCj2VUYYTS/6wJ54I/f9sH+z0glUy6lqQPNyGyx0JUJ+W8Ir
 Im/ScMB7cprGIkKyYZe6chRv73JbNPOyDXzwRTJByNRVtRBLFkTzeb978
 kFEuRa3PdihTmXbzAkdAIUxdzDV0HcIhp7735dZZjDnp/WSRdUnNUOxh/ w==;
X-CSE-ConnectionGUID: 5bt/dKCtQxeykMkolbNRZA==
X-CSE-MsgGUID: NqQpyP/HR1aDfaMJUWaTsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="19261555"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19261555"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 00:23:54 -0700
X-CSE-ConnectionGUID: Vj5xMDbTRcuRastemGtGMA==
X-CSE-MsgGUID: 2pK62K2rQsGmoVahZ6MU0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24291834"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 00:23:53 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 00:23:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 00:23:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 00:23:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHVkcGsdOO9kL5Csz97py3zB6lKhfzIM+QVEu87bGu8CRbhceN3DsamMFNbDw6ilTAL5sTRiMKdFBcKbWVE69beudueuX+CthuttnN4skB4mq8nxfF/RyNRzDPomCfoDQ0+5/+MI0JR+pLOx62u+bCjRby3VNnPw9qLPcSUyvTA3uGrGwKFlu4osbNS0sED17sOHqjE960iL1Fbxdimg94BWV3r1MlJPwHf3v/y5jUHioRuxD46GcTDhoToxRVQEIHQCkHHZHj1vkq5Y7u46lhEEsRqXl5rhOLJpKr4qcKYtk2rLy417pseO7wHWxwdao00OLsr73Cip9/XVBkQCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRq2OTPegSUJKh6fe59vCCdFrPAg5DnNJZtdZjBEGE0=;
 b=QsM6W55wh4LbDDyRgFwtwIsMeL+QHiiHFaK210xtNw+CjxEpXqoCtyb842H7MvDuWT0HWZa+4BUleZiannkaCE3BIcfgrQTdOoUkstjC21EQYXwSK470mCLmNeB81BXaCvPHs4VX1/O6fNT4gB1y71G5H3grCmhs4Bvv64bn9cH5jzU6NADVgpcJJXy2cTxRMcvMlrEsHbbbwsq1L6s07CMff6mWQlrbYRbOfwExvqln+Vynzg47F9+qHHDI8cC998lag9Z3d45Kyq69X3oK7X/GsBJkahrKs4wqgXwvq0kxFO9O+691LKv5rxeDU0wVimrxHOPhZ0AfKbtEiHDfMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Mon, 8 Apr
 2024 07:23:51 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 07:23:51 +0000
Date: Mon, 8 Apr 2024 09:23:48 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Check pat.ops before dumping PAT settings
Message-ID: <20240408072348.rvt333l6ckepylc4@intel.com>
References: <20240405143625.935-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240405143625.935-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DB8PR06CA0014.eurprd06.prod.outlook.com
 (2603:10a6:10:100::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7651:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gzwKiOn0Ksn1EVomotNHbk/Xy3nd3MqImj2/Y5Oi5fU+OqKqcuce8z2/MMbVKwAOoijMRIrnfrF4FVLG+7IlIlyX0iJiZOZYC5mquGeacojz5rQQ+LvzfWMP4GbmXgT/WxauXZpjNcWogr6xuvDrGJxEO+M5VmL49LQju3V+E+53fkX+dEUJ1/vpzeZeBrtlb1/ijobSX2677sz0QPbTVQOoo0sncu+VEFlCFL5Edckk+74vSmhvkHcUNMhHxF89z3sPE1eieA7w1/E1XkBy3IrGigZptyzM+0XsRQrwizNpUFmvGwYuaNrB+q0JXLly9X4xZrtWXa5gDshfWj3WAhkMt3JWOGVw/IkVR+GGLlvTuF26tP7SZg/aP/PO1zn8PuYvp9At2mGi76lNgD12+qVO/WWm/M9/JW/WXVUEIdYAnUy/LDMkS+CRjVCLK/yyKnElj/M1I0W2eLwUCFPT+Jva7W4aA+J+Rvf6V8Osq/RoXC8OvnLHE1EyBH+rpXBgJgswgPYOY/Wx/32fgqQSTFe2/SVuP/orAzkKPIPb1/wjcWOOM/FUth84bHss+mllyYmi5PCWeSl6ObIB2uc2xInum8Fvh+6bDcIa0/gaTB7Qr7FmfgsUILclbjFMgHE8dsaU3hkLH8MsXcgrEuvwSkf5Xkka7+qr1/JrHQkoCvA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVhxc2NLb2Q0dG1BV1pCbGJNVVpzS3hIUEVzNVE2dXdMdVl1Y1JsakhBTTRm?=
 =?utf-8?B?cURFL09zOXVYZVo4bVBiZ3p0RWk3MHMrU1kvbFFiUS85VzhrSnU2UTNMUUtK?=
 =?utf-8?B?N2REZnFYNS9HV3ZjWkk5KzR4OTFpMEdTYk9vMjhXazhBZ3doVDFFdWJCQmNr?=
 =?utf-8?B?K2lQL25Uc3RqRWl3dElSYlpZY1NjM2N2S1N1Z25WOGVpNUtITU9tUVlCbHdt?=
 =?utf-8?B?TTltbE9udzhFRCtmWXlESGlITTFEUjZTUXp5MDRQeXovellQN2ZOQ29LMkhE?=
 =?utf-8?B?MnF3NkVMUURDZjhoeXdyTWQ5bTdoYmNaa3BQbjRNOE1YMUFGNVJ3VWU2aTZ5?=
 =?utf-8?B?S3YwYXF4SW02QVgvcDBKSFdka0JGT2dUNDdtU0dKL1FLTE02bDNPek45QzJM?=
 =?utf-8?B?R1g1MC9QU2NTby8rZDdyL2FBNDRja3c0bzcwNmFFdkhyd0w4TXA4R0htaVJ3?=
 =?utf-8?B?alJxcnAvbDhDbHJQRTd3aWttSWJKdUUzNmVGdWE2ZTgwR0E4czZvdzA0TVo2?=
 =?utf-8?B?eTB2QU9VTjZkUFRoWmY2bUtnYnZpL1NxSmF3QWxFZVVDZkI0bnBYS0pGZ1ZU?=
 =?utf-8?B?cis2enlDNjRnakUvWURidE12ZEdWU1dXQnFuZ1lONFZrN0JQMWFIUDVDcUdy?=
 =?utf-8?B?NElONXErVXlrbWE2eHpYT1VyUUtpKzNmV0hhZG0wbzhVb3NMdUJwaXdRbTY5?=
 =?utf-8?B?VHZ5MHp1WjV1bFNia3dYRW4zNG8zUThna1dCY0tqNGVlb1l6VjN3bEdKMWF3?=
 =?utf-8?B?YjRkTW8rZFlmWU9kbmg0ckxQdjVMellHVFZqeTdxUVhMUHFZSlFBcWM0MnUx?=
 =?utf-8?B?VVJFTzdsTm1uYzliUzFMTitST3grVFJLWHM5a2RFUkRDbmh6d3Z4Y3dDcHBk?=
 =?utf-8?B?Nzcrc0VvODJjUGJKV3NJOFd4cTNOazdubDA1K29jY0pzN09LcFQrOFU0Uktx?=
 =?utf-8?B?eHNZeU0wYmY0U3NHRE9yZk5Hb0FOQ1M0UHdKZ3RqZ2I2OCsyWmNKUXZwTWpT?=
 =?utf-8?B?MytTc3kreEg3SmFNMFQzS3dEbGlHb0tFKzQ1WW50VDJxU3FSWkhjZEFlcnBH?=
 =?utf-8?B?SGhzOW1leDNYYVc0cGtQajU4WHNydE9BcDhFcEdZN0o1MC9NMjJ5VHJwUGY0?=
 =?utf-8?B?M3E3aTFnb0hTSUhTMlN6UkZsQTc4MSt3dHQzTFFIRjJWbGZsbjdYaVp1UEsr?=
 =?utf-8?B?emtXb25saUNvR2xFMmx0Y1d4ZWdOR3FzMzFLUTBsV0tiMXk3TXQ2QmVBelg3?=
 =?utf-8?B?bWVlTFBrTDR1VGxtMUVVQ1RXeTZOL1FsTjRhSzY2TG50aWg3V3RSbXdXOXdN?=
 =?utf-8?B?N1lXL1FkMDBqaHBkOXdiMVZyYnFtSmdsOU9vM3FGR1JKOW4rbWlKQUU3K3Ar?=
 =?utf-8?B?cU1ncUMySlJoU0VpR00rS1daaW82Z2g2S0p4UW5va0R2RzlQZ2FvNEh0K1py?=
 =?utf-8?B?WUpJdVlscU93SFlvOFhoaXo0KzVLSUEwL2krbkxmMy8wdlNFNkFrcUxyVXFo?=
 =?utf-8?B?ZGNWOUMwWFlDYldDbmgzMGsxWU1MNG9naHhzUjVVZzQ3UHhKMUpiVTBYWGsr?=
 =?utf-8?B?bHEzbTh0NlgxSk5HZUdiR3NnOGtLcitGeXdWbTdVTGhhU2tiK2JOSjF2WlNB?=
 =?utf-8?B?ZE9NbDZqajhmcVo0NmJtaE5zSVY3WVJjalRQU2dGQVUwNGtURW50NEI5ZXRP?=
 =?utf-8?B?Nks2aGMyVHo0Y2NOd3BYNFMwYkQ1eEN1dU5xSmhEbHhnam1BSG1GcTBSU3Jl?=
 =?utf-8?B?YmJuRlBFcXFLN2hmMDdKRTMyWmliNTMyVGlYOU5ZNnFwR0hpRnFMRytYZEdT?=
 =?utf-8?B?LzZXek5Zemw5YnpiZHJ1NGRPL1Uya1lJMjdWc21McU5ibG50L0d0Y3o5SnRW?=
 =?utf-8?B?ZGZjRFg4SXpkaW53bmd0RkQyRGxGTUtCeDlxRjVsYzRTUFRocEhSVXlNUk93?=
 =?utf-8?B?ZnhjYmk1MTdJOTFXS0piZkI2MTN2RWJvNnZhYW16aEFmZVI0cHA5UWtJZzNS?=
 =?utf-8?B?QWFvRFpqazRyUkQ5eGQxdWFLSGtRUGxnQldqQ253bkJuSlM1dHEwQUU2OG42?=
 =?utf-8?B?UU1VZzRmV2hEaVdKN0dEWUpRdVk1eGxVYUJkaEFheEJ2ckZIWTcvQURDa0wx?=
 =?utf-8?B?L1gxeXQ5RW0rNEdjRmd5RDFYdU8wdU9Hd3hGUUFvZlFpTWJ1aHZDRWNTajYv?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b20c8fe-59bf-45a0-8722-08dc579cd69e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 07:23:50.9133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1RPeuyI/AEvccfH4M5gNLH0mwdNiXCGigu9EsJ90lsfXQWREgqTrpSuh6XpTfx0Y8lSV3LvWSFQlL397r8WbAWCw3dxuVjPK7Y686SZsy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-kwi-05 16:36:25 +0200]:
> We may leave pat.ops unset when running on brand new platform or
> when running as a VF.  While the former is unlikely, the latter
> is valid (future) use case and will cause NPD when someone will
> try to dump PAT settings by debugfs.
> 
> It's better to check pointer to pat.ops instead of specific .dump
> hook, as we have this hook always defined for every .ops variant.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 66d8e3dd8237..f0031c2e9818 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -447,7 +447,7 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (!xe->pat.ops->dump)
> +	if (!xe->pat.ops)

You are right that we currently have a dump pointer set for each xe_pat_ops structure,
and in this situation it is enough to check the ops for the cases you listed.
But I assume that since we are verifying the dump pointer here, that formally, for some
future case, we may not set this pointer.
Therefore, it seems to me that it would be more correct for you to check both pointers
here: ops and dump.

Thanks,
Piotr

>  		return;
>  
>  	xe->pat.ops->dump(gt, p);
> -- 
> 2.43.0
> 

-- 
