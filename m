Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D56CD1283
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 13:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1490410E46F;
	Mon, 25 Mar 2024 13:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxD30XEI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F5810E575
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711373383; x=1742909383;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iFqqFMXNiQKUeE+tU2vETOu8t2urQ93556ZLcBp3C5k=;
 b=cxD30XEIki3TFy1RU5rylL5MK4BsfZAcAr5wyELNm4KeoBRPxuBf3Uo0
 +hBTs4bzK0MGQ6KxmeeWtguvjvaw8JBIknLLTjvk2D/6CUfAExp2sxyfA
 7AzWjUrRhhX424vNRTd1Dw2NWE5H/yIWPeC/JjQz7G2BTk66prPrl6byd
 LjiogLRt8FhY6FMHrLjGXpxb+b6Urrn+DZlzEX5nFFE9kZwMh8/7QDqa4
 gxeUQymB900kBlXXUWh9nDmeNLIfeWY/5bVNBWAAMUQ7jGOi8MP2XG4l4
 Lw6DbcGzzXaxpL4yMrupHmtoUSQdtPo6iBYK+2gFLTrOQe7UVgTb1ObeX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6501467"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6501467"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 06:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20084394"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 06:29:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 06:29:39 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 06:29:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 06:29:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 06:29:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oj+LQYCorAC3PabIzo0fDV+wU3q9fbMfQzut1x+8dhqQaPDgBWYqEVXmCwx3Ol/fcI9NOTpsXkaxv1dFfv/ZwID5gn7WKKhD0pgV0QLERynVN+k+pt2dT8fp+z8gsCFr7JjOSUFwqgE2wjHogoiyOnsm5MoPFit/FUxs/geYZ6vS3Ue3tGGZTYcbadMb8oRXAzGYgmzRNL3ERDupRhjd+DnC0EoX4DZyascE/wO4Yh1XWV4eF2e42GBc93mwmF5CDCWBsLHJthBiw3xRsk9QuPVhBNn2r7dNZQtPeGLmJHzqvSicyrMI4UtDXxvUcH1BX7IXlRGKcRbIIvqaUZbSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebGhiwzri3JrMc7JnQZLkXYH55+JfJUzHx3TBGZuYiE=;
 b=iuwh/djPnML02oO5pWSGlBybfsHpIr0nJR9jma9rO5RL/IgQFwYM7vINMzyWF6ToP6CP+nu64RqxKXESjzUs/XguJbKhMdoCJTuCri5fWNl0o/2x8oIWCFj+ZzxiJktEfc62CoKh1RmvFkNmRzRZfl/MigdSy3uC885Rz1I/k8XXkCaX/qz8bfq4KrSnR7Gvw9b4M4GnMoSwINM2alWW3W8yhBZSChjZi4J89vZelEuH/y3cXnVlZ4shVhdtu7mp9tFKG+grBR7ADGTZz2R+T6u28IhcHY3ws1x6KJh+8JQb6PKKmjygA2xlbjb2EqnYBYUbSk50DSaEkK7PO/JPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH3PR11MB8658.namprd11.prod.outlook.com (2603:10b6:610:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 13:29:37 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7409.031; Mon, 25 Mar 2024
 13:29:37 +0000
Message-ID: <0e0355fc-c10e-4e65-b193-6b5858c9da87@intel.com>
Date: Mon, 25 Mar 2024 18:59:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix static analysis tool reported errors
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
References: <20240325080550.3217836-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240325080550.3217836-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::26) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH3PR11MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f19735-438d-4e89-2267-08dc4ccf9da3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mJBS5x6piCX6MA4zz9SOIVffBrvOApS+hWqjoUi5Vq9NsTgNxtLqPFVAQKn3f52kQyfuS6McLPgyaqAebvGIBJ2opPd41akXy/l53hzY54QtBqkCay5YbmKM36O/ChTRpgveNSJaX/xL5qdqZcGBmddQgxgkAVuis6zVqkBOpNC2qfYjgIez/rkYTGRMfytmLTYJnjmCC1P+OCQv0XxJMObH46b98Mh6OmE8ZcXPoR0IzfDLUuKgwRjgqRyMOZK7M7YAy7rbFYiC2IV3ndHzN9/eGRO9N+Sg7D13/j9KdDNU694ekt4L5jLeu+Pr68EozgewW1u9JpO1fpXbdFM8RgxAN94MbkuT10kXIuvS36Sxm7QKK6yZsbE3oDsmjxdG8rBP7uCSIbarCTrJm/vG4XREWWnKeQ4xGY4qNUDY+SCO2g1c/anFfVweBiKIQ48kQeJm3J7Ncp3xWro6cqGuCsL+HnF4oY6FLTkhjSTXVkmbIIeJRtKaAaoxet4UkShEbro7Fhi3ikfvUm4yNdhrHStRTrNT5VleJFXTsdwX0Cwk/UyOLydrYLRylW/n/ZfOoYLHkC4GCymBrXbKAamXZvF5K9+jHBwTRuNArlY8rI0HomgP7d0DKCrndRwMdP1XRJkTVvkzwMEW3cJIncQDgKzcsmjdoeAXqE5QPbvrrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmRwbFE3eEpoblVKTzNNNWJwZVl2TEdnWTRFL0xGcWpJd3ZLNmVUTjk3U1No?=
 =?utf-8?B?VjVOOG9sSnJHTFBIVWZnNGlBSi9yektDK0U5OFFoQ3U2dlV3QWtGNXZLaHlw?=
 =?utf-8?B?QkE4bjJZdEVSdjArNFJSeG9yVmh2bE5Mc1dMV1BpQVVtbHNZNWE2dVFwK0JJ?=
 =?utf-8?B?V1BWME90cVdtL01JOFRrZDVSTW8wQjl3ZTNKb3hhQTZPTlFlYlNwRmlPOFhZ?=
 =?utf-8?B?aXcvTlR3dWtGbGZxNFB0dExjcHd0bWN6UzFLcXNESkdjTTc0VmlCd2U4U0l3?=
 =?utf-8?B?ekNzcW1ZTkdVclIrdnZQT3I5a0FvRGtRcTZNMUE0SFlOVC9nNW83bmtzaVIv?=
 =?utf-8?B?dXhsZTlPUmE0WnNWMEZhYzhwbFBTQVlJaldpeFBOMkpKVGlua2k2V3ZsbkFv?=
 =?utf-8?B?VHJNVmxLQ29JZndCRDd0M0JwaU1TdERTRFdGZnNXWnlPbk9IRHpUYjhEakxI?=
 =?utf-8?B?d0laQTNXWlE0czB3K2NZdy9QQmcyTmRqUTN0bU1lUStZUDhxbjcyT3g0SUNV?=
 =?utf-8?B?bXdyODdOR05UcmZlb1dnM3E5RFlhaXNxS0x2MDJpSlJRQVZUUmQ2RWVnN0gx?=
 =?utf-8?B?NGJDc0FhRkJoOGEwZ3dhbGpqeHYya0NMbDlFTlZma1JUM3lOcGNxNHhkeEE4?=
 =?utf-8?B?UjVwcWR1c1lBelJsUHJEVmxJY1hhN3EyTzN0Zy8zeml0ZGhnUVRJTEQySWlU?=
 =?utf-8?B?TE5SVWkxL3NNVy9oTnZZbFUrRnp5ZW0rbmNZclE0SU5aa3JnekZTb2Q4SmZF?=
 =?utf-8?B?YVo1ZFFLRlJLMFpsaHFqU0Q0SmNvWG51M2EvQ005d3dNcmdzd24xL3NhRkYr?=
 =?utf-8?B?N1BxS2YzazFFbUJ3cGZ4Mjh4WTMzaHhEUnNadDdzOXl4aGJEaDZHVzNvQitQ?=
 =?utf-8?B?aGJWRmdTVGd4TURmaWlRMGdzcjVkRU5TR21GaEFUeEhoZ0s1Q2tlN0hRTkt1?=
 =?utf-8?B?cVJNdGVMSWQwSmxzVXF0SmlCa0pNbzJrOVRjQ09MM29vVklhQ3U4UnFqUk5D?=
 =?utf-8?B?N3RndzNLTGk0Q1E3LzB3MllxTjBNeDJNTzhpYTJPRktjVjY0ZVgyMDB0Sjhx?=
 =?utf-8?B?citsb0FYM1FTS1pvTUJQUmRaVi9iWVkrWEt0NFppN3AzN2tjaldYK1Z5a1Mr?=
 =?utf-8?B?N29vb2RUZFM2WmZGVnU3aURra00vRTBqSW8xMmcrQ0s2Z3NVUHJ1cTFNdTRP?=
 =?utf-8?B?SmdoOEtNNklzVTZhb2pJVUFUVllOUVF1ejIzcU56SnJxR21ESG1aMk56MjNm?=
 =?utf-8?B?aWxUVThIOEpLSHc5UVB5aTJGbktOMEhXNk9UbTlkSzduZDZPWU9rVzRKRmEw?=
 =?utf-8?B?NFJhUDE3b2U1WVdhS0QzdFFSL1FKeTl0dE84cmZIN2pQOTlOenlzSG5yR0tj?=
 =?utf-8?B?RzV2TmNQRzlMeEd2d1BodS8xOVJ5eklSaDNza3c2d3k4UVpycmQybE84WFdh?=
 =?utf-8?B?ZDRZZHk2bU1ocGc1ZXBObVZUdDJCT0JobW1iVnpMNGRSeDQzVW43eHFBUEdU?=
 =?utf-8?B?dG96alhDQXFKb1NPaGVIcnJyNDdOOE8wL3BVemZFL0ZGcXFCSjF2aWI3N3JN?=
 =?utf-8?B?RzVhV0N3RFc4UWdZOEU2eXdTWlV0M2ZYNk9FcFBtV04xVTFBeEtrbXhLM1B6?=
 =?utf-8?B?TVZRSjFITkc0cGFwSGMzUXJ1MlJERWI4WDN2YXZubVZrdHhvRllndFB3UklV?=
 =?utf-8?B?eFZFU2RVTG05MjJQV1Y1QldleVRpNmZHZDJHZ01QM1k4WHlFd3RYT2lraDdm?=
 =?utf-8?B?RjRQTjc5ckU5Yk9SUHZNeHNOTlFnQ2RzZElVbUpOWnlZSEhUdE1WOVJFdmkr?=
 =?utf-8?B?cnRhUFlSeVNZbGpzV3o3VHpMc3BnQmE2b3ZZNHJ6Ylh6YTVwaXFNbnE4OVdx?=
 =?utf-8?B?eXdGNW1NaEdvc1ZHbzg1K1puamtvRHBlbWVzelNwUENTNVRvQUxIM211U1hK?=
 =?utf-8?B?ZmY4YTRVK0xlVnFhWldpem82L3pzTG9aRHpQM2FHYlVvV3ZzUkRDTVZRT1lZ?=
 =?utf-8?B?WVBQT29xRWFPQkhaVENFZ3hBSDFLUEZGbHV0OXNsQlNwYmwxZ1IzUkY5ODZB?=
 =?utf-8?B?OS85MTNJWUx3RnIvaEM1Qk5zY2hmYnpTU2crQ1UzbWY0Q2xBV1V4cENBdmVS?=
 =?utf-8?B?Z05sQUMvbWxRdCsrblNUM3lmRFlTRU15M0pvazN6enRTU21HVHBZVkxSYUtP?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f19735-438d-4e89-2267-08dc4ccf9da3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 13:29:36.9533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWDRvmsiPVE9OnttUn+79zUzejr/E6Z+ASKssj/IptM1liHhuMlKhJ1227rfy9vW71o1hZgMqbjsrXnb56G+dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8658
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



On 25-03-2024 13:35, Karthik Poosa wrote:
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
Is this check really needed? xe_pm_ops will get installed when driver 
probe is successful and driver probe successful means root tile 
primary_gt exists.

Regards,
Badal
> +		err = -ENXIO;
> +		goto out;
> +	}
> +
>   	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>   
>   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
