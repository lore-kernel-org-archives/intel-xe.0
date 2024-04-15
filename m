Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD62C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 03:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1225310E2C6;
	Mon, 15 Apr 2024 03:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZ0ue//1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A90310E2C6
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 03:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713152856; x=1744688856;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=ybbfUUY+w/jzH2OdBbhkbArhooa+0Dc+pYRJx46o5xY=;
 b=FZ0ue//13w8/A4ySrvzcYq+wB5ooao3xujFujS3yimTXDcr6ZgWVgegy
 CMKuBj0H2noH1ASgLnMuhJLirxkWvnCqytLdMNlDxibVg3Cm946ZvXyv9
 SJ5OMHqmNbj/7FoSN4ehhMINCkWu/4OhaeteU/jEZEKCotYsJQX5FE3Iv
 yeCmL0GThPAHDWjUeR6BcxzaZEDcA3+7yztd+t//Coc+N27uLmzuCWJ+1
 9Q6kEghzEUe67RiV4pIFuQbyA7eH3fQ7jRkI9eH3rbLHh/sS6Mld5tBbQ
 VnODWCaDe9CONKwemhJqEARKna0Ae2BpgzAOMNZygTYRPnexFhgZ5K/gH g==;
X-CSE-ConnectionGUID: 0SvbjhTgRLuBzm7rKBV8mw==
X-CSE-MsgGUID: I75PPJaVRR6yLWLkzg0bYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8362722"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208,217";a="8362722"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 20:47:35 -0700
X-CSE-ConnectionGUID: veWftZqjRiO0a5AnAZGRGg==
X-CSE-MsgGUID: ezlhd79vSa+L3J4QqnWenQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208,217";a="26335513"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Apr 2024 20:47:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 20:47:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 20:47:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 14 Apr 2024 20:47:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 14 Apr 2024 20:47:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFmiaTjj7MWQE35STWPB29tVqj4OMnP9Aa4TRrdVnV9GGQOUQ2z6XCVsC49B2sxPTSvZJ9k8oMKqfGlmWyNbJGHG5rZYlLzgux7eiVd4UQ46QHXPHQCWPmfwMURYnKzXJlIFEQUwXEnBwUSCz1R1P79IB6wMakbLRCHSGQkQB3uFfcY0wruQswUma4DA3CRBYCVTOsbmPN9jabeLcH3mK560By43LUul6u4/mKmpFLevWMAkUSlxr05rSBZHlQW/s0h9fH7CrmSqjjhsHKWPdZjyAx81vUCJZyYrKP0lJZxFDR1iv3hdi19qaQto/ZExBvpxdVj8zIFhPz9cKtEsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lC3YotZPhEJMY4tkFBzI5gMNVDD31SPjwvNwgf81tDM=;
 b=F2sTeTJ1FHUdTZiUWvLu6A5YEZRrQ5jw8+pAEa8QBp6kDjDAO31Uez8Zojp5GKYN1I6KXbUvBfedPdodftZPq7c04+eSQSlmChc8ByyECbXIjjaY2HGOEIYa2VD7wSHHLDwdOWRlxU0CmJABcpDZKBphybDlNuXywavEc8HY9Av+2tT+J1/YUpC3FR/Md3K56ZerT8SAKmiKE83ESss2/EZFLMm2kMzte5fd6++H3XQuIeOhnwADwxbq9gaq3YNmhnMPp66PCltVxgtyXxgOsQjbnt/txmttJ9pinPD1oBdmANWRxGQs4CtL+uWG4DodjLJbZSBLg27Ng7TgpOYOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB8158.namprd11.prod.outlook.com (2603:10b6:8:18b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Mon, 15 Apr
 2024 03:47:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Mon, 15 Apr 2024
 03:47:32 +0000
Content-Type: multipart/alternative;
 boundary="------------LnrkpgDd4VDwqQ7M0XIrhqrs"
Message-ID: <42834d9b-f8ab-4206-800e-72222613b83e@intel.com>
Date: Mon, 15 Apr 2024 09:17:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/xe: Add helper to format SR-IOV function name
To: <intel-xe@lists.freedesktop.org>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240414190137.1243-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: PN2PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: 236acd9d-f341-4378-8038-08dc5cfec7ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Saa6QBIHlOv4S4n5vP/aWQyHZVS6xwrim9XWbLDMTPPvxlSL0/iUR8AuiUXzyN+cIH1jNUF+2S7DwxbPQ4gl6z/9DMpbm/0tZwduYOGh+yYu4i5Twwymct9/w/AyrA7H8DqY7u5wkRBH2pSRrQXdkqLdU/x3CDc0m4BGIUMUVLTgVFAYBykWXYlkXHpdYaDq1Psm7/3rLcNyIyT/MWwVGXSiJy6EX5W5u7dOrkZ2jh/A0Umw3wbOIwyNX9FuBDN9r3h8bgoXO0QvJZviT497+LM22P1wysCcX8rfVaM1LcjPAQuCWJRCNnMw2cDhqgTvPSgVAIGo2tectodLhM6g80KeokJ50FU7xkt/SXFUeHANSBhSSuTCdQB/S+BLy80NKnlba1m64fkw0QsEiminO1w6Z1WTBpRRxP9otkrpQKA5mUvqPgTZokNA2PClTYelYVNPQ2VeQnWeG8RwxnvuSwVD0yyiLXEutwvHPObDAwg7ePYoBzmtYIWwjiErdDd70SoXyseMudjDaY5TP7x8qwRRa5XP7tjzyuMrXL3X+iF1bxvVrAAmC6prCXBh4HBvwfHwN895MjI/6MdAxIu/VnD/0JhvyS/kWoHA5Tsel18KndyGk53BQdVQuXsNVKu1eHwquiqxjaApRsuOZDCNZ59xEw3RjRwwucHkglIcBlM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0RRc21iN0ZkVGNOV3U2aGl4QnBwNVdmRm9najcvekF4Q00rdXFMRzJRaUhi?=
 =?utf-8?B?N0dnVFkyZUtLTThnWkJxRnpZb29URHZzckcwTEFIaU1Rd3Awc0EwSHNld1FT?=
 =?utf-8?B?bnpLdWh5cldYbklZMmJxaTF3L3ByOGpiRm9EbjBnQURKaGpRQ2VNL0JuRFJ5?=
 =?utf-8?B?czlzK284dUt5L21nZUdDRHdQV0Q0OC9VeU1sRFJFWVNyRElnQWs0aEVjaFp4?=
 =?utf-8?B?ajJOLzBYV2orb3gyUlFGaEYwQmdlS0tWa09xUHIxa3VpUyt0YlNibG5wSGho?=
 =?utf-8?B?N0V3ZjI4MjZyYTJkS2RXUW1wNDB5T2RNbnlLclp2MzBFbEw4dGtycXk2TUxE?=
 =?utf-8?B?c3ovVURMRXAvbDR1WWFvMit2N21CWWdMQk9hdzQ1UUIySi80YTBoUEZ3OEU0?=
 =?utf-8?B?TmswYm15NUUyMTI3SmpRdE1KeS9iR2t6QXBDMzRZamVKV1Q5QlJEOG9WSDE2?=
 =?utf-8?B?RTZXODh0eWY1QlVHTGlHdGtaRXBHVzFxWGF6UUxBOUtiRk10bHQwREh1Z2lS?=
 =?utf-8?B?QzBsWU5vd3ZnMm5OTjVDWC9lOTZER3gvV054T0tNdmhZYk5ua2NoNWVib05P?=
 =?utf-8?B?bzg0TWYrZllNcitlckowVUpPdTRIQ3h4UCtPUzBnTklxRmZVVnhzcitnNEZ1?=
 =?utf-8?B?dU5NVEI2MUZGOVQ5bWgyYVpOSDI1TndOdmUxQzBjdUpqSkI3TGNLdUdPYUtp?=
 =?utf-8?B?NlhZSkZZaEluZnJROUlQYVhnUzNUaTYwZksyNXJhdDBhYzdkYytNMUgrRHNs?=
 =?utf-8?B?QTZ3aVBtcUdSSGJ6Vzhncmw1ZkMxVVdYQm80QytheDRuV2prU1lWb2VvLzd0?=
 =?utf-8?B?VG5mMVg3L3dCVzQwZ0pZZGhPNmtVNlpQZkdlMnphVCttc3YyeHQvNmpEWS9x?=
 =?utf-8?B?aU1CS0VyeE9md0JCbHFReHkyUm1CWmJyb3RSRW05TjREaE9GcnplMVpWMmFl?=
 =?utf-8?B?RlNrci9RVW1hRk9OVER3UEMyWjB4b1laSG1UZXpUbjU0bkJ3NEJ6SVJiTmlj?=
 =?utf-8?B?dGgxSy82cW9oUDdsS2JYS0FrRGVoYktKazVhN1lYLzl5R2xsUHA2dWh6bjVZ?=
 =?utf-8?B?SHFPZFY5cGg1RFNPZ1hoZGp1WkZtYnRFOHV0M3M2S3JKdUdnRXI0dUVwRkhO?=
 =?utf-8?B?aWdJTWxkWjIzMkF2Y2F5d1MxZFlDbGRGUmVpQ25DNDVJeUpiSi9qOTRIZC9z?=
 =?utf-8?B?M2dCdXBIRjIrZ0VxSDBKQnRCeHlkbW1GUjFUckhLQWVPbE4yaE9NZmtQeFB3?=
 =?utf-8?B?bTZDUjNUQkp2TndxR0w1bEJIQjhZeitFd2FCYTNiWkdGZVI3K3k5aitad29Y?=
 =?utf-8?B?c3BnR2IwdTNxY0I2WVliUmFBamZ4dmN6TzdEZFBqTytXUjQwR0JpSVVYL1E5?=
 =?utf-8?B?Qkl2QUI3UmlwRC9aalRzNTJiK1lVT2EzMi9TU1BldVBMZTBCZS91UXhyM0Na?=
 =?utf-8?B?WXgxT3lpVXNyN2hyd3JRT2duMGs3TGc5OU1ObGNXT2ZTR0U5MU1jc2hRTlFq?=
 =?utf-8?B?Q3R1RnBlcEkxVXRhbUd2U3FXR3U2ZVUwL1NYdGpOdFFBaGN5T0l5WUJTZVZh?=
 =?utf-8?B?SGtTT0hBQlNUMXdWUnRtVTJZcGx0Ulo2djNPclB6ZHgxUjRqbUY1WTF0NlBn?=
 =?utf-8?B?R2h1bDVBRFhXdTZFWVEvSGVGODBLclpqTGZLcWlJb0VMT3J1K3hteVYwbXFw?=
 =?utf-8?B?VWRUTVh2cVBWTi9zSXlhdUc4TFVNdjU5YmxFVHoxUFhqRFQrQUNLUytHZm5X?=
 =?utf-8?B?ZmV0dFZkUFVQR3BTdjk0STV6QVg5MmJtOVh6dXN3MlRUdzRxSC9tVzBreFlt?=
 =?utf-8?B?K01DYlF6OGlucndiSWw1eFoxREZYU0ZkYkpPVjVRbkJCcHFwNDg4VDlUdW5D?=
 =?utf-8?B?TVhycHJIQlNROHBjeFU0cmhEWW1zMUpJU0YwUTl0dGhQVGxUc0o5cklJcnFQ?=
 =?utf-8?B?WDdsK3RNa25PQzUvU3doUlV1akZMQ0dnZUdBTVhseGN1MXNyWk4wNi9Xd0N1?=
 =?utf-8?B?djFwcktMSGxSa3lyMXFHNzAxenpRY1dIWUhzRTdVQ1BEZ1pWcWNEcHpkaFpy?=
 =?utf-8?B?aWppN3Fid3ovRDRZN1hscDBuRFNvb0dSWGJBeS9hY3JCT01WQmJLWGtHUTNm?=
 =?utf-8?B?enZXeFVRU1I1RmhhSk96VXNqWm9VUWRTL0dGekMvTWN4ak9ZTm01N0I4Y1F3?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 236acd9d-f341-4378-8038-08dc5cfec7ac
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 03:47:32.5280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNy323nFNWw0Gx1gGANZOxC6hZVcTT61WivkL2aokfwO8X7UYHvOp0/n7LUe6OxpRI7UbCXaxVoKLxE6V02LiiDvYF5LUAA0x+8IrBGGq4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8158
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

--------------LnrkpgDd4VDwqQ7M0XIrhqrs
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 15-04-2024 00:31, Michal Wajdeczko wrote:
> While the GuC firmware and the Xe driver are using VF identifier
> VFID(0) to represent the Physical Function, we should avoid using
> "VF0" name and use proper "PF" name in all user facing messages
> related to the Physical Function and use "VFn" name only when
> referrinf to the true Virtual Function. Add simple helper to get
> properly formatted function name based on the function number.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sriov.c | 17 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_sriov.h |  1 +
>   2 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 1b40f5de9ef5..1c3fa84b6adb 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -122,3 +122,20 @@ void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p)
>   	drm_printf(p, "enabled: %s\n", str_yes_no(IS_SRIOV(xe)));
>   	drm_printf(p, "mode: %s\n", xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>   }
> +
> +/**
> + * xe_sriov_function_name() - Get SR-IOV Function name.
> + * @n: the Function number (identifier) to get name of
> + * @buf: the buffer to format to
> + * @size: size of the buffer (shall be at least 5 bytes)
> + *
> + * Return: formatted function name ("PF" or "VF%u").
> + */
> +const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)

nit: It is not necessary to return a |buf|, so |how about void instead 
of const char * ?|

|With that LGTM.|

|Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> |

> +{
> +	if (n)
> +		snprintf(buf, size, "VF%u", n);
> +	else
> +		strscpy(buf, "PF", size);
> +	return buf;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index f9dec84d77e3..486bb21c3256 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -13,6 +13,7 @@
>   struct drm_printer;
>   
>   const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
> +const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>   
>   void xe_sriov_probe_early(struct xe_device *xe);
>   void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
--------------LnrkpgDd4VDwqQ7M0XIrhqrs
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 15-04-2024 00:31, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240414190137.1243-2-michal.wajd=
eczko@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">While the GuC firmware and the=
 Xe driver are using VF identifier
VFID(0) to represent the Physical Function, we should avoid using
&quot;VF0&quot; name and use proper &quot;PF&quot; name in all user facing =
messages
related to the Physical Function and use &quot;VFn&quot; name only when
referrinf to the true Virtual Function. Add simple helper to get
properly formatted function name based on the function number.

Signed-off-by: Michal Wajdeczko <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_sriov.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 1b40f5de9ef5..1c3fa84b6adb 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -122,3 +122,20 @@ void xe_sriov_print_info(struct xe_device *xe, struct =
drm_printer *p)
 	drm_printf(p, &quot;enabled: %s\n&quot;, str_yes_no(IS_SRIOV(xe)));
 	drm_printf(p, &quot;mode: %s\n&quot;, xe_sriov_mode_to_string(xe_device_s=
riov_mode(xe)));
 }
+
+/**
+ * xe_sriov_function_name() - Get SR-IOV Function name.
+ * @n: the Function number (identifier) to get name of
+ * @buf: the buffer to format to
+ * @size: size of the buffer (shall be at least 5 bytes)
+ *
+ * Return: formatted function name (&quot;PF&quot; or &quot;VF%u&quot;).
+ */
+const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)=
</pre>
    </blockquote>
    <p>nit: <span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne,=
 ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubu=
ntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quo=
t;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot=
;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font=
-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; te=
xt-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, =
255, 255); text-decoration-thickness: initial; text-decoration-style: initi=
al; text-decoration-color: initial; display: inline !important; float: none=
;">It is not necessary to return a <code>buf</code></span><span style=3D"co=
lor: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sans-serif, system-ui, -a=
pple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sa=
ns&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color =
Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot=
;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-=
ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spac=
ing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfor=
m: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; whit=
e-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-th=
ickness: initial; text-decoration-style: initial; text-decoration-color: in=
itial; display: inline !important; float: none;">, so <code>how about void =
instead of const char * ?</code></span></p>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;"><c=
ode>With that LGTM.</code></span></p>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;"><c=
ode>Reviewed-by: Himal Prasad Ghimiray <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@in=
tel.com&gt;</a>
</code></span></p>
    <blockquote type=3D"cite" cite=3D"mid:20240414190137.1243-2-michal.wajd=
eczko@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
+{
+	if (n)
+		snprintf(buf, size, &quot;VF%u&quot;, n);
+	else
+		strscpy(buf, &quot;PF&quot;, size);
+	return buf;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index f9dec84d77e3..486bb21c3256 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -13,6 +13,7 @@
 struct drm_printer;
=20
 const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
+const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
=20
 void xe_sriov_probe_early(struct xe_device *xe);
 void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
</pre>
    </blockquote>
  </body>
</html>

--------------LnrkpgDd4VDwqQ7M0XIrhqrs--
