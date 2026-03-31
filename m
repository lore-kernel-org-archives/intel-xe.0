Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0F210F92E0
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 16:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3443610E1FE;
	Tue, 31 Mar 2026 16:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFOiA49z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78D510E1FE
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774973664; x=1806509664;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ma/P0Zq6lHzhZQZw1/5cybf69Akbp442r9yDyp2QmcQ=;
 b=IFOiA49zKXplvPFfKpEMH15vWZqHbgSLL1r5VV8TanNdOcVKBaKN4WU4
 ArGLK+W5Frh2vsWc6tVRTB7eykhL6giv8XmpNsQr9gVuKOYKBNAw8EZam
 lK/zudhogarIVxrj/A3HYKWnRceR3LAjy/nopH5LZT9crglgUdC+o3KPp
 atjQXoe4RuxOkDSZl4kretH9CNuA1q1GxwSBOwnzTux5N25bgK177tFAe
 4ukzrNdx2+Ko/mjNgl2MD3O0+62ppu8Ix5yNlzOp9Dfr5m3wrrK0psMIT
 DuCvR/sWwUErJ27U+tTpKYMdhgd+rmSRhOf+kri+WL/ftn9Yd65eUAqYU w==;
X-CSE-ConnectionGUID: kBQPpQ40QuKN4ihs1cAjow==
X-CSE-MsgGUID: vv+q1CPWT9mNDTdpm1pYug==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93383070"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="93383070"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:14:23 -0700
X-CSE-ConnectionGUID: HKPBRCz+TZ+HrU/lDS7inQ==
X-CSE-MsgGUID: H8y4tttpRtqMV3rVlZ3HOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="228013149"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:14:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 09:14:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 09:14:22 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 09:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeTwkCA1qZ/mpgMXIHTS4Kk4Ba5eRMZ3ePHeC76hddVK8coypFP78JfFWTKtv/R+dFcy4TbX4Eee986reSxQDhIN3DqeLnHfs3+9kQOLBcLCKXadM3XQOCULugtkOcULezH0i/RpaQ+ShApi4N9YVp3jUoDb5PNL7D3BWp8kYP7osSIBM08u23VhPUmq/AQAZvGaHw3JqQuNUrvfPlDSAyy/eN2KIavH700YcYTCONog9Ek7QThMvN0vTIocZpb9upXGAnV8RFa+acS7+QZqmweUXSyMhEpQ44XI+bQfh8VFEARBjPNysWcAGwg3U0KhqBGvkivj5YrW+fT3uBzk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UEu7C8zvCRpRamh8OaXoRJ9RZvDj1FYKCdGOhLVZq4=;
 b=cw8QEMPwi1QL2aaXgQLd4uifGpGETulQIphDYX9dQ2pjYhtwtxv9KIUXEI6CNcLyz1Og+DUiZseyPwJKDnbBKyECZknoF1hHIMsZblxnd2Rb1vtK/QZmqngXrXuOCJWgwSmYOeN/tstj+6PRMEiFYvU1DHLx1pMTXzHUD+LactQBUJgk7ugZpEXH2DUUb4H5ncQoIGHwZ8MNvgEL3vmEYuXJxsB3dxv86vx5tjViwxsgemBTzYd0G8pVz+gfbE4Jelq0fELQJQda9Jj8iLW/tFC3cakX+0l4FP2psWWEKStpjFYgafWBa40uo5o0adocXj1LfBRe/FU9vADks3EIZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Tue, 31 Mar 2026 16:14:19 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 16:14:19 +0000
Message-ID: <ab19a31f-03f1-4d21-b135-82e3417a2876@intel.com>
Date: Tue, 31 Mar 2026 21:44:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] drm/xe/xe_ras: Add structures and commands for
 Uncorrectable Core Compute Errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-20-riana.tauro@intel.com>
 <aahesvXwzXJZbOSF@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aahesvXwzXJZbOSF@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::30) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ1PR11MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: f13caf04-95e8-4f29-6b80-08de8f408f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 9n/TTFN0XadjYZbiZ1YBM/7U8YRRHnPZiiE0W4pQP2s1qVjgrPcs+9VpIST6N6pilJExXv/4jLJhk0OQeMgpAuAXe1c7pO1yugc0E+zV9DZXQxKErgFLFKL7V2Uqgf8+24jCGhnO5nj9S6WXkhE02GPWVaLvD22kE+WcQbqcNb+XvCom7O7TIypzUYWQN8sswyM//MOqLJJm9zKjAAdBrI0QVOtV4gvAPwOQO0obX1yMa3vcTGXTwfXGGLTQU6460lL9bLPiZLVCtFH0LcCA/hvHS7ahe1kvUQkbRvDgmwUFePITBg0ZJQfprrFuxyTjXUWhcyR3MxH9ToKivcCE26Sfbfelft75KYWQZNfi/VIKcGI9GWb4jg9MOanpzgdPlvwmT/GZ74hvAYuR12Iu8Vy8t/6pSNviCsBgXhPFbR4g/oHAOpO8x1oJAZN830pObCPGOe9/L+cjzKdBg/oBCbioj5i993q8PX3UWKQlxPQo+zhMpoHys/k2F7T1dgdvAc/7lfyZa3rh+H2j7TZVChXrBhYpZbx/xItxREgZ7D9ONNWmaoMkyx29uLqauk80lk4/b80MNinImBD3lYW5J73yckbH/wb6JHbyCY2+B1t09f6fw9C5Q8a4oEf3mmoSILUqxbVkhasrBgVFO2fNWvfsOvQoFIJcS0lyRjQe4uObj98TXaJR1+12ToTkvAJSyv/IV3Kxa9k0YUdC7eG8JOk7Ene6H2tW246l7MluKdw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjFNUlZ6MXB6K1hnTmVnKzJPVmFvSnA0RUZ1YlJMSzBObUFpejZHRytlMTRp?=
 =?utf-8?B?ZkZScThzWk13L2VjaStmQWdWbVFuMFVYM1MrOHBmdzk1cnFsZTYyd3h3UGxI?=
 =?utf-8?B?OS8wMUNWOGtvYmxyWFliampFajNSSnZieTgrZlVJYzkzZzhGS3FVMkdzV294?=
 =?utf-8?B?ZEU3aUNsTm1LUHNwMnZHNjNWekRkb0x6QWtIVHNScWFJb2JFelkrRDlWNXRT?=
 =?utf-8?B?dFBrczh3elMzamFWNFJUdHJnSFdKVWxvSTI5STc0NHdiOExZRVBucGJ5QzVz?=
 =?utf-8?B?RFpsNkUwNGFqTGNOWkh6MnE0TlN2UFBHcUpKa2FYYTRGVXViUUJ1S1NSbmtw?=
 =?utf-8?B?ZTRONE5ueTBXbFBQSEtkeHVkVmN5Vll2VXpIcWpITktaTE85dE5hV2tMM0pC?=
 =?utf-8?B?eWtDSlFlLzZEUklWdW5WWEVkTUJrUU81ZTRPelhKKzNqMjVxc1JjRlNyZTVm?=
 =?utf-8?B?MFptMGRPdWs5aTR5ZXIrZEFoRTkzYWJ4anROUWs0NUtYNGVrNk1FVWlyTGlI?=
 =?utf-8?B?WWtHK1N5QURhTmEzRm5vL2s1TXR1L2JPdzlSekFSc3lsUExlZW1UU0kwdHlP?=
 =?utf-8?B?eEM5aXNXb3g0eU1DU1lPaXpVSmE2YVkycUV3cXBUZDZ2L2NJalZpdDN5bUMw?=
 =?utf-8?B?bWpPaGE4RXU2cW10MjhSZEp2TXgrWFRMcXBpemFMT2pWWkU4QTVRL2p1a3Y1?=
 =?utf-8?B?ZGRWQWZyUVVCQlNhWDdldnFEcG5iM0VmeWxqNEpjaWlFY1VPQnVTR1gzS0F5?=
 =?utf-8?B?QTB1R2grMVhzQlZLN3A3QThVTm1ieWtmR3dZZzlzN21mSG9hYWg0TmhJMGtZ?=
 =?utf-8?B?bzBQSlpocHo3SFJ6M3V3RnM0emtkOE1sbjdCNkJ6OS8weUZIMEhkd3d2ZU9X?=
 =?utf-8?B?aEVDSkFnQzhIeVpDcWN3MGdTZ244SEFOZ05DRVlRNGF6eENxZHREaHBKcTMx?=
 =?utf-8?B?eWkzbmpUT2JiNUxYMHNEeGp5bDB4K2FkSHlqbkdRMno1SlIxdFpOa3IxTGdu?=
 =?utf-8?B?Ymg0MmtRMk9mNVAzQ0NtajZsZnlWVGdIRDQxZ0hpejNaK21VZzJIYlptRkhU?=
 =?utf-8?B?MmRDWjZFZkxCbjl1UE42QXh5QmM2bjdydDN0NUZaWHlmSVJoOTFmdytZNmtI?=
 =?utf-8?B?OHRMeHJJdlMySDRpRVNjUTVuRDZhVzAyT0FZWkNkc3QzMEp6QnZIK3UyRGlO?=
 =?utf-8?B?OUVodnJiRGJKWjk5Z0lMYVdFZnVreGkxby9QOUNBY0pBWnVDdHF3Q0UvWFlm?=
 =?utf-8?B?Z1dLc00zZnRVb3BmTmRoZkJYL3dzU3EvVXhZb2xRc1BKeFNoMHozc0NrT0c2?=
 =?utf-8?B?eklTekxpODZJeWMzN1hOSDFLVWNZMmE0UXlDc3pvMXZxODRKeStuREVLcXF0?=
 =?utf-8?B?aEl6NnYzZ0VEZGQ3czUranpoZytLUXNTVENSeS85dVYyWERFVVAyL3F1ZGl4?=
 =?utf-8?B?YSs0bUxDck9PdS9XS2RjRko5U2xycG9WdFFCQ09LMzJsdVBEQ1lVQjZ2ZjVD?=
 =?utf-8?B?bWNiODJMbUNaaFZUN1BFcThYc0IzcXpqRlg2L3JFcWRNRTVsSk4yOWJaY3Fs?=
 =?utf-8?B?MC9rMlBXSnhvclVhQUQ2ZVJaVitiNEt2d0JsbkY0b1JRbVFiYjJqZE5LR3R6?=
 =?utf-8?B?blNHWlVlWG94VkhDLzVCYVI3RVpBYXdPeSt3TXBsdjd5NDRYZ3UyWHZFcDlO?=
 =?utf-8?B?dys5Y2ZkenNzenozWXV1YXJleDVJM3JydWNuV21LWHFVelovVlRML1JLanpB?=
 =?utf-8?B?M084M1lDNm9aZis1Ymo2a2VwZUVNLzdqN2NNSU1CdWllL2MyMkRvREh0eW9p?=
 =?utf-8?B?U2JLU3lSWjQ2V2VSTlVoUG91eEZMWjIvNnpoUVM1OE5SbS84NVlhRGNDSy81?=
 =?utf-8?B?b01YV0hZZGRPWit6STNhTS80enVUbmJMVFBZM2NNR2FkYksvRDg1Yis4MGtR?=
 =?utf-8?B?VElITFdTVG1rOXdDSFUxMzYxVS9abkhISzBSbTlVcFRwUEEySXNLWE9CYkZ4?=
 =?utf-8?B?YTNseEQ3Q05lQ2dMUmxLSktuT2RBT0NTd3Y3cGptckhJWFN5b0hsMjA5T1NY?=
 =?utf-8?B?SHdEMUJHTi9qSkFMTWdPbGtHZFBEcUI5S0hpSWcxbkJWV1RCekFpMUloeENK?=
 =?utf-8?B?L3hpdHpvdXY0RGlCYjBrQmQvYmR2YzhzMXFRenppZ1JuaHdKS2lwSkk1MjVa?=
 =?utf-8?B?OFA0a2JGOXhiY0ZKb0ZxNDZ3ZmN0cjRwWjQ1K3BFWXJUNUh3NFlwZ3lHZXI0?=
 =?utf-8?B?NXdmOG9obW1xMFpuUXFXVE1QRHdSQVoxaWJ1TkRFc21kdzFoTTlNWkhlWFRW?=
 =?utf-8?B?NXduM2FWUHZGR1orVktPRjdrNlpXV1Q0QXlXeHZKYmtScWNHQ0RkZz09?=
X-Exchange-RoutingPolicyChecked: qLKAUmBrfRolfLzag+YhcjwCa/wRTEQJ1mL93JgkAqYvVKVFn7YbVcDm8RJC87LKrEWKVtbU8sfazR5c0DduTaIj/58TBhUEg9JKwiTDBDjfb1thCxz/iKjseuqPYx3VKnDCYkydP3qpL73qQOhUspoligpcOeeK/LgGe7R//bPrPjDQpwCwcgSZ3/tuch5e+/W2TCbd7qTHNghwTolgud/zsqvAsDt3Hh0yfCnbryBPkHFSrcyOZvGemZi1CT4Uhj33W29G1gQHARnjz8AgmB8spsl27sX2wworZyIoXhF5eicFAtZ7m7nbqONocSSCXnowUuLNU7Vxk7vVoxL9IQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f13caf04-95e8-4f29-6b80-08de8f408f8a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 16:14:19.2530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVUimhOyzhQOr9IK9IG0XfFmGrfoph7kZyIk7BTSgTV14rz4Q8nGEcgrdVWkCmkl+lLgbZ/EQwwMHT+h/WyZSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
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


On 3/4/2026 10:02 PM, Raag Jadav wrote:
> On Mon, Mar 02, 2026 at 03:52:02PM +0530, Riana Tauro wrote:
>> Add the sysctrl commands and response structures for Uncorrectable
>> Core Compute errors.
> ...
>
>> +static inline const char *severity_to_str(struct xe_device *xe, u32 severity)
>> +{
>> +	if (severity >= XE_RAS_SEVERITY_MAX)
>> +		return "Unknown Severity";
>> +
>> +	return xe_ras_severities[severity];
> Rather,
>
> 	return sev < XE_RAS_SEV_MAX ? xe_ras_severities[sev] : "Unknown";
I can make this change
>
> and since this should ideally never happen, I'd also add a
>
> 	xe_assert(xe, sev < XE_RAS_SEV_MAX);
This is only used in debug builds.  Won't be useful anyway..

Thanks
Riana
>> +}
>> +
>> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
>> +{
>> +	if (comp >= XE_RAS_COMPONENT_MAX)
>> +		return "Unknown Component";
>> +
>> +	return xe_ras_components[comp];
> Ditto.
>
> Raag
>
>> +}
