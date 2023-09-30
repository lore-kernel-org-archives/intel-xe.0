Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21638E77354
	for <intel-xe@archiver.kernel.org>; Sat, 30 Sep 2023 05:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96F510E1BE;
	Sat, 30 Sep 2023 05:59:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C1C10E1BE
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Sep 2023 05:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696053538; x=1727589538;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J9B4matOm/XPwqvWDDoT+/OjPpSNfK1864QEd0cRlQc=;
 b=CGDIAjxiROrk3kYkwtRk1vDNo6pslTyrhJbAh/pUKhjpQv47jYLdDHiF
 2oieYG11TPC7uDISIyhonwD9i4p/Q24t/efbsSk+Hoe20JOINt2OsgvEf
 sYAhmt9xgCP824szhw4MjVqf61IcR0EFWxRfKJEXoUkSaac8uJlbaA4ox
 VcdUizdIbUi2NW4MiXeEkeVN1zVYYDAgqx7KRvxqTnkZK+NPTO2p1vJ6g
 9VohV1omZ62zQbVNQSoMiZAtOOazT8cdc1EsVLsocczyQs/IX2YYly+bU
 1x+jO64rDoF70NuRG35wHMkVO4ifxF7joshGch/BMNm/4BWX/icHJulNF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="386294030"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="386294030"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 22:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865940685"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="865940685"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 22:58:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 22:58:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 22:58:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 22:58:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNecx0+uWYMRjynING5NkasmiZwMdNqt9gc0pEMPKDmZLa+oDakWLnkvmA126+I864cpYBzZajhqrNWZ/Fm7a2hupIKQApIhyroHkefO3p6SMTCD/ee3UDGxt4+tChwv67uvaT3Xl+lT1sgsp3c9YaPzqu9yq8PHc18jHu2FXKrFzNXHCNTN3fpOWvdLI+QTwhNfS9rIpvmnpkXrXcT1p0g6szpEE64lXhGOhj5gLfCuKRvLsvPgOkcoML1Jbm8BL/L9uX9iHritu8Rhl2pXFgO2eAfVq8Qsq3yaTo+b0r4v0vlaUkj6PoSHMdLPhUVhb6kD66EdHkukhFWcDZdAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QibBcIr9FxBJeODV/PRvTOWACoFiPmcwbjfwuPofrmM=;
 b=lfHlC//Oq4N1MUK0bRSzf07m+fBf3yZ7bY1dyofsb3e6y5/0DR2hCcLxTZl7qa5oCu2WsHw2EVK3rlfGkrg0sa1H7f2d4HCU906C58JxDONpdX5o3OcchBalzFfpHN2qwmGwgxOM4GuA/tM/NPLUaxNg9QmKsBueDKbRBHtjJWcrJ1NPyLIO8wdRFzc3HzuBENeoPQjWv6AVW3A4FllkduVbx2qDMagT1ijIz3xRBXnSsGx8yJr5JC4sdDMJtkrvlKMzvNsJqRackZFt7SFVhH591bD0JeCR1JFIqtrF99QTUxKGsP68x5g/k/A0ZuTt1FMI7QkanuntTomvUgomww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Sat, 30 Sep
 2023 05:58:53 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Sat, 30 Sep 2023
 05:58:52 +0000
Date: Fri, 29 Sep 2023 22:58:49 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZRe5GQHmyqjs+wFU@nvishwa1-DESK>
References: <20230929062420.394375-1-tejas.upadhyay@intel.com>
 <20230929062420.394375-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929062420.394375-3-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::22) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CO1PR11MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: e7228845-182b-429b-1b69-08dbc17a52e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0BF7opNth3Ie1h7K1aJc56/yGlouITL9uiiRsuS5wvePVYvO0va5WJ/59dl4g04VQqvmEfnQqcGxUgpz61tscZ24oc/kv1pgtWJxDBcssEvGQCo7x1VBnM/0VnPYOol/4oUfx7Vldyg0tS/ZVZTTFOlKfo/cGyA2wLNC6Zq4B+OounYiaMvikc72wH56st+la6jqVjEbdrS8okPD2ZhMgBloatLAeSoaCR/O7zJ4Wz6bZSRmAvkWovW+DQ9O+vaqz5wD7oJ/lo8XBaCjSdABU0n9vNzZvz6IOLr/pypEpHMXjR2j/Z6AJtmsv3mr0mzoJMYLnQXLWyWHWQqtyySwSzkPlwQRNm12gajcJxZ4mZROB7l2uwuMMeA01W2w5mPv3XXxQVcoF37wYu8wtZpAtmMBHH8NcgQC+LsE4/Ih2tlPv2RxyZ7kB4JztYhAV1IX4yj4CYV5+pXEXnn+IhmrQbSOtTI0FsG6FY7kmenUjjZ6HZ3WOrMIjvC5ZwvhOT+cRlFFyrZRHcxIZ7aiN8Em4Y/cZTINwzSODYrPPl/S1YEVbtUFuSDLLgwDM/uH87sYnsDEdM1nQH5Mozv0L1hWOZgTL53ZYZ8wP3MzJPa0/Hw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(366004)(39860400002)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6506007)(6486002)(6512007)(478600001)(6666004)(9686003)(8936002)(66476007)(66946007)(66556008)(8676002)(83380400001)(316002)(44832011)(6636002)(82960400001)(107886003)(33716001)(15650500001)(41300700001)(4326008)(5660300002)(86362001)(2906002)(38100700002)(26005)(6862004)(30864003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K0vqxZWf6wldYFkD6qVNjV8JvuH5EANpzZFvHPmlJ/jI0yEq9F0RfsWwS8pI?=
 =?us-ascii?Q?flBaio1oZ3jx9grkIo9Dcj7yJFGPy6RMpy1jcJatl0RKo0+T6XMCtQHQVw9N?=
 =?us-ascii?Q?1WelYzOQsS+D/BshaXgXbCx75NlgEvTvEanjNvaVNvJEG+2Dzzpr9BSox3eZ?=
 =?us-ascii?Q?Agn4i/H9/Y0I/ua2p+9du8E5Wesf1burW7QViCE+yvYe07zdCc4nxL3g50s2?=
 =?us-ascii?Q?OkZQQhVrkCAdn+keL0OgNHQiYVeqsxWfsTwmVtp/xVmi9/wBvUbgug3z+1h5?=
 =?us-ascii?Q?vGjKZjBceAs3aYmTvpnX0d8Ft1xZ4E918zT3gj+yAWUP1GcN7A640e/fXrfy?=
 =?us-ascii?Q?BLTEmug+V7NSHlRhjR4VXrNKWxcHrqmXOWHTCIYqeCZ7aPtMmqAciCwqmtXZ?=
 =?us-ascii?Q?9j8Z6ew2pZNe6vnpIHqN1nlIGNW13F4rsiPSkH61wWuDlI+CqR865FLgcD4y?=
 =?us-ascii?Q?yOHo0kXFCcCFEFyTzHVQ2u3lAH2/FAZmmYxE+ej2VfqR2JAJ2O7C2wzvvf6R?=
 =?us-ascii?Q?rPTPpfdhArkzsyq9xp102xIYdYeyeTOntL6ihnR/r50gJ59z5iP2PsdGu7p0?=
 =?us-ascii?Q?RcfaA2KZo+4tGZdSebBQB3edmf416gXa9zv1kKsD1gmCgg/VelkXud15VkYV?=
 =?us-ascii?Q?pLWuaNpbBy8eCmi4pNFQWA6N8Gk1NDZLdNuDd4s9HEix8GdU8F6nO0BSWGMe?=
 =?us-ascii?Q?aWbQ0VUkCZE0QgxaFUyg2zo/1xutKRNii2wM9r/4cH0nzjyp56AacRupT5tV?=
 =?us-ascii?Q?bU2ySwtNHor8GFT9CkmrRTq4pLMvRp/gcm6NEmMSA/D3+NnM3t6TlTOSpQra?=
 =?us-ascii?Q?mijww4cISu6//tHdSRDdWyV0PSvibv6xYiCrVSamkvIzeQnrI/z8E23q/Vke?=
 =?us-ascii?Q?0ztOCYtE1tRjeKgxEtqUerdqx0KhT80QSZyhxfr9wTuOYSl8foG8pfXoEsXv?=
 =?us-ascii?Q?t6xO3DBjD4HFeTWx/wfWqnQKXmN6GP9XU3/PYmnXPuLHrnU0y10xv+tyHzmN?=
 =?us-ascii?Q?ki5gXgKOHe6uhiheGk6RrMHWMrtiM/YxkJqL5x00m95gXu3Trq1Y7BL/8mtg?=
 =?us-ascii?Q?WJMUh3ixfvFuFaLO/nK1UZrSZuEWvPyFjTM0ct0dMzoLv123S3BNvURcVzB1?=
 =?us-ascii?Q?KDkKnEqlDGHfsy9ul6HGcci7WSfs0JH2OiTS4n3cqIZpQ5apRJUdgmhgWsPh?=
 =?us-ascii?Q?maaSOOy1w7WNFvL+YjLtAEUb/dyFvWdia207nrcXDLD+w4uu+QrA4gPcsE5+?=
 =?us-ascii?Q?fufxMt0rwU5NwRaSR44NibKaexaKH0pvGnbxRLFLBJzvRS84+Tgf+gI/pu+P?=
 =?us-ascii?Q?YAwngZQHhxjM2tW0xF2d8K1MoZ9SgDfL1nBLxAeOG5AvR0Q0QCz67gY5ddbx?=
 =?us-ascii?Q?+DG2zWNwK3qRi09Od30YNcmvmiu/XRm/M3VDW23NS7ql1c7lbp+Bme9XA4YQ?=
 =?us-ascii?Q?P+M2w6OSxFKFKVqyg1rzwQ1jnTcwx2bSRKR7JSkPk9Exn27ntlnp6xNBW45O?=
 =?us-ascii?Q?F2kDlo+0EBZLGZcL+1JPuzQuTJZc5mKz0zV4ybfIH0tEumc304wy6JwMM/9P?=
 =?us-ascii?Q?Ub2woj0NesO2dFTaCApI/zddTgWH3aR2KTKnSfz6DtSWoQDytjP6UMTVg0AX?=
 =?us-ascii?Q?XINm1vQQ3w7ELRnWZihXtUw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7228845-182b-429b-1b69-08dbc17a52e1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 05:58:52.5781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydyrYbGrd2RqMmitcEM5uZOii7Hv32koWnLsV6xSopiRk6M3WHRNvEm2IvWws3DACjo8p3XkX4QsVZEUZMD/y4eggpoA6cdxrz+sYSJJyvJqZAy5j2Xc9QIC/suUxY/D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 2/2] drm/xe: Update counter for low level
 driver errors
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
Cc: Roper@freedesktop.org, Matthew D <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org, Wajdeczko@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 11:54:20AM +0530, Tejas Upadhyay wrote:
>we added a low level driver error counter and incrementing on
>each occurrance. Focus is on errors that are not functionally
>affecting the system and might otherwise go unnoticed and cause
>power/performance regressions, so checking for the error
>counters should help.
>
>Importantly the intention is not to go adding new error checks,
>but to make sure the existing important error conditions are
>propagated in terms of counter under respective categories like
>below :
>Under GT:
>driver_gt_guc_communication,
>driver_gt_other_engine,
>driver_gt_other
>
>Under Tile:
>driver_ggtt,
>driver_interrupt
>
>TODO: Currently this is just a counting of errors, later these
>counters will be reported through netlink interface when it is
>implemented and ready.
>
>V5:
>  - Dump err_type in string format
>V4:
>  - dump err_type in drm_err log - Himal
>V2:
>  - Use modified APIs
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c                  |  6 +++
> drivers/gpu/drm/xe/xe_gt.h                  |  1 +
> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 15 +++++--
> drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
> drivers/gpu/drm/xe/xe_guc_ct.c              | 44 ++++++++++++-------
> drivers/gpu/drm/xe/xe_guc_pc.c              | 16 ++++---
> drivers/gpu/drm/xe/xe_guc_submit.c          | 47 +++++++++++++++------
> drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
> drivers/gpu/drm/xe/xe_reg_sr.c              | 20 ++++++---
> drivers/gpu/drm/xe/xe_tile.c                |  5 +++
> drivers/gpu/drm/xe/xe_tile.h                |  1 +
> 11 files changed, 123 insertions(+), 53 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index a8b5f012588b..3c174b7430be 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -47,6 +47,12 @@
> #include "xe_wa.h"
> #include "xe_wopcm.h"
>
>+const char *const xe_gt_drv_err_to_str[] = {
>+	[XE_GT_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
>+	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
>+	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"
>+};
>+
> /**
>  * xe_gt_report_driver_error - Count driver error for gt
>  * @gt: GT to count error for
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 9442d615042f..70c131022f59 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -67,6 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
> 		hwe->instance == gt->usm.reserved_bcs_instance;
> }
>
>+extern const char *const xe_gt_drv_err_to_str[];
> void xe_gt_report_driver_error(struct xe_gt *gt,
> 			       const enum xe_gt_drv_err_type err);
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>index bd6005b9d498..63a152d74176 100644
>--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>@@ -9,6 +9,7 @@
> #include "xe_gt.h"
> #include "xe_guc.h"
> #include "xe_guc_ct.h"
>+#include "xe_tile.h"
> #include "xe_trace.h"
>
> #define TLB_TIMEOUT	(HZ / 4)
>@@ -35,8 +36,11 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> 			break;
>
> 		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
>-		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
>-			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);
>+		drm_err(&gt_to_xe(gt)->drm,
>+			"gt%d: TLB invalidation fence timeout, seqno=%d recv=%d [%s]",
>+			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv,
>+			xe_tile_drv_err_to_str[XE_TILE_DRV_ERR_GGTT]);
>+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GGTT);
>
> 		list_del(&fence->link);
> 		fence->base.error = -ETIME;
>@@ -329,8 +333,11 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
> 				 tlb_invalidation_seqno_past(gt, seqno),
> 				 TLB_TIMEOUT);
> 	if (!ret) {
>-		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
>-			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
>+		drm_err(&xe->drm,
>+			"gt%d: TLB invalidation time'd out, seqno=%d, recv=%d [%s]\n",
>+			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv,
>+			xe_tile_drv_err_to_str[XE_TILE_DRV_ERR_GGTT]);
>+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GGTT);
> 		return -ETIME;

Should there be a more fine grained counter here and elsewhere?
For eg., this could be XE_TILE_TLB_INVAL_ERR instead of generic ERR_GGTT.
(btw, it is ppgtt tlb invalidation, not ggtt).

Niranjana

> 	}
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 84f0b5488783..a006de620b82 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -663,8 +663,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> 			     50000, &reply, false);
> 	if (ret) {
> timeout:
>-		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
>-			request[0], reply);
>+		drm_err(&xe->drm, "mmio request %#x: no reply %#x [%s]\n",
>+			request[0], reply, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
> 		return ret;
> 	}
>
>@@ -697,16 +698,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> 		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
> 		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
>
>-		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
>-			request[0], error, hint);
>+		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x [%s]\n",
>+			request[0], error, hint, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
> 		return -ENXIO;
> 	}
>
> 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
> 	    GUC_HXG_TYPE_RESPONSE_SUCCESS) {
> proto:
>-		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x\n",
>-			request[0], header);
>+		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x [%s]\n",
>+			request[0], header, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
> 		return -EPROTO;
> 	}
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index 8b686c8b3339..f68d7fc2c486 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -732,8 +732,10 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>
> 	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> 	if (!ret) {
>-		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
>-			g2h_fence.seqno, action[0]);
>+		drm_err(&xe->drm,
>+			"Timed out wait for G2H, fence %u, action %04x [%s]",
>+			g2h_fence.seqno, action[0], xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
> 		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
> 		return -ETIME;
> 	}
>@@ -744,8 +746,10 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> 		goto retry;
> 	}
> 	if (g2h_fence.fail) {
>-		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d",
>-			action[0], g2h_fence.error, g2h_fence.hint);
>+		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d [%s]",
>+			action[0], g2h_fence.error, g2h_fence.hint,
>+			xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
> 		ret = -EIO;
> 	}
>
>@@ -840,8 +844,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> 	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
> 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
> 		drm_err(&xe->drm,
>-			"G2H channel broken on read, origin=%d, reset required\n",
>-			origin);
>+			"G2H channel broken on read, origin=%d, reset required [%s]\n",
>+			origin, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
> 		ct->ctbs.g2h.info.broken = true;
>
> 		return -EPROTO;
>@@ -859,8 +864,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> 		break;
> 	default:
> 		drm_err(&xe->drm,
>-			"G2H channel broken on read, type=%d, reset required\n",
>-			type);
>+			"G2H channel broken on read, type=%d, reset required [%s]\n",
>+			type, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
> 		ct->ctbs.g2h.info.broken = true;
>
> 		ret = -EOPNOTSUPP;
>@@ -918,12 +924,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> 							   adj_len);
> 		break;
> 	default:
>-		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
>+		drm_err(&xe->drm, "unexpected action 0x%04x [%s]\n",
>+			action, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
> 	}
>
> 	if (ret)
>-		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
>-			action, ret);
>+		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d [%s]\n",
>+			action, ret, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
>
> 	return 0;
> }
>@@ -958,8 +967,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
> 	if (len > avail) {
> 		drm_err(&xe->drm,
>-			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
>-			avail, len);
>+			"G2H channel broken on read, avail=%d, len=%d, reset required [%s]\n",
>+			avail, len, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
> 		g2h->info.broken = true;
>
> 		return -EPROTO;
>@@ -1026,9 +1036,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
> 		drm_warn(&xe->drm, "NOT_POSSIBLE");
> 	}
>
>-	if (ret)
>-		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
>-			action, ret);
>+	if (ret) {
>+		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d [%s]\n",
>+			action, ret, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
>+	}
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index d9375d1d582f..8fb180f706f4 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -196,9 +196,11 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>
> 	/* Blocking here to ensure the results are ready before reading them */
> 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
>-	if (ret)
>-		drm_err(&pc_to_xe(pc)->drm,
>-			"GuC PC query task state failed: %pe", ERR_PTR(ret));
>+	if (ret) {
>+		drm_err(&pc_to_xe(pc)->drm, "GuC PC query task state failed: %pe [%s]",
>+			ERR_PTR(ret), xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM);
>+	}
>
> 	return ret;
> }
>@@ -218,9 +220,11 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> 		return -EAGAIN;
>
> 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>-	if (ret)
>-		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe",
>-			ERR_PTR(ret));
>+	if (ret) {
>+		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe [%s]",
>+			ERR_PTR(ret), xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM);
>+	}
>
> 	return ret;
> }
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 870dc5c532fa..208ffde879ed 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1497,13 +1497,17 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
> 	struct xe_exec_queue *q;
>
> 	if (unlikely(guc_id >= GUC_ID_MAX)) {
>-		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
>+		drm_err(&xe->drm, "Invalid guc_id %u [%s]",
>+			guc_id, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
> 		return NULL;
> 	}
>
> 	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
> 	if (unlikely(!q)) {
>-		drm_err(&xe->drm, "Not engine present for guc_id %u", guc_id);
>+		drm_err(&xe->drm, "Not engine present for guc_id %u [%s]",
>+			guc_id, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
> 		return NULL;
> 	}
>
>@@ -1532,7 +1536,9 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> 	u32 guc_id = msg[0];
>
> 	if (unlikely(len < 2)) {
>-		drm_err(&xe->drm, "Invalid length %u", len);
>+		drm_err(&xe->drm, "Invalid length %u [%s]",
>+			len, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
> 		return -EPROTO;
> 	}
>
>@@ -1542,8 +1548,10 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>
> 	if (unlikely(!exec_queue_pending_enable(q) &&
> 		     !exec_queue_pending_disable(q))) {
>-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
>-			atomic_read(&q->guc->state));
>+		drm_err(&xe->drm, "Unexpected engine state 0x%04x [%s]",
>+			atomic_read(&q->guc->state),
>+			xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
> 		return -EPROTO;
> 	}
>
>@@ -1577,7 +1585,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> 	u32 guc_id = msg[0];
>
> 	if (unlikely(len < 1)) {
>-		drm_err(&xe->drm, "Invalid length %u", len);
>+		drm_err(&xe->drm, "Invalid length %u [%s]",
>+			len, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
> 		return -EPROTO;
> 	}
>
>@@ -1587,8 +1597,10 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>
> 	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
> 	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
>-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
>-			atomic_read(&q->guc->state));
>+		drm_err(&xe->drm, "Unexpected engine state 0x%04x [%s]",
>+			atomic_read(&q->guc->state),
>+			xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
> 		return -EPROTO;
> 	}
>
>@@ -1611,7 +1623,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> 	u32 guc_id = msg[0];
>
> 	if (unlikely(len < 1)) {
>-		drm_err(&xe->drm, "Invalid length %u", len);
>+		drm_err(&xe->drm, "Invalid length %u [%s]",
>+			len, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
> 		return -EPROTO;
> 	}
>
>@@ -1646,7 +1660,9 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> 	u32 guc_id = msg[0];
>
> 	if (unlikely(len < 1)) {
>-		drm_err(&xe->drm, "Invalid length %u", len);
>+		drm_err(&xe->drm, "Invalid length %u [%s]",
>+			len, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
> 		return -EPROTO;
> 	}
>
>@@ -1672,7 +1688,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
> 	u32 reason;
>
> 	if (unlikely(len != 3)) {
>-		drm_err(&xe->drm, "Invalid length %u", len);
>+		drm_err(&xe->drm, "Invalid length %u [%s]",
>+			len, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
> 		return -EPROTO;
> 	}
>
>@@ -1681,8 +1699,11 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
> 	reason = msg[2];
>
> 	/* Unexpected failure of a hardware feature, log an actual error */
>-	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
>-		guc_class, instance, reason);
>+	drm_err(&xe->drm,
>+		"GuC engine reset request failed on %d:%d because 0x%08X [%s]",
>+		guc_class, instance, reason,
>+		xe_gt_drv_err_to_str[XE_GT_DRV_ERR_ENGINE]);
>+	xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_ENGINE);
>
> 	xe_gt_reset_async(guc_to_gt(guc));
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index def9369eb488..3b773d055871 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -18,6 +18,7 @@
> #include "xe_guc.h"
> #include "xe_hw_engine.h"
> #include "xe_mmio.h"
>+#include "xe_tile.h"
>
> /*
>  * Interrupt registers for a unit are always consecutive and ordered
>@@ -222,8 +223,9 @@ gt_engine_identity(struct xe_device *xe,
> 		 !time_after32(local_clock() >> 10, timeout_ts));
>
> 	if (unlikely(!(ident & INTR_DATA_VALID))) {
>-		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
>-			bank, bit, ident);
>+		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid! [%s]\n",
>+			bank, bit, ident, xe_tile_drv_err_to_str[XE_TILE_DRV_ERR_INTR]);
>+		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR);
> 		return 0;
> 	}
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>index 87adefb56024..46ec3ade5577 100644
>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>@@ -126,11 +126,13 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>
> fail:
> 	xe_gt_err(gt,
>-		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
>+		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d [%s]\n",
> 		  idx, e->clr_bits, e->set_bits,
> 		  str_yes_no(e->reg.masked),
> 		  str_yes_no(e->reg.mcr),
>-		  ret);
>+		  ret,
>+		  xe_gt_drv_err_to_str[XE_GT_DRV_ERR_OTHERS]);
>+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
> 	reg_sr_inc_error(sr);
>
> 	return ret;
>@@ -207,7 +209,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
> 	return;
>
> err_force_wake:
>-	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>+	xe_gt_err(gt, "Failed to apply, err=%d [%s]\n",
>+		  err, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_OTHERS]);
>+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
> }
>
> void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>@@ -235,8 +239,10 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> 	xa_for_each(&sr->xa, reg, entry) {
> 		if (slot == RING_MAX_NONPRIV_SLOTS) {
> 			xe_gt_err(gt,
>-				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
>-				  hwe->name, RING_MAX_NONPRIV_SLOTS);
>+				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more [%s]\n",
>+				  hwe->name, RING_MAX_NONPRIV_SLOTS,
>+				  xe_gt_drv_err_to_str[XE_GT_DRV_ERR_ENGINE]);
>+			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE);
> 			break;
> 		}
>
>@@ -259,7 +265,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> 	return;
>
> err_force_wake:
>-	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>+	drm_err(&xe->drm, "Failed to apply, err=%d [%s]\n",
>+		err, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_OTHERS]);
>+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 708dd385f2b1..6f70e4cf3e03 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -71,6 +71,11 @@
>  *  - MOCS and PAT programming
>  */
>
>+const char *const xe_tile_drv_err_to_str[] = {
>+	[XE_TILE_DRV_ERR_GGTT] = "GGTT",
>+	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
>+};
>+
> /**
>  * xe_tile_report_driver_error - Count driver error for tile
>  * @tile: Tile to count error for
>diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
>index 092a6b17a97e..a0e7a95f53e5 100644
>--- a/drivers/gpu/drm/xe/xe_tile.h
>+++ b/drivers/gpu/drm/xe/xe_tile.h
>@@ -14,6 +14,7 @@ int xe_tile_alloc(struct xe_tile *tile);
> int xe_tile_init_noalloc(struct xe_tile *tile);
>
> void xe_tile_migrate_wait(struct xe_tile *tile);
>+extern const char *const xe_tile_drv_err_to_str[];
> void xe_tile_report_driver_error(struct xe_tile *tile,
> 				 const enum xe_tile_drv_err_type err);
>
>-- 
>2.25.1
>
