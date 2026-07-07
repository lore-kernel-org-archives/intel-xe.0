Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDFBC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 05:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE6610E41A;
	Tue,  7 Jul 2026 05:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5XqgY6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DB910E41A
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 05:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783400769; x=1814936769;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sIwm8/htpo/OdP2WgBCvR699gVLXhAd15W/L5r2zbBQ=;
 b=a5XqgY6IcvCfdsc9GzTrBoqI8zz81X9TAw6EXPWNztFIP3tJfD1P1Tpf
 VgTZUqlTUInG4zVIQeEcjpBiEdX9Wr3R979zqEg2VRF994bA+OfNV/MBk
 8x3ftjuBv+GPUYSOK3kg8EKPc5O5WZcrLZsreKPu0Pf61pLTpfDifu1ia
 AVilBEmLhOMvQJEpa86myom9y4A/pETwHayfs9vrVaD1jl0x3bBwgILT1
 uqUc1OIK9vAHLbaqiEVqXV7lJt2ZVEMeGZ5MsAuVmLLtfgUyuJLVm3dn8
 jj+2fSy2y+QEY4q0jObguVT/b9k2lWgT6ywRbWEF8hFobvJ1FsViM7ACk g==;
X-CSE-ConnectionGUID: 2bes2PuRQb2FBlJiAMFydQ==
X-CSE-MsgGUID: ygd53+ZuTbqj4VwP2lNoeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83902727"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="83902727"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 22:06:09 -0700
X-CSE-ConnectionGUID: Cgsvxs0mSc6cU0Tt6nnV1Q==
X-CSE-MsgGUID: //eaiP8JQ2alGT4QILV2Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="253985291"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 22:06:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 22:06:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 22:06:08 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 22:06:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1zmxrrMS5LUACjGYXoEIkSLG+z34Vzg2hfTUCAh+BVvgNtip07yhvjwWmrCPpRuGUlDlm0t0ukxBqk04kurlvgSAUrdidJa+poQnUcKFmF0QT6Ds3aSV6XgP3+W3PqEqtP/9IrfFe1hFntxi5nGjL3r7/xxaWvVANmeRasRA2lpRtzhTyYR8P5uevnDmSOS1IXXmyPbgFEfqaWGgoLOZpJHDznUn6gD65079bl9E3/+1ObQHrbKsq5YvpiI4wB3RtN7CJC6ZoJItH4BXMYVGQEoqLjbGNW+11aZVwsnloYvoGt5VJWtW6GlPOfxcLiBrfhKHhuB/pCMbLPTFXNJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dlv7un6Exh9cJrhXIuWpHwoUlcd1Fq8J+11jSw72FxE=;
 b=HsB65ZwjgX4YJef+v6WNn9zrc7NkqH6M3y3AeEAWIjhMbD5uZ4FAHUrE/5qz7umZB8u1IlKJAIREBtauU522BIUYbntnTcUzdhdusGuFZnbMR//CaXd+OTL/qYLe6ckt4g2CguFCX3uoPynGNjoe5GANKyIDmIFSIi3HXV7bKWbugu8W28dho3ny0A2zA/xQgfl81JQAdwn4HruzZKGH0VUPmoVpmMr7nrSUFFCNKaPtRXcVa5+8WXipVeZU5UcqafapMdoayA0eZIWP9A4mYdKyyNClUgjcaTQHUYVLoV/l+7Quoqm8x4sqzLt8xsI9DTQDjfIBgSQ8jh50jeZPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by MW6PR11MB8340.namprd11.prod.outlook.com (2603:10b6:303:23e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 05:06:01 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%7]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 05:06:01 +0000
Message-ID: <2b6e6df7-d0ac-4676-aece-b5390c84fdea@intel.com>
Date: Tue, 7 Jul 2026 10:35:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/xe/heci: Use xe print functions in
 xe_heci_gsc.c
To: <intel-xe@lists.freedesktop.org>
References: <20260623202053.1023598-1-jonathan.cavitt@intel.com>
 <20260623202053.1023598-3-jonathan.cavitt@intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <20260623202053.1023598-3-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::10) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|MW6PR11MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 52270180-071e-42ac-2a08-08dedbe5700b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|4143699003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: tgUVzaXgxvgRgXP//YsUwtKgVLoZ8wZaM2AqV8vNsUT43BxeFlizpfO8aASQ/eLpqiinvrogkCzCgf3PzdmlncNdDl4jJzS08agnjhWW/oRMXqjFUXoGdTtc4ZKvLy1zLiWRQ/pb7zOLs8c38bEv0i7yaeaXY3I4uEn8TEsry4h2tdW0G5q9dMJ9F0t/VTHP0MrxolWK6eT09DgGlp6+D4lFIJwSkAFKP0Qd7f59pw+DaRSW1aJJewVmww27Htpckq1ztO2j+erhAb2gTYjQVp0H5Y963Z611thAgJecUe5rg/RpEmNWoiiE8KbOHS+O0PTriq24Q0+joccQ/nUpIGxL/u3+iCbGkm6OL1LFz+FQUj+k1EDyFGXX3n4m5+TzBVsQf6zf1af/I4RbLlisHDQ6G/bZgyz1ICRM7jIvye9h41lyOrd6MYnH80aqPeHe9YbW++xv+CuZq57ZzjSxC/LugFZiW6erWajyxEmfT/6UulBJ7LhaZ/7ZVkmjGUB6nYLK1fK3HwRMTNXSGNCtD0135n/lcXaJ4qHj9XyO90bH3ysFh+YAZCWPd1eMQsTM9Au1e0+jUNhKKczxd2W4prY+AtE2rrMnhAOfn+1SFJZAguIzr478sLNloUw2heA5WSU8G6pJKfAW+I/Bx0GwARXOhRpL7PrUW8a5g2xGA80=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTBocGZCSUJoWHJsYnd1a0krUEJSOGdOZk1MVjVsMFVER0lMSUJFbEIxZStQ?=
 =?utf-8?B?TG5OZFpEQjVqblMyQXlLSmU1RlpWZjlYWnJYbzdvWFJ1bHdlN0RCMGxPa2sy?=
 =?utf-8?B?ZFlOcUkwc3RJWEFRQUxLcGxqRXdhdHRFYnVBbVpSdDVkczlwWGhCdkE1bUZn?=
 =?utf-8?B?dzk2cGJMNWJpOWcrRm9oR3FkNXFranMydEFaNy83Ni82M2Y2R0tkT0FDcXJO?=
 =?utf-8?B?MGlVbjVLNG80OUFzaDY0WTczaTVvMlFQL3JyUVQyc0dxVzgxQTBmdmRyTFZY?=
 =?utf-8?B?MGRpaU0rVXFSbUFpa0o1QXpXcDJjMFpBNWxsTGYwZU1xZVJPWWh5cEtVanAx?=
 =?utf-8?B?UWRpNzJLTTljd3hmZE9CSTRzTE93VTVzeGR0d0RkdE9mSUwrNnVLSFRMK2F5?=
 =?utf-8?B?QXBNTWIvakNKSWNnREs4U3Arc2ZLOVRZNkJTc0JPaEgxSTd5cnZuNnMvWHBN?=
 =?utf-8?B?Y09mMVpZM0I3SWJxaXFESTRuKzByUXZoZkZGYjF1RmMxcWRIcGZITmRJOUxE?=
 =?utf-8?B?RXNseGM1K1RFeDlEblJkVEpMVVROTnVjYUxMRFZkcGMwMG41SzllYjRDSS9P?=
 =?utf-8?B?bnJ6bU1wRDRHdW1aRHB1V1BIL3hQc1BiTEVsMkhHK2xNQkhTdzJuTHJYdmZo?=
 =?utf-8?B?bXR0MlNyQ0kyTm1yMmx0dGF3QThjaUtQL05iWTExVlZLZFpVdzE0L0wxb1dU?=
 =?utf-8?B?UWhONjc2K1dURUJONHFqNjZzbkRaWkFBdElFZGxJMEk1NUxleDVMT1RONmVU?=
 =?utf-8?B?U1ZCMEpzbitZYUtxR3dZWWE1QmFDM2dlREdoT3A3QUxDUU1ERW9oZ2lOOHhO?=
 =?utf-8?B?YThhOG1HVFBwTk5WUVd1ak5OOVNCM0ZSbVJQRDRDclhLY0RTMG1JTlduYTkv?=
 =?utf-8?B?eVRPZmRQWG9KNlBzbnpjRXFEWHBkQXV0R2pGd2kvekRiTm1SMERFOXlUKyt3?=
 =?utf-8?B?bGxFZjBkTzVSSjJGV2xpSnhDZzJUTUJCY2xQb3FsVzhGZXJ2TFJobEdHZzZB?=
 =?utf-8?B?VmowcDREK1ZBS3B0K1lhVUhsTFpNajhrcHQvSVVnWjNBWHV1TnZoM1RzWDZX?=
 =?utf-8?B?Vkg5anhWQ2dDcUszaGxxU2FUbnY1NXdVVnhzU3dielNQc21KR1RsYnl6aTNS?=
 =?utf-8?B?TWJkckQzdVgvOTF3Y1BVZ2hsclZwUjU2Nm9zL1lSL0UvZGUra1pjRUVxS0h1?=
 =?utf-8?B?TWZtMG9qOHZpWG1Ka0s5N0ljbWc0SUNZZ2xZZVRFMWpaYVQyT29FYlNUUkNK?=
 =?utf-8?B?alRuVDhiYnZVUEVrRFFiUkk4dE1LalhoODhzWEpXbTBMS2NIbnpPampDRXZY?=
 =?utf-8?B?TkNpWFNoY3BvYjJONHNpTCtRbmdlQWdiMGtkSHY0ZTkrMXlEV0xWYi9mMVli?=
 =?utf-8?B?NFlLNFJtRWF4TUoyN09nbHdNZVI2ZUFGOHhNMWRSL0wxVGFKdGlPZlpDVjZL?=
 =?utf-8?B?TThTNE1ib2VsS0NHUkFaeHJJanFMUFQyQXBackpsT1ZzMTZUalNpamlMNEhV?=
 =?utf-8?B?RVZtbmg0eXkwSzZ6OFlJNm9BK25acWVDTGZ3WkdZd2hDblc5K1BEY3pMYTlo?=
 =?utf-8?B?OGJSaGMwdmJkc2NhUDlBTXhpeTdHcDlld2N2OVIzVkZCTHpjcDFQcWNqTkh4?=
 =?utf-8?B?MVRSTmR6T2V0Q3R0d0txUk0vdlQvL2h4OTBpZ2U5V3cwMmg4ZzVjUVdUeTN1?=
 =?utf-8?B?OWpSeXVDeTgwL3pnSGdGWGV4MlFTMlY3T0JpVjVPOWdVNFd2YVdyc3YzWkZS?=
 =?utf-8?B?dm9aRDJ4SG1MMjBjWlR5RTd0dWI4ZTdDak5DVjNQbm8rcnFFWExhOHhhR1l6?=
 =?utf-8?B?QVA5K1lrQUZxeXY3YUZ5aTJQWXZGN1RHV0JDQVV6cTRsSThsTStnbS9KZDBO?=
 =?utf-8?B?NDZlRGRIS0p6YTdaNUJRUVR5OGsxYXJ5RkJ5QVhud0JHNHVoTWczdkd6enlE?=
 =?utf-8?B?dkNZNTNRWSsvdDA1TitiMmNHRE9BOThtNWp3SWdXcERUSWdHc0Y1ZzJLR3Iw?=
 =?utf-8?B?cHZlby8zZ2MxRnFUZDlHeVVjK0lrM0I1ejRpcW5nU2V6c1p6ZVR6UjEzNldM?=
 =?utf-8?B?RS82dVZ0OStYRlFGY1ZHS0NLYThvbm81blFtUXFqbTN3R0VaeDlDaXF3TmhN?=
 =?utf-8?B?a3NJR1M0T1hhMkRZU2MvbFJoaFEzMm4weU14KzRBRXdsRHNFaTVVc2N6RDJG?=
 =?utf-8?B?N01kNmcwTGloQjlsZW9kdmZCd2dTM1Vxc2M4dmdoN2duWGJONjNFc3VRQlYy?=
 =?utf-8?B?NTkzdTN6R2lyU0pyd0I4aEtSVUJCbW9vSFVNSzhwMDZlaEsxSW9HRmxRUkRL?=
 =?utf-8?B?eXR1MU1YVnJsRWlRZEZzbGlaa211dGxsVVc3OHVxN0RYeXcvUWJtdz09?=
X-Exchange-RoutingPolicyChecked: J1wU/Y/pkGBJWIlNpnTr6pPyQZh8LhU0oFtVAL+g7zbMZAA+vHJHeCQ118KhqlH8glB/OGSEao0Xdk57pNSnc/0S+qM+56o+Xyo0K0LWTx2JpZNWO9J0oSvhrLWRatbzZABk1O69LyCv+DBiOwC3Wdiuby3txFmJeUjj1aiPYK6LjCpmUih8DdkIxdPdVjtPxg8ItuNr+LEx2jSQuWcCkR4hA06q5TdYbTAnrxP8PAPq1jnqk2hPFffWXPc3ON0fkXc2Z2nun9IGGnhJFVcv99CyEFtQwobqL6pFDfrbyhwqh+PikrW2I7UJG6X4HVjQaaKM1C4fiY0ENpRbryI4Sw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 52270180-071e-42ac-2a08-08dedbe5700b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 05:06:01.0271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwqE/oA52kMBU2HM/bSxHJu0LF4eEagFTcZ+Enr0aDkIFIs/RcjZn8jkb6Hvho4FuqtFvinQouG66FyVZM2ajQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8340
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


On 24-Jun-26 1:50 AM, Jonathan Cavitt wrote:
> Update xe_heci_gsc.c to use the xe error reporting helper functions in
> xe_printk.h instead of directly calling the associated drm print
> functions from drm_print.h.  While we're here, we should update the
> error messages to print the error codes in a more friendly way.
>
> v2:
> - Update the error messages to print the error codes in a more friendly
>    way (Wajdeczko)
>
> v3:
> - Update heci_gsc_add_device() error messages (Wajdeczko)
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_heci_gsc.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index 5af8903e10af..194849edec11 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -8,12 +8,11 @@
>   #include <linux/pci.h>
>   #include <linux/sizes.h>
>   
> -#include <drm/drm_print.h>
> -
>   #include "xe_device_types.h"
>   #include "xe_heci_gsc.h"
>   #include "regs/xe_gsc_regs.h"
>   #include "xe_platform_types.h"
> +#include "xe_printk.h"
>   #include "xe_survivability_mode.h"
>   
>   #define GSC_BAR_LENGTH  0x00000FFC
> @@ -112,13 +111,13 @@ static int heci_gsc_irq_setup(struct xe_device *xe)
>   
>   	heci_gsc->irq = irq_alloc_desc(0);
>   	if (heci_gsc->irq < 0) {
> -		drm_err(&xe->drm, "gsc irq error %d\n", heci_gsc->irq);
> +		xe_err(xe, "GSC: irq allocation failed (%pe)\n", ERR_PTR(heci_gsc->irq));
>   		return heci_gsc->irq;
>   	}
>   
>   	ret = heci_gsc_irq_init(heci_gsc->irq);
>   	if (ret < 0)
> -		drm_err(&xe->drm, "gsc irq init failed %d\n", ret);
> +		xe_err(xe, "GSC: irq initialization failed (%pe)\n", ERR_PTR(ret));
>   
>   	return ret;
>   }
> @@ -151,7 +150,7 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
>   
>   	ret = auxiliary_device_init(aux_dev);
>   	if (ret < 0) {
> -		drm_err(&xe->drm, "gsc aux init failed %d\n", ret);
> +		xe_err(xe, "GSC: aux device init failed (%pe)\n", ERR_PTR(ret));
>   		kfree(adev);
>   		return ret;
>   	}
> @@ -159,7 +158,7 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
>   	heci_gsc->adev = adev; /* needed by the notifier */
>   	ret = auxiliary_device_add(aux_dev);
>   	if (ret < 0) {
> -		drm_err(&xe->drm, "gsc aux add failed %d\n", ret);
> +		xe_err(xe, "GSC: aux device add failed (%pe)\n", ERR_PTR(ret));
>   		heci_gsc->adev = NULL;
>   
>   		/* adev will be freed with the put_device() and .release sequence */
> @@ -190,7 +189,7 @@ int xe_heci_gsc_init(struct xe_device *xe)
>   	}
>   
>   	if (!def || !def->name) {
> -		drm_warn(&xe->drm, "HECI is not implemented!\n");
> +		xe_warn(xe, "HECI is not implemented!\n");
>   		return 0;
>   	}
>   
> @@ -215,7 +214,7 @@ void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
>   		return;
>   
>   	if (!xe->info.has_heci_gscfi) {
> -		drm_warn_once(&xe->drm, "GSC irq: not supported");
> +		xe_warn_once(xe, "GSC: unexpected irq %#x\n", iir);
>   		return;
>   	}
>   
> @@ -224,7 +223,7 @@ void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
>   
>   	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
>   	if (ret)
> -		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
> +		xe_err_ratelimited(xe, "GSC: irq handling failed (%pe)\n", ERR_PTR(ret));
>   }
>   
>   void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
> @@ -235,7 +234,7 @@ void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
>   		return;
>   
>   	if (!xe->info.has_heci_cscfi) {
> -		drm_warn_once(&xe->drm, "CSC irq: not supported");
> +		xe_warn_once(xe, "CSC: unexpected irq %#x\n", iir);
>   		return;
>   	}
>   
> @@ -244,5 +243,5 @@ void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
>   
>   	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
>   	if (ret)
> -		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
> +		xe_err_ratelimited(xe, "CSC: irq handling failed (%pe)\n", ERR_PTR(ret));
>   }

LGTM,

Reviewed-By: Varun Gupta <varun.gupta@intel.com>

