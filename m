Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9ECC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9381310E53A;
	Tue, 12 Dec 2023 00:41:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4525810E141
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702341698; x=1733877698;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aDpTR6lc3KXfRXfzHKzL2DRyi8Yv5j7FSByPZvRHnys=;
 b=aAhzlj08b+jmv40Os1zRDuKYCHPBC9bscA/eh4hip5S1IspepPjOrBq7
 CvUU9+lAG3gS2u6Coa92bPgNtJcxRjeBu98aBQCCDrztmawuQPlr5u93x
 51B5tXbcN/qkgV8UXrS2tnKjeCUYux13X1mEneBG9jzkoJmEgg8559kP0
 gcR+Mc/bQ8hx5QUBNdWY1VLb781LwNv/xrcy0hGF0VVEwpKRwpJM+MV1z
 6R2eqDaeJti1zyY5Gcitb5RyyucBZIXZD7tUE8ZktBKtmrE+rX5Zerra1
 IJ2fruoAEADeq0iTLNUC4kvaNvgihOkh/zKLxlMvUU7XFleb3+K1/t7Hx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374889612"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="374889612"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:41:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="14727094"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:41:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:41:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:41:37 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:41:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOX2eITPJUkacCG5kvUcvq67hFXL0DKd80Qb/8UKHpL7Y7S9lms+BzgtOW7E6cxR/q+7WHw4+PK2V3fBE1wYMu38GnvTOKG+T9nH6kCE+g5ff0pQU2Jz64NArUPz4iqfsWjWG8/1CdxHEIRFO4JU0pjZek3/HAfztX8EaEKbX707/T/vshFM4tOUa8wLiclXSwr+/jtA0mUgMFluT3PYCCXvz8YvtjnKcKUoOODpSnuX4NMBtPVhmPyC27oTl9gdNjZ8F4GTHRUU3oER5Wtzyu/xxD9O4r5ylmDapR5hLYPR47Py1Mi7q/MuA4GFmf0KbpVHPl3lqWTrOr8uRQu0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8On3UOWK+DRRh2Q2SnszUtCZ1cJgaPpfXMFKgAwHOw=;
 b=NlxX7+ZX3SgYwv9uYOKOBBKDY5nGMkHWVzunLkwwzYWZowlSyZgLfVyS5edlPNtNPWWICfQRfSlNzrPsWib5XejGjWNuYZ6i0+eqJbOipMdxiQDJMSa5Axw6CUC7K0trxAaCky4llFSrysF6xT7268iQsQrQdFh7EWtJ+mT9osc1X8lAtBLv5ZBIoj8vIAbT/FfJR7j9RdTw1OwyEPW6C0uuRFN1MbBTilGs/lnO0SAAI9V6yZzm1QFcJOhKVpao+Jnq+9aEVi0jQ/5xT9HBbHLTvGwd6/Sfv0BP2onRpTEJYIZx3Zt0NVs/CCHspWKfPtb9xGqN+5YlPUdlgw47lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4725.namprd11.prod.outlook.com (2603:10b6:208:263::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 00:41:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 00:41:35 +0000
Date: Mon, 11 Dec 2023 16:41:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v7 03/10] drm/xe/xe2: Allocate extra pages for ccs during
 bo create
Message-ID: <20231212004132.GD1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
 <20231211134356.1645973-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231211134356.1645973-4-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR01CA0064.prod.exchangelabs.com (2603:10b6:a03:94::41)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4725:EE_
X-MS-Office365-Filtering-Correlation-Id: f799bd04-e167-445d-a122-08dbfaab17a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g7uRwWhEt9qKNqCasF8mjskStPkP0XmuoPxij2lucoOM5lvyjwCFT2TCWXEpD57U9L4akUzXHXIcRlqSf6DbjTazNNGM6DO8N1MhISUyteKVZKbY64bppDTwW9+1ivqsNVFSFfziQxljJJ8fqBv7hYt6CQ/PnAUYJzkqtT5m8ZadQMkl6WpjW/HSttTPLqHjBkIyUL7jHOrOadct8GZNkz36v+a4aiRcjPwIQnMVga5sTkIViG1E6+oXK/jyU0aWVaRe0C6E0gJtkMYJNHdfC90fxCRc9hv9p+Sm3I73G3Vkn31keCdSBowhwexohYCKHInVTzkfwSEuvcV2zbGEtnrj8uF1nHCnK5krw1qPyCXmHYqppDNg1dC6gNk/3jpNGEMZTQuQ5cCeotAifLsLjmkBKOW2PImWZoxXT8G4uBsTGNbbwN/NAUXXq6El7nGELHKnpVYfRFuBb7qPOTWiBDN0Zd3xBT8QNznuZOH5fILxctPhCVqPKtKoTq4c7U31IHH2BbImQKsSO6RJLUYqj7C68Sg3zvRd6IaEdwEDu+7qgPWS3+AM0W1NJ5Te62td
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(136003)(366004)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2906002)(41300700001)(38100700002)(33656002)(86362001)(82960400001)(83380400001)(1076003)(26005)(478600001)(6486002)(6506007)(66574015)(6666004)(6512007)(4326008)(6862004)(5660300002)(316002)(6636002)(8936002)(66556008)(66476007)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?L/0zYwDzrViUFI122hmvFpgED6KJVj0AMlrMl2tnZzVfe6LrZkS1Yf7zAB?=
 =?iso-8859-1?Q?Ld86wGYiXYQZV31+pnrhPt9u/xEJ+qSPCPGvVuFwyXmX/mw0msvOjOyVQf?=
 =?iso-8859-1?Q?Xw9rpn/TRp6SNRkVxekiE66uPIzS/ISsfBE9JeRol3+sBQ/bGRqG3iREV8?=
 =?iso-8859-1?Q?Pd0+jS1BFoSV3hy6nOQtPo9qwx4eRrPdVDmAk4FgUlpdEJduz7RCyt1yLM?=
 =?iso-8859-1?Q?AVEcrdW7kVoSwysecmHm5MoHdtIrIpP4NutwcO5y8f7osYTrUJcIwlHvsL?=
 =?iso-8859-1?Q?wmc9Soi3b9Ce+mRQ6i6623zA4LQmtIqJrRNq9AGJsUuudgBWmm2RZ4lLls?=
 =?iso-8859-1?Q?tEhUoiWDwPxJR2/EmfSVQivkuSVMujmD9g2oSRk1AmR6dgzC968iAdpUsH?=
 =?iso-8859-1?Q?Cs75ToKttNRYETB396U99U4xLwnD3W3w/EivHjDUiME7JBXzakwcn7I2QR?=
 =?iso-8859-1?Q?xuWKw8Gh+oJ3LZrvjjIxOBY53+PXmFr+kKLx3/GTHZ1M+dg6bydpgap9Kf?=
 =?iso-8859-1?Q?JxewEv3OJmP3wj+VkFmtVu5YMykHaRhGJAjpQq7kEIO4VmrIRJbq+677q8?=
 =?iso-8859-1?Q?xISstWIsYLIYQVytRjaE0dIaT5mwBtcnLKRMIMnc9cKr8KZeFbFKS4/Jrs?=
 =?iso-8859-1?Q?h3xYFtyBqbgtIazr6qJrmVVuBUDX7YDcs1CvKG3porA2o8QlZUgDg2ui1k?=
 =?iso-8859-1?Q?sUkb071ceh5nX6iuubDGDVwzLzCyiFkVgqBw3l0gN7v4hmuBxK5xOw9b3X?=
 =?iso-8859-1?Q?Qp3XdaOCo0bhU4wHCC6JckgmxBUCC/bbtzjB2Fyz+iUOiEdvC/aiKPLbuw?=
 =?iso-8859-1?Q?DmNF42Td93dOxMC/KOXg7xfD4uYimgFsKA25T3gPT3sWOz8A0sX8dkcL73?=
 =?iso-8859-1?Q?gKhJkTv4j+0hw298P2ZL6S+oRKlhdwXvXtyINFnCwl+FufTvBzuh17VGEM?=
 =?iso-8859-1?Q?HmsbG6/gnJG44fE1XACXTUMQEUJnIPpIDTL0RIgUZe4KTmZxJhedZAn05W?=
 =?iso-8859-1?Q?cPDf+DDLp6KQFVN8E+dzIj3k+sda5h8ObzWsygzHdV+S5vqhunIAJk6mq6?=
 =?iso-8859-1?Q?9kFhiV/fnkOo/F/yG4x75Y/hWJjf7j/RYQLecR3KCKJHL2FbWnfiXVmp8X?=
 =?iso-8859-1?Q?cUCB4cRATos+ISGg17nWE75XLRr+a+TNe5Nlx2Ch0LjWaBQWlpLTtvAVG1?=
 =?iso-8859-1?Q?BYj2XN5ZBc5F2mIk/kCyNu0Us/Vv+cX+KaLtufPPHfbTD8cLURCTU3rySb?=
 =?iso-8859-1?Q?5WTWVWx1gBvIrZNyKb2sYcSfdK13/Ww6K/9V+0qsrqpoDDK3y3d6JvjNjP?=
 =?iso-8859-1?Q?bvIIfKgaapOH0MtEWDCNweyKrLRKx7qcXkudg17G4gWZf+kV1SBFLade8/?=
 =?iso-8859-1?Q?mI8Rlwb6cVGzNF780aB51ScNt0rDrY/kgPbme3kA8kRxYK8pMhfpTDIb7o?=
 =?iso-8859-1?Q?bqD5ALUGlDmoJl+YAW93BFQVvTJJlCYm+LDLe2FbZlYX6VUeRMmH33/SiO?=
 =?iso-8859-1?Q?eCeardcn8hKCGAmVpe+1I1eiuHwCdbbAaSJU7vsdmbjrNTMsFTzdmg7sq3?=
 =?iso-8859-1?Q?bSLz8Ng/fgIQ5VpKFMFMP0/uGPibcWTDAvD4PuQm0/uMzpPELahGXDEWhI?=
 =?iso-8859-1?Q?cY8ws71TTBZef0P7kLqudCH/00ggYOV0ppNrmVR3GJFUvXqI5lEGpXPw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f799bd04-e167-445d-a122-08dbfaab17a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:41:35.0224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JL1eSipXf5BsGY9mt7YYflCVDACt5/KzosPcRA3bMn9lTCut/DK6tzs4e9C/dgZh+CVLstjJJkOX2Pdx64UG2FFcRp/krLBUDxBdTkRwpzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
X-OriginatorOrg: intel.com
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

On Mon, Dec 11, 2023 at 07:13:49PM +0530, Himal Prasad Ghimiray wrote:
> Allocate extra pages to handle ccs region for igfx too.

I still think we need more explanation on this patch since this commit
message makes it sound like we're allocating the CCS region itself,
which isn't the case.  The CCS region is already pre-allocated at a
fixed location reserved by the BIOS.  My understanding is that every
location in physical system memory has a corresponding location in the
reserved region to hold its CCS data, regardless of whether that memory
is being used for "graphics" purposes or not, right?  So if a buffer was
staying in RAM forever, you'd never need any extra storage.  However if
the buffer can get swapped out to disk, that's when you need extra space
to hold an extra copy of the CCS data for swapout.

I'm still not super familiar with TTM details, but I _think_ that means
that a buffer in PL_SYSTEM (which isn't mapped into any GTT or being
touched by hardware) potentially needs the extra storage space because
the OS might wind up swapping it out to disk, whereas a buffer in PL_TT
wouldn't actually need any extra CCS storage since it can't be swapped
out [yet].  And I'm guessing it's simpler / more efficient to just
allocate the extra storage once up front rather than trying to just
allocate it when a buffer moves from PL_TT -> PL_SYSTEM?

> 
> Bspec:58796
> 
> v2:
>  - For dgfx ensure system bit is not set.
>  - Modify comments.(Thomas)
> 
> v3:
>  - Seperate out patch to modify main memory to ccs memory ratio.(Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7e25c8b7a01a..0df8f6a77040 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2183,8 +2183,8 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
>   * placed in system memory.
>   * @bo: The xe_bo
>   *
> - * If a bo has an allowable placement in XE_PL_TT memory, it can't use
> - * flat CCS compression, because the GPU then has no way to access the
> + * For dgfx if a bo has an allowable placement in XE_PL_TT memory, it can't
> + * use flat CCS compression, because the GPU then has no way to access the
>   * CCS metadata using relevant commands. For the opposite case, we need to
>   * allocate storage for the CCS metadata when the BO is not resident in
>   * VRAM memory.
> @@ -2193,9 +2193,13 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
>   */
>  bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>  {
> -	return bo->ttm.type == ttm_bo_type_device &&
> -		!(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
> -		(bo->flags & XE_BO_CREATE_VRAM_MASK);
> +	struct xe_device *xe = xe_bo_device(bo);
> +
> +	return (xe_device_has_flat_ccs(xe) &&
> +		bo->ttm.type == ttm_bo_type_device &&
> +		((IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_VRAM_MASK) &&
> +		  !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)) ||
> +		(!IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_SYSTEM_BIT))));

On an IGPU platform, is there ever a case where XE_BO_CREATE_SYSTEM_BIT
isn't set?  For that matter, is there ever a case on igpu where
compression is supported by the device and we _don't_ need the extra
storage to hold the CCS data during swapout?

In general, this function might be easier to read if the condition was
broken up.  E.g.,

        if (!xe_device_has_flat_ccs(xe))
                return false;

        /*
         * On discrete GPUs, if the GPU can access this buffer from
         * system memory (i.e., it allows XE_PL_TT placement), FlatCCS
         * can't be used since there's no CCS storage associated with
         * non-VRAM addresses.
         */
        if ((IS_DGFX(xe) && bo->flags & XE_BO_CREATE_SYSTEM_BIT))
                return false;

        /*
         * ...any cases where extra pages aren't needed on igpu?...
         */
        if (!IS_DGFX && ...)
                return false;

        return true;


Matt

>  }
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
