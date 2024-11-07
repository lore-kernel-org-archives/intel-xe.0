Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F222D5AE6B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 06:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE36610E231;
	Thu,  7 Nov 2024 06:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLfOT+VX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C561F10E231
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 06:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730962060; x=1762498060;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3SE67LTgvqPq0+x69kgbeKMukUZqaCoU2CPR20tjkBI=;
 b=nLfOT+VXbPL1+g8nfQMDTlfcKv5GGB9btIDbL9kDTKr5BI/qIONHzRB/
 2eUqkY+JqJopDImHm5MzjifdzxHX22SHQSJznDkhQWQyTdBolJqAmdDYy
 pR11FyCISYWIcziiFia4RFhtPd4w2wFDlpzv1IDI0lQYeyztt+GhXxACX
 3MMLk5oV8ADQueySYD2l1Mek+7DTvkp4lEzNAnODQ8TCiTublUjDUnp1N
 R2+Qbwip2ReMvwL4UKg+7zmCV5ROz/9wczJD+U4nWs4eG1rYN663XUoCs
 F+u9vcO3RrWH99xYsyKp4thoXZsHr6U391P6JmLO2tJuGVSmX22GwMIiP A==;
X-CSE-ConnectionGUID: gdLxkZ+oSNuwAHkIBk2xgQ==
X-CSE-MsgGUID: TpIh47XHRDiwRnSeWNZ37A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34485197"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34485197"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 22:47:40 -0800
X-CSE-ConnectionGUID: 4auzKSNOQWyamQ4br+044g==
X-CSE-MsgGUID: H16DNHY3TLi7BjhGPFBErw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="89486778"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 22:47:38 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 22:47:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 22:47:38 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 22:47:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANtTZNHJK3g5upPYv9v19LdYWu9JDypK00fVBY3XEXXywf97XzKkthoT+k9L4OlzIz9m6IJYKSDJ0UMGf2DpIYxRScPq0LD6ilrtrRxZEHhwv6L/uMLtZCVK1IhB/2bORo3obZdXQ1fq03FzWPSF5QghetDYJekmTiocucQH1kFXS92wdGG10jdGsy3oR/WVp+otvMp90jGojvGvDZfj6cptCdhDLz63Cx5BK0e56/+We1N1WqxJVGL9zhEb7LQqGDsvftD/tegkQ6Ni/egeu4KVGan+VEP56esrL/lakS+fGMR5f9899czuZGGV882zQaCFF3AqyWDGc3VK0mRDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdgKOQoJI7uUBkGJBjCOHunxXJiqFg1UgXvymEd9YBw=;
 b=o7ErKbmgWXDbwOBNCKficCOmvrsoTyso/Ep9GsZBMdRsmKkeDlgjAy3YFVJxgAL4tQqJJ/4Br+21mJvFLKa6QLw/ajXgn/byl0ZIQYKc5mnmJmSzcii4x6oFlRHdE4IuK9uie34VkQuOWUN38nAit35FHNwZtceMIhKkon1ll4lp/G75NqG+OmJZnV8YYRi5fXmhYbTCTogo2YNVatz2rj0Sx7PRJ0HdPB+/aivjWBDC4FETRxUXeR8wp43sbohcRYqIRynBM/8vbm1lR8KS/XoExvxpSsDyduVN7owza4aWP4aReMdcdB9iezGrZhluu1PGYy4sF7yl2lgD3WtanA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 06:47:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Thu, 7 Nov 2024
 06:47:36 +0000
Date: Wed, 6 Nov 2024 22:48:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lindong Wu <lindong.wu@intel.com>,
 "Caleb Callaway" <caleb.callaway@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Felix J Degrood <felix.j.degrood@intel.com>
Subject: Re: [PATCH] drm/xe: Add gt_id to xe_sched_job traces
Message-ID: <Zyxip+TTTfMZfX5A@lstrano-desk.jf.intel.com>
References: <20241107060606.3130885-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241107060606.3130885-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 282fca91-420f-4218-85c2-08dcfef81038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eIKLs6nIEitAVYjZy7jR0NZ8zHZSPSaKSqXU5yZWqTYOHJzMa79TCGmXxKlJ?=
 =?us-ascii?Q?nSBEfCBdX45h02UJs8PORYYefnGhharbTGW8SDH23Lz/ZHxrEYCYA+KNSz7x?=
 =?us-ascii?Q?4eI14dxFkeHSoBlv/Jsgj41s4z1DFGcEEgBj5ZZ7kth92il6rTyJWWgLdUey?=
 =?us-ascii?Q?mfOcLIetKsFWhoAXZpBOAEgpBPobZ9KXwHAy7+WnXang18IyxiDSx51e1LcP?=
 =?us-ascii?Q?sBjy6LjKUQMGWCoK9CTfF7FxYJD2ZqpFcxAARKqDmsos1Ckh7PNIc3ZeHyD/?=
 =?us-ascii?Q?VD/YH10w7etplDJbqC6US6TuHfvZPAP9inT1zTYJluhWlHItopZb7GT1FGWY?=
 =?us-ascii?Q?hKgW5+2aZALD0nMGNcxDo6Et8cXjyej51yj9MRHow9WRoCuo78BeBFrIkcIA?=
 =?us-ascii?Q?dk+UfHcET4ZQKJOJtS4RWkBtjIAHRW8pwazdpvB1MNmTjjrD7iFFWpVQNxGa?=
 =?us-ascii?Q?GFGxOkOdqFO+Qdujmxq2xUUiwZxIKMZKrbnRlWC9gimFMcJ1S3YR85SAebVI?=
 =?us-ascii?Q?/7o2rJrU3pfAoDIyd/QvMQ03YiO1wNYLSr7hNkthyjAVxBAylWhxgSatFhlM?=
 =?us-ascii?Q?4OmEm1Pxr8IJj3gQG/lcLHhr+SU3aoZ0tMwRts09Ra+HKU43mPLSWg4O1RsM?=
 =?us-ascii?Q?mvdD0qK28nF1pAX6ZR9hZYVHNtNIl0VWrQgwj/UkKWBqUPXu1Jmasw6ZnoAx?=
 =?us-ascii?Q?3ciCzH1BYsyt+nNVgvWKuUvTC81r9rbxwJ1UA6OtWmt6PGymklHtPZTWhOxB?=
 =?us-ascii?Q?lWeLR36SS2kPZJV8gzSZMv4ZvvBKM4uRspX0yJGbENXRICUAh0DKlUFYsAoU?=
 =?us-ascii?Q?GxIYhT5HP+To5P/WnxV3zGu+MlghhHQkAk3wqED6aUhiF/GzYNxOm2n/G69m?=
 =?us-ascii?Q?mKr3f2tkEAC6N79ILTui6wKuHAhVpbIiS0cvZiwUPHatobdA7S3o4d2lhUma?=
 =?us-ascii?Q?IpcGYxsLOoG3zPWyZDxhOMwpiF6UcX1FDLFQpmLhhX0iYNZ/RQx1D19wwSlx?=
 =?us-ascii?Q?y5StzYpr369uTQ6ukSCSB/Em9a1KAgy5E/ONFI/1qtwRKAH5vKqD3/gCq9qF?=
 =?us-ascii?Q?SWbEw7P2vHUGBxcCkULSEbP+woCgG4Ytixo+In41DA4cJTneeotyNZAYldwF?=
 =?us-ascii?Q?JaOtcQkL8si2ZZ0cwmTEj4IEoAbY32SwXt7P+5PlPLVg9tEDo6hRYVkCMbvx?=
 =?us-ascii?Q?47OMZ8wjXhdmPTmMFWNmuGdd6ZmbnCJUyqYq+42e4muDSfWbeKgpP1Y99SNk?=
 =?us-ascii?Q?3iXUaj+QyAQUHr5wNuMgUdnga5IZ9l4ha0srCH+NQH5voGvotKcL9s099POn?=
 =?us-ascii?Q?DHdQguvpdGR1B3bi65eTRfWu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hfLDlNYAyue1WFRv+88c28yHAy/TXM0Bt+2V0b/sa3TazZGeWA4u32Fgr13W?=
 =?us-ascii?Q?1e+u3lhi2j/kC2sBxN/FcxKTNwV0QtS+FnPUNb/cJ4VJY/TD4+cS/U4qqTBV?=
 =?us-ascii?Q?OVylwTZrg66ao1MWw/pecylVfDAi9oGkMqZZRwx9O1nLw60iiTMIpIPEei5E?=
 =?us-ascii?Q?tvlClnVvk6EbFyqJd+vpGsCoKfGvVuiqi90ThgEu/EUSYVF+MssAsu1Y1q20?=
 =?us-ascii?Q?tmXBFFwMq9CVikxFiTQPUqBIBkUFmsL4A4NS0NtRhAk43/scXPkpCBEZD83E?=
 =?us-ascii?Q?0k1Js3LRGQ6cInoTcBx1Po3JEILBCfW70YfmL3jYXGVRLku0uHtTqI4XjzMJ?=
 =?us-ascii?Q?WJy2bcXaRaHO1MoX03YQuYogJ+1osUqyocLYk7bpzIRxb6LtF5JG/TKwGD64?=
 =?us-ascii?Q?nLsyRDD31Wm3w/YVr0YDT86wV5jkb9vEPJrrP70mqoC2Somd5b6gflB8Loaj?=
 =?us-ascii?Q?mvQ8hbISyy3Dhr/1Y5JBnRFGGDfQaLNMZNoBkKnnBBD1xWbB4a24RTb6aeUo?=
 =?us-ascii?Q?AI2gP400kpcd0sZQIKzvTDqwGW/5yGwDFDB8O0npWNFQ9fhNblvMzMsVTsHS?=
 =?us-ascii?Q?4QFGEb2SxtepYuZH6eQcQw1uBnl27S9fSNnbwB0jnqLnnP3ECR9BnjOq3hyT?=
 =?us-ascii?Q?RxRek/6o9m5Z15cla4yym2r3QuhfUpQyFY3+9QDLfUVpb56WSkcNigDOIroG?=
 =?us-ascii?Q?we3EojBZHroBRULKOFW68cE7i3c1LMs+qxMW63FrxU/A3pCAVFc9LSIjP6sc?=
 =?us-ascii?Q?rAaq7p5rn074RO3JUmhuMHYJVlLhnMloSOKlxW6/MclQ+h4yFSPzLzKOlW57?=
 =?us-ascii?Q?VB9/a8L94jEDzHkeU0YTnzC556hoZhNtckZqQ6Dhi/o9UzIndhux44j1fWY3?=
 =?us-ascii?Q?mwRbYMOp7N9VQfqi7ddUxSa6usQCaN/k5H2rbbrEV8svC/uieg9ln4I14uhE?=
 =?us-ascii?Q?zYgT+FP3imTkl2AKMZNw3n1v2Dc5uNG6+mqjhLhqEAHXurO2nwnXkqOrGQlJ?=
 =?us-ascii?Q?JY+Aw2IiCBnWK9LalOhMwbP6vsTvEJ45Iml2g3iaJvokHOyYGFhNTl3krMGA?=
 =?us-ascii?Q?0p64oteK1rzUmseCBlkRgWwDrH9k9dDktWqdfsAEcdQGJrPaYCBmVAQjQMAJ?=
 =?us-ascii?Q?FbypLr9OT1w3RNSJAf3Ma2WMHO6ArPOy+fFSpcVxdsMyo6kR6hFB+V8twMVU?=
 =?us-ascii?Q?ZbcpRanGG5KfL/vd4Ahnjo+IPe207WO0FTIohmDWk9Djme+Ow9fIHP+71XZV?=
 =?us-ascii?Q?YE2KLxeBw3e9kSXlvsUkv+DTEjHAnMLIisQIIgp/gXBbdL3aktIsR5F6Gp/2?=
 =?us-ascii?Q?IY2hXENBweECxUoBS+8t0CDKKrFXRfGynSo3Pj8+0PMdCQzjtYo1DHn7q2U6?=
 =?us-ascii?Q?eEUeaPs1o9guUpuXjSUOTXb0BDdKZqkH00iEU/HES3zW49qGkz6xKoPqRNjo?=
 =?us-ascii?Q?QjU+8uMQ1iUZJ8IrubxF+EoS1BL/EdjVgulrY1QhQH/xZSvhKYbHvySvbX9R?=
 =?us-ascii?Q?6rMI+BtPLltVgNO88RtPkTdvaBwYy3oKQkDdrEDsQH2HiSSYgEVEEo/n6oeh?=
 =?us-ascii?Q?bmrL8iKcsnbhef7IZIKnoNNJl8I5KxbHvaQTg3UPcMZKjq0BxNEMrBjYHVLZ?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 282fca91-420f-4218-85c2-08dcfef81038
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 06:47:35.8977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrrnhJ8Yz2foKufVej8LdydZGJ7EOPPfrYidI6psSOkgberYg7k4wKhfOB1KQUlILirpKEU60CpsoJ0Bhvl0qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 06, 2024 at 10:06:06PM -0800, Lucas De Marchi wrote:
> In order to uniquely identify the jobs, xe_sched_job tracepoints need
> to have the tuple (gt_id, guc_id). Find a "hole" where the next entry is
> unaligned and add one more field.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_trace.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 91130ad8999cd..de682978c4bfb 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -211,6 +211,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>  			     __string(dev, __dev_name_eq(job->q))
>  			     __field(u32, seqno)
>  			     __field(u32, lrc_seqno)
> +			     __field(u8, gt_id)
>  			     __field(u16, guc_id)
>  			     __field(u32, guc_state)
>  			     __field(u32, flags)
> @@ -223,6 +224,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>  			   __assign_str(dev);
>  			   __entry->seqno = xe_sched_job_seqno(job);
>  			   __entry->lrc_seqno = xe_sched_job_lrc_seqno(job);
> +			   __entry->gt_id = job->q->gt->info.id;
>  			   __entry->guc_id = job->q->guc->id;
>  			   __entry->guc_state =
>  			   atomic_read(&job->q->guc->state);
> @@ -232,9 +234,9 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>  			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
>  			   ),
>  
> -		    TP_printk("dev=%s, fence=%p, seqno=%u, lrc_seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
> +		    TP_printk("dev=%s, fence=%p, seqno=%u, lrc_seqno=%u, gt=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
>  			      __get_str(dev), __entry->fence, __entry->seqno,
> -			      __entry->lrc_seqno, __entry->guc_id,
> +			      __entry->lrc_seqno, __entry->gt_id, __entry->guc_id,
>  			      __entry->batch_addr, __entry->guc_state,
>  			      __entry->flags, __entry->error)
>  );
> -- 
> 2.47.0
> 
