Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B14C369BD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 00:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2E910E079;
	Thu, 17 Apr 2025 00:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGR0awhC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C121310E079
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 00:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744848569; x=1776384569;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dUEaeNooPa6tcSsL3xwtdzg8KdPEfkRk+2/9muwETtA=;
 b=MGR0awhCta3ZDdjju4SezGigPhjWFOcC9jO09XORKsVpE1TCER7o5wst
 XIU9mN4aJwzxbCR2B32kuoeKbMYYN+OUaq3SI8hOK13khr5kAmYpfwVNw
 EPHKKzzuCilPNimEzVEaiERCTWO6Lyb0BR0OhJCA+Um7reR/OQGDgc4CO
 D31zrcwDl5Wu8TiTosI3AC/kb6MsyyUU2retOP0tXJhW4zQrV7qXHciFx
 ezzo7Ta22lyAZnwc/pdkbRZWmliTHB0dxpXmXjhRMkcm18sOnYa/U1qOI
 KNz7UriqKzPB0FbrxrWnQYDSnqvTgkhgQ1HlXrJoP13bprjSVftlMNenH w==;
X-CSE-ConnectionGUID: GVCJDyDBRQOGQPBrtumyHQ==
X-CSE-MsgGUID: BjRHlfSGTC6HtgvOka072A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46344975"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="46344975"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 17:09:28 -0700
X-CSE-ConnectionGUID: 4j/5jPBMT5m/CzPFRJ9ewg==
X-CSE-MsgGUID: FehtMjSfRfCkUInHQ7KJ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="131169220"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 17:09:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 17:09:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 17:09:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 17:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYyCRRVQtt2Ftpqs7Nby5eD3B1yQsWcE6hSDLnYgsXVONV+3ZIskPvXffYA4cIscEwJ5nfs9aPWn6JCC139WtbLAl3rNTUUMA9XPJl8NwRtlhGOVW+OsC2HfWLsO2vPhzGEOqkzsgI7yhk2GZ8/E/SjSDdq5s1tsTwQRfDspUmp3wbNnrfSE9C3/iapPSX7NKkwIysBlSpuYX2UJ3yO5uWWmKR5XYObxoPNhN8jAxooKpnc7wONVIqLjPeIdmDtsQBTGO+ObZrawUM5eeN5qg3Uz31Rp80hn+SGu6PJ7EcOVhrXmz2fDgKq/iIkVz8zoc7veezxZ65dcGI2P0ShyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuA6Hd+j/C8QdccE5rfKxGRov9m77qH1CfstMNl4aE8=;
 b=ezPEDlk/j6GmXSqT8MhUlHSRYpZzBTH2LTkcsNx9wZaNvE1jISOALJw5okEs4Hp5remFzhcwlp4BqtEM5TybMsiwBfTJL5pqHg7hij6llrr0L9GHD0qs4ZDN9El9ATVfHv/MZCx98lyO4gfdUlM4OWEBEixs3cEWM3TzFMvmk77xx5MBatmUWyzKtDaTFqDWMODMjXexFr3Of3muwbMb/YShdpjMpl/1646c2YqKjEnDrJiNavyQ3X9g9xS9f/+5AGdy3rNNQ33EN56QffxWBzwzVqkyk8I8Ca0Xn9NM0lJt5YNr0RnMBsYxKJSNlMmEwtsboXJAFTC1srIymMCPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF2D9C959A2.namprd11.prod.outlook.com (2603:10b6:f:fc02::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Thu, 17 Apr
 2025 00:09:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 00:09:11 +0000
Date: Wed, 16 Apr 2025 17:10:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 06/32] drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops
 to take an increment value
Message-ID: <aABG9l2fSSBIKHYI@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-7-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-7-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:303:b8::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF2D9C959A2:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a644ff2-c5fa-46ae-c891-08dd7d4414cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K5DArj2qKYAZIz97jzVNF0JfyeUWgiP4/P2sM6UPXs/quWJZzY+gGtD4LJba?=
 =?us-ascii?Q?Jq0FKz4d77K69T3pN6R1s74Zb8oDvMxcwPTRXWtcqqBo4tnqZ4C61fsivQWW?=
 =?us-ascii?Q?jz4qdcFnxIDuLWKL3eJxKKHoD9fUJPdFCMTAHjWj1QS8ANLY5At3wQFb6Mnt?=
 =?us-ascii?Q?U3E6VQ5m6oKIkTrp0HA2aLclwgltrOHY7m2+2OuOa5XZCp0bC/D7Jz7Ikdui?=
 =?us-ascii?Q?e4vL/I73ihj345sktM/kXadqFFUuSb/eu5Oa5InMCbm67akcPLYr4FQn3ssx?=
 =?us-ascii?Q?9/76zzho9pxrGyGkwumGndb84NQPhRXcJHnXqdF7mhBDp1su955rcMg/4RJ1?=
 =?us-ascii?Q?10rVnhUy2GjJEG9HqBCKeCzSNmr18Yr50ebeApDTl164FeJ+exTa6Qr1AilC?=
 =?us-ascii?Q?nA/cKBPGAg5ZjCQjPzvP9e0rUGHu4QMnMbcFRibm6lcwaD8/EKt75sSnjbxD?=
 =?us-ascii?Q?fox2f6FreXsvj2KsmxqgjBAOcqnJRFb9nhmaahnojqioUeEr2yx+qBHFQt9g?=
 =?us-ascii?Q?bDrw7GxdgOJfz36cPEVFT3RwVY09on/e2OmnzZOaVs5cY8DVsYs5YVD+llKV?=
 =?us-ascii?Q?tIo27CFBkvIEt5GPkche+TWdQse6EuJ1o9QzVZruV+dQp0OcuqcGOubQKR1+?=
 =?us-ascii?Q?zuqlLzQ5h82+Vljx2oy7K1XE1UQVf5D+3yylK9x97oYn+OPtaiU/2APIq3Bk?=
 =?us-ascii?Q?haPkxml/wAWXj6u3BAXUPJaxJmdDbnUYFpos8FZ0cwQ3CE4F4568hAexjxTF?=
 =?us-ascii?Q?svjnHUzSealw/soBLM9oBd6JH/h2G+ghFF6pSyWdWtfTRo513JUhrSpGSEur?=
 =?us-ascii?Q?l4ziRjkYxR/24rMMXebNJcZ7eQD3Fi1B2/UlKHIsWwNNynewMTJ5uHNnW8im?=
 =?us-ascii?Q?1ePzbnAHNy3bkeb55L/VbLs0GdzRGF1GcaSoi41NvPSyvQcVvE0VrEjqcLmB?=
 =?us-ascii?Q?8OkalhjdQ4v9gSl5aUCnFW9QoWy57tI8OIvoa11QVHx33DPbmkoXi8ZhzTgq?=
 =?us-ascii?Q?coV8Drl0R6PPrxJTPQFGh9mtmScAqxeWIQoDGJOe1A/R3XfBvzpzdmiu+ExM?=
 =?us-ascii?Q?IeINzcHfHDGsKG9Mk3oSdyDOialDnSoAJK/QQuhAJ68G+VKAkjWMQO8RTKck?=
 =?us-ascii?Q?Y25l5xoFHgtFbULlu6UsX1S0aVAPC0H9O/cDOalEELs5Xn4oNk6maC73DkUc?=
 =?us-ascii?Q?9UoB2GwUgwZmyvcbPsUI+7noezlg3j3e9Nt5YmZd4d46EB4a5BBAB7fqbMgR?=
 =?us-ascii?Q?PDaWafi+A+cX+z+BDq3lIw/eGqENHjJrGrONgch2LKPw9WsjkT62h22DcBi/?=
 =?us-ascii?Q?yb3Sc8mgqNW5WDbaMLdpXcW86TRgHkx2JVgh/MTXQipOc3TQThlAYtsSp8vP?=
 =?us-ascii?Q?6imS2c5XVFyCJPwTcxs33rKyAd6plRsCLwAPFC3FgXtFtWs3RybGU1KBw6ZM?=
 =?us-ascii?Q?tI5KPRyEcnA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d121VPm6XKKHWh+Z+m09U2FXMtUvM2Bhzs2ICR8CKo1y52HS5JNIPSfuy/OM?=
 =?us-ascii?Q?raWjZ+6YEcQS4973cgusfWgoZrtAtp+pnfWTRMshBcXbGWj4hRVLxLpqywc0?=
 =?us-ascii?Q?V1R3YQ6sVSuXf37DfUTfACeJgQZXn1Wi1pzmAggz06zQBy1+giPU3CmOP8Y5?=
 =?us-ascii?Q?iKCyEB4nW4lpoO3g0IdFizI9YtQH7GGSRrbzFyyvcSmYDEN35lA6J/a5WRbI?=
 =?us-ascii?Q?wHglCwp0lqv3DH9lgaIHuVDFRPL+FfIJpwaDSxr9iwmydD3L+DsHSHgxFMGH?=
 =?us-ascii?Q?mgF4d2K3AOf3kHxV4vl6L2IT8i2T1PjW+RqmSo0nix0iuzG9Ips4I+w+FzHo?=
 =?us-ascii?Q?iB5i9xAYGEN8IjJm1JtLXr8Q86cZ70QGaVUtLLqNDSMMCgXpqgW3g1ewBYW+?=
 =?us-ascii?Q?2yHzAbBmb9N3rAPDamrXwAReGnSgomxJsJI8aqlfJncOtMmKdIjcJtJk26dq?=
 =?us-ascii?Q?ZidAVOBwHpch0xfK49w9NdT7mlWDd0/taM8vMl8fX0XsYNFFRGXJc53Kly1C?=
 =?us-ascii?Q?KaXgIwUjnS+bl9uR48PeOrTv79dO4jQKD4glbgTdid3rWbiRhQIvP8TfSXUA?=
 =?us-ascii?Q?3zBoQ7CfC6o22B379Te1eZKe4ys4mArDOaSEM7+jFimZK7W4XzSzSCMgPgZy?=
 =?us-ascii?Q?X7LnTP9oBLWOXddOJajy8/qhtMOTv9gujGxcqPn/6YUd9bgfVDmEYtMTmjE7?=
 =?us-ascii?Q?a4arCK3/WvUiLqlLWEUeSvtmcmuxNPWzgO+NkS7iyBAk9tSoVDT7B4tvJfDO?=
 =?us-ascii?Q?W2ajskVH+kbxC3l20fsns3APFScQvfqYT11DOVL7Xl33iYIRXalGAfzwhFUa?=
 =?us-ascii?Q?nxblkdgmz4nMGKhbpr2UiqRf6w6LGKJIIw9gRr5edxCZI7yY7yEck5cAzjhc?=
 =?us-ascii?Q?I6fXuJkfGtliLQeTH/znfW5CfgfCcp2o+e1cMGI7numwquMV9x2ndB4f2VV7?=
 =?us-ascii?Q?H3mWpuzy9+pB1OWbO+v+L3AasimjhxEtUHQM1DV1/0j5KBwU3igwtA2Egno5?=
 =?us-ascii?Q?LJodqVwwsuz+0O+/WSmgKUNECJGN1l2Xo1U4s3aESQRY6aK6woQ3taRDu527?=
 =?us-ascii?Q?RjnX/lrhpM2cdS0ituXjuxMOAEnTtVJN59N1wc6w9D1aESkQpelcXrvir2NK?=
 =?us-ascii?Q?irEv8Kqaj44Cvj4ScCIs4ZVAa8qMjZTtLQZIJovLEZCH2hkOjZHdZxAb3Wrf?=
 =?us-ascii?Q?5InwyuQ1ikIdB3RpwpN4TgtnP4XrbIOB6nUtefgfO9eCKQp/gnm4zyyO391g?=
 =?us-ascii?Q?XY4RboLXm4h74GwlXhtqIW2/hRTh7VShE+EgHmmfICil/J6y4MX7RGe/U8n9?=
 =?us-ascii?Q?rSwlqeHXoSZMH+XxGy1WiGkOStcK++57Pl8n1lb72PCZkAxKcyZcqeoKmBfA?=
 =?us-ascii?Q?TIrgNhNXHMkB6MxmKTYzzSo+UYCsHU1sAr4xCgo4eDZ+RqYY9d1tnu9AA/zd?=
 =?us-ascii?Q?CGl+9XJXObVQ23e2llzz0yeKwpmEy0mVSCugB9PiujAm6C2RneHIBeK27xz3?=
 =?us-ascii?Q?b+gAzrAzH6w/ug/TrzyFil1v6Tka2ugrKnKCZAcbnJ7r3lQ8+NSg9I46iHnT?=
 =?us-ascii?Q?eWTvEGA3fyRwXrJi+Uk1ha0KrduPa5KcTn7RsWqC9zZrKce2AbSB2757osXm?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a644ff2-c5fa-46ae-c891-08dd7d4414cc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 00:09:11.8460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bx5Qswq1DZ7aZMl8+P2sxvu3tsND7zBRf4cISn0SHht1+pFCLApReaSXfurtZqqoCUCDYSQVS45pX+u99FdDfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2D9C959A2
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

On Mon, Apr 07, 2025 at 03:46:53PM +0530, Himal Prasad Ghimiray wrote:
> Prefetch for SVM ranges can have more than one operation to increment,
> hence modify the function to accept an increment value as input.
> 
> v2:
>   - Call xe_vma_ops_incr_pt_update_ops only once for REMAP (Matthew Brost)
>   - Add check for 0 ops
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0c69ef6b5ec5..4d215c55a778 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -806,13 +806,16 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>  		kfree(vops->pt_update_ops[i].ops);
>  }
>  
> -static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
> +static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask, u8 inc_val)

s/u8 inc_val/int inc_val

or maybe u32?

Just debugged a problem which the compute UMD + prefetch where the
inc_val was 256, thus 0, so the binding step was skipped for prefetch.

 

>  {
>  	int i;
>  
> +	if(!inc_val)
> +		return;
> +
>  	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>  		if (BIT(i) & tile_mask)
> -			++vops->pt_update_ops[i].num_ops;
> +			vops->pt_update_ops[i].num_ops += inc_val;
>  }
>  
>  static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
> @@ -842,7 +845,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
>  
>  	xe_vm_populate_rebind(op, vma, tile_mask);
>  	list_add_tail(&op->link, &vops->list);
> -	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
> +	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
>  
>  	return 0;
>  }
> @@ -977,7 +980,7 @@ xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
>  
>  	xe_vm_populate_range_rebind(op, vma, range, tile_mask);
>  	list_add_tail(&op->link, &vops->list);
> -	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
> +	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
>  
>  	return 0;
>  }
> @@ -1062,7 +1065,7 @@ xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
>  
>  	xe_vm_populate_range_unbind(op, range);
>  	list_add_tail(&op->link, &vops->list);
> -	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
> +	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present, 1);
>  
>  	return 0;
>  }
> @@ -2493,7 +2496,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			     !op->map.is_cpu_addr_mirror) ||
>  			    op->map.invalidate_on_bind)
>  				xe_vma_ops_incr_pt_update_ops(vops,
> -							      op->tile_mask);
> +							      op->tile_mask, 1);
>  			break;
>  		}
>  		case DRM_GPUVA_OP_REMAP:
> @@ -2502,6 +2505,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				gpuva_to_vma(op->base.remap.unmap->va);
>  			bool skip = xe_vma_is_cpu_addr_mirror(old);
>  			u64 start = xe_vma_start(old), end = xe_vma_end(old);
> +			u8 num_remap_ops = 0;

u8 actually works here as the max value is 3 but I'd change this to a
u32 or int.

Otherwise LGTM.

Matt

>  
>  			if (op->base.remap.prev)
>  				start = op->base.remap.prev->va.addr +
> @@ -2554,7 +2558,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  					       (ULL)op->remap.start,
>  					       (ULL)op->remap.range);
>  				} else {
> -					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +					num_remap_ops++;
>  				}
>  			}
>  
> @@ -2583,11 +2587,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  					       (ULL)op->remap.start,
>  					       (ULL)op->remap.range);
>  				} else {
> -					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +					num_remap_ops++;
>  				}
>  			}
>  			if (!skip)
> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +				num_remap_ops++;
> +
> +			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, num_remap_ops);
>  			break;
>  		}
>  		case DRM_GPUVA_OP_UNMAP:
> @@ -2599,7 +2605,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				return -EBUSY;
>  
>  			if (!xe_vma_is_cpu_addr_mirror(vma))
> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>  			break;
>  		case DRM_GPUVA_OP_PREFETCH:
>  			vma = gpuva_to_vma(op->base.prefetch.va);
> @@ -2611,7 +2617,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			}
>  
>  			if (!xe_vma_is_cpu_addr_mirror(vma))
> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> -- 
> 2.34.1
> 
