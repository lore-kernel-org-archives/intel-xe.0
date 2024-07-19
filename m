Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6757BC3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 18:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0567610EC8F;
	Fri, 19 Jul 2024 18:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSCkJ8ge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAE310EC8F
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 18:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721412807; x=1752948807;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HfWVTS/Ou0ok5pbOfAvhjjM+i1EfbLzYuzvxntRVvsc=;
 b=kSCkJ8ge50kLVhe3SiJNAkIT33Bf8R475aRGuKOz9nK2XADrCsa3aa7W
 eDt2IytvYt9U9+2dp1mIo/d1EvyAoWM4R+XDb+gKMUXZXQNIY/si3ZTeD
 izOawMHPMDSI/G9NcypRbGMTHqHwNe2ggzZIABv+GB+cNL8rtunGAJS1/
 4A2IFIO417cei1cqVYyBIO9xw2P86Ueq4pWzUzXejruXor6xq3iQkv/yV
 fXr+VzEdFtCBLAiucwUp+2CX2oxAIaP0hOlGTK9zX+H0uRUAXdk8sTcTs
 anWmgY9PnYrYvaqYyk9lRl3QqMcq/D4ZQjDgqpn6usaxrmczIieGi/1WX w==;
X-CSE-ConnectionGUID: P1xwWXN3Qpi4baJ8I0sArw==
X-CSE-MsgGUID: WxOqfGFLSqi0cI/TC7YG5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="21947581"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="21947581"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 11:13:27 -0700
X-CSE-ConnectionGUID: m9+DQvIpSq+NQTBUoiQjIg==
X-CSE-MsgGUID: NXgXkJCnQNKalxYITqv2fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51268932"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 11:13:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 11:13:22 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 11:13:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 11:13:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 11:13:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fczUq0bjpDbJvtX8rrN75dEqcQQlseGZmeCRKAu0LG8XI1FBByn4qoIk53kwhnNNnSf0iIitYyTVohlrJScw8hqXLvPx1Wr/6EJdikjR3KzIdYc5VGbRQccHxtPUWubypXFQXvzAMvX4mtYm7eTIPs8w34GMLIk3UyclwkyvgdNxRRqniYN/kzVgAQ0lH8YjaM8uiwBV92FICSFalueRvlIllvKBCqTFNWwjJY1zZtBayV6oaYOV4GL55PjjdJsFyT/GSoY5n2GHmV9bVvlw9DWEZK12QBOmfhgS1We99f7Bx2s7kchRKxrlkMD2OI2FhFwy20Yl4XaUT/HR46axdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njxXGp0tQpDYxNOkmaT3o1dqEvwGZ5G5EuxfFX74z5M=;
 b=bhqsYWKxrnGQ94ewBM965GHcgpvH6VU7w4Ln4lDzAu2yJhzgcyJc22J3noQACYQ7ij6axTCrclEuk0Sh+jXidb2Ye/qQSy5qcPXUof7WWTatfk2EahUQzETbPqpkPn2FofGihQs7IQKLx7lGrHtp/wrnMaDATlapQPcC8Xcjn7rOnISAnlrYvg7DQjT2p+8ABrdiGppM3J0p8eQIyAvSiDofBbmKnfVA+ytLNMs/Dn5Qiz6/atGrxHViJBGGgIkgJhCXR1w6UORneyFeoDJ7B2p0McDL9NXLlW+2jx0IKQ5+zcQKOKiBd+x3Pk4JAKLv7k5y/fUTLmS+gFZkKq78rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7117.namprd11.prod.outlook.com (2603:10b6:510:217::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 19 Jul
 2024 18:13:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Fri, 19 Jul 2024
 18:13:19 +0000
Date: Fri, 19 Jul 2024 18:12:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <John.C.Harrison@intel.com>, <brian.welty@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe: Use topology to determine page fault queue
 size
Message-ID: <ZpqsjqILy5RCL0oQ@DUT025-TGLU.fm.intel.com>
References: <cover.1721411802.git.stuart.summers@intel.com>
 <3c2eef90948cbecb8beae29b21663f3b3cca81fa.1721411802.git.stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3c2eef90948cbecb8beae29b21663f3b3cca81fa.1721411802.git.stuart.summers@intel.com>
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 27918020-5f33-4ab5-a653-08dca81e7796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HlbleFgx9gL3fmVyF4HZhFTvIeEf968yALNPlmlNIHqn/jshRhySbDjfNYNF?=
 =?us-ascii?Q?7P4W9EKUisRkwsBmP0/yUml0gh8UpfvCFUtE82pgf154pLjdh05Ewr9G7h6N?=
 =?us-ascii?Q?QzFub8tRxon6t4udYKM6Yl/vZknP8xfoEx9Nxt8GYqfgkCrvsv/RAWl+2CM7?=
 =?us-ascii?Q?PJ58Utm09GULnh590YEekbS7rW2+3WWFwP+4c10kJyAvcTIczszFWUTc7UON?=
 =?us-ascii?Q?ImqKrOjLAdjpuFa4VopgdoZwidAsPqvTf1LHLosh7ii8CMvX9DA3OHooldjH?=
 =?us-ascii?Q?yvWvq/WcEk+GOsN9kFUWBPrEb6AHYcpD0zrf/p10YLZV33EKOO0M3WMd2zSf?=
 =?us-ascii?Q?EWYDF7MLy81GnKBK2X067QxNx5Bifwdzmw/A4svFVlA6OvAC7m7pOazrYVp9?=
 =?us-ascii?Q?kWmZKv30LkNaOAq7c3myUbsVQkp4IGkoIuADgrjJ7//ZAL7BXvR6XqxL/S6Z?=
 =?us-ascii?Q?om3iySmIA89E8xjvYIWdOvze/slWOWItK1KguYNFF1QKCNUkdERcPvgliyHz?=
 =?us-ascii?Q?p36MLBa82/86Ey4PR3dpCxsQrNrKW0R0B8BhITdFmLvAF0dR3djxmLBRK0QX?=
 =?us-ascii?Q?N1cVNt3nrus19OfwgbfrfSOn357o0N8xszaY44hgY93eNaepQLfe6+7Y2Arn?=
 =?us-ascii?Q?zf3Mth5ST8N8c091S34EY875w4v3Jb42gro02B8+LwBdz3tAsCKVZMCFX7bP?=
 =?us-ascii?Q?FE9v2c6q3+nUG/2XlYG3ERLLY9qCE0hnC9of29ePjWMuRLHzb95iYwHseeCe?=
 =?us-ascii?Q?k0pPCwNwTMycYuPlOZrKzzfp1E0fm+BMJmP5RMjlAkNIb7AbH/1/KjeWWdai?=
 =?us-ascii?Q?yiPrcCZUCq2eGdBBc9onxACWowx9Lanzx54D7ICavQgDe9VePertfxMvIPlS?=
 =?us-ascii?Q?l+u5lzZ7Pl+xBGw5QSYP72iKt/f1bmzYSucv7YsuY1ugzIlD2akbLZqZC7iz?=
 =?us-ascii?Q?xd7RXa7sMubR+ZkqVLA3maNoODs8LiEail1eZgVo7CytYvP3q1qBKIaGksI+?=
 =?us-ascii?Q?fa9BK77DMj2oxo6e5qg3/VvKdHCnEFwj/0z1H5Lu0TGrB2DptkU6OVQupQw5?=
 =?us-ascii?Q?4yr93dEc1s5trywYy4iEFsIvpN8scW5oRxPAakslCOZmtvxssjhhDbygAfdX?=
 =?us-ascii?Q?f+lu34SILAQLZBu8xotkBlVeY7mUYYJo08EnTTHq3Fv8hdv28OKOOD1OJtGW?=
 =?us-ascii?Q?+Q6utaOeeeISqjqPSVZgH/ruaz7zFYYwa82C/UHIxj3s98wRTdRDHegd984D?=
 =?us-ascii?Q?OgNLKtMvTLkW+ZpxDlkBhNCgX56Z6GjW41DDLq55lzxuVRWkgefzZHqvkjky?=
 =?us-ascii?Q?sdTz29S2QaPVXBIxs87wYIwY25t5p8u/AFBZyXvTfZmeaw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mYwWRZ75TcG3SObQXbkLw0wuGDDaqznRoLrWnRwXQ2oWnGairvavgkl8eQYG?=
 =?us-ascii?Q?/RHG+tjLUExROQYqFLPRxxW/EK5Spi9KggkqPyzZ4uccLswXhsz58LAPyse1?=
 =?us-ascii?Q?6KAkGEvr/0mWLr7kjKndxyKVdXJFQZnjcmcc2YhfM+qDqfKCy9wrl7As7CDO?=
 =?us-ascii?Q?2F/gldKSSxuPDJVRy2I1Ix9SF79aJEUrLGeUcVzmD76MsjQyhU5Jaw+/b5ah?=
 =?us-ascii?Q?1hsq38cJ3Mss8JyP1cg0XqwYH952TNzIhmZ2YYZ3H2z3jBfS4FrrOIHfGOXj?=
 =?us-ascii?Q?UPYyevW8U4GSVrwDshOkz5+NZHc7Am5FN1WB7pq7/1KUfJjDOC9GBv8d4lDm?=
 =?us-ascii?Q?sc8TTKkaq6/1HgTH5WYnnVJ/i5AKgeE+Cnp7ajvOaySwAjPuijm+S81M3afK?=
 =?us-ascii?Q?0jb2qg4HJH7BxST2qVKV/doYjiZQiBMDzxsBnilDSmx/2p+wVjcKdmKEj5qd?=
 =?us-ascii?Q?oh+YImL3dOCXTwrhEmJEO+9fFbsGwBmsu98DHjfTPdTlugZGZFAFHZrsIuw6?=
 =?us-ascii?Q?eG5MeYBlOpS+X02zMae1Hv3tvN2EC080oj+3vpQcc5Rnedz5uc/6+Cy3zp7k?=
 =?us-ascii?Q?2FLQ63LoAYSNoFIwyV8xAkFJQ3qahHodF9x8P2x7Eb8FeiWrOyeucVowyHu3?=
 =?us-ascii?Q?+JRgETPaIVMCRwz4b8BoRP218R9loNep7CgYOpZfvLycv75LHz8UrNG5FEPL?=
 =?us-ascii?Q?BKD3KUPy02j1lkjVL+1WVMf7achen5ISbpQrV1Ui5bImzUUyuZNySBxTmU32?=
 =?us-ascii?Q?7IWg67CfrFervVFdXo5Cexv/4oErJ6Ie8XlBVsvAvhtyCoQW1GNHqWsSdzoa?=
 =?us-ascii?Q?p4S7APWu4TdONA6ecKhnDgzYMXZZLRbBnl/JmvdtEjQYfs/8Wz8Dr/eFY4nh?=
 =?us-ascii?Q?ZiFnESHkslUHdJeo/jet/DdH1bdd3OgsKQ+RrAKkfqlA1yUrnmRfKUSGm0Oc?=
 =?us-ascii?Q?wRBm8Pu/mnzBqw1DW/2tB8jdV3oiFWqG/sN4bRqsMoHvRBQCPH7XdhYHrQkn?=
 =?us-ascii?Q?YJO8Jo3CqAUEgiM/YDytwuK3rKsICa56aK92e15qtXQpg5BvNHdGFhidE2rH?=
 =?us-ascii?Q?TTuaKolx+qfpL8W6nYfnv0Uyda1l80k5F4ziZIQQaMurizRDic8JVuvqQJZ5?=
 =?us-ascii?Q?IwkAVUdrZvQEXjJem4BlPBLgCSgxcUJt7zFA8fdzXUYJM/QfFZPqNYy/c7Dq?=
 =?us-ascii?Q?WC7TAxDh2fxgdpqb8ofq8BwcFgdxWj0FXsjIBsUB2zMyT78tw9nb1XUyRXis?=
 =?us-ascii?Q?jznv86jfBx7KMFO0lD/M/R0gaxKaS9awZK88ly8cDWNzZCwPLy9oYUJir+1L?=
 =?us-ascii?Q?Ke1sgCLF00zqSJWftkMNbCZff5JWiAJby1Lytksl41JzuSa8OzSg75rY48i6?=
 =?us-ascii?Q?OhxCnUPrRODF9MQ1grIi8FMXZWbnxYhSRUHtJJ8msUMMFHfDOj3StmZSeU8C?=
 =?us-ascii?Q?BL23fImrCNZvSI37NtCGYSqwJwEKPb4Q+PczLDX5uWvbcRACr/EU6X1GCFGa?=
 =?us-ascii?Q?gKqnZTJCdKxSUqQmD0L2oj57oq1pIZYg5F/dvJpIgt7zD7xc158dt/M4/d5x?=
 =?us-ascii?Q?8fIX1ijY1jMaYQAFJXHmQDzBhw2Z5ENlrBpHLaD3QtwEBgXJ5FwUzaq1F6ve?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27918020-5f33-4ab5-a653-08dca81e7796
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 18:13:18.9907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEb3nuaYmKabx0A1jCE2iEKLC6kcNOjhg1/FT7U0+tmO3sh9WRWFHIn7nINxtUSXvA745mojRd5SQRFnZHwigA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7117
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

On Fri, Jul 19, 2024 at 05:58:27PM +0000, Stuart Summers wrote:
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

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 54 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_gt_types.h     |  9 +++--
>  2 files changed, 49 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index b2a7fa55bd18..6bfc60c0274a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -287,7 +287,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
>  			PFD_VIRTUAL_ADDR_LO_SHIFT;
>  
>  		pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
> -			PF_QUEUE_NUM_DW;
> +			pf_queue->pf_queue_num_dw;
>  		ret = true;
>  	}
>  	spin_unlock_irq(&pf_queue->lock);
> @@ -299,7 +299,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
>  {
>  	lockdep_assert_held(&pf_queue->lock);
>  
> -	return CIRC_SPACE(pf_queue->head, pf_queue->tail, PF_QUEUE_NUM_DW) <=
> +	return CIRC_SPACE(pf_queue->head, pf_queue->tail,
> +			  pf_queue->pf_queue_num_dw) <=
>  		PF_MSG_LEN_DW;
>  }
>  
> @@ -312,22 +313,23 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
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
> @@ -386,26 +388,54 @@ static void pagefault_fini(void *arg)
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
> +		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
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
> index ef68c4a92972..f2a0bd19260b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -238,9 +238,14 @@ struct xe_gt {
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
