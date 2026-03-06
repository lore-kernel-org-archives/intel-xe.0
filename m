Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7981AFCC04D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 17:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDC010E320;
	Fri,  6 Mar 2026 17:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UF4eSybS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C200210E320
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 17:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772818881; x=1804354881;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BYuXG/ILmZZJ0fDu2K4wKAemTA1xonglPsIHMZn1DVk=;
 b=UF4eSybSwJ6mpJp/vhSnVPfCebQCpE5tYKsSojUioSx00gW5lkPsCYWn
 WF/JX9dlRNo549WuE1tCEZ/vaCJ4ZUWow+Jp1NAbHQVR1NQul5wRKH2a5
 3cOfo19EAaZS82jqfjSIHoPaiv/H42bhrfY5WQ4H1c1m8hX4pmWjLTUAm
 57oxhqOp90UG7kHQC+P6C8k8Pwix3FeHdmBRTff245QdGhqlNd1jF3MMf
 CbfYozavhpp27KfrTk1nbRwGzZ3ieEgay/y9wGhLxIKdGzUSQU2hPd7WM
 8LO1enribcdHS0/n1FLUnvNR0bpthk8ykRS5YUFCUQRZhCS3+vq6aS9uW w==;
X-CSE-ConnectionGUID: aNhlerEnRtmj+rpRrYtcsA==
X-CSE-MsgGUID: RqQ5RHc5RYaEUMwXt1k3Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77804797"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="77804797"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:41:20 -0800
X-CSE-ConnectionGUID: YCYatwZURRaRnAQ93HuEwA==
X-CSE-MsgGUID: 3UoyuINASUWEOX4XUd0mGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="219009179"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:41:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 09:41:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 09:41:18 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 09:41:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DP30UXKZjtQgUUqQE3Tkq8QwI++c2L3aqB9fsvBGQgb8wcBBd8Oz8EvmZ98YNSzPV9hez2ypDOUcPx5LEf0CWz6jpkwgf/8Q/2bjAQptRrlhTBZrKLmdoXr+/IOHsLeh3fWrNK+NaE4xFnA7y4b0wVU4mbHbK0Tk2hS66UGOcYHGrKh/ejt5nIIGSrmc0mhPIJ2Jzlal3kcpfoAZvc4HqteUOiIz6j3UOCGZgAlVbN2g1dK6GAp7NA6lZg65/dmEUyPfVqx54wD3GtJwxo/2dKGj8grPqyeO1iYvzCQ6YJdoFMcN+G+FN18u3m5TsgQqClHsAtOtwKTHIhyiM6y6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJFDOYWANsHcCyETGTNytvcebjpuWNDGBkxXLQakl8Q=;
 b=nFrwtgdQ5y4apMWpnYHrbRyg++uSEk9BDLZI6oKnztO3PLE3LyI8zP89+la3WapKyN1Fx02m43/LxyagEBADnpZ8y1dvqQ2nLSWwKQEj2nKspH2p4IzgNiwJxN91ZyCs02U8KywurTfQI2E7UG3XSVFSXfNfKKBTll2Xb4Y6fsauTuEi13RWfy+NL+M7ORloq9QOdnROQ+37wJUXQvNaDpQiDToe7nLvDGG+EUY9D7di3Akq/czT9ylsdv4ZUzIPPnlm8Xvo41o8PWMWmmvqgbXqm9LoYynbSuhhzWx4Usp3Zk8U1SFqhPJuaKWEVxdX3/YcG6PGLyha6vIL/0VSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 by IA1PR11MB7869.namprd11.prod.outlook.com (2603:10b6:208:3f6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.6; Fri, 6 Mar
 2026 17:41:16 +0000
Received: from IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::a90e:4fd2:5f61:66b7]) by IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::a90e:4fd2:5f61:66b7%7]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 17:41:16 +0000
Message-ID: <0dd4380b-76f8-4b70-ab5b-840e13b6e857@intel.com>
Date: Fri, 6 Mar 2026 09:41:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't disable GuCRC in suspend path
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260303181416.3880937-1-vinay.belgaumkar@intel.com>
 <a9948086-90f0-4ac7-a5d3-ff3e0ed75264@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <a9948086-90f0-4ac7-a5d3-ff3e0ed75264@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:332::15) To IA1PR11MB7755.namprd11.prod.outlook.com
 (2603:10b6:208:420::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7755:EE_|IA1PR11MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 386dcc68-21a7-43f1-c8ec-08de7ba79161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: lhIrlHaOnmP4lrLOpaTHr9ZcuuNxqVSmzijC8HdnVGgahgcGzzSInOzBXMNMexsbtroMVM43F83QN9/o1U40XwBIECMMdOFBH9hu30ltSVcvjAnK+81gwZ5aQZ6CNkSOKJd+HWuuJin5MUy1NBpXJdRbZGd1V0gmhRj07Vno/vBhqnQ0yryxbRrxpClIOh5H4tReOXf8YUjJzhUZ4E46C+rvOXAm9w/TVqgwEslhXnIX0L6EKFJhH2QH57QQO64A9zTzqMS+FRgalygErVTqUThm67FSJCtxacRUBEza1QiW+rgVI5F1gRmxmy8Zp51kPfZqwqkql/RxphmRA+5EIezd4WZEQXAQXnUjiABGAW+QiKaKomYJpVvg8K7J1QHqro2OQYjU/WvktcAfzTR2nziEEfH0FtoFqoUJUbYJBSPR0aeJoJxYoCjGinc7zlXCx+NAbT8L7gen5snIUIkrzSy/EprXkD8mcOZ8n7K3RQk3ZFuEO786qFOqJ5ACQxMH5Pz50XlzNp+1jposrC/dRjWyCf9/N7ylFePc12EBT2ids2YpVKUcc3JN3PrDhfDJT2QycbEzyi0LeRpS8EZ427WX40r5s+EoZF0YRALp2hz6v3Ha8jrMLM+rKYByTyNhf/lqRIpnKfGT5Su5EyUiEM3qdvbTWdd6lhL16+zqbKDNT7hIwBn6QIGf5AZxTpCE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7755.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0VOLzBWZXVUVUI1YThRenRxczlyYmxFWHU0WGsvOGRvV3dvM1M4YTdiTG9I?=
 =?utf-8?B?TERHUDhQRjZRT0VnVTcyK0FMalM4SkZkL1lSc2ZFbGlWUUVqbnZSaE1XT2U4?=
 =?utf-8?B?eXdqMlQyRjhmUmRlU3JxZmp0VmFuU1pHbG9vMlNtdUJpSFFrM1FUSGpsL3Rm?=
 =?utf-8?B?bk5EVm5QdzhEaDhsT0tibXpYYnBnLzBoU2RHQ0M2Y1kyc1R2MCtSUmFoOUk3?=
 =?utf-8?B?NDBnUWZZRk1nRmhaZmNUUEJFTnlvN2lSaVB4KzcyaFYzaFRLNE9YT2lJZXJR?=
 =?utf-8?B?bnFwZ2VRUGZIQ2x6bUptekNuTDVhMElBTUJqUU51c1c3OTQrN3B2a3U3ckhE?=
 =?utf-8?B?T2EwUUtSTS9XOTVxclRKdzlDMWJsVnFrTmpVeVd0U2FweWgvSXlPZzFraUNU?=
 =?utf-8?B?Q0RsVGlaeVQ1U3VyaUVidG5HbmpPUkRnTzlsWCtUUFhKOXpCRFBPTWNHMENM?=
 =?utf-8?B?Yzc2WHpMQ0IzQ2Y4aU10b1JRVmpiMUJhVTlJOWJWUHZscVFWbXQ1QkZnTVBp?=
 =?utf-8?B?cnRMOVlhc0ZHVFRVam1ZMmlpT0R3bmptYmlpQnhHRWNGK2ltZ0kyS3JYMkNv?=
 =?utf-8?B?QlZhOEZQc2FvY01tRjNuQ2NEOWh3MEYzaVNXVEtZS2JrRHlRaWRTMkRwTTlL?=
 =?utf-8?B?SGpyd3hlM3B1R0x4b2pWTkZpV1A4aGlyUEYyUTJhWHMrYVcwR3RoNEd3TWc0?=
 =?utf-8?B?NG9KMkxjNDdvVnkvUXQzRGZKSU8vMWdhR2JxbFVNYURlaW95c0hBME5TOGdP?=
 =?utf-8?B?SkVzVVBDamIrMVUxb2ZTcUhyUmVLakNEb3QxK1pSN0xJdlN3OGlRUW16NEM2?=
 =?utf-8?B?aUllaThCMVpONi80bVAwOGxIaEJUUVhjQk8vL3JyZWlKV0UyQVRBM0wzc0Mz?=
 =?utf-8?B?NGdTMGdFWDRiaWdIVXBZbGhEbFJRNlMzSHB1NFJzQzF2RzUvUlZwaXIzODdr?=
 =?utf-8?B?SWdBOWx1QXhzLzFiYW1CODFvVGl5eE5uZU54TXVyUlRVU01UN2wrejUwcTJr?=
 =?utf-8?B?dC94RGV5MlNpaHBiNUpRVHRwVzFINmtOWU8za216SEdzNXlFVEFwZExIQ0U5?=
 =?utf-8?B?N1YxaDlLQ2JBR0lUOW1EanBXc2dSQjZYOW8zRDU5WjgzcEJRK3B4RjVLUlNH?=
 =?utf-8?B?WklaUTFJVHhPSmRKVXhpMHNFRnFoLzNlcGxrSDBqRi8rYnF2NHY4QjJrSDNv?=
 =?utf-8?B?NFJLUFdiSDBFN2d1b1pRd3hhM2RSZVQ1N1ZlT3pjQlRZVll0QjVZZkZ5bGI0?=
 =?utf-8?B?OTZyTXc3SkNZUnJVZ2tBTkF6WXd5S0lZV0pVRFNPemtvbnZ6REl4NHZZcUxx?=
 =?utf-8?B?VFYrVnJPN3F3NHBjUk9PUGNuVFJ4Z1o2RTB2cTZRSzk5UlhMaU11TFJBVXpC?=
 =?utf-8?B?TjFSOFR1ODBNVWJoa2dmR2ZrbTRWSzBjelVXWmt4MklDNDF5aWoxMzlJZm5k?=
 =?utf-8?B?N2pXN29MaERkUWs3Q2FlN3ZIVnJ6bTBaWVRCUG5KRHNGWklNWGR5TU10b0VI?=
 =?utf-8?B?UWRiWXV4U3c4K2RJRkViNUtBQmEvVDZIMjV3WWVOMUdGS3ZscUtWeks4L0xC?=
 =?utf-8?B?Tm5EMGc5VFNhQ3YwcTN6Y1hBUzFlQmIzK0dyNkdkeW1JcXhRdU41RlkwRERu?=
 =?utf-8?B?aTdCaDdzVitJeVNCcm4zUTJRZXZUUDRkSzdDbmdqNjdNT0lzQmFMREFsUElU?=
 =?utf-8?B?NzhBdWc3Q0QwTXIyandJMVY4bFJJampmcGFMRTJwRkorbklFL0RCUnkyRXdI?=
 =?utf-8?B?Y2I0aWd1eUx6Y2N6dzc0NS9kcGU3RGJUbXBNVHNvTUF4dzhoK1h0QURjbGIv?=
 =?utf-8?B?Yk5oeHlDd0NoczcyS2F2RGtRb09JbVpVQVVuL2JjbzZNMUJ1ZStBQ2I1ejRN?=
 =?utf-8?B?RXlSdFdZYzZjY3Q5TDFEekkvWkFqMXNTTlRIZGZLU2VEaUtNN3RKaml1dGVx?=
 =?utf-8?B?MGxmSnRNbTFaRHdNU2Fhbm91NnpnV2p6bE9KejhaWFNFVndYR2JnNFo4cGVT?=
 =?utf-8?B?YTFxUVkwaTFVNDBGYWhOZCtGZ1pPalFQVlcrVlVLVXNuVGl5cFRRemN4ODVG?=
 =?utf-8?B?SEN5THlHWXFSZElzMTdMVWZpRGVScXdUV0NFVGhMcjdCbnFreStlRzE4dVJk?=
 =?utf-8?B?WS9BNlhZd2RPZEJ4U0tFM2s4Y1JtMWRPeGI1WTBhdUJueE8xdWRqL0VhR3dG?=
 =?utf-8?B?QmpoVkhrMVo0cyt2dW4vNDZQdVQ0Qm03R0k2Yi9xRjg0WkxqZDhyOS9FSTIx?=
 =?utf-8?B?bEFOSkp0RUFVUGwzc1dkaVhOTFB0Tm5MbFJCdnBaZDlyMHpHNTcrUTR5djMz?=
 =?utf-8?B?U2RlZUl2bXZHRWFJQnhNZFZtaE5ONjU1eXpzNGUydUxCNVM5K1dJeHBiUm1v?=
 =?utf-8?Q?Io1lg9ozk7K5aHNA=3D?=
X-Exchange-RoutingPolicyChecked: hbjQ6s9GfRVvIfz961Qkb579lIBJqKv9/nGyIJbkFwf9xQzWBsWX0Mv9uou37+aYBA4mjhR4gm0DHTdYXqxqyIHhstrcZ2UGewg7iIgJPFgmO2jguhM6pDjPft9oifq6TsgpPWOFVfOwwN+mK/oWVovcAOxvXfL70Asr7bLMFCeN9p8ak3xgX6QxTdBAXHglNnoZOaX0l8poFDRfNCtmoNmboySZkxGJVx8JN2RY0+ucBaUHEG2RtRIUvHIDHtONbkxI1fLzQkc4fyh8p1Vh0JBEJwBgPlGhKzXodJ0V++WVv9Fx3V11Rbzd9KQuId+HD0o3eYmdCuY7zOYv2R4QvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 386dcc68-21a7-43f1-c8ec-08de7ba79161
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7755.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:41:16.4439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8VCU0+x662m6zm2fKfCaXjwY4eehz85VZRrDsBXrUcVnHoknMpCRshh5de6QAdd2MSuD//e3UruNbh3+Nkt2jV2jTBfDZkn47oBkw2Tovg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7869
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


On 3/5/2026 8:56 PM, Riana Tauro wrote:
> Hi Vinay
>
> On 3/3/2026 11:44 PM, Vinay Belgaumkar wrote:
>> GuCRC should not be disabled in xe_guc_stop_prepare() as C6 is a
>> prerequisite for s0ix and s2idle. This is a regression caused by
>> the patch below.
>
> I thought since it's used in xe_uc_stop_prepare. It should've been fine.
> But I remember this issue now where gucrc shouldn't be disabled during 
> suspend.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7510
>> Fixes: 40a684f91d26 ("drm/xe: Decouple GuC RC code from xe_guc_pc")
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c  | 2 ++
>>   drivers/gpu/drm/xe/xe_guc.c | 1 -
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index b455af1e6072..f3bb856aad2a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -38,6 +38,7 @@
>>   #include "xe_gt_topology.h"
>>   #include "xe_guc_exec_queue_types.h"
>>   #include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_hw_fence.h"
>>   #include "xe_hw_engine_class_sysfs.h"
>> @@ -896,6 +897,7 @@ static void gt_reset_worker(struct work_struct *w)
>>       if (IS_SRIOV_PF(gt_to_xe(gt)))
>>           xe_gt_sriov_pf_stop_prepare(gt);
>>   +    xe_guc_rc_disable(&gt->uc.guc);
>
> Do you think we need it in gt_reset. Though i had retained it in my 
> initial patch since it was part of uc_stop
It is better to disable GuC RC during a reset since we disable SLPC as 
well. Doesn't help or hurt, but good for consistency?
>
> But i think it should be safer since we restart post gt_reset
>
> Sorry for having missed this during review. Even i didn't recall this 
> issue
>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Thanks,

Vinay.

>
>
>
>>       xe_uc_stop_prepare(&gt->uc);
>>       xe_pagefault_reset(gt_to_xe(gt), gt);
>>   diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 54d2fc780127..e75653a5e797 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1671,7 +1671,6 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>>       if (!IS_SRIOV_VF(guc_to_xe(guc))) {
>>           int err;
>>   -        xe_guc_rc_disable(guc);
>>           err = xe_guc_pc_stop(&guc->pc);
>>           xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: 
>> %pe\n",
>>                  ERR_PTR(err));
>
