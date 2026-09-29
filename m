Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C182ACA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 21:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8485D10F0DB;
	Tue, 29 Sep 2026 21:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ss1g8F0E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52DD10F0DB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790715620; x=1822251620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aF8ISORk+uOy1oKVL2tcejpmED//5I7nwK7fTn4jc/A=;
 b=Ss1g8F0EGjk/MIIZKMPUMRHtBsojHeKbGKgN/GTBm9paOjx/PozpBHSr
 2qowPzM4/BFNm5XE8y1GGiHqngHhfCKSXTeLbL/g4d7A0F4vlcB+BW9Or
 H1ZGv0WxIKV8Iufw73lZG1FR8soajHhNrH6398uBr4dAUKJ78YwLDuLQX
 0AYLSw9tmvaboRi8Ym0Dh5HxfP6fPGgqEokY5Gm2T4wIIoQ40lqPXGj18
 fRcDe/5NCTe+LVQreTWqbOtosSj94dM4NE+npCXlGX8A26+V4tYUjTJNt
 K5lE6p0gwJ28Pjz2lA8+wEVpjbZ2h6cAfYqMZlA6Nhf2vncz52IbetIHw w==;
X-CSE-ConnectionGUID: vFJqiCDSRqW91BR3qe0ehA==
X-CSE-MsgGUID: iDTvBCOxS8G4P7tRybbovA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102119213"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="102119213"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 14:00:20 -0700
X-CSE-ConnectionGUID: ZSk9ySCVTE6ci+0wsmsTgw==
X-CSE-MsgGUID: woy79+cuQhegv1horrSelw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="273583801"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 14:00:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 14:00:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 14:00:20 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 14:00:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqfe+OLSKzJ2HnLNQcxHWhgarhB9gZmqYZVKqB/J+fJ7pOxNlCGtPOojppbX28P9geyZA+wi5mxBNr9x1YxamYbkN2C3+O+WfCiALQ0aORVs+7cISVkHO8DHkFnRrEY49gNhhyYWJJpYeC5MR2ED20GfWu++9n9WaKsUeOLEqoOlycOJ61As0r229nWuTSxAkSlS6Br3Db5WpHW39p/DxrQ0/qm0jqbs9qQTdoxcM3ykfNHo9skfLJIFxf2b+N909+ZLaOXLdLoJr9uZLc8CleRwXwTSWoAZgUgadI4UKYoyHPUclc0Jn6JGCI/pAlncLJBoUujlFhlHPi7Ty69jTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/V98vh6d8FXT86YyA8aUfktXLiTGwowcYWUvkEZvVI=;
 b=eKKK7DjLtM1tfvbkRFBgdLRGWqo5kBrg/z2jnBZM/QaoDTEWSqyS0i6Pq3NiaCuOsQzyMhJXnKoEh7f7iq2AyTnTI3wMFmdy7DpI+zYS2IZh/OIs+b4lZnXmG+HOdreASB1VDYjRa7EIAC/knK8GVwe7RIx8+ewhW8pqt+RaDjT+xZsH2KLm25by6Nyv1Tr85foBwG0GtYeqPrlEl9xg5Wek2s+QuqgsYZYV6c32cRknekRBloMYbcdrNVfG3Jp6yQZ+ZDmXSLP2dxHNgFtT2iGvgVMvYjhGuwY5jXysLhPVUipBchYRsXs3uhCt+bm+CpduopT6hE2Cu0m/ueUiGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by PH0PR11MB9776.namprd11.prod.outlook.com (2603:10b6:510:398::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 21:00:17 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 21:00:16 +0000
Date: Tue, 29 Sep 2026 14:00:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <shuicheng.lin@intel.com>,
 <dev@lankhorst.se>
Subject: Re: [PATCH] drm/xe/vm: Do not dma_fence_put zero fences in err_out
 path
Message-ID: <arwm3uPEnUUmIBXZ@gsse-cloud1.jf.intel.com>
References: <20260929205606.1076177-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260929205606.1076177-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ2P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::14) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|PH0PR11MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: e21d62ff-0f35-458d-ae04-08df1e6ca9d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|6133799003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: bHMi3zB5DdovAkCTRscBzk9YLqA/zQkTxszJIhEXe2Mcx1Q1q0t8isKEsSGGzlBEl7V+NOXk2Y2GE5TG09xaaRim9BUbIYbqGr1tWctYerbhkJo3dkywNNkwKfiV4sMTQjW2J3tiZVMkWLB3pVf/f3QmGE+17u0vE1UrBrrENMjHkprdlaIrjXVFDWg0wX3vqpbz6euVvGN0RIiN5mMAaItGct6qsgDz80sCC3hzNZK9GCjW0wJvA2rGLmRqNrgnVTyCTKOp9K6kuhXgFPEC/As9G8DFcB8h6cQe/LU2vgkIO+M03QbPQp16Yqf+0dvB78cshorxP8AjOZ5o/HC1c1TvjdxA8VECfZZB7+MGQIMxvSa7IwsPlOpPAfcQlnhDDvud6uTLJ0oiIbPEpkpTZCN3ljL8d9QiPZ2SQkBWxxVrg9FxbABcDgWk8SMiO8jfbKc85zjc7LXW09tFKstpCWXpE9/hR5EOOHFOibT0KlSStI+hboPoB7rAI9OVV1nm4YRRkmAh5leBKVTOtvR1vWJ1VdLQ31B54iRr8KdBRzzEUCC21/p6Uuq4w3wWS1xd7IKBUvtkbRmJoJNID5HMR4QOn5ZB1+quBAZ/gzKoJcMfY/M3XiPRUhDpRWFfm11x81vnYsKkS0jCmmc2HR6mIMtB2Mn07yeEvP/ijKAVST8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZPiTcJk3taNRqH1P7ejulGlBHX2f41MeCqdds9MbP88Hdd3lg+UMXsQj5xZ2?=
 =?us-ascii?Q?jrrWEUUp2dpIVPozP8xh/wAN0OxSzqm+BEdUIw8jzr4E7SW2vSZOi8krjf+3?=
 =?us-ascii?Q?b1Fg4Thnl5WNjdlbgrFRiGTrNNOFokZu73pElgSXUPJhVJeYWf1R4j8eMOzI?=
 =?us-ascii?Q?4+ghPw0TU3b5jQnO69riIX03eOnwaZsxL416kwkB+EhPtGIf41TRLANDK0g2?=
 =?us-ascii?Q?sMCbScRghwgfiztJ9LQ/+uuYN+UIKguzfftVCXUeQ9x/A0IEXXIBR1rj5xig?=
 =?us-ascii?Q?Y1Hy4oHBPwSNyQJZ5psLsdiIpV+CfADhRg1AjNL2IaE8NazNe/Pk2myLduSL?=
 =?us-ascii?Q?eead8O6SJIbnJwVk/RQ8n/pJJer8J3jdKgJezhje7CKqUq3Y04zbXwJdpx3Z?=
 =?us-ascii?Q?IRnok7Cp3gYdOY5qY+Yi0Vabwj8Zu6ZDCqyJiML6GkkwYOeE3Jo1nZbmM3vi?=
 =?us-ascii?Q?nkuoqoh4w3oa10hzynBpetIC2AzC63uEq/eiLOkKppY7AviKG7XLl4pIRdqv?=
 =?us-ascii?Q?RgLrR2sXy6zfJpERV0sue2T9N9+tBfjJIwajb2ikRBoB4Ws3ZOtf92SVre8b?=
 =?us-ascii?Q?7Fb0XFEEJn7HFhm7UsQ5hkO3S+NIGX1RJ1TQJKtk8j4sdV4eWyX1wSMSH00Z?=
 =?us-ascii?Q?N3z/a3LfAnV+tTiWMSmLP2MrH1g5qLEBTzQu3Gk/X7q3lxsraEnqviTUADer?=
 =?us-ascii?Q?6IVq0WWrlnbpANS7VeOqm6YdPdRnpJLmd+ljXWOWA65kwuGbFuV2QKBQxdl8?=
 =?us-ascii?Q?6o5T1xcOmCURxeOX8vgIPrPMxEikkmeSKWsuaSLcpJObRQWKb4II+qD6Ykk5?=
 =?us-ascii?Q?XvyQb0GETdAtSM1rxsnjYMNpWidHlub/h+HZDOqGgCIcKZq28U2wWym7rB/g?=
 =?us-ascii?Q?ECVQWUsOb9NLwVxXxuZvCj7oMN36VRGG6SCQF/nev2Jc+ej2vU8W3CWHy3CU?=
 =?us-ascii?Q?TyWsSQ+6MPaDiqczgsQ5bbOmF7IH4if1YjlQt00bCgTN8Z2Drqo7VKAzl2SV?=
 =?us-ascii?Q?muNIZasRhpFz7QGx7blLyRA9nZ5bmmwwMzDMiZ1d0GSBIqp87a8ZAGt1HPDv?=
 =?us-ascii?Q?EHRtjI3w77CR/biOYarOpUiKdzavxoYoSnpm9IXEUb0hH/n3hlDScf1c8/zQ?=
 =?us-ascii?Q?GwU2ng075yKz17d4mNFSjE41NT8Rr99ynoXEuw8ZHqGJUX/T8mqgnRI8MIjd?=
 =?us-ascii?Q?wwzr2VFuwjV7OdTZCs4P8ou9emgJ715lxOK6ZJ8bOmc2ojYM3TULPbI9GFLu?=
 =?us-ascii?Q?Y/M7UUiQh4cBm3Hdj2OXVuYNb0YQb8thjCHGIOMxj8ngWHx1pgpifDpT1CUh?=
 =?us-ascii?Q?pL0f33265N5gLe1bW3eYzM8wRUhkVwHZXQoqUaFGKgz6uIlz56ZVc9ylX44K?=
 =?us-ascii?Q?Rc24b8ngGAVCAQHAvP2IJ58qcHLpXIAU7XjnNahsQH8EmAd4acQgPyL5Lup8?=
 =?us-ascii?Q?nVxDQZ3gqd4lbD/aJmq916O5fJHLEDQBwpMTx5Cxt79LzGHKV1049SqUnMyE?=
 =?us-ascii?Q?QoNv+VtMu5vs/sY6hHO2MMjRcoJxFZsZ8J6/oyEx88jPOL1tkNBHsLIqEWBT?=
 =?us-ascii?Q?YX4dPPbmzDck88GTVMZ6jtSGFAznbnli9x17lzGck+DOL4vQdZrGJwQtrIPO?=
 =?us-ascii?Q?+6J+uzLETmRdIRe47gNO9GVfp3RoCxCwnIBVlEipjPUrZ+Uw7/KxdFGBGtGj?=
 =?us-ascii?Q?5HqOr4Cg7JeotweQh+JeYZ7BWxFu5GvYuOzmclWFn0Vnqeul1UzkWLqifML6?=
 =?us-ascii?Q?38Ef2PbMTosOEa4p08BqFxo14trticE=3D?=
X-Exchange-RoutingPolicyChecked: Jd20CNA9KbyTIhA5ZFIaUw4Zp40QiaIbC6WUsT7Er2lu13FkagNaQqsQi0mmuAFZ+exWg9j5xNkZ96XcnXy+lcv3+OBWhcG4dW1r1pitRm4J5ZhJfz4rKGP4zI+rZUXrrhDKIQPMyudAjKcEfxlgGQGkhhRV9N5bNcKlmikUy0cUZ+m9mjwyyueqWaNqemtzUt8U+A8AuL1imfYu+rb3YvCZx2HCDFi+gZZBq7XbfVsBJ0IaMOJQ+Lz5hkq3m4ZbLgHrwhkLw7yhof2TnPwfsAQduyGlPOyhZGIn/YlS4HvyRKB++d980ais/8Z9IHW2NdjjRgI2CaxdgW6hqGjteA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e21d62ff-0f35-458d-ae04-08df1e6ca9d5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 21:00:16.5933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAZao0j9gtG+1alxFc/lQ5gH1cTjDA8mRZf7EQQW0XInk8XkJ3Wkm30gX4vUO+KsqWK8QHmd2bW9VNEnUNZ4cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9776
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

On Wed, Sep 30, 2026 at 04:56:06AM +0800, Jonathan Cavitt wrote:
> It is not necessary to iterate over and dma_fence_put current_fence
> fences in the err_out path of ops_execute because current_fences cannot
> be non-zero when jumping to that section of code.
> 
> Caught by static analysis.
> 
> Fixes: f5708e761ed6 ("drm/xe: Add CPU bind layer")

No fixes required, as not yet pulled and also isn't a functional issue.

I'll drop when merging.

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 425c678f4480..f159970bd34e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3575,8 +3575,6 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>  
>  err_out:
>  	xe_pt_update_ops_abort(xe, vops);
> -	while (current_fence)
> -		dma_fence_put(fences[--current_fence]);
>  	kfree(fences);
>  	kfree(cf);
>  
> -- 
> 2.43.0
> 
