Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AE9FB5EB0
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 04:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CBD10E0CC;
	Tue, 17 Mar 2026 04:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="me+0EHZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBC110E0CC
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 04:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773721983; x=1805257983;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C8UqYyvIXcG3BsPV+oialAEaEtnCk1umuj3w9LsS7xU=;
 b=me+0EHZDO+Uufqw8Njgi6EsHiJLkDBmY57MSfb92/D3VB5s/SWVs/6GS
 9TMuD2MR3o+IUNOX3ecsnkmfSdY6S6wpbum4q0x52n3+EnbrozKj52Aoy
 v3W6ro+sTRqOXCGtzwpFTCNiM38P5uTrOKkV5Muxm5pa6nf8kZpi/Gxgl
 B5Gy+dBsbWyHYFu3Gjch8K6xMkoUOdErOeuU8tpA7pGn42AG0TGODBDWc
 yPoMg3nsiIAyqkUcNLObv+33Fxrez53eCKKRqyDu7GJpKJskmYIkkEcgM
 /8OIC14RT+AgPsXIy9lEsa7JM9RW6LRXKYp9/xhIoosBpOdn5Kcr1H0E8 w==;
X-CSE-ConnectionGUID: 8tiMyvkIT+ylaPvyI0rFVg==
X-CSE-MsgGUID: WmNsbJidRfqH50e67SvCLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74718922"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74718922"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 21:33:03 -0700
X-CSE-ConnectionGUID: bFuMHQ1eTA6tf1jQWGw9Wg==
X-CSE-MsgGUID: NJcNgVtpR3GQpIaPfQjKqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221166106"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 21:33:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 21:33:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 21:33:02 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 21:33:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1K8PQtZoOU5Hx5z0tfgwoFaYvDD7eL6rX2C70xQCvAadDWNqFzLaf4cVTksawUnKZatefXQbY7hAkq4J1IkwTGvxgy4dt+/T/JQvFTxM/mgOOdp2vaGsN+o7tHn4A1C61aWHveIaFZh3o66wU6Qn0PUugFnBhPmtlFOA2IdQwLLFEqyip/DSur9fQDz3knQWCL5GQNh+YgwS9W33N6YGZT3+VndDGEFp1OIZQbvMLgkkeXjLAcdQbZZ5Xnma1vwP8Z+9nmmz2+bta3DdJU4A2xZBlrgMqna4IEIfyFMCPaPKBUv/nxWzzPCEV3v0wfdES293sJz51I1lyUnnSyNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfW82wiqJysEqL2ykEkf8oVrRCld892Qpfy0YEMnxW8=;
 b=eSuuEDoPcuMjmQJG1mS66wAV26F1xYndcVPL2VHn5qyDTaJehArsvKX7NPVQnFJXMy9AsF1z+1CeIln3WmNgNGAv3wpwPmD28ffUSVf+QupLdXj6E5mRtUwwLOMCNE5qEYX4L284A6WXazi17WIJwKEtrtBDnxfv8y7oJxbM4mrm0nKG4+ROqL/aNf9SUvLA2kFsfU2ZqO+Ekgrn2qH0E4nK9eogZ7PvG4EX0Y1wwqjvGEvJMZEQZgAG5a0j9sKop5n2zn9HSwvp2pr+3l14+ZA+5l0s6yB/mmU34x10wxDTaJIetLFDj7s8LgKTNy82TvXrgkDUTHlef+B8TfYwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CH0PR11MB8233.namprd11.prod.outlook.com (2603:10b6:610:183::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 04:33:00 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 04:33:00 +0000
Message-ID: <ff7a6228-1741-4a54-978c-dd70a16a2973@intel.com>
Date: Tue, 17 Mar 2026 10:02:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: drm/xe/hwmon: Enable energy attributes for CRI
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>
References: <20260310122018.2734260-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260310122018.2734260-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0082.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::12) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CH0PR11MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 352a6dd2-0c09-481d-1cb9-08de83de4504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: yRw0wp2LCcFVyMHdUxR0LYv7Pnjrb6ZnSAqFL//aOWZ8ClcxadAtDMoFm9GJhALFRTespqxcwu1RwCRBmwWtzfW1Ntxl2i5nt+D1G9yAHZ2ydapq/I0GwF8eRQ6w45AYvhXuwYaGw4lUpphctbhQTEOtIHwyU8ZWkOFEjvXvYf1Oax1Niy8x+CKsTgAB2Au/IHAo1t0ApnpcwND+VfhgwoEr9ifrFxG4aFoM4547MKw8ggkbunMKHnCDG1go70796EEWn8Tf4E3BrMY6zO3J+hmmVcL34U/dX4YC2d9E6OY5m0ACMRFV4mwoj3pf93IVn1k+1jB45Z2loqV3vFK08u0LId624nLfTTrOti7SyleI1O6/o7nEtLBT+quJ8L/pTDx4FHmmm1cbl1GSZKkfPMIcYmDEyHH+4lf2erRBg7bWRlBhJqWoJR1bsXlx8UJDnDOz1MMJMgllmnQwKuNsUFzMJ5usMaTqj+kvXv1lsCovdBTfAVoeMjO19IS5FEXy6M9UMDy/3I8OH9hJqw5oDDbAh5vNvC27ixOD0OejVJi+rbLzh7Egv80J7pAmbu4VP6Wl2Ncip9k6gMmqwZMPOQv5n3V/Z4TA+n3PTwuVI45HM/4nx0DxWZ/Bp+FxDXcCaqzWXU/cOo9R0PxTYPjEW9RKZzc3lJZA4lk985j98gzyOoj4JsBGJpRI5sIrjltgQMNVyCjlck4GScyqsEi4hRflu+SAgGXPTLOSnxWUF7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWhCTDlvY3kvc1c1K0NENGIvK01jdG84N01lV2ZyNlI5Y04zZE5DOFFjVnJH?=
 =?utf-8?B?NGJZVlkzVEk5ZzZhOW9hb3JrY1VTSTc2SnNiSFVWcVhBeXg2bGY0bE11bkF3?=
 =?utf-8?B?M0QwK2tZVUpERFRHdFQ1em4zdUhrSFJteUlRSVlvMklJeDNjOVMrcnFra3Vy?=
 =?utf-8?B?TE45V2RHM2pxYzVBNUNCNWtWM0N5N0NubUZSREJqZlFzL0VRQm5FRnZaOHNE?=
 =?utf-8?B?VXRYWmpQM0hhazVSeU9DOFozeVVuNE5CTS9HUnZ1RXNrempobThaazBOa0JQ?=
 =?utf-8?B?Rkd3bTYwb0ZqYkduc2s2SC9tZ0YyRUh4emQyRWUrREg1dXVCWUQzdmdCYXNY?=
 =?utf-8?B?bHdoUHVWWnZBcmVwTWE2UDEwdWdOR1lIVVk5K2ZOUGRIMkdlcW4xb2R2ZEpE?=
 =?utf-8?B?clNWSkVTdkttYlk5ZXdIM2VFVEVUSnI3VXMzOXM2TlpGQ1VIV1gxVFFQZ3dq?=
 =?utf-8?B?bzhJS2cwL05rSk1TYzR6WTdnS2lraEc5QXdycVR2N05ka2RrSFJwTStFdGJN?=
 =?utf-8?B?cFJDdktqMmFWK1BuUjVpcWtqZE85cXNES3hwbHIxazkvSGk5eHdralNxVUhz?=
 =?utf-8?B?dGZweFB6S1hWc1E5WGVsUmRWUk4xeWFPQkdyVldOU2lqT3MvbUtuOWtXSGNY?=
 =?utf-8?B?eHNNYm41NjdqaGhNY0MzeEdQKy9sWThqUTZJbDJuNWZjc0U3TXRJUm1yRGUz?=
 =?utf-8?B?b3FqOHUrdkJoei9UOWRBdnh3UW52OVg0cHVJbGhnSmNhRkwrc0EvZm43VDh1?=
 =?utf-8?B?ZDdSajdDMWIvd09tVXg5SDJUd3NLWTZHSVJlMXJ5N05WcGkwQWloYkNQaU1t?=
 =?utf-8?B?UGZyenIyOFREdW9VVWtuQTYvUTQvSCtGamZxZitkY1BsdXZwUmxaQlJ5aVcz?=
 =?utf-8?B?VEdhb2h2VEhIbDFSZnVYOENreGpiNVVsQnNaaldVeWV0TEVOZWRZWVBFTEVo?=
 =?utf-8?B?d0J1RWVKc3NhMVc4MXdxTngrdWdjUGlnOFNKaysvVlFaN05yeC9RUUl4Nmo0?=
 =?utf-8?B?ZTZzR0tHVlQwVlFsZHp3TGlJMVllL3pwYUZidXpnRVZSK21YTFZTamdWZlY3?=
 =?utf-8?B?Y1NhdCtseHVzWlgrL2tRSHEzMnhTam9uSUFjTkttQUVwTEFhUVplU25rU0Rw?=
 =?utf-8?B?d0ZtUUl3cFQ1R2lSZWwyVXdaSkI0eE1IZUtWQ3F4YTRVaGdMeTMwbmlLSThj?=
 =?utf-8?B?YmNFYVZvQjI4RkczRlZPYlFyT3dvaG8vR2QvRHpDcnNYWERxZnlDQlprc1A2?=
 =?utf-8?B?SG91TU4yZXNVcStJUWt1VE5wdTV6YXNBNXBZTVd4YUlzbmVSZGx1VVpnTzhk?=
 =?utf-8?B?c3o5SkRYeWFGVmFRMVAwY0FzRld3QkRoWFhHRWx3R3ZHdElUdG5SYUN5QWhC?=
 =?utf-8?B?Znl0dXlwbUhYYzdrZ2xtZ2NDT0NNT0RadnE3NXN0ZzFQVGZDOGFZWEFtbnlZ?=
 =?utf-8?B?T043Qzl2Y0Y1U3JwbXVZbzJxbE9lSXVkOEpaUTJwYXI3RklySlhTTVBnVDYx?=
 =?utf-8?B?NXM4L3QxWTFoVVh0ajNRYjMrY2dVYmU3YmpsY3UzUUZwV1RHTCtmTkZPaU12?=
 =?utf-8?B?enJpemh4ZmNKUEFHT29sTjhGVFB2SDVYLyszT0hIbHFBdU11Z29KNmI2M2Z4?=
 =?utf-8?B?UGRUb3Q5ZFlQQUh1b2grT1ltMSt0ZDNJOHVnOGg2M0JtWEpmYXZScTlFc2hW?=
 =?utf-8?B?b052VEZ0b2RMbkRPbXkzcUdJVFFRM3JKTWZ0MmlkUm1zVjkvdmZxM2NVREs1?=
 =?utf-8?B?aEJ3akhQUkJudXN1MnN0MjRZekloM1dhUld0YzZkU2JhOCtOemVrMVMrR2Ux?=
 =?utf-8?B?NGwvcG9qT3dlTjZ5Q2IrYjdpWStyQ3ZGd2U1R3BaNzZhcUorQWdRSi9pN0Jr?=
 =?utf-8?B?RXNJWm00L3lOaVJybzVSZjgwZXdKNEZWcytJblNxT2NpRm1XZVFxMXBoQTZQ?=
 =?utf-8?B?QTIremdqUlRFSXM2bHN0MmZ2bENYSU1zdGIvcXQ5d2h4NlV2V21zTEYvZk1G?=
 =?utf-8?B?aFAyMkYzaDVZQ2NnR1U3Zk5oVUtxelE0dXZuSDYxM3ljcWYwQWI5OUJnUy9y?=
 =?utf-8?B?aElXZGtQUklMT3M3azFQR0FIcFIzK0NCTmQxVThCZG1TOEt6cmFZbW43Zzh5?=
 =?utf-8?B?WW5MeVVpeHVOVE9hemhZZy9nZ2FZWDhUcEpZNFFBMWpwOTV6ZVB6Um1JRDBv?=
 =?utf-8?B?RjBsMENJcmdWMi9jRUY5bEUvMDFqeGd4TUpnc3phclgra2s1bnoyNWVVUUo5?=
 =?utf-8?B?Y2Zvc21oRXd3VVBPSVlob3VOeVJ4MnhIeEovNmNXT296dTZxeVVwU1VrZE0w?=
 =?utf-8?B?bUErK0VWMnl3cHVsVzBSTE90QlFEOWdaY29qdndxREJTZDNRYzAxdz09?=
X-Exchange-RoutingPolicyChecked: OvBmoyTErV1AyMD1CeY/4vuYKL52ZMekAwX8c89pMRc5wHv7boSkTqng1eozWhMfiRb177D5Dr3SQsHTVKOufN8FqeD/GdFdxSXHbl4FDo+pC0Gfhthwm3TfbyOUA2sslT7LjGro12OpLrrUbrQCdxyC3ZW1EOEFN7266xn/Mf4kHStHW4cvpzNsQB5Aym+45OsdnU+QntWyKaGSD8WKg7HNQ6TNIce4gnTDR/M6p3UiSjJa5KGO5usKQO7qzDdKAYNe5zahZveAeTg50ztBHeLQ8iP12+vxsIRuDA84y8NL/PbM2uDEdQTw4xKaYMu0evLcGO1zWLYatqamnFHbnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 352a6dd2-0c09-481d-1cb9-08de83de4504
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 04:33:00.0845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLB0QUrAZdH0k3zBBU6Bl43w53ShWybCpAdgNhOk8aLY7tf/Y0a6Ta6Vg92s4SOCMVg6d+IOW6tt9JGVCumD/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8233
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

Hi Karthik,

On 10-03-2026 17:50, Karthik Poosa wrote:
> Enable HWMON energy attributes for CRI which is available through
> MMIO registers.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 3 +++
>   drivers/gpu/drm/xe/xe_hwmon.c           | 7 ++++++-
>   2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index 4b3c46eb858f..c63b409d7a82 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -27,4 +27,7 @@
>   #define   TEMP_SIGN_MASK			REG_BIT(31)
>   #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>   
> +#define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> +
>   #endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 0fd4d4f1014a..852681bdb84c 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -296,7 +296,12 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   			return GT_PERF_STATUS;
>   		break;
>   	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
> +		if (xe->info.platform == XE_CRESCENTISLAND) {
> +			if (channel == CHANNEL_CARD)

Instead of using if-else better to use switch-case here.

Thanks,
Soham

> +				return CRI_PLATFORM_ENERGY_STATUS;
> +			else if (channel == CHANNEL_PKG)
> +				return CRI_PACKAGE_ENERGY_STATUS;
> +		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
>   			return PVC_GT0_PLATFORM_ENERGY_STATUS;
>   		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
>   			return PCU_CR_PACKAGE_ENERGY_STATUS;
