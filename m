Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A76CCD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 11:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A491B11B488;
	Thu,  4 Apr 2024 11:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKihYdtI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5383C11B488
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 11:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712230867; x=1743766867;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qJ53EYu7u2JDhVMiZ4478emUpDkz7s+UlKkYk+romP0=;
 b=OKihYdtILh9X7cNOCPvk8WiGHPmy81OucVBPr5/guWD13cGj4rAwQeXn
 mm9Fnub/XPAncaEVmsUX+cpDeAFxx29WXawXKuBbEb3bdt6NCJdcKPzUz
 SvBopzaKfL0KHpiB/z++pueWhtz2bj6TsqFtB9JfCJrdE6KnSoYEEa5Xo
 O2ljWqFfDjBvZcV2BqtKldnIxY1MqcFtHpIyWIrTz6jA2YoTDU+ZRE7r+
 RALaC0q0udn3qW4UAO5yWEij6VB82NJVGg8FTWpBHBXtuw6vDLOIxyUf9
 yPLA6m+++c6Rin0uOMEnQoeCX7D6eSsB+RaOE2JWWRMSOTHsbXLhMEv9A Q==;
X-CSE-ConnectionGUID: ST8r0VzIRH6yp5y9AfT6mA==
X-CSE-MsgGUID: Aa/vKfUQTfaIQgOvEZoXUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7694230"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7694230"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 04:41:06 -0700
X-CSE-ConnectionGUID: eyzmT/gQQ4CSAryk8EOBxw==
X-CSE-MsgGUID: wCv3APVmRxO+gOo40FhCsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23411629"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 04:41:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 04:41:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 04:41:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 04:41:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 04:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0J8i35bioKXRgZ98yE6l8ccNpXrpUR30GdaRMWW7BkHlGJ21EOkIh11mL3t5xbS3k6/ladKAwjz/YU4Y0N4NSOpDlD53RJeZG/JtSL0xNPhW3hDaHi3l61iFLGYgFakC99tDq5zPwdsJZKDQsqc23hn0oasOnFxjy0y7ky6HVO0tRRYll6YxyFoF/FvrxBce5jHPxZTzrKfbe3kaP7W95OlG+YfW+oGwi46kG4zLswXK62XCMgnUwf3+8q9miAiKV9JeqL7Z33sbPbaFz8aa4Zln1smX6i8TNmyz4Oj40JYNrRbRkD+xi5qhHX7yuUNmZPtzTlg/TkIzv/Oy+JQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNnoBihgBuCbkO5hfEBYY1paZ5chaX44JJnXx3xv2qY=;
 b=WGwhDtweseDy2OAic/TcVCkMawE5MZHGvqp5DoZfd6uu7z5PIT5V2lwcX57VH8d6JSb0/CGMbv53bWBmlZP9W+Pry6KXxTkpvtsl2wgnsU39KXXTYYsk7FGg7wBun2FPOARWlAVAMeFJOdHHLXQGdojCDIDeHnpxHKdPtBK1V1/mx57nEzP9U369VRYyy3L7KaIz4fZMb4LHNPR47woZgZXKnHe6BJZ1CFu6c8l03vj+N7eemojlVwrkVvudwTr9S8FOCBggGUDN/cgfUs8YlaCmKApCmV2tmJq7wQm2MpJU6/QTypq5JvEipAEd984JbAfwt1E5pWUS3iR9NPlF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by BL3PR11MB6433.namprd11.prod.outlook.com (2603:10b6:208:3b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 11:41:03 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 11:41:02 +0000
Message-ID: <90c7e015-9bba-49cc-bf52-970952c8fa4a@intel.com>
Date: Thu, 4 Apr 2024 17:10:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] drm/xe/display: check for error on drmm_mutex_init
To: <intel-xe@lists.freedesktop.org>
References: <20240403140105.1306622-1-arun.r.murthy@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240403140105.1306622-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|BL3PR11MB6433:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QNP8CcgjLbr8GZiTY4VIHFwsBO947EAWYGRisdzmVZNwjkSLik/HoMSjglQRSSZrlnZHgZKiLmogGiGE5EA9sUf2N2KkdKWOzoCH6q2o/Rx6i4E8c4WwqN5eUnkPQ0JQTa839LJbfMM3lHSmGq+PPSDVdtXkCtRKiV/Nf8mu4gxld9gNlEdj1zzY/bFt3obSLBR+58Is8vksOsLai3lFO13vXpf2zcS3tyjMaWpPIEm6bFQUUKKMmDzgt65d4MVCPipSceqbiETtOV1d00a+uyTKrtvaG1ZCVudq4bknRfTocTfFvqU5QyscSdT6bKEhmfu4KAP/2G3XZ2pB0741Pgxiz5myOTn1k2KeJXqSvgckysys4dpo/3VOlR5GJHIm9y+hs620gnZGBt8VhxinXt0v85qixjTdX1KFKfkWK1+Xf/8qtwlLCPYXVTVYYDYBqwmHSvSIxgqjYAuKj5GP73mGNpJYCem861SnTc/VjcYkEGL1Uov7lXFHaiPa6Ub2qfJBg3wOztIlvvfgySxsUPx5jhMoo1HGcZzffS0BShADKyvIf8fCUSaw7/PAqRYJBXDooTpa1AbTftp5No/jRiYIZGyMdWXHCV9a0tQrdIVMbvmCloqVHI23muVPD3OGdzI/fDf7Hny2IspFnSAqelndhsIUm9dy2V5QOk9AeI4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vzdwc2UrSHNhbUh5ZG16Wlh5SUxGWUR2VVFMaWwrZ2ZpQjlLdXEzemVDanM2?=
 =?utf-8?B?T0FUSXNxeURSVHZzaGdXWTRzNnU4eFVkUklNYkZwQWRsalhKZG40YnNRenVz?=
 =?utf-8?B?V1BLM0dZTnpjaXVkVldMOUhoMXFjRUFJQXhnREhRdFFZalJmaHg4TDdmazAw?=
 =?utf-8?B?cGJyWE1CK2h3OGs0bEVlMzJZdHFSNndaK1hoaGdzZU40bHB4MEJhOXg3Q2Rm?=
 =?utf-8?B?RlpjYUtBSGdrc01GUGJhSGtYdklUR2FKU052VmRQeDdOSXBzNUpaemsxbDg5?=
 =?utf-8?B?eVFTUHhkYS8waHVNSHZsTklHOStWM2FBYStIOGIwdEQ4eUFIS3dwSkJpMHFU?=
 =?utf-8?B?WDJHMmw5ZU9SY09IRitob2R3RjhBWmU0QjNEY0F6V0lPc2JKckdXTHpzOXQv?=
 =?utf-8?B?c2lGa1NUYzd5bHhwVzNKODN1c0l0eDErZndXaUZUZXlnZmRpQ0xnUVdnMTh4?=
 =?utf-8?B?TzBpYVFWTjZEOEhDZW9pNWVSOFU1QkpFdExCSVR3dFp6V2FpVWNTdi92UWky?=
 =?utf-8?B?L3RkNlppeFpaRmxFVDZCb3V2VlhDK3ZSRktaYXRrUVkvS2RXeE1rc29SODBs?=
 =?utf-8?B?VUttZkZrbS84VCtvZG5lbmd4NDRxRE12aDZUOWFhcDFJS1YycjdWSWdjdGNW?=
 =?utf-8?B?OXRnZlZONm41WGJ5eHJUMDN6RzAvWC9laWhBaWVCdWxjSmwxOVhXbXdCcnBV?=
 =?utf-8?B?S1FkU0ZublJnYlo0UjdMR3c2ZHg0OWF2eC95YVB1bmlSRmJsODZXclV1TUtD?=
 =?utf-8?B?WEVSS1VDT0UvTllNTUdGSFZUTjFQSHhMN2VwRlBTSnI1L1ZjQW1mYUc1UGNZ?=
 =?utf-8?B?eGpuQnNNNStGWFgwN01sRGpFYllKbHB3Nm1xaEhoc0FrUlJzRURUTm5zOHlx?=
 =?utf-8?B?R2tLVkhtdjg3amhka1crZ21TMExxTk81eERBNUZRWXpIY2MrWEE3dnRyRHI5?=
 =?utf-8?B?d3Q4Ujh4UDM2ZExsUk9KUzZSSFNVUE03cE9QYnQvRk91cDY5NU9wb3FQVi80?=
 =?utf-8?B?bjRvZXNPYnNicHFVNnhNUms0WXR1dTk1VmlHZk9nQ0h5T2xOMHZHWDhTSmt5?=
 =?utf-8?B?Zk95RmdiMFF2dDVUaVNmL21IYVFWMExtQ3d2UmtzbWp0WXpFSlJ3QWIvWEpt?=
 =?utf-8?B?ck5XTS9yYnU3NldxMGJGNXZHOUo5RFFQV1kwVndTQlJWM2FPQVZNT0F0OVFZ?=
 =?utf-8?B?N0FIT1g2L3ZUSlIxUUUzdEcyeWdmdkNvc2YrT0w2dHNqQk1iYW5tY3M0Mmla?=
 =?utf-8?B?eE1naUQvSTE2Z3lxYzR2SjU4bHV3eEpJTjJ2T3ljR3NNMTJvZHhVd1hJQnBr?=
 =?utf-8?B?QUlBd2pLVDVFblgvVnVKdysrV3dEN1pkWEdnemFyQ1U5aXIvMWtHNzFkZEFh?=
 =?utf-8?B?U1paUWFsTmhzY3R0VHJvQ01TQWZ4b0RIUnEwd1hGS2cweGJXdjd2VG1tRWpK?=
 =?utf-8?B?Uy8za2ZvQ25hcnh2YWEvRG1DVjAyb3FSemZtRDNOS2hwR1BzcU0yYTRpZGli?=
 =?utf-8?B?SVkwbkY2cWtZbFV6N1NqNlhjUGZXVUlDOXRmM1ZDQmdhcXpVaWsxMld1eFpa?=
 =?utf-8?B?MzhZWCtqYUNWWFoyNDNVQ1hMc052b0szVlNENjF2d0tRMTJxZTdWOWdKQytI?=
 =?utf-8?B?TGoxQzMySDlnUUlKN3VDWlQ2QlZYZXlqTzdrekI2aTE1K3RROVFTUit6YllW?=
 =?utf-8?B?OEx0T2t0akFWLzhsb25ud1FoY2k0QWV4dXdUNlFUOXJXN1h1WkRMOXlwR0l6?=
 =?utf-8?B?TWR4VGtxcFFoM3c3b2N0LytycVFnVjRDdEdRbFJlaENiRlJiWmdTMXluaS9J?=
 =?utf-8?B?NzZkMlorOGp1Z0NYU1VUOU1NRmx4MXgwd2p0c2RrYmVqOEFIS2Y1bUV0c0Jk?=
 =?utf-8?B?TzY1VS9hbHViVFI5UVkxU095U0NQNGhiM2Rud0NKb2tJU3VOMktmbHd2SXhV?=
 =?utf-8?B?S1VVb1JTY1hRR21SZHRnNy9xVEVCL1c5bXllblB4SllhNVVyODlTSnRsZE1v?=
 =?utf-8?B?QTRmbUlnek50NzhBRUFxYTJEdGhCRE8vTlp1VXNWNkdDNHF0cFZpM1JmRlZt?=
 =?utf-8?B?WGE2MlZ4ZzMrQ0FYSGwrNzZiZEEyZlZ0MmpUSnIrUmZzenJqTEE4QzgyRTJs?=
 =?utf-8?B?K2E2VXpLMEJTTGxCc2xBUU1ZZUc4bEhGbHNhMU9jQnNLVzVwQzI0RnZIT1h1?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3359e56-f27b-491c-e4c7-08dc549c1aec
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 11:41:02.6188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGO6UvEJeAq/px4F6ijxZgUmxm91a69QlhkSaW5PDYNny9FAEZmCvmUtzg0eqPekFh8ypLotzkgbLEU4CYsaSxfNXSTz2H+5p2FlN/6xasw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6433
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


On 03-04-2024 19:31, Arun R Murthy wrote:
> Check return value for drmm_mutex_init as it can fail and return on
> failure.
>
> v2: Removed nested if (Lucas)
> v3: Revert back to nested if (Andi)
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_display.c | 30 ++++++++++++++++++++-----
>   1 file changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index e4db069f0db3..04b83ca5168c 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -107,12 +107,30 @@ int xe_display_create(struct xe_device *xe)
>   
>   	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
>   
> -	drmm_mutex_init(&xe->drm, &xe->sb_lock);
> -	drmm_mutex_init(&xe->drm, &xe->display.backlight.lock);
> -	drmm_mutex_init(&xe->drm, &xe->display.audio.mutex);
> -	drmm_mutex_init(&xe->drm, &xe->display.wm.wm_mutex);
> -	drmm_mutex_init(&xe->drm, &xe->display.pps.mutex);
> -	drmm_mutex_init(&xe->drm, &xe->display.hdcp.hdcp_mutex);
> +	err = drmm_mutex_init(&xe->drm, &xe->sb_lock);
> +	if (err)
> +		return err;
Make sure to destroy workqueue before return.
> +
> +	err = drmm_mutex_init(&xe->drm, &xe->display.backlight.lock);
> +	if (err)
> +		return err;
> +
> +	err = drmm_mutex_init(&xe->drm, &xe->display.audio.mutex);
> +	if (err)
> +		return err;
> +
> +	err = drmm_mutex_init(&xe->drm, &xe->display.wm.wm_mutex);
> +	if (err)
> +		return err;
> +
> +	err = drmm_mutex_init(&xe->drm, &xe->display.pps.mutex);
> +	if (err)
> +		return err;
> +
> +	err = drmm_mutex_init(&xe->drm, &xe->display.hdcp.hdcp_mutex);
> +	if (err)
> +		return err;
> +
>   	xe->enabled_irq_mask = ~0;
>   
>   	err = drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
