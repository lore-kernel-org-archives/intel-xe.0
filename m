Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED66C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 20:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD0910E025;
	Thu, 13 Jul 2023 20:10:40 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F90710E025
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 20:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689279038; x=1720815038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aSWqprbt/eimsZXvl1oNYlPmz4zt7xfedBmhZgZgB00=;
 b=iowpZNenKxpQsL+MlF49CN7+Ex17oWfG6nMJkthomuAlVGmjAz/gEZi/
 dDZGnRotBliuDrltZxENSRsnmMpAxE84Gk19zhxF26etP3d7LWMRrb8zG
 ElaGNNL9eUqtjLUTDVmlNykWI0UUNKN2ucqub4An7OfZIyCK6x1DiPAyh
 RpK+2jbHI68Cgi3Ak46cXkw3NOe2dADguNrQM89aPyAPVpMiqcuGglbjG
 DC3WxlD3T2fp0BU2htVGe3y1vzz4sh0nP/yBf9knQRqWWhnInKXMboeI8
 92kre9Ipt8UBgxuWFvUiBFMxLm8rXdnoEx2CVgPzQZkCtRgTk5UKaxM+k A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364178937"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="364178937"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 13:10:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="757308637"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="757308637"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 13 Jul 2023 13:10:26 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:10:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 13:10:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 13:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1FiJlQk5WaPeh7MtgLFkSyuPhjIzfmabjg4y9BcrkiU7qjJLVpl9eP/ef8U5RpoX8V3jcBg04co+JPQ4Lc+/sl3pUxrx4C8sI+cO1ddaifwtEZQrHYsPVKVVfJcOLL0RhwA28kP6YJGK2+fxyZdYtc1etH/AHWgZ1pU1AWQPE4b3YbrQKPmJzmFYutE1N9M5dK+KSjzjBwiEQ+EyhzgtIehUNaY7kgvZxqCBlbC5rBCFjKjH/8kr0CVPSGOF6VSw52DrRn06WW34Lkh8UnOO19a2fBX4f3TwYe6O9xkFCggKVYyiaYLdJrUWF11MxIgBDHIjYWTyY0uYZJjEkitqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8GXWrC/ufidwcxK9pb2bdf7QiUbaj2Qrq6o18/hyF8=;
 b=QLs1Smu4SnEeLB1UXeebni8koGhHXsNAafPJUQyFfiBgKoypLSpuz524PguiYP8JKeAnSb5s4y7Wpesfp3hXSzGpr3W9jVu1SihSnVGbFe2cvMz008tUzeGqwklUPCfYZpTIMX2hleeENUH13ckLOAjqqVzrdy4tydjFGPsVtlBXMdPrNFe6t/c2m/Qt3InJrP60hdFlRsrBr2XecZRx0TREI4g4UD675SGUVXPEqyTihUlnqYJbuNE4wOWLOww9sGo4jmd5V4jqeEpRzIkb13SX6LxwqTZC4ceJMMXZIu41KCOsESGD3j0akdmqxvcp+P3XOMR4W7xitkJjkFTxCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Thu, 13 Jul
 2023 20:10:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Thu, 13 Jul 2023
 20:10:23 +0000
Date: Thu, 13 Jul 2023 16:10:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLBaK5U7F+fTCXTV@intel.com>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230711212748.2029455-2-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: 6743e4d9-1a0a-4402-366d-08db83dd3056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dx7qgQBRjdobUvN1cBzXESyCsv8d4jCySof0nZiW2YifvZGGzkVckzvI7WQeZEYpzFkxdzkNXNl0vP4jWGLipyetM/4ciB6WCEUUviqj8jM+J+ggIYMzJfHCpTpLA76hkeur4oThCLTNRREeGpuI76gLyXJciDGGkBg40WEqWDg5+2APYp/Vwp2tmSEcTd77N7gZTERgMRNNqrE/RebvCaVXzoTqI0WTRxMWHgLYFCm4ihlVCG8qJyriozZSnfhkwBhmgOD8XDKZWtHfxAHSodgM4nxsmJE3ESdCW5eP+K+G7uUhBiw313HgZMbloohtBLXyr+Ir+x1uKmP9PGjP5QIOydC48WOdYXInYXw+O9Ks8CNsTYpWT4EPhzMrEv7x6z0QfCIecINApcY09iTasaqPlFHrn5aLI3MwENnU9JryoT0vUro/3fBT6GoU2CprTbTjBG2/a90ac/+0zWMBaK2h/O/wBE8yMH57ldlNS6FouUeDpvTCwAeaMZuBZL61FvTJXXC83/tHbO24hst/RHTlVIzjshqE1HJcPnpZT3dwYBGOIb6GeubdmbmKqXIK7DsIH6Dck/hBqeZ06oquacBjU9W/DQVJclMBrMnFHaW84oA9ozxwRswQqzONHfINc4Z4Orso+rKxroxZa5iUn+RvqmLYqtXcQwLsFs3VoRI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199021)(6666004)(37006003)(6486002)(478600001)(6506007)(186003)(66946007)(6512007)(2906002)(8676002)(8936002)(316002)(66476007)(5660300002)(4326008)(44832011)(41300700001)(82960400001)(6862004)(38100700002)(66556008)(26005)(6636002)(86362001)(83380400001)(36756003)(2616005)(21314003)(67856001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mNcJ+6XpZwisQ/kNVPapwFVLU8qpzi8RFOiRfo30pRb8dBcMi3Bt4n1+QcU5?=
 =?us-ascii?Q?EDkJWp5CExj6YhqUbI+9tUtOuEGiNWleVqXBoMJect6Sd3vECSsb0XEMkd65?=
 =?us-ascii?Q?+vuTspWqxwxW1/+9plBmXBiYY5Xj/TaYI7+SJhdqWC/d5wFoO8SktYLs3wV4?=
 =?us-ascii?Q?qLW9pYGsvb3Vv5s23duG+hHpTMw1zK7q2pjwauWQiE63nfQGv3GhpwKuezZs?=
 =?us-ascii?Q?1AgKKoJsBms6qy4H0qBbt1+HPtvC9HforcWtpcfmlJVNUP1oF+dZJNvga3jE?=
 =?us-ascii?Q?jqAyBXgA8WS0z5U09bTI2cxl4d29VcqshPcOGRuB9U63vEyCTAcP8ETLZSi6?=
 =?us-ascii?Q?a4/gIyEzhevqk17ZO7YOGSJ4NRG0UPVoeF/KomAcXDqYvE4sch7y2PxcA+Si?=
 =?us-ascii?Q?SCW5II7of/46GXIn98a+lYRkIw2Of6wVhA17uiyQSw6aBSUGf+3rQD+uNvd3?=
 =?us-ascii?Q?CQAPEQiGOQf2EiPNwlg4pCJ4baTyLat1fYalb3TVq3kWKtlQfor57BHd+Aqg?=
 =?us-ascii?Q?0Ym9oH6M00iEjCzdVBMQZqSDiL+Bce7wWnsaZVOFDWqtxN+1domV+UzkqmRn?=
 =?us-ascii?Q?blOUI+i3r716bOQr6ONpVgEBu93ha+C76ozVXej4BAcXJL3YAXGvZMHz4eYR?=
 =?us-ascii?Q?ODFM9gWd0gmfLLDqwgKK7RrrdjCQ7Az2aRr46hXvBL1uFvj3aEatoeOe0kOZ?=
 =?us-ascii?Q?i0lAsOmiKBksX/UaaoaD2qk9TjsK1ItMwgwFjDrJrl/0rWRAwWyOWGxACOrl?=
 =?us-ascii?Q?8MA0bFCEuMMo/q3a/KyhGJKg7tL3pSsrfEOiWBbsNVvhjEIutOJ/1zpWE8yL?=
 =?us-ascii?Q?nhoq0D3Xi/MZjYngSRV8jGjchdvqWGS1Ux729GaYBVYWaeBuo+KGHK7kUjLM?=
 =?us-ascii?Q?6G0a3wQbsWjFhpLwLfuRRgsd+IFG6Uxp0Q9D8tyulTq4mGc6mlckzN7RunBh?=
 =?us-ascii?Q?EjvQBuPXL9TLLRjwsyduAxpGzy/Ss9vAGiQKK8T0Z33TQp8l0Y0+XGNa9bjk?=
 =?us-ascii?Q?rSCWNhZ0ERnfVEV8hXDym21mt/wud3HPUonoo6BhAnsCM2rIj6i5HiFBmjZ5?=
 =?us-ascii?Q?7iunNJxpGGC60B3UrdD/bnyrXIEuyAJ5nCgK3JITeJX4HAkufhKs2lsQuRV9?=
 =?us-ascii?Q?SFremMQl9tNjaWHQftbMcbQboQCH4VL0zMtnhYPL45nZ9sw9YMnxnNXQM97q?=
 =?us-ascii?Q?EFDLQwQEVpiJzZMTIK6ABvbYsjwW8kcS4X0F/+K+X2vnDRb+HDciNJI487zw?=
 =?us-ascii?Q?5GaoWuURJPqvkaVbQfs955Gy86W9ND4MgFUeCkAp4RLMAiQnJLP7OsoPoeMj?=
 =?us-ascii?Q?UnKZSYaQerYdwNMnfr507gfYPQ3RW72aezJZTLt3uw7bVs9QxJ2WcU5F6MRr?=
 =?us-ascii?Q?nn4lE1aLdTSXbiq2bBAtBXel4PLfDZ3nLtIehi1qb8GmXoVgGkjjw7EeEDb8?=
 =?us-ascii?Q?XE+Qan3zs6IJklQqC3LfRjCgNyaYxg3RnqsgOekMkkqmnhiH3G5plpaqC97J?=
 =?us-ascii?Q?N+y6z0Y16gLwNnqjpucZ4VLEgdJiHPxmjvoahI0vgQluS3/0i3v3PA8NP8XK?=
 =?us-ascii?Q?LwzPsxjYydAIOU27SsgvKV4sF1eZoRuCMxpw7Ofw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6743e4d9-1a0a-4402-366d-08db83dd3056
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 20:10:22.9032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1A3fW4ZMBHiR6eJY0EISZhfYFEgiRqaWBZ+FYI7RUuPMQ2Jw3WYd2S4vm4xBDOVRki/rcv4yIbDEQvAlfKmstg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Avoid doing rebinds
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

On Tue, Jul 11, 2023 at 02:27:44PM -0700, Matthew Brost wrote:
> If we dont change page sizes we can avoid doing rebinds rather just do a
> partial unbind. The algorithm to determine its page size is greedy as we
> assume all pages in the removed VMA are the largest page used in the
> VMA.
> 
> v2: Don't exceed 100 lines
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       |  1 +
>  drivers/gpu/drm/xe/xe_vm.c       | 72 +++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm_types.h | 17 ++++----
>  3 files changed, 65 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 00855681c0d5..a8d96cbd53e3 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -668,6 +668,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (!is_null)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
> +		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
>  		*action = ACTION_CONTINUE;
>  
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6c216350084b..5f4f6dab270a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2385,6 +2385,16 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  	return vma;
>  }
>  
> +static u64 xe_vma_max_pte_size(struct xe_vma *vma)
> +{
> +	if (vma->gpuva.flags & XE_VMA_PTE_1G)
> +		return SZ_1G;
> +	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
> +		return SZ_2M;
> +
> +	return SZ_4K;
> +}
> +
>  /*
>   * Parse operations list and create any resources needed for the operations
>   * prior to fully committing to the operations. This setup can fail.
> @@ -2461,6 +2471,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  				break;
>  			}
>  			case DRM_GPUVA_OP_REMAP:
> +			{
> +				struct xe_vma *old =
> +					gpuva_to_vma(op->base.remap.unmap->va);
> +
> +				op->remap.start = xe_vma_start(old);
> +				op->remap.range = xe_vma_size(old);
> +
>  				if (op->base.remap.prev) {
>  					struct xe_vma *vma;
>  					bool read_only =
> @@ -2479,6 +2496,20 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  					}
>  
>  					op->remap.prev = vma;
> +
> +					/*
> +					 * XXX: Userptr creates a new SG mapping
> +					 * so we must also rebind.
> +					 */

should we have an upper layer if condition with the userptr?

do we have a way around this new SG mapping? I mean, we should probably avoid
the 'XXX' there since we have no way around, or replace by a TODO if we have...

> +					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> +						IS_ALIGNED(xe_vma_end(vma),
> +							   xe_vma_max_pte_size(old));
> +					if (op->remap.skip_prev) {
> +						op->remap.range -=
> +							xe_vma_end(vma) -
> +							xe_vma_start(old);
> +						op->remap.start = xe_vma_end(vma);
> +					}
>  				}
>  
>  				if (op->base.remap.next) {
> @@ -2500,20 +2531,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  					}
>  
>  					op->remap.next = vma;
> +					op->remap.skip_next = !xe_vma_is_userptr(old) &&

userptr if condition consideration here as well... and also probably good to have
a comment here too...

> +						IS_ALIGNED(xe_vma_start(vma),
> +							   xe_vma_max_pte_size(old));
> +					if (op->remap.skip_next)
> +						op->remap.range -=
> +							xe_vma_end(old) -
> +							xe_vma_start(vma);
>  				}
> -
> -				/* XXX: Support no doing remaps */
> -				op->remap.start =
> -					xe_vma_start(gpuva_to_vma(op->base.remap.unmap->va));
> -				op->remap.range =
> -					xe_vma_size(gpuva_to_vma(op->base.remap.unmap->va));
>  				break;
> +			}
>  			case DRM_GPUVA_OP_UNMAP:
> -				op->unmap.start =
> -					xe_vma_start(gpuva_to_vma(op->base.unmap.va));
> -				op->unmap.range =
> -					xe_vma_size(gpuva_to_vma(op->base.unmap.va));
> -				break;
>  			case DRM_GPUVA_OP_PREFETCH:
>  				/* Nothing to do */
>  				break;
> @@ -2555,10 +2583,23 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  	case DRM_GPUVA_OP_REMAP:
>  		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
>  				 true);
> -		if (op->remap.prev)
> +
> +		if (op->remap.prev) {
>  			err |= xe_vm_insert_vma(vm, op->remap.prev);
> -		if (op->remap.next)
> +			if (!err && op->remap.skip_prev)
> +				op->remap.prev = NULL;
> +		}
> +		if (op->remap.next) {
>  			err |= xe_vm_insert_vma(vm, op->remap.next);
> +			if (!err && op->remap.skip_next)
> +				op->remap.next = NULL;
> +		}
> +
> +		/* Adjust for partial unbind after removin VMA from VM */
> +		if (!err) {
> +			op->base.remap.unmap->va->va.addr = op->remap.start;
> +			op->base.remap.unmap->va->va.range = op->remap.range;
> +		}
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> @@ -2628,9 +2669,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  		bool next = !!op->remap.next;
>  
>  		if (!op->remap.unmap_done) {
> -			vm->async_ops.munmap_rebind_inflight = true;
> -			if (prev || next)
> +			if (prev || next) {
> +				vm->async_ops.munmap_rebind_inflight = true;
>  				vma->gpuva.flags |= XE_VMA_FIRST_REBIND;
> +			}
>  			err = xe_vm_unbind(vm, vma, op->engine, op->syncs,
>  					   op->num_syncs,
>  					   !prev && !next ? op->fence : NULL,
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index edb3c99a9c81..f17dc5d7370e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -29,6 +29,9 @@ struct xe_vm;
>  #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
>  #define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
>  #define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
> +#define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
> +#define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
> +#define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
>  
>  struct xe_vma {
>  	/** @gpuva: Base GPUVA object */
> @@ -326,14 +329,6 @@ struct xe_vma_op_map {
>  	bool is_null;
>  };
>  
> -/** struct xe_vma_op_unmap - VMA unmap operation */
> -struct xe_vma_op_unmap {
> -	/** @start: start of the VMA unmap */
> -	u64 start;
> -	/** @range: range of the VMA unmap */
> -	u64 range;
> -};
> -
>  /** struct xe_vma_op_remap - VMA remap operation */
>  struct xe_vma_op_remap {
>  	/** @prev: VMA preceding part of a split mapping */
> @@ -344,6 +339,10 @@ struct xe_vma_op_remap {
>  	u64 start;
>  	/** @range: range of the VMA unmap */
>  	u64 range;
> +	/** @skip_prev: skip prev rebind */
> +	bool skip_prev;
> +	/** @skip_next: skip next rebind */
> +	bool skip_next;
>  	/** @unmap_done: unmap operation in done */
>  	bool unmap_done;
>  };
> @@ -401,8 +400,6 @@ struct xe_vma_op {
>  	union {
>  		/** @map: VMA map operation specific data */
>  		struct xe_vma_op_map map;
> -		/** @unmap: VMA unmap operation specific data */
> -		struct xe_vma_op_unmap unmap;
>  		/** @remap: VMA remap operation specific data */
>  		struct xe_vma_op_remap remap;
>  		/** @prefetch: VMA prefetch operation specific data */
> -- 
> 2.34.1
> 
