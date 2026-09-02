Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A630CC624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 07:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEC010F03A;
	Wed,  2 Sep 2026 07:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zs+NlhH+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBAE10F039;
 Wed,  2 Sep 2026 07:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788334484; x=1819870484;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nJ8Q99atkhL0Lr4+pOzpGzpz99VjmYyc7yEOcviOamY=;
 b=Zs+NlhH+R7QQoeuU1I4yx8LbEa/1hIf90ntx/rjc/X8DnnIWG6WgXxV7
 vp7FSfgBbk+i8hg0BsJfhMnCuOxwlA4CEbWWivICS6nJMLU8sG8zwEFl/
 OYeaKsGeUYZLfLg+E8Abw/9Dk04Yvdrnu8FJFntZuEo7DNA/m+2aA7JRy
 YHmBsTT1mpaYIc5oEhL5uxhzSYQ0rtVX299v938aSSEIHPbu5rNrVfFmd
 SG7khKLYxiYoy0y4f4Ifn8OX9uFyfuJpcG24m2ngtQ0SJLbqHTBgkGmQQ
 qaVYHuaso575LfGXnjtOyzfRijFxCRGI7csoae0KTxBqZvD9VVKJQ7si1 Q==;
X-CSE-ConnectionGUID: 9IAwR2bIQmurdwnnXMiQdA==
X-CSE-MsgGUID: 9lHsCokcQbC7lHKR1S/B/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100138440"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="100138440"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:34:43 -0700
X-CSE-ConnectionGUID: EmTi++sjR1+QTB5Kfo1RrA==
X-CSE-MsgGUID: +vOGohOiTVWWr/rmTZgF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="266728580"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:34:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:34:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 00:34:42 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:34:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGOsxZyWc9uNhh3WPGel9NWsg66iYR+qzEk0nRWy82hxyYd0GBdUdKliotg70+ocP2y5NEA6uAAmr02qHv1qhNyvFZO/8UdVBUW+bxHYX5Xd5jjIrx8SLXG1BYr4rZVC8YRXeY3ArJ0cX+whS9QPZHq8xj6ImhC09KMV4WyfbSzCxaD3B5tOMoVic3ZBdq81G3oZ8Nk3Bu8obJxsG6SxEhjhdz4HuUYNNj35LYQQLqPEzg1u/r6LbXleoesRaN94QDQHFJfjmlKnFrYnZngX8XGOjNeCDQmW5Xiyd9znGHaxgo5QXi48eCFORfcv1j5tUGkJwAAX2SjAJi+fBgqA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOv5LkI9M1XI6niXh/3rQyJp3aGbmx+7DSORrDWb4GA=;
 b=t25Zo5yZVayXKSST8ODW7MYCEZx7s/YOIePOxkTzLRBotHZaCNxRpYs8q9uxTHlKFE5qmvKjqrNGi9awfvcdvn7G/KY9FVS3cH2y0sk69cb4bzmSL88vQnlBnVjx80pggPxQWGpU7aCk7RLZXV6X3HzM0ewmdj6YMYXrWv/DXx4YJSGoebS85zjINanA/Y4jtLbBSjByhsMJvqTtq55s5mUR7RaB0DH4b8RKMEr9p9Oclizd6cbpxpf9tOvO6jp+t32N2+bAuh8jK33QEvunyd//82/Uyq1qlHjySYP8nqQGIo3c97CXdUkFUomrP8DIQjpUoMEjxP7eJZ/kzhIrTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by PH0PR11MB9701.namprd11.prod.outlook.com (2603:10b6:510:396::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 07:34:30 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 07:34:30 +0000
Message-ID: <f779edf1-e6b1-457e-b2b5-5d47002c7625@intel.com>
Date: Wed, 2 Sep 2026 13:04:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 1/2] drm/i915/hdmi: Move audio compute config after format
 selection
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
References: <20260901103639.617757-1-chaitanya.kumar.borah@intel.com>
 <20260901103639.617757-2-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260901103639.617757-2-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0182.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::17) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|PH0PR11MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: 3043e659-71b9-4592-6873-08df08c49ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|4143699003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: yVQdkdpo4WtEKnW0kf0/24+Txp+sxqNyy25CDPEzMQWIA771Vq7USTjMJpYsCLffboFsd1rAmULPNbc9dYPgpPM7468C0yxmqe1p4LCLOT8t6ajSk5RjrPhHpK7ryKnb3wEG6VShLyFnvT5D+zs/p0kWk2588rhUFlZSjpGwOtOxUm3rlaLKucECgtlh4OfnSIvHAltSUBYT5UjBx9hxDkFPR3wJYAA5B1adsD67KtzQpdjEcgSl/8qo4D4GyznrMKCBwWh0cId79Q528PoXPUA3SyjDqGEzagt8hBA/qJZ2KymGTzw8PMQCeB5FDjALHFZv6Y18Ka77ntjtm8ub3JPojIyUigYlV+hGzLFiTnBj5qBuZ5VipXxFmEtHB7/xv4rv4gCZxwKT1mvQkP9ncX5mZSpI9en0q83WgsB0tOY/HUnwCMYqJwzTP60vb231yoJn1ICgtMVPTQRQ/R8JsDFHYEoOCwy91HWkhdx+Ic7qJutZOv9WSLzbEMLIJeDxNnwEowdXb5f1MkOi0J+2+rQeaqjiK2eMTXvV4W+K/O1CO/XkrL+5Rz7tLEyIBOnv4jv3/uOpBH13IXo3SrIf7FU6TCzP1hW/jhTVShrQP0LPP4F1+cNsMKlGTfBTv0n5tlScihN9qI4yBSUXYB8wdTo9y/B7Wq+KvLGpDp7Ovaw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L05RT2VRTTJDV0FQdTB1Y0poczhaTjBUTjVibXovUEw5MXA3bmxHSWk5MWJz?=
 =?utf-8?B?ZGxuenNhNi9aTWxrN2xDZFRsWEJlVnp0aC9BRVY1dXhPeHd2eURJTTNTZEsw?=
 =?utf-8?B?REF0Y3VJY1ZFMmM1MHRNSzNzblFFSXFuOERJVlE3NkVvOHlGTnpHUWlFLzNU?=
 =?utf-8?B?Z0V1ZVkzazdPSERXbFl2d1JnVnNZcXhETm95QUpVNFg3VVFxNDJxSmt3cHNh?=
 =?utf-8?B?YU54bDVoSnpPbThubHBNRXdzaUExZW9LbWc3TytocmlUUzVPTUtiNnFRZmdV?=
 =?utf-8?B?eTZzSXNXaWFFc3RIVEFYRUFXYWFhNElMb3Q0SUZQekVDUUZaMEpaNDAvOUkw?=
 =?utf-8?B?VEhaZm9SaloyOWZwTUtwNmNtWjl6SmdjMzk5Y25rNDkzS3Z5UGR3aGVnUzB3?=
 =?utf-8?B?dDQzcWlaZE5VelRNNDNVVEIxQXFFeWRTd0RHRnNoa2oyQkVsbjdnM1VNYWlE?=
 =?utf-8?B?Ly9IMUJZVWZrczlnd3IyV29kZ1gwbEZhbTRhTk43RVhLYlE5RHNpU3JHL1Zn?=
 =?utf-8?B?NHV4TzhXUU5RQnUyQVJjZDQ0ZzBOdHYvVDZRVm05cUlWNXdXL1VEZU5sRG5y?=
 =?utf-8?B?SWdXai9xYzhSMlQzaGpNM3VLQlVZNFVSOE5MMmMxUjEycERZUUVBM1Zad2cy?=
 =?utf-8?B?bUhkeGc5cmZTR0NLNm05UFhyYThTTXUwNHBXY2s0UnovYTd1TFFIMjZYdVBw?=
 =?utf-8?B?NTNRdWJRSnkrWmZabzYwdDcyWXdtcUZYK3hnc1N3WDVDYlAydkpYa1RrTFF4?=
 =?utf-8?B?enVNNVRmeFl4UXNoVFY5N3l5ZGd4dzhrVVl1MU80Z1AzbExxMnVRdVFpMUd6?=
 =?utf-8?B?alRFVzBsK2NOVzNGdzd4VEVxejUrSFJMWHc5TUdsKzNxTm9ITjNoUUtEWWZk?=
 =?utf-8?B?MWFlMHpYL3h3clFyeTU0WjFQUTdOazhPb2Y0R3hPR0tqOWZzWlE4WC82bklz?=
 =?utf-8?B?WkVmemsxQStOVjdQZWNLT0FJUi9EL1BsMU5FdXBONVhlaCs3ZHIrRUJQZDBL?=
 =?utf-8?B?dkxYejEyeXRLZkRYbm80UVQ5OENPT1V4aCsxQzVZVGVwMmFJNllHSTM0Z1Vs?=
 =?utf-8?B?OUNjNE9BSGVsb3ArRGVNZTJPMFpEaU8wN1hVcEZJMEdlRHZnRjkvTXFHZklL?=
 =?utf-8?B?TURyS1dCcmxNZTc0WUdGbnR6RHNZQmhBY01aQkJ3QmZyRVo5dzc4VlNiMVNj?=
 =?utf-8?B?a2pPTzVRZ3IxdlFaOWx0ODUvUi9UclE5NFJWdXJsL01IekFwOUljRStSRUZu?=
 =?utf-8?B?QWhhSlZQckFqMHYvVDVjUjR6Z0kvVkp3Q1pvRDBVQU9qSFZSQzRUYW92d1Fm?=
 =?utf-8?B?VHozelk0UFEvSGlyZDIyZWY5SGpOamw1VTNBV2p4S2RhRmk1ODcvdFpNUCsy?=
 =?utf-8?B?VGZpRDJOcFlOaUVsRHUrMk9EREw4Vm1CV0JHU05WZTJTTG9YZEVtQjl2cXpY?=
 =?utf-8?B?RGFTZldIS0tDYm1uTk9KWi9uMGFGaFJDL3NxWFBXaG9HVU93L3RZM25pVS9z?=
 =?utf-8?B?THpWNWRHMTVzdUJZM0QyMW0wOWJLNDVNYkhtM21LdE16eUZybW1kMWsrRnhp?=
 =?utf-8?B?R2wwKzlGbWdIYS9CWWtOUWVLcmIzUlBQYWE5YmdSOHZNM0xPOUVtUyszRWdZ?=
 =?utf-8?B?STBMVFZjYXNwU1BZOXNWMUVKQ0tMeHhXOGs3M0VHWG1sdjVEaXF0NDJGbVFk?=
 =?utf-8?B?SEwyWTlPMUhIYTNNNzVRQkNkWVc0NExNOVFpSE01U0xGNUdGSk1mSGtTeDNt?=
 =?utf-8?B?VmJ6Vk5IS1ZlMlhBS1pWMzZFRXdJT0lDZ3BxTUJJMncyeFZFSncrc1RsY29G?=
 =?utf-8?B?bG1mYmkzNXlIa1VjekljTU1mVEdYZ1ZkMGdDdU0vSXRYaDZ5SDlTWXA2M0xT?=
 =?utf-8?B?SVYwWE9tR081RGRRNEZPVWVuTDhub09IdUp6a0pVYkJOU2RjSk0rUGdONmxU?=
 =?utf-8?B?dlVxZDBDTit0N1Ixd2VJMWVnN2F6M0VGdlZwaVUrbi9NallxWDBlL1J0RVR3?=
 =?utf-8?B?cWpUSWpvNThNaWp2eVRrUVZ3bjVoOFMyUENTNStna0JZejAwdndJdStscUhY?=
 =?utf-8?B?UnpNaG55dWN6VEpIQTVxNkhJcEZSYVUzVjVaVWdZOUFPV091TmJwRFUxYzFJ?=
 =?utf-8?B?WGNIdStVeUM4c296enNFaFJqUHlMT09wY3NBUzB0WU5zYlFnNUtNMTlHcUpR?=
 =?utf-8?B?Tm5xSEJ1OW9HWGhLbkxpdzE2Q1NNMkpiWWkrb1lPdWd0N25ZVy9MVFRwaFNB?=
 =?utf-8?B?eGw1cDVUV3AxNlhYY0wyRTBGVnZpc3lvaUNtTzh6TXdnV3h4OXJqZnZKNzk1?=
 =?utf-8?B?eGVkZ1h5WVltcHpoNENmQTh3WlVxcFZUYk5IYk96anFEQ3J5UXhYK1FUTkVJ?=
 =?utf-8?Q?m+xwgYA15ZTEMiLU=3D?=
X-Exchange-RoutingPolicyChecked: Fz36CmHYCQL1ncR62O+CfCqaom3PMGotiuKFawwlyF0oyN3rbhK6bNOxbpoxY3voZMxrWpzdHN3XHwaV8cs3nhs88C1kOBZ4xAbBFYslsVPAaoTZDy7h9DHU7IA2Q+s1WFZDV1ifIVViP/2tWDbwVur9wN7oF4irnBU8f6fyC1iD83FBSi4TZc3ZRJhNiGtHe45SY3cEbVwYLd6adjDlwVsCMPDfgfTiSJ9KppbewDsCN++j/A0gXbplrazaegnRDQ99tGrh4wX6nxBLihn8BhMs2VdY+4A/QaCvqQlltjdYhrby/qN7/L+WafkL16wVJrsvloaO7Mf2SRAyTY8DXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3043e659-71b9-4592-6873-08df08c49ff4
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 07:34:30.3188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD9Pb/Y5/c0jZthBzAM0cv7Xa5r4WzfD52955WTjoCTvWiTDpM3c0g3JCXn1E6WaJMQZA/fhSK9DitwRJYO/I6iR9gs+bSzNkAqYzFew+C4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9701
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


On 9/1/2026 4:06 PM, Chaitanya Kumar Borah wrote:
> As we plan to add audio BW calculation in i915,
> intel_audio_compute_config() would need the final output_format
> and pipe_bpp to correctly determine audio bandwidth constraints.
>
> Move the intel_audio_compute_config() call to after
> intel_hdmi_compute_formats() returns, ensuring the audio
> configuration is computed with the final parameters.
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_hdmi.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 9b637e38a1a5..b6fa1a1558b8 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2399,10 +2399,6 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
>   	if (!intel_link_bw_compute_pipe_bpp(pipe_config))
>   		return -EINVAL;
>   
> -	pipe_config->has_audio =
> -		intel_hdmi_has_audio(encoder, pipe_config, conn_state) &&
> -		intel_audio_compute_config(encoder, pipe_config, conn_state);
> -
>   	/*
>   	 * Try to respect downstream TMDS clock limits first, if
>   	 * that fails assume the user might know something we don't.
> @@ -2417,6 +2413,10 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
>   		return ret;
>   	}
>   
> +	pipe_config->has_audio =
> +		intel_hdmi_has_audio(encoder, pipe_config, conn_state) &&
> +		intel_audio_compute_config(encoder, pipe_config, conn_state);
> +
>   	ret = intel_pfit_compute_config(pipe_config, conn_state);
>   	if (ret)
>   		return ret;
