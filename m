Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B16DC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 20:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D92310E671;
	Tue,  9 Jul 2024 20:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OldnQuvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D31C10E671
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 20:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720558417; x=1752094417;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wb9XyEE8Nq886NkJEARZn5MqLaZ0NsWJUb7SvqMcoso=;
 b=OldnQuvvcxfUydzeKlQdcXFj4u2f1Y7fw4nGVf5+NdaUhd40dz374VpB
 d96VlSqhzMtyN1eqmQ2Pf++5QGzFC4fDcuKELouMNOUC8Og9MnJcx0eRD
 CmwF1WD1sYSxyYgG83112m+twEBTAYkAXiHV4fKR3PK18A/x9RDcLODJo
 CwYDtwGt0S11I+edLj9RpsE6vGnbY0f930/pzWYzI33Pdb0nVDXGWGI2N
 /WpNsMbBG9diSEMZulXkunmwvj/k82e6qtE3bnyrYa+MffW+apUsR9AZi
 wBXWj8U3WrO9ioj5+roa8puh9h9FbDj3FtCQ8j+k8FTYapMxuwhpKCxbY A==;
X-CSE-ConnectionGUID: LABZmyQGRSSwLk20vGjXHA==
X-CSE-MsgGUID: HYkNteMbR5WmaBO5KwYzxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="18051646"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="18051646"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 13:53:36 -0700
X-CSE-ConnectionGUID: gz4iwY3GSgaseqWklkvmjw==
X-CSE-MsgGUID: nVIhWeMUSOuVI2RVhWiugQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="47861823"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 13:53:35 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 13:53:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 13:53:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 13:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKJXl0BN1fsHm6vtsdrOFINgwfS0HNJMeZZUS2OfCkro6v6I4vWdVdugtjeBwnsWL9cK+zIVoMb/ndPgVzBDxyoSbVbNa4X4YSwkfcXkUO7ATbr8+dc6duiQo81PG01wkpeAriYG2J32AfHHWH0/Ak7hkhw9+RIOSvJ5OOooQCy6z+OHC9DCT6/3yz33uCHwz/Y5Xpti1QJzAVKylpiuXsb5iu3/1rGnZWJO4GR5z2Mw+u/38LasiltEKTU3dkjnYYHWAAuPDJxOfuD/uZ+6cvm7U+GPMb/zaGPc0X9m38FKw8aGCVExlMDVquZhg2aV+hbAzBuf6QhLQ6SsmF4pHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5MW6CRPh9JMh+4VVI1YpBHHqF10C/QDWbn/5w8ORGc=;
 b=GLBvVbCW1s4gdBvFAX+4npnE8Dibg/ED3LCCF2ymLMRtuaA42GHPkODndnFA2Ynyzvm0z7LkL3A41Z/k3SZ6QVNT52z2Xfyuni9SJJATgvjLJQI9Jmh1I7XBlOiArUY5mB12y2DLvJLtKyUCSOb0b8k+KyLZN3//Eu34o1mcs4+oQOEaqfYJnekVB/AVYdSy1ONHSLApJQcaai9JqWrBLkejKpjz+fL2yI0b49KdcR7f7uCoz8W+k8hxquUjk45gE1iqRtjkukxWmb2Xpui6QvGLSgi7kyBE0QVA1i6ovElM3dkksP0JMX2P7ns5oU4ai8MzeGkP5PeEU+V4ECjrEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 20:53:32 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 20:53:32 +0000
Date: Tue, 9 Jul 2024 20:52:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <John.C.Harrison@intel.com>, <brian.welty@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Message-ID: <Zo2jIfm1ceFclXZa@DUT025-TGLU.fm.intel.com>
References: <cover.1720550129.git.stuart.summers@intel.com>
 <b50f7ae95234b15bd08d4cebd61a564faea7a8d9.1720550129.git.stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b50f7ae95234b15bd08d4cebd61a564faea7a8d9.1720550129.git.stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: e00e38c2-3c0d-4376-fb63-08dca0593196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qa1Omt35sYxqwce3fHXNTAfzqi9L7AMjniRExQgLcsjmkc18+IF6scLiteEO?=
 =?us-ascii?Q?FzoVc4LAIpNQwtehdV8YXD8G0Qn48vvzLDB2M5a3Rze7aBeOuF8veqcwzMTQ?=
 =?us-ascii?Q?K8d4f2lc+yOXVkUSPLmRcrOJTLg4eRzu2dnrJR+GoXl2Ikn+WIkNNhUrSONc?=
 =?us-ascii?Q?R1+bXWLb6vT+9tx90yh1rVJUcDLelkHni8R7xoXcbBiVh6b9QGEe+Glbz0RE?=
 =?us-ascii?Q?l+sjR6q5q2Izt3zcx/p/DMopetQEa2MyhFR9L0yX4DI+9zNcvKvwFQA5QpWP?=
 =?us-ascii?Q?O58K5VQyoLHtwz28Oi0Y+9ypyV4mMaF/C2qQmP3m3BEpP7uWI1S5KpsOiyK9?=
 =?us-ascii?Q?pyzzIUJWskRNGWpXHO/T9LJU4A7Nas9kABz6nOPcXUhbxBzB7L+VNXTy63d/?=
 =?us-ascii?Q?0SAaCHdwaA5irCkR6iag6eXCoJwGaU4TdlwC0xhxz4ZH6b+/wr76x1f0D+7w?=
 =?us-ascii?Q?bvN9PMitDKlHnT4kPHZfo5F7v02u1TwbO0C0tdGVd1eDQ+1Ul8ydUzvtkKvp?=
 =?us-ascii?Q?KKqZzIs7cMwDtyWBtMjMHRQETSCXaaVhYdI/gqQKsxP8UK5L3w4GkDGzwL83?=
 =?us-ascii?Q?PeF1i9LG8wLe7K5sRDlV4b9eKMWtCjCZlPokB5PwYs2yRmWOKScWmIBJce94?=
 =?us-ascii?Q?VHxK4a7eKeXMO/OYpfMYgmdfuFu/98v9gVG5dZL6jLjvTvuyJpO0k3yzIw0+?=
 =?us-ascii?Q?Uy4K4NA+r5NmQZ3F0+qowA9Avhbb53lZxFUNQUTvwO+fTCl3v5fCP3IN6nAI?=
 =?us-ascii?Q?HZhwtlIMhIlZ+ejCWYm5Jcqfs12WB41ruafG/l8sOFvagwbdG0mU785DE4Ti?=
 =?us-ascii?Q?jVWCcNW1VH0QNahLg3HV06DruDHpC0hnUj0j6io8PVMnPJBTmlTtUv9VH9of?=
 =?us-ascii?Q?n4FdwYq2nd424SScgucqPHz5gAgqLUhfDmMMRIL76dCUrNErmipJFpVU1pSN?=
 =?us-ascii?Q?32rvMo6QBgbP/T8NKv7YbX18fKjCFdDbReTd4z+FgPx7ZC9Xr06uS5L42kfu?=
 =?us-ascii?Q?bK83q6iovW2IOJwPwAnfXThXpSCHTgopsCq5C6Ls2AjNcG+3eGd2wGMaMWl0?=
 =?us-ascii?Q?iKyvgPMZFwGYnQoD2zYLkYe3AfSlLVmWx/Ayrjp9cGn3hUNDsiZh5j4nTeK+?=
 =?us-ascii?Q?ZVq5PCNeneiP7W8U9m65riiJyUrVC8j1pe8a098YOEfvKt32fpgw0mzV9RI7?=
 =?us-ascii?Q?sCf9cbIxStuLTLbmysVMVfnfhoYhVur5UT9SDFNp4V3pRtOxHBsHf0uaDo6F?=
 =?us-ascii?Q?jubwQbMFd0T38rtUKpr+jK9nwEElBqSyNkMP8FcapgpMeR52QMr7l0v27bsG?=
 =?us-ascii?Q?YaEL9oY9qFOyfAJqOEJRcJ8pQWeXQ9CPZz5nOp7NZt9lEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kUoW1wkMvwBmxDBoyA2x+i3158d8y7fJUoRXD9jQZxXtoPcqP7tPmDPp/9qC?=
 =?us-ascii?Q?A6hui5ZwgdNfEwg+yn++hhWVnTa6Uf/8EI5kzEEvZZ5BZm7Fx5cSTjel0nKd?=
 =?us-ascii?Q?edHG7plwkTJ7H68cKexqqH0/aciACJFGitjAr82hkQxKCBcgP2qPLXOOX2Sf?=
 =?us-ascii?Q?FbRwygsaxaCMCtYTRwn+eHJlev8LqfsiVFPadArg56skz6EnUxF42+JMq2iX?=
 =?us-ascii?Q?ldwruM1eqBDls3YZcT8N+BwDP1+R08AZYQkVD6LhFU0eWv7L940NsSeyoLkl?=
 =?us-ascii?Q?rd9ze4xLuSkbkKt6HSCsI2kE932vHeIAImdH7o2ug3WXrl1Hm79TU+R8Q+xF?=
 =?us-ascii?Q?lFpZewEfnZhXCXjoo0U5IX8maN44CMLG1r9TiO+XoaY9qKV9ARxtHikijqO2?=
 =?us-ascii?Q?rYVstbs5xu9J/lfMIQimCj4Ratv48Ros2KCw5yxWM4fT4TiPvyfEgiEZJnKQ?=
 =?us-ascii?Q?HGCx6DXDoeVYzAzM60Ojehd2WcnTGXfz6oNBfI6z+ReKkEPm7INTvr3KVK6K?=
 =?us-ascii?Q?wyY6xRF3dKyRmKVgIMghJJzUny87r2y+I4YPH/KXv9MX0C7y5cRrIMAIvgHJ?=
 =?us-ascii?Q?TUy4R/mjaua2tij79Ut3r3WWl7WqM0p78ahrqHRI1UzQLjYDv0LbV5bSv+Ej?=
 =?us-ascii?Q?8+r9b9HyiezULi53mf4IkpFR3PDFP28UcIfWldWsOXJSmBJibpCHGWW6buFX?=
 =?us-ascii?Q?zn4/8Tm1jicllE91bXmOJWG+gZ3gzMgBwgnPwJaM5D8zH+lKvf7q7+AOGLrD?=
 =?us-ascii?Q?lxwIUd/u5dtKqm/vXHyOrLjuI9t+f/AqZF97k8h33Qp1BvLLTPrNmpfRyekX?=
 =?us-ascii?Q?1TEr6Aj4XxcfY9TUU4UA9VIIcfYdGZ3D6LNXeeplZSxezq1vxYwmSG5MroAR?=
 =?us-ascii?Q?85UHScCZtA88mo5iQc6JteeRB6WnjS8KYXxbK7f8QwfXKAQi8xYvDlMMbxdy?=
 =?us-ascii?Q?uQR/qzMjS4nHM1uWnMU5+0zDvx3candaYwXlyLCv8N1Ic5yuX0e4A/WDwtim?=
 =?us-ascii?Q?6O2B7HXOuKcEOjotVSrjDfP8T2wFQT67LrE2dhq7f0s9wdnoyPbh/tqc9ndp?=
 =?us-ascii?Q?Ezif6EtUID07eG2VNHLVwiXb2lkVlT8v791Xy6HuqJGEW9ajznwOkopVirOH?=
 =?us-ascii?Q?J0JGOqnDYN2+Y9KdbG21mEGYcC09hSF2d6NIOSTUUB45Ys40MECAPsmUMMHP?=
 =?us-ascii?Q?5ElP/2RzARUeWyJi77BdyLUG8Df98Uxip5+w+k4++QiAsjeFKN9F6QP72EZk?=
 =?us-ascii?Q?sFcEwL9Zop2PyfsDeq9hMojNPyj3sP/Qcohv9OXLLmByBM7Rq4re18n1PveN?=
 =?us-ascii?Q?yfmY8/08fuJYLNFqiY//qDFERuqz2PoX3MnjhlWpnX88M6uzWKUOlkD5/AJ3?=
 =?us-ascii?Q?UC7Ch4Lbq4yaGIpkL8JMyP97DZ9bmopxr1ibO3BIBzL1ZayxESY6/IftiOe3?=
 =?us-ascii?Q?eTMCH/bT7TKzW6gefY53bsDC3H39CaNFPWwSnDJzY/hYkJDY13ZEXe0rHWbi?=
 =?us-ascii?Q?ciPhZ8X6ocsSyJkqq8Rk6cpJDg0uGKS8Mnzjlbl6OIF5xWeSaItnjotmdwH/?=
 =?us-ascii?Q?SWgiWUHjXkB4Nu8/a+aJNtWnT6drgW9IhLOOvWM8/GgSNHVEW2plTN0CTbOw?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e00e38c2-3c0d-4376-fb63-08dca0593196
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 20:53:32.5775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QpBd0cwXP5APIqxfXPg3jnd+x3RfEysCAWnjt+rJdBMoYpDkZkJLEM6iwF4YrxuaUwF1puwFArpoBiTmucfIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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

On Tue, Jul 09, 2024 at 06:41:00PM +0000, Stuart Summers wrote:
> Currently the page fault queue size is hard coded. However
> the hardware supports faulting for each EU and each CS.
> For some applications running on hardware with a large
> number of EUs and CSs, this can result in an overflow of
> the page fault queue.
> 
> Add a small calculation to determine the page fault queue
> size based on the number of EUs and CSs in the platform as
> detmined by fuses.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 54 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_gt_types.h     |  9 +++--
>  2 files changed, 49 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index ded8e3c33a82..8f7f68032805 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -295,7 +295,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
>  			PFD_VIRTUAL_ADDR_LO_SHIFT;
>  
>  		pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
> -			PF_QUEUE_NUM_DW;
> +			pf_queue->pf_queue_num_dw;
>  		ret = true;
>  	}
>  	spin_unlock_irq(&pf_queue->lock);
> @@ -307,7 +307,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
>  {
>  	lockdep_assert_held(&pf_queue->lock);
>  
> -	return CIRC_SPACE(pf_queue->head, pf_queue->tail, PF_QUEUE_NUM_DW) <=
> +	return CIRC_SPACE(pf_queue->head, pf_queue->tail,
> +			  pf_queue->pf_queue_num_dw) <=
>  		PF_MSG_LEN_DW;
>  }
>  
> @@ -320,22 +321,23 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	u32 asid;
>  	bool full;
>  
> -	/*
> -	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
> -	 */
> -	BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);
> -
>  	if (unlikely(len != PF_MSG_LEN_DW))
>  		return -EPROTO;
>  
>  	asid = FIELD_GET(PFD_ASID, msg[1]);
>  	pf_queue = gt->usm.pf_queue + (asid % NUM_PF_QUEUE);
>  
> +	/*
> +	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
> +	 */
> +	xe_gt_assert(gt, !(pf_queue->pf_queue_num_dw % PF_MSG_LEN_DW));
> +
>  	spin_lock_irqsave(&pf_queue->lock, flags);
>  	full = pf_queue_full(pf_queue);
>  	if (!full) {
>  		memcpy(pf_queue->data + pf_queue->head, msg, len * sizeof(u32));
> -		pf_queue->head = (pf_queue->head + len) % PF_QUEUE_NUM_DW;
> +		pf_queue->head = (pf_queue->head + len) %
> +			pf_queue->pf_queue_num_dw;
>  		queue_work(gt->usm.pf_wq, &pf_queue->worker);
>  	} else {
>  		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
> @@ -402,26 +404,54 @@ static void pagefault_fini(void *arg)
>  {
>  	struct xe_gt *gt = arg;
>  	struct xe_device *xe = gt_to_xe(gt);
> +	int i;
>  
>  	if (!xe->info.has_usm)
>  		return;
>  
>  	destroy_workqueue(gt->usm.acc_wq);
>  	destroy_workqueue(gt->usm.pf_wq);
> +
> +	for (i = 0; i < NUM_PF_QUEUE; ++i)
> +		kfree(gt->usm.pf_queue[i].data);
> +}
> +
> +static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
> +{
> +	xe_dss_mask_t all_dss;
> +	int num_dss, num_eus;
> +
> +	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> +		  XE_MAX_DSS_FUSE_BITS);
> +
> +	num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
> +	num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> +				XE_MAX_EU_FUSE_BITS) * num_dss;
> +
> +	/* user can issue separate page faults per EU and per CS */
> +	pf_queue->pf_queue_num_dw =
> +		ALIGN(num_eus + XE_NUM_HW_ENGINES, PF_MSG_LEN_DW);

This doesn't look correct.

If should be (num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW, right?

Also I believe we need simlilar math when sizing the G2H queue too as PF
show up that queue first before getting sunk into this queue.

Matt

> +
> +	pf_queue->gt = gt;
> +	pf_queue->data = kzalloc(pf_queue->pf_queue_num_dw, GFP_KERNEL);
> +	spin_lock_init(&pf_queue->lock);
> +	INIT_WORK(&pf_queue->worker, pf_queue_work_func);
> +
> +	return 0;
>  }
>  
>  int xe_gt_pagefault_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int i;
> +	int i, ret = 0;
>  
>  	if (!xe->info.has_usm)
>  		return 0;
>  
>  	for (i = 0; i < NUM_PF_QUEUE; ++i) {
> -		gt->usm.pf_queue[i].gt = gt;
> -		spin_lock_init(&gt->usm.pf_queue[i].lock);
> -		INIT_WORK(&gt->usm.pf_queue[i].worker, pf_queue_work_func);
> +		ret = xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
> +		if (ret)
> +			return ret;
>  	}
>  	for (i = 0; i < NUM_ACC_QUEUE; ++i) {
>  		gt->usm.acc_queue[i].gt = gt;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index ccb4f7b2bf15..ec67d6ae3226 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -272,9 +272,14 @@ struct xe_gt {
>  		struct pf_queue {
>  			/** @usm.pf_queue.gt: back pointer to GT */
>  			struct xe_gt *gt;
> -#define PF_QUEUE_NUM_DW	128
>  			/** @usm.pf_queue.data: data in the page fault queue */
> -			u32 data[PF_QUEUE_NUM_DW];
> +			u32 *data;
> +			/**
> +			 * @usm.pf_queue_num_dw: number of DWORDS in the page
> +			 * fault queue. Dynamically calculated based on the number
> +			 * of compute resources available.
> +			 */
> +			u32 pf_queue_num_dw;
>  			/**
>  			 * @usm.pf_queue.tail: tail pointer in DWs for page fault queue,
>  			 * moved by worker which processes faults (consumer).
> -- 
> 2.34.1
> 
