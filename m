Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27763C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 19:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D8610E9E9;
	Fri,  9 Aug 2024 19:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igTRtG8a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F85C10E9E9
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 19:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723231284; x=1754767284;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mvKL64DkdAGNaxWQc2H1L9Ddmnrf5YcsFELkcAzVJEE=;
 b=igTRtG8aauuS85VgfHHpIWd1CTe/Du3pDPJeL4tzHuH1/95V6j9hlShN
 QgJgYzztSMbs4if3sHrdTrg2q1fLD5MSizMDwl69MbDdN/LZAZoWh6GDa
 BZK4JA/DTCfK2gmpwjzEeGoYnRAwN450Hxr/2TsDzOh1LxkXufmW6IcoF
 kPGyGM2OT3dzjodQ5GQF+ebKyyGnFZE5JXVwcjONf+1ZPYBIRoZ4azS/E
 smgThi//wze0xsGBtPJK52c+26pRse5NN6oZq6rkRCX7Ytoa8LQr3lvSB
 NGZkxTzsF8Emgl1WfHK8vLb1K92/5yV0ayQ8HKdFU0Sx7fEa/NApRySeu w==;
X-CSE-ConnectionGUID: 5tHSDIfFRnqgUDJv8kf4sQ==
X-CSE-MsgGUID: FW83CS1SRq2UBSTbieprQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="46823854"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="46823854"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:21:24 -0700
X-CSE-ConnectionGUID: dbe7Dlk2R4iygldl5ubmXg==
X-CSE-MsgGUID: xlh99ww3RG6HNITf6ghenQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="80883485"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 12:21:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 12:21:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 12:21:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 12:21:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 12:21:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElxQwKeP9oDIAcPNat6whZudQFd8XJhO8lpATWgxdb9OUVoMlssfWRRIUNJBkiN/WJZO96GNP2dBDP2s8O17sPjhul1IrrMnY9OpdYXs2o1CQ+zkgjmih29H/VBWfit4rprooCdDNI3IsycQr4SoAeHGMoKJTKYUwC1vVfmZfhzCP7z7XHd2dJDZvjL5DhkllY0uncLvdZe8LsFzC8tgl2Pk9cSi55Asgu5Gem5aGRM7NCmirJASHPTeUjXjL19Z3AvQsHCxouWwesKGZbtMxgiMhiGY1P510MaFhkrGlNLJsLO28NKs52oT/zJyGW+hx/7wIWUUoBYGfTELpXlubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmAbsvRkEEQJxQzHdUtCunWQLLGyfvD4kJC868BzLDw=;
 b=BcUzv9FdOFKAithFn0GPU++YgbHFPbQPhSpxrTnclRUMEqUgZ81swLRt/2bIyazbv6aPjuPdkYmyR/fshlqy1MMicC3uLupiAIzHzP4bmOoWwcQk1MLr3l94Q6+4XHryPnmBtFILepC0TvZsDiQLQLEIqHz/3ujbjYMjc7hr1OM5mqJnaxEdh29EzUIT2zG8hG+DU5fganbkSHjN4EB4KHmLJ53fzxvsua6xucnL/0ef2EpTRgk68A1FHbQ3l8UpcVdTntQjsnYPlx4BHeisw3kwp3o8VCisyR/H21Z6iy7Nwrwz3cExNOhO74jukYBUYEXsM8/QCwgBntdBZTmzNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Fri, 9 Aug
 2024 19:21:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Fri, 9 Aug 2024
 19:21:17 +0000
Date: Fri, 9 Aug 2024 19:20:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 09/11] drm/xe/exec: Switch hw engine group execution
 mode upon job submission
Message-ID: <ZrZr9TEeNU1eIXV3@DUT025-TGLU>
References: <20240809155156.1955925-1-francois.dugast@intel.com>
 <20240809155156.1955925-10-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240809155156.1955925-10-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:a03:333::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: b13a1a57-4d14-41a8-2915-08dcb8a87180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3XG1tmQrtW60+GwisEgpNmRnQgQu6txQo6Eq45s8LrK4RnJLAvrY6JG7QaNs?=
 =?us-ascii?Q?sunuV5Ae+oxKkerVwgH2PUeNWI2BwtPzv9H7ffM6Mum/BHfrzy547/LADumF?=
 =?us-ascii?Q?+zb1CcfRqQG4hGohVyO2h9kspPAQ7XN/1OFD0lwgDcz2dbnMN4dIF0L804BY?=
 =?us-ascii?Q?FU3hwEWNCagx2YCBAA9ldzXjRilMvQkCfx3ktvM0rDa1lD90vNhZ6Eqae1S+?=
 =?us-ascii?Q?9558bMtnXEl2wl7jwE3UoJbi57SffBI2YKf2imwCyp1GEitwmUDSPA4zFF3m?=
 =?us-ascii?Q?c/6wymhlIKEiy88JoA9RU9BboR0eMcP+I8yYebUXxbC6YmzQ0NAB7jkR7AzQ?=
 =?us-ascii?Q?IwQlArTA51BioZwkY3ZexAtHGzjtkV85/c8F4kBgCZKn+3vyPOfgBoTjplXO?=
 =?us-ascii?Q?cP/JxPHf0ymdKnnaNp+vvzp1hlVyIZFQjWIKBoPcwMzhmszqZSEvhXP4DM5K?=
 =?us-ascii?Q?uXuyIGnbVWgs/AqUoJX4w0XP+Hke57auZyOpR4PYK/GXaV3NYr+VZaHCqlPJ?=
 =?us-ascii?Q?m0qji1sQ6x8byjhlb/+ypnqBXvnNQK8JmLQHNw0cj7ePu7zMSaoJf36SLjPS?=
 =?us-ascii?Q?ZPBTNRaeFTc3YKiwWHXjySNzF2pH1qJhl8AFb4oKQXaUjIQ0rNNkUSLyJw1D?=
 =?us-ascii?Q?8BenpzmbGzNf2xlxR0gzF6Z8Y3rGouXfeeNAspbyP00KhC5iMmNsTyh8dmqV?=
 =?us-ascii?Q?EaUoLp6OFyiMxITLlc5PwqWRXo8xb+UfnSc6FKHiHpNgx/lWNWpQnQ60X9TQ?=
 =?us-ascii?Q?KLEl74lqnZozAZ012FQDaDu367GOcigG7HyoXo768Eh56bNDj4RH6zpFFQuP?=
 =?us-ascii?Q?a2sPwt02ihl+73CvU+QaUSS68QyetGP2HVJbg9MfHDB1ubJdvvQo5fW5/2Wf?=
 =?us-ascii?Q?3e0xQ3I9M+lllsgdLD36gVHIHT1aSFlv71uyhg1XlZ0FFNC7UhXusddNncQT?=
 =?us-ascii?Q?wQ0KHEPkjXWqOakrMSotlJSIJ+mvhL1OZIQ37H6vyXLuc94F52u/ib7jez7y?=
 =?us-ascii?Q?Uas2Zzji5Mr+m43pFSj7Z7xhlPm4NerEsasJsn0BenESEwB4/kqaWv1PK/99?=
 =?us-ascii?Q?VVc++dwb+OKl7cvYcQGOqroiyTlwog4dWfQuJ5r8b8gm2tGm4ErTotxFLhSw?=
 =?us-ascii?Q?3BsGvMeSY/ADxbhdhNgUDfgh0gs9GRCEyRiMkLLX7pNc7XQcPXiBlDbFcgCR?=
 =?us-ascii?Q?G04WPoegbqF2obheVeNnktGEQ8iyXD4ATqhl8qIeJdYcf+GYOItbv+msteNo?=
 =?us-ascii?Q?dfCSpMrThjXVEK/lVzWk51OZ7z6vTLrRymTOo4Biqcv1GvbHwCDU2fhG1Qon?=
 =?us-ascii?Q?GuMK++YqHnu43THc2tuwNNe1NA2qQRchTuduj9idlfI9Nw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kA+Ew6RBj3WXeDhHkg0DsngObs8ckZL31ilUW7PY51rSnpTZMvSVWslzLMna?=
 =?us-ascii?Q?LNR+cdeGIRU/e4cMQvxsz5S4HWJrdWEr+PKqsV3uYEKEgU+IN/UXnWPVL8cu?=
 =?us-ascii?Q?uatJ5Wr/w+4aMBNMGjAM6gKeFK3alAS1EUwsVXab7CBxfMyW7nubuk9OCMk5?=
 =?us-ascii?Q?Ywk+g/wXOqpiqWkecED5nK1u6CdkGfoOM6imsK/21Wk+abbHeHshqr30vuik?=
 =?us-ascii?Q?xad0q7j8c6savx+VrgsewlcPkplmv4Cxk9z8lTRtmiPy9fUHlQp1/6t+KxOA?=
 =?us-ascii?Q?vZNfyLxMgWCoUNFw8zLAR+xBCluOhufsu9SVl0lqsUF/f9136cvfqm9yFvkz?=
 =?us-ascii?Q?BkEQTJ6k6pHy7ppSC/sJtG5E0DZf5l1pNkTkW0AYH7LZiEcmZKpzroAW9tKo?=
 =?us-ascii?Q?BGPInL6R+Iq8rx+hpJeEEcbPReqiHjNVMCfHfl9RDLUAEMmI+/4YYplNh+Fl?=
 =?us-ascii?Q?MkXY6jFkR6u18N37Howu01QNdH1i2QSMDE8GDduF1hnxErfN3CuDe+vVCk1N?=
 =?us-ascii?Q?8N+FNkc4t9GxdN8BndEvZNBtqWoQwp87mA1Wr/6j8b8Q89M1ssCpQlGF4eBw?=
 =?us-ascii?Q?LSP6EsWz/GmBUG6ZXnXP34M++qwaj5KmctycDdjc6Xvexm7PqNjWPzz0czE8?=
 =?us-ascii?Q?62T1ue69SwRjSaILoz1ic9mNCa5mnCa67bHoEHCK2uuFNPpfwrY6mLlXS+DX?=
 =?us-ascii?Q?/b80L109FFtKTWFATOoZ1PvIGJUOiGSJuI/LpPCDL0f9ZUzfI79RYKvtY47q?=
 =?us-ascii?Q?4WF9FAZbnTB+oEdRgv/+I1pc6hokZ8pUuGumdfzmmJ1k69L6TOLFFh0zlKDN?=
 =?us-ascii?Q?ebYnwAHE6fz26hBDGsy8Qv5+20u+QyQ8cnh2gtN5jSmpR2L+EMJ094XDygpY?=
 =?us-ascii?Q?NmTXGIwgGtpW0whnOpB5Jto26cczeRUg+P3Zpbz4O85qK7KyovL2ag8SnxHI?=
 =?us-ascii?Q?/8ATjUTZWrG2yIRz240ckTvCh3rOHNBqMjjf86SQKz4J970MM1Sa3Y0hz5+k?=
 =?us-ascii?Q?hd+53eeUACJ73ULZI8SEGswtDT6N/pcOgO0wrVe3ZiZVUpiPcY2bN5iSEOdi?=
 =?us-ascii?Q?eByHK4wSrIsvvxMLudWaDcQX5Gw9cRIuh8C78Qh+uC9rabUTQPJg4JBaRZlQ?=
 =?us-ascii?Q?AUaVAfQw/h5CNHE4Eo4xd+L9bwsGYDZtVIvgZIf+PytAbbvODNq9agrt7m7/?=
 =?us-ascii?Q?G7Fg9TWd+ZP/OCBIE0Dq5TLOMZd8RzMrig203zfjUE61YcUZ5oXHPf0EExaI?=
 =?us-ascii?Q?+UXbVM4vIezSFKz0OU3eAxlIbv3opr93ESRgUIOrlkHmzEjZoAVDfemml9Rr?=
 =?us-ascii?Q?yTUQW5FBLZ4p6+VyMRwaWL++7ROULCQc/qceetQGR8GxX+HwhiguE2YuGYka?=
 =?us-ascii?Q?HGLy/MnjMLSUrZmLTF7kN1meQO8J0cFztCI4nR54/xEA5C/8j6QUZ8n9sGK7?=
 =?us-ascii?Q?WjmhZ+d3NnSf/H7QR0hcvgC9TZBZZjBoPZwn1uEHRHfHDJ4raeZ/IBG50mGv?=
 =?us-ascii?Q?2mWOeb/1E1UfObZWkX2B8/FIvSvYDzT1qa3TyppoAWuPULS6vDEmbhr7yMxP?=
 =?us-ascii?Q?uJufxgj4yTfq+TCM0Hw8PWh/KYSJloJUbeIjmUpY3ipVC0bkH412K8JPCnFv?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b13a1a57-4d14-41a8-2915-08dcb8a87180
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 19:21:17.9131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3aznmyEAJUCcdVLGLXf7VvlNUnelCq1i9MJLPpaSHo7fT3EebsJ6HM+SZU2MatG+ZpSPE90+V4w9UHdVDEXSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
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

On Fri, Aug 09, 2024 at 05:51:34PM +0200, Francois Dugast wrote:
> If the job about to be submitted is a dma-fence job, update the current
> execution mode of the hw engine group. This triggers an immediate suspend
> of the exec queues running faulting long-running jobs.
> 
> If the job about to be submitted is a long-running job, kick a new worker
> used to resume the exec queues running faulting long-running jobs once
> the dma-fence jobs have completed.
> 
> v2: Kick the resume worker from exec IOCTL, switch to unordered workqueue,
>     destroy it after use (Matt Brost)
> 
> v3: Do not resume if no exec queue was suspended (Matt Brost)
> 
> v4: Squash commits (Matt Brost)
> 
> v5: Do not kick the worker when xe_vm_in_preempt_fence_mode (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec.c            | 20 +++++++-
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 62 ++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_engine_group.h |  4 ++
>  3 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index f36980aa26e6..484acfbe0e61 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -14,6 +14,7 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
> +#include "xe_hw_engine_group.h"
>  #include "xe_macros.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
> @@ -124,6 +125,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	bool write_locked, skip_retry = false;
>  	ktime_t end = 0;
>  	int err = 0;
> +	struct xe_hw_engine_group *group;
> +	enum xe_hw_engine_group_execution_mode mode, previous_mode;
>  
>  	if (XE_IOCTL_DBG(xe, args->extensions) ||
>  	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
> @@ -182,6 +185,15 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		}
>  	}
>  
> +	group = q->hwe->hw_engine_group;
> +	mode = xe_hw_engine_group_find_exec_mode(q);
> +
> +	if (mode == EXEC_MODE_DMA_FENCE) {
> +		err = xe_hw_engine_group_get_mode(group, mode, &previous_mode);
> +		if (err)
> +			goto err_syncs;
> +	}
> +
>  retry:
>  	if (!xe_vm_in_lr_mode(vm) && xe_vm_userptr_check_repin(vm)) {
>  		err = down_write_killable(&vm->lock);
> @@ -199,7 +211,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		downgrade_write(&vm->lock);
>  		write_locked = false;
>  		if (err)
> -			goto err_unlock_list;
> +			goto err_hw_exec_mode;
>  	}
>  
>  	if (!args->num_batch_buffer) {
> @@ -312,6 +324,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		spin_unlock(&xe->ttm.lru_lock);
>  	}
>  
> +	if (mode == EXEC_MODE_LR)
> +		xe_hw_engine_group_resume_faulting_lr_jobs(group);
> +
>  err_repin:
>  	if (!xe_vm_in_lr_mode(vm))
>  		up_read(&vm->userptr.notifier_lock);
> @@ -324,6 +339,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	up_read(&vm->lock);
>  	if (err == -EAGAIN && !skip_retry)
>  		goto retry;
> +err_hw_exec_mode:
> +	if (mode == EXEC_MODE_DMA_FENCE)
> +		xe_hw_engine_group_put(group);
>  err_syncs:
>  	while (num_syncs--)
>  		xe_sync_entry_cleanup(&syncs[num_syncs]);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index e6c235119351..82750520a90a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -17,9 +17,36 @@ hw_engine_group_free(struct drm_device *drm, void *arg)
>  {
>  	struct xe_hw_engine_group *group = arg;
>  
> +	destroy_workqueue(group->resume_wq);
>  	kfree(group);
>  }
>  
> +static void
> +hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
> +{
> +	struct xe_exec_queue *q;
> +	struct xe_hw_engine_group *group = container_of(w, struct xe_hw_engine_group, resume_work);
> +	int err;
> +	enum xe_hw_engine_group_execution_mode previous_mode;
> +
> +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR, &previous_mode);
> +	if (err)
> +		return;
> +
> +	if (previous_mode == EXEC_MODE_LR)
> +		goto put;
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_fault_mode(q->vm))
> +			continue;
> +
> +		q->ops->resume(q);
> +	}
> +
> +put:
> +	xe_hw_engine_group_put(group);
> +}
> +
>  static struct xe_hw_engine_group *
>  hw_engine_group_alloc(struct xe_device *xe)
>  {
> @@ -30,7 +57,12 @@ hw_engine_group_alloc(struct xe_device *xe)
>  	if (!group)
>  		return ERR_PTR(-ENOMEM);
>  
> +	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
> +	if (!group->resume_wq)
> +		return ERR_PTR(-ENOMEM);
> +
>  	init_rwsem(&group->mode_sem);
> +	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
>  	INIT_LIST_HEAD(&group->exec_queue_list);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
> @@ -134,7 +166,7 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
>  		if (err)
>  			goto err_suspend;
>  
> -		queue_work(group->resume_wq, &group->resume_work);
> +		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>  	}
>  
>  	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> @@ -167,6 +199,16 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
>  	up_write(&group->mode_sem);
>  }
>  
> +/**
> + * xe_hw_engine_group_resume_faulting_lr_jobs() - Asynchronously resume the hw engine group's
> + * faulting LR jobs
> + * @group: The hw engine group
> + */
> +void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group)
> +{
> +	queue_work(group->resume_wq, &group->resume_work);
> +}
> +
>  /**
>   * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the faulting LR jobs of this group
>   * @group: The hw engine group
> @@ -177,6 +219,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  {
>  	int err;
>  	struct xe_exec_queue *q;
> +	bool need_resume = false;
>  
>  	lockdep_assert_held_write(&group->mode_sem);
>  
> @@ -184,6 +227,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  		if (!xe_vm_in_fault_mode(q->vm))
>  			continue;
>  
> +		need_resume = true;
>  		q->ops->suspend(q);
>  	}
>  
> @@ -196,6 +240,9 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  			goto err_suspend;
>  	}
>  
> +	if (need_resume)
> +		xe_hw_engine_group_resume_faulting_lr_jobs(group);
> +
>  	return 0;
>  
>  err_suspend:
> @@ -310,3 +357,16 @@ __releases(&group->mode_sem)
>  {
>  	up_read(&group->mode_sem);
>  }
> +
> +/**
> + * xe_hw_engine_group_find_exec_mode() - Find the execution mode for this exec queue
> + * @q: The exec_queue
> + */
> +enum xe_hw_engine_group_execution_mode
> +xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q)
> +{
> +	if (xe_vm_in_fault_mode(q->vm))
> +		return EXEC_MODE_LR;
> +	else
> +		return EXEC_MODE_DMA_FENCE;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> index e0deb7c7bb5b..797ee81acbf2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -22,4 +22,8 @@ int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
>  				enum xe_hw_engine_group_execution_mode *previous_mode);
>  void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
>  
> +enum xe_hw_engine_group_execution_mode
> +xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q);
> +void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group);
> +
>  #endif
> -- 
> 2.43.0
> 
