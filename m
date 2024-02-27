Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D4FC54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 20:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEB710E3B1;
	Tue, 27 Feb 2024 20:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PsyvLHJE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02FC10E3B1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 20:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709066291; x=1740602291;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AxHHuUOCe4gA79TSfWLwqvf9qHF34/fYpCOAKAOu9PM=;
 b=PsyvLHJEnz9brnS3/VFDLe+ITzbKp7fvHKjjMmL8sEFbmZLuhlJ7l1Gh
 EfawzgtpVKDlovqpxYD0r/JSKtRfLnStryzPc5V70OEthmXIUDIXf03Vx
 CO304avCHB8eBZ1Kixoa/Te7t9obQzmrJz8Ve4uoLon1DwoSmm0OQ0Sqq
 WcseXxN28UHEJF9zvBWXjquiauXneppod0R4tvv7v/UwFYIaXLypCkW6n
 WB/Cguy2hW032kacAucUn4BQ+UIhTNYaVbak5ChfODcwyX3sE720zZYwP
 0JqPRkGS10gx9ESq4Ct9aa4WXohI2aw/wDpbJdvhjvHWtbmjuyYu/Cjrx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25902004"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="25902004"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 12:38:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="11836675"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 12:38:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 12:38:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 12:38:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 12:38:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBeKJK6lOcFWLbI2vuzpaGpEbanTMdo5ptmCJSaIwDCrxI8ajHSSbM3+EDOrIFjsYIsbjKMkb7KDy/oV88e0nWYQ+1ithNkqxJWUSQyFvOZonen6dDEj5b8l/f6aLKzOguTrfEcYdNsedUZZFfm/E28q/F5JxGJTUvFtH/hiROfmnrt2gk+PYhj1e3iELuYJcnkT3cnwR2x0OHHkgMuGZIeJFMzTk37vOdSl25aV0tqveGF3nA7nV/7KSZ3yqL2JHuzAW68sYhAl/eg/8IDee1CKtft1WAeh+unfkrLfnRfydKZBsRwhLSwSCkdp8iaaXzxd3HwmpZho855+/WCplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkLwc03Zdim+J69qaZ6qH/Z5SX1Ox6QKLI63C7S/ne4=;
 b=CvAy0F6PbidVEcJii99BldhuirmhJmrMRG2CXZrgMVvbsMWc5RqqUj25K4uyBsBypYmMEPS/31APpY72llLXckAxwuuEZJndvD5GWuiY5IEXcMmPKXU8W+N9qe569kWq94AFGAbuT472eIALynHg6ROA/ql1JLCxaGMXNVuHEKUU/So3zmjNcqfa8DjSnP4akdcgeKe6MNnXygiF46XoDHI6QwDd9+z1WXDqxve7pTesFlwal68OiB3FUEZGDEyQwXYDTVAPrz0kWgGh3Biw7Bt4H2YIgeBlTqUHRUfGunegXiP/MB8qSU+BFhfD7xDccf1bhpBDcgZjNmEmBJWvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ1PR11MB6180.namprd11.prod.outlook.com (2603:10b6:a03:459::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Tue, 27 Feb
 2024 20:38:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%5]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 20:38:06 +0000
Date: Tue, 27 Feb 2024 12:38:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/guc: Fix missing topology init
Message-ID: <20240227203804.GR718896@mdroper-desk1.amr.corp.intel.com>
References: <20240227164922.281346-1-zhanjun.dong@intel.com>
 <20240227164922.281346-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227164922.281346-2-zhanjun.dong@intel.com>
X-ClientProxiedBy: BY5PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ1PR11MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e85c78d-dfa1-44ff-a827-08dc37d400ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hRZ52LFf06GHgEEYi3jC9ZnUvoUGjiqy7TDjN7WYam/njC0vZJiXZVYKozpb0OC1tmI2hH5VndZk/xtISbuQnc8ZlZAhPyBbDHSXYBwz4UemmB/smyAVXLVhdcen/+LYLcOculDDqeQHUthc0ruRyWnewB1UodgBljk/+O75/LyemFnvJb2eYfLZpja1RBF6AAIapZ3KPWC9V/loiKI/0ENDchomVhWJjNbRUwT7Gp8pF9emL+nHFmwf6tP+bFm+GrlOH8Rj0QWmg37FZ6C999P0xC12G0VRpPANZxg6ahYSzY5sOU95moJW2UAW0TmHbdtu+K3d5EWakSASPs6nyDbFj0cvR582xu4a9a+Ca7q5X0D48kAUXLF9jUiLMGFJWLUJGwpIMoL5qosKP0xGVB7Ulikhg0aJUVo5+MB+X3iOVN19rtHkh89u25lKvMXvOdlHmU/aRJE9NST36zr53koTuWKh3gXMlyWj7LsgqVKoeO/SsD4I75EhhQwEwsLYemTX9Th4S9xFpxS49rynGAnz8/IlnvkULuperPHP6/DUjsX5FozW1LsGl1hdGg/oHXVpg0jvJguaNcKVWj2KM3sNp5ihdljoRW441+IpiMRN3OVETGO1F4wyEzJQwOLdMZeI4r4dNVVobGuCpxQAZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V01IdDBpVCtGV2Z4VTdZWUp2TlFVT0VCTXBWMU1ETUErdUx0aUJ2dC9MckFm?=
 =?utf-8?B?emhyRzFYbnR2WGNhR1BybHlSRjlCamYrTFZLNXNPcjVFRnRlbW1OTTlUc01R?=
 =?utf-8?B?Z3NIV0pZZ1AzbUgvRDNOMEZNYTlkK3BQS2pPUUYrbmEvWDcrMS9qZm1XWTJF?=
 =?utf-8?B?SERHaEtYZllSOUFOZ3pPclMvSCtWTE9nQ3BJNVNrOW5jMllsUWRJaHlqRVFT?=
 =?utf-8?B?dHUyeEk1MEVjNnFqanVENnI4Skp0ejZETmc0ak9PNGpGeVpva0RVMWpGb3JQ?=
 =?utf-8?B?T1hiS3FhaTRaWmJ2TSt1NlVnUlFsbS93dmQ1MzJ2TVpJTHZHMVN6bHk3RVhD?=
 =?utf-8?B?Zzh6d0hJdnpSR1oycmFpMklQTjJSUTJ6ZXB4aGJ5NG83ZHpSSjRTN3V3S0J3?=
 =?utf-8?B?SFZNNUdlL2U5WFVOVTBLdkJJeGhZMEFnWkw5VGVGMWVDWFcxQ21sVWRrclZu?=
 =?utf-8?B?OUFYcmQ1a3hyVXU5WFk3REJqaVl5Zjl1dnMwZGZwak1oWGxuV2VPSHdXemJD?=
 =?utf-8?B?K3NnYldKbGR1N0JDVzdqZTFtdnZSSzlqVXp6UlB5a3BQa0ROVzY2dHVzY2Nn?=
 =?utf-8?B?bW4ycGlaMFdCOU0yWG1XYzZUSTcxdFloeXNHUkd4enlXdUJNTUJydlJ2UER6?=
 =?utf-8?B?ZVBMT2U3VFQvaVFIeEhOZDEzNVFYdFVzRVRsYVBZbW1RaUlEcnhRREIrTUhw?=
 =?utf-8?B?djhpMW9EVWZMZk1UYVJYaWVoNW1vVDVPR2hiNGllbmNpcnc0bkt3SW9hM0hD?=
 =?utf-8?B?cVlGM0xxekJvU05nNXd3OHNtaGJXT0F5cWhuVEJ3TjJIVTFtTkZja0ZIVHZG?=
 =?utf-8?B?RWdTTEZZRC9qd0QxSXF4d0s0a2NGT0RiMTQvVis5T2xsTlVvVTZCUTkzS055?=
 =?utf-8?B?Kzg4eDJHamQvejVuYVFmUjQ0akdlZ1NpR3VYMUlxZGNUdldMT3ZCa3pEYmI0?=
 =?utf-8?B?bEh4d2FmZU9UeVdmMGR4UDUvS3JOdUlnTXdBTWtnNysrclFOYzd3QlVhcnZx?=
 =?utf-8?B?WE8ybXl2cDE5UUFyNFVCeTQrYnhkcFp2aDZsUXlXN2VyQmY1ZlNiNHQwYUk4?=
 =?utf-8?B?WDhXdmNHdkYzdjhYeFVZSVJMcnZ1SnM1a1J5RzJ0U1BlcmRGZG1DUWtFbTVo?=
 =?utf-8?B?cHJMeUpEcTl5V2JBUHpNS2NZcmFKbFljS29EUEt6aVYzM2hHV1ZETHN4Qmdx?=
 =?utf-8?B?LzFVT1NPVFoxbjV0eWN1TCtmdTFMNW5oNHN4ZzJsZGc1QU9uQlRRVzAzM3V6?=
 =?utf-8?B?bTlxbCs2eGZydWM3V2Y0VkNHeWRsbHQvbnNEb0ZpaUFIS2RCMnM0Z28wMW5F?=
 =?utf-8?B?bDEySW9KdzNKYWY3SzY4SW1VbG1abU5ad1pSTk05OHVoTWJsZ2o2ZXNRN2Y3?=
 =?utf-8?B?OHZKSVBHZlIra1F2NVdyTVAyVmg2ME1IVHE1N2lMVzVKTHBWRStrV1BjelM0?=
 =?utf-8?B?d0NXSVczZGRKZ29RT09ta1AvcVI2bU9xdFpUYk9qSXJ2Z05XZWdBUEdDWnBG?=
 =?utf-8?B?U1NLaGp6cU1qVWVXVXRNYmpvc25xUDc1eFoxWUZYalFmS3pQZVZ3czlWdE1m?=
 =?utf-8?B?RFZBSlRLVFRRVENGTkFaK0NlNFJyM0psK3A3QThsTThmbWU5YWkweG1scXJO?=
 =?utf-8?B?VGN1citVU2tnL0Q3bVFqakNSL1VBcENGNXlySEdrYk1aTk1vaGtyK1I3Qmt5?=
 =?utf-8?B?dS9SNXBhbUI4UWltM0hUdVd4cGFBekpieVFTZXo5Y1krMGRpOFlPQmRCakln?=
 =?utf-8?B?RVN5QjZIV3RKSnZvMDhxSTJpVjlINEMzck9sZHlOR3dEeU92c1JNK01ZUHNH?=
 =?utf-8?B?dXcxNXNiS0s2UndWYWpuSUVUbFFlSUZMMzh2Kzc4TFdETGR1NzRRcFFYUWRB?=
 =?utf-8?B?MDRobEtLV2dTVXpUOFp4VFJYbUZxWDVINWJmRFg3dlc0b280MnYybkhOcTNp?=
 =?utf-8?B?M2NLdHp4MURFMmNrNUxCM1pjbHZ3dU1sSU5sbUxycDZwYnFueHN3Z1cxTHVK?=
 =?utf-8?B?SzJGaDRWck1LbmFQMW1acFVZeWtOL2F2dlYrV3MvQitZb1FSZHplN3FqdXM0?=
 =?utf-8?B?V1NoR3M2eW9oc1ZvUGpUWnBTSTNuV21JVkkrd2xGZkgwRlRwekFjalo0bVRI?=
 =?utf-8?B?ZmFqenhzZ3hZK0Q2c3Vwa2xEKzVqSkZnb2VNNUdGRGRnMmVGd2tWWUZ3SkRV?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e85c78d-dfa1-44ff-a827-08dc37d400ba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 20:38:06.6180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7Xqq4p4Soyb+M1gbHmHuZhJXOnZfJS1JrObEQmF6Wt4ZsRkgnEtzz+l+iSEay5gWAH7GbsOIthl9XcdDAWuPMEmbDJ+QUkB/67/8V0c5W4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6180
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

On Tue, Feb 27, 2024 at 08:49:22AM -0800, Zhanjun Dong wrote:
> init_steering_dss need topology dss mask to be init ahead.
> Fixed by moving xe_gt_topology_init ahead of xe_gt_mcr_init
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

We used to initialize topology before MCR; that must have been
accidentally lost during the recent refactor.  So that means we probably
want:

Fixes: bf8ec3c3e82c ("drm/xe: Initialize GuC earlier during probe")
Cc: Michał Winiarski <michal.winiarski@intel.com>

as well.


Matt

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 45646d3aea2d..85408e7a932b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -315,8 +315,6 @@ int xe_gt_init_early(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	xe_gt_topology_init(gt);
> -
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  	if (err)
>  		return err;
> @@ -503,6 +501,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>  	if (err)
>  		goto out;
>  
> +	xe_gt_topology_init(gt);
>  	xe_gt_mcr_init(gt);
>  	xe_pat_init(gt);
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
