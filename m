Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333EBCD343F
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 07:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32E210E03B;
	Fri, 15 May 2026 07:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEKBO0nT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7D310E03B
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 07:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778831574; x=1810367574;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WnCFuLXBn7uTXJDls6UsIkHz1qH6QIx+JrB7dLwqX08=;
 b=OEKBO0nTtANYYUMD7Jfv/NRJPQrqkpqZo3CNYMxb/nvdPpy79E7T3lWg
 o9uGHMKM9XWRXeCfFrWDTVtCzcjjZ3CfKH4xNmRHrRXqubcAcEhWcMuv+
 umo1QJmeQuPtLMBvMZksexjOLt31PuLbaACJ16VpmpQ+iUX6No83OhQcl
 I1wUMBc6aJhoXzx/h0PAJTERIeIOpNzHOMQzwgmUJuUUxOoBrGw/lJkX4
 PIq/A1d2JGbF/fVFak1qbj+so/+HYr55OmAIg6XxnIIKUBecSWDUmvrjW
 4O8zsRtKmhqZ/KmA3Ct8CmP/U0C99bb2dHRq/Pbotc+j9bpU0grfI+OET Q==;
X-CSE-ConnectionGUID: vpShuqJTQm+V1X/LVfFa8Q==
X-CSE-MsgGUID: LVMjgMbwTzyRDZAYtQhydg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97213583"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="97213583"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 00:52:54 -0700
X-CSE-ConnectionGUID: InyKhXbeRg6KrTZO8/uecQ==
X-CSE-MsgGUID: ImheFxGATo+fdsBVOSLmfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="268968381"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 00:52:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 00:52:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 00:52:53 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 00:52:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bc8/xClBidXsKPnjWA8Dvtdu57yoO+Wb36JlDAU6RrOAchXwMb0825fqP/HXSkneU7eE+ds6iTV6CpYJqNs3b3yCHSmpoLrVfgVI0xILsaS/BIQh02+lXuONb8vaFAGG8Lr6PwKPGQj21R6XiPza4AF6+NZJErNuUOn4TTx9uL9JQJUuFv9NJG31QJjhTnO7wKnZd6YTmt6UAoRvoqgLNnIrEOm+QdOlW9b9BGWY/QjUdSBepC4tNeCoLycyqNj9sP8+i/2YvFTTesFbAKRgyd519S6ugd4+vwBSlCH3KX9ne+4Yy8vVDBFrG+cU2IBBxhTS8sQZdoSi1/wYsmLkyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3u+9XuDtLvbLZrWaIuRAEX2wsmHOEAMpveIAkK2qZMQ=;
 b=jq1WmJtS/bGm93l8PWpjrkHF74/XaXOs9XwmtHEVtcYc/JNu/w7IKAyNyt+TS4QRYBBq3jQJGOo8aWW0YNgoKEzdW1bq2ua7R86CjoLDWEm/u/HZQIlKMpxep/5bkS03EbiOM3LfVqNycsy4l4Zi12vvPDKuUFvxS2OiSoldwppBya/3wJs6z9qy8qnDJJFjtR+wTumJ2i2evHkl5a8yU8uwVRx/oV+WOFS/YxXvBy5hmYeMDdAct5Wk/GA5LrL9NjLd4/84H1BJpQJUKrWLvcAYtzFmbpOhx4o2mJ+wXzKdbVs/i7Yw4XPwhJGQS7BTx0B7Icjc3qk/spP/QjJ6qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CY8PR11MB6819.namprd11.prod.outlook.com (2603:10b6:930:61::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 07:52:39 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 07:52:39 +0000
Message-ID: <f5fda675-e56e-41dc-bb40-1f366c36a25b@intel.com>
Date: Fri, 15 May 2026 13:22:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V9 05/10] drm/xe: Extend BO purge to handle vram pages
 as well
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260506141143.4033299-12-tejas.upadhyay@intel.com>
 <20260506141143.4033299-17-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <20260506141143.4033299-17-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::16) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CY8PR11MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be2d660-458e-48bd-50f0-08deb256ef40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799003|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Cvs3JmrJ8zMIlf9+DjubifQlwefh21ZmZjz1ks19CtmhmggvaLgUFm1eP3kWbfslcp/9+3TvjtHn/aJBeeXxBfeGrc0Y/m2PBOyWE76n0bYYwYrxwWpniGsIOWbI5CgghGQCfKebHiGn/NffAqaaUcLmKj4cSjR/gHn/0irMg/mpqv+aIG4O6pZO7rYS6wO4oR6E08wBofwe+YMV3WKjL26RtdV7qsORsS8+Yu9FJPQOORhoQW+GyEIU+169KFflXy8F7A5BHJfTUY6v4w9B88ACab81+qXI/obvfrWMcnRmeTjplX6Bvwtc42DPg6m7Ef53bsfGgeo7V11sx6fXu5Xj/X8VxGlY8RLyTqJYUw65odPjFM+HHSdg5qNfRndFJx3Cdx9gyblU/ZMR2vckrYT1H3+6NT9s+6EX5EcAXHDrybg+BOBnN1YX8+XlfT9ik4A+C22vJnBaupOzIRoQ1Eu0uDA3uJcFUtPBfHts3LIAncxSF3tPTyhV2t9+NMLc5XDJ89GK0ze/apOpd1IdkScyPsWwOSDUY5DIJdiUnVOptZUd5VfVbLyKdg+3KKUNPBrwdnNWAg0FmIeFUdnqSHR/TChcaHdf2nXskgCwqGZV3rN3gwr99VsdbLqvsnxSxo6jJeUb9Hxwt0pu4TSei9lpwwk7Hl1iYymqktsEDSdWFcKq3kBTbncrfZQAnxRd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(4143699003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHJmc2Z3cm9DVE5qQWk0bkkyVzU5UzdQQXZ0NEsrV3VaeWNUMVdxTUtVY1dS?=
 =?utf-8?B?bU5OVGdjVHVSbHBQaEsrakhWUm0wS2NJZUF6ODdSQm1mdlI2cmlCbnl1Ukxo?=
 =?utf-8?B?RmF0QzZIZjVpY0wyR0oxUno5ajc4UncrQW05UkJMU3IxSStRWFBBS1RHNnNl?=
 =?utf-8?B?ZjhBdDR5VEdMOGhyQWNUbXZOS2FPNitWK1VWSkR1Q2hUWGY1OHhKOVNyemtm?=
 =?utf-8?B?KzNDVUxsKyt4NS96UEFNNFNCQ1llQU9lZk41UUZ1YUJhbVBKMk9WaC85ekVR?=
 =?utf-8?B?UnBiY01zUmtiMWVGSlJHTGxTNlY4OVZnTldMbytzdzVza1FRVFV3V1JPb3Av?=
 =?utf-8?B?R2lrNVhxcFI1alFtTDY1Nkwxb09qOUszZmVodUJqaVB1dDNFY0x1KzFQcTFM?=
 =?utf-8?B?S2xCU0RmNkxMZDJIY0xkRTViSkYrSGwzQUh5eHhDZVVseGJ6N0FBK0hucGVO?=
 =?utf-8?B?T3ZjVVYrbVR2UHJxV0xMTUNMbkVtSGZtSzlaUkhUWDUzalhtMjhUWkhrV1JU?=
 =?utf-8?B?eHNVc1BxempFZXExcFB3UUZ5djFuODU5TFJXZGc0WHFwL3I2OUNIMkJqOUdZ?=
 =?utf-8?B?NllzSGFpRi9HeWh6eFJOUVdoUGt3UG5pMlBVMmpwaHVMSTRvQVFMYUlpblll?=
 =?utf-8?B?cTIxc0xLSUpCZEVxVVdsYURFMXJPZ1ZrVUxCZHRHbjBPOVdZNDJCczV6bk1F?=
 =?utf-8?B?a3VNLzB0Ni9LY2N0RHEyZnZrVGlQZVBxVm5lSG1xdjF5eThnaVp0TkNXMWtR?=
 =?utf-8?B?RWdKdTNYRlpoSnhReGlZTnZrZFV1b2RtVWF2TVJJN21SREJzOE1zNmNYZ2Iw?=
 =?utf-8?B?YzFKZkFpWHJPOU5pM3Z6NXhIN3p3RDZLQWpHRk9PaTNCU0UraDZJdUE2ME1M?=
 =?utf-8?B?WDVvZExQWUgzMGJVK0tkOW8vMm1YUGxFZm1FcW02ZTNXbGVZa05GN0lDRGJv?=
 =?utf-8?B?MERKUXFRSlpJUmxHdEpuUE5mYVdjN21IakRNbS9RMW9FQ3NQcGxGOHVTakhw?=
 =?utf-8?B?L1krSk5peGpDeVhmNlFpbnZObmxobDZnbXNlU241T3dOTVAxTU5FRVMzSFFr?=
 =?utf-8?B?dW1jZmpXQkRvci9PYy9tU0xicWtBYVppb05HS0Vub1JQeFRZeWR0YXVMSDkw?=
 =?utf-8?B?S3BoRHZ6QVM0emRzc05LWWs3eFdoRVFtRGR4SzhjcHZUNHF3VWlOaWdVeWpl?=
 =?utf-8?B?bC9XeUEraC9MTXNxc2JDTk5CUklkU1hvak1uZU9HMDU3bXJmSVdPeHpPMnJx?=
 =?utf-8?B?SGF3WWh1ZUZSSGxYMmZkVk5qZU45NmJmb2JsSDdzMFptT2U4b1E0d0JDSXQw?=
 =?utf-8?B?WDMvd1M4RDNRMVE4NlBIVjZyMnBBeUNNMnNoRU1jZHUzYk0yK09iRTRSczdn?=
 =?utf-8?B?dkgvd2VoRHJOc3hnaEY3TmJJb0VKL0N4S0dpNkxyQ2NkcmtFcnRwYTUzTDJB?=
 =?utf-8?B?Z1pqN0RaWEtxTzBkdEJRSFhOMXpmSXZNdTNibXRrNlF2SUJycnRkU2VIMFM4?=
 =?utf-8?B?Tm9tRi9CVFp0YzRxdlFyanA4ZS9Wa25hUUxxUUdrNEJtOGxGLzNadm5neCtS?=
 =?utf-8?B?M3BIT0YvbHF2Ynd1Mm8zcFREQVUxUDNPVXkyZ0VScEFzQ3lMNi94MFRiRHZG?=
 =?utf-8?B?S3laTmtYVU5pK3ZFU2ZhV3o3Rmo1ZWJwNktpNDZTQ2JxcGZ2TmJUVDhyY3FW?=
 =?utf-8?B?UnVTS05IUWU2UWU2Y3MxMm1ZeXdMcUdkVUpISE1aUnRNVjlHTXEwdmNOWkhE?=
 =?utf-8?B?M09JWmhuK1dnZ0pEMkh0cGx2RVpIWjhsc1RQWmNhaUIyL1FyZ3JUYUNyUDQv?=
 =?utf-8?B?a0F2elA0NkFZUFBUc3hQN1Fjdnk0dmVJQmdiV2tJSnp3SE9Vd2JnOFpENXRm?=
 =?utf-8?B?bXVJV09HRmV1UEFsRENDQjI2SWpMY3JEU0p3NHZYejZMWVpJSUNNU3gwNWVG?=
 =?utf-8?B?Sm5BQXZTTTF3N1ZHSjJIVWdSUnBIUnJqd3pzTlUzMlZvNTdwVCtXMEkyMjNy?=
 =?utf-8?B?VlhDcm1oSlFMTG9UYTZEZFNuTGtDTytRb2xmOE8rWHM4WE52UWRpNVhtQUtR?=
 =?utf-8?B?Y0ZtSEdEbGNDanpUSW5MZGtmdTduV05RZDI5OEprelI5d09idktUdGRFeFFi?=
 =?utf-8?B?OFcwM2ozbGREOGt1eUNETUtiYjBzVFpETzN5alZUdkt5cXZjWVZzcWdNeXNJ?=
 =?utf-8?B?U3ZFenNmSm81amRwMVhwSndkT1lVR1lmS0RqQUJZcy9IZE81Z2ZVTHhTQ2hV?=
 =?utf-8?B?RzhzNiszUmY1QWJGejRqR2RxNDluSzZvbDJFRklaZ0srL3pEcEM5c2lQWHhY?=
 =?utf-8?B?c01Wc0VTam5OY0hzb3k4Q0IwWGJEZFFvdTI3SU9wSHI0d2ROZXdWQT09?=
X-Exchange-RoutingPolicyChecked: FDnztu4me5F6TMLu0cyNvQ6OwzXE0DDO6HRGjE9TakX+dZtNV2JhFW9qwxTgrGkfHrmHbO/ugv2hdZeVxBHbYkGpDpGDSQcFOeSBJWxAZB8aVkudIcQtOSSSdRDVVArltPEY22RptjOx9BrxwSkzizPli62Q8jF94JqIUMMEK6dJvu5HaexLAm6WvnwBxef1xODuw4Lh0MrLpTLfYmS4MtqHj4WslUhqh/3zeS9wDK5FyIW207+dAa0FX7O1NgQiXtY6alm5wCQaTBVgkQUxpIicYYp9qVGBG/40j8rcL8CIEWh6ovm5+/YH5SCrkm72SHI/mk51pGoIQ34EpryPjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be2d660-458e-48bd-50f0-08deb256ef40
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 07:52:38.9051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUFmLl6fvdcoeDa9xbmoE/iN/pQHDkEBcH7+WbXsM1dGXmpkHwsNU1Gdpzv8W5uZA8+pBYbvZvq4531F4Kryyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6819
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

LGTM:
Reviewed-by:  Arvind Yadav <arvind.yadav@intel.com>

On 06-05-2026 19:41, Tejas Upadhyay wrote:
> Recent driver update introduce support for purgeable buffer
> objects (BOs), extending the API to include VRAM pages to
> better manage memory pressure and enable memory offlining.
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 5 +----
>   drivers/gpu/drm/xe/xe_bo.h | 1 +
>   2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5ce60d161e09..04d3b25c7c8e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -903,7 +903,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
>    *
>    * Return: 0 on success, negative error code on failure
>    */
> -static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
>   {
>   	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>   	struct ttm_placement place = {};
> @@ -911,9 +911,6 @@ static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operatio
>   
>   	xe_bo_assert_held(bo);
>   
> -	if (!ttm_bo->ttm)
> -		return 0;
> -
>   	if (!xe_bo_madv_is_dontneed(bo))
>   		return 0;
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 68dea7d25a6b..9f55b3589caf 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -500,6 +500,7 @@ struct xe_bo_shrink_flags {
>   long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>   		  const struct xe_bo_shrink_flags flags,
>   		  unsigned long *scanned);
> +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
>   
>   /**
>    * xe_bo_is_mem_type - Whether the bo currently resides in the given
