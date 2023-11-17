Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ACCC197A0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 00:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246A810E2EA;
	Fri, 17 Nov 2023 00:33:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2635810E2EA
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 00:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700181197; x=1731717197;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+pcecNt10mAMofIFHY8Fg4y8lu9b1zRGyO2BXfEWO+Y=;
 b=EaqI0jrLnOZOPeA23kXW+ksu0U+2u3OA0Ej3oqQorqJXJ/dI/7Ba8woW
 SjUx/DWthDBWlGpvnbeKqxx1TlGo4rKNo2ZXLdXzVPB7USf3aqnoB24A5
 rGBXn8ocI6c4OpBCM+IEBKuCkW8ivPXSWKRm7577+eSnvYJC4uIJQOKza
 qyYQmcElF21yFFz5oMUu1A7pn8+ZfN8ymkEbBb3p+zbGTTcVRrXZWt89M
 thmr4W5lw9C3BHX0D3kRG0NuqNYIwYNn7vCnhTmq9sMsITIbbZpOBMsu0
 DadDETZ8nm8mAQHUZBMWxEagvuELdYo7CppgVeM8WHyOFiuRQk3GMlblr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4285330"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="4285330"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 16:33:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="856174360"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="856174360"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 16:33:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 16:33:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 16:33:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 16:33:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S84czzQ+I2CNw1L39SLyE3X6JEhYgH7L3n/hZR1xA9KfrcvVTIWGGY6RXVn5XCAnjuNKmhXcBDyEWorNpRG6JqKIwIfmHIdXyWLYIsU6SVjAwlsmP3PrninkmVN+FQL6Mv5iu14sAUTzp/K0u56ycrKA1tlP2ASW6M2V50os4XDWUDcONNvGcqA7XaVR1R3sS9yc+LteYbr+sdm6A146vlYTTpc9nvLPtMd0Q0jLRmECuqzCQnXLvbxU6ewF9NLGSpb00LSWtRBFH6GN4cJMEJcF/8O6TONc3wJ0vE/aaWXK8KN7N/evKvfyNidfefpzIqrT3DuhovqMkz6N+4uCwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McFfuczWUf9uebEBjkAbatiKv3L0MraEAx+dcx8ZnDQ=;
 b=A2/juKU7hgq5d0ej+aVsdwGukcAd+zSmGq8LFNfJ0jM4Ea/WZ7xZz3ume3UpdN5I69JinX3QoX7QOhWWuWTsa/pzeEC3+BQvb1KnrpJhMk6wKQ1XQwDShtU9/Cfg9cHe8QDCXwWRnzq+4WBsliBi63MiEHyq3VitU/PEsVxf+4Tv7EZG5cJGySPmlgv6tTkPJCYrU6JF76OwsWIMlgdqdVXoko+bBwPaLiiEDgfC1TVZHd1CSSoa8TUhXMGIaHx5BklIs9CG1ROTCxQ4IBAXAgwXR/G5ZqwpnYpEtVtKDlVkzdTELzYpHjScV0JXAhvcTeAKqnCoOdgOmNG/M46r7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4982.namprd11.prod.outlook.com (2603:10b6:510:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Fri, 17 Nov
 2023 00:33:10 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.021; Fri, 17 Nov 2023
 00:33:10 +0000
Date: Thu, 16 Nov 2023 16:33:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231117003308.GA5757@mdroper-desk1.amr.corp.intel.com>
References: <20231116222316.407407-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231116222316.407407-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: b47cdb8d-e3e5-453f-f531-08dbe704c6ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CJonY6qOg9oKMbGljd8Gj+o7i9NpDH6403XAAhr7heid2MrUZ/dusx/Mj8gg6/h8qDXGMMKSGVp61r/cKdIFoesASq8hmXi6qgPUKJHyIQ7+jPQ/vFN8Raym/y41P6T3IfMKJh84GO+64XhVgoe9IHJcb+DOB0651Oy3PszQ2W0IvtdqMvYiINmyFjgRBmYp6TbvOUtc8jaqjmTo5h67VOSZJ9SwBnHuOSFCCXeJqMHtsir6FhEI5Vn2zPQH4u2XcYiWvbz+Hkv/5yMJVSBEhre8DBLy0pqLxIb0/EUqkg+Zgi0JNfIT+cWJJy8jvGdZQa383G6UYye9vxihSeAHUug6WMwVj9n+BPrTq0EoNoFz8O70E7ETws+2cNCG4mnvLha2mVTWcCq1symZJqLZ7MDCNgcB1hK2JAf+ePcygIDe41PqoUj7b4UNDkCdAnfBlgUHI3+yYvajjkvF0jA9uKnQH3gZ9JeLSEqgYvvZQtyWfvRTs00xDdXKONpJP3Xurfzo3GGflNhP0mjJXDGTGlMbIboi0pQLNrKxj5t4UMbVfiHjEytwkexNKKrD4f3n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(376002)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(41300700001)(6862004)(6512007)(82960400001)(1076003)(33656002)(26005)(6486002)(478600001)(8936002)(4326008)(8676002)(86362001)(5660300002)(2906002)(30864003)(66556008)(6636002)(316002)(66476007)(66946007)(6506007)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cu5BtImDx9e/5cCTTS65T8cp7RR8BTdjBILUcPPdiXLHo1hiybMVffpx/Xph?=
 =?us-ascii?Q?PU8KYRThmRUK962loCXVdjJs+K2lBptCaVOwdeGYCcUncl3XhU7/x5RLGABp?=
 =?us-ascii?Q?flIafxjvDJTSsSgESs9UvI6AT3pGWZc3T1Ngsyi6ZuPZPloJtfUPQ2Xy+sZn?=
 =?us-ascii?Q?zpygEMC17ECydeyGl6zwThqQg8Zas+UfFs7SP44K3YdzGBmT392JRvCCbZZ7?=
 =?us-ascii?Q?blVwVOXx413EFWFk3MJqeUY94YnjKOJwEgkUv2hA2iSPKg6kS7HjqJJIuJmU?=
 =?us-ascii?Q?mxTeINtKMYKUDA2vK7WnyTUK9mmd/C6DfLmGOwRTio1Nl8GHzMPagT2wh6rQ?=
 =?us-ascii?Q?LP9bbH08pYASnGsDwmdl6L01ru9Lm6YWYq/EmW1c6nYOFUCqELQtHF+wESe7?=
 =?us-ascii?Q?h62IITtIspUCnIy1ho92LqAA9X5HC0V080+lTeY2VFH8KL+53B27nz/vS9aj?=
 =?us-ascii?Q?ickIuzW7hfhoNxEb12VAThnmbmOk7OQelaojXmI59lA8z4TfCHEseXHy3o5A?=
 =?us-ascii?Q?6GP1MCIcJWeMVEp/V0N12bpxeDWsa1FUPdi8tdBuj+5HRucWDv883eubHObO?=
 =?us-ascii?Q?IaU22vMxvbb/Tqvtp8jHel02GaUqULb+9tUpWoXhTybIcSju7XA7iQoVcdWM?=
 =?us-ascii?Q?6GFvhuqaEjkhukqf25iA0x1tTKpOPQILxFcWTYvE5dl8UHeCqfmEulQFac/8?=
 =?us-ascii?Q?NcpqcRSgWuMW5L9mIqkU/8zUyG5N+A5e2GdajWBg2q6AQl2T4YGPc2sURqz8?=
 =?us-ascii?Q?P/PoJe9FmVe9hhCOg0M55u6tWFLEwiKvAaXo9crgNEDAQbH8ZlEtLQhYN/0h?=
 =?us-ascii?Q?re3hKksRsFvdU+qUCGGBT+5oRbztohr9uQH9okOaijhJqDU12yVLcHik+xZx?=
 =?us-ascii?Q?7YjnWZNkJvkM8Vm7f5cU5LDzRDJxUFSclaT15GJ+C7TBD5AkWSUjCSPfI23A?=
 =?us-ascii?Q?S+LxZVBeB0ssxjJWH20mmuVoINyhbMy4uoTKBgUdUWZrXQ1cCkzgMY82vnH9?=
 =?us-ascii?Q?aQVYwlApB4fxy92EbM6nFywoDM75H6bp7S9SvPHVIYIHrc4Olkfi+tmYH+ie?=
 =?us-ascii?Q?ulGtlSTRcso5r4L7d7oGdtrItvsYvptJIHzHBSFqfrtJQsSpwzPTNr1/fh6v?=
 =?us-ascii?Q?gm/xntCmrH0fyEPQH8Rub1reDQCRN1Z0X446Rj3Gmhw8+LEEHp0c7veJ6lkl?=
 =?us-ascii?Q?9HZnfqEskNUPauYqNXklNn8p0PzZWR9be0fqN5CmigtJwr3WXDZ2fxWWr0At?=
 =?us-ascii?Q?4GkE4tO0y999hibqdEqLVJ/R7K1nOGYLDz13ap0GKrouPtzn8QtLUOX+2fyh?=
 =?us-ascii?Q?CWIwwKrAN8Lb3xSSof9GbRh0FMKrf6WKcMVUWt9ZRjb91NtBuYI4OPcH66a3?=
 =?us-ascii?Q?md9XtRlsTi+ewi9zmYU+QdrUBqTP7WLl9BxI23bhdWUObEHHdN1nkhaaWlSs?=
 =?us-ascii?Q?ebblVvEfsbznVQ7KnYW5NhjwSrUctOeS+gKPixoaWKvf+sLISl0bmzbf6/e+?=
 =?us-ascii?Q?/W1bIEWaCkE1PQc9DF6BzF9a9c4/eNCw1KHf/U3R/iUKDtRHWp3tecz8PDjx?=
 =?us-ascii?Q?PgH7wJDOcHkqGc7otxPiRuJJpyhaQuxwy5G5MZFVH1ioID/bYgox+HzMkSXZ?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b47cdb8d-e3e5-453f-f531-08dbe704c6ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 00:33:10.5888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7oBlb2Sa31kgDIPi/dLv1HfCqSMPWMfa2amB+ogJ1maDIZmAeTkL8LM1UmZDzrLlSgpOQZR5hG94hty/QzjGyWpJqplOgWe8i+j4Ny5gOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4982
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove GEN[0-9]*_ prefixes
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

On Thu, Nov 16, 2023 at 02:23:16PM -0800, Lucas De Marchi wrote:
> After noticing in logs there there were still mentions to GEN6
> registers, it was clear commit 860bc3f9b76d ("drm/xe: Drop gen afixes
> from registers") didn't take care of all the afixes. Some were added
> later, but there are also constans and strings still using that.
> Continue the cleanup removing the remaining ones.
> 
> To keep it consistent with code nearby, a few other changes are made:
> 
> 	- Remove prefix in INTEL_LEGACY_64B_CONTEXT
> 	- Remove GEN8_CTX_L3LLC_COHERENT since it's unused
> 	- Rename GEN9_FREQ_SCALER to GT_FREQUENCY_SCALER
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_execlist.c       | 16 ++++++++--------
>  drivers/gpu/drm/xe/xe_gt.c             |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c            |  2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c         | 18 +++++++++---------
>  drivers/gpu/drm/xe/xe_lrc.c            | 23 +++++++++++------------
>  drivers/gpu/drm/xe/xe_mmio.c           | 14 +++++++-------
>  drivers/gpu/drm/xe/xe_mmio.h           |  2 +-
>  drivers/gpu/drm/xe/xe_mocs.c           | 12 ++++++------
>  drivers/gpu/drm/xe/xe_pt.c             |  2 +-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  2 +-
>  drivers/gpu/drm/xe/xe_wopcm.c          | 15 ++++++++-------
>  11 files changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index b4406fbdf99f..e8754adfc52a 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -28,16 +28,16 @@
>  
>  #define XE_EXECLIST_HANG_LIMIT 1
>  
> -#define GEN11_SW_CTX_ID_SHIFT 37
> -#define GEN11_SW_CTX_ID_WIDTH 11
> +#define SW_CTX_ID_SHIFT 37
> +#define SW_CTX_ID_WIDTH 11
>  #define XEHP_SW_CTX_ID_SHIFT  39
>  #define XEHP_SW_CTX_ID_WIDTH  16
>  
>  #define XE_SCHED_PRIORITY_UNSET -2
>  
> -#define GEN11_SW_CTX_ID \
> -	GENMASK_ULL(GEN11_SW_CTX_ID_WIDTH + GEN11_SW_CTX_ID_SHIFT - 1, \
> -		    GEN11_SW_CTX_ID_SHIFT)
> +#define SW_CTX_ID \
> +	GENMASK_ULL(SW_CTX_ID_WIDTH + SW_CTX_ID_SHIFT - 1, \
> +		    SW_CTX_ID_SHIFT)
>  
>  #define XEHP_SW_CTX_ID \
>  	GENMASK_ULL(XEHP_SW_CTX_ID_WIDTH + XEHP_SW_CTX_ID_SHIFT - 1, \
> @@ -57,8 +57,8 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  		xe_gt_assert(hwe->gt, FIELD_FIT(XEHP_SW_CTX_ID, ctx_id));
>  		lrc_desc |= FIELD_PREP(XEHP_SW_CTX_ID, ctx_id);
>  	} else {
> -		xe_gt_assert(hwe->gt, FIELD_FIT(GEN11_SW_CTX_ID, ctx_id));
> -		lrc_desc |= FIELD_PREP(GEN11_SW_CTX_ID, ctx_id);
> +		xe_gt_assert(hwe->gt, FIELD_FIT(SW_CTX_ID, ctx_id));
> +		lrc_desc |= FIELD_PREP(SW_CTX_ID, ctx_id);
>  	}
>  
>  	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
> @@ -98,7 +98,7 @@ static void __xe_execlist_port_start(struct xe_execlist_port *port,
>  				     struct xe_execlist_exec_queue *exl)
>  {
>  	struct xe_device *xe = gt_to_xe(port->hwe->gt);
> -	int max_ctx = FIELD_MAX(GEN11_SW_CTX_ID);
> +	int max_ctx = FIELD_MAX(SW_CTX_ID);
>  
>  	if (GRAPHICS_VERx100(xe) >= 1250)
>  		max_ctx = FIELD_MAX(XEHP_SW_CTX_ID);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6c885dde5d59..364543546f98 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -515,7 +515,7 @@ static int do_gt_reset(struct xe_gt *gt)
>  	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
>  	err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
>  	if (err)
> -		xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
> +		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
>  			  ERR_PTR(err));
>  
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 84f0b5488783..f52a7e832007 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -313,7 +313,7 @@ int xe_guc_reset(struct xe_guc *guc)
>  
>  	ret = xe_mmio_wait32(gt, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
>  	if (ret) {
> -		drm_err(&xe->drm, "GuC reset timed out, GEN6_GDRST=0x%8x\n",
> +		drm_err(&xe->drm, "GuC reset timed out, GDRST=0x%8x\n",
>  			gdrst);
>  		goto err_out;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index f4ac76d6b2dd..e9dd6c3d750b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -23,19 +23,19 @@
>  
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>  
> -#define GEN6_RP_STATE_CAP	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5998)
> +#define RP_STATE_CAP		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5998)
>  #define   RP0_MASK		REG_GENMASK(7, 0)
>  #define   RP1_MASK		REG_GENMASK(15, 8)
>  #define   RPN_MASK		REG_GENMASK(23, 16)
>  
> -#define GEN10_FREQ_INFO_REC	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
> +#define FREQ_INFO_REC	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>  #define   RPE_MASK		REG_GENMASK(15, 8)
>  
>  #define GT_PERF_STATUS		XE_REG(0x1381b4)
> -#define   GEN12_CAGF_MASK	REG_GENMASK(19, 11)
> +#define   CAGF_MASK	REG_GENMASK(19, 11)
>  
>  #define GT_FREQUENCY_MULTIPLIER	50
> -#define GEN9_FREQ_SCALER	3
> +#define GT_FREQUENCY_SCALER	3
>  
>  /**
>   * DOC: GuC Power Conservation (PC)
> @@ -244,12 +244,12 @@ static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
>  static u32 decode_freq(u32 raw)
>  {
>  	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> -				 GEN9_FREQ_SCALER);
> +				 GT_FREQUENCY_SCALER);
>  }
>  
>  static u32 encode_freq(u32 freq)
>  {
> -	return DIV_ROUND_CLOSEST(freq * GEN9_FREQ_SCALER,
> +	return DIV_ROUND_CLOSEST(freq * GT_FREQUENCY_SCALER,
>  				 GT_FREQUENCY_MULTIPLIER);
>  }
>  
> @@ -362,7 +362,7 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>  	if (xe->info.platform == XE_PVC)
>  		reg = xe_mmio_read32(gt, PVC_RP_STATE_CAP);
>  	else
> -		reg = xe_mmio_read32(gt, GEN10_FREQ_INFO_REC);
> +		reg = xe_mmio_read32(gt, FREQ_INFO_REC);
>  
>  	pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  }
> @@ -402,7 +402,7 @@ static ssize_t freq_act_show(struct device *dev,
>  		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
>  	} else {
>  		freq = xe_mmio_read32(gt, GT_PERF_STATUS);
> -		freq = REG_FIELD_GET(GEN12_CAGF_MASK, freq);
> +		freq = REG_FIELD_GET(CAGF_MASK, freq);
>  	}
>  
>  	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
> @@ -702,7 +702,7 @@ static void tgl_init_fused_rp_values(struct xe_guc_pc *pc)
>  	if (xe->info.platform == XE_PVC)
>  		reg = xe_mmio_read32(gt, PVC_RP_STATE_CAP);
>  	else
> -		reg = xe_mmio_read32(gt, GEN6_RP_STATE_CAP);
> +		reg = xe_mmio_read32(gt, RP_STATE_CAP);
>  	pc->rp0_freq = REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  	pc->rpn_freq = REG_FIELD_GET(RPN_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index f8754f061599..17c0eb9e62cf 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -23,14 +23,13 @@
>  #include "xe_map.h"
>  #include "xe_vm.h"
>  
> -#define GEN8_CTX_VALID				(1 << 0)
> -#define GEN8_CTX_L3LLC_COHERENT			(1 << 5)
> -#define GEN8_CTX_PRIVILEGE			(1 << 8)
> -#define GEN8_CTX_ADDRESSING_MODE_SHIFT		3
> -#define INTEL_LEGACY_64B_CONTEXT		3
> +#define CTX_VALID				(1 << 0)
> +#define CTX_PRIVILEGE				(1 << 8)
> +#define CTX_ADDRESSING_MODE_SHIFT		3
> +#define LEGACY_64B_CONTEXT			3
>  
> -#define GEN11_ENGINE_CLASS_SHIFT		61
> -#define GEN11_ENGINE_INSTANCE_SHIFT		48
> +#define ENGINE_CLASS_SHIFT			61
> +#define ENGINE_INSTANCE_SHIFT			48
>  
>  static struct xe_device *
>  lrc_to_xe(struct xe_lrc *lrc)
> @@ -765,19 +764,19 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  				     (q->usm.acc_notify << ACC_NOTIFY_S) |
>  				     q->usm.acc_trigger);
>  
> -	lrc->desc = GEN8_CTX_VALID;
> -	lrc->desc |= INTEL_LEGACY_64B_CONTEXT << GEN8_CTX_ADDRESSING_MODE_SHIFT;
> +	lrc->desc = CTX_VALID;
> +	lrc->desc |= LEGACY_64B_CONTEXT << CTX_ADDRESSING_MODE_SHIFT;
>  	/* TODO: Priority */
>  
>  	/* While this appears to have something about privileged batches or
>  	 * some such, it really just means PPGTT mode.
>  	 */
>  	if (vm)
> -		lrc->desc |= GEN8_CTX_PRIVILEGE;
> +		lrc->desc |= CTX_PRIVILEGE;
>  
>  	if (GRAPHICS_VERx100(xe) < 1250) {
> -		lrc->desc |= (u64)hwe->instance << GEN11_ENGINE_INSTANCE_SHIFT;
> -		lrc->desc |= (u64)hwe->class << GEN11_ENGINE_CLASS_SHIFT;
> +		lrc->desc |= (u64)hwe->instance << ENGINE_INSTANCE_SHIFT;
> +		lrc->desc |= (u64)hwe->class << ENGINE_CLASS_SHIFT;
>  	}
>  
>  	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index d8f9fabf715e..fe46cf65fb36 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -84,8 +84,8 @@ static void xe_resize_vram_bar(struct xe_device *xe)
>  	int i;
>  
>  	/* gather some relevant info */
> -	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> -	bar_size_mask = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
> +	current_size = pci_resource_len(pdev, LMEM_BAR);
> +	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
>  
>  	if (!bar_size_mask)
>  		return;
> @@ -137,7 +137,7 @@ static void xe_resize_vram_bar(struct xe_device *xe)
>  	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
>  	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
>  
> -	_resize_bar(xe, GEN12_LMEM_BAR, rebar_size);
> +	_resize_bar(xe, LMEM_BAR, rebar_size);
>  
>  	pci_assign_unassigned_bus_resources(pdev->bus);
>  	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
> @@ -161,15 +161,15 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  
> -	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
> +	if (!xe_pci_resource_valid(pdev, LMEM_BAR)) {
>  		drm_err(&xe->drm, "pci resource is not valid\n");
>  		return -ENXIO;
>  	}
>  
>  	xe_resize_vram_bar(xe);
>  
> -	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
> -	xe->mem.vram.io_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> +	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
> +	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
>  	if (!xe->mem.vram.io_size)
>  		return -EIO;
>  
> @@ -215,7 +215,7 @@ int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *tile_size,
>  
>  	/* actual size */
>  	if (unlikely(xe->info.platform == XE_DG1)) {
> -		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), GEN12_LMEM_BAR);
> +		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
>  		*tile_offset = 0;
>  	} else {
>  		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index ae09f777d711..0e2d7b1552ad 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -18,7 +18,7 @@ struct drm_device;
>  struct drm_file;
>  struct xe_device;
>  
> -#define GEN12_LMEM_BAR		2
> +#define LMEM_BAR		2
>  
>  int xe_mmio_init(struct xe_device *xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 46e999257862..849316d73d27 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -69,7 +69,7 @@ struct xe_mocs_info {
>  #define L4_CACHE_POLICY_MASK		REG_GENMASK(3, 2)
>  
>  /* Helper defines */
> -#define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
> +#define NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */

An XE_ or XELP_ prefix might be worth adding to this one?

>  #define PVC_NUM_MOCS_ENTRIES	3
>  #define MTL_NUM_MOCS_ENTRIES    16
>  #define XE2_NUM_MOCS_ENTRIES	16
> @@ -149,7 +149,7 @@ struct xe_mocs_info {
>   *       For TGL/RKL, all the unspecified MOCS indexes are mapped to L3 UC.
>   */
>  
> -#define GEN11_MOCS_ENTRIES \
> +#define MOCS_ENTRIES \

This one I'd just roll directly into the gen12_mocs_desc[] table and
kill off the macro.  i915 used the macro because gen11 and gen12 needed
to share a bunch of common entries, with only a few being different
between those platforms.  Xe isn't sharing this with anything so the
macro just makes it harder to read the code.


Aside from those,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  	/* Entries 0 and 1 are defined per-platform */ \
>  	/* Base - L3 + LLC */ \
>  	MOCS_ENTRY(2, \
> @@ -265,7 +265,7 @@ static const struct xe_mocs_entry dg1_mocs_desc[] = {
>  };
>  
>  static const struct xe_mocs_entry gen12_mocs_desc[] = {
> -	GEN11_MOCS_ENTRIES,
> +	MOCS_ENTRIES,
>  	/* Implicitly enable L1 - HDC:L1 + L3 + LLC */
>  	MOCS_ENTRY(48,
>  		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
> @@ -433,14 +433,14 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>  			info->table = dg2_mocs_desc;
>  		}
>  		info->uc_index = 1;
> -		info->n_entries = GEN9_NUM_MOCS_ENTRIES;
> +		info->n_entries = NUM_MOCS_ENTRIES;
>  		info->unused_entries_index = 3;
>  		break;
>  	case XE_DG1:
>  		info->size = ARRAY_SIZE(dg1_mocs_desc);
>  		info->table = dg1_mocs_desc;
>  		info->uc_index = 1;
> -		info->n_entries = GEN9_NUM_MOCS_ENTRIES;
> +		info->n_entries = NUM_MOCS_ENTRIES;
>  		info->unused_entries_index = 5;
>  		break;
>  	case XE_TIGERLAKE:
> @@ -450,7 +450,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>  	case XE_ALDERLAKE_N:
>  		info->size  = ARRAY_SIZE(gen12_mocs_desc);
>  		info->table = gen12_mocs_desc;
> -		info->n_entries = GEN9_NUM_MOCS_ENTRIES;
> +		info->n_entries = NUM_MOCS_ENTRIES;
>  		info->uc_index = 3;
>  		info->unused_entries_index = 2;
>  		break;
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 31afab617b4e..338bffe4885f 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -532,7 +532,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		pte |= xe_walk->default_pte;
>  
>  		/*
> -		 * Set the GEN12_PTE_PS64 hint if possible, otherwise if
> +		 * Set the XE_PTE_PS64 hint if possible, otherwise if
>  		 * this device *requires* 64K PTE size for VRAM, fail.
>  		 */
>  		if (level == 0 && !xe_parent->is_compact) {
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 0c533d36791d..d6628df9f41b 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -77,7 +77,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  	stolen_size = tile_size - mgr->stolen_base;
>  
>  	/* Verify usage fits in the actual resource available */
> -	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, GEN12_LMEM_BAR))
> +	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, LMEM_BAR))
>  		mgr->io_base = tile->mem.vram.io_start + mgr->stolen_base;
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index bf85d4fa56cc..d3a99157e523 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -51,9 +51,10 @@
>  #define DGFX_WOPCM_SIZE			SZ_4M
>  /* FIXME: Larger size require for MTL, do a proper probe sooner or later */
>  #define MTL_WOPCM_SIZE			SZ_4M
> -#define GEN11_WOPCM_SIZE		SZ_2M
> +#define WOPCM_SIZE			SZ_2M
> +
> +#define MAX_WOPCM_SIZE			SZ_8M
>  
> -#define GEN12_MAX_WOPCM_SIZE            SZ_8M
>  /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
>  #define WOPCM_RESERVED_SIZE		SZ_16K
>  
> @@ -65,8 +66,8 @@
>  /* GuC WOPCM Offset value needs to be aligned to 16KB. */
>  #define GUC_WOPCM_OFFSET_ALIGNMENT	(1UL << GUC_WOPCM_OFFSET_SHIFT)
>  
> -/* 36KB WOPCM reserved at the end of WOPCM on GEN11. */
> -#define GEN11_WOPCM_HW_CTX_RESERVED	(SZ_32K + SZ_4K)
> +/* 36KB WOPCM reserved at the end of WOPCM */
> +#define WOPCM_HW_CTX_RESERVED		(SZ_32K + SZ_4K)
>  
>  static inline struct xe_gt *wopcm_to_gt(struct xe_wopcm *wopcm)
>  {
> @@ -80,7 +81,7 @@ static inline struct xe_device *wopcm_to_xe(struct xe_wopcm *wopcm)
>  
>  static u32 context_reserved_size(void)
>  {
> -	return GEN11_WOPCM_HW_CTX_RESERVED;
> +	return WOPCM_HW_CTX_RESERVED;
>  }
>  
>  static bool __check_layout(struct xe_device *xe, u32 wopcm_size,
> @@ -180,7 +181,7 @@ u32 xe_wopcm_size(struct xe_device *xe)
>  {
>  	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
>  		xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
> -		GEN11_WOPCM_SIZE;
> +		WOPCM_SIZE;
>  }
>  
>  /**
> @@ -225,7 +226,7 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>  		 * BIOS/IFWI, check against the max allowed wopcm size to
>  		 * validate if the programmed values align to the wopcm layout.
>  		 */
> -		wopcm->size = GEN12_MAX_WOPCM_SIZE;
> +		wopcm->size = MAX_WOPCM_SIZE;
>  
>  		goto check;
>  	}
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
