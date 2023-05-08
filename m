Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90B2C77B7C
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 00:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5020510E04E;
	Mon,  8 May 2023 00:53:39 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD40210E04E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 00:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683507217; x=1715043217;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x1KpnXT5cDI8+nnk6xnS+q+yp/tp3Bv4BOGXHJD9MqM=;
 b=BiUUryPJ7v1dcmHxwd28aX2jogf9BKJNUMaD/N54kaquPBU7z9VMPlRO
 J0/jQU+y08QLLg1882/2g+dQXtf7o88I17CjlgGKC6b7ky2cbiVFBOzlJ
 mjrP3UhXcmsF43E73pTPFaYz2AMc1AgXgVHDpHoQ/pjws0kWqojPd7g5q
 sbE8wbNTDliIl8PBFRZ4YIQD9lKmOS/oLBlk8ZzaWkOpTMubyWfoOc132
 sTwx6H8MWyS4wV9KbB81eWKwh5pnoUnZbfKPZgMfzFumJpBjidETCIKi5
 KXURG5RcnTcQBDey31f/TC4uBRc9eahO2nfj+bvB8d2oKvM9CJPzR2P4I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="338749892"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="338749892"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 17:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="1028226004"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="1028226004"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 07 May 2023 17:53:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 17:53:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 17:53:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 7 May 2023 17:53:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 7 May 2023 17:53:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRQ6CoeOGDEgMVcgUqTtKY1Uv0IiDGl5hkppnOjoF3ybn053WAVEWkV8T0LyYSuANpKe0xp0LGrNTTWmP35ntcn/IUHuz7Pe5M5AG9yZ6UrYe6HWhZfTOsMVnI5gUpJfeqj9YYzIYqxhMCdMYekYQLdgeKRPt25DvwDiF8cOFO1SzP0KXfwtokbImQ24VWoy3LRNeDz0W9ZeO8u3KzQ6rXA6PKq6o/zZCNbAGyjeB0ycTXbsxutxN5wSC3eVbSgcfJLV/Mdy3bW/8+kCupwDxj9mHl57qQBnkJ54T2xMZ+t+IwT1qETN8wiQY5nHRGC3O2E6XF6scc3n0i4y9aoukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmWtdbPYfLQb0tSySJELw3UFC80fnXbyfz/WQYxRM6g=;
 b=egf0nxHP6GNbNKBtaFylvKVXQl/UFPvIbpGSFRlcC3uHYSktpLO7fnw2ixUeZS5q+YGiwfNZEKQc+7jT8Sa+Dk5Y3pGUvRrdzIByjDTjgpi1zfOFY8XtRzceRH7RhmdJnXMQlgeqjWBUOH94svTppT7eqDPHQGVunAOo6uGcmjzIQBfNs3lzAOYGtRciu2pJIsJqbJe+S1UV1UtmL5q+2+hR8O/xMPuMz5KdFckvTMzqlaheoXQZOqLphLM7c1AW8ZTxrI6ufQTgnc0vUYs+tm9ke3yEuKv9n5/m8ovfAhcYeO40B/RgYptCa4qMQeAONzE0yrpIdblkpwiEeRjR4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7858.namprd11.prod.outlook.com (2603:10b6:8:da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.30; Mon, 8 May
 2023 00:53:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 00:53:30 +0000
Date: Mon, 8 May 2023 00:53:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZFhH7tppkQlfgZ9t@DUT025-TGLU.fm.intel.com>
References: <20230505144910.317943-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230505144910.317943-1-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:a03:331::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: f59d82a5-5c6d-41ed-540f-08db4f5ea41e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ByjnxjkxR6hRj9WiXe85V5YLonhwFw0UxMCH4zHofspPeURouQd1ANVpCEy5SPC6dAt8p4MStjlePScNqeejJ6eCh41Qn5PcuL0KP+VMIg7qIOUz0p4Kc5DHS5hQ2gdJDhz+NqJi3HCbQA2+6QO5oUp0BMjrFj1NcNdYRd7z1rMq4R/Qky7fpOgW12pQjnwu3sopf6zT9oXymhWVmXG3y6uxewM3huG+A6cKLTbr49eoR5jnSDNTT7zGo15dDO/5WE6+291weQymY0MIsvchCMnbJYvsY2sGqX6U4k8WG9r0uT1I2DfClg4MwhZdnpU1myK5AOen6UhvJzWSQE4RE/kYmqjbT+UbO+SerNTu0qv8PsJK7UM2JCAORmDT3q93cQXpLIyNpeagKu0EpJzKCmPff5uzgLWlOB/nZnHvfY/PAeobG/QSRYlty+ma/RNlJCHgHs0rapL80YDcvrhwWtyImAeuA3kufBL6CL9iuaGnGDWZAwDb5404dXfNPjieKfrFxZD8jqzlQ6AHNmmqGvEE8DgoXkksC2V7/et2c3kFFbGOCdIqws/aE693DO3c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199021)(66946007)(66556008)(66476007)(6636002)(4326008)(478600001)(6486002)(316002)(86362001)(83380400001)(6506007)(26005)(6512007)(6666004)(8936002)(5660300002)(8676002)(6862004)(44832011)(41300700001)(2906002)(82960400001)(38100700002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?js54ULmqmPq8qXMTMIi55y7QzCdTfxAutcsagx4SaKmXwIVAzy1GxM9OXm?=
 =?iso-8859-1?Q?1RjMc1bfQFbp3j63QlaiyBTgyZJH7trBDOFvNe2mzU98rpZ3Ubm0hPSygS?=
 =?iso-8859-1?Q?Sls88EUzRSDSKhOqRwIkN3VJeQ929ivSUXwMYIT0XIYrbrZjZuMF+sgvAh?=
 =?iso-8859-1?Q?5lQICBBkwqnd4QBrVVzVit8W9mzg918QhGQEGWZJolSY/AHoNs9f9UGrWG?=
 =?iso-8859-1?Q?rErOaUxPv4zlKEumpdltwhGAFXGJlaeMSl68Ekp4YirhHGIKuRGDi97ZF0?=
 =?iso-8859-1?Q?eoT7JNsRjxn4y+G5lQ16+qWCylmBemsqUMaJs5sdZTODfR1l+/HL+lbjPF?=
 =?iso-8859-1?Q?BSDPQBm3EkdQzC88H9hth0gMG2TgJKeS/59egI8YmN8NM3ytMK57Xuxad3?=
 =?iso-8859-1?Q?SOTkOxFS5Q7+MtHm2L06IS7YqAzB9aAfgbc+5i9ev++MqP6sXIm+er7Ruw?=
 =?iso-8859-1?Q?hHWzmZsO4g18f8h1jdXCaetS6G3IDJTTfnAoHDZQ6rW2aiFbX9K2gy9WIW?=
 =?iso-8859-1?Q?A6PsLOCpSQDDSLopEeWpSOYSC/h3uPhrSHSHsVTwlODY9rbaVL2ZTMsY9G?=
 =?iso-8859-1?Q?W0u7EJyqzQ1UJMFnoxlN1KQU3r66J+CqpZhtms/qVzk4+yWQtvNByC69Zo?=
 =?iso-8859-1?Q?MMZx+woT5MFBkeC+Cg6u0wrH/ikAq1ddUak9IyLAaudGtJ6UTTrT+VEs02?=
 =?iso-8859-1?Q?ZY0YIL2ishrkIsKpDkYoVBNHLbAY0V8vrPkGlbPqp1vS/U1okdvkstsD0R?=
 =?iso-8859-1?Q?RkwM2EATSFDZzXNp0FkDKH7SND3cLyGrdGfyAdlqC1fBMAaSfZpE9L+CRR?=
 =?iso-8859-1?Q?9hL8ceUL4gSN/X09wHl0cgACwf+LcqyP0jPo7lGEGztL8dqm4GskYTdc5y?=
 =?iso-8859-1?Q?FuCtALQwM+yz5ZcEBg6+kIXfF+r2Yno1lHryhjLjCURtebL7WDygKe+cmy?=
 =?iso-8859-1?Q?ZDWnbre0NObL4jXGL1CmGK6zJYfwyfVZSDYsCpHQB3R34le1zo2q8uBy7G?=
 =?iso-8859-1?Q?OyNpOMjBDNo7vpXyZLDsHJWvlcEiugsx0HvyxtT3E5NNIPz4Pu781diSXd?=
 =?iso-8859-1?Q?6NeVyuPkuqUdb7MZZjlB3Vfm2VH7GqkKaMlsKhvLlHmiIo8WxC+YjtGxhK?=
 =?iso-8859-1?Q?PbvyTTke21RPVQbE7ca4ZjVvklmRfm8VR8S9Y6hnDgNNH19hrtgQbH/eOv?=
 =?iso-8859-1?Q?87CauGcf6DvT6fQgfpqRC6cGNEG8XzHV0HRl8gtzdnilgnsITogqWd9Odn?=
 =?iso-8859-1?Q?4SFufBCoT5h0gsL62uhLeWRmlMopfDSOFz908Qjtdaz/8XIS99gvKH5Wbk?=
 =?iso-8859-1?Q?C73Y3kq/qPlAkW9eqTa6EW9IofZV18twLtCiUk9odGD9nrrzROKZwOtO8b?=
 =?iso-8859-1?Q?m5f5/IO1PJh0C+42GCtxHYNDuv13+kQdEZQ7WPYX0EBSUZaebQoLDMox2m?=
 =?iso-8859-1?Q?S4GpidWjCo5xeHR3Tiu4zLxM5fhrpf70l8WFEVqxM3Qnjl/EaFAgHX9gjF?=
 =?iso-8859-1?Q?SaNMdXxsDsuqh9xa0ygztKQns5R9k6XksW3zX09ZDti0rwLsAI/ogE19yG?=
 =?iso-8859-1?Q?qyJnKl2Bkn9cUfp027ulkd1LIfD7T65g19MxqFEMa1VzoLYTL7JpemdqeC?=
 =?iso-8859-1?Q?0NLApu8fIE9osbG2Itiz7ZXEap7xib1wid?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f59d82a5-5c6d-41ed-540f-08db4f5ea41e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 00:53:30.4327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfVjeFEihr8VMyYkmxQLOR4mPL4UqWHyYfMU+/TsZsUi6CvmJ6DYq5bG2YudCuLupewQLrSsZtTspeCLGqfzBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7858
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix tlb_invalidation_seqno_past()
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

On Fri, May 05, 2023 at 03:49:10PM +0100, Matthew Auld wrote:
> Checking seqno_recv >= seqno looks like it will incorrectly report true
> when the seqno has wrapped (not unlikely given
> TLB_INVALIDATION_SEQNO_MAX). Calling xe_gt_tlb_invalidation_wait() might
> then return before the flush has been completed by the GuC.
> 
> Fix this by treating a large negative delta as an indication that the
> seqno has wrapped around. Similar to how we treat a large positive delta
> as an indication that the seqno_recv must have wrapped around, but in
> that case the seqno has likely also signalled.
> 
> It looks like we could also potentially make the seqno use the full
> 32bits as supported by the GuC.

Yea we def could use more of the space but in the end we have the seqno
wrap issue. I think I set this to a low value to prove the wrapping
protection worked (it didn't) by triigering wraps more often than the
wrapping 32 bits.

With, this patch LGTM.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 604f189dbd70..67822b3dd353 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -251,14 +251,15 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  
>  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
>  {
> -	if (gt->tlb_invalidation.seqno_recv >= seqno)
> -		return true;
> +	if (seqno - gt->tlb_invalidation.seqno_recv <
> +	    -(TLB_INVALIDATION_SEQNO_MAX / 2))
> +		return false;
>  
>  	if (seqno - gt->tlb_invalidation.seqno_recv >
>  	    (TLB_INVALIDATION_SEQNO_MAX / 2))
>  		return true;
>  
> -	return false;
> +	return gt->tlb_invalidation.seqno_recv >= seqno;
>  }
>  
>  /**
> -- 
> 2.40.0
> 
