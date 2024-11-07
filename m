Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745BBD5D695
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 22:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5A210E074;
	Thu,  7 Nov 2024 22:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMWAHXOk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7728610E074
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 22:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731017915; x=1762553915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jSbsNn/NlscbHmAm3v9W15/CGEl9ffs5x76rVIfWzMo=;
 b=YMWAHXOkQlkdChcroTVpNM+DfPfaQexGGOWA3QI/DnN7Ts5UnfPifa3O
 0jqVBBuj1BdHdWz5B7e8VYmyYGJa2zc3V846wZoRGSjjHvJ/WXpmqDx+f
 yrGkiMqyKIiBMGR/NurQ14dGKJjR2y2aCRfYn/o/QWXB8Vu7mSuIm5vUo
 l4tTJWwrwfx/fJ2HV6waudr9REKQdX1xxjGY9p2h1VL884EO4RJ6u0juF
 aNYWSNAxSh6Pew/76mALkJYFVeGFmlQFicj5qWw7HurMys0yoTwF83JBJ
 FxORsr+FXAuIbO/PWv+P/Egtxulmf9Z51kEVe7DbD0SpL8oV0s8Xx8Zgg Q==;
X-CSE-ConnectionGUID: idjv2NILSA+9w8f+63QZDg==
X-CSE-MsgGUID: uTOFq/T4QMGOrfsDoLw77Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="34812985"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="34812985"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:18:33 -0800
X-CSE-ConnectionGUID: N1t3zPmaTM6YZE4W4jE95g==
X-CSE-MsgGUID: OqQt0Hf0SAyCVy5lQPgUIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="85254574"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 14:18:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 14:18:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 14:18:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 14:18:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeYKYHmUZJY4dK/w9h0EV8/axzTih2MBLh/mX70s/gbF3bBqu4zYSkV3Koo+vqdGwq9lebPcqAYauGP7hk7AKNWrDqPaiQxa7WOIqkkW0wGd540E5JFqhorIBy4CHSXM8WtlfAPo0Q2AFKTIVpIU+hmf6SPuSuT+Gw8QHoIoLj2WngGz2zfEbm8fITdJPihwJnUgFxTiHsVSHujlPM+7Gs6GrlYjdzobO/p+b6g/tJtp6y2atK6fwXBesmtFczO8mcBw6GRJ/eT5LrW91/DfuOZ7ZuoU4tls/W08MWkQo9PFB+FfLfWr9DVOAl92PAwajgia6kQBlAfPzDn94sEvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpH7Bd1JGEn5/h7i0KtJ9uArMkdH8FMatZ4nEnGd77k=;
 b=G5TmRceqiBLmKE9q15M6bi9iFrgF6HgZQ2UhUFhyrVMqv/VTWneAnY+/3zc9U83y+jqleRlCkZ9R3t7VWlnU21lw17FDlx1cpFYwiTHVfjLyGlGmr61PglJ9JI3Xhk8DFPqKdXXEJDOXrTEjZlC919IBAces3Oy66CEdXVZumrcx2pauE6iIQkVPaN5iGQeydQrketrbT3Ov8v6fiEE88QVuRDNRg71hLzGZbEgVcTWrDLnCBNGGk51QB52pvGJrQrTDX2WfGFAdLgyfhe+dqieDeVwhZIWNll7NthtLfwCjStVh6aGyWsd4izzWMDavo5syhVrD4CPZe/w75qFNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 22:18:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Thu, 7 Nov 2024
 22:18:29 +0000
Date: Thu, 7 Nov 2024 14:19:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Prefer GT oriented logs in submit code
Message-ID: <Zy081U4kGgRNgfwk@lstrano-desk.jf.intel.com>
References: <20241107194741.2167-1-michal.wajdeczko@intel.com>
 <20241107194741.2167-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241107194741.2167-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0262.namprd04.prod.outlook.com
 (2603:10b6:303:88::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab9f22d-8648-4e51-7a72-08dcff7a1b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HLA847gxWr2ASdifqvei/4Fa9qcoeIzxzps7cAX4ISze2MMuuDfRkpFHt8Z9?=
 =?us-ascii?Q?VA1rssHbipyt5aOEKzU9kqqR3Tn96RttIOzdEYGtRXUMcJbrMflXg7MJm7lV?=
 =?us-ascii?Q?lqxG3nCxiItByC4YQ+gBQCfuxEpmMv3K2DI0OJu+dLcjRNEAKS8KIpY5El+z?=
 =?us-ascii?Q?dunKA+izH9ORybI4vCSwH07KJJ7DTOAQqbKqqyHXA9+MFh9Ir2PoNXWsmglU?=
 =?us-ascii?Q?l8YFBMKCEQDzbhiszBk668X9Pq9FpwPTrgJhN/OUiicmLeZz9waAvOwdZPEq?=
 =?us-ascii?Q?yB6+1jqd/O8K8emYyPEhXo0/K2aW2r+22A8Yrqzbd0ItE0/hrHknsBL4iPJc?=
 =?us-ascii?Q?k9ewvZgQbSybemLBh2XKCVKqaI55xn33bZYn+iSJkJmg19ub71l8QJN1wAaU?=
 =?us-ascii?Q?9Zq+D/CMjC+D8Ugb/L8GxRfTrZbNRN5VdtRx0PXBACQ2SWhtT7wxenihAHoU?=
 =?us-ascii?Q?bRd9DEuh0GDmmRSn6AxKCG+j8z2M6sdM0/SqCRbHAyQy9Qn92Oo9WJd1wifu?=
 =?us-ascii?Q?zagd9/Ge/YHpKRw3+RGqvNOGuAd+rUwyde5U0372A/h7+adtBDtUSgovnQr+?=
 =?us-ascii?Q?eGmMvw6gQbfvBRpoZbrYuOyHvFXG/jq/v88bjY3l1V1trscE1a6sEBabecJB?=
 =?us-ascii?Q?Udmix36/FoHjWUgPJTUUkjzUeCgiKd9NvTVjHF83de6gkIC9SIxjl3xX8KwJ?=
 =?us-ascii?Q?w74hgc9E/ldlVzqov9SZ/sAv6mskE4O1lZDK8ojmAEET8JthJFpEe7WVxOBM?=
 =?us-ascii?Q?L6xtAbPVlO0GMsr58G+rm52e7uZd4xH8IuM4PiNKAlpMf195npx1GJbQtn+y?=
 =?us-ascii?Q?CPWFBBVg5Hz4CnB4eP+mIP0P/N1GBwPdQ7SOhLQ896XYYx3KREgB8sO1fQxP?=
 =?us-ascii?Q?vHKBIOHB2cf0SU2Tt4wUrvZMKCdYmuYQBzvYJMobjiRVbjwjjOA5dEho5V5F?=
 =?us-ascii?Q?qIq4nb2zTl479cHW7E/R+uU2dNMunHekZX/LFd46eBKEw2N11jon9IW4wQJ7?=
 =?us-ascii?Q?shkKKE0/Vca441/pCbW62BjKuDHfmWXRY7kGdVkHb8SJarBDied1Us2hQWPu?=
 =?us-ascii?Q?IAkbhrgbxMwn/WX5pHvph+FPd7OWqrYIcA+AYyTDe51MjMNDifYWGdO72pvq?=
 =?us-ascii?Q?oNkzKyO7to5mwfaTroMCeyD4drxTN0T/DK/HlAzgRMtFAW/eU1Gmg8hWPVlw?=
 =?us-ascii?Q?MPWqAqm1BYAjfmpS25TuunZ+YQ0WX34mpOAEThVCDzYtO1AYTRn2mNJvbDV7?=
 =?us-ascii?Q?WyI/pX0UrqUhbZlehZExyoQvQG96B72Nzx1f2DQnJw1pJcNRvNg+820oWyPh?=
 =?us-ascii?Q?iBLFPs8FeqxPpuWjnOVJCFty?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6SXTlwxIkvPWKErkgceZw79YGoEM00yVKrXA3dAwIuAnhFv+srFSKz5PybJ8?=
 =?us-ascii?Q?J/aTQV+tAxdsWYRT8MiUO441hk8Lv08pY42nAshLjuUCsteP4NwyQzxg1n6F?=
 =?us-ascii?Q?eGiJXSvUyD5fEWKaQiWk2yUb2t0OgvwE6hQiQDzYM0Et2FNQlp2R3lPlzmnI?=
 =?us-ascii?Q?G93KJHCkeeTLHdETHYYE3o+i5yTaxfcpe2AbpCW9ibGGeFMBdgPO4WnVxfzv?=
 =?us-ascii?Q?bNnL3ROfIHY/7SudE26cc0h841m/pTYn7KgHH+uNiujx03p918c06whGakRV?=
 =?us-ascii?Q?hqiEBLChHiZryJ5JxSXpc4qiuGXYPkGro2smz0S3OHRaih0L+z/1yOyBdpbZ?=
 =?us-ascii?Q?KwF+cVItS65Fj4ti+eX58cW8eWX6qsYLprkA5MqELt5LVbJ+9v0pvzAu/tmg?=
 =?us-ascii?Q?O6x/N64wI4CQ7Mc2gE7J/PoAA2+ferys3IZneIV+poTNCmUqGLCYKRiobBRv?=
 =?us-ascii?Q?osZ0sq6AcM7d5IpKj1fbkYAmb1OZYq5Rno5r3RcC+R9Xglc3joPpCH1ctb/R?=
 =?us-ascii?Q?IvZP5IcaUy9mb3q7JVaCPVsB9ziglPgwrgxPes4oDbaUKYFTpfXlLbrlrwZn?=
 =?us-ascii?Q?yBL3gy9KrHN4ExqZ4XUjIWic4gY8SeBqaBI/3aLRYmJNCBzLxMGzzl9TkIWx?=
 =?us-ascii?Q?0/rZGXPr11MohLH97sf55urntNAossOExUQaTsdTAp+TDxay43/0ppWfEwgt?=
 =?us-ascii?Q?NT9AuTFz1FuiqCcetOEFc6BxuUze6/zeuZysYEfq8x5kqPPGGBkYCKMpM8HQ?=
 =?us-ascii?Q?Fkydj2SgLF3/f8OrlpWSTNycHmS1vXJ9DtCmy3XEJf7jutqEnzgkv22wSsIx?=
 =?us-ascii?Q?OwVUzso+exwHX2p3jLyOXTif3+wLap9NWNdui223P+5pEwxFjngVBQS4QWS/?=
 =?us-ascii?Q?FuFcKsIWp2mlYGeVr6//IXobpCupv2azdWpYp1Px/u3pEN+82x9qonEqz8G6?=
 =?us-ascii?Q?Wletu1JTDdcKtauudK3/X6yTQVSScMoO0ndE+ta62JdMkyiMfk27Ca6bFCrN?=
 =?us-ascii?Q?wai+bnBYuBkeeBmyBcLHzBn9zVZ8vo922LvIh2steKpqep3huSVk3THx7vk3?=
 =?us-ascii?Q?75MjWrh8xtyq/o3ZLDXg/DPSlmyGQcIviOYOZCkMonExGP3ccEqTwolBJA7X?=
 =?us-ascii?Q?r3Kcmf32ZsqHC8ZEtqMOdHduIPNlbbgoV7VqG2mKg+D2S5AElzSvOHyQfPYa?=
 =?us-ascii?Q?nYXOg00b+FL8xH4gnpklb6XNvRgTXLsV8t/2Y8KVMD2UsoMJos08lFf8Lcsl?=
 =?us-ascii?Q?ZKnTLjcpbPp2hagJ/HISbm1OBwwhUdLRY4zsF+6fOZX1lNn7d4FJsWlDgNHn?=
 =?us-ascii?Q?ny2a5VY9TsthKUi6G16rkrWzEjlapPb2K+C/okFL5QPq9YxZqKorK7dbUcOe?=
 =?us-ascii?Q?5b9SCSWWcFb6agrB/j4g3QxdFBmZpUTyHwYEq8scG2v8dvqgR3dsjWHIgCW1?=
 =?us-ascii?Q?llbpqL1HZFzry3G9Y8S4j3mcF1Xm6Nwc/A4J+Yqy170sNCD5qFYqJ8phj495?=
 =?us-ascii?Q?d/7yiXMj9oov9zcHvv10TR34hcAV9aYQsSpYAWPdwAaA8z6HsbmbBnuyE75m?=
 =?us-ascii?Q?LOJW/MwBYsL9ZK82xz6PGLAdsh5kP4Mp4WBpr/CBiw22zNOg62ICrE9Tplve?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab9f22d-8648-4e51-7a72-08dcff7a1b6c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 22:18:29.2712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbsQ8xyLMfeyj9tIPyCV873NU0G3Acftz+PmDFYQwDo1eb3ZqzYGxIw5BakGOCz1WDVOrSrPCPTuX83/qMWzig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
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

On Thu, Nov 07, 2024 at 08:47:41PM +0100, Michal Wajdeczko wrote:
> For better diagnostics, use xe_gt_err() instead of drm_err().
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0311d9e50d06..c70b75a3eb85 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -763,7 +763,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  					  struct xe_exec_queue *q)
>  {
>  	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> -	struct xe_device *xe = guc_to_xe(guc);
>  	int ret;
>  
>  	set_min_preemption_timeout(guc, q);
> @@ -773,7 +772,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	if (!ret) {
>  		struct xe_gpu_scheduler *sched = &q->guc->sched;
>  
> -		drm_warn(&xe->drm, "Pending enable failed to respond");
> +		xe_gt_warn(q->gt, "Pending enable failed to respond\n");
>  		xe_sched_submission_start(sched);
>  		xe_gt_reset_async(q->gt);
>  		xe_sched_tdr_queue_imm(sched);
> @@ -817,7 +816,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>   */
>  void xe_guc_submit_wedge(struct xe_guc *guc)
>  {
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_exec_queue *q;
>  	unsigned long index;
>  	int err;
> @@ -827,7 +826,8 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
>  				       guc_submit_wedged_fini, guc);
>  	if (err) {
> -		drm_err(&xe->drm, "Failed to register xe_guc_submit clean-up on wedged.mode=2. Although device is wedged.\n");
> +		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
> +			  "Although device is wedged.\n");
>  		return;
>  	}
>  
> @@ -859,7 +859,6 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  		container_of(w, struct xe_guc_exec_queue, lr_tdr);
>  	struct xe_exec_queue *q = ge->q;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gpu_scheduler *sched = &ge->sched;
>  	bool wedged;
>  
> @@ -897,7 +896,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  					 !exec_queue_pending_disable(q) ||
>  					 xe_guc_read_stopped(guc), HZ * 5);
>  		if (!ret) {
> -			drm_warn(&xe->drm, "Schedule disable failed to respond");
> +			xe_gt_warn(q->gt, "Schedule disable failed to respond\n");
>  			xe_sched_submission_start(sched);
>  			xe_gt_reset_async(q->gt);
>  			return;
> @@ -1801,17 +1800,17 @@ int xe_guc_submit_start(struct xe_guc *guc)
>  static struct xe_exec_queue *
>  g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>  {
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_exec_queue *q;
>  
>  	if (unlikely(guc_id >= GUC_ID_MAX)) {
> -		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
> +		xe_gt_err(gt, "Invalid guc_id %u\n", guc_id);
>  		return NULL;
>  	}
>  
>  	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
>  	if (unlikely(!q)) {
> -		drm_err(&xe->drm, "Not engine present for guc_id %u", guc_id);
> +		xe_gt_err(gt, "Not engine present for guc_id %u\n", guc_id);
>  		return NULL;
>  	}
>  
> @@ -2039,7 +2038,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	u8 guc_class, instance;
>  	u32 reason;
>  
> @@ -2051,10 +2050,10 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>  	reason = msg[2];
>  
>  	/* Unexpected failure of a hardware feature, log an actual error */
> -	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
> -		guc_class, instance, reason);
> +	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",
> +		  guc_class, instance, reason);
>  
> -	xe_gt_reset_async(guc_to_gt(guc));
> +	xe_gt_reset_async(gt);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
