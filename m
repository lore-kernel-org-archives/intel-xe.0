Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF002C10DC1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 23:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9018710E109;
	Wed,  6 Dec 2023 23:22:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0FA10E109
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 23:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701904970; x=1733440970;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8L7l7d814Jlc492hNqw4niyzKKxJxKB0jw6BnRiT+eE=;
 b=lu7c7rPbyh70jOPeVbQmuFBevNxYMSQr7fHLtf85AHdF+y5iNxo573WJ
 7zmLgIn5qsmHrN/8GN/wDwBJa2bhBPlSJ2Di5iJi29foibUyc85ot2dt0
 gXwFb4eTnuSLLvfV369WYSHWNMuEXbA417IAkYJuhA+H3vvnSKxCiBhf2
 oklFR/rNjQFmz9SgjGa0mJ7eLwPhbUiKRAGpgyCgzhOzG4ZAwTLXDa5rP
 xTsdIa1c5Ok+AJcy636c9v/am38/lx8TmwN/WMnWBtvBwjj0I33tokDAx
 X4Iz3cyQ6LvBTKDNJ62ghAGVMv2UtjPleeAvaSrteH2ehlbQ6uqR1L9Qc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="393874679"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="393874679"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 15:22:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842013120"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="842013120"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 15:22:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 15:22:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 15:22:49 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 15:22:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6aBDcC+4Lq/itMqNTmjHnnVxYGpWAkc/7dEbxVYTci4BWqf/dij8Mgh0cOt7t0eSo+gVqaJ8Rg70twCuvvMpV3N16t3dJGWcnPmkm8ZTMJ5lDM2ji9BycQO//8X4Qmcey2RNI4MncE3x+PYsCLL270tQ/tBmBLVTYYTe+MXwNpJ42Iko7/Rwlw2ceu6K3It8loOTY4deS2qHxVY/6xmVCu/+bUaVaYqpQjiqSYbguX424ZgrGHZFSk/T4NXZY8rIKCGocPrTRdqfcrxkpGTd4apYHugVC6rBceDuFm3qm/VvdCZPqnLQkGZyOqokrcKIjoPjfMCW80bE5xD5hi/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGhQtsGBeLxYalT1z/e31W2RQmxRet1SDKvndwTqrZY=;
 b=b2L4BPZ8n9n0Wm3Rj7X5yXo/5N/pAQQUEWiXsrHIvG9dM6/OSrRlvUpWPV5ULU7RlC5rFz0v3QSJLcfzabw13xnq+RaRXKne7thOwA6r/hguHRkYCUGTMMo9UZ2FF77yDdDkbv9TKrSjsiAwwhy5ongmoHtX9u7AwGWxUIjcurO80VeQOzez7FM4QcE374ZiygGzlJdK9mIWEDT31T4I/UkdjM/+Rrp1Jb6QgFRuH0oM8opzR8t07baHNlw5oMWgUO12YOFJFlVFqJP07hKHOAKbGivv2T07IEZXKea4djwxtQVaMTjQWDj/txBvN7W8jzvegL/ZlcsWhEivjot21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5673.namprd11.prod.outlook.com (2603:10b6:510:d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 23:22:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 23:22:45 +0000
Date: Wed, 6 Dec 2023 15:22:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20231206232242.GR1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206043126.984049-4-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: a16c01d6-b62e-4d81-5160-08dbf6b24034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a6K72fApLtwqXL5lknkTzPeYiMGdgUyqYpm/XGSbXFwocWj2gPlbNj3tLzVbok3+4NSAkPmmRMxFea9QewkQKlBjur9jUCaru8LOLb/9kLS+brFvGPKIHRv/JNHcmJ5YuG28PwhNOGK0IdWNfERIpmlDnj+ACG7cpkuW9KFz+07EdH0BNej6bIoypGLGK/ld6Yh8jDOZ5cI0ERAOmX5andbGtZE4oq3IPfmHquGdX7TyLW06ESFNbbbYC/1MDFH6HK5/acRfts4u0whVUZenCopQFkOtoJx62iW+/iRpCTGJTAY+Jf7cOV55e8QwCP5QA3lVe4+4wZHD1A6HbtjeyCk9odbafWwsT1HbGLRL+DfZc9v/c8HHP3qNT28ZUkorXXHJN0X0T5TcBTSDbCzWEoUzxSzLPI/apwfpeLxyJX2P7q/SPreCuFBVv7RimTeZPYgQrXVC2e9zXHmx+XiTMKRvQHcJpGHwLUBv5dibOZNKULThv7qckV5NLxBjsNqxqBHAY4K3K/xoQNBEX7XESuTvRIF5QmjqY74dmCFP9WbYVkfMFQq0NSsR3v1CEFii
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8936002)(6862004)(8676002)(4326008)(83380400001)(38100700002)(41300700001)(33656002)(82960400001)(2906002)(86362001)(5660300002)(6666004)(1076003)(26005)(6512007)(6486002)(478600001)(6506007)(66946007)(66556008)(66476007)(316002)(6636002)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bc0fXlcaNDPVqeMcPiDrphqJSm9Req0htHJPIN3WGs3+UGkrTQE2oo8u9r?=
 =?iso-8859-1?Q?H9GNnmRYoAX/oj3fnVE9GIyVNge6aOD1OeyNGiLwtHyDuhrEgiLQz+/YhV?=
 =?iso-8859-1?Q?k+Mo3z2E7zMClGT09Qq6bI8EXDmGj1SrzUO04gDksxavJJNC9rBE4DNuxE?=
 =?iso-8859-1?Q?uyhIbwFOitse87KHc/f8KgeOvqmL1I3aaLpxy7qsT2PsoYV5p3QHEWAVWh?=
 =?iso-8859-1?Q?ZwlQxwZiWrl1pGClxt1M+FBxyStmEUUH2MZjIItuPqYegb6OLb9dodZ5mx?=
 =?iso-8859-1?Q?lmRlvVMlyunqa6ISMsAlvOqUA2KtFj9irNrRRbhf0/zlPNkB2O4ZRRUmBe?=
 =?iso-8859-1?Q?6F3SyiXrgc8oTnOx4rbazO4uaug/J9uQ7NPFL3kx/Hwxv3Vp4ypdUc9pFp?=
 =?iso-8859-1?Q?skHKJQPaIbk2k4w3WFC5y9GkylOjG48eAHcuQujIdkUMJ1AdmyCcZyAzQ6?=
 =?iso-8859-1?Q?jgQ+SGHJolAAekaJHwIebfLb4IrBc/RKwO5wnEDy4RL3sSTE7Xk5t/DgkS?=
 =?iso-8859-1?Q?ub3BECbTSGGh5CHXOWepE/mcUGCCzHMgDfrxfEQyvBba4keShpoYXuN6aK?=
 =?iso-8859-1?Q?n77SeWaf2aASZaUOD48prOOwqJ2XSej0/F6YvaH5BLx7T6Sm+L8gS2VoKS?=
 =?iso-8859-1?Q?LtMjFHhsSQMRteFRlx+F5S5Sy1jXqN8f7RWKgFRy4g4y/Gz9d0PMsIKDKW?=
 =?iso-8859-1?Q?QNwKuXGhOf9JWhdp+yeebWOZv4qLo7AZCznPpeB53iTCk4/OLIcVCLJDYu?=
 =?iso-8859-1?Q?CqsEWOWuZ8HC+r15zmuw89wyvbpvBc+X4zLGQBYMNLZMpn+LRueagbGcd/?=
 =?iso-8859-1?Q?oXpMgt2MYW8/vpPxUx8UuWnOXzPTo0frDtSxOXZOS9d8Tb6HEeYEF4m0Kp?=
 =?iso-8859-1?Q?Q6tN5pxjeTQYf+xesnw3IpVsZQJqZrWj/xbbxHP4G+fikUSv4a/Xn5l+Zt?=
 =?iso-8859-1?Q?AC1KmdhcMk7eBGgllequVKnS9GQS+eVl/6v8yWyb8C/p95536pK7OM/4JB?=
 =?iso-8859-1?Q?yWQadRU3Nngs5I2x66+TUvtmdNgfUItkEttwollAlaCyrqM2J/0THhtMhY?=
 =?iso-8859-1?Q?nAGNsFxCpHB1RLMFFMa1E7PWuu6hIaEpyQXHYuiNpzH+mJhICwkSLFBLjW?=
 =?iso-8859-1?Q?lew8+iXG2qI8nO3rUImeOtgR68qw/gm2/KyFavAw3aSuHydQwzAj5rahx6?=
 =?iso-8859-1?Q?Ozd26+OZdC4/WnkkxXnotiRD0OKLTtEk/aGUbotS41pXlFGC4RGyABDFBE?=
 =?iso-8859-1?Q?ih0U7i6MmG1LFQVhXvg5g67euh5iD0RHkDojOVCjxnwJbbDmGUO/EvkTPB?=
 =?iso-8859-1?Q?HZUdXfUd2b5b1MHu9KWELq/8QRBNU2AwXifANyZ4j5jde2xrDoPWlhqs9Z?=
 =?iso-8859-1?Q?Ea2MoP63u0u40ABKUQHTOH+5OjCAG0/T7wCmybL7TpMSYr1brFEsjezxy5?=
 =?iso-8859-1?Q?+K1USmJcJb191c4Rv2Zs5s9vFKUXTu5/PzSimCWOIwUUqt93txoE4M9NcU?=
 =?iso-8859-1?Q?ZWviK3FAOfVL7z7TEGSwPRJVrt00XqZBfe5pKBmETVAM4U4Zf/qO6h1lLh?=
 =?iso-8859-1?Q?7VMHgdQvhfjpgqnLYuNc/LmjT1Gxhf7YpqoQ2sBJjC6orH0qh0z6vHn4PS?=
 =?iso-8859-1?Q?LSgNVwWWCWiZkQvHckFZXu8HvvpZLAU0yEzRkjhhgBffo7v9x/k1Cduw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a16c01d6-b62e-4d81-5160-08dbf6b24034
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 23:22:45.4616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppP1CSkfk2xU0aVNMI/btLUmLNoSySadbSTDcoyDUtKAp0xdETGxUWiA973xnEjNuUD1btSjIGGrj4mMToZJMN67+HKKNqGYAK4B97+ka94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5673
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 3/9] drm/xe/xe2: Updates on
 XY_CTRL_SURF_COPY_BLT
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

On Wed, Dec 06, 2023 at 10:01:20AM +0530, Himal Prasad Ghimiray wrote:
> - The XY_CTRL_SURF_COPY_BLT instruction operationg on ccs data expects
> size in pages of main memory for which CCS data should be copied.
> - The bitfield representing copy size in XY_CTRL_SURF_COPY_BLT has
> shifted one bit higher in the instruction.
> 
> v2:
>  - Fix the num_pages for ccs size calculation.
>  - Address nits (Thomas)
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
>  drivers/gpu/drm/xe/xe_migrate.c           | 21 +++++++++++++++------
>  2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index 1f9c32e694c6..6ff6c7aaa648 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -13,6 +13,7 @@
>  #define   DST_ACCESS_TYPE_SHIFT		20
>  #define   CCS_SIZE_MASK			0x3FF
>  #define   CCS_SIZE_SHIFT		8
> +#define   XE2_CCS_SIZE_SHIFT		9

It would be preferred if we just removed the shifts and used
FIELD_PREP() to put values into proper field masks instead.

>  #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
>  #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
>  #define   NUM_CCS_BYTES_PER_BLOCK	256
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index e8b567708ac0..7ef068451b59 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -526,21 +526,30 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
> +	u32 num_pages;
> +	u32 ccs_copy_size;
>  	u32 mocs;
>  
> -	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
> -				    NUM_CCS_BYTES_PER_BLOCK);
> -	xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
> +	if (GRAPHICS_VERx100(xe) >= 2000) {
> +		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> +		xe_gt_assert(gt, num_pages <= 1024);

Rather than using a magic number here, FIELD_FIT() might be better.  We
can do the same for the other branch as well and get rid of
NUM_CCS_BLKS_PER_XFER too.


Matt

>  
> -	if (GRAPHICS_VERx100(xe) >= 2000)
> +		ccs_copy_size = ((num_pages - 1) & CCS_SIZE_MASK) << XE2_CCS_SIZE_SHIFT;
>  		mocs = FIELD_PREP(XE2_XY_CTRL_SURF_MOCS_INDEX_MASK, gt->mocs.uc_index);
> -	else
> +
> +	} else {
> +		num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
> +					    NUM_CCS_BYTES_PER_BLOCK);
> +		xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
> +
> +		ccs_copy_size = ((num_ccs_blks - 1) & CCS_SIZE_MASK) << CCS_SIZE_SHIFT;
>  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> +	}
>  
>  	*cs++ = XY_CTRL_SURF_COPY_BLT |
>  		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>  		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> -		((num_ccs_blks - 1) & CCS_SIZE_MASK) << CCS_SIZE_SHIFT;
> +		ccs_copy_size;
>  	*cs++ = lower_32_bits(src_ofs);
>  	*cs++ = upper_32_bits(src_ofs) | mocs;
>  	*cs++ = lower_32_bits(dst_ofs);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
