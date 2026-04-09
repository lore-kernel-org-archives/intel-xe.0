Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539ABE98FD2
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 09:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03D589798;
	Thu,  9 Apr 2026 09:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCaef5lg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD1889798
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775728696; x=1807264696;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3ixPW8HBZzz36r7RLBh3YRqEyc39eURFwU/06tDxm8M=;
 b=PCaef5lgYTKov/BOthZqEjCmquOiGw58yJqgCDn9249QMknU1eNQGDHT
 QsfnQY2W1lbhVk1t3hsS4b4bVshF7EPbwO7z0uZvuKBsenhd18BxSNu0e
 +fRX79sBiORD9i5V8LVPvZ1f1gDejdPJKUDPywvsLy2xtXoCbeBNGEQaZ
 Ym04BcX6gRLZQMRPscAcCFUcH0gnXiuDQGg/gu/6E3ya82GFXBmHFVnQI
 QN1xpHNNl90cTZAe/vV5DDXBNfpFVX5CCxDdh2n+jnFMmK4FWDH+cnu9J
 SMCTCm4wefeZmyMgezNyuRQpObEHrAM+GHq4bR7WYHZ1G/w35jIz0/RXg A==;
X-CSE-ConnectionGUID: jCc9wt7ITl6KbZqT+EXjBw==
X-CSE-MsgGUID: EaRfGXjqQaeH/Cpiyu/ujw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87805220"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="87805220"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 02:58:16 -0700
X-CSE-ConnectionGUID: 2TYSuqcaQlGAGs3uCnnETA==
X-CSE-MsgGUID: P3W7lFsiQleyHHH8s/eoKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="228655646"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 02:58:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 02:58:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 02:58:14 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 02:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPaB+Ogo+JTbRCh3uL0S/fgzpq7DB5i8jAdmcWhpS6jxvquh3/+Zng/XFk9AZsl+K5E5LWYsRLOaakgteCXmdpBwX16ianDs44hp0Znq3AabkBBemSuZDUh1YSp+gv750+jHH7KcfO0RjVZ2AifipcDTgBhcazLVNZiVaXZORDEwCPTFxcwR1N+ZyNF7WqfY2QgiWLehUpqP2bpUYYzFw0fzRWsPj1IPvT4cEZXkUNcthBHp+YxG/prDXIntLuJio+vIGg6ztCT9Ui+DNBUjgPC8NfWKFDZhLYQ9quhqjTzI/yojsdK0+yrZPo4Bga2aGrVva9RrYh9XBwpmjigxDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OojbpjSns1oGKFlE3X/GaQQoHjCdlJtPy/YjFwuhZ3s=;
 b=YAO2mJicrFjfadUStV+tUvMBtGhQINAZ1/2dL+VJpEThbPTshRDPn50KTXumov/DcnhcVr+KM1enc8Gey1KMzGZHUzZXr8qGZHFUFFbW4n22UcaY+ysmIerldzxtq/eCMrcdHLn4/jVQch+4sadieDUkcP1nvTlOsqYBLHKTl4gU/dS2LUc+3aCArFtJ9UpxbzBnno9YV24t2sCr4jSPuHHzk/78UszTTaOjHzICFECWvEO4xUxTFprH6VDP8aEVEjMg4AuUTDbpVyZj5+NhBdFiReqXAo+9OwqmAdEs5PAf1t1QNy+s29S4hYAxsFBNqSvwSW+CbAlojpn05WvVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB6915.namprd11.prod.outlook.com (2603:10b6:930:59::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.20; Thu, 9 Apr 2026 09:58:06 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 09:58:06 +0000
Message-ID: <97656e61-41ad-46eb-aace-d5d6050b32e3@intel.com>
Date: Thu, 9 Apr 2026 15:27:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/xe/sysctrl: Add system controller event support
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260407110629.198158-1-raag.jadav@intel.com>
 <20260407110629.198158-3-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260407110629.198158-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9997b2-ba84-4be1-356a-08de961e7f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: rGA01TJr3lCtCmnShCnsqdANIB8TUPujqhutftUuQ3k1mubM8BC8/8zZZ6dEzfwqsD+z3DfWygGVCIkIZQRoa5X6z5/D6xqa/1qaQ0p3XhvBJ3xM6FOo1ZCnvr3mXMBxhd3ymqT6rFA2OmqgEEEXDbkaDcvKlcLcaFC6ElE8r6MUD/nPbzEV3GSr3WGMcB/jtY/+TOFr07W82mXUjqQrsOyn2euFYaUtFwJkWD4vaSyIg3n8vyxlR2Ddl1+lHhuke+TRo8CEmwCqlpHkJ8EpIQbJl9oZb3Re4vKidF3g9zT0B/4X03NpuVp2cNKrml1OpGflEeHR9I5LbnLaYvl9svtLFD24oaCPS8wuh62OiAZAmCPMkG/VWZTRtLoHpAaVCe6Px2Mxv161IRAOLeal30Y/u0zRRed32GnVWv1RPuQC16CwWV9ybZ5VGMEtk91ASp5xz5KmlMG76P5/wZ8xZP+N0dZC38tV/E2JXtI28uUpFMGgYjXZiNBQzWkq8Uho/GxEGxqR3pIq4L+AtNM97izF7gUOqOytxQNB2YN5EiK9U40rgkLU7teHG9/PlVMHhDSnRQ2WR6eamwHZElNjxu/hdgiMf659ihbkkZMQ5fVjB/thEeu50WqEZ5cZokpqPd55xxNy+zVWJxiz6HnjqJZezmoWPDmpuzKkwcsifLKFB8frvs3iaC4N9BQxOvsQLieQHlYSsEAlKQC/ezY5pAkP4VKfafeDIsblcNyByvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q254cVlUb3VmczZuQUZlQnljeTFSRlVwQ1hMd2xmcytkeFVrR1dST3NoTDVv?=
 =?utf-8?B?UVFhUXNWRlUxTjF4dEVsWUdaRDNRVWZ2TXErRW9SaTdydW44cy8vbCsweDFV?=
 =?utf-8?B?T0R4R1BJdW1BSjRTaSsrbTVJcnJqYnhGQ2ZxaXc1OVcyWWt0WnArVDVsamhV?=
 =?utf-8?B?blc0QzJUa2ZzR3l1NGdJM0dleGc1UHV1VFh3VlUwbnN4NGZNOUs0eER4ck1M?=
 =?utf-8?B?eFloMHZJOHRlcXJTODNnTWZOaDRKSHN3bFJWYTFkWkNGTGV3YWp0WmpOc3FI?=
 =?utf-8?B?TkRSdkFER2lPNFhhWitvY2tDL0lxTnZYNGN6dlI1M0wyVTRiTm9LWC90UUFS?=
 =?utf-8?B?R0ZVQVJyUmpML3VpVmhweW9oRWtlMVpnZWZPdkJTL3I2OVljVlBMYk83cVZU?=
 =?utf-8?B?YkMxVE43NVU0NEZQMVo5MnVnOXdxOXNVaUx2M0dsOUdjKzhybzZzUnRUc0hO?=
 =?utf-8?B?QlJnZGpYNVU0Y1ZSZE1TWGl1dWowWi8xQkhEOUhMTUovbHlkZFR5YU5IaW9V?=
 =?utf-8?B?SXF2Mzc4eVB5ekhQZGoxNlJuSFB5aUxjSGxubFVOSGU4VFJKbFNLR2c1UzlL?=
 =?utf-8?B?b0h2YWRHb1MrRnBqOS9QcmhsSG94UWtmYU0yVGlRemVkMW83L09saG4xYXhx?=
 =?utf-8?B?RWZOelFnM0JaRWtjWEN5OUZLL3lwZXEyQmFnQ1Vyby9LU1JCcWtOQXVHSTMz?=
 =?utf-8?B?VGpmRkI0OWhUKy9OZFVzT0hPZlFhNFdrTDRKL2VhMkd2VXRwdjRvc0RSbjA0?=
 =?utf-8?B?RjRmbEY4TU1OcUp5enJ2NEU2a1JRcGRSYTllMW1mY2dIZW5BZGptbGY1ckRz?=
 =?utf-8?B?VG51Z2pSanpVK1hjSWsrdC8zYVd5VkQ0TC9UUDl4cDBoM21vS21JazRrOVk4?=
 =?utf-8?B?dTAwb3cxTzlQWmVFNFhBNDhJRlBXSnJ1MkpPY29PUWx5aFArQ1pYTHRnZXdE?=
 =?utf-8?B?SjFnYTJxUVBDeU5LaE1ROTVkZGxoZUp1VVRpa2ZtWkVmOE5LTEJHTWJWNkE1?=
 =?utf-8?B?UWtTcXUxbUNySWM2MUM3bGx1ekZYcmZIWkU5WEF0V3RyRkg5NE43V2NFYjRx?=
 =?utf-8?B?VVJvZmhBUVh4ZnpiYUxCRFFodWhZRHpjOVlmczZ2dlRXRUNSWEt3ZjUrTkl2?=
 =?utf-8?B?SU8yNXQ0aWRpenlNSWJyUTVycGNQc1JLdFJEZXEvNUhUYm1JOEh6UXZtR29k?=
 =?utf-8?B?SGZjZWtDWEhkSWVpSDNlcjVOMk9tdkxZeW1nQVlkRldvS0lCelFPK2ZJcnVj?=
 =?utf-8?B?bkh0YmtFdFpRRzl2N0hmTWdUeFJxbFlrdTRaTEwxSmFJQWo2RjZnY3FPM0sw?=
 =?utf-8?B?M3lFYmowbFhkQjFucHh3bjBib043QW8rbjBEOUtNVFBWR0pCVzR3VXhDVG50?=
 =?utf-8?B?cGY3VWFVV1Nsc2c2YzROQ2NybHdiSGtHK1NqdisvbjNFYk9Zemt2REhDS3Ni?=
 =?utf-8?B?TCtaZDZucTJMTUprVE9wbmtVVEgwck0zTkJrbHBWRk4vNjBlZ251dVdPNUJS?=
 =?utf-8?B?ZnRhRVBQbmRaWWRpSnA0MnFSUXUrdHFINlBMN1RhYUJqQlFGdEhoc1J2SS9s?=
 =?utf-8?B?bXhheWhwQy9SaFlITWhDSnc4NENrY1lzdXF3MytJZVVFUjU1enlIWjV6MlJT?=
 =?utf-8?B?a2xGdnozV1BMOHZQWXZKK0hUVm5vSDVIaFBrUVRvSlFFTGg2TEl1MlRlK2dQ?=
 =?utf-8?B?MWFXRDZWeVExTVFXdlJDaUw2U1pkQjFSOUtoUm1ORHB2NTdyV1p2MXB3dVFI?=
 =?utf-8?B?UTJzWUZtUUhLNDIxaVdXKzZvSWprZTF4dzVxZlNBTThDRUNSVExmWVpKb3JC?=
 =?utf-8?B?eTN3R0MvVkhzaDkzOFh5L2owNWxsWjFZNTBydXhrV0JVWTlsYUVpbnc3S3BH?=
 =?utf-8?B?Zm9wVTRoa05PaWJzeFF3MTN6dnFac1dVY1JVeUY1WkVka0FuOHBmc1JicFlt?=
 =?utf-8?B?MU5zS3RPSmJPK3pIblNhSC9ONGxGc2lLK1QrSkhuckNxYXFPS0FGYVlrRnRl?=
 =?utf-8?B?bEJiaXRkaytPUGhaVXIyMHgrdVFWVUgrWXN4NjF5YUs5WERnQ2c1ZlJWUlpQ?=
 =?utf-8?B?QkNZMzlCV21JVjFDMWpLM2ZqY2pwMWJQN2hvZzV4bnZSNU1iak5hbS95bG5q?=
 =?utf-8?B?OHJVeWU1S2J1Z0MyNFRqUXA3NVBtc3ZwTDFlRkRUZmtzSUM4UDJ4Rm1xbjRm?=
 =?utf-8?B?WmdrQm94Q0VyK05jK2J4LzBLZ3pUbktYSWh2cWhidXJOYUx5bGpnKzRqU0c1?=
 =?utf-8?B?RWc3czhTbTJlYzJsWVNKdFp3a3BTMXdSZFNOYUFjbzZLekRtQ1lnM0RQMVRz?=
 =?utf-8?B?eklXYmJvUS8wcG9QMHprbHNMQzd1dXk2Rm5HdHFqNzFORkRuU2xtZz09?=
X-Exchange-RoutingPolicyChecked: ueJy9dgKAE5HKoFUIh0st4jtLq5zAFnttYHjJjF9Me7P+S66z24Ytehe/4U08qCNCsIue1HyfMxObrcYTRSpEj+BHtS5EEyPT+fYjBZTqgORFODgTbU9PIATykE5KRHrfNUv4PhzXin2nSZZn9pMLAumuWySMQEmQwAd94jXu73JzsTao/rZN+mTxGkcpdsrrDcGNNTOcFwmDURnwpbRi7MqzR5KTvqY4rdL2vWhusL8ipn9n6JdrtyGPV/COnuvcbSH2Tgkt1GwhurIAtG2N6Dv2fMfKEm5tFQRnuWXHVEvlrwlZ5l7rjgzI8ORRYutvAhBRJQGG5hoFol6GRey1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9997b2-ba84-4be1-356a-08de961e7f7a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:58:06.6710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVLhiZONLuqtIbOrxPPrsUzt7Nh8/29k34pb6DvRRrPAimAiLPIBe2Q8SrL8zOPjKZKtzMSOizP50BBPvv1CDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
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


On 4/7/2026 4:36 PM, Raag Jadav wrote:
> System controller reports different types of events to GFX endpoint for
> different usecases, add initial support for them. This will be further
> extended to service those usecases.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: Handle unexpected response length (Mallesh)
> v3: Handle event flood (Mallesh)
> ---
>   drivers/gpu/drm/xe/Makefile                 |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl.c             |  7 ++
>   drivers/gpu/drm/xe/xe_sysctrl.h             |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_event.c       | 88 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event_types.h | 52 ++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h     | 10 +++
>   6 files changed, 159 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index ab1e0b3b332d..c0e820eeea30 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -125,6 +125,7 @@ xe-y += xe_bb.o \
>   	xe_survivability_mode.o \
>   	xe_sync.o \
>   	xe_sysctrl.o \
> +	xe_sysctrl_event.o \
>   	xe_sysctrl_mailbox.o \
>   	xe_tile.o \
>   	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index afa9654668a2..7003b1da6e46 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -12,6 +12,7 @@
>   #include "regs/xe_sysctrl_regs.h"
>   #include "xe_device.h"
>   #include "xe_mmio.h"
> +#include "xe_pm.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_mailbox.h"
> @@ -39,6 +40,12 @@ static void sysctrl_fini(void *arg)
>   
>   static void xe_sysctrl_work(struct work_struct *work)
>   {
> +	struct xe_sysctrl *sc = container_of(work, struct xe_sysctrl, work);
> +	struct xe_device *xe = sc_to_xe(sc);
> +
> +	guard(xe_pm_runtime)(xe);
> +	guard(mutex)(&sc->work_lock);
> +	xe_sysctrl_event(sc);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index f7469bfc9324..090dffb6d55f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -16,6 +16,7 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   	return container_of(sc, struct xe_device, sc);
>   }
>   
> +void xe_sysctrl_event(struct xe_sysctrl *sc);
>   int xe_sysctrl_init(struct xe_device *xe);
>   void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>   void xe_sysctrl_pm_resume(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> new file mode 100644
> index 000000000000..8a2e44f4f5e0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_device.h"
> +#include "xe_irq.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
> +					 struct xe_sysctrl_mailbox_command *command)
static functions don't need a xe prefix
> +{
> +	struct xe_sysctrl_event_response response;
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 count = 0;
> +	size_t len;
> +	int ret;
> +
> +	command->data_out = &response;
> +	command->data_out_len = sizeof(response);
Can be part of prepare command
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret = xe_sysctrl_send_command(sc, command, &len);
> +		if (ret) {
> +			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
> +			return;
> +		}
> +
> +		if (len != sizeof(response)) {
> +			xe_err(xe, "sysctrl: unexpected pending event response length %zu\n", len);
> +			return;
> +		}
> +
> +		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
> +			xe_warn(xe, "[RAS]: counter threshold crossed\n");
> +		} else {
> +			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
> +			return;

Should we return here  if the event is not threshold_crossed.
The events left might still be valid.
If more event types are added, this might be an issue. Can't we just log 
the unknown event and go ahead?

> +		}
> +
> +		if (++count > XE_SYSCTRL_EVENT_FLOOD) {
Can't the first response count be used as a reference for comparison?
Looks like the response count keeps decrementing for each command sent.

Also add a comment for the response.count behavior in the structure

> +			xe_err(xe, "sysctrl: event flooding\n");
> +			return;
> +		}
> +
> +		xe_dbg(xe, "sysctrl: %u events pending\n", response.count);
> +	} while (response.count);
> +}
> +
> +static void xe_sysctrl_event_request_prep(struct xe_device *xe,
> +					  struct xe_sysctrl_app_msg_hdr *header,
> +					  struct xe_sysctrl_event_request *request)
static functions don't need a xe_ prefix
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	header->data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		       REG_FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_PENDING_EVENT);
> +
> +	request->vector = xe_device_has_msix(xe) ? XE_IRQ_DEFAULT_MSIX : 0;
> +	request->fn = PCI_FUNC(pdev->devfn);
> +}
> +
> +/**
> + * xe_sysctrl_event() - Handler for System Controller events
> + * @sc: System Controller instance
> + *
> + * Handle events generated by System Controller.
> + */
> +void xe_sysctrl_event(struct xe_sysctrl *sc)
> +{
> +	struct xe_sysctrl_mailbox_command command = {};
> +	struct xe_sysctrl_event_request request = {};
> +	struct xe_sysctrl_app_msg_hdr header = {};
> +
> +	xe_sysctrl_event_request_prep(sc_to_xe(sc), &header, &request);
> +
> +	command.header = header;
> +	command.data_in = &request;
> +	command.data_in_len = sizeof(request);
> +
> +	xe_sysctrl_get_pending_event(sc, &command);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> new file mode 100644
> index 000000000000..9a26ad758a0b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_EVENT_TYPES_H_
> +#define _XE_SYSCTRL_EVENT_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_SYSCTRL_EVENT_DATA_LEN		59
> +
> +/* Modify as needed */
> +#define XE_SYSCTRL_EVENT_FLOOD			16
> +
> +enum xe_sysctrl_event {
> +	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED = 1,

Nit: 0x01

Add a one line comment

> +};
> +
> +/**
> + * struct xe_sysctrl_event_request - Request structure for pending event
> + */
> +struct xe_sysctrl_event_request {
> +	/** @vector: MSI-X vector that was triggered */
> +	u32 vector;
> +	/** @fn: Function index (0-7) of PCIe device */
> +	u32 fn:8;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:24;
> +	/** @reserved2: Reserved for future use */
> +	u32 reserved2[2];
> +} __packed;
> +
> +/**
> + * struct xe_sysctrl_event_response - Response structure for pending event
> + */
> +struct xe_sysctrl_event_response {
> +	/** @count: Number of pending events */
> +	u32 count;
> +	/** @event: Pending event */
> +	enum xe_sysctrl_event event;
> +	/** @timestamp: Timestamp of most recent event */
> +	u64 timestamp;
> +	/** @extended: Event has extended payload */
> +	u32 extended:1;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:31;
> +	/** @data: Generic event data */
> +	u32 data[XE_SYSCTRL_EVENT_DATA_LEN];
> +} __packed;
> +
> +#endif /* _XE_SYSCTRL_EVENT_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index 91460be9e22c..d59a825597d3 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -23,6 +23,16 @@ struct xe_sysctrl_mailbox_command;
>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>   	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>   
> +/* Command groups */
> +enum xe_sysctrl_group {
> +	XE_SYSCTRL_GROUP_GFSP			= 0x01,
> +};
> +
> +/* Commands supported by GFSP group */
> +enum xe_sysctrl_gfsp_cmd {
> +	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +};
Move the enums to types.h along with structures.
Also had a one-line documentation for each

Thanks
Riana
> +
>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>   			    struct xe_sysctrl_mailbox_command *cmd,
