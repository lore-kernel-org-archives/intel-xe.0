Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA37CCD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 20:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2953711297C;
	Mon,  8 Apr 2024 20:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPRBNbjR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30E711297D
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 20:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712609778; x=1744145778;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F46lsBgEtvxhjaQ5CvP/eBTwCTZH+LkgAX6PsYedRjs=;
 b=dPRBNbjRxMY/+tOqlUrgxj9kaHrOI3D5Qx86FzC0tgkyjAcvZnfQ/4p7
 GEumhqohbf7qoLIbunNyZeUaqYlkU59k2i4izzCit63EKV8f1BXRYkACc
 N3NEicyBgczUEOPLzVKcYPFc/UjuN5KH9TC4cWBdLuDMFzsioUDf7nMEH
 JOuQoUHoywbUzr2a5SKyqXLUDt2sGMejtONntTPEgaBop3P89uFZ5wVq+
 zSymmUJQN0IEP14/eVIctLOLFnSyQ2bNBtnDz8p4q6iJJXaHvDqs6n4IG
 u0IYLNx2F52EYmWnfim3kShCNSvgo53qUQLdOwz5T8MuLG4ZObMV7U0kW Q==;
X-CSE-ConnectionGUID: Ad6h0izWSjecmyJV1k/dwA==
X-CSE-MsgGUID: cCpoMf8YSgOHz06Z52o5oA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19055970"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19055970"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 13:56:17 -0700
X-CSE-ConnectionGUID: NBGaf2gFSJC4IkT20isKxA==
X-CSE-MsgGUID: iJuV5NCrTiOGF6jgWq/+1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="20032421"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 13:56:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 13:56:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 13:56:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 13:56:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 13:56:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCeIWXMLPVU9n+lAAlmfLpv6k5mTwZf9yVGgD4eg/5fbQnjd7E3yYuVS+l4iA2D1Y4C4cFdIWsda2Ilym2/eDFuGMR6CbHAEyJqxiBdYAiiKRV7gvs56AJmI8DuaMRGD4TYNNbL+LFQDsurDmgGTKekzZioBqvSrAzbmqGI9H5FXunoMgUhc2y65WT7MG1H9G1aKtqEORsAquiJEkarJYlA43YGiYi4LqMqvPAKiPnld8532/UZsFCWKcVV23L66Cn/eCbGfTtSkfp+QB7cyGuq1td/OE482E1fMKk7SshTDHx1bEDAr5OUd+v4+5X8wv35GtdfMb8WnbrMGCFINog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BEFBnkqt+jG8KhjqRYMv+f1eEGaIPMV6fGrjwOg88A=;
 b=k3/xXfhU7uA0R61prXqtzsU046EB8lZlJoTWzfx3pSvxIKFOTp6ILJxxRQWFzmRl/d2KIG+AKol9DKaLU5/0uNy+BSsJncnsjM2sPsca4iejg2GV5/ZZXcyWP7uabG/UrJquI/vFPXMGt148+mi5vwZtcPAqecfzbhgV2Q4KEYL+3UMBkHiQjyHRIeCb6Iy33PGy/g5KMu7z49D8nKLudskTSatWZdJKX2flRtrb3ecxmTMC5+4uvaRxlNN8jCUZNQMAefHfY6ighQmqtp4Y5q3rUcf48bBfg3xVH7Z4tZ8FXM3HsahNUG4/KFIqEyQbHkntScagoKtBh2eoIofx0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS7PR11MB6078.namprd11.prod.outlook.com (2603:10b6:8:86::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Mon, 8 Apr 2024 20:56:15 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 20:56:15 +0000
Message-ID: <dcf31234-92e9-4df4-ba45-0b2489cef7d7@intel.com>
Date: Mon, 8 Apr 2024 13:56:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/guc: Add support for workaround KLVs
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20240405084231.3620848-1-badal.nilawar@intel.com>
 <20240405084231.3620848-2-badal.nilawar@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240405084231.3620848-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS7PR11MB6078:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UZtXGWd3GmnRo4ivfuFXx8xg+E4/Kmu0t7tf42fvkIGmhjd0oDtBoNlxXwNRuEioA89KfRo/++dJIt7opYNhRuEWpgIGoy4stOmYLqjPfm+QsHlBFHUfN1ZhKzxOfMWXcigKep7Y5P9jtwh7vdKMtUy0RnVR26UxipzDs+HuYc72QcDxpxu32HbAp6sW9GBSd1+qo9k4Hf2sRtTNtfhZgOKpnEKOKlyhBBBBY6KxmNBireo7OH/pbxFa4jAV5H1CEykA1kS8LbZ9cv4NJ5Fx9X6T7Iir/Bw6OYOF3gABWeuEf4HLgVFrjm2/bkgB3LP0AISMo+5WXcP+sAG2yaoBbAkVvCeq8XsI40TMAgMhwLmzfJHa8Hbvht5ZJ/+6rTXCcHNqrGYflMRp/lRO9az9sUO+YlO2ApUMHuN+SLql1mvQDvd9ksiI3H3+MffZzTW3j37Lhkk8psv4SvHIV46bzYfEgVYdRaXRdMJdMK2e2dJXb8nfjspTsBRVM6N9p13xnLn1mNwe6CdXRDrmMx8tt0TW/hN9451+B0M8sAPR6D4A2k3kgIPtoIRxxmHcj6ObvtsAJETv04IQFp4KcVdM4QyYTzSOzSI+H7ZCUdBIjSSF+/ZZxNyAu9OQKIzQnu7sUD/nMUWAvax/5oZ9DlWfR+08jHRKneIZwjz29auyj/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N05KUTlzd21CMWV6bWFoSWRPazBBekRsTFdsSE82K1Rqc29UNGYrQW9IemF4?=
 =?utf-8?B?R1RxNXlEaUE5Zm5VdFQwaHJ1SytVL255M1Y1N2lsbHNjMnVDMlFYOWMrdFNk?=
 =?utf-8?B?bUk0dGFCaGZTWFBHL1JuRGhLN3RxOWVzSkx0NnU5dTJCaEV5UWpud0tRemFJ?=
 =?utf-8?B?NHQzN3NwMGRQU2RnZDdzSU1yUzVRVkl0S0daZnZwdTJGYUVBMWp6eUE5d3JW?=
 =?utf-8?B?S3lzRXByclRRUjhOTXdmTnFUeWc5MTlnaExrUmEzSzYxQ0RabHB4QTNaME92?=
 =?utf-8?B?TlRTS3BVeXk5ajlmQVJvS3hxSFVHc3VwWk5ucFMzU1hRcVAra0Iwb0czUXJu?=
 =?utf-8?B?czBjQ3FYODJWang5ZFA0TFVoUzlsbnNsTjI3YkJ0VkQ3S3V5SUFSTmZmK1pM?=
 =?utf-8?B?NXJpSHR5dzlodUNCNDFIc3R1UmxOZlQyRkVtVFBvWHF4NytiQnE5S2t0Zldw?=
 =?utf-8?B?aUd6eE4rRjhFaEdxR2ZzOWpPVzZwb2lWOHQ5SlRSMGJvOEZKN2MzMVZKVXgw?=
 =?utf-8?B?ajZ4b0taSmhpcUF4TndhWmljMEh0WTVMbWJQZUx2Sm1GV0ZpWVQwRmtSS0c3?=
 =?utf-8?B?azdxMEl3WTEzUmJuVnpsdXBTcVRrdXoyaFZUWkNBZmxHcUd3Tmd2ODVpMFlT?=
 =?utf-8?B?ZmtiVDk0bDlET0xyaWNBMytydHEvcm0yL3lkakU3QXBFanVIclNLclN4Wmpk?=
 =?utf-8?B?eDYxbkV3dWVIUkh3R1FTb1JJckNFbFdKVlZCSlVCRzN3VkVXVWhLM0NybnI1?=
 =?utf-8?B?RkRiVWIvNlJQMzNUREtPRFFIWEhxTzNxcTRNdVoxUkFDMDMwMUZ6RmZGaE1U?=
 =?utf-8?B?YytTL3Jjbkw5ZmVJY1V1cktlcFNOUXFaZ2hvZ2N5WWtSdEVxeWoySnpaaTJ1?=
 =?utf-8?B?VlV1Ti9EQTFoMFhvMW4yNDJJSHBNdE01R3U0ZmQrd2hhMGF4ZWJuYnp5bmIy?=
 =?utf-8?B?Nkk2VkhGa2dQVHNOcVMzbE9HZHc4eWE0MzV0aEdMa2trbFpFTG5EckExT1do?=
 =?utf-8?B?L1c0TXN0RlRHc1lMZ1VaSlhnaXJkT0hLQWNwMnZROE5sVTVWUldMc2FJQk1i?=
 =?utf-8?B?a3FPOHBJc3hITHYreXRFa0tIa2dmVjNrMjgwTkNRQ0YxRzJYTmV5VEo5U3BL?=
 =?utf-8?B?RVFWbFVPNmo3M1EzNWlTdlN3L0xOcTYzWHEvTC92VWRXNmZxR1RuL0VPR3Jt?=
 =?utf-8?B?d0pTR0JtNVJwOEtQWTNFTVBvQ1g1SHd1OHhkVlFvY2VkVVpIMmxMbDYvc0p5?=
 =?utf-8?B?OVdDZWthYXl6My9QU1BMYmpmcmpZY0l1WUtBNnRCREduQVhYU09iNmNnd0FL?=
 =?utf-8?B?T29xN1QzdTB2R0hDSTlLVlBHYmw3V3RuUWcyZVV0SFVIbjErd3FFazRSUUpa?=
 =?utf-8?B?L05wbHhYWkJycHFuMXNzSDQvNlQ5OEl1VTVqWW1PVE40WkgwRUxvZFdtaDI4?=
 =?utf-8?B?SnBncGVnZEZVTmVNcTB6TEt0bC9WblF3RmdnQnhPK1JyaXFCd1AwUWU0S1Uv?=
 =?utf-8?B?QWg0bDFud1V6MVI0S0w2cno3YXluYmJlaEFYNXdkRTRyQXZqZ0ovMFppRC93?=
 =?utf-8?B?S3FCNW1vWlQxQi8ycy9kRktpSTBvNjZ1cFR5Zk9DQWNiZm1KR2ZhTG4wRVR0?=
 =?utf-8?B?MisrbUY4ZTlMVHloL3V0MmpFb1dFdGUzUHRvZGxFMVVKNlREWFQwLzUwNjVm?=
 =?utf-8?B?emdsaE1NT1FCZzIzcnV5OTN2clNXZ0pZYXNsZWhaTHdMbWN0cW5Ob25uc3pq?=
 =?utf-8?B?NWpxNEVJUjhqRGpVM2NLYnVTUFBnYk9qUS9sZEZzL1cyMWxrcUYzYzJLRlIv?=
 =?utf-8?B?N2hkMTQ2UUQvc1B4b0Q0UkJpVm1FNi8yNnBKaW9xM3oySWNUZGxjMW1EUStX?=
 =?utf-8?B?b0pYb1prRGRGSkJVeXd4S3V1S0VydnNoZ1Evclkva1NnVnNTZHFGTVo2Vm5z?=
 =?utf-8?B?dm85czFmMFRFQXFIN0VTQzRFU2RLeE9qbE9ZeVZzZjAyL1RFNk5haTdEWG1F?=
 =?utf-8?B?dGtCcWpZcXo3WHpXdHRhczRoOG9vN3FpQ29pcGM3bWZ3b0tDRHcxZGhDcENt?=
 =?utf-8?B?cXRGc2NKaHJSWEtoSWRHelppMERPS1dyK1Izb1BuOFZPbVdJTHU0VlJkTnFX?=
 =?utf-8?B?RXp0dmdXUUtBclhRRVQwQW11VlRCVkxYaENOZW9jUTE2L0FQTFZoNWg0NHZP?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5320b9-b293-41b5-7ec2-08dc580e544e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 20:56:15.1813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JaiwP5SlG9fNImSbLryT4FpBF+pFnDp0N6/p1ti8a8a7j4XDRRkbYg6Lk05BSR46BrT6vF/FbwZjeVUmuPDfgII3tiG3X+R9B0uSA66MLQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6078
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

On 4/5/2024 01:42, Badal Nilawar wrote:
> To prevent running out of bits, new workaround (w/a) enable flags are
> being added via a KLV system instead of a 32 bit flags word.
>
> v2: GuC version check > 70.10 is not needed as base line xe doesnot
>      support anything below < 70.19
> v3: Use 64 bit ggtt address for future
>      compatibility (John Harrison/Daniele)
> v4: %s/PAGE_SIZE/SZ_4K/ (Michal)
>
> Cc: John Harrison <John.C.Harrison@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 62 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
>   drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 ++-
>   3 files changed, 66 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index e025f3e10c9b..0a8f27243c84 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -80,6 +80,10 @@ ads_to_map(struct xe_guc_ads *ads)
>    *      +---------------------------------------+
>    *      | padding                               |
>    *      +---------------------------------------+ <== 4K aligned
> + *      | w/a KLVs                              |
> + *      +---------------------------------------+
> + *      | padding                               |
> + *      +---------------------------------------+ <== 4K aligned
>    *      | capture lists                         |
>    *      +---------------------------------------+
>    *      | padding                               |
> @@ -131,6 +135,11 @@ static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
>   	return PAGE_ALIGN(ads->golden_lrc_size);
>   }
>   
> +static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
> +{
> +	return PAGE_ALIGN(ads->ads_waklv_size);
> +}
> +
>   static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>   {
>   	/* FIXME: Allocate a proper capture list */
> @@ -167,12 +176,22 @@ static size_t guc_ads_golden_lrc_offset(struct xe_guc_ads *ads)
>   	return PAGE_ALIGN(offset);
>   }
>   
> +static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
> +{
> +	u32 offset;
> +
> +	offset = guc_ads_golden_lrc_offset(ads) +
> +		 guc_ads_golden_lrc_size(ads);
> +
> +	return PAGE_ALIGN(offset);
> +}
> +
>   static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>   {
>   	size_t offset;
>   
> -	offset = guc_ads_golden_lrc_offset(ads) +
> -		guc_ads_golden_lrc_size(ads);
> +	offset = guc_ads_waklv_offset(ads) +
> +		 guc_ads_waklv_size(ads);
>   
>   	return PAGE_ALIGN(offset);
>   }
> @@ -260,6 +279,43 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>   	return total_size;
>   }
>   
> +static void guc_waklv_init(struct xe_guc_ads *ads)
> +{
> +	u64 addr_ggtt;
> +	u32 offset, remain, size;
> +
> +	offset = guc_ads_waklv_offset(ads);
> +	remain = guc_ads_waklv_size(ads);
> +
> +	/* Add workarounds here
> +	 *
> +	 * if (XE_WA(gt, wa_id))
> +	 *	guc_waklv_enable_simple(ads,
> +	 *				wa_klv_id,
> +	 *				&offset, &remain);
> +	 */
> +
> +	size = guc_ads_waklv_size(ads) - remain;
> +	if (!size)
> +		return;
> +
> +	offset = guc_ads_waklv_offset(ads);
> +	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
> +
> +	ads_blob_write(ads, ads.wa_klv_addr_lo, lower_32_bits(addr_ggtt));
> +	ads_blob_write(ads, ads.wa_klv_addr_hi, upper_32_bits(addr_ggtt));
> +	ads_blob_write(ads, ads.wa_klv_size, size);
> +}
> +
> +static int calculate_waklv_size(struct xe_guc_ads *ads)
> +{
> +	/*
> +	 * A single page is both the minimum size possible and
> +	 * is sufficiently large enough for all current platforms.
> +	 */
> +	return SZ_4K;
> +}
> +
>   #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
>   
>   int xe_guc_ads_init(struct xe_guc_ads *ads)
> @@ -271,6 +327,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>   
>   	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>   	ads->regset_size = calculate_regset_size(gt);
> +	ads->ads_waklv_size = calculate_waklv_size(ads);
>   
>   	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
>   					  XE_BO_FLAG_SYSTEM |
> @@ -598,6 +655,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>   	guc_mapping_table_init(gt, &info_map);
>   	guc_capture_list_init(ads);
>   	guc_doorbell_init(ads);
> +	guc_waklv_init(ads);
>   
>   	if (xe->info.has_usm) {
>   		guc_um_init_params(ads);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> index 4afe44bece4b..2de5decfe0fd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> @@ -20,6 +20,8 @@ struct xe_guc_ads {
>   	size_t golden_lrc_size;
>   	/** @regset_size: size of register set passed to GuC for save/restore */
>   	u32 regset_size;
> +	/** @ads_waklv_size: total waklv size supported by platform */
> +	u32 ads_waklv_size;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 5474025271e3..19ee71aeaf17 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -209,7 +209,10 @@ struct guc_ads {
>   	u32 capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>   	u32 capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>   	u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
> -	u32 reserved[14];
> +	u32 wa_klv_addr_lo;
> +	u32 wa_klv_addr_hi;
> +	u32 wa_klv_size;
> +	u32 reserved[11];
>   } __packed;
>   
>   /* Engine usage stats */

