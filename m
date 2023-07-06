Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092ACEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 18:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D153210E49F;
	Thu,  6 Jul 2023 18:54:15 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F6410E49C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 18:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688669653; x=1720205653;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zLTlKoGOoTgSe7jnGPoh5frZh3lf52HYo3fQ4+q7TWk=;
 b=kTkLs24/C4KLn2xsfVms5GSgKMufDqtXAy+HwJiClsFMcRf/exhMKf/I
 5F8/3j9k+IYDs9qLPb7suhVkgD+V7CEETfWC8KaG8zKzy0vuCJ6Lt5FRG
 Ve5WJgg2xTylIgstlqMPUK9GH+aNz05LZrwT7uHHP4O/wXOSGnEHeADaN
 uNUN70fMEXr+RWfxdfcb4R031rNM/GOSUL40BudMwrEC69Ol6Q8SGbMXy
 V5a5r7Jp9WCqzB8DMahjhYyCl4Vtn1hTtry2ga8Z3wbtiVHqQfIoWEVbJ
 JZOeACO+2So8LE/6eNVFR5FUgpHxxgXYRLv9L5tQEvAkFptkPMITK93mC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="361168607"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="361168607"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 11:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="722908580"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="722908580"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jul 2023 11:54:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 11:54:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 11:54:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 11:54:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THMp7NVwaX+staeginN7ge6oZo+ydl71748e7olgRKmK4fND0rnfIGfnYwOIh6dCIbNWtqFYxiG6NGY2mEG7mVTk08eeZ25RNsshbPjXglPvFcdMTqfjSoyZtT3W16VPeMT8rD1MLiwWD+azPlZLNIFh2ZAiIZs4OHciNO30wdzniKDpQyOz2QPb5kjg6xG7GiG/bzNhrz8sBAeU/WTtCWZyy4yXr0aWL2rNZLzsiQZGwMPDqcGFEHQ7LF25Ym3emTXMj1FzAtEWr0u14as9QBm5JoWaZXVylxwBBa9x2Ugd6c4RiYWIOtmBikfVohA5dHFwM63wEh7YL8GAw6W+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hoy3pmA6ZHwsLFPycSN1H2NJHSY7sfkdgefH0Ojt+o4=;
 b=BHMP4uZlV4N7D93ZzpCGrmfHOruNN/j7elv0SuKG68+GfJzT8yeJ9VSeF48iHUp/U2uyMdCf02W0Eep62K3Bngd5H23Sn6hLpnAzoLnKHZYdn1fwi+pP0GkiyWyk54F6k8UGoNClSBYMhmSpIRyeAR+s0ozQKotWgLid8w61ZXpBlrIRLxPhvq+lTurURV5IlrsVXsq1CalOxk+SQ4pVc9sGDs9NE3mUp8UJtYNgkO9JIax4DrOKNNRtIomERP5t7rHoTPhgBLNq27pEKBEJszmB00SsuEo4wYsI2XQdM5RS97GX/EFl6hRaDccoifoKovXngg11ymK27VP/91GhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 18:54:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 18:54:07 +0000
Date: Thu, 6 Jul 2023 18:53:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKcNp8H14W/AJKa9@DUT025-TGLU.fm.intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
 <20230706162003.427026-14-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230706162003.427026-14-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: 984d7432-b7cd-4e5e-1f74-08db7e526047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecD86QuD0ngxuTMff4VdyCAosAcTFEMyseRRapA7MDgMhLmu20+DTnD8RD0u7cYGAY8NAHj3oRSPTf53L12Pmgji8MhbBJjBVtM/N5DSf4EVnF6AKLi2/cFjao+sUtdZ+1hmVRiad+oMrP4GV3k0goGJvu0OhZftOATvuOs7/lMYAfTHX4OZXkUlQP4KNoi2uLkn+L0G6ti01MmWYz4UDgfK831nSHw0TOU7k+6ff9JLtXU4AY5QhbT63zEsVGJgUSJLStx2mCnsjHFVUk9HOdgEz77I7zoB+xpZCP2fAjjHjoE3gXQIqkh3+134CYlxbARmixqK6bMXH1w3bdpxV7l7li2PzyM+k3Ovpc3uwPUx0LPjSftW1Ft2WDESxz2dFXX3XnXryaJqpKKdEf634l7eCvHWSmfcJdFD3R7Nx+g9AaxahreX3iwSKG3WmpGu1PLFp220fShhgd7IipXMQFf000lbY16YNY3FqRhH4aCSeFkHzU6AqcPR/bVuUh3JRyo2vuiLw+W5ktiN1/jKm48lABOaoRf3/tWETSk51y3srDZLhswjjO9jX/MKvlS/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199021)(5660300002)(66556008)(8676002)(2906002)(6862004)(8936002)(6506007)(26005)(44832011)(186003)(41300700001)(6666004)(6486002)(82960400001)(66476007)(4326008)(107886003)(66946007)(6636002)(478600001)(6512007)(38100700002)(86362001)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FGi5SHrKnNTO4YhmBV7a7pXtVWkGRDL8/WuAJP1vz4Hx1BCQNXaZwYEolK?=
 =?iso-8859-1?Q?ElViTfkXT3jCM4RE2UkzQATcwnecqJIfUB/QXLxzT6Yv+UlMC/thEaOM1S?=
 =?iso-8859-1?Q?fhxRc10YekMICeRT0mtCjkc6etCk31Os2+HONbXqaowEJFKeweBJ2LkmSz?=
 =?iso-8859-1?Q?x6e2/pdreMgKYQGpK694atpB7feZSa9E5xl4YOf4Vul9PCl2YBPykGFl14?=
 =?iso-8859-1?Q?m5PmEU0cXf+fe2fuJ7qNydiVpXYgBoMHSOUfbOHKuy8v8AysvjmdBeJgpe?=
 =?iso-8859-1?Q?EsE05skmge4lQS4haLDugBCmOA24MGt99ZvH21kyUYMmgf8KZW/f1Iz0IY?=
 =?iso-8859-1?Q?N5lk0c5PkaqxjWvA0qK7FvdYZ5YSd+0i1tGzUJvZLg6K3pFUK63P2egz/e?=
 =?iso-8859-1?Q?ExZ/vmmLFKsng115jQgFI5ydC8U0hHpW6zfoby40P6OhBVeDjMW5yCjWz8?=
 =?iso-8859-1?Q?+F/zb5tQdqpzte9WTJ5DiAoS1QrMsBh8DtCzzA1Fi/hRpajqjtw6889iEA?=
 =?iso-8859-1?Q?sdiRKazqpoBDb7QRR5bUN+nW9atFb2UBpLBsj8ig4zk0hByANylWYo1eo5?=
 =?iso-8859-1?Q?1uDaEj7cxzQkVSlyXvUPzfarA+IrJbuu9FqFEAUxbkyPPCBhE2rGyyhvnF?=
 =?iso-8859-1?Q?3FiFg+/Osh8/pFV3sHwCVS8IMvstOIttAz8SucpTzgRrujpb7gep7l8wfK?=
 =?iso-8859-1?Q?3m+KRlxAW6vKYlDxsOOAR9fmWmDJLnyR0np4YoNMfVtBNfmeZ9H3q+0BYi?=
 =?iso-8859-1?Q?eppgpRdKA0/dhEO2fhVRMDY6zzIchQgd0fqsar1gHML1xlPzMqsU7gXp0n?=
 =?iso-8859-1?Q?k6pwds13rX98vzJA/8qgSKlxf59li0lh1FBr6RA0ZuxjLTi2xrJaD9/xgy?=
 =?iso-8859-1?Q?qsritK56Eyp65tH6tQwUQ+4mFUzh0ZKMfO02Iw/FIlK3/VNWk5D2DvIuMg?=
 =?iso-8859-1?Q?a7ZlIgIHPYYfjp7cz+3lty/4zkwFofNlMXGjBU78aqXbt7OM558M/3hPom?=
 =?iso-8859-1?Q?5H9iebnO/6xldm91bkkbLbAVUV9aIGlYeHEI2ozv9ABoglc9GtZ/M39DWg?=
 =?iso-8859-1?Q?92cF2mFl9ExfjqhIzNzaPdTLfuGf8wOTqk7LLLMgv0H3pQbsUNZOzEjQOl?=
 =?iso-8859-1?Q?piywms2qEQVn/u50lT6m2eVOoeBzwhTf5MN9X0BOtIBhutCA7Z8EAVJA4n?=
 =?iso-8859-1?Q?SXFJ8DQCjro9/8dy/GQYjC1OHODdHJzQeypghUTtV3r04Qv1mDJCfeaKiD?=
 =?iso-8859-1?Q?2t5S7A7i4Dv89wk4pEYKAD7XpZ+5a+bA/mLcGdGlbrzVap8IupJZnhzESR?=
 =?iso-8859-1?Q?8BnX0fENPxQW/+LwrAVzoOB2+vJwcmskQNPeZgOPx3DMXGegFsPP+5n5wS?=
 =?iso-8859-1?Q?HnlquHK9B3PlBcsbgZJ94tGk0dwUSpsSnlNkgM/giufejHgDHbmtG7HPAt?=
 =?iso-8859-1?Q?W/xWlRGG43/DX9rsPivUMvMTLdtEwoewMlReknKOvPspKr1o0ZsaZYquTu?=
 =?iso-8859-1?Q?EnG0wVJOTsCqaZK5A7ZNYs+xAgW25gXwuGnrMn2PS/ywNFHEgov9apmJQH?=
 =?iso-8859-1?Q?IZWzeNMTVpWNSDU4wleGiwmxHv0Wl0p0kL9JHC1eYRL3SLsfr1hLYr3SkY?=
 =?iso-8859-1?Q?2x+IOpWVSgeuLZSWrl/4vaRctLmJWfLDPQHxUjkfOacMCII1oQEKVpHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 984d7432-b7cd-4e5e-1f74-08db7e526047
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 18:54:07.2385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gVaM94xFKC51vUsm76W9ZeMiHPBHM4is3EYZy44S5ZT20hv1KXjXA0ud5jok6pDzdzAW5dP4HOP0+7Eb/xdZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 02/10] drm/xe/tlb: ensure we access
 seqno_recv once
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

On Thu, Jul 06, 2023 at 05:20:06PM +0100, Matthew Auld wrote:
> Ensure we load gt->tlb_invalidation.seqno_recv once, and use that for
> our seqno checking. The gt->tlb_invalidation_seqno_past is a shared
> global variable and can potentially change at any point here.  However
> the checks here need to operate on a stable version of seqno_recv for
> this to make any sense.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 08432f472e2d..c67abc67d9fc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -257,15 +257,15 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  
>  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
>  {
> -	if (seqno - gt->tlb_invalidation.seqno_recv <
> -	    -(TLB_INVALIDATION_SEQNO_MAX / 2))
> +	int seqno_recv = READ_ONCE(gt->tlb_invalidation.seqno_recv);
> +
> +	if (seqno - seqno_recv < -(TLB_INVALIDATION_SEQNO_MAX / 2))
>  		return false;
>  
> -	if (seqno - gt->tlb_invalidation.seqno_recv >
> -	    (TLB_INVALIDATION_SEQNO_MAX / 2))
> +	if (seqno - seqno_recv > (TLB_INVALIDATION_SEQNO_MAX / 2))
>  		return true;
>  
> -	return gt->tlb_invalidation.seqno_recv >= seqno;
> +	return seqno_recv >= seqno;
>  }
>  
>  /**
> @@ -337,7 +337,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	 * wake_up_all() and wait_event_timeout() already have the correct
>  	 * barriers.
>  	 */
> -	gt->tlb_invalidation.seqno_recv = msg[0];
> +	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, msg[0]);
>  	wake_up_all(&guc->ct.wq);
>  
>  	fence = list_first_entry_or_null(&gt->tlb_invalidation.pending_fences,
> -- 
> 2.41.0
> 
