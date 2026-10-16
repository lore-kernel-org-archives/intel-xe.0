Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B281CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 18:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1D510E162;
	Fri, 16 Oct 2026 18:05:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FF910E162
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 18:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792173927; x=1823709927;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BoaFe+hkUZoR+6nDSuNxr5D4RZaOnn45hsjASZse5JA=;
 b=NrO1qheZ1sT2cQUa4zTHTLXc5wn2Z7W+2AQWablhOoQY3K9WZvLFlx/M
 cq5NeA7K9Qyq6KcKHaPmbN3yjtNMkqY6ggMpxWB84twTFfeG6auQEdfLu
 2X6x5IbORt8FPKfOS1BkTmFXP8uItwWfSo8tN9+x/xJpFenOnvTtt82Fm
 gy9kdeLQj0ffe6RW8ButSiu9slolyVGs4ixcbXH1Dlyc++VaRYqKjDN30
 c33aC3c/hgAoD0X95lZJm4ZJF9TGSB/UphhhQnF468himlGczjWQsxkJz
 1aD9Gz8af1ulMzD+XxE958c7VYOgCKZEvMYyY8cnqga8EZvleHVJdPnNM A==;
X-CSE-ConnectionGUID: TL+SRa/hTfCO8cos22TWFA==
X-CSE-MsgGUID: sRX6P2a3RLWp3OXgIv4LLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="864309"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="864309"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:05:26 -0700
X-CSE-ConnectionGUID: Dkgwe6eMQzylWLLpxPN+RA==
X-CSE-MsgGUID: Hd4PQOoiRWWA9DYwJKzRqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="3845531"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:05:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:05:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 11:05:25 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:05:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1FDLGEjusVlIXw4W+ybi29SobpoWYqSIgjCaPSklMczoKhRtDA55Aixaxyj/Fz4bUcThNMOOCqDSB9ffjgXyedkZ4BHL0iE+UNGIkYRJunzNGLQXSnETGpGF96FcuYxmtJsVF6N9XrZkvlWrIw+uyf7LwEEyanMfQUAK5TyLhgsqRiMH7TKgnnLj6M6xp+FKz7Ef4PYyZeuq/yhGKMQGC5/y8PZVQmEGvlsPFI/baLBN+fjqUDQl1ITsNqkA+6xpp0W8WzzEMUYEWRom5jc25EeVQJlF9DC9wCLEAjHZqvoUuGlsss/WXqSZk46VYvRiydXVH9fqkfiIe9v0lQdMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKQ2jgK6mgwQnCPDIFqv8XyT82OnURtEG362f/fAs/E=;
 b=mEWhM+1o2qFPR0nHB8UYMWaTlOfBiqNORygmZRxO451CRoxO8A0x9CjMocgu20eqEQUqLK6E1gC2iErI1orOBvaFD/OPLP/hauyFUPe302YqHEOfyz59soE/OV/kwkNInGuB1jE8LKTz19FCb+i1ljFEH4xl38hnhoE+KEOLMtA9DbPULx4SNoSqVlN9tZfBwXW5t/yis8fZADBDtHSpgWifbTz/mTi00vfKam4WQSgS4bkWn8y0HgadIT8NOPKMRhXAPN4JsIo6neSwweZw+tlmfmu0hQSKkEnxQY6i4VFANpAXIGdZ4QMw78gTZ8JZ7EEFOiuLr1XbV/NtNER1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS6PR11MB9918.namprd11.prod.outlook.com (2603:10b6:8:464::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 18:05:22 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 18:05:22 +0000
Message-ID: <a62e7d36-5520-4bc3-aeb9-7a52b0ac6ff1@intel.com>
Date: Fri, 16 Oct 2026 11:05:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [2/3] drm/xe: Access MMIO after pcode init
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261015165451.154495-7-vinay.belgaumkar@intel.com>
 <cfadcabe-0a2f-4e12-930a-e07bf78ca960@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <cfadcabe-0a2f-4e12-930a-e07bf78ca960@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:303:b6::21) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS6PR11MB9918:EE_
X-MS-Office365-Filtering-Correlation-Id: e1613969-39f4-4f65-2875-08df2bb00b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|261009223027099003|6133799003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: z3AqwXP5i3xs+6gZDGSAMT+bMuZNsXwy8laR9SZy4TDjhA6G0mhjw96F83CpFhF+6ySGr1AJIAI5sFXTlGIA8fdf91+lk3ElvSlXyF/o7+56Q48Os65Fu8sUsDLVNsK4xqOFpFD/FcLvmMAhLJxXz3rUf7+ajsHAC6OuRdK69RlNMghz2c8ux895isfwOzkydxZHxvIirVh9DtmvgcZuJgYrhupMbR6Nk5c1VrVYGDb2OFUVHNQk0cvMRwcsJ86TnVQcc9YVDgO9K3vV/hU4Tu01pyecOLnOlwwOKJj3b+4XT7+viNWBvHDiLeM2f2DgB88hTyIrEVroHjX0TSY3+B8UznQ7jA+dmgmjYZ2yuOT//BmBh5DdfqEzynpbvWLAieIili5mPiKFTBme30jl8T8VW89R6zou4Hp30swDR29WTzIdloGK0yWX0xpzn8d1uTfuzbdjxSLotPTk0gXSd28MbpA95fw0PYsmBSePlDqhO5RWJPX1Vf7Ue94QxL8XyYfy17AlqQ2EFM96Oyb5syKfq6SuD8grTwvhbTnF7sr1R5ue7hmRmQxmeS0EQX2Vxfwx7u5gFYGKE4S/4FgZx40BQkxjAUFEIaDU0utoHlALsB8pX957L4ioBZQyX4IhsCRzBv02o+8oCmjAJUCF7ZPVI+SN0Hb96gRw3BlHFA4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(261009223027099003)(6133799003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVFvbEFZYytZUHFCb3F3aVIxMy8xYm5hOWdCV09wV0xzKzdtaUszT1kybFJR?=
 =?utf-8?B?dUZFcUc1WWNVZzljb2FKSWRTRmlVM212a2FYUmt3Y2ZaYzlBSkl0UHc0OVFa?=
 =?utf-8?B?V0taWUhoV2RoUzRnQjVIQWtad1hEMjJnV0hndnhQdG9TNzcvbTJxRThobWlH?=
 =?utf-8?B?RFBseDE3c2Z5QTNnendGVzBKY1NVTWRjWnRzNjlVWndIbDJ0eHo4TDNBNTZ2?=
 =?utf-8?B?OGNXKy9MY0ZHWHNiMUsvc2hjdjQvNDEvdjdZTTIwV3JtV3NRTkM3RlZnTzRY?=
 =?utf-8?B?eFBva3BzYmNKWitRUndjUloySC9SVXZtNUFrQ0p1Q2ZtaEVrTlkvL2ppcmhh?=
 =?utf-8?B?dVRYQm1oYkphaW1JOSs0eVdPNlQ4ZHBQT1ZmbWJPcngrNkx1azZSVXcySGUz?=
 =?utf-8?B?dGpvZEpSaUk2ayswWTh3VEFWMkYrdUFsMXorN1ZvY2dFK2ljYUNPUWEwV2lR?=
 =?utf-8?B?N1M2eHZ0Wm1TVEdTWDNPM0xXd2Nja3cydVYxZUNYd0FCN2hENmVvOWVGendL?=
 =?utf-8?B?aldDQ0dQdTVQS2JnMmV4MjlTd0s1QVBqQnFSYXMyVW1YRjYxOXB6L0w4ZUtm?=
 =?utf-8?B?ajd0TXk0VlNrV0ZRWWdCYjF4YWczR240dlljdU9STlQwWURUK0JsKyszNXNJ?=
 =?utf-8?B?ckk2ZHU4U29DUmc3MEkvTXRIK2NFYzdMRnYydy9qUHdNalJvR0o5NjZ3a3RG?=
 =?utf-8?B?MC9xd09USGRZa3JvenZNUmZPL3prN2M5L3A2TkNmU0V3VUxlZmVJUkZ4QXMz?=
 =?utf-8?B?UWpiL2ExVWx6eUplQU55TjhmdXVua0xjR05STW54a3ZaSVdVd1ZNSEM2MkJ6?=
 =?utf-8?B?L3ppMVhFZkhXL1VWRFhDWXYxNFJpMUZCNXI0c1hXN0JCWEh6cld1UEc2ZTEw?=
 =?utf-8?B?NUZrcnVPZVkrOWRPc3ZHaG5mUWVzMVJjd2J1d25FNlFMNUY2T3VOTFZSRmt5?=
 =?utf-8?B?cC9uRmphN0VDS2krS004MGgxVGpxMkx1eGRwYksvUEVFTlJDMEZFNTFRNnpn?=
 =?utf-8?B?SGlJMUhQczVFT2xSRzFUNzdPU0hBMERucTdocE53Z0diM2syZTlCUUFJcGtZ?=
 =?utf-8?B?N2xCNk9uT1Y0bXBQZUNxenFkWEJYQk1SWUY2WVptNjBUcDltYnNUeUFGNWh6?=
 =?utf-8?B?dTFWajJ6YUNEUE1GdHNVY1FHQzBSU1VXNzM3MW9RWUtxOHFvSXhDR3M4ZkdV?=
 =?utf-8?B?MkY5eUlGdGV3NUtoWWc4VThKaFh4SVVvWllob0hwMDdyMnYva3NuSXpwNGNh?=
 =?utf-8?B?TDRJTzUwNzZOd3RjSWxLS1lMN29GK3lYR21LQi9aMGhVR0xnd3ZNZGtoUkY3?=
 =?utf-8?B?YmxteFlmbnE5cXBDdXY0eGRoazF6UEJGajlYdWhCSHI5KzRBK3JjWm1mUThT?=
 =?utf-8?B?V2JiZWxJU0VobjFhM2tLZ0hPUiszaGI0VFFWYWJDTFM1T2Zsa3NYc0IydEph?=
 =?utf-8?B?VDZOR1BsT1dZZVQrUEFIWDV1cmdmZkkyamRvUDd3VGE4RUV5dnU0ODQyUmNx?=
 =?utf-8?B?R0YyVHZaS0RHVHlzVnJiZmg5ZHgrSm9EZlcyaTZSVWkzY3BvajFrSitTN0hn?=
 =?utf-8?B?TGJFM1VsbjEwcUx3d1MrMkJKM0t3QjFzWW03aStKNWpaTFVGYzhCMjVtalI5?=
 =?utf-8?B?OWhjdHZ3bFg0NXRLNVpXQ1JVT3A4TEM2NVJ5cGxzQUlpZUhZbzg0Rkl3SHMx?=
 =?utf-8?B?QWMyR1o2ZlN5eU9QdjZUNGZNczdhYktIUXBKSndUSEVERDUwOGg2NXBzVzV4?=
 =?utf-8?B?ZC9kclRidU1sRVdGK0RvRkZmVjZMQS91RENVR2ROZUpsZ3hVRGl2MGVPTHFR?=
 =?utf-8?B?MDJYU3hwUmJPREdCVkI0WkswaGtna3VuQUZsUk15UVVTNVhYb2dLRjd0b01n?=
 =?utf-8?B?bjlDVmM1MndWRTBKS2FUSlcrMTNMa1BHOHZSd0VydVh2NmdzQ0h3OHFDWmZq?=
 =?utf-8?B?RjcyeGVMMjRHNURTc2Ywd0xmdFluZFAzazdKUmtISTZ6NERSY3AyUW1iYnlq?=
 =?utf-8?B?WFBkUHVwM3VIanp4Y0RJejZvVHMyeXBBV0MydkZDZ1ROc3JzZzRwRElPWFZ2?=
 =?utf-8?B?T0UwUDEzOFZGQmlsbXpOUE5wMHJFd3VpQ3JHK2xQblk0QkNnUkVvcENDRERG?=
 =?utf-8?B?bnhoaEFDT01xS0J2NmYyYnJQamFzYVlDY2p4NUNDcm9nQmt0NjZnbFpjdFNs?=
 =?utf-8?B?TlBxTHBsdlF1ODJJYllCOGZYN3JRWmRKSVE3RnpKWGhEbDFaYnJGZ0EvNkdJ?=
 =?utf-8?B?N3p2aExmMmIwRWtCYXZMa1RnbUxITDNvTGVibks4bUxwZFlsVnVmVkpyQzh4?=
 =?utf-8?B?U0pHU29tT0dmdUJNOVJsSk1WM0h2M3o3dVROM3RkK09WNGYybVY5KzRQbWxI?=
 =?utf-8?Q?iMeAivytgrEcCrnc=3D?=
X-Exchange-RoutingPolicyChecked: c00aY+h+rlODHYT/nKLveEw55kgGEbS3ckjapMY0wWrvIVO5ke9AWtnvDC2EAfpzlRcXCVnkl2Mt6Xz5suB/CAqwcmUugAq6LHZqUS0ZmcuAdY1eqmzTZzIVjCU4HmedhcBBvXD+4RGDhvKIf6/hKU1SYX8bEDaVrcxTqEiUXFiou/XFV/vXU/jnp/kgkchmiZVPmDgLTEpLshdmbA0wPLRyWZ3WfhRegteDJ4p37uFbud3e7mcSM7DsAR1VuUsf1cE4+s7dpTf07ly6Ngmn3wK2feNZN0R5/vsc5wmSFiluHV3OaJEe0T/yPhkQzQrr+ETVSkfvBRvkBRGku1U+4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: e1613969-39f4-4f65-2875-08df2bb00b89
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:05:22.0691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrUxBLdTsAMtDQBdhGjtIEolXN5EkPf8WeGYPwIbYMjgVU/zFo+QQfwJhHJj4FE1+XkPvC662/bwGYu/UE6nFPxB8iOLKNGzZONeGpj0Fc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9918
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


On 10/16/2026 11:02 AM, Poosa, Karthik wrote:
>
> On 15-10-2026 22:24, Vinay Belgaumkar wrote:
>> Allow pcode initialization to complete before we start poking around
>> the MMIO space during resume. This ensures MMIO space is ready for 
>> access.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pm.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index daa7ba2df317..1f5097875bcd 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -241,9 +241,6 @@ int xe_pm_resume(struct xe_device *xe)
>>       drm_dbg(&xe->drm, "Resuming device\n");
>>       trace_xe_pm_resume(xe, __builtin_return_address(0));
>>   -    for_each_gt(gt, xe, id)
>> -        xe_gt_idle_disable_c6(gt);
>> -
>>       for_each_tile(tile, xe, id)
>>           xe_wa_apply_tile_workarounds(tile);
>
> shouldn't xe_wa_apply_tile_workarounds() also be after pcode ready ?
> are the MMIOs accessed inside independent of pcode readiness ?
> if it is okay, below changes look right to me.

xe_wa_apply_tile_workarounds() primarily contains writes to SoC 
registers (uncore). Those don't need to be moved. This patch is 
primarily for writes in the GT MMIO space. I can clarify this in the 
commit message.

Thanks,

Vinay.

>
>>   @@ -251,6 +248,9 @@ int xe_pm_resume(struct xe_device *xe)
>>       if (err)
>>           return err;
>>   +    for_each_gt(gt, xe, id)
>> +        xe_gt_idle_disable_c6(gt);
>> +
>>       xe_display_pm_resume_early(xe);
>>         /*
>> @@ -698,13 +698,13 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>       xe_rpm_lockmap_acquire(xe);
>>         if (xe->d3cold.allowed) {
>> -        for_each_gt(gt, xe, id)
>> -            xe_gt_idle_disable_c6(gt);
>> -
>>           err = xe_pcode_ready(xe, true);
>>           if (err)
>>               goto out;
>>   +        for_each_gt(gt, xe, id)
>> +            xe_gt_idle_disable_c6(gt);
>> +
>>           xe_display_pm_resume_early(xe);
>>             /*
