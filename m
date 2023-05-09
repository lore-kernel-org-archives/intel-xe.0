Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFDCC7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 02:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9888910E161;
	Tue,  9 May 2023 02:44:45 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA33910E161
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 02:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683600283; x=1715136283;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=495G/XcWG8eHnQJiW+BCBQQYO2okwaHlfq+3wWZKHVQ=;
 b=OJUpjiJ4XJqjA5fPs0J+XfuajmXzNtlogHgDiJKEkQbVSzIxAlRQys3+
 bVTXqaD3mrh9E31GOTCWYnYwN1ihGR/yKYk/yNz4Yi+cE7zXfabpmUHUd
 SXE/t1ZOED12XTJcHfzsRGHebopplR9qF7ZiYilDXGG1wsJcAiEeIcJJG
 66gSIuGuIVSAawa7eWxQJXGOtoofuslNO4S2FjQ1EF7Jw5JYefecT6v+b
 troOFc/vKn32e5mXi49BT3lyuock7H39Cw6sH1a8zmL7ljGWwTd7jt1jc
 9jVy+p80QpX+KGVpy68YYC1WrX3WL+RyzPdQBc6NFDsBx5bgQ28TCmRi/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="351963188"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="351963188"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 19:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="810482787"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="810482787"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 08 May 2023 19:44:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 19:44:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 19:44:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 19:44:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 19:44:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2ZnZI1Lf3iS9S7XLMs9owWRtKXLfOEy7NxifnIBn7zhLMvupLlLAuCqG6eq0xcjG+TbKfE//6+7Fcih6U0PeUxdpSsA+2W7bSVel1Fod5UmSAUt5tmynUK5is7r4KyioQ2WwWLUaIpPyuFQG7Fv8uSyLo29OEtGB396fANxWtALwOuRfTbwrCv/m+Ye3G5h4xdmGRrgejHofDHRSjfx+SQkVdrF2VJCeOBK/qcSrt7DhW4nNEEYw/80JwOYrIG5KO6y+btYUJvnepqt4+vnAE0G8UJJiRE1kuYocd6Q/5GjUSF5cl9sy4F5cF61HCJVUjC4yQQdt7Oa4MBHG7PnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BymRIIzE7QBfloGCJNzhSK/hS5L5uTEs5FpxaO4aHrU=;
 b=Ad/N5hp5rA/YV2CirE4UKi4S+/6HnRV1UbRLJn4xVWsQ6AXZRi8vLg7Ocu2fa4pFQ9PXkk9bkboB0eHhLQXNWopaLR59hh7hlSzrfUvbbDNQ26KrZp+xR8fdT9/qzpT7ptJUu0XNWPfmku+o5YjXqgP6qSOV3LJBnEyiSj1V0u97X7Tz9QwKfjR67oURNJLa1Z+/ZJYSGSl+WTL/qL2rfwuV6TcEHuB9O3ZKdgQQXRgPc578nl5kV9VPktN0Gu/SCF9Up15j0/MKTtC4tFXckoQNBLgdWFRABz7uQ0JJD4SINbotpw5Yv/pn0WLZh+7mnXSRZemBbRZZOR1PwjvHhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7473.namprd11.prod.outlook.com (2603:10b6:a03:4d2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 02:44:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 02:44:33 +0000
Date: Tue, 9 May 2023 02:44:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZFmzcaKUW5CdvPtE@DUT025-TGLU.fm.intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
 <20230508210825.1405432-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230508210825.1405432-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a03:505::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 0490e1d3-ac2e-4eb2-2db9-08db503751b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p8SycmWJxzEobgIYUxQXuF2DN/eS6rvj5z02jusAs7HUe79dlPEU8DBCCUkUGLcXsx8d849y+RHKNDeiNyzmnt9IZLkYMuvczC9FVGfZixTQV47Pjp2q1fSpXU5FTFZpMwetSuXDSorTfQpeXLQ1hgeaU/u515oCpqQitsYaWMBXlvXiD531rbtphGViSwBca8yeEtl6onW9Ozf8qbo76cpqa0ULWW0IUAbKNuJYWRUdsYW5x6CYo3rpGPisOVkokLxa4L+d2aEirJPcZKDWcwLvWDyv7IjrPNim7AyfpmpOO7T2WyBUxzpVey+/xk1ADl4JQ2BQLi+BGJ10Nuw1hZZumhJERQg8iqZS0opDEnqvLiqQlM3rIeeonV0PyJO6jrndF/kxOtrjz9kUr5jnP8Ntfci7y5Ty/3gOx0mZA5T12toM350/cfV9ihvrQjN4Omec4T6WrscFi3G9otkcShJ7hivDU5Tpi/26MJBTsCnCOJkc6XEDF4M/oyR6eGDc+O3oVzOdzd/bimRwOp+eKYjnn3ufB/jSIEPQpePQcV+dBflll1A2L4Ft1d12klZP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199021)(66556008)(4326008)(66946007)(316002)(478600001)(6636002)(86362001)(6486002)(66476007)(83380400001)(6512007)(6506007)(26005)(6666004)(2906002)(5660300002)(41300700001)(30864003)(8936002)(8676002)(6862004)(82960400001)(38100700002)(44832011)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j2uETBuBK4YCdtNqp64z6GLXL1/5Yq8Bq9t+Rq0tKXefDm7KKdggoV066+xe?=
 =?us-ascii?Q?ifZ4ZVIwA7l073hTgeVFufoGkpPIO6F6f/Ec3KUjNDCFc40PO/3sgiX65lio?=
 =?us-ascii?Q?xq+m9tKM2PSYeIkjTNwQJwb76/bzTdwUEpMv8+LRziMokvBmZxCx66BeU8JY?=
 =?us-ascii?Q?pneIEScjShlqhWrvBzY+LPcPuBa/8sfMUTr1Rtm/DfbBQdGCHWtm/Be4uMWr?=
 =?us-ascii?Q?PdgY9rWGFx6nsNh4dt4gAZonYcH83cGjE2zcQfEylahlcOTnbvbnoqlFV9C7?=
 =?us-ascii?Q?DHkoeMHUQc+dIv3qrDnEqtqxhXoI6LHcJGYE45sOYfwRzGMcaCdRa0GjI+jx?=
 =?us-ascii?Q?QiYJmOMofJ708reKUgt1IrOARq+aLcnTcSj+WXPuZmW5e45VeGycgs8dsk61?=
 =?us-ascii?Q?doAKBw63uD3Zq5Ex6gdAV5htvkpuUsNq3r+OZKQj/yl7X8D2mPU7qPTEyjNn?=
 =?us-ascii?Q?Rt6rpSUucvAaYmBUVmz8k4GMjgi70ak6pJ/PQI6pb6zPqczOd/ArLMReCJuw?=
 =?us-ascii?Q?THb23nVpULjsUcDwvceUA9iFFZ8m/PCCrMb5cLQaZ4s3SaGc6WlkRCtEvII+?=
 =?us-ascii?Q?fZkLb+iugpUjpOSfabnTEg3ZCPKBgpPDb47ZnVwGPAZFuE6UFZOVr38EtLDX?=
 =?us-ascii?Q?8vAZ7wSKe2MRdhL2VuRu7MDmebC/fb+Avwyi3U0T5gy0fqwkidHgEDsSNBUy?=
 =?us-ascii?Q?tioaL8gWBgcoQz8Bnt8gmrIjegEnK0ToFndOyKCSldmpALAwcmY0OzPOX0KW?=
 =?us-ascii?Q?ZSwXYiivCzj9g7POJLQZ3yBuBjthlMwUSrzbhN05hGk0djnMTXHoODzTxqG+?=
 =?us-ascii?Q?K1xoCj1Ked5be6CGPgtyYzXNWAFxsPg+jHfj0cmO0S7lf61X3xsXsZNHoo7M?=
 =?us-ascii?Q?wbe7Ay2UF+nCKSbOLQICkF2+VQDAXOjxWXHvu24AU7oH0dqgfHcV/noB4lqf?=
 =?us-ascii?Q?dBQMso33YNNWLFQR1+mVqHR3cuq51kGVI6hZj9aSvpvlDPaOtO654DCdrEwd?=
 =?us-ascii?Q?z/ZHhpn13J27VJnpRtdzfAa+VzWNPam0s6++dtkm/JKseRlFRTW29F/HDe92?=
 =?us-ascii?Q?JGwQEK4npM2GJiIt/OPRIm0DmwRHDeofE+1WsV5UiLWGH7pCbXC3+2UVKxh7?=
 =?us-ascii?Q?jx3PGVVA298NyNfRPvwA12qbFJZDsBZIvHYD2mR7OAoF15HkEy0XqSpqRUEL?=
 =?us-ascii?Q?3BDhDTjwRKfs/Ge4hCrIVfH1E7pdpbScKisBP+ZyMp4ZnEAM1vIzuaogT6ZM?=
 =?us-ascii?Q?OJOMquq+7f4IEJiYb+wl3LlId7EW0ena4zWD9ihb4gHZFGmMxq7n+AxOJxdT?=
 =?us-ascii?Q?f0Lzm2e0D2B3dkqTk3pEj1b5fGleSqaDE4xKx4vVKxM9rVkO/AleZjm6q9FD?=
 =?us-ascii?Q?EUy1RV1M8IDryjag3vOcfSPurQgnp6UsSpnyCyMvebJxItmhGHJvNT0DCUnp?=
 =?us-ascii?Q?cRpULCI9v+jBGF6BZnfOQsLkTbv6sQNwS49N1Ovqi+QBpL4OEYvxNlygAwd0?=
 =?us-ascii?Q?vLKTQyh27gFTVZCHmNEC0ERBwUFpRgDgWpcx0TRvTDrDWFm6TWQ9hiFUiZpP?=
 =?us-ascii?Q?/FjsKSKi8hZGBoy4h0H0x79WojVjs8Iei20y1kxSqgjANri0uIM77mHXrP+V?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0490e1d3-ac2e-4eb2-2db9-08db503751b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 02:44:33.0666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3zcTL6UWv2PNdzvCWKC1fs9Pg3z7mZ0j+YT0uCNzFj77GNRs4PWHj8M+RkhvRF4jtKzfv+zFkxhYO39Xfpfrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7473
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 04/11] drm/xe: Convert GuC CT print to
 snapshot capture and print.
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

On Mon, May 08, 2023 at 05:08:18PM -0400, Rodrigo Vivi wrote:
> The goal is to allow for a snapshot capture to be taken at the time
> of the crash, while the print out can happen at a later time through
> the exposed devcoredump virtual device.
> 
> v2: Handle memory allocation failures. (Matthew)
>     Do not use GFP_ATOMIC on cases like debugfs prints. (Matthew)
> v3: checkpatch fixes
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c          |   2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 166 +++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc_ct.h       |   8 +-
>  drivers/gpu/drm/xe/xe_guc_ct_types.h |  26 +++++
>  drivers/gpu/drm/xe/xe_guc_submit.c   |   2 +-
>  5 files changed, 179 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 62b4fcf84acf..985f6e901ee4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -856,6 +856,6 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  
> -	xe_guc_ct_print(&guc->ct, p);
> +	xe_guc_ct_print(&guc->ct, p, false);
>  	xe_guc_submit_print(guc, p);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index e16e5fe37ed4..d66e595c8020 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -595,7 +595,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  broken:
>  	drm_err(drm, "No forward process on H2G, reset required");
> -	xe_guc_ct_print(ct, &p);
> +	xe_guc_ct_print(ct, &p, true);
>  	ct->ctbs.h2g.info.broken = true;
>  
>  	return -EDEADLK;
> @@ -1088,38 +1088,40 @@ static void g2h_worker_func(struct work_struct *w)
>  			struct drm_device *drm = &ct_to_xe(ct)->drm;
>  			struct drm_printer p = drm_info_printer(drm->dev);
>  
> -			xe_guc_ct_print(ct, &p);
> +			xe_guc_ct_print(ct, &p, true);

Does this need to atomic because this in the dma-fence signaling path? I
checked and I don't think it is so non-atomic should be fine here.

Other than that this LGTM.

Matt

>  			kick_reset(ct);
>  		}
>  	} while (ret == 1);
>  	xe_device_mem_access_put(ct_to_xe(ct));
>  }
>  
> -static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
> -			     struct drm_printer *p)
> +static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
> +				     struct guc_ctb_snapshot *snapshot,
> +				     bool atomic)
>  {
>  	u32 head, tail;
>  
> -	drm_printf(p, "\tsize: %d\n", ctb->info.size);
> -	drm_printf(p, "\tresv_space: %d\n", ctb->info.resv_space);
> -	drm_printf(p, "\thead: %d\n", ctb->info.head);
> -	drm_printf(p, "\ttail: %d\n", ctb->info.tail);
> -	drm_printf(p, "\tspace: %d\n", ctb->info.space);
> -	drm_printf(p, "\tbroken: %d\n", ctb->info.broken);
> +	xe_map_memcpy_from(xe, &snapshot->desc, &ctb->desc, 0,
> +			   sizeof(struct guc_ct_buffer_desc));
> +	memcpy(&snapshot->info, &ctb->info, sizeof(struct guc_ctb_info));
>  
> -	head = desc_read(xe, ctb, head);
> -	tail = desc_read(xe, ctb, tail);
> -	drm_printf(p, "\thead (memory): %d\n", head);
> -	drm_printf(p, "\ttail (memory): %d\n", tail);
> -	drm_printf(p, "\tstatus (memory): 0x%x\n", desc_read(xe, ctb, status));
> +	snapshot->cmds = kmalloc_array(ctb->info.size, sizeof(u32),
> +				       atomic ? GFP_ATOMIC : GFP_KERNEL);
> +
> +	if (!snapshot->cmds) {
> +		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CTB info will be available.\n");
> +		return;
> +	}
> +
> +	head = snapshot->desc.head;
> +	tail = snapshot->desc.tail;
>  
>  	if (head != tail) {
>  		struct iosys_map map =
>  			IOSYS_MAP_INIT_OFFSET(&ctb->cmds, head * sizeof(u32));
>  
>  		while (head != tail) {
> -			drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
> -				   xe_map_rd(xe, &map, 0, u32));
> +			snapshot->cmds[head] = xe_map_rd(xe, &map, 0, u32);
>  			++head;
>  			if (head == ctb->info.size) {
>  				head = 0;
> @@ -1131,20 +1133,140 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
>  	}
>  }
>  
> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
> +static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
> +				   struct drm_printer *p)
> +{
> +	u32 head, tail;
> +
> +	drm_printf(p, "\tsize: %d\n", snapshot->info.size);
> +	drm_printf(p, "\tresv_space: %d\n", snapshot->info.space);
> +	drm_printf(p, "\thead: %d\n", snapshot->info.head);
> +	drm_printf(p, "\ttail: %d\n", snapshot->info.tail);
> +	drm_printf(p, "\tspace: %d\n", snapshot->info.space);
> +	drm_printf(p, "\tbroken: %d\n", snapshot->info.broken);
> +	drm_printf(p, "\thead (memory): %d\n", snapshot->desc.head);
> +	drm_printf(p, "\ttail (memory): %d\n", snapshot->desc.tail);
> +	drm_printf(p, "\tstatus (memory): 0x%x\n", snapshot->desc.status);
> +
> +	if (!snapshot->cmds)
> +		return;
> +
> +	head = snapshot->desc.head;
> +	tail = snapshot->desc.tail;
> +
> +	while (head != tail) {
> +		drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
> +			   snapshot->cmds[head]);
> +		++head;
> +		if (head == snapshot->info.size)
> +			head = 0;
> +	}
> +}
> +
> +static void guc_ctb_snapshot_free(struct guc_ctb_snapshot *snapshot)
>  {
> +	kfree(snapshot->cmds);
> +}
> +
> +/**
> + * xe_guc_ct_snapshot_capture - Take a quick snapshot of the CT state.
> + * @ct: GuC CT object.
> + * @atomic: Boolean to indicate if this is called from atomic context like
> + * reset or CTB handler or from some regular path like debugfs.
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis.
> + *
> + * Returns: a GuC CT snapshot object that must be freed by the caller
> + * by using `xe_guc_ct_snapshot_free`.
> + */
> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> +						      bool atomic)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_guc_ct_snapshot *snapshot;
> +
> +	snapshot = kzalloc(sizeof(*snapshot),
> +			   atomic ? GFP_ATOMIC : GFP_KERNEL);
> +
> +	if (!snapshot) {
> +		drm_err(&xe->drm, "Skipping CTB snapshot entirely.\n");
> +		return NULL;
> +	}
> +
>  	if (ct->enabled) {
> +		snapshot->ct_enabled = true;
> +		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> +					 &snapshot->h2g, atomic);
> +		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
> +					 &snapshot->g2h, atomic);
> +	}
> +
> +	return snapshot;
> +}
> +
> +/**
> + * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
> + * @snapshot: GuC CT snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given GuC CT snapshot object.
> + */
> +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> +			      struct drm_printer *p)
> +{
> +	if (!snapshot)
> +		return;
> +
> +	if (snapshot->ct_enabled) {
>  		drm_puts(p, "\nH2G CTB (all sizes in DW):\n");
> -		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.h2g, p);
> +		guc_ctb_snapshot_print(&snapshot->h2g, p);
>  
>  		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
> -		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.g2h, p);
> -		drm_printf(p, "\tg2h outstanding: %d\n", ct->g2h_outstanding);
> +		guc_ctb_snapshot_print(&snapshot->g2h, p);
> +
> +		drm_printf(p, "\tg2h outstanding: %d\n",
> +			   snapshot->g2h_outstanding);
>  	} else {
>  		drm_puts(p, "\nCT disabled\n");
>  	}
>  }
>  
> +/**
> + * xe_guc_ct_snapshot_free - Free all allocated objects for a given snapshot.
> + * @snapshot: GuC CT snapshot object.
> + *
> + * This function free all the memory that needed to be allocated at capture
> + * time.
> + */
> +void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
> +{
> +	if (!snapshot)
> +		return;
> +
> +	guc_ctb_snapshot_free(&snapshot->h2g);
> +	guc_ctb_snapshot_free(&snapshot->g2h);
> +	kfree(snapshot);
> +}
> +
> +/**
> + * xe_guc_ct_print - GuC CT Print.
> + * @ct: GuC CT.
> + * @p: drm_printer where it will be printed out.
> + * @atomic: Boolean to indicate if this is called from atomic context like
> + * reset or CTB handler or from some regular path like debugfs.
> + *
> + * This function quickly capture a snapshot and immediately print it out.
> + */
> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic)
> +{
> +	struct xe_guc_ct_snapshot *snapshot;
> +
> +	snapshot = xe_guc_ct_snapshot_capture(ct, atomic);
> +	xe_guc_ct_snapshot_print(snapshot, p);
> +	xe_guc_ct_snapshot_free(snapshot);
> +}
> +
>  #ifdef XE_GUC_CT_SELFTEST
>  /*
>   * Disable G2H processing in IRQ handler to force xe_guc_ct_send to enter flow
> @@ -1166,7 +1288,7 @@ void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
>  		ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 4, 1);
>  		if (ret) {
>  			drm_printf(p, "Aborted pass %d, ret %d\n", i, ret);
> -			xe_guc_ct_print(ct, p);
> +			xe_guc_ct_print(ct, p, true);
>  			break;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 49fb74f91e4d..3e04ee64652c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -13,9 +13,15 @@ struct drm_printer;
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
> +struct xe_guc_ct_snapshot *
> +xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
> +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> +			      struct drm_printer *p);
> +void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
> +
>  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>  {
>  	wake_up_all(&ct->wq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index 64e3dd14d4b2..93046d95b009 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -48,6 +48,32 @@ struct guc_ctb {
>  	struct guc_ctb_info info;
>  };
>  
> +/**
> + * struct guc_ctb_snapshot - GuC command transport buffer (CTB) snapshot
> + */
> +struct guc_ctb_snapshot {
> +	/** @desc: snapshot of the CTB descriptor */
> +	struct guc_ct_buffer_desc desc;
> +	/** @cmds: snapshot of the CTB commands */
> +	u32 *cmds;
> +	/** @info: snapshot of the CTB info */
> +	struct guc_ctb_info info;
> +};
> +
> +/**
> + * struct xe_guc_ct_snapshot - GuC command transport (CT) snapshot
> + */
> +struct xe_guc_ct_snapshot {
> +	/** @ct_enabled: CT enabled info at capture time. */
> +	bool ct_enabled;
> +	/** @g2h_outstanding: G2H outstanding info at the capture time */
> +	u32 g2h_outstanding;
> +	/** @g2h: G2H CTB snapshot */
> +	struct guc_ctb_snapshot g2h;
> +	/** @h2g: H2G CTB snapshot */
> +	struct guc_ctb_snapshot h2g;
> +};
> +
>  /**
>   * struct xe_guc_ct - GuC command transport (CT) layer
>   *
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 231fb4145297..9e2950f1fd0d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -764,7 +764,7 @@ static void simple_error_capture(struct xe_engine *e)
>  		}
>  
>  		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> -		xe_guc_ct_print(&guc->ct, &p);
> +		xe_guc_ct_print(&guc->ct, &p, true);
>  		guc_engine_print(e, &p);
>  		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
>  			if (hwe->class != e->hwe->class ||
> -- 
> 2.39.2
> 
