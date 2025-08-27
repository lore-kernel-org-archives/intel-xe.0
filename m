Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBD5C8303F
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 08:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6A710E0AD;
	Wed, 27 Aug 2025 08:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhZXof2q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A650610E0AD
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756282562; x=1787818562;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d92Ic7QigZaQxcnY4v23fFpXG7ciNTU8p6ctZhC4HrI=;
 b=IhZXof2qzFpQorchbtpdBvDeHIwJ7pfHoBvIk92D1GAKdZEWrwQYOLLt
 i2Z9mB+BRm/9M/D32uuAsOvcSx5Go79hiWOo8+7Gt+MOkXLey1DsK/JZ+
 KbMJhvdy/R15Hkm/GLTypnC/W7fatQ2IA52aqTpENl/H4H8wozcDqUDec
 G6SABtKZ+mmJMmhpSbzMAPRPKRoVPW3HKY54vF+TBHcU+X68VrBwrANiQ
 NH4filmXX/yY4PfUqGe9eG/GUIhMZ0cdstdPi63yptQxr9ysgRuYajQfo
 KIyR6ohBVifCoLqmyAxgVSAnETO+b0fAJfjAYqomY/AolojMjrGlCyjKB g==;
X-CSE-ConnectionGUID: huibIUxASjK3O8Qt9adaEw==
X-CSE-MsgGUID: zmTpiZ2dTC+YiITqG9tDLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62367995"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62367995"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 01:16:00 -0700
X-CSE-ConnectionGUID: OtVdAsJnQuacVuCIZBhWAQ==
X-CSE-MsgGUID: QfD29UAEQ3qC9bd8VRjnBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170610689"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 01:15:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 01:15:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 01:15:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 01:15:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FboFchNopeAzbJoEQu3VDDPu9HcHyGOwLAgwUbX8RUdzv3HMajLrXTasPEGZrRQ0sA7HTeCe6n+RtFudWDce4NzVIjP73AHLqwpXjOTAyltoQMjxjXG8kI/+J1w+Eft3KcTQj62/v3YcmZeQxdEz3MsH5UIJrBu6iC9hfqX8elDLRs/0AdkNhbg8OL6CLNOmDemKLW1SGu0W0iCWCYr5q2yDrL8Q9eOAKx4nv2yvPUEDOgZ7XIcLs36ytV2Twkmx+ocn4wLvALDLlh3Zr5Ly5wMa6GjoJCGRn/OnluFND6pIP7AHYa4VU3HsC6Ydwht3A+8fB7jhKRIcWmy1WUVC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WP9q2lz6CW6qxjVhWvLvcuu33K6qOdozhyvj0C7ffw=;
 b=H0N9egk8T83RXFBwCDE1Qv4vZ4Adz7dbCvHWGyIRuPqJU7bnaWZLeMKp1KIfb5Q/KnubLqR5Uu05m+fg/bnZMZsvyaWfPPIjZlg9TuJV9CS1IVqPRtCI5xh9KDmVftCOHy27itSp41zgj/a/O1p4yIzYCKtPNRsSyXaPrFZHHHdFJX07tUaGzM+XXeBfWP0qImyIVu0x0XXsCwRbG2tNYmoU84btgi9LjMnv9QaqXoJBjgwfVQVSnpCOLl+jIUm06TvvoI3osjWvpt6UnMumwcAGqw4R7vOfOYlxkMpIi7xeH6Th2eq8dgnDVnViPXnxOgqKHKsKt+6Tt+fAaw2G+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CYYPR11MB8357.namprd11.prod.outlook.com (2603:10b6:930:c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 08:15:54 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 08:15:53 +0000
Date: Wed, 27 Aug 2025 10:15:45 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/2] drm/xe: Add clear_stats GT debugfs
Message-ID: <aK6-ntsAhglOn9nn@fdugast-desk>
References: <20250819185349.2837153-1-matthew.brost@intel.com>
 <20250819185349.2837153-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250819185349.2837153-2-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1P194CA0034.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::23) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CYYPR11MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: 3143c855-97c3-4bcb-5f28-08dde541f11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?haFfcjEHwFl6jyPswT03nQGh6qO0IfZsuAF3AozzUfqfIveZDvlyeBxaRUNF?=
 =?us-ascii?Q?jiztuv2XpFG1aodHxc/Yzm09BaCcmKysqOyNT9UVpOJsqy8hFilsCmqOE6aZ?=
 =?us-ascii?Q?stuSmatG4wuuOPbhCDJ9KLCA96eDtm9SkIOAQBoswbAO86WtlpLvtGaRL9lO?=
 =?us-ascii?Q?miaD8+VlDnhGQ/jUpU+7qmmGCRKEslhL2WqW98lxaNpdgG0MOa+dn+M10pOE?=
 =?us-ascii?Q?5KVIilfIO6JdK4qhvXx1hr0fpqxbGeQyEKcCMHYg1sPTUhvEzfCZ28urPgTf?=
 =?us-ascii?Q?Hb/vG080RyxhFXEVOxA6whOgj21RuWjAa26iLRQ9q/erq+QJZ0Mu/U8jDVEe?=
 =?us-ascii?Q?3uAXkn3PtA+bYoJcJWF/PT8aNU239EWgsoeBPjw+NnpfA0Cwpa6ehIrcqM9M?=
 =?us-ascii?Q?FhXgIajPoqfuQapfGGX7mFppD5MP35XtADDTng7kq1dA432OIQAA+/GSWsAA?=
 =?us-ascii?Q?ch6j2LUH3ZDxZ78A69hQJMVmFJrTS+HaLX/eNSII8LJ+8vk/BvO6902XsQBh?=
 =?us-ascii?Q?OQrh0Q6FrX0Xw3bwShBYCAsquwh9SeI0pamJSMt06NK44YkWbW7dqg0mfg5X?=
 =?us-ascii?Q?hR1V3SgKrNAtxzJGvL0gwZx97DKjhjJwE4PT1c2z8O4LQiGtbAj8ZYl76a9A?=
 =?us-ascii?Q?456s2qKv5xc1QAFgEKJmIZkmyHmA3UDNcJuDVEuPvOOTMCLSEUHt+bYQNrCj?=
 =?us-ascii?Q?qwnhslSfswdf7JSDHWK3inzx+ATCJnowQOf/3RlCt8Sx3Zxnzd7yWtPq95A9?=
 =?us-ascii?Q?D6YCCvYYPnw0O9GCTc3NafvhESmM2ILiylUqUNV4JHx26t3UKYGRfVHm6lgk?=
 =?us-ascii?Q?iv5B9duduTEaZY3AOj/yoEM4M/zYXZTP/3loCaHBYhzhG1gjt+hHREsYadA3?=
 =?us-ascii?Q?fVWSYMf6p/weMKYnA7ZCy1DrcG74VEfgIbGrnHfIkIeg/2wHDxRmaWNTsspi?=
 =?us-ascii?Q?6zJP7WW+SRCn4VirXbeqAla0bTtxG5y30jTqNPfCL+fOb1cd+HCXgxQcs6bC?=
 =?us-ascii?Q?R6Y+EGQVQPTog/R9SSxXioitgKdh2YhSJ+7Qz9jHMlxAzYwxD9glgGYx+fQW?=
 =?us-ascii?Q?f8GoHl/okzDgt+GGuJx4vAJDV3KE9LY+vdXqnqDq2O6niQ3INERNmqcjnjRt?=
 =?us-ascii?Q?T3XmzuN4y0vvKYgZqZJGgKi9PCxDBp7VdCgFMCwoDFxVYgBFNU8NyPNoye9t?=
 =?us-ascii?Q?a3VgcUzMdBSAUOb50ED4AedOJJgb2Dckn5u3FfEINtXC92871D9WJ/b3bSdg?=
 =?us-ascii?Q?ijy6e55ep82LYKTq1Yi8bsCJyKM8xShx23AVbkS/L3gUjjjdluyI2PmxeB0y?=
 =?us-ascii?Q?A66MubPLYg5RcI/uSuxXflnHcOoaQVtqrXxo9ybrEtD29aXzfG5DTweqSPX5?=
 =?us-ascii?Q?3Nes4kNSkEObuedAJ096GygwpHVTLTDv7cO4nL+kluP3FmJBPqobKmAYHHOt?=
 =?us-ascii?Q?dSVYqxPya5Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7lJIGIo7bVVKe5FC6pUB7ruYrRnA/D0kRgrbb7Tga2Sb9BLMK8FyQGQly0JI?=
 =?us-ascii?Q?301rTf75hWorg2EWVQt3klDfxyRT8uyu8Wvok3cdYYgV2X4UAkHISzQUu8Gr?=
 =?us-ascii?Q?sfO43M5LzgNgLGwa6lopEQo7zCaAS00+oSpx0NbCa4BOVSgmWRvFlKbmEksx?=
 =?us-ascii?Q?xRmuoUKTRZtL49mjpHpyiboR/dUvwyU12Bl89MPn1kFsmxSlvlEFW0mf7UvP?=
 =?us-ascii?Q?EbpQu223gNBjn2TQlzBUfBoOosO88LBb++JFJW7Gotjz+WBwbJ9AS2vkibpi?=
 =?us-ascii?Q?p0Hq+nnbcm2pakXIeM9MRQqpA3ccjF4GlatCuntzjP2KOr1q8Vjo97QHZDHU?=
 =?us-ascii?Q?j82bYlgfc0AkZJiHdA1YjCEvdOoWtKaNJRhI3zMzrAu6DWO7BzIaQxfMGsbW?=
 =?us-ascii?Q?2GouZKI+bhTSRKE27HlLid/bDP8Nkagd2kpOQy88zrro0tLp5bzw2hBopdQ5?=
 =?us-ascii?Q?kSBn1Ns1Wl+aowf1s5WHrOjlscG+9U75E4oPdzBVLW/CoS2P3h5fA66E+lW2?=
 =?us-ascii?Q?Is6sQWFJfsbEQzSwliVFWTMiK/2LTMDXXZkVAhicHlrx2nWnhAV+2E8EzWT0?=
 =?us-ascii?Q?MvW+NAVL5DG2I4WjpPC/ZRH3nqtOZw05oR6bIeJpBfr+YWoDwvmyYic+tKw5?=
 =?us-ascii?Q?15C0Ekr45rEcwK2yCfWxww0A898q/7EvwxnFc1nidkDoM7K/pinM3EAoWb/H?=
 =?us-ascii?Q?BW/+KW+Fe+tuqeGpux2bD+SIoXJi8Jlwx/jQiWyCQmmXa0NTialjR+JSOHTZ?=
 =?us-ascii?Q?NThJVaTa9PRv8hfQC3XrAFmVwmVc/NoBGZFguG0686QPcPFnSzFY2MTMynyU?=
 =?us-ascii?Q?mCBPp0GvyNzPgBacJ0xaOHbPNtoHsGodQrddepg8TDJxMKXstsH5uoRXwklZ?=
 =?us-ascii?Q?OifFeNSpQaZSZtoeprEFvwurAPYVNkgiLUI05M3v4he0hCDObAzwhaASCQBZ?=
 =?us-ascii?Q?vltUB5qLtRGFyqoaFkd4/GGt1yTmSuwxMGgLJZ0cuxFdA6LvDKBMNTWRiKbZ?=
 =?us-ascii?Q?fhKoSXDmCrGt59YG0FpBC9VQSx4biuKsLPvB0HHT9pP4xfCk5VSmi07pV6M1?=
 =?us-ascii?Q?/VPiFSKcDo5LQGn3jhu2SKyudErkFwXJUmAFv9L682+kJSDCID1tE1dUoSRS?=
 =?us-ascii?Q?nNSRzExyiQuzc+Xcn5W/aV9f2V1Fgzsh24nhAHXWBqzk9dxIMg2JMSUZGQNA?=
 =?us-ascii?Q?7gmT4oUkdlrswb3AsBQ3WoZezyhCk4OnYD1IFg8b1fL2liyKUdoXaWTBive5?=
 =?us-ascii?Q?ylDkQ/eAfk4XQ+Bs0c+cB1NXII+7ZzowlMvFj3+4xngrNQVJ/Mjd/WQt0bBN?=
 =?us-ascii?Q?WmA63Hff5Mvwz+ZkUO8BC70e6eGYmexZiCLNlqsTdDMvjudniHQJvDviksfH?=
 =?us-ascii?Q?g+NB2uB185sGhRHTWZYtki8/qUxmXlpUgqibxvolb4dhbdmiLEydMPUYb/6e?=
 =?us-ascii?Q?ZZWAk9zHy6A1kCbO7cWkRNWEzYsjW3F9O+VvoQj94X0kpJEnsp0W055iiS9I?=
 =?us-ascii?Q?sqOHO1HbtF3UpBt4x55uHENaBWMjDPoWBsDS2W/SSi0h2X+dVd4qMNosjpfP?=
 =?us-ascii?Q?dUGD9UKXkxO6vU16XkYap/zSHHqDu9oF6p39cYtm26xRi5y/AHlYIX2B/zNV?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3143c855-97c3-4bcb-5f28-08dde541f11a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:15:53.9011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKiz03nS5n4p8aRo2zTjUVCp4vFXsIQI/4e3cgN/VukpFdrFHsyOfrOnUJFlHPWmxxvLihyf+LT7B3PX9pQaCUHCkqjAjDnH0SPE8DfV7iU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8357
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

On Tue, Aug 19, 2025 at 11:53:48AM -0700, Matthew Brost wrote:
> It helpful to clear GT stats, run a test cases which is being profiled,
> and look at the results of the stats from the individual test case. Add
> clear_stats GT debugfs entry whih allows the clearing of GT stats.
> 
> v4:
>  - Make clear_stats write only permissions (Himal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_stats.c   | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_stats.h   |  1 +
>  3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index bf3a67b5951c..2cd14b36c75a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -363,6 +363,27 @@ static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t
>  	return count;
>  }
>  
> +static void clear_stats(struct xe_gt *gt)
> +{
> +	xe_gt_stats_clear(gt);
> +}
> +
> +static ssize_t clear_stats_write(struct file *file,
> +				 const char __user *userbuf,
> +				 size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_gt *gt = s->private;
> +
> +	return write_to_gt_call(userbuf, count, ppos, clear_stats, gt);
> +}
> +
> +static int clear_stats_show(struct seq_file *s, void *unused)
> +{
> +	return 0;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(clear_stats);
> +
>  static void force_reset(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -448,6 +469,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	root->d_inode->i_private = gt;
>  
>  	/* VF safe */
> +	debugfs_create_file("clear_stats", 0200, root, gt, &clear_stats_fops);
>  	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>  	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 30f942671c2b..7e12fc3759e2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -50,3 +50,17 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>  
>  	return 0;
>  }
> +
> +/**
> + * xe_gt_stats_clear - Clear the GT stats
> + * @gt: GT structure
> + *
> + * This clear (zeros) all the available GT stats.
> + */
> +void xe_gt_stats_clear(struct xe_gt *gt)
> +{
> +	enum xe_gt_stats_id id;
> +
> +	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
> +		atomic64_set(&gt->stats.counters[id], 0);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> index 38325ef53617..e8aea32bc971 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> @@ -13,6 +13,7 @@ struct drm_printer;
>  
>  #ifdef CONFIG_DEBUG_FS
>  int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> +void xe_gt_stats_clear(struct xe_gt *gt);
>  void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
>  #else
>  static inline void
> -- 
> 2.34.1
> 
