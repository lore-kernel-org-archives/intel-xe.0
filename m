Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31FACA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 13:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8388810E101;
	Wed, 27 Aug 2025 13:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVHdITQe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1783E10E101
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756301400; x=1787837400;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WvEffAg3s8mPs/hduJwWQNPyIjZpixmP0hUAx/M4sy4=;
 b=OVHdITQe8n8Z+JpGtEkYFX3tMPjR1+RbmFKK0JNkKjNH2P4wKfnnsvmI
 wakbOKExIypTbzoWQZ+8Zq5hm9DJMh74QtiJXqbTL5AgVdATX3uBwRmJ2
 sD3DT1Psl8qxn7BV5tvt3KJk4cjkvKLFK3jWm+8THpD0G2Et0gwdHmdsi
 Bx5Rh2w9tjyrCW+2+1m6A/X7OMH3crkOsPad0eXUlJRoNKZhldp1gFOYP
 8imxOVm2d1OsCXLspIPU8WKSZCr1e+OXXccsnNm9U6OH5HziMVEiTyJS1
 /2MRdbZ+KKZb9oE5MKu22rcR9715dKU6/cnoz0p3wWCq++nl2JQSqoQfE Q==;
X-CSE-ConnectionGUID: Bp78zq+MTUqDB2+JeevMig==
X-CSE-MsgGUID: kOVMcfgbT465A9vxb1bPxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69992899"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69992899"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 06:29:59 -0700
X-CSE-ConnectionGUID: KmiTM/RPTsSgQFCUbwpggw==
X-CSE-MsgGUID: WuFg5lXZTL+8Okc0V0MaCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169746533"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 06:29:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 06:29:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 06:29:58 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.75)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 06:29:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/iAZB6nLF53LGmBix3nzjw0MEZRLytvCfAvV9N/h6LR+Jv/Y6oPQVggcStMS8Sj4Ewb6kDqdjT7ICapyK1uVBn+54LoYugpRXES+hkt3y30UMCdM7jRf0637GdwzMDGs+RCsvlSrTR5NlAd53ugar0G+Y5+0A+lA8sEknJo1GRpQt0lAVK9miQLYYs+ijsVoZDVGR+pd0ACcW6ANEufjmOl4x3kc6o0mMeVoOduGH4Xiuqbo3xohTURRtJCLjYmKTTTNV5uykVKYrDjQW/DIq343f81HFdbe/mvuabAjd4HmQ0OsZevjQkHEWttBiAgjlDYbbIs4kw8enftHHVQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkiE45+8jah3l8oWGzqqGzjHbuLM65P+4zjwEL+XFXY=;
 b=RXHhktAKxCk7EzPFMVMn7sgf3dlcJSk4PDfs8zCL7X0S6bRBmPtdxG5ifKoHM3sn/m22xK+aqlULNih+sdu65dXOF9ZEJEQiAM9mSVoUJi5a74WlrCsGYMrihCAgKKupujY1CT7athHZU7jAYZxMsRfXq/ZTVtVEr3LMARUGaODRuhZawj6xUuXGPymSOoP8SqpuZrNHFmS5a+fwgFNKhgYNzMYPv6hYGvieYyAs4QTzHXh20DdzY0UosomQ4KsL7OMirmFJfcO900p0GTssvFO86XMZyFAF7u7sD3aJqsTd7TMfqHQYp9OUVQzV6TyU4jD7LUN7pcLtI4W+ZFcOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM6PR11MB4755.namprd11.prod.outlook.com (2603:10b6:5:2ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 13:29:52 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Wed, 27 Aug 2025
 13:29:51 +0000
Date: Wed, 27 Aug 2025 09:29:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <karthik.poosa@intel.com>,
 <james.xiong@intel.com>, <stuart.summers@intel.com>,
 <shuicheng.lin@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: make xe_gt_idle_disable_c6() handle the
 forcewake internally
Message-ID: <aK8ISkkNGD4pFGgq@intel.com>
References: <20250827000633.1369890-1-x.wang@intel.com>
 <20250827000633.1369890-2-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250827000633.1369890-2-x.wang@intel.com>
X-ClientProxiedBy: BYAPR08CA0070.namprd08.prod.outlook.com
 (2603:10b6:a03:117::47) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM6PR11MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 602d85a7-9213-4761-f7e7-08dde56dcd06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HUWw4ZGMeqoBcvXqU0Cy+cF0Vtg00yzsJde19ktqUJpvupiyrXwMbRuujpv9?=
 =?us-ascii?Q?ACeYVCOiNLATUCBAg33gpxcrRqq7Iu3NI/HX11kwrAvITqQlhneVquTqcJzO?=
 =?us-ascii?Q?aPbr7kWvHWAbs3jnkhsa8mvhvPfvF94ldEocqFHZsHv/pum1tLkH+LbFl4+d?=
 =?us-ascii?Q?MK6aMGZ1FyT8iTQ5OIBW+LaAwBuzmBDtznNZjbZ02TCiNH9bdPuqzdGdVLuR?=
 =?us-ascii?Q?7mhYmfoX6N2BGJfMjZrQTAd6yXugyirQ+j39zIBOgpe9nZa3qXxadBRFai6k?=
 =?us-ascii?Q?J4JsZNnHKJvNiPFh5tAFewPQmdWGPacelu6M0rBQGYAen3VamAiO50CmO5hT?=
 =?us-ascii?Q?gsCXlIcaA1gF3+ICOon1zRjXVi7OwORE1zYyHjGN9i0G0XIVdCfT8EBOkQRR?=
 =?us-ascii?Q?a81ed0Sv6oZzB9fhjm7YYeDTxlrJhvMKF2EJ3c7ew0gi2jwwmixIGw74f8lW?=
 =?us-ascii?Q?P0E9IQGnX4XN2JQoPf9iiLyUxmt6n5AnXnXau/46B1foAMpV7LOnaDmEdek4?=
 =?us-ascii?Q?2hOkL3rP8Z3PJycbiR4sPDqb1/HY0NP1QgQtfOOlhYbpDgZ2KSJ4HGnbRtq1?=
 =?us-ascii?Q?kBl5jICtul8JelkWkRDEET90LvH43/IaQaqc47vlRjljSpFocNrYG3QNWrt0?=
 =?us-ascii?Q?nHCWGJWgECUAytz1DOv60r2T18rkvAT0ZAHpRJ1UfyDYBMw9saMc8Boclava?=
 =?us-ascii?Q?9zllikcaUv/b+bhc9lYHZTDsIH8p7OJZvf6dE37PAGAIvqQUHvM0gvqss1Xn?=
 =?us-ascii?Q?yNWfc5jP+5xKwfb7uQ4Zc5/nxk7AelFmAcnkMDp1hdA2Z49hgbxnteP8kZhd?=
 =?us-ascii?Q?SBK0aBoRWJPB5/g64irptHWslUkgjLEUIzThYwfj0OcG0IEsDwKLUBYcfq4a?=
 =?us-ascii?Q?jJqgA5r/9YLD2dh8D9I903rETmxNeqvOdPYOargNnPj5urHUhvp+zjeu2gw2?=
 =?us-ascii?Q?2wdnta2/OAtorl43bLb6wy6nmaj9qq6X1/7cNpw0/35laczInOaNXC9RSBSe?=
 =?us-ascii?Q?zvEcw8wzeGAUk1aXZN+0TOje3OEcVzgzFj9jaDTzRz8d4KT5FWBFgisM7A1H?=
 =?us-ascii?Q?64W8P3j5Or4IFIdCxUp0HstPEobvscK8Clnny+5EY/Ox6DcMHvChOS30fyrx?=
 =?us-ascii?Q?qmPiEzB4fqb54j/iVq+R0Hdp+wKnnj7jTcgxjCre/5sYAhRj4VzFfDt1pK9I?=
 =?us-ascii?Q?qqOQ2JxYcA1tQsWe/jDfAruDh8E1r8QviGq7FkHSiy3afA+/rwmYf0+Ag9cw?=
 =?us-ascii?Q?3xdkVflFb66SOwr+WQSDti6y07Jve2d0uKruK2lHUhzZqLhCsbYFW8DY+sve?=
 =?us-ascii?Q?7Q+bxig2ZvyIekNe2to72RrfYvcyxvxW2PwOZC9ho1aiAp9Nhx4SzAM4XObH?=
 =?us-ascii?Q?rlYcmeIdZDX2oDvzwRJdBC4oMFGXw+caoacFy6tzNadUi97B9HNdr5eql3KD?=
 =?us-ascii?Q?/dgjGhXbfU8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5DPmVEW5aHbgTQGhS913KOpTscaQl4jLv6LS3c0q9NccEDFLCpNkYnxqHT3Y?=
 =?us-ascii?Q?Tsr/EP+ZreD1UzydgoKy8CfF1lbGE7IEBWQxNChM0+sejs5Ota/3KTdFMJsm?=
 =?us-ascii?Q?NHeLZxO+89xUAiag6X5Sb6MfmaN5dqoSO9SyCk04Os/RNLV3S+HZ7JljMf2q?=
 =?us-ascii?Q?+SjNQmvX8Tmgz5M728zzuZSGmjFxHavNvqVJOKdcLJFxwDaf6t+ocdv+xMRc?=
 =?us-ascii?Q?2PQ83u6MGxSZkV4FWHtav3zXpUGuPqWDhJL39U4DBkIoQHPLNoaNDxxQqnES?=
 =?us-ascii?Q?Xh01zjCyh52TES7vnDgOS8wqLr231vNtPnaaPu5Powhnv8HT8p0XcGiZLwvh?=
 =?us-ascii?Q?iwKLtqcmnz77QXBhvVKYez/gCqUSU2vDqujc3hZaNNFl3xyxqRK8VOAQynUF?=
 =?us-ascii?Q?6Olnkfsuskv9AKOVlknWfyAWEssVKfbckdYzH7g8J1s61JopJS5gay26otjl?=
 =?us-ascii?Q?4jONXVXjCBh7Dswf1CIdyU4YfjBRaZZlS5PhrwYOz6jBgFjrUkl2Q/x+VFwt?=
 =?us-ascii?Q?9OZThPDN7H6crwf+RXld843DvF9t+IHRJ4o8n9iL+N2Z41KuVRRo9IJYvwY1?=
 =?us-ascii?Q?883qTw/gaMRrxQljoas5YWzXmX6Vlvd7d1bIHWOkFjOpUgs3xrvyyPxRtUpI?=
 =?us-ascii?Q?yVC29hVT6RiyKe8+Z4kTdvVx60H9H6E1/MRzQb+vgWhDQQY4FOziB438cPgD?=
 =?us-ascii?Q?46UcKKofzaIfwTUQ3YssbiNxYbrcIo6tjl26S/vYE0jvM7nSFk2v/oH+K+e5?=
 =?us-ascii?Q?RTrdrqJkUgDhvZHhayvC+A+KOeP+DPi7s8CiiKXnth/ueifRX9W04VN22aKA?=
 =?us-ascii?Q?LSZqEXG+08eY2a8MlYe5GXqF/0OgKpFpxx9Fp9zO6EP1n2zUn3DqVbwgFkIH?=
 =?us-ascii?Q?PVyM4+dWMwVzgDK4ZXTFmgwsSTSl3+Y3XqUW+PFdoY4UpZqCsVTJxk6hBihq?=
 =?us-ascii?Q?rW8CivWfiK3AXt85qjcZwFpO2NI+4JO/+wyth+OgsgPQoG6YGENdmFYT0SqQ?=
 =?us-ascii?Q?lYDuIZ4R+d+f2xo6qhWbSdvOX5srBR00QqtT03CyYmdtxJtPAGUNyX3BriGq?=
 =?us-ascii?Q?yaRCaHXNFOH8x2h8z+i0ZSqWFicSyR0EHo7MBXUa/PuAbP2VDlgbG6wSVYkP?=
 =?us-ascii?Q?BHOiNgZbu/17+xR0a7U2aQ9xmObPuJt1p2B5CxZ3sFsk7sXF4xSlyTqM8fZr?=
 =?us-ascii?Q?c3WWtmcAKybfvJL6CttyaUUe18idpJM2iiIT1F9kTzBePkiYwbXzsR1GQo2D?=
 =?us-ascii?Q?Xx9hk0gKVnvHtAdIEE9SY/mmlSJps2EuOIscuT4bT79iToCqckM++bbP/Nkz?=
 =?us-ascii?Q?j/+v1msIjXmmuy5ixhuYePQGV3s/UWjABrGQPDvJqIPtMHoCtiYMzGJApaWY?=
 =?us-ascii?Q?9VoWDjxlzJUfMp0FkiqadYckAUNByRE47c7TD6Y2VxhFYPfHGod04GyQQ4mu?=
 =?us-ascii?Q?awrOQZSZEbs0qbu/k2tmofKBqyBZOqSQa8c3XUZ63bVn6uv8XJ9ezqcYZcEF?=
 =?us-ascii?Q?SF5cCme1k2oximEGs0sjUZklVkebJkUQ/ZwGOm9gPBAqdaaflIL3VaBTl8dM?=
 =?us-ascii?Q?g9YC2oYAj4bM37oNU2Q3cW7tfmLK8X6iIXzp7BN8Auh8mmkcC6LivdIKPTnm?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 602d85a7-9213-4761-f7e7-08dde56dcd06
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 13:29:51.3242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+ZBWSvp/KwZHkgzeh118AbFdeOtTMV7PRw7phiU5hnGuEvF6SZsY0E+rjTFShnwPVFLAS4HgU1kE/0miOTvEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
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

On Tue, Aug 26, 2025 at 05:06:32PM -0700, Xin Wang wrote:
> Move forcewake_get() into xe_gt_idle_enable_c6() to streamline the
> code and make it easier to use.
> 
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing to drm-xe-next soon

Thanks,
Rodrigo.

> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 21 +++++++++++++--------
>  drivers/gpu/drm/xe/xe_gt_idle.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c  | 13 +------------
>  3 files changed, 15 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index ffb210216aa9..f8950a52d0a4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -322,15 +322,11 @@ static void gt_idle_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
>  	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> -	unsigned int fw_ref;
>  
>  	xe_gt_idle_disable_pg(gt);
>  
> -	if (gt_to_xe(gt)->info.skip_guc_pc) {
> -		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (gt_to_xe(gt)->info.skip_guc_pc)
>  		xe_gt_idle_disable_c6(gt);
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	}
>  
>  	sysfs_remove_files(kobj, gt_idle_attrs);
>  	kobject_put(kobj);
> @@ -390,14 +386,23 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
>  			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE | RC_CTL_RC6_ENABLE);
>  }
>  
> -void xe_gt_idle_disable_c6(struct xe_gt *gt)
> +int xe_gt_idle_disable_c6(struct xe_gt *gt)
>  {
> +	unsigned int fw_ref;
> +
>  	xe_device_assert_mem_access(gt_to_xe(gt));
> -	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> -		return;
> +		return 0;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
>  
>  	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
>  	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 591a01e181bc..9c34a155e102 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -13,7 +13,7 @@ struct xe_gt;
>  
>  int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>  void xe_gt_idle_enable_c6(struct xe_gt *gt);
> -void xe_gt_idle_disable_c6(struct xe_gt *gt);
> +int xe_gt_idle_disable_c6(struct xe_gt *gt);
>  void xe_gt_idle_enable_pg(struct xe_gt *gt);
>  void xe_gt_idle_disable_pg(struct xe_gt *gt);
>  int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 0f8430acd16d..88557e86d637 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1076,7 +1076,6 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  {
>  	struct xe_device *xe = pc_to_xe(pc);
>  	struct xe_gt *gt = pc_to_gt(pc);
> -	unsigned int fw_ref;
>  	int ret = 0;
>  
>  	if (xe->info.skip_guc_pc)
> @@ -1086,17 +1085,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  	if (ret)
>  		return ret;
>  
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -		return -ETIMEDOUT;
> -	}
> -
> -	xe_gt_idle_disable_c6(gt);
> -
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -
> -	return 0;
> +	return xe_gt_idle_disable_c6(gt);
>  }
>  
>  /**
> -- 
> 2.43.0
> 
