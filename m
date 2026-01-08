Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BE0D1D478
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 16:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C409B10E7AC;
	Thu,  8 Jan 2026 16:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJpPHvVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017E210E7AB
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767889460; x=1799425460;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fiAe+zOVQtbvOSd1mRfuPdCBnOJMPDVFhQP1/XRfM80=;
 b=MJpPHvVBI7lYKoQXX71b31HlD68wcJJwIZ07d7Ebgma+kPPKg4EQUI6x
 FTh2uPE4po9XYNfhA0ht0j8iI1n6h6dH9u/ECRAGQLxY4WjnGec4LD1gF
 4R/FxqI0M9XK5fb08fT3crukgFVZX7kGsNPwF39KcApHWkFd+6HDxUiDX
 M9oXG3+AuIeM7W6AMRnK6MM64l/AI1LIT9u8IzHZGdSvxWTF6sskXjzyk
 Hz6U/7x2v/P79vdABUdo3lTRzu3Vnnj1mYuq2wIoEWeiTTgHEK9sGfMc9
 FitIHcU4uDdd1lM3Su0QZ3Xd9Adl39x7AHO84D3UG5vILNDf6rmUD1xee A==;
X-CSE-ConnectionGUID: 5fV455oARhyclG9Orqzl/w==
X-CSE-MsgGUID: lZdQ8mmATRW1NmSpbaVBIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69007275"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69007275"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 08:24:19 -0800
X-CSE-ConnectionGUID: yiqzpvGlSfKeodwbjn2tBA==
X-CSE-MsgGUID: gBHc1NrwSsG3uC9aQBGUzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="207730866"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 08:24:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 08:24:18 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 08:24:18 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 08:24:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVAvFhf3pNpemMTllE2KjhgUsVUCx2hgd+78h1/73ZpxNSdhmGIP/k4v9lHff/70ikxlNucwLZmMXVktLSfpawA3btIsubm9iNxJ/Qezw6XCt/t4MwxBgYBAWnSfQsuH7n/uQltImuQAbp2OuTZe3yNuUyH24Jgnjs2GM9Gk/WP2jh0NvbJUmCI03td9xFrvQTNNOztnNUZmSYCpsu7NX45Of8F+HHFnJetDVEY1GB1b3jesF7zkTekA+FT3WnKmBgVerlxAtRQ979QynZVTbXepTzGHItPwcPznJQGUv8FXPQCaeyiy0x40hVAdcQ+ljYc0Ow/0w9qqXBrUwc3/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b39SkKwLi4Dlkiv0/KPGQaK52qrlt0eiLFf9wsJkBbg=;
 b=wFrxbjHRcB6DA9BRCRk2meq+ckulJLDQtSvUnIHFuzRaN4paHiVi//9NDr/Df/565UWgSHjPibLYhBlkIcdKgy2YuZzhelQS9D13oD3xaUUQKYx4oorgGq3Tvu1PzbO1F0rFkrHnUywxCPj28QEQ0EA/IfuFSJkoKC5eKrfyOOvUoYC5qB0FpkMqXq+C95NgluAtLnZNTIP7zl3Qi9ufoFlMYdsZiGbqa9PMfxvGF2TBbt/W91JjNAtajI/HaeUQ3WOB0xSHcp+xq0pBcJEDxzTDRWBKlajar2JR1uMjybtpuRcUlzOTpzWIDPqSA1gB7zDbCx0bM5X/xn6039QHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:24:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 8 Jan 2026
 16:24:12 +0000
Date: Thu, 8 Jan 2026 08:24:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/xe: Add page reclamation related stats
Message-ID: <aV/aKtSZmTml5LAi@lstrano-desk.jf.intel.com>
References: <20260107010447.4125005-6-brian3.nguyen@intel.com>
 <20260107010447.4125005-10-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260107010447.4125005-10-brian3.nguyen@intel.com>
X-ClientProxiedBy: SJ0PR05CA0141.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 8caa9283-f8c5-4d0d-9448-08de4ed25bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q8zlIC6Fql2k3U7TOA0dyQChxyMWxt8wsIhAB7iKcz6WAkz03hLtmOH5YH3m?=
 =?us-ascii?Q?3MweUXGV1Ln2oiZuwrUZsd182Ypq+nqrg5sW8I2XQhvrk9Kv7Tk44SItey3t?=
 =?us-ascii?Q?3feTO80CLgcMEAa2z4mbUJBq31evKChpv8tmCEYWMsHXH5EmoBj1eXe4uSiU?=
 =?us-ascii?Q?Z0Y+U2uAPR6Q9XVS2YNdt7soes5RNI6bQ/mr5zRJsMNpZLIbRMQ0bWqfPKLR?=
 =?us-ascii?Q?aWNUN1henhGhYwgkLI3nNt69h5gVTivZe7wExVqkGJPx44dIURuQvAT2PG+y?=
 =?us-ascii?Q?KavEeJ6eKE+F8mfb4ayptAc7S7eJW2Edoa4s8oDqUOJXLz7IB3Uvv3MrGZNH?=
 =?us-ascii?Q?05nC5kvJ9QG6d3cmC1QMzgt5eu/DQQ6SdGv4Dqm8scnVu9u3PtNBWUXb3cbQ?=
 =?us-ascii?Q?tmGSGJOcWkzXeqyY5s04v1SaTjox24qrZYSkzrisbmuEomfGUKf5Qo4c9w6d?=
 =?us-ascii?Q?LhnS2snr59wG8m54W3l9qWbtM+1EOfgzmDKdg3uheRycB6E51x41V9agLBg9?=
 =?us-ascii?Q?Wv+jMhLwQB+j4bKLQp0b1xd+kkfmt1RXbARgA3X5b5rVYPE3dkSmLqJ7AhO3?=
 =?us-ascii?Q?TQKXaU92/UAWN3mmf3VgXl94TcwJfk461fvnb/05d8pCDUO5YfFED0uIvjT6?=
 =?us-ascii?Q?aNiSYgV2ws0ZpRZ+7Uy8G6gSVFxv9l0LQuV1ZEN/wkAMmi4Cjp69yec8jamu?=
 =?us-ascii?Q?hG5gHTt6sCoBy6fiCAMR94GlqMu9cAHG3Owyv+XOo1+tTRGcXEZv2AOPnf3C?=
 =?us-ascii?Q?l4S1ch3M0If4zkPCGIjwtYoeKZlfMXLK7MBEITmSnYh9Jd4X8m/rsOXfMlEF?=
 =?us-ascii?Q?qaSfnzpe779io8BH8N8SBP2Bf7zam9yKPNskahV/iIOTEODO2M8Vi3iP4vkr?=
 =?us-ascii?Q?WezXCIcYt+de1foPlemcYzK7/kfLWRBJF0pWqdf4p+eUyxtfw7nkg2mP0tvi?=
 =?us-ascii?Q?BW8lF1+v7SVrIPeUhszQZf7cYO8O3KmUHKK7vNu+j1fWEGypP7ajL1/hW9aS?=
 =?us-ascii?Q?eLgOzo/REqApQ8VXLR3i5xYfEWG2YDu/rIOU2uX/wV8qPzMy/2bX4SkyP7pm?=
 =?us-ascii?Q?HObCbeXWwVE6HA93dv72sQkzs7WNZ/erjJchUt9Mhk+rXZBqaksns6wilY3C?=
 =?us-ascii?Q?SFmisa4FwpgNYhk/DdEb2RcQsVQ69EVVrUl6YOnNOfngPKdL/d4exW4gtvrD?=
 =?us-ascii?Q?bxfCdBdl7L5w/1r+6CCAC60Nc6PF2thgTCDut4GrSPRrguMl4ymFnjpHucGN?=
 =?us-ascii?Q?A703Q7REuBwWqJjpAFNxK6IyqriUR1CCXwskIC6AXZ2ZxwzhYy7muaNSHO8O?=
 =?us-ascii?Q?4YwmKcGRbnvNjO5b8dsGzdltpXmSPmLEsRNR7E0DTxCrYGhFruU/yGtfLCHp?=
 =?us-ascii?Q?2z2t1RGGIKuQb7pOxRTIe7GmFIL4+hrQJAN9kd8pj2ZSmk01g8rkiyuTCZX/?=
 =?us-ascii?Q?Ww0axiRcRmNKsupH8jU8fpbjQTVbgFjb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9QQ1pxlnA/JeXarWH2a6jB839nm/uCrQeAcfvGGHKTsXMmLsbkRh8J9jsHQN?=
 =?us-ascii?Q?LS8qZzvzqTIx968lGDkeH4XsGg+9daTMSUKtRMoR//uP7xwRtgEM5g1H29q4?=
 =?us-ascii?Q?k8Fx4Ea/YaJ7IdkvEwKkb6nVAgNTX9PAw6oBDT0bK7tvWhnuyBjCAcvHbMbG?=
 =?us-ascii?Q?v62El+7dPfcFGImelTSNjrBqu86SDV3evl+oHdXd8p94DPzv2Mr1DhZbGhxM?=
 =?us-ascii?Q?N7UuZvemY+egVrvHuGXPXhAjSP251CEnsr22mI5dVq0NAAy5nga14cyUd20B?=
 =?us-ascii?Q?H7HMmlglauA4lTBCnxcX9P/S2FCnjqDH8yI0TpQk7CUUBcA3Blgonqy+tfya?=
 =?us-ascii?Q?Htg06drOHo/GsJtulh/jF+D7sTjKBFv7Q/GXkPk0p4dTz8Jje/3O9HIea3zQ?=
 =?us-ascii?Q?WiRFQmhu7ufC+bYYhP8KX9WHjvwZfN6rv/TpnWaCJHi8nEsEfS/FP5ROGLnV?=
 =?us-ascii?Q?2p3pwRSEWOW+s2+QqLd5SrULze8PK15EqxxeSy0/XmnaPe9Q5a3NrVYBLZTy?=
 =?us-ascii?Q?qyRhyJENHCpmDFlYbTG5fSlUeOKzpTUG9UiJsg7q7/vlN3I5WrD+skIciJwR?=
 =?us-ascii?Q?d2AEvoqQ4vAWhbryqS/ovfaup4I8QxF69M/WSYLgWPfJFdAjEgz4RbBqBwv2?=
 =?us-ascii?Q?2BI+uDp0Ty+LuRi2je6OrQAREITeIULibzxO8ePs9LtryVNYoVqjHPrIbos3?=
 =?us-ascii?Q?teWYxQFVhfmzuAxmT124E6e2yO7nV3Oub+WF8+sPaZw1WI1P9oiG7JgPpKvo?=
 =?us-ascii?Q?ny7yjiFGAf9TcK7PnneY0d7ExwZB6K1YuqRI8rZ57Ju0Iy633OOPdII9TsGN?=
 =?us-ascii?Q?/Gzw5/mnjxeWPCPexH1WV9n55mo7/7vnjag2YjaTf9rQmb81B848w8IiUKSd?=
 =?us-ascii?Q?UoBMYlpELBlka7pnoWUS/wiyq9xCwXQn0bzetLX8mlywY/7kKfWhOibcq+2j?=
 =?us-ascii?Q?44frOOqUPdLWNmJtiUXfQduNwEGQslntLrmjwbYs8mTh0XrQafLYW4ou89+V?=
 =?us-ascii?Q?WffNXX5zuJj0wW5EqhCo3AH7uWTfzpR+ENlz9jfp6OWZfbfWWNxZEYM591IF?=
 =?us-ascii?Q?EqVTrhLD3L9xIWCLfEEj0Tq3t7IEUKxufIn4cS3Ld/UnR9DYgjPiZ7n7swxV?=
 =?us-ascii?Q?r4LG2vBOk1K7ySeSTB8dnO+iPKM4OmiSF/fqo3+WlGQ4k6RBIA3Nt7uW+A+b?=
 =?us-ascii?Q?fsyq7liw1piBUPNmPJApuJTH4buoC8SKFpNkMCSvFNwk0Eq5VCrY/iprbl0d?=
 =?us-ascii?Q?dTPq4srnmJjC6g57a5xLjZLiOz3AbtKAitdoU1Qno1ZSDsjVkknHUQMoNF50?=
 =?us-ascii?Q?O2iX/ZPNqAnXT9NCM6xgm/vDZHgHDmrKeHEcayWLMJLmaKvhRJDSOI308Rba?=
 =?us-ascii?Q?r8qdUhc4TOWq+TxKf8MZSChkdPCRqDNLn73TQdSlLwVtitWr85RDLe3DtSHh?=
 =?us-ascii?Q?1k6EyzVDon4cW+s5J714A5Xh/MnamH3xdAjTLCBIbL6gQn39Ua9AWGK55UD5?=
 =?us-ascii?Q?XfnSZPoUnn2Tbr5ATUMn2CgRdNQG3KlChOT6NH7g8XQ/GJffYk4mPX41b6gQ?=
 =?us-ascii?Q?UwEHgwCRbRIgTv4NDkPbwgtmVXGe4JFIUfIs2+X2f/DZfVNCG/8QHEtmfHw0?=
 =?us-ascii?Q?ss554m0NhYSr+voT8tjehck88ZGNBQaPiT/9VUnw4vbb2X5eGV/XKb4iiIQA?=
 =?us-ascii?Q?WE79ywmHxVjOPTHwAQGCHuy/MS7ChD0zIYcNtLDCSqFX/0pf7S4uYarXDfZY?=
 =?us-ascii?Q?kCMS2F/hL15UyDAwx/JDhYhhnvoh7Zk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8caa9283-f8c5-4d0d-9448-08de4ed25bb4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:24:12.3030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0Kbx+m4u3knMlWTgbJkI8k8pLh1mTvijKs/fx2PnIBX2RVCcm2IZkqrX2A4PDp7e7BBrdsjsGJ5ow4kP44wuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
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

On Wed, Jan 07, 2026 at 09:04:52AM +0800, Brian Nguyen wrote:
> Add page reclaim list (PRL) related stats to GT stats to assist in
> debugging and tuning of page reclaim related actions. Include counters
> of page sizes added to PRL and if PRL action is issued.
> 
> v2:
>  - Add PRL_ABORTED_COUNT stats and corresponding changes. (Matthew B)
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c       | 5 +++++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h | 5 +++++
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c  | 3 +++
>  drivers/gpu/drm/xe/xe_page_reclaim.c   | 1 +
>  drivers/gpu/drm/xe/xe_page_reclaim.h   | 1 +
>  drivers/gpu/drm/xe/xe_pt.c             | 5 +++++
>  6 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index fb2904bd0abd..8294bcd40310 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -76,6 +76,11 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  		     "hw_engine_group_suspend_lr_queue_us"),
>  	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
>  		     "hw_engine_group_wait_dma_queue_us"),
> +	DEF_STAT_STR(PRL_4K_ENTRY_COUNT, "prl_4k_entry_count"),
> +	DEF_STAT_STR(PRL_64K_ENTRY_COUNT, "prl_64k_entry_count"),
> +	DEF_STAT_STR(PRL_2M_ENTRY_COUNT, "prl_2m_entry_count"),
> +	DEF_STAT_STR(PRL_ISSUED_COUNT, "prl_issued_count"),
> +	DEF_STAT_STR(PRL_ABORTED_COUNT, "prl_aborted_count"),
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index b92d013091d5..b8accdbc54eb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -49,6 +49,11 @@ enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
>  	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
>  	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> +	XE_GT_STATS_ID_PRL_4K_ENTRY_COUNT,
> +	XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT,
> +	XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT,
> +	XE_GT_STATS_ID_PRL_ISSUED_COUNT,
> +	XE_GT_STATS_ID_PRL_ABORTED_COUNT,
>  	/* must be the last entry */
>  	__XE_GT_STATS_NUM_IDS,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index 6532a88d51e2..774467befbb9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -97,6 +97,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
>  			     u64 gpu_addr)
>  {
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	u32 action[] = {
>  		XE_GUC_ACTION_PAGE_RECLAMATION,
>  		seqno,
> @@ -104,6 +105,8 @@ static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
>  		upper_32_bits(gpu_addr),
>  	};
>  
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_ISSUED_COUNT, 1);
> +
>  	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>  			      G2H_LEN_DW_PAGE_RECLAMATION, 1);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
> index 94d4608ebd74..a8f35919a9da 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -12,6 +12,7 @@
>  
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
> +#include "xe_gt_stats.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_pat.h"
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
> index 12f861f357d8..3dd103e37beb 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -91,6 +91,7 @@ void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
>  		struct xe_page_reclaim_list *__prl = (prl);				\
>  											\
>  		xe_page_reclaim_list_invalidate(__prl);					\
> +		xe_gt_stats_incr(__gt, XE_GT_STATS_ID_PRL_ABORTED_COUNT, 1);		\
>  		vm_dbg(&gt_to_xe(__gt)->drm, "PRL aborted: " fmt, ##__VA_ARGS__);	\
>  	} while (0)
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a53944957be4..6703a7049227 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -11,6 +11,7 @@
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
>  #include "xe_gt.h"
> +#include "xe_gt_stats.h"
>  #include "xe_migrate.h"
>  #include "xe_page_reclaim.h"
>  #include "xe_pt_types.h"
> @@ -1587,6 +1588,7 @@ static int generate_reclaim_entry(struct xe_tile *tile,
>  				  struct xe_page_reclaim_list *prl,
>  				  u64 pte, struct xe_pt *xe_child)
>  {
> +	struct xe_gt *gt = tile->primary_gt;
>  	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
>  	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
>  	u64 phys_page = phys_addr >> XE_PTE_SHIFT;
> @@ -1607,12 +1609,15 @@ static int generate_reclaim_entry(struct xe_tile *tile,
>  	 * Only 4K, 64K (level 0), and 2M pages are supported by hardware for page reclaim
>  	 */
>  	if (xe_child->level == 0 && !(pte & XE_PTE_PS64)) {
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_4K_ENTRY_COUNT, 1);
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamation_size = 0 */
>  		xe_tile_assert(tile, phys_addr % SZ_4K == 0);
>  	} else if (xe_child->level == 0) {
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT, 1);
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 4 */
>  		xe_tile_assert(tile, phys_addr % SZ_64K == 0);
>  	} else if (xe_child->level == 1 && pte & XE_PDE_PS_2M) {
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT, 1);
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
>  		xe_tile_assert(tile, phys_addr % SZ_2M == 0);
>  	} else {
> -- 
> 2.52.0
> 
