Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE22EB64D9
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jul 2023 14:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2353D10E560;
	Wed, 12 Jul 2023 14:53:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855AD10E55F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jul 2023 14:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689173603; x=1720709603;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W3k+fCjvAm5p/xmToIsNkbdU5e45QbK1Msw1qzDl3MQ=;
 b=lQed4pRtz1UcuQuHjYK2chg3d0f5VwVY0/ksAL3WQ15N6eX8iUuESzHL
 WZ+KMC4jJ5rHDSNeIFsQkTr+yVkrlsp7dH4EXPCYjVRFTbHzkzLMm/Vnr
 KO7FFtSnVCTh+TUUyfZv8KGQ59BQb7eRdmjxRqKHSUiO3++Djjcsji97V
 ho8KfppTh3FCPyHmowIuZ+CSzbAl3AX77ysJhptPXg4X6BvW/AwNIjdtL
 yU9wbwssmZSZ7THQSjRW2tnoGiGgdNQCfyg3Ce8Yil8IOGa/orl02M3qJ
 jSPn4Up5hr29X5RRBAOqjqT9xv0at8sqgi1VYb/jvLe2zBdaqG1QHgDOF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="364943429"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="364943429"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 07:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="835169415"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="835169415"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2023 07:53:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 07:53:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 12 Jul 2023 07:53:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 12 Jul 2023 07:53:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/tc7GCscj776F50TG2SEhAMqENAZMZWqICdjhxmHQsuuZ7MvXI6T2eoEVN9smDuK6Dd8XjST0b6I6fKqsaxzTk34yavV8z0b+RpKY/d7vYOJQzUAF0Qf7gqZaqGgiv0243pWeB0cLdObo6Svq0OqrABTJgTMvCl0B9zMEub3RO5+jMQ8eW0Rx9qrcViewB8SYOCagp3fIZ2qTA1KfNHxC4GZDJrxUNPu3IYyikMhF8YkAV6wnIgc82tAsiXzWw9aWLHZKZrqdCHaWKkhoPWP5Pk+bGO0HBj4yCAcwnIBykevPGAgwDe5Qf2jW2rm/QF8TL1kR9jsFPoW3BMSbBUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/C3yDHuirKXuxI9Wr9DJ2oNF6iouPuN6LTdtmhXi9g=;
 b=O4hivFkmVzgJF5OEGRHeew971VBudXlZTr790aEc5r9WK8caLiHT2KUFjNOExoJ1IqRCCGoRhRQAzBKljVtuBDQknfa1pak0ykW9sJFb/5AAGJZavZ20wXmL7Nk3GFeZZHdqRpiBVIp7021n0OYg/oxYWp4MLtbuoKR4AypjNW1yAn9KV87dDXoHuqDFhLz6NBPUG6F8nBZbFg4JIvF2RDEUyUN6sMWhX34BgaKb1dYGITcGeqXNMASFC0sxN0eQGkLzrwAJv4hf2sw+QrT8dqxwoKNKjPtrageMEt+X+j2H55dSfQDLF0JxF8SYpi4wprYgym3RL8jXb0+uGQzmzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7600.namprd11.prod.outlook.com (2603:10b6:a03:4cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 14:53:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 14:53:19 +0000
Date: Wed, 12 Jul 2023 14:52:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Message-ID: <ZK6+NZUQnfZCLQj0@DUT025-TGLU.fm.intel.com>
References: <20230712125640.1471850-1-ravi.kumar.vodapalli@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230712125640.1471850-1-ravi.kumar.vodapalli@intel.com>
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 8607dde1-9944-4cd4-30b2-08db82e7bb54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wAvuV9AMdjDOTNH1oI+MrbKE9HDrKGIY/59YSGMRwJecTv9sMWxRYUxSVNIVSovW0xPqXI/WGTg5sk4aLzxf6uftGfAuEWjsBNd2bKE4vrFcbyVGgQXH3O6mQaK/57tUMW1W0yYLI0lO0h3wSgsuUNIVAc5dpQAL63nMKjYFc/rf9boHl/z/zvNFmVwOpQyaZtFqd/x4LsA82aZj0bbT1VNbdGZpy3gN/Ay/E1E02HkPrkKIvwm8ZSDnYITQGubH5H5bovct7ei0vvJaUh4s2IgUxEU8NWrogXY7Ri+dbO1H11f6tKZtgnH/H9ET3efVROiECf3puvm9ACqEtrcv6K6O9n2uKqP0KyBDUMM+FopiRBNMh9QhLWwyCLr1VJdFNzyM0LLQ8qQReavmVtTSEdSlxvS2C65A3pMgY5AojrGJFw9kdIDLnKRJTOCYfSXh0n53QJE80Mfw7aZ9lHnlXUzDUAt72ex9orf8htl4EDE6IqTBR9u7s9HdjXJrfveEedOclgzcYXL6/6AVz6ClAEeFyH0+vzJbk5VJ0aO4UC3805UiQpXqOYeMYi02YNYGMDKGjrDISAesm+gxTDiMSD/EALm5mPomqZbngwR16jY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(6666004)(6486002)(2906002)(478600001)(82960400001)(41300700001)(6862004)(8936002)(8676002)(5660300002)(38100700002)(44832011)(316002)(66476007)(66946007)(66556008)(4326008)(6636002)(83380400001)(86362001)(186003)(26005)(6506007)(6512007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZZAMUZTpdsR/pGhZzPC5pw61ThCMrADZR1uNXN/NKaUjLgvutxPwldNDwp?=
 =?iso-8859-1?Q?uGXlFotuvfA7thUNK4yg9393w4lrxfbhjR1b95VnM6drgAzE+L76J9/MHk?=
 =?iso-8859-1?Q?UJHPSbziTB9zny+Dn77jbHitLkvdoEkC4gK/tfDINEUDKUeT3JB6MFRlHN?=
 =?iso-8859-1?Q?PNyYP6LDwCWhLB6FLRTJ8zea91NQO1qdalxb8ucxdHVG1wp6Fh+xqs4A5X?=
 =?iso-8859-1?Q?W9MXsP5oait5oz+nZlzwiq+ljRESkZTSTpFn/E22jt8c72jDC40Zhp5zIV?=
 =?iso-8859-1?Q?Of+d1dJCJJWefEhwm91i7gBM74k/G+Lrfc6YrnI9/oTx4BHi5+c5ugnwhQ?=
 =?iso-8859-1?Q?dpOICwfPw998kMyJwexn3P5N5CJ1XdYKAZuJD5m5g12n+vVLl3sbDsoARs?=
 =?iso-8859-1?Q?6i5TsYk3Gz8XZop6UiXqsj0S/pn9o3EnAxH9td0N6ZFVZKRlkEhlC52rLc?=
 =?iso-8859-1?Q?tjYMRKQwPS4il2agy1YNPU+B1d3VvH6mJIU7wUt558gupzP4VIfqSyrbVq?=
 =?iso-8859-1?Q?kC3jw69b6OTYlYPNbwX7I4x7x5NNF3XVxPwboH6PrA9z1e9R+DMH0nm6iy?=
 =?iso-8859-1?Q?XyQdMcyVRRtLXTXKwfkfX+soZIdZRLdq5BhToWZgwEk9cLRgY4xA742R2K?=
 =?iso-8859-1?Q?oHMSDztFkzL5NSjbNtVJ/6+q5ukI/iUo2Tha8bkRh0ci8mXblX/x7aw+2V?=
 =?iso-8859-1?Q?jL2A+SGZUINxVWDagFKAmjnP3T7Ou2Nw4ZH6r99e4zZbI1LqZRawp/61Ao?=
 =?iso-8859-1?Q?eCzGtUrQ7iX0A2TUwT9ZixZ9H5CyLCOFtbAXIAqrYID3hBxVwka0Iw9xVX?=
 =?iso-8859-1?Q?gc0EcoQ0JvILWp73VpMzOTwV0mR9EzNoA9xjVar7uuBvLfiglzXabd+1Pv?=
 =?iso-8859-1?Q?k+jrfNDSsmjKEBG7o7NQDkkn2LITlvgF8qUUhnL8Ii839IYEK9FELb8FTC?=
 =?iso-8859-1?Q?Dt70VGQZfJdhNczUpA6uYSa1M83LwByitTWd/UFFUDxdqCIP8ccowBNmGt?=
 =?iso-8859-1?Q?wEKnQc+ZEQCsWDoIWKZ6MK12sAnRzuX7M/3cadwurIKlIPm7Z1nI+Wc7yP?=
 =?iso-8859-1?Q?1hUoESiRqScTkRnTzFQ6t2M2dtJi0FHRtdNwm3dBDc49ClubB8y2nBKELy?=
 =?iso-8859-1?Q?B3jzOtOIkqoitA2yqgfm3JuLc6ZIR+L2gZFVUl1U6Mwt2tB5fO8t9QcyT8?=
 =?iso-8859-1?Q?tAxhXX9KlngsfvJn8KquO1dpmBVIx8uChXoL1wN/cy2PMduyitRs51vdHR?=
 =?iso-8859-1?Q?bST4e5pog4ZUCjobar92maNpe6YM8d8cWRkp5j0DUDRPEW5yjnVA0wDGKT?=
 =?iso-8859-1?Q?sWDLGCBFsXGy0+wQP5JopTF+WrjQn+YyUfOnSxAjXNoxlRf2MIXSi8ZZDs?=
 =?iso-8859-1?Q?Omp+TQVPQ2CEMqmQxgJ7OPGBqt199Wvxf7zccL0n5ZtwqyCqmSrDR9236s?=
 =?iso-8859-1?Q?JDINOV0Ommru23P7qOJdzpXNVSKgfOm0vMPESFnjkbWmd6kZettIdG1j9O?=
 =?iso-8859-1?Q?W5wRI8c7fvDg/39yd5IOtk2XuuinfCsMJ77IvcDjUTrgQ/+Afw4ATYnGyu?=
 =?iso-8859-1?Q?nd6vy8Gg1WUrRUv8/agKIjzMwqYKLEZVqLEdNtAQTfUGvrZSfSaisZHttE?=
 =?iso-8859-1?Q?Uqn+zHrcbT+XfwPLtzS4iRczD2n2am/bVcHw7ig3n5BZjFunVf3dHsgg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8607dde1-9944-4cd4-30b2-08db82e7bb54
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 14:53:19.6454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEPAyjej0l3nRCmCrrGg3aYn9jMiEB8+kb83riBRPq8jHMpEynPIBmhssNuWsVN36LajN/nYLx9enoGmiBWlVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7600
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in Page Table Entry (PTE) format
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

On Wed, Jul 12, 2023 at 06:26:40PM +0530, Ravi Kumar Vodapalli wrote:
> Different platforms has different PAT encoding in PTE format, add
> correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
> 
> Bspec: 45101, 71582
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       | 110 +++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_pte.h      |  31 +++++++++
>  drivers/gpu/drm/xe/xe_vm_types.h |   1 +
>  3 files changed, 129 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_pte.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 00855681c0d5..e7f8bd4dd518 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -16,6 +16,7 @@
>  #include "xe_trace.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> +#include "xe_pte.h"
>  
>  struct xe_pt_dir {
>  	struct xe_pt pt;
> @@ -111,19 +112,7 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>  	if (unlikely(vma && xe_vma_is_null(vma)))
>  		pte |= XE_PTE_NULL;
>  
> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> -
> -	switch (cache) {
> -	case XE_CACHE_NONE:
> -		pte |= PPAT_UNCACHED;
> -		break;
> -	case XE_CACHE_WT:
> -		pte |= PPAT_DISPLAY_ELLC;
> -		break;
> -	default:
> -		pte |= PPAT_CACHED;
> -		break;
> -	}
> +	pte = xe_vma_vm(vma)->pte_encode(pte, cache);
>  
>  	if (pt_level == 1)
>  		pte |= XE_PDE_PS_2M;
> @@ -187,6 +176,94 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  	}
>  }
>  
> +static u64 xelp_pte_encode_pat(u8 pat_index)
> +{
> +	u64 pte_pat = 0;
> +
> +	if (pat_index & BIT(0))
> +		pte_pat |= BIT(3);
> +
> +	if (pat_index & BIT(1))
> +		pte_pat |= BIT(4);
> +
> +	if (pat_index & BIT(2))
> +		pte_pat |= BIT(7);
> +
> +	return pte_pat;
> +}
> +
> +static u64 __xelp_pte_encode(u64 pte, enum xe_cache_level cache)
> +{
> +	pte &= ~XELP_PAT_MASK;
> +
> +	switch (cache) {
> +	case XE_CACHE_NONE:
> +		pte |= xelp_pte_encode_pat(XELP_PAT_UNCACHE);
> +		break;
> +	case XE_CACHE_WT:
> +		pte |= xelp_pte_encode_pat(XELP_PAT_WT_CACHE);
> +		break;
> +	case XE_CACHE_WB:
> +		pte |= xelp_pte_encode_pat(XELP_PAT_WB_CACHE);
> +		break;
> +	default:
> +		/* pte |= PPAT_CACHED; */
> +		break;
> +	}
> +
> +	return pte;
> +}
> +
> +static u64 __xehpc_pte_encode(u64 pte, enum xe_cache_level cache)
> +{
> +	pte &= ~XELP_PAT_MASK;
> +
> +	/* Initially assumed as CLOS0.
> +	 * To Do: CLOS1/CLOS2 has to be set depending on requirement
> +	 */
> +	switch (cache) {
> +	case XE_CACHE_NONE:
> +		pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_UNCACHE);
> +		break;
> +	case XE_CACHE_WT:
> +		pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WT_CACHE);
> +		break;
> +	case XE_CACHE_WB:
> +		pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WB_CACHE);
> +		break;
> +	default:
> +		/* pte |= PPAT_CACHED; */
> +		break;
> +	}
> +
> +	return pte;
> +}
> +
> +static u64 __xelpg_pte_encode(u64 pte, enum xe_cache_level cache)
> +{
> +	pte &= ~XELP_PAT_MASK;
> +
> +	/* Initially assumed as Non cohorent mode, correct values
> +	 * has to be set depending on requirement.
> +	 */
> +	switch (cache) {
> +	case XE_CACHE_NONE:
> +		pte |= xelp_pte_encode_pat(XELPG_PAT_UNCACHE);
> +		break;
> +	case XE_CACHE_WT:
> +		pte |= xelp_pte_encode_pat(XELPG_PAT_WT_CACHE);
> +		break;
> +	case XE_CACHE_WB:
> +		pte |= xelp_pte_encode_pat(XELPG_PAT_WB_CACHE);
> +		break;
> +	default:
> +		/* pte |= PPAT_CACHED; */
> +		break;
> +	}
> +
> +	return pte;
> +}
> +
>  /**
>   * xe_pt_create() - Create a page-table.
>   * @vm: The vm to create for.
> @@ -216,6 +293,13 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>  	if (!pt)
>  		return ERR_PTR(-ENOMEM);
>  
> +	if (GRAPHICS_VERx100(vm->xe) >= 1270)
> +		vm->pte_encode = __xelpg_pte_encode;
> +	else if (GRAPHICS_VERx100(vm->xe) >= 1260)
> +		vm->pte_encode = __xehpc_pte_encode;
> +	else
> +		vm->pte_encode = __xelp_pte_encode;
> +
>  	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>  				  ttm_bo_type_kernel,
>  				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> diff --git a/drivers/gpu/drm/xe/xe_pte.h b/drivers/gpu/drm/xe/xe_pte.h
> new file mode 100644
> index 000000000000..8b3b5b471a99
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pte.h

s/xe_pte.h/xe_pte_pat.h

Just my option prefer this.

> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#ifndef _XE_PTE_H_
> +#define _XE_PTE_H_
> +
> +#define XELP_PAT_MASK                  BIT_ULL(7) | BIT_ULL(4) | BIT_ULL(3)
> +#define XELP_PAT_WB_CACHE              0
> +#define XELP_PAT_WC_CACHE              1
> +#define XELP_PAT_WT_CACHE              2
> +#define XELP_PAT_UNCACHE               3
> +
> +#define XEHPC_PAT_CLOS0_UNCACHE        0
> +#define XEHPC_PAT_CLOS0_WC_CACHE       1
> +#define XEHPC_PAT_CLOS0_WT_CACHE       2
> +#define XEHPC_PAT_CLOS0_WB_CACHE       3
> +#define XEHPC_PAT_CLOS1_WT_CACHE       4
> +#define XEHPC_PAT_CLOS1_WB_CACHE       5
> +#define XEHPC_PAT_CLOS2_WT_CACHE       6
> +#define XEHPC_PAT_CLOS2_WB_CACHE       7
> +
> +#define XELPG_PAT_WB_CACHE             0
> +#define XELPG_PAT_WT_CACHE             1
> +#define XELPG_PAT_UNCACHE              2
> +#define XELPG_PAT_1_WAY_WB_CACHE       3
> +#define XELPG_PAT_2_WAY_WB_CACHE       4
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index edb3c99a9c81..9e1b33c17d05 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -312,6 +312,7 @@ struct xe_vm {
>  
>  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>  	bool batch_invalidate_tlb;
> +	u64 (*pte_encode)(u64 pte, enum xe_cache_level cache);

Add kernel doc.

s/pte_encode/pte_pat_encode

Again just my opinion. Let see if anyone else has an opinion on the naming.

Other than these NITs it LGTM. Didn't read to the bspec to check the
actually bit setting, but can do that ahead of the next rev. Speaking of
that, do you have a bspec link so I don't have to search through it?

Matt

>  };
>  
>  /** struct xe_vma_op_map - VMA map operation */
> -- 
> 2.25.1
> 
