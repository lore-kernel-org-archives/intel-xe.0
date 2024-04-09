Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2443ECD1284
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 13:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9BB10E97F;
	Tue,  9 Apr 2024 13:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCge77aV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FB410E97F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712668203; x=1744204203;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6Xjulw4wduedSMxDr9Xn/yb4lT/C1HMiYYy1XrcaDuo=;
 b=OCge77aVw2qfnztvl1/wCH65ev6iSwVNw827AD7OyIeukMgETBl8gnbu
 5QKhUDolwGR6FfC5ERhdaiB5RgFu8VEjT3kzjrk/st2IZq5OjXvtRLW/O
 GMfBX37H+Q0RBbxG4gvmrnpBAWODwCWkComibr1+qnl8PtlYJeS+90f2U
 eCJjc4WJ1GN1CnvNOcebgbk7QDMgTXZPlKjHhDwlVIQJhG6w84IhQc4NC
 MbwrEvgaVMQJyzbBEXGSbYgXNI1B0oQZSb1fjhemTSTo34Svtz8Hkj6n+
 WXlY9BqZ9+Xuwtk8Ehw/LPghuiXyXuBhZmZctd7z+FAwEIpTvQOiiQRqP g==;
X-CSE-ConnectionGUID: 5hyvDp+FRTCgUh4uugP4sA==
X-CSE-MsgGUID: D7KX8WCERdaNkCON3nutZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8157707"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8157707"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 06:10:03 -0700
X-CSE-ConnectionGUID: 5SFTQzeJRPidmBxNa0RH+A==
X-CSE-MsgGUID: diz4C8c9T4ayB8pbS8142A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="51420747"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 06:10:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 06:10:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 06:10:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 06:10:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 06:10:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYr0x1az3nB9lO722i5TTNWOO69Yo/2r4s1+U99AMKO8XK4oMChO11jvKrukGHpQW3O+KWGN3qN4oxC+1gaVrL/yjl4hJ2uUSqAjrmhdQEE2thUAGWSIFC0UogBvyWQWONa7hW9TSp0Qf62HgTnBERKQNapIw2tCagfP3vcvprb8Fi4M45GBOoQC+D94t7xv4lvd2iYfyx/PRKShITQAbo7vc/VsILMj9jr18frhBV1ODX+2BRkWz1uTwlv2ck8kMSbY487YPohMt4pt2JmdS1I/deKyVMEUggd0jM9cH/DesUa4eT08Jsh5vrNQ5AD/k58rZBvMyh6d5L5o1W+MmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtFlKYzcIt0WyRcL8xu09dYg3EgMU/+/OhWNu7Q23Lc=;
 b=DXLqqeW3vnWN5oII5qmps3CecnglmuKScDa8NSSKsdX0Gra9MqPAbLc5D6in7XP6djA860uymkuqQATVM9NcPEni9DMEriXPjF4KIgxi5zkK/GM9wO9MDG7yefjpkYLpUuw6194bjDHwTnojGFLsnRbQE9DuZO5NuLU5+wn3po/GZFM6ecG+9C84BEeAk7dmNXZx3DpUtqzhvj0Y7xtGBC2WW/HGZTk7Ux+D1uBOVoeOW98fOZBmr8M2dSL7d5W/GblIfHoCC+OEt6/geoPVI2kMkIgpFKpoBSd7zvmd2IdHiGkKuM+aPWNlHfr3LijGCRdyKpIMOriRvORNWZgvEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Tue, 9 Apr 2024 13:09:53 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 13:09:53 +0000
Date: Tue, 9 Apr 2024 15:09:51 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Check pat.ops before dumping PAT settings
Message-ID: <20240409130951.gspyxhkew2hefkdm@intel.com>
References: <20240409105106.1067-1-michal.wajdeczko@intel.com>
 <20240409105106.1067-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409105106.1067-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB6128:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aiJyQTQ9v5sDHfNOJ8e1AWR5cAlArvq1M0Rg1QOKBCUE4GbShYr5yzAow40gDW/TQI9ELJh8C1cB/V6sIpzPsX4L1JC3S52gx7MRJ2PBFvSM/CsZuhISJxi6kcqpEa0W1yvMZXV5Wm7wNhf0joqRvkNi9jvo5U4/x/ei6K2O/jwRvns8PyHAjnd8QsiDupANRNmK5gBOmVUUzYwGy0VEb6pjVAWMbaQUtHaLk4MJUtTykGqZjmc81HkqUue5WJbdFb8URPQS7hz6SXmUi1m90ojc2rCW4V7xrIAT2i5WYV6qRTutR/+brlzFOYU66N5K6Kz6fsAQgbMK2mUeBGQyIQI2IrztxVnauJ1bxEGZ179ENWaljf7sxGaR75Q52iJ0rPBBcxTITJeJJ+AtgxJc0ssKz9Eq5HzH7DOVzR5z4rvRTA8/3n6TGXDbNW9VZ2/Pb67FfaKsqasyODFr5Luo/v0roK3Pd/zztbNBeuWBcHowFv3xKFRatT5yXy8HawXPS0VsYOTn2yLuc5XTcCAmbGnMSTiRmbfLL0Iaumg/CbZcFCryg8dVN9WDASTCIXJdYloxqX5LIkJR9JiDqOhCZcR32n3lcM9MibTdOPhnuPLZdjRbeiQ1AhGSRj3bVggI2OJQFxXwNWHcI2O38n5GuXB1j0qNGLaXl6Dj85DFRWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clBVZk56S21RaktxNmwwams3dzJxaTNxWmtTNGlXemVhYUh6ZC9HM1JSTkZa?=
 =?utf-8?B?UVVJemdIckhwajY1emtTbnp1aWF5YlBPSzhIdXhoNTR3cjBXc0JyTFdSYVlZ?=
 =?utf-8?B?MTVyN2RuUDhtR016UVhtNElJSnV5dEM3VmRxcnBUNk4rVUZPOFRsL2VsRVZ5?=
 =?utf-8?B?dmZUODhBQi9UblArb1NSd21CUjBJWVFxTUhWSEZsL1lPa0pWeEpuUFpvWVFX?=
 =?utf-8?B?OUpkaFRSL0ttenFiNFhTZ0FIVmZvZnJZV3BuanU2bG5ISm9sckVOUzZESUlv?=
 =?utf-8?B?YW9IdU5DSWgvcTFJZGtSbUFFV05SNlkzTFdjeUh2WVJXTEQ2ZEtKOHdFTVp5?=
 =?utf-8?B?djdGS20zWFBOUDJWei9oNU5HeWtMTGZwQllFUEVpN05rTDZjQXhPMGVpZTNv?=
 =?utf-8?B?clRaaU1Oancxcm84QmdSR2szKzA1S1dCSndTYnBCbkRwa2Q5ZmlYbGxxc0Ux?=
 =?utf-8?B?dzJENjVPZlZWWmRVaGRGcjF1UG83Y0Z0b3YrZUZLQXVnOHB5MVFmZjJUUFZ6?=
 =?utf-8?B?QllaRFE4MDNVdEJWbE8zdDZpbzI3RE1WMmFlZkcrQ3BvVXNLdCtuR2l2WFc3?=
 =?utf-8?B?bTZQaHA4UldleWxPS0UrM0tqQWZhODJyalJpcGV0UjBPdk1IR0ZxL1haenJs?=
 =?utf-8?B?OGVhT3FSaUI0c3BhUHQzRnI5cW1xd2hkOTJRb1VtREpERElRbHRWNDVLM0Yx?=
 =?utf-8?B?S2ZON0JHdXBIc1pUV1NBV0pkTW9hMWNoWkFtZ0JxZWxEdk9ZSGNDMTNGaUY5?=
 =?utf-8?B?N0ZoY2dzK0w1elRpK1g2azZwTUpKTjcxcndFaVFCSldFUnhMc0pWWFlVQTJu?=
 =?utf-8?B?WDU4V2VXN3hjdnVoWWVpL0N4OXJPRkxVTlVDZDI2ZUI1bjB3MU9rcGZBbHlJ?=
 =?utf-8?B?WmR3Y2dwWCtuS2wrZndtTlAzZFd3QnZKZHJNdUdDWTltZUxtU1MwY3dZK0M1?=
 =?utf-8?B?WGVBZEtQcjdtT2Z3cXg5dDhLMFpPQjNjRi9KeXpvR2wya2ZiclZRblVmYUM5?=
 =?utf-8?B?Q2ZPVUpta2tQMWFGUFJ2SGp3eG83Nk43SGlJMDVsdzFSd2ZIQ2FnZkg1d0RB?=
 =?utf-8?B?WFhRUm12QjJ6cG5yalYxRndMVTZESXUxRm8vWFFNV29mVzF4Y2RHcDZwWEdm?=
 =?utf-8?B?MzFMa2t3YkNXdTlZTENzR3NoNVpJMi9YajZHeTByeWhkU29RRnRPdU1hWk5o?=
 =?utf-8?B?eEtnUndoZEo5dHQyWEpYb3NHK0ZISkFRVE1FeGNJNU51a0RqK05LU3hUNjVm?=
 =?utf-8?B?TmxvUTJ3ZDdDV01ESGpUMDhLRnIvTzQ4ZjdudTR0eDBJTnBjRGg1VU4weDVB?=
 =?utf-8?B?UThyeDJPbmlMQlQ1eWZZcTlndHl2VzJSNEZBQWJ1czdXSHlYek5GajE1V2NL?=
 =?utf-8?B?WWFwL2tTRmlLUDZYVVVpSWF6VXdzODhaK1RaK3NBVTg0aktOQWo2VHIwWFBz?=
 =?utf-8?B?Z0N5SnQ2QWk0RlZsNGVSL3NpbnFNWmlxZXJxZEtES1pxK3RXQ0V3Z0c5aTJ1?=
 =?utf-8?B?cWhiUFVLV1gvNzFsNEtiaVMveTFSV1dHaHZnNzFMRDN2clpWd2lHUDNhMUlQ?=
 =?utf-8?B?VmF2UmpGNWtLWlFOWW1GZG5qOStiT3ZDRHJBWmhvcVlzbXFtdGlseFhyeGZK?=
 =?utf-8?B?NVdZUU9KUXVYcCtlUUtXNnNPNW5GVGg3ZG8xTWJud0RFMzRtd1d6dGlLL0Rh?=
 =?utf-8?B?cmhlM1Y0elh4NEpDL2kraXBEMXNZVDN3dDU2dVhVUzR4bCtCMGU4MEdDeFYr?=
 =?utf-8?B?Z0ZBcXBHM1pQYjJYR3JjRHM2Yi8wVTJESTNTRi90bkhFelNWS2toTldNTVg3?=
 =?utf-8?B?U0hjdnRCZnJzSnRyZlhuajNXcmQxOS9Qa3ZTb3JaVE10WGlRRHY4clpuclVS?=
 =?utf-8?B?NmYwampEYTJSOEpNeFVQTmdzUXBnZlB4dEFNR0s0QXVNTEZ4RnozaTJLWkJu?=
 =?utf-8?B?bURXMmZnS1BlMVF4dm1UejlpVUlXbUQrV3RvVXJVLzIzcnRWQUh3dHNuZ0w3?=
 =?utf-8?B?MGxudFhGdGtIRGtXM010eFJydzBETUt4L0YvU1hTQ043NGlOREFENFdUR0Mw?=
 =?utf-8?B?eDNoZi9CV0VvOUM4MmJEOEVsUTlZUGQ5alVtVWJkY1FYU0lnQWZFZzBBT052?=
 =?utf-8?B?TEh3aGhtYXRsNno3T0xmWlpSalc2TmRHNTg4K0NrZi8wR2JqbkdiK29FZTk4?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f901fce-c750-4608-1b21-08dc58965884
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 13:09:53.4101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNwl2gZuKsgDulAlY+nzwc3eNnKDulm5bFb3jgXKxMRLYdfH9qPNQpc/z3Jj4/Za+b9njoz6GDNS/LnO6OADvF6AGSUfNhpdBs/+7O00g+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2024-kwi-09 12:51:06 +0200]:
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
> index 026e4a9fe124..4118c3084398 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -451,7 +451,7 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (!xe->pat.ops->dump)
> +	if (!xe->pat.ops)
>  		return;

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>  
>  	xe->pat.ops->dump(gt, p);
> -- 
> 2.43.0
> 

-- 
