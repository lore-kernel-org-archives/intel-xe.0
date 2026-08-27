Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3CDC61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 17:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A927B10E41E;
	Thu, 27 Aug 2026 17:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IR0nec7e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFD810E41E
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787850764; x=1819386764;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KbR+PI5QZpPQV7nQ7IIxYS3hBZF5ap154PamaAvetKU=;
 b=IR0nec7eUUr8oKZU3cVrPNg92D5RocfxdCw9Q+ByV54PXk1C55JseTBR
 Wlja52s9IvmHDzvHxdW4TKFFg/fKyp2ACTwduD3yJWHLRcLKjeQxGytyH
 /pIFOL7aSlo+wYV6lgscPHwH6vyfoQn5/PpvX74tSB8LJX4K8A9cL2bY2
 fz1HRgUlgM1E/uqWNX7BH/DWqQ13+IAghTQT7OD8VkbrZReK+kmsfh5tj
 YwuQlFMjOE/Xq6QAkPu7PT6JcI/7QKK3R8KkavB/nEYelXdO23s9C0+Bw
 auuW/b0nis7ss2fGVPQ3oKkBObiedcs6MZw6g5WCbu+MJ92RSy4+ke3da A==;
X-CSE-ConnectionGUID: 27UkrICqQ4+5wxWc8xVwEg==
X-CSE-MsgGUID: rWNvbRGISmCcSV6Revetlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="90872654"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="90872654"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 10:12:44 -0700
X-CSE-ConnectionGUID: JvdwId/YQdGP4UQQHUdwIA==
X-CSE-MsgGUID: FDuU2wlLR/SJQBrWtlQMbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="306137660"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 10:12:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 10:12:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 10:12:43 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 10:12:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiufoRerPS3jncXaVpl3Lv/YuzG9evN5/hlCTqoIe/PE4SgjsS7iaX5QF9gF1VpdmIVoHMBteEApmd3bIihNJphhdKONI2AbyEYv7wMGFEmV/yVNhQxMv6Qtp3NB6Sb1+yr4Y4nllvEvnqRe9SPAHtwgjcUOr4XnZBUmcZtA9cPh6NNmifCOLHAk9tHpNAv+sImr1KTcxlOuVf4moUPnbxVIFYMLxAIEdZ/3ytAsnmtahNhytmyFELFsjqim/7ejaLK4+a0F9KHAUBDX7T9QSY0VDmYNsjbT8bA31cfND7zvWgU9R/Q0sITEhLBhPP3h0MtANHcBIjIrGVKzR/RO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tbRix0nBE9VpabXCDibFyXW1Vus6ThPpCfhnrlPhVA=;
 b=oUOSflPt/4FW9GlEwyk5hVMyAxAvXgNFlRtm84HLIvIwwx1MgD8X5HifAic9RFysDiNK8moKh0uFmUqQoIZ7nXZzreTVrzdC9gRq05OTwWTFCu4t4RLs9Q70yy18LA7f2bNpFI07zcGbn81miBzjbD5a8zn1YtO8sSzuU72D09X4lBZio+AWySIi/IGc9LiBc9unzbfOQZDBtPCi8pPzRcAENVXLbUw2Z76LDfD93+VRCvbf8I5qsvAfAyG5ncKVsk/1djV/IbF+FxdOYzk75xuxiNzfMnY+QWwCFdCVTWL8jU0slELjOevzFOrVeh5QyBijzccLkfVbLfA3gf6Stw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Thu, 27 Aug
 2026 17:12:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 17:12:36 +0000
Date: Thu, 27 Aug 2026 10:12:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <niranjana.vishwanathapura@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/ggtt: fault on unmapped GGTT for multi-queue
 platforms
Message-ID: <apBwAvjxQ076+Rir@gsse-cloud1.jf.intel.com>
References: <20260827082011.3370672-1-tilak.tirumalesh.tangudu@intel.com>
 <20260827082011.3370672-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260827082011.3370672-2-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5acf87-9cc7-4fca-1757-08df045e6433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|10067099003|18002099003|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: wxAPJvctY8zJYrWL8+9bB/5w98Ay9gAHrwcHQgAZovHRbF1O8WzZqt9YVAL2K1Uye8rbDSerV5ds7NvnsoeAcWA/Iiz3JkRmlew0ex5MdwLWr64Xc9VrpF3bLIsBZqkogDjE5xXTosulZQfdIH/9DE0VygX2+USpoeshIu6j5pzrEGhTlAqLIDIdoA96apADF5yAL367bnPCNNn1nOImv6UXrpGgBR/DsBDKVWPxk1g7EWRM3MLpV30b2H4urtB39aNOrehpztX9AO1nXPQp76KTG1unVnEtTbfE4zX/svgcY08gYjk3pvMW/A/URzCgygycDeU9EysFNFUEoVzq92RzP8SHn9CctQDHAGXelG9PLNOCalFE/bjq6Ib3ZDg4FWAeF0K00CIyEmu5ljlKR3NEZK8FZlLsM7zgOTCabzXJv+jPv5OdMVsmjq5CAqLz3b14I3yWFfnIEoVrw0ihy3YMbQ+Wtd81xhNaqApfQAL/vvqDJyxqvpQNvvXoSnTMRCHeaPGXX6XS9BA++cGrv15HiKkKmRxThxN748r1nj5Jy5owRgP9gg9LabVnavKK4kJ/neuxElU/3V/qMzv0oG8xP0reqETIozM12/0/F4wXGlZBOcLpDNaH9SSKQBLtgZFOp5swZfhcFeCCIReWy8nJpy5bB5UkRsdv7vP3N6Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(10067099003)(18002099003)(11063799006)(4143699003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4VVM+sTFU5ytheBSmPZASre4ywA8A+DRn9cu9Ah/LX/u2+0YAMtrSU8pL582?=
 =?us-ascii?Q?/pZ2gQ0DZGUPyQmEYzAcl2BJIA3w8pUafhjTXFkZC4qg2TSj6RMofLju1U4T?=
 =?us-ascii?Q?HFOPzClO9ccMxAQb4gOO1gv0+N1ATHrY5xZ8OzQ4WeybjGKaJvPohE/iL4j4?=
 =?us-ascii?Q?DnAiEn1Ct7E60VJn0kkm9Nuw5Du5cImduupxgadi8eFlqjzbKo+offv2hIXr?=
 =?us-ascii?Q?nKhqik2ws0nE035z89nZgAYYCr9JY/beGeX9Y4POIkrkfyvwtnbKK5/tNqRj?=
 =?us-ascii?Q?vbyAxOFDihMmezMyejmkW9HG9RI1gFa7L6Ax0cjxsW33SBqcU/vA1pjBaS2A?=
 =?us-ascii?Q?2tvlRItWbdfeMDHH97Mp+5ejWs80VjBwH3nclL0bEhLdMiyyVEBbJ89pKlaV?=
 =?us-ascii?Q?W3pOAHvJPc2icAkaCrbHEGJ8UfsfkKhA7/xEHRiu0lr0/IpeTvQG9jAne9hq?=
 =?us-ascii?Q?uRiP+jiyd0XUonnlGZ5ih4LfKatEDdEAVzfczM/dsLYkhUk6UNlSxl+lMgeL?=
 =?us-ascii?Q?+o83brnqtOhf9If5PeDcz4NZsDwnxBxzXa3KLWlYdhXt7/n1clUPv6l0lq6X?=
 =?us-ascii?Q?q8Y3dZ/GGaiIL21Kv/09IbAPDHNxbb5SmnzQ2ysP2YiXxXNsoS6azuZAMt8O?=
 =?us-ascii?Q?3pl4DzWpCcok0adhr8IBWDSlWqCYSaJTeDnYQDtookELj0r8JbDmTCzcMKIv?=
 =?us-ascii?Q?/w7uUbibjqw9A9JNp/nxaOhBY10KrxRTMDE0kzE5Nhn5PvIBWFklM52E7lX0?=
 =?us-ascii?Q?cMrEw4XZnOU8FUu2wjqxa3wJ2CAfWNws/JlhtN+wFgvWDi87spIcB3uLZMmK?=
 =?us-ascii?Q?8Dxu4u10izSZ3RTWpBU3enqrVijD0YDhLqYXy8HRZkFoNOoWZjkB4sOAmVT8?=
 =?us-ascii?Q?Qj1ghFKRAhCjdJjukTtv5ps/MnsVeR0yjpp3WUtWFEpLYJu4WHK0K8UYX42O?=
 =?us-ascii?Q?d10yDiDWtR5uwBnKyI0Ka8WAFtHCZrNLaxjAsoaVd2/QZQeqGxyd5g/HCq9P?=
 =?us-ascii?Q?SqUlCiW3jHma81aQkfyMkOCVkIhgPpi2n0rmUSHlisduZwEak8zfGzWxJ2Qx?=
 =?us-ascii?Q?htW9nUZVnG5sqKWEA81fmnIsJx/U0VydNtqFDc8PWNNDNX6sOC4H8BirBgrJ?=
 =?us-ascii?Q?idw5gisDf3a36G6YO0kq8VAU1j3cirYFDVfg8d6AW4+zNzJWCk5NJp3uZDvh?=
 =?us-ascii?Q?Z1oWM+lyE4L+0Zv9Jf85CPOo89Cnt5RgxymJgzg2dVC3VCRSuvdmTEbVZFUr?=
 =?us-ascii?Q?5XyEbm5LTBq5fEfF1f2sj1KUprAcV3v6Zlb91Oc/81wn13qghwhoypP25v4I?=
 =?us-ascii?Q?3H7y/J8VOTVizqYkgJWijyt0skweg2KGPwOMYt6U5cAm1CXJLQGNzlVursYR?=
 =?us-ascii?Q?hggvhZ1CwENeE1IuDAPFE0GUxTvlL9c6dsjXjiok/zPZeo3GYNnVSvpYKASR?=
 =?us-ascii?Q?cXN2v/pyErQSrNl7yNuFdsQIHz/BxNF3M5KMVu2OCDdiUZMHBY4TvBsEi34I?=
 =?us-ascii?Q?X8izdCBT4FeuonDij7lUUjWkgQiMApSHEnF9eFASXGjeHqcPi7HU9llv+FVk?=
 =?us-ascii?Q?Do37Yp22F74MI96nOWGx53LeniRBWXB7ltHupCPxBl6HOk2de8idn6PPNKHR?=
 =?us-ascii?Q?HuBmayd2nc8R2GXgu/7X3zdZJGz3K79jZEy+0Zo530xS7KVCID1mWdyqbSD/?=
 =?us-ascii?Q?4wXlwpqQnSbMZR0StdJGPcVPruvDtgLMxXuZbGH3j6fDVxYPE/5cdnfR7LCh?=
 =?us-ascii?Q?w2QyUQztkV1P8irI6EdVH5VQEgjGFsY=3D?=
X-Exchange-RoutingPolicyChecked: j5K5ZySkQ/hWyzsFQe6KcaIVtM+C535uzWR4kBE2yaZRP9u27qwSc1YYPsVzIqN0pqb/8jH+TBDsw++iSYsZbfyx+7XnMUasevUu5K4B79KuGlmZ/4ye3544A4p7swedDBGbKoYarLmn4bAbFRdyZFHvMyT4K0CjdEkVz/zBG2fLzkZfty6FItHwQ2/1hD/d66roIqtgE57NszVOw5O8qEk4yYxC30sp5/zYNmKlWca5BvaidHAklgUqB/qDslRTceFNyHF31VuGCKjaZboFdHGF1qDDawh8AhLIJWbmNop81TekHywTzT46AFZMG+Tr+YsIEb3MJH8xzMqLOHCHZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5acf87-9cc7-4fca-1757-08df045e6433
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 17:12:36.6710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auRCejM/AUZod/R6tIN8V7abQPJybih0em7tvsXxTEzdjNoDtcU+3ZudmygEjD5DpSN/Q4IGe2IB9O1sf4CBZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
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

On Thu, Aug 27, 2026 at 01:50:09PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> 
> Engines cache GGTT translations in their TLBs.
> A full context restore on engine switch flushes these, so a stale
> translation for an unmapped and recycled range does not survive.
> 
> During a secondary queue append, GuC does a lite-restore and skips the
> full context restore, so engine TLB invalidations are missed. This was
> observed while running multi-queue tests on another OS.
> 
> If unmapped GGTT points to scratch, such a stale access silently reads
> scratch instead of faulting, masking the error. On multi-queue
> platforms skip allocating the scratch page so unmapped GGTT holds
> PTE=0 and faults consistently for the whole boot; other platforms keep
> scratch and are unaffected.
> 
> v2:
> - Add xe_gt_has_multi_queue() helper and address nits (Niranjana)
> v3:
> - Drop scratch entirely instead of toggling per-unmap (Matt Brost)
> v5:
> - Document the rationale (Matt Roper / Matt Brost)
> 
> Assisted-by: Claude:claude-opus-4-8
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 40 ++++++++++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_gt.h   | 13 ++++++++++++
>  2 files changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ec23862477f..9b58f47986f6 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -20,6 +20,7 @@
>  #include "regs/xe_regs.h"
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> +#include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
>  #include "xe_map.h"
> @@ -533,27 +534,36 @@ void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
>  int xe_ggtt_init(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
> -	unsigned int flags;
>  	int err;
>  
>  	/*
> -	 * So we don't need to worry about 64K GGTT layout when dealing with
> -	 * scratch entries, rather keep the scratch page in system memory on
> -	 * platforms where 64K pages are needed for VRAM.
> +	 * Multi-queue misses engine GGTT TLB invalidations (GuC lite-restore
> +	 * skips the full context restore), so skip scratch: a stale translation
> +	 * to a freed range then faults instead of silently reading scratch.
>  	 */
> -	flags = 0;
> -	if (ggtt->flags & XE_GGTT_FLAGS_64K)
> -		flags |= XE_BO_FLAG_SYSTEM;
> -	else
> -		flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
> +	if (!xe_gt_has_multi_queue(ggtt->tile->primary_gt)) {
> +		unsigned int flags = 0;
> +
> +		/*
> +		 * So we don't need to worry about 64K GGTT layout when dealing
> +		 * with scratch entries, rather keep the scratch page in system
> +		 * memory on platforms where 64K pages are needed for VRAM.
> +		 */
> +		if (ggtt->flags & XE_GGTT_FLAGS_64K)
> +			flags |= XE_BO_FLAG_SYSTEM;
> +		else
> +			flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
>  
> -	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
> -	if (IS_ERR(ggtt->scratch)) {
> -		err = PTR_ERR(ggtt->scratch);
> -		goto err;
> -	}
> +		ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile,
> +							     XE_PAGE_SIZE, flags);
> +		if (IS_ERR(ggtt->scratch)) {
> +			err = PTR_ERR(ggtt->scratch);
> +			goto err;
> +		}
>  
> -	xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0, xe_bo_size(ggtt->scratch));
> +		xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0,
> +			      xe_bo_size(ggtt->scratch));
> +	}
>  
>  	xe_ggtt_initial_clear(ggtt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 65a4655b0994..92d934d50244 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -160,4 +160,17 @@ static inline bool xe_gt_supports_multi_queue(const struct xe_gt *gt,
>  	return gt->info.multi_queue_engine_class_mask & BIT(class);
>  }
>  
> +/**
> + * xe_gt_has_multi_queue() - Check if gt supports multi-queue on
> + * any engine class.
> + *
> + * @gt: the GT object (may be NULL)
> + *
> + * Return: true if any engine class on @gt supports multi queue, else false
> + */
> +static inline bool xe_gt_has_multi_queue(const struct xe_gt *gt)
> +{
> +	return gt && gt->info.multi_queue_engine_class_mask;
> +}
> +
>  #endif
> -- 
> 2.46.0
> 
