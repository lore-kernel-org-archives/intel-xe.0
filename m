Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8536DC48BF6
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 14:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA5610E74D;
	Wed, 21 Feb 2024 14:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DaUcKfn4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EBE10E74D
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 14:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708524186; x=1740060186;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Sr3Nx/GGz5azmeBVWsaWZfUCJp91SN6dbyhryzHWhuc=;
 b=DaUcKfn4twDkxv8C2Y8efznRH3acNzaXglKWuzXTNuO884xep7kesD8y
 pPTVs23Ge/jcvIiU5MFPP2VzDWox4O5fWpargIKUdZLjGo50YL07V7ap3
 QNBF6r0bJ+mQH5WQ/tBUbwt3bvJCOhPwhIuKThbTqcQ+NpZ9Hw1bektt2
 6urtA1m148wKXgMTz/V+Sz7nN06oePb7eK8v0foM9HTWRKs6h4f0kh0Nc
 NhNnq1caPn4CnYzDSua4pbSL9j01fHdcUBikSqCZC3EcOONle33CRUgHm
 zq7HgIfHOp7EIvYx4ZMWo4GsEHUiJPv8saozZ9DGmIVgLKF/j19YPupAR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2555064"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2555064"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 06:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="827351731"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="827351731"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 06:03:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 06:03:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 06:03:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 06:03:04 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 06:03:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nF8FR3XPzmr5ijHmEEyM1ljnQKjH3mFc7LXVScL19w+rE1VnU7oLnV5+bx2nWuucC3LX3wktHp+3nwjVa4nDRXoqKS7o8DF2nyK3+Sw/TU+EiuXfz4Lo0rXN0SrgdtmZoSBLJ5IhPehvrJBfzmpkYWoPzdteQB44nfBH+s/NYv1/9rcFm/OTJIlFZhnED+JLXeZqlDAUbovlI4JKor8mj969YREKk61iR+w7Ws+Xk24P2hy8lBGvCKBUFB55Afho/DWlgCIOn9vw2z35eiKYrsImuydBqNSnI6fqnaNZm2l9Pm4wyJD2bJ4wg2ffwQfXJq+IhDwGL8xKpuhOd4KPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJqnOZcjTDr/7kdwmeFNuMSNLItydtEPcz0f7QyXBhQ=;
 b=YfFMtXyzh287GZ7l+x3/dDSIGrlQOFsaHIGQqmOJVif8na3sPi05Mj9/LGki7gsxckeM9B+v7e70ZQlajcIxFo9k/J/ONyNyUcCYyQvX+eGFvsAIY2r1vAr5iJ8x+Wj66RY2lqJl3wv+doJb1Y9h/5oN06njDubIIzu6vPI3s1KDv1VoyjU6A/6OyOheqx91LRiWfjV9UzhPhOQv69eI7b6mS3axOMyQBgDA2ZxRhJjMIlF6sqF5FFTWsuYrL5JYiCiAlXequ6/7p7aqZWy/7To0PtcapegvScWPpfqHmJ+3kiY5P2VWgfT0EGk4YG/c0utErXoZ6uYUGFVvYB2Smg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Wed, 21 Feb
 2024 14:03:02 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::63b7:3499:79a1:2796]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::63b7:3499:79a1:2796%2]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 14:03:02 +0000
Date: Wed, 21 Feb 2024 15:02:56 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/9] drm/xe/snapshot: Remove drm_err on guc alloc
 failures
Message-ID: <ZdYCkFDSLia9yEDz@fdugast-desk.home>
References: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB3PR06CA0021.eurprd06.prod.outlook.com (2603:10a6:8:1::34)
 To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce903ef-8be0-4b1c-22e1-08dc32e5d17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iwAv+dtqLWgIBGbRCB0qsLJh+JDOgaZZLi6kbFIpbVW6IeYNXr0mpQw7aarUsGsOvqxdu1skUiac/blIHK9VhmzAatcXPCuKXrFbysIpOE0Q8+Ik7125B3qIQr7vbrImKCCn5KFUiW+GXGhb2qzz/QjAkvJw7drlapfwQ+3l1w8H80ry8Pi50K8BbMYR/LW5ZhbNkIgv0BfNuJJdiFviRAUwHKPocSNS0TDp9X7rh8v2VIFmdE+8goEQPwSOdxE4cdc/MYy24oJiwVDnA0sXF63+eSNOiKqsnMIvyJ/OugIlmizKOHQ7lppKje4jgVRrMbnXbztk3sLb00T5j7/G5ABYyGycLo9OQA/txwTDagHqbFVP2I7ut6nJFWS11SXNdw0/e4stEffUCDJLkcKDdnhwtuPi7V4/MSddsfSK3QLdQymhQ4Zgbbek1kWvWgYy4Lv3kRPNq/WMMQ+XSCAb36HQ4KChv4kMo9nFCSMqEA6TLpV6ItEjKraY5maZKZdC7fy1ZzhPKe/W85guzgV8aJiSJbeodNI2WqbJfmaNyFo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pnKkDdAMqQB6HDbW+u67mSdBIV1NXEhQ5duVjz9yLLiZTewylfam9iyLMV18?=
 =?us-ascii?Q?gRgQZs5lkEPWTbsGrI+ma14lFfP0b6PWuSXpslwn+GWRZm1ZjzIyWyD2xoFt?=
 =?us-ascii?Q?sokAGXxa1SftNzWeZM5l0mX2E841YIkgIo4DYe6e3Kjw1iaQ+h1SoNrA9ZVU?=
 =?us-ascii?Q?hYvx1AwszzsSgc0B4t00zBIVHpkspQMpR/JprqzVP98oidxOtzERYqOi7/P7?=
 =?us-ascii?Q?M9IaZyhGhVj3NAX1ICsYI8rfmpSDGN2HUL9XuDfUnYi6GljRA0Zs8csSrnv+?=
 =?us-ascii?Q?85OwyqpCW9etpRWkRnBmENFq6tCfjlGTAiJSsAIMuFEdajihMCHNSD+XvK4a?=
 =?us-ascii?Q?ODdXF17R8EQ5F9d6FZatBq14qd4kpkTUZpay0D6hYmaVpYFtE9RupipKQaHM?=
 =?us-ascii?Q?iD6x6CU2R+t7TwWEU3Lxe1eCvr4aESuHy4w0VA+g2e1N+3u+9Z72PS+JmH1r?=
 =?us-ascii?Q?UF9cOBW3POadTVvLAfwPuo6OhxqRRjqtxNakBiyn8JBKHQX9bczf2dzwpFrV?=
 =?us-ascii?Q?3I6TmJ78SgvxRoYRynKJGXBTXn4Kz8JG0pr3wQUftMhXXtPLbtcJCVmOe5BQ?=
 =?us-ascii?Q?FLhpYHwDgTxR1zeSolIOPFKyIP5ndImkqlh/Tr9pX8y/WuHLeQotgcdwl2sY?=
 =?us-ascii?Q?J0HNdSs5sr9bUsIHlItOTHRR4UkAH+SeebSholQ8CF86rb6Uv4QUGL4N/R2i?=
 =?us-ascii?Q?pB9ROzqIJvcIPJAKAjx13nOBSiIr0MPNq1pMmlK0puD0AruF7eOR35gN7+gd?=
 =?us-ascii?Q?WMFj8jnHhCLSXDgGq2Vzr0Or9HsEENV31p5glLY82Ri70e0/yVeUT6DkIWaS?=
 =?us-ascii?Q?oB0p2TI0EP1JFz5DEqd5AndgBOlbrerueBDqSvHMP/nYRlyMomRaqYA7g0k7?=
 =?us-ascii?Q?yr0PpHFPqfsncFLhULfWOY+P9zLF1+lIHLU9i0fI85Z+lWrAt142+BPLCy6r?=
 =?us-ascii?Q?ppi3Dw8A60B2+crW50cbOm+6lKZU7mlo+JyBC99YWfIFni8I+8z9Tpre8x2L?=
 =?us-ascii?Q?Va4yYCaz2GI0BFNgmNRQGVTcEMaNhdk6aaXNDTh4R3tLpxqiBTqKu1HcXm4S?=
 =?us-ascii?Q?eXL3SFpnMzvOrCgnKyzOFGmc6J4ZF49hNgc9pBr5DaMW4uRaIH6x0IpYutCe?=
 =?us-ascii?Q?k3C/dD83WMkAq1grzaNYsQDYADiaEob9loyONDBkQKfzlFxZ1pqEVS+fbg40?=
 =?us-ascii?Q?E1O2Sj3dh18vLqqmLCj+0M2c6HpZObS75uapFgGT7s515ULerWHTos+pfDTt?=
 =?us-ascii?Q?L/JMZ9DVNeEpLCA2uoRyDRp6iWpdWXbexmplEnNuo56JMp3CBo3WLDWS2drd?=
 =?us-ascii?Q?1xB719avlafl4QacNA/wyuWpC1e061G4lQv1WWpfoqECi7jkb0BM2vZG/Z7O?=
 =?us-ascii?Q?ANkvfrkiY9ikYp7xiRYVXJu0Ypgktf9jSL/zNCuciKjEOOQHJ6g/t/FVBOWy?=
 =?us-ascii?Q?WYplNOLl5PLckmsPkDIo0XD2GLoIyiF+QwwlaW4/xyg6z2IbqE4OZl0Sd3t7?=
 =?us-ascii?Q?WWP8yrYp5WhwaU0X5dWnUZ0c+1D2gGmazUQaQtr8SuCeMvvTQANkXmOTflJi?=
 =?us-ascii?Q?30YgkYkdLGWpHssj+CinUoBuWoTPVdrTZHvPUeVU3q3JHKfp1K/cwjhi0H5k?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce903ef-8be0-4b1c-22e1-08dc32e5d17d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 14:03:02.4360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WpR/P94i9sAXm2UBnnWcMqsCW/1mjEGb+7Z95PlDOibLaLBxjp45Q9koySoPI1vARWUCL88GokSAkYMmykHy4RF3bSRrxycVcGAfc3dL8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
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

On Wed, Feb 21, 2024 at 02:30:16PM +0100, Maarten Lankhorst wrote:
> The kernel will complain loudly if allocation fails, no need to do it
> ourselves.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

This aligns with some cleanup done in commit "drm/xe: Rely on kmalloc/kzalloc
log message" after a comment from Oded, so:

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3ac51162cfa72..ff77bc8da1b27 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1794,18 +1794,14 @@ struct xe_guc_submit_exec_queue_snapshot *
>  xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
>  {
>  	struct xe_exec_queue *q = job->q;
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
>  	struct xe_guc_submit_exec_queue_snapshot *snapshot;
>  	int i;
>  
>  	snapshot = kzalloc(sizeof(*snapshot), GFP_ATOMIC);
>  
> -	if (!snapshot) {
> -		drm_err(&xe->drm, "Skipping GuC Engine snapshot entirely.\n");
> +	if (!snapshot)
>  		return NULL;
> -	}
>  
>  	snapshot->guc.id = q->guc->id;
>  	memcpy(&snapshot->name, &q->name, sizeof(snapshot->name));
> @@ -1821,9 +1817,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
>  	snapshot->lrc = kmalloc_array(q->width, sizeof(struct lrc_snapshot),
>  				      GFP_ATOMIC);
>  
> -	if (!snapshot->lrc) {
> -		drm_err(&xe->drm, "Skipping GuC Engine LRC snapshot.\n");
> -	} else {
> +	if (snapshot->lrc) {
>  		for (i = 0; i < q->width; ++i) {
>  			struct xe_lrc *lrc = q->lrc + i;
>  
> @@ -1851,9 +1845,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
>  					       sizeof(struct pending_list_snapshot),
>  					       GFP_ATOMIC);
>  
> -	if (!snapshot->pending_list) {
> -		drm_err(&xe->drm, "Skipping GuC Engine pending_list snapshot.\n");
> -	} else {
> +	if (snapshot->pending_list) {
>  		struct xe_sched_job *job_iter;
>  
>  		i = 0;
> -- 
> 2.43.0
> 
