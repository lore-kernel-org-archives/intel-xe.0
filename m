Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A41E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 21:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8095510F052;
	Fri, 20 Dec 2024 21:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xz1clOyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006C810F052
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 21:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734728932; x=1766264932;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lg2f0wFw5/Gvnhh6So3zBXYpJ9kby89esCALDlNxMJs=;
 b=Xz1clOyJO07dY/rjU0D5GQ33cskTCVtWeYrKAbsKAQ7Q+peDF+9OEdH9
 DIRb9YGTvqVUJH7Nprwp5veTna03yvFKcZkIJPhNqqUvXGwks9ZWOK9Ze
 RNDHGC3PPsetZgtmc0lTdX2oYtcApnVioGSMEv9RCgDXEjFP40GXeCzq/
 tJYV4oDS3DBfM2iQqSES/y8FB1ZrVY6cfzTPCpxrQTwkA/d4NdOEbtyY0
 a1tDT4CPrjaVy1yKZHygf0AmlERd0MS+biVMqiJ0uaj2FfWDjQmZWl1Ma
 TJ0DCcEGxs/UVsBfsdmrl6iAnBiwqilY9rUPISsrhyp31TbYuMTU230TH g==;
X-CSE-ConnectionGUID: NJxf9WL2RsekFwDEFISFrQ==
X-CSE-MsgGUID: 5H+zkLMvRWOJ9Q/sqtZdbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="57760831"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="57760831"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:08:52 -0800
X-CSE-ConnectionGUID: giGQn4kpTTSkVwcTX8FXeA==
X-CSE-MsgGUID: vKoTXWPIR+eQtpPsB4tyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99088804"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 13:08:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 13:08:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 13:08:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 13:08:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sO8Pi7+tHcGSsD1YmpRIta3k3UHRsrmbL7Ud40V/b4v/4RLETQ7H31L2UPfO0eyQr2MfNfm0MXsaFLz2qaRRde2skyCHZwBULOyeDmOM45IlmYvHdzmhM+OBA+TK6aZGkZe4TLMClz8B4+woAJgzxvtRGL7P+aLiF69f628ByNRsUhe6yGvDXXE6b9Ui1BeAsI8kdnd5HgwF6znh2sWhtyLXkuINH3xifapxoBCi93VNLKROB8ZN+gT/ixuCOPB6x2Wr4497Z0TfpAJSesaPLvCsND3J22TjicBrx5oLd0PLPajc0xfWgn6gswEKHZnG3WgkSIz+GXEiiozSw7rPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXyeOuBigw6hwp0eQ36ZyjdvAAPr0skwwHT/uyBVbrU=;
 b=DLnjKfxYxbxsUFT05AGprAwkRqaePTwH+6Y2wuT4KhzvhCXdtwa5p4XRb2H1I/Q3x/jPmAhxxUdAMlHKcXVjKSBHuuQVZMQxpwgBeDSY+5dbfdYMYLUjY4kEUeq4iS0s7jrakZAViaKxmcjdEif5GXUkdk3d9Almpq4pTya8Wq+EvWPF86NezIt0frDEDCGnQLo9PkwNwptuzR9NJcIyV92momiYQinq9/d3bDJbi0fZZAxxybEZgnl71mOurZH/r22GmYHGHDi7WZ1Yav3EeIyL67O9h4i4GITkwwR1hTMy3AgR8C+xidi/m3QM9+cZJW5/V9vRh9THSutk1ataZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 21:08:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 21:08:19 +0000
Date: Fri, 20 Dec 2024 13:09:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v11 2/4] drm/xe: Add locks in gtidle code
Message-ID: <Z2Xc8GpN297TI169@lstrano-desk.jf.intel.com>
References: <20241220205927.441082-1-vinay.belgaumkar@intel.com>
 <20241220205927.441082-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241220205927.441082-3-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR04CA0243.namprd04.prod.outlook.com
 (2603:10b6:303:88::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5f993d-2470-4cf4-bcfb-08dd213a6e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ye2KQpW8+1a3atmTeGwQdObLRItmAE7NFMrdZEdpFQaucWnNt+H0GbN2x4/y?=
 =?us-ascii?Q?WnqISDr2vhums9iyC1xmqix+b+OPJ0KmGDPoNzy7KoBxPc7JNsuPjSntWWgV?=
 =?us-ascii?Q?CtNu4aeEgdW49k33Tft9XtDYjWyZpUPEKfOhKbODDuYrbOuwsQf7mFjNKazz?=
 =?us-ascii?Q?qCT8En9XYwjNzHOgnkTRuqoo6mtGU3kK0ASKvfJXNjq5JZWovV7DckKjJ/s5?=
 =?us-ascii?Q?j7W5sqverOTuFIU2HRmDK/zxm4YD3eGykgMNri6Rr6WXRpbbwc4qJcrPL8lb?=
 =?us-ascii?Q?QnaNNpaZb9dd5JVnlObqD/9J/Xhr1MSnlaJYsP2fs4CTq9bBeUDbHYBxPr63?=
 =?us-ascii?Q?Q5n3M7Z2I1Vcn7ko/qsiaHOHo1aYm8NWWCg+wI0RMOc7LHvMVZmkeiEE0WSA?=
 =?us-ascii?Q?RaAs25FF3M0ZKKdutqOWuNElc/c5RzIQt/2+6f3yCUDm0jZtO2T5m49qhAs6?=
 =?us-ascii?Q?2hSyCz3CCeuPe5Ylt0YasC7G9pfgqd2kOiuL99rar45mM3WDagM6YuY7W+8H?=
 =?us-ascii?Q?pc757v28rbG/FAs7vs3sKh5jMZFYKku6NA3va8GPfiRUPXsFthJ5ZA5IsyDk?=
 =?us-ascii?Q?Q5X3Y4F3lyRngxFvx+qNpaivqlrxsk+7rFz85ap1gF2+vReNTkYgxR0SeVXv?=
 =?us-ascii?Q?dXRUGLxMWsffo2byPRAawCXru+rv6Gwj9EBZzXQ4Ued8TkozeOVz3xOCPQyn?=
 =?us-ascii?Q?REOVmR4iHh0bMOHZPlurErLVC/8GvabZAfJkpJkgzvlUqwjMVDqa8C9sQX4U?=
 =?us-ascii?Q?qaxG0HKIhEpbRfylRj7qTc4UZyhLtZaeli4oAjsXaLDCem1Ii67Z5/bXcmzl?=
 =?us-ascii?Q?h8gOrsmFSyiktvFdc9bZV3+uMc5Cl69qveCXmApYV3Iy0jIo++r4Y1gdAmzG?=
 =?us-ascii?Q?FiiH8ExbCKKmVt33i3w/hr8xQPvdySg+vWC3ydI+w/OsYHtG35GWSnAqszl3?=
 =?us-ascii?Q?dvWa/OFfJ7WzHd6iqtjGb/JdB+U/S7PuDQAPEiwEvOl/nZ0CsOlve+YgXBBr?=
 =?us-ascii?Q?/AtpLmJO/PQxhJ8UZ3x5zbdd4D5IeH+7MVOmb7VIEvLMFlemsIp+iwuYn3QV?=
 =?us-ascii?Q?2ikGpccETIn5cl/XPfjpcA/LZieRjCc+zdPjn0ALkwsGRn8m8i7Vo4o70I5x?=
 =?us-ascii?Q?9Ml2TT0r2mcZ/jGaMtZa1Lkd3eUJp6+7nSp5n1NLXOc11cZNnkFQcFIFAfzn?=
 =?us-ascii?Q?+6Dr3VWwJEuqhDucUQEnSFmkGReLWhw5GEKLY6+9imctH+TVe55xIQQ2XnAr?=
 =?us-ascii?Q?UrN2uSK45ofPSh2JCCXJS1fzEZQ2j2ZpAxa5ueCN1V86bEouo0yhr/YDeXlU?=
 =?us-ascii?Q?/ponqx7pmguuFTS5SD2yU1lhplBeqi/JwZ1GYeQQ1Dn3UpVK8ZHXJ1ONCQzV?=
 =?us-ascii?Q?gAb2E2/Rn8VKYPdhXFCqshJAGzs6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?18cWQFrwky2DEEVTmdnZA5MZYa7QSnNVwqQmIoAf34lfY+oIvnZ2mn+XUKwx?=
 =?us-ascii?Q?fI4tilXOWL7h38PWNHYsKS7KStAFR9Y+y7T4pca9e0PFXKGaOuXs8/80ntNA?=
 =?us-ascii?Q?zuflRwc+53hBO3rkL2uHirEYxW3jUU6BvAyflHW8BxSsUpny5v297Pz35oL7?=
 =?us-ascii?Q?LIG91CiFcrh8Hw9aGfKKJbj6HhEDNsPElC8L+uX34DP3stenBfJJdOLJZW4F?=
 =?us-ascii?Q?U7RXEIz6553FHedAicmD40zX87DVFZwg0tz7qEyEDSvTnQYvCU+yonlSplFZ?=
 =?us-ascii?Q?0bKGWduSzVNgtZhej0f5w2i+sR3KFORw42q6At7iVBDIX4UlbsaDdM1eMANS?=
 =?us-ascii?Q?IQOf8MOb5og8RbJ70An+m0g1u8WdoksO/sV5QgLk/zSd9LQrqmexktC/SLj/?=
 =?us-ascii?Q?tLnGonfoHcfvJ9HOYvkiCpMgA5ytZnchxeRnoVyX9h4kpo+qCeTEehnpP8YQ?=
 =?us-ascii?Q?A4NWjavMbvSU87O+ScVmOxUND6XmgvSQp1GR8HTOz3k4+TOGXEwSiMgn18jL?=
 =?us-ascii?Q?u9m0Bqhao+8GqCUq/cYeyqpzmF0bJSJzX52AeMI4pZpPVpWHKZuRsr681Khs?=
 =?us-ascii?Q?IkKtu/1Qtr5ksccjTelXm3n7QxEZU4TdUxaRJXZ3Q/TkRfO9rUmOV/lQfqfK?=
 =?us-ascii?Q?Iqb6Iri8iHOqZpdv3g6t40ttHL1pqo4YX/t24gNWOI5E+9lkwvl1c0fTX7Iu?=
 =?us-ascii?Q?4nteVNuIQfazE1SDZUHoe9ZPfNx4m6aXZvnjqxFmwB1W5DhJk8Q8x8sAoF+G?=
 =?us-ascii?Q?TlrOiYr2J0/oN30dKV75WhlM034Q3kuoYPNW9Co1nvRith9WDZqTFoBoI8Nu?=
 =?us-ascii?Q?imwlVyikU1q8yA0XCNGsPYFRzNvyhoM6I9dKsk2wTlwlfo5A/OH0tWzFZ1aw?=
 =?us-ascii?Q?M2TqSKcQ3RyE7JWEF64mMqRvQeKRnsYU/JLeE6NS1Cgv8t//TfglXH9QV1og?=
 =?us-ascii?Q?ekrleFOhfhf+H6cmv6clC52SKZwK7EOkoHBJZMsgoJSEWkm+Yoc+a3YdTtxq?=
 =?us-ascii?Q?TVwgYdN9ynpSINNw522KXAmi0l0zu0H3XWhxzU0RA0GHr9A77dULWrfG8yoi?=
 =?us-ascii?Q?7ICn/BRaBTZmAWGDAP2U6zXOSJVaTYP2ysvBc6JxqqIIKUn7ET2hmfyYUQnS?=
 =?us-ascii?Q?/sQiF6UBBFR8mPOiHw/BUDi93kG3Bz6pqCITAH5U4qHXYnD9ZmZY8VWOBnmn?=
 =?us-ascii?Q?R2kIioHcgY3xe8djZWl+BSVWVIUL3c9ciNqktyv/jHRoIGN2yHSuhJXJxUF0?=
 =?us-ascii?Q?cVbWd/gC6NXgE55zTIgiBNnKPVPvZwFiCOlxdh+S8ATYxoL2bSEyuhYzefwT?=
 =?us-ascii?Q?hvxnzcnZte6C5OmYcJmRxAz2AhYLyZTIZcwSPdu4X45aTt3w9K56+BHv1SEu?=
 =?us-ascii?Q?lq/eNOvg8YtCbZ/RO6pxJ5t59BVFqsQ/fj/iTvYiGJT7Aoxp/UpeF+nzheHG?=
 =?us-ascii?Q?sWxftIwcl+3NaT18Iz4xpHT0UpbTnV/xfvFjgJQ9av4g7VRA7r7nrp5QquWF?=
 =?us-ascii?Q?hI/jqJ3hW+SrQbZdzvMmZMRHB28ENLpRO2Yj28ybxBdGbQSPR8bxdMGEiyF0?=
 =?us-ascii?Q?eLh5zfoZM+tWC3yUbKZtxqr0CYerCX4MzjdBdF/9G4SYiBgPXTSTZ+/zld3/?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5f993d-2470-4cf4-bcfb-08dd213a6e2a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 21:08:19.7953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yesLglT2MxfmRd25hEcb5nYT3XswT9V6ZBUuhZNI/BzILAet+6ECeOhJyHU9Z3nhomghDwhpyc2H9FPrrvGp0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
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

On Fri, Dec 20, 2024 at 12:59:25PM -0800, Vinay Belgaumkar wrote:
> Another entry point is added so PMU code can call into the gtidle
> method for residency. Add locking so that parallel calls to this
> method from sysfs and PMU don't give inconsistent gtidle states
> for c6 residency.
> 
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c       | 23 ++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_idle.h       |  1 +
>  drivers/gpu/drm/xe/xe_gt_idle_types.h |  3 +++
>  3 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index fd80afeef56a..1f32ac964abe 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -69,6 +69,8 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>  {
>  	u64 delta, overflow_residency, prev_residency;
>  
> +	lockdep_assert_held(&gtidle->lock);
> +
>  	overflow_residency = BIT_ULL(32);
>  
>  	/*
> @@ -273,8 +275,21 @@ static ssize_t idle_status_show(struct device *dev,
>  
>  	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
>  }
> -static DEVICE_ATTR_RO(idle_status);
>  
> +u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle)
> +{
> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> +	u64 residency;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&gtidle->lock, flags);

Why raw spin lock rather than just spin lock?

Matt

> +	residency = get_residency_ms(gtidle, gtidle->idle_residency(pc));
> +	raw_spin_unlock_irqrestore(&gtidle->lock, flags);
> +
> +	return residency;
> +}
> +
> +static DEVICE_ATTR_RO(idle_status);
>  static ssize_t idle_residency_ms_show(struct device *dev,
>  				      struct device_attribute *attr, char *buff)
>  {
> @@ -283,10 +298,10 @@ static ssize_t idle_residency_ms_show(struct device *dev,
>  	u64 residency;
>  
>  	xe_pm_runtime_get(pc_to_xe(pc));
> -	residency = gtidle->idle_residency(pc);
> +	residency = xe_gt_idle_residency_msec(gtidle);
>  	xe_pm_runtime_put(pc_to_xe(pc));
>  
> -	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
> +	return sysfs_emit(buff, "%llu\n", residency);
>  }
>  static DEVICE_ATTR_RO(idle_residency_ms);
>  
> @@ -329,6 +344,8 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
>  	if (!kobj)
>  		return -ENOMEM;
>  
> +	raw_spin_lock_init(&gtidle->lock);
> +
>  	if (xe_gt_is_media_type(gt)) {
>  		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-mc", gt->info.id);
>  		gtidle->idle_residency = xe_guc_pc_mc6_residency;
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 4455a6501cb0..591a01e181bc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
>  void xe_gt_idle_enable_pg(struct xe_gt *gt);
>  void xe_gt_idle_disable_pg(struct xe_gt *gt);
>  int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
> +u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
>  
>  #endif /* _XE_GT_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> index b8b297a3f884..a3667c567f8a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_GT_IDLE_SYSFS_TYPES_H_
>  #define _XE_GT_IDLE_SYSFS_TYPES_H_
>  
> +#include <linux/spinlock.h>
>  #include <linux/types.h>
>  
>  struct xe_guc_pc;
> @@ -31,6 +32,8 @@ struct xe_gt_idle {
>  	u64 cur_residency;
>  	/** @prev_residency: previous residency counter */
>  	u64 prev_residency;
> +	/** @lock: Lock protecting idle residency counters */
> +	raw_spinlock_t lock;
>  	/** @idle_status: get the current idle state */
>  	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
>  	/** @idle_residency: get idle residency counter */
> -- 
> 2.38.1
> 
