Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0437CD13DA
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 19:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705F710F432;
	Thu, 30 Apr 2026 19:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWOKq49H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF40210F430
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 19:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777577810; x=1809113810;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EP+H2xRdvTgkFj/5SMh3bNZRUwUgzNhTiW/uy20yGAI=;
 b=KWOKq49HAZxaIcL0I+/rnPequ//5ljWKUpvMIj73YYGRnh5I+/S70AI3
 JZmw+s9LE43Md1X/hoKZ9o7BaLpRXyjUaOrfhRnQFQ8h001PGEY4Gxbzx
 UjVX3JCXc3OiE/lzB53omcmJxa9f9/LBchINEcrPI1i2gEoU2CpO7NFqX
 MrL8rqxw+57RpCVlSnlqme2SafLl1iaCfwJnkgl+N06dy9LvtFws9IAYL
 2vWihG3rPy5E0d9q7UiCW/656L6SP+3/rY8DYzQfi1IX8DjE8srV3zYth
 N+ykUgafF1DWYFssQ8Mk5m+NC10/BtyouX4pstRwBjDFsVTnuEPrXeU04 g==;
X-CSE-ConnectionGUID: 9y1NrKJVTned/MlaCZltBg==
X-CSE-MsgGUID: Jt5I17PlQQim9DskxRg1qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="81121096"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="81121096"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 12:36:49 -0700
X-CSE-ConnectionGUID: 2rtjC1e4Rq2d7CLMjTQ20A==
X-CSE-MsgGUID: gWyg1TfRQUGgio85nSgZcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="234732401"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 12:36:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 12:36:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 12:36:48 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 12:36:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZB/o11fS+I+O/sSA9fZ71zsniHADvhIsPBRNxgD45RpqKyMIH2VLqD+5VdsjuAHsxLYQ190itAuLg7qZtcgAsCe7eE5TE3CReYCKxSJuwIYibBJ0F8F4xaR0ASdHVIVN5/omXrM9Ul2uquLVzq7lKDKV+x0WEY1myu1G+nIuYK7UF8TriReXjxdeOE/fNTMlVbxWVc//SVa1sS344CZBnRyYUqGlhMC+ojQ2K/EoGX2Scuis/M6gpAQ3AtmEFYpZLoWp8EOzk6i9OZ3XE/FRa1AkByQcc4iZ4X1ii2ht2Wy/lUpdsvWpw+Tjrao/ej4BzTrZOOxPgPvCifd68cbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72GBtDs6GFvQIBYpOJ+fI4g0HrgnvEnDkt5+ZT3PdiI=;
 b=FFoMXWcrxp+b3hq/FZ4QOUsnTU5GYs0MoITgU9bzWB3eIYetU7LK2colQsW/0m58/0Z5IVi+80UV7CZQJpLw87wbj2Va/R+cBSxnAz5ERlEAPgkxEQ3TCI6JmnRjrvK+4uViaWdzN5oqyQK+00knqbNgBkaO8d+7+S5aEq1nsvpGEoa9PCGTXJsCgoXhZaoxMyrEZFaZTGHxb6ybc8LTFgUYR3bomEnbri1udEA9mTgt3/xqhj2kS/w7NmpX2oITOW+v/Qz9BLb3tQc9vE+zQYpoX3F/hWcROyQV84faJN0sMtptnNGS3IdnLcjMe+eJaG/WZQjpG0rvdoy1ZZnLtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB8249.namprd11.prod.outlook.com (2603:10b6:510:1a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 19:36:44 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 19:36:44 +0000
Date: Thu, 30 Apr 2026 12:36:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2] drm/xe/madvise: Track purgeability with BO-local
 counters
Message-ID: <afOvSTNaIZk7WKoy@gsse-cloud1.jf.intel.com>
References: <20260430101130.1365878-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260430101130.1365878-1-arvind.yadav@intel.com>
X-ClientProxiedBy: SJ0PR13CA0182.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::7) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: a74d6442-662c-4a3b-4d21-08dea6efcf87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 08wg6Eh1F9RfvU4mj9nlIEXVVY+TNZ9stAIGfZeVzUDkBXEx2BzRrQTjPgz/LBt72JtX3myZ3qi9599Ro+lEtMnUekPRwWNaLUB/NcuYtoJgfqPLCH7DNeUaonnrt+2XD8mT0N7cS4h8ePEnsIlM3MA2jSvf43DqzSKFZwT6wSBDldnhBKZLIWIJDIPnBNsc5sYbohxp1vjYVbPCRghDtqgc8A3fsNlkOIqM5uDflGS0VwMn1E2SMX/mXr7UYd8BYj6hk0bcQDmxJHzfuCRrHBAivYtGapgRV8/OoabQWx/aXnh2ag9hXHjXQ7w1wfri1hTkB8Q7cgj6kc4r8S72uBWFF+kqmMMutURVm88TNbLnIwcSl+bYCBXJDZHyZlfUr2mBvSzsWj/zuWpDZ/VSKBsbZzRXxP2UkiRdjUQO4+4IMcf00Gq0auUUdCgyZKmtfXHV3WrvLgkQggtIU9ZM5Y87uLiCSd4cbxudedMhh5l/6pWRlDqpGQ8vJWTEmIpNDxziFfjvMcxgL8CbfDOB47f++yuhZ01WhiW11Zz36aC3xWqMxjqGoHvUgFA0F3yySMf+Mnp5eQNDctiANKINV4q9yQ5qs6devjVitGwOqbLvI4JBWw85SNX6o/6ofs65TpXPuGN/Qsq/cjEPJGVUi9FW/Gs/0llFac2CWztYeocsPIjd1KEhaPtSnz50LN1f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D97vp/0UvKicWeNvM2lM9NCxApX9ZJbZiudhQbQxCtBbEHZ7RTUALi42s2?=
 =?iso-8859-1?Q?zsRbXBxKydNknSUQeXPKYAXWdR67o8rGGIcB3tRnVHksyFmcKCk+Sx6hzR?=
 =?iso-8859-1?Q?KNQAiTgB8xy55MA3BhihVrCkIXtgbcT5xbKekluyt25w+3dSTFLlDwWbV6?=
 =?iso-8859-1?Q?KNQh78u8l1EeCdCo7yZIGwImLMIsV2Ad5a7lhdRGybxmipB/zWhGFY1NZD?=
 =?iso-8859-1?Q?oRxaTZhJ6rd7bVV+lVrf9VWCzLiAdS9acVHluPy5gn7eqi3uVf7HR12sTS?=
 =?iso-8859-1?Q?ApTnqeWxtUT+STWvaNpLRKHUMgjgfJd2b+ggIXVWinh83Jahhx+z1yqs2d?=
 =?iso-8859-1?Q?dXqiOoTTT6qKO0z6BrwUBeXBwMyWawbTUuB9CjqBNYxJtScwk1jfLgI8r7?=
 =?iso-8859-1?Q?XMxnFyCEikliYMXZLa6uARYM54/iMMaPIhqIUzoj+1wVseSI08fnKJTjSI?=
 =?iso-8859-1?Q?2Z/vMoUTLQ92iFTj4vw9VtaKPBsQJmDpOJKaKpUM1QhFrdFv7LyL/mNWKv?=
 =?iso-8859-1?Q?5OuZPdTojKGjUVTNfyyY8SbVy730bT92ZId68uBMxu+uB/GWj4W6NFxzOl?=
 =?iso-8859-1?Q?/mEFHHFkWyL690jKgEdUIOe/c4/e76lsKlhEiM6o4AyYHmAXK3HoI5xK1T?=
 =?iso-8859-1?Q?QgBkf9tqWw2pDNKXsjVrxD0+/lk6V/4daNgPK2tTwT2OrOk4l2P9oR+5Gt?=
 =?iso-8859-1?Q?9cOCGwhSfFQZ/ZEmqQOs6/hRNMMPHWyZcUcb8AgBXuNf79I6w3FhE5ONzG?=
 =?iso-8859-1?Q?zPX+Mow6MEmcDy+6UyZ3FS1Gep/i2Hp+3W5hwU2Cwtx8XRDwoxen8iJg8y?=
 =?iso-8859-1?Q?BAmOi2TImUCNIZNeBO/jS7cI/5QWe4RSXg7BNy82sQSaiwNvm/YkDGTafW?=
 =?iso-8859-1?Q?NAYZ2sgg6XPIPhUCiqjlNrDVnbUQbiPXZPuktjg3u/gQLVAODX4W3Z9XDy?=
 =?iso-8859-1?Q?ahRbmZ+KW9EYE+iBnRFb4nx2tGZte5wL2TPOemsIEM1AOngOuSFEGEQIX9?=
 =?iso-8859-1?Q?kLm8xuZKX56uhq1VEcjJKIgpgGoLgAyU5HomdDJc57UcuwU2+bnx8vRhxt?=
 =?iso-8859-1?Q?HhHo1Oa03CqhRrd38QiIVKSZKUDu15lYBopNt5AsX31Zj+6/iSTc6FK5IF?=
 =?iso-8859-1?Q?7ryD0RX9vz584nGyH9GxoSSwoe8YNiQNIjpOE7y4zPoXCQ4oknls+c3S0B?=
 =?iso-8859-1?Q?JPZUHektJT7vsQeBNtjGNS+WXtMwpdk4vj58nrUh+weUSptClZWhQQxiFa?=
 =?iso-8859-1?Q?6PB4Mq2uYOmifx05e52ZQ2Z+AqCvvP8GWe7f5OLZK83iB/8y9mG+gs5a/t?=
 =?iso-8859-1?Q?2J6mJzL6F6cTHHE80SKh0LPStuDkIqEbuXlfy1uMYELDDeb78veRU/kYnK?=
 =?iso-8859-1?Q?I3plU+KWgfxioxWUUwgJLC6AhgQJQzw0eK92H6kQ2SXehY5aGlCpeQHEbM?=
 =?iso-8859-1?Q?RXR72vJ2qVpVxRUipJsbG/mS3Dd/vG9B0GxNxHPwFBkBztMLIgcneF4MEZ?=
 =?iso-8859-1?Q?lTFY6Z7MNPnRvOefcV8FeQh6JlUbm0E3C07VllmaMpqmP7ND3t4OeqX06Y?=
 =?iso-8859-1?Q?lU+GRexGQJBoL/+6BDZKifXFGlIwUbTN56bZvLTd6rAaL6raLl83kQH1DQ?=
 =?iso-8859-1?Q?ERJ/GaopScze/l922v/auGL1A7h7X9qB+4yNFFXaGICFEkoNgE6oOGyFy/?=
 =?iso-8859-1?Q?/hSbp3qQAufodwIXhemNht0WK8CI2pFLTsvC9ElqYOvqb4dicePOisvgMT?=
 =?iso-8859-1?Q?1lwXj694W77My7FCr/WZqJfnBYtab8xTNUBBlMV9YtH1PMSiolzznASLEv?=
 =?iso-8859-1?Q?hscB+QeRMjBrHs315YO/HJNZG/0+AxQ=3D?=
X-Exchange-RoutingPolicyChecked: ES5fLcWA0pTW+wFrugXEnJ22ngMin2nvJSy5HhLJ7BjOHT33pmJcEwGre+hTUQ9Sysl+d+Gojns3Y+nZDeDu897eNDCREEqPA/um6g1qfOHaVpeA3U1Dg8sMMQO1pWHO35lsApPxdl6eXFvETSbe6YHthD10/mPEI/D3gfIith7JH5lx/RWkjmnAK6/Ev1izjfUt8HKLdVNELU3d958k4bR8dNDeGjLcyIn4zJpfl+7vA4Jp+R8dvrRB9PM5tO1Plyjm9pWNGwSlt2SmyGYM5JKbaMptQIO3HUm/Hty6VatErmS0+Fh7ib0i3CSJrHObG9hgTqE0SGZy4zXjgXv3xw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a74d6442-662c-4a3b-4d21-08dea6efcf87
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 19:36:44.4675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLjj7q0jWHExgiZWOGCUNmIihCtLtwmKp09LP/qNRCXvQKk2qBIdZ8WEh+PGSgRVLnjR9iiqaVIg8edD/LdJAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8249
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

On Thu, Apr 30, 2026 at 03:41:30PM +0530, Arvind Yadav wrote:
> xe_bo_recompute_purgeable_state() walks all VMAs of a BO to determine
> whether the BO can be made purgeable. This makes VMA create/destroy and
> madvise updates O(n) in the number of mappings.
> 
> Replace the walk with BO-local counters protected by the BO dma-resv
> lock:
> 
>   - vma_count tracks the number of VMAs mapping the BO.
>   - willneed_count tracks active WILLNEED holders, including WILLNEED
>     VMAs and active dma-buf exports for non-imported BOs.
> 
> A DONTNEED BO is promoted back to WILLNEED on a 0->1 transition of
> willneed_count. A BO is demoted to DONTNEED on a 1->0 transition only
> when it still has VMAs, preserving the previous behaviour where a BO
> with no mappings keeps its current madvise state.
> 
> PURGED remains terminal, preserving the existing "once purged, always
> purged" rule.
> 
> v2:
>   - Use early return for imported BOs in all four helpers to avoid
>     nesting (Matt B).
>   - Group purgeability state into a purgeable sub-struct on struct
>     xe_bo (Matt B).
>   - Reword xe_bo_willneed_put_locked() kernel-doc to explain that a 1->0
>     transition means all remaining active VMAs are DONTNEED (Matt B).
> 
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c         |   6 +-
>  drivers/gpu/drm/xe/xe_bo.h         |  88 +++++++++++++++-
>  drivers/gpu/drm/xe/xe_bo_types.h   |  27 ++++-
>  drivers/gpu/drm/xe/xe_dma_buf.c    |  28 ++++-
>  drivers/gpu/drm/xe/xe_vm.c         |   9 +-
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 162 ++---------------------------
>  drivers/gpu/drm/xe/xe_vm_madvise.h |   2 -
>  7 files changed, 155 insertions(+), 167 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5ce60d161e09..eaa3a4ee9111 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -884,10 +884,10 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
>  		  new_state == XE_MADV_PURGEABLE_PURGED);
>  
>  	/* Once purged, always purged - cannot transition out */
> -	xe_assert(xe, !(bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED &&
> +	xe_assert(xe, !(bo->purgeable.state == XE_MADV_PURGEABLE_PURGED &&
>  			new_state != XE_MADV_PURGEABLE_PURGED));
>  
> -	bo->madv_purgeable = new_state;
> +	bo->purgeable.state = new_state;
>  	xe_bo_set_purgeable_shrinker(bo, new_state);
>  }
>  
> @@ -2355,7 +2355,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>  	INIT_LIST_HEAD(&bo->vram_userfault_link);
>  
>  	/* Initialize purge advisory state */
> -	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
> +	bo->purgeable.state = XE_MADV_PURGEABLE_WILLNEED;
>  
>  	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 68dea7d25a6b..6340317f7d2e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -251,7 +251,7 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>  static inline bool xe_bo_is_purged(struct xe_bo *bo)
>  {
>  	xe_bo_assert_held(bo);
> -	return bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED;
> +	return bo->purgeable.state == XE_MADV_PURGEABLE_PURGED;
>  }
>  
>  /**
> @@ -268,11 +268,95 @@ static inline bool xe_bo_is_purged(struct xe_bo *bo)
>  static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
>  {
>  	xe_bo_assert_held(bo);
> -	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
> +	return bo->purgeable.state == XE_MADV_PURGEABLE_DONTNEED;
>  }
>  
>  void xe_bo_set_purgeable_state(struct xe_bo *bo, enum xe_madv_purgeable_state new_state);
>  
> +/**
> + * xe_bo_willneed_get_locked() - Acquire a WILLNEED holder on a BO
> + * @bo: Buffer object
> + *
> + * Increments willneed_count and, on a 0->1 transition, promotes the BO
> + * from DONTNEED to WILLNEED. PURGED is terminal and is never modified.
> + *
> + * Caller must hold the BO's dma-resv lock.
> + */
> +static inline void xe_bo_willneed_get_locked(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +
> +	/* Imported BOs are owned externally; do not track purgeability. */
> +	if (drm_gem_is_imported(&bo->ttm.base))
> +		return;
> +
> +	if (bo->purgeable.willneed_count++ == 0 && xe_bo_madv_is_dontneed(bo))
> +		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
> +}
> +
> +/**
> + * xe_bo_willneed_put_locked() - Release a WILLNEED holder on a BO
> + * @bo: Buffer object
> + *
> + * Decrements willneed_count and, on a 1->0 transition, marks the BO
> + * DONTNEED only if it still has VMAs (implying all active VMAs are
> + * DONTNEED). If the last VMA is being removed, preserve the current BO
> + * state to match the previous VMA-walk semantics.
> + *
> + * PURGED is terminal and the BO state is never modified.
> + *
> + * Caller must hold the BO's dma-resv lock.
> + */
> +static inline void xe_bo_willneed_put_locked(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +
> +	if (drm_gem_is_imported(&bo->ttm.base))
> +		return;
> +
> +	xe_assert(xe_bo_device(bo), bo->purgeable.willneed_count > 0);
> +	if (--bo->purgeable.willneed_count == 0 && bo->purgeable.vma_count > 0 &&
> +	    !xe_bo_is_purged(bo))
> +		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> +}
> +
> +/**
> + * xe_bo_vma_count_inc_locked() - Account a new VMA on a BO
> + * @bo: Buffer object
> + *
> + * Increments vma_count.
> + *
> + * Caller must hold the BO's dma-resv lock.
> + */
> +static inline void xe_bo_vma_count_inc_locked(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +
> +	if (drm_gem_is_imported(&bo->ttm.base))
> +		return;
> +
> +	bo->purgeable.vma_count++;
> +}
> +
> +/**
> + * xe_bo_vma_count_dec_locked() - Account a VMA removal on a BO
> + * @bo: Buffer object
> + *
> + * Decrements vma_count.
> + *
> + * Caller must hold the BO's dma-resv lock.
> + */
> +static inline void xe_bo_vma_count_dec_locked(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +
> +	if (drm_gem_is_imported(&bo->ttm.base))
> +		return;
> +
> +	xe_assert(xe_bo_device(bo), bo->purgeable.vma_count > 0);
> +	bo->purgeable.vma_count--;
> +}
> +
>  static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  {
>  	if (likely(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 9c199badd9b2..6756d7820aca 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -111,10 +111,31 @@ struct xe_bo {
>  	u64 min_align;
>  
>  	/**
> -	 * @madv_purgeable: user space advise on BO purgeability, protected
> -	 * by BO's dma-resv lock.
> +	 * @purgeable: Purgeability state and accounting.
> +	 *
> +	 * All fields are protected by the BO's dma-resv lock.
>  	 */
> -	u32 madv_purgeable;
> +	struct {
> +		/**
> +		 * @purgeable.state: BO purgeability state (WILLNEED/DONTNEED/PURGED).
> +		 */
> +		u32 state;
> +
> +		/**
> +		 * @purgeable.vma_count: Number of VMAs currently mapping this BO.
> +		 */
> +		u32 vma_count;
> +
> +		/**
> +		 * @purgeable.willneed_count: Number of active WILLNEED holders.
> +		 *
> +		 * Counts WILLNEED VMAs plus active dma-buf exports for
> +		 * non-imported BOs. The BO flips to DONTNEED on a 1->0
> +		 * transition only when VMAs still exist; if the last VMA is
> +		 * removed, the previous BO state is preserved.
> +		 */
> +		u32 willneed_count;
> +	} purgeable;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index b9828da15897..855d32ba314d 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -193,6 +193,18 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  	return 0;
>  }
>  
> +static void xe_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct drm_gem_object *obj = dmabuf->priv;
> +	struct xe_bo *bo = gem_to_xe_bo(obj);
> +
> +	xe_bo_lock(bo, false);
> +	xe_bo_willneed_put_locked(bo);
> +	xe_bo_unlock(bo);
> +
> +	drm_gem_dmabuf_release(dmabuf);
> +}
> +
>  static const struct dma_buf_ops xe_dmabuf_ops = {
>  	.attach = xe_dma_buf_attach,
>  	.detach = xe_dma_buf_detach,
> @@ -200,7 +212,7 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
>  	.unpin = xe_dma_buf_unpin,
>  	.map_dma_buf = xe_dma_buf_map,
>  	.unmap_dma_buf = xe_dma_buf_unmap,
> -	.release = drm_gem_dmabuf_release,
> +	.release = xe_dma_buf_release,
>  	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
>  	.mmap = drm_gem_dmabuf_mmap,
>  	.vmap = drm_gem_dmabuf_vmap,
> @@ -241,18 +253,26 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
>  		ret = -EINVAL;
>  		goto out_unlock;
>  	}
> +
> +	xe_bo_willneed_get_locked(bo);
>  	xe_bo_unlock(bo);
>  
>  	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		goto out_put;
>  
>  	buf = drm_gem_prime_export(obj, flags);
> -	if (!IS_ERR(buf))
> -		buf->ops = &xe_dmabuf_ops;
> +	if (IS_ERR(buf)) {
> +		ret = PTR_ERR(buf);
> +		goto out_put;
> +	}
>  
> +	buf->ops = &xe_dmabuf_ops;
>  	return buf;
>  
> +out_put:
> +	xe_bo_lock(bo, false);
> +	xe_bo_willneed_put_locked(bo);
>  out_unlock:
>  	xe_bo_unlock(bo);
>  	return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c3836f6eab35..12457173ba85 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1131,6 +1131,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		vma->gpuva.gem.offset = bo_offset_or_userptr;
>  		drm_gpuva_link(&vma->gpuva, vm_bo);
>  		drm_gpuvm_bo_put(vm_bo);
> +
> +		xe_bo_vma_count_inc_locked(bo);
> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
> +			xe_bo_willneed_get_locked(bo);
>  	} else /* userptr or null */ {
>  		if (!is_null && !is_cpu_addr_mirror) {
>  			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> @@ -1208,7 +1212,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  		xe_bo_assert_held(bo);
>  
>  		drm_gpuva_unlink(&vma->gpuva);
> -		xe_bo_recompute_purgeable_state(bo);
> +
> +		xe_bo_vma_count_dec_locked(bo);
> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
> +			xe_bo_willneed_put_locked(bo);
>  	}
>  
>  	xe_vm_assert_held(vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index c78906dea82b..c4fb29004195 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -185,147 +185,6 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  	}
>  }
>  
> -/**
> - * xe_bo_is_dmabuf_shared() - Check if BO is shared via dma-buf
> - * @bo: Buffer object
> - *
> - * Prevent marking imported or exported dma-bufs as purgeable.
> - * For imported BOs, Xe doesn't own the backing store and cannot
> - * safely reclaim pages (exporter or other devices may still be
> - * using them). For exported BOs, external devices may have active
> - * mappings we cannot track.
> - *
> - * Return: true if BO is imported or exported, false otherwise
> - */
> -static bool xe_bo_is_dmabuf_shared(struct xe_bo *bo)
> -{
> -	struct drm_gem_object *obj = &bo->ttm.base;
> -
> -	/* Imported: exporter owns backing store */
> -	if (drm_gem_is_imported(obj))
> -		return true;
> -
> -	/* Exported: external devices may be accessing */
> -	if (obj->dma_buf)
> -		return true;
> -
> -	return false;
> -}
> -
> -/**
> - * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
> - *
> - * Distinguishes whether a BO's VMAs are all DONTNEED, have at least
> - * one WILLNEED, or have no VMAs at all.
> - *
> - * Enum values align with XE_MADV_PURGEABLE_* states for consistency.
> - */
> -enum xe_bo_vmas_purge_state {
> -	/** @XE_BO_VMAS_STATE_WILLNEED: At least one VMA is WILLNEED */
> -	XE_BO_VMAS_STATE_WILLNEED = 0,
> -	/** @XE_BO_VMAS_STATE_DONTNEED: All VMAs are DONTNEED */
> -	XE_BO_VMAS_STATE_DONTNEED = 1,
> -	/** @XE_BO_VMAS_STATE_NO_VMAS: BO has no VMAs */
> -	XE_BO_VMAS_STATE_NO_VMAS = 2,
> -};
> -
> -/*
> - * xe_bo_recompute_purgeable_state() casts between xe_bo_vmas_purge_state and
> - * xe_madv_purgeable_state. Enforce that WILLNEED=0 and DONTNEED=1 match across
> - * both enums so the single-line cast is always valid.
> - */
> -static_assert(XE_BO_VMAS_STATE_WILLNEED == (int)XE_MADV_PURGEABLE_WILLNEED,
> -	      "VMA purge state WILLNEED must equal madv purgeable WILLNEED");
> -static_assert(XE_BO_VMAS_STATE_DONTNEED == (int)XE_MADV_PURGEABLE_DONTNEED,
> -	      "VMA purge state DONTNEED must equal madv purgeable DONTNEED");
> -
> -/**
> - * xe_bo_all_vmas_dontneed() - Determine BO VMA purgeable state
> - * @bo: Buffer object
> - *
> - * Check all VMAs across all VMs to determine aggregate purgeable state.
> - * Shared BOs require unanimous DONTNEED state from all mappings.
> - *
> - * Caller must hold BO dma-resv lock.
> - *
> - * Return: XE_BO_VMAS_STATE_DONTNEED if all VMAs are DONTNEED,
> - *         XE_BO_VMAS_STATE_WILLNEED if at least one VMA is not DONTNEED,
> - *         XE_BO_VMAS_STATE_NO_VMAS if BO has no VMAs
> - */
> -static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct xe_bo *bo)
> -{
> -	struct drm_gpuvm_bo *vm_bo;
> -	struct drm_gpuva *gpuva;
> -	struct drm_gem_object *obj = &bo->ttm.base;
> -	bool has_vmas = false;
> -
> -	xe_bo_assert_held(bo);
> -
> -	/* Shared dma-bufs cannot be purgeable */
> -	if (xe_bo_is_dmabuf_shared(bo))
> -		return XE_BO_VMAS_STATE_WILLNEED;
> -
> -	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> -		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> -			struct xe_vma *vma = gpuva_to_vma(gpuva);
> -
> -			has_vmas = true;
> -
> -			/* Any non-DONTNEED VMA prevents purging */
> -			if (vma->attr.purgeable_state != XE_MADV_PURGEABLE_DONTNEED)
> -				return XE_BO_VMAS_STATE_WILLNEED;
> -		}
> -	}
> -
> -	/*
> -	 * No VMAs => preserve existing BO purgeable state.
> -	 * Avoids incorrectly flipping DONTNEED -> WILLNEED when last VMA unmapped.
> -	 */
> -	if (!has_vmas)
> -		return XE_BO_VMAS_STATE_NO_VMAS;
> -
> -	return XE_BO_VMAS_STATE_DONTNEED;
> -}
> -
> -/**
> - * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state from VMAs
> - * @bo: Buffer object
> - *
> - * Walk all VMAs to determine if BO should be purgeable or not.
> - * Shared BOs require unanimous DONTNEED state from all mappings.
> - * If the BO has no VMAs the existing state is preserved.
> - *
> - * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM lists,
> - * VM lock must also be held (write) to prevent concurrent VMA modifications.
> - * This is satisfied at both call sites:
> - * - xe_vma_destroy(): holds vm->lock write
> - * - madvise_purgeable(): holds vm->lock write (from madvise ioctl path)
> - *
> - * Return: nothing
> - */
> -void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> -{
> -	enum xe_bo_vmas_purge_state vma_state;
> -
> -	if (!bo)
> -		return;
> -
> -	xe_bo_assert_held(bo);
> -
> -	/*
> -	 * Once purged, always purged. Cannot transition back to WILLNEED.
> -	 * This matches i915 semantics where purged BOs are permanently invalid.
> -	 */
> -	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
> -		return;
> -
> -	vma_state = xe_bo_all_vmas_dontneed(bo);
> -
> -	if (vma_state != (enum xe_bo_vmas_purge_state)bo->madv_purgeable &&
> -	    vma_state != XE_BO_VMAS_STATE_NO_VMAS)
> -		xe_bo_set_purgeable_state(bo, (enum xe_madv_purgeable_state)vma_state);
> -}
> -
>  /**
>   * madvise_purgeable - Handle purgeable buffer object advice
>   * @xe: XE device
> @@ -359,12 +218,6 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>  		/* BO must be locked before modifying madv state */
>  		xe_bo_assert_held(bo);
>  
> -		/* Skip shared dma-bufs - no PTEs to zap */
> -		if (xe_bo_is_dmabuf_shared(bo)) {
> -			vmas[i]->skip_invalidation = true;
> -			continue;
> -		}
> -
>  		/*
>  		 * Once purged, always purged. Cannot transition back to WILLNEED.
>  		 * This matches i915 semantics where purged BOs are permanently invalid.
> @@ -377,13 +230,14 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>  
>  		switch (op->purge_state_val.val) {
>  		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
>  			vmas[i]->skip_invalidation = true;
> -
> -			xe_bo_recompute_purgeable_state(bo);
> +			/* Only act on a real DONTNEED -> WILLNEED transition. */
> +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_DONTNEED) {
> +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
> +				xe_bo_willneed_get_locked(bo);
> +			}
>  			break;
>  		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
>  			/*
>  			 * Don't zap PTEs at DONTNEED time -- pages are still
>  			 * alive. The zap happens in xe_bo_move_notify() right
> @@ -391,7 +245,11 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>  			 */
>  			vmas[i]->skip_invalidation = true;
>  
> -			xe_bo_recompute_purgeable_state(bo);
> +			/* Only act on a real WILLNEED -> DONTNEED transition. */
> +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
> +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
> +				xe_bo_willneed_put_locked(bo);
> +			}
>  			break;
>  		default:
>  			/* Should never hit - values validated in madvise_args_are_sane() */
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> index 39acd2689ca0..a3078f634c7e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> @@ -13,6 +13,4 @@ struct xe_bo;
>  int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  
> -void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
> -
>  #endif
> -- 
> 2.43.0
> 
