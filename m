Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F71F606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 19:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M72E2Crt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B2510E46A;
	Tue, 27 Oct 2026 19:42:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B061D10E46A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 19:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793130151; x=1824666151;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yPW5H4oIgdSbp/8IGalZGSr0/L0qDejTSqnc6Y3W4CU=;
 b=M72E2Crt9Nh7HkVi5bM7wCYIN0moTHVIPBdTzP3uabEVFHTyIxy6bu6D
 zpyxsrmvrzLLVc8RLorKIK3jKhTlOED4aT8N3xbHQwimBcX/IE/kQj4zO
 axepRwwpfC+sG+b1+JnrTLoFjOCo8niP1VPjCiX22oquDc6PvcpQwh9dN
 hXj4BH+DzUT3xX3YE0LkAZEnxnp729hyklBxUvzA4akA56YmCz7UI9i8z
 2QLz0DD70PXLoXl6s82wWAKUWtk7QTcoTn+4ZhcAWCqf9wiPCzbOTaRNS
 pABmt+M9/z81S2d7OYLmQ/cNzLS72ujFdTimi4GvsPQxbPB2DlaHtzmeP A==;
X-CSE-ConnectionGUID: AfgE7/LfRaymQNEH07C7MA==
X-CSE-MsgGUID: +aPSxeitRl+m/nn04xgquQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1855454"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1855454"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:42:30 -0700
X-CSE-ConnectionGUID: MUDbWJi0Q6G3yp8UuIOPaQ==
X-CSE-MsgGUID: 4ChNpWUrSU+FsrRprdVLaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4767373"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:42:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:42:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 12:42:29 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iN5xjZIYKD8SpvRX6l2wDllO7o975Gj0W3rwt8r6+qWdqjOjNUXw/q/hySWjj0/APdPtEiJgMgaEw8n5phMiggpBgHKk+wvzUYkmZsyeAsPXrwIyA6rd55AEPVTgn8PIBxSrWLM0rPOI4AiivfXZE3osC3/gea1M1mMptm1MFeysi22HybX1AOj3qj/a/URpW7ae/ekzfQtsatCO5YNMf0bVyMJawn0XIR/PYNfhelVozTn89mdcLs8NoF0EhnWzQVKFX5t1evvV9Y/Oj3tUspoapno33Uza/9uUrXUcT4sYT0pj97CK/PIAP5e5kH5j+rAKVU4LuJFxsAtYUj/J4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imSIfOn35FdI6yX/sHWUfVeeAv4g7BC0MBaYhdazKWk=;
 b=xaylNggWGcP5ICFeOlgGRse7D9wNjyFGhh+w/Th71BPmrviN30DG+/+2Dm7ZCQ92ChzQuHkDOIMIndTGXpnMDdooQNE+Y1W0AI/wdOy2ALqUD3J5J+xL0JrLxHkMjGNOcYUqrle6caJHc5V8dXE3qT89AJJu0XbBqOKBRYQtZIQeiNOIMaIENJmb0VIuKGev75FXjjUj3irfS+7HGMNMoQm9HTe+0fhly1PY70TAekptrCOJYla51y1scMqfmpqZovt61aclya7mJXadE98ShzrXYqJnBfPtFKjj4s9w7f3liju9pq8FVs26k/f2B6gDATNonjv7/drAHv26sqK7NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by MW4PR11MB7152.namprd11.prod.outlook.com
 (2603:10b6:303:222::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:42:27 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:42:27 +0000
Date: Tue, 27 Oct 2026 12:42:24 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 09/10] drm/xe/guc: Increment regset size for RING_IDLEDLY
 workarounds
Message-ID: <20261027194224.GH203565@msatwood-mobl>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-9-b0453f79c4e1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261023-wa_16031259911-v1-9-b0453f79c4e1@intel.com>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|MW4PR11MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cfeee6b-91d5-4534-24b0-08df34626e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10070799003|18002099003|22082099003|11063799006|56012099006|4143699003|261021121427099003|10067099003|261009223027099003|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: tquVeWX3Ao6fpo+PQ8HYj+n1MG7+OhFuU73X/Ee76asDMbyC2fmr7edA7++28Bmf9Cupmtx9qPXIlbPrWPXUyJe4X6ZWmc6ddWXZpnjNNkQTuEqQgkcalpsKDm6LJik6LE/XJasofUH0Q7giNVVD8W8fBGUOLH+oPtiDh04fauNIw2YEIZo195s077vieFz1WQ6w/2zEAFXcOnOEm9ZepJV+u4oTCZMshwOHIwwyJFBxyJ6+tRKUuYOuWVHG8vj5o/t6uZJBjiWfWm/m9maJDE51bRlvaNi91Uliv6ZqDF9LY9rKRKeUyN0dYImw4UQ2IsiEQps9CFQjxeqkhcqp9C2L/Kh0Fs3EUn8iTLkt93WoKO6FGZBXZHBvWVbC7i8tcx4eNzIQ3MTS/5/0Mu40ca08T2ZFprM+Gk3l9kXEuqpw8qQB5rMBDxvZnGo377IqQ4YsZtkfQCRJFNTyCUoh9bYeDmLtI3IXet3PQaY9OzL28BF1grmjAlSzPWCWTLHEld2iCqIV3dc0Z+U/636p6SRS1wgqosBiGhqNeNnYQ3futwmbj8uSWxj+JFjZXUgbXpjsbaBjuSQFabr7rzoPCpoz6wgIpfoxFgwi8tDdf7N1TziNMbaJ8xd386L4ixAgaSaxseGZIrb/jr1xSDxRd8Rl5f1ZZqrAoLBNS2RnhtM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(261021121427099003)(10067099003)(261009223027099003)(260925021911599003)(260925022911599003)(260925021311599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Du+yL5sG+o8/ERFSk68FiKcIUIQYJaXFZLpjkAgLKY1bNIJXEF5LvIFTp3ZL?=
 =?us-ascii?Q?iXUOmJe6VByyf3JOVceKtqJG6DVr+G3Qi9wPnkfuOrh5FIcZH92FfmcHTUya?=
 =?us-ascii?Q?HPMiD0qOi5vsNPlYLfnTmzpt60PifgkCkALm7e0u8VbwKHD6TjbIWj8KOlIS?=
 =?us-ascii?Q?ZDmPj/OpXVhAyKtkihqql5tQGKk3YSW2cmE3pZYWB1FP8Wdq3d9eyekPg9bY?=
 =?us-ascii?Q?Bo51mNrWX7R7rcSgSUpBUlUDQ/j/uBwhywRAhygHxVAySW+dunVHSWTXDNeu?=
 =?us-ascii?Q?sNzI+rX/u/N3092CSZatLMfT6ynVBcSbgtNVZZixqs5a/RWP9vCD3Uzrd28d?=
 =?us-ascii?Q?x6o+8pZR6MjusbTOx6Unjso9XAp+35FSpzqjNZSaFrj0b+G88ecEeDmZdA1m?=
 =?us-ascii?Q?8WgrLFmd80pxX9jRuMTYk89MedHiSDkwjbdB0zh+fxAoNvDBzb1Vo3FErIv7?=
 =?us-ascii?Q?xK8qv/dn1dwHWPIbcPaja3Z9A7+3IAj0GF8eQjOE6Y04Jw+E+DEzHAJsQgFP?=
 =?us-ascii?Q?wuvoZiqLH1gp6SQsnqiLSmlgvFxrsZnZfpotwLcm8LydHuglRHp0UFGqwE6v?=
 =?us-ascii?Q?NTddkmVeY3jXBvwrCWrRxE4qWaA1rnm0rkwtkEV/bUCJVQLt8jFPWJjWN9f0?=
 =?us-ascii?Q?07NXLAwIohOaoGndM6ZjkambHKuMpYmxpIHuVzibpYFSCpAfQBKU/sp+FMEI?=
 =?us-ascii?Q?8U1YDWnMnOBAlhTlkCekW176X1EEpZZCeWYSh4X9H9491QgqDttWv3sq7fMH?=
 =?us-ascii?Q?JFsnx5lvqQaBHVrxqMKXAOtEawF86OgDIb1FF6B50zilJh5VaoZkpDsWC4qk?=
 =?us-ascii?Q?8XqflF+cuR/X+iLmK6UkiBz72AIMdwqD4VeUrKw3bAL1aMgUoPhgckI9lpxe?=
 =?us-ascii?Q?VjiS/1jUAKwaIGfbnw1i/1zPW9AMuIF2NAYlY3UMWAywqWiKKSYdas9hM1gj?=
 =?us-ascii?Q?RTkQSsKP58U+YnI4FWnRdDNOvW4AyenpBDuXKZrXEDskwfIYNuizbOsid+J6?=
 =?us-ascii?Q?2SiFJhpKQSRH3KYoB5GB5kLflidedRmWzxFX6nytlOVGdBaBwY38dArupGS+?=
 =?us-ascii?Q?AptZqpNR3y1iIT4ZBTLVzh8rEwh7UD9Hv/hM6kwkHCk7cFaEytn9/GZ6N9t5?=
 =?us-ascii?Q?ECIAXkZ34Vd7jE7VPWXkOVE3Hd/XHDkeq45vXQH7zhdtVlBoiUDjrMt9b1Kp?=
 =?us-ascii?Q?pW31tLyBmpPwYPltGRtleRQ3KtZCYQbUeK8bNjiG/r8HWbTE8hxK+SJ+e5i8?=
 =?us-ascii?Q?5Hn2JpugJOxx+b4ZxIJoHIJ4P95bUIN13M0Hv7LRaMNWXWAlj6dYdIMGXlkW?=
 =?us-ascii?Q?vjcLEyBv/rGOnks2cZKLixxQQtk/8bXXj4Ow2MTpD52yXbgVzPd49ySXQa7A?=
 =?us-ascii?Q?wuG7wJ5/4aMxRgnxiTD6qb76XbnplhIxLJPGK16ZLahpBAW/6U7yHpJPVN47?=
 =?us-ascii?Q?9WKwlKgczSuyljWNZVnp77wcldKhuqeDafApY3I7pKdTVlm1vs3Gkaglfuia?=
 =?us-ascii?Q?D0uaHUKH3Hw66eJ/16144g2EQYaoTyiTiFL3biWLIjrzh7SIWngyKK0pGE/M?=
 =?us-ascii?Q?CJd5JNVBm2jqQ6wCS5saLwWRhjAMlrKx6b2zU0puEa0zjnJXoBdAonAh1vBF?=
 =?us-ascii?Q?4mop8ffbr4SOmEDStQZkYsG+6MONZnNoDVVt0a5YnZ7l7N2P0kSE1vs9CM9a?=
 =?us-ascii?Q?jMiNmySFnmCspUH2milhQOkRVuA90oggqebJkfzuxeqTF6+erjgiOSWPD55a?=
 =?us-ascii?Q?Sl1HgTF/r4CsgkOYMPYGJkOYezpK4DUCvuoXzSV8z0kr1e/p0WQdfXO2K+u3?=
X-MS-Exchange-AntiSpam-MessageData-1: UiQqgTi4Ca+ZtMzszABiwp5HRe4mPCYJLew=
X-Exchange-RoutingPolicyChecked: UAo84vvhnlUcY3U4hXJ2phxcX14i22aS3i67E3ar7sZRw+dnua/GQMFD4KQi00xir8gUCqGaTUjVk1pmjFonP7/w6GOI10RZ3G2qo6SaKEBQYgUmNtTsxY9aPDlUpc2RpmaktHXm1maZr88CXBLcjF6DeewW1399pCX94lKsULq/VVxfLXRAOqn/csXXPt0zBcTnKhv/CkwS1EY+2gbztdY5awZvVbKlQWaGbyiF+NRC03xDX2ua/37M17zuzgK+BxkHfYNDDhMkm+pQ/6NEjlTBSNNpJfDKqzPo4HWCbzHWsO1aiu9+MYZ+F325mdB6UgsgumxSQGnvQP+0Hcsnfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfeee6b-91d5-4534-24b0-08df34626e62
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:42:27.4655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsnL/01doFW+49RCV1jSBNg36j99srfypHSEx8InPB0rNhf21zS/7eogmA0KXUqUU5ETM4xMwcbe2JVJsfQwrMED1oXArLAMG/XdJh2b1kY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7152
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 06:09:37PM -0300, Gustavo Sousa wrote:
> We need to keep calculate_regset_size() in sync with
> guc_mmio_regset_write(). They became out of sync when RING_IDLEDLY was
> added.
> 
> This likely went unnoticed because ADS_REGSET_EXTRA_MAX - being
> greater than the current size of extra_regs - inadvertently provided
> some extra room in the regset, which ended up being used for
> RING_IDLEDLY.
> 
> However, we should not rely on that. We should make
> ADS_REGSET_EXTRA_MAX strictly about extra_regs, and explicitly account
> for the RING_IDLEDLY register.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index a67d3405b10f..2e738d205738 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -226,6 +226,9 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>  
>  		if (XE_GT_WA(gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER)
>  			count += LNCFCMOCS_REG_COUNT;
> +
> +		if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
> +			count++; /* RING_IDLEDLY */
>  	}
>  
>  	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
> 
> -- 
> 2.56.0
> 
