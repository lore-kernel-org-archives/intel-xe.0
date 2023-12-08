Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13760C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 19:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E2510EB0B;
	Fri,  8 Dec 2023 19:38:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE22F10EB0B
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 19:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702064316; x=1733600316;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q30rn0sQobXocoX1ODruKpm76WmLckR8EycMop7ogFs=;
 b=Q1j6C8JTnkR3d/sa6J06l3B/O4w2yfujwGWmDi1cnJW4q7cWoMqrfSPI
 lth2mFKOrO6KRSp56gXLYYU+XhZumpXk2/LfcLPd3qT6SOUa7UowtdewG
 AQdQCi3EIIEXDGCqxjx3r0FHvNRmfT9mW2JuEorOe3MGeMpKr0hpbE5qQ
 Nd5WLPW6dWfj2z6YRcbVyfbtPfx4OIr3x6wT93Nio5/5XK6xxjyDpdZIk
 scLrg6PT9WfrdOjhuztbrXeLtehDULV+WJl80xsK6XSMBamluFfKZgLMO
 uectMNMZl+8eqM/FyhPsu+d6Rt+/p8d1lM1eY/IV+/woiKWwxH52METp+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="480647644"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="480647644"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 11:38:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="20202518"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 11:38:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:38:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:38:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 11:38:35 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 11:38:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJ5O2EWhZoGvZ06iPQXZQYJj6Neqk/7kotIRuGHht9+P8T8TRFTiSzRhnFXVHjagFALjMoUVd8LIU7Z+1BkxNDh0FBI+gLqUcrEgnhbPBtzAMB7QzJ2QnA6M7CKu7JstXlajYZ2Trfoc3Ltcd8tXDXF4bZGL1N7P9WFM/BadTwL+U3Vjr7m+Q7U9P9cIrp5fORIOIQpPf3VePZHiGq2o9Nk9FMkIPZQYwwMx70q/9nm3ZIlPT+rwvL9ULEK6T2apsdTf8D0Tcdy+GB2BpbAAtOuqpg99bpk+QeGipBshz45FuSbU3Pvk0e14aK/PYadJqiAVgDx8nrZlXXaXvAyx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fttC7XmXCrlsAe+Yu94qzPYVM/N6CRdtJD+pBEyHX8=;
 b=Xc5NiGfw47ToqgI5pvzw9LZA+i9oF1aZU6zkEzKVyDgqHysYZtH5wtSs3MxjITqzfO4SfCdm89aSB1NIaYpa3YZO7A68Rut0RLl+7/+pWerMdadOmO2qyRAb4X7uFAUal1y/yH0lNSwszeFVpNr+yesKXZ35TxWXeQh96mxlgtxSGMb3E+y4aeVMp+fgf8FqyFs90R8SPGeXy0d475LVudAMRBlwvS9zGnBZzZI3bzXqXal75IU4767w3ry5UysWQLs1/7piIGRiTcaeqFvEcXFn7xysSCh5Yp1LF+ZW0ROPnzNrwsbiLv0StPSAYPiEqnbfeRn84iawW3yvGTCoeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 19:38:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 19:38:31 +0000
Date: Fri, 8 Dec 2023 12:37:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe/uapi: Return correct error code for
 xe_wait_user_fence_ioctl
Message-ID: <ZXMODCS88DhGHamf@DUT025-TGLU.fm.intel.com>
References: <20231208041716.32369-1-krishnaiah.bommu@intel.com>
 <20231208041716.32369-3-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231208041716.32369-3-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: 07fb687a-5ad5-4029-d07c-08dbf825426e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CzfHUyAbrUEdDdFq+P1QNUQdsL9B0lQc6U6X21gS9MoHWFGqYj7aLUaMR7qTGMtR57zf9nmp92GTRazsRjERyZSZ/bgcNy932by4dznXaojRzCP1XlU007XlsO2FXOid3HgekMzNRbu71oMzAWbDnREVOr9Q5K3IvkmtlQMtJyhBeA3iPCdrELgMCh9qMkFptGJoaOumh9OLLVJcIsrwFaNpd74S/5PSMyaoTNXwApa6jVFHRFi9gL4S0LjZbDNskYEfYR48ngtiJU7bDGL+CApQu98iTKg8+7AmtAPgn3W3D5wwizu6P+q0QSG4SA6KX5i5gblQofp4eQhQsbgBrlPGrUKRFbdMqyQgcMJMDamKXC+72IUFHhCEDAProqIZEnHscaHnOUnj2sP5t9IjmWvBRnbKWHfTbQWjQ7sbO7MMsf3B7Xlp3Tk8729VaMBq+BCFEoUwNACCrnFiKnfJaxD4Jhaxto9uM5guvN2ecK3sCqN4p6ndPPOe+0n+JClonGMCstdhwzk0baFBxtGrdnsspVWUF4u5fEwFGgyhuyCWSrWYC9/z8pWEnZfmbdQx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(376002)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(6512007)(83380400001)(107886003)(86362001)(26005)(82960400001)(6506007)(6486002)(478600001)(6636002)(66556008)(4326008)(8676002)(66946007)(66476007)(54906003)(6862004)(8936002)(316002)(2906002)(41300700001)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oncRRl6LN0OXHHWq1sT/+ySYa9AoQo4GeSbGNiAYI1fBGEgGUja89BN/dDPe?=
 =?us-ascii?Q?KMGT1UuDSyr03lwTT/BxC2MD3dgO6MILhcua8a3WQ7YTVZaURGrcjW5hl4zZ?=
 =?us-ascii?Q?ksfIgbW+qYOeCe3ZsiSn8B5yC7Tb7Gk137Y0Gdowi7B3vMYyKXFmsZMs/FHo?=
 =?us-ascii?Q?2iyvwZuIL0jQuqcCb7Gi5kKkuA7rxKhcL/L6JUFFkpI+arLpTQrJpQr7uFfN?=
 =?us-ascii?Q?aRQp/hKSlF1lRTCAWvO9gbK30LzlZJBKgKohZYnIbfVfeY4+YkdAQRK8JRSe?=
 =?us-ascii?Q?MWd/3QNZoCrN6jn+zToH2iCdwK6pWYWD7SZZV0NMIbKIwVOheaumsVRRN6tx?=
 =?us-ascii?Q?Md+mn3gXRQ+FPjp6thAVCgTFUuRtpF2OM+JeU2bI6R3M5cwntTurU9ino2p3?=
 =?us-ascii?Q?xLGx6mWe4Nb7GFhi28Tyneb+3CXmIg/TytMzjHAa7VwXj+Q24FQiMy3kyYB4?=
 =?us-ascii?Q?Dk2jrdwHgjZOxs7SEcqm/fbUQNC68RAnA3Ety+S2w0u5k1iltnN0lBTVPg5t?=
 =?us-ascii?Q?u7FydxqAmuNR1ZOGD3d3QZ6vPmdiXT89ZhhIGuUOoprapCPDSefbYkFfeYXV?=
 =?us-ascii?Q?a8nPPzrsEIC4IEeC98ro44va1B1pw7jP+Reuy6tZeXQ7kh8rFE74U6IdMaTz?=
 =?us-ascii?Q?C30ZbUN9PcPsZHkh4eJqCTAI7kxvcAytefCQJFB8IesIuzGjrqa711XeS6dc?=
 =?us-ascii?Q?9SxnuC6MubYC8lj14jqpzOx/4MVSulH8Mn+BEmSfW7JngcXBf1uSmq8CUcfr?=
 =?us-ascii?Q?kg/60TzXvR66UKWub3JwiV0rtUQ617Kkv8DVk+MKTgEtGfSBLq156/Tk7ZBJ?=
 =?us-ascii?Q?j1QwWH3zSHTVMtfBL9K4qNe+RlwoZAo2oqmL34G2WN0Ao7kfYftvMR18dFb/?=
 =?us-ascii?Q?X9p1tWCZzxGf3z05knCctMXoSkg1M64U6zWuCzbF793Y7VgpSYBM1lapqXt7?=
 =?us-ascii?Q?+X6c10H5dZquOAmuxeL9dWTwA9GNy51c615mJLjBWUp8aUFXz1B1fASqYdl8?=
 =?us-ascii?Q?ErJXP0P4FRP4Edahb6eDWjWsRVc6/QbwzyIxAu9HAMWcTv//538wWnkrhXxL?=
 =?us-ascii?Q?ueJaDg+k3iaxJKL6V/zACAF3ToPPgdxImFftWPQVbUQFlGNhK3umEIzFtWc7?=
 =?us-ascii?Q?ttHEeWeQ8TWzYNq5BCJM814OECaScp4BCDaxt3KzHcxlkggFnscK0WMUBqzy?=
 =?us-ascii?Q?r0rpgoN24Fbie3fOnz5ZcEHaeAzgSBcYwIwqRKdiVHVDx74Z8QoIPw/9oZ7R?=
 =?us-ascii?Q?/t/+/YgY1RR/py26la+9x9bsv1d4s6p+pK0lPefCq7qotQzAP5nzAnNJ22KO?=
 =?us-ascii?Q?ijyRwEwVYsKgGS6hipYjF1jOnIPz9+lwmzNRe07yL5Xn5M+D6VrOJhxFv7a1?=
 =?us-ascii?Q?9ODz8hTkNWnjQEudIZ0vlgdUOqectMYNjoi2JoUy7jocfONHi1EvDbNl0+A4?=
 =?us-ascii?Q?lorTVCfejMsBA9spOfkP0BKHaQ8/ADkaJXo7wilAcnqvxBakxTbHOzSgUEYn?=
 =?us-ascii?Q?39inuoqoyLS9Ky4KXKFvc2OSbIs/thxfv2f87JVceG8cPziqKY9dDFW90H8p?=
 =?us-ascii?Q?ufhtecqvPgdv0eZJyeWj5/oCWQ3R/1entofY02pfVa3AEsmwiE2d4dTpAzQN?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fb687a-5ad5-4029-d07c-08dbf825426e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 19:38:31.6163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxSV9KGgd7SeUpylO7QhThJQhAWUgV40CuP0t/Wb9Ge2Emg67HPhQjYeQKqw15uMNPOFlpbWk7Tt3p0LKh5a8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5896
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

On Fri, Dec 08, 2023 at 09:47:16AM +0530, Bommu Krishnaiah wrote:
> Currently xe_wait_user_fence_ioctl is not checking exec_queue state
> and blocking until timeout, with this patch wakeup the blocking wait
> if exec_queue reset happen and returning proper error code
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_execlist.c         |  7 ++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++++
>  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 30 +++++++++++++++++++-----
>  4 files changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5ba47a5cfdbd..84ccf7242247 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -206,6 +206,8 @@ struct xe_exec_queue_ops {
>  	 * signalled when this function is called.
>  	 */
>  	void (*resume)(struct xe_exec_queue *q);
> +	/** @reset_status: check exec queue reset status */
> +	bool (*reset_status)(struct xe_exec_queue *q);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index e8754adfc52a..dab41e99f3d3 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -446,6 +446,12 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
>  	/* NIY */
>  }
>  
> +static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	/* NIY */
> +	return false;
> +}
> +
>  static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.init = execlist_exec_queue_init,
>  	.kill = execlist_exec_queue_kill,
> @@ -457,6 +463,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.suspend = execlist_exec_queue_suspend,
>  	.suspend_wait = execlist_exec_queue_suspend_wait,
>  	.resume = execlist_exec_queue_resume,
> +	.reset_status = execlist_exec_queue_reset_status,
>  };
>  
>  int xe_execlist_init(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 46b132ee1d3a..a42c3574cbec 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -854,6 +854,10 @@ static void simple_error_capture(struct xe_exec_queue *q)
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
>  
>  	if (xe_exec_queue_is_lr(q))
>  		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> @@ -1394,6 +1398,11 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  	guc_exec_queue_add_msg(q, msg, RESUME);
>  }
>  
> +static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	return exec_queue_reset(q);
> +}
> +
>  /*
>   * All of these functions are an abstraction layer which other parts of XE can
>   * use to trap into the GuC backend. All of these functions, aside from init,
> @@ -1411,6 +1420,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.suspend = guc_exec_queue_suspend,
>  	.suspend_wait = guc_exec_queue_suspend_wait,
>  	.resume = guc_exec_queue_resume,
> +	.reset_status = guc_exec_queue_reset_status,
>  };
>  
>  static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 59af65b6ed89..b0a7896f7fcb 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> +#include "xe_exec_queue.h"
>  
>  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  {
> @@ -100,10 +101,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
>  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>  	struct drm_xe_wait_user_fence *args = data;
> +	struct xe_exec_queue *q = NULL;
>  	u64 addr = args->addr;
> -	int err;
> +	int err = 0;
>  	long timeout;
>  	ktime_t start;
>  
> @@ -121,6 +124,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, addr & 0x7))
>  		return -EINVAL;
>  
> +	if (args->exec_queue_id) {
> +		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> +		if (XE_IOCTL_DBG(xe, !q))
> +			return -ENOENT;
> +	}
> +
>  	timeout = to_jiffies_timeout(xe, args);
>  
>  	start = ktime_get();
> @@ -136,6 +145,14 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			break;
>  		}
>  
> +		if (q) {
> +			if (q->ops->reset_status(q)) {

Nit: My preference is:
if (q && q->ops->reset_status(q)))

Either way, patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +				drm_info(&xe->drm, "exec gueue reset detected\n");
> +				err = -EIO;
> +				break;
> +			}
> +		}
> +
>  		if (!timeout) {
>  			err = -ETIME;
>  			break;
> @@ -151,10 +168,11 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			args->timeout = 0;
>  	}
>  
> -	if (XE_IOCTL_DBG(xe, err < 0))
> -		return err;
> -	else if (XE_IOCTL_DBG(xe, !timeout))
> -		return -ETIME;
> +	if (!timeout && !(err < 0))
> +		err = -ETIME;
> +
> +	if (q)
> +		xe_exec_queue_put(q);
>  
> -	return 0;
> +	return err;
>  }
> -- 
> 2.25.1
> 
