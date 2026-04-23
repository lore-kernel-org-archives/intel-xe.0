Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0BBFDEE51
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 21:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2668E10EAF8;
	Thu, 23 Apr 2026 21:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFS5aSvt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50D310EAF8
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 21:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776980711; x=1808516711;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LsEbULq0tT3ryn1lqEa+zneMJ3qBODM14fcfMFZByqQ=;
 b=OFS5aSvt9yu6XuvZ2p1m9rFJY8Kp4nH8XxEZ1Ga8Se/yp+N3MtGEYGPI
 oQKmRVCoEgtvBqvic7fPkZH8igSK1JciEKUAYoE3HLzY2L5z39b+kj8lU
 aM09PhvZI7HGwBRe49CHw8rQNBpbGNQkL9ORQmKTYzKqbaSb7rcZ+os3r
 yxCbfIFo51qpsjja1nNwAWGBV8U7bjBnxCWN1ubmNZvWVuSDnV4i9t4ef
 OkKPKgFdEylcvfGcMy9B8jet4ND0HMJDZtCndMD76LVWBC0D4/+zP5Nk3
 KI1TYjdVbkILnMyMtcuxBomwSiYI3zSPq2wbu3qxt3WqqmzmMhpKGT9X1 g==;
X-CSE-ConnectionGUID: qrj81GiaQaSYdvDYLVUalw==
X-CSE-MsgGUID: vPi9QUKzQgKE5q2RuzKAjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77979429"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="77979429"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 14:45:10 -0700
X-CSE-ConnectionGUID: rKllGUpaR1eaM1NWHNEiqw==
X-CSE-MsgGUID: eQ38DkFYQZCJvQX0eDbacQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="228210512"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 14:45:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 14:45:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 14:45:09 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 14:45:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/VtPTbqT/KXGHZEKztQzz2dItaA8BcjwDtBEqjB4hhcGWspyhHDOJH2c7H+RJ0grtsYCEbHnJUX6S3n4+DleesLRQULuJRG0OUHcyw+mTfxYme8PhWJDHbgPhbfRG67vnL7YoTXKllfXG3f/ZhnpKKkAXg4hwd6BFM6QjkJTN0mg5910E36ZCRIm9UvtYScnQxga8WZZSi7T4ihAUIX65T4c5ZJyzaDJoZtNcpeZ8pf68/l3ijif8lE/hOcEF6SOQkwBbYgttQJIplcm6FJoHObqo0tuQkYyeraifi7JJRm/exRvtPZNyWrgk8Eg5AKxehkeAbAdeXPRQYBwcTVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGsfyUkI8oOF46d2ID7U4kF53TArzvsoS41P7rthx0I=;
 b=NChSw4hdCCXTCrVXqXXn/lTNRX0D0IxyaV4ifYN8ERX73f/t0eWy2jZFsDPszs1KA3VsPcaJdq98khgTfDzhpZaNp2t5Y3QVRW0zeOpV9rFsaPnjrQVGdMD4DoADadAvrNvf638XtBHScdHB1kjcn+rBGwiT8J9c9kOc88yV8k+SeAXVe3g/EUm6mFd2TzWK+CYNP9qOEg5D0NlU6hV+SP+fJcenO3nrFZyKO8C9mEqqZphZDUpbdAJ+cvulCBPoUcmx7E+IH6N0bSsaE5STvScSRU8IV1XgNbwrvKdy46ONMNHNiW25L5qZ2bloZNWj8uWFttinouK97j+84Ya9Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Thu, 23 Apr
 2026 21:45:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 21:45:02 +0000
Date: Thu, 23 Apr 2026 14:45:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 3/4] drm/xe/multi_queue: Handle VF recovery in CGP_SYNC and
 queue registration paths
Message-ID: <aeqS3BhpXny9q0Dw@gsse-cloud1.jf.intel.com>
References: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
 <20260423024954.1665095-9-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260423024954.1665095-9-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:a03:338::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a6ef01-95f0-4567-8c0b-08dea18192e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: IgB2SEE+Ki/BXPgFO787rexjhzGfv8RiSq/yLSYVtsjWeAWh+PTI4BAwVoW4beu8v1fQQSj6jNRns0bYQfJKFeJfX774en2gHqRVSK3/pXh9uuRrBTuLVrY9a1ou69G9I2r1SALsarWFTNToy9qRC8sh/OekP6xfVONjiEFfpRWwB1fqU4RfTARmHdAx/y8ESe8uoBKXaONJVyKc7GpfO6np+r5cUNzLnJAF2xDNP3+hx2UQ6cXKL2t9xVnxtdo8rWelpHH2GpwCG+BhV0mBW3r+Lt4z3lUxD1cuRRnmAMaSmZoV41KziEvJQBdqu2BN8U9uGeBuZ9Om99l0iiok1jG5MHfo0JGXHrC9gaLL4IIc7suNHLoRshgsmcZ+EkuEfNL4qi9jl6N5Foczsan8PFbKQDetswQUX6DefWJ1hIeX1oE3MrG47TW8J/dtFb4EzlllJISwVsz0/RyxrmtyniERUfUOLg/kTfbp+3r3A4FUg8BcdNSB7fG77KEhi/6Utkc/DSz2ks15rfjZcSEqRGJS5e6wz7/YombgBusti3RoLXQoOCSHE0dAG27L/MqI6kk+wiJUxDAhqPgwBmU1B1Hzb5WtisQRp6QPV67SsBClzn9KqAUVYyL8n8IoyiukyQsO1KmvnqKZ1JfoSAOokru4JzM276dKM7jV8jFiYle9azkC89LXmDK1KKdJBEJtlorD1fVOLgsQSiWrJwIc+MSOOOmSUzIc80/QsOWjRQ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+uWz2+TKbT82KNuJa0cPlymUoLulMTjaNP0V1aCO1h8FQbZYgjjGJzQO9so9?=
 =?us-ascii?Q?M4MtWim6n8+kwPM7m5rTNbF/bWYx7Ipswpi0PUgM9kHLKm//xd+TwGNXmYp1?=
 =?us-ascii?Q?PAN4dlE4AQ9WGw4TBjY20Ie5CbWPYevClzTsjARkU+qCBfzwZ0VWY8eR+Mp7?=
 =?us-ascii?Q?9IsjrxnSaZfwpRXZyMrSMN5l1ZCQnSP5SPX72pwLUwWBxtgUm2Dlwwalw36x?=
 =?us-ascii?Q?cRLuO9WzHvy0z8lVpmo4t2ASQ6RkATA6ckKipLRiDHToG/E1i4layoEnJVRX?=
 =?us-ascii?Q?TKhMWaJ8J9pdrEshQYC1pObVIjnEut+SWCAb56QmkP5nEvt5KLBbTfI7uLO2?=
 =?us-ascii?Q?43/+gVIayvPk+wbkpYXAiRFDWNUhTBntbPEf5NPQXQFGjHVaoM0auzzb6Dbw?=
 =?us-ascii?Q?im/yH0k3OfZr7j9MUCh7gx9pa8zofNIlQ2erDdlPLxNZO/DjeZ2QF6WyLvlZ?=
 =?us-ascii?Q?m4h8fmgWrcTgd0+90bfwuje/zZP/gEM6gTiAbXIRZ9xkonLmbbYA4dHMRemR?=
 =?us-ascii?Q?UtR3swZ99ZVC48/7cImr9d6jyn5nWPprwnnLKR38uCvZIcxRzH7vO92lFc4K?=
 =?us-ascii?Q?WRSxtE3i8BR+P/ng/X4kMDGNGHI+ppRz5n2Bg6ezLLUI0tS2oyzXJblI/KME?=
 =?us-ascii?Q?cTP3JSHJ5LsdgfXe6pGuOP/OaFphkb19tNgI/OgvS3Z34WG+ymDhIVu30OdQ?=
 =?us-ascii?Q?D8mdrBvaGiAQ2sqtEso/d7OoDVS1rDokXq0GqVWwHC2GwAaBJdHfMzwW65lr?=
 =?us-ascii?Q?kMhxBYkFpp4EZsf/9v0USvbvpCpv6h52PoFjPFcMijiIlPgxZSv/GFhM4qtt?=
 =?us-ascii?Q?OvqOrS/RQgBBvouRtCRd4KnsL39YHMhtBfNXWG5Bcgk/4prSDJc7UFP6Vxvl?=
 =?us-ascii?Q?zIotYf/j6oZX9buCR9DrwlY82HBZ0dERuvlhTKhXAXWH48vbM9w7q2dXBE1R?=
 =?us-ascii?Q?2+ydu4qutQzJiF25/Q6fd95vzf1NSSIwf7Yo9aikaZaGY8HIp0TfzRBbfms2?=
 =?us-ascii?Q?V1ltxmNSAyvCIk1yrcLUVf2UP3t/zLQeAZrNJm4RwEAm7lQR66C1NpiKaWpE?=
 =?us-ascii?Q?AAfFVPzz5aaQVBbglwpziyUNK/dj7p6MivWzZfA8M6VpqCaMp6nNjSByQMtm?=
 =?us-ascii?Q?4PfemPn71D+DnxYVGS31e1HS6cOziKZSy8OrFKLb8+Rda2FVyBvCcnt2K1xb?=
 =?us-ascii?Q?BRju/mmDcHK+sA4ZWGTWNeFc4sDsHUc9EmOLs9EnU9WNpazTDvi81ozYptd9?=
 =?us-ascii?Q?xj2FxuSUgGwZSIjJOMqbFVuRl1HiXtAucrMe+Uojq+gDFodL9rnFjFu8kV4D?=
 =?us-ascii?Q?teAG7On4hisLVhuezgXq+ebzcwVtCYcJheJ6fOWC8aCO85Xc5hhBug9niVSp?=
 =?us-ascii?Q?osDpMFszIFOS6Q6y1xulYYHWMDLD8VefpJgEjCmxetJQWJLk6RageO7TZcNv?=
 =?us-ascii?Q?Zs3avhAH73sM3P9Q8j2Xgde1haPok7ULVaPDCB/lLd3rooXskyG2/u8hvPkG?=
 =?us-ascii?Q?z6YhWdWZ9KXgdKRQxJ1TEDtuuKPhz2XYQChrlvBepxhHwOITA57+ULsOcbOD?=
 =?us-ascii?Q?oFch2cmgIQHWT8Vy8eNRk2jdaG43IA6mx7d0XEYV6QEJLE2MAqktG6yPedG/?=
 =?us-ascii?Q?40S4WVdHOpzxQs9wwMyp1XYqzPbF6bkHxJU7oTofnseQ/jM7FkmE/g5IDE6C?=
 =?us-ascii?Q?7jKsqzhbrp0fW49iH1b6mhKBdBZBFA6IbiNOo+HCICcoHqlHxUcdd4sgJcXp?=
 =?us-ascii?Q?kyiR268a+Cj8bAYKV9RTqU51tRWPqgU=3D?=
X-Exchange-RoutingPolicyChecked: djr34IhK00qfdlqXDomRMEoVwLTM4aIHw7LKE0UCKv5EPqkAmqEZBOp+/37kL+sPNHUoITceyHX6jVqVDu0HsF5yjbsVPyuFJe2Z8G0xdK3o8os6bT9mV30Clh2iphj1hdJyjVANbbXOVRJk8UyEbL7iXQpn7mgtaLDos2R8v5w76GlgTJKtwhyUZYn1bhGvWYsBUr13LJQJTbJorbjvDC20UKoDEwq8wKWiCQfp3ubMTjtEW0JLm8Lz0LlKTnUaHSHIn+cd6KtgbmGY5HVPjVck6M7oDE2XV9eaHb9ySOoyTHLP48pqQrTqKLIcg4+crZTDJkNiqeRB50RFULZ85A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a6ef01-95f0-4567-8c0b-08dea18192e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 21:45:02.1493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PkoK3mzglTl7WIUaPdOO3KC9OOtbBtpjih0gvGj6ngz58YbT2qJEb+tMYd13mf2POKck+G2outiJXvxE4dzFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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

On Wed, Apr 22, 2026 at 07:49:55PM -0700, Niranjana Vishwanathapura wrote:
> In xe_guc_exec_queue_group_cgp_sync(), add vf_recovery(guc) as a wake
> condition on the wait_event_timeout() so VF migration does not cause a
> spurious timeout. Adjust the error check to only treat a timeout as an
> error when VF recovery is not in progress.
> 
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4171eff4e8ad..0e857ef06611 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -827,13 +827,12 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>  	 * Hence, no locking is required here.
>  	 * Wait for any pending CGP_SYNC_DONE response before updating the
>  	 * CGP page and sending CGP_SYNC message.
> -	 *
> -	 * FIXME: Support VF migration
>  	 */
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 !READ_ONCE(group->sync_pending) ||
> -				 xe_guc_read_stopped(guc), HZ);
> -	if (!ret || xe_guc_read_stopped(guc)) {
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc), HZ);
> +	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
>  		/* CGP_SYNC failed. Reset gt, cleanup the group */
>  		xe_gt_warn(guc_to_gt(guc), "Wait for CGP_SYNC_DONE response failed!\n");
>  		set_exec_queue_group_banned(q);
> -- 
> 2.43.0
> 
