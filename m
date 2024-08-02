Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C730C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 22:42:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B56E10E1F7;
	Fri,  2 Aug 2024 22:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eA2/33yM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C726A10E1F7
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Aug 2024 22:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722638552; x=1754174552;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h+m6O+atxn3/HWyLtZ6+xG1x335yBKqrFLaSLLNTm40=;
 b=eA2/33yMIEOC4nA5OpYnttdhrfTXgs+CfUW0jw7OIKDEdYlGB27FDN2U
 7dFD93eShYqoMvLDrCeWr9YOaoPQvZt2wTx3cNW3S8uCSLI5CFQ6ZIG+G
 FOpMp6auB+xHY1Li/0LySQRl/m1ZCPyjQIOsdYLKuKt64J0d6tGZcNm3r
 6AMcP3h0Ftz3O4cxhGPnAxfD80DeloIM/5KX6MZwPxWFZ4dy+AE0u6Vvv
 yjMxT6C1TxHaGNfW9mNs+x3umqzEvfzcD7UgnHViye2IJEZSsf7FCtsQF
 U6ZAAIPi6gmdADWyiMBZmKhbO48wUsVb2mYRvjANLlREBQA5SXpH7t4AW Q==;
X-CSE-ConnectionGUID: ZneyvotgR2m0pV+fTiODfg==
X-CSE-MsgGUID: qmpYa+EcSw6tIA4MYGwbjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20345967"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="20345967"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 15:42:31 -0700
X-CSE-ConnectionGUID: 1Ed57R17T8iwPO4e2FVyaA==
X-CSE-MsgGUID: SrwtBR/UQCihfMdhgaVwMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="60175167"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 15:42:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 15:42:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 15:42:31 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 15:42:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOvlPRFE1CsVh6V6gSd+W0inKXgLmCqXWqtAAELj9i9IiELFfOvvAFBp4I4KAGPG6Ez9cx4TznqdIYTvTJP4U4b18blBNPUAKvWT0AAAcjzmX/LwiHK6XEp3GcuvYkYaaWPaz+Wx5nHEcAgPrWV+O8QmN7g6mmYDy4ULtvFts3KT5vR7b/ugudeYUsolbh+jI8XquotYmyqiMwrQBYOdj72iB4D5DE12JT2zVSGKBfCzmtha34YLHlbpYPbS0SJ4oMANZCngB7ORxuaFJe3xE35TfP8iRIakQnr7igVHbQ07gWkBIlh1Oy2W9S8gKudij6ay1XX98FrbPY/12z1UFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OelzyZ0xkthQsQQm/Hpj458RxzQYVeHpYVznjcCrq0=;
 b=ryN38d0AkGM1RoM3l/CTb3O+NHi2JILlvXMrXmdzbtQt25kLQu6J4b9KSOhiC8y96v98M1vJgK2kNY+RDsWf63zSvraBETkYPwzuNrdqTeDt8OnsymMNO2HZkUGkZhkJOfgR+LU7XwQ88GJIE7KyIWJx03pbQYnP/KQWBjkKktSKwWtAbgnYiddU/B4JbJFEVSLXpi7sCtRCJLKNMDOtqko+SKAKsy0wrUAuPqhzH8GZdU8nH1HbdtzFbUr6/E4iiXt54HXcoanbXlGAo4aePukiLf3jwzaoLwjAx4ot2dpNWFVY3TQwe/A7Gj++F5Yr02DDOvCgJrlM6JGaECap7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20; Fri, 2 Aug
 2024 22:42:25 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 22:42:25 +0000
Message-ID: <af410932-3c56-4a5c-b913-da3d90ac5548@intel.com>
Date: Fri, 2 Aug 2024 15:42:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/xe/guc: Pre-release GuC firmware v70.29.2 for
 PVC
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
CC: Julia Filipchuk <julia.filipchuk@intel.com>
References: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
 <20240802222129.3976212-5-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240802222129.3976212-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f71615-12bd-421f-b4ae-08dcb344616e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzQ5amV5dC9lV1I3T3Fwd1lFM1hQMVFtWEFqdTJYRWJVeVpvRU1HZ0wvYk5Y?=
 =?utf-8?B?bWF3d0R0S1lxclJ1elN1SEdaaFZsSkhrbk1RdCtHY29lUUhpYjF2anJJU0J3?=
 =?utf-8?B?VGE3OFUydm44N0VBdjVhUVpjZ0p5MWdpUEYwODJWbWhDTWhVdE4yUzdyNTBm?=
 =?utf-8?B?c0hBQWVITldGTllOZWZxWE4veXBoMGc2TEFOOFI1dWdiSnNZbVo1TGlBOFNT?=
 =?utf-8?B?QWZONEVOYnBJZEkwVnFXb29ES3dwdGUrN2NJUkhCNk1UYWpBdEV0Z3cwMk9P?=
 =?utf-8?B?RnZWeGZhdXJaVWJUdk9tdDJqbUVKeFNNTFpVM1l2RGRDcXl0U0JzZ1VvS3JR?=
 =?utf-8?B?RVdQVnlqQmtkWk1wRnNRWis3Wlc2U2xoRlgwRDVEOG5DNWxNbzVVbElIUlJG?=
 =?utf-8?B?T09icGVQbm8vcDVScTBTUnR0VlJ6b1dqK2FYbGgyY3dmMFZaaEFzZDRhWEZz?=
 =?utf-8?B?TGp4K0xFTFFXTU8rVzlZWHY4cys5amlyUVMvdGt4ekRqTVdCQnVIVjJuc1Fo?=
 =?utf-8?B?MTJrUGFFSGo5VEdnZzE5YXpnM2tiM1AvN2lLeTlQQ0xwUFBrM0FYckZvUDZD?=
 =?utf-8?B?a1dZNWlzTjNzOTd6M3gyaWdoOFU4S0YwSWtoOU1vNHNXVUU1YkdHU1dZaDEz?=
 =?utf-8?B?NnJPYXFFaWdNUm1peGNnWXQxY2hNRTFRKzRLSUl6TFhDWEIxNnhjbDJkLzNH?=
 =?utf-8?B?SDJGV2dlSlJXSnpwdk5GcFZaYVZGdTg5S0dhRlNKbWJPTW9udjU4WjRKTE54?=
 =?utf-8?B?Uy9qS04rTjdlRE5BZHdjTWJGZUJ4NElmSUxpQVVuMmJsMVdhdHBMZjdMa2Vs?=
 =?utf-8?B?Unh2azZZaGJuK21rejhwOTdvNVQ0blpJUklSY3N2L2lUeG1qRWRtT09hdmVQ?=
 =?utf-8?B?clh3c1pOL0hxby9xRWd6cktaN0w2cmZjdGlwQk14WmtVeGt6MUpGZ3JpQW04?=
 =?utf-8?B?cUw2Z2pOTnRRQ0IrSGVkZGt5TjNyNGRSaXBRRzJURGFhL0R3MFB6WDVwY0NJ?=
 =?utf-8?B?UGNkRW95UGFkay8wQy9qODVUQWFoZGZ3bkZKOWxJZWorZlZaUzZJQ1I5VmV6?=
 =?utf-8?B?R1FtSWdFRlFtZmE0L0dQV1BxMTE2a1dmWEFOWTVCS0cwVHBrYjZjOU4vS0VE?=
 =?utf-8?B?QjVyTGJ1MzRORjk3VlJNME1sQ1JLYTNGSzBuTzhhZWNqYkwwTUlsYXdTZ1ZU?=
 =?utf-8?B?OWhiZU84MFFRblBwMGwvVzR4MHRiellLTWdvTURNN01oVEpvOUxGSGZnWjlV?=
 =?utf-8?B?VUgxMlBLUURvTUVuMFRlZ0RXRXA4a0xGdk0yTXMzY0psNEhmaUlsVk1BRk51?=
 =?utf-8?B?MFdvL0g1VHhMTkMrSXBwUm1ZTE1sMUhYbjBpNlp0QWFJREpzdmZVV2lTbzlM?=
 =?utf-8?B?dVVucERuNU1RK2tHZ0RrU3B0cWNicEZ6Vk9ibmZpKzJWbXJKNGhTRmhsY2dj?=
 =?utf-8?B?czRGRGx6VmNkdS9JcUpVaW5vRVJVeStCM01yN2pUbllhckY2VU5UNUJxSWVT?=
 =?utf-8?B?K3VwaGRvY1YwZGhuS0JsMzFBTkFLL0IrWlBXNVd0ZE41NUZhdE1NdERVbFVO?=
 =?utf-8?B?NHF2Nkl6SGRGb1IwZkZIeGtGVnhKTm1uTWZrdmVRbit2dXJDQ3dCZ09CeG5V?=
 =?utf-8?B?blpPZzBwSnFjSWR1WWtyOUtQL3hSbjdSRUhJaGRwcE1kbEZpNTUwTXU0Zmhs?=
 =?utf-8?B?Z1ZEV3RUU3NkdVdUSXFuYzJjWjhobjdaTGh5bkJTZ2pvZ2xoZGVmNUl4cFJB?=
 =?utf-8?B?L21Fa29tS2M0T2cyZTJNWmVxdlgyMXFJVEpBdmt3SVV0ZDdkZzZmRWJyMEhJ?=
 =?utf-8?B?TmsySnBKc2s1d2cveHlRQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHdQTG50S1cxTW9LZ05lMXBsZUtXVFFHYnJ0MEtFOEJEU1I2MFhGVlZqekNw?=
 =?utf-8?B?aDRxd2JEOXZYanppUXZmbFcybUpBOWxvSWJiejZaZk1Ia3dSMW5DdDZwVHZl?=
 =?utf-8?B?MUpLVzhSVkVzVmpQWklhL3JkeEJvTkZVRU5uRFRFbkJKUUNGNW1YcENFcXVv?=
 =?utf-8?B?dnN2V2V1SVhiWFF5aGNleFZaaHE5T2dvVGJacFNiaWtkTnhqMThOcTEzMDZo?=
 =?utf-8?B?dXh1UU9lODM4LzVlOWZ4akRFeHNHSC9KRUR6NXdJTUtXenVjdUlkNy84VFla?=
 =?utf-8?B?Y3kyZkIrcHFCalFyNUlTV1I1N3JvSm1SSzg3eCtES01LS2luWk9JUWlZOWFl?=
 =?utf-8?B?U29RRG14R1hHUUM1bDRiczZBanBRY05YRm8rR3hKcHBtc2xkQnZ3WU8xZG5D?=
 =?utf-8?B?RUY5VEhDVjExK2praHJleVFWZXBpS3FLdEdiTGZLckVPbURmUnVGdXZ1amRK?=
 =?utf-8?B?SE04WU1ISjBkZHRtVzZicSsrMkRXQ3hYUVc3cTJzN1JjZjVPL3k2bG5PSFU5?=
 =?utf-8?B?cHY1aHk2VWs5UmhZcEZHUlVveVdrQ2dRc1J4dEVGbmpIOXNaWUg1akNEekR2?=
 =?utf-8?B?aFZxOS9UekphWmY1YUttZm5BWVEzRFAySnNiTktWMENIVURQV1VLNTdTODZO?=
 =?utf-8?B?SDlhM2l1dmZSZmJqQnRsSDJyY25rUC8vQ1VjZUlEaDV1SkJvSGhsSU5NSXgv?=
 =?utf-8?B?N3lmaHR4bmpUcno0WEJQODBCWlZPZHZRc3VlZlFpbjRPdldpSGFvTWtqNnFQ?=
 =?utf-8?B?VC9tSk1RcnpkQkpvVXlYMG44QUs1ajA0dkdPZFlrSmY1TWtkVmVWNDl2dnlk?=
 =?utf-8?B?Tmx6RU5hNG9wWEVkQlBKWDhLT3ZBZVIzdWZndXgyMVlzbFFVWmtEelZCWXpt?=
 =?utf-8?B?SzFKbk5XRkFTelFpWmVKcS8wekNDUndoTVhKWGJMK3EyNTFmRUhUSXJYYkFi?=
 =?utf-8?B?SHM2RExMZmFLK20wQzdneXNhQ0VjUDNENXdnbkJiaTVQbU1rTndYSm5rS0N3?=
 =?utf-8?B?MmZRWGJtZElDY0VXcHNqdHZ0TG5PLzNOcDdSclg3ZTRiaE9nZ2M3dlplL2ZX?=
 =?utf-8?B?Rkh2eVV3cGliZGlDRm5yN3BSREw5VmUvbUdNSUVtQThKRkZhdCtpOXJ5YXVB?=
 =?utf-8?B?MlpuM2k3elVSWjl3ejZqd1pZTXZPNWJRZ0pRemtMVHBucXlXUzVZWG03ZGdx?=
 =?utf-8?B?WW9Ka21pNW1tNDc1RXZnQmVHZW0yWmU3VU5HSzJmV1VYZ0NUQjlXcmtZWlY4?=
 =?utf-8?B?RnVCT3lLMzY5VUM3TGtjZzZaZndCTVJsL1BveitSRTNMcVJ2NWRINlBMTUxj?=
 =?utf-8?B?MEhTVUZ4eHQvMytNb2RiZFZyOGVQcHRCYk50RDVUYTkvREVIU1dQQnVVTXJs?=
 =?utf-8?B?NjE4QUdTUjZxSTlpb2t3K0piQU1lbW94bVdKMlEwbG1McENQaVZsMjJIT3dX?=
 =?utf-8?B?UFlwcmg5RzdWWGVVc0pxM2FNSVVJYzgwZEZpT1VpOTlrOE9wMlNCRzVCSDhk?=
 =?utf-8?B?aGdjVWRXZlRiN2JLTnJodGViS2VrRk9xRHJJdThQRXAzOVA0RmFpSHVBVzVx?=
 =?utf-8?B?ZC9sVDVVOS81bWkvZWJCWmk3V3VQU2owa1RXTnVlbmtSWkI2dTEremZ0YzNQ?=
 =?utf-8?B?SkY2RzZxQnhRYmcwYXRzSWFRS1ZnMkk5YjdaWDRrUkhUNjdtamphZjlZa1pp?=
 =?utf-8?B?SFhROTBQSlhXZlBRQStEdDEwaUt3c1RQK1BmeVMwQXp4VEpNeU9Lems5YTRB?=
 =?utf-8?B?ZkpZRWkvVEhQbFNyWkl6anVRUHRIL3o4VTdqVHpFT0RaeW1uZGp2UDFsVWlh?=
 =?utf-8?B?RU5VNDU5aEFkdTNxVnpONUI0ZWFWSmFsMjVUOTlVZ3JTYUtKbkpTZHdBOUpH?=
 =?utf-8?B?aXVDUmJPZ1ZXcGtmUjgwN3JZRzBpYlhHNk5IZEwvWWRKc0U2VnBWVnlPK2Rp?=
 =?utf-8?B?ai94dzJYNTdyVHNMUHpYTm1WaW9QZ24ybVMyb2NMd2VyTFhVMWY4MXpVMVdN?=
 =?utf-8?B?SUJtR3pSdlhCdExDOVpudmdFZHR1Wm9lNVVvNzI0ejBiUUswV2pycUFFa3Zp?=
 =?utf-8?B?RCtCZFdSMXl1TEdDanZ4Zk54VlRCVGFZU1dUQlNpUzhWc3Robkc3SGc1K3lV?=
 =?utf-8?B?cXp6aEFVSllpZFRYbnFKT0hhdDBnTG1iYVFyMzlOQi8yT0xjckEzVlBVMk5x?=
 =?utf-8?Q?5Rv1PT8Dg3Y1b6iqDzpW11g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f71615-12bd-421f-b4ae-08dcb344616e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 22:42:25.4436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVusOYNcD0JEuwzHzMZ0QGRp7FVJ/SMFICL2pk4J2L97xRXnj74JDoJ2GIT+GOxG/kIabtoV6jN7YxJPFPZb4QjuhCOXgl148e9uB+0ohnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
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



On 8/2/2024 3:21 PM, John.C.Harrison@Intel.com wrote:
> From: Julia Filipchuk <julia.filipchuk@intel.com>
>
> Add pre-release support for PVC.
>
> UAPI version 1.13.4.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

For the CI branch:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 4bb2a4a80ddc..41c4ac6ba42a 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -109,6 +109,7 @@ struct fw_blobs_by_type {
>   	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>   	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>   	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
> +	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 29, 2))	\
>   	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
>   	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
>   	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\

