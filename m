Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612D5C61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 07:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9EE89B70;
	Wed,  2 Sep 2026 07:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IauL7+fT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11EC89B70
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 07:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788334631; x=1819870631;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iSgpihSt/1jLdm8C0whD5aNF0Ac397HDYdPVRx4ZPHM=;
 b=IauL7+fT+acQjcNRsfFKrI+OmsX5E160qVTfvx43i+YAsQsLas9jIX2+
 liF+3veonPE7cArWiYfBTNKry2M8KFwOaXNq1Pxomsx0ULnSRZLdjt+bu
 zZXhhcVXx0loeecGPzOGj2v3A4rh2W23uR35KOieqtTkgmnJe3GS85pcG
 0jJdWlwS6TC8nLFTst/nhSmCBHhWWlRlVGP6u9ok0oiLWa9EpKXleAGKg
 hocg/KYvSxo3xsWZz6Yjy0YLia0GA3u5y1tjQfyPZJEAd4REUbZ20FOAc
 GURHE/az3GxKalVSbeV9jVKEkDiE+zre5SJ6jWgOLnThxRtX1imxf3dgK g==;
X-CSE-ConnectionGUID: c23Ks/6RRku2Xfq3upKxDw==
X-CSE-MsgGUID: 3U99EcAxScK84bsg6XWuBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88632147"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88632147"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:37:10 -0700
X-CSE-ConnectionGUID: PXOPDaKzQAexuEyg8upNIA==
X-CSE-MsgGUID: pGCLT/igRKWhc64UZLRDWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="273098737"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:37:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:37:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 00:37:09 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:37:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcM2NSkBkQ9Fb8eovUC4brs94hV5kbXAYRFTqmzX5CNHGqCIygtQ31huR/boZmJMCXYJadZtXvoc+mMT3R/KjiUBdH88gVwuvn1anemPp2BHoFLsPFYlBtMKIOfJo8+w7zlF7fUu2hxDqN3BrqkKrIl1MDiTzsOP2FNHNbCCNvQrvvVYiNxrG0pIR226xyX9ESOb36p17DLYf7ks2Y6egGhNmyUnjtI7rQUcROdIYHs2qKvkNTDZ/gek4VWE8tVG9InkEM0tml5XlovqTWH30ulz+deCaNcNJfmEKI3ThHOPBKfpzrcryqreIoU2Ctg4wk+dvziLOAueukVwWJpaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koYwCHiigRutX0oWMOSBdT+siO/BGX98H29VvLj2kNc=;
 b=sJZWgPUQGYEtaRV3oPneeJOSlMFLOjbpGOZd29rP0Gy2lYL2l/eSdV83nc4XQ/BQ+5eZnhKQMApkjKxtK2rO22oDZxUwfd9Ddfu5YKBQp6NLsmZqX6q9Ihus0k/MrAjfHIMfIaIT19lhsP0vfj6XvJN5maBB6gscsOfWOm0Hlx2aEpKw9QD6sojaxBeaOhwsi0AB8UGIQvJRZ+h1+CYtg2ta7U0T8Pv1djdlFqXF2z2CHFCzhqY0RXMyf1P31L8q1I25bQBoj4mXd1peCH2xxjtOkkJ2HxJSVSDoKABS3ErrqQQAhCgh15GlBcvYvoOYODF1XMkkxF7vk+/KpFu3UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA0PR11MB7402.namprd11.prod.outlook.com (2603:10b6:208:432::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 07:37:06 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 07:37:06 +0000
Message-ID: <142766b8-f15b-4d9b-93a5-c469e8bb7388@intel.com>
Date: Wed, 2 Sep 2026 13:06:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/xe/hwmon: Enable fan curve control support
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-7-karthik.poosa@intel.com>
 <5d1e276f-f048-41dd-b74d-22724b8c281d@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <5d1e276f-f048-41dd-b74d-22724b8c281d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::18) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA0PR11MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: aec5b30c-9cac-4a06-2705-08df08c4fcd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|6133799003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: +7H8uQXzWzaXCWin3e1y5yb5Tqp4qVg1DNWj6GxIJN7G7olMNCh7pCk8isLfGLgnP7hf40h4j+vStyrhlWpJN5pD1VOX8jm9t9hBsdeqBZQrB61F2PnrfXo37tfXzQGDNCQldaUTgWptScf3F6sBOE5RqrtalSNor3+ZBeq2cOPCD1LaAuQNUPCOL7G1YRdt6ZvYRHWP5rNxitzB9VSpURno2IqxSswPgATP9y5Sd47M+MccdJYjPFacSFaNpsvStfMgIUdShDSZVFQhqnFf0Ymp1b41xqGk071ZGDaX43aUqvOyWUJXNAavwTGLDaTPJX32HLHhZJpIpUI4njJxz+UAOyWEnom+iTE8Pb3RzeJiDYGJlGm9529OHy/4MX+sQkTXKc/SI/hvXi1gnM8jn5Dg9Pgo9knJ4boZmup/sq6NDB9ayyX3z9OHlRL2kD6shDPM+gCa9jFNzRxVcV46wsnUWcg6M48OPosaoPMHexKTjIgh9cq9qIug8eh/ljOa//qsOL+/MclvTTZW4rRiqjVLWY3boYrK+O+rNHXbemJzhplbf13Y4B77096WBPqetuW97enI8UEiE7gMoS/68+j/VmhBGVGXAgVafTq85Cgv3f3RaaO15gB9MKeAmkrVUqXNN8O+OGgRiiOB06ou4NDrxlpM+C8X15u7Gfn2KkI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sll2ZWx4bTlPNllwV0NSZUZ1bFZ6bUhnLzVpNk1SbjY5NlRJeDlnRzNsNzRo?=
 =?utf-8?B?TVFFZVp2RW5rajdBV24zRnFXaTZYL3hWZ0xtWERNcW9pLzFpMkRSK2lRcFBD?=
 =?utf-8?B?Mm1uZFZyZ1pFMFNwQkxkTGsyR2RXQ3VMOEVxNjJvWnpvRGhzMFdBaDNmVnZJ?=
 =?utf-8?B?czZoMjduRjVXNmVoUVJVZ05kYlRNUjJkMk1kemo1MXJ2TCtHeEoyemJ1ZHV1?=
 =?utf-8?B?N0h1YW9mTmZ0dlI5cy9PNmlQUUtqUGpsL0RBZkFUNXYrT2RkVG5mTG5Nekkw?=
 =?utf-8?B?UENRUlBteklWUWJXUTZqU1ZVRnBKRS8wMXR6VXRQaXdrMkRHSnFQSzduSUcx?=
 =?utf-8?B?YTF3WlZYUlcrSS9sdCtxQ3d0bHBmVlgyeFZtdDdrTzF3TmhSazhMK0syc1Z4?=
 =?utf-8?B?V3BVZUZ4UnBiek5VaUFucGszRVI3clk4bGJQZ0I1Y3AxOExlQzhlVUlIVHFs?=
 =?utf-8?B?L3FlVUNBQWxEQjdmN3M4aHFLZXJkRnhEMlV2RG1jbkdCVFZiS3NKN3UwNGVR?=
 =?utf-8?B?c3J4anVIT0R4NndwelJEc0U2R0UzajFyckFQcXZSbTVPdzVMQWNtNXRTK3dU?=
 =?utf-8?B?d3ZzRTB1UXE0eDczemlNNzMveDBBS3lJcXJrTFpORVlRSkJMd1l3VXpNRTFC?=
 =?utf-8?B?aExGRHRRUUdyaTBiMzQvUnRNNHpQc2Y2am01MDRMa0pqOW5lZDVOUG5HdTZ3?=
 =?utf-8?B?cDJ4QUhCaEowMVN4L1Y2R2o2ZStwejZxeDJPWitmZ2NmVCt3SXZscjE4Y1Jw?=
 =?utf-8?B?U29lWUNYZXhpaE5YNkhqcU9IREk3M2RJZXdtTjRLSkE3SUg5MWlXSWRDWktV?=
 =?utf-8?B?aFdrUS9PRW4zMkxzQTdCYUh1R1o5QS9HM1dJUHhvN3pwQVFOYlJIZXo4WGhL?=
 =?utf-8?B?QWFwMDE5bGwvYzVKNEhxL1YvRWpQU1R5OUtJZnloVTRGS3QwckVkdEw3amla?=
 =?utf-8?B?RUJGb0hPWDN4cEVYY2hxdlZjTjY1cWdRZjdMRHVnV3ZtTUM3SkZYV2FWRjFF?=
 =?utf-8?B?UDUyc3Y3Rm1EU0RlRWc0MWhsMEkyYXpjQnFkS0hKa0NOS2dTK01rUm4zVHpk?=
 =?utf-8?B?T2R2cDI4U2JLWUNPUlpnUlJYT21ET3NNS0kyVFAybFd0UDRGVThsc29WODg4?=
 =?utf-8?B?UHdYZ3JlYVAyWmFjWlRLTUdNQWJUSlhxMGhiUXZNS0lQZHhQbEt4UGVEajky?=
 =?utf-8?B?djNQNW9JREVYYlhPelQ5RFMvR3BqQ3hWVk5HbDRuQnhSVGJ0cURBWXEzcVZN?=
 =?utf-8?B?MmZSVVdHOFh0M0NuVU4xNUZhS28ycE1jUWVJbkdZRVBTVGI5SzQ2TGtLMVVh?=
 =?utf-8?B?YklKa3NiK081SDJzREJ1NjJ5WUxRblpEZ2FuMUw3ZWJHU2pMMitjY0d6MHE1?=
 =?utf-8?B?N3FtTDViT1RzRXNoY0pRTjdqVGwweEYwNWw0V2Z4Skd1QWVQVm1ndHRrV0tP?=
 =?utf-8?B?SXFCaTRMdzl1VjhSRHdnV0RENGlZOGdlT21jOXdhWjBTaVk0NWNuMDVLVTZ4?=
 =?utf-8?B?SW5WSXh4bUpTSWx3T2FRRWxkMmM0TTJhVmZGNzgySnhiN1hTNWtCZ2Yrc3pV?=
 =?utf-8?B?OVVqajhvMnpxMHhWRm51WHVPTHh2ZXg1Um9jOGx0MUNrcmZIK0ZtMTVYclRp?=
 =?utf-8?B?eCtKMTkzMzJNU1ZMTmlPblJ0dWRRUWxYamlpT1dxeEpTZjFBcjhaeWZwRDA0?=
 =?utf-8?B?MXhNRTBTajdjTDlOWWNsaEtvMmcvcitkcXgwQ3pScWJQckpMeHF3ZFRqZEdM?=
 =?utf-8?B?YWMwR3FUeVFKMm1kWmIzT0xVUUZzM04zbStLdlhxZTlwaWZBWnlqRDllNUtK?=
 =?utf-8?B?TGdjWHlIY1NnMTM2a0M3ejYyNWZvWlZSdU9ZVm9ZTGVBdkZvNUpCNGpaa2Rw?=
 =?utf-8?B?R2Z0TzMwM1lwaTFJTm1RTElnemVwQkFkcnpnbG44NUhoREY3UHI5Rm9neGRO?=
 =?utf-8?B?RDFxTkYyU1d3MnZ1M0xJMmVRSHBPOXBic0FrZmV4M2lpYVgwdm5CWk85M01j?=
 =?utf-8?B?MWRLcXVRSnVycE9QVWs1Umh0Sy9nVUc3Y0RuaG5jQ1dKYzBiOWNHSGFKN0FD?=
 =?utf-8?B?TG9NaU5lL2lmcExEditUK1YwbXNrN1BrRUtxdzVOcmtVblJubnY3aFJGUm9D?=
 =?utf-8?B?K21nWnYzU1VxQU5mQlRYVjdFMGt1b0R1S0NEMVJTbWxxYkI0ZFg3UmM2T2VR?=
 =?utf-8?B?bmU3T0NUaUV6allHbElCUTMzRUdCN1BBQ1VmM0tDbDdGSGNzY1NOZkhTTGpT?=
 =?utf-8?B?bTV0d3BobW1xckhqUXVIU0xQU2YvVlpVaHYzY2FEWVNnWXFLSTA0MWIrK2t2?=
 =?utf-8?B?THdFb0lCbmVNdWdYcHYvak04RU5OVG0zUG0waUFPb2MxMVErdjdSdz09?=
X-Exchange-RoutingPolicyChecked: L9wmOhKR+eSTSp2wiZl8hRvDZ6YhcAmbnJfV6/vGTeoipnoFLnQttz1zf55lr3c/zfGe++jVW2j9+Ysk2RsNN9RMibTmya7lz1ETanBpHaYXnmiWrO3Sq2pU/6BnHyVsIuqEuCRX9KAC59pOclxHbyflNreM/xFNZLWdgWKDwxT738obUp2LW54YC2PORoZgjmW+gKbAToz3qxNajI0KNSc96cr8rNGmPKhVq/UmOqV90rMQdu6NCTJ1n6Goj2/RDcle6/mp8FuZHSJ+9B6TmwpZ5lBg58ks9EYXdroQGWMdeJ9S3/KQ69Ds2+VtGMOU4RZCD93DTvEKo46DS9z35g==
X-MS-Exchange-CrossTenant-Network-Message-Id: aec5b30c-9cac-4a06-2705-08df08c4fcd5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 07:37:06.2174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6V2i7pu+boZPenLHPlV52HWM+090gp8WVNB6S9ivrGwksJYREMe67wTCVu/iiKna7EleD4pmOQWfIsXjxMe7Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7402
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


On 02-09-2026 12:05, Purkait, Soham wrote:
> Hi Karthik,
>
> On 17-07-2026 09:47, Karthik Poosa wrote:
>> Expose curve-point temperature and pwm controls via
>> pwmF_auto_point[P]_temp and pwmF_auto_point[P]_pwm, where
>> F is the fan number and P is the fan curve point number.
>> Each fan curve point has temperature and pwm sysfs.
>>
>> Update Xe hwmon ABI documentation for pwm auto point temperature
>> attributes.
>>
>> v2:
>> - Use xe helpers for dmesg logs.
>> - Update kernel version in Xe hwmon documentation.
>> - Correct debug level of some dmesg logs.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: Codex:gpt-5-4
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  16 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 700 +++++++++++++++++-
>>   2 files changed, 715 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index effc7d38ce1f..68cc6b99e8a5 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -341,3 +341,19 @@ Description:   RW. Fan control mode selector.
>>                  user table control and value 2 to use firmware 
>> default behavior.
>>                    Only supported for particular Intel Xe graphics 
>> platforms.
>> +
>> +What: 
>> /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_temp
> Is there a way to get the number of max available points ? If it is 
> not always 10 then user should be informed about it in the doc.

Currently Xe supports exactly 10 fan curve points, which is also the 
maximum supported by the hardware.

Therefore there is no separate attribute to query the number of 
available points.

Support for fewer than 10 points may be added in future versions.

In that case, users can determine the effective number of points by 
reading the curve entries: a point with both |temp| and |pwm| set to 
zero indicates that the previous entry is the last valid curve point.

There is currently no standard hwmon/sysfs attribute that exposes the 
fan curve point count, so the driver cannot report it through a 
dedicated interface.

>> +Date:          June 2026
>> +KernelVersion: 7.2
>> +Contact:       intel-xe@lists.freedesktop.org
>> +Description:   RW. Temperature in millidegree Celsius for each fan 
>> curve point.
>> +
>> +               Only supported for particular Intel Xe graphics 
>> platforms.
>> +
>> +What: 
>> /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_pwm
> same as above.
same as above
>> +Date:          June 2026
>> +KernelVersion: 7.2
>> +Contact:       intel-xe@lists.freedesktop.org
>> +Description:   RW. PWM duty value (0..255) for each fan curve point.
>> +
>> +               Only supported for particular Intel Xe graphics 
>> platforms.
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index fa9dbadd5fd6..a3ed139ad446 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -173,6 +173,10 @@ struct xe_hwmon_fan_info {
>>               /** @speed: fan speed in percentage */
>>               u8 speed;
>>           } fcp[MAX_FAN_CONTROL_POINTS];
>> +        /** @last_point_temp_valid: last user temperature point was 
>> written */
>> +        bool last_point_temp_valid;
>> +        /** @last_point_speed_valid: last user PWM point was written */
>> +        bool last_point_speed_valid;
>>       } fan_table[FAN_TABLE_MAX];
>>           /** @max_rps: maximum fan RPS */
>>           u32 max_rps;
>> @@ -779,8 +783,11 @@ static const struct attribute_group 
>> hwmon_attrgroup = {
>>       .is_visible = xe_hwmon_attributes_visible,
>>   };
>>   +static const struct attribute_group hwmon_curve_attrgroup;
>> +
>>   static const struct attribute_group *hwmon_groups[] = {
>>       &hwmon_attrgroup,
>> +    &hwmon_curve_attrgroup,
>>       NULL
>>   };
>>   @@ -945,7 +952,7 @@ static int xe_hwmon_get_num_fans(const struct 
>> xe_hwmon *hwmon, u32 *num_fans)
>>   }
>>     static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, 
>> u8 fan, u32 *point_count,
>> -                    int table_type)
>> +                    enum fan_table_type table_type)
>>   {
>>       int ret;
>>   @@ -960,6 +967,16 @@ static int xe_hwmon_get_fan_point_count(struct 
>> xe_hwmon *hwmon, u8 fan, u32 *poi
>>           return ret;
>>       }
>>   +    xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
>> +           (table_type == USER_FAN_TABLE) ? "user" : "stock", 
>> *point_count);
>> +
>> +    if (*point_count > MAX_FAN_CONTROL_POINTS) {
>> +        xe_err(hwmon->xe, "fan %d %s point count %u exceeds max 
>> %u\n", fan,
>> +               (table_type == USER_FAN_TABLE) ? "user" : "stock", 
>> *point_count,
>> +               MAX_FAN_CONTROL_POINTS);
>> +        return -EINVAL;
>> +    }
>> +
>>       xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
>>              (table_type == USER_FAN_TABLE) ? "user" : "stock", 
>> *point_count);
>>   @@ -985,6 +1002,60 @@ static int 
>> xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u8 poin
>>       return ret;
>>   }
>>   +static int xe_hwmon_commit_user_fan_table(struct xe_hwmon *hwmon, 
>> u8 fan)
>> +{
>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    u32 point_count = 
>> fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
>> +    int point;
>> +    int ret;
>> +
>> +    if (!point_count)
>> +        return -ENODATA;
>> +
>> +    for (point = 0; point < point_count; point++) {
>> +        u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
>> +        u8 speed = fi->fan_table[USER_FAN_TABLE].fcp[point].speed;
>> +
>> +        /* Ensure fan control points are strictly increasing order */
>> +        if (point > 0) {
>> +            u8 prev_temp = fi->fan_table[USER_FAN_TABLE].fcp[point - 
>> 1].temp;
>> +            u8 prev_speed = fi->fan_table[USER_FAN_TABLE].fcp[point 
>> - 1].speed;
>> +
>> +            if (temp < prev_temp || speed < prev_speed) {
>> +                drm_dbg(&hwmon->xe->drm,
>> +                    "fan %d invalid user point previous value > 
>> current %d: %u/%u prev=%u/%u\n",
>> +                    fan, point, temp, speed, prev_temp, prev_speed);
>> +                return -EINVAL;
>> +            }
>> +        }
>> +
>> +        drm_dbg(&hwmon->xe->drm,
>> +            "committing fan %d user point %d temp %u, speed %u %%\n",
>> +            fan, point, temp, speed);
>> +        ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, 
>> speed);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    drm_dbg(&hwmon->xe->drm,
>> +        "committing fan %d user table with %d points\n", fan, 
>> point_count);
>> +    ret = xe_pcode_write_timeout(root_tile, 
>> PCODE_MBOX(FAN_SPEED_CONTROL,
>> + FSC_WRITE_NUM_FAN_CONTROL_POINTS,
>> +                               fan),
>> +                     point_count, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +    if (ret) {
>> +        drm_dbg(&hwmon->xe->drm,
>> +            "failed to update fan %d user table count, ret=%d\n", 
>> fan, ret);
>> +        return ret;
>> +    }
>> +
>> +    fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
>> +    fi->is_full_speed = false;
>> +
>> +    return 0;
>> +}
>> +
>>   static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, 
>> u8 fan,
>>                           bool is_full_speed, enum fan_table_type 
>> table_source)
>>   {
>> @@ -1105,6 +1176,633 @@ static int xe_hwmon_set_user_fan_pwm(struct 
>> xe_hwmon *hwmon, u8 fan, u8 pwm)
>>       return 0;
>>   }
>>   +#define XE_CURVE_IDX(fan, point)    (((fan) << 8) | (point))
>> +#define XE_CURVE_FAN(idx)        ((u8)(((idx) >> 8) & 0xff))
>> +#define XE_CURVE_POINT(idx)        ((u8)((idx) & 0xff))
>> +
>> +static int
>> +xe_hwmon_decode_curve_index(u32 index, u8 *fan, u8 *point)
>> +{
>> +    u8 local_fan = XE_CURVE_FAN(index);
>> +    u8 local_point = XE_CURVE_POINT(index);
>> +
>> +    if (local_fan >= FAN_MAX || local_point >= MAX_FAN_CONTROL_POINTS)
>> +        return -EINVAL;
>> +
>> +    *fan = local_fan;
>> +    *point = local_point;
>> +
>> +    return 0;
>> +}
>> +
>> +static inline enum fan_table_type 
>> xe_hwmon_get_active_fan_table(struct xe_hwmon *hwmon, u8 fan)
>> +{
>> +    if (hwmon->fi[fan].pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
>> +        return STOCK_FAN_TABLE;
>> +    else
>> +        return USER_FAN_TABLE;
>> +}
>> +
>> +static ssize_t
>> +xe_hwmon_pwm_auto_point_temp_show(struct device *dev,
>> +                  struct device_attribute *attr, char *buf)
>> +{
>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    struct xe_hwmon_fan_info *fi;
>> +    u32 point_count;
>> +    u8 fan;
>> +    u8 point;
>> +    u8 temp;
>> +    int ret;
>> +    enum fan_table_type active_table;
>> +
>> +    ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
>> +    if (ret)
>> +        return ret;
>> +
>> +    fi = &hwmon->fi[fan];
>> +    active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
>> +
>> +    guard(xe_pm_runtime)(hwmon->xe);
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    fi = &hwmon->fi[fan];
>> +
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> active_table);
>> +    if (ret)
>> +        goto unlock;
>> +
>> +    if (point >= point_count) {
>> +        ret = -EINVAL;
>> +        goto unlock;
>> +    }
>> +
>> +    temp = fi->fan_table[active_table].fcp[point].temp;
>> +    ret = sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);
>> +
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static int xe_hwmon_update_user_fan_point(struct xe_hwmon *hwmon, u8 
>> fan, u32 point,
>> +                      u32 point_count, u8 temp, u8 pwm)
>> +{
>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +    int ret;
>> +
>> +    if (temp) {
>> +        fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
>> +        if (point == (point_count - 1))
>> + fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = true;
>> +    } else {
>> +        fi->fan_table[USER_FAN_TABLE].fcp[point].speed = pwm;
>> +        if (point == (point_count - 1))
>> + fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = true;
>> +    }
>> +
>> +    /* Cache intermediate points and commit once the last point 
>> arrives. */
>> +    if (point == (point_count - 1) &&
>> +        fi->fan_table[USER_FAN_TABLE].last_point_temp_valid &&
>> + fi->fan_table[USER_FAN_TABLE].last_point_speed_valid) {
>> +        ret = xe_hwmon_commit_user_fan_table(hwmon, fan);
>> +        if (ret)
>> +            return ret;
>> +        fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = false;
>> +        fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = false;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int xe_hwmon_get_u8_from_sysfs(long val, bool is_temp, u8 *out)
>> +{
>> +    long hw_val;
>> +
>> +    if (is_temp)
>> +        hw_val = DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
>> +    else
>> +        hw_val = DIV_ROUND_CLOSEST(val * 100, U8_MAX);
>> +
>> +    if (hw_val < 0 || hw_val > U8_MAX)
>> +        return -EINVAL;
>> +
>> +    *out = hw_val;
>> +
>> +    return 0;
>> +}
>> +
>> +static ssize_t
>> +xe_hwmon_pwm_auto_point_temp_store(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   const char *buf, size_t count)
>> +{
>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    struct xe_hwmon_fan_info *fi;
>> +    u8 fan;
>> +    u8 point;
>> +    u32 point_count;
>> +    u8 temp;
>> +    long val;
>> +    int ret;
>> +
>> +    ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
>> +    if (ret)
>> +        return ret;
>> +
>> +    fi = &hwmon->fi[fan];
>> +
>> +    if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
>> +        drm_err(&hwmon->xe->drm,
>> +            "pwm%d_enable not in manual mode; cannot update temp 
>> point %d\n",
>> +            fan, point);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = kstrtol(buf, 10, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = xe_hwmon_get_u8_from_sysfs(val, true, &temp);
>> +    if (ret)
>> +        return ret;
>> +
>> +    guard(xe_pm_runtime)(hwmon->xe);
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> USER_FAN_TABLE);
>> +    if (ret)
>> +        goto unlock;
>> +
>> +    if (point >= point_count) {
>> +        ret = -EINVAL;
>> +        goto unlock;
>> +    }
>> +
>> +    drm_dbg(&hwmon->xe->drm,
>> +        "updating fan %d point %d temp to %u, pwm %u\n", fan, point,
>> +        temp, fi->fan_table[USER_FAN_TABLE].fcp[point].speed);
>> +    ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, 
>> point_count, temp, 0);
>> +
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    return ret ? ret : count;
>> +}
>> +
>> +static ssize_t
>> +xe_hwmon_pwm_auto_point_pwm_show(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 char *buf)
>> +{
>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    struct xe_hwmon_fan_info *fi;
>> +    u8 fan;
>> +    u8 point;
>> +    u32 point_count;
>> +    int ret;
>> +    enum fan_table_type active_table;
>> +
>> +    ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
>> +    if (ret)
>> +        return ret;
>> +
>> +    fi = &hwmon->fi[fan];
>> +    active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
>> +
>> +    guard(xe_pm_runtime)(hwmon->xe);
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> active_table);
>> +    if (ret)
>> +        goto unlock;
>> +
>> +    if (point >= point_count) {
>> +        ret = -EINVAL;
>> +        goto unlock;
>> +    }
>> +
>> +    ret = sysfs_emit(buf, "%u\n",
>> + DIV_ROUND_CLOSEST(fi->fan_table[active_table].fcp[point].speed * 
>> U8_MAX,
>> +                       100));
>> +
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static ssize_t
>> +xe_hwmon_pwm_auto_point_pwm_store(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  const char *buf, size_t count)
>> +{
>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    struct xe_hwmon_fan_info *fi;
>> +    u32 point_count;
>> +    long val;
>> +    u8 point;
>> +    u8 fan;
>> +    u8 pwm;
>> +    int ret;
>> +
>> +    ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
>> +    if (ret)
>> +        return ret;
>> +
>> +    fi = &hwmon->fi[fan];
>> +
>> +    if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
>> +        drm_err(&hwmon->xe->drm,
>> +            "pwm%d_enable is not in manual user mode, cannot update 
>> pwm point %d\n",
>> +            fan, point);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = kstrtol(buf, 10, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = xe_hwmon_get_u8_from_sysfs(val, false, &pwm);
>> +    if (ret)
>> +        return ret;
>> +
>> +    guard(xe_pm_runtime)(hwmon->xe);
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> USER_FAN_TABLE);
>> +    if (ret)
>> +        goto unlock;
>> +
>> +    if (point >= point_count) {
>> +        ret = -EINVAL;
>> +        goto unlock;
>> +    }
>> +
>> +    pwm = max_t(u8, pwm, fi->min_pwm);
>> +
>> +    drm_dbg(&hwmon->xe->drm, "updating fan %d point %d pwm to %u\n",
>> +        fan, point, pwm);
>> +    ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, 
>> point_count, 0, pwm);
>> +
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    return ret ? ret : count;
>> +}
>> +
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 0));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 0));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 1));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 1));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 2));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 2));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 3));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 3));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 4));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 4));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 5));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 5));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 6));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 6));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 7));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 7));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 8));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 8));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 9));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 9));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 0));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 0));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 1));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 1));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 2));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 2));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 3));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 3));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 4));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 4));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 5));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 5));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 6));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 6));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 7));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 7));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 8));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 8));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 9));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 9));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 0));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 0));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 1));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 1));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 2));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 2));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 3));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 3));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 4));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 4));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 5));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 5));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 6));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 6));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 7));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 7));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 8));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 8));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 9));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 9));
>> +
>> +static struct attribute *hwmon_curve_attributes[] = {
>> +    &sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point5_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point6_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point7_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point8_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point9_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point10_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point3_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point4_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point5_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point6_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point7_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point8_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point9_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point10_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point3_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point4_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point5_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point6_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point7_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point8_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point9_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point10_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point3_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point4_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point5_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point6_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point7_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point8_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point9_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point10_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point1_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point2_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point3_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point4_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point5_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point6_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point7_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point8_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point9_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point10_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point2_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point3_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point4_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point5_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point6_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point7_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point8_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point9_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point10_pwm.dev_attr.attr,
>> +    NULL
>> +};
>> +
>> +static umode_t xe_hwmon_curve_attributes_visible(struct kobject *kobj,
>> +                         struct attribute *attr, int index)
>> +{
>> +    struct device *dev = kobj_to_dev(kobj);
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +
>> +    /* Temp/PWM pairs for each point. */
>> +    u32 attrs_per_fan = 2 * MAX_FAN_CONTROL_POINTS;
>> +    u32 fan = index / attrs_per_fan;
>> +    u32 local = index % attrs_per_fan;
>> +    u32 point_count;
>> +
>> +    if (!hwmon->xe->info.has_fan_control)
>> +        return 0;
>> +
>> +    if (fan >= hwmon->num_fans)
>> +        return 0;
>> +
>> +    point_count = 
>> max(hwmon->fi[fan].fan_table[USER_FAN_TABLE].fan_control_point_count,
>> + hwmon->fi[fan].fan_table[STOCK_FAN_TABLE].fan_control_point_count);
>> +
>> +    if (!point_count)
>> +        return 0;
>> +
>> +    if (local < MAX_FAN_CONTROL_POINTS)
>> +        return (local + 1) <= point_count ? attr->mode : 0;
>> +
>> +    if (local < (2 * MAX_FAN_CONTROL_POINTS))
>> +        return (local - MAX_FAN_CONTROL_POINTS + 1) <= point_count ?
>> +            attr->mode : 0;
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct attribute_group hwmon_curve_attrgroup = {
>> +    .attrs = hwmon_curve_attributes,
>> +    .is_visible = xe_hwmon_curve_attributes_visible,
>> +};
>> +
>>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>>   {
>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
