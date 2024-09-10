Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D61ECE564
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 14:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA1310E83B;
	Tue, 10 Sep 2024 14:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXeWWNQr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF26A10E83B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725979970; x=1757515970;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kOZntVZB0H4hi/kB++Zkni3Qpn08wWheznkIM/6ODuE=;
 b=JXeWWNQrX1orn+56Nk6ifFMx1DJrcI2TmfoDx8QImpVYv7dFvBAMwGKH
 KUwsM8PfOHWBWjFmfKic9VJEHdw19/FjOfOq0aN/PtpBnxVukEH9rdY1l
 qtbWwhUo0U3gn1AqnVOU5r3cRyPEZ7frVgZjh7JywW9Op50GTRx0MEyCN
 eagIgRNm8F7FOOkctXuh+vnR2UzPNcjvNZVPvVD0TmKXJENNhlJah7vrZ
 hv34ucsDFjjMpNa5Cz3jcGZpX6Lfoh8zlGEYLdzgRGDMiJJ5Vb5xGcA01
 Mo3oZ2jjH8oN1gAxKY+jjtiMVhyfoq3kAVMDVlpoyZeHcZzxrfDNdC17K A==;
X-CSE-ConnectionGUID: oZulv063REC7c55ZemREiQ==
X-CSE-MsgGUID: vbDGsafnToqTqzRhIm/ODw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24889404"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24889404"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 07:52:49 -0700
X-CSE-ConnectionGUID: zZ8uLlAQSpyyeBOGB6Gkrg==
X-CSE-MsgGUID: Iv7qYWW/Ta6ODZW48ZeBHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67067978"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 07:52:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 07:52:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 07:52:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 07:52:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 07:52:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Duct+d8wApaNG7scPKhN3gzKO4kF5S+KnC4RnpVot5FWMBd5Qe9Pc0qsJq05xJXutfjdkVDFizFEIE/aVPMv3XY07TaxRZSNSo5bePpvTUCeQDGnftLyN6AgMttYo7gHtxkvT5jA3+2WdTlb1FKdCKmZ95zuKB9KqMzE38JSz74JMCBxQw4vsucexSqN1CHCiBb6GEjPLKsK7gDQme1K636dK4DtEcUSSF+YmsriKMvyMPAVdT/Kan/AWJULVD3bA5pUEfmyDH2tajKlWUhhwM8cktaUGL8LsEqho7ZRoVmzfwDyxHso6MaoVg+lR1Ei/g6QXmW2rr+uBOZXtW5shQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxodY8lK7ZUwq/trcq8UevdFLS0cB/pZHgZmNrRr+Ko=;
 b=iT+2gCQkC+evfLz3GrUMnYKEoqxoRvcMIsOA7XEPrCYiBVzSylU12RMGZzRadG1fW30OdVZStkaJVcYDdUq9U7tIdPVfnKUWzJNq6nCwxsBj5ZT3wb4impOXej6jtke5102wbizIBRxtl5g8O26OBqRjwTiCyN4/10HwVNBYQckmtSAumW9OYlTsYcdJSjrXmyFtHl0lJnWT4wzSlp1NcikXheBU1L7Xst+Iq2ynkQFgGijsohzIZ2R6PFtsflZAmlpzb3KPYKiXFsxqKmCnOG1DZg6p1hxLKx2y41TtxjBY+YHdXAVdmpguQ55DyyDxzsNAVQVwcHwbCfu9ovUXIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 14:52:38 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 14:52:38 +0000
Date: Tue, 10 Sep 2024 10:52:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_idle: Fix name conflict
Message-ID: <ZuBdM3qnzcZM_uNK@intel.com>
References: <20240910142837.636680-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240910142837.636680-1-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0246.namprd04.prod.outlook.com
 (2603:10b6:303:88::11) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA3PR11MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8ceedd-2d17-4672-b940-08dcd1a836f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FpkT3WUEqt/zyEcMptT4nONZBkmk0XhAae/yoaOSKQgZBNVkM2ugS8OE3IfH?=
 =?us-ascii?Q?G+u9AV4JH1c410HKONKkm8MMbddUZIadGvjXz5pHdsoYUfFzh1RRUDfU0LvL?=
 =?us-ascii?Q?Aj/+OyjM2KEcw9OhXHEceGc/o/4YonhTctZgxBmopMpLoc7eCglqK/GCGM7v?=
 =?us-ascii?Q?kUFNB7f1sCK7F/ItmktoXev/83tCNVLXiyOsoZJ3nk61wS7Xl1pcmSdR4r9l?=
 =?us-ascii?Q?nHVNuKsK/zpai/3SThP84i8MEM8cClta5jZGhgdQwi9GurUbRGr2sJeN+Mv/?=
 =?us-ascii?Q?wptWEZuB3klVZO7wZfcFWDtXfOSywf/H4rhpZleN6YaPRqcpFjFV41zliUQW?=
 =?us-ascii?Q?yWsZgQ8U4LThr45ben+t77nHnak8wKu1RLaHU6/Qz2z+FOtj9HV/lsP+Is3s?=
 =?us-ascii?Q?Ss/tBbrL9GrpHE3Dx/fydfIhmKTikzlpO2H4Z+tYEhrqmBjdl1+mrrmqSUj7?=
 =?us-ascii?Q?oDBvjTTvfm3jh+TloAyvbQtvO3QyDxsi00rbIsJZbKICK4kv9weiRjCLl1A/?=
 =?us-ascii?Q?ZGcN1CTH3lYDxvUPrtJj7kAArnClk4pc3RbDaic+35m68C+1eOSes0LOwV0p?=
 =?us-ascii?Q?bjGV+f+h88hi7o9xtTSI5lrCIvfumkZdkqtx2GBM1veiCD964CA/AjcyvM/6?=
 =?us-ascii?Q?T7527SBJ3A/oK0lG9KnBrRi+EMr0dgm7AMif/zPlScJO0DfJeae/fheFR8Rx?=
 =?us-ascii?Q?E2W4e/DLd7GSVu9Fbq7Po6lvXKp66O1WYrbvXLB7mPtqjEo3dTE1U81GulAm?=
 =?us-ascii?Q?hY8+opD2dTHZXw/MEc7vI+XrJP3r+F4PtgPmudGm8OPUXcTXkVIbWRabaZps?=
 =?us-ascii?Q?WbeLfSBnhhYQNarbV2jRlGJgihAEdDUANYUY/mapSITnKZ44uthqvKiYzNE1?=
 =?us-ascii?Q?SQRnd2c2O+jDl4CyWSVQjTPjoIRx6BQnXrQVESSV3aRfaSIY1wrR3FFHl3ha?=
 =?us-ascii?Q?IC5cXCeQbVnRb9VHqXA1jeDYfZ0zS0XTA84wEqC9m2xZoqgUCc1BzrAc7oj3?=
 =?us-ascii?Q?FAOk0ENBTePuitMZ3FRL/mEDK4oGtNqFXrkw/OZ/hEiFk7iq8dDq8g3tE+5P?=
 =?us-ascii?Q?Ju9Gg3Nihb6egSc6p7GuBD5xirNjcVwF6e9xrUpIG/BFmUBK0PvRalOX8AFA?=
 =?us-ascii?Q?ruoQccqJ4cmSAo+69ZhjXgeceqxxx7QOzTre5TMxTcCvtPS0Q+Hyp1Nv2V11?=
 =?us-ascii?Q?ghxakv5/tdr7t/Si9wGitSBR8wRCOKlbvry0FEzT9DKETe780kkXYeXWxLVB?=
 =?us-ascii?Q?GUQY3aVXL3fB04kpbNxDhBdYiAK3Phu+7wv4YXFsfLvb0XxzAdM48g2EYi/2?=
 =?us-ascii?Q?raGBiOe25PlxCMUmUYMsi0poaI3HTPYULUz+NccmDoFPgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ypNOrqi6P67OKipvG2v9XZgK/7gjp7Nv6Oyrd19hIQNxwOfbTEoDOZb2f6ac?=
 =?us-ascii?Q?WGsjsgfZAReqbb/WM6+vyukXmjgsl5FNWH6s0LKC+pY9w2Ugo+L3nYu6JdjB?=
 =?us-ascii?Q?OlU1ZQkFvVXhmSyRsMCsccErTyrIXLhWSrOz9CgXp9890xrbl3/7qeb+2nhi?=
 =?us-ascii?Q?392j0ySvDnoWUdNgNjlzEKWLTGC//CkWBqzizjqKMS4QjgEUZ7XQvUBGcUrh?=
 =?us-ascii?Q?4RZdDo8leMiteV4TX0l9HiLkJ7F/p1I0PyxDmDmu88rmUiJCvb52L6tElv6J?=
 =?us-ascii?Q?kukXNF6Fxz1jwJl2Rl6ilJqq5Bz97RcDIhswnq2pVqbujQ5LuSKuVNDd8a8D?=
 =?us-ascii?Q?ArPegimOadP13kcDDLZ9+Q34Ev152KU043Ad0Cyq8bsQOgSwZZpzWplRuDy5?=
 =?us-ascii?Q?FchI/3e5uQYX0iSW3h/2HmFWux8MrAwnzhHpkIuEg1Fq9RF8vIS0ODxtf3b1?=
 =?us-ascii?Q?9cQmP7KNJWnrJvgQM4yWEC+7ZzdN6liWsg21Tn7AoAzQvYr8XFSqtdo++Dnb?=
 =?us-ascii?Q?OriJtSCWeegJpaQsfqF9YpvpdXPANIudNK2vMbsQShkehagavaRRvcQQZQHA?=
 =?us-ascii?Q?qe8V/Bl3Qv3rPFoVx5um/XfioqtHdQF/UmFjAohwi2fqfLPsO/TT9Ho/mvrW?=
 =?us-ascii?Q?Sj00rtckU85pb3/i3OKvOU36RvsWuDpivSGAmODltCqCKgRopINkiZ1v1guw?=
 =?us-ascii?Q?iFJt3ZNn7lbTyTJxUDvHalnaD7S3xEWhsfvobUjHVGlLy8+oyPgV9mNRbIBP?=
 =?us-ascii?Q?Sgl+Aq7mrys7ztac49ZMkQyFC38hgR8BDOBL3H7KPX0emv5YFqsAwXX2ngQt?=
 =?us-ascii?Q?+M6aWOoWdeRmxPProMxfS6Auo2MO3EFy4zs2WQ6bLissm2EEPSP3nYZ9h+To?=
 =?us-ascii?Q?SmIffVBo6lEaMbxGiy3lge8gAtj6TRlSKuSMSu8rqSNe7SA/1ipukMLm5h+F?=
 =?us-ascii?Q?C934vvvRVtNl3SpZK5Wes9uUdF5xwPMsCo17c9jXhW/VOF3YaNBvH/B8MuNb?=
 =?us-ascii?Q?jlXvhJBNm39D7pTbrulQYtP4cgzJoGGqG0e+kHbXeQ43oxqhYCSLbD+E6Nvz?=
 =?us-ascii?Q?mXg65Xtv9/f+/WcJ8k5ne4m2LUF5fHSNqbmpQWYDguhzkSBO++e8Ag5+Z4Kw?=
 =?us-ascii?Q?fRgWj1dslIgDu3EEu1pMtJys+zLslQBpvwWL1ZrbUUHVKI/sc7ohQpW/fDSD?=
 =?us-ascii?Q?/zI3qAO8Lgsj9+nPYQrupZZqOnQ8ycIEK1Hh/mazykKdKEJ+0gy8dmWbhKlI?=
 =?us-ascii?Q?YOq9tkvOvWS+juFIS7l8NZjPmHD/X5RS5yE2OVJoH2lMkNASD7aS+VE0KDak?=
 =?us-ascii?Q?x/5Bt3E3KwBEb+Vx7dRnC4aJSfCKV2KoA39OWPwmvwB3a4KT9h1zXk4DSNeN?=
 =?us-ascii?Q?ra2JQ1URzEwfa+OKousM+MFhxOvsCcXaXL1JOu2QkqtshIa1PMc7pTKTX2Uy?=
 =?us-ascii?Q?depaht3n4tY1NpqliY2DeP9E7cpNikgttvBnZMC6LNGGBqk5I/AKnEpbzXJB?=
 =?us-ascii?Q?XT9P5tS19cxv0ZIvv5AT1BAipFsWx81rN/HJyvNFSKx6CUXw3dIqXMRTzo4A?=
 =?us-ascii?Q?adYXzihWqA1Chn8yLCJch5Hd3d+kmIJ8DvyWqQYQVpgwHhotaH6NablpUzIx?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8ceedd-2d17-4672-b940-08dcd1a836f5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:52:38.8267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3rReOYL36gVoQSGkICR3a4TvARGlVEOLed/z84BKKo8JEUUDaRQHbu6RU6dDTtswVdb8Bul5gXjfZRMQ6xgng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
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

On Tue, Sep 10, 2024 at 07:58:37PM +0530, Riana Tauro wrote:
> Remove local copy of str_up_down to fix name conflict.

what conflict?

I don't see any conflict caused by this. But well, nothing
against this change itself.

perhaps s/to fix/to avoid/g in the commit message?!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Fixes: 0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 2 +-
>  drivers/gpu/drm/xe/xe_gt_idle.c    | 9 ++-------
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index cbc43973ff7e..8f850b9e1947 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -14,8 +14,8 @@
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> -#include "xe_gt_mcr.h"
>  #include "xe_gt_idle.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_sriov_vf_debugfs.h"
>  #include "xe_gt_stats.h"
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 85a35ed153a3..a8ce8b484561 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -53,11 +53,6 @@ pc_to_xe(struct xe_guc_pc *pc)
>  	return gt_to_xe(gt);
>  }
>  
> -static inline const char *str_up_down(bool v)
> -{
> -	return v ? "up" : "down";
> -}
> -
>  static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>  {
>  	switch (state) {
> @@ -227,7 +222,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>  			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
>  
>  		drm_printf(p, "Render Power Gate Status: %s\n",
> -			   str_up_down(pg_status & RENDER_AWAKE_STATUS));
> +			  (pg_status & RENDER_AWAKE_STATUS) ? "up" : "down");
>  	}
>  
>  	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> @@ -241,7 +236,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>  		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
>  			if (gt->info.engine_mask & media_slices[n].engines)
>  				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
> -					   str_up_down(pg_status & media_slices[n].status_bit));
> +					  (pg_status & media_slices[n].status_bit) ? "up" : "down");
>  	}
>  	return 0;
>  }
> -- 
> 2.40.0
> 
