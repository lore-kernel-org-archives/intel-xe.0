Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96646C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 22:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B2210E461;
	Wed, 17 Jul 2024 22:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7DsnrpQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6845110E481
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 22:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721256925; x=1752792925;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O06VLZaEcFgiWmURlMWNNDUGDgdcwAxTDfJcLZOygEo=;
 b=U7DsnrpQIs92VITGQ5JEEEIP79NDUReFXcA6IDwWWPX28665VEGxZogl
 Fp1UqD4DxKI4zMyVt7qNNOy6+nLV/0BRXgwg53IB1+ISUdQTYACviwAp6
 Uvvr4bpxIJqPWbwPJ5h9qflaA29Zt3VxFxpF2KihUhERcwbFHpw0tjIQ9
 UzXZUA96D+cmoTpgusNt6czXX3VTzmYr/ABieRaMiLiAY27iU/Og1Y+h2
 S0Tatvil18POGqgdndRHdQAWfmqp7VJfsY/fawhopI/VUzhxj9pNR6dsT
 e1HafGciL//iZaQtAyjpPuu4+52s8trVOt0WzViBphFRJBz5Wn7OHh+Fp w==;
X-CSE-ConnectionGUID: usVg926ySv2FuctUlYrW8g==
X-CSE-MsgGUID: gRrMg9gxTjevWfG3fJoV9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="21699727"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="21699727"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 15:55:24 -0700
X-CSE-ConnectionGUID: 4vke567VR7GfI5sIBvX53w==
X-CSE-MsgGUID: iXB/hugsQuq2+dNrW8fpIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="55068551"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 15:55:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 15:55:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 15:55:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 15:55:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 15:55:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGRK+m070ZihxnY9FNsW70yDKsKe0k4QNiITCPW5ICz1wygHtrRtH43Tr0RYQnu7mfyXod2GRFc3xJZBc7WlMGL2lTI6HetoH2MQVxnQ7/775/XPOnre68LPaVe3U89c7gBu015alocbiFM6Ec6skhq4TT06+tU3NeS7FEbk6eHkaxkXAwrw59u1+G+XbmBsli1IrBcTpEdYEjNL69BaQ3WLxQudHf5qXrTwdpCKqj9djAXmgLRxr8o8kg1//O4EfA3rEaGoQpj2vJ1yLQcpoP77++6oNVq2o0NIOg8s/B57LXoRpRMKbCdwspEfZdo5GCrk5fwZyrKi33bj+/Idow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHH8vAD3D+7JvRnZiyWOQcUxY5DKytwpUrzhQetf3cc=;
 b=toQcXoYtTNDZZ/W+Uu++PjfvYSx4E8csnNl1DnON/QicFsWmGkHmRfJFM5AfOTBHejiDK8WuiopUNYryTp5T3UyFCfnbUxrhqCLNf28Jh3I1gKtROHCtc832n/Tb/TFXYvgefXM1zn0PzmiFrvQEpX17q81XoCR2eL7eEnC5JfGro7OThl5VOzsdJMStQ92/VEur/B8jRXGztdWv5zW0RjAFCHPpjUPNvN7EWLcUr5ijxInSg2OY8vh6vfi1Y99TkoBJdNGLV4hZVeI2HkaP/oQ7HV46y7p4NlwHY6nQNCEFCKj4QzJS0FQti6q6O9BOYUOUvS/yu+53xiKB1Ail1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8578.namprd11.prod.outlook.com (2603:10b6:408:1b3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 22:55:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 22:55:21 +0000
Date: Wed, 17 Jul 2024 22:54:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 6/9] drm/xe/hw_engine_group: Ensure safe transition
 between execution modes
Message-ID: <ZphLpjXwjWddLTz0@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-7-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-7-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2b0384-3fea-4471-fc4e-08dca6b38950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?04z6Jt9Nhsz4XTp0hdbrHPeyeSyJOMiDnnAo86orwLcvv370chj5+s2G9Fx0?=
 =?us-ascii?Q?BbZty4FkykMzKxt1JfAlah9wTf0UWg+uBvTPzmTT3fgbYL087CqyvllFoc+E?=
 =?us-ascii?Q?VmMx42RAgTLsp8J+C3qMiVM6/Ourbo+UaSLM8903xgPDuvh54pdc7la/8x+E?=
 =?us-ascii?Q?0++GTWeNLUoOknuZbX45Ws/QJPirPiVWtDpdc1uA+EgoD1ktpKg27hWFzMUa?=
 =?us-ascii?Q?XTw6ftQ8p+VuDS9yUu0aK54LJFJfO8YuLM0PJ1DRDQ6X7Q1lC97w3KYIwrq3?=
 =?us-ascii?Q?IaL0ABfeQk7sh5yevOwTnpuNyBZTHhpaUPD+8W7SyxCJ46bsT3ETauDCSP+4?=
 =?us-ascii?Q?p4oOtyO/+HFOM06IDt+YICvfHbS30QFGRmXJ19HCzucjIJtk0ZOOxDo9xNZS?=
 =?us-ascii?Q?QIpfEnnuYPmxJpVBFzYJsLpoSmLJ28pZ0w8Bw8SAi+YzUMOgZL+jzRZc/7r4?=
 =?us-ascii?Q?5rQZtyzB4EhZD+808HRESvVIQNuso996ZqAEhILjOCpb2GKURuK9WJjMngKq?=
 =?us-ascii?Q?UErLKsVq4Gt01u0kX3xaLeL6kyQRIXtqZh1YpSwLYuV7e4kqHOmUFPxjAenz?=
 =?us-ascii?Q?vU0o5zo1MO4zFBdlCKm9EDdEQ9s7AGKRx0Gh1bOLifHdKMZA5aBYNf+lgT78?=
 =?us-ascii?Q?glpKC5xMYVYhmhaLUkaQgcyQSQ8DrpxWrmmtKUCxoXo3uBUVk45Z4y0Y6D0Q?=
 =?us-ascii?Q?0UeL7fm942cho06ANTUtjznnxqNnN7nyYD3z48k8zZXt/pruCNDHldzr8qwL?=
 =?us-ascii?Q?UxDovH+duegETGiHLscakxHJCXw3txJ89lPNmLCPg5csSlbHnOEOfZ69P2cq?=
 =?us-ascii?Q?BeEOr1YWK6JsA7UOlAKc5WENO75QPYzoq7ayfO2ZhDZaSIGlbEFAf3obe2FI?=
 =?us-ascii?Q?yd6bIA/ftRCQ748WGu1syFx6POWP+tPJ8OSDqUUatZEabU8YyHMkFoqe8vN5?=
 =?us-ascii?Q?3jNOrEk1RyiS2acLZj9N7jCtPTJGYsLxKeQ8T3yd0xHQGONwL3ceIsxrJbK8?=
 =?us-ascii?Q?szNr0hj/SuhT628Ay9JR2HsJTH8LZvuuvijZ7nDyEQFulNL5bQeULDPxGu4y?=
 =?us-ascii?Q?jZBzy3uq8mfv6Gkqhsoi+kBH7FsbaoY6XsSvvFEEfJv8PWWr4NkkGBJIBXo7?=
 =?us-ascii?Q?PWqGtYflq49kCIzRr2sOkm+gnea0CIMNGQeNQ/P75izg1TW4xHmLEavdptAe?=
 =?us-ascii?Q?bc29RwgQvedSxtjlVcOWySuJu/e1Y2EfzpAyI7XDhJBcSv5TSZQI+1LLdsZ9?=
 =?us-ascii?Q?qJK8x6Fx/hgAxkxnTwmJGqai4j3a77gDZHsdgeCQA+LcVLbwFsySo7Y1xqES?=
 =?us-ascii?Q?VW2+DNobVzO5kcmL44jwBWDZ+mw9eFLxQfkj+4Dhp0os2g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FUyuPTUO+hRyJwX1xDI8AmoeM4xxXAOq9Ee3hWRJC/mH7ONH01M23LKUphe9?=
 =?us-ascii?Q?y+A4DvxQCCbSwHiJqdih67NtQq+GFaGhIqySzaEBiivUC6QpfmgMFfmNLohH?=
 =?us-ascii?Q?sE2MbGNdbLErNoNgsDhS5O8qYUT6dx8qwtxLW4FdwkjeUu6olikvSa+eBJdu?=
 =?us-ascii?Q?F9vd2Op7MJJ+GlXwei5CsurWdQJLpAtI07khfHsyNg6P1R289YBoenpws0C1?=
 =?us-ascii?Q?FtG3HwkfgD4Q2YaN8mLsNRD9VVjxQIT+1oEY3pJG9+2qER4+WVteptYavGiR?=
 =?us-ascii?Q?XpiZzF5ewFztAQ36VrgDW2GHpQXEW114hS04NEo9Ohc9PdULJiX5cookJt5F?=
 =?us-ascii?Q?HO1DM9RkdDjip64QpR7xM8DTnzECtX/zCvS59pTxDm48/vo5CkAJ83lbrUc+?=
 =?us-ascii?Q?mJA68IlXitVXAZ4MuJMiTdjCUFRNVf8FMQyp/x8KrJTInFbNPWkx8FfZffRz?=
 =?us-ascii?Q?MJg4jhYC2e2wSTGT46Cx6lwQsLQ67v1kemwGArgNTbLRRHaUrOYkR6xppcNm?=
 =?us-ascii?Q?bHJSQkRpUTke/hEuvcAzUuHIQ6t/6eMXEXa42/UlUN+W5VTH68RiCt2viH4E?=
 =?us-ascii?Q?50rb8lwTVhxgMTyQGczPU8aGuph6wWq0CkxiRE+jvKRCGB/A2zLj0M1+YAxN?=
 =?us-ascii?Q?kCuZxW1RdueYZR88LxEBw1kCn3CA7H0qlPvIyW2evso3A3PqZSXg2giikYWq?=
 =?us-ascii?Q?nl6WZQUHKvS6ZDiSkd7q/YYrTLfiPFT7a41ZUXQQeq5HLOmVv5NRQu1eHAU5?=
 =?us-ascii?Q?h2y3ZQCkiNPZ/I11sb5+bUd0nauV3K3jLTfXKfdIe9ORLFbvGEl37j0f0U4k?=
 =?us-ascii?Q?5c8DITM9CbNfMsr3rLWSrZL7VTQmCtIWEYRmF9hh1Ai+qQFGWQZH4JGkV1Pa?=
 =?us-ascii?Q?V3dNxhbOw9gB+YJ5GzW2tagMriWhRmbzeca19NrAJ1G8QrCaXo3HpOjTgwyP?=
 =?us-ascii?Q?bpP2RHydYZcUpqYUYkCTyOfUM0G8zednIF0ApPaYzsL2BltCYDuHGmbN98fR?=
 =?us-ascii?Q?oVNAUXUysGhEZ24n9otHm9ri5eVSNFKSco35TiZ+Y1+z/JdkTHoIV2mA5qdp?=
 =?us-ascii?Q?jYypaujY7GE8G/OM+9RJ6kYMqNKM4P/IN4CB8pcxBvdtz1Zv7It4LGavjQDI?=
 =?us-ascii?Q?ayFjkejPd3yA8+W3+/VB76pqvwtxKn0KCz6GC5iBTNgt9h7evMAUDy5A1oL/?=
 =?us-ascii?Q?myznUpdQ4K9I7tbw8hfP/nx5eHDzYiqH+Ytg1vNJmnI5+RJcCByWBYcXh1y/?=
 =?us-ascii?Q?3VXXQCgFGk2MBnd/Do2KUdPQ+3OfdWOZhAY4FycQp4oK3DJCutotKHEqcOFD?=
 =?us-ascii?Q?vXaTqBIvASxP5fgYcuxM2fPDotBkatWGpFjiXx6K8JGslh64FcKPm/9NBlsi?=
 =?us-ascii?Q?WClOZCCKFDM7YtAFdZSTI0Z9bqHkkh6Grbo+VowRx8XZOO1pYvLMR0nqZF3z?=
 =?us-ascii?Q?8rW3etD8lVs3KFtLowrXquWu2apn8kF0zE/FNEKw1W1PAogAec6YeckOa0Av?=
 =?us-ascii?Q?ChtN3f5RYpZm92T6RjjQYCCg0uwYBsjGHyzbgVUAsWxIy23OPKIwxe+OGKnl?=
 =?us-ascii?Q?SDvAk/RcGAw2C9GgtNOTLLG4SRL8Wygy3yHSkJpsAs0hpMLKdzrWNr6hJh5o?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2b0384-3fea-4471-fc4e-08dca6b38950
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 22:55:21.3769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7NOV4NTSzcCrdhg+D6kMaGYcdkFgfxY+nP7GZDvdULmgkdglQxuMC9+QH52jumXIQ3N7FNE9pvY6KTSwd9d4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8578
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

On Wed, Jul 17, 2024 at 03:07:27PM +0200, Francois Dugast wrote:
> Provide a way to safely transition execution modes of the hw engine
> group ahead of the actual execution. When necessary, either wait for
> running jobs to complete or preempt them, thus ensuring mutual
> exclusion between modes EXEC_MODE_LR and EXEC_MODE_DMA_FENCE.
> 
> Unlike a mutex, the rw_semaphore used in this context allows multiple
> submissions in the same mode.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 67 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h |  3 ++
>  2 files changed, 70 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index dc75dfe6187a..4f539711357a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1278,3 +1278,70 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
>  
>  	return 0;
>  }
> +
> +static int switch_mode(struct xe_hw_engine_group *group,
> +		       enum xe_hw_engine_group_execution_mode new_mode)
> +{
> +	int err = 0;
> +
> +	lockdep_assert_held(&group->mode_sem);

lockdep_assert_held_write

> +
> +	if (group->cur_mode == new_mode)
> +		return 0;

This is redunant as the caller checks this.

> +	else if (group->cur_mode == EXEC_MODE_LR && new_mode == EXEC_MODE_DMA_FENCE)
> +		err = xe_hw_engine_group_suspend_lr_jobs(group);
> +	else if (group->cur_mode == EXEC_MODE_DMA_FENCE && new_mode == EXEC_MODE_LR)
> +		err = xe_hw_engine_group_wait_for_dma_fence_jobs(group);

These functions lockdep annotation should be lockdep_assert_held_write too.

> +	else
> +		err = -EINVAL;
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
> + * @mode: The new execution mode
> + *
> + * Return: 0 if successful, -EINTR if locking failed.
> + */
> +int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> +				enum xe_hw_engine_group_execution_mode mode)

I think you need this annotaion. Unsure if the lock being interruptible
though if this is needed. I'd double check on that.

__acquires(&group->mode_sem);

> +{
> +	int err = down_read_interruptible(&group->mode_sem);
> +
> +	if (err)
> +		return err;
> +
> +	if (mode != group->cur_mode) {
> +		up_read(&group->mode_sem);
> +		err = down_write_killable(&group->mode_sem);
> +		if (err)
> +			return err;
> +
> +		if (mode != group->cur_mode) {
> +			err = switch_mode(group, mode);
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

__releases(&group->mode_sem);

> +{
> +	up_read(&group->mode_sem);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index ce59d83a75ad..fce0adf6a7c4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -73,5 +73,8 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>  
>  int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
>  int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> +				enum xe_hw_engine_group_execution_mode mode);

Maybe consider putting these function in there own files:

xe_hw_engine_group.h
xe_hw_engine_group_types.h
xe_hw_engine_group.c

Matt

> +void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
>  
>  #endif
> -- 
> 2.43.0
> 
