Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544F6C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 04:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4766112121;
	Mon, 15 Apr 2024 04:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDJBCldg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9036E112121
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 04:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713156676; x=1744692676;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pWHwm04H1IKL8sIKXlFnmWfKWmKQ0Bn2TMemTmSMe14=;
 b=JDJBCldgHqkR8WmmIOiYr+PZK9FnyopAJI07F/9o3jjolJ0qn5BwdCLT
 tk3yVbG/UQrVdW1/JX7cXUf50vECTstpio4BRoKCy56C0jeMwWGKvw6zE
 K7m9Xyui70uKM2sXXRBfQe5RBEDz382teAZ6+P0fkg208kllMTz25EYHF
 r5cSP2xPVhdVMBTKOkumo9uE2IsuMEpy3M5L9KEIRhpuzdaJr2DoLOozp
 qAmqc3WaeXl+1h1XVR4an6gkAXlOuH/wV7dV8D4/uno79HrYwZ5190ieR
 ZVw+rYJi35fYB1N5aLJ8Nmo/ub9mbgwVdS1DMNQtHVd9Mox7BjykK4c4g w==;
X-CSE-ConnectionGUID: TAAcJ0pRRGGHJAZu6Y6WFQ==
X-CSE-MsgGUID: 7L1hoJVJSQWbLaRn6FDFoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8748319"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8748319"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 21:51:15 -0700
X-CSE-ConnectionGUID: e6LqVFLiTHiUG4LUz23d5w==
X-CSE-MsgGUID: wyGXtI6JTmCxp38ICC5DtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="52733161"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Apr 2024 21:51:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 21:51:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 21:51:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 14 Apr 2024 21:51:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 14 Apr 2024 21:51:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHIfGtXWEKu+n4klSd6b0PnTg0+GeOSVrDy0+vKu7h3wSfBQ37df5b/JfnDxiejJCPKtqoIvGVpaWAWBAjrN5XIeR8O4ncG43ygFH6QlB14NXtZMsUoNdg0wdxUXidAgN/qTPBYfTqgqr0LjPIcsfImWBxLWVv0ZIj7LYCHI7uVzoQZaCrOptl7pMCBYHQZNv23Fm+M0xozHXVdAuSavbIdGMixNmW4MUSKVLd9nep3FqRIyb2/gzS35wQbqKCFp+jE3dKKfuTGkdGx8D9Opm4EA8HQjEC9EWlkzjeeArVsAvJFtalYA0tW9CxgMlPsyFozNcrtOBatKuJzhG8x6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ot17WHp35vW1eHvqkD/ZGCjCwXUCRRZZCATWG1Q1Bfw=;
 b=GclJeFM5klEs5rxsEUE0rZhwDru28pl4+eUIkBZ/krs/bfg0hdurJjATkoZISAqR5+GKneYOP3Rek1IZ5g+U1lMsvNj2GULHPCvz9+/ExAYPX7KL3KjUwu52KNZw5sHOQf0aleAtDvkSK1nGBTmcjCDIBd1cRGRdiN81vKLw3ATxJ3Hp4aoZtd4uImAK6lInyw5qtQdcP7/rB+jAff6NzFmUocq/c/qPBL1OsPZ/oHUzkEIXMoskUwGxbY78CcPzv+dEREQB3ZXtxkIQkgl6YpEyJywxfBDDxFAHCtm2qOQV+DmtnZsDdHBq9LFDdhjl2lqVV7zfsKjDcOPy1wJ3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB8528.namprd11.prod.outlook.com (2603:10b6:510:2fd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Mon, 15 Apr
 2024 04:51:12 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Mon, 15 Apr 2024
 04:51:12 +0000
Message-ID: <a14d8893-3726-4e56-ab0a-7be9385a2a72@intel.com>
Date: Mon, 15 Apr 2024 10:21:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/xe: Add xe_ttm_vram_get_avail
To: <intel-xe@lists.freedesktop.org>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240414190137.1243-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a91bce-ecac-43fc-2fc3-08dc5d07ac78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q0dcK1/muwXF0sCQZzxXLeKI6eMB/t6Sacxjhd6Lb/WuTt8tnM8lliMAHll/37NMvKhskDWgX752ccd/xgY24AoWYgBhDejXVecwqtukhjxlPIyHkDpL2SzHmCUJqDRoUHpfL7GRm0f0npXenxsiOSp8u6LP7ydRpaP8IWREvb74vGxEeRjHOm8cIPtgmD9Kt5cFQG+5NdM6RvH5qBywZ4qRaZXbFJgLfLmoWpbbM+0kcvjnuQUYQPQ4ZabR54i8oakeUxtQ9roPByBk+D0N5aN9WF+OY4UVQnQlU15+3ZHnMdZU3ZFajsMop4hpuus7slTfKdpza/GMFLZvhRHnCfGFtZqPpvVNG+Dwkex34fQ6CuxlCdRobiPW+SbkERXJyg4fYCjXBVjdiTKJD2u2v1I15HaQ+K3IIeThaSZy4XkPLZr4i5Cd4XdnE0LzHcXevsw1GtAnbPsSbtlRdJRQZhrLH+fB/rfKy8gvGy1ot04SFxYrRhePjSSFafUdwVbnJKs7QiOrItOhA/Xld4qmU0Kd1Ld0PcgBil3jiCaOtMxVw4zz6/yTVl4fEaLAMJJD4yUsnOXnfLFB0D2l6dB2FBpcV/0u8jsmSlhBTycSOzCLEV0ZPukVfZzi7gMF2ZlxfW+ih765T7DhukOJagLW2fusQl4yT5cSiYrbI8SI8vM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGRuMEFQV3hhU2luWDhMWEV6dndvZGxreEJIcXgxaVR0VlJ2bU5UcG16Z283?=
 =?utf-8?B?bUVOWWpzV3ltN3dzQlpDZVYyTjdURGZEWUlSdXJkWVRoQWxNZ0dhc1QxUFRi?=
 =?utf-8?B?Zkp5NlBERHJEWlVmNFRYUDVJcnU0NHhuSUdnL0FmU1Fzd245WEtxQkgyUExV?=
 =?utf-8?B?KzRaWHNGWEtFK0phdHN3dFdwNnhpOHlSTUpienN2c2Q0djJEZ3pkenRjcC81?=
 =?utf-8?B?SVZ0cVRkZUsrYmpwbDliQ0RqZjRibmh3Sks2bkRrdjJvbzg5TDdaTDZmL1d3?=
 =?utf-8?B?VEtTbmEwdW56bEN3Y0ZoZDlKeU9EbUtVbzl1VUFEOVlNS05iZ3NoOWh4WFdy?=
 =?utf-8?B?ZUZRL2E1Ry9HTVlpWDNkYklLdjRnSnNVb0hySWhWZFE0WEJzWVNGdG9MbmZq?=
 =?utf-8?B?YmpvenBPVjRPNE1KZUh1NWFsQTM0OC9qditSMzdaWW9rQ0RNYjRjclNMWkFt?=
 =?utf-8?B?TmgwZ0FmYnhVWVZ2OHVsNnhJV0ZMV0JjV3ZPRW1XV0JZTVI2MXowQ3Rudjlk?=
 =?utf-8?B?cFBRbnlBR3pUYkE2VkNZQ0pncWNRK3BFVllEV2J1SHVENkplR1U4ZDRhK3Rx?=
 =?utf-8?B?WU9NMUovdmw3MVNBMVovdkdSd3hTZUl2cEUvZzZhdnpaL3pJc0FmZnp2Tnk5?=
 =?utf-8?B?U2s2V1lKK3plK2dERm8xcEMydWdkVkl3MGk0OG5DUzl5ZW1XSHRmZDVsemN3?=
 =?utf-8?B?MXgvSVVhRXNjZU0zenUzTUlzR21GWlBWN2Foc2ZzMk9lTG5JQzJUOVJtdk95?=
 =?utf-8?B?UDJBbXg0N1VyYjhVcTZzcmRkbXptR3owdXJwYitsa3FtQ0ZOSUJEczBBcDRL?=
 =?utf-8?B?OTNERjVhZXhvMXQ3dHN5YlRYamNJQjB5eWc5L1cxbTdjUTIycEFlTHAzc0t6?=
 =?utf-8?B?RFZWek9MTlp2bHUxOFBEU3I5a201bmZQU1FnTVoxYjRVdnBKT3dvWUxBMk9q?=
 =?utf-8?B?Mi9sMERwU1ZlMmZxOHlrb3EwWitJbnI5Z2o2REI1K1p2NnF0MnBnYzFFcDA5?=
 =?utf-8?B?azZjd2RqVzNSMzNFMU5SV0VsVzc4dWRJbmtCUW12L1lqZGRBQXdaY1V2YUhm?=
 =?utf-8?B?bXA5TWFIR1JLN2U1cnVSRWV0Nzg5U2RaSjBkTDVIbkttc3lzcVY2MzJRNWhl?=
 =?utf-8?B?ajNHeFZDdE5qVkhiUkErVy96cS9RS3NaVm54QlkrR2c1NzFZNnRSK0hFUGpm?=
 =?utf-8?B?bzBLQ3NsL3hJdVFYWHN3K0hXRDkxT2g2MUY0TTJScEptQWJCR2VPcEx2eDU0?=
 =?utf-8?B?TW92MVlPeDhTYW1FZFFqVmRYZlF3QmpzcG9RdGltdy9XcFFMV1l5Ym9ldS9x?=
 =?utf-8?B?dDV2ZUhsNmpRcGpYbnVvc0lhbFg2NTJwVjRNVUdjU1ZwQVc0ZlVDV25iZ0tl?=
 =?utf-8?B?T3hZcitidmYySDhIWmdEQ2tEbXVMeitMVUN4QVVzYXFGNVpxQ2EzQmtOc1c5?=
 =?utf-8?B?NmZqOUtPVVIxbkZNUTIrdHdkZFB0WWpoWVp3d0VJQXdMOE1WdlBTYVE1dDR3?=
 =?utf-8?B?S1dodFZhT05lQmhkdnBoY3pTUUhpbWZQNU16OHlSQ3l6U2pRbHlFa1JZNGRz?=
 =?utf-8?B?b2dBdnkzc2hSYks4bGhPOVlDM2JtQnc2NzBRZXAvajNlL05uOTJXeVdxdFJK?=
 =?utf-8?B?L0FHMmNxMlgzWHFIelQyUTZUUHdPK3c1ZWVETE5BZXlMVHhPK2VwbXJKL1FM?=
 =?utf-8?B?MEJ0bDdUbGgzYTVGc2wvRTFKYUlkbGNmRTZsdHNqbG9iNFhzTzZpYnZpZUdR?=
 =?utf-8?B?aml6ZTFCL2dzaERmSzh2QzlGU2lUbmdzRDRCenhLSVQxcFcxb1BDTFRWQXZO?=
 =?utf-8?B?UWsrZ2tFOTRuQitYZnlxNWJ3dVVxRmlxTVNRQWszWWxsU2RseW16azI5NmRW?=
 =?utf-8?B?R0ZmRDNtZCtYWU01TlllNmFpRFRxR21qcEg0OWRyZlZOcFE1QnFHb0w4bFZS?=
 =?utf-8?B?cUpMVDBqL0xzbkdyRmQwVk5IYndDb3VTM1dkOVRHL3VxVWlWakdSTkFKZE5j?=
 =?utf-8?B?M2tLRmdwdmhtVWVkb3k4dWMrM2VNUXRFNGROa21BV0RJbFl6RW1mdURReURr?=
 =?utf-8?B?bUhRZ2N2U3p5Ym5zcTA0YmFIQlJPUk1WcWt1dXN0Qm1TamxZOWErN09Xem5O?=
 =?utf-8?B?bURqRUFmc0NxSzlLTmJMYnVWWWtBU0RoeDZtdzM5UVJId21YSTdGN2NIMUhY?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a91bce-ecac-43fc-2fc3-08dc5d07ac78
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 04:51:12.2080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNTBCmzbGk1FiaVDGeSL6oP8IMg9t5pd1iatFqHG2gE1h888euGRTWJrsMxZab0z1Bq6rXGMIFtBt7dnaGc8uvxSrJq4vm2piHaWRibo1dU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8528
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


On 15-04-2024 00:31, Michal Wajdeczko wrote:
> The PF driver will need to know size of the remaining available
> VRAM to estimate fair VRAM allocations that could be used across
> all VFs in automatic VFs provisioning mode. Add helper function
> for that. We will use it in upcoming patch.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 12 ++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  1 +
>   2 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 0678faf83212..8a1f460ff20b 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -478,3 +478,15 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>   	*used_visible = mgr->visible_size - mgr->visible_avail;
>   	mutex_unlock(&mgr->lock);
>   }
> +
> +u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
> +{
> +	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
> +	u64 avail;
> +
> +	mutex_lock(&mgr->lock);
> +	avail =  mgr->mm.avail;
> +	mutex_unlock(&mgr->lock);
> +
> +	return avail;
> +}


LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index d184e19a9230..cc76050e376d 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -25,6 +25,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>   void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
>   			      struct sg_table *sgt);
>   
> +u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man);
>   u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
>   void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>   			  u64 *used, u64 *used_visible);
