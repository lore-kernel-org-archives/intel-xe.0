Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399CDC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 17:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0B710E801;
	Fri, 16 Aug 2024 17:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzRI4ZI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452CE10E801
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 17:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723828109; x=1755364109;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v5EWg1lvr0GDg/bk4slL74S8XKpp0lWaGIm0BqPKCS4=;
 b=UzRI4ZI2O9n/53pvAaMVbS7UmyeWY3zHbNXMnJ4Um+45lmwhJbjYHqG2
 e7gHLlvHMkO/MJfAQVPD7OgZV7BfOmzos4PRBz5NG0zQ83QU61ZlnL33x
 Su5qLhCwDTi+0EoHtfQzKRUOTlvQzG8Z5qyLvZQyaOc42Y2hkeSPn9vYk
 OTP+krrFxsLTSBdyLbnzYpsl6z7NTOA8YiTpBLZYrMJ8f6WXmYH2b7IDR
 R+GXFjPGLDIguXRT/nvMtwqFi0q7ML6RG4TFCMVPQPkIbkaIzpc97YPlJ
 iZMzgF/fjIjvOkYDQ3wsg9eUWiv1BSyzk0DFJ1fAJ7kLXIbI96xhpWdrj A==;
X-CSE-ConnectionGUID: 4n17D+KeSXyzoMMbU03ayA==
X-CSE-MsgGUID: GjG9QWrUQcKc93Cob52iGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22273327"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="22273327"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 10:08:28 -0700
X-CSE-ConnectionGUID: CFThG8I4SLSgoIB0N3O17w==
X-CSE-MsgGUID: PLx5mPl9Q2Sv9bVA98oCng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="63902517"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 10:08:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 10:08:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 10:08:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 10:08:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fj3ZeVNFrWcizwp1uMvAxm65c0we63IBbmpURxfhHmX7B/58pK0DxfFLT9FBHPjf7UivmjAAyp1E/Ke5yy0M2lvRUd15cwQr5klD0gnADxOKloIb+WMdShdJQkTtFhuOZmrKWv6UNzE5VfqtnCfjhA4Ocyr2xe7eDrrVONLEumqf2NLkr1zT+lW1t6i7OCQTaPZ2BNnMBvkg4KMLpCPtGrFoDxkkKi2gVeBCTN44YJxVkl8xWw8c9RP+l9wmy/VOZeHpG2JKINqSvrc6qXd2SgXOvb/Ep01SGS0mBqo2NbSvVGT6bLLGU2zl+CDFUCRkylpyYbN6hmX/N23X8oVcKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAhTJikXQQ7X5nOhQ8++NaS0RWj9RgYcHH799i/YwPw=;
 b=kD9nZ3OGjVCgesY7lm+kOCkZMfZ1bQ6wf7cgiWWnqrXLve0yde1e2ljeva+XeoXLgUBBKYKQsTv/rXW7ybI5pkJ39vlXwQZMwVa0dnlbVNeMKsK0jcYD8XBJ0ZQyLDVxXh/pYdenOMUNRhnSesCefqWt7ZzLDcwDYRIXZGNF3B4wP52YG9v0B7u1SOo9oyA15PY74ykobomqXlv2rFEqRDafppto8zXVz5AbG4O4sGtUKBvqwDLnMwWXHyX74q0yiwqkgjPfJclFAGs+bmO9gMPvcj4bBzu3g8emtrZ9bKhnrB548PLhLzkbq5zaGkDsKy5Bdd7+vrnjqoyjX4ZZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Fri, 16 Aug
 2024 17:08:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 17:08:25 +0000
Date: Fri, 16 Aug 2024 17:07:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <apoorva.singh@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
Message-ID: <Zr+HSuh1C9d17ttX@DUT025-TGLU.fm.intel.com>
References: <20240816080355.897256-1-apoorva.singh@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240816080355.897256-1-apoorva.singh@intel.com>
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b621210-dcf4-49fa-5c66-08dcbe160a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+o9Jm1jLC11mC69cfheRboD64+t8OS6Nq0M3A/acp+AE4aZFyMxyA8Bs6mna?=
 =?us-ascii?Q?uq1IX73qjZ0vMjo8m5yV2P2+tVPtYZEZ5nn0ldndYR1b3B/f9Ef4ZyG6MuJ4?=
 =?us-ascii?Q?JLmT9hfUyCi2i64vPbLX2MQimFgmbJNeH/PX4GAb7U7JxF5M0Ker0hT85KKn?=
 =?us-ascii?Q?gfugBokTwVg08QqjuS+nPjHnthsSDURjy1mpKd03Qh6XHZXxDr0llGbGf0V1?=
 =?us-ascii?Q?5u78diGezZR3blGVZ/VIobkq3h2PQh3PsXmU9vPN8mGgQAbB9nhk3YZQGGDn?=
 =?us-ascii?Q?g3Wa+Ln9PUKT3/+DWSzJsPJozcGUui86mghHdfDIiZzcypOnK407y3RgJJN0?=
 =?us-ascii?Q?LFJGs4ZigGRehJy+NyZ9FAPjlL2lD8qpy0iFycTt86rR5E3YBtHjHWIa0uOj?=
 =?us-ascii?Q?HLZ/AfY2wnYvhnE5xeZWUu5YQEZGAC7tllx0MstJWkN7GLPWWws+gEIuxBbL?=
 =?us-ascii?Q?/e4Zkvd7Ms+AVeXFd+8bzIKPls451c7Aw+DPYv4m0DY44kF1r03rlS/keyT8?=
 =?us-ascii?Q?h8JFye5iG0McqX8ciIm5snrQ1oG0qaj/12dWhYrz/q3NEBSB9FMsWKsD6LxP?=
 =?us-ascii?Q?kqBdzGAohJ3PfBV0ptFtAZ1iAaz7K5ZRtZWUbyirQaN1Wf2GF4J/EK9JYMTz?=
 =?us-ascii?Q?NAA9N71KVidtnQuMSijmNC1vJI1HK/yG89k2JoiUEBvPB1Ti6n/OxbShjWtF?=
 =?us-ascii?Q?AqHesa0QJeyXvxBO/cJc1nukzyN6F5CRGwsXm2RmUXBWSbg70cCkGbC5lZZY?=
 =?us-ascii?Q?8w6HxvrvU6d8s01meRWn8tMsNPPkNCzJoov1E5boJwaL28LH8ObAbDKan73V?=
 =?us-ascii?Q?aZIN5BbkOcGJg7r5A64COppV03GQ4TncOL/DT99HIvjyu61LWJSNjYd5tlR0?=
 =?us-ascii?Q?sYoWHOk5aEKA2Nihow4a+LWyA29TbpHv7WAuWTmhzaq6n6PxRe9/SuSWvw1t?=
 =?us-ascii?Q?O9cPnMvisQlrEw85IaL5P8DhJsUsgmFn0HThm4g+55uNse72gGAtaP5qjdd9?=
 =?us-ascii?Q?o59XoLoCmmBolvWJMpgulC8zTje2zX5Tb1rff9u1pxGh5vUNjEKzELw6hCY9?=
 =?us-ascii?Q?TplPDpWWpaWYaoZ3n/XX+JxfdgFCEdd2rmkZY039cZ7/GykeOPMugXHQvX3P?=
 =?us-ascii?Q?i/1MgjEPdGNwb8cC15Y7/8KOB+15Ud9UM5o7nxpAStCESaWFoMluKDBLH5UL?=
 =?us-ascii?Q?0GlicpMPsLc3S1A12g49CDJCAmFjUJQZj6N5BYAcnyK9gdVc/VnQHUyAtTF1?=
 =?us-ascii?Q?gFaPifIcNl5yWHPF9reR/vk6v7y2AZsIIkc4C+kCiiVKdXhd0MjDl1HhJeqr?=
 =?us-ascii?Q?wGYqbahbwIFMD7ZG8FsmqNFuGo2/PzOISmJt8Q6e+yKaqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pjP2KgyCb7dnYD167oBJY8joXtxzumn1Y6kvU4bPPzKwDXGmrEOpQxIl5/bB?=
 =?us-ascii?Q?Q6C6rUAZrXP5uEV8r1pTq73p+m6fUzx3C74m8grSu64qTPVDF/l6V9Gau03D?=
 =?us-ascii?Q?8pSlp4qibTofQ1s+f9nhlUVDzjL2BZwaIWMztAc8WGtqcS9/NZBrEpK8oId2?=
 =?us-ascii?Q?UBS9lam9PG/i0lB9SJXEPlSjXYOWvzY3569bFIbLEIe1Mvzt3JSmXwQf7ptu?=
 =?us-ascii?Q?WBnNEGZ9hGCS0e6GPWMqRtwHHamaTb+ksu8a3toYBY+LQ6Fgq+cyfNqrSh3O?=
 =?us-ascii?Q?Dc4Rlp5Fa3NguLP5l4K46PGqldPCLJOUnmaD7/pnwuOQzWUQPlZlPaHVdDt9?=
 =?us-ascii?Q?mvtVgoBDN6eGjFzlPat5Kr8+7B6OZqcWGNzlLcgYezKCmgM8fPrp7F7ITt7M?=
 =?us-ascii?Q?BYi2Hv3ZJ639YitF12JJlNESrSOQXxjivB19FrO5Ox5v4AHkzsB9DOklkLoN?=
 =?us-ascii?Q?yc6kjLvdCmEcLvaBrKSfU0K+YvwEvVlt25aDPPDiJcILBSUUqE8yIGv5EkB1?=
 =?us-ascii?Q?dXBH29EFHU1DK6FBv8fUn4UxQQk5MLj/rORhF0NlouQNKvMgXcaBmgxRsxhg?=
 =?us-ascii?Q?PNh8Kn6PRYwtpY18q+/Z75Pv6rIFk0Dw2YHMisI9ze8yDKNL52sDp3QjbW2R?=
 =?us-ascii?Q?cFxHf6YVR22ROI5KiN4z5YzKOidmTwEgVe07t1JoofJkyHQ7FynNp63DU9pI?=
 =?us-ascii?Q?/7tLcr1xTe5gUP0IqUxMz6pD269IR+1oWcpqGzCOE0HBADnLqFfZmKX04xDC?=
 =?us-ascii?Q?CYuGWzcfW4uwSUXwdaF+7p1D3UQGKRnbozsALY7G9gd1JgJeKsH6XBlNxr+X?=
 =?us-ascii?Q?GzdllPcVekGb54SteufFsUxOhGESBGIEhpmgTTrchiPwth6yH58/UbrshStF?=
 =?us-ascii?Q?nzO/40YQb5nvSCKw/t9itgY1GGG0Z3JD38T91xGVeUOdTVhspxgv2yrMD/f1?=
 =?us-ascii?Q?MgtiVYLgHGYTr2jb7p25LOO4ISCbjCma52+1/ApxMp9LWkE3ybdRHKR0QB8g?=
 =?us-ascii?Q?sG8UrQVpnOavJFjt6XFK6KzU5wfNlOJmIcM2qyc0x+DApXflE6vee/zIp/Zt?=
 =?us-ascii?Q?QADT+mFe43HiKdivqdVNsQYBV5nbijHS7Xkridij2FKVP1EuOceh/DesdmX3?=
 =?us-ascii?Q?kWwC6UW3eM40jORpYekyvtZrRohJaMaHT5GpkvUuSTqzehimhAGgcvu9d6br?=
 =?us-ascii?Q?i8Obu2IAPA1KuvcHLQTPtLYA7T3fe9FDHFGzdZkRVuQ2HoNLYBcbKCdxVm69?=
 =?us-ascii?Q?ioMHtNaujgu53LCb3VgeSz49N6yo060xH+0vp0HVIABKlNq32AbMEx9IjXMD?=
 =?us-ascii?Q?RHnUMp/X0HAR+4Gg/pI2yCvTyniFgRszucTgj0W6gfOz6FresM/YERsUv3yC?=
 =?us-ascii?Q?riaKkdtHwmgxWLpMD2YAqG+BD0JWTzl9Go4lEr3N/uEoDcJR3YVMFQuHZOlV?=
 =?us-ascii?Q?hVe55f6Mu2Udqg5IYWj1/fWir4wSz8I8ZVOXQGK/0kul//PJUz6qKPyVlHy7?=
 =?us-ascii?Q?xWmH198lboDFp6GnAQC4LEXCocsjU+fTSzgCxruU1EKr7G08kn+uGMq69xQ/?=
 =?us-ascii?Q?S9tA1FqtF45L1Qd4MLSkWfSTOcFDofwhQzCvPFkpwqI5peybjOdm0J3LK7FM?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b621210-dcf4-49fa-5c66-08dcbe160a7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 17:08:25.5291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulnD+UNg55aw2WnFL+6hLFp2KImWZmpvLHG4fN2vFsdgN0hgcOiwIT8hdojNBj1WlyAZ5VTsGxZoikAlyuJadw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
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

On Fri, Aug 16, 2024 at 01:33:55PM +0530, apoorva.singh@intel.com wrote:
> From: Apoorva Singh <apoorva.singh@intel.com>
> 
> - lrc->bo NULL check is not needed in xe_lrc_snapshot_capture() as
>   its already been taken care of in xe_lrc_init().
> 
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 974a9cd8c379..aec7db39c061 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	if (!snapshot)
>  		return NULL;
>  
> -	if (lrc->bo && lrc->bo->vm)
> +	if (lrc->bo->vm)
>  		xe_vm_get(lrc->bo->vm);
>  
>  	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> -- 
> 2.34.1
> 
