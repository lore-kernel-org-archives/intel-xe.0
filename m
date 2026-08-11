Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4227C5CFCF
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 11:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A809110EB3A;
	Tue, 11 Aug 2026 11:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZQNt0C1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5A110EB4C
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 11:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786446411; x=1817982411;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pLbPx6/AfKeVW3MATJCDw5bzf5cIDYrzDvAyxVsWH+k=;
 b=UZQNt0C1Ek/dFcxe4OBPwbd4NVg30P4oh7MMs4j0iwhrBVTWr34gFcxL
 f+KCscRz8rFjgQEYXBtUl8X9j1ezGCiiS9/jfl5EmxMHsx2TbDcw4Kr9E
 VsFxbmFBGphnjkTobN1AUwYFTz+hJ1zHoHT/zRgAv0P+vLOwsm/Vn4j0k
 kYwbZseaHf310tSSWuAlo58/IpKFCd3XubmRFMnEj59YH+dB4KHteqzJj
 UpQGAnJE1nKEaHTwavsD0t7vfNpOGhnIrPFVIqTRjgXfMTc41Zza/zdFC
 tveMjxkVRp23PYiu8PSnykpMxq/GH4tD3JHIbyowXhE6qgZahI4oajuNg A==;
X-CSE-ConnectionGUID: JLLJ1Yf9TcGPWwPsV3PhxA==
X-CSE-MsgGUID: /dg/OjiiSgiqOTmOnW6xSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="98333806"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="98333806"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 04:06:51 -0700
X-CSE-ConnectionGUID: vkBK7Q4CQeu7CKosK+Ly8Q==
X-CSE-MsgGUID: bpTi56FvQzuSfsDqWkAZWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="261995991"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 04:06:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:06:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 04:06:50 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:06:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5nBzY3jvsxA/4qF5mAAEPY0hskXRtrDk73NMXxIlEFdF815XEmm//eUg9DxcVVFkgalr/h1J+5OYn/0PPpabCknebMfQPk6dDJomqUixnjHxCOUvaob9E7W3hefpZqnJgpflfCngqwBWGkQxEEom/enowb9UutY2CyWYEwlw4QxDyggvKzGSmhKeERjGj1BgWaY5juUQ37n+Ml341Z3MLGv08BP/mFfTuLyFeGDlFy+hNc9KlzBt6gDxQ5YadiLI7KGXPNLKDnm+VFaGT89Zat8Ggmnl4csxy7nucYCqk30LfpZIWy0vSxptxoqBiXaE19YChN2JSpdhCvu5wkEKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MslJJlJ3Dw/B+TsdBSuZb6ac9TPciksvC7HX86Db0U8=;
 b=H3bcgA9VcqClDYvYn4F/ejKb8/NSbuGmNyJ+Y0AVywmlg/gZgQvGpRpjQg4bW1edoXGPsvGjcBTYqi1yh+nB5LXaoja6p/MNDnmrWVM3hR3SHQniq+BIviOVxveDezRQVTztcOEuR+t1AFb3gOQeKG87cqLHymK6sf0GXWC29KpTE3+TRNbXALlhYEgkoI9JnVczUMtFAc9X0TkK2oVrrXxT0Ngay8Y+3nZTZNR1N+iYF9s5Ojg6Z3l6w2/3EYpNBEEtpD3UqWR/30Al2qX2hKDkBao10ODu/0CxvH/MnH8D6IzOlQ/79KFLgkVMUZSnkg6mfiWsjH/hMW0HsHE+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA6PR11MB690409.namprd11.prod.outlook.com
 (2603:10b6:208:5e4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 11:06:43 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0270.017; Tue, 11 Aug 2026
 11:06:43 +0000
Message-ID: <aafcc07c-774a-4b75-9a12-5071b6b57016@intel.com>
Date: Tue, 11 Aug 2026 16:36:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V14 4/9] drm/xe: Extend BO purge to handle vram pages as
 well
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Arvind Yadav <arvind.yadav@intel.com>
References: <20260730101132.2770752-11-tejas.upadhyay@intel.com>
 <20260730101132.2770752-15-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260730101132.2770752-15-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA6PR11MB690409:EE_
X-MS-Office365-Filtering-Correlation-Id: c1cd2ba4-84b0-48c5-9f80-08def798a056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DPXnpBu8u+EgOaYV3QP8zf3GUgRoK8fwZjUoldQVbMnkpWv8bupIAfE5aZ4pHzD8JSEo8+EbVj/GkrCE+nc3YR4kctYQqpH53mFAO+ZO4yi6MsGBXe1h4F7ly0PPHEfoJkl1nC6qRXpuX98P/avOgKF7G4jaoD5n/wqvpPu+S1nHeosKNg3iW+i4FdldI3WL1LBIuqaYTfyNI1J3QZfGQHdjITNwA/sb3wQvsiexTSRIqy5C/0Sg1435YEJTAeZRpDmdDQd63A4gNYewJg5AbSzZHTBEnsmtGNjuR1fqKoE/UUxyN6yaG+9Jk16zybLf+I45N7RPH3DmWIGGzWmuxH2m7x6OE95yfLMztefajrZSygfCZ1cT3puHCjR+gQ4MSiSbq37GyIpvkmAtFON/Q1iWVgaoGLZoYj0g36O+7w9SIPAM1/DpBTQqOco0v9/7UdYTORzcRBgSvWdHx652NLgiL1NslePWdDvtJ4K96KZ1tz45RNK6TYUgIbPLiS6u3rG5h3QSnF1bnS+uVrXp1E1Idol5V3o3DNOBRLG5dM0BKIBYNfXTtyCifhkBxj0XD/7XVSvjB5B1jaJC/PR2bpdGyFTpegTpVo4TSvxJ9gXeLzJGplGYZoSKpekNckqR7nfEtNkhm0knqdLEoMP6+IqtbQ1Pf0wuxrp2MBjlys4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWVYb3NveDBjTmxVODdkZEdBQU40aHkyUjZVV0xBb0pMY2VHWWdEbThHMTVX?=
 =?utf-8?B?enJlVklLZUVPZ2Z6VW0razh5ZGF1OUh3OEtzaFRFS0VJWHkybE14cUprZnN6?=
 =?utf-8?B?V2haRm94a1J1dWJnMnJiZ2MyVVRSU0g5cE8xd2ErbjlvZTVxOUd4K09iOTFR?=
 =?utf-8?B?TysyRTY2cHBhdkNCTnIraXc4U3E3VTNGMGhPU2pIU0gzdG9jS2ZXUVA5SzQr?=
 =?utf-8?B?NHQ2ZnlYTTVKaFVVdGFaYU1jQXUzQ1hvTjMwdFF2L1ZoMzZ6ZFBXVlZKc0sy?=
 =?utf-8?B?dERLcUJCUTVOWHN4VGVKM1ZKQ1hqdEFtRVNCTVJ6dVBrc2hZQkJvd1JqUlJw?=
 =?utf-8?B?Q21LWW5taGYwL2EwNi9saWFSUVBTazROTER5M3dNbEpXQVJMUkFLQ05JU2pq?=
 =?utf-8?B?eUd0SE5DSHFNV3Q0bzdTRDIwdmpyZm9RdlVUMFZ6UVhBZUozZ0xxVjJqckND?=
 =?utf-8?B?RHV0dHJZRnA5bkozTkthYTI0NitXSWhBVFVMdlNJV1ExMXgrMXhWVXhXUzM2?=
 =?utf-8?B?ei9qQVQ2NU1wSEFQaE9hYlZUOThPRlJ1a2tpenV0MTVkcWRESnRFcTR4L0kx?=
 =?utf-8?B?eUdUTUxrblhwejlxU0RsMUpXNzVBbEhXeWpFbEN0R1dJZUJRYUhoZHVwSWJu?=
 =?utf-8?B?dk9JcWV3dnp2dzZEVU9QUm5ZRW16cjgzRzZmeFBod28xTmRCbTA1MG8vTTkz?=
 =?utf-8?B?aWNUOHBOemFLQ0VYeVVMTGpOS2ZoWlBWTGpQTDZQMWpjV3czaUJUTzI4N1Q4?=
 =?utf-8?B?Qk01aHFVSEVuV3BsaXhmeWd6ek5FWThJbWdUb3JMSkdvZG9SaHlFME1EdGVT?=
 =?utf-8?B?ckc0UEhaQ3N1R2hWcEpoZUp2eFRGK2xNWi9qaTZueFNqTUE3bVRyaEN4UC9V?=
 =?utf-8?B?cXA2NjRVT29UdDVMcU8wd1NUYkduaGVmYUY0YnM2M0VOd0VKQkZ2NFA2Q1Fu?=
 =?utf-8?B?ZU9DZzFaVUp4dEdvejlGbHBxNDA0YTIyaWo3SlpiQjFaK1ZGZWt3TGFIV0xM?=
 =?utf-8?B?RTRwRGdSWmlHL3I3VzVza1I4cGQ2c28vVmR0UFU3YjFLcVVyM2E3TXhTaitm?=
 =?utf-8?B?V3hETWYvWWtUMVdYNytHNlRKc1JDSHJDaWRpMUgwc013SmpLeUd1TmFicE11?=
 =?utf-8?B?M3pFZ2c4b3p3bEF0UUVHQzFESlg3RmNEa3h3ZkNlZlNTTzAxSnpWdUQ5MEZE?=
 =?utf-8?B?TFRnampoTXV1YTFlaCtzR1pqZWJadTNtdkFrSTNSanc5dTNZbEV0RkNrQnBW?=
 =?utf-8?B?RmtsNWM2RjRwallYdHhOQkdUemRnbDVyUUpibzVJR1YrZTRhN29tY096aFpu?=
 =?utf-8?B?UDJDYlNpZWYvQnJkUGsrbm5wcVVhNjMrelpkeGxNZFF6UjhreGlqeXp4QURO?=
 =?utf-8?B?d2FMY3JxTUpZN3ZDTjRtdUR6OUVubjNDZFVsT1YyL0xBSTN4MmdLS1c0aUha?=
 =?utf-8?B?SThBUjM5RjNSRUZIN0hvZkpVMkZ5cjkrUVBNbGIvVnIxZUNiNS9kTFlKTWNk?=
 =?utf-8?B?ZUVzTjFCcFQwL0l3L1Y3NTM4MTkvQVA3UDZjdlloTmcreXRvYnJUWVpJbXFp?=
 =?utf-8?B?NTZvUk1OalJoS2VZZXdoQU1CN21SMDJlaHkya0R5S2o1Mk9JWUZTL2FZY01M?=
 =?utf-8?B?SEovRC81WXJEQXl4SThOaTZxOG0xaHI3T2QvQnRrS2JLWGNFKzdidWlpTE9Z?=
 =?utf-8?B?V3RNbmI4a2VkYVEweHVoaFRnSjVSSGpkempWQjBJNm14UGhkeDhvZ1VIY21S?=
 =?utf-8?B?b1pDZmJHeFpvaThnaWMyNityQXRINVIzcVhKN3FDRU9SK0NWUktUdDVFUDFx?=
 =?utf-8?B?aVhnNTFyNTdkd0JXVmVKaFlOZlJuQlVSRmR5MjV3SlN0bUFWQVRrVzZaczhS?=
 =?utf-8?B?bFJYSlhmbkdCdmQ4d0tWQ0lmcTdyWGhwM09zbmg2RENlMktrZ3ZiSDNWbFF6?=
 =?utf-8?B?a3FaeElYZStabHkyM0tOS05JanBDV0djV3BrRTh5OEVLV2c2d05mT0FtNmhJ?=
 =?utf-8?B?UU5yNlM3aTNrNTZVNFZYUUFnN1RDYjZrdkdYYlhTNG1SZGxZazA4K2hNeFBa?=
 =?utf-8?B?UWxZUU1WVlpzdjAydFhyMG9QTEVtTHhPZ0d1bjAxOTNsMDFCWmZhR1gwUVpi?=
 =?utf-8?B?NitLbnVaTTJoeW90Wnp5OVdNdVpaRDBScGsybDNxUllkWFh3c2FZOVdVaHpU?=
 =?utf-8?B?OU5ZVXZmN0lrQndLYWw4TFpESjltVFdWMHhUMGxFV25GWGdjUCsxSUIwNUx2?=
 =?utf-8?B?SUIvN3pRMWZHTm1EclphS0F4amp0Y1BSL0xjNi96NnFyN0VBd2lxWkFqdHF5?=
 =?utf-8?B?OFR5aFo5d1ZzTFlVampNdFVIQWx0YmorY0MvUnREM3dTczFrSVZpVTdHSWdx?=
 =?utf-8?Q?jQjbKpSZoQbadTuY=3D?=
X-Exchange-RoutingPolicyChecked: JxQeWFR1Z+bWBTlafhEQwjWqYO6bESH+X5qnrzyr05FKjqxBknBrvk+qK2E3E6zvAt+UKQo0ti/bQonPp82mg7dwlHRwo8Mrh+kFDETwfn2Q8xwiZyhB4TELIrwg3pJR+oda2Zp1r5DDaHdq3N6y92LnkmoxaKIUpFcClLpdivql4KdQ0Okd1atme/Hi3BZG9UZe83xZWEK23ewosETZ7in/VovbyD5Eh2fmfyiXtqEyhgZ4SS4RGE9EobiHrn2ZHCZtaJ7EOBtybj+j5cmEBplhQqtHyyvWpWTm3Dxoi+w5NXq/gxqqEqvapihfkFsHZqE4hVV60TTWGyfgySh9Cw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1cd2ba4-84b0-48c5-9f80-08def798a056
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:06:43.4191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ji//DgLdri2S7lkryUKYhlIgKnVOACEc4jc50ZfxcIb63bXgomoEdllHwqjs51N0iaBYXEDU4FSUh6mGEEzRBEjJr6ATdESLmcn35I6tuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB690409
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



On 30-07-2026 15:41, Tejas Upadhyay wrote:
> Recent driver update introduce support for purgeable buffer
> objects (BOs), extending the API to include VRAM pages to
> better manage memory pressure and enable memory offlining.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Reviewed-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 5 +----
>   drivers/gpu/drm/xe/xe_bo.h | 1 +
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index dde309821237..52f81e972ada 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -921,7 +921,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
>    *
>    * Return: 0 on success, negative error code on failure
>    */
> -static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
>   {
>   	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>   	struct ttm_placement place = {};
> @@ -929,9 +929,6 @@ static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operatio
>   
>   	xe_bo_assert_held(bo);
>   
> -	if (!ttm_bo->ttm)
> -		return 0;
> -

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	if (!xe_bo_madv_is_dontneed(bo))
>   		return 0;
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index c6d80e1bd6e7..659e2888d419 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -586,6 +586,7 @@ struct xe_bo_shrink_flags {
>   long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>   		  const struct xe_bo_shrink_flags flags,
>   		  unsigned long *scanned);
> +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
>   
>   /**
>    * xe_bo_is_mem_type - Whether the bo currently resides in the given

