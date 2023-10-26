Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27B4C25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 21:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8552B10E8BD;
	Thu, 26 Oct 2023 21:45:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6AD10E8BD
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 21:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698356727; x=1729892727;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lw25wWqAFBQrX+6+C40fPgbwtPfmORINzcC9AUAQ1/M=;
 b=inpEt64GPvEB2Y8wDaTKEpLLvilAJWPX2tg7H+tmvwf+a45155OySn6P
 B6foyULlbd903et0qMGMpEM364J9uub1Jh8vW6yITzXtEGf4oZ44GrEVs
 syAvveH8UI2YW6fiyTPS/+1BkEaMsNUYi+iBeVHZZUynuPUhSWRpoy9c4
 Msmtg/vc5uD+fyHczx3yGyLEAqUm+dgab9tepoUWLeT8ztMDnpqRbdW4W
 ukdcPCbVU3sc7Cg6Ke/GAca0Mwycnu8EBMlfQae99+uywrGQ9klBk95jm
 NbD0HHt6THgSo8xgsvY2teexxV2zbIvmMr3qa9rgh2QLs/wUY7HD+bSpF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367868316"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; d="scan'208";a="367868316"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 14:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="762995685"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; d="scan'208";a="762995685"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 14:45:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 14:45:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 14:45:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 26 Oct 2023 14:45:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXXYrchFoscIfhWLbN0JrMU1T7HtXf8CtB4p0ARzhYX9KpRI44+r4PfvPeo4vDmlf9gaZwO688XuHJlQfUUwjx1hwsAKi/YEyWlvBEFVhqZyVpJMqZhPKBUWKUymmuCBXksqH9v7NTQVHOmPk/O3wcFq7vaZno/RxJdxCGy7LBaICQfOAHQzf8ZlRx2gt/OgtcqbCvBhm08d76Te50XIxm8UK0MYDpSA9iga6PiVo50vDaquumTX7xDJFbuae74P9ctnR9tDqkYdKjGBAq+jKnaGE3RLvhZovhhuvp+ITI6T5gIN38QQGoO3TEvNUIkWNiVIT6utfLHawg9GUXew8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeBKvWy74i6qKI/GBpo7IjBPpz6UwDcDKMW3B0DBE2E=;
 b=TyxrdxjHlnvRsB/87PrnQvb6GOBOSk4BPjjtOH5F3aM0k+2ItLb+eJCU8C8O6gbqRKiRuHt19ubE3AeTF7cHTBckeO0lv/7baJisRA415uQ4207viojpVi/pfdc4TlPZYhl9/RaUO6O796d3Ad5CzKKVW9QiSs/7G8xmbt4a5PQE2ZC5xKUJfj/90Q/KXoOb0Pyuc3eSqdOBNgDopLCJVxHgtPUTY7ENiD0zbNjprafV6hnMFxmgD54txl8BNcouiYCAWLdtIwI3ymbxvUa/Dk3L87pO44J+z9u5XlWvQtWwd+793RV4VTZ3GVfc3dHzmqHW2LNCl3FVNtyXI8etew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 21:45:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 21:45:16 +0000
Date: Thu, 26 Oct 2023 21:43:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>
Message-ID: <ZTrdm3GnJKJZwWli@DUT025-TGLU.fm.intel.com>
References: <20231026184852.2750479-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231026184852.2750479-1-pallavi.mishra@intel.com>
X-ClientProxiedBy: BYAPR08CA0071.namprd08.prod.outlook.com
 (2603:10b6:a03:117::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a4ffa0-20e3-48d1-ab3b-08dbd66cd6bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nvByEuzM0XFii673S6kQN7zaWhXpmK28JDnXh2XyrPPHgi81mvaq/Kt1pU/O/Tv+WnonX0kVr8rdDvDbXfJTcri7DbVFLWWRRqG61mxbThKZgiKiDOwgrbmdRuhud7cd89x1z1LEVw55iFq1n+pF9udAlUkmTo5EFZH7S3ShFEsKvxUHwtV7xQP4DGXH76fWU3Pu2T4PnEzJ7zCLUmpraILd3g9cpBtnMmYIzcvw74BszOgAVDizlAAxFVisZSTiqI69L3llQpnGRZYywnlslr4a+C8/lCrDrn+Hp07hII7ung0zDhcJP190neLeowTX4iyI/jSsn3A8AV82Krs00SmRPuGPj6PZTgSZ78xu373KQy+Qwr/sVoTxoa83KDCr+HN5sd2Wyl+/uiE1Z97W7eD8ixXT3FMU1szopZ/Ix+subTe/bdabw/UNQPuTxPg+OkkcG3DVzEGXeE3L+BFLNuySAJHjhkm3/ma7yUUBMdEAHjUUSUzkpS+N1D2GceU6/aITa+0nZsdvjkOWkXWuDiexQEso3LqY8aJD1di/ZoXQQGugGxSIAxMsG8ZFgXyz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(376002)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(66556008)(66946007)(6636002)(316002)(8936002)(8676002)(4326008)(6862004)(6486002)(66476007)(5660300002)(6506007)(6512007)(38100700002)(82960400001)(86362001)(2906002)(26005)(6666004)(44832011)(41300700001)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0C2AB6GHY8vwEBeygtlYkIf7mM/lsM+/86a8oEuD4DDrXe6wZRsPuZpbtsiV?=
 =?us-ascii?Q?7VFP71IiPJFpl+A9vZqA15is+J/G9FJiZCoqgb+S++0bjRgaL1jSlo22Mw7A?=
 =?us-ascii?Q?3aAtAdob7K0rOmwkAAlb/iF8NeywLxi4Bt7d+l9uNBT6Zti1JiQlPtd1Fom9?=
 =?us-ascii?Q?2N8SZcySKX+Qbcsfd/qiYnl0osc/QmiqOxGBDc0EEkpDhc28Irq/VzavOsRI?=
 =?us-ascii?Q?OTB0RROm79a4xW1Fd2WbWuuLEOK0j2OHbnd8LhNpkt952hmsCjNFvlghjQSY?=
 =?us-ascii?Q?GGGwpHm7WaEZXYHbTCx5cnvaZ+JpAvaDy7SAEEHuGK2mfqMkjZDUeod5hhP3?=
 =?us-ascii?Q?fSdu840Y9N1ChXfkCf9whDB4DBOEruO5xHaiLX7l9e9HmTLVPX1nr/A4PpCr?=
 =?us-ascii?Q?sxKm39kdB1Yi1WZIkQXCxqOoSGg6uMowLv26kosooGTs91/YLNCmRWk0wmNO?=
 =?us-ascii?Q?dOez8dV9KpraJNO6PqaCVPunQMz+YkEvmVsJG67eqL4CalsipQvl85X7du+H?=
 =?us-ascii?Q?fTm/AdWNPDmOqgINfyq/Ktd5aBGHIdy+KrC89nnlTxXqS8xxiOMqEkGS1twA?=
 =?us-ascii?Q?jBUgOgleOgQu90jxWJ0pkS/SP+NsHTwNzTo5CErsXZH6HpEbIeLeG5CSf8s3?=
 =?us-ascii?Q?8yO3BnBHCShkdTgr01CFViwxi/rk2Ss+qDLrIqjrCgIdovBlYAhLX3p5AuwL?=
 =?us-ascii?Q?+D+3y+KZNMoJVjsat55845sX4q4Ec0CPWSxEFfD1BvDzK+1ACknUvfNB+s0P?=
 =?us-ascii?Q?HF4bR8Kw8FHLwJJIDf/4MlvqJaXPTl6GzgtcO3s4asUJlgXd8gNvzi2uGNtF?=
 =?us-ascii?Q?MdKlromGfmyg8Y8qnF54YA8ua7dZEXcfoW7oEG2coRvw7+6IUgB8l2ews0PN?=
 =?us-ascii?Q?ezjL1oDTopZhBKsRrQte2diPunRuOzidnLgmXhcurl7guLwBozYhceny7Cc2?=
 =?us-ascii?Q?mZkATTGc029ar+3DQAE/BqWLJIcaCHlvd3cd/aG8dE3xKgcASqXAev49wXvG?=
 =?us-ascii?Q?Tcpvt9POaPCCYmIDXd7YS2kxfSX4h1Oq/z7b16pvYhDYUl0nnIND0dBL1Gme?=
 =?us-ascii?Q?XPvi/wqb6H380pt02+4neqo9GdQ3XSgAYgYxMY/j7Z4+xq0ShzpFJfx83xbo?=
 =?us-ascii?Q?CN7ivheQPP1/dcCcU8d1C53LTGqHzeItrTMh4JO8fe61wHZLBeu68oAY83EA?=
 =?us-ascii?Q?PjCUl/dirK6MGn0CVs4vKGm7VtSawot4/YuYLkFcqMPNuJ595gbbxfeJhJuM?=
 =?us-ascii?Q?xH1Vv0/7n4z7rDy+g7cchHqxonaSOFLZvCwQcL7D8T/Mb/uEusU0YgIvLoUE?=
 =?us-ascii?Q?bDXmqKkLE4RBP8j90o0JGFSRLdQElWV7TsBVjSvHfN1H7NtCF+l5kcHn1Ts2?=
 =?us-ascii?Q?zCXY81kO93hPgvXgu78z3JBTnHS5dnmKmHY6cgnomIulqRufgkz1rLeaSycr?=
 =?us-ascii?Q?2S+L/fl/c1JiJKPC/NTbclXrWsipBLOM1Ln6Xe/mDVPbV9fSLSRaYUEtQB8x?=
 =?us-ascii?Q?x4hArVbAZynNBkBlfYbKj8dpwHRjxznzDJ2gYY36XwZo2ryQbL+aOyXA/6ph?=
 =?us-ascii?Q?t5JigIQKuLR0il7ymBuUqJZB7QNk6tvLQlW0hzZmrB9GXkleeiVKnjsPalUR?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a4ffa0-20e3-48d1-ab3b-08dbd66cd6bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 21:45:15.5592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43wH8vq1quaU0rmy3lAKpWw0QpZnyz3CsR9ewCQ4402+AESMHHZmZG9fnJvs7oET4OVUxn7syHNeH17BasjWCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7207
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Dump CTB during TLB timeout
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
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 12:18:52AM +0530, Pallavi Mishra wrote:
> Print CTB info during TLB invalidation
> timeout event.
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index bd6005b9d498..b5c39c55e1fa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -319,6 +319,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_guc *guc = &gt->uc.guc;
> +	struct drm_printer p = drm_err_printer(__func__);
>  	int ret;
>  
>  	/*
> @@ -331,6 +332,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  	if (!ret) {
>  		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
>  			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> +		xe_guc_ct_print(&guc->ct, &p, true);
>  		return -ETIME;
>  	}
>  
> -- 
> 2.25.1
> 
