Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114F4C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 12:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C627110E7DD;
	Mon, 25 Mar 2024 12:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpCW1V1l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4073E10E7DD
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711368031; x=1742904031;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Os6E/WpzHN8kJkr52KWcyFYoVDLi+nIGFXo9x9Zw50c=;
 b=YpCW1V1l/LwJ7gS51Zw9Ex3TIQHjTiZjHX1bBJHm49HUfmuSa4an0c31
 d4DANnoW9kkajWo+r3XdUfPD4IRszdMS+tyBf5dVgRGV+3cNyhgP6zkct
 dfELzFN+ukFXO8rLx4d/sPcFE1rgmhhyzpjC1+xLHGRHFRYqEcuAWuC/S
 kJtu99G7ilWGkCHbb80YKVDMvru2sgsh2hrML6k+ne3+/dLgkrF0g7n8Q
 J/3SOU5rIIoiz3LQcQZSOnQ1sHxx7idtb8QBWa6fl+g2GCCXn0p0jIYtJ
 mj6OlFoguIjCtc6MEXPSl9dnXHzxwg9T4Rd5q74NuSaPkmUxCk+b1vkMf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6478846"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6478846"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 05:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20133988"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 05:00:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 05:00:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 05:00:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 05:00:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dANyaaJ67x32NGXxP3gyYiJhO6SZtELzibruI1VlnQXti3qwFSUOa5evLXpoqUDR6DdZwve+Nr6a16WsFOICl0eB3k7xr6LRr7ThuNYxGZpJ70e/4TnlRs1M0rYB3Ueta+FMWEGUseb9wFr2L5aIHFtNtfUbTdX8ZNo1oE1VRD1u02vVuvALJcDaaXjr+WFnvQ35fPK6FTEpZRhrNQW0Qw9JC68ZYibhu88HmhW5QHSUPtF8kDkwx/yT2l1rPHiEj7ueRD8MmSKygUUnvLo3QDI65l5i6T51sYalqxdCleiwu5dFnugben93sCvijnWAPpuUUZqoPcF3w3bK0lOEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqwMOyPqDZPy9EHfKZhLDeINd7T2yfsCgMYGyXUGPEA=;
 b=jtQdDbWkOHrlhV2SXCA7RMQG0Y56YtogqPgbH3u0xW4qCfpoxLgKyISt5Wx3PNOyV+Tj4IPKkKubQfhlBKXDAGF7YdvQ0hx80VkTEA/NaxZzgKnNpY87Gta2ySY7LvMluWCgmgjH6/uWfeXm9agfC5g8X/cAvh7taWHev/7G8LEsHVMvNPsnAqlLA/SSjwWsrp1l8wuLlZInbdIPWPmLhTTArmUsVI5MQ610JV+TrMFnmBWILjTv6ZgbfmYwY/m9+07ozFXr2+MbPeh5NA6eaFHq/wgeNndbIK+kfwhrwzpwqSQnzaYTd0sompJlQa1EVwL7R2OQvptaTu9Zc2kU2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8592.namprd11.prod.outlook.com (2603:10b6:610:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 12:00:22 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5%4]) with mapi id 15.20.7409.031; Mon, 25 Mar 2024
 12:00:22 +0000
Message-ID: <2898f264-91c3-4962-8ff2-bf31a632498f@intel.com>
Date: Mon, 25 Mar 2024 17:30:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix static analysis tool reported errors
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20240325080550.3217836-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240325080550.3217836-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: ba44ff56-76f9-4927-80df-08dc4cc325c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2TGphWsPvvWJxcw6IAI4GfePHnpFcbY7OQYEHtUdTtTZ8cHVBX8nROQ/iq39fRXFDS+7N8Hufj5avT2+IAa7Qq6ufSYHja6lL3YoO2G7LqRhyH+3rw5n/hJ3j4YfWy+NIinvJbIU2Lmg10G0HFLz3OmIvhP2I8WP0atfMTP7jMi8a01Y4g6QCLDly299q3JcGX2TcViXiDpkbY1fHkj+fO1jhvQyUohkEsO33RbhBR+NFh9lUHDZsyJLB4p0n18TkjgL5jr1W6FHg1ph13OWRY8gXj8HbMflESGcDPwAQqZaRP1l1dFf+Y1hDkUmlLeperUJPirvx2/zcAYy3u+uV/eT0hlDbQrxfhJd9m2LMgJtVQVxaaPzfA0GG5/TJu4Sq6KwaHL3InurGMWxSAi9JrIVXjiIjR/xYy+me3ZEp0fMYVZBRps0LLPjoEyDcZH/SwnG7kKjeeXc+pa/vzpDO1wOBZx2wkjlYGYYJxpW9pq36yiHCAN/8vOzIY0jJEZi1teCrl867Y7nMtiS94+dTlar9ofLjUOBUFRdWZk4JG0n++7ailiQE80OecjA7ORaf4XBxF0erjfKDfe7y0pYKfsrzFKmNuFQJmApjGQrQUgIp4A4FKCqj6X8QRrQP8HPL7gD5CrGKOV15AHSUsfjhCtBPzt/C9Ir8lvpL6vyXNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWh2bGNucWxacmp4UVFKRHdHSDdTRGdUbThuQktnQ254TjgxaUltdDJXUTQ2?=
 =?utf-8?B?c2o1YXNXVDBReUlZSUxJOEZlTlVFR3c1MmFXUERZSlJyZTlBVkxUVzRtanZH?=
 =?utf-8?B?cllxYURCdHVuZ2IwM09OWU9CNzA1VlFwY2pacGpIUHI4LzYweldPeWdIbVlR?=
 =?utf-8?B?d2cvSDRaTThoT1U4L0NwQlY3VjRuU0RyVXJkcUlaMjN0OHBnZmFsT3QwU1lS?=
 =?utf-8?B?Z1daRENmUWNtMzJEVEVpTVQ5L0FNUitLaWx0elRreXBIZFdta3RldkVoMFBQ?=
 =?utf-8?B?TkpuOXJkMFZwTElIOEU1R2laOFRZaDU5dlQrRDh0bktJeXQ0Mlg4RnJpcHhF?=
 =?utf-8?B?NWU1VzlyN3l5cUt4M25QMHFvR1dlR1ZmMGJlVGpFekltbnhPZXlzSUZvWEFp?=
 =?utf-8?B?c1JaM2JWNk9saC9panVNZjExOXlWaDljdEx6L1EvN0hEWktHdmVFcndjUk52?=
 =?utf-8?B?UVkraHBmZjV4Wko4U2xOeTE5bmRwNk1KTnZtUkcwemZVdWg0b0xiNjVGTE95?=
 =?utf-8?B?b2JPN25iNUJCZ05hVTlvN1oxbTJ2VkpvcExINERMTFlHN29ySUpFUTBJWktH?=
 =?utf-8?B?U1RUcTVSVFJwdS9nc2dINi85V3hGeHZLVW5xMEZRNnM4endTeUNscEtsZHJj?=
 =?utf-8?B?OERiUTE5b1F1TTA5ZFg1WjMrR093SWxtdE4wMGx6V0IwZmF2clR5ZzZiaSt2?=
 =?utf-8?B?bWhXZlNxMkJEdnFtVDd6VmFUdVRrNzdzS3RtTkhpR2ZtTUN2NHlGSWtlNmQ1?=
 =?utf-8?B?bTZjbzNPaHFRRFNNMSszdmREZVJrOVRLM2kxcEhIaHZhYkFxTEFvQnVXL2Mw?=
 =?utf-8?B?YkhxRWQ4SndueWVlWHBJT2kxUDZLMjhLN25KYXJ2UXY3SG5BVHpYYitzdCtX?=
 =?utf-8?B?clBTWHdDTjc1am1ZTlorZ3dwYUJ2SUU0cVRtaUM5TUx0WHV1cS85SUoxT0Ju?=
 =?utf-8?B?Wmc2dk55engyN3l0SmNUcGh2U3B3bmgybG9KNHl6U2Jid2x4TXltY1h5VDhR?=
 =?utf-8?B?Z3UzdjJ0VUY5NEJ5dXM5dHN6cHVSKzVrK3FWLy9VL2lzcFY5WkZSQktqYTIr?=
 =?utf-8?B?cUwrR2s1UWpOMHpYWmJWbEdKR3YybjNLQUJTY2lybUtOTTVCZjlJOWVwTlc3?=
 =?utf-8?B?ejBtWnU2Qjk0VFNMSGpza1R0YTNrT2xKVVhBaHpxbEZReEtyd1hXblpzNlJV?=
 =?utf-8?B?OGt2QzlqcVJmNkNORlMwMlRsQkxoakpGQWxPSWdNTGd2U1FYS0VMVllEMnZH?=
 =?utf-8?B?ZDVtTElNOFVjblF5akoyU1lMRUl6WGtQWUdZeXFnQmorNEU5akdReUpBYlp0?=
 =?utf-8?B?VUFJVmtvTVA4VW1XS1FCS3dJOUVKY3FRV3AybmZUd3BRYVVyZG9RY3NsWXRr?=
 =?utf-8?B?M3U4ZjNmelFBM0UwcHIxeWY1MEdZUkFFNjZUUHNPVllzNEFrUjZ2T3dkYnhQ?=
 =?utf-8?B?bzVoVmJzZ0R3a055MlF1VXZmVFB6cHZLWDBsTzlDUC90NkN5OWRjU0IzaWE3?=
 =?utf-8?B?OWNQYTNGTWxuRG1RRHZFbFVyYmlCWDQvYVlxczArSVdoMFQxM0dUQk41aGNa?=
 =?utf-8?B?RE9ON0xLUS96di9YbUhKTjZBaXc2OTJ0WTZwd2Z2VC9RUjUwY2VVSElFTE0y?=
 =?utf-8?B?NU53QWErNDQvaXdQb1VITWIvRU95L3ptYzdlUUljeTJHMHVsbmQ5QUtaY3l3?=
 =?utf-8?B?bDc2SnptelJudlcyaHVROG9WZ1dvckwvWXh2eGJPcE9OYlZ5ZG1VNGFzSnND?=
 =?utf-8?B?YUdEaytyenRkMHp1SWJUY0hVeG1YRktmT1d6N1NjNEU4N21BZU51cVlyWEFt?=
 =?utf-8?B?cUpJZFNOcCtzaUxwQmdycnhscHVkZHBHWCs5cWRxaEFBNmxyZHpEVWFWU0Q4?=
 =?utf-8?B?ZS9seG5zbVRDcG9qc2NRQzlydlo5R0pISnZoZFFNU1poeUNqQ1RBRWpLdi9n?=
 =?utf-8?B?TWM0RGhPSzI0T295REl6YzZRdVVudXYzbExZSU9yZlBacXBHU29kenF5YVhN?=
 =?utf-8?B?SWVrR0tsZnlqbHVwOEQrYzJJR0JadFJVZFZKTXFHUmhPUUpsRTIvRjhLZkhX?=
 =?utf-8?B?ZFB1MjhMRHBlWVcxTy9PWG5xNjZrYTNOU0xWYzZqMHh5SEtGQnlla20zaTJL?=
 =?utf-8?Q?ruxMmPzAyTeVZQUunWb9k6pKL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba44ff56-76f9-4927-80df-08dc4cc325c5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 12:00:21.9237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8refDCQE71saa7xzwzUAvU6ToYcW749v+Eo4JGNvpHQaZMd1ED8m6kLP21g/EHNr4/3NyJ59/H187jewYBqQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8592
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



On 3/25/2024 1:35 PM, Karthik Poosa wrote:
> Add a NULL pointer check.
> 
> v2: Release resources before returning error. (Riana)
> 
> v3: Update commit message. (Badal)
> 
> v4: Change drm_err to XE_WARN_ON. (Anshuman)
> 
> v5: Fix XE_WARN_ON check. (Riana)
> 
> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index cc650a92c2fc..f6837bd6f9a3 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -383,6 +383,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	 * really lost power. Detecting primary Gt power is sufficient.
>   	 */
>   	gt = xe_device_get_gt(xe, 0);
> +	if (XE_WARN_ON(!gt)) {
> +		err = -ENXIO;
> +		goto out;
> +	}
> +
>   	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>   
>   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
