Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17836EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 04:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E2910E3E0;
	Thu,  6 Jul 2023 04:14:58 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0982F10E3E0
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 04:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688616895; x=1720152895;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xiHwanapYkfSNVfxO9vvKTrDyAXwp7ReEFRWvdWzslI=;
 b=kIWtK7PWOiKXtlz3bfPZ0WYQbRbR9o42qczhh2DZvsL+j307Ak3PXMEO
 FRpA/IQqS1w9Has+JI8AawB+rpubxpnHP+GfpACewoIn7FHQ+GwFwyAZl
 9ik3JmtnVfjOo2KaJkl98aVw8SVrQQX7dmebH4xlwCz/6Mx0JvPKnP6MT
 2MMhl09fMI5nech/wT/ING+WtetaA7IhIWttywhULv5OBFyfZaXJ0+HPy
 S0/SOFEyvs1HsvduWJzkPqLXbYQyuTRNMJ00aLE92CURAsjkroZp0Dk3L
 B5RkWGb6zWYNwX/UveMVXF6UIThH+ECmBFY2/1+l6sRQ8QiCAKd2P8vsY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="394256338"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="394256338"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 21:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="966069548"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="966069548"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 05 Jul 2023 21:14:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 21:14:54 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 21:14:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 21:14:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 21:14:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DayEHpNIGMpBfjF91RMauRXbHJDoXBifu+Klg/0QfI9jvseo0drxmpqmK/mRB1dMt1z6FDcbr57OGl6zDxUXM06xPLXQELGJIBHkmvx9Rm8EAhhvcuSEj93F19iZrDAs7iHWUh54zQEhuRXxa1FscCZSN4Y4+WghpFjmRvN/+H/7EwAmUD3TvXIE9mHbYcGJIHUwUkKyye5HQpB/vyQV8jYjuXPnDJaYXcnvh2wRsfUAfq68e+aJTmBQNAZ5Hrf3ts3oV9f2D7shwgh8BQ54tV2ejYzqkEgPe9P6SoZLsW6+ORvsuuf4jbn9Hbus0v33CKF+rIuIYV2cX5gC+IbROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFXem4Fp5e0S6bF0YB5PCBlnBBNXSAApV6PeZ1ezXKI=;
 b=mZx+8bwCyXAnBXQVuveTCK97yloyDgRFtTzDY13ujKeEal86Vnjps3R5V/OxEd487L47yqMuClUrIAnVBDWvput1h2vk/bs7zBFOZHOJoJ9V3uwILMXdY6+OBmwuXjBNSnhvYY+wSZn1wn1O45nzUA4wOm5vMq1dmwvj3LeohRUHKrFwYBQhXrjcf1HuhCrk9whJxxAtNS1XEWTeHFLeEeHvrylGRNF3DQkzOidPjGqnj73k6GC2XNeNQyBDRo4p0ku13RM3SBI039zVw360hkH5P22u6FKnwve5oi5WMMuYaKl2j3Z9+h42arPyICU+QdeCRk7FIuuPpFzB+qreiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 04:14:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 04:14:51 +0000
Date: Thu, 6 Jul 2023 04:14:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKY/lEAyqXYhul2t@DUT025-TGLU.fm.intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <20230705160602.237213-16-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230705160602.237213-16-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: ab17a555-17fb-4e91-4575-08db7dd78b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KrkLILPgY9D1YFUxdw/fO4h/9LcFe0CZ1I4u2YZmxkP5OK6/xUisRDtECkarytNUV90RgAWkkSH2hDjk7pnv6gomcI2mT8v0rB+KcIiI4DgAdN3sCTrnWWiXg5P37gAZS/3mh4iF6uLv7/YIEsle2KatjmhRcZTlgN1v8yot80VnRPECvC//MSxH865edfaVGQMJYFKb7+xL7yktQcwRN2aWXeq6KSOujQqmD1YBFxHRTAsgGUUh/NBPWBtk5CmXHiLncc74UFAl+pH21Qg+ckSBQuihtAEXm4yZkQZ7OB3yovYASchlO+lhNC2Yi9XPMjgeat9V1hKe0Lnd9x6zTUc9Bm/4InfT3n9jYTiRmTlcSq0X33uz6cSBi+GN19Le0QpA7P/hd82eQX0ORNRArHo5T2u+/kCNen0j/lADbKUxsE0cKSx62EHjHKPv7M+bWLSsaDT2Nlptyxo5RWK9kR9iW5HJyc/AoB6NmAN8R4o+fHXPdJbevNfI+5IwWt/vkMJv5Gecc6cCl2a9EzR37SlCKtXYmOHqZk0GLmpuQYFgZKzEiFxiBYnFTj84I+bu+UCNHPTU2o8aOoxwvsA5wfoT08nzp7rAxPcC+L800qhqs2RE9sbxoY1Yrya6lAve
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199021)(41300700001)(8936002)(6862004)(8676002)(44832011)(316002)(5660300002)(2906002)(6486002)(6636002)(66476007)(66556008)(4326008)(6666004)(478600001)(6512007)(966005)(82960400001)(86362001)(38100700002)(186003)(107886003)(66946007)(26005)(83380400001)(6506007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GtY82/jWVCYYtsiEenSAfqDjMM4Lfnjw82vtOvmWlvoGX55+Zzv4L2EW6y?=
 =?iso-8859-1?Q?akjrBO8ftE8qHTsUZ+KzriygqN3TLF4NnpFYqUr5p9h0s+BOH6gR2P1RhW?=
 =?iso-8859-1?Q?iz3dLBb3O56kNtHLxstb1OEPqlZiBEjzh3uIO2TKg3GIMSHmsdgGpTa5qy?=
 =?iso-8859-1?Q?ndPSNeIk/ahS6UKE47xfBrzBe63c/f7+EKbU6IZuS0NJ526UueigCQXUcV?=
 =?iso-8859-1?Q?RVUtzZF/rcmM6JyjTYVJO6qrvHAuxewFyXI/jiHL2VzI2OBWYdlWQvqldX?=
 =?iso-8859-1?Q?Gdh70XVO0S9s2p2rGcL7/D2wwB/cDuuMpMz1yS7jDJ0nLM3TtOcKkPQBX4?=
 =?iso-8859-1?Q?Dc9dyFiC+2ngi5VFQieGNEud09MJfr0dYnyi/0X0leXRMrRtW4Qt7VGtpt?=
 =?iso-8859-1?Q?O7wxgqHp8JFA/CyAz7K7YtMOFW+yO3yBaPazgpyAPydCKLYVBUelLu/S5H?=
 =?iso-8859-1?Q?lJZRtzxPHgBoKPJZ07wQyAQJ4R1YuY2jK/M4gccMer6I++2H6jRaMSGSi1?=
 =?iso-8859-1?Q?tiIFbAYJh3JZvcWIR72Ryc8UaS96M/mLDuExaTgodscuCFG8QidUlx2Mkq?=
 =?iso-8859-1?Q?hq/I7IYn6pKt4TwQrzvL5nF0UtsYmoNAPhQ2qmwA1kJy3kaf5bFaEIPFHf?=
 =?iso-8859-1?Q?QzoECgjuJFAkrLrH/Te9YG3wAG0dPCNDlxnuKTJtjPERDxURBeCeg4WL8t?=
 =?iso-8859-1?Q?zLmWerx1BDAps2Ta6eqd0gYyOtxjQMtLkZYl9ib+S2dy/61VX5vGLWw3Lv?=
 =?iso-8859-1?Q?P/R7aeU03CSs7cr3rIPWZMTefPNvFseYp46GdReBa5k7/Nf6oQ4NHf7XWX?=
 =?iso-8859-1?Q?i964ediGs8EVniKhaD8Cw0NXhr93/ZNzWLQp+CbzspYYeHOT9lcgu9Dz0o?=
 =?iso-8859-1?Q?ObRRuKg1k52nSVChizaRc7ZdwaqcjfXCgcISazgdAB89DrhCd1lYlC/OdR?=
 =?iso-8859-1?Q?cCc2VEjFpLgv+3gvXbOn3JdSPSv4Vl8i3pLK9RNHMWWFq8IRQMKTqewZ29?=
 =?iso-8859-1?Q?6tAHEjbZlXHEdwyQCBpkDJovaeLR8CSIMIFrsWPQ3b3dvx4L/pHsr+NOik?=
 =?iso-8859-1?Q?KXZARjI/+D8a0L2AYHgSqf7ZaoOCvPInimubZfeqLZW2b0LY2hEKSyLJPF?=
 =?iso-8859-1?Q?/hPxT0RMnKngKf8LMyBulieo4BwPGr8P2wAj0P9At43lChyagVlWOou71v?=
 =?iso-8859-1?Q?6qA5sbxPrkugKUgDO66L4zdMOG8h2N5J72YTQlZw18/YgeWq7ZJQjPSm9k?=
 =?iso-8859-1?Q?/5NCBAvHiyOL7Yz5XSUppqpPscGU7MfD5V1PwDCV51gFqn5HP8C1ZY0sOu?=
 =?iso-8859-1?Q?DKXa/hZTKgaMWX+5jLZVqBnmftrRo5+E79IhqSYspvYyou2JKKH0OvBs12?=
 =?iso-8859-1?Q?qz2jeGKIXcOUch28ztlZyQRPuSIXyo8GFKh1k1bfwsEqNdOljx3rHQMoWY?=
 =?iso-8859-1?Q?Gh0uMuety0/7tbiuodl01gNNjD59CWpv9nIBlpDO1XaeZPFCIAbwWr9Out?=
 =?iso-8859-1?Q?4X6eTbmqX+LTD7sXDX9b2X+A/D/IlE37ipgNLzXUnVygSe5XQyZ5EXntQn?=
 =?iso-8859-1?Q?GkO8R4ELZFC7fKqt44LaeppKzO89DyYyJa9i2Cct7Fqo4rVOKUD370fs0o?=
 =?iso-8859-1?Q?pWWxZHs7jtOe1cQTNNVdHKp3h+6nLw2d8paDN0xEvaXJEKAwluR+XL+Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab17a555-17fb-4e91-4575-08db7dd78b29
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 04:14:51.0663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DC0ls7Y8sbFJU3KI9CBWsp9xrVmS3473LSh69IOKnlkiYOUeDlHdP1g0shEZaIv+8cPtLj4U0tqsdlidDGiKAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 7/7] drm/xe: handle TLB invalidations from
 CT fast-path
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

On Wed, Jul 05, 2023 at 05:06:10PM +0100, Matthew Auld wrote:
> In various test cases that put the system under a heavy load, we can
> sometimes see errors with missed TLB invalidations. In such cases we see
> the interrupt arrive for the invalidation from the GuC, however the
> actual processing of the completion is pushed onto a workqueue and
> handled with all the other CT stuff, which might take longer than
> expected. Since we expect TLB invalidations to complete within a
> reasonable amount of time (at most ~250ms), and they do seem pretty
> critical, allow handling directly from the CT fast-path.
> 
> v2 (José):
>   - Actually use the correct spinlock/unlock_irq, since pending_lock is
>     grabbed from IRQ.
> v3:
>   - Don't publish the TLB fence on the list until after we fully
>     initialize it and successfully do the CT send. The list is now only
>     protected by the spin_lock pending_lock and we can't hold that
>     across the entire TLB send operation.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/297
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/320
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/449
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

This all looks correct to me but I suggest some extensive testing (e.g.
more than just CI) as this look like a risky change.

Assuming this is throughly tested:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 83 +++++++++++++--------
>  drivers/gpu/drm/xe/xe_gt_types.h            |  5 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 12 +--
>  3 files changed, 59 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 51789ec9ad57..18ce3149446d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -25,7 +25,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  					tlb_invalidation.fence_tdr.work);
>  	struct xe_gt_tlb_invalidation_fence *fence, *next;
>  
> -	mutex_lock(&gt->uc.guc.ct.lock);
> +	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>  	list_for_each_entry_safe(fence, next,
>  				 &gt->tlb_invalidation.pending_fences, link) {
>  		s64 since_inval_ms = ktime_ms_delta(ktime_get(),
> @@ -47,7 +47,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  		queue_delayed_work(system_wq,
>  				   &gt->tlb_invalidation.fence_tdr,
>  				   TLB_TIMEOUT);
> -	mutex_unlock(&gt->uc.guc.ct.lock);
> +	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>  }
>  
>  /**
> @@ -63,6 +63,7 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
>  {
>  	gt->tlb_invalidation.seqno = 1;
>  	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
> +	spin_lock_init(&gt->tlb_invalidation.pending_lock);
>  	spin_lock_init(&gt->tlb_invalidation.lock);
>  	gt->tlb_invalidation.fence_context = dma_fence_context_alloc(1);
>  	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
> @@ -97,6 +98,7 @@ invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
>  	 */
>  
>  	mutex_lock(&gt->uc.guc.ct.lock);
> +	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>  	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
>  	/*
>  	 * We might have various kworkers waiting for TLB flushes to complete
> @@ -112,6 +114,7 @@ invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
>  	list_for_each_entry_safe(fence, next,
>  				 &gt->tlb_invalidation.pending_fences, link)
>  		invalidation_fence_signal(fence);
> +	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>  	mutex_unlock(&gt->uc.guc.ct.lock);
>  }
>  
> @@ -122,7 +125,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	int seqno;
>  	int ret;
> -	bool queue_work;
>  
>  	/*
>  	 * XXX: The seqno algorithm relies on TLB invalidation being processed
> @@ -133,21 +135,28 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  	mutex_lock(&guc->ct.lock);
>  	seqno = gt->tlb_invalidation.seqno;
>  	if (fence) {
> -		queue_work = list_empty(&gt->tlb_invalidation.pending_fences);
>  		fence->seqno = seqno;
> -		list_add_tail(&fence->link,
> -			      &gt->tlb_invalidation.pending_fences);
>  		trace_xe_gt_tlb_invalidation_fence_send(fence);
>  	}
>  	action[1] = seqno;
>  	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
>  				    G2H_LEN_DW_TLB_INVALIDATE, 1);
>  	if (!ret && fence) {
> +		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>  		fence->invalidation_time = ktime_get();
> -		if (queue_work)
> +		list_add_tail(&fence->link,
> +			      &gt->tlb_invalidation.pending_fences);
> +
> +		if (list_is_singular(&gt->tlb_invalidation.pending_fences))
>  			queue_delayed_work(system_wq,
>  					   &gt->tlb_invalidation.fence_tdr,
>  					   TLB_TIMEOUT);
> +
> +		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
> +	} else if (ret < 0 && fence) {
> +		trace_xe_gt_tlb_invalidation_fence_signal(fence);
> +		dma_fence_signal(&fence->base);
> +		dma_fence_put(&fence->base);
>  	}
>  	if (!ret) {
>  		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
> @@ -156,8 +165,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  			gt->tlb_invalidation.seqno = 1;
>  		ret = seqno;
>  	}
> -	if (ret < 0 && fence)
> -		invalidation_fence_signal(fence);
>  	mutex_unlock(&guc->ct.lock);
>  
>  	return ret;
> @@ -332,41 +339,55 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> -	struct xe_gt_tlb_invalidation_fence *fence;
> -	int expected_seqno;
> -
> -	lockdep_assert_held(&guc->ct.lock);
> +	struct xe_gt_tlb_invalidation_fence *fence, *next;
> +	unsigned long flags;
>  
>  	if (unlikely(len != 1))
>  		return -EPROTO;
>  
> -	/* Sanity check on seqno */
> -	expected_seqno = (gt->tlb_invalidation.seqno_recv + 1) %
> -		TLB_INVALIDATION_SEQNO_MAX;
> -	if (!expected_seqno)
> -		expected_seqno = 1;
> -	if (drm_WARN_ON(&gt_to_xe(gt)->drm, expected_seqno != msg[0])) {
> -		drm_err(&gt_to_xe(gt)->drm, "TLB expected_seqno(%d) != msg(%u)\n",
> -			expected_seqno, msg[0]);
> +	/*
> +	 * This can also be run both directly from the IRQ handler and also in
> +	 * process_g2h_msg(). Only one may process any individual CT message,
> +	 * however the order they are processed here could result in skipping a
> +	 * seqno. To handle that we just process all the seqnos from the last
> +	 * seqno_recv up to and including the one in msg[0]. The delta should be
> +	 * very small so there shouldn't be much of pending_fences we actually
> +	 * need to iterate over here.
> +	 *
> +	 * From GuC POV we expect the seqnos to always appear in-order, so if we
> +	 * see something later in the timeline we can be sure that anything
> +	 * appearing earlier has already signalled, just that we have yet to
> +	 * officially process the CT message like if racing against
> +	 * process_g2h_msg().
> +	 */
> +	spin_lock_irqsave(&gt->tlb_invalidation.pending_lock, flags);
> +	if (tlb_invalidation_seqno_past(gt, msg[0])) {
> +		spin_unlock_irqrestore(&gt->tlb_invalidation.pending_lock, flags);
> +		return 0;
>  	}
>  
>  	gt->tlb_invalidation.seqno_recv = msg[0];
>  	smp_wmb();
>  	wake_up_all(&guc->ct.wq);
>  
> -	fence = list_first_entry_or_null(&gt->tlb_invalidation.pending_fences,
> -					 typeof(*fence), link);
> -	if (fence)
> +	list_for_each_entry_safe(fence, next,
> +				 &gt->tlb_invalidation.pending_fences, link) {
>  		trace_xe_gt_tlb_invalidation_fence_recv(fence);
> -	if (fence && tlb_invalidation_seqno_past(gt, fence->seqno)) {
> +
> +		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
> +			break;
> +
>  		invalidation_fence_signal(fence);
> -		if (!list_empty(&gt->tlb_invalidation.pending_fences))
> -			mod_delayed_work(system_wq,
> -					 &gt->tlb_invalidation.fence_tdr,
> -					 TLB_TIMEOUT);
> -		else
> -			cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
>  	}
>  
> +	if (!list_empty(&gt->tlb_invalidation.pending_fences))
> +		mod_delayed_work(system_wq,
> +				 &gt->tlb_invalidation.fence_tdr,
> +				 TLB_TIMEOUT);
> +	else
> +		cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
> +
> +	spin_unlock_irqrestore(&gt->tlb_invalidation.pending_lock, flags);
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7d4de019f9a5..28b8e8a86fc9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -163,6 +163,11 @@ struct xe_gt {
>  		 * invaliations, protected by CT lock
>  		 */
>  		struct list_head pending_fences;
> +		/**
> +		 * @pending_lock: protects @pending_fences and updating
> +		 * @seqno_recv.
> +		 */
> +		spinlock_t pending_lock;
>  		/**
>  		 * @fence_tdr: schedules a delayed call to
>  		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 811518230262..d5e9ed53c655 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -988,15 +988,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  			return 0;
>  
>  		switch (FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1])) {
> -		/*
> -		 * FIXME: We really should process
> -		 * XE_GUC_ACTION_TLB_INVALIDATION_DONE here in the fast-path as
> -		 * these critical for page fault performance. We currently can't
> -		 * due to TLB invalidation done algorithm expecting the seqno
> -		 * returned in-order. With some small changes to the algorithm
> -		 * and locking we should be able to support out-of-order seqno.
> -		 */
>  		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
> +		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
>  			break;	/* Process these in fast-path */
>  		default:
>  			return 0;
> @@ -1050,8 +1043,7 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>  	struct xe_device *xe = ct_to_xe(ct);
>  	int len;
>  
> -	if (!xe_device_in_fault_mode(xe) ||
> -	    !xe_device_mem_access_get_if_ongoing(xe))
> +	if (!xe_device_mem_access_get_if_ongoing(xe))
>  		return;
>  
>  	spin_lock(&ct->fast_lock);
> -- 
> 2.41.0
> 
