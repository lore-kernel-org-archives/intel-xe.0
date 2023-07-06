Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F322AEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 04:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A3C10E3DD;
	Thu,  6 Jul 2023 04:10:55 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B32510E3DD
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 04:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688616653; x=1720152653;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DWjM5Esbwr5r0x/VkNE5GBKWbkntPD2vfhO3CU0Q45M=;
 b=GD271UxqkDT6rZrIslHsIlaq/El8ieCchm4JK0GbImjnBQPrBuQviS7a
 +ZB/KxGmPIZRL7C9neIfzX0xEMaKjJWe9tITOM8Z70iRF5YTjDZBGw7KK
 ADpdndGRxe6SW36vS8CK58TnV+hYghDi0Oy22oYQ72YWe/tekrWxU5iMT
 pDdLg3in5mAcGy936AIrUxS0FNMD0nb/kJmar4aYJO4Qy85EmA9FQ3J4+
 iVuWF05P8n3etn8QViM81hQIIXgVWe3sWoVbbS/cEnvEPgIY9JOZDvBAN
 a1/EtNtLbkE7oXqzYYO28ZbyUDoeCgpvRWDWYUNgfGRRs288ciLOcKHRH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="366988876"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="366988876"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 21:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="669622652"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="669622652"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 05 Jul 2023 21:06:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 21:06:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 21:06:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 21:06:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 21:06:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJpXeJ3CAz0VtOocrrQ9L3oewfmgCXQJjni+mPBx21olgcAB3CWNfBHtxE/imv7t0qcltcsfggQ863dSJ4YfMBazTWskWHx93UQHEClOmHDIL5zBWPMirj0i3LzrkeA66PM+gEElZfvvvbWd5Iu4nVBB7KLGsBG1a50YQsOnAiJqnSmQ35zG6vcDVciIvfqSRyp2vi0NS1V9BDf2j8wUyUje45rLXEmOHgatTabLUPRHfevwfllX4A1RzB6/K+1+G3zNSfuqy1rdEUsvXnOdSot/xNdf60h+234WGyb6lUm4e0kzsBiyjYRW7ymxAVKNrCwR65sBjKbDWtnL1sH5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F49ssw5Gt4U9EuBJ0/9FVVeRAfFZQLjhXw6YES1WMK0=;
 b=RIjxWf+WSIsxWs8Non+wv6uU8ojDQHlKoc7MsIzJUDx8JCK+5cGlo/dR1dt+OjJfjCH01xR+X1LMm68hMK0IrChj+3xB+Tf52lziKGWxmuGbleUli1UJNDeXZOhLXG9/+fv5xp7/NQKJxemd9MUFuIJWuwVA1M9p8a9JZBxa2oYPitQZOO8ZE0AZhoZN0DZZuioxPXqL4JCa1I0A7ZSXm12Csg/FBkYMsXxku+rSuc7sIPXL1ADhgxapISgr/rQYOnM8NYn4Yy0PPuL/5dPGKOFIunA+f7x2H/GIYZp9qeNVGSvSDGWT7idU9L89m3Wcko3JDELxYBkRtCrr2iAjJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 04:06:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 04:06:24 +0000
Date: Thu, 6 Jul 2023 04:05:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKY9lG6LMZfugBmd@DUT025-TGLU.fm.intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <20230705160602.237213-15-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230705160602.237213-15-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR07CA0061.namprd07.prod.outlook.com
 (2603:10b6:a03:60::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a3cd67-2498-4248-1815-08db7dd65d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eeZ2B1TvGEjQA6Kjq6c39ocn6G+ofNSyxHEiXQbFM1j2BSOv6EubrtdgxOoImGGHY7OqhHagIwlPNgmSRlmolA9PqJGCKUmrJ7TpjLhflpJmbeqEue+Ilv+LTZ5yPFwh0+iybaHpZ4G0+ytesJww/xMQAU7aJD8UKd0GrywIDW+79yalyLvGrVsXXqZmVTkTkt4ksOlaXb2qgmpYfgATQ3psjkApwYsnKpaq+efK9/22ZjyWXiUOcWVTdfbtmhXEdUePrGF3rOy5fuSoVKd1mwU+FOIh1FSu2LViSt6pZppnr4GtSZ+lFy3E3za97pmCiQUs3fEsasiDsx0BLu/WUsIS/IiIj2HQtYk/CUshbBM0+xL9L/dYeAeQ2e8NI7njQbKsQcHjWe0L6AL8nOJxDGKC2BkQ8gApg95ybuOYSXDQKcqKGeRglCwFNuKw7vagO+407Lsw8Vrwg9OFiqqVdmYWqbOqFvjM5Be3vicalYDE5eZOq3CfWzofDlyzmeTGIytw+LsQsPXqdTK4rtVpEnb3pLOMD/nGmYGsBwd9O2FlWnJKa+yo842ODhmeOaFf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199021)(41300700001)(8936002)(6862004)(8676002)(44832011)(316002)(5660300002)(2906002)(6486002)(6636002)(66476007)(66556008)(4326008)(6666004)(478600001)(6512007)(82960400001)(86362001)(38100700002)(186003)(107886003)(66946007)(26005)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JT5rwXc5SaPEYxaY3xj0H3cjRVqC45IqIZIpsUuxHQkVnZJ8UAnrcHgih2?=
 =?iso-8859-1?Q?1F6ZE33CpQ3d5QQkZ5m2AaGQ5cSenBWZVOdbgIfmUGytXL6BSZuaRqqqmF?=
 =?iso-8859-1?Q?44TBuUWmXvjmidRehNQZBVHVAEuQjeCClQ4qcl0xMxCyyHzvMNcRSqun+c?=
 =?iso-8859-1?Q?YWgBZ4+F7eVBAWlpMdswGlhvhB7hvHNE7Nn60lCnbNed188tjnDyOfV/uf?=
 =?iso-8859-1?Q?CYkvcJCWfWyhqXyS+8rJfE+MjCw54d1+86cmrNki3nKgWXulJeOhRJhPo1?=
 =?iso-8859-1?Q?ObauOheOaUTdtmsObBpUoJDcIiRBv0qnc+vnbbSK2W0Wqn5IWQawIx3j21?=
 =?iso-8859-1?Q?Jay0rgOtbNBHbs4hFjE3XxFMI8aHJ7Svu2Hz2h+/QN1ev2FucC4CZ7Bjv+?=
 =?iso-8859-1?Q?iv1oUx+H3ycXDawmW01azJl04c5yZXMJna625Ccd/ZHdu9m6pJqnthcpP6?=
 =?iso-8859-1?Q?ngr1AGaVicd5aXOL4EG+KMDxwpgy9kod4qkKZpFLN23fZtQLATe6ISDmsb?=
 =?iso-8859-1?Q?wY67LXFmMcHb2ERNFSbQdhlAyzX22bmCV0N+znPDBvppPVCqfMZGLJ/z7x?=
 =?iso-8859-1?Q?0owCxh5ShrfN3sXQMJ6F7MECTr/I4Iv2Y/gpUZZYlq8tf0jRRlQzkGxF2E?=
 =?iso-8859-1?Q?UW30xlblbITnJf192nZvjqdJd/YK2vyar6OPSXeOlYe9BEAYRz8gozz3ci?=
 =?iso-8859-1?Q?7mag6eG/5onrhZbY2Sfmel9fdqU9SWqpLuCKFAxwfJdK4RcsGxknh6ur+t?=
 =?iso-8859-1?Q?NfzVN8t853KZ/KTrZx2rvLd8bIbQXyysuBIHdFrQprZEJgMUCkFs2BqoVh?=
 =?iso-8859-1?Q?CNdEa4edx7hmxP9YLnVK+dmNpV4VeOv+5gf+mxIm2ZpEEsrDytSWGiLbYF?=
 =?iso-8859-1?Q?Mx+yObCbcJ7U+lA3+5GFt80e5ULqfaTiy7PJuZttfSytJl92h4UNyjkINl?=
 =?iso-8859-1?Q?x8vGknDxf6TkCkacerOB/OQUF931cIzgF2Pm4MNYmbcEk2v94M4ns0jG4m?=
 =?iso-8859-1?Q?U0iWFp6t+f7qCXZForJEKeZdhtP0Sq+LXDdziadJwvaBb8UEgwl4HLeloF?=
 =?iso-8859-1?Q?eSlYT/vVCDNBHIrpjrKMG7uqLe9Lm3Dt21ox45csuXW6hIoGlAcIPhFjOG?=
 =?iso-8859-1?Q?sWHDyQGKS6IB9ig7KO7Xgyj5/2aUVEjObIYH50n0kY0f0qQJ8jtSLslhkW?=
 =?iso-8859-1?Q?9PIcOSPcoFAZX7C1oSWdReS81MsMGCZarfkP4M9SpK381SoPdFLggsjd+m?=
 =?iso-8859-1?Q?2VV0DxN/CJwSwAu46hJr2oOq4NsXDEYSYcgCSKcpDHVO+hOfSBmvtcUYHo?=
 =?iso-8859-1?Q?L5D7TSTSatBF0XWddtLDRHw0NHfxGAu4izE7xockAId89Aq5ShZ03KNcA3?=
 =?iso-8859-1?Q?axjqbZV0BvSJl5Owk8EWC6MleeA5uR0sblq/CwzWBGnhegko9y96SwKf26?=
 =?iso-8859-1?Q?AFAEHfbLd2mWmJhvViSVQKd0ac/u+TTNMO5n1hXXclikCoqiasGmk0Ltvo?=
 =?iso-8859-1?Q?YuBSUMLWthoojIqb1uyEZobK8JXcS2qiYZAnKCjPGbgd9/6oqBE2fAnDo2?=
 =?iso-8859-1?Q?Wtnt171bvOECbx30FCD4R5pI2vJdQqr2M6CrRfnQerB9JL003LytCmHqFe?=
 =?iso-8859-1?Q?kyby90lPh3AlIBCV2MZWEVPHDokXfkfOoWuWCwbwj5d7Y15mMxjK3D8A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a3cd67-2498-4248-1815-08db7dd65d52
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 04:06:24.7630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdgKlZDBJM9as4CshQh4YZVJCdvtAcd+rX9PxbLHpAnOatYfqSQdpZhKZlHGFGg51Kwow7FwqtxilesKYr1Ffg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 6/7] drm/xe/tlb: also update seqno_recv
 during reset
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

On Wed, Jul 05, 2023 at 05:06:09PM +0100, Matthew Auld wrote:
> We might have various kworkers waiting for TLB flushes to complete which
> are not tracked with an explicit TLB fence, however at this stage that
> will never happen since the CT is already disabled, so make sure we
> signal them here under the assumption that we have completed a full GT
> reset.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index b38da572d268..51789ec9ad57 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -89,10 +89,26 @@ invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
>   void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>  {
>  	struct xe_gt_tlb_invalidation_fence *fence, *next;
> +	struct xe_guc *guc = &gt->uc.guc;
>  
> +	/*
> +	 * CT channel is already disabled at this point. No new TLB requests can
> +	 * appear.
> +	 */
> +
> +	mutex_lock(&gt->uc.guc.ct.lock);
>  	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
> +	/*
> +	 * We might have various kworkers waiting for TLB flushes to complete
> +	 * which are not tracked with an explicit TLB fence, however at this
> +	 * stage that will never happen since the CT is already disabled, so
> +	 * make sure we signal them here under the assumption that we have
> +	 * completed a full GT reset.
> +	 */
> +	gt->tlb_invalidation.seqno_recv = gt->tlb_invalidation.seqno;
> +	smp_wmb();

The smp_wmb() probably isn't needed, this my mistake and have this wrong
in a places in the code. Barriers are not my strong point though so
maybe double check on this.

Otherwise LGTM.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	wake_up_all(&guc->ct.wq);
>  
> -	mutex_lock(&gt->uc.guc.ct.lock);
>  	list_for_each_entry_safe(fence, next,
>  				 &gt->tlb_invalidation.pending_fences, link)
>  		invalidation_fence_signal(fence);
> -- 
> 2.41.0
> 
