Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C96C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E77D10EAA4;
	Wed, 16 Sep 2026 13:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9vm4of3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F267A10EAA4;
 Wed, 16 Sep 2026 13:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789564974; x=1821100974;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nG6kbGa6jI5xjD7/UNuko0+n03xArGGg2UAGgQSy+r4=;
 b=E9vm4of3bbXS4hhmsxS4lZrgsi83ExTIO5iHoKQVw2+Av+Uo/08QAeBr
 FfoIDNC1QSx6RhUM3OCL2TAJXlg5MJKDHMIM/sSU1J54kHA66Jm39/et3
 G1SkVV/8iinqhMOGNJS716CHcJC74jlPy2uE3ICDJTJOusnEjc63PoySm
 6puRxBMDk2Cy2yI2OmHjcCFUQsWkEIe78JHwuYkWA8/lJZ2sXFSB2nudq
 we65jwUz9EnhrjAc5sT7dJZIQuBfNbQkUX85X2VZCF7yTjGHnpVdQni1p
 JdgSzDKjTapd92e/7B/h8TKBkrphC4lsANMGTn2+ZGdywvFNnJTQIZgCO g==;
X-CSE-ConnectionGUID: TDtXMCMFStaZE9/iR0NXBA==
X-CSE-MsgGUID: pHmCfDQASmG68b3Q2QzcHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="449126"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="449126"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:22:53 -0700
X-CSE-ConnectionGUID: sP0hedlCSRGXPHWbedeeVA==
X-CSE-MsgGUID: A5iH1OHVQHSbRAfisJSCRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="298408112"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:22:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:22:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:22:53 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Me9XdXsOJABGY3rF7g5Q8Vp9dwtV7PZEkC+Oi7OvETpKosv3O6ePB0o2dgnxYitIIop0fCapN5lfrdjTMb8AHrsNSehg6kD7xJRh9iWBhKK/fN4QPboaj523GLJQF/fClmF3EOiJtLsw7B23GkVvLGUFaEKGNzLJaQFpjN7IFOCqFV/XNspZnzgdV8vqJoicLHh+hpEfa4v7TmxcXsuYTXOg3xgxdC/h9IT+t6PY+9BW1hAiuo51WWN9OsTqy0Awz3eA6usfWytjvGT8ppip6us8ApbBRTn7EeQBzqYSFaWVG8eO18q8/77tgFo1z02D6cxFvsvd6QallSJsQyJuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shCtLcD2ajHeK3l53zj90AeTVukgsDrZBjRXBJ+3K6M=;
 b=XlOkIMD2qL509q1i3qDsvndx2sSPq6npoaBjkMauBYseXgDx21/e9ihjop/0rGoMQur+u8d4tALS0EwFmPZa/Ca74SCHajyy4trMstTjr4hI5jCJB1qXsVBU3/T7NsitFm2FZqfuGjgW6Lflz3BEYJ+puKTPmGL7EMi5Fgng4+t67u7TuqGD+QMZDd6iGm9+uhZ0jBodTw/9g1hx3lj+DHWPPbt2Q/eUUKilW/SufTtLAwiDLTkQ3QMAQdtVs5hD+aeO+D7Kf2cFbjMrvaL3fUSZ3JeC0ZwIYm02pRLXzTeE7KcyNjfP6zq8mUx3XeLDFnuHpSGe/VAuiU4Uad4jbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 13:22:51 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:22:51 +0000
Message-ID: <3fdf5474-7390-41de-9adc-43ed3889ac28@intel.com>
Date: Wed, 16 Sep 2026 18:52:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] drm/i915: Warn about use_flip==true in MMIO
 commit codepaths
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-5-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0307.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::10) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 73da3bf6-3b51-4550-e28b-08df13f59bb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: OTuk7kRN8jAUi7I3Sg0ZfTYerDzHAs7+rRQkmpOrSV9i5Wm80QZBOtoGboumNPdhIWDYnbrJDmig/fPElIqcsxfEaTBaICVr7bcZyIhhebz4LeP6CmF9OZ7tOs5yNS3OJCXoofq5WrAtFIaCE6OmKf2G2w4gBmgN2IOEHwQpg4qJYSreSYpf5aCalGI5F7EmPADjOJmZ6iwwgu7K5ARDHQqDbqhMvr4Tj6tJ9O+mHufSdvegLhONRWh3nCCkYhLrUl4SFFhcIFueKMRWeSSNA79n42UOkyRyH2Y1NIwMBxphW4LSZ25jaaPbliLX1L1JHMK77NC4DhWwrJ/dWp9mtvgpfu7ufPwp5Z4+guXCLQ+QdA9yC/2b/F9KbJ9x4VsUQRVXELJi++td3kWgsUDoHdL7qwIa73ybQXsosVkVoEgGGkD0dld57ipCH/SnD5Ze739W5+UY4KM8sjv/8MHGgAhMG+pKruB1VHmTWXgypvNSZpz/ENhkJPL+X1Y4e/nBE1p959e6iqf9PjAqCntUT6MeynmwT2jZVtF3U6i8sr1U8kP0YKh2KcHWXnuBgGG00w28/cXeFhr/k7okT2HUUzKTUKiiAnyT9SXl/CzkvaeKl0k01ty/l5T7R3DsJA+ezWIkm7OkFTWoTquZAMUhs3Ibqnm4Dls+n6YaMOgu5fA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1lOYTExZU9HL09RUTQxemxPMHBkR2Uzd0xwOWFudmI2T3ltV2xkZWFiaDVE?=
 =?utf-8?B?Yk05MFJlODBGbzJwL2ljNHB2NHluSEdDMzk0WkJXUkNwNnNSZjA5R21KcE5B?=
 =?utf-8?B?a2w1QXlTWXJleHNaMWhyZHlvN0VxTEI1azl6aStYUmhSVWM4V0x1a1BVUmV3?=
 =?utf-8?B?TVdqQmNZZytQYjN0eFNnNXk3UlhKK2JXM2Q5RFd0WGxoSGl2a2d2YzRHSE4x?=
 =?utf-8?B?ZE1KdzZBdlRHYnk4ZFFrNEtWNTc1UW9vV2JzUVNFWk1ZeU5MTzlvb1hmZktv?=
 =?utf-8?B?WjRRTkFZNEhJUzRQcTZUTUNzcXRxS0lvaHZKZmxHUWNEeHEvYm9sZVloTWdn?=
 =?utf-8?B?bWhTOHFKWk1FSnh1VjkyanphWk1UUDFINWJTWDZmN0o2MUtlUE9RNDdXd1U4?=
 =?utf-8?B?Vld6VWJPaG1ma2tFblhKWDdvVzViYjUwSWNubm9UdCt3T0hWdC9WM1BVckps?=
 =?utf-8?B?RkZ1SXFycHVsVWxJcHMxbG96UitJbmpiK1RsT3FlSUNQdWpDV2Y4aFV2ekNT?=
 =?utf-8?B?Z25CYi9iZE9LeHNvM3JDOERQZXh5SWE1UHRnaDV1N2ZlSjF2VlVQTWZhaWp4?=
 =?utf-8?B?NlI3UnQvSU41cFF5VS81M3VwOFBTWEdDQ2dXQXlkQ05LT2gybHR6OWVpcG01?=
 =?utf-8?B?bHlTa28rWlFNRzc2N3l2bkhOT2xDRnA0Zm55L294UWFaeTZXNnpZR092NlpQ?=
 =?utf-8?B?K2RDZzZUNkFRdXZPNjFVNFRsUXdvQkEzLzh1a1M3ektJZExKM3FpajV4cFdw?=
 =?utf-8?B?Y1d3YWpSalRBaGFjWlowbEpxUEJveTdIRnR3UWxFNW96MUFJNUoxZ3BtWmh3?=
 =?utf-8?B?ZDE5V1BCMm5PNGtJU0YzOVEyaFVNSXlrRjd4Y0I2eHllMkdYczBoOHRoZUYy?=
 =?utf-8?B?OThEVE52YmJIVldmNXpiSy9zY0tSSEV6eUpaeVRLSFQ3Q2NNaU4wc3ZHaHo0?=
 =?utf-8?B?S1JkT0FBQjNmTEVkSlFmUzl4YVIyenhOZlVtN3ZyRXFPLzlkVGdjbXVUQWVo?=
 =?utf-8?B?YlkrWjZvRzhEZVZoakdpVEM2RnQxQ3l2czRLV3k5UmlPeFdlcEc0R2VwdHJB?=
 =?utf-8?B?UjN6dFNrb1NoUTRQMGUzNWxad2dKNU41b1dWT2hUeFVmWG9SZ1pkMDFJTFdT?=
 =?utf-8?B?Qm5uNmlqU1pUQlcyR2N0U0ZtOHN4NkQ5YjdiMzAvNGZIUFJhb0tsQWxBNEpz?=
 =?utf-8?B?aVFzYmhwZ0FPVC9kZGkwb2k5eFhBQk1ZSEpwb3JFcXNMTExEbXBheE4zN21M?=
 =?utf-8?B?eDlWekk1Q2RwUk9PZ0h1cm16VVFFRUdpVmNTekQyb3U2UE9vbER2S2pNUDE5?=
 =?utf-8?B?TlhxaFVYZEd6RDRJelowaHQ3MnpRWHBXZFphYmlwUXNubktoLzREeUkrdVNG?=
 =?utf-8?B?UkdMaWZtMkhDa0hxNmJDVWdzbi9Eb1U3MndoaGM4WUVZQ0Y1R2pFc2VmdVo5?=
 =?utf-8?B?SE5HSW8vYTYxdjJFSXpyZE9rQjRSNElGZDdsT0thT0tFNm5KQllKNFJRMXhh?=
 =?utf-8?B?cCtIeVFGMlVDZUVqVk5QQVJLWHo1RE55Q01jL2tLQmE0REJaRHVpL2pWL1RF?=
 =?utf-8?B?Ym91UUVuYzRxeGxzTGg2WEFYbCtkZlhIRVJpeVgyb3R6RlpvdHJkUWdkVll1?=
 =?utf-8?B?YUFUdFBVMkx6cnU2ZlQvMEkxMm9INlFRbk5FMHY4MDJ0cFlvN0dZRjFxbFY0?=
 =?utf-8?B?U1plYmVlUy9kQStWbGc3dnd4MThLcnY0TDhPZG9WVmlDREFMbEQxa3NnR3lZ?=
 =?utf-8?B?VzdGNmpHRjltbjJJd3BmNCtzNndvcWxicHNhSnllV04xajRFbERKSUt0UVhV?=
 =?utf-8?B?Z0M4RWhnbk5hUXVEQ0F2RFlnaGI3RjJYUGRlZTVLZ1JDcHhYTUZldUNPSFBi?=
 =?utf-8?B?cXhQdnJJelUvdEEza0E4YUEvbjVHSTVEMStzYWJwMlFUbU9RYkZzVk9TUkxa?=
 =?utf-8?B?dFIzNDZYSzd2TzdhUVlYYXBJUmVhekxieVBabm52OEhYbUpEWEd0N2IraWVK?=
 =?utf-8?B?T2EzTVNiUEZna3lyM2IxTGtGbWdzYlNtS0Yycm9vK2l5V25tQmhLZloyNTk3?=
 =?utf-8?B?NXpWQjlWcDhnakQrc0dkWlYwYmUvTlB4aGFUekdIM21HYUdsbnU4SXUzeHpz?=
 =?utf-8?B?czVTTEVZNTZkUml6R2Z3UFVBOStsYldRb1dWUUFpMHhCalBZZk9seVNrV1gz?=
 =?utf-8?B?S0FFSXJ1cm1CWTl2VVFXNyt0N0pDeXJmclFnSjJUb25Ec3hsUTkxREVQaG5H?=
 =?utf-8?B?Zjh6QW9rSDRkc0FlbGxlbUlsYk9rZFB3c3ZHalhTMzR2Q29CT1BpM2xtSGtI?=
 =?utf-8?B?ZnZqRTlzOEZQUVVDZlM2aHdxMnlTSDdXN2E5dlo0LzE0SEtjeVZETXRlTjdM?=
 =?utf-8?Q?4lGhP9MFS2zH0+HQ=3D?=
X-Exchange-RoutingPolicyChecked: X1nt45qNL8/p757qG/D36K0iV6925ZPV3nHx8NEy7H2Qb+eRhYWzsps8O+ZeF4uy1G4598F+AL3dxLkzqMRBGBKasVauv+bExU5QRI9WwomarDMFuvK7hHu+JGwveXDA0LcIVBG2ca3yBFR7HDKCbnLQNhB8ge96GNmshjm1r9CMAOeu4NvyGNdK/S/MPU5qi2RnrbMCIdxqrQ4SbBOD14zUEflLtyZmEW8O4jyKXCEtABXN0cHaX0Cg7pqBv2eB+pXHDdhMahInTOnIhVxsiMN9OOw7LVyxjNVfdRFBQ6nbaOrv32sxm3d64Lu0MZRDYGeslc0tY4tL8q6/L5j8zA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 73da3bf6-3b51-4550-e28b-08df13f59bb7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:22:51.3001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mu/Nzd/7T6bR4luHgbfWMwH9YwZeWXPevTds74MdXFK7rXYAU7E9AACqghJRgBrvtrUmipx1vRYcLhqzP0BOsE8SLuk41fEuTrMyDMS0Pp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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



On 9/9/2026 9:47 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Warn if use_flipq==true in intel_pipe_update_{start,end}().
> These functions are part of the MMIO based commit codepath,
> so should never get there with use_flipq==true.
> 
> We were also warning about use_dsb==true for the same reason.
> 

Typo on the commit subject: use_flipq

Other than that, LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_crtc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index c7a85dce6aca..58a99c265598 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -596,7 +596,7 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
>   	struct intel_vblank_evade_ctx evade;
>   	int scanline;
>   
> -	drm_WARN_ON(display->drm, new_crtc_state->use_dsb);
> +	drm_WARN_ON(display->drm, new_crtc_state->use_dsb || new_crtc_state->use_flipq);
>   
>   	intel_psr_lock(new_crtc_state);
>   
> @@ -735,7 +735,7 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
>   	u32 end_vbl_count = intel_crtc_get_vblank_counter(crtc);
>   	ktime_t end_vbl_time = ktime_get();
>   
> -	drm_WARN_ON(display->drm, new_crtc_state->use_dsb);
> +	drm_WARN_ON(display->drm, new_crtc_state->use_dsb || new_crtc_state->use_flipq);
>   
>   	if (new_crtc_state->do_async_flip)
>   		goto out;

