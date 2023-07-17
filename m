Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB01EB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 20:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA1410E04A;
	Mon, 17 Jul 2023 20:37:03 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FB310E04A
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 20:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689626219; x=1721162219;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=if/RJ6B4Ae+mOfeFYnwjRHXsH/M/RYb5cHtlbtzrkiQ=;
 b=XSU6nyQukJwZVkN8ko3jymh70NV2tNT9MQOqTy1SJFoY/E4SxGCXqdlg
 xudBA06IQJtlvVt00DKPOVvLE+uZWdf8DyhKfI+qYa1vLZuuAK+GdeLmt
 faFVPXR6Yq7fpMBP4WxIVYR/dhudJrfQbGR4007FsF4GGQPK5mSO2Un5J
 KRrAE9agqFwCPJI2eTJfEMeliYA3zw59YDCuOm21DBCoq8OTTkKY2pxJJ
 RK0bNjn9Ibq4QRP9qq/P4OZA0JLcaDihBqRmL94OeR9hhH01TXN4/a8E1
 3zKzNOcrRWpYqTN+4KOVPVZrb7CeRJqby9mYlc59EAo1Y3Qf+Q162cG0K Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="396867080"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="396867080"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 13:36:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="793378191"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="793378191"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jul 2023 13:37:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 13:37:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 13:36:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 13:36:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 13:36:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=askw9BhFBVHYQGh+9dCZtUSZheiRL0z/Z3NH8TOtjyM/u2i0MKvQ62Hx7t7+a6SJuVoSyi6mPwlDT6DOeGwbA7Ja9ve7hwC23BA+dyhqSst1IQoZrsPJDsPthnCZpMFDC9tw/307A+fBH+Kt7hecViF4HQlbmCsoxIgVbjHqRYFqDRD+NwGJDlvVPIDo9hXncXFgwBokf07M8di5Ki+AgI0mCFLacYskCKxTUHd8N/gpiuoJpb6ndsq7sM3NN31dunhzqmn/fsUNXYv3OIke8Ab+W6OJVLGzqw6FwGzQJE5KrGd86e3C02VTr2n9mPTqE12J9IEOZRQm6l1yZyrPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rvRNY5yW6W3fhakYuXETNP5N4uAaWUsX9+JsFYCMNE=;
 b=R14E7snSyY4KxBG9Quimv0mgl3s//Nse/KEb8kFItfsbQ45Sr2fHLdURpXO7vsjjkHn6F1RfL+q9NCyswcuxA9tEqplu6TFFRDN31tDz2/k6LJI+Rrmm0glRqRjCOHtY17SXJJU2WNZ1KShNpxNNvlJ85scB4BK6x6wsmtqSsrD4Akh3R0B/LyYQrR+gv1/4RSz1EMHTWbghppCn4ObTERlXNO0TaLmQ6yWk1blhvKHq26val4GDQ3ovCRKuo4Xi4WeQwNlmcOYaixCS1xAFA2Zse7LfiJSn1qx66B9XANrLYn0USBkLHdNPKie1GBhXzYhHstW2aAK4VMUuK27OfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7415.namprd11.prod.outlook.com (2603:10b6:806:318::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 20:36:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 20:36:57 +0000
Date: Mon, 17 Jul 2023 20:35:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLWmKgY/mu4azUgs@DUT025-TGLU>
References: <20230717192833.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230717192833.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: 02dbc250-ee0f-4daa-4369-08db8705903d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pri0JgjkXLSNaXUdnF/8e12EtYshJFb5kWlU8vALvziK8oIVgoYvlRLLDo9B84ys5GnBLnf9jSY0/8aSnrbTnrgpeuRGZVDZSMJHC1xoJdirz6VXmAmz7NImEw5B2bWGi66qQ/nHtD8mqQ8R6FqfTzT6yXMxo3CzUcQTskf5NuHUvHU3mAC24IqJBKjDaDt7PntUY9dRG7RanX/wQ+mMG9dmGJFeMZfxMJv/+A5oLyX7VHqOYZ7QPjdLnysI7guMQ49VZqNgEXjQw60K5hV3PNtokuuP2LXxqKRr+gCa5NQfVfj/tbZbHy7xzofatQtPNIekgoBsujLkIqXGJIhn81Por/i2FiI63ad3FZs4gCY6Ljg49zUkP9OUJI8W1jKTBSdLwLTQlN5E0QxF9jo47dxsvqq4PN5Xnx1SSVdgUF/Wq9sFVn9CFBuvco8E34ytgj0jAPZo0TMgyeTiddXQwfJ4zsPnU729A9rf9rpHRdNauIkgwjwswLdbkwD9bbl05KRGtI+GwQJ1VdwJNLR3BW3qWSh/ZlSOyzrHEbRtS8SEdUT+jrSerhQ35mPz5Q8w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199021)(83380400001)(478600001)(30864003)(186003)(6486002)(86362001)(26005)(6512007)(6506007)(9686003)(2906002)(66476007)(66946007)(66556008)(38100700002)(6666004)(44832011)(41300700001)(82960400001)(4326008)(6636002)(8676002)(6862004)(8936002)(33716001)(316002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UQEv54k7jSZvOR7qW358YfkLxwjwk9sFMFORtK2qd9fTOkNcn0tq0DyHmnjZ?=
 =?us-ascii?Q?Nqwqoj+wICKWP28vlh936K1X4qc1OPOUHJDhk6uu/FFgHoVPHM3P+X30qs8c?=
 =?us-ascii?Q?YyBr94aXcs+rg1XEcYzQYuwo+fVs8pljFSNnabI4JhdnlfurGwOWrJSvV7B1?=
 =?us-ascii?Q?saNCUM22muYCqK+RbUlGSHaLZCpaDUVT0TjQpz5bzfSEaUlGRQXT4mDn9wKI?=
 =?us-ascii?Q?Ib3Bo/tJQjxBxIPk7oaixaUSq0F8yRtqOd3Hi9Jw8DGscgUc9YCWEhNsN3Cf?=
 =?us-ascii?Q?EMWYl0Z70spfmb1Pkpp3pynI+YmfS2Rs0ssDL92AVI9yBQNm+V37hO33a4U/?=
 =?us-ascii?Q?kQNgDrk5ICc40j3dq0dYjqJ09lAgNJRt1cDC3Musc55DUUyfMzr3X7GOP4hX?=
 =?us-ascii?Q?lCZuk03hnPTnCM9sPpejvbKj9lMF+OUWMVUxiDCxalKTYZuUaFuCyQEkGgbf?=
 =?us-ascii?Q?U5/fEzxMI7OWPMMHkkl3Fb9NyQb8zA6RvrJevB2caXfKPghTQQRAOot//FTt?=
 =?us-ascii?Q?Bx/x3L3qJkeiRYdqYFgDSNK0QJy3Cbo0KIu4i1R1r9kh/ZJjCqpXVmwNH5bU?=
 =?us-ascii?Q?OsgKuogLpfGwUdkyedbpywr1ccZvPmpw/+Fd4TdoVA11CN+XY1DoFL/kqw6g?=
 =?us-ascii?Q?vDMfnWKJ0UaPdipDf7+f3H8ObRRt2pwkswPgGacnSZClgM6n+HlxABpjccki?=
 =?us-ascii?Q?+KyJXFj36czasl0Iyv9EHwsPjEcs3ZXP1E/OR18fFdxV3gQ1+Ew5DdgiO2tr?=
 =?us-ascii?Q?2yCwBzsmXk0O6EU67i7TpV6lKFMv6afSRTp82RaPtRTGdfhT4QJKpApkUj55?=
 =?us-ascii?Q?8Kkrzcn8okO0rlVYmad6SSwRZYcOJ1tP1vV20Mvye7NRs/BMSywAUW79VLTd?=
 =?us-ascii?Q?GD/SHHNU9Sfa96UwhIfE2xEgyh6E7kd/Oz8T7FjliO77DKZ+RcOUX+JefnMn?=
 =?us-ascii?Q?4S97QKwBkfilF2vSLZ7vMHaMImZDdXLTGAX/91pprc4C3I35HwU+6ZQvxpsy?=
 =?us-ascii?Q?TrXfwScK1JpiWkj2IcdFgJq5fZu9RzV1YbNwl/qHGu0uo+TLu5ttb/BaaCNh?=
 =?us-ascii?Q?pP5n8ACtLSVIKeBqXHei/KB2c5UYhfcAmI1kO0HlpNmaVN37NIHoX7EeZ1Yr?=
 =?us-ascii?Q?/N5utaZ9STiW6L11xGYtZBzKllL77GPnSRFa3KI4I0LuUgG9ta1+fwxa9tD+?=
 =?us-ascii?Q?VZYalWQvl3dqVvQm93mN+tlyrl0B63jruuddXdaEaDLsUyfRzyugIidyEwzB?=
 =?us-ascii?Q?qYVcDaSolE9iXz9KEla0LKFgjsCvL8Aju5+9B/nw2Amj6N3vx2ub4D4AUEkE?=
 =?us-ascii?Q?R3xZsnxbY4NDxZJ9EPCBhuMYP5/lfHCbIxZXBgdlMf7sURzoqu3Qt2Q3RJBC?=
 =?us-ascii?Q?KE4KbWMkjlaG9aRNJVHta3l59ZY0ziAJM4o9JMfjznNXJdgjt1edNaaS39e9?=
 =?us-ascii?Q?Oka7UxaSDz2lK+Hfn84+ZLZZYZ1ZZbsI9dzMqsrUmGtPkY7W7idOHbkqITOM?=
 =?us-ascii?Q?6WPL4PptfNO3sTBFyAxabPj5jqojNBlWviuEBYLmIhNLVnhkUsL5AlgDbl9S?=
 =?us-ascii?Q?9Zq/3nvxO0fvj0lXG6cwYisWC4ZWdxqmER6rS/Z8nfAurLHnt+1VLTegyMsQ?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dbc250-ee0f-4daa-4369-08db8705903d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 20:36:56.9434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7rs2jknbhA0I4MjjxVg2MCUnqBmL0zhFYvVb9bc4wG6vWvDinq/gnE4Mm8a1tM/YH2aIyp2yeY8js2GTH3OgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Cleanup style warnings
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

On Mon, Jul 17, 2023 at 07:28:33PM +0000, Francois Dugast wrote:
> Reduce the number of warnings reported by checkpatch.pl from 118 to 48 by
> addressing those warnings types:
> 
>   LEADING_SPACE
>   LINE_SPACING
>   BRACES
>   TRAILING_SEMICOLON
>   CONSTANT_COMPARISON
>   BLOCK_COMMENT_STYLE
>   RETURN_VOID
>   ONE_SEMICOLON
>   SUSPECT_CODE_INDENT
>   LINE_CONTINUATIONS
>   UNNECESSARY_ELSE
>   UNSPECIFIED_INT
>   UNNECESSARY_INT
>   MISORDERED_TYPE
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  .../drm/xe/display/ext/intel_clock_gating.c   |  3 +-
>  drivers/gpu/drm/xe/xe_bo.c                    |  4 +-
>  drivers/gpu/drm/xe/xe_exec.c                  |  1 +
>  drivers/gpu/drm/xe/xe_execlist.h              |  2 +-
>  drivers/gpu/drm/xe/xe_gt.h                    |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c                   |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c               |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c                |  3 +-
>  drivers/gpu/drm/xe/xe_guc_fwif.h              | 12 ++-
>  drivers/gpu/drm/xe/xe_guc_submit.c            |  2 +-
>  drivers/gpu/drm/xe/xe_huc.c                   |  1 +
>  drivers/gpu/drm/xe/xe_irq.c                   | 11 ++-
>  drivers/gpu/drm/xe/xe_lrc.c                   | 80 +++++++++----------
>  drivers/gpu/drm/xe/xe_migrate.c               |  3 +-
>  drivers/gpu/drm/xe/xe_pci.c                   |  4 +-
>  drivers/gpu/drm/xe/xe_pcode.c                 |  1 +
>  drivers/gpu/drm/xe/xe_reg_whitelist.c         |  2 +-
>  drivers/gpu/drm/xe/xe_res_cursor.h            |  1 -
>  drivers/gpu/drm/xe/xe_sa.c                    |  2 +-
>  drivers/gpu/drm/xe/xe_uc_fw.c                 |  4 +-
>  drivers/gpu/drm/xe/xe_vm.c                    | 12 ++-
>  drivers/gpu/drm/xe/xe_vm_doc.h                |  4 +-
>  22 files changed, 83 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
> index 0d67b0961d74..f9cb585e3645 100644
> --- a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
> +++ b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
> @@ -119,7 +119,6 @@ void intel_clock_gating_init(struct drm_i915_private *dev_priv)
>  		dg1_init_clock_gating(dev_priv);
>  	else if (GRAPHICS_VER(dev_priv) == 12)
>  		gen12lp_init_clock_gating(dev_priv);
> -	else {
> +	else
>  		MISSING_CASE(INTEL_DEVID(dev_priv));
> -	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5d6f73c1d37e..0381e00a6e51 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1710,7 +1710,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	struct ww_acquire_ctx ww;
>  	struct xe_vm *vm = NULL;
>  	struct xe_bo *bo;
> -	unsigned bo_flags = XE_BO_CREATE_USER_BIT;
> +	unsigned int bo_flags = XE_BO_CREATE_USER_BIT;
>  	u32 handle;
>  	int err;
>  
> @@ -1813,7 +1813,7 @@ int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
>  	XE_BUG_ON(!ww);
>  
>  	tv_bo.num_shared = num_resv;
> -	tv_bo.bo = &bo->ttm;;
> +	tv_bo.bo = &bo->ttm;
>  	list_add_tail(&tv_bo.head, &objs);
>  
>  	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 87d6cd4a7cc8..1f64d64a94fa 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -243,6 +243,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	    vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS) {
>  		for (i = 0; i < args->num_syncs; i++) {
>  			struct dma_fence *fence = syncs[i].fence;
> +
>  			if (fence) {
>  				err = xe_vm_async_fence_wait_start(fence);
>  				if (err)
> diff --git a/drivers/gpu/drm/xe/xe_execlist.h b/drivers/gpu/drm/xe/xe_execlist.h
> index 6a0442a6eff6..26f600ac8552 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.h
> +++ b/drivers/gpu/drm/xe/xe_execlist.h
> @@ -11,7 +11,7 @@
>  struct xe_device;
>  struct xe_gt;
>  
> -#define xe_execlist_port_assert_held(port) lockdep_assert_held(&(port)->lock);
> +#define xe_execlist_port_assert_held(port) lockdep_assert_held(&(port)->lock)
>  
>  int xe_execlist_init(struct xe_gt *gt);
>  struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index a523d7941afe..7298653a73de 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -13,7 +13,7 @@
>  
>  #define for_each_hw_engine(hwe__, gt__, id__) \
>  	for ((id__) = 0; (id__) < ARRAY_SIZE((gt__)->hw_engines); (id__)++) \
> -	     for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
> +		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>  			  xe_hw_engine_is_valid((hwe__)))
>  
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ce8b35dcbc51..d44537abf7da 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -186,7 +186,7 @@ static void guc_init_params(struct xe_guc *guc)
>  	int i;
>  
>  	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
> -	BUILD_BUG_ON(SOFT_SCRATCH_COUNT != GUC_CTL_MAX_DWORDS + 2);
> +	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
>  
>  	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
>  	params[GUC_CTL_FEATURE] = guc_ctl_feature_flags(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index dd69d097b920..d4c3a5ce3252 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -444,7 +444,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
>  	struct xe_reg_sr_entry *entry;
>  	unsigned long idx;
> -	unsigned count = 0;
> +	unsigned int count = 0;
>  	const struct {
>  		struct xe_reg reg;
>  		bool skip;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 9fb5fd4391d2..c7992a8667e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -716,9 +716,8 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		ptr = xa_store(&ct->fence_lookup,
>  			       g2h_fence.seqno,
>  			       &g2h_fence, GFP_KERNEL);
> -		if (IS_ERR(ptr)) {
> +		if (IS_ERR(ptr))
>  			return PTR_ERR(ptr);
> -		}
>  
>  		goto retry_same_fence;
>  	} else if (unlikely(ret)) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index e215e8b2c17a..7515d7fbb723 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -140,16 +140,20 @@ struct guc_update_engine_policy {
>  
>  struct guc_policies {
>  	u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
> -	/* In micro seconds. How much time to allow before DPC processing is
> +	/*
> +	 * In micro seconds. How much time to allow before DPC processing is
>  	 * called back via interrupt (to prevent DPC queue drain starving).
> -	 * Typically 1000s of micro seconds (example only, not granularity). */
> +	 * Typically 1000s of micro seconds (example only, not granularity).
> +	 */
>  	u32 dpc_promote_time;
>  
>  	/* Must be set to take these new values. */
>  	u32 is_valid;
>  
> -	/* Max number of WIs to process per call. A large value may keep CS
> -	 * idle. */
> +	/*
> +	 * Max number of WIs to process per call. A large value may keep CS
> +	 * idle.
> +	 */
>  	u32 max_num_work_items;
>  
>  	u32 global_flags;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index efbc4b13e9e1..911d4965c27c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -329,7 +329,7 @@ static void __guc_engine_policy_add_##func(struct engine_policy *policy, \
>  					   u32 data) \
>  { \
>  	XE_BUG_ON(policy->count >= GUC_CONTEXT_POLICIES_KLV_NUM_IDS); \
> - \
> +\
>  	policy->h2g.klv[policy->count].kl = \
>  		FIELD_PREP(GUC_KLV_0_KEY, \
>  			   GUC_CONTEXT_POLICIES_KLV_ID_##id) | \
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index e0377083d1f2..373a65c77946 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -68,6 +68,7 @@ int xe_huc_auth(struct xe_huc *huc)
>  	struct xe_gt *gt = huc_to_gt(huc);
>  	struct xe_guc *guc = huc_to_guc(huc);
>  	int ret;
> +
>  	if (xe_uc_fw_is_disabled(&huc->fw))
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index b4ed1e4a3388..eae190cb0969 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -251,7 +251,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
>  }
>  
>  static void gt_irq_handler(struct xe_tile *tile,
> -			   u32 master_ctl, long unsigned int *intr_dw,
> +			   u32 master_ctl, unsigned long *intr_dw,
>  			   u32 *identity)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
> @@ -306,7 +306,7 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>  	struct xe_device *xe = arg;
>  	struct xe_tile *tile = xe_device_get_root_tile(xe);
>  	u32 master_ctl, gu_misc_iir;
> -	long unsigned int intr_dw[2];
> +	unsigned long intr_dw[2];
>  	u32 identity[32];
>  
>  	master_ctl = xelp_intr_disable(xe);
> @@ -365,7 +365,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  	struct xe_device *xe = arg;
>  	struct xe_tile *tile;
>  	u32 master_tile_ctl, master_ctl = 0, gu_misc_iir = 0;
> -	long unsigned int intr_dw[2];
> +	unsigned long intr_dw[2];
>  	u32 identity[32];
>  	u8 id;
>  
> @@ -513,11 +513,10 @@ static void xe_irq_postinstall(struct xe_device *xe)
>  
>  static irq_handler_t xe_irq_handler(struct xe_device *xe)
>  {
> -	if (GRAPHICS_VERx100(xe) >= 1210) {
> +	if (GRAPHICS_VERx100(xe) >= 1210)
>  		return dg1_irq_handler;
> -	} else {
> +	else
>  		return xelp_irq_handler;
> -	}
>  }
>  
>  static void irq_uninstall(struct drm_device *drm, void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index d5f782f8d2a6..b726599f6228 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -374,46 +374,46 @@ static const u8 dg2_rcs_offsets[] = {
>  };
>  
>  static const u8 mtl_rcs_offsets[] = {
> -       NOP(1),
> -       LRI(15, POSTED),
> -       REG16(0x244),
> -       REG(0x034),
> -       REG(0x030),
> -       REG(0x038),
> -       REG(0x03c),
> -       REG(0x168),
> -       REG(0x140),
> -       REG(0x110),
> -       REG(0x1c0),
> -       REG(0x1c4),
> -       REG(0x1c8),
> -       REG(0x180),
> -       REG16(0x2b4),
> -       REG(0x120),
> -       REG(0x124),
> -
> -       NOP(1),
> -       LRI(9, POSTED),
> -       REG16(0x3a8),
> -       REG16(0x28c),
> -       REG16(0x288),
> -       REG16(0x284),
> -       REG16(0x280),
> -       REG16(0x27c),
> -       REG16(0x278),
> -       REG16(0x274),
> -       REG16(0x270),
> -
> -       NOP(2),
> -       LRI(2, POSTED),
> -       REG16(0x5a8),
> -       REG16(0x5ac),
> -
> -       NOP(6),
> -       LRI(1, 0),
> -       REG(0x0c8),
> -
> -       END
> +	NOP(1),
> +	LRI(15, POSTED),
> +	REG16(0x244),
> +	REG(0x034),
> +	REG(0x030),
> +	REG(0x038),
> +	REG(0x03c),
> +	REG(0x168),
> +	REG(0x140),
> +	REG(0x110),
> +	REG(0x1c0),
> +	REG(0x1c4),
> +	REG(0x1c8),
> +	REG(0x180),
> +	REG16(0x2b4),
> +	REG(0x120),
> +	REG(0x124),
> +
> +	NOP(1),
> +	LRI(9, POSTED),
> +	REG16(0x3a8),
> +	REG16(0x28c),
> +	REG16(0x288),
> +	REG16(0x284),
> +	REG16(0x280),
> +	REG16(0x27c),
> +	REG16(0x278),
> +	REG16(0x274),
> +	REG16(0x270),
> +
> +	NOP(2),
> +	LRI(2, POSTED),
> +	REG16(0x5a8),
> +	REG16(0x5ac),
> +
> +	NOP(6),
> +	LRI(1, 0),
> +	REG(0x0c8),
> +
> +	END
>  };
>  
>  #undef END
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 47addcd3e78f..f17de52b51f9 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -511,7 +511,7 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  #define EMIT_COPY_DW 10
>  static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>  		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> -		      unsigned pitch)
> +		      unsigned int pitch)
>  {
>  	XE_BUG_ON(size / pitch > S16_MAX);
>  	XE_BUG_ON(pitch / 4 > S16_MAX);
> @@ -1012,6 +1012,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  
>  	do {
>  		u64 addr = ppgtt_ofs + ofs * 8;
> +
>  		chunk = min(update->qwords, 0x1ffU);
>  
>  		/* Ensure populatefn can do memset64 by aligning bb->cs */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 086fea4f2471..4b5e78e08b4c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -540,8 +540,8 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>  	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
>  
> -	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) && \
> -				  enable_display && \
> +	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> +				  enable_display &&
>  				  desc->has_display;
>  	/*
>  	 * All platforms have at least one primary GT.  Any platform with media
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 7ab70a83f88d..e3ab1d3a367f 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -58,6 +58,7 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>  			    bool atomic)
>  {
>  	int err;
> +
>  	lockdep_assert_held(&gt->pcode.lock);
>  
>  	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 70892f134718..ea6dd7d71b59 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -82,7 +82,7 @@ void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
>  {
>  	u32 val = entry->set_bits;
>  	const char *access_str = "(invalid)";
> -	unsigned range_bit = 2;
> +	unsigned int range_bit = 2;
>  	u32 range_start, range_end;
>  	bool deny;
>  
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index f2ba609712d3..2a6fdd284395 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -130,7 +130,6 @@ static inline void xe_res_first(struct ttm_resource *res,
>  	cur->node = NULL;
>  	cur->mem_type = XE_PL_TT;
>  	XE_WARN_ON(res && start + size > res->size);
> -	return;
>  }
>  
>  static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index fee71080bd31..2c4632259edd 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -81,7 +81,7 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  }
>  
>  struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
> -				  unsigned size)
> +				  unsigned int size)
>  {
>  	return drm_suballoc_new(&sa_manager->base, size, GFP_KERNEL, true, 0);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 23ea40b52c24..def19e64f2c1 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -147,9 +147,9 @@ struct fw_blobs_by_type {
>  		entry__,							\
>  	},
>  
> -XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,					\
> +XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>  		     fw_filename_mmp_ver, fw_filename_major_ver)
> -XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,					\
> +XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>  		     fw_filename_mmp_ver, fw_filename_no_ver)
>  
>  static struct xe_gt *
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 966e05d814c0..91f11dfe9460 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2166,16 +2166,20 @@ static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
>  	case XE_VM_BIND_OP_PREFETCH:
>  		vma = xe_vm_find_overlapping_vma(vm, addr, range);
>  		if (XE_IOCTL_DBG(xe, !vma))
> -			return -ENODATA;	/* Not an actual error, IOCTL
> -						   cleans up returns and 0 */
> +			return -ENODATA;	/*
> +						 * Not an actual error, IOCTL
> +						 * cleans up returns and 0
> +						 */
>  		if (XE_IOCTL_DBG(xe, (xe_vma_start(vma) != addr ||
>  				      xe_vma_end(vma) != addr + range) && !async))
>  			return -EINVAL;
>  		break;
>  	case XE_VM_BIND_OP_UNMAP_ALL:
>  		if (XE_IOCTL_DBG(xe, list_empty(&bo->ttm.base.gpuva.list)))
> -			return -ENODATA;	/* Not an actual error, IOCTL
> -						   cleans up returns and 0 */
> +			return -ENODATA;	/*
> +						 * Not an actual error, IOCTL
> +						 * cleans up returns and 0
> +						 */
>  		break;
>  	default:
>  		XE_BUG_ON("NOT POSSIBLE");
> diff --git a/drivers/gpu/drm/xe/xe_vm_doc.h b/drivers/gpu/drm/xe/xe_vm_doc.h
> index 5b6216964c45..b1b2dc4a6089 100644
> --- a/drivers/gpu/drm/xe/xe_vm_doc.h
> +++ b/drivers/gpu/drm/xe/xe_vm_doc.h
> @@ -428,8 +428,8 @@
>   * the list of userptrs mapped in the VM, the list of engines using this VM, and
>   * the array of external BOs mapped in the VM. When adding or removing any of the
>   * aforemented state from the VM should acquire this lock in write mode. The VM
> - * bind path also acquires this lock in write while while the exec / compute
> - * mode rebind worker acquire this lock in read mode.
> + * bind path also acquires this lock in write while the exec / compute mode
> + * rebind worker acquire this lock in read mode.
>   *
>   * VM dma-resv lock (vm->ttm.base.resv->lock) - WW lock. Protects VM dma-resv
>   * slots which is shared with any private BO in the VM. Expected to be acquired
> -- 
> 2.34.1
> 
