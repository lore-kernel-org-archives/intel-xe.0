Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B8FC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 07:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882CC10E59D;
	Tue, 16 Jul 2024 07:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwAm6jqA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218F410E59E
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 07:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721115257; x=1752651257;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PsP/QxpwnZLBvMYZgiyX7yIAHTjF02GKPikFtrFltnE=;
 b=fwAm6jqAmx/7GP3WIpLqmrMbvWDGx7SOxnNZ6ubyJJvnC6scNCHOFimd
 vn1VEHU71Qp4dMSmTLYEPTEg737qBzpoalFy8siMnZDGeIo0E6FAaiXiR
 f0ZM/Zwalzwte1+/hAa1XBygCoOW9kWSdXtD4A1z370xfyOrY4OC24rjR
 J2yA+H4km19BQDU+vjrF2ufC4b6kDdOil+Gw9J50ErNQCWPScbkZ8oO52
 Z3MO2wHS6co/GG/KjMvEMwJoFYuOHKZ9mvY47RuUwij8cG2MCejFd9ebY
 g9PMccW2fFVUzmk0XTdr3DKjIY0pRFV5Hv0x2nyIzU00PN5lCS7Avvf3l g==;
X-CSE-ConnectionGUID: OsLKbmD6Tyap7sED+xG49A==
X-CSE-MsgGUID: 6onCnSG2QKStAMBiUT6Cjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29921214"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="29921214"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 00:34:16 -0700
X-CSE-ConnectionGUID: x652j5EpT7SDqcqM5Ppu3g==
X-CSE-MsgGUID: IJSrhBgQSCWCFdESZG4gGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="50664804"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 00:34:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 00:34:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 00:34:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 00:34:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCl3c3+y+xOGVS5njDdkJP+i5u6F0mcHpeThj8zHCDNLaLz5Z2uk5oPcvbDmdRqT30LzTUz5tYgGXMH7eqLO9pjEVaNXCcmluLS0HjZv3a01znrZnHeLgk7NhMJp3BW2EfY/GBTT359zZuysi6YTIWkRSa67G8/p3k1XeRLge58H/4e1aiE0OmDkqk/qjNpYfMrkM2xUqXCCh518GQiUvMDMPnwRvU46XA9YHmCP0JJcnzgqZRI+UBGBTzq6MMWNhUT4j/PDcb0Js6fT2ZJMShxxxXtUEcpRDu9wzB+1Ite6hIaiCiorEOo02xWJ70KIfckDeuRuUoAdM1hhF1lqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xX0xq5CcDiQyu1vLKeMH8rJxmIvUFB7Mlccq9HrBJeQ=;
 b=QuMWMYiz72Lt/T5IMMMPmqh6Q5Juq2Vw+MP0Wm+uGUIhFCQqxxNJLi0Ypby/gu2gsnBtlqlGEVUoViYUvMQDUCXFX6B2/EWXmLETb+Q6M4p9nTIxW9uw7SdXaIPdVMRJeWUs+87+SayDjfqpNyv190WIthKQx5OuUJPo8ozAzOSci0KhrgSRs/zNhT06QWXnb3qv+pXuQYLouSby1XC9/oCgwF53eyVxK+vl011cTJZj7PR7pFjo5XS2d4mZhWeT0mHdm/02wLpSa0WaNBfTE/wj9+hWGOBQ+e9cG0J3XzgfJ2BKryUC6g65yUjBVrxRoxA4Ys3hSw9Hr56MLwqc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.27; Tue, 16 Jul 2024 07:34:13 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 07:34:12 +0000
Message-ID: <5420d010-0c10-48c5-95e1-3cad91ae5e78@intel.com>
Date: Tue, 16 Jul 2024 13:04:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: remove GuC reload in D3Hot path
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <daniele.ceraolospurio@intel.com>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20240704061203.3464835-1-riana.tauro@intel.com>
 <20240704061203.3464835-3-riana.tauro@intel.com> <ZpBVL6swLx_ht6lw@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZpBVL6swLx_ht6lw@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 4591192f-71ca-463b-aa96-08dca569b011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUFMSHhQbUJad1pDYTlBaldQeXZBcWVUVkpkMnd3bms1bjcvWEpmNDZ1Qm1I?=
 =?utf-8?B?MHZEVWp2aHBVVDhGZlpxbTVuS2JNU29BcVZ0Zy95NTNPb0NVU3pRdDlzbDB1?=
 =?utf-8?B?eTI5TlRBbDF1ejlQYUlzWTE3T09PNUdsNFk2V3hwdHFNSFNML2sxalBrZmtY?=
 =?utf-8?B?TjVyTkpsbXNYZ2k5bUY2ZGRZRXZYT2FXbUo0VlVwbWZjcnpGREJuZ240U1dL?=
 =?utf-8?B?ME5FQjg4ZHJHNGoyaTdPMVpqUXc0QkdQOWdIOW9MYzdkeGl1bjJGekV1cStj?=
 =?utf-8?B?Qzh0bVEzVXMvcjBLQlM0WTY3VUNRU2toSGd6YTZFdk11czRTQ0o0WktEZmZv?=
 =?utf-8?B?YTR0WDVUcWh3a2VSSlh4L01KM1YxRGIzWlg1dmx5OHdqV0hxTVl3UUdHallK?=
 =?utf-8?B?dG5YOERMYlVJdW1NTzg0U3JoRDNhQURNRSs0c1JxZXdpMC9YdmxwYUp6T1Jt?=
 =?utf-8?B?dE0wMzR3dC9ENHI4cjA2YUlWNXlzSG90YzZMWlhPOGt5SjZ0emhSSUM4cWpG?=
 =?utf-8?B?QVM4NXhJWEFia0ZHT0lpc0pOa1E2N2JSVHBkNXJ4R0J1R2l6bk1KbVNYdWdX?=
 =?utf-8?B?WExadVUxbWlNMk1WYlFpYVpBTHpvVGROUDZ3OGdNb3d1WlFUWlFtWkE3WEp6?=
 =?utf-8?B?bW93dVJRVjhnaDhxVXpnOXFKaUg4UE5RSjZKWVZKWi8yS0toZ0x3SkRlb3JG?=
 =?utf-8?B?SnRBL3poYmZtU0F5VEYxOUNiM3lnc2ZjQ2NIWVFqWDRua281TXNnaWl6aG1G?=
 =?utf-8?B?UmZzaWs3a2NuWHRkRy9PYTNDZDU2YjJZWWc3RnAyUU1CUkd1ZzJNeWVRV05s?=
 =?utf-8?B?QjlVRUZkVGdORU80NkR0dFBLZGVsWSs4a2FqN3hOazFBdld6bUVMZU5kano3?=
 =?utf-8?B?MUNZK3R2L3FGcEZHYTM0OXZMV2MxbFNINk1aMy8weVhKS01mMWdKUEdFaW0z?=
 =?utf-8?B?aDdOdmJDRC9MOE1nU2RkaWpZQnYyd25zWDdubHRRNm1yU0ZEbnVKdW4zY3Vo?=
 =?utf-8?B?cTRaT2tkbG1idTBsb1UvRm5kYU5ubGJiR0pJK0lYaTR6a2R3azRzbTh5OFFt?=
 =?utf-8?B?MlFpVTYwRjdyZEpoL2hxR0JBcGZWK1RjV0h6MUdpUTdpUThHUE1pTlRPWENP?=
 =?utf-8?B?WkNhTzdDNG5sb0JsQlpPdkFUZlUyemJFZ2FkVWx3VEQ1Qm5rMFYyTTBIeWRU?=
 =?utf-8?B?U3kyQTBmRFk1UlhDcmcwMS9rMWNHQytGemtnV0ZrNFdGV0QzNm9FRHF3UGdS?=
 =?utf-8?B?R0tNT2xuTFNrMGgraTFFR0Z1VStzQUFlc2RUMzFhVnpsZEMyaDVWSzJYMzBv?=
 =?utf-8?B?MVRvdTZlRTNkam5INjIyQzJObVBaN0JzNFU0UjhSWlc3UEdwMXJwZEVGbEli?=
 =?utf-8?B?Z0xuSDlrczF4WTJKbHpNWU44OUJEeTcrS21Ha0RyVFVZc0lnNjZZbEZGMnky?=
 =?utf-8?B?TTZ4V2k4cW96QmhhZk8xMW1Na3h6eUUwTThUVk1BY1BxbHg5bTVYWnJnNkND?=
 =?utf-8?B?ME93SlMyVG1kQzFhZDBnTUVNY241MFdwQmhjS2xqZkF0SE5LemVUNkg1ZGtO?=
 =?utf-8?B?aEQvMTJ0Yy8vcmZ6RzYySm44ZE5rVGZDcHNqS2JIdG5ZeTlENXZtN3MxTCsr?=
 =?utf-8?B?QW52UkJRM3dPM0crOGkycXQ0YUFSeFZqNk1ScEtEdHUxYjFFdGpBbDVuWTdB?=
 =?utf-8?B?cm5vblVNdlljamxoUXhDWWZPNi9JYzAyODJqSVRCditkQTNkR1htdGpxN2Zk?=
 =?utf-8?B?R1F3cXhvQVoyQXp4dVNCUGtvQUtndFRqSDAwbmRTNlhxcUlWcHpzM2RxQVdx?=
 =?utf-8?B?aytoOUkwNUxHZTRKVFI4UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnYrSU91bXM2MlRBeitvSmRMWVBRenlkcGFRTkdtdmtwNGRhVXY1dG82L1Zy?=
 =?utf-8?B?UjFXdkZCdFdWYnpUV2x1Mk9FNW9wOEcrT1NWbkJ0M1ZZU04zL2JEYjZtN0F3?=
 =?utf-8?B?ci9KNWtqU3FRYyt4WGExSGxjK0Ntd2U3b2JkSGxGMlp1WHJjYmxaRHlad1l5?=
 =?utf-8?B?VG9HRnd4NStzelpoajJuTVgrd1dHQ1Y3TkZZYWZrRTlLYnMxUFFZSTY5VkdV?=
 =?utf-8?B?bXlpUXBYQ2h3QWFwcksyNnRZcksyU0FYOXQyZXNQbXd3R01yQXRRU3RodHA2?=
 =?utf-8?B?TmFCSDdSWk56OTNoNFdpb1crRFVYZGkrdlVPdEt2R0pZdDBRQVdjWkVBT2Nz?=
 =?utf-8?B?cVlRVkFiZmNFQVZEdVZCMlFIK01LUWU5R1pWdVJseGxrUGNlQ2JUU3Y0ZkxF?=
 =?utf-8?B?TytKbWMzT3VtSTBodVp0RGxzcHExRy9ObVp0bDhmTUFtVXovVnJ4NU5qT3RW?=
 =?utf-8?B?ejIvbVVRbWx5aFBtd3h6bDJDU0pOZHFQVlRRQTJHMWxoMnJDbjdwbitRaEt4?=
 =?utf-8?B?YlVlbHBmaldpbVpIbFZTVW1oNWwyYXpzQ0NKVE5mN2RSbkJEOXR6NkZFSDFp?=
 =?utf-8?B?QTdzU1BFVThkWVZiK1c1alNwSWt1VGF4MGdGOXpOWlp6K3NndXZReVJ6N0VX?=
 =?utf-8?B?KytpdC9JNjdFTmc1Ty9nNW1ERFg2WXZpL2pPeWtqZFdBUHcyeW1NY3g1ei9m?=
 =?utf-8?B?SmJQelZZUzhzaTgraUs0M1lKVEpES0loU2RlRnVkYXNWZlBHZHpOUlJKTGJv?=
 =?utf-8?B?dGJ6YVdvVE93Mm95TnZrSzNzb05uOUZkdG84QWRGU2hLcmV3OE96UEpZeXBF?=
 =?utf-8?B?dUtQczlqNDhmNmlwaFJlSU9QVnFiQ2FROWR5dVFXK0laZFd2Y0tSbkgrVmxR?=
 =?utf-8?B?UWphc3lXbjFCUzJGV2hHdnBadXZGUklBUXp5TjJ2VkJnb3kwUmVwbC9zamRJ?=
 =?utf-8?B?aXMxMi9xQzlpNUJPUGM3N2NJU0hwTVpHbTJMZWFudFE3RzdvTmdZV3paTjBK?=
 =?utf-8?B?dElnbGxuRVhjaDBRUDlRNFU5L3lzaFM0RDhCRVFPN3JBTDJGK3BrNjdKUVRR?=
 =?utf-8?B?LzFQWUNDZzNzclFIZmIrc0hrdWFLc2hHUk92R21RcTlwUkkzSEJqWHRIQitw?=
 =?utf-8?B?Y1NaWm1yMmM0aE9iV0FFMk1oNlNIRWpPa0xVaEY5cllLcEhCcklDWU1yMCs2?=
 =?utf-8?B?L1lwellnMGNzemUxcnVFTzBrTXVybU9OeVRUbEZFUTJ0MURKUzFWUkpGWmJ2?=
 =?utf-8?B?aUw4VXBSZXRESEtWWERLcm03Q1ZTUE50bEk0d2d6T0NKM1dMNktlZDI0MVdT?=
 =?utf-8?B?OGQ2QkN3Q1dBS3ZRVUd0V3NGcldLejhTWlBlY2N3RGRKdVQ1U3BmVTFtVmZX?=
 =?utf-8?B?VlFRckdDR0pYdXB0L3BDdUNwcmlKNU13U1pXNTVocU0vc2Rod28reVRucE1P?=
 =?utf-8?B?WVdWNzR5UUJtcFo3cXl3S1Q0SmhqWkZKOW5DaEU0Ui8yUVBlcU1nRjB0OXNo?=
 =?utf-8?B?MmJyU0h4aWpjaHBDbE81TnNKc1c4cklMajZzZm1SaSt6RmVBMjFITWtMUDN5?=
 =?utf-8?B?dDdCU0pTcllpZmp5enpJZk1ZdVJBUk96NDBhcW56TFZhcUJnaWc1clJKQmJB?=
 =?utf-8?B?ZnpUR1ZDL0FlZ09ZTEJEZCs4ZlRuMkRUU2NwTjlLRXZMY2pqbCsxNUszNnJs?=
 =?utf-8?B?M2dPRFZ1RE5pemNkOXJ6REcwRExwckRCbkZ4MTdtN09FRWtjajhFRVB4YmpY?=
 =?utf-8?B?L0duKzV4TmxjdTArZ2lDTkQrUkttaTh1S1A5QnVzRkpTazFubUFjMGNhM2JL?=
 =?utf-8?B?QjdNRlA2SDExREUxV0M4SFZyMlIxdEZHRjd3OVhueFI2VHhrNG1nejJnZEgw?=
 =?utf-8?B?SXUyQW43czAwZk9WcHpLNUozV2YwVHJHbGFPUGpQTlpnQWp0eGgrakZGRE5a?=
 =?utf-8?B?TU1TOVlyUW5jVFUxUHFyN0w0VnU4NnBYRlY2ajlXWlI2amJmTXZBbVRIS1Nw?=
 =?utf-8?B?Y2tYSk1SREhMK1h0elkvMGE3VCtPOGk0S3pUOEpDaEgydk1heVF1L1l5YnBt?=
 =?utf-8?B?cjB2ZTIvWi83WjNKZndjWC9GYUFmZ3hING9Ma0M0bU9pUWZkZlZpdjByS0lw?=
 =?utf-8?Q?ZR6a/xax08lLGP/2VS08NWVP+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4591192f-71ca-463b-aa96-08dca569b011
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 07:34:12.8055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5akPzZPo2gBdXDey+bifSIf4fxe4qpzlL+ZotbIZYYZY1CDmYSztJkC+UEpkB0Z/HYfIKu6XKuvWE7KCCxAhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
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

Hi Rodrigo

On 7/12/2024 3:27 AM, Rodrigo Vivi wrote:
> On Thu, Jul 04, 2024 at 11:42:03AM +0530, Riana Tauro wrote:
>> Currently GuC is reloaded for both runtime suspend and system suspend.
>> For D3hot <-> D0 transitions no power is lost on suspend and GuC reload
>> is not necessary.
>>
>> Remove GuC reload from D3Hot path and only enable/disable CTB
>> communication.
>>
>> v2: rebase
>>
>> v3: fix commit message
>>      add kernel-doc for gt suspend and resume methods
>>      fix comment
>>      do not split register and enable calls of CT (Michal)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c  | 33 +++++++++++++++---
>>   drivers/gpu/drm/xe/xe_gt.h  |  4 +--
>>   drivers/gpu/drm/xe/xe_guc.c | 69 +++++++++++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_guc.h |  4 ++-
>>   drivers/gpu/drm/xe/xe_pm.c  |  8 ++---
>>   drivers/gpu/drm/xe/xe_uc.c  | 32 +++++++++++++++--
>>   drivers/gpu/drm/xe/xe_uc.h  |  2 ++
>>   7 files changed, 133 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 29e8ea94d05e..4da84e288faa 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -779,8 +779,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>   }
>>   
>> -int xe_gt_suspend(struct xe_gt *gt)
>> +/**
>> + * xe_gt_suspend - Suspend helper for GT
>> + * @gt: the GT object
>> + * @runtime: indicates the type of suspend (runtime - 1 / system - 0)
>> + *
>> + * Returns 0 for success, negative error code otherwise.
> 
> 'Return:' is the right directive for the kernel doc.
Will fix this
> 
>> + */
>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
>>   {
>> +	struct xe_device *xe = gt_to_xe(gt);
>>   	int err;
>>   
>>   	xe_gt_dbg(gt, "suspending\n");
>> @@ -790,7 +798,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_msg;
>>   
>> -	err = xe_uc_suspend(&gt->uc);
>> +	if (runtime && !xe->d3cold.allowed)
>> +		err = xe_uc_runtime_suspend(&gt->uc);
>> +	else
>> +		err = xe_uc_suspend(&gt->uc);
>> +
>>   	if (err)
>>   		goto err_force_wake;
>>   
>> @@ -828,8 +840,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>>   	return ret;
>>   }
>>   
>> -int xe_gt_resume(struct xe_gt *gt)
>> +/**
>> + * xe_gt_resume - Resume helper for GT
>> + * @gt: the GT object
>> + * @runtime: indicates the type of resume (runtime - 1 / system - 0)
>> + *
>> + * Returns 0 for success, negative error code otherwise.
> 
> ditto
> 
>> + */
>> +int xe_gt_resume(struct xe_gt *gt, bool runtime)
>>   {
>> +	struct xe_device *xe = gt_to_xe(gt);
>>   	int err;
>>   
>>   	xe_gt_dbg(gt, "resuming\n");
>> @@ -837,7 +857,12 @@ int xe_gt_resume(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_msg;
>>   
>> -	err = do_gt_restart(gt);
>> +	/* GuC is still alive at D3hot, no need to reload it */
>> +	if (runtime && !xe->d3cold.allowed)
>> +		xe_uc_runtime_resume(&gt->uc);
>> +	else
>> +		err = do_gt_restart(gt);
>> +
>>   	if (err)
>>   		goto err_force_wake;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 1123fdfc4ebc..4c942e4716ad 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -52,8 +52,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>>   void xe_gt_record_user_engines(struct xe_gt *gt);
>>   
>>   void xe_gt_suspend_prepare(struct xe_gt *gt);
>> -int xe_gt_suspend(struct xe_gt *gt);
>> -int xe_gt_resume(struct xe_gt *gt);
>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
>> +int xe_gt_resume(struct xe_gt *gt, bool runtime);
>>   void xe_gt_reset_async(struct xe_gt *gt);
>>   void xe_gt_sanitize(struct xe_gt *gt);
>>   int xe_gt_sanitize_freq(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index eb655cee19f7..6408f9dfe855 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -755,7 +755,7 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_enable_communication(guc);
>> +	ret = xe_guc_enable_communication(guc, true);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -800,7 +800,7 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_enable_communication(guc);
>> +	ret = xe_guc_enable_communication(guc, true);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -854,7 +854,16 @@ static void guc_enable_irq(struct xe_guc *guc)
>>   	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
>>   }
>>   
>> -int xe_guc_enable_communication(struct xe_guc *guc)
>> +/**
>> + * xe_guc_enable_communication - Enable CTB communication with GuC
>> + * @guc: GuC object
>> + * @ctb_register: true to register CTB, false otherwise
>> + *
>> + * Enables GuC CTB Communication and IRQ
>> + *
>> + * Return: 0 on success, negative error code on error.
> 
> negative error otherwise
> 
> (to avoid error error)
Sure. will remove redundant error
> 
>> + */
>> +int xe_guc_enable_communication(struct xe_guc *guc, bool ctb_register)
>>   {
>>   	struct xe_device *xe = guc_to_xe(guc);
>>   	int err;
>> @@ -870,9 +879,13 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>>   		guc_enable_irq(guc);
>>   	}
>>   
>> -	err = xe_guc_ct_enable(&guc->ct);
>> -	if (err)
>> -		return err;
>> +	if (ctb_register) {
>> +		err = xe_guc_ct_enable(&guc->ct);
>> +		if (err)
>> +			return err;
>> +	} else {
>> +		xe_guc_ct_set_state(&guc->ct, XE_GUC_CT_STATE_ENABLED);
> 
> this could be done in a separate patch telling it is a preparation for
> the upcoming case.
> 
> while the first patch in this series could be squashed in this one...

Will split this
> 
>> +	}
>>   
>>   	guc_handle_mmio_msg(guc);
>>   
>> @@ -1101,6 +1114,50 @@ void xe_guc_sanitize(struct xe_guc *guc)
>>   	guc->submission_state.enabled = false;
>>   }
>>   
>> +/**
>> + * xe_guc_runtime_suspend - GuC runtime suspend
>> + * @guc: GuC object
>> + *
>> + * This function waits for any outstanding CTB
>> + * and disables CTB communication before entering
>> + * D3Hot
>> + *
>> + * Return: 0 on success, negative error code on error.
> 
> ditto
> 
Thank you for the review comments. will fix all of the above in next rev

Thanks,
Riana
>> + */
>> +int xe_guc_runtime_suspend(struct xe_guc *guc)
>> +{
>> +	struct xe_guc_ct *ct = &guc->ct;
>> +
>> +	/*
>> +	 * Wait for any outstanding CTB before tearing down communication
>> +	 * with GuC.
>> +	 */
>> +	if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding, (HZ / 5)))
>> +		return -ETIMEDOUT;
>> +
>> +	/* Disable CTB */
>> +	xe_guc_ct_disable(&guc->ct);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_guc_runtime_resume - GuC runtime resume
>> + * @guc: GuC object
>> + *
>> + * This function enables CTB communication
>> + */
>> +void xe_guc_runtime_resume(struct xe_guc *guc)
>> +{
>> +	/*
>> +	 * Power is not lost when resuming from D3Hot,
>> +	 * hence it is not necessary to reload GuC
>> +	 * everytime. Only enable interrupts and
>> +	 * CTB communication during resume
>> +	 */
>> +	xe_guc_enable_communication(guc, false);
>> +}
>> +
>>   int xe_guc_reset_prepare(struct xe_guc *guc)
>>   {
>>   	return xe_guc_submit_reset_prepare(guc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index af59c9545753..9ff87991f2df 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -20,8 +20,10 @@ int xe_guc_post_load_init(struct xe_guc *guc);
>>   int xe_guc_reset(struct xe_guc *guc);
>>   int xe_guc_upload(struct xe_guc *guc);
>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>> -int xe_guc_enable_communication(struct xe_guc *guc);
>> +int xe_guc_enable_communication(struct xe_guc *guc, bool ctb_register);
>>   int xe_guc_suspend(struct xe_guc *guc);
>> +int xe_guc_runtime_suspend(struct xe_guc *guc);
>> +void xe_guc_runtime_resume(struct xe_guc *guc);
>>   void xe_guc_notify(struct xe_guc *guc);
>>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>>   int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index de3b5df65e48..070d28d193c7 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -99,7 +99,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>   	xe_display_pm_suspend(xe, false);
>>   
>>   	for_each_gt(gt, xe, id) {
>> -		err = xe_gt_suspend(gt);
>> +		err = xe_gt_suspend(gt, false);
>>   		if (err) {
>>   			xe_display_pm_resume(xe, false);
>>   			goto err;
>> @@ -154,7 +154,7 @@ int xe_pm_resume(struct xe_device *xe)
>>   	xe_display_pm_resume(xe, false);
>>   
>>   	for_each_gt(gt, xe, id)
>> -		xe_gt_resume(gt);
>> +		xe_gt_resume(gt, false);
>>   
>>   	err = xe_bo_restore_user(xe);
>>   	if (err)
>> @@ -370,7 +370,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>   	}
>>   
>>   	for_each_gt(gt, xe, id) {
>> -		err = xe_gt_suspend(gt);
>> +		err = xe_gt_suspend(gt, true);
>>   		if (err)
>>   			goto out;
>>   	}
>> @@ -423,7 +423,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   	xe_irq_resume(xe);
>>   
>>   	for_each_gt(gt, xe, id)
>> -		xe_gt_resume(gt);
>> +		xe_gt_resume(gt, true);
>>   
>>   	if (xe->d3cold.allowed) {
>>   		xe_display_pm_resume(xe, true);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 0f240534fb72..cbae9bf03baf 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -154,7 +154,7 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>>   	if (err)
>>   		return err;
>>   
>> -	err = xe_guc_enable_communication(&uc->guc);
>> +	err = xe_guc_enable_communication(&uc->guc, true);
>>   	if (err)
>>   		return err;
>>   
>> @@ -194,7 +194,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_enable_communication(&uc->guc);
>> +	ret = xe_guc_enable_communication(&uc->guc, true);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>>   	return xe_guc_suspend(&uc->guc);
>>   }
>>   
>> +/**
>> + * xe_uc_runtime_suspend - uC runtime suspend
>> + * @uc: uC object
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_uc_runtime_suspend(struct xe_uc *uc)
>> +{
>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>> +		return 0;
>> +
>> +	return xe_guc_runtime_suspend(&uc->guc);
>> +}
>> +
>> +/**
>> + * xe_uc_runtime_resume - uC runtime resume
>> + * @uc: uC object
>> + *
>> + * Called while resuming from D3Hot
>> + */
>> +void xe_uc_runtime_resume(struct xe_uc *uc)
>> +{
>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>> +		return;
>> +
>> +	xe_guc_runtime_resume(&uc->guc);
>> +}
>> +
>>   /**
>>    * xe_uc_remove() - Clean up the UC structures before driver removal
>>    * @uc: the UC object
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index 11856f24e6f9..dd483ea43b9b 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
>>   int xe_uc_fini_hw(struct xe_uc *uc);
>>   void xe_uc_gucrc_disable(struct xe_uc *uc);
>>   int xe_uc_reset_prepare(struct xe_uc *uc);
>> +int xe_uc_runtime_suspend(struct xe_uc *uc);
>> +void xe_uc_runtime_resume(struct xe_uc *uc);
>>   void xe_uc_stop_prepare(struct xe_uc *uc);
>>   void xe_uc_stop(struct xe_uc *uc);
>>   int xe_uc_start(struct xe_uc *uc);
>> -- 
>> 2.40.0
>>
