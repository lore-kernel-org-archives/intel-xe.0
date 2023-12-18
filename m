Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FECDC35274
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 23:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F251C10E27C;
	Mon, 18 Dec 2023 23:07:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7039410E29B
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 23:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702940842; x=1734476842;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=xmoru2B6WPq3tWGMrr8RcplvuWzvuo5RKWD4ZiM3ELU=;
 b=PjFpj7q90y04epYN7fxPpN+t7FDg1gxmT0fb6zCkatwA+OtFgMx6T6rH
 EJXlQ4yWxUVoFxRuVBiYnKwP4qPod5DoUagf16wTqhPxhDvmwZ9R/hakE
 qr0K75VySKlArmZD1sSL2AkBREvLWWl9Fr4RTeY3Xq324NbyBhrfmWcRi
 afHkHh+ILQlLtZDB2EWTeSMEkoJi6WozDBf3vp3sqxeMV1Ofo6EmE6SjZ
 CHjHhWI3YR6LarynbH4UElVb9UF6WO0i6k0rMB9IupB+ebUdVkuNsKd7b
 IanZPe9CW1SfK0xnovh42b/sWjQNyEofKEaV4CZ+pC3N3agr8mfoI0NaN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2673250"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="2673250"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 15:07:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="17367079"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2023 15:07:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 15:07:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 15:07:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 15:07:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPcZQNA3gVHVJYkLltiW9+vNzbTx5ULOxVodbIQW9WtBhl0o6Sn3OkXsOGCSwbcCn3OAfiEixub3c9l2uFktdiLkp9buSgEx7fmGMaS/jhgC32FdXQBVK17O5dulSQytnBnzqcN+wcNuYmRizeb0a6xeBhSnhZIWSnn/BuMckseESGYN/JgHbSSYrc4khf1rJmkmoPfgglLz7WCBytYU0Tf4MmIZ7kNwtUO7SgixYIo/ow1MmCOgIrwnyZAxFlhxfU3SEQ8nRQiQ4IMnD5MF84VevZlfVIPOGOZ2C2DT0BC2T3pg4vHodalrUTPsaVf/JTUEa85popxZvxhEAcRt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKJJIFXdFURVxU4DvEkczX3SNxuCiwEFzcrTKEj9LsE=;
 b=RSo5gecSG4i3REdebRzTrlGvMEIKl2zgVq+o7z0lf5Nxr0b+/XgJI8xuhwSoFZ257ErEpOoh58O2wbO3iRO6QS9qa+l534xVEBjulPtCUWF9RmnLP4JQKiVj4BDRGVLeemlMrOG3kkddErQmXadtT4A08uA5TKBSHG39V4/OLfTgEogI+K6AxC7VTU/M0Y57Bq4x+fjM6D9yhUgPuddrKGu8+RlobNSjb9wo+lC0LoX+bSluyV3LgOATNyuLFEqBXX3yT+TBk6BymJ8DqpZKg1nDhFw9Ji7EP1kWkHg1SSLiPTcK4Gx/fPiNf2awuPFmFB3rL+lhcB7vyrjnIEKk/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH0PR11MB5540.namprd11.prod.outlook.com (2603:10b6:610:d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Mon, 18 Dec
 2023 23:07:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 23:07:15 +0000
Date: Mon, 18 Dec 2023 15:07:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVDogc3VjY2Vz?= =?utf-8?Q?s?= for
 drm/xe/dg2: Drop pre-production workarounds (rev2)
Message-ID: <20231218230713.GE1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231215214531.2576215-2-matthew.d.roper@intel.com>
 <170269040517.3479.2540290467225052637@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170269040517.3479.2540290467225052637@emeril.freedesktop.org>
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH0PR11MB5540:EE_
X-MS-Office365-Filtering-Correlation-Id: 0111f7d0-a7fc-4951-87ce-08dc001e1395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSFS1LG152f3tuNjf6AGe1/VtjRkJR7FQnaDNR5zQBiH+jWaI9bmGYHJ9W3h460EiWHdqR+DvGIievYicujxEBIt/BA0lboxHEzNA0krNXKYdHhEfD3H/13LN7a2YNgGVa7MUa2HZ+cctmIPSpFNa99D45MqLEtsG8hvA1YbS9hK5dNO9aCjjSyzWIuLCDDTdXzgCkv61NLkUX+Ynn8hrjmiHIUaMiwt7BoweWnx04yqvh8A6K+9RqUgZHzjxlrC86wTAxePjiOkGK/WvRZcn7VddwpWcUr/zQNSQDKRbA5Kly0IQR5x1VxMTt8arGXCghAhA+BzOCRoB79y6UV0sWXkE1qcinCqiSqpEEOi71oN3S5wgSh5d/iIBK0at548oFlqlWKi9euR+1xMy0uwv8VBZWi9uj/7ZhGOnNZrdH3NC9jiE3zjBFN1Oi9ZKUgbu6xVnrMxlHXr9bYYAbaxSXwGPYMFW4W4dN9pYta0aAZFG4dY0dl/sw5T180XkyFpYNS6DUbf/R4ZTISFqa06y66EIIDkN6V/CM3fYhDaDAk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(366004)(376002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(1076003)(26005)(82960400001)(86362001)(38100700002)(33656002)(5660300002)(66946007)(6512007)(6506007)(8936002)(66556008)(6486002)(6916009)(66476007)(316002)(2906002)(966005)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+qoxA0GbyCnUgC4FzcjPlDLuZJvjwzv6FZbeWBk2ckp0Xn1EmSqSPQpjKZAD?=
 =?us-ascii?Q?pF8UxNzc05qOM3YfFnwpUtUnnjyMGZi5MkvHG9eEcwpwXhEi2ZaIMZVloYg/?=
 =?us-ascii?Q?PKWWYvM+8VUuSE/qSYli7ANKXZQHqYTzQwmObxqvuB2Jm/M+FZ5wAK9arVF7?=
 =?us-ascii?Q?uzvGG38Fn59ntNXT9wpo3TC+MnYKiz2qpJkA/bVu6Dg98zezpBlZZ+56PiPv?=
 =?us-ascii?Q?kqXGTBiLy2xjwjTQ1y8RdSQ73IWFnenxTSof+J1cbItZKAEpOeYfugTF8D5C?=
 =?us-ascii?Q?wxQ9zp2/kNWBJUX6Ivo47j2xITXLpYCeke3YojX+ShnlkmaDYHHh21LzIbSu?=
 =?us-ascii?Q?gpte2Z9Zo0FInBfi3XDT6rOHiJoPNl00psu4ggKPw8v2VEXoKUVhmdFjzyIq?=
 =?us-ascii?Q?6bab+pvjxg9ZiqMUmnEXbgQ4JRZDaZW8h9SjT7Of2bxtdMFvuy9xCFCOpWSL?=
 =?us-ascii?Q?1x52+6rmhGcDSTLqlCkMNN4f95WJvvwXMuqJoI59DXxP5IvgwHmYKlDm+FDN?=
 =?us-ascii?Q?OxmcQyTkxCUkwqNwAimwno+OMJSPk3HkxOLuBifAf8rHdXgOsn7YjfmCZ742?=
 =?us-ascii?Q?YOZXdnkldMP0gYeZ8U6dHkwfFPjR6XsPosWpZxKuK4rpewm67Jm6+0cY2QVj?=
 =?us-ascii?Q?5IhnjdY7DSxWDiY1UY/R0naBKrXchWu/v+agImm9h2WpLaYgdbOj2jrWUwau?=
 =?us-ascii?Q?tPuyukTV1rpnX8Vp9e03rOVZlaIpb/I07pbvgIxJerHQgIUYMcUcDzVfnKoC?=
 =?us-ascii?Q?lWL8bIAEKMdl9eTyuM7bFaBeXkQNJGC212LSp4rSaLRsE4uF3CNul6qINDWy?=
 =?us-ascii?Q?ei7viCVHaJUOG3XC+6jIPfrlWqs4NZhGfDC6QlTeU6bYyMljZX0ktq04uALF?=
 =?us-ascii?Q?pPlzY/abflpmccn0WALXzW/C/6b4WlB3+dMacyxQH4/l2V9NXBymFKKOGuiT?=
 =?us-ascii?Q?Q+EwuIM+Tm7T7X3Wur8kOYylIuz5s1Kb1L0+hFulCE7xFhybUu3wHJPSFS7k?=
 =?us-ascii?Q?MlV79rhWUva8dj02AiTw0tK+7RhIKHFb8yo2nztEpgI89QHcagYwslol5R6y?=
 =?us-ascii?Q?emONSZJe4O55bOzFoOrmiDu09JRYwN7mlsnnEUcBvxatPkGJEcuNh1/V6QvJ?=
 =?us-ascii?Q?IuvuUQH2ZHxYY6ufwD+gixSWuanBHL2JIic7rZD8kSK6gw6VjTmCB0BgI5UG?=
 =?us-ascii?Q?riVlZ9L82JgNomAYYJz5rkXwo41q2S67xglz4qHiTei9ZZAEbm4wwipSjbLH?=
 =?us-ascii?Q?BuZVvDhppgRcooIn9oFjWX2gnR+UY/UtFkCNTOOQ8QQCRWlxdZ1vA2ijvd/E?=
 =?us-ascii?Q?eVzQL/3I53MbHE4+17o8t4Ya1m5H8JDsfcp6r6XuYz0cNZ5ycVHfATLxFrsL?=
 =?us-ascii?Q?pIEisXFITaVSTW9vUbhSJWRJJl8BilhuL5PSyYhYwjpCvZwSA+QBcXEH1spi?=
 =?us-ascii?Q?0wk1bpf5sRZkL41IShGmhdJLFNsUCyUtLGLqYRC4nrw/72tY8YD/7Eiqsfjj?=
 =?us-ascii?Q?mGyTvR6ZnYxRmRAJ10QtOH14wP3mLD2LyE7I7+He20cpfkE8YZ/D89M6qA5J?=
 =?us-ascii?Q?oIelboG6rLJqkELmH/Jc0zgfi4nQpBLh5a1pnecDYOUistFr8WnWvyLRZnwT?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0111f7d0-a7fc-4951-87ce-08dc001e1395
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 23:07:15.8513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVdcwnFnv4h0Hl6nht1GhFqBdkfRrwbP6JkRguRU2W5pNSwmSVePB+9SXkg1kAXzRdrw3nvypOVZiJUxB0N787FfRSME4d+u9LH/Rg+oG4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5540
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

On Sat, Dec 16, 2023 at 01:33:25AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/dg2: Drop pre-production workarounds (rev2)
> URL   : https://patchwork.freedesktop.org/series/127846/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-583-b4614f814e4766778eadface6dbf9255d06e7a97_BAT -> xe-pw-127846v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks Gustavo for the review.


Matt

>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-127846v2_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
>     - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-583-b4614f814e4766778eadface6dbf9255d06e7a97/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127846v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
> 
>   * igt@xe_exec_compute_mode@twice-userptr-rebind:
>     - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4] ([Intel XE#1044])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-583-b4614f814e4766778eadface6dbf9255d06e7a97/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-userptr-rebind.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127846v2/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-userptr-rebind.html
> 
>   * igt@xe_prime_self_import@basic-with_fd_dup:
>     - bat-atsm-2:         [PASS][5] -> [FAIL][6] ([Intel XE#999])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-583-b4614f814e4766778eadface6dbf9255d06e7a97/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127846v2/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
> 
>   
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-583-b4614f814e4766778eadface6dbf9255d06e7a97 -> xe-pw-127846v2
> 
>   IGT_7644: 2a2b716161007f885855d6dfcb90b526183e624e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-583-b4614f814e4766778eadface6dbf9255d06e7a97: b4614f814e4766778eadface6dbf9255d06e7a97
>   xe-pw-127846v2: 127846v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127846v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
