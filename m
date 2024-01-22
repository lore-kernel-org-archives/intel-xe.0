Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27771C4725D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 04:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA70F10E405;
	Mon, 22 Jan 2024 04:11:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E5C10E405
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 04:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705896683; x=1737432683;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fTXYb67nuLIZQfnZnoPgXHyimoMxNQYGxMSbN3enKoM=;
 b=L7102+2Q0STkNRA9/ot167tIMIN1kYtfTA4Hvqs6xMdiysmMnJ+0u4Tz
 Dzh73RapWoXj+QBnDwn8sXj9cwsCz5vGMlZsJCzBOai6i2U/ga5fSXmPG
 T5EqLUVlNJEFRFP0gjDzf51wduMq129tLeEsDdlQ2rkDkXOIHM2i1M0cc
 4YeJbepQxfZxYTPr+MaoSfuA07b7t2dV2nKznudhMyWrelQz3HtVEluud
 5LUMTLHIL7X9dcmTA4RGnXFIwT51kxvAWOxd/ITY/Vwxlr4k6ncJuYhji
 pU3aIxvtLQeT24zHNCt5Rf4/KWGJoU370Y0x4QF4rVk3Ja0oSXh/iX9gD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7857216"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7857216"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 20:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="27533584"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2024 20:11:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 20:11:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 21 Jan 2024 20:11:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 21 Jan 2024 20:11:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuxAoYWlZbnW+HFWKD596PIH2TWl7EjGA9IzyhO5ffCBuWAs/HQz/PSeHS1PMmwpYz4KA+wj/NvFUu1SoL3qMyP5SsL4pDaaKRimGBaz3h/08YvSFArtt1We4DNvXjwhrf1cqTy+IOdYisgcdKHgmSHHdWLfZhfqusDKfI27KQ+xi+pmU/fRdmG6OmVYxw82GdQAyNRTHJ1wcGR/EfcURMjzDPetidwFmudGCMQEZYdfBEVXW1J0miSfIpz+ZaGCG6ZTn+XES4j0mr/H3ymVfL8k7ylRNdRJvcyjhYJzZENhwy9yCQrJMX82iI1BySeSo+hSM4+wPjJMS1zjCSRnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfRdYdXAvVO+1Q4JUry8LQiLR1QeRZAk6/J/yhleZVk=;
 b=fqk4Y72Aa9HQ5xdQKRgCcmSyQBGKwSOZ5B8oIj/zOmNt9SBV40Bx+4QN+o41FzfeYH0smsBAvcnISvavo7FljeF6jlfLhCowO5TcGJ7bevQQVBlEz4vdA25hTYtsuQh1xFjmFg8f3e5eBp/Ik9eACC1kq6taoOGLFAyKebr8mCLoZvkFsASwS7bhpFSdPFXHf/m9/FR09ASP3Hw/1nWAGqq1l9qFUhkoqz1/RHHJTucUbmTTY/BV5Znnel1EkEhazDmU67fhMR87yjbxRXL9gDJ6iFQ64JaaiM5CcfsHyWUSNf2G9klQ6GuMGYipmnbsRN4viQD0ZMHTCdhVnCkYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 04:11:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 04:11:18 +0000
Date: Mon, 22 Jan 2024 04:10:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 4/4] drm/xe/guc: Use GuC ID Manager in submission code
Message-ID: <Za3qnkhVxR1FXyTK@DUT025-TGLU.fm.intel.com>
References: <20240110174622.409-1-michal.wajdeczko@intel.com>
 <20240110174622.409-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240110174622.409-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d918e70-e284-416f-585c-08dc1b002f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4bgnxvBXzwmNp1Du+uRlktZLkvOZlXg8WH0mMtwcBwBHLq4dvU2eKEFoEaVGpNwgeetEJSKyLfNGhEOgBEDKfoWDqPnm9xURaIfsax9AuQpSyAJEqcMAOoaEvG8PGK+vjycGWJ8LMQa9tyWZWptXV7n3Px6Ab3jx+9DEsMhc7qVX5lvlzunqgDrgYMaJDbqpxsmxhJlmzaFNbWRcczGys8zoWgxryXHjcEQPDOSOJn+CBnVJqXbETgIPzuPE9NKTd+FckpGbEkr5WcuJjF1GHMztPhcoTA8rslvgNqCdRog6XX6W2R56ZzP/9ADHw9BXQtUm0fyK+Xjf4dXdn0vbm5MjpHf2ijwM4Y1tM24JUd9paSi/FWnofhvyizQw4LpRNoPGtj6xIEQFAR0Eo9fkLTThO820nC62NEOZJ3VMDTZnrvKgeBxYwVsGNHfT5lxqs0CEtMDUGt3pGSBU3Gtk5ZVUi+XgQzmDP/PYHPoMC7qgFyBLcquHZpbmXas8MAEUIx4itcZ4Vy+ZlWHXvrRsRO8dtK6BpA51jALlKqKFqFOR8N8H8g7Y0/GQDDxswU42
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6506007)(6666004)(6512007)(26005)(38100700002)(86362001)(82960400001)(41300700001)(44832011)(5660300002)(2906002)(83380400001)(478600001)(66476007)(6486002)(8936002)(4326008)(8676002)(316002)(6862004)(66556008)(6636002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pci+/LSWx/Kgiz8wMcva0Nwfi0x553OZf+7i/rhdWRJgTnPGoLZmmCnS/66Y?=
 =?us-ascii?Q?cCB7t5jNOFEVGfUjoHnYbbR2d1pG1iOdgC8sFKvH7OrvHn65HfQZvxdC1jMw?=
 =?us-ascii?Q?6oTKOJHMo4sHWk2D38Ult9Y1eBCp8vk47tpsa80YjQgbawVoN4PuLNuy5akL?=
 =?us-ascii?Q?rxQiJW1mDl2HjKrgfy3mm26zWozPTrU6MEuczWfVVASUdINvTVa8KcbU+N85?=
 =?us-ascii?Q?6yfq/4fs8LoeQzxlHgyxdhPC6oy5r8R9SWvZzd4AYDpteMKJKPJlZE6SX7d/?=
 =?us-ascii?Q?PhRVDzZz4smjZgt2sPU8WybczhNZ0Fk4ov084KiHRUvyRx+y6g69DCmLzI23?=
 =?us-ascii?Q?2Msje/2TD2YY700JHLt8RNrjxXJuwE0x/5iIxKB2e8guVUBPjycNAkqd31jB?=
 =?us-ascii?Q?MI+GT87sTKJ/sxfhBLmcVCnWDiI6oFQ5EGtGTk3frvc1RHYrKFSX8zuEHSmM?=
 =?us-ascii?Q?SpH58mE46+uG2wYMeJwPBehG4R1vcEkVhFCgNkOAhVnBsBwjehYouGxgkWH5?=
 =?us-ascii?Q?P1BCXYqjHogGVznWyUrwBApWdD30orHjQBxGOh1AjAaRjVGeMbh9z+zr7zaK?=
 =?us-ascii?Q?iz/+060GXG0Vz4EuwrN1kk44nr+6wA/Mao5+YS5tSuHW5Jqc0OHZ7dCZbgaK?=
 =?us-ascii?Q?iDygTGI5Y5ZjqqyqIWVam4PZZxBOjrfmtT7PHGPHiILsc/+cuB2Hgq9O+E97?=
 =?us-ascii?Q?JrGzvGaYuMxxSvM+g0HvpUstYboEPHnC6MgHqTrculKPLKW9f6La6n/6tpnF?=
 =?us-ascii?Q?fnwPyrEIIfn/JPCtXFrct5u52GtcTDJoJ7NMkIkfksL9i8U5K2+VqpuUE4Zi?=
 =?us-ascii?Q?NsJHZTUzOPs7kQHrRw/keWgI/QdknBenFTGABIVSaoZ99JfCjoTSmv7hNqwY?=
 =?us-ascii?Q?AYRVf4JiBwwSspvQDjM/+K+Ior5kMG68nNqGLh/kxrnVXP8Am+ebL7zWrE5z?=
 =?us-ascii?Q?N8ZdsN7+esBXByrqSEirZzc5PL5WyFu5VOb9n40NBJqe9GQZ0z5/6da8yq2G?=
 =?us-ascii?Q?AVJZfnreMcy2b+zdIe5A60sdAGgt23bZFK65T8okil39n0h2AiM4l2rBWsTE?=
 =?us-ascii?Q?g3/XPd10gDJnwuID1rWRl1nPMg2rYt3GPp503OJOu5adahqwAYCLjwqNeZQe?=
 =?us-ascii?Q?iRcS2Sd34rsRxo1ouMAfWWp0wN6QwENKuAHumOwhxgVhh4DojaKClErz02Jh?=
 =?us-ascii?Q?U9yZxyUB1InouhatpmKZj49P0OI8SI5mHzOP7CW8n1sWnOivS+6FKIDMRSMV?=
 =?us-ascii?Q?F/sgJBb/Mnzi5xv8KsYqV36iaB6RtosgryCguBYkQ8dDZ9QGGwVhyP8WzL8K?=
 =?us-ascii?Q?A+Nf0mSizKVaKxaQ8HHrkrccOleyxmMpy/x7SYEZZtG5Qz7FrrA2a8DiOV1R?=
 =?us-ascii?Q?IrWEpkGYiq7Az0TGmgn5U/DXy7imi7yqNxCVCbdD4o6QyFVturhJ3LgU0Syt?=
 =?us-ascii?Q?NIQc0RWrRyV/Xs7FspI9C4AlY4ZIRKB5lW5fxPDmRSQR8Us380yl8TH2zt9F?=
 =?us-ascii?Q?bynaqUlvlMhmim68Q3VKzQNVHHh3Qh1rIh4l4akXnfq2nJgD5FwBuoJujxnp?=
 =?us-ascii?Q?tKtHEOAmeIfhjFdjCv12nkKJoLFeYpA2tWXEAHVM57hwC77WKhjSwADsV8xD?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d918e70-e284-416f-585c-08dc1b002f00
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 04:11:18.3798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJb0WytocLzHGuIfxkj7vA7f0TF3yOSbhN2TsIMLR0xOn4bjYoLv37VoywI4M6p63CtoptJDxpmG2ojlhdSU6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
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

On Wed, Jan 10, 2024 at 06:46:22PM +0100, Michal Wajdeczko wrote:
> We are ready to replace private guc_ids management code with
> separate GuC ID Manager that can be shared with upcoming SR-IOV
> PF provisioning code.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 36 ++++--------------------------
>  drivers/gpu/drm/xe/xe_guc_types.h  |  4 ----
>  drivers/gpu/drm/xe/xe_uc.c         |  5 +++++
>  3 files changed, 9 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 022e93796bf8..845b03f0b6b2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -25,6 +25,7 @@
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> +#include "xe_guc_id_mgr.h"
>  #include "xe_guc_exec_queue_types.h"
>  #include "xe_guc_submit_types.h"
>  #include "xe_hw_engine.h"
> @@ -235,16 +236,10 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>  	struct xe_guc *guc = arg;
>  
>  	xa_destroy(&guc->submission_state.exec_queue_lookup);
> -	ida_destroy(&guc->submission_state.guc_ids);
> -	bitmap_free(guc->submission_state.guc_ids_bitmap);
>  	free_submit_wq(guc);
>  	mutex_destroy(&guc->submission_state.lock);
>  }
>  
> -#define GUC_ID_NUMBER_MLRC	4096
> -#define GUC_ID_NUMBER_SLRC	(GUC_ID_MAX - GUC_ID_NUMBER_MLRC)
> -#define GUC_ID_START_MLRC	GUC_ID_NUMBER_SLRC
> -
>  static const struct xe_exec_queue_ops guc_exec_queue_ops;
>  
>  static void primelockdep(struct xe_guc *guc)
> @@ -267,22 +262,14 @@ int xe_guc_submit_init(struct xe_guc *guc)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	int err;
>  
> -	guc->submission_state.guc_ids_bitmap =
> -		bitmap_zalloc(GUC_ID_NUMBER_MLRC, GFP_KERNEL);
> -	if (!guc->submission_state.guc_ids_bitmap)
> -		return -ENOMEM;
> -
>  	err = alloc_submit_wq(guc);
> -	if (err) {
> -		bitmap_free(guc->submission_state.guc_ids_bitmap);
> +	if (err)
>  		return err;
> -	}
>  
>  	gt->exec_queue_ops = &guc_exec_queue_ops;
>  
>  	mutex_init(&guc->submission_state.lock);
>  	xa_init(&guc->submission_state.exec_queue_lookup);
> -	ida_init(&guc->submission_state.guc_ids);
>  
>  	spin_lock_init(&guc->submission_state.suspend.lock);
>  	guc->submission_state.suspend.context = dma_fence_context_alloc(1);
> @@ -305,12 +292,7 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa
>  	for (i = 0; i < xa_count; ++i)
>  		xa_erase(&guc->submission_state.exec_queue_lookup, q->guc->id + i);
>  
> -	if (xe_exec_queue_is_parallel(q))
> -		bitmap_release_region(guc->submission_state.guc_ids_bitmap,
> -				      q->guc->id - GUC_ID_START_MLRC,
> -				      order_base_2(q->width));
> -	else
> -		ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
> +	xe_guc_id_mgr_release_locked(&guc->idm, q->guc->id, order_base_2(q->width));
>  }
>  
>  static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -328,21 +310,11 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
>  	 */
>  	lockdep_assert_held(&guc->submission_state.lock);
>  
> -	if (xe_exec_queue_is_parallel(q)) {
> -		void *bitmap = guc->submission_state.guc_ids_bitmap;
> -
> -		ret = bitmap_find_free_region(bitmap, GUC_ID_NUMBER_MLRC,
> -					      order_base_2(q->width));
> -	} else {
> -		ret = ida_simple_get(&guc->submission_state.guc_ids, 0,
> -				     GUC_ID_NUMBER_SLRC, GFP_NOWAIT);
> -	}
> +	ret = xe_guc_id_mgr_reserve_locked(&guc->idm, order_base_2(q->width));
>  	if (ret < 0)
>  		return ret;
>  
>  	q->guc->id = ret;
> -	if (xe_exec_queue_is_parallel(q))
> -		q->guc->id += GUC_ID_START_MLRC;
>  
>  	for (i = 0; i < q->width; ++i) {
>  		ptr = xa_store(&guc->submission_state.exec_queue_lookup,
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 04529be0917e..d2668889919f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -68,10 +68,6 @@ struct xe_guc {
>  	struct {
>  		/** @exec_queue_lookup: Lookup an xe_engine from guc_id */
>  		struct xarray exec_queue_lookup;
> -		/** @guc_ids: used to allocate new guc_ids, single-lrc */
> -		struct ida guc_ids;
> -		/** @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc */
> -		unsigned long *guc_ids_bitmap;
>  		/** @stopped: submissions are stopped */
>  		atomic_t stopped;
>  		/** @lock: protects submission state */
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 4408ea1751e7..3a0023d3fa2c 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -10,6 +10,7 @@
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_guc_db_mgr.h"
> +#include "xe_guc_id_mgr.h"
>  #include "xe_guc_pc.h"
>  #include "xe_guc_submit.h"
>  #include "xe_huc.h"
> @@ -65,6 +66,10 @@ int xe_uc_init(struct xe_uc *uc)
>  	if (ret)
>  		goto err;
>  
> +	ret = xe_guc_id_mgr_init(&uc->guc.idm, ~0);

Nit - I'd probably move this into xe_guc_submit_init() with
s/guc.idm/guc.submission_state.idm.

Otherwise LGTM.

Matt

> +	if (ret)
> +		goto err;
> +
>  	return 0;
>  
>  err:
> -- 
> 2.25.1
> 
