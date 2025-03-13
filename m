Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38A0C282DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 20:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D6A10E91E;
	Thu, 13 Mar 2025 20:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJN+OE7z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213E010E91E
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 20:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741897351; x=1773433351;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M4O95boEWmYh1P/6RO/ctAEA/gfXfqM4b0jWX2djeD0=;
 b=fJN+OE7zTtHPozF1jlucBqeEtugdfNQ86XVj9TBwOO+5fEEUeuizr8wB
 i4L7nrECJPDrB6/i2b9tlJAbc4IUHMQAoeNIeT4TYkh9qkMg7Y4wzjoFi
 crpAJ5Bt4ZqCNPa0JM62WercNd7qfJLFrov6yYLakuDjOfOzpH9UAgatC
 sKGUOZySnrIwy0VlOdlBTCUMx8T/HeEbCDjADpF9WfmwXd47J0j8XoMDj
 47rw0ha/3PMI98HK1nc8thS0XzI0/CWEKpp2pWqlN4Mowq0dDLNNZmveB
 GFMb8pv1Lrp14f/5nmhG1q/5XHOawGlsP8pT7mZofRZ763oB+kSiVKvkM w==;
X-CSE-ConnectionGUID: Ip85bnRHQ/2AJEww6/g15Q==
X-CSE-MsgGUID: /R/fo01cRRWJ+/Hk80vz/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43139114"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="43139114"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 13:22:30 -0700
X-CSE-ConnectionGUID: sNfNsB3XQJGSezVlDz9THA==
X-CSE-MsgGUID: WM9+kX+7TGq8Aw8gD0ppGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="125250707"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 13:22:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Mar 2025 13:22:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 13:22:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 13:22:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrTJLZ/y2UCCrSv0N/4+1Ddw9y2JJc3BAlImMX9In9X7mXDQifF8Eob5PPP4zlKQG9ED6dMs3Le9ya0cyBWwpKaX2f9eTjk8ORxNqW1UbiDYTQt8FfdQfiJJJbU2ItRHDbG/6BLoJ36X+F2fOapRE4yTDIiQiVp9R3YKKBujaX6nn2AtKWMpVSs1J0b6dDxUO0VT/xKxzPRrTz/d8tl/CPZgRbEtF5Suxq3AkMyWnNerqKt3hBMrXi255/JRoeNurtw6rLE72V6GzKOgK6TUm3k7t1j+wr/pgYPwcfSenw2XF1potAtRya/gjOsGS9TupDsxW1Z89KZqSjE9Z0SjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hVV/4uDEWq6pD1GBHw2WLa2kXhVIDYi9YrnH5IcEJQ=;
 b=INxWoWsbUj8oceEIPI3MeVWuzJ8NbDZp3BM4mlIyH80bqwhdQNH23/RwiunewPy1EOwLU6kGlkaxrdR0y4MpMEME/azxZf+3NA6N7bAb3xSf2mDksi6Hs1qpiJ+I1n1oi2PFBQ6lfbESfhXKi8jqVbyvWhigLjM3CURV0Vz6ki54FKCD6s2t8mFyq3sprw63zNsR1YDfRCJo6dcZRrDqBIv7GZWKrsBgNImQm5Vwts++83vqe32CFE5N+skRzFvpnrQ6WLk8UMrcfWEa/Bm2K+m1OXDNOAwHKG921NWg8M25YTKbbT6UQaDRzFahGmAj6i8SRq9TvOpnNaR36zjYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6724.namprd11.prod.outlook.com (2603:10b6:510:1b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 20:22:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 20:22:25 +0000
Date: Thu, 13 Mar 2025 13:22:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4] drm/xe: Apply Wa_16023105232
Message-ID: <20250313202223.GI3175483@mdroper-desk1.amr.corp.intel.com>
References: <20250313180440.1393089-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250313180440.1393089-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: e69efec7-8a86-44f1-5bf7-08dd626cc494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ecMfbVgW018/Nqhz9+JVsFtEoVNW0py+YzxRpgk3eX/gx0LBIWavtmtvWlMT?=
 =?us-ascii?Q?01rRZmR4hkiL0953t1eOPvFp7GpKoTmVSOK5VnTKTWF4Q4aufmseQIkdl9f7?=
 =?us-ascii?Q?ORoIC7DvaEzjNko2ABWFx90dRhASdxplqnFf1cHP4RNYsw7Z4LU7wAuoi1OF?=
 =?us-ascii?Q?PwtAyQAPRjbk7hHOO1FhzzlImzh0IRnql1Y3y/fQp0xZhY0Eeaqv/uoL6ywq?=
 =?us-ascii?Q?6oovgDtpE4natwbQ9Ozn02XOZvH0tJAysrVifa9ah1O6Wnc8s2PO+NTnF6j2?=
 =?us-ascii?Q?Clm0KWmHYdgoI7XWSaK6uXpxpSrkefI5qhHt1G4uGyE+PYV9Xc3Hz7ZDD7VM?=
 =?us-ascii?Q?pOXq3xWcYPizPPdFure3qOmN168lIlolPSXPBPuxNnVqxOwFiP/Ss77SHykJ?=
 =?us-ascii?Q?WMfLHRBXnBuYFR5gGXmZBAoFcJcS8Ot9DVKtTTgYaYsOS0/vnJtOblIRyyYN?=
 =?us-ascii?Q?Gt2S8vTTflcoPXedA2HU5oY8dYZF/eQYIpaeRkVCl7VIDMk1iLmHrzmihcMR?=
 =?us-ascii?Q?MFp0UoT4nv98Bae7CXM5EZgz6BrXAcNC3p2qJPZ4xCd36zYqfsfLmTss7bTY?=
 =?us-ascii?Q?UYZbNz6EN28UPrn+gxM9WgKLP4p5sVEYWRe0KtKDk0gS+i9S/teKPpCjIx5p?=
 =?us-ascii?Q?tPDmEpazGbkvTAHwqVGWHPy8hg29uSTAXJmg/Tu/KU7Yx8tq8FUDzmb1110k?=
 =?us-ascii?Q?mFaMjpqfSkuHRLZWPjWP5EnHerNDk/kUlEgtbBVl4tcKkzaROkZNh8k3+jwS?=
 =?us-ascii?Q?dBP8xhYlZYu/9+NKH6RXUVGBYN4O8nQ6jw87/w/p5+NPaVwxBEIqa3hhLa4n?=
 =?us-ascii?Q?u1dROyFlZuhvFGgBktot12ujpcQQjNRMsa8lzDnzxOd3AAnUex4iKBcD4vDn?=
 =?us-ascii?Q?j++w/uFymVzB1uKYT0bF/FoiLmrX8ZwY7/ITkgj/GxwlMYnGKELZewWRaaP3?=
 =?us-ascii?Q?swDcTeDK7cJYb6FHm5nf/nhzvFYwVP4ynJF2n1u63J7WgWZYhMxvUcfRcmFN?=
 =?us-ascii?Q?tDtIEyG9muFYwQWMCRtQornw16jCzMgjt+WKHJlr9TArVHzCQd+oNYYrXXwd?=
 =?us-ascii?Q?sdmMsIVfP2+NwlqMWZbP5FACoqsRD5ymevddRHY0RD0SJQur0k4kT9P6ejWa?=
 =?us-ascii?Q?n99Aq90+6wMYuF6Kg6VXmzS/3XkvSjmVCzkvHDzlubLlqXzizKa7oqZ8c0Nx?=
 =?us-ascii?Q?7nHZPLyP+FmpGMPQvZwKlYyXxVlLFM/y2+cVPDGF+UKWpC05Mgt71Rzec0ro?=
 =?us-ascii?Q?YkHmtir/eAUDPGjWmybBeXZE6L4rMgHVHMaKpbnGXzNcr2di2AIOeV8ivyI/?=
 =?us-ascii?Q?KP47GGXizrCU8Hm2Ejgwa0QiwhlGizgdlGXwiUDeQi5X5JvnFHmG7PIfTPZa?=
 =?us-ascii?Q?P8TonNiTJPmLBJKh0c7pvRbOLMuy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cL78eYgimltZF8TTMPgXNCiD7FH9neF4PhDqNHbLJ/CrxWDtvIhSYWvh4Jmh?=
 =?us-ascii?Q?Gl3gxbIELf3pIvDx5jUs57Xg61WyBip4fioiv0mf8CiZ3baq40eWGJPjsKNF?=
 =?us-ascii?Q?dKnOmXOcAxDvdym1k7A2d3LXxmLwqVT3Mqd9izzfkt0OBhqM0alA1Bo9oKaK?=
 =?us-ascii?Q?CCc1NfvW8cPDrqswv3ySacXYnouDOWVJ63s652ZON36+GpempX/J7YH9SYej?=
 =?us-ascii?Q?hGDr4dQig7LpCdv1OgRtURMgTGHnFrSkdF5LZDB2x3yahVWYCmrIK+HiGC67?=
 =?us-ascii?Q?MXqL5Fa7XQcCPlYFUOePoxDs46H72417I7Xu3FDKC+na0jAF3Y4jW0Rqi9CK?=
 =?us-ascii?Q?GDdnAIWX+ghWI1ywFFTb45kHP6dVqbaxhg1EQ32zIh79VHCj3g3zuzA7KLrM?=
 =?us-ascii?Q?vSE07/S5RCtAWqV1x3sw9Ui/7S8+E5MeI+LzJiJfWH2YZ1n9s38tZtOwxPCL?=
 =?us-ascii?Q?y2tDIdlkOf5dcaEFzzimZ0n8cLV/nHDUfSim95gL0G/Rs/3l+RdRhRQkdDYa?=
 =?us-ascii?Q?sq33Ob0uNfqX1LnBfCYyamMe5opS9PTF3/JVega72fBK0x4pgOdVUTj4CCbG?=
 =?us-ascii?Q?PpRa1cLCcLhMYsnqCF/mQpVY7SR/T/CNABRNhPgkXRBYhsALkPf7BFx8n+kF?=
 =?us-ascii?Q?U1/NkoBDUDF68l7BgzCy3CL2qUMJvsncr8jf2iAL4PazBAW8BCJx/MwRO6as?=
 =?us-ascii?Q?LTqdhgS00eyLoxxRhN5GsStbLtnaC+U/ZMmnvUjv9SY18wbTtwwN7biH6LS9?=
 =?us-ascii?Q?jst1UFZKIXjBFXX01DaxPHTAFK+cW+qBKaepjvQfdt5f4bPL3ZNM868eGqyZ?=
 =?us-ascii?Q?wqJJrgW6rMUrbeCqBwPJbyG9uoJX6CQ+kF1D9+kFOLIiSfk/Sv+gpz32bIGk?=
 =?us-ascii?Q?cuvLv8kmCL94xOcdny0bGL7Q20Qy4Tp+WsCvrPmfWdYGbGyEGReT5z4MBofg?=
 =?us-ascii?Q?3ecCBUDteDwaCzH32L18PPoBPonHvL1mvP/1cHMwUg3RZ+fNB8g0YkVgZFWX?=
 =?us-ascii?Q?wi07g4rl/cvzvWjlCNfGaqyAcxY20sp9Dpfcf7XwXjtIw6yYW3lWzIY6uRFQ?=
 =?us-ascii?Q?YRMSMFjoZb0JVt+WrBSCMi6I9854hixOV0Xl7z5XVVDRu2lllgynV1diIv9s?=
 =?us-ascii?Q?SPwk07p5e1FJYqsvjdv4S/nPCy1fLlnBZe4s4SpWSD9qOZX2YffMNjETRcUq?=
 =?us-ascii?Q?cipuw9yn/WJkW3xoVH0kZrmN+tqCy0ZoKHQqhC1TKEVL+eu8y99rgmbseUNS?=
 =?us-ascii?Q?CcUetkwS8ccjAIponGQvfLKNJKYcQjyMQ4fegIuQUssS61PA9gFkLMH00n5U?=
 =?us-ascii?Q?4FPRWHxDm7H8H5BQGhX2BohkTMcvRd3nvcjsTYEAAYcXvV7yYPZ1FxvMnjgn?=
 =?us-ascii?Q?BcRCHYsB4BTP2Uewrf7SXlFA+av78idKrXEMGXeHUAijp9GSMbpmAUMKDApF?=
 =?us-ascii?Q?be7T39lGbachN6ShMXgSJpKY7DEFy9REFZUw79+uKMWotktuFHAgpfaG4oXh?=
 =?us-ascii?Q?Yc79E3YQIuCbiTh/jrELz8lYMgyrxcroNJo1FFq+n8wRNPtVdJ/wcN0iNdlx?=
 =?us-ascii?Q?x+46WxxYEmAprT++h8NU7ikzCWqgXb4BAZS5+8iUXIIlniPYiX8nWwRKWDky?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e69efec7-8a86-44f1-5bf7-08dd626cc494
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 20:22:25.2565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PzXAE+XFbZRWyVGgmhFbponPEMwTAYpHYdU8M6ArmkfSC9zdaV2pWm4kwl6tzqxaq4T7FWxTAecRatlqLwA5+kmi7Xkl0HrVFqQo+E4++B8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6724
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

On Thu, Mar 13, 2025 at 11:04:40AM -0700, Vinay Belgaumkar wrote:
> The WA requires KMD to disable DOP clock gating during a semaphore
> wait and also ensure that idle delay for every CS is lower than the
> idle wait time in the PWRCTX_MAXCNT register. Default values for these
> registers already comply with this restriction.
> 
> v2: Store timestamp_base in gt info and other comments (Daniele)
> v3: Skip WA check for VF
> v4: Review comments (Matt Roper)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
>  drivers/gpu/drm/xe/xe_gt_clock.c         | 36 ++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_gt_types.h         |  2 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 30 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c               |  6 ++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
>  6 files changed, 67 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 659cf85fa3d6..05658ad991f4 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -130,6 +130,8 @@
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>  
> +#define RING_IDLEDLY(base)			XE_REG((base) + 0x23c)
> +
>  #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>  #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
>  #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index fca38738e610..f493b1687851 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -16,27 +16,41 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  
> -static u32 get_crystal_clock_freq(u32 rpm_config_reg)
> +#define f19_2_mhz	19200000
> +#define f24_mhz		24000000
> +#define f25_mhz		25000000
> +#define f38_4_mhz	38400000
> +#define ts_base_83	83333
> +#define ts_base_52	52083
> +#define ts_base_80	80000
> +
> +static void read_crystal_clock(u32 rpm_config_reg, u32 *freq, u32 *timestamp_base)
>  {
> -	const u32 f19_2_mhz = 19200000;
> -	const u32 f24_mhz = 24000000;
> -	const u32 f25_mhz = 25000000;
> -	const u32 f38_4_mhz = 38400000;
>  	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
>  					  rpm_config_reg);
>  
>  	switch (crystal_clock) {
>  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
> -		return f24_mhz;
> +		*freq = f24_mhz;
> +		*timestamp_base = ts_base_83;
> +		return;
>  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ:
> -		return f19_2_mhz;
> +		*freq = f19_2_mhz;
> +		*timestamp_base = ts_base_52;
> +		return;
>  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ:
> -		return f38_4_mhz;
> +		*freq = f38_4_mhz;
> +		*timestamp_base = ts_base_52;
> +		return;
>  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
> -		return f25_mhz;
> +		*freq = f25_mhz;
> +		*timestamp_base = ts_base_80;
> +		return;
>  	default:
>  		XE_WARN_ON("NOT_POSSIBLE");

While we're making changes here, it might be worth improving the warning
here to actually print out the value we got.  If we get bug reports and
dmesg just says "NOT_POSSIBLE" without telling us the bogus value it
received it makes it harder to debug what's going on.  If we pass the GT
parameter to this function, we could also use xe_gt_WARN_ON so that
we'll know which GT (primary vs media) it was that caused the problem.

> -		return 0;
> +		*freq = 0;
> +		*timestamp_base = 0;
> +		return;
>  	}
>  }
>  
> @@ -65,7 +79,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  		check_ctc_mode(gt);
>  
>  	c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
> -	freq = get_crystal_clock_freq(c0);
> +	read_crystal_clock(c0, &freq, &gt->info.timestamp_base);
>  
>  	/*
>  	 * Now figure out how the command stream's timestamp
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index e3cfb026ac88..7def0959da35 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -121,6 +121,8 @@ struct xe_gt {
>  		enum xe_gt_type type;
>  		/** @info.reference_clock: clock frequency */
>  		u32 reference_clock;
> +		/** @info.timestamp_base: GT timestamp base */
> +		u32 timestamp_base;
>  		/**
>  		 * @info.engine_mask: mask of engines present on GT. Some of
>  		 * them may be reserved in runtime and not available for user.
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 223b95de388c..4b8a54c16ac7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -8,7 +8,9 @@
>  #include <linux/nospec.h>
>  
>  #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>  #include <uapi/drm/xe_drm.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> @@ -21,6 +23,7 @@
>  #include "xe_gsc.h"
>  #include "xe_gt.h"
>  #include "xe_gt_ccs_mode.h"
> +#include "xe_gt_clock.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_topology.h"
> @@ -564,6 +567,29 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_reg_whitelist_process_engine(hwe);
>  }
>  
> +static void adjust_idledly(struct xe_hw_engine *hwe)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	u32 idledly, maxcnt;
> +	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
> +	u32 maxcnt_units_ns = 640;
> +
> +	if (XE_WA(gt, 16023105232)) {
> +		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> +
> +		idledly = DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);

I overlooked it on the previous revision, but it looks like we're using
the full contents of the IDLEDLY register here rather than just [20:0]
that hold the delay value.  In practice things will probably still work
out properly since all of the other bits except for 31 are reserved and
probably 0's (and if bit 31 is set, then we'll probably satisfy the >=
condition necessary to rewrite the register.  But if this workaround
gets extended to future platforms, and those platforms also add more
non-delay flag bits to the register it could mess up the logic.

So we probably want to use REG_FIELD_GET() to extract the value, and
reprogram the register if the IDLEDLY value is larger, or if bit[31] is
set (since that effectively means "infinite delay").

> +		maxcnt *= maxcnt_units_ns;

Similarly, we should probalby do a REG_FIELD_GET() on PWRCTX_MAXCNT too
just in case something else gets added to the higher bits of this
register in the future.


Matt

> +
> +		if (xe_gt_WARN_ON(gt, idledly >= maxcnt)) {
> +			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * maxcnt_units_ns),
> +						    idledly_units_ps);
> +			idledly = DIV_ROUND_CLOSEST(idledly, 1000);
> +			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
> +		}
> +	}
> +}
> +
>  static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  			  enum xe_hw_engine_id id)
>  {
> @@ -604,6 +630,10 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
>  		gt->usm.reserved_bcs_instance = hwe->instance;
>  
> +	/* Ensure IDLEDLY is lower than MAXCNT */
> +	if (XE_WA(gt, 16023105232))
> +		adjust_idledly(hwe);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
>  
>  err_hwsp:
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a25afb757f70..24f644c0a673 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -622,6 +622,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>  	},
> +	{ XE_RTP_NAME("16023105232"),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000), OR,
> +		       GRAPHICS_VERSION_RANGE(2001, 3001)),
> +	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
>  };
>  
>  static const struct xe_rtp_entry_sr lrc_was[] = {
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index e0c5fa460487..0c738af24f7c 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -53,3 +53,5 @@ no_media_l3	MEDIA_VERSION(3000)
>  		GRAPHICS_VERSION_RANGE(1270, 1274)
>  1508761755	GRAPHICS_VERSION(1255)
>  		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
> +16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
> +		MEDIA_VERSION_RANGE(1301, 3000)
> -- 
> 2.38.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
