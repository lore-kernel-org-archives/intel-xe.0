Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AC3C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 06:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C4410EE88;
	Thu, 27 Aug 2026 06:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSrrJhfs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D8310E3AC
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 06:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787813163; x=1819349163;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5fnt8BypG+sHI8inhQ0IJgolelPhLOo9CNOjkVt+zjI=;
 b=QSrrJhfs8ik7HQBTCZkl66BrJTD4ssPeOrBh8G71awh+xepD8i0aAnr4
 BXzVi6iIqB2ZAa2YU1+uLArZlUmZ1i7c8B+1dZOQpsSMr84LB4Nv5q3Pu
 rF2LNRnBttaWkb96CPUnBd2bK3HB3i9KAEBuLHhr6xChCFmEOUJfTP2Qm
 JERKcnd1cgyxUmnisXLgdSY3+AVB75OB+VmrTLRjWdS1R5GOJRQsMla1T
 0bIh2el0SRcW9CEZ+K4dTf6Uz/4vEwwiEBRl6Jo8Fa7p0XYEPFDPOEWRU
 QZoKxVA2UvopM0R4t1SyvhNSb68Jgma5BzG6vtuZpHp7IEEz5E6AuAl2j Q==;
X-CSE-ConnectionGUID: GaJNw7sGTdSyRalwiuaCIw==
X-CSE-MsgGUID: ZQtFUCdTSbyRMIY3gr78Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87248173"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="87248173"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:46:03 -0700
X-CSE-ConnectionGUID: PBwn4Da1RxKQ7F4VUsJSRw==
X-CSE-MsgGUID: 8W5c48qeT7+cOQEl/tmtIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="269738317"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:46:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:46:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 23:46:02 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFHL3Q6dJjpNaaNOrzB4tI6xGQPoOY39JfuWdmjbo+/PbfLwOCtk/BkIZanqUQX+FKcgWnL2OExKcNLtnHaw+tNnbDUNRH0hDGAa66VaZC79neWXtUFLEq5XMBS9CpawxSdn47WNK3I1/PZgfPMhHcygnGdQfaxis0y9YO2SsSLnD+50yPxHEjrUBfghUCT7Kpmi64rVeDLf+kb73g1JsT+Fxmh4cZq+iCSO5yStRTJVBTFa5lVXX/ghPH8pWD0+MByjQnugOzitS9j3G4YejNkHM5DVfiyBa9gyTwRUzsVkz9prKJs95nxQAmJGdCiTYSVx6YntkTEigGB9raYdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ElPE6kb4VDhuV0HfgDPwWSB9+5L5aNt3H+EOlR4PyY=;
 b=J55OakU3A0hEJFNfOuSAELPXz6apmnwBq+pNfw3xMP9/sZZrqm53e4XqZGkH3Wsxt6an2ohV4tC1s95JVpSk1fzpdxLAoFHOdJk0Ew/Hy3sPpF4HaTNc6fQJYWfQaGsByRgMX8W4nEfqfucYKvoDxSqskokj1bQk2jectKTt0/uzF9qIbTK4v0hC63uI2DuVWTuvTopr10JPnR7jKP2g2AEWTpQKsgsqAv1Of8l+7O+wWMCf405Kfj2OjsA3Lea+cCwfhcz6kEMdf4PiQG6/+pNph5F45Aa8vx8o2AYUuTpnoQvxei6bB7YHcStC9osCBKVcckhgzOl7VYHvFvoPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA2PR11MB5131.namprd11.prod.outlook.com
 (2603:10b6:806:116::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 06:46:00 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 06:46:00 +0000
Message-ID: <ede25575-0352-479b-9755-8f8837de48a0@intel.com>
Date: Thu, 27 Aug 2026 12:15:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V18 10/14] drm/xe/ras: Cache bad_page_reservation policy
 at init
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <michal.wajdeczko@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-26-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260826135136.204044-26-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::7) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA2PR11MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: 487ff162-117b-4b63-9ccc-08df0406dadf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: TNC+5dOZW2lkA9HarChlASN1PMXewWiBvyB4hXpcR0FqNuN7j0jauuTZGvnee9FZoTZV+wuKPm/zyp1tSAgjZBOUbfy7xSz3jSKEjuYVC1UZfL4uOv0zBUBRmyptdw7a2yFxJSY4e3bhWovJrwko1koL0UNtJJysP5e54T1OfoZ7HGKK67zz4d/nTtrSa2wm6f20CNIFIEMl7H5cgwbZDHWU1OsR8CwALYEoG+BE4bwxNjE/dbuiUEByX8bJHfX3gmmirRd+lNFOw3K3dXUPrzd9wFYWjolFj/t65623Tg3P2mkAQ6/NAmKFUZaJzv/mSjPzJ1o+BLLKiWrsNlssR97mnqINJHe7MweYxP5TPk3qiwKEMxbgbsjsT8vpEXMKXQPBHJp4HkXTgcJIkNzdjcarjMYAJLKUGAoSRJFbwiLP2VWyOXLV98UFJlGGT1UvciIOPtMBlujzyJ793aqeviKpb1ztOmwgaqWXM3hCXcvkQaVEaqDseq5LlVokpODmStEI+CTmGu7KqUdfk4ASk4jvno7fciuv24Qa7vgue2EBOhbLw8jDkzRfwZBgsKLzpWXM2y9Oji7xAWqcJmmGD8fseJl8wtQADNtq7Pxu5/NY2iq+v+1m5F/kezC3QiJwD169u5l3Z6tE5tRvoasJqbGogbqbLys6/BpDwglh1aA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmFaL2o3UFdFeCtiSDN6Q1I5UlpBbFl5VzhtU2tTQjQwSXVqSURFUFNQa0VB?=
 =?utf-8?B?SWdsR1Y2Z2c1RkRCYXA4TlgraUFvMHlCMVFQdkpMK2pHVm1IalV4QXA3bjFw?=
 =?utf-8?B?M09RdW1BY2U0UiszbTJsZi9xZktUS1pDem1PcjVaakVZUGV2RG9acHlKMGM1?=
 =?utf-8?B?U2hOZzJ0UHdxemJRaHJoVDFlNTFvUXpiUC9tSEdzSmVsS1d4VEVuaWhyTDZy?=
 =?utf-8?B?ZjBFdmk0NDBxVzhoNU5tM2NVNHN6TkZXL3pDQmw2WGhtanlIbWcwSWtYWEhT?=
 =?utf-8?B?VWpUM0wxak0zNkx1WTJRM3pkdDlvZXhtOU41aHIwazh6emw5SXY1TVR2blBh?=
 =?utf-8?B?MVpnbEhJT1hTZUVGWW42c2lQQ2JEYUlBb1BFWmZLNGsvTjE5MEd2NWtubzZp?=
 =?utf-8?B?ejJRUW9yR3lQblVXeE5EZXRPdkFGZ3QxN25zdWpoNTA3YWE5ckRlUkY1a3oz?=
 =?utf-8?B?Nm1YOElHeXZITEhrcjBNRERBSEhId0FkdTBYZVRnWHQrRzRibE1zQzZLa2lh?=
 =?utf-8?B?VnVUbXlENnFxZUhjMkN4dkRTTEozWXU2aWJiZmJ1bW9KWEtwRG5DbU5yRFBH?=
 =?utf-8?B?WTQyc2UyTy9oVllKNncvbDEwOWhrZ3Zyc2JOd2ttcUJxeG1IdU11WmdTSkgx?=
 =?utf-8?B?NkVPWEk5aXN0M3pObjNpVWRLZmFnMjQ5SkllSGpsZ0tTRFRRMVhwUFVhVEh0?=
 =?utf-8?B?OWdEd2tUUjliSUVEc0YyNnZWSytxb05rODV2aWpVMkRVNVNqNS9kbkZaakhC?=
 =?utf-8?B?WUdxL0tsa3JLRTdpeDkzTUJMSDlmcWszcFpFUll6aTJSWE9xeGhpdU1qTGJQ?=
 =?utf-8?B?NU5FdHFnUFovUklpOU9zcjB4UHhROSs5eVV0TXVJZ3BRSWYrSkU4dGlScDBY?=
 =?utf-8?B?SWhYRG9tL2xxWm1aN05ic1FhNW5UM04yazcyNzl5V2Joa3B3YWF5RzZSOUV2?=
 =?utf-8?B?OHFUb0tCYUV3QS9rbXFhR3pVQkxSNlJjaVJvbmZXcFR4Qk0vLzRUTGw1NVBp?=
 =?utf-8?B?UVJsZW8wSmlyL1FjaytkcU5rc2Y5QllkYW5ZUk9ScjlnUm5laWVxZmt0eTJX?=
 =?utf-8?B?M3dmTUErSVRUaUdVNTJtRTJ0dHhlSTFyR3pENFNCYW9JWW1wSWxyWkgxNXpD?=
 =?utf-8?B?MVpCdXpoZWt0eWZFbFh0UE14Zm1wSWpOSnVGK29OMGR5Rm5RNUgzeU94ckFp?=
 =?utf-8?B?TW53R1BVR25FeXNFMTBESXNaaG41ZURlanBKNnZFSGFZUTQ0VEhxMTdiK25t?=
 =?utf-8?B?bDBkNEhDcG9Mazk2Yll0SDZrSlVIdzdJSGdMS2FTWEtTKzY3NkNzOGV6OHJV?=
 =?utf-8?B?empRV3oxdVRnQllQZi9FaVpiQmJDRDVCNGpCTUJEOUY0VlM3VXZPMGE5WXc0?=
 =?utf-8?B?akRDZEdvNXlSMnNwdFArcWorWlY1ODk4TFlaV3dVTzJ4ZE9XaWN0UktWckt5?=
 =?utf-8?B?ZitDVS9qUlZFUExFZGJ0VUZhN2EzQ2JyVDdpcTMxZmlPQ3Vtd1JSay9WQjV3?=
 =?utf-8?B?aDV1SVRpMTBGYjZpME9xTkVEVjdDN3VHZGRCdThCR3VhR3N2Z2E5amRIbHVk?=
 =?utf-8?B?bmVvTUNaKzlNV2MzZk5FaUVMNnVsZ3ZsQ01ldXA4YjJWWFB2cFRvWE5LKzQ4?=
 =?utf-8?B?ZGV4SCtia2lLWllDbThOYUNwT3BJeXVuNzg1NVVLa2lzUVozUXFtYWMzN1Fw?=
 =?utf-8?B?TWtEaVdUcHdHbC8zR01UZUxkaHNPWklsL2h3QnRLMFVSVE01SU5HR2xrUGhR?=
 =?utf-8?B?WnYwbjYzNDc1bzljYTJlZzVRTHNDclRMckdRVW4xMHBxZTdVT2lzQTV1NlBz?=
 =?utf-8?B?OGVJRk5BODBJR3pMbU9kVHRCWENjK2JtR2JUM2Rhb3J0VnlPd2drN0ZrUXFU?=
 =?utf-8?B?QnEvQjdyRzQ2THE2NzBsV3JSTldrZnh0cVcvZ2VpN2tIYzZEaW9PMkVxbUpQ?=
 =?utf-8?B?NWpETnROOEFKRkZSbWlNdklLSjZsNTllN2JiUWRpK2RhWkt1V3pWNWphK0dW?=
 =?utf-8?B?YVVETEJDQ0VmbzZDczVaTE93aWlPSnR1TlpUWks3UlRMclBDa0VuTlBqbEVM?=
 =?utf-8?B?RG1xOFI5UExiNHJxdUU3RnB3TzR5bHU5UEJsdHhTRVJHVER6K0szVVk5SGxx?=
 =?utf-8?B?N3N6MndHK1NwalJBQ2RBbnExOVhHN0dLTlpyeVgyMWJXYmRjVlprREpVTWdt?=
 =?utf-8?B?d3lXVkJpbDRCTDZOYVFqR1U5SVZoL3lDSHhXRXFJenptNUtHbklXNDhRbEJx?=
 =?utf-8?B?U3ZNS1d3YW56N1FFVXJsMm94c2t1OEQwQ3ZmY0ZtbEthdHlKVDQwaWdaV1di?=
 =?utf-8?B?RXdNT1NCR0JhcnlRSHZkVG9BVlo5ZDgrby9aZkVWdlpLZnk2Z1JCMlZrS1lq?=
 =?utf-8?Q?/8cCdhX6y5is1zbU=3D?=
X-Exchange-RoutingPolicyChecked: uE2Pqtc6UD6UllQ8ncQs0w//FtRDdW5X0pesDrh7jXaHB85lI0t/M73MK+5N9xPoVYIY24SwbTNGaIstJKlLybZv8zId4G33b+cYaJjjBOppBc7lf0EyXJEUb2bmmSYwrDoCwLCdTPRxNUgXZKFXpdcjJMojYjrLGaA5H72TjhymztqGd/Kz1p+1AqoDH9qeZJBw3tWMxLaSK7ds2WSeBwLjM+Lkewc+XuSrXNzihFfZCJ7JRQDqa5aI+cBXJfLz7y20WgjIblhs7mFks89DKLHKUsE42f9oa2VpL8nZj0s3xTohZUiXrHmod+J6w+MNuz9FGqBR2c+53IzDe1mWZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 487ff162-117b-4b63-9ccc-08df0406dadf
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 06:45:59.9763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7n1yNaNW9VeH/MQLPEOjlGA2mW2z3l/LUf/b6ioE1orcIHgsdUn38NtG+Q7CeEPVNHRTkpp9aw3EaJA2xCUXMko2+Nu7BLG4JiTH1hQhlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5131
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



On 26-08-2026 19:21, Tejas Upadhyay wrote:
> The configfs bad_page_reservation attribute can only be set before
> device bind, so its value is immutable at runtime. Cache it in
> struct xe_drm_ras during xe_drm_ras_init() to avoid repeated configfs
> lookups on every fault.

Nit:
s/xe_drm_ras_init/xe_ras_init

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_drm_ras_types.h | 3 +++
>   drivers/gpu/drm/xe/xe_ras.c           | 5 +++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> index 8d729ad6a264..83899cf04793 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> @@ -43,6 +43,9 @@ struct xe_drm_ras {
>   
>   	/** @info: info array for all types of errors */
>   	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERR_SEV_MAX];
> +
> +	/** @bad_page_reservation: cached configfs policy, immutable after init */
> +	bool bad_page_reservation;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f77531..c7e86ae0e8ad 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2026 Intel Corporation
>    */
>   
> +#include "xe_configfs.h"
>   #include "xe_debugfs.h"
>   #include "xe_device.h"
>   #include "xe_drm_ras.h"
> @@ -804,6 +805,10 @@ void xe_ras_init(struct xe_device *xe)
>   {
>   	int ret;
>   

Nit:  AFAIK plan is to have xe.info check here for feature support, so a 
TODO please to remove platform check.

> +	if (xe->info.platform == XE_CRESCENTISLAND)
> +		xe->ras.bad_page_reservation =
> +			xe_configfs_get_bad_page_reservation(to_pci_dev(xe->drm.dev));
> +
>   	xe_drm_ras_init(xe);

With above Nits addressed
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	if (!xe->info.has_sysctrl)

