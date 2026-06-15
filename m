Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811E4CD98DA
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 18:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A44210E569;
	Mon, 15 Jun 2026 18:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8ePSr1i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D605A10E569
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 18:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781546875; x=1813082875;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EBl+I/XTimLXjwQv4LYgHCbPVJLVCL1U5ekrFKhzv5A=;
 b=f8ePSr1iyBCssMlmwJH2u6B1k4hw3HO+uX++up6urBngu2Tz+UlGV2jv
 SdyVciE8+PJqa/+NHSeGRtJdqZ5qEU4ZS+WYz/XDSc45AmfhCxiwewbF7
 yIlqOhKw1fTYFyFnrckJ3PEbwxIXbC6IJgmxCIYjpQ1a7kmHELBPXzm5H
 TXo8U82jnjPqXZSvm1trJUf9DNPIqz5PS+9HrdJDjvR0HiHg2Sk61H+aR
 16P2fo0vsiaaeoDfI6P+z3wsC+3jFv70sRyQwTxTpNZ/v9HVXPq/kIfEr
 8YHJwQB+D16Ri1JpOwhCJuqZKN1J0AmNO0FUy9xrZbRUJfTi6pgD9Q36L w==;
X-CSE-ConnectionGUID: hc5KuzYFR7GwuFgniJRzgA==
X-CSE-MsgGUID: Lnw5wzUdQyGX4wzgNsAImw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81433565"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="81433565"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:07:39 -0700
X-CSE-ConnectionGUID: Rz5SKF/XTUuQnlj4SgsL6A==
X-CSE-MsgGUID: 7BWTk2ALRnqjQLQwGKT/JA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:07:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 11:07:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 11:07:38 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 11:07:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRGCpvmprhgGk8fsnNaub/8tJKbCLGZxLSFKSpb9aInF5Mb2mrnZrAeriJST+f+c5NV8iRtT1yWiFfWgn4Zr35icTWqQlqkY6H0XvywX/qJ2D22SqoUOMhuT6v21zcM/k8txJzg6kHfWnkEI6mPmAZSvDez2SftkAjBiVdnrZYmAO0v0QhtsJmS5KkUEGLNpn0PsWVIXLqYpzGbJXv05lC5XiEpzbQjXcVOKHxh9LCtTFtIjNe4CZwzBCQowOmwNNJFqkEZI44dFerN96zsWxz2YZWEjK2QQ1GMslH0ZTX0y+AnIKEwM6If2EdFqXDRprYladYd85BgejskL+3aqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lp65ItVINZB8TocJZ48znP5kxg1VaqphzvbxmeHCXDo=;
 b=ZZeaW2dxKvQq3ylz61xez1fOHS11w+e5KvlU9Ue/3fJ8GDi7btwRr8fW4PrOypuUEcWqlQy0EzhAmUq8vp3Y8QGn1WF+rW4dZbT1jqgtiEUrBsoo+tqkmxZ1LPBcfh44lVpIEfAsOHhCsykQCiD/5fvlw6jPSCDbpF1Wi2LqzpmBfDvQIPlCyazSSxConf3X9efTwW2rzt/9e38xOglnen+2CEfYax7nAqFJ9o+8X6t8G/Id+tEo62EpDe1yr48ZXYB2GdeshjLdja0OsSRCLrbGnj/ayDyGSF0nxP68c7vF47Y0walWZgrsP8sS6/SQBuRcLKOjXbbNWn8OsMgbRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4544.namprd11.prod.outlook.com (2603:10b6:806:92::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 18:07:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 18:07:35 +0000
Date: Mon, 15 Jun 2026 11:07:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/pt: Fix NULL pointer dereference in
 xe_pt_zap_ptes_entry()
Message-ID: <ajA/Yy/py1Fs+vUz@gsse-cloud1.jf.intel.com>
References: <20260615091904.165762-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615091904.165762-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4544:EE_
X-MS-Office365-Filtering-Correlation-Id: 366e7efe-94c0-4dad-36bc-08decb08f9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: heLtFisKFJ9WMIGZP07xpKN2IOYsjytTHVlTO0CwLsQlcG4kZ94GfC2B4QSfRBqk+EVaoeK2F/cLHaOrlM9VJ0AifIAdsQN1b8T/XPLSuYadWQJHlP9S3/hVC6zMZP3MiX/jeQuoza5ulsGPmxDVhMRT9QaWsbQBGEipRte8A/vLJ7bPhliRNyUKmV6qKqtmRe916RHE6GE8L10Vev0GgEhCqhW86onhvFxaqZALwlsSeajnVuWYhrxv02oy+Ym39rjh051vH3lFJUWpHYXGQwgUjxQqMPNr9IcqdjLBZX42BC3RDHImAFxGA+MYHJXHEADoJVNXCIbRXedaT0ZobDZi7JjRk+fhDnKPPCUD5E+0by2YSHVA7of6UpjHwFz8oNZQfSRz3g8WIUIP/QJFZyY4HVJPmFW8fEt1PLizn8psw+461lQf8OoLZVlugjOeVYZcyuk2sVIfPUyQk0ZYdqmbHRuu2w4VgXoCM1L/Kf00FpA6xVVN2ZPfj+4JtMz7LZrsNT39iGdaEsd+YM5LRbIe5mxaZPcfRwUOX+RKSfbJT/+8B+5kDi/TyRZdLawKzN2AassiUqrA+wZ53Ebb52Md5LeT0qShpQGpPNVskpgUWM/Ftw1CPfSh1vKXIlNMe5YKgvjkWE4Xt6fc2lLIClyvR+lOnnqVMzE0nFqXyqHkqGaPSlVSEyyfQr2rZBIg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kuUoBLN/AApFSmF2Dd60adhNmTh+fFjLF8G73wlrLLCs/su1TV8UiClF+P?=
 =?iso-8859-1?Q?GI0ZnH7BRveOsSmbs0yyMDSgiSzhGwhKDAtfHhTY4VvcO7AWAPV1q8Wgwj?=
 =?iso-8859-1?Q?fdrCXNk1LHIvlIMdFK7kZNxE2TjCbWrpKDlxD/3tYH5bniQyTG/NK6q90i?=
 =?iso-8859-1?Q?d6SEUGgpgSVYERga/XgAgi6jDZQpFEb2x0oe6jO4Fl9O8SWY36F4bsk0/C?=
 =?iso-8859-1?Q?hMOYlYLuinjt3KyKvdud3nNaT8NmT5ACPqDg5uVhrudEfql7YMttHnaAYj?=
 =?iso-8859-1?Q?iPqH4r57kff2Rq9GifpyyaXbo6/P+CUaPGjOijJmlKaawYMpSSAzMmm0Eg?=
 =?iso-8859-1?Q?z5Ei6JjdHPKRl2kk93DRvosJJEpvpG6tkDzgtmfG1RoHUKIQ+sB1WzDVZ4?=
 =?iso-8859-1?Q?mLJp9Oy+igxWK82xnTfljdtq121kIV+JXiMgUR7Igp1Y/akDSdhZV77HzD?=
 =?iso-8859-1?Q?8AnbVeAbDCfHRpQPDhLqBXZ/Yoskt9Pg0R/eLQ/OPGBcymAF0v8x0kmvgA?=
 =?iso-8859-1?Q?HYfyR/mJTD20f+nyfNTRKc+XJMkfMJcZv7DSrQlnLz13mXfID94ly7DP2b?=
 =?iso-8859-1?Q?/g/b2Js+DmSpqZlWasJFJ25oenmekfSSFC/G3gbuGTHGeI/JNuOl3qyFKH?=
 =?iso-8859-1?Q?ZAhhvhUKCKEXa99hmI668WGSIycsldqWu7oL1qaVVAoaELEeqNw3Zn3By+?=
 =?iso-8859-1?Q?NinYgqElDokUBRF/LzM8rThUj2h2SQABpKH2rWAbd/NmJUe5arGFTcHH0h?=
 =?iso-8859-1?Q?IJfwL/uyM1UiNdBgvCFEXDbhCwOng5wRN7VT5Q7l8Uh7vBJr1pY9g8SgJq?=
 =?iso-8859-1?Q?NaQFKpaEmBwr4CIhTXAnxOhdp1UGTau4NQJjSCB7q6C0PVePqUPVM/IIws?=
 =?iso-8859-1?Q?l+bhf8bBbc1YQYYSICVW3TLsDznCcwbfRLiHnQR+6eY2yF1ZRPVe+iqPLg?=
 =?iso-8859-1?Q?3/t0JNTudPW5nUl2xVepCX5pHlRDGzMIQjQIjubp/OwMN6+tpBL2vwq+/H?=
 =?iso-8859-1?Q?UsOdVM/4rA/JEcq2i+r9QGFvjo74HtBGlzvElU2kq1jhuhpCw1zhyIHorH?=
 =?iso-8859-1?Q?OvfASPvz4JHNM59+8UmnQ8ucl0TCdNWnTl72Rsp7Jq4NiGymxFGH+RXLxr?=
 =?iso-8859-1?Q?qoTi6D20mH/uVoncpEq114TECSXgAjE+CtKaxDBxWykudrlGDLdgU5ZWem?=
 =?iso-8859-1?Q?a7Z96AyvddjPNJyBla3PA6dLAKg94gZEV7YGazEc/2y707ZtYXvXhIM/D3?=
 =?iso-8859-1?Q?SA2Z+a619/7bB6Unwzt4+KHs9w/uuVisO/fxVaD7hI9emug9k/WlOuNcfq?=
 =?iso-8859-1?Q?3NBydRLRXKMUgw6VaYjWFNOifHOXbdwEU+d6p159BuL1eAqPXovRXMJ+Ce?=
 =?iso-8859-1?Q?aHhck73AplrYcf8TxGCQb/DLbiOJON7F2ec+6XxWhifv52RDvkThMlkUrM?=
 =?iso-8859-1?Q?O9crthA6tKOv5uF/QaUBiNlizuPcChwu5R9FVqtgywgDddCByYFZLTi3Qb?=
 =?iso-8859-1?Q?A0QeKf6vUHMFyVBixxsQud4C4rEuCA9UFcpSyx6YE5xYCSPflAGbMhjqbT?=
 =?iso-8859-1?Q?YCtLfG0EBjE5cMdo0bSKCtagowGlcioi2ARcHll6aWHc5cOEx/J9BnP5Gv?=
 =?iso-8859-1?Q?T+L/kPCye+SxRXjR9IzamZ5aVUzt0EuULNRxLRIaW6gWUwCUV9sb+YaYd3?=
 =?iso-8859-1?Q?bnqOv2xaRljkSxTOBuJLNsapmaZ88oVv0ybR62AwHxj1wqv/9qvE2+e5Fl?=
 =?iso-8859-1?Q?PhGX3tVyBHkGf2wWzSyeMab3h0AdCcTWqI6aB9jveARy0BTEsxg/9N7s5s?=
 =?iso-8859-1?Q?zMa1kX+jb835Hm+241Uj8qTYhSbdrGo=3D?=
X-Exchange-RoutingPolicyChecked: GocaxSq7Cz+ZAycXy5Z+xWBa93nLllqhr1he8i5PD9CfpKkd6Ao93C4wCTukO4eseDRbHUQ74MBlSHrmm21gTTeC0lhwdNCCCmmVl5LsAmBj9S7B9uT7qRR5LTSaiElaC/aJJuuwU/grHP0MDzWdJNo/iaOfHMz4wi8SIDGtbp6idqGgzpSTaS9cu5822Tl8nkkKNH0XwjFHc8JqzPsyt/UaN/Kb1D9vNRJhZdluw+XfSptcpzkZBQ8v1ls3SdYJ3yUnpJJCynv24yKvt5edCCAyhgF7WCaKWmMf6/DEXt5dj0VjgF0OWoJ6e4LVb6QZCMWzj9IgLrfnoTpCkn9yuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 366e7efe-94c0-4dad-36bc-08decb08f9a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 18:07:35.6388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rYNjIQh1lAWVpSBXBSIdJAxutTLvpMZpiUZkij22MqoJufNsuLxLcsDa9i0FIOzlqImGStX6fz1gwHEfa5V2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4544
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

On Mon, Jun 15, 2026 at 11:19:04AM +0200, Francois Dugast wrote:
> The page-table walk framework may pass a NULL *child pointer for
> unpopulated entries. xe_pt_zap_ptes_entry() called container_of(*child)
> before checking for NULL, then dereferenced the result, causing a crash.
> 

Can you explain when this occurs?

> Move the container_of() call after a NULL guard, so the function
> returns early instead of proceeding with an invalid pointer. Return 0
> rather than an error code so that the walk continues to process
> remaining entries.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 15ce77ce7793..123f97b9ee42 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -885,11 +885,14 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
>  {
>  	struct xe_pt_zap_ptes_walk *xe_walk =
>  		container_of(walk, typeof(*xe_walk), base);
> -	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
> +	struct xe_pt *xe_child;
>  	pgoff_t end_offset;
>  
> -	XE_WARN_ON(!*child);
>  	XE_WARN_ON(!level);
> +	if (XE_WARN_ON(!*child))

If this can happen in regular operation then likely drop the warn on.

Typcially warn_on means this shouldn't be possible unless somewhere else
in the stack has a bug.

Matt

> +		return 0;
> +
> +	xe_child = container_of(*child, typeof(*xe_child), base);
>  
>  	/*
>  	 * Note that we're called from an entry callback, and we're dealing
> -- 
> 2.43.0
> 
