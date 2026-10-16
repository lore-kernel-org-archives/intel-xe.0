Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56431CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 18:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AE010E05C;
	Fri, 16 Oct 2026 18:02:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC69710E05C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 18:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792173756; x=1823709756;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UV7YSvTJx2yWX+cpunHwWKWo62WvuUuoNTgssrojhSc=;
 b=cXmBgG6SY9ZsPSy4Sq4t2DmVSJDzmlMuwg1F5GPSTjU7wVA/ZhIQCkS8
 hhlPTra9LahqG0PdfmwWev/wOrnbLVpGtYxwmwxx5BpNIeNtqaiuEkYwZ
 YUhgwnUb+1t2wDZP7D1A3N1etp4NFcQXn6LcdETnxuR43WXW4m529/DvD
 PM9oFsHC8pFcMVerxSTRNmfNV9TzURJBoFxEINnPfP8h3+svRL6r+Hab7
 PXHElyndlz9mGhNWousTiJO1vJUTg/cxF/GgJYZx5Yv8fQPm+0D6p4Ph3
 1Em5EwCPzZZ6BP9dNm4j+X/ag/WeSdU4Gt6Wl8E35KN7OyevxSAMkvrMo w==;
X-CSE-ConnectionGUID: 9RE82YXDTmmDDV2v0Smggw==
X-CSE-MsgGUID: LHkvHyQATvutieMpIoFq4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="858355"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="858355"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:02:36 -0700
X-CSE-ConnectionGUID: pT2RK7LSQMeq6XADo6Kd5A==
X-CSE-MsgGUID: Sdpjr7A7QmWXgfFYKhvEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2377975"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:02:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:02:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 11:02:34 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:02:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8iQ9M3/hjfiYMI2SAZyrzfqDaYgGrtlUmVNFSZ6wCI86yvo27b8nVuL+uZiHedH/ypsPpO+0vnSeE9K3CEOet3ilQELPgtzuIxSq/MKvZMUBIzj80oe/CzrgMha7jhMVW4gC8U/7p4nyQfGglSEcjy1cbFLtP+/x/VUwzsBSBV0FR5jxaRs6eghvdr7HWvL65ay4zAED/NCs5XFDAfOjO1JzPaq9iNq/Q2ZRTuKTRHTqCLkUxLh4zu+gTdbyxCfLKhdBZlcyJq/XHGoexwh8fShOISGzf55UCcV0E4p0c0cGEcNhXCXOs0aBKExmGUWj1c5NXNft3J7JKg1QK2GCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSjgOWjrykVPgk29y6LObcIFzfNoUzp3kxkKCdB7DT4=;
 b=u+lznoFRWcjfQXjgLzdsIo9YxZRQwMDuMQNSVe8aXmplS0PZ9ZEoqH/poig6eO/RyRiW5duyf9SSA4D+coOP1J4O/LLi+EOoT2kCzC/fXzSBTpcY5QZ9XhCIJLyp5pzQE9+K5pwlQ3dAgR7OYMbS/SxuGtRo3D1AUO9zwRqqap6EO8ftwcO1sX8dFeEDyrZgxXngsdIXbABOGJDJjjD1mVlV6Fg30OPWQlro1vLpXbwCyLZA+l457tShzR4kwKmMf2zLxN8q3hJC1NbkCQRsPXeG4eUzDOhr4u0qheBBkyYQ3d2rs133tIUPFsxwZkSO8EHlSO06vxpSdiRTj41D2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by SA0PR11MB4751.namprd11.prod.outlook.com
 (2603:10b6:806:73::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 18:02:32 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.016; Fri, 16 Oct 2026
 18:02:31 +0000
Message-ID: <cfadcabe-0a2f-4e12-930a-e07bf78ca960@intel.com>
Date: Fri, 16 Oct 2026 23:32:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [2/3] drm/xe: Access MMIO after pcode init
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261015165451.154495-7-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20261015165451.154495-7-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0156.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::12) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf1407f-6b76-404c-7641-08df2bafa61d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|10067099003|22082099003|261009223027099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 4FrMXbAx5gpbgsrmv+lzqUlVXew6+vZw9mv4uqK8KAEASiDSuX3pFjrp1T1GlX+Wfwk3fyxuTzds77s/ktCHIq9G8LdLBNmmDD/hho92B9xifqURo5CIsJ3eM9JpJn2gD89YzaTDrgH+cb17aFZsPT94aJeElJxltV2Fypd3+116R057gYF78uEZrQhwsWRkMWtp+ZoCkovAa2+DC3H/UJI1SxHeCiltVL/QAvzwo0RpXn8OHExyxzW7J5G1YpSLhU3LLobu2WI0JeQIZATR7PvhgAiCJ3TqYP5lfht+dZIkrtl9up9z0PbACgWMUVjTaAE779MOiplMXFMrukUj/OYAgLxPHr1qoReuyvu2g7arKAiRs5gnOBUwOopTocLE+PRq9T98IjK6VAUfXF3vR96A4l34sFLfbG6C2oxaF9IVEove0VNhngAFmJzp5fBWSQ35tjewEf9To1SxWAAzMDwzKRhkun2YDTneFdmuHGCT222bY8hCeDFsuSHyZlTzdxBYmkf2cUUcgo5jCxgyP8+d1jjlbA6obxcODAV0gsnuRkYOym03wGrxG3X2UBUVbH3fvEAek5QTPxojcKEUMduwld8c5QEtRohkUsIRCfTGFMXBx5xXVKR/fvJnq6fXZklx3NGsNCBFX4qT42qq+0HsXU4ETzl6wk1P0zNDyM4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH8PR11MB852307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(10067099003)(22082099003)(261009223027099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0c5dGRRcFVvVnREcDJNblZjR3FiVUMvY3g2UVpjL3JSbUh1SDkyZVZyMXJP?=
 =?utf-8?B?L3dKUjNHdFJIeGoyaXdTNWZwT2hPLy8vRzRZM0JvU21TODRvZWVERzBsSTRn?=
 =?utf-8?B?OEtzam5XY3FBQi9CSjl4amtPOVZ3Y0JjZi9tRGFsczducXN3QzlPRWtUWjND?=
 =?utf-8?B?VkpOTlpSYlBvV2MvaVZRUHNYQ3dhVVp5bkFQWUpnWThmSGtwc2J5V0d1R2FM?=
 =?utf-8?B?UEZxL2ZZUFMrU1NZZkNyallJL0ppNDA1NWlqeUhyVWtIczRieVlobGMvNDFs?=
 =?utf-8?B?QllEdytaelhzMVA1K2hzbWZDbzBWTHhXSTNVcWZmNElEbzdHQTMrVlZMS3Fq?=
 =?utf-8?B?cklQNUtZS2phNVE5T1lIWExEazQ3VDlJejVJaXE0T09mUWxLZ3M2WjVhUjdH?=
 =?utf-8?B?R0tVY1hobWkrdGFXMld3SWhCY2xvdU1TVkQ5SDV2K1NndVV5b2lVeGtoM0Rr?=
 =?utf-8?B?MlpiUWk1bTNFdXc4eFpMc09WaU1xaVNjS3hZWVVmOTl6cmFhYS9jU3ZjWUJp?=
 =?utf-8?B?c1BGZG9oYlVSUDFlRnpWQXBWMi84TU5OWkJxamwyeWplYVFVL3ByRXZLdFhJ?=
 =?utf-8?B?M21UQUVmQW1ocWpQSFVrRnRJWUkxRGdTSTBaWFk1YlMvTVhXVTVlOWlpWm55?=
 =?utf-8?B?ejJTbHdLZGlBUllQUUduK1RCYzdYbGR6SitaVy9CNHN6YUVmdU9IWWlVRXRQ?=
 =?utf-8?B?RHRQcmdoUEFNSHd0SFdYK1B4N0t1VGFUVUJ6OFBMREdBWG93cU9EMDZHclRS?=
 =?utf-8?B?bjJkVlRObkVuaEh5Y01oaXhyVzFFaWpDdWFjQXMwYkdsUmVRVDlCM2FXMFA4?=
 =?utf-8?B?SmRDazlTSEJTcmpGY0JVY0NCbG1GZ3FiZDhsZmNRLzdYRU5lU3BHM0JqS0w0?=
 =?utf-8?B?K1dCR25JUURLbnc2akZmSGFEblNxT2R0MUJRclAwcmhONmNQTDFTR1o4Mmgx?=
 =?utf-8?B?L3pqRjhrbjFwcDNCeVEzV0pKYWxXVWloYjh1K1NXN29RY2NTc0k2emh5V1ZQ?=
 =?utf-8?B?bXV4cG5laDJBTzh6K2hTM2RobFBNWHlNbTVFR29iOUUwbmhUbUVBWGJTSXh3?=
 =?utf-8?B?VUlpVHJnME1wM2l3Zm8wYkVrY1lPQ3gyeFJUQUdIQnpIZUYwNE1UQ2NKQVJo?=
 =?utf-8?B?VmVWOCtiQlFoOHRCZDNObHBmdUFUMFZPOEFSV09nejVuc2ZiN1VHRHFNWUZv?=
 =?utf-8?B?ZVFMM0ZaYkQ1RnF1RXZMNmt4b2VrdUtYUWRnUVRyZG5PMFhBTmtZRXBDb2hl?=
 =?utf-8?B?Sk1GT2tRQkR0NUIzelBpUk8zd2c3L05xKzFINWQzVjVscmxkd1BPWWhiM09s?=
 =?utf-8?B?RUFRWXNXbU9PU2FvNXJ1WHZkL0xNckk1SVEzSFhOL0Z3Qnd6Yy9TczJOb0VP?=
 =?utf-8?B?K3Mxc2l1eUR4cjQxR3YySXExb1kvNENnSnJxN1M0MlB6NGY0L3daRmtVRE02?=
 =?utf-8?B?U2JYankvN0QxN0phTk9zM3ZYdUpiWUcrY1lEUUgzZVE1Tkt5V3hZSDdyZUww?=
 =?utf-8?B?ZW10V0Y5cVdSN0FRZ0hLcWFKVzAvQXhnSkZzOFN1ek1RL0k1K1VMbC8waitN?=
 =?utf-8?B?Q1p2eVIxamNGYW0vOHd2MWw5cUpQYmM2NTY4QzUwamttRDBodWNra1pPRmc3?=
 =?utf-8?B?djNQQ3ZNakkwWTZRUVcrSlV3TzJJUkRZV25wMENMeGFGTXdGeU9HNmYzdFZ5?=
 =?utf-8?B?QkMvcWN6QnJobi9ZTkk4Z0Q5bWFXSFEzeHBlNzJPaGZDMWhkditjZ1E2dERJ?=
 =?utf-8?B?V1liZVVZd3MxUEJBbEhXbmxsM1FQNFRYVUYydVNuU0dOV1M5Vmt1U1J2RDA2?=
 =?utf-8?B?TnUvWFhuNlZyTGN4b1FtZkM4Zkt2UUtDSHUyQ0NjSDdxam5JRXA5YW8xaGNt?=
 =?utf-8?B?eFQ5ZGg5K3hqTnkwclUwd1RTNEFJRC9QamI1Mm5OOWhrRnZKclNLMDZLbmdJ?=
 =?utf-8?B?bGQrOGdpcGNLUy92QzB4R0kyNU0xb3NzMHFlTWpEa3dQY1lIYjdYRFJoMUll?=
 =?utf-8?B?V2MzeHNMZmJla2tpaDRZcHhMcDFrT2ZyMml5c3A1Ui9qbDcxVVV3VUtFUFh0?=
 =?utf-8?B?VHY4b3FlMVI2eVVRNFVDQVV4ZlVQcFV2L20wcEJjTERvSmxNaFQxZmt4L1FF?=
 =?utf-8?B?ZFdCMytkOGdFdW4xQ3pWdnRIeDlxVDFGNnZvQjZJZExCRnl3ZEVLRTBVZWl4?=
 =?utf-8?B?NkcwdkhlSW5jWnhKMlh0TVNQdlJjRUhrNzVaZTN5aUhueHlHa1haT05kbG15?=
 =?utf-8?B?WEUzSDRCOFhjU2NEWWlLdEg0K3FYdWh5bU5XSitSOHZRU2FIdERFOVlXK2Zj?=
 =?utf-8?B?bXA1SXhXcjlBL0ZJOThZWEdPbEpnSEk5TVB0Vkd5aFpIWXV0NlRMZz09?=
X-Exchange-RoutingPolicyChecked: vjUDwjspNalSjjq9TKAaeTjDepp8L6kj8EEQVlL0XBGW1OgEvN0R8b9t5Nb+g2dgKQZOZdUmT2u51Btwwi0IKq9C7DQad7grhCVdbQBnP02j0iFi/wAbJlecjhTuhIiztQ03FfcdIAdgp9k0pvFJ/NTVNVM/WmGx4zCR0PmsVcAp1rvVBdBDwJtzhX+KAiBPUOT1gnS0y2Fd9J6nkTWOzZwkaYujiu0ESIIFG+Uat+Iv27UOC8+Z7/lLOLKAJzITQePhLOO8zVKJp4+W4X3+O+BEmQs0fdgbBFvDgWhrtf64kfSnLBuQlTAFuGpBATvu2InirGy9eIBB6ejXQbm3Yg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf1407f-6b76-404c-7641-08df2bafa61d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:02:31.7012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMujrNeiJOHSob/VO/bU+8BK03tCAXmf9MeGKE8GIjqWi8McrpzmP1z1S46jYWDg745dhyryZCP2mPCJ9P0vIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
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


On 15-10-2026 22:24, Vinay Belgaumkar wrote:
> Allow pcode initialization to complete before we start poking around
> the MMIO space during resume. This ensures MMIO space is ready for access.
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index daa7ba2df317..1f5097875bcd 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -241,9 +241,6 @@ int xe_pm_resume(struct xe_device *xe)
>   	drm_dbg(&xe->drm, "Resuming device\n");
>   	trace_xe_pm_resume(xe, __builtin_return_address(0));
>   
> -	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> -
>   	for_each_tile(tile, xe, id)
>   		xe_wa_apply_tile_workarounds(tile);

shouldn't xe_wa_apply_tile_workarounds() also be after pcode ready ?
are the MMIOs accessed inside independent of pcode readiness ?
if it is okay, below changes look right to me.

>   
> @@ -251,6 +248,9 @@ int xe_pm_resume(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
> +
>   	xe_display_pm_resume_early(xe);
>   
>   	/*
> @@ -698,13 +698,13 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	xe_rpm_lockmap_acquire(xe);
>   
>   	if (xe->d3cold.allowed) {
> -		for_each_gt(gt, xe, id)
> -			xe_gt_idle_disable_c6(gt);
> -
>   		err = xe_pcode_ready(xe, true);
>   		if (err)
>   			goto out;
>   
> +		for_each_gt(gt, xe, id)
> +			xe_gt_idle_disable_c6(gt);
> +
>   		xe_display_pm_resume_early(xe);
>   
>   		/*
