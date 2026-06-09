Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57709CD8CA4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 13:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD2910E254;
	Tue,  9 Jun 2026 13:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVuOJdtM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098F110E338
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781013081; x=1812549081;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K08joalCSPI6XZNnjSwZoXoSmDoJITjJSZ1YSp7nLJQ=;
 b=AVuOJdtMstcXGtS7cJfK/reOSQhmHCWoPO28bZNFZUYLjA1f0LEtceWD
 wY+Y/KdlDxUKTLjBHq/OTd68LcVSPVdv+gygHhXBLijN3ZlPDMp3zBe8X
 fNW/JYUR25opNxu6FzeBPCXyuI09K1QRqsnNGH7q27LCSHddq6S3SbOes
 mHM87friG//Lh3D91RjNohzWKCwI2Ba3UI+vvawRVfgDKKLczA+1bsZeo
 uyepO08E6S66byD2DPVcQ7Y4Unyzz4JwDx3SnIYY+hrdspubEnMmO1UGu
 Ldy0vIlZuobrsDmprr63jkjjQfJMIClZ1xoY8CdHEOTXGDgq8LhLBj5qA Q==;
X-CSE-ConnectionGUID: EIt3STTTTdSRmhaiDIb03Q==
X-CSE-MsgGUID: kTc99uMrTV+11ltSyCpmfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="80794715"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="80794715"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 06:51:21 -0700
X-CSE-ConnectionGUID: izl57L7gT96mc5O0l6CWOQ==
X-CSE-MsgGUID: z7jlaNfiQLy/m1sW3PeiEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="269879428"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 06:51:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 06:51:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 06:51:20 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 06:51:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWpITdhGKREFK7HaXuNEHmvu7ljOozuigYVS+PBf70WxwVGMijL6kbgpyX/pmRpYa34JIjlFDDPX9uzlun3GSKlpCjUBzXRNNz2qytPCcd1tC0uZDk9Ls7Aza8xJ7YctLmzRmiEq7evGQz0MXEO3ndbvHjYDdv3nWo6am9p9u/HK9AfA7iKGCcHxyl84//0r6+EBwIAMm1AmNVo+rdXdYPUm1+sLDd6JK+bA5/SZQyL2Bt+C0LypP7hR6D70S9MEGZ+l9yBxGSQUyLGjIPvWdACB9pDdILEsWX6p07OJVZA0OwB80/HS5BUEApA30T8DOJ/QzZ3doPwJlNvXqR8WUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ch0/MEDoxPO8y3ApGQdrpz/oOXcmP0Sh+prA38IWTkY=;
 b=m2viHZjPFg0auZ/XfmcSS8O4sIL/Q3aPnFOBxZ8/LmhC9031OoT/hJEYFybRg5WsHc/9K0Ey9Gk7NS9H8JQYLsFWZjXrHlNMyEpLTr0Op83x7vjowhx8AvC3e51/XbCrLhP6vIYibUFE/hDGgFI4+s78t3bu9vSTEsswhiWWI0528gaCcRwoEMOzzcNYgqncGdE1W0e3FUbj6HB6f47FxNLTefkKfTvb3FIHT/L8CH75jGVW97X3Zmcyg2o4AKuGYvZIhNkycOnB0kpqpaNUzOB6MIhwBh/yZGBb2eznaAh8OOQ8+P+BLn0PBb7440OVm/jR/at1H6N/5IkgD2Ip0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LVXPR11MB9778.namprd11.prod.outlook.com (2603:10b6:408:386::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 13:51:13 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 13:51:12 +0000
Message-ID: <242506e2-1132-4cc1-b934-1f9d1acfbbd9@intel.com>
Date: Tue, 9 Jun 2026 19:21:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] From: Riana Tauro <riana.tauro@intel.com> DO NOT
 REVIEW. COMPILATION ONLY
To: Soham Purkait <soham.purkait@intel.com>
CC: <anshuman.gupta@intel.com>, <anoop.c.vijay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <raag.jadav@intel.com>, <andi.shyti@intel.com>,
 <mallesh.koujalagi@intel.com>, <rodrigo.vivi@intel.com>
References: <20260608052556.1744123-5-soham.purkait@intel.com>
 <20260608052556.1744123-6-soham.purkait@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260608052556.1744123-6-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0054.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LVXPR11MB9778:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ced569c-8387-433a-556f-08dec62e2b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: E4nSN6FCbWt7Gmri9fYVx5FOfDRlFnXMb6STx7F6RZqeP/ub6tJTf23ZyZyFD4oMvIEpSEzcETwwlz4AK7lo0eCbHBETtUE0nWARKc6bi94ywohethOv4Q+LqEJPM3yD4OvLp08W0Ot1wwdIiWbU5a3iuwxtqM2oNBXtZyYmldot+fyaEMnBpcpdclAA0ohHOqX9vkVOrZjv4GKsK7WVoKHfbcVIYsO2IWCKrnOtKc4mf4EZRJg0z+XbCKJtvhLM5NhDxxCWUseVgSu4ql3BCBNq1dbVGN30L3nI6qqm8VnrhEobJn1YlAT/gF0WYGIzS8qqP2RkacxXpWA4lLh8Yit/se02MIAQc78XJJABoIlERtEwszMBrn5DM7cLG5UlvpuJdoZWMfa48X/ZcLtKk/te0376d9nrAB2ICnulkBUPA/NnTWeX/foJAqZZf7nDgMtp6VP41roKe4r6q3iNWVIZetq+lERXdMt0Z+pZMQEP4a2cpl7K6zKsezkoft8lOtI3+okB0GRFcQ2da7rMuYpquGNaFm5oq+4AEGbhHyIJ2FQBSwDeSYpbXbIKaIa5YFMP+D/T3Nkcn4tb1+EqeNDm6BJLPqqv3sRN/M5QTyYXLsMWYEYyD6Jnz1ZkSlBnJ1QvFD9IJpl+++/2R7Q/VQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHIzQ2YyTlB2ODV0anV6TG1YekRFMGRqbThvTGJXMTQzc2NJWGd2clYzbkFQ?=
 =?utf-8?B?K0RWN0tYdFB6M0pJK2g4eXJOekFYL1hJdGNNUk4yaE1tOVIrM2xESlplVlhn?=
 =?utf-8?B?SlFDQXdvV3Arcm95RC9XSkJhSkpiTlpwYzJYWlF3NE0xdjNZR2p4OXFBeFcy?=
 =?utf-8?B?eDNtbWt4R3lHL3A1ckVlUzR1cmR2RzI0YU1MUjBvZWdKMmpQd29wVVV2WTVl?=
 =?utf-8?B?VW9va0tqVXNnMGUwd1pYdFQrQnBMall0MmtzU1lpeit5dlNLaVgwTWNxWU5J?=
 =?utf-8?B?clBEbjdtV2pnOElBS3hwTlpUaGJuQ0ZtOVJFOGdyaUVOamdRYjB2WnVPaFJP?=
 =?utf-8?B?RXRFUldPR2t5UG5BOUdTRFZxaXNhbEgxelRYdldiSnA1bXZhRHB0UnY0dXBL?=
 =?utf-8?B?enVkcmdpaVRVWWR4NnlKZnRpbUtHNkJnWjY1b3RUQ1hTekZLMHhQbENsVWR3?=
 =?utf-8?B?NEx5NTJoT1ZmcFhDYUtzR05mRnRydVlPQ1VReFVvYlNQeFBVQ0FYb2N0azZC?=
 =?utf-8?B?UDY3UGI0b2MvdnBoNUQrRE9wTWtrSUduRHZKTkFzYTFpRExXWDRsN0pRVDk2?=
 =?utf-8?B?NjExVTBKNGpiVmVxcUR6cko0ZnlGZ3N1L2VCUkJ6WFNnNTFHNHI3ZEtoY083?=
 =?utf-8?B?OHBLYXdlYUcyWUpBMjhmTStYTElONmR0RnQwRnhucHA3SGxWM1llblJyQTF2?=
 =?utf-8?B?aVNITWUvTFJybVhhSWxOaEdnZWlRZW5iMWlvT05MMzVnTGZmVTRRYnhFSEdj?=
 =?utf-8?B?OElJV292RWRTOEhSaUl2VC9vb2tWdEpla3pzRHRHVzkrNHlJbUVwYUVxYWo3?=
 =?utf-8?B?elUxZklmbDlOQlAvKzZPdWhjUVNXTk9oYmR1Z1lUTWc4MmJpN2RzeGVNN0VW?=
 =?utf-8?B?OW1LcnVQbDQ4ZnFXMUdDTWczQTRNLzU2bmVobUo1c05ZWlJ5eVhmYnZQMlRm?=
 =?utf-8?B?TUQrT0dFdW00SU44blN1dUo0UWRrR3IvUkxjdXJDdHNHV3UxNlhiSUZHM0p2?=
 =?utf-8?B?UXgvRDBDUEFYaDVBdVdZYXdQTWRySVFYWXVtdjZMTzhHSE83V3JmM2RFbVVF?=
 =?utf-8?B?S2hJQ3lFdXRUV2xkbU5KTjRBVk01QmRZWnh0Y3RZVW1QbWUzYVdpUWxhQjdE?=
 =?utf-8?B?cXFqNnV6RXRyVmhOQWhKMlNlWjc5RjdOOTc5cmoyVWJlc1l1OEsrRExDMkNZ?=
 =?utf-8?B?aXF1OE0xUGkwSEZPZlRwKzFoUDJGbGdNdjJSZzhGcTZEZHV1K1I2Qjg3elpP?=
 =?utf-8?B?dW5VcHh0eFZKRWpZdm1yWEJycU9vN1RIQ3hqVGJaWGhXY1ZRS3FCd2FhVDJL?=
 =?utf-8?B?eEVNZUZoOHMwQUxvd2ZVcFdabERlOXoxOGg1V1BhQU1jbkZDbFAwSjVQYlhC?=
 =?utf-8?B?WC9EeWEzdWpUMUc0T1kwNDlPa05VL0JXdDRIZHVSZEY1RUNKTitmaEU5aCtv?=
 =?utf-8?B?QTB4aU1Ub2c4ajBWSTRpVlRneVFOR0RvRytWUE0rUVR3S29tNUpTbkdMRFlV?=
 =?utf-8?B?QmRIK2RpRU9XbXdEeWlmWS9Sakc4cGtOcEhObUZ6REZFV25wRnJaa2FvVGk2?=
 =?utf-8?B?VXd0OU1jeFpjczFHRldQTk5LQjN4OFpUeXdSbGhMeGdCSVQ2citWV3kxVWJH?=
 =?utf-8?B?VC9od0FScVpESGFjenoyWGFsd2kyNEtFSWNyYk16WTdROC9oSzRrUnYxS0p1?=
 =?utf-8?B?RXRsUkU2VmlNNlR2cTdiRDhwekorbUNRdC81bFp5QlN3b2lRQmtUVG9LOWNn?=
 =?utf-8?B?VTYvSytmZW9hS2RzM2QxTG9QUVY2dDRNdDVDWk9lTVF1UVh0UXVJTDhTTnJS?=
 =?utf-8?B?V0lBMDhybnV4dmhVNVVJdjI3emlwaWdZcURsbDBFaVMzNUI4RGtGejZmZThI?=
 =?utf-8?B?TlpST0VIRUkya09qdzA3aEJxWGIxYXo5OUFnQnJDMzE1RHV0YmZhMHRrY3Zk?=
 =?utf-8?B?UUUvWUttQkdESGtVMThPMU9ZeHU3bmN3cUpGaVNOdFUyV1NpekwrSE1SV1I1?=
 =?utf-8?B?V0FOZGdUVG9la294SERFY2ZwMERjUXE2RS84VmI1Q01ydEQ2WXNBVlBhYVkw?=
 =?utf-8?B?OEw0TTBackhUQzJJQUo5L0hpOUF1VnhxcmhwbGNYTGtPRjJFTkFZK0N0NlEz?=
 =?utf-8?B?bVRObGlwTnl1WlRXNG9PQlFLN2xkMWtBVG9BMFZUTWNEOHovMGt5Q05ISHEw?=
 =?utf-8?B?SGNjU29sWU13M3hwMmFEa1A0MG5wZE9ZSnR1M2R5a0k4Mkw5bWN5dkxJOWZM?=
 =?utf-8?B?bHBZSHk5d20vRnRrQ2ZBV3JrU2pCNllSOC84VWdUTkhRTWYwUVcvOEtlbnBC?=
 =?utf-8?B?UWt5eW9STmdESlR6QzRVYW9YaUFQL2NmM3FVZGoyVFpqUnJrbHRoUT09?=
X-Exchange-RoutingPolicyChecked: d/yUSDDhnF7kQTowt1xCwIbqJ+Wr/5sw9CH+FZSTdJyE85I2rOQYozVJTGH8uUnPkxRvQ0vUCwub5phdtCH7Yf1kr45zA8PvPAdpOQY4GA/lu6eupVcDMEE/iUSQ6oH76AkOFaWZuwIS5+dtKauqL+c74LzR687Fw48WSF5HeJ5JwUmw4XE2BpiTFBnZKycQnJY3MIYGFonSDTeNVssR2a4KsfZWZC1P3N+0oBFYPTg32dpJY3he6WfqFLzsgPZ//zVaJd6vKde9uabajDnv5PNgGwBR66lVsX4UZOBVcTyP2BYTML8Gv5WbUvAePb1FFACQzUiwUB6FrbDlHgzNqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ced569c-8387-433a-556f-08dec62e2b0c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 13:51:12.8545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2TxGTKVlKnOKOtrerqYBIwqv3VaEKzNroq58BU8t6XpPJMUs2/RhBjAyOsTFULaRhgqe9lowIgu4woYNl7OnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9778
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


On 6/8/2026 10:55 AM, Soham Purkait wrote:
> From: Riana Tauro <riana.tauro@intel.com>
>
> This patch is from https://patchwork.freedesktop.org/series/164393
> Added only for Compilation.

Why do you need this patch?
The only common code here is status. Please redefine the function instead.

The patch that merges last can rebase.

Thanks
Riana

>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c                |  20 +-
>   drivers/gpu/drm/xe/xe_device_types.h          |   2 +
>   drivers/gpu/drm/xe/xe_drm_ras.c               |  41 ++--
>   drivers/gpu/drm/xe/xe_hw_error.c              |  13 --
>   drivers/gpu/drm/xe/xe_pci.c                   |   3 +
>   drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
>   drivers/gpu/drm/xe/xe_ras.c                   | 192 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h                   |   5 +
>   drivers/gpu/drm/xe/xe_ras_types.h             |  51 +++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>   include/uapi/drm/xe_drm.h                     |  11 +-
>   13 files changed, 337 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 51e3a2dd7b22..ff06176b7d84 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -61,6 +61,7 @@
>   #include "xe_psmi.h"
>   #include "xe_pxp.h"
>   #include "xe_query.h"
> +#include "xe_ras.h"
>   #include "xe_shrinker.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_survivability_mode.h"
> @@ -740,6 +741,7 @@ static void vf_update_device_info(struct xe_device *xe)
>   	xe->info.has_late_bind = 0;
>   	xe->info.skip_guc_pc = 1;
>   	xe->info.skip_pcode = 1;
> +	xe->info.has_drm_ras = false;
>   }
>   
>   static int xe_device_vram_alloc(struct xe_device *xe)
> @@ -988,6 +990,16 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	err = xe_soc_remapper_init(xe);
> +	if (err)
> +		return err;
> +
> +	err = xe_sysctrl_init(xe);
> +	if (err)
> +		return err;
> +
> +	xe_ras_init(xe);
> +
>   	/*
>   	 * Now that GT is initialized (TTM in particular),
>   	 * we can try to init display, and inherit the initial fb.
> @@ -1028,10 +1040,6 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_nvm_init(xe);
>   
> -	err = xe_soc_remapper_init(xe);
> -	if (err)
> -		return err;
> -
>   	err = xe_heci_gsc_init(xe);
>   	if (err)
>   		return err;
> @@ -1070,10 +1078,6 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_unregister_display;
>   
> -	err = xe_sysctrl_init(xe);
> -	if (err)
> -		goto err_unregister_display;
> -
>   	err = xe_device_sysfs_init(xe);
>   	if (err)
>   		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32dd2ffbc796..4e2f115f14e2 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -156,6 +156,8 @@ struct xe_device {
>   		u8 has_cached_pt:1;
>   		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
>   		u8 has_device_atomics_on_smem:1;
> +		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
> +		u8 has_drm_ras:1;
>   		/** @info.has_fan_control: Device supports fan control */
>   		u8 has_fan_control:1;
>   		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index c21c8b428de6..0f517e0f79eb 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -11,27 +11,46 @@
>   
>   #include "xe_device_types.h"
>   #include "xe_drm_ras.h"
> +#include "xe_ras.h"
>   
>   static const char * const error_components[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>   
> -static int hw_query_error_counter(struct xe_drm_ras_counter *info,
> -				  u32 error_id, const char **name, u32 *val)
> +static int query_error_counter(struct xe_device *xe,
> +			       enum drm_xe_ras_error_severity severity,
> +			       u32 error_id, const char **name, u32 *val)
>   {
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[severity];
> +
>   	if (!info || !info[error_id].name)
>   		return -ENOENT;
>   
>   	*name = info[error_id].name;
> +
> +	/* Fetch counter from system controller if supported */
> +	if (xe->info.has_sysctrl)
> +		return xe_ras_get_counter(xe, severity, error_id, val);
> +
>   	*val = atomic_read(&info[error_id].counter);
>   
>   	return 0;
>   }
>   
> -static int hw_clear_error_counter(struct xe_drm_ras_counter *info, u32 error_id)
> +static int clear_error_counter(struct xe_device *xe,
> +			       enum drm_xe_ras_error_severity severity,
> +			       u32 error_id)
>   {
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[severity];
> +
>   	if (!info || !info[error_id].name)
>   		return -ENOENT;
>   
> +	/* Clear counter from system controller if supported */
> +	if (xe->info.has_sysctrl)
> +		return xe_ras_clear_counter(xe, severity, error_id);
> +
>   	atomic_set(&info[error_id].counter, 0);
>   
>   	return 0;
> @@ -41,38 +60,30 @@ static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_
>   					     const char **name, u32 *val)
>   {
>   	struct xe_device *xe = ep->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
>   
> -	return hw_query_error_counter(info, error_id, name, val);
> +	return query_error_counter(xe, DRM_XE_RAS_ERR_SEV_UNCORRECTABLE, error_id, name, val);
>   }
>   
>   static int clear_uncorrectable_error_counter(struct drm_ras_node *node, u32 error_id)
>   {
>   	struct xe_device *xe = node->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
>   
> -	return hw_clear_error_counter(info, error_id);
> +	return clear_error_counter(xe, DRM_XE_RAS_ERR_SEV_UNCORRECTABLE, error_id);
>   }
>   
>   static int query_correctable_error_counter(struct drm_ras_node *ep, u32 error_id,
>   					   const char **name, u32 *val)
>   {
>   	struct xe_device *xe = ep->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>   
> -	return hw_query_error_counter(info, error_id, name, val);
> +	return query_error_counter(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, name, val);
>   }
>   
>   static int clear_correctable_error_counter(struct drm_ras_node *node, u32 error_id)
>   {
>   	struct xe_device *xe = node->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>   
> -	return hw_clear_error_counter(info, error_id);
> +	return clear_error_counter(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id);
>   }
>   
>   static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 5135e8e4093f..e0ae6fee2c0e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -516,14 +516,6 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   	}
>   }
>   
> -static int hw_error_info_init(struct xe_device *xe)
> -{
> -	if (xe->info.platform != XE_PVC)
> -		return 0;
> -
> -	return xe_drm_ras_init(xe);
> -}
> -
>   /*
>    * Process hardware errors during boot
>    */
> @@ -550,16 +542,11 @@ static void process_hw_errors(struct xe_device *xe)
>   void xe_hw_error_init(struct xe_device *xe)
>   {
>   	struct xe_tile *tile = xe_device_get_root_tile(xe);
> -	int ret;
>   
>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>   		return;
>   
>   	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>   
> -	ret = hw_error_info_init(xe);
> -	if (ret)
> -		drm_err(&xe->drm, "Failed to initialize XE DRM RAS (%pe)\n", ERR_PTR(ret));
> -
>   	process_hw_errors(xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 78fc2e4dcfc6..9c249454cc95 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -355,6 +355,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>   	PLATFORM(PVC),
>   	.dma_mask_size = 52,
>   	.has_display = false,
> +	.has_drm_ras = true,
>   	.has_gsc_nvm = 1,
>   	.has_heci_gscfi = 1,
>   	.max_gt_per_tile = 1,
> @@ -457,6 +458,7 @@ static const struct xe_device_desc cri_desc = {
>   	PLATFORM(CRESCENTISLAND),
>   	.dma_mask_size = 52,
>   	.has_display = false,
> +	.has_drm_ras = true,
>   	.has_flat_ccs = false,
>   	.has_gsc_nvm = 1,
>   	.has_i2c = true,
> @@ -761,6 +763,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   
>   	xe->info.is_dgfx = desc->is_dgfx;
>   	xe->info.has_cached_pt = desc->has_cached_pt;
> +	xe->info.has_drm_ras = desc->has_drm_ras;
>   	xe->info.has_fan_control = desc->has_fan_control;
>   	/* runtime fusing may force flat_ccs to disabled later */
>   	xe->info.has_flat_ccs = desc->has_flat_ccs;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 5b85e2c24b7b..24d4a3d00517 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -40,6 +40,7 @@ struct xe_device_desc {
>   
>   	u8 has_cached_pt:1;
>   	u8 has_display:1;
> +	u8 has_drm_ras:1;
>   	u8 has_fan_control:1;
>   	u8 has_flat_ccs:1;
>   	u8 has_gsc_nvm:1;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 4cb16b419b0c..7cb6fcb1254a 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,11 +4,15 @@
>    */
>   
>   #include "xe_device.h"
> +#include "xe_drm_ras.h"
> +#include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
>   #include "xe_ras_types.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
>   
>   /* Severity of detected errors  */
>   enum xe_ras_severity {
> @@ -31,6 +35,17 @@ enum xe_ras_component {
>   	XE_RAS_COMP_MAX
>   };
>   
> +/* RAS response status codes */
> +enum xe_ras_response_status {
> +	XE_RAS_STATUS_SUCCESS = 0,
> +	XE_RAS_STATUS_INVALID_PARAM,
> +	XE_RAS_STATUS_OP_NOT_SUPPORTED,
> +	XE_RAS_STATUS_TIMEOUT,
> +	XE_RAS_STATUS_HARDWARE_FAILURE,
> +	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
> +	XE_RAS_STATUS_MAX
> +};
> +
>   static const char *const xe_ras_severities[] = {
>   	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
>   	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
> @@ -50,6 +65,56 @@ static const char *const xe_ras_components[] = {
>   };
>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>   
> +static u8 drm_to_xe_ras_severity(u8 severity)
> +{
> +	switch (severity) {
> +	case DRM_XE_RAS_ERR_SEV_CORRECTABLE:
> +		return XE_RAS_SEV_CORRECTABLE;
> +	case DRM_XE_RAS_ERR_SEV_UNCORRECTABLE:
> +		return XE_RAS_SEV_UNCORRECTABLE;
> +	default:
> +		return XE_RAS_SEV_NOT_SUPPORTED;
> +	}
> +}
> +
> +static u8 drm_to_xe_ras_component(u8 component)
> +{
> +	switch (component) {
> +	case DRM_XE_RAS_ERR_COMP_CORE_COMPUTE:
> +		return XE_RAS_COMP_CORE_COMPUTE;
> +	case DRM_XE_RAS_ERR_COMP_SOC_INTERNAL:
> +		return XE_RAS_COMP_SOC_INTERNAL;
> +	case DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY:
> +		return XE_RAS_COMP_DEVICE_MEMORY;
> +	case DRM_XE_RAS_ERR_COMP_PCIE:
> +		return XE_RAS_COMP_PCIE;
> +	case DRM_XE_RAS_ERR_COMP_FABRIC:
> +		return XE_RAS_COMP_FABRIC;
> +	default:
> +		return XE_RAS_COMP_NOT_SUPPORTED;
> +	}
> +}
> +
> +static int ras_status_to_errno(u32 status)
> +{
> +	switch (status) {
> +	case XE_RAS_STATUS_SUCCESS:
> +		return 0;
> +	case XE_RAS_STATUS_INVALID_PARAM:
> +		return -EINVAL;
> +	case XE_RAS_STATUS_OP_NOT_SUPPORTED:
> +		return -EOPNOTSUPP;
> +	case XE_RAS_STATUS_TIMEOUT:
> +		return -ETIMEDOUT;
> +	case XE_RAS_STATUS_HARDWARE_FAILURE:
> +		return -EIO;
> +	case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
> +		return -ENOSPC;
> +	default:
> +		return -EPROTO;
> +	}
> +}
> +
>   static inline const char *sev_to_str(u8 severity)
>   {
>   	if (severity >= XE_RAS_SEV_MAX)
> @@ -91,3 +156,130 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   			comp_to_str(component), sev_to_str(severity));
>   	}
>   }
> +
> +static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
> +{
> +	struct xe_ras_get_counter_response response = {0};
> +	struct xe_ras_get_counter_request request = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_error_common *common;
> +	size_t rlen;
> +	int ret;
> +
> +	request.counter = *counter;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_COUNTER,
> +				  &request, sizeof(request), &response, sizeof(response));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to get counter %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	common = &response.counter.common;
> +	*value = response.value;
> +
> +	xe_dbg(xe, "[RAS]: get counter value %u for %s %s\n", *value,
> +	       comp_to_str(common->component), sev_to_str(common->severity));
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ras_get_counter() - Get error counter value
> + * @xe: Xe device instance
> + * @severity: Error severity to be queried (&enum drm_xe_ras_error_severity)
> + * @component: Error component to be queried (&enum drm_xe_ras_error_component)
> + * @value: Counter value
> + *
> + * This function retrieves the value of a specific error counter based on
> + * the error severity and component.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
> +{
> +	struct xe_ras_error_class counter = {0};
> +
> +	counter.common.severity = drm_to_xe_ras_severity(severity);
> +	counter.common.component = drm_to_xe_ras_component(component);
> +
> +	guard(xe_pm_runtime)(xe);
> +	return get_counter(xe, &counter, value);
> +}
> +
> +/**
> + * xe_ras_clear_counter() - Clear error counter value
> + * @xe: Xe device instance
> + * @severity: Error severity to be cleared (&enum drm_xe_ras_error_severity)
> + * @component: Error component to be cleared (&enum drm_xe_ras_error_component)
> + *
> + * This function clears the value of a specific error counter based on
> + * the error severity and component.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
> +{
> +	struct xe_ras_clear_counter_response response = {0};
> +	struct xe_ras_clear_counter_request request = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_error_class *counter;
> +	size_t rlen;
> +	int ret;
> +
> +	counter = &request.counter;
> +	counter->common.severity = drm_to_xe_ras_severity(severity);
> +	counter->common.component = drm_to_xe_ras_component(component);
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_CLEAR_COUNTER,
> +				  &request, sizeof(request), &response, sizeof(response));
> +
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to clear counter %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected clear counter response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	ret = ras_status_to_errno(response.status);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: clear counter command failed with status %#x\n",
> +		       response.status);
> +		return ret;
> +	}
> +
> +	counter = &response.counter;
> +
> +	xe_dbg(xe, "[RAS]: clear counter value for %s %s\n", comp_to_str(counter->common.component),
> +	       sev_to_str(counter->common.severity));
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Register drm_ras nodes
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	if (!xe->info.has_drm_ras)
> +		return;
> +
> +	xe_drm_ras_init(xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index ea90593b62dc..c19c3602db80 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -6,10 +6,15 @@
>   #ifndef _XE_RAS_H_
>   #define _XE_RAS_H_
>   
> +#include <uapi/drm/xe_drm.h>
> +
>   struct xe_device;
>   struct xe_sysctrl_event_response;
>   
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response);
> +int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value);
> +int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
> +void xe_ras_init(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 4e63c67f806a..6688e11f57a8 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -70,4 +70,55 @@ struct xe_ras_threshold_crossed {
>   	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>   } __packed;
>   
> +/**
> + * struct xe_ras_get_counter_request - Request structure for get counter
> + */
> +struct xe_ras_get_counter_request {
> +	/** @counter: Error counter to be queried */
> +	struct xe_ras_error_class counter;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_counter_response - Response structure for get counter
> + */
> +struct xe_ras_get_counter_response {
> +	/** @counter: Error counter that was queried */
> +	struct xe_ras_error_class counter;
> +	/** @value: Current counter value */
> +	u32 value;
> +	/** @timestamp: Timestamp when counter was last updated */
> +	u64 timestamp;
> +	/** @threshold: Threshold value for the counter */
> +	u32 threshold;
> +	/** @reserved: Reserved  */
> +	u32 reserved[57];
> +} __packed;
> +
> +/**
> + * struct xe_ras_clear_counter_request - Request structure for clear counter
> + */
> +struct xe_ras_clear_counter_request {
> +	/** @counter: Counter class to be cleared */
> +	struct xe_ras_error_class counter;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_clear_counter_response - Response structure for clear counter
> + */
> +struct xe_ras_clear_counter_response {
> +	/** @counter: Counter class that was cleared */
> +	struct xe_ras_error_class counter;
> +	/** @reserved: Reserved */
> +	u32 reserved;
> +	/** @timestamp: Timestamp when the counter was cleared */
> +	u64 timestamp;
> +	/** @status: Status of the clear operation */
> +	u32 status;
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[3];
> +} __packed;
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 3caa9f15875f..9507f68bc2eb 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -293,6 +293,34 @@ static int sysctrl_send_command(struct xe_sysctrl *sc,
>   	return 0;
>   }
>   
> +/**
> + * xe_sysctrl_create_command() - Create system controller command
> + * @command: Sysctrl command structure
> + * @group_id: Command group ID
> + * @cmd_id: Command ID
> + * @request: Pointer to request buffer (can be NULL)
> + * @request_len: Size of request buffer
> + * @response: Pointer to response buffer
> + * @response_len: Size of response buffer
> + *
> + * Helper function to build sysctrl command to be sent via %xe_sysctrl_send_command()
> + */
> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
> +			       void *request, size_t request_len, void *response,
> +			       size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr header = {0};
> +
> +	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
> +
> +	command->header = header;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
>   /**
>    * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
>    * @sc: System controller structure
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index f67e9234de48..fb434cc165b2 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -23,6 +23,9 @@ struct xe_sysctrl_mailbox_command;
>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>   	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>   
> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
> +			       void *request, size_t request_len, void *response,
> +			       size_t response_len);
>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>   			    struct xe_sysctrl_mailbox_command *cmd,
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 84d7c647e743..6e3753554510 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -22,9 +22,13 @@ enum xe_sysctrl_group {
>   /**
>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>    *
> + * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
> + * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>    */
>   enum xe_sysctrl_gfsp_cmd {
> +	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
> +	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>   };
>   
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 48e9f1fdb78d..50c80af4ad4e 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2589,6 +2589,12 @@ enum drm_xe_ras_error_component {
>   	DRM_XE_RAS_ERR_COMP_CORE_COMPUTE = 1,
>   	/** @DRM_XE_RAS_ERR_COMP_SOC_INTERNAL: SoC Internal Error */
>   	DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
> +	/** @DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY: Device Memory Error */
> +	DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY,
> +	/** @DRM_XE_RAS_ERR_COMP_PCIE: PCIe Subsystem Error */
> +	DRM_XE_RAS_ERR_COMP_PCIE,
> +	/** @DRM_XE_RAS_ERR_COMP_FABRIC: Fabric Subsystem Error */
> +	DRM_XE_RAS_ERR_COMP_FABRIC,
>   	/** @DRM_XE_RAS_ERR_COMP_MAX: Max Error */
>   	DRM_XE_RAS_ERR_COMP_MAX	/* non-ABI */
>   };
> @@ -2606,7 +2612,10 @@ enum drm_xe_ras_error_component {
>    */
>   #define DRM_XE_RAS_ERROR_COMPONENT_NAMES {				\
>   	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE] = "core-compute",		\
> -	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal"		\
> +	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal",		\
> +	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY] = "device-memory",		\
> +	[DRM_XE_RAS_ERR_COMP_PCIE] = "pcie",				\
> +	[DRM_XE_RAS_ERR_COMP_FABRIC] = "fabric",			\
>   }
>   
>   #if defined(__cplusplus)
