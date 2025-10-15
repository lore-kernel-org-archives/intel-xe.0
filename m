Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C0BCCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 21:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E0D10E0DA;
	Wed, 15 Oct 2025 21:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHltBWNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E483610E0DA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 21:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760565525; x=1792101525;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/a9OV7ZNibHvLunUjc69dg8TmncYzb2x5G6tLiycgQM=;
 b=aHltBWNHTv5zvppttMLDf4W6dcw1LciKIUls4dOA24kW6+ypBV/CjBPp
 rPxWTFjrvv1AlpJyb0afbuk9Ncv7N3LsGHAJnbDD5KPjx+O9nj8KMctFF
 xCk417qz1LF1+dJit/yRNYcU/owgwu5c14AyyK1rH4f4Wz14Aw74AVkRD
 CJblFX/3SiSICnqmzx6qlNbbvWu1wndaMYxUR4uMDGTDsITY5ONNHah0N
 CUi1MgI0jxEcQ7LOQdMi9tUm8gtui0ynX+/L3KOOCzahOIwvNggYTEZIV
 gNFZAtF5zczhFCJ2mV509nJ2e6WwLGomBjjeXjxn92UnaLNA2dh/B6zYv g==;
X-CSE-ConnectionGUID: 8N3Kky6uRVKTs0fmAuFy1w==
X-CSE-MsgGUID: GfCjMmyxRjSV/ULi2PL0TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73863877"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="73863877"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 14:58:44 -0700
X-CSE-ConnectionGUID: bn9CbCzVToOkVUCjcD+msQ==
X-CSE-MsgGUID: g6aHMXjDSrO6KOzP/AzLYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="213238535"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 14:58:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 14:58:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 14:58:43 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 14:58:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/QHvDmmYLXc3p9uszJpUr73kkV/5dKJwxC2RWRYrLXIJ8VJKmRJIDq39mUNg2eG02z2HunezE/PMa7r3c1Pcv014d4ec7e6aei0A3vtP1Ex+iBe+ZqXbFjjxKOuwAgLQW1Rxe2A/liKtvlLW0boXFNVNMSdqIlShqIr0S+Z6xtVdECyBllG1t7kFL1STOAsm+3vmzgLgzxSEa9AVH31hcOiEXYmnan+Aiman+yWGMwm9HtqpHam5PhSJKGTWMMeE10Ykl1ZqH2z2qntS7sJDrRutboLM0qNj/8LFY4Dc93OesowTEJjsTbGEiVKbICPKI8TXs2NWVL1gSzoQUiQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbhQA+tS/571suUDmfvnzB9R+V7ppHhq+BikF26ycmM=;
 b=s1ctNPQdbyS70TJZZzZ/d5GWqu2d2jB99rwP5ndR1zSeK7gLBXBXl9g9YBgnvC9pEad4SUKBXTIIfqN8dsA4tBjSyThBEbVdzoNaLvuQ/SBCQjz9/yWqTjUdpLWJjF43fRKoMgxAEwTWfskEcazkOmM5o/vBPUpL9PSge3RTZ4mDSnGYKHGTRDgGP8KhWYUFDYhkFd/u+sID0Ta6OP76lHyJDKEqY4coIARdo+VJqDiiSP16wXntBx9RUTm2ESE6EDzXO9fZ1S5Swx7wFcM8GJGC4B4sRuV8p70AFi4e17EKkwZ1zmf278GuZDP9T1lr/3gf0q5EUaUOMJetOTEm1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 21:58:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 21:58:40 +0000
Date: Wed, 15 Oct 2025 14:58:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 05/12] drm/xe: Do not dereference ggtt_node in xe_bo.c
Message-ID: <aPAZDgE+lzyg/wGG@lstrano-desk.jf.intel.com>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-19-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015074708.1654014-19-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0306.namprd04.prod.outlook.com
 (2603:10b6:303:82::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: a39dce49-b54f-4dc2-9181-08de0c36005e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BnLGaZq+DLHnsb3ztvUpQ/IC+3llkRcNIRcpqhAfnwXn+/L9gQVgf0Ck2Nc2?=
 =?us-ascii?Q?bfBuT/m/s6toPDo4H7DVcEkcqXmlIoqxxIf1TZrlkhC4xo83rU4FTgTOEm9C?=
 =?us-ascii?Q?+Y9EbGsKNVbeLYuPt1HNwHVk3CljRVu56RmwpdLp43nTcIC2EkG6N2lzLMid?=
 =?us-ascii?Q?vwpUWIaD01BxSloXebmHeZxu2kjCA6xvowdSwcWjEToRBjaDzVVShunOTYS3?=
 =?us-ascii?Q?GKhonEVA7JqHdg3dqdH/2eFiEMWH2LCRZw5ag24po+Ebd44ofiiwEjog+VDL?=
 =?us-ascii?Q?SZO9UEeYqe/8qeMrzqPJtYVmVt+K5adHT5L3NF6ndjDiumFcy7t9WLaueWyr?=
 =?us-ascii?Q?mIfKkM2j2GN0/Htn/evJNNsAhIZJ6nFBnoBbaU3j9fuXtn51vfTSFfqE1lbT?=
 =?us-ascii?Q?7yTUJtDld3qSL4VwZUdySzh2ixib3qyftPA5XbksorfPfhH36w6yDJtzEhlY?=
 =?us-ascii?Q?KhV2aBx0J+0sZkV4bAP/0PQM47BBzZvUZtw1q2reaCyBvaMKlO2I3WXj8gv7?=
 =?us-ascii?Q?zK4eHiX9KXAcnT31l4CllOfdC2ThDfO3+uz7VHdpolkgCYvJjabReJNe/Dqw?=
 =?us-ascii?Q?o6shPylQM+VI+1gDAuLzTy9VXplzPEGRJhHmIr4ORKtAQXVlKn9SOQQAibrL?=
 =?us-ascii?Q?ek1OYD+lRBOIuyB6oSVcfit7XehRuvkkSU9MmKYs4lNvOK40I7z0uVe4tJ2i?=
 =?us-ascii?Q?DBTKqe/0ZKjqoaZdXX36BywELNbRJvMs+IfDS2tQ/78z8aCBL4ttxh/B1mV0?=
 =?us-ascii?Q?fehjU31dJxJZjiUMgpTNDUsiR6IEh+0UkMz43IyNTc5s4mG9uQ9WKBXyqmzJ?=
 =?us-ascii?Q?xyw8D9Zw4wWKsbJAVYpQrvm7zVI8mlKWXgG9B4CpOzHWYVn5nZL1AD8a1V3l?=
 =?us-ascii?Q?HiHDKDXIC3C1ObQNilXj50Rbqz/WnijgurtD8SF/t65l1ipW55OzdChEFK8Z?=
 =?us-ascii?Q?6ijjXLwF5dOX5BHlqt5Wu1DxKEtiKAa3QueNHkSHMzPX4aO7FgJrFNAD6enJ?=
 =?us-ascii?Q?pcqeEEB428lvS0LLuSnKibNKhfMI+qEm6GV+8s34c80d1R+L2B5Gl7FoyY67?=
 =?us-ascii?Q?ICPeKiMAUIZryIuGVlXtaZftSa1SEmzCELjmWCeesjefV5aIQG4rk8rVZEwC?=
 =?us-ascii?Q?ACR1v2KokeAbecHn1yxbuD1wrzWVKNSm04w7iTj830erWKfKhoXbg2AIxh7O?=
 =?us-ascii?Q?D0oiSfgRVTsfWh66ZF9F99MXjAdlJjEtaqQPO/q3IKh7lsrulC9erkWc+CEf?=
 =?us-ascii?Q?2uR4mH2o8rZkCe3y2mN6LGuafB4YExXRzxrEcMIUlSnIBsmTg6s+B+p+ca69?=
 =?us-ascii?Q?G09IDZWQfkCYyf2JNFF4yJ2a0z2vKTAlfor/oAcNSUNZ/ZgXqI7/X4KnBU87?=
 =?us-ascii?Q?IuJJFmtU0WvP8qVwzXvnjYBppyUya+NySljYw+byLRymJL2xhdhBzWPt9aFA?=
 =?us-ascii?Q?waNK1jm0J2LTpnrzfkOVO7Gr1aMSQJMA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VATHFLzeUfldvOrbfTctWvO+kZZWrXBl0IoifMmHLNGBkbtesoMxtNvc+jWF?=
 =?us-ascii?Q?q5e2C7yudREMODHlaPWvXsZLoUL/EOhRNA7cCggN3RedZ91r8hzkBUf+jAsA?=
 =?us-ascii?Q?FEGwNiu1O+TFTf2DNrBirdZi67HYV7rfad5Uw2huignqq2cyQAApcX3GAq9K?=
 =?us-ascii?Q?VjDFlznL7y+3ODlQhORknqIffNOOHvXz19G1Ef1w7WbnYjgWodqOXZkrrvxj?=
 =?us-ascii?Q?yd8BNO31sShMwiB28h9y3thO7pGWEZ4YOhNkV0pDPCqL3uB523C44B1YxInz?=
 =?us-ascii?Q?aLc/L5LfUyLvs47vr5Qzw+l4sgEUBQrNN1YS2sMUvKsdt7zKVmqCK8CfsXPB?=
 =?us-ascii?Q?ZFE1E7o4ms9E4po8ywJm85X8oSTIWEHSnc0pPbLJtHk54IkYVXaGg5eA1dQ/?=
 =?us-ascii?Q?Bd1t9imbZU2wlqMkdBjid83bB3UqD7fxwIyxpWi73zmAY8VEkKFXkxf+9J0h?=
 =?us-ascii?Q?ybkx5dME5H4FojQclMB0YO2zx0LcMwYbY2fE0RFHu1RkqJNi/t1sEPP/aq/0?=
 =?us-ascii?Q?k25/63pEfbKWGyuytfXZQf3/fv4lulsluROoX71AgYZ8rqTi7q89LkBFrapV?=
 =?us-ascii?Q?FuuerclJM08k82CShgz4aDVKzi4HwmArhX5hPuVfaVOb9aOOKxtqEOK5lUwJ?=
 =?us-ascii?Q?cB41CTvRkFZ5n/GnNue5BZAXVcyaC7Fp+fzJjMyBwymOTGkZ3ImbZCRwxSBp?=
 =?us-ascii?Q?T91/r53o+T8cMxE/VQaJrNfE39hAGDMeIAZnCzN2spKTMfiiPuFpUvZA50gH?=
 =?us-ascii?Q?TIDCYih4xh9EvpS59Boc75LASPb6JZM97mz/6cgtXRnPBdUIx0vwsaASi+io?=
 =?us-ascii?Q?Z3SlMLgHoto8GUtgU7dssig8mvY+VXo13f2h8s5IBeR9mrUQFb6H2oN4degS?=
 =?us-ascii?Q?aku4M2RD+/4zLbNbQYICTKVnv9xlmBfvdVZFpyYIUWMYRn5bJwDtlWx7qsbU?=
 =?us-ascii?Q?pFNALYLLTE+Xqllg3mneaHNMlcei1mH5wfVob9l+eQf5QpHNZhm+KFj3V1h3?=
 =?us-ascii?Q?VhW72w11Ehe1SfHKuzQjTM3wipZ668Emmxy5qXAHTjS5OyGQC6uZFAcwevHP?=
 =?us-ascii?Q?X+Zob/X2QwVYe25x8e61EbJwgfnq0igqUpTFKZReOgzhLMQBMxi/9TD/MwRV?=
 =?us-ascii?Q?LZ1OupeTCx8b7g0SngjZZ7JFvEsCLFSElgTZhx00LTZbkRcl1VdDNljLZMou?=
 =?us-ascii?Q?FOf/hJ/CMzK9VdUKBNkn4perxVSgxQ64GMK1VjdfxZiAudGyrUMnPEkqHSUL?=
 =?us-ascii?Q?Szr3pO5go/7EJdb8XUFN53CnV46xI6axrPTF4UxS+dDd7bDdfNrYR5UedcAi?=
 =?us-ascii?Q?zLu1hugMX/rSyc+oyJJ1jdknEQFb4sAwnbQNo5A+Ct4OU9/6rIGWhhV/o755?=
 =?us-ascii?Q?WSpou83H2Zo9Mm56NIdyi1XbfIuuV+n0PLqs1RbQjIAQqzTiz8ZWrt7AnH+h?=
 =?us-ascii?Q?tVT4J0pl86q5zpG7SL5I1pOh7yNgtEWvYi5sSIPMhb0CCNoFwRZbXUKux4bB?=
 =?us-ascii?Q?maO5kw0fZsMX1YtvlJ21duHcX3ixrkh3MAxW/TXKDI8ESZByYCOA8Xq4Xa3Q?=
 =?us-ascii?Q?1EawJkJ4zCB1HSgr8oKtiUggV3MdFBXv7WPgfIieClR4T+nf4XLMZPaEkdKy?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a39dce49-b54f-4dc2-9181-08de0c36005e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 21:58:40.8515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tj1hURq9KHQ5vUK/AWngoPgQVFqWFKOkjnZRFr+R4E5RibsuGfXP0e+fjU3nzL4k1PMEr0TPqXcdSllmURTlpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
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

On Wed, Oct 15, 2025 at 09:47:14AM +0200, Maarten Lankhorst wrote:
> A careful inspection of __xe_ggtt_insert_bo_at() shows that
> the ggtt_node can always be seen as inserted from xe_bo.c
> due to the way error handling is performed.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7b65020818738..c895214a7a570 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1700,7 +1700,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
>  
>  	for_each_tile(tile, xe, id)
> -		if (bo->ggtt_node[id] && bo->ggtt_node[id]->base.size)
> +		if (bo->ggtt_node[id])

The additional checks beyond if ggtt node is present indeed look bogus.
But perhaps to be little parnoid, maybe call
xe_ggtt_node_allocated(bo->ggtt_node[id]) here?

>  			xe_ggtt_remove_bo(tile->mem.ggtt, bo);
>  
>  #ifdef CONFIG_PROC_FS
> @@ -3581,8 +3581,8 @@ void xe_bo_put(struct xe_bo *bo)
>  			might_lock(&bo->client->bos_lock);
>  #endif
>  		for_each_tile(tile, xe_bo_device(bo), id)
> -			if (bo->ggtt_node[id] && bo->ggtt_node[id]->ggtt)
> -				xe_ggtt_might_lock(bo->ggtt_node[id]->ggtt);
> +			if (bo->ggtt_node[id])

Same here, call xe_ggtt_node_allocated(bo->ggtt_node[id])?

Matt

> +				xe_ggtt_might_lock(tile->mem.ggtt);
>  		drm_gem_object_put(&bo->ttm.base);
>  	}
>  }
> -- 
> 2.51.0
> 
