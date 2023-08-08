Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D6DC001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 18:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A6110E3EE;
	Tue,  8 Aug 2023 18:41:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C46410E3EE
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 18:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691520090; x=1723056090;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s9wR0frCmkNqq+IZID8EFDW/nSEqDPIPBqAvblNpYAg=;
 b=QrheONLhUEfQ39H1gE19R8rPyOI4PRc3OtsMiqvhRx46q1QwE9B1i5kD
 i8woxM43nRhQMQuyA7nefu6fuSVdBB0zb6hEDNd5bpmKl2CzdNGu7YEQP
 THGy0PdmDHOAUVNDMVzmOCX3p3jaHOvw+pz0QFEzyGUsSiOjqV9RMqEme
 edEbQgQvncJgj3IeodQYO4SdEQBPU8cUiR3KnXlvmB1BOkXMUu5utpg23
 WXDXPygPJAFa2itv7vCCf8JMNiskyqKEIagd4a8vH8j7KPnBatCV0lO6x
 zGA7xMKou5QLOEkcrYTcSG9Xp41WyOxTwkGaSDiUqhxTsu21Eogo4XiB9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370911994"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="370911994"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734675079"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="734675079"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 08 Aug 2023 11:41:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 11:41:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 11:41:28 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 11:41:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfU0P1h2NTKEaC4jREXVf4q3yThxeHhstXy8YzZS/Vrsq1m7FmMCl9lfpPl8XEw0pa5k6tJj6SNq//fc6NJ0ZKW165084OtNbNNw46+mTuZJoJb0JbH4yQZWUUgT64FU+LMMS6e791KaZ0eXVgR2Vn+qakYIz5gmm7iopQx+5xE+avwxFC+zhKs8/+9u+rc7roBpQXKZi/vdyBabn+m/NIjNod5NFlQ/BXuJUlWtpgtq7fPxNjUftqGuGSll8gmDq/qfshZH4fgS7++TohqXXvqTaPw7tyJDqZzgySp9giFAAOvcITGVghV9tw+BIFDyRGof7d92DwcpLDDsSr4SdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdNuySnldEjcG5AzJut5fHM6gJ3YgbNwQw+UlchVv2k=;
 b=WhSzPKPmxcyhu0H2aB9hc1AubI73lbsgOTRXVUFKv18TPr4f4ZxvG+srT21WjAuV0zAMG0PwoDmVIF8HIep7v/UlJXndqSZT6rURgBA0SIcPJ4ItdoRHhtbH2vHENlpqqPnS7K45NY5L+UbKb+kx7JWwnF5USVY04cgfhaIAp3GTTDyvOA1RjRpsSm9sQKGkLRL9IH/UH4ZLdk7yQ4F8ANCaGIDMBG2KwnK8kCLrYAKL9u8eYF8dIsBegFwaznI4/kr2avN2zBwc9F7KNuFCWfhpfwwQNCc6NWtPjI0EuSNWufC0MTJsiiiPqP+EuwjWtky/rkwiDRCGyb1i78j6qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7803.namprd11.prod.outlook.com (2603:10b6:8:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 18:41:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 18:41:22 +0000
Date: Tue, 8 Aug 2023 14:41:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: David Kershner <david.kershner@intel.com>
Message-ID: <ZNKMTafssmkcdfg3@intel.com>
References: <20230808164534.1027552-1-david.kershner@intel.com>
 <20230808164534.1027552-4-david.kershner@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230808164534.1027552-4-david.kershner@intel.com>
X-ClientProxiedBy: BYAPR01CA0068.prod.exchangelabs.com (2603:10b6:a03:94::45)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2b91d7-2f65-4fdc-45ee-08db983f1014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Milh/xUvuiirulsfyob25VtRYShuKa2d6mHs2cDvHOcHm77OdRoCIATYNjmc0R0Y4dNlqA8SZ9yb4dNObqkoITA8xr122tgrWoDzHPUxPkpD38Y24sp+kQ9KXnOt4rJqRNJJLBU9gd4vePt8cO5T6gZSV3nSHrN9sNAbWTHdepgu2x75V4SLF1KvZhIAnaHH1REN5mj80ofuUZ4cH5unAdEmJ7268VkJb7Gg3fca0wSK/5PVjsNvUUPuoPcsNW3H5b65ULrK2sBLlV1M2hbYO9nvsc9bJovdD2ayTR5fVeFjit7dhwV40pBlcXsWRenlsG9xPWyziQjCz0sDbqLU6pNeA/PPpas/OFtSC0U9BV6bHCaJhebW217/tRP5XSvJ/lP/bWv7dDYlxZVWaLRegFt11jfgShGBxac8AVqnWp42eo9rSIby25A1fRSS7AmUrDhIft9NDmhNku+C8Pj3C34Tr388XstBQMaGUJ7NTihpNz4Fnb3ODn47V6QiYmqo7A/6cFGNUsjesCJatpCmZ38JNc+4msYTCvcTFPbyxza/eWrmUeHcgX/1WvKX82ut0GUfw4r4pyZbPZLP6RelENColjj1uWONOI7cS+LZ5lk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(6029001)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(186006)(1800799003)(83380400001)(66899021)(2616005)(38100700002)(4326008)(37006003)(6636002)(30864003)(8676002)(2906002)(44832011)(6862004)(316002)(5660300002)(8936002)(66946007)(66476007)(41300700001)(66556008)(86362001)(6512007)(478600001)(6666004)(82960400001)(6486002)(6506007)(107886003)(26005)(36756003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bKnwKWlN5DR8zHMQ1QRM+/2GrsVT0jJ4igPK6Pf1HPTOGbrA0sOBgBYdn+Hr?=
 =?us-ascii?Q?hzIwAoG08x2uHu/9SYiMnyJNZ8vNyBm6unatZvS/UzJooDxI+nnP029FKNOJ?=
 =?us-ascii?Q?PBEO1g5wkq8kW8MO4i/ly6jMqqLume1vrewcldJogbIHg/ojyia/NOjgrjAI?=
 =?us-ascii?Q?MwtuT7ZY3r7sBFOclyeNxO6Gi1DzCd/Md8TKopPXAj/nFcMvGV0MAtOVWx4X?=
 =?us-ascii?Q?XU6G0Gk/H/sNL8esQEt2znebYCXnAQK/zM7kR1AGAsHVHJlc+OGWUXQSYuOW?=
 =?us-ascii?Q?vcCL8rilDQZvy7HQpoRi7RNVdM4VhB+VR5noNYU6dCIcP+gBZm1M6bbtMRbS?=
 =?us-ascii?Q?w0uIhzuo3tQlxgAM/37JXHIIpWs1ynnFFpgsNZWTQ3XLX/x1yhBopQm392cW?=
 =?us-ascii?Q?/zMyQ0qkNLi55OMoRXEzTEFN7VyWV16FEqofIXLFGZvyX99BwRZQcoEx2l7A?=
 =?us-ascii?Q?Sg00sb6qFNH3Ppu9Cd+qQI58aBRqYsnvKEszri7s5msvI79ZG1iA0cLWDRUm?=
 =?us-ascii?Q?ULA0WKJNCItk9EwRA/EfwPMDR7Ww2nq70s105empeLzTRWOuew5VTFwdbOQy?=
 =?us-ascii?Q?/3uih5uFGz0as3hQ4X1DLxwESp0sdDRkSXUIpNDo7XIw1TA2C0jXV7nDYw8Y?=
 =?us-ascii?Q?f8ajPfE1YQcZnQT6yn+WzhkWHQD6PGSdPRQQVSgywYd+V2S5UYayptSWU3bg?=
 =?us-ascii?Q?AMRmY7l3cHbKRyQA2XFxOQtgBypDhM7YLa2xotpCZaW5PVEDxrQZMANnGgH0?=
 =?us-ascii?Q?Hr7n00ozhTN7UPbdWJD72+BZlsW9nCrPArVt8BRQxvpQchUG7ZHF3515uN0Y?=
 =?us-ascii?Q?Lmah+vxh+6sT5PvvasF9PBNQWurkod/VbL6rcYFP002Jf52NhYtFSux9TYY4?=
 =?us-ascii?Q?LT68AqTr9d/RXYb8vB36yQ6iau9YuIxsKLVrzPyJgkeByOQHyRN4Vd6+xrpM?=
 =?us-ascii?Q?m0C0g2LipFTpPdMA4Ny9csKB0NQQmdxoANrNUm4zfyVpoUZS691TAu0GSXkL?=
 =?us-ascii?Q?EIeXRmrC3hCbNIOkZjMxTht4XhuhDf/gDPfwa1l2Sd9ZySPGwZwJscnh6WSz?=
 =?us-ascii?Q?nDlRziBu0o7JOGxqZUD92hr9VJpJ0pfVhmKSaNFMakuL9dyZ7Ej8GBxJOAzl?=
 =?us-ascii?Q?FPOd4yJAtp/VVVQnQhb3SbNDj8Qs/GxdVLxtSItRnFzH015rSqku5Jk1lNWO?=
 =?us-ascii?Q?wDgYdzMLcaE+csRhIb+y9be3axdAkQSGbUUTDV/8wiACu+cCsjttthlUqj6p?=
 =?us-ascii?Q?zLysOktiL40/U2OLqKWxTLtXk5ASfxcCt9uWV8woEKxIWbPkHSuxITjXTci/?=
 =?us-ascii?Q?ZrMlVLstWan2p365k4lPqq8GaQPlctG+k6uG2kN2TCxhffQlFlRY9nbp4oi9?=
 =?us-ascii?Q?JC5jDkzQ1K2rDM5R8hd2diaY4j05wxVuk4IgQk/K3jI1sLevCu+1PQSsMxpg?=
 =?us-ascii?Q?rYkVXzlX7zeSc6r/did85i71LnhGBGXbGCrgtFA4eUmHdqhoSFp3urayVNNA?=
 =?us-ascii?Q?bWs1BpH2MIW9YLlZfn/pG6ceGxz4PFKuZzxkAq+X9gHRURJgfU+aj4seoI7i?=
 =?us-ascii?Q?T/wKnatG0LRFS9cxHeiTT89JiI4xSjrC6QXOfAF4LFteLAuO5nUB1Ii2v2CV?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2b91d7-2f65-4fdc-45ee-08db983f1014
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 18:41:22.7197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cklpgyQeuM0S5KReKa+RmC5OOcvhywFQaRp2+5m0uKcyiJPA3hkQwIuu1vMEBCilX4SuWMrdQ0h/TFk1LWgMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7803
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Teach i915 how to use objects
 with XeLink connectivity
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
Cc: lucas.demarchi@intel.com, john.fleck@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 12:45:34PM -0400, David Kershner wrote:
> The XeLink device offers fabric backed memory.  Page table entries
> need to be aware of this fact so that the access occur over the
> fabric rather than to the system or local device memory.
> 
> Objects are shared via dma-buf, and then fabric connectivity is
> checked during the _get_pages() pass.
> 
> Objects do NOT need to be dma mapped because system dma does not
> occur.
> 
> The Device Physical Address (DPA) is the memory range assigned
> to the fabric device at driver init.  This address is what will
> need to be programmed into the page table entry.  In addition
> the PTE_LM bit needs to be set.
> 
> Address information is provided in a scatter/gather table.
> 
> Teach the dma-buf interface and the page table entries all about
> fabric backed memory.
> 
> Signed-off-by: David Kershner <david.kershner@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c      |  47 ++++++++-
>  drivers/gpu/drm/xe/xe_bo.h      |   2 +
>  drivers/gpu/drm/xe/xe_dma_buf.c | 162 +++++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_dma_buf.h |   3 +
>  drivers/gpu/drm/xe/xe_pt.c      |   7 +-
>  drivers/gpu/drm/xe/xe_xelink.c  |  12 +++
>  drivers/gpu/drm/xe/xe_xelink.h  |   2 +
>  7 files changed, 186 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 284c86107a5f..f48e917b3e28 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -8,6 +8,7 @@
>  #include <linux/dma-buf.h>
>  
>  #include <drm/drm_drv.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_gem_ttm_helper.h>
>  #include <drm/ttm/ttm_device.h>
>  #include <drm/ttm/ttm_placement.h>
> @@ -524,6 +525,32 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  	return ret;
>  }
>  
> +/**
> + * map_xelink_connectivity - check for XeLink and create a mappable sgt
> + * if available
> + * @bo: object to check XeLink connectivity
> + *
> + * Returns sgt or -errno on error, -EIO indicates no XeLink connectivity.
> + */
> +static struct sg_table *map_xelink_connectivity(struct xe_bo *bo)
> +{
> +	struct dma_buf_attachment *attach = bo->ttm.base.import_attach;
> +	struct xe_bo *import;
> +
> +	if (!(bo->flags & XE_BO_XELINK_AVAIL))
> +		return ERR_PTR(-EIO);
> +
> +	import = gem_to_xe_bo(attach->dmabuf->priv);
> +
> +	/* Make sure the object didn't migrate */
> +	if (!xe_bo_is_vram(import)) {
> +		bo->flags &= ~XE_BO_XELINK_AVAIL;
> +		return ERR_PTR(-EIO);
> +	}
> +
> +	return xe_dma_buf_map(attach, DMA_NONE);
> +}
> +
>  /*
>   * The dma-buf map_attachment() / unmap_attachment() is hooked up here.
>   * Note that unmapping the attachment is deferred to the next
> @@ -540,6 +567,7 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
>  	struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
>  					       ttm);
>  	struct sg_table *sg;
> +	struct xe_bo *bo;
>  
>  	XE_WARN_ON(!attach);
>  	XE_WARN_ON(!ttm_bo->ttm);
> @@ -547,12 +575,27 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
>  	if (new_res->mem_type == XE_PL_SYSTEM)
>  		goto out;
>  
> +	bo = ttm_to_xe_bo(ttm_bo);
>  	if (ttm_bo->sg) {
> -		dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
> +		if (bo->flags & XE_BO_XELINK_AVAIL) {
> +			struct xe_bo *export;
> +			//export = dma_buf_to_obj(attach->dmabuf);

please no!

> +			export = gem_to_xe_bo(attach->dmabuf->priv);
> +			xe_xelink_mapping_put(to_xe_device(export->ttm.base.dev)); // don't do?

if in doubt we should do something like:

			/* XXX: Don't do? */
			xe_xelink_mapping_put(to_xe_device(export->ttm.base.dev));

but let's not use // comments....

> +			xe_xelink_mapping_put(to_xe_device(ttm_bo->base.dev)); // don't do?
> +			sg_free_table(ttm_bo->sg);
> +			kfree(ttm_bo->sg);
> +		} else {
> +			dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
> +		}
>  		ttm_bo->sg = NULL;
>  	}
>  
> -	sg = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +	sg = map_xelink_connectivity(bo);
> +
> +	if (IS_ERR(sg) && PTR_ERR(sg) == -EIO)
> +		sg = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +
>  	if (IS_ERR(sg))
>  		return PTR_ERR(sg);
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 0823dda0f31b..d7bf00c52c29 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -33,6 +33,8 @@
>  #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
>  #define XE_BO_PAGETABLE			BIT(12)
>  #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
> +#define XE_BO_XELINK_AVAIL		BIT(14)
> +
>  /* this one is trigger internally only */
>  #define XE_BO_INTERNAL_TEST		BIT(30)
>  #define XE_BO_INTERNAL_64K		BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 975dee1f770f..e511b09b8556 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -11,6 +11,7 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_prime.h>
> +#include <drm/intel_xelink_platform.h>
>  #include <drm/ttm/ttm_tt.h>
>  
>  #include "tests/xe_test.h"
> @@ -21,21 +22,6 @@
>  
>  MODULE_IMPORT_NS(DMA_BUF);
>  
> -static int xe_dma_buf_attach(struct dma_buf *dmabuf,
> -			     struct dma_buf_attachment *attach)
> -{
> -	struct drm_gem_object *obj = attach->dmabuf->priv;
> -
> -	if (attach->peer2peer &&
> -	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
> -		attach->peer2peer = false;
> -
> -	if (!attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
> -		return -EOPNOTSUPP;
> -
> -	xe_device_mem_access_get(to_xe_device(obj->dev));
> -	return 0;
> -}
>  
>  static void xe_dma_buf_detach(struct dma_buf *dmabuf,
>  			      struct dma_buf_attachment *attach)
> @@ -68,8 +54,8 @@ static void xe_dma_buf_unpin(struct dma_buf_attachment *attach)
>  	xe_bo_unpin_external(bo);
>  }
>  
> -static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
> -				       enum dma_data_direction dir)
> +struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
> +				enum dma_data_direction dir)
>  {
>  	struct dma_buf *dma_buf = attach->dmabuf;
>  	struct drm_gem_object *obj = dma_buf->priv;
> @@ -160,34 +146,6 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  	return 0;
>  }
>  
> -const struct dma_buf_ops xe_dmabuf_ops = {
> -	.attach = xe_dma_buf_attach,
> -	.detach = xe_dma_buf_detach,
> -	.pin = xe_dma_buf_pin,
> -	.unpin = xe_dma_buf_unpin,
> -	.map_dma_buf = xe_dma_buf_map,
> -	.unmap_dma_buf = xe_dma_buf_unmap,
> -	.release = drm_gem_dmabuf_release,
> -	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
> -	.mmap = drm_gem_dmabuf_mmap,
> -	.vmap = drm_gem_dmabuf_vmap,
> -	.vunmap = drm_gem_dmabuf_vunmap,
> -};
> -
> -struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
> -{
> -	struct xe_bo *bo = gem_to_xe_bo(obj);
> -	struct dma_buf *buf;
> -
> -	if (bo->vm)
> -		return ERR_PTR(-EPERM);
> -
> -	buf = drm_gem_prime_export(obj, flags);
> -	if (!IS_ERR(buf))
> -		buf->ops = &xe_dmabuf_ops;
> -
> -	return buf;
> -}
>  
>  static struct drm_gem_object *
>  xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
> @@ -240,6 +198,120 @@ struct dma_buf_test_params {
>  	container_of(_priv, struct dma_buf_test_params, base)
>  #endif
>  
> +static int xe_dma_buf_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach);
> +
> +const struct dma_buf_ops xe_dmabuf_ops = {
> +	.attach = xe_dma_buf_attach,
> +	.detach = xe_dma_buf_detach,
> +	.pin = xe_dma_buf_pin,
> +	.unpin = xe_dma_buf_unpin,
> +	.map_dma_buf = xe_dma_buf_map,
> +	.unmap_dma_buf = xe_dma_buf_unmap,
> +	.release = drm_gem_dmabuf_release,
> +	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
> +	.mmap = drm_gem_dmabuf_mmap,
> +	.vmap = drm_gem_dmabuf_vmap,
> +	.vunmap = drm_gem_dmabuf_vunmap,
> +};
> +
> +/*
> + * update_xelink - check for XeLink connectivity if available
> + * @obj: object to check XeLink connectivity
> + *
> + * If the imported object is a i915 dma-buf, and LMEM based, query to see if
> + * there is a XeLink, and if the XeLink is connected set the XeLink bit.
> + *
> + * 0 no connectivity, use P2P if available
> + * 1 XeLink is available
> + * -1 XeLink only is requested, and there is no XeLink
> + *
> + */
> +static int update_xelink(struct dma_buf *dma_buf, struct xe_bo *bo)
> +{
> +	struct xe_bo *import;
> +	struct xe_device *src;
> +	struct xe_device *dst;
> +	struct query_info *qi;
> +	int connected;
> +	int i;
> +	int n;
> +
> +	/* Verify that both sides are xe devices */
> +	if (dma_buf->ops != &xe_dmabuf_ops ||
> +	    !bo || bo->ttm.base.import_attach->importer_ops != &xe_dma_buf_attach_ops)
> +		return 0;
> +
> +	import = gem_to_xe_bo(dma_buf->priv);
> +	if (!xe_bo_is_vram(import))
> +		return 0;
> +
> +	src = xe_bo_device(bo);
> +	dst = xe_bo_device(import);
> +
> +	qi = src->intel_xelink.ops->connectivity_query(src->intel_xelink.handle,
> +						       dst->intel_xelink.xelink_id);
> +	if (IS_ERR(qi))
> +		return 0;
> +
> +	/*
> +	 * Examine the query information.  A zero bandwidth link indicates we
> +	 * are NOT connected.
> +	 */
> +	connected = 1;
> +	for (i = 0, n = qi->src_cnt * qi->dst_cnt; i < n && connected; i++)
> +		if (!qi->sd2sd[i].bandwidth)
> +			connected = 0;
> +
> +	/* we are responsible for freeing qi */
> +	kfree(qi);
> +
> +	if (connected) {
> +		if (xe_xelink_mapping_get(src))
> +			return 0;
> +		if (xe_xelink_mapping_get(dst)) {
> +			xe_xelink_mapping_put(src);
> +			return 0;
> +		}
> +		bo->flags |= XE_BO_XELINK_AVAIL;
> +	}
> +
> +	return connected;
> +}
> +
> +static int xe_dma_buf_attach(struct dma_buf *dmabuf,
> +			     struct dma_buf_attachment *attach)
> +{
> +	struct drm_gem_object *obj = attach->dmabuf->priv;
> +	int xelink;
> +
> +	xelink = update_xelink(dmabuf, attach->importer_priv);
> +
> +	if (attach->peer2peer &&
> +	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
> +		attach->peer2peer = false;
> +
> +	if (!xelink && !attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
> +		return -EOPNOTSUPP;
> +
> +	xe_device_mem_access_get(to_xe_device(obj->dev));
> +	return 0;
> +}
> +
> +struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
> +{
> +	struct xe_bo *bo = gem_to_xe_bo(obj);
> +	struct dma_buf *buf;
> +
> +	if (bo->vm)
> +		return ERR_PTR(-EPERM);
> +
> +	buf = drm_gem_prime_export(obj, flags);
> +	if (!IS_ERR(buf))
> +		buf->ops = &xe_dmabuf_ops;
> +
> +	return buf;
> +}
> +
>  struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  					   struct dma_buf *dma_buf)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.h b/drivers/gpu/drm/xe/xe_dma_buf.h
> index 861dd28a862c..36771a50451e 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.h
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.h
> @@ -7,9 +7,12 @@
>  #define _XE_DMA_BUF_H_
>  
>  #include <drm/drm_gem.h>
> +#include <linux/dma-direction.h>
>  
>  struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags);
>  struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  					   struct dma_buf *dma_buf);
> +struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
> +				enum dma_data_direction dir);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5709518e314b..2c8698216581 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -130,6 +130,10 @@ u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>  		pte |= XE_PPGTT_PTE_DM;
>  
> +/* DAK */
> +	if (xe_bo_is_vram(bo) || bo->flags & XE_BO_XELINK_AVAIL)
> +		pte |= XE_PPGTT_PTE_DM;
> +
>  	return __pte_encode(pte, cache, NULL, pt_level);
>  }
>  
> @@ -144,8 +148,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  	if (level == 0) {
>  		u64 empty = xe_pte_encode(vm->scratch_bo[id], 0,
>  					  XE_CACHE_WB, 0);
> -
> -		return empty;
> +return empty;
>  	} else {
>  		return xe_pde_encode(vm->scratch_pt[id][level - 1]->bo, 0,
>  				     XE_CACHE_WB);
> diff --git a/drivers/gpu/drm/xe/xe_xelink.c b/drivers/gpu/drm/xe/xe_xelink.c
> index ac4cff76f81d..00bebad1c899 100644
> --- a/drivers/gpu/drm/xe/xe_xelink.c
> +++ b/drivers/gpu/drm/xe/xe_xelink.c
> @@ -462,3 +462,15 @@ void xe_xelink_remove(struct xe_device *xe)
>  
>  	xe->intel_xelink.ops = &default_ops;
>  }
> +
> +int xe_xelink_mapping_get(struct xe_device *xe)
> +{
> +	return xe->intel_xelink.ops->parent_event(xe->intel_xelink.handle,
> +					       XELINK_PARENT_MAPPING_GET);
> +}
> +
> +int xe_xelink_mapping_put(struct xe_device *xe)
> +{
> +	return xe->intel_xelink.ops->parent_event(xe->intel_xelink.handle,
> +					       XELINK_PARENT_MAPPING_PUT);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_xelink.h b/drivers/gpu/drm/xe/xe_xelink.h
> index e17faacc7b1c..12feb5b04d23 100644
> --- a/drivers/gpu/drm/xe/xe_xelink.h
> +++ b/drivers/gpu/drm/xe/xe_xelink.h
> @@ -31,6 +31,8 @@ void xe_xelink_init_early(struct xe_device *xe);
>  void xe_xelink_init_mmio(struct xe_device *xe);
>  void xe_xelink_init(struct xe_device *xe);
>  void xe_xelink_init_aux(struct xe_device *xe);
> +int xe_xelink_mapping_get(struct xe_device *xe);
> +int xe_xelink_mapping_put(struct xe_device *xe);
>  void xe_xelink_remove(struct xe_device *xe);
>  
>  #endif
> -- 
> 2.35.1
> 
