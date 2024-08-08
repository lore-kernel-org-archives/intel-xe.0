Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E720C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 03:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5872610E115;
	Thu,  8 Aug 2024 03:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJZdfI0j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3FA10E115
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 03:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723087646; x=1754623646;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AL7hus9KhHoMiZRHpmvPWhqCzwtDjcB5EBDL0UZS93g=;
 b=HJZdfI0jJ5VBYKOCkml3TP6YuNiq8mYlmMpdpD2aZPd5821VDC1UwspE
 FsmIk9i7aCM/HQTgqKA9lN1AHLntSXgcwu+/Zt0n+uCg4EI7C7lpBBa2s
 ATbb/aMw7TX424XwOUaN2cXlBoNjCYaXdqrOSEvlnXWEGplPge0jY4BHt
 PAfqHVrY08fShwe69ts9YR9BkGAoKFxLyfGun7ibdkjZ8Gus1ojjXrRrU
 /GGzCZOFjXFhXjO8YSJeKRqK2Uv+NS2be3MPhcAJ21PJL6JHj81UWiRwT
 YTWEAdaLv5wXrWJabijh/OS5xoSbnBqnry1SpQ1cuvYL3lZwD9JI5ulS7 Q==;
X-CSE-ConnectionGUID: FKMVvlmSSXeDUxwLSSFQCw==
X-CSE-MsgGUID: hU7bLtCRTQWWBGuk26luLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31767568"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="31767568"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 20:27:26 -0700
X-CSE-ConnectionGUID: qm59HVnVSk2Ad+XVRToL5Q==
X-CSE-MsgGUID: paRfvp44S7e8q3pMwl3Q9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="80308159"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 20:27:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:27:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 20:27:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 20:27:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzvJd4Pww1Dw2RX4+7QxZNa1/7Dt2O7aDbAHYOSOReaBjD8RJNHsLx+NzidoOInW/I0ka8kYsqLrSlSLToApKrZYDyA3OlkSNx4JEHTXUMln2ihB8BsIVcQJPD493acJo4OTbuwc97+fdJ85Lvdk8bi5RBAfHqOA0v51AIYecO2A87yFnEsf7WlsO+vwvmcO8uYPeOBKgLUUg0b820TiN4liUbeMegZ/76BxMVIrHvDu37BzS6p4R1R19gtd303j+BWxIVvcvNxoqwo27AGu/5ni1wIs3Ef2H5flt9fSvFTQETuY2CIEZmgLxteSkhqES4KoJGmh+ffSTym2KxcFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p97PjOf0hYDyKoki1SK2hhYQWC2CHYleCx15x5VABiI=;
 b=sX0m/dDq42uquQ4BgpQVH3YAgGjKwGOnVaOhBMr9ANYRpqwmwjP4AQbA6Gi97VF2rSUpl2eBqVI+Xy1WmQTkKpiTJGQNDByY9/DVj/doI1y5yqkjeKO+8OTrkYYa2KlgxrWqSTY0qO7nzMHyyWd/VXrlpc/Jf8MJLBQQhs7lCEKENAdu+FUgkwrK4/N4btsQ+Ny/wMJoPS821tF5XpKP2AR5e5WpHT1A53ofJCdAKuG81RDcRljJLhHM5UsI3eLVQJXgP9ERKKOv9M+IcvHjXiFkmjyFQUGDnmRr3Wa69QGLv+1mYL5FLlWNrbccF/niMuK4CJU3VfrjbcN8nnDe5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7472.namprd11.prod.outlook.com (2603:10b6:510:28c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 8 Aug
 2024 03:27:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:27:20 +0000
Date: Thu, 8 Aug 2024 03:26:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 08/13] drm/xe/hw_engine_group: Ensure safe transition
 between execution modes
Message-ID: <ZrQ6yqzSDUrO3MdD@DUT025-TGLU.fm.intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-9-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807162416.1307061-9-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a813387-4d40-4457-7a6b-08dcb75a0310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V0izZ/WcdHjMXBaWt2eVg1oVj2U3U4n6tlTBg7YCKVv3t+tkzsonJNNRq8d7?=
 =?us-ascii?Q?0k/tRGM+p9OLAUbjcfmUKnQEVd5rqGpB/FvPGH70WfwE89aTXDuait6BVSgb?=
 =?us-ascii?Q?XBTaKw/J75jqNrxrdC4w52qV0NTBbBlVoHOShC/z6xHpQuixQOTcpw3sGYhi?=
 =?us-ascii?Q?Wl0UNE9quxWgfjOlHVJeztINUTG4REA2w41QTtt81WlzjsHSnyDLTyILWpOA?=
 =?us-ascii?Q?DU4DjFLFVi1RBQWkjkWpSwB0CAvocR3QtwsCSuZbKlR1HOXuy8N3SlGPWKQq?=
 =?us-ascii?Q?kSCU7Xaq11/kPUWQ+Kapip6/BnWsUeYnTXbdNaOE2AVVZsQvvB/x4gDkuJdC?=
 =?us-ascii?Q?6o4LdnjtR55pGEjuqKrGF9axZBFbj7IzUzXCK5HdVlKIoEF7ggTw5aBnkAnf?=
 =?us-ascii?Q?x3J+wiP6Jyp0Tr3iWGNWFwIz4RjbouXgduOEnJ7HGyZxIU5zFr/0OC62ZyN1?=
 =?us-ascii?Q?DNt77S3FNLHYYJwMPyYHDy3hed6CWsdgpE584u2YbtR1brDfp9BKVYG0Py48?=
 =?us-ascii?Q?uh/lCjgTDn2V/y+663lonwFLBP3QTvWdDmcITryAOVlJ5OIY/N8mtkP1YRLl?=
 =?us-ascii?Q?pQ1mR+OWYNgMVFkaMBoulSVXvpFpAk7RAjwx92zyvWlzmQoyozXRPB4DakPs?=
 =?us-ascii?Q?drveSb3oMJXTaYQvJZmEUZv3fo1hbqth/b+oDsg9vRW6TDj0R2S5dWNloDIB?=
 =?us-ascii?Q?j7jb+swjEmVY2H3RyCMrVVeHhNFUek8TJHvnKrEYcbrlxNIVu+vBAHlVV1/0?=
 =?us-ascii?Q?nuiIB5+EX/JASMdZwnhktG3Yj2litAJZCoZbml+2zaDhc79ZfgtR+gBl2pvm?=
 =?us-ascii?Q?hk9Mn2IXRHpEIVZ4i9J4xMDbKRgZ6R2x04AiDZmUJpsnzyAL7mjmcIAy7ERb?=
 =?us-ascii?Q?E3ODZEJLQKtATdZ364TT1N4lX9vk5BFxPeFq15PgmZ3BoxS8S2qpebveNyRW?=
 =?us-ascii?Q?4zFz1jTZiVtGFTLz8XY/tzBSb+iqgkNns83QdWs0glFxveQXJWy6Ekdv7QvZ?=
 =?us-ascii?Q?5a2ufbZuw9JgkKaMswwWSAmtKOr6ZAeNFanthcXPMBfX6x6xdkPLvBi+RmuW?=
 =?us-ascii?Q?fq6iT6n7HMkst9D94Zlhx+X/COQvTmdUYN2BX/Dr26dyIck1vN+eiIKAkMkh?=
 =?us-ascii?Q?+VdkF2lBftfnHmIAQwUT9NZzPJKHr03xpEAV1LQ59F9tFxb601/CkMPXRZtg?=
 =?us-ascii?Q?5D5gmGVBWNhUx8WQQPySykDjGOxE7B93GyapiIMoBiHKDkufUCps6872qc+J?=
 =?us-ascii?Q?vaD/MtRbGLBHyokWwjaq+aSfHWnzUuRbbCi2EKfPkZRlYqAPAcOWxgyPzJMR?=
 =?us-ascii?Q?JtE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SMYmYmSgQflTD33zN0H3H0nZKVB2hVR93vQkDNzILS2xktW/itNcbrTA+mwP?=
 =?us-ascii?Q?X9BQI/mdIb77vHcTftPI+6lq4QHuURj+yxyuo2UtrdMgGUN5b76drVQ1YFqa?=
 =?us-ascii?Q?kpHDs1lJaQikOMKPTTiDWbuolG8bA3OTqXp2bk2xJkOiQv8Nef9IBY90NN+Q?=
 =?us-ascii?Q?ZrSPX+QgxFV5qPUVDEI7MOjDRI7Y3NWPUUcnf9i2JzbFoysN5jtmmNQfk9ra?=
 =?us-ascii?Q?of++yfvQZVZioXNJcXfAOrovRbcJYASvaEg4BMCGdGtQsT6SM8ZK2/qIMo4I?=
 =?us-ascii?Q?Uh1HPpzQuVUYPlRlN45ZYjgWcVLX80bAPDzx+ABfyXqBRHGYnzPAf94dkM7c?=
 =?us-ascii?Q?5fMdyZcJPLe4Y+3HkEYCBSRlVcLy19ne0I6uygiYn4v+RqlWJwWDTI2/r4Pm?=
 =?us-ascii?Q?5hNecKD94rAonlGIPwWl68voMWxpaqhB8gzzqoOgApLG41PuzSePXqY+isr6?=
 =?us-ascii?Q?QZuy1NSAQokEk9FGQgQFJAfasR9VJufKI2WJN3GL/q/TnJwQep2DFt9MslLI?=
 =?us-ascii?Q?Wrp11p59V2XADOBeG2yg+32eHf6TaNzpvT09IXNVFQ/nFT/x1zjH9hExT5xj?=
 =?us-ascii?Q?snUs15pC/b1sLXiGeSKXR6SxiRSYZ6SPkat3b9UTizLEiA3aSZAnfCpaRmDf?=
 =?us-ascii?Q?MM64Tj/0/5h8Vaw5Ad8XjRXMnEnJfhYivkv8hHYnH1qdXGpRNGcWOrxrXPuF?=
 =?us-ascii?Q?l26N2MN2BlaVstjYTAXaG9+2N66YFN9KwrMp7BH4tg1nvL8gLwaQoIZyb01e?=
 =?us-ascii?Q?5EeOkIr9z5gqgtGISAnmukISrSDcdiyIhqoE/sAVNnneUV0VUnZLxC0umn02?=
 =?us-ascii?Q?CLBQm1cpGwRRHcbfBqEPdVZ+HFiG7RKxuZGOswuFI1SpsFwyeWDGH3l+rPpH?=
 =?us-ascii?Q?QZ7b4eJMXrUbjopKLa0JQRt79GZ9WdRnxken1EoBBOdRxJOrA6E67cIBOUcF?=
 =?us-ascii?Q?xNhFbuTMhCR9987BlzKTwxLrQ0C5KgE20EZuo+ATkp8UP3MWGvGcLqzYhpKA?=
 =?us-ascii?Q?puoH0wyUj7mCuNZ3jPy40zHQMhjaxTPGdFNwBbxqT87wfhA6ihDrATo76Yd9?=
 =?us-ascii?Q?Y2+MXuvRn1Z3ItyPt2cdj+U0qKXFnhgCERosp1TWsX/AfkwxgxCVXy56/nRF?=
 =?us-ascii?Q?eBtprxTRPQ0DgdBAz7b+tUvpsdga0NJhQtdXpdAPtAkxXFWWC8Ec/y45jrmW?=
 =?us-ascii?Q?hr5LfYA9oJjNSopy/bB+6g88GwiRJ1XCwjLqcF0yLfTW2AO+I3v/+YD5bBV8?=
 =?us-ascii?Q?5AeTnOtnp0ttM/OU+/Jo5WsemvFY0AwN6meqLebg3GOyUUQzEIOAYTUT5fcB?=
 =?us-ascii?Q?p+9OZU8nF8I1Z/aRIji4VknUi3xOfQOP3DGgaZIUZM76wiN1JDQe8kj6ChLi?=
 =?us-ascii?Q?R9qghrFzRddRAwU/2BbV3t4q/W8NBJuwd+/wVs4IU8tRl6FWzaBXWjmrD+NZ?=
 =?us-ascii?Q?2OgEr0Ht8ijq7mSBuQWW+aGiWbwzZM32/VaeTzxb261PKDDRKx8BGc+GDmgp?=
 =?us-ascii?Q?SqMKt/50q5y9jCAGFwTr/yGY54y0zrzP+1CXWlmGTZd8z9jU2KZBjlg3iPzO?=
 =?us-ascii?Q?AVlPBTODpb4FJ0CH3Ncys6gbZfg2+yx94F+0vWQBXH0NH42Npy5rbBS8US8T?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a813387-4d40-4457-7a6b-08dcb75a0310
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 03:27:20.6754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /djrdTdZvg78PE9pfC5kydBCb1Nt16tYo2nArDQhtA1ybvEAQXRnhaTIFFKVYLSMKmKKpE1CCbdJY2cTfkUFcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7472
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

On Wed, Aug 07, 2024 at 06:23:37PM +0200, Francois Dugast wrote:
> Provide a way to safely transition execution modes of the hw engine group
> ahead of the actual execution. When necessary, either wait for running
> jobs to complete or preempt them, thus ensuring mutual exclusion between
> execution modes.
> 
> Unlike a mutex, the rw_semaphore used in this context allows multiple
> submissions in the same mode.
> 
> v2: Use lockdep_assert_held_write, add annotations (Matt Brost)
> 
> v3: Fix kernel doc, remove redundant code (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 75 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_group.h |  5 ++
>  2 files changed, 80 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 955451960a3d..75c82d24cedd 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -213,3 +213,78 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
>  
>  	return 0;
>  }
> +
> +static int switch_mode(struct xe_hw_engine_group *group)
> +{
> +	int err = 0;
> +	enum xe_hw_engine_group_execution_mode new_mode;
> +
> +	lockdep_assert_held_write(&group->mode_sem);
> +
> +	switch (group->cur_mode) {
> +	case EXEC_MODE_LR:
> +		new_mode = EXEC_MODE_DMA_FENCE;
> +		xe_hw_engine_group_suspend_faulting_lr_jobs(group);

As stated here [1], xe_hw_engine_group_suspend_faulting_lr_jobs can
fail. Propagate this error to the user.

Matt

[1] https://patchwork.freedesktop.org/patch/607427/?series=136192&rev=7#comment_1104028

> +		break;
> +	case EXEC_MODE_DMA_FENCE:
> +		new_mode = EXEC_MODE_LR;
> +		err = xe_hw_engine_group_wait_for_dma_fence_jobs(group);
> +		break;
> +	}
> +
> +	if (err)
> +		return err;
> +
> +	group->cur_mode = new_mode;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_hw_engine_group_get_mode() - Get the group to execute in the new mode
> + * @group: The hw engine group
> + * @new_mode: The new execution mode
> + * @previous_mode: Pointer to the previous mode provided for use by caller
> + *
> + * Return: 0 if successful, -EINTR if locking failed.
> + */
> +int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> +				enum xe_hw_engine_group_execution_mode new_mode,
> +				enum xe_hw_engine_group_execution_mode *previous_mode)
> +__acquires(&group->mode_sem)
> +{
> +	int err = down_read_interruptible(&group->mode_sem);
> +
> +	if (err)
> +		return err;
> +
> +	*previous_mode = group->cur_mode;
> +
> +	if (new_mode != group->cur_mode) {
> +		up_read(&group->mode_sem);
> +		err = down_write_killable(&group->mode_sem);
> +		if (err)
> +			return err;
> +
> +		if (new_mode != group->cur_mode) {
> +			err = switch_mode(group);
> +			if (err) {
> +				up_write(&group->mode_sem);
> +				return err;
> +			}
> +		}
> +		downgrade_write(&group->mode_sem);
> +	}
> +
> +	return err;
> +}
> +
> +/**
> + * xe_hw_engine_group_put() - Put the group
> + * @group: The hw engine group
> + */
> +void xe_hw_engine_group_put(struct xe_hw_engine_group *group)
> +__releases(&group->mode_sem)
> +{
> +	up_read(&group->mode_sem);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> index 857a83787504..e0deb7c7bb5b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -17,4 +17,9 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt);
>  int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
>  void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
>  
> +int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> +				enum xe_hw_engine_group_execution_mode new_mode,
> +				enum xe_hw_engine_group_execution_mode *previous_mode);
> +void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
> +
>  #endif
> -- 
> 2.43.0
> 
