Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C7DEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 18:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CF810E0CA;
	Thu,  6 Jul 2023 18:45:24 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B350810E0CA
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688669122; x=1720205122;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HepRNUxeGwJfPt/TcXf0EaL5B50s74yC2OEW4HjmUH4=;
 b=ZdwhBiCPGf9w1K6460auXWriNnPGksI+JrOd7DuMqDDFOBV/VrZ8t/eO
 nFBd3ojGO2ToeagFyzt3Thmd5+3AIYueM5kHKdMICkHgH2o/rAWz6EOUF
 wky+yqNHE9xAxerig1gPVpMcToXzzDl72sYc9FkcEPbjqEhvUVumRyYJk
 qsu+enKmEY9b8BBwlx5sX/6EcW4A0YNzqiCyBcuTrEcFL79m7HQsoLgep
 C/7xPP+wXl7ZCnqumiwBCEM3RFi1klN2eYP0hYnDzVNpPX31ybywahVBT
 uNXadYN+hhtk3xhAzfWOsZ7lnVlPZ3HD6QpPLyVmeN7f5ZCfivxq3cWOz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="363728302"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="363728302"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 11:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="864214699"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="864214699"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2023 11:45:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 11:45:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 11:45:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 11:45:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3sEDveE4zAiXlZNrXqrdKNDwQGbbZ3frDbkRy3JnctJTMl1ISJtb4Y9s7x75I9cmR3WBNykZB5U1lKclce7X9kcTnvqlhg5aLc2F8H1EdZb6ttIKce9gFBKg5Xw4csYo8BuMs5v7trwMPHe6d4v2FumTG070euzSaqeenbmfzzlPnRPT/nalPeKKzD0uHGEOL1G6yEQN7dM7au6DITEjzMXteXcNAkHkOLDnfVXjIhwumadXV1ZI2R2FuxB3I3yNokcKKP81cVzvT+8V+bSDvGBK9BU2K2M0PiPDaN5z+qeHBW73gllKlm4LGHptkKVVkHlIYZVtJHTVH14EpwHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2OJgoF9fHM5RxBT0h3Cd1IoHiPp2QOsVNcnjf80Tnc=;
 b=P7PBlqzHA33G2z0Z7bYIsGatfQF0mIAQ+JCcK9IG+gH3fyr9PA81iYsJTuX5CIdBNvlQVNTecXx6UeifDGXzAsQmptzA/IykfnVwDC355KJWjhLuBiQIKn/Sg7ulN2/kfnUZ74BOFq1ykHbuQkgS5d54ymdSx8NeohnJmjz4Fb+NWfsrXDqeWkvWD9r9tg7rkoI3yeWOiAZ6BWk85+pirfLO3yMGkmp5KBF5HVS29jPHQyX3T7LhxqQSjLYfGGYvnOgS2okZ7UnzgkExGdK4oeLT9SfdK6eKAgxdttYVVtfmjZVjmniCt5R4CYa937h9EhxHNtPYAle7eFi5KmD7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5806.namprd11.prod.outlook.com (2603:10b6:510:14b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 18:45:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 18:45:19 +0000
Date: Thu, 6 Jul 2023 18:44:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKcLlhk1lgJrsOP6@DUT025-TGLU.fm.intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
 <20230706162003.427026-13-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230706162003.427026-13-matthew.auld@intel.com>
X-ClientProxiedBy: BY5PR17CA0060.namprd17.prod.outlook.com
 (2603:10b6:a03:167::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: d1042f6b-0fc9-4ff7-65b6-08db7e51254c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FQIfYm5ExG/h7ONBYCkRIfXIEEqSIxD/sO0MckMOojQGbKWT4mbeYh03vUbnzBheTWOIR4vRuryovRw1BdrwX+oTF54BNav/MsB/QpqOm+jor0QpSGaRSSLbrUvzr0Pq2CYO09jlSUYoZYl3Rc9I7kJPktg//xPjBBBijuqXoXxbx9LlPny2YHOg3LOTZCnqswByoF8Fee+Uz0+hH8ZV2tXv/JFK3IzSLmPV6Ys3fSzIkiyoRo/UXDUTy890Fjl5QpiTus4uBZPMHMSsNrqjZzdBXAfycUMGF6zSE47+epjhILED9+vQ+f0YqTldOfj8SjxlVQUxXgk02X75N2SVNPZe96iDFZJec98PhoRbmmtc0Zt001/d+JryRcgR5oeNSgH7OVBQ/rB7c+QxO8isnLHs+/97IO5YfpyQ1qlVzwy1Cn/Y453MwA8gYfnEz7hGIcmYw5MDO9ffAWo3GaB8Yf+Ve6wMEcBx3JniOK5ZWPmQG22lkiwOG2fp0JVvyrrFN0zsu/3k+vaLI9voxcitig1T+5/SSwqmSZ51H8BSDeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199021)(6486002)(478600001)(6666004)(26005)(6506007)(186003)(966005)(107886003)(6512007)(2906002)(66946007)(6636002)(66556008)(66476007)(41300700001)(316002)(44832011)(6862004)(8936002)(4326008)(38100700002)(5660300002)(82960400001)(8676002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6G53sP/P15nLDSAUViFIQSYujilTBuUGgreOWymU6ArmrGJSw9jZ3B2T7M?=
 =?iso-8859-1?Q?JTuYPUaXBRr4iKuqrgS73FynsQ8fmt2Kfqd/7DPsSSRV/SD8dRoNsCciqx?=
 =?iso-8859-1?Q?dmhIrQ0lfDgmQn0Z49VPwbNRn6aL8ehONvfelybeHCvwVJ1xJ4NR+J+W9X?=
 =?iso-8859-1?Q?+swmXSDLCh5jm59wLP7e7FssJec5qCDCwEa6BNjBgkTGV0x2Y8OH3i8qaz?=
 =?iso-8859-1?Q?ZpU/rRpuu8M6bgae2UF4Czm/XGlbzORCWjVusXHyvV3YFCk8jOTiCnzrPH?=
 =?iso-8859-1?Q?q0/f7eOH/3WDZ1uYNJNRWS9jM/4Wb+yJ5+Y4vvyWqPkSw62LcY6jyE0Rh+?=
 =?iso-8859-1?Q?86jSHNZ8YfHlFOocnyw7h28ybhmfjVFQ4YxDVHOuLFvKGP6pAPJQ+b25t5?=
 =?iso-8859-1?Q?rzjmArJYyVKMwmpfYxd08umTjoC7Fps0kE4D+8OpLu6KUq4a0okNEOXjhY?=
 =?iso-8859-1?Q?tY7szNQfeRz+3iYqxegaIyvrYbA+oqZZNCIG8+FLHrHFcSvPMbRMh36XTl?=
 =?iso-8859-1?Q?w0hDOA7TUq+J42jtrPsVsC2VczkaCoumlu6h8dZkDsSZFwQQM6Io1lVRSs?=
 =?iso-8859-1?Q?w+alQcIWgsrpT6Ib01ZYodDy2uoUBGTBzpOFtJ2B9BlYw/WVKaMZuVnsdP?=
 =?iso-8859-1?Q?k/HdoBU3QbgnmM8HaboONtzXuCaOUQw+D7SsYWmKjQ8TGfTR1vOllVUzIV?=
 =?iso-8859-1?Q?hN8YDlSBA9u12TWQmyE/Q0z+WMmBkymbu+3IEMIcPZ9Jv/UrSsYjLcupkh?=
 =?iso-8859-1?Q?2//UnB/LT555dmeLO+pCQ//dVaipXBWEb62LO1YGYKaBJwYtHYbwkrmaNU?=
 =?iso-8859-1?Q?qd0zzk7NzrpR1U0uTFBWZacuLjFFxzoBA3EFojHw7/Frpn4kCdwiifRpjB?=
 =?iso-8859-1?Q?0QQMtt31WyjmP0hmh1gT7EGG1qOPhDT18C5DS3eFvbYYi03vv5niK3WSTH?=
 =?iso-8859-1?Q?WQiGX7qxlVsoN41DOUeJ1nzYfnJgha3H/1TStfnEPxwRU+RYf9boZgvsD7?=
 =?iso-8859-1?Q?LV/ipEDHrbHO0NsrRtQFRqSzLlPDtligmm1oh17riNfuRnufZ6ZsIy4TmL?=
 =?iso-8859-1?Q?uVAXQ5Igfz6ajJ+4/ZIexqu0Lo9IYrGYmjwO7TInt7pBWGfGaUqwkSXZoE?=
 =?iso-8859-1?Q?3kI/LTY8Fw06JCCDUO0RGQb9QOXm+nf36DHQIljQ+5o08HXwIGStpau8rc?=
 =?iso-8859-1?Q?Kx7F4H8u85pi1WY+L537lwJXqC88tgVKuj8SDgwEVj9lU00HGDvc9LrHsM?=
 =?iso-8859-1?Q?QOGnQpdKmg0ydG+LWemC5ovlXU0yVn8vUGzQPGL0T1Wa5zUJBCKdPt3GRk?=
 =?iso-8859-1?Q?9/MKmDZhTDSdy9SC/wlH7Z9SeAvO5hKcHT1RaIWKcWPjUIAHBPWbyHSCk2?=
 =?iso-8859-1?Q?vIyJZCobKnbq9ProRiJ8Lw67Y36NDMr2Jj+n7HoFjxoSFZncutk78Fk00H?=
 =?iso-8859-1?Q?zqLS4L8913UY2fBWvXszS2POr8lmmbV4bfzlNgRhCZ3aVChLzKn2l0Hu/f?=
 =?iso-8859-1?Q?TIJBejShsqg4ZS6sQOSRJLrdz4vNpV9r1QhVQ8VFV/MhXy4bf2yKq6xipI?=
 =?iso-8859-1?Q?QiqweEfiuts05hFrMbPb7x1brFi1Eo4vpDlETRSpcq/SKGZUYYL3rLWLzc?=
 =?iso-8859-1?Q?qbK2TRVnV8c3EcCZ8hqxKdivqEvZ3rzsgV/u9tkcUO3NkfT75PtS+kLw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1042f6b-0fc9-4ff7-65b6-08db7e51254c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 18:45:18.8028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4C7UAeJLfZ83HJOUWyJAg1N9jxHJZ3mjp6u1WwMqRaz1bvERiGuLBHtgyFA21UPCQLTRCyZR20eeU1B/+O2jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5806
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 01/10] drm/xe/tlb: drop unnecessary
 smp_wmb()
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

On Thu, Jul 06, 2023 at 05:20:05PM +0100, Matthew Auld wrote:
> wake_up_all() and wait_event_timeout() already have the correct barriers
> as per https://www.kernel.org/doc/Documentation/memory-barriers.txt.
> This should ensure that the seqno_recv write can't be re-ordered wrt to
> the actual wake_up_all() i.e we get woken up but there is no write.  The
> reader side with wait_event_timeout() also has the correct barriers.
> With that drop the hand rolled smp_wmb(), which is anyway missing some
> kind of matching barrier on the reader side.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 2fcb477604e2..08432f472e2d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -333,8 +333,11 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  			expected_seqno, msg[0]);
>  	}
>  
> +	/*
> +	 * wake_up_all() and wait_event_timeout() already have the correct
> +	 * barriers.
> +	 */
>  	gt->tlb_invalidation.seqno_recv = msg[0];
> -	smp_wmb();
>  	wake_up_all(&guc->ct.wq);
>  
>  	fence = list_first_entry_or_null(&gt->tlb_invalidation.pending_fences,
> -- 
> 2.41.0
> 
