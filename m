Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8747ED597AA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 22:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A5310E113;
	Tue, 12 Nov 2024 22:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kef7JlDK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3AE10E113
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 22:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731450442; x=1762986442;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=D3LCPyPNW4b8EHu9kG7cYkQZBzCF7yD9YXJRbc5WoFY=;
 b=Kef7JlDK+HUDhpSm3ByVjrdNhPJunweUAlnsJPL1XnQgm2uyVAWtbwFK
 YWVNsx16T+9D0/2OZzRSF+HHNxjYz8pzjXZihdShuqL20V+k2LiVKaB3W
 /+oaBnIVZoQKGSun5ShegbexzAhW/vpCBlrsnCsGl5ydBDi72PR24ctjP
 lQ5LCwqDNZMB+A65kjYDcgh962LvW/+efj0FoL2lYXaRHpduIMh00crGq
 jZNOGtNNn6jRU1c9ClZ8CeQsX1WT/br1uwpr8Zz1liX2VPsUDPp3fQcFb
 dlL25OiVzVmXnfd0O6hoDS2YupDrtPBLBocLslC+De2rnXplz3MnN2FLi w==;
X-CSE-ConnectionGUID: 9eqasTP9RUyttzZqqdqyQw==
X-CSE-MsgGUID: s5HmT4t+RpmptdNDj0nRTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35104459"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="35104459"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:27:22 -0800
X-CSE-ConnectionGUID: GTwwmk2bQ3+uViYNXqTPcw==
X-CSE-MsgGUID: 5Rv8PkohRHC0xJe66OABeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="87570922"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 14:27:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 14:27:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 14:27:21 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 14:27:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f62crbR/XhqxI/7E0mH3jG8wJvNV6Wv0oDu51cK5NLXVXSSIGIwGsNG7JFiXhDfuR9/axSzR6zUuFQY3RGs8B0+idXysL0CG3ytq49iPtZeUw+kivZRL0ALSGWc0fNDktETSQuKz7c1Z+eMpVV5SrBhJCmlLdvf3I2wSZX2aIXePMsTbXiJtT/zsfDB++VGDlz36QOrLZYqENzNER6mFEk2cD9fsBYApQdB5QZflresi/XzdPb6xEGpSk7czF0Lcpbz3fucsu5CJGlwlTHOdNfNGDHHy8dYc62Hr2b2vHlzrtNoKuV6UNJMR0m8MWOA50pid7ZEX6ezVIRvKV5G/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNLQR83YcIpJpifHyTQgsG4sLl2MEZ9qPxs4yMf81e4=;
 b=zPbxXJh/puypXVxAe0J1NpSwypx7yu9zoMyb7mg6vmR28BKRj0Oc4SeJaeXSroOOei846VoC2ND42dOTS3H4RbxWZmdChltLeqFXMEjAG5R3MzKOofo1PMDES+iP5IEfftjLS2y5EK5lVKTF8vZLRd67zqU/uFeYyJxngTRIgY8QwYRLzVEZXANOadZBzsbswSGKVf/J3MlBKQardhJ2Wgq/4Bo0rMMw3G+BRrr0cl1P/RJ8nu7yjc2W8/ADazMQpF8x3ibLH/qGYUyb8+9gW/sOXa12zk2PBP5UC7EZjXbwFRIA3XRxndvOV5CEXl5dTa/C2n3m68c+zuOG1dTt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 22:27:12 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 22:27:12 +0000
Message-ID: <cbfa2181-3ac3-40ff-802f-1ff918c9a01a@intel.com>
Date: Tue, 12 Nov 2024 14:27:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] drm/xe/pxp: add PXP PM support
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-11-daniele.ceraolospurio@intel.com>
 <32b467d1-a668-4ec9-a987-1f92c3c5b23e@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <32b467d1-a668-4ec9-a987-1f92c3c5b23e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: c58f9bcd-dcfb-428a-12bc-08dd03692762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWVLTUxzalNXNk1PYlNvMS9hUEhxWE40cTZsQ2RKbkFqbitxbVk4R3VBM3JV?=
 =?utf-8?B?ci9rN3ZEZm1VdmNjR2dUNmEvT0NHdjl6Y05FVDQwUEJHSkM0aUdmRzRxWFR4?=
 =?utf-8?B?ckpMK0s4NHNpY1R4M3ZRZmRwaDVmWkxwUllNeE50NEt1NnFleTNpVTVUZ3VC?=
 =?utf-8?B?ZnNYblpyeVI4QzV6VXBydUszQnNVQTJvZDRBZ1JkSmRFUW5vMGptUlhhcTFJ?=
 =?utf-8?B?dDUwdTBtUmUwWERNcFFUcE1HeDNmT2gzUDcram1wblgxQzNSc2Fsd2NyTHVN?=
 =?utf-8?B?alEvY05hb21qZGJjSzhDdjNDNnplUUIrK2hMVCtrdXhFYkh5ZkpvSWtlRlpC?=
 =?utf-8?B?eGd0NXFrVkd3eDQ3S1g1aWQxMWQ1VjdWUWc4ekZtRHRBa1ZRREJwY2ZocWpI?=
 =?utf-8?B?OW56RFE5MmZuZHBZUlBtYmE4V1hMRVJqcHVTRDQyNEJvSHh2MGIzWHN2RjlO?=
 =?utf-8?B?M2padW5WOW1XbzNSVE9meCtVMkp4L2RGbjkrNmVYcmt1N0JYM2NMbDVnNGNK?=
 =?utf-8?B?UUVyL0xwbWtGUGw4ek9KdHZSMVdNNU1QYWNJZW11cm0ybHFlV0tTSWZYSG01?=
 =?utf-8?B?WTRnSmt4T2dxS1BXLy9EL3JVUjVXM3BYVFpHUmtwNFQyUG9WVTNRb0krYW1D?=
 =?utf-8?B?SCtLL3FUbHFqWW4zRXgxUEtWNGFKTGRjbzBLY3psZzdFdDFYa2Y0dG01bklj?=
 =?utf-8?B?cTFWTGNMaytrdE5XQTlJdTBOSStoSHh5OWZvYzNtN1FmVU1jU0NKdTNEOG9n?=
 =?utf-8?B?bFBNZm11RVBFNWZ6OWpCeUZ2T0YzNzN3MlBGdTViME1Xc3QxUnliUTVSeVlv?=
 =?utf-8?B?WDdDOGNOVGd4WkhyRTdGdFVuTjFRclVxTk9ZbDM5VkFaKzZOaFBzMG5sT0Rh?=
 =?utf-8?B?ZzdYVWxQeHIrUHFSN2hRRDNKb1hnZVlXTktOZ3dEYTAvY1NQQjVQN2FHRUVi?=
 =?utf-8?B?WlFYOXZ4WExXR3RGc3dvN1dGWjI1dHVaY003VnB2MldIUjN5bEwwbEtGeG8x?=
 =?utf-8?B?a2YxS1hvWkpPU2Y0TjhUZUFKRFI1REkyVUowOEpWVno2YVphUTVGQmNacVJC?=
 =?utf-8?B?b2k0aTh3cmtFNVZKVW1URnNXQ2tXelRiM2tuZVZlQWp5dlVrakQySU56MzBY?=
 =?utf-8?B?M0NlNmxvZDVwMlRGVEppOG0rSU0yN0ZxQWdKYXlkUVZhaVhtNitmZ21yVFNW?=
 =?utf-8?B?OWQxbHowWmVNQWZmVlZWYXlteTZkaVJxTHdwNTF0OTZxSDI2Z2xMeTZRWVhz?=
 =?utf-8?B?akh5REF4cGZkOThKMlFGRFpKUUl4UkNRNCtMRVE2bHZtd2FXdUVubzR0Tkpw?=
 =?utf-8?B?aDRWbUdUam5WUGkyU2J0dG8rUmdLL1JacWw1K0g4MFdKVmlkOFBvTVA2bjYx?=
 =?utf-8?B?YWVyc2JwS0xLaFpJcFJrYWhsbVpqSlAyVlJ1V24vVTlBbTZNOUtpbVVvVUhQ?=
 =?utf-8?B?TFVOcFBHK1NNOFN6a1hGdWVNdjBYc0ZuTEFzT0tTNm9iSnJoU3BrRnlHZ2VY?=
 =?utf-8?B?eCtjQVZvV1RYbUNCcTh2L1Y1c0dvUHZpZzd5RENCNFBVSUtHc3hINU5LaVlp?=
 =?utf-8?B?ZkQvNTNYTktyRmNmcUFMb3pDTmRlRGJzOWRFODg3WGNLM0NDalE2MGVlVW9O?=
 =?utf-8?B?YlcvSzBoRHIzUmhxdGgxTjdxVjlSOVdhb1VUbEt4NHg1WDI3NUVUNXQ4bWUr?=
 =?utf-8?B?dFhJdkNhNHh4bWxyaHJRYWs3RGl3WWZWQThvUWxualVJM1ZwWlNUYXlKekUw?=
 =?utf-8?Q?UzreYtKyiaMkOBNuqKuLehLAhDVylx94nXTs+I+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXQxMW5MZ0Y3Q1JaMjF5UG1qdjNxamdzdllhZDYva1dYYmNkOEhoaHhERHpP?=
 =?utf-8?B?M200bWorVjU5V3ovbjNUcHFIdEIzazNRN2NWMUh5VWRzc2FCd1FsdnprMVJw?=
 =?utf-8?B?OFRJUjdaR0dtbldZbndocmdVa3VmczZBUnFNUEMzaWNSK3hUQXpoSzZPYlNM?=
 =?utf-8?B?Z0JmZnc2VlZINEg4UUJrV2owZHdhNkdlOWljaXRib1FMQUJiaWczSnFueVpD?=
 =?utf-8?B?azB4eFdSa0EwcTVSN2pzaXpyenVxVHFBTW1rS00rbUJ2ZTU1Y1JwazBESXp1?=
 =?utf-8?B?V3RzVGQxdlh5c3JybzhBTG41TElRZ3NlUlYxZWxxZE5IUXFDTFVNc3VLampN?=
 =?utf-8?B?RHkyc3l2YmwrNWVXZ0lJS0Q4V2dzOXJCNDJuQzcxZlpkZmp4Y3BDQUFpQis5?=
 =?utf-8?B?TjBpOSs1Z0FXa2t0YWY4eFVZWGpFUXkzeHNmYVh4MnI5a01ZV2RJUnBscDJW?=
 =?utf-8?B?WmkremlKL0hRMWRmeVRwSm1IcEFZQXdRUTRaK3dYY1crbER5Y3gwSWs3MzN3?=
 =?utf-8?B?cWIvMk8xTGY0ck9SSlhvdHJqcUFOZ0d3VGJNUzkwSW9jRTF0KzI1WG9KWTd5?=
 =?utf-8?B?UGE5Y21ycksybUZsdVc4Z2MwT1pXUytoL2R2Kzd4QWN5cWRTVkJIUlpoWUMx?=
 =?utf-8?B?U1JxYzhNMzErb2M1WExlWWNKWEN4c0JkK2FIZGxkNUlMV0VCdGoyTDNESXVT?=
 =?utf-8?B?eFNuc2JycFdLNHgvSVgrcHp3STJGSWhJU1BvdUp5NzZxWWJCR3RNZDlWQjNm?=
 =?utf-8?B?Vlh4YTRUNU13bEdOdHI1cis4OVJVeGhDQ0VPUERFZ1NxSFV0NTZCQjdrVkNX?=
 =?utf-8?B?WG1Xb1ppZVdTWHMzYW8rM3JsU2ZsS3BBUEdMNjNNY0N1SXBJa3BOajY0OTdW?=
 =?utf-8?B?VDRnWEpNWGZYT3Brc0FlSkpiMjBCYnM0eWFUbzdLaDUvTUU5S2JXbFhVajYx?=
 =?utf-8?B?bUd6V1NpcTJub0ZYRmV0SEVCZ1N4ZnFOQ3FFU01hSytJeURPWWQ4WEVwSzNr?=
 =?utf-8?B?bkJzNlQ2THR1TDhJb1NmKzh0U3J4SjdJR3ExY0xyMzJubkVRT2w4amlRUGN3?=
 =?utf-8?B?b2NSbkpNVzI3Sld6TTQwckJmdndmcHpDYWJrWk55UzlJTngzWkw2YWV4TzRu?=
 =?utf-8?B?M3l1TlVtU3dDSGNzamVJMXhqazFxNjgwY1dsZUxXRjRBUm15WE1mYVBZNk4y?=
 =?utf-8?B?RldPanh5Q3Mramd4aXkwU2JRak5taHpiSFpmM0g3N3pZMStKblVCOG1JZE0x?=
 =?utf-8?B?ZEtMZEJ0S2NPTmpnSmdMei9VRzQrRDNyNXBsdDdJaGZaZGtpN202U1NteFVp?=
 =?utf-8?B?YmtBcUwxQWgwblIvbyt6bGtYMjk3bE1CZWp3MERIUFlDK3pWVTVVV2tPODdU?=
 =?utf-8?B?aFlwSEZKYjV0V3VMQ1VZV1E1TlhjSGhqWEk1WTAzeVFWVUZGUk53aTJsT0s0?=
 =?utf-8?B?YWVXeHFPWDFpVEo5OFZUVXJvZit3aUorZTh1R2txVVRaTkF2MmQxWmZ6UGdX?=
 =?utf-8?B?ZVhVc3AwMjZHWTNoNTVSdEdUZ3ZSSTdFcHNhTXZsNmsxZTA0OEZCSnFyNnFn?=
 =?utf-8?B?ZkFrcnJzNHptSE5vVWE5dW1ZZm9acUc4WkZuVDhRYlNxendqREVudE01Q2l5?=
 =?utf-8?B?ME5UWXEwSmpSRkg2V05NcGJhQlkvZUpzWlIreXdxSlIvYTFxamFpLzEvNm01?=
 =?utf-8?B?VkV3ajBvNWpOakRYd3ZmWksxeG0vRTB5Q0wxLzhLYWN0TVArdFFCYjE3dFdF?=
 =?utf-8?B?NUhmd0ZLRkU3V1BIdWtkU0ZrMWhqUVFNQUNjWHhhQUNvRFpSb01ocThpUnVP?=
 =?utf-8?B?bFFiVTFJYnJEQ0pSSDBtaU9HTEpGcVBlMC9pcUt3YmNQa0tLZDVjaFRReVVN?=
 =?utf-8?B?Y1crbHRSVGVZdXRvOERWVzFudHZOZUtheDhRbjZJMmpxN1FoTzNsbnVEK2tI?=
 =?utf-8?B?N1ZpREN0SVFMbkxyVXBvT0E0dGZ6T2ozMGFsMmJ0M2xkNVgrTmFHQ3FGcTRs?=
 =?utf-8?B?dWFSa050NlBhdlJVczFUblJlemQ0dFBwandGZHg0blRaRzExUElCZUlDZTZO?=
 =?utf-8?B?UWR3MVg5MzJnQ3AwdjBXVFN1WHhpa0k0VFRxb2F3bjhEZER4c3lYSTRVSWt1?=
 =?utf-8?B?S3R2WnpFd2p4L3hEMWpENUZrZkdEVjU4a3YrcU5xRjE1WnIxYTBlcHVlVG9s?=
 =?utf-8?Q?HIiSVsO46Y/e+7CAW65Tw0o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c58f9bcd-dcfb-428a-12bc-08dd03692762
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 22:27:12.5466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsdpmLRkC8uxHn/NcD6J3aPk0ca/ftedL+41G4JZTBO0mApUTyqxAas+F4wBmr5rZ9rTjm7Pjz0MYPJSg2Q/iuQEiemEH5HoLk4kpWlT5m0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7181
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


On 10/8/24 18:12, John Harrison wrote:
> On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
>> The HW suspend flow kills all PXP HWDRM sessions, so if there was any
>> PXP activity before the suspend we need to trigger a full termination on
>> suspend.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pm.c        | 42 +++++++++++---
>>   drivers/gpu/drm/xe/xe_pxp.c       | 92 ++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pxp.h       |  3 +
>>   drivers/gpu/drm/xe/xe_pxp_types.h |  9 ++-
>>   4 files changed, 134 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 9f3c14fd9f33..1e1f87ec03a2 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -20,6 +20,7 @@
>>   #include "xe_guc.h"
>>   #include "xe_irq.h"
>>   #include "xe_pcode.h"
>> +#include "xe_pxp.h"
>>   #include "xe_trace.h"
>>   #include "xe_wa.h"
>>   @@ -90,22 +91,24 @@ int xe_pm_suspend(struct xe_device *xe)
>>       drm_dbg(&xe->drm, "Suspending device\n");
>>       trace_xe_pm_suspend(xe, __builtin_return_address(0));
>>   +    err = xe_pxp_pm_suspend(xe->pxp);
>> +    if (err)
>> +        goto err;
>> +
>>       for_each_gt(gt, xe, id)
>>           xe_gt_suspend_prepare(gt);
>>         /* FIXME: Super racey... */
>>       err = xe_bo_evict_all(xe);
>>       if (err)
>> -        goto err;
>> +        goto err_pxp;
>>         xe_display_pm_suspend(xe, false);
>>         for_each_gt(gt, xe, id) {
>>           err = xe_gt_suspend(gt);
>> -        if (err) {
>> -            xe_display_pm_resume(xe, false);
>> -            goto err;
>> -        }
>> +        if (err)
>> +            goto err_display;
>>       }
>>         xe_irq_suspend(xe);
>> @@ -114,6 +117,11 @@ int xe_pm_suspend(struct xe_device *xe)
>>         drm_dbg(&xe->drm, "Device suspended\n");
>>       return 0;
>> +
>> +err_display:
>> +    xe_display_pm_resume(xe, false);
>> +err_pxp:
>> +    xe_pxp_pm_resume(xe->pxp);
>>   err:
>>       drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
>>       return err;
>> @@ -163,6 +171,8 @@ int xe_pm_resume(struct xe_device *xe)
>>       if (err)
>>           goto err;
>>   +    xe_pxp_pm_resume(xe->pxp);
>> +
>>       drm_dbg(&xe->drm, "Device resumed\n");
>>       return 0;
>>   err:
>> @@ -356,6 +366,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>        */
>>       lock_map_acquire(&xe_pm_runtime_lockdep_map);
>>   +    err = xe_pxp_pm_suspend(xe->pxp);
>> +    if (err)
>> +        goto out;
>> +
>>       /*
>>        * Applying lock for entire list op as xe_ttm_bo_destroy and 
>> xe_bo_move_notify
>>        * also checks and delets bo entry from user fault list.
>> @@ -369,23 +383,30 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>       if (xe->d3cold.allowed) {
>>           err = xe_bo_evict_all(xe);
>>           if (err)
>> -            goto out;
>> +            goto out_pxp;
>>           xe_display_pm_suspend(xe, true);
>>       }
>>         for_each_gt(gt, xe, id) {
>>           err = xe_gt_suspend(gt);
>>           if (err)
>> -            goto out;
>> +            goto out_display;
>>       }
>>         xe_irq_suspend(xe);
>>         if (xe->d3cold.allowed)
>>           xe_display_pm_suspend_late(xe);
>> +
>> +    lock_map_release(&xe_pm_runtime_lockdep_map);
>> +    xe_pm_write_callback_task(xe, NULL);
>> +    return 0;
>> +
>> +out_display:
>> +    xe_display_pm_resume(xe, true);
>> +out_pxp:
>> +    xe_pxp_pm_resume(xe->pxp);
>>   out:
>> -    if (err)
>> -        xe_display_pm_resume(xe, true);
>>       lock_map_release(&xe_pm_runtime_lockdep_map);
>>       xe_pm_write_callback_task(xe, NULL);
>>       return err;
>> @@ -436,6 +457,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>           if (err)
>>               goto out;
>>       }
>> +
>> +    xe_pxp_pm_resume(xe->pxp);
>> +
>>   out:
>>       lock_map_release(&xe_pm_runtime_lockdep_map);
>>       xe_pm_write_callback_task(xe, NULL);
>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>> index 640e62d1d5d7..78373cbbe0d4 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>> @@ -137,6 +137,13 @@ static void pxp_terminate(struct xe_pxp *pxp)
>>       if (pxp->status == XE_PXP_ACTIVE)
>>           pxp->key_instance++;
>>   +    /*
>> +     * we'll mark the status as needing termination on resume, so no 
>> need to
>> +     * emit a termination now.
>> +     */
>> +    if (pxp->status == XE_PXP_SUSPENDED)
>> +        return;
>> +
>>       /*
>>        * If we have a termination already in progress, we need to 
>> wait for
>>        * it to complete before queueing another one. We update the state
>> @@ -181,17 +188,19 @@ static void pxp_terminate(struct xe_pxp *pxp)
>>   static void pxp_terminate_complete(struct xe_pxp *pxp)
>>   {
>>       /*
>> -     * We expect PXP to be in one of 2 states when we get here:
>> +     * We expect PXP to be in one of 3 states when we get here:
>>        * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event 
>> was
>>        * requested and it is now completing, so we're ready to start.
>>        * - XE_PXP_NEEDS_TERMINATION: a second termination was 
>> requested while
>>        * the first one was still being processed; we don't update the 
>> state
>>        * in this case so the pxp_start code will automatically issue 
>> that
>>        * second termination.
>> +     * - XE_PXP_SUSPENDED: PXP is now suspended, so we defer 
>> everything to
>> +     * when we come back on resume.
>>        */
>>       if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS)
>>           pxp->status = XE_PXP_READY_TO_START;
>> -    else if (pxp->status != XE_PXP_NEEDS_TERMINATION)
>> +    else if (pxp->status != XE_PXP_NEEDS_TERMINATION && pxp->status 
>> != XE_PXP_SUSPENDED)
>>           drm_err(&pxp->xe->drm,
>>               "PXP termination complete while status was %u\n",
>>               pxp->status);
>> @@ -505,6 +514,7 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, 
>> struct xe_exec_queue *q)
>>           pxp_terminate(pxp);
>>           mutex_unlock(&pxp->mutex);
>>           goto wait_for_termination;
>> +    case XE_PXP_SUSPENDED:
>>       default:
>>           drm_err(&pxp->xe->drm, "unexpected state during PXP start: 
>> %u", pxp->status);
>>           ret = -EIO;
>> @@ -648,3 +658,81 @@ int xe_pxp_key_check(struct xe_pxp *pxp, struct 
>> xe_bo *bo)
>>       return 0;
>>   }
>>   +int xe_pxp_pm_suspend(struct xe_pxp *pxp)
>> +{
>> +    int ret = 0;
>> +
>> +    if (!xe_pxp_is_enabled(pxp))
>> +        return 0;
>> +
>> +    mutex_lock(&pxp->mutex);
>> +
>> +    /* if the termination is already in progress, no need to re-emit 
>> it */
>> +    if (!completion_done(&pxp->termination))
>> +        goto mark_suspended;
>> +
>> +    switch (pxp->status) {
>> +    case XE_PXP_ERROR:
>> +    case XE_PXP_READY_TO_START:
>> +    case XE_PXP_SUSPENDED:
>> +        /* nothing to cleanup */
>> +        break;
>> +    case XE_PXP_NEEDS_TERMINATION:
>> +        /* If PXP was never used we can skip the cleanup */
>> +        if (pxp->key_instance == pxp->last_suspend_key_instance)
> Again, there is the possibility of this being confused by key_instance 
> roll over.


I don't believe it is possible for it to actually roll over even if the 
system was never rebooted in its lifetime.

Daniele


>
>> +            break;
>> +        fallthrough;
>> +    case XE_PXP_ACTIVE:
>> +        pxp_terminate(pxp);
>> +        break;
>> +    default:
>> +        drm_err(&pxp->xe->drm, "unexpected state during PXP suspend: 
>> %u",
>> +            pxp->status);
>> +        ret = -EIO;
>> +        goto out;
>> +    }
>> +
>> +mark_suspended:
>> +    /*
>> +     * We set this even if we were in error state, hoping the 
>> suspend clears
>> +     * the error. Worse case we fail again and go in error state again.
>> +     */
>> +    pxp->status = XE_PXP_SUSPENDED;
>> +
>> +    mutex_unlock(&pxp->mutex);
>> +
>> +    /*
>> +     * if there is a termination in progress, wait for it.
>> +     * We need to wait outside the lock because the completion is 
>> done from
>> +     * within the lock
>> +     */
>> +    if (!wait_for_completion_timeout(&pxp->termination,
>> + msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
>> +        ret = -ETIMEDOUT;
>> +
>> +    pxp->last_suspend_key_instance = pxp->key_instance;
>> +
>> +out:
>> +    return ret;
>> +}
>> +
>> +void xe_pxp_pm_resume(struct xe_pxp *pxp)
>> +{
>> +    int err;
>> +
>> +    if (!xe_pxp_is_enabled(pxp))
>> +        return;
>> +
>> +    err = kcr_pxp_enable(pxp);
>> +
>> +    mutex_lock(&pxp->mutex);
>> +
>> +    xe_assert(pxp->xe, pxp->status == XE_PXP_SUSPENDED);
>> +
>> +    if (err)
>> +        pxp->status = XE_PXP_ERROR;
>> +    else
>> +        pxp->status = XE_PXP_NEEDS_TERMINATION;
>> +
>> +    mutex_unlock(&pxp->mutex);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
>> index 2d22a6e6ab27..af32c2616641 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp.h
>> +++ b/drivers/gpu/drm/xe/xe_pxp.h
>> @@ -20,6 +20,9 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>>   int xe_pxp_init(struct xe_device *xe);
>>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>>   +int xe_pxp_pm_suspend(struct xe_pxp *pxp);
>> +void xe_pxp_pm_resume(struct xe_pxp *pxp);
>> +
>>   int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct 
>> xe_exec_queue *q, u8 type);
>>   int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue 
>> *q);
>>   void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct 
>> xe_exec_queue *q);
>> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h 
>> b/drivers/gpu/drm/xe/xe_pxp_types.h
>> index 1bb747837f86..942f2fa40a58 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
>> @@ -24,7 +24,8 @@ enum xe_pxp_status {
>>       XE_PXP_NEEDS_TERMINATION = 0, /* starting status */
>>       XE_PXP_TERMINATION_IN_PROGRESS,
>>       XE_PXP_READY_TO_START,
>> -    XE_PXP_ACTIVE
>> +    XE_PXP_ACTIVE,
> You can add a trailing comma even on the last enum value to avoid such 
> unnecessary deltas.
>
> John.
>
>> +    XE_PXP_SUSPENDED
>>   };
>>     /**
>> @@ -111,6 +112,12 @@ struct xe_pxp {
>>         /** @key_instance: keep track of the current iteration of the 
>> PXP key */
>>       u32 key_instance;
>> +    /**
>> +     * @last_suspend_key_instance: value of key_instance at the last
>> +     * suspend. Used to check if any PXP session has been created 
>> between
>> +     * suspend cycles.
>> +     */
>> +    u32 last_suspend_key_instance;
>>   };
>>     #endif /* __XE_PXP_TYPES_H__ */
>
