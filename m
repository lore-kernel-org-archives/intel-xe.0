Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2DBC197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 20:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ED210EB78;
	Thu, 27 Feb 2025 20:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Po4qwzcz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677BA10EB78
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740687700; x=1772223700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0RB/e7VreyUvsXpgsFHYh4/W9YkcVmKjk37c55UFSTs=;
 b=Po4qwzczf9AAqrSoVzf9VghQI65gTV+XaIIarCJJTre3xJTxEFzxqVwt
 Var9qAe13YPbruPo66MuTUv3gEK3IoglyUixKwbdB3Wel/LMqZrCa6KWi
 zOsn7QDS2HyHy2F9SrpVmwcepbA2qswI+lxfheukmhbGSVPUg0bJdZIJ8
 q2vOatxyCfQTk3MFTjhdEL44gubxj2lR+yODM/5/VkKAzEJm96F4wmjnR
 BAL8WPbFL98v9Jw0xbHGnoHE6BZNzkl/iN69tUXGVK56MCc+vag9EDpFT
 bkSnP28e0W/Sf16NgE5VTgRjwkctEtzniDlI3rLksBQYiRFNgdP0/93O/ Q==;
X-CSE-ConnectionGUID: p/7tsKpVRJ+hCLJLrPg2Og==
X-CSE-MsgGUID: aMXAO8sjT9Gsg9GNBPx0eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41303828"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41303828"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 12:21:37 -0800
X-CSE-ConnectionGUID: 42o8ig/DTjeDwDBN1zw3EA==
X-CSE-MsgGUID: lFaXIkypT1Sp7ciDD/N8jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117123044"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 12:21:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 12:21:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 12:21:35 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 12:21:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4p/ZaZnZamIops7vudayG/L0Wh9DrRuxjcluKzqz+/mrFq96pWaEVSAzYm5TafWVKGrAN/FaJ9zSSwAnQ5QlB/1gJI+hMVimQL5j9e0hW1Cu0Yjd3bnbKtYTlEbCExrajMjdBp3ROobKvsxaf+bgfMcsZmAW0hCnw04QcSGmolUNI7KWB3xkFiOzwo3S1zJSCUa2+iKKtqQ8Berw2wVAjCqoR5fetaQt+5X/p5spBxPr0o88xTKMGH0fyFPBlSd8l88YAPYwu3QqJERJ8Wja7z0PWKlK7jteDcVhC1SVAl8Yo4YxVnazeQwPV9B1HHwK/03D6IUrXWOCwnuy6gbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4AkvMLUjXgjpEV7gcY2Fsa33eLFUVITg53KSMd35eM=;
 b=moh6q8yI1MyE0yYmPXmMf6ndHP1LJQcCg7vneJk78BZ5ml0p4Yl7Jyyr8Suyc6gdlvcIDfHRG3Wf/n1UF87YfMC/n+62d30Bi4g/3QBsSi4YcyuPvyRDHGDaJeW9PaTGSX5um7i7DVH5BmXD3RIpUcQwNadUvTtB+WaN7721YP4hufHSnMhfsT7mYjEjildVUEEQDBIzK/2QQjBUzmaC1sci4yqNpVmTgNp0dW+jtnO1OUDpH62jxdSZ8bY0imv7P9krC3GjR3eYE1YkytmFT7MhMcl/Tl/ax2c+FBBgDiZocEyEimI6TJNOgSLu+dniw3uAGHN0DlNL6+Dl9KXHTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Thu, 27 Feb
 2025 20:21:32 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 20:21:31 +0000
Date: Thu, 27 Feb 2025 15:21:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 01/12] drm/xe: Fix MOCS debugfs LNCF readout
Message-ID: <Z8DJSD3N7YneSHTc@intel.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221101736.78986-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: CY5PR15CA0126.namprd15.prod.outlook.com
 (2603:10b6:930:68::16) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DS0PR11MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be65238-cd9e-48fb-ee68-08dd576c52e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pas0w+oVLbX3oVBhgmyay+A9pjaLqi1wRu1/xLueB+JUfOb/mOoKpHyDLQc8?=
 =?us-ascii?Q?FvWABnE+Dwqw38woff9S7IcbosqZP44MVARd79XZVm7JWx46Rt94uSuF5+Um?=
 =?us-ascii?Q?rUQG4uZkR4ftJy92RKFFbvtV4WGlBSMEdFFVf2InlfWtJ4S0NmXMA9M8mGtW?=
 =?us-ascii?Q?vcAK6RiGM4bkYDHXMZIn20zVksU2OXzwIzhSRx+ugvKsWdb3ps9OsiaVHcj0?=
 =?us-ascii?Q?Ctu3RPentgtxAcWHrxtvtI3wYPbjclkBec60huEsFPq15aGiW7fzJefkQzeb?=
 =?us-ascii?Q?O5yJNLw8nKUn/Ii+ndKWaqXY8h7yvEC//XyI50J4bxXKp18lCNlmn2oDhYP0?=
 =?us-ascii?Q?BMtMcWWeU9B3PGxHRQfY4po4OW2+yt49lwEr9TB1WMg3bpkJb39kAh1XlFA1?=
 =?us-ascii?Q?1ExohIIrc2IJwz/6NWS02ftKeotES8rUIBb9pFcpzaPuKjiucTD2Jn6vjvoe?=
 =?us-ascii?Q?gRR/1Gf/OayTqGpKmy+FkWMq2paMsZDyhwgI90MMmdfuOMfW/kjYJrE57bRC?=
 =?us-ascii?Q?FjjfC1AxRDoQkg08Q5LrMJ3uFxEAEHF+CdMGWRGdk9+MtTCchddgIEJUN/HS?=
 =?us-ascii?Q?JKiGYaUWaOdkvYBxUH6Kwuh8EIIvjyD5lI1U9zl/hrHDeZm02+nLXoRG/Eio?=
 =?us-ascii?Q?bvtpsgRtOuu+oGGSwEId9gZLygQ6noKygAJ9Zsww5hBGl5UagkFTSlPSj9hJ?=
 =?us-ascii?Q?rXIs8GLZZkIVZj+jfCe7jzg8b49/bmPvopSpBX89nAVzC6n7dV0e6EsBiP2n?=
 =?us-ascii?Q?PxPDlG2S6hKXIQxegx6k1GVJvztYQsrmFjfnqf+5qIB8V88LmDJIbS1kep9X?=
 =?us-ascii?Q?6TGk9WuteQBVNPtl/lvQ9BDL2t5NkHMBas0T4FCRVdax/QENT4Vcni69kNq1?=
 =?us-ascii?Q?0cB5y8fJwLEPHG5nXxEYkEYdASIbJG+QpEMeLROxkLvtcBfzUSDb1+weTF30?=
 =?us-ascii?Q?dWpZtk3BXfapankTUro54+9sTXz4kAhpBH0k6ZKTlwLldu2VIJeN8xWpNUO2?=
 =?us-ascii?Q?NhthV+ebK2qPJHNd2Lwzfy00EHD/UoUK+EOaPKbaHwylQLD4Cr1w9jjXRBEl?=
 =?us-ascii?Q?zLHJrMoaGf9XwUvDWfrA45x3cjlU4MywkelMwQZrR6U/18mkaIwsfoUnXinr?=
 =?us-ascii?Q?cAiPqWP/gEIJhzqLREyF6ZOp5c+lpMGoJAGRq2JquRJHmnTlXlP3a8Mf/oq7?=
 =?us-ascii?Q?zcde8RFc9aWv1Mntz8FRzhMHL4j0QLNomFmPhjblUEwDx7LyLBw7ZFEk+WJQ?=
 =?us-ascii?Q?zKFv7tc6xCsEX26Qdr8lwCrA06pYLx/bZxnup9PBJeBakL+9EV/8nrINm8BL?=
 =?us-ascii?Q?biuEIBnoId8oObKFG4SeOkueTcYXKapeHOz5rQXY+e/TLqDK1xb1ArehV2+v?=
 =?us-ascii?Q?3PtSvPEwFpHZDdDFi3Cq33NTCA6X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KqBT7eesk9XHUBxi+ZJoSjFccLsL/EDpoIebjsb9PEASp/BhwCi4E88jupIE?=
 =?us-ascii?Q?3O3IyS3bIGS9CBCs4b2TR8XYgWsoFpQW0DFRXS3av7XXEwDujCTs+JO8VhiB?=
 =?us-ascii?Q?883FnUoPQOB0XE6LsN0ovT68kKnoIB3vNGb3o11REjltUfLz+VnzYtfZcfKM?=
 =?us-ascii?Q?Xh6mtJFEmZvSKG0sEVAO72TfsJfustwhr9NfaFS6VA7bTjqnr8fhWi8zypJQ?=
 =?us-ascii?Q?jDLgwGQOsJAVHqF3fIsTx9DOFbWGOnezZOD/0va+OH8lbO07CPZLOWPGYHQf?=
 =?us-ascii?Q?7U84M4BzIh1aKIUbVm2fnUevh+8inrb///1+GvA+g5g1fp0CExn+RSllX9GQ?=
 =?us-ascii?Q?rnAm4iB9M9cTASUcxkoC8z6bfi5GN69cda6ev7cI49NDjs+nfrcaaYu2KFX8?=
 =?us-ascii?Q?UxSqqeu5be3midwQAOK1p83ISNmyq0p/L7IzSLAEE2pJtTSPwP/a7RWgsIOL?=
 =?us-ascii?Q?WEeXocqXSL5AGxtfHCHlEpN7ujP3a+t1NiMKhgrK97Q+JOF+aTD3SsmKT60m?=
 =?us-ascii?Q?t9youkXZV3y9cn/SWD3Yjj/zrtLrCes05Iblyb5NwLcwceWdJV1vbUEw1MlC?=
 =?us-ascii?Q?it8umyACkonz/khZ8XqzDso+iZqdu8HpJ7Wpr+4KiSS4UHiqPQgWbwOvtQsp?=
 =?us-ascii?Q?fEOcfUIE+9rU0n5gbB62G+2QAkWE7iJY7eXo8tD7fsAwF3BBFd6EyGnvuL0I?=
 =?us-ascii?Q?H9sd27mxz6KSx+NXA6rOkKRwDiFDgcgUcTJypaj+tgEjaiexUg0PDfQLrq7r?=
 =?us-ascii?Q?ZIYB42sWeZRBTc3kjQ9ppENI/oQDWoHhbWgeP1++imwJ/CNYfN/C11xndwJz?=
 =?us-ascii?Q?qG/6v9rbEpUyS1mCasUH2bFjxAZSHOkJp9ghF+fSmMrnmpDe+Lg2DrP/xDb5?=
 =?us-ascii?Q?n0kKcc6E5LMwzly8B5tGmRxs8iiSRYXhCAU2C5+spU32imzc1rwjPCEsC0FN?=
 =?us-ascii?Q?zGxIOcJC2aRzfU65l/VsvXBpbFrlGvVE275eNbH13B/0gZmtcsWHAOXOlgmV?=
 =?us-ascii?Q?uafkiR+W31U74lLS2quvNfpgT9jwFaAcIHrUrWDCu+Ch8fCbnvM3UGCc9HXj?=
 =?us-ascii?Q?lYPAKuFo1llqGuZ53FwmgKpJDBAOsC5BJRAEUKxQeSMF05YuHmSdbPNE/Av5?=
 =?us-ascii?Q?bb1cWtDy031JnW/ubwSgkrWflelTfHwEFM3zjC1mMOnr2K3ZL4uNOZhPjyNM?=
 =?us-ascii?Q?1SxUfJbrgtuKvmNjj4Q1mVFEOkUZ/WGoSZLaiGKnwvNiJvpsl9bsOhFavSKz?=
 =?us-ascii?Q?qyddXN/uP+jeJdtrUTn7rYrkSog2mvf8lE6L1Lt5yf0keIrQi8KQY59fdDCe?=
 =?us-ascii?Q?O1V7tpvlIrsj2VTlnhjGOIZnYjptTx/VpcChCBy+hhrYVAuFhrkjmLhFEoqh?=
 =?us-ascii?Q?e+jkOBePPx1YfpitHsh2ltJa/FyB89JTlNcmTv26KtOHSR77Vuo56jMcG3Sh?=
 =?us-ascii?Q?0hJbgtJ3GF5rjmOT3BRxIgkwkkXbfY5rXN8Q7PRmS6AZ0hcwoSjYSTipWq5x?=
 =?us-ascii?Q?G6UGeUF9FgWc8nBKacOKJpFldU/MBSivGOJmsBEW813la87tPlF9KdetIbnC?=
 =?us-ascii?Q?oHqif2NKq6MXXHvv52Dg7giCX3JOYYj6xEWzvMzX03yNK1VZjLMLl5RIF6Ai?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be65238-cd9e-48fb-ee68-08dd576c52e5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 20:21:31.8394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NImL6TohJ1RmUiAvU9p4T6oGctMgN3VeXekw9xpus0xnC/hOjNo/hfz2m4wsfYAhPXI90nWGWP6x+JWb6IZKLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
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

On Fri, Feb 21, 2025 at 10:17:20AM +0000, Tvrtko Ursulin wrote:
> With only XE_FW_GT taken LNCF registers read back as all zeroes, leading
> to a wild goose chase trying to figure out why is register programming
> incorrect.
> 
> Fix it by grabbing XE_FORCEWAKE_ALL for affected platforms.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 54d199b5cfb2..31dade91a089 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -781,7 +781,9 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
>  	flags = get_mocs_settings(xe, &table);
>  
>  	xe_pm_runtime_get_noresume(xe);
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt),
> +				   flags & HAS_LNCF_MOCS ?
> +				   XE_FORCEWAKE_ALL : XE_FW_GT);

we could perhaps just get forcewake_all for every case.
It shouldn't hurt badly on the dump. But well, if there's
already a condition that works, that's fine too..

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	if (!fw_ref)
>  		goto err_fw;
>  
> -- 
> 2.48.0
> 
