Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532D8CD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA428112876;
	Mon,  8 Apr 2024 16:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2PMFuWK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B351112876
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 16:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595589; x=1744131589;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3G2Pv5SExk065QTr9+5vETjWTEFDEA3dVhqz9cdkX/U=;
 b=P2PMFuWKpsj0SXu6mKt5/cIDOH+h05GSF36hvoHi1vDOw6ED67fyoZb4
 AscIdT9DL7FSgaj1pLeEYt5Bck/3oAgbs37lDsT09xDp8mxCrYXkA/Nzf
 mLC19YPUcV1hwEq2aqVZZ0zLFciudGrgzFvPm5zS3DsrsUpbrXTKmLwAZ
 FY6OhRSC7xCYIS4tRH9CvRU+PgTWTbQCRYpRJJk1ZMw/e6hNqJ/l0o/Ua
 DbDyrpvOJNInNvmboG8KJapMBQS26Y1MUacQJnqyiPd8A/DXuz7rxXxV8
 ExT4tmtfJu41R3gphN1M7Y9Rsb3SEw3irporDtjoaF6UBUjeGUmtQPEer g==;
X-CSE-ConnectionGUID: lrwNSrTyRC261BkeGPDAwg==
X-CSE-MsgGUID: xijaWa6GTien/1LKFEXjoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="10860010"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="10860010"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:59:49 -0700
X-CSE-ConnectionGUID: hYJbTtCJQzqY0oVhwvSQYg==
X-CSE-MsgGUID: l/Fqei8uS9qdZb0OfkerIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19819550"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 09:59:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 09:59:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 09:59:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 09:59:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmfFq82vlUg2UrLQlzSm1Q2iMwKYGZAD5nmxBtwoSzCGBk2JIsdNW+GZ4E2iwazZMAVRSDDUPiocrrWK5/WDhQkoSR+vUnl+w5tQnflw/enL/GCeVqg2SQbUmKaEoC0+aCSllSjmLI6an9Bx/ArFVumtJQFcGE9f91lKukpAdfUDXOVtva/g44xW6ZIZ28YMfDmvn6l5PQNoYHDSwGHcpZWZXGrlDqmFvB2HeXzX11ChjgHsYk2DcHmVGzskK2ZhqAeHHvB+478NAEqqzR5YcRb3NnDOMZd5Xz5+ZaxO2hK9dwfka8ESKkbs4QSj0KKAdIrNIA41UONf1V0Mi1MTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKVBJbS/Vcsft270qOiUJpLvhjauclwB6x1sihpilug=;
 b=TMUks38h/1kQ9XPR6QxK9dYMjNF4N/BtNN8xc47HFQv+sQI2dro2//FvLdDWBPQcbQf7EM6jr2vu6G/ZWi4TzxCH5VdUckxY1mqYre3kRe89josUUATuhoHWOrcZ0iPHUnqdipFs35ADDMmvZB5q5hXfocPGeWUqBUWXeQSkJL9WSgWyz6YGJn+JpMVIoCD+bj/mz9xBCejAI/oKAXmNo8f7x9IPYR6CIMaioCsxX5QUZpuBz5cuOSfzkbR44hXUCtYE//4VTqsXORI+zDzWBNsxY/VzoYPVLOa5jBzkj2b2CmaWYPplT4AEUcCkJnWpbO/Wvo/yEw6XooRzAJZfjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Mon, 8 Apr
 2024 16:59:40 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 16:59:40 +0000
Message-ID: <a6b75448-191a-4f38-b5db-d3c823fde224@intel.com>
Date: Mon, 8 Apr 2024 22:29:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] drm/xe/xe2hpg: Remove extra allocation of CCS
 pages for dgfx
To: <intel-xe@lists.freedesktop.org>
References: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
 <20240408162916.3767771-15-balasubramani.vivekanandan@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240408162916.3767771-15-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB7923:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xZXEj8dt+LNMVW4vEUjIx9SAaD7Erc3Pp9OP8kyLzC1F3UCol7Lj7NRIJveCfU6I0YDaopCfGnUSjEFBAS5zOqXIFBZrbcTUTb2lPmix6CBt8jkTqu1UyBbkR6os33Txn3upAQiieAWrENb+col9dyzUFOHgFeeQy5clWan1MvuXhJnAK3zMIo/sbMVpXQCSuxLqGKAOXnGXwT+J8Zgknya305Z/GnRCDxYYmDrzvKwdUlwf5sXIG97D3EPNTA5wk3Ve5McPe3bKwuwi64J+R9wbScUxDy38VOUlQdKLYdxaCfnrOtii9ELKfRwJo+8Hq2HhTX/xyotPOZeHAlVdpb8K8/ln4rFi8MM+9Ft3RCr98XSrj0vU0vJTKwTFEI7uXOO8MLhV8Gzs9A60EYwdOvKTyOHLlpGXIA3xGkk5CVWFNsRZmTMKVzCMjrNIVezhlTl8XHi7JnMLnYtN+t0M4o8fXa5/NNOnZN6yXmUm1cfo88pT5SN4klDDI+HTxzjtO3ZJEPGVacbZFqxv2/w6XubINa0tYOT4Ax0oaNWE91xAfqHlfE7FmpvHJhQCAkxrhX89GJKzhDvsWf4Mjbp0Ukyt80dbUON0dNQfidtuTRsSGbLZWSMystzjWbsLThxfRwECLvw2zV6vgRR1g6zqcZkUUdK4rZyt+G6IcVZEE/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFNRTXBVVVk5WmloaU1UVGJia1NHWk1TWmZVRm9wbzA2TnM2M2NKMTJ6cWZl?=
 =?utf-8?B?a203U2lMcGhLWE1DeEI4ZzlzZ0VRZTBGK3BCYjUwVmpqRUwrQStDOWQwOVFj?=
 =?utf-8?B?TnUrcDdqajlkb3crRzU2WmZENG5aQkM5VGJGLzg4KzN2eFYxT0w5VzZmMHFZ?=
 =?utf-8?B?L1g5eUl1WVozeVVvdVFQTWtjWWpGblBGNlpYNXVVQXVPRnIyQ2F0RXZaVlRF?=
 =?utf-8?B?MTdVQ2xHUVZCc3I4c050NjZOMHFLbFRuRlU4dFVjaWk1TUVSdkQzTnpla2th?=
 =?utf-8?B?ckFPYXV6M1R5Rjk2MFRjZ1RVRHE3NVZ6ZmVNWENmTW12NE9FcWVORHQ0bE9U?=
 =?utf-8?B?TkgxNU1WRDg4cElxODRuc1JHcGlOSGlnREgvK1ZMWnpGWHord1E1UlMwQVAv?=
 =?utf-8?B?eitQT0pQaTgvR2Z2WkozdGFDKytHN0prbTBYc2owTWxZY2dHWlB6WXZhS3ZQ?=
 =?utf-8?B?dkhwUkJuanNzTzBiSytyL2hkcTRlVk53d3NSYVhwTlBuZ0VMdFN3NEJHZlNi?=
 =?utf-8?B?WE5VZ09HWCtnN21vL0gzSkE3b0ZGWXVFVmtwampNTHBBVms3dnlMQmU1dmZB?=
 =?utf-8?B?SjJEM2x6VnQzZEs3cDR2bjBqTk5zYnNtdXB0RXM4bks2R0ZRQ000M0Y4bFkz?=
 =?utf-8?B?VEw0RnpEM1JqaFovWUk5bzAzOGphQW1jQktZdHMwTjFmUVpSSGxNdkVqdENt?=
 =?utf-8?B?SEdvNERuVThsWkk5QS9WSW1FcFAzSEVpS3cweVpBdjVNeFEzK3dnblNxa3NU?=
 =?utf-8?B?VXFjdUNJYUxDamk4T3dxK1QrQVJEQWFzQmMxSXNhTjNZcWVSWGxnckF3S091?=
 =?utf-8?B?dmgxMGpMWWNrTE90UUo4b1ZaR3pkQWYxVlAvS2psVUV1UnZqMmtKZEFpbFBo?=
 =?utf-8?B?SHFBWVpvTTBvc1dNc1JnelVBUWduR1d6Ly9FK1k1RHVjVVBYQytUM09pemRO?=
 =?utf-8?B?Z29tWXVNam9PbzdkeGRqamQ4WklmL0x5VDJlekVwZ2ZWcC9Nb3FFTkNHekta?=
 =?utf-8?B?SWZOOEwxcXVQTjNnWmptakFWL2ZrbHhkV0hBLzlVTEZHMzBhbmIvWUVUVVJI?=
 =?utf-8?B?clgyTDUrRE1TcmlBRjh5RWp6RjlsT1F6R29WVkIyVW9seGpWY0xiY2FYMkZZ?=
 =?utf-8?B?czdibmZLYVViVXk4VEdBcFMwbXQ5WWJlYlRURjZLQkZaUk1FTjd2V0JDQU9Z?=
 =?utf-8?B?VC9PWmJmS2c3d2FFTXFwSkExcnpVL3lSbndQdWRNT1NpMkRPdUVqRkNCUk1E?=
 =?utf-8?B?UkRLT0oyU2lLZ3BpRHRWd3VjVVBhZWgyckpBejU2MW1zcnU1M2lMY01kWTB2?=
 =?utf-8?B?MUV2dWNzby9aOGRRRXM4NHJJcW1VRjR4c28vL3piWTFyZm5WZ2Q0R0xzMCtT?=
 =?utf-8?B?UHErZ2hkUFJFVStOMFpuUUNwQmhFWXdXSTlmaGdYTmpCMTlWZE1xQWd0djlx?=
 =?utf-8?B?R1ZGaVZiYXloOExGWjM0NVNJQzdxR3BLZFd0eWdiZ2JOTXE3TUY2QlRoZUI5?=
 =?utf-8?B?VU8ra214Y1BVamZ2VCtlaFlMaGJQZnd2V093SnZHNFVEcitQK1ovSllNNld4?=
 =?utf-8?B?SGdxdXhzUDN3U2hIVVo3NGFIdmVzcnp0UlNTWE9NbUxpbm9Ec1ExbDFqV2g5?=
 =?utf-8?B?c2VXSmJZbTFIM3ZqbGN3c3lhRExPcHBCYUVmRGZiRjRSL3pCMll4RlNIUXlJ?=
 =?utf-8?B?b0Zaa21nY3V0WUZPMzdTZzA4R3d5NXdNcHM3RUw3dDdHZ25ndGtpaFIzSXQz?=
 =?utf-8?B?TEl5VC9KNDZQbmRhUnl2eU82d1V3THNGWDZjcTVDdlRFSE1FRnBGY2dNM2RY?=
 =?utf-8?B?UktDTXovQm03SmgvSWJHWkhkeExidzlVVVp4ekRwK3RKM3EzTkJYZEFXcDYy?=
 =?utf-8?B?aWdjUHhaeXBIL1dKb3VIUStnMVJxMVlFalVFWGxnMW5ZYXhYTURQY28ycXRl?=
 =?utf-8?B?YkcybThJUE1NU2MzSnJQMWpvSXJ0VWFweVg4TzRNYzNYb1ZzYlFhSE02VTFr?=
 =?utf-8?B?Y2Y5RGhYbGhzcG02NS9GbndheVZEeTNmbzMvRzB3em9JU0lIU3B2RlE5d3Bs?=
 =?utf-8?B?eWJwVDVrOHZwWjhpL0JFbHBpQUtXcnFCSHAvd1hiQ0JJc2QvT2lzU1llNS84?=
 =?utf-8?B?dHZJM0VVTDU4dUlhU3VoRG12M0ZHVXFaYVRzczMzaEdCZk1COVllZmdqZnFu?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d48e765f-0c59-408b-0f7e-08dc57ed4770
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 16:59:40.0232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4d/B73vI50NJCPO+aGiaNexaDrTDKkY7mqyv0E2kQlWxEF9cjXan2npgJ/hna8BH0RPFjEoFWlgbNpxh1wrRgkxX91y3QEi5n6HYKBZytqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
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


On 08-04-2024 21:59, Balasubramani Vivekanandan wrote:
> From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>
> On Xe2 dGPU, compression is only supported with VRAM. When copying from
> VRAM -> system memory the KMD uses mapping with uncompressed PAT
> so the copy in system memory is guaranteed to be uncompressed.
> When restoring such buffers from system memory -> VRAM the KMD can't
> easily know which pages were originally compressed, so we always use
> uncompressed -> uncompressed here.
> so this means that there's no need for extra CCS storage on such
> platforms.
>
> v2: More description added to commit message
>
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6166bc715656..fdeb3691d3f6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2201,6 +2201,9 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>   {
>   	struct xe_device *xe = xe_bo_device(bo);
>   
> +	if (GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe))
> +		return false;
> +

LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	if (!xe_device_has_flat_ccs(xe) || bo->ttm.type != ttm_bo_type_device)
>   		return false;
>   
