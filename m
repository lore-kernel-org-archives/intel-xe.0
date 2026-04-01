Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6498810FCAF0
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 22:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5B710ED0F;
	Wed,  1 Apr 2026 22:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjVISzOq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D1010ED0F
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775082795; x=1806618795;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UOeJZhZ0M/W93ShKGpG8iYMbnEl2AUgP5W9/+Vgr0L8=;
 b=ZjVISzOqdgzDV9veF5gQwM6kGpW+evwYgE26Q66l/Ce6tGAJdLVSLrzB
 5PH2xhqvZtW8DI1Z6g6Z85QuR5GRRHcCao/PPE7AThJe3Rho2LN7/cROT
 F3Y4xQHldcdOwJDtIw9IxQud93dRNKLq7oWg4BSuqAxDrwy13608Bjj/q
 20uRq3Yt3IVgN0NRmjNgFNA/RHJZEfXJXYfrfhaFOvAa8tdKHmpE89uYh
 tHCKHunBNu880TIhLWlTYxUVIJuRmOqJ/f/PSGFPYs3/VUBO0YLhpHi2f
 JmxnRq/9dSFzZqxgkSv5FDl3sJCwRX+xmyOOSC3J287t+RpCdQ5WQSieE Q==;
X-CSE-ConnectionGUID: HIv5ZnFTS/WkIdoJSsL6Ag==
X-CSE-MsgGUID: TCG4I3CkSvudfNGkcKUM8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="98750124"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="98750124"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:33:14 -0700
X-CSE-ConnectionGUID: nZJZq0ouRHqlTpJYiSVBNA==
X-CSE-MsgGUID: NHi6uDajSKmvH9saVARJpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="221957627"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:33:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:33:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 15:33:13 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:33:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3MsIzD/NLP91Mmspoa/yeOTTzlEb7j2zzzG/koUX2wjW6bgZDbfwMh8OJ5V5vrR1AZU4NCSIN6zUd8nzYCuMKpomDA5Wcyrvjj8TGCS3w/gy8lONpiHWDLF7z+ueHQm+gQm9S5x4YJUNYjmfHjONRmEb0GnU5q2vlJgluvwFX3XIryAEfFEEHAINTuV4dein73km2qRya/G4mM5WTHA2Z6Bbc73PvHriAxVuFAqXsTKNv8vwGDYspuYfvBVUdNTuUTcWYLl1HRE3HiZmyQBwpZs8pnpFSc979B3irMBtOgOqMZiSI/qIw01gh6M2n/FXdeOTrXWtvmdT2Feek0nBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5n0ALztkMOQ72nDE1JrJ6g7Ghfngr+BxqrdgekuKA4=;
 b=lH8IDrVVs5+gn8Ys+GZxUyNzMcURrVSsNiJmr65SIeuTPmbPaY8K87EXModZnWgLRqosB+RR7CuJjnCeN6SU8r9axWTccNoLhiTJI3BNZBN/+KW4n1Prf8UJjlYAFJUzXc5XeHcMJ0/U1xgrzoIjvKINhzQ1K8OYfIrcvWr4eyMJw+IdtCz93arAQiyOpDcCjSY6GtV2KITMikYesyTCoO3BzCajQn8EZZPY7G+5qcxArOhg6GzSA7StV3dLwa3ZT01LlTWkqpVL0b2GvHSjpUlG5CIujwsNyJZmXmJDFjCE4Mq6T6XM2G219s6MWCiMMmn1Oeog2Na5nJbENVNmSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 22:33:10 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 22:33:10 +0000
Date: Wed, 1 Apr 2026 15:33:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe: expose multi-lrc engine classes in
 debugfs info
Message-ID: <20260401223307.GG183713@mdroper-desk1.amr.corp.intel.com>
References: <20260324212348.4142888-1-x.wang@intel.com>
 <20260401212637.732424-1-x.wang@intel.com>
 <20260401212637.732424-3-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260401212637.732424-3-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: fee5e249-978a-4e87-8c76-08de903ea70c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 6oHhwG9JbfsO/sVYqBcItMuUmWJnV+BfcZsD6XZQXlpzm+7dPmuG2ljt1rP7JpCD+uWrA79hasnl5gk+5xBtBF/RRrAkbjXju/HO6V8BsIypOm7ho4lCCYzJGJkY0nTbjbZdKi345PfDX86GYhJNegQf3DP5bpgN2RvT+f3yI0AkAUAqmARuydIWI57bOtsaBeoG6GNr7bziidvrWnZtUmyGh41RUEDLmSSyqQO7zwGAGBtQ0JGDW13CQ4y3KjQAkJI0jYJkE0CplMAJYBKC2zypWLdiHDvP5QbwR4+C5fSESSzmvFETS3jYMTw7ToVbnweJYV+uGYuQODCpghzs6Zo3Gz9xtP6b0ZTfYpNrXMItNCvt3J0Ur8gJI5YT+jHGIpa2OTt4BV1T9E+UppRgWaFhGxQXjgBpWq0+dm4pqEce0Sm6N8jP5/Iwbb8di8anGIyYAIyqNXLDje3jNSp08Ruro4HxDoW4W8LfHqDhVS52xEMRhK4u+HH/qcVvBiyzEFhDq04ldLmsCyvDTiYKAAOCa+jooSnF9c0HxClFDH8HMSVlcbD557+1v5H+kGr0UbxLv9AcrlWadRm9BmF8dTtF6ndigHD9eD3CktTdYvqWxyTZgfxcPoS5YQWF27VPS6F632XTlfJrbLtITWGyAufaST2Cr6/W5Xf/K/uDajx6WgPxkPpkdCM9CBZ/906gMIzaX0hgmbPsMZZemQLdqwVV8QBtJYwSYB78gwvzR34=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uTQcUqP8u4wU1elonIOed3wuavwU2RH2SWTubPcB2+ekRzLH8/G4s6UZTlXP?=
 =?us-ascii?Q?rZw0VXKsNm2Eb1+cYGShn+kEK+SuQj1REFSvylWn0aRziGNhaIE14rc/ILWg?=
 =?us-ascii?Q?LqbqIBhkmpjVfDto+s9IohVnN1resS0W4AqXVbf7pb+vYCbyXouqEJrYDSrm?=
 =?us-ascii?Q?4KxR3Lu1dS3fO4oY+gbkErJndWGJLEoaVuJfe3L5kUzmih9uS4NxEvnVWlNU?=
 =?us-ascii?Q?FsyV+1QEQLXh2EZN53kduk378szxydKKi2P11L8uFkdINrcmXg3k180D6tSt?=
 =?us-ascii?Q?bpuSCFS3SsyRTnhWnyUCUeEuKJyDhl7KVQOYX1up/dLp5yB2AZW4y99BHfa8?=
 =?us-ascii?Q?YifdaVthzHFtkUs3Wh5G/HQUSGlebVRZFJQrWgjFhIM6sgQgKQ4XWhRB5iSB?=
 =?us-ascii?Q?x52nyVOCWA7D+J5I38AOQ+8rroyRgwy1vL/I7FCUbDmULO0X5w3Gz81u8ykY?=
 =?us-ascii?Q?/qL9B7nlesyC6CpxN8V+Lc9zJZJZrQ6qN+9JOA7Jwzox5Wh5YDwwi5SFmP50?=
 =?us-ascii?Q?vQoYc3VH+8ztapSoCNhQ6a1LGqPKMiQNuyBcRRxvYnJ/YCi/0uXnhGPOt8xc?=
 =?us-ascii?Q?hrIsPj6y2rAgBZDap1BSHG5UnTZtoUbN2b560ob77Po+4+imDviZLkJT4bzE?=
 =?us-ascii?Q?lgjzLh7yrdxJ7ei4OVC5NuxaanfSLpeiJLiIsQzxNKFJmtONO1k7CdM5p0Vl?=
 =?us-ascii?Q?8dpQj0x7ip4L74wuL6rd+PkaVkErRCGs2NRkOjbhIACCyp8/DM3L4N1L9E6a?=
 =?us-ascii?Q?AnuGPYlXnwq/hbm1lsZWKw71BIwyHk6txilOrnGL/wEoxCgMb0Gl10jd5gKx?=
 =?us-ascii?Q?S2UAgevvf0uvTZlOsyhzNjZmbsowVeVQnw5BBYYKGaqts0xk+0gx+JDE4x+8?=
 =?us-ascii?Q?DHq4mQfi6gLPyWholNEDLZ265YPB0XN7lwulwUB/1mGAO5daJEE2e+Fcsqb7?=
 =?us-ascii?Q?Jb+qlnyKFgXNH617Dg+EShFQ5a53RlZF2cvBNO9q/tmSwkz8LS76AxjhlLJ4?=
 =?us-ascii?Q?Mzo32nywcZw9tC9I9Pv07O0ktgNeczEy5LuSgHWNoSw8YiWk5ulVv6DoWqOE?=
 =?us-ascii?Q?lDV5pvfB5Tvd4F7YxMK4/BIyCxnzFb7A919YRRnrCosbOtI3lkQp8SPhor9Q?=
 =?us-ascii?Q?/4L3p5edljOEjM6q8toQ5NgCvPHl3rGpRueK0d2zJJy70Eu0oxEeGCvXIwK/?=
 =?us-ascii?Q?D8MWYZwqcmVG/KQhKNgl5q+XU+EWgPkeXurNsVSYj67Y0u2sQpUynWpzoKeB?=
 =?us-ascii?Q?KdTQm6aPa3l5wi6DVrgw6klhgre5gbHr9nnR5hpA6eFPViSDIv5cHuw43WFt?=
 =?us-ascii?Q?/mjfSyKfYB+vNgHzMj/RtmYOANlNtvWBbqEf232fJGAJUIR0hCjT4lgRYl7D?=
 =?us-ascii?Q?gl6dObq9yVWuRxB76gBiFDBeOr8yVELT4iDp++SS6f7LsL8AqB9LmbQqk5Nu?=
 =?us-ascii?Q?Dp8qnj1g/2tBspY3diT8ZvMLulsmU9iIXv9QjYehLM96EJgV0ZqPydutgmOR?=
 =?us-ascii?Q?XadvM7fLql5ey6h3JRxMGBCZBlW6FTOngmo+vQERLhT33oxZxy9O0ZvjFu5C?=
 =?us-ascii?Q?CVBjrhWdE1vnO/UAIUgQgsb0uzedWYwOgaL2CbP/aim7pK2gEDJ3tuojwb77?=
 =?us-ascii?Q?jf7JK7+73Pu01bkm6g4XAfnUdjTk7eIcf1niDEzwq0wrND3vGUOIid/NJOqf?=
 =?us-ascii?Q?qK68PNlO4gqr39b0tmzmbDEZL+FC7CJs3U11R452rRh++4bAldr0O1jP95hv?=
 =?us-ascii?Q?NmAYQ+NbJ5Bgy83oluwa1/HBu5lJAvE=3D?=
X-Exchange-RoutingPolicyChecked: d1+VZJ85aC4EXJpYDEczQJFTYUKuOCS3lOgJhe+jtfd2ZDfnDI3f6GUEbNDl//Oe5/IRLCLbQO/2Rkjo2AQZCciYs+UpOlIuR5Hi5DRG8+JXgoQZh+a7pvJtQicH/ErsATqBWhr9mI4taItJG4xE/8RprfMYB6o4L27cx2TrAafmoTNIO7s4E/vR4JTHQxk18Yexqlqz9pT7soRpHJieR1Qn3DO+rXsapN9Kc+9aW70ZfB06Lc/0XL6oLjEPkuvQiVzXLlwVMgyQe/1mqBzT3yEkZ/eK3343hjDY5sc1hxEPYAodaRDgJOVmMG3ts1L+nvxnB6CNk1ZwhuegNnsVwg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fee5e249-978a-4e87-8c76-08de903ea70c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:33:10.0122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIyfjfYrnJEwXX3CMl6FQZA7Qk0e5eqaJC0E8LuV0RwqrEGvoKlMKkzSagYRMrOe01GZlcjkKeaMGZBWTPbz/bIdN6OxVK+j3wWPRe1A/Dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
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

On Wed, Apr 01, 2026 at 02:26:37PM -0700, Xin Wang wrote:
> Expose multi_lrc_engine_classes in the info debugfs output so
> userspace can inspect the multi-LRC class capability directly.

As noted on the previous patch, this isn't for "userspace" in the way
people will interpret this comment.  This is just a useful extra piece
of information to have available for debugging so I don't think it
really needs to be justified further.


Matt

> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 9986a0310c36..b5f7233da360 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -118,6 +118,8 @@ static int info(struct seq_file *m, void *data)
>  	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
>  	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
>  	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
> +	drm_printf(&p, "multi_lrc_engine_classes");
> +	print_engine_class_mask(&p, xe->info.multi_lrc_mask);
>  	for_each_gt(gt, xe, id) {
>  		drm_printf(&p, "gt%d force wake %d\n", id,
>  			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
