Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0DCF33A6B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 14:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679F810EBE9;
	Thu,  5 Mar 2026 14:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMLqinaa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263F110EBDA
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772720439; x=1804256439;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vqkNYce2UgzuJ114EQACj1DpINnhGLhF0MWnUR1p15o=;
 b=JMLqinaaEckxdIV0Z2JhuSSK5cN+jTf/DhcHipMzZ+x9Ua+oAVUA4pX+
 cZYImzdfRgTPmN8CYTwL4LBmk1jj60sadoSVFsY1HFB6wcq3mZQVOhve9
 Y81CZrzGlWek+/qsrZCyJi1LPwuEWFBY5vMuTZqSXzEl24SseKDDhNN07
 7Ko9clrRzr9+md1py5Netgu4ZVXXywCsqVnC/oCplF0QdM6wZ/kxg6FxB
 EW1LM430aPa5lu2nsjMa7gmpc4h4Vp3b46he9pWQoQFLQ/3gMNfTHNHjo
 PeHSjC2SwKFyu8dbMvt0B3u6TBPJiEcbEo4xn19sU1urGJO5ByWYaMj0s g==;
X-CSE-ConnectionGUID: 5W4S0KEaT+id8G8j84tX6A==
X-CSE-MsgGUID: S1Q4pkppRaWniXh+iNma3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91198672"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="91198672"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 06:20:39 -0800
X-CSE-ConnectionGUID: f3TQEYZVRCy9OTfMc4/Wzw==
X-CSE-MsgGUID: wGn2dVbOQ8WiSSyO1oLtzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="216498761"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 06:20:37 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 06:20:37 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 06:20:37 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 06:20:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoWm9ujlYsBnf9kAv1+0ePOMXHgH5EyVQJ4K8/Me+skxGpPCbKM9dL62W0hj4y9yDsz9KCLxAZnSNPtdF8afPPdDYBet4JwrwiiUW++PcWq2enf7hXzRzupkkz7zMODMELGPZErsuyf7wbDOi1jXSXjR3kgblkn4SW2WoiALJHn601xCOowkrlT10X4iiL+N+9FAdZihmVdTfDKj7mh/GqXz7HnJiWczMeeofaakUA/NVTC70Go5tLpgleqyWARCYnLATPeqQa8wQtceZrQpdOYZBmHpiPag0LdPU53UeEDvJwbcJto+M2dMBH/9oZ9LdnLkOgeobLlRxpybJoBtMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUL/OAVWFdjnNNktU1n/5u1NmmfAekFFCujGzPyHwPs=;
 b=zL2O6kzfAhtt6Uc4+XbEYAcEbhRc/sR2kLwd994+d//tAp0QHka0eW4dkDwRR4m+XwOY7VbqdmTRmd/LcKCOURUqCWXINp8eYQpv/+JdweWFZcpwKboBLffTOSxUJmUTPmsQ34HcxUob4Qo26c+EhItZoQhbUp1aDg341FxCiz56wSoYgBBHV0OqZ/oIOEi4DUCgkPZNNCqcpeBrtq5xg1GXLbgjnBbuGPjskqyKKbF5b51k169YcUpzWBUM41Dfpqp4JvS+ZYJFHw1sdFJPIvhC3XRAcTZoEevC4ljYvL4s+4tsnGcX66KhXP/RFG/y5ooalxdq4HYzvYPJPYEIfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 14:20:28 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 14:20:28 +0000
Date: Thu, 5 Mar 2026 09:20:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <michael.j.ruhl@intel.com>,
 <daniele.ceraolospurio@intel.com>
Subject: Re: [RFC PATCH 1/4] drm/xe/xe_late_bind_fw: Refactor pm flow
Message-ID: <aamRKQBSGjoBIdMq@intel.com>
References: <20260305104441.2857181-6-badal.nilawar@intel.com>
 <20260305104441.2857181-7-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305104441.2857181-7-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c2cd55-3d12-4364-1e29-08de7ac259fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: GY0UUsQFRyxEBqTQcPeOmkPV0TzmkAwHqkkex5BtyZuliIS3fMZjtY/z6o2A4DQUwCfW3Yslt/XAU+c2UYRqAR28KjLO+nobGqm2T1GBcCuQMbEyb4dC9cQAvMuZi+Bo9jP9ZIY8S/izEqDmin/vI32cnfQvo9BtvMZQy1lpf2AyF9F5MIbhmxRlk6buk3OkUHyLGJpEK7SKUep0McPDQ4kjQl7hyt15Qj4agQ/9HEB2aWLcp9vBNIHMPeT3bK3M8oDFVuk8cAS/yO+Na8r8cUakwyZRvY4651/dIdkOFB/TK2j0nOaUlIwh5AbYBjBmXplO9I+JjQqjo8nvtC60pB6F2BTBdwJHjxLvZE/OCCXMuAyvfX+K7KEJdJFF3ZG46hpzIpwd8GG3auRYyx5JbqZQdZlUqa6j94d/wJ8kx0cxmuOIQQRtqQa9tIgCAu0wWvTknNcMnj3xpTZrhyhUPGSGzfD3DCGbuTyn+X4AFtVxS3SU35IXG+7WwFtHKCOgUmw7lXxJtVKig+Wc65k0IcjMVjY3XGFFI3taWmP78iy78LzFl4zF5OSsHRiH5Fx0dxP5YtkJzY67c0mK/q/4pF7NuYHJNWB4uGPn/P/DyUpYP+4QX7ngOE4p1BXylfE8UtYBfKCL4ongIH119rILbZP03BJGmC2CKTp154KMJfnfrH8TxwT0OEZ+/Fsnt3j6n4/bAE1GTJl2Rm8iGaIOmgU5K/tpNF0Cdgam2kdX2pg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ht80WHkWuxIwhpC4MPKud1Yk5XkFXunIpEyDu10Rd5To3INibyyyS8o9Y3pd?=
 =?us-ascii?Q?yleqjNEwh109+rnmD887FF4Tc00xsvOHorE9XFaaLzdx0/Gd3MqEcd7ghpX8?=
 =?us-ascii?Q?yFVgmog4aQE8KpxiT+3LV4h6FIM08M3VoDRDCtDtVtAJ8umtj0m++3WyYSLT?=
 =?us-ascii?Q?PoY+SlpgndEvmfE0s8gGTqY1byoWVjiEkY2o+WzjTgFqIR1mmJ+xm/4n45b+?=
 =?us-ascii?Q?VWwb+O6n5ZjutmxG6Hclc5gG8fNaDgJb79Q29UjlS51ckv4vrjm+p09PMipI?=
 =?us-ascii?Q?ZWCYt6KGuz2ljbTKW9qzPfaw7lwNd2TiPih39s+oPIv0zdvFcz5eUPEE/Ruw?=
 =?us-ascii?Q?ypVGeVLHya0GUY/K+LG6ZpDzg0EIg889ArDNiW5VPIHyzvzGmCAPs3dgyCWU?=
 =?us-ascii?Q?jE4XBIr7fYjxW7kpH2Fzaq2gZUG7Z/UrUNcBGhNAdRtKQOyYsh21T+BEP6bC?=
 =?us-ascii?Q?feboD14H+KJdK4W9IlvS9hshrdyH3aXYuRbdCafP414qrvbxGn0l+2tPX7Qx?=
 =?us-ascii?Q?M6oqp83E8v6uYyrjnWuKs0t/xIkcp7zBP8+lDtpG9KPMbmgtpuHMSCKAsHuD?=
 =?us-ascii?Q?Uc3KbAeIipCYzBJxdIw7mto6fGGr1ZxKD+sHteXFXJPDc7eALReNAhmqdzIE?=
 =?us-ascii?Q?rsIexXSx3berjJ2u2GOZ7HhSL8W/7l3Sp58pTv+3zXRVbJWX0XwErf8vIU5+?=
 =?us-ascii?Q?Y+GzXpww9Pi3KWfbYJiSkdv9AuKr0CuHqWLSXjHn6m7rfXRnI9KNaxmdtBys?=
 =?us-ascii?Q?yGXhUWttRbtGwKOJNh3tkBvk7yAJej5oQ5q/1eanyyQm4Amwxm8X/AO663nC?=
 =?us-ascii?Q?8cNX6WD87Mty41+ySPDFlhONoCJV/TmX0iqsdRhzWDbnSFpbEXwpDRGNYyZj?=
 =?us-ascii?Q?vOLLwiLAz1PxnxNDrYHnOL4xYfgx48uIEawpT7SUrzLvXaVp0Eh0pI477EiG?=
 =?us-ascii?Q?owp2X1Z8GayrAiNELeMUxKlAo1FKfaxpk0LQFKfXUN4V0l3M82JcUH++r2wD?=
 =?us-ascii?Q?pZ+h16o67eHQHyzQZ+Oe6RJiHIzXPuf5YrkzaF5Kvik/3YeU4fhAtyQic/Vj?=
 =?us-ascii?Q?7tqOtDEycJz/ttvtOlisF5QBe10/nDYKx/Ei5VaTzg+XdQJmmpixLkstJM+D?=
 =?us-ascii?Q?m8FkFJIB5Bi3uanY4ZO4NRY8VmMulTsDqghcId1U21Sof0IG7INPvnDch3j8?=
 =?us-ascii?Q?fBe5s3t4B2SRBFRsESIt+T0uMri3yj0ORIw8GkVmffjv3rQA5v7KOz9oP7f4?=
 =?us-ascii?Q?9+ZTi2Dz9S1VIYanX9I81SQJ9y8kv6ewV2FXpqYaMZ1Xxr6t8GzzmYH6FQS0?=
 =?us-ascii?Q?lRtxzkqa+aAnzh+k0FTNpvJAMuHZsarConQ4qat0ukkEt9K8rEe/d6TRtDK5?=
 =?us-ascii?Q?coDYncqWkmuwkdlnT+U7hUBn2189l6cfGKzwtPNP+c3gPU+Wx4MfQWXOmZVc?=
 =?us-ascii?Q?h7Fwc3fg5cjeYHAJvx7/mVp2i2FZwCCTpd8jlUOL9RwKEZXDasb7PrImHqem?=
 =?us-ascii?Q?A6gOVU6BLNr7dcXHrfa/4PY/nhPvusrH3kkdvKtBGKTQBUMCGA2LM9NYIGkR?=
 =?us-ascii?Q?D5DUcUibkzwQixanvXJ2yBd8+O17U+YltcTzSnidIi4p2hG3iq7j9KagbvRl?=
 =?us-ascii?Q?ciQf+eEAM8KD4C7suClfzFxEBj3Mjx2MgnSuLRvfba64jauXlwgPwpi8iCQt?=
 =?us-ascii?Q?pWe7jbwkCx/OOG/fg0XThwRID6X8bsAOPYliAvo0TrYStZLGXD1Cq7jKzVXU?=
 =?us-ascii?Q?Cg6AAEeu+w=3D=3D?=
X-Exchange-RoutingPolicyChecked: Mez9fUelT941Ct0nN6rlI6kOR/pmTyNydc0+/LxT+MmvjMaTF0YFbl9fB6woJDG7H7487/kcbrqpCapOyCBJ4AqBbyMLsduZrtgFrK6qM8ZsSDWjEvTqG9yJ11SunMbZdE0dJ7tzFHWMjlnCT7I5tMppYzRsDV7atuEKNmaWdw/yckaCRD4B/9KnvTiMi8XpxRZxSvEhMwTBMlAwLqJfCJk48nCbpS5ZvIVPCpwzlkGRHEgTJJvwZO9+nFjwECC/XLJXookmLebA4oBMluo+mYh3aBG5Bs/YcGykee1GwOfwCSOvMY7S20pwpDtB9RGpMocqsHHKZ2UtsC8/IbBabg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c2cd55-3d12-4364-1e29-08de7ac259fe
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 14:20:28.7057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CP6kz40rt42N1R6iqXj0XJy2sl8mB1f/PX2m3rXJ9rkVvazSbzMHr9zW+VfbqGtI82KPuF0rsc6ZPbAa5CUCTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

On Thu, Mar 05, 2026 at 04:14:42PM +0530, Badal Nilawar wrote:
> Refactor late binding flow across suspend/resume by adding dedicated
> pm functions.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_late_bind_fw.c | 32 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_late_bind_fw.h |  4 ++--
>  drivers/gpu/drm/xe/xe_pm.c           |  6 +++---
>  3 files changed, 29 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 768442ca7da6d..5ca25186dc0cc 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -193,7 +193,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fan
>  			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
>  }
>  
> -void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
> +static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)

since it is now static, you can perhaps remove entirely the
prefix 'xe_late_bind_' to make it shorter.

I prefer without it but I don't believe it hurts to keep it. Up to you:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  {
>  	struct xe_device *xe = late_bind_to_xe(late_bind);
>  	struct xe_late_bind_fw *lbfw;
> @@ -269,18 +269,12 @@ static void xe_late_bind_work(struct work_struct *work)
>  	xe_pm_runtime_put(xe);
>  }
>  
> -int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
> +static int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>  {
>  	struct xe_device *xe = late_bind_to_xe(late_bind);
>  	struct xe_late_bind_fw *lbfw;
>  	int fw_id;
>  
> -	if (!late_bind->component_added)
> -		return -ENODEV;
> -
> -	if (late_bind->disable)
> -		return 0;
> -
>  	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>  		lbfw = &late_bind->late_bind_fw[fw_id];
>  		if (lbfw->payload) {
> @@ -424,6 +418,28 @@ static void xe_late_bind_remove(void *arg)
>  	}
>  }
>  
> +void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind)
> +{
> +	if (!late_bind->component_added)
> +		return;
> +
> +	if (late_bind->disable)
> +		return;
> +
> +	xe_late_bind_wait_for_worker_completion(late_bind);
> +}
> +
> +void xe_late_bind_pm_resume(struct xe_late_bind *late_bind)
> +{
> +	if (!late_bind->component_added)
> +		return;
> +
> +	if (late_bind->disable)
> +		return;
> +
> +	xe_late_bind_fw_load(late_bind);
> +}
> +
>  /**
>   * xe_late_bind_init() - add xe mei late binding component
>   * @late_bind: pointer to late bind structure.
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> index 07e4373905395..8896fea3068e5 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -11,7 +11,7 @@
>  struct xe_late_bind;
>  
>  int xe_late_bind_init(struct xe_late_bind *late_bind);
> -int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
> -void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind);
> +void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind);
> +void xe_late_bind_pm_resume(struct xe_late_bind *late_bind);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 01185f10a8835..f85b12c1a85d2 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -182,7 +182,7 @@ int xe_pm_suspend(struct xe_device *xe)
>  	if (err)
>  		goto err;
>  
> -	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> +	xe_late_bind_pm_suspend(&xe->late_bind);
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_suspend_prepare(gt);
> @@ -284,7 +284,7 @@ int xe_pm_resume(struct xe_device *xe)
>  	if (IS_VF_CCS_READY(xe))
>  		xe_sriov_vf_ccs_register_context(xe);
>  
> -	xe_late_bind_fw_load(&xe->late_bind);
> +	xe_late_bind_pm_resume(&xe->late_bind);
>  
>  	drm_dbg(&xe->drm, "Device resumed\n");
>  	xe_pm_block_end_signalling();
> @@ -698,7 +698,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  		xe_sriov_vf_ccs_register_context(xe);
>  
>  	if (xe->d3cold.allowed)
> -		xe_late_bind_fw_load(&xe->late_bind);
> +		xe_late_bind_pm_resume(&xe->late_bind);
>  
>  out:
>  	xe_rpm_lockmap_release(xe);
> -- 
> 2.52.0
> 
