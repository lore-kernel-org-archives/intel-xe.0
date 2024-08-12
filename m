Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31022C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 23:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B0010E1CF;
	Mon, 12 Aug 2024 23:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q19FCVS8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D056910E1C2
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 23:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723506930; x=1755042930;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EfjeCDR4xgZq6EbHkEPuEcOVRazY7jza+nmY1/WkIXM=;
 b=Q19FCVS8uuRE273NUKU9ZqZDHFniMvXSR97buKbJGkKrJX6kHjeyquKY
 MkVgYu6+dzKBTRtZcWOD0pxjniTtsZsnz+benuLF1lzTwn7IpCq8QqGKI
 K/eyCR84xT2nolsBwEeDDT7m0gtCefAw7l3xENBaeyhX/c3rtpdx0BPLD
 vXgMhXz+xZudOISLuwa2OzczE3ZMkE0Y21AQ1W432nykiLm4nKOpWa7DO
 BDDOB8U6zreX6uueGmAb9d5W4nBOlgCzoV3PY93D/mpNz3K30yofLrRLh
 J/rS+/l14KkHeSm0U6dwchwEP0ww6j8Nf/U4FyempOpk3F/xUcP7OjUhC Q==;
X-CSE-ConnectionGUID: 2OY0ePxtR2+ZQTgFn06LcQ==
X-CSE-MsgGUID: b1iONm+pRRC1JtQrgyFkMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="47051380"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="47051380"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 16:55:29 -0700
X-CSE-ConnectionGUID: fnoRHrmlTxOBMANsxFC2EA==
X-CSE-MsgGUID: g1TlaG8SROGGy9DVbnQKig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="58412169"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 16:54:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 16:54:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 16:54:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 16:54:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7t/RJk79h8CvaUfAFTxpvGpWQa3yKb49ag9FqEzW8Uaka7ccdnBGy9ZbFeTyp1wdqfo+SFR6pv9DotE5nBqes7p4B8x9aWSzMRXRBqyRkQ+04F6zgYf7IzxsAxMPW2BfeQ9CSCFrvfFQTEnA91T2/mdBvv9Ik801WbHk4ncOssT4ehKTRMi/ClS3q0/bfGf74iftZG2S+Y0vG1tlv68YfKAsV+lWPfqtsjfpeBPz6zkRKqpfE9KoK/gfGaQW3IDAD7mxYM0KqE4jULMxMzKykhhp/YhvJDwSGwSIogUftgyQVmichc1AKlYXxhXkNEkuRkRqXy16ChgxaS94cLmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRqpHajY2bIIOWBsZOetHoX3npsf3FWv2UqGkpxfCy0=;
 b=mYjNe+QPwMNfstd4glEKoPNFRbqOkn2g7rKLFEpOC8eCuVICZSQlCX9znN5CeXRxmLA0lsCm/PxcOWVryu0gTIpdfJKlJsfpSwl4jn6pKjyV4Lwr/Kv+SgdaJRQxM3v9wsJOjWR/maS54rilIIKSIbcQoo89nLMEcN2NxihWpBkZjGLHQHDpDkOT5KF5h5aPhz0ZLPdNqFoVKq+RcJXPEl6LQqUUgMFQajPU8WAVlAAvIkneP7+z57n0oPsRTog7+HwlQElGUaegQ3xG5QpWPr6wjG2bt5J8ZhZpMyzRnWbjYq6Xm4UVqys6DkbHLUEpeJCCYI6Yi/ZdjDXwgXou9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Mon, 12 Aug
 2024 23:53:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 23:53:38 +0000
Date: Mon, 12 Aug 2024 16:53:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe2hpg: Add wa_14021821874 (rev3)
Message-ID: <20240812235335.GI5091@mdroper-desk1.amr.corp.intel.com>
References: <20240812134117.813670-1-tejas.upadhyay@intel.com>
 <172348615543.595846.7763782269814746051@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172348615543.595846.7763782269814746051@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR21CA0011.namprd21.prod.outlook.com
 (2603:10b6:a03:114::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: b1275e4b-98fe-43a2-8982-08dcbb29fc8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UCT34FzLToc9g9THUytb93n3AsLLYASCZzK/GePafNbj2oC5bviUhs95xTbR?=
 =?us-ascii?Q?5y3zGi5lcTMdbOWJ7hXZDgRUVI2O+wpvttaVmAzpupUU3xIyKRtKI+Yxu1M4?=
 =?us-ascii?Q?b2M0XR5szztpWjvsd1Ln9iPtfucj22kXUolHfLxV7axnD4L/Up03TDg/vAJu?=
 =?us-ascii?Q?ywX9ZnrlZSUqUrTF3qpCJi705p2Yz0iPt0VljxsLgED48EX5HxT7NCtc+enk?=
 =?us-ascii?Q?s+be3pAaFsnFgGoHvc5ZScoQORQq9bE24OThqm3GYAT+Glwgj/srXE3pD6oK?=
 =?us-ascii?Q?yXl0tfsmh/joQuw5b3tW0SqdYM67sEtedOv/Vt9SfDA455qT8fr70fqWv12c?=
 =?us-ascii?Q?kOw0tm6CTFBbPd+jZ5yPsHEeFZkSaXpfc0hGZZ6J5KcInjBBKJOI/cxt10kH?=
 =?us-ascii?Q?R0nKwBRGHsC7majJdLHton+qmMXHT1KUj4dal2hBn2TS8SDEm108iNlxAjdV?=
 =?us-ascii?Q?+yS4JLgYC5UIZNr77LRyr1kV+3dCEjCJTOV5D8dhxDlAk4jNhJLvAmChRzlc?=
 =?us-ascii?Q?aoM9v4TSUkEVAon6zN46ijIH08UOZJKnGLZQLMXazrN0SUQdPHX8ypuKY92V?=
 =?us-ascii?Q?9PFXlWystfQ3Dd95ZJL8tY9dRJ5rz/yX4y9pTTXWT7HQxkAmL79om8MMF/Mc?=
 =?us-ascii?Q?sc0EYYT21gLb0uizW1wlOA7xtjXo67mIMvCLi9d5TzRTQ+lcRK/OUaklAFJJ?=
 =?us-ascii?Q?xbYYDkplS3gH1r1A08+rLWTsDaJWaaNyGwDWhUimQlMSwoYjPS8r0iEAdQN5?=
 =?us-ascii?Q?TGKYb1aIuAcleAbJfok89unrWRa254QRr7UiXkkCLd/TmRkIS+uS4w5K/Z8F?=
 =?us-ascii?Q?d2Q9NhPMD7uF+qZBITqvIK+7JjN85sPhlvF+oo+11UyYI+1DcggwlXuPwMg9?=
 =?us-ascii?Q?RoWhWoovfI3DcZPkZOSEm54zsRfojulmnleJLT0uQedIKhInNPu6R81zMPdk?=
 =?us-ascii?Q?GZSKRN/g/cBjQ8sXmNjrqlTSG8mch+fCrFlLHRg8nCO3uhFE7bX4cjn31xe9?=
 =?us-ascii?Q?BWGpkhVwYdCkOjRvRlo52qC1tJujm1RHU4mXq+P69DWkSivZrdycM18iZU7u?=
 =?us-ascii?Q?FnwXR+NzaoeJxRPjJAyEbj52dFaZ0wCaIZ0JzjlSMMrowDZKoU0DvBUgF4T7?=
 =?us-ascii?Q?Cg53ZreFOdNBD/FHBoSL1daY/ZTf4LJRqc1nfasYWVk6HxUafxuj6gcczaS/?=
 =?us-ascii?Q?cZePM2iViFt+nLMwD9wWJzbTcOno+Bgzv4/bpy/sSjxg+ivMBgMl8eV7xgHX?=
 =?us-ascii?Q?L0EYgw3mh48U2C4q5eQazjs/HamYtHnrim8SphnGxWYY1CAiKnC8x3Li1i/u?=
 =?us-ascii?Q?cWg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P0JSe6rC5WXfigTMLGGw3hjUHsFbA2ZkS00UPDcSncWjrqiUBgTfr9npJK+Y?=
 =?us-ascii?Q?FVd4OKwutunbDieDGDZTvjaj0Di5EvWh3/PK+NrvQd4APKvZUcyBdaGtQC4k?=
 =?us-ascii?Q?pSPSw5z7HC92E73zk1GHN0wMUJUQfriVGMveGoPqIRz8HD2yXsNThSwUsnav?=
 =?us-ascii?Q?wr0OKB7R5YCes9+CNvSRjnYAOLdF6DS8lInGIzNX/zldknAnp4JsqCX/XmO9?=
 =?us-ascii?Q?wzkQ5CI/PPl2vddo419pKwfnHV6w66NWfs/5RkW9sOGKGrwunShrlvsBIzKe?=
 =?us-ascii?Q?CLlekCH1keVPSmP5I4O+0edCrZeKBBaFzYkbXYiGffexrlxs6JViHSbx8aux?=
 =?us-ascii?Q?Az4Jcw3fc6MbrXtJJ4oC/8TpdkqY+A7KuRxEFWXy1Hps1B4T2mO3br/DSf+a?=
 =?us-ascii?Q?VHdeizS8IsbMQnjHKLEH7/QH8qGsZVnjAbIqd0kksYrbq5yEWYHhy4SwEfMZ?=
 =?us-ascii?Q?+2tB3HEcdb1ysr73VxFKcR8CZH5CjxXqKZ/jK6hT4p6Ej9+F3cGWauSr+gsY?=
 =?us-ascii?Q?biprStgSU9TzvK+vDsc5cO1lAo4is/Ek/lHXoCqh71E9Vt7lB2OZ0UiGTOrv?=
 =?us-ascii?Q?QCzrKOJfX3XbppLFgvYrD4UJWI7+H39hFvPlI9V/K1dGtkDaEMSFO1s53oie?=
 =?us-ascii?Q?R4hNoZ64azKeokiqX5PgD/a2L4LM3mSBcgYKd/R0Dy/cc/iTpwYIg/7+5RON?=
 =?us-ascii?Q?jyWnChKsu+Ce2WmaLreZQxOGmFXzaOmEHBRIryyVu1eIHanbQLaArKi6YHgb?=
 =?us-ascii?Q?vwO9SH9p9uF7ZKaL642/ooegg4McITqHZe264JR/kSxEFbsbCWrGKLCt0NFL?=
 =?us-ascii?Q?oEspRB8Vl3xe3Fg/UglgygrjlO6t9xIvITy/We+sWNVGQotnqpQoH0glplow?=
 =?us-ascii?Q?NHig7cpz6mKcA8GyxDkvRCQRXwUv837E8tOLIXdT8sicSBfEHsubnOOH6tD7?=
 =?us-ascii?Q?Yntqd734q1nwO7Un6+f3G1zP9JJGjemeAO2W0dDHDHQIr//urlonwTP3U0vX?=
 =?us-ascii?Q?QH/3aDnR/iL2Nrgrgv56TZ/w7fkpO2fF0gDhvE5tulYkTICtKMt0iZTlmhpk?=
 =?us-ascii?Q?gJop6T58WVkJkJdV8FqsXux3hcA/VjPPl5UV01UFt1/ts+UdeGt+Rlsm8TyW?=
 =?us-ascii?Q?4SW/Oyimr9s1GmN+IwGpfEMQPVf9XF3OJDKE6RKT3RMMvxD1jeT0llAdpVWY?=
 =?us-ascii?Q?dU83kmYyAxxJJNbPxEjJCbdfyTz661VshfEMQKR/9nKziToo4MLCXyyGSMt4?=
 =?us-ascii?Q?ud0Vx0lo62C+eT12rjhDdA2Clb0wcBo2zD++bYoN6wT9K37l05lVcsQv9cAS?=
 =?us-ascii?Q?8uYk3ZKbuX2N1Uat7aGgA+jbjimU3XL2bllR7SQOCXbr3w7SmcnOGEHR5Xh+?=
 =?us-ascii?Q?0TxapCHjXcadZc9sd874LAumRu2P7Cpy5F13ZfeCRqCXH1Lwf5rk4l+80KUu?=
 =?us-ascii?Q?w4uUmBgZnyO7i5CEPbka/YxO+nfUN5De36oHzjWnBOkcs/TjA3Wyxe6EYaVc?=
 =?us-ascii?Q?XVz9WJo/d+sOSqVLUxq2SNz1/VyBJYeeyqFZt1c9JOg91nQ11j1PBxOf7RFP?=
 =?us-ascii?Q?8QjoKZ5ACqWGJDeG+yd+X4+ndlDFLbyUqJ+JxeKHKAQW8PUtECnmuMuXoVPB?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1275e4b-98fe-43a2-8982-08dcbb29fc8d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 23:53:38.8279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpMr3396DKS62emUvlzKCNTonKJvN2cSA5CqnzpS2RMLsJZakbzVQzUkTnasypC+mufDiIiuO+m0C9Dnjj9EihtsMcJh6Wq1tQNPvloUvHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
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

On Mon, Aug 12, 2024 at 06:09:15PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2hpg: Add wa_14021821874 (rev3)
> URL   : https://patchwork.freedesktop.org/series/133007/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be_full -> xe-pw-133007v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-133007v3_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-133007v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-133007v3_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-bal-userptr-invalidate-race:
>     - shard-lnl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-5/igt@xe_exec_threads@threads-bal-userptr-invalidate-race.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@xe_exec_threads@threads-bal-userptr-invalidate-race.html

Looks like IGT doesn't know the proper PAT indices to use for the LNL
device ID.  Not related to the BMG workaround here.

> 
>   * igt@xe_pm@s3-mocs:
>     - shard-adlp:         [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-8/igt@xe_pm@s3-mocs.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_pm@s3-mocs.html

This test actually succeeded and did not abort.  But maybe the network
interface didn't come back up properly after the S3 cycle so CI thought
it had failed?  Regardless, not related to this BMG workaround.


Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][5] ([Intel XE#2028]) -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 
>   * igt@xe_oa@whitelisted-registers-userspace-config:
>     - shard-dg2-set2:     [SKIP][7] ([Intel XE#1201]) -> [SKIP][8] +4 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_flip@2x-absolute-wf_vblank-interruptible@bd-dp2-hdmi-a3:
>     - {shard-bmg}:        [PASS][9] -> [INCOMPLETE][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bd-dp2-hdmi-a3.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-5/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:
>     - {shard-bmg}:        [PASS][11] -> [DMESG-WARN][12] +2 other tests dmesg-warn
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-8/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-6/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-133007v3_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#2191])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1399])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#306])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#599])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#309])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1421])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
>     - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#1901] / [Intel XE#2028]) +2 other tests fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-6/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1397] / [Intel XE#1745])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1397])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][30] -> [FAIL][31] ([Intel XE#1874]) +1 other test fail
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#651])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#656]) +7 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#651]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#651])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#656]) +2 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>     - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#2028]) +3 other tests fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1158] / [Intel XE#1201])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#653]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:
>     - shard-lnl:          [PASS][42] -> [DMESG-WARN][43] ([Intel XE#324]) +1 other test dmesg-warn
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2318]) +3 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c-edp-1.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#870])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [PASS][46] -> [FAIL][47] ([Intel XE#718])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201]) +2 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>     - shard-lnl:          [PASS][49] -> [DMESG-WARN][50] ([Intel XE#1705]) +1 other test dmesg-warn
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr@fbc-psr-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#929])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_psr@fbc-psr-basic.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#327])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][53] -> [FAIL][54] ([Intel XE#771] / [Intel XE#899])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#899]) +1 other test fail
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][57] -> [FAIL][58] ([Intel XE#899])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#756])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1126] / [Intel XE#1201])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#261])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][62] -> [TIMEOUT][63] ([Intel XE#1473] / [Intel XE#402])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#688])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1392]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_exec_basic@multigpu-once-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#2360])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-adlp:         [PASS][69] -> [TIMEOUT][70] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-9/igt@xe_module_load@many-reload.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-4/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [PASS][71] -> [ABORT][72] ([Intel XE#1358] / [Intel XE#1794])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [PASS][73] -> [ABORT][74] ([Intel XE#1794])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-4/igt@xe_pm@s4-mocs.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-9/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [PASS][75] -> [ABORT][76] ([Intel XE#1358] / [Intel XE#1794])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-adlp:         [FAIL][77] ([Intel XE#827]) -> [PASS][78] +1 other test pass
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][79] ([Intel XE#1033]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking:
>     - shard-lnl:          [FAIL][81] ([Intel XE#1701]) -> [PASS][82] +1 other test pass
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][83] ([Intel XE#1426]) -> [PASS][84] +1 other test pass
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [FAIL][85] ([Intel XE#1659]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:
>     - {shard-bmg}:        [FAIL][87] ([Intel XE#2436]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3:
>     - {shard-bmg}:        [DMESG-WARN][89] -> [PASS][90] +2 other tests pass
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3:
>     - {shard-bmg}:        [DMESG-WARN][91] ([Intel XE#877]) -> [PASS][92] +5 other tests pass
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-lnl:          [FAIL][93] ([Intel XE#2028]) -> [PASS][94] +4 other tests pass
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-5/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [DMESG-WARN][95] ([Intel XE#324]) -> [PASS][96] +1 other test pass
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-5/igt@kms_plane@plane-position-covered.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
>     - shard-adlp:         [FAIL][97] ([Intel XE#1874]) -> [PASS][98] +1 other test pass
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][99] ([Intel XE#361]) -> [PASS][100] +2 other tests pass
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [FAIL][101] ([Intel XE#1600]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - {shard-bmg}:        [TIMEOUT][103] ([Intel XE#1473]) -> [PASS][104] +1 other test pass
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][105] ([Intel XE#1473]) -> [PASS][106] +1 other test pass
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_exec_basic@many-basic-defer-mmap:
>     - shard-lnl:          [FAIL][107] -> [PASS][108] +1 other test pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-6/igt@xe_exec_basic@many-basic-defer-mmap.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-4/igt@xe_exec_basic@many-basic-defer-mmap.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [ABORT][109] ([Intel XE#1358]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-lnl:          [ABORT][111] ([Intel XE#1794]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [FAIL][113] ([Intel XE#958]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][115] ([Intel XE#316]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#316])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][118] ([Intel XE#316]) +3 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][119] ([Intel XE#324]) -> [FAIL][120] ([Intel XE#1231])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][121] ([Intel XE#1231]) -> [DMESG-FAIL][122] ([Intel XE#324])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][123] ([Intel XE#610]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#610])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][125] ([Intel XE#1124]) -> [SKIP][126] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][128] ([Intel XE#1124]) +11 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][130] ([Intel XE#346])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_big_joiner@basic.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#346]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#346])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][134] ([Intel XE#367]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][136] ([Intel XE#2191]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#2191]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#2191])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#367]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][142] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][146] ([Intel XE#787]) +97 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#787]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][150] ([Intel XE#306]) +2 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#306]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#306])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#373]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-fast.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][156] ([Intel XE#373]) +9 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][158] ([Intel XE#307]) +1 other test skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][160] ([Intel XE#308])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#308]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#308])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][164] ([Intel XE#323])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#323]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][167] ([i915#3804]) -> [SKIP][168] ([Intel XE#1201] / [i915#3804])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][170] ([Intel XE#455]) +7 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#651]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#651]) +23 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][174] ([Intel XE#658])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][176] ([Intel XE#651]) +26 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#653]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][180] ([Intel XE#653]) +25 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][182] ([Intel XE#605])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#356]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#356])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#498]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#2318]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][194] ([Intel XE#2318]) +5 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][196] ([Intel XE#2318] / [Intel XE#455]) +3 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#870]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#870])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1129]) -> [SKIP][200] ([Intel XE#1129] / [Intel XE#1201])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][202] ([Intel XE#1489]) +3 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#1489]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr-sprite-render:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][206] ([Intel XE#929]) +15 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#929]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][210] ([Intel XE#327]) +1 other test skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1127]) -> [SKIP][212] ([Intel XE#1127] / [Intel XE#1201])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#327]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#327])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#362])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#330]) -> [SKIP][218] ([Intel XE#330])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][220] ([Intel XE#2168])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_vrr@cmrr.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#455]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_vrr@flip-dpms.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#756]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][226] ([Intel XE#756])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-set2:     [SKIP][227] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][228] ([Intel XE#1091])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][232] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][233] ([Intel XE#1123]) -> [SKIP][234] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][235] ([Intel XE#1473]) -> [INCOMPLETE][236] ([Intel XE#1195] / [Intel XE#1473])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#288]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#288]) +19 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][240] ([Intel XE#288]) +22 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][242] ([Intel XE#2360])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#255]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#255])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_module_load@load:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#378]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#378])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_module_load@load.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@rc6-disable:
>     - shard-dg2-set2:     [SKIP][247] -> [SKIP][248] ([Intel XE#1201]) +3 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_oa@rc6-disable.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_oa@rc6-disable.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][249] ([Intel XE#977]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#977])
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][252] ([Intel XE#2284] / [Intel XE#366])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#579]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#579])
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][256] ([Intel XE#944]) +1 other test skip
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#944]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#944])
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
>   [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
>   [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2382
>   [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be -> xe-pw-133007v3
> 
>   IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be: b6531fdf51e4068bc53c995b6db105d28ade44be
>   xe-pw-133007v3: 133007v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
