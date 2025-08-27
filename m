Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129EFCA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 19:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD01710E893;
	Wed, 27 Aug 2025 19:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lipeVRZP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289F910E893
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 19:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756322064; x=1787858064;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T1VvQhbPwT7+xsaCHK1tHxnowgQdkL9c3xWFtTZEzp0=;
 b=lipeVRZPvX2aV5sIXeC0NM+4ecvmOTeCSiSZth8Mp+9LX54Wu3vvUfnv
 Bj0dYjS4TjM4QfI/WmiVwtfe+rQgLQs+7NSty9Z34TScnk4iSy5sBmRUt
 YDVdo0n1NEixyFbRZRS4N1tTInHgMqmeWExyi/0t8xzL7KOX8QcsQ1uN8
 QxqEiBN3SkBlX7lXs5qKqSHy4ZjSNvzLJchI+44id8S+FyabALcz2yKHb
 2EXs/DJQueVyJ/cQecukb19Q0/xAF4/I3oLbQAjgZZygormE2IccGlVWU
 tCc6807Qr5db71Z4VT/RGsEeotTDugbVQRV4Cpi8rM5jzF68IcAqDSDSM g==;
X-CSE-ConnectionGUID: dKWQjShDQRO1Q7NUc3AKdQ==
X-CSE-MsgGUID: rSGHyUvpTqmcwBBpsqtf5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57606743"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="57606743"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:14:24 -0700
X-CSE-ConnectionGUID: cUnyccY/Q+Gqj159quHdIg==
X-CSE-MsgGUID: LIf83f5yTImgcIbZPOtIiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="200864533"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:14:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:14:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 12:14:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.87) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:14:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/0873eOlfIOMe/jhwan3Cms/16tLVAvqOFuQdnt1aVXRQ/SDqtyz6nbM3SUV7131cSAuzDieODWDLe9YTy3oizhhKj1wZCfmpsmgGkLd87AxPxMfU5K2kMTthg26ZXIzxylftiflLW6T7EouDSapUCaL8cEXJkN56rp9RIS5Ja+oO6ntk/OgDq0g6iU+iyQzufwG9YrSpkgAb7ctjqk3wb00mn+60WKe03aZWkZ6VROLwPEm7v+Fhy95jzcaTbOMVzeLkqrUeDpajZpHjZD0L8Hi5aXoge8jGixOniVYnzCGYIqxBECP4NWXbMSlCUSoih9Od72GcFGf3LGOOaHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ17xQc4rlncRJPC9TUmfpSkqhmdpFYS5nK7AdKDp7I=;
 b=FMD/UyyEYURT+Umlc3FxVEsKFN1bJzaj9+T9q6wVmlOXDUePpF7dBdaE5zRefNeOfm+D6Dub7OYcD2S2Gsaio8n1ci1sXbTTB/e5/wo7pr6dTJ6uhbgBpFNY8HvxuyHYGzpGtziYnJ5iiyB2ju5gzgDGS8E53xpqDyUzbiDCAvb9JGSTQPg5Yj6WZlcNfjFcROtefnqtpHmPLU49BN5yNd9UEQlC+ygsMPxxJN4bfee5//KRyDjg55ltixoBhnbimRa0DFpW2MTiwT4NbaynU6B+euofrPHWiZlBIp6p72dg/b4mx4JLT1cFUhUACRbuRhgTyXAzmj5CKh+rG+n99w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 19:14:19 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 19:14:19 +0000
Date: Wed, 27 Aug 2025 12:14:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/2] drm/xe: Add clearing stats to GT debugfs
Message-ID: <aK9ZCD5XGea5VavU@lstrano-desk.jf.intel.com>
References: <20250827184352.175550-1-matthew.brost@intel.com>
 <20250827184352.175550-2-matthew.brost@intel.com>
 <50331fc5-e234-41c7-a724-74972c6c87d6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <50331fc5-e234-41c7-a724-74972c6c87d6@intel.com>
X-ClientProxiedBy: SJ0PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a248db-84c8-4314-a1c6-08dde59dec68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J7m++KL3xvduJdN1vUI9xSngTKo+csQYY/u33pL+DOi+yj6HuFZqWpOa2vi6?=
 =?us-ascii?Q?j8r5yLrxB3zu0sEf72l+SYXzy4qqM5uCG+Ad4ikxuECGX/oGzc5L+5ZlDCbF?=
 =?us-ascii?Q?c99p4WYahMML80jVLGBu6qKWHfqmoTSNm5xoEQ0onb+ikwcrmuauijZVioyo?=
 =?us-ascii?Q?CdTyt8nczXoNe7YMprq/gGpi6eDm5EE6nYyVXTH76ItVj6V4Vv3P5J5d/bpw?=
 =?us-ascii?Q?u8I8PCkvPwLQ7L5kSqKGVCa7J1NOkAnNQTwgxsW6y+Ka08RbT2b73DUOB3UV?=
 =?us-ascii?Q?kf/T60CaQA6F+B00AcvP8tdQ6DsnSuadedoFaj3s/A2scpDBq1sUFLaQXbbE?=
 =?us-ascii?Q?4dJ6ySTCha4/dApktkdk8i+JFUDAhlGOXkbuK+kIQc9DUhcEwaQYp8O133FU?=
 =?us-ascii?Q?9xLdfEIVLmkdhk/M8np7UJlqR2APu1G/ri7P6rcqOkgzaNglAe1JnR2oL4ND?=
 =?us-ascii?Q?rO9A6LC9Dp+3l1ng7QJWhRQjPdVcOKryFN9PdYaq9znPyNhP210xA1DCmjbg?=
 =?us-ascii?Q?gdMqbEp5qrgod62SB9mIYtkRaTcSkrpZwThBpPGC32c3INLzq8aG6E2lVJrK?=
 =?us-ascii?Q?8xFuSxgbPMdBXm2FN44Eqsdz4RP1EmQoynsBwrULgpkQw824R7l1Rp+xYQrk?=
 =?us-ascii?Q?BJFM+AdOJNvkgcwhSap+uGslxFa1wda63cuc3EDxAbo/gR40J5UnmtihuvAt?=
 =?us-ascii?Q?AuU8o/ZG3fjEHfSO/GqwG2k2nw6Et16McqIV1xBNXKU1kpV3/wAh+NCe/F/Y?=
 =?us-ascii?Q?YhPplhY0J8BYlzg1jVdGV9yh9lrEDDq1BSDnKd1qKJaaBN4OJnTOUZzx9KmS?=
 =?us-ascii?Q?gw0/fwmzUcBumF/YZ9LN0NONmUSIc/Oh9fOOECT6UmI71S0tsAKmbJyySnQ8?=
 =?us-ascii?Q?CAr9vDySqrUweYHqtfeLDA5ptyiAxkmEOtbD/zq17h2JWdBUEHLBBwNBTfM2?=
 =?us-ascii?Q?N3hfJTMxu662v5lGiWtBdTJd2QS5/tOiQP9Pd9Lw4wL6XEY7HFz19cWLhs5M?=
 =?us-ascii?Q?hadD5mo2XtbBFxHs+tsOEiwZl3uLRBt+AixGWTVvcupHJoQExx3IK2ynQZMZ?=
 =?us-ascii?Q?uZlubB4ETPg+d+LzxaYjTW1KmJsg6QAy8W6UwgUz950QwaQCorSCw9Q2koNM?=
 =?us-ascii?Q?HdVx4TYKpkHsAy6XJVd9d52d1GMz6RDG6s8gLSFtaV6OnJRcdh2lc0pLhac9?=
 =?us-ascii?Q?gZebCIQRqFFSD/lvTnIMgcBR3tJJ2BGFhm8GgeoJMx+67xelQH+BsMnr68pG?=
 =?us-ascii?Q?YGluiLeMwkgO6CqHHlQeQvht1nrDs24h/zI3YVlwDixf7KbjJXnzzmQDSRP1?=
 =?us-ascii?Q?iINWb2NVmzgKi0tENYwInpDuCF2Fu7yiHKuWaRPsQUAlFl+UK2l1SiXQrAHr?=
 =?us-ascii?Q?WBVaw3/aXjXZiqdSAbA37Glj5Bb0Ty97xNa8+bTBOqiuZyrMHBmR561MFxjq?=
 =?us-ascii?Q?Wz2vqi75LkI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HQtQHd12rjQPcYyzdP5iX64uijd1zXUA9gp96UvRT035JAWS8Qm3Fv5wwaVw?=
 =?us-ascii?Q?j2R4RaT0IkXktkvKGvLh8EvpnSIaJ3YY22dIxgS19J4lgP+jSG786Okn16VV?=
 =?us-ascii?Q?3YeiZjdSbT0KMmL9Dq4t+2w7YiHL2wv1HhjUGXlmsc1QZAKUZcAhaJkDXbrJ?=
 =?us-ascii?Q?v+kGO3uudtCyvKf6296xGKl3lB4QlQ8A4xx02xHs67GKYRUX/FVa8bhjhsLL?=
 =?us-ascii?Q?6Mo6On3+ZitUSOHptI2yoluvvQfeJQHOeIXHKsQ3nk/GbwKI1iMX3UffsShp?=
 =?us-ascii?Q?WXzlKjqnorXZzlA1ueZJBul444MmOTpj/MwYxq1beFZSThKx1tqwmGn58o32?=
 =?us-ascii?Q?GyIPzsFpgSm2jQh8nwUr/OerMNiGf5hDj7KvW2DidIMJUEIH1YUkrJiXgxHN?=
 =?us-ascii?Q?Nqt+tnTzZxZ3m1dUKc3uU3so/k9c6/+xqzqaJJst3nIWDr6IH/S/hj8WUX76?=
 =?us-ascii?Q?P2ax6pB45ihlQzroorSnkk+EdWqEEaPFpyRDvRWC+q8nBnEK198SmpBYuu7m?=
 =?us-ascii?Q?kSMRG12Yf3ahZWGC1ggnDexY68kgaGqIr9OaFQYwP7X3NKZ2c4bnXuJua5KW?=
 =?us-ascii?Q?m4Sg+Rf/znORbjLg+sQAdwxO+NPidublANsCSeuSnhzoV1LoeH1QbUCYCRpj?=
 =?us-ascii?Q?HPz22X0CCHoUcpDdE10LTaXn+c8vUSSggAvT340Y0YiRRhGIj7odHi+nltpW?=
 =?us-ascii?Q?3liJqYHYtcLEYdXisVaVvByvxVeBESgdNWODL5t6qdzEuXWE8UoriisJzzYR?=
 =?us-ascii?Q?6BYngQO26+TXFFyEGMFEzort8U9RtecQYXClkc2apO0eM56GaimN+xUziZFt?=
 =?us-ascii?Q?zwI/11rxJ9n++4G0L8V3GMzX4aoOAglSnzcfcAgiGzJenWkzeKnE8YNBxvrm?=
 =?us-ascii?Q?yMaBVEAfNLFT+hPG0cFqpH1QybnNL6M1oS+ZuXzsK7VhDMYSM3Ixxs4ydL9K?=
 =?us-ascii?Q?OO+jRTCZ+VWlMmWfCmNqkNv30uaHB1+iw0S2r6tcjRfpUFRsGCuXJ7tUo5K5?=
 =?us-ascii?Q?yIDo3tdfPy0pQWVr3rol3XL17FSRTw6ilQ2O6998Z7HZihedgJQGBdu8TMpH?=
 =?us-ascii?Q?rqYzOcxc6MCCGGXytH9tAgatKwJhlEDmGkmgM3rZ/VF45b5jDnXDACce6MoO?=
 =?us-ascii?Q?souMDUZQ/lmn5c2qA/XVKPu12rolweW7QXLPJobZxEUej1G854edXun1us9i?=
 =?us-ascii?Q?bQnwM5bOBV/UDnUzujAzf7Q0WGEbPVsujT+UNpCpb2BwdO67kPUIEQzaVXFP?=
 =?us-ascii?Q?88NnPh+G0N94qzz7Jym1GXfCebGVDYCdp98hZcmC0jxO+fihe24owaVF4KgB?=
 =?us-ascii?Q?KJFtFQiM6IByMc/Jj5hyWTEsAHjiM+pNBmmztKEkCNpkqVx1pcXi8sT7LF0m?=
 =?us-ascii?Q?BjVdNC75DHmbdRPNtAJdGQdRoDaHuGXFFXCpQJoxYop6tdpVBjeqo9LWtdDz?=
 =?us-ascii?Q?UZI3WDQh7vjrTTBMIUj0m23seVfukkAdBTyEo6RJn3pFIcuwnZn5zM2ksFhl?=
 =?us-ascii?Q?+CVcaf+OeMkEVhbH6bjes0Pl8ZlnHmyDf4hxkT62MkBABn+G4XH2ftHh7y6L?=
 =?us-ascii?Q?1oedPINLNTXRXMa/DtYxxvvpZD/k95ZlgDhKbhNbBFqoYnvTVv9/D5GYDiE+?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a248db-84c8-4314-a1c6-08dde59dec68
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:14:19.7208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bkRsFGp53j+PFtSKlacTi/MkyiCrCbK6UP/ptTDNOjDpwO6chN96iw+sN5pZ6n7aHNlduXZa8/lQ8TjBHP34g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
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

On Wed, Aug 27, 2025 at 09:02:26PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 8/27/2025 8:43 PM, Matthew Brost wrote:
> > It helpful to clear GT stats, run a test cases which is being profiled,
> > and look at the results of the stats from the individual test case. Make
> > stats entry writable and upon write clear the stats.
> > 
> > v5:
> >  - Drop clear_stats debugfs entry (Lucas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 25 ++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_gt_stats.c   | 14 ++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_stats.h   |  1 +
> >  3 files changed, 39 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index bf3a67b5951c..0004f279dee1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -327,7 +327,6 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
> >  	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
> >  	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
> >  	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> > -	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
> >  	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
> >  };
> >  
> > @@ -363,6 +362,29 @@ static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t
> >  	return count;
> >  }
> >  
> > +static void clear_stats(struct xe_gt *gt)
> > +{
> > +	xe_gt_stats_clear(gt);
> > +}
> 
> not needed - see below
> 
> > +
> > +static ssize_t stats_write(struct file *file, const char __user *userbuf,
> > +			   size_t count, loff_t *ppos)
> > +{
> > +	struct seq_file *s = file->private_data;
> > +	struct xe_gt *gt = s->private;
> > +
> > +	return write_to_gt_call(userbuf, count, ppos, clear_stats, gt);
> 
> why not pass the xe_gt_stats_clear() directly here? it's the same signature

Yes, let me drop this.

> 
> > +}
> > +
> > +static int stats_show(struct seq_file *s, void *unused)
> > +{
> > +	struct drm_printer p = drm_seq_file_printer(s);
> > +	struct xe_gt *gt = s->private;
> > +
> > +	return xe_gt_stats_print_info(gt, &p);
> > +}
> > +DEFINE_SHOW_STORE_ATTRIBUTE(stats);
> > +
> >  static void force_reset(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > @@ -448,6 +470,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> >  	root->d_inode->i_private = gt;
> >  
> >  	/* VF safe */
> > +	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
> >  	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
> >  	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index 30f942671c2b..7e12fc3759e2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -50,3 +50,17 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> >  
> >  	return 0;
> >  }
> > +
> > +/**
> > + * xe_gt_stats_clear - Clear the GT stats
> > + * @gt: GT structure
> > + *
> > + * This clear (zeros) all the available GT stats.
> > + */
> > +void xe_gt_stats_clear(struct xe_gt *gt)
> > +{
> > +	enum xe_gt_stats_id id;
> 
> I would just use "int" as we don't really use enum here
> 
> > +
> > +	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
> 
> or even maybe we can just go from 0 to ARRAY_SIZE(gt->stats.counters) ?
> 

Can do both of these suggestions.

Matt

> > +		atomic64_set(&gt->stats.counters[id], 0);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> > index 38325ef53617..e8aea32bc971 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> > @@ -13,6 +13,7 @@ struct drm_printer;
> >  
> >  #ifdef CONFIG_DEBUG_FS
> >  int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> > +void xe_gt_stats_clear(struct xe_gt *gt);
> >  void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
> >  #else
> >  static inline void
> 
