Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC56C001DF
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 15:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1DA10E027;
	Wed,  2 Aug 2023 15:57:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E4E10E027
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690991846; x=1722527846;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YYc/B+/MjFQtqEUKOeqppCEkCinO6AfTD+tb2OrWQ8E=;
 b=Dx07/POrEQKb7jrcjzCVxwr+xN3UlZp13IkJCWO0+nqRdFpDRGcF11KR
 q8jV5JvxWmIL5b8F1mdlojwJPL3uY1s7Pa5r2OIkXrBx6WHLYAj+39WAe
 a2jwZFDwRg8EcIx+ziUClMs4kxM6stCn+PuifonwaPu+UadOP2ntoB/xN
 /pRQ00EVuV/5XRz3w9GDvoN3wPCqU2zNd9GIHxwPErdxl8cRmc1V3lCCU
 atT9t61w7kX5Q403KTflzRtSziik7vTMxVDd0bZ77a0KxY/BHpRcg6Yug
 HFkquFH78OKeHU7SuWJbNDlhS2cmVrAdiSSYa4toBleIcvlMiLC2gIGPk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="367086883"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="367086883"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="794643635"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="794643635"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 02 Aug 2023 08:57:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 08:57:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 2 Aug 2023 08:57:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 2 Aug 2023 08:57:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQRWMnb0bJNHs7ZRbMZJkgdDZjV79HNLILeC2QTHIrTAaGva3Vgx+Vy2mWWVmXCCqhUThLCGzp5p4ZiaW48U2WRWIScBeqO6+fJ+sNu5BDcEMCEpPhdCyumX3/FjFJ78Wg4W+iiHtaffVlxs5rSxFaqLHT6XdyLCnAGlY8htLf3MytZ3zpwIF8G6QB5zKutcNVymqdVTgbDhGc5b9L9+YdRl35uofWVfcXrJctuchln5VepvcxgFLIvJZEIxLLGvRZmGKzovx3dGl14p8bQEjmw63oIWqBdZ/BZdEXBmUh/6RJKJjyAYZ6uvErBq6Ne9lbokoWGZFm4rurWKQ7GEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8PuIE1ANiURc4Y3+6m3psxuWxWntljZkUbg5g3U76Y=;
 b=B/Vk+rPNZ7LmVKRbMXoUPV0tuehbVOeczMY3oOdSc0vGKckslRQvErktNVvEtY2alVQdrDQK09z6J+Rq//Is9bMaC+mSocEQ5e4MMRSzLUHHekBj+jWBU9/UipHKq7H8seiIVH/pojNvdoIee0O8sSQLmn04g/cNC4fom+9EqERqOD7+tB7+IA5XtVITTcbVEBwYIXDsJCoiHJu1WFXSke8bln2BZ76gqqCiYrzAB2FHUiLWnPV+4hLZLWqbdPod/e1HPVZZVETqsWhl24b0ZUmFGuw/IT55G3P34PioL+TePIxUZ9KucRtsmkIutd1eTvhsdfxZ7nJxFyGXzb4uEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 15:57:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 15:57:22 +0000
Date: Wed, 2 Aug 2023 15:56:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZMp8sRaNdk6G/Qo1@DUT025-TGLU.fm.intel.com>
References: <20230802140315.193700-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230802140315.193700-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR05CA0112.namprd05.prod.outlook.com
 (2603:10b6:a03:334::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d59059-9e50-4ab0-36a0-08db93712884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8cWGoD1lM+UNrreHCfR4u7vimwlNggjc7K6uQYVEnv2WWFAA1+6PmWtZAl6SD/t+hNwPwN2wRdgFmK1KOBgOmryleW066Gs8PYVYAX3rMvN78KMx0Whg7mkf5sntMJ+7FTCezttoftpXOF34bxR4QNC7DAhTZcdxrLYWKCBn3gXPvmG8bwWi5mcBjbwTO/F4wKE7rSjC9QL4k6uZlvdvKjN0fNXsQiqmsdTq1SmFPU8Gkm9+3j2DiqP2p3vQVLvA/Ksz3/yH8LsMFXqPdHFMrt70XIsPLklKztMJv6Q7S/QxjTL1z1rdDHTyO999h9qoD72nOACoxF1rQOSPDa0IK8LNwfVdKjJaVNaDgfZf7n/HdOvUP5sbdxWBidWIMMROZqX44iQFWU3TcVuKIfpCSk6qxAvmJpbK8/nrETjTWXUWsJRUL6YfwzQHFLs79QPJd4ktSIorM8nEqT8AV1xUhgfMYEthkomGSnhUpQ9K+4tgNlNCiLgPFrAwBQxKsZm2OZOw5FCqSkklOW+QDi6lJaVESrcC0pgINjV8i2MWTMUEs6Hd8/Q40TpxmXt6yLn9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(8676002)(6862004)(5660300002)(83380400001)(82960400001)(41300700001)(38100700002)(316002)(186003)(8936002)(6506007)(26005)(4326008)(6636002)(86362001)(66946007)(66556008)(66476007)(6512007)(2906002)(6486002)(6666004)(478600001)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M8wJBVRiiBdk0lw8PaDmtCFvuFjcwurkbsjs0CSZ12pKB/wbzfldDBFOAW+5?=
 =?us-ascii?Q?BReItdDSBOboiKqnO0kQCsxk4J/6SV/zvhuIIfVqjjmr2bUWzXMjOB09Ufce?=
 =?us-ascii?Q?eBnb+XtfAL8PfNXkLh8pjqW9twTMyUdb/eErcQUke83/nyh/nTdUXYcw1n1k?=
 =?us-ascii?Q?fxEc5Z7zumCi5QpQ7kEpHrdFzbMo/D8StzRd4deqoAn1SQYTXmL/dmJtBtxF?=
 =?us-ascii?Q?nNdt08k/038AH47uao1dYW43yd8Q3GpFzq2uARQASVUVDKiyzcrj0gtHYetW?=
 =?us-ascii?Q?FmKvEzF9znH82FohM/r+mojcmsVK+ITMJnZd2aWwvHGj9/D9XeQxgpoGnO2u?=
 =?us-ascii?Q?KpmrRxB0NRXLn038bPEFevtdqECMS9SWc3hDGZ5UkGDhsY7EFNWDjFF7EQi8?=
 =?us-ascii?Q?QsdURgfy1YK+IBzIg4x+ZYi2BcIfTrvnYMjkXdE4797XbBGER+o+V8zrMw8i?=
 =?us-ascii?Q?1CvE1xOUKhJ0t+VUgjmPGiVH4U301pVeiuwcchtI2Km0FOMHK7/8x2mnDXEq?=
 =?us-ascii?Q?EV+W3jNuXOLBx1ckfpvahXkWs+ibRo6u1k9S8SitI3o/8aVPdbsvgsfe/4ly?=
 =?us-ascii?Q?Le+6f+nDYx53btsUpbq4S+ATJ7KuOG0waXyQ6F3Ti1yO8qgyH1s57tMnVOig?=
 =?us-ascii?Q?qtL1DHY8hhQRO+jMnKW0C6BgeXBEJm8cFe9F5/KP5gKnoVaEJuFqnZWo6t5X?=
 =?us-ascii?Q?NvUeX17JB1gKa1943UKiwhJN6mrDeyBauOGcAqu3iORftAilcJMUZ7WyQaBn?=
 =?us-ascii?Q?0M7FoZ+eT2MLNsa/UYZBrMBHUTiLhMIJknwbGbIUR9OfenZOtU/HyJzgiR8I?=
 =?us-ascii?Q?YGq2sfepwTJ7nOq4azzyzqWuG9nKpkiQuag39ssVXXnZuxf15kHs0d6KQRHE?=
 =?us-ascii?Q?VrtpxZDBL76Okx9iGiV/vmwbRYIWdzu83vitU8i3Ka+eeO+wR/8qfajhFN75?=
 =?us-ascii?Q?kxNuNL23FLTi5RxU5EjTeB6FKtbzbNlSaBvFHFUagBYuyAz8a7yKSJdS6nQ2?=
 =?us-ascii?Q?cKP7F/BdVyfsm/FdLUs784n16zxs5BdOKJsNahlqFdxL+ZhW1R+82IO2JJUL?=
 =?us-ascii?Q?TJG8IIcVTWqBziKUsdxjtBH5d8tLOSvDd4SYcXW5D8jAVezI/Rz3LTb65yEe?=
 =?us-ascii?Q?67tECmjiintpSDZ0zUw3JZyLmW7NooF8+A1+bF5nizW8mwbrLtNwBPfpaO85?=
 =?us-ascii?Q?VaqrKOmscGLq2rjs+Oy/LpIDjBCRM0xdFinFvcCSYxu+smaTldWbhPKh3DCF?=
 =?us-ascii?Q?ZOJRzuZWNGueXw5gpSC6iqt1VOE/MUm0UI8G2G/KuhI0S0NHyBjqoUUqBrUX?=
 =?us-ascii?Q?OyrpO6wbZhWoaY9yJ8lTws/jBvC2NcBSEVMjwUrXfLiv4dlZtjgv/XyibVkA?=
 =?us-ascii?Q?G6gvhdzbp2pZP73LAq3SDjlVshExDO1sLw/6R5qtaJyOf9AiHoZi4+OE/BtV?=
 =?us-ascii?Q?nAupkAKaKoZpqPioTU7C1SR8I1sdtv1SV6Bp5kHphI+l7OAG0HEq1dMbjlp9?=
 =?us-ascii?Q?5xZ1SPELkTT632vn4PTUiQehg7LeXcKiz+DB/GDaUGNUVR1NHhQ/fk2neiJ3?=
 =?us-ascii?Q?sbjlYpXtTydcdZZ2Sw802ztkVTP4Krk6hNamBSxzLvirtuCLZpIG3gSpqyx+?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d59059-9e50-4ab0-36a0-08db93712884
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 15:57:22.4931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OEOd2wsebc/GYJ+6XnspkMIbj5IsSLIXgWnEmVr0R3k+J0LovWdmyQAIahLBbQiaob92r+i3twlf8Ef8yA7WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/guc_submit: prevent repeated
 unregister
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 02, 2023 at 03:03:16PM +0100, Matthew Auld wrote:
> It seems that various things can trigger the lr cleanup worker,
> including CAT error, engine reset and destroying the actual engine, so
> seems plausible to end up triggering the worker more than once in some
> cases. If that does happen we can race with an ongoing engine deregister
> before it has completed, thus triggering it again and also changing the
> state back into pending_disable. Checking if the engine has been marked
> as destroyed looks like it should prevent this.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 8d2b50e03ed2..2459e9dd95e8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -802,8 +802,18 @@ static void xe_guc_engine_lr_cleanup(struct work_struct *w)
>  	/* Kill the run_job / process_msg entry points */
>  	drm_sched_run_wq_stop(sched);
>  
> -	/* Engine state now stable, disable scheduling / deregister if needed */
> -	if (engine_registered(e)) {
> +	/*
> +	 * Engine state now mostly stable, disable scheduling / deregister if
> +	 * needed. This cleanup routine might be called multiple times, where
> +	 * the actual async engine deregister drops the final engine ref.
> +	 * Calling disable_scheduling_deregister will mark the engine as
> +	 * destroyed and fire off the CT requests to disable scheduling /
> +	 * deregister, which we only want to do once. We also don't want to mark
> +	 * the engine as pending_disable again as this may race with the
> +	 * xe_guc_deregister_done_handler() which treats it as an unexpected
> +	 * state.
> +	 */
> +	if (engine_registered(e) && !engine_destroyed(e)) {

This looks correct but a few things.

This will need to be rebased after the s/engine/exec_queue patch that has landed.

guc_exec_queue_timedout_job I think has the same issue too. Can you post a patch for that too.

Anyways this one LGTM:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  		struct xe_guc *guc = engine_to_guc(e);
>  		int ret;
>  
> -- 
> 2.41.0
> 
