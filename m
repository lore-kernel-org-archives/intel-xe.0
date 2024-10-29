Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BC0D5B854
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 01:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE00310E1CD;
	Tue, 29 Oct 2024 01:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlC81lpw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F23410E1CD
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 01:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730164091; x=1761700091;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CpG47gG1MC+W3eKVZEF4fLBE5bhNyWqQ+n92q78o9H0=;
 b=LlC81lpw2cl7VxGBK4Zgq1Wn327gUqKzzKETHw8ZW2Ev/Le+8iJjzyKo
 9r5Pcx25h+1PxuNGXnimNPpS5I9Sn0n35MlTbG9hMuZOHgmh4l9IaCnXD
 DWbWGaCrkEZHtE9wpcv77olnGvLUfcw5QblQCjGRoQkgboKYytImsk1rF
 w79H5L5ycg3wkm1NrjUqj4E298Odca0dZXVZWTWP/EXUiOcejzh0YA1A1
 5ARZ3NGa70qzd92Gyg2qu3ysrWtksTBGwc3fN6GWbUmHW7GdmFDkVCuxX
 mRDU4TfP3YmNll+WIDKLVLyn4B2o4Fb4W2GK7n1xPX6advpNC7P229000 w==;
X-CSE-ConnectionGUID: c7LTvXDzTxy6HSPqG0toOg==
X-CSE-MsgGUID: I2qenL3lQ6KOcP9AaUCz1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40321383"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40321383"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 18:08:09 -0700
X-CSE-ConnectionGUID: AxmqdrRwRMyzde0WQfUQig==
X-CSE-MsgGUID: bLYgjoUgTnijO3EoCmBPcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="81696136"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 18:08:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 18:08:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 18:08:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 18:08:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqLSaA3elS5GAITOG4UCelLWKt4zbYWo5NuSfyhhqfAEm1EFxyXv8YB8OlNwin8MVvgZuNSCstRm/bmUejQXkqk/lWB2+EeXWnwKj879DCk7UXjxz4d60/BquqgViUT9tSh2+uCRFpib5z45PzKbOQM7h0aRYgf7P1lwpWshKkn6NceXepKtAv/kcKPkJovrwCp2oGbplMk9IBhHnzd3nG62pDM9Jrhhl972kdpUDLc6wyr5YHToiyKo8W7sOVbCvy8utlKpATRtyjeBcJHUi8TEu7g+Hcr+DU4+m9zF9H1ylvXMoIOQSJkeGK8N0uKvfP1LbP8mvpditqBmumH6oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8mMpMNR2tzyKwrPSPWDEWOUwxr07kTA5hDe/Q/f+xk=;
 b=yj1JlfDRNlfJQCkd6ia57wH3IT/zdRc421zX1ut8cnhyQJlDyGhijdv/jbO3gs3OMkcrDuCtaUz3+ElrAb5Gp+ic9TIRtkmREnhBYJxNNpj3p06q0cwAtlRuZqVTM8aBFTwSKI59l2u++vftUyqZMCuaup/gqQnUkZnK9vChZ03e1f7lX6PLPs2PiDuB6pUocgQfAbYe1BbuxhBZgKst2xJd0ssUz9zcAKf06Colmmrgv5ADKlMwke9X9u/mGS4O4MAQOZn4wfndb9DaUB0rmbopkC+TsaAC1rxvCbScXPHMhOvwi+Zp4owk9UOe5y00dMOYK7swyrKJP4p9i67IyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7528.namprd11.prod.outlook.com (2603:10b6:806:317::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 29 Oct
 2024 01:07:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 01:07:57 +0000
Date: Tue, 29 Oct 2024 01:07:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Add XE_BO_FLAG_PINNED_NEED_LOAD
Message-ID: <ZyA1RrTbJTYna20g@DUT025-TGLU.fm.intel.com>
References: <20241029003224.2257439-1-matthew.brost@intel.com>
 <20241029003224.2257439-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241029003224.2257439-4-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR16CA0032.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b50394-02ae-49a2-d7b2-08dcf7b61fd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QE9b+WzWX8jQzFnUR2z85MlsimT9g5Rs+neqfvqQqklmd4XlJMTAPfpETDBB?=
 =?us-ascii?Q?R6YLpGvxlY2tRpwGrgMbX8xm/x9dlsZzSw1D2Ni0kkM8IA3lJB5cMEq3CYZn?=
 =?us-ascii?Q?Wh5mbAqpNeQkXTvYgvwuvmQET3AwqP9HwY8W3XKfSrO/a7r0fJ6E0SSLRamj?=
 =?us-ascii?Q?+lVtV4I0A9CfWDJ7qzSBPfh7Eo+SVKuOI3Us+4X+c8YpzJ6m5XXOOssCrIXn?=
 =?us-ascii?Q?QzvzH2Tv2yneACW3z41/5SyxUQLlX4pWuuzCLMTnbesfAFe/LgoGaMsEPJXw?=
 =?us-ascii?Q?A7uXtMaQ/I5y62Jdk93SwRBrFrXcynp0vGZI5/8rJN3TqYAVjsN0Pxv/S3be?=
 =?us-ascii?Q?NVglCSWiGQH0yhzqy/Hu6d67AUa5cAt3vmJJ5DcyvKtVWyFGz1pVddiuU/YR?=
 =?us-ascii?Q?aVTpf3Ej1TcevQp/XI6ICxlxeTjmNQ3TWWgbkooda/e5nztJsQgQ+pRYvDnJ?=
 =?us-ascii?Q?IwDFYcnkmT93TJvW60fY0zbTnr41qVphjK4vJfSj7uQl0ZtSTuYIEWmpgXMx?=
 =?us-ascii?Q?xt80GBjdzF6ySsWBKHdjtkOMdMlN05+Af8E+1DmTU0xz/B0hAQOWsKVQj+2v?=
 =?us-ascii?Q?8rCEh3pnJyFO4Au23yfbrPbP4npv8An3IagwXbZiSYW2myKowKYb5FgXDcg5?=
 =?us-ascii?Q?k1X2bTRl1KUb+IW8MKPzmwMwNLFLRH8b/yxCjEXQbGK73bpsZcXKut8ap9s5?=
 =?us-ascii?Q?Tn8OfMhdjYORu51FnWtdW28vWxwiKy92eGXuFLgaiHiN7nhVfc/HFI0SCoyJ?=
 =?us-ascii?Q?f6PIYtEi5MV8YtcBG3adL51u91DHrKu1F/lzyv/5FyhMQ0FcFQWzI6ZpflEW?=
 =?us-ascii?Q?wfmzDWP/D+1i7HMLvbB3EXmdMc4y3xrFw0MIcMylq8l5l1beiqMSmbU2pw4Y?=
 =?us-ascii?Q?vKfp4Suap5IDR6ty+pFYhzkKppzgMeXa0uobDbIRC37iUr8F/eH/Zbyo1m9a?=
 =?us-ascii?Q?TfM9yu08qG62wmd5L1Wpv2+rhRZZOd9YsLpzWlhe8tZ/BwhZwBTgRqrWseOa?=
 =?us-ascii?Q?b2dRB5ajFRki1MoRZGheUjcgcgh4bnGQiGx3mqIPkGOBg8ReeVYsygLaoaPh?=
 =?us-ascii?Q?CvHAKQX4OgvdzjYIyLWJV/6Opl4yZunxf/aKcSVAwpmTjCsfPcnk9IhCM5Yz?=
 =?us-ascii?Q?Lp0bd1kxyWyJRFwLvmHwPnDnz8mcUMOyDyZFo4UVwFpqRqdqrIUAsgSACqYt?=
 =?us-ascii?Q?QJChC5JDvGbMldeVOs8ussK2wEKQ7bEqfsX7IPhTzkIpU3ye7D1er80UsBkF?=
 =?us-ascii?Q?XkGkNYMCOnTPrPPvGzWTEdKBg8AqSPxK7C55A5uK92fEQQQghKqXyQyXs7i1?=
 =?us-ascii?Q?Yfgsktd3UEjbw5oJtCv2g3X5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jaHLfwFUmLMN+ZifFvIayUKFFIBRRrJf+7Oog2msziIfJLuLTQ/b4x+OJ1ec?=
 =?us-ascii?Q?LrPHuKa0M98UuE9+6hCfUuc1oKskZH8HSJE7OgKzfxJ2qIyjsUSzOFL5NLXw?=
 =?us-ascii?Q?+2uWVsFbUwVB6RN/aEMyAEYkmDI+sfl3QAPhljuM0iouRxh+8HQFi7acMBmo?=
 =?us-ascii?Q?F0XcrdkHmsQEc2otMw9eZ2qbbH4ABaEJIGA7Dgjh9ez7caZForWwmlLs+OGa?=
 =?us-ascii?Q?I40eF7bD0Qrr0qdqZScmmiYigi5oXh9QumruBEItIbzROMuZGACKZc1d7JZ8?=
 =?us-ascii?Q?fi17u+S7jZvTL/N5gwWosx7ec23eXpuzd0Gi3jrp+X565FbXbr0E3WfDGCCC?=
 =?us-ascii?Q?95WJ49YMRU/tw75b6oQ/KDHeUs7RxT7mXZxeguW37sREmGVxFulC2TcNt1fI?=
 =?us-ascii?Q?Hedm7+msRi7TsZGvNmoGgDwoQF9PyoB6iEhWGqX9XSuIAvdyKA7F7uC64iRp?=
 =?us-ascii?Q?o9z5aHSCGbgYWMu+6gh8DED7UPQ/A+MU18gUABE6YrE7mm5LBX3+PlreW8Qe?=
 =?us-ascii?Q?6GOKGo+kltsCPtg7TdfYWXtBtLKnDQufu9ogC6d5x6nf5d80W1CZ+/luPXz0?=
 =?us-ascii?Q?agaTscYdUHH0htK5OB04lcpGe0LwYkhi7xkQ2Yv8+0CSqwGn0j7TdBoAa9/T?=
 =?us-ascii?Q?uJS8RF59ShWr3vykp0NepvYBZ0oZ8oTKII6kkrTr76dgzm8OgCuhuYgnkrn8?=
 =?us-ascii?Q?0+ur5QlUI7QnnPwNmgCAgIYgEz5o3YzpsO0UdzUB5ygp0Q3cGpkIx74mJIf6?=
 =?us-ascii?Q?xJpMUbpEvzZIgBN51BYLxIHN8k0gIev1THnMd03agQB5qhmcWFIkc0p4mokl?=
 =?us-ascii?Q?w2xWBrr7nPj/ehv2sbdh+CBUteo7gz/kx4GSjYF0iCiFZNcnZfNWY9DNrXMi?=
 =?us-ascii?Q?T6C/77PYKlWObBDAn5lPaINccQ8RBBl+Cj8Y8acsnZ1GGtBVJeSlH+Hua4RE?=
 =?us-ascii?Q?1m72CekZ+7KUVdWMvUuTCIBW8O90Cz90IFwoDxz8FpCOlkAbfKI7nsY3Cmrz?=
 =?us-ascii?Q?7mIv3nAwWydaWEwdk1PuD3b798sTSajrb66hRzE/2vatv+REGKZ3O6dGso94?=
 =?us-ascii?Q?/Me9HHcgXOYxTsriK0wb2swojlJNeEbEOHbMW3c9bB+EvXHCu8N0/a7675P4?=
 =?us-ascii?Q?DanDmTin68QF2KbkucdGXL5K9bgyZmSuxgZ9S+COozlNvq5OHTe97Bg0F3vd?=
 =?us-ascii?Q?vtVmUJwgGQYTDuBcbBPhV+XHQ5NxiuI7PIUw5cUWQ0dJf+28EBvX02oEDCUu?=
 =?us-ascii?Q?s+7s0McNG6Do4Bxsk0SN06Gwf8hMPt3S56a5yZMdDVUlmVixnDNzd6YwjFxf?=
 =?us-ascii?Q?3j2rwnHRwxQL/ADxZO3IHgur6wsviiQfDvrfUyW/4gbJ5DJiPS79YSrKovPQ?=
 =?us-ascii?Q?KktN6xIL5qLZsxvH61nEdywLpHXXXna0n5pn96RETK19C4uKX4iRUTrG6klR?=
 =?us-ascii?Q?zDTEXN39qdiWpAoh6zuL26cCC/2nchdnC1JN4JqSqxfEevMNsbHjWkWckhjr?=
 =?us-ascii?Q?flLxNyDZnLDzOH0iujcPu926G28Z8/RLO77Um7Mx5Gn7eC1HEAMuQ8nzjAvW?=
 =?us-ascii?Q?frUpfEwGGFeiaCu3speEB0j8cBmSWBpN5TfTf/w6DLRRezCHmLqSE5YpTxKx?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b50394-02ae-49a2-d7b2-08dcf7b61fd3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 01:07:57.1196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PERpBXwAY7TeytXzJG2glCscGbjGUotVoFiYUreDzZ+LxvCfO3rZGzJUlXl9smy4JL1DMYfGaJvHpfjyBFnsxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7528
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

On Mon, Oct 28, 2024 at 05:32:24PM -0700, Matthew Brost wrote:
> Not all pinned BOs need a memcpy to restored, rather just ones which are
> required for resume to complete. Add XE_BO_FLAG_PINNED_NEED_LOAD which
> indicates a BO needs to restored via a memcpy prior to loading GuC. This
> should speedup resume / d3cold exit slightly as the GPU can be used to
> copy some of the pinned BOs.
> 
> Marking most kernel BOs and migration LRC with
> XE_BO_FLAG_PINNED_NEED_LOAD to be safe. This could be trimmed down in
> future.
> 

This patch seems buggy, going to drop for now as most of perf
improvements are from the WONTNEED patch. Maybe we can revive later.

Matt

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c                 |  10 +-
>  drivers/gpu/drm/xe/xe_bo.h                 |   1 +
>  drivers/gpu/drm/xe/xe_bo_evict.c           | 117 ++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_ggtt.c               |   2 +-
>  drivers/gpu/drm/xe/xe_gsc.c                |   1 +
>  drivers/gpu/drm/xe/xe_gsc_proxy.c          |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |   1 +
>  drivers/gpu/drm/xe/xe_huc.c                |   1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c          |   1 +
>  drivers/gpu/drm/xe/xe_lmtt.c               |   1 +
>  drivers/gpu/drm/xe/xe_lrc.c                |   3 +
>  drivers/gpu/drm/xe/xe_memirq.c             |   1 +
>  drivers/gpu/drm/xe/xe_migrate.c            |   1 +
>  drivers/gpu/drm/xe/xe_uc_fw.c              |   1 +
>  14 files changed, 108 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6c8fd5ced2a2..4c48e7ef1e1f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -773,15 +773,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  
>  	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
>  		ttm_bo_move_null(&bo->ttm, new_mem);
> -	} else if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
> +	} else if (xe_bo_is_pinned(bo) && bo->flags & XE_BO_FLAG_PINNED_NEED_LOAD) {
>  		/*
>  		 * Kernel memory that is pinned should only be moved on suspend
>  		 * / resume, some of the pinned memory is required for the
>  		 * device to resume / use the GPU to move other evicted memory
> -		 * (user memory) around. This likely could be optimized a bit
> -		 * futher where we find the minimum set of pinned memory
> -		 * required for resume but for simplity doing a memcpy for all
> -		 * pinned memory.
> +		 * (user memory, pinned kernel not required for load) around.
>  		 */
>  		ret = xe_bo_vmap(bo);
>  		if (!ret) {
> @@ -1706,7 +1703,8 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
>  	u32 dst_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT;
>  
>  	dst_flags |= (*src)->flags & (XE_BO_FLAG_GGTT_INVALIDATE |
> -				      XE_BO_FLAG_PINNED_WONTNEED);
> +				      XE_BO_FLAG_PINNED_WONTNEED |
> +				      XE_BO_FLAG_PINNED_NEED_LOAD);
>  
>  	xe_assert(xe, IS_DGFX(xe));
>  	xe_assert(xe, !(*src)->vmap.is_iomem);
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 854ab8624d7a..cbda820c9d79 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -40,6 +40,7 @@
>  #define XE_BO_FLAG_NEEDS_2M		BIT(16)
>  #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
>  #define XE_BO_FLAG_PINNED_WONTNEED	BIT(18)
> +#define XE_BO_FLAG_PINNED_NEED_LOAD	BIT(19)
>  /* this one is trigger internally only */
>  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
>  #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 32043e1e5a86..049868610e0b 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -78,6 +78,37 @@ int xe_bo_evict_all(struct xe_device *xe)
>  	list_splice_tail(&still_in_list, &xe->pinned.external_vram);
>  	spin_unlock(&xe->pinned.lock);
>  
> +	/* Kernel memory with GPU copy */
> +	INIT_LIST_HEAD(&still_in_list);
> +	spin_lock(&xe->pinned.lock);
> +	for (;;) {
> +		bo = list_first_entry_or_null(&xe->pinned.kernel_bo_present,
> +					      typeof(*bo), pinned_link);
> +		if (!bo)
> +			break;
> +
> +		if (bo->flags & (XE_BO_FLAG_PINNED_NEED_LOAD |
> +				 XE_BO_FLAG_PINNED_WONTNEED)) {
> +			list_move_tail(&bo->pinned_link, &still_in_list);
> +			continue;
> +		}
> +
> +		xe_bo_get(bo);
> +		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
> +		spin_unlock(&xe->pinned.lock);
> +
> +		xe_bo_lock(bo, false);
> +		ret = xe_bo_evict_pinned(bo);
> +		xe_bo_unlock(bo);
> +		xe_bo_put(bo);
> +		if (ret)
> +			return ret;
> +
> +		spin_lock(&xe->pinned.lock);
> +	}
> +	list_splice_tail(&still_in_list, &xe->pinned.kernel_bo_present);
> +	spin_unlock(&xe->pinned.lock);
> +
>  	/*
>  	 * Wait for all user BO to be evicted as those evictions depend on the
>  	 * memory moved below.
> @@ -109,6 +140,43 @@ int xe_bo_evict_all(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static int do_restore_kernel(struct xe_device *xe, struct xe_bo *bo)
> +{
> +	int ret;
> +
> +	xe_bo_get(bo);
> +	list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
> +	spin_unlock(&xe->pinned.lock);
> +
> +	xe_bo_lock(bo, false);
> +	ret = xe_bo_restore_pinned(bo);
> +	xe_bo_unlock(bo);
> +	if (ret) {
> +		xe_bo_put(bo);
> +		return ret;
> +	}
> +
> +	if (bo->flags & XE_BO_FLAG_GGTT) {
> +		struct xe_tile *tile = bo->tile;
> +
> +		mutex_lock(&tile->mem.ggtt->lock);
> +		xe_ggtt_map_bo(tile->mem.ggtt, bo);
> +		mutex_unlock(&tile->mem.ggtt->lock);
> +	}
> +
> +	/*
> +	 * We expect validate to trigger a move VRAM and our move code
> +	 * should setup the iosys map.
> +	 */
> +	xe_assert(xe, !iosys_map_is_null(&bo->vmap));
> +
> +	xe_bo_put(bo);
> +
> +	spin_lock(&xe->pinned.lock);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_bo_restore_kernel - restore kernel BOs to VRAM
>   *
> @@ -122,48 +190,32 @@ int xe_bo_evict_all(struct xe_device *xe)
>   */
>  int xe_bo_restore_kernel(struct xe_device *xe)
>  {
> +	struct list_head still_in_list;
>  	struct xe_bo *bo;
>  	int ret;
>  
>  	if (!IS_DGFX(xe))
>  		return 0;
>  
> +	INIT_LIST_HEAD(&still_in_list);
>  	spin_lock(&xe->pinned.lock);
>  	for (;;) {
>  		bo = list_first_entry_or_null(&xe->pinned.evicted,
>  					      typeof(*bo), pinned_link);
>  		if (!bo)
>  			break;
> -		xe_bo_get(bo);
> -		list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
> -		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, false);
> -		ret = xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo);
> -		if (ret) {
> -			xe_bo_put(bo);
> -			return ret;
> +		if (!(bo->flags & (XE_BO_FLAG_PINNED_NEED_LOAD |
> +				   XE_BO_FLAG_PINNED_WONTNEED))) {
> +			list_move_tail(&bo->pinned_link, &still_in_list);
> +			continue;
>  		}
>  
> -		if (bo->flags & XE_BO_FLAG_GGTT) {
> -			struct xe_tile *tile = bo->tile;
> -
> -			mutex_lock(&tile->mem.ggtt->lock);
> -			xe_ggtt_map_bo(tile->mem.ggtt, bo);
> -			mutex_unlock(&tile->mem.ggtt->lock);
> -		}
> -
> -		/*
> -		 * We expect validate to trigger a move VRAM and our move code
> -		 * should setup the iosys map.
> -		 */
> -		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
> -
> -		xe_bo_put(bo);
> -
> -		spin_lock(&xe->pinned.lock);
> +		ret = do_restore_kernel(xe, bo);
> +		if (ret)
> +			return ret;
>  	}
> +	list_splice_tail(&still_in_list, &xe->pinned.evicted);
>  	spin_unlock(&xe->pinned.lock);
>  
>  	return 0;
> @@ -190,9 +242,20 @@ int xe_bo_restore_user(struct xe_device *xe)
>  	if (!IS_DGFX(xe))
>  		return 0;
>  
> -	/* Pinned user memory in VRAM should be validated on resume */
>  	INIT_LIST_HEAD(&still_in_list);
>  	spin_lock(&xe->pinned.lock);
> +	/* Pinned kernel memory with GPU copy */
> +	for (;;) {
> +		bo = list_first_entry_or_null(&xe->pinned.evicted,
> +					      typeof(*bo), pinned_link);
> +		if (!bo)
> +			break;
> +
> +		ret = do_restore_kernel(xe, bo);
> +		if (ret)
> +			return ret;
> +	}
> +	/* Pinned user memory in VRAM should be validated on resume */
>  	for (;;) {
>  		bo = list_first_entry_or_null(&xe->pinned.external_vram,
>  					      typeof(*bo), pinned_link);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 0124ad120c04..d42dbda983c1 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -357,7 +357,7 @@ void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
>  int xe_ggtt_init(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
> -	unsigned int flags;
> +	unsigned int flags = XE_BO_FLAG_PINNED_NEED_LOAD;
>  	int err;
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 1eb791ddc375..bbb68575a207 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -474,6 +474,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
>  		return -ENODEV;
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, SZ_4M,
> +					  XE_BO_FLAG_PINNED_NEED_LOAD |
>  					  XE_BO_FLAG_STOLEN |
>  					  XE_BO_FLAG_GGTT);
>  	if (IS_ERR(bo))
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index fc64b45d324b..df271f9b657d 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -384,6 +384,7 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
>  		return -ENOMEM;
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, GSC_PROXY_CHANNEL_SIZE,
> +					  XE_BO_FLAG_PINNED_NEED_LOAD |
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT);
>  	if (IS_ERR(bo))
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 062a0c2fd2cd..75b225cbddf8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1405,6 +1405,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	bo = xe_bo_create_pin_map(xe, tile, NULL,
>  				  ALIGN(size, PAGE_SIZE),
>  				  ttm_bo_type_kernel,
> +				  XE_BO_FLAG_PINNED_NEED_LOAD |
>  				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  				  XE_BO_FLAG_NEEDS_2M |
>  				  XE_BO_FLAG_PINNED);
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 6a846e4cb221..1008626b517e 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -53,6 +53,7 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
>  	/* we use a single object for both input and output */
>  	bo = xe_managed_bo_create_pin_map(xe, gt_to_tile(gt),
>  					  PXP43_HUC_AUTH_INOUT_SIZE * 2,
> +					  XE_BO_FLAG_PINNED_NEED_LOAD |
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT);
>  	if (IS_ERR(bo))
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1557acee3523..46e4342cc9cd 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -577,6 +577,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_reg_sr_apply_whitelist(hwe);
>  
>  	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
> +						 XE_BO_FLAG_PINNED_NEED_LOAD |
>  						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  						 XE_BO_FLAG_GGTT |
>  						 XE_BO_FLAG_GGTT_INVALIDATE);
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index a60ceae4c6dd..c3e76ddf24be 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -70,6 +70,7 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
>  				  PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
>  					     lmtt->ops->lmtt_pte_num(level)),
>  				  ttm_bo_type_kernel,
> +				  XE_BO_FLAG_PINNED_NEED_LOAD |
>  				  XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
>  				  XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_PINNED);
>  	if (IS_ERR(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 4f64c7f4e68d..fec5aa700ce1 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -884,6 +884,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	void *init_data = NULL;
>  	u32 arb_enable;
>  	u32 lrc_size;
> +	unsigned long restore_flags = vm && vm->flags & XE_VM_FLAG_MIGRATION ?
> +		XE_BO_FLAG_PINNED_NEED_LOAD : 0;
>  	int err;
>  
>  	kref_init(&lrc->refcount);
> @@ -898,6 +900,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	 */
>  	lrc->bo = xe_bo_create_pin_map(xe, tile, vm, lrc_size,
>  				       ttm_bo_type_kernel,
> +				       restore_flags |
>  				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  				       XE_BO_FLAG_GGTT |
>  				       XE_BO_FLAG_GGTT_INVALIDATE);
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index f833da88150a..6e63a7c4206e 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -187,6 +187,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>  	/* XXX: convert to managed bo */
>  	bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
>  				  ttm_bo_type_kernel,
> +				  XE_BO_FLAG_PINNED_NEED_LOAD |
>  				  XE_BO_FLAG_SYSTEM |
>  				  XE_BO_FLAG_GGTT |
>  				  XE_BO_FLAG_GGTT_INVALIDATE |
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index cfd31ae49cc1..cf8ad0c47dfb 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -208,6 +208,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	bo = xe_bo_create_pin_map(vm->xe, tile, vm,
>  				  num_entries * XE_PAGE_SIZE,
>  				  ttm_bo_type_kernel,
> +				  XE_BO_FLAG_PINNED_NEED_LOAD |
>  				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  				  XE_BO_FLAG_PINNED);
>  	if (IS_ERR(bo))
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index b0deb082ab2b..984b0e0a6241 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -793,6 +793,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  		return 0;
>  
>  	err = uc_fw_copy(uc_fw, fw->data, fw->size,
> +			 XE_BO_FLAG_PINNED_NEED_LOAD |
>  			 XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT |
>  			 XE_BO_FLAG_GGTT_INVALIDATE);
>  
> -- 
> 2.34.1
> 
