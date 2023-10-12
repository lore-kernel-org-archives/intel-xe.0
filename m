Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4517CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 17:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2B210E174;
	Thu, 12 Oct 2023 17:28:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F65410E174
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 17:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697131721; x=1728667721;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2mhbfXLzHb0Cl7lg5mFhKjXsXW9vcPB0lvQpiL5TI+Y=;
 b=ILNK60Ee6d1H8Ax92qBucq0p5c/oOj5AfH913Fq1HA4sx3hXRWZ668jL
 WaBsV7G60AVF7WhkN1fRSMu2h0DNMVVQ4iCunQkpAtwsP4ybxydPOc6Ud
 FmZbN4XySpAQybXA2vJl6vR8KIeFbOoRK445L/ZzJeXHAjWzmqZYCi9Yo
 RB4FP1RAetRagoxQcDl7xAX3nt1oqrSXz/iYD7dTJMCMHe5nEjH6DfoXM
 dxJPfZ9C418UEz4mGUivQLRvW37Ghfi6hX9INAOxgZBazWenPv1JyR7De
 /xaZGQYamx8hkZy6IhJ31Mu042yOMkk+tu8HfJnP0FY00rIbSgyelN3/Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="384830038"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="384830038"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 10:28:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704257196"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="704257196"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 10:28:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 10:28:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 10:28:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 10:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoUlaHQ0oaYjBrcWxFZxuRhrv0XEQb8k0xJvwNZTCIEAUKXDGDEH32Qelmsm2uICp/2SuJON4QvvAsL7du6pdkYKnlWmAQCJ/SVdmZ70tL1CMupOYaAbkOOi/l1GAfUuAIpioJLzKQFJRHQdcdW542RYY6c/2U0NO0V/X7aBUnvy08zaYSFIespu6TSqS4bNUMRwZOy+lAy3lBedZzUM/HjUHRf3FnBSGTq2scfduobNbljGae3phVJUp+hQevgYmh7s+LHhFBSGMtSgZed7TGBeMQyj/dgEr6D4mE0Gp32oObQPjqVGLMsXqgze0zZSauXeGFdMC1iADbd/PpvHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jH+sMwxpd0LFnpCaakOr2yMBEZtKRvKLjRoILYiPYA=;
 b=RSuZuFhEcTcG46ow9vJcyuEZpaCZs+jzuQhsdACdj2fgA0WsKwpT2G7/VYRN8RTxICE4DJ1W/+dXsxp9b66swgbZRkZ/uew9JKYfzmlkcSb4a272h2DB4p8/DRse4pYaNK8mD29O9/9Y77Hpue/MAvAuTrF9J9lLLEzlRt9RHQQly8brF/joMyAu4fF2mAI6D/pdYp1+UEeodaRa5N8Xg04Za3xh8nc1SfFoFhpYhCH0lojbx6z6gLrzDAPcUdzWSm7Qszm8Um+lrgDm/BRyhKeBHgUbNmRF7hWR41+I0k5lY1pl22xQeUzTm+gW1fjYUl81XnOa8OuQnJz4yXRK/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.28; Thu, 12 Oct 2023 17:28:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 17:28:35 +0000
Date: Thu, 12 Oct 2023 10:28:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20231012172832.GI21382@mdroper-desk1.amr.corp.intel.com>
References: <20231010184151.91195-1-jose.souza@intel.com>
 <20231010184151.91195-2-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231010184151.91195-2-jose.souza@intel.com>
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: dd474e0a-8a48-493b-4393-08dbcb48a9c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +vz1DlfD1jFEaslGSDxRbNoPs3RmUoxzXOY8skMhqjhlCrH/vCwTnwlWz4sZFBpHkf1r4Q9mB+VcH3lfUtR4LXr2bc9kNECCo6gvF4X765Y4+XmFwp/WI4TupJoIIKDsg8jKbnTBjGlhOr3h4AD9YOK64ftL8vNwsb4ILL06zRd9ON2HzTOP6McLmKBZRpiBSANol7yFx20X9DbJvwM/pqHo6Ms/dIOW0+kpsaxVuQTU2y3jXGfkbIDfBygSTn+kBIowO8NauF75Y3nhf+fu9ZxwMcnbxN4nqIFSW+qrs8Q+MWySpUsuZ9Wcyu/BDE24HUv5q9NrkdaMiIrKC5joHLeaGyMobRsr4tpy4rGEA03yLpfxNkKBtZRS8UcXJW19nGsH8Qg/YnvDbfMofSKfJTI01Bg2x6zhLpmfLRn9RZ0cBASdevmTE1qp5GQUnFpD46LdxO8nSXqgfUgxv4mTYlFM31CnolSFcj7Il3J984aQB+Lnk9RrgltOkVile06mgN+K87OF+8fKLEWnQnL+vSDIgW4D34dnq6QxTnVmApSjmgFo6E1eX2ipjnpIysbd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(33656002)(86362001)(1076003)(8936002)(6486002)(107886003)(478600001)(2906002)(6666004)(26005)(83380400001)(6512007)(6636002)(66476007)(8676002)(41300700001)(6862004)(6506007)(82960400001)(38100700002)(4326008)(5660300002)(316002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?L8e/nZedKUre1cXs5HYsdUCyeO4v2nKCF77ZwMoPGmhJ6OfasJLrEoNxVm?=
 =?iso-8859-1?Q?3RYscTxd39l24ewoDDhIzxWl+Q2qq5+Fipi9ncHnBRrTiALax8GXe1sWXf?=
 =?iso-8859-1?Q?ALc0pCiN/anIxydJRTDXmef4AKelC2p3qGUrVWJZUwvkTGYGQZKs0zRmz3?=
 =?iso-8859-1?Q?KQXZ9QhzmvKeo5nmP3Xo6ZDDybaU03kcQL/dPVNmgRiAgxkhrZuPY5mXBT?=
 =?iso-8859-1?Q?lbEs0ulzXSbafKdxZYVg/WoMUOOCEc93JOBJ6IQ9BQmFuWajLxeOifRC54?=
 =?iso-8859-1?Q?qr4DF4DekjCzDHX07oj5kQONEwVtOIJwYRnkdu/cQg1j87YnCevzcsZf6h?=
 =?iso-8859-1?Q?5Y7LmxAA6jWLXmVbBJUjK3OjqT4XKFCKioEXGyvlwURecpvkPDxynU7wA/?=
 =?iso-8859-1?Q?ACL9TZb8n9iCAAc2CDHssLZpbHepU6reYCx/H/55l3SkwLopB0xhI1Ezo0?=
 =?iso-8859-1?Q?HCSYUSbUaGpXhKU64WHIwLoJ3rcpcZ00ULeCyeV36/jB7jDqfWbalh9BKf?=
 =?iso-8859-1?Q?/EwlxaCQfM5wEB5jJ94px01o5GAfkh9LK5ZJed8QfPuP2o+2h/761SrIUi?=
 =?iso-8859-1?Q?NVDGlohp5OVF4Zdr+gf57rHFVUqFZpXgrgacne3DAsWhvfOy0EHIZ+DbS0?=
 =?iso-8859-1?Q?+qtqPiqEIAKnOwKiaqnyJITow96GpyV3Uz29sDwNh1YeVspto5Nemzn9OR?=
 =?iso-8859-1?Q?o85sF+YFCEKeSuB/jsfLE148h5RKbuuhEcnmRtFOjPNGtiTPMxlxDIOtXH?=
 =?iso-8859-1?Q?cMXkQe0oNeMyTr4qzSPLsfzzicrsBAJDjUNsDJBFc8bpMu0hRxjmNJgP8o?=
 =?iso-8859-1?Q?tUiXcx1WRDKMOKQusOgUrEoAtcbTsU78Bb+IRcD13oZa6WPLSirOIVQRAm?=
 =?iso-8859-1?Q?ZiFn0qPidb7M4GMMTYxnUSN9Md5G2If4CviOBmkWy0TgEu+Z9fqRec+QcV?=
 =?iso-8859-1?Q?JSU1m+Cw2NgPgMvMRlz9iGhk5SQcbFKO9ZdNV8vDbKuopEWPXmBNdh9ZS+?=
 =?iso-8859-1?Q?z488l8OJa8e3PyJAN+mwhG0MD6gTsVE19IJTTkGkiiWve99O2SI5ykQCal?=
 =?iso-8859-1?Q?oHJeLgjt14HMY/NZ/TzKbcVWqq5CAAar6CDd0v1mFAW+Qi6V+PR+bbQlDm?=
 =?iso-8859-1?Q?TUN6pBxynDipEpGGiG+9JrTaChD1rGxzztx7FB0lWx0YoywsJwLetI0VkL?=
 =?iso-8859-1?Q?qj0ffnx0Rkj24g/SAiiYWjmn47OXeq1e9/ZtoQyRxjGjZwzLRf537dufnT?=
 =?iso-8859-1?Q?cMp7wg92xsNK4lUrgGrxcaJP1Uu+gUXcYYuW+Mtx9YupfF2xzfaqNd71g6?=
 =?iso-8859-1?Q?ahr97pcilhVao/Oo6ftYll7Fiq/gXqTyxqzo9dtULADv5Iu9f0mlgeNiZZ?=
 =?iso-8859-1?Q?S69XOf+mqlbwera/s5SjB+Q5fgYGn8r504o9UU7eMpqESzRBWhclCLY3r8?=
 =?iso-8859-1?Q?ktqWAUekyrnsGKB9u0Sen7RPAGKgokClp4zouc4U+Bg8t1bDu5X9Mkwhxu?=
 =?iso-8859-1?Q?nNUMSyDANEDRHQ3wvCPHSzVy52vRJipFdJ4Bu+utm0N6BO8zPe87hME39b?=
 =?iso-8859-1?Q?JGs/H/RTF2tuuBQyo06PWhSr3AagzuJ5FVTjw2Xr6WvhqhUFBemnGA+gj/?=
 =?iso-8859-1?Q?yy+k72dIq5LHXcmjsalVbEZbUtBzSzQB6tihCX/0qWKVoKeBJfUlU9Kg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd474e0a-8a48-493b-4393-08dbcb48a9c6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 17:28:35.0841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVTAMYsMG0NXRQJ+0zUgJlT7KM23P8UTFRzjewkd4GwijuKpIq/as+xl0vHj0whqZ+IFMvV29DHfNslCJj46cKV85aUKpHecnJFgYKSq4Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/3] drm/xe: Add misc functions to support
 read of specific DSS registers
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 11:41:50AM -0700, José Roberto de Souza wrote:
> Next patch will read register in specific DSS registers and this
> are the functions missing to do so.
> 
> xe_gt_mcr_get_dss_steering() calculate and return the group and
> instance that will be used by xe_gt_mcr_unicast_read().
> 
> xe_gt_has_geometry_dss() and xe_gt_has_compute_dss() returns true
> if DSS is available for geometry of compute.
> 
> for_each_geometry/compute_dss() to simply the iteration over each
> available DSS
> 
> v3:
> - add for_each_geometry/compute_dss()
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h       |  3 +++
>  drivers/gpu/drm/xe/xe_gt_mcr.c   | 17 ++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_mcr.h   | 31 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h |  3 ++-
>  5 files changed, 69 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index c63e2e4750b1e..47860ce94f9fe 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -747,3 +747,20 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
>  
>  	return NULL;
>  }
> +
> +static bool has_dss(xe_dss_mask_t dss_mask, unsigned int dss)
> +{
> +	unsigned long value = bitmap_get_value8(dss_mask, (dss / 8) * 8);
> +
> +	return value & BIT(dss % 8);

test_bit() (from asm/bitops.h) is usable on bitmaps.  So I think you can
drop this function and just do

        test_bit(dss, gt->fuse_topo.{c,g}_dss_mask);

in the two functions below.

> +}
> +
> +bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss)
> +{
> +	return has_dss(gt->fuse_topo.g_dss_mask, dss);
> +}
> +
> +bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
> +{
> +	return has_dss(gt->fuse_topo.c_dss_mask, dss);
> +}

These might make more sense to place in xe_gt_topology.c?

> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index caded203a8a03..e7baaa0088041 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -67,4 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
>  
> +bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
> +bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 77925b35cf8dc..e76cb0ae457aa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -291,11 +291,17 @@ static void init_steering_mslice(struct xe_gt *gt)
>  	gt->steering[LNCF].instance_target = 0;		/* unused */
>  }
>  
> +static unsigned int
> +get_dss_per_group(struct xe_gt *gt)
> +{
> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +}
> +
>  static void init_steering_dss(struct xe_gt *gt)
>  {
>  	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>  			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +	unsigned int dss_per_grp = get_dss_per_group(gt);
>  
>  	gt->steering[DSS].group_target = dss / dss_per_grp;
>  	gt->steering[DSS].instance_target = dss % dss_per_grp;
> @@ -683,3 +689,12 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
>  		}
>  	}
>  }
> +
> +void
> +xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
> +			   int *instance)
> +{
> +	unsigned int dss_per_group = get_dss_per_group(gt);
> +	*group = dss / dss_per_group;
> +	*instance = dss % dss_per_group;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 27ca1bc880a00..9f5f7dbb6fca8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_MCR_H_
>  
>  #include "regs/xe_reg_defs.h"
> +#include "xe_gt_types.h"
>  
>  struct drm_printer;
>  struct xe_gt;
> @@ -24,6 +25,36 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  			       u32 value);
>  
> +void
> +xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
> +			   int *instance);
> +
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>  
> +/**
> + * for_each_geometry_dss - Iterate over each DSS available for geometry
> + * @gt: GT structure
> + * @dss: DSS id
> + * @grp: group id to be in xe_gt_mcr_unicast_read()
> + * @inst: instance id to be in xe_gt_mcr_unicast_read()
> + */
> +#define for_each_geometry_dss(gt, dss, grp, inst) \
> +	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
> +	     dss < XE_MAX_DSS_FUSE_BITS; \
> +	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
> +		if (xe_gt_has_geometry_dss(gt, dss))

We probably want to use for_each_if() rather than a regular if(), just
to help prevent issues with nested if's inside the loop.

> +
> +/**
> + * for_each_compute_dss - Iterate over each DSS available for compute
> + * @gt: GT structure
> + * @dss: DSS id
> + * @grp: group id to be in xe_gt_mcr_unicast_read()
> + * @inst: instance id to be in xe_gt_mcr_unicast_read()
> + */
> +#define for_each_compute_dss(gt, dss, grp, inst) \
> +	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
> +	     dss < XE_MAX_DSS_FUSE_BITS; \
> +	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
> +		if (xe_gt_has_compute_dss(gt, dss))
> +
>  #endif /* _XE_GT_MCR_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d4310be3e1e7c..1d3e027fb2267 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -25,9 +25,10 @@ enum xe_gt_type {
>  };
>  
>  #define XE_MAX_DSS_FUSE_REGS	3
> +#define XE_MAX_DSS_FUSE_BITS   (32 * XE_MAX_DSS_FUSE_REGS)

We should remove the now-duplicate definition from xe_gt_topology.c too.


Matt

>  #define XE_MAX_EU_FUSE_REGS	1
>  
> -typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> +typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>  
>  struct xe_mmio_range {
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
