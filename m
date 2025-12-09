Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C866D3B9A8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 22:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2863110E210;
	Tue,  9 Dec 2025 22:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buS7N+rm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7C610E210
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 22:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765319300; x=1796855300;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+a3ZnQsB6+cs7SpOrtWnJt+fW5fRmmoMmfyG9P52wgs=;
 b=buS7N+rmqDlhTRzy6EddtsE224mQDqvsFhyQocSfKZLOdreC1G1PKLHS
 XJDxQil5ZexHttHqbi9R1BEtn2O+LT9MDDJ4khUBkzF/A5+TbUg5hTGCy
 BCUcvwCBXEbLyEmLEjZJ7tJLOQH4oYg4mFiFu9vyKElidmR9fByS0jjEd
 JOntnjAij1w1otoESGy4Ga1KMIsU48MlWaC6cgku8Fl+TeCheCV5BMrJ8
 whP2CxyDKm4BqdQOAItFNRdPKDqj5h7FNfHnMa0a6ZoJsVob62cnCprWY
 aS2uRhRr5l15YohZBVRSf8fFFD+2v69v7632Y/HSyTETIf8Is+w4DpmnC Q==;
X-CSE-ConnectionGUID: TJxxbHHlTICWy3QxxtMx0w==
X-CSE-MsgGUID: 4QullmSlSji7SlNhitoGjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84892640"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="84892640"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 14:28:14 -0800
X-CSE-ConnectionGUID: V0mxzthWRy+XxbL5L4xKVg==
X-CSE-MsgGUID: lbaucqcbQV27zQEi/6imyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="200768809"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 14:28:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 14:28:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:28:13 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 14:28:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZx3ZMgRxOrJoWjEF2PH6Tf+KOMadp4RMpwcm/Bos1d5ExemHXMuiCdj/fGzBwtBCDtYwtVTNfDbR5TVA4Zv+iRHbngujKQggxbwoLkuQZQIKNCuAyJNr4oleqMAMfvor0DuRoMSajJn8rAhb8UPvAyW+XF4FCXzITdAgnEBM4Sa3zyE4i1EYEnh5JwAv6t2ucyZas7+tuLIWS81JtA8g9zwokDYiiPkbY0f1lAqUPqusDTGyp4EOZRgvQcTr1SVnOZlQYq62Q/pkmkii3mnPG00EHBnEIsGrKUO1tOH1zfJ7jpM2U8ZS30VGqADWMCP3IBoIeb5LVlRRCyfUUn+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KUSI7bVaQj4xJoCWR27NnPD+QJF4ADmWwjCsgI1RwI=;
 b=sWGr7gN0ndwNLA4VbLgToxq4oA1DwAPpbzDPhRwIi4//kWid6Mh6ifxpNUvEZoJYA8fBNB7VKLFoAl1Nxuu/wS0PiT6YNifqSe5Qqz+RRm5QsSc3bUoFpXPuHr5drUlvz07SoQ3/jJLvr//o1UCTfgoQfxnQcB1l6zhb5mAnoOOZ2AVVh8cbAEyyka4H6UJxlMFOCD1nrao4eBqixWezBeiSgpa1lT/sfvc4lQzTuS68ptqdYZDwv1wVKUUdTwHPSkL1UTHqYynMwj32RHmZX8Qm+Q7r/cnIUp5Lezx/ra3x8vbqn5MyVJVh4fljxtb5u77i6I5zNp4FhGSyGaNWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 22:28:11 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 22:28:11 +0000
Date: Tue, 9 Dec 2025 14:28:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/hw_engine_group: Add stats for mode switching
Message-ID: <aTiid7BPIZb/Bvqu@lstrano-desk.jf.intel.com>
References: <20251209164625.228826-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251209164625.228826-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0253.namprd04.prod.outlook.com
 (2603:10b6:303:88::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ef5446-a8b0-4267-51f5-08de37723c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Z/FDepIfyRB7Yrkwb67d9cUjTlyIU/PQNUwzhBgha4RUlGo8YZ6qA/uGwZ?=
 =?iso-8859-1?Q?WZpKdN1JJj5tv8BuAE2RBz+Q7/7pKu5D/HnGqRIq8rCmHWSBnWUiu3KgTN?=
 =?iso-8859-1?Q?Ha68aHJjnBntAVqtPXA8pIFOfSEfVBfgX3IdN0dS8KIsn4OWA+2ryCSvUR?=
 =?iso-8859-1?Q?JJnKalJ3tKmkDjAmIeH9wLIhJnKKEtCF34+wLTIzSRpJ5bbxgxTJ1Fn20u?=
 =?iso-8859-1?Q?NkOIuYeSOVIm9vAxe3r6lHisyqe2q5+zbohPpD0D65uDquqdmOlHeQfK9k?=
 =?iso-8859-1?Q?rnT4ZXfvlHVghD5peA7vAf/WLFkeHO18IwydBvubhg20pacVyx5bQeRHeK?=
 =?iso-8859-1?Q?q0L/VKKZJWcVKb7iR8rJghMbXC19k+XzRBUuqWlp7sQhlWgXsrrBnMgKHu?=
 =?iso-8859-1?Q?QjKyTkaheDFNF7KE0UKSqtNtx1wmGgFsy7UK03GIPhYIMh2k6z65MMRidC?=
 =?iso-8859-1?Q?kY8VfGciKLE+iD3x1Y9UobNmJ1n9P7UNdnvtviXSeeNliIQFvrxxtwdrMO?=
 =?iso-8859-1?Q?9FQyXr1YS8pjJ7D2YkWEM21C0HrZc9yq7nkuEPpsS2Htp/nQ7kiGGJJIcj?=
 =?iso-8859-1?Q?j7jmCVdzhaJtmuQIIHr/VmQU8AgLAjOAhPVbFzVeEypr3fyFLeVANE4Dkq?=
 =?iso-8859-1?Q?A7BaXcM2WRvyQtMFeu2tpFwAKc3rsDrQSPjESmP4d4JDOiu0QtEE4919qB?=
 =?iso-8859-1?Q?TJF4vSxUepuvOEXvzTqApEU32e2TPOEIQG+gXVaw/32V6nNp1Y5fa+wkbQ?=
 =?iso-8859-1?Q?fnuSkFpEXhNpjAxfcBhvd9/dFzqCFh+xElC2CHzgma8MGvA3/V3L/AXCGU?=
 =?iso-8859-1?Q?caoOy/J6XdWCbPTvyuI/13ncLYpXnSG0rGR+yC5mFm1A3EAeFkzyQDfbBa?=
 =?iso-8859-1?Q?Q4Q4nQ6Na+8l23rA89gj/PNCudDwNWtdTevvR9GMhH6zzAI90u2w/FujMT?=
 =?iso-8859-1?Q?tTl9DVIg5bGyyiJz++xiEBIanqDAwZm6oldZB2PZO3OadBmnzIUUCxkkcA?=
 =?iso-8859-1?Q?7qzQ0s6gp4kmMacCfpD3yHMxZICYu0ZYB5ABF805l1LcQnrw/Ryfo1qwgF?=
 =?iso-8859-1?Q?Td8pT/euxkQN0VRDhs3T5nKCl3ZmIADPFj3NqTHZKViSTGELdXaS1jL8Wz?=
 =?iso-8859-1?Q?Dfx3jnutTaNahc+Lr7xIu+R617mUAlWa0R5BqwBnJ+uLKEQiPN0nb2dioC?=
 =?iso-8859-1?Q?2WxD6cSCxYs/PsQCshN3gXvhqxqToi7+G5ceMYFzg7Nar2UoLRU8Kn6EJb?=
 =?iso-8859-1?Q?cg9llbir3slGu25tAMKUx24C7N0+Suwyt40El1dFZeFVkGHUG+NBo376Io?=
 =?iso-8859-1?Q?MvEo3ZZlWMvXU/XikrYjeC4X+3geZ8ac1TxkVkkLeQTjTYpnjffBfX+78v?=
 =?iso-8859-1?Q?2XKO6fCoTC+ZxxaPazg9PSyfs1jqk3my+3ZpedqhEMmlCYNB0Vjn/B4PLw?=
 =?iso-8859-1?Q?uB0Dc7TcmZwccBIYakggcwtiulFUwNP2emHxP12A2EzFOgvwA59mVvHNSZ?=
 =?iso-8859-1?Q?i1GeaIm07cMYz2qZ+TzeTQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Zax7bMwUtPv8kqP1FWVGAQuJ9cn33D3S9gG+XDpWNqNRJsX6sdjiu67+8m?=
 =?iso-8859-1?Q?o0nQAzlGkJIzxXPgDaXFoXMA9yt0Cx3LuD4qt7QcFKKIe8sKcFJD1bjAuK?=
 =?iso-8859-1?Q?09cR5ZbPeH677bqPkBg07JJQmVmQ7uqB/Z4zAHTCWbEh/+9DVXlO/YevPY?=
 =?iso-8859-1?Q?BTv9r59rnp1t0rerG2QquHprk+HixcSnd5XGq4JMq7K8PGpcDN4cBhuzAw?=
 =?iso-8859-1?Q?dDj4sV+lgJm2NpvV2ak0ku9ZQBAkCyQxWmVbPY8K0nC1KOF6PetX+rLfEp?=
 =?iso-8859-1?Q?W+2AWALh8mDCKFYbPt5AAteFDPNVBfdnJLyYkoaSKPnSbFADpZUKmgeThv?=
 =?iso-8859-1?Q?ziKqDOy7VziOmbbyH+uBiiwoaNwGx2aom3uXXjNiLd/QnY0p+rYcyjZNm4?=
 =?iso-8859-1?Q?lqyl7eCDPm/+lxqmGKIEEx9QyvoMzsKPMV4XnJxKivYy6IgD7giJ8B4i0e?=
 =?iso-8859-1?Q?sGijn2afUrCYsuCPLMJeRuPSfPCa4wvDdD3R9h01PU2WbWaDVPOoWqESUP?=
 =?iso-8859-1?Q?HTcMCXYXpM6ol/6Ep+cyVjFpw7C0nRiEjQUUgj/NPyKWfecuy45vcmsKKs?=
 =?iso-8859-1?Q?co8K2Xt5SUa0+iW2zI+UnEkgKI7FrdSQIwnuhuy+ggymjbrvY00LoW4RXv?=
 =?iso-8859-1?Q?cHZjNHTieCPNf24Sm/VO5crdUBlyLftvFiEiqv3oRXmMsHOznsWcW3GIS7?=
 =?iso-8859-1?Q?Ojbh4weJg/X/gjoqh+C6DQsREP/l8RVcjAMYy2Uj7VAeX6nR1ICB64S3Cg?=
 =?iso-8859-1?Q?LxF2gKQjmonhMRes9NuEHUjSZser+6V+oacbvoiv517Of3VBP8Bx0b9QjD?=
 =?iso-8859-1?Q?83pb3QcxuREOgw9thl6t9Vk1hxDdVyE3NEkdgwHRrK61bU5M5pMr+87Xxj?=
 =?iso-8859-1?Q?4HHpFqLJnBv440+Rvr61K4MAAT6Jhanca+i1TX/GVH+y5jJ8xeR3SrrCwG?=
 =?iso-8859-1?Q?cYpRVBWVyuQc6RKoXEaRN6ODrziuEEA8iNTaG4ATESRQE0ZEocyevjBjCE?=
 =?iso-8859-1?Q?N6mm4QHiyYBBxf/mlWN8yzhFke/DXdHlx4ey1yOYg+XvvPilZQozBcF2GH?=
 =?iso-8859-1?Q?A2cihkZZ/rHWBHCffB/hP2TlXdreMGRFXDMUhi6txGPfiO2/EbzS+wIfdD?=
 =?iso-8859-1?Q?zT+9vW9Gb0I3xGg5fQ2caRi6UtndNa9zwlQ1Os2U39FOpNrEWt7AEQpQmF?=
 =?iso-8859-1?Q?ej+Kak9MsiqQhFdGYHuv3PUUydtnzQVR190Hyh10cdwDgd9Q2cVQ6P/xA0?=
 =?iso-8859-1?Q?2PDFcokdgeY0L+HPPRcdF/MQhvcLsGMRplfPPy0tz+OkETr3ejxq5NM2K5?=
 =?iso-8859-1?Q?LgvSDJZhuPyiQJ41YNvy/BJxSaXbrx3K9vS301qH+O+HBSzNA1xyJ9UE+C?=
 =?iso-8859-1?Q?c1voNRolTv6uO+ozLqXiq2USFSUCofNIBZ2FX8J3vl2tPJxOYfXw0LGToD?=
 =?iso-8859-1?Q?2C1zs+jb5hKKzZRnmbJ+1tSfoIVZZBG51Ia8i/u4ElqlNSHEQ9PrsuykJZ?=
 =?iso-8859-1?Q?/hnWBCEMC9L2PSe1DDV/Ca6h76qS3lcNM+OBBNMPRfoda1XrM8wGl+IDpV?=
 =?iso-8859-1?Q?hQLWT6TkWb7QaVSMJQ1a4h8g0ygnFBS9uykXCUiKLtfm7Ax3sE1EHafekE?=
 =?iso-8859-1?Q?21h1dbjdE5CL7z32WuRdJXg4NJlRBLOYPVguLZhHeYwu/iZ05XwFiIgA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ef5446-a8b0-4267-51f5-08de37723c3a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 22:28:11.1594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9Z6WobcXMk4cOoIDvXIJz8IW+RkalG5ZbYZe68yQSVEZ03s4vL9dnOLMPud0fjbSztYOQYPa5c4I22858A9tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
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

On Tue, Dec 09, 2025 at 05:46:25PM +0100, Francois Dugast wrote:
> The GT stats interface is extended to include counters of how many jobs
> are either interrupted or waited on in the hardware engine groups. This
> can help application debugging.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c        | 4 ++++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h  | 2 ++
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 +++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 5f74706bab81..edb18582e0f4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -66,6 +66,10 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  	DEF_STAT_STR(SVM_4K_BIND_US, "svm_4K_bind_us"),
>  	DEF_STAT_STR(SVM_64K_BIND_US, "svm_64K_bind_us"),
>  	DEF_STAT_STR(SVM_2M_BIND_US, "svm_2M_bind_us"),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_JOB_COUNT,
> +		     "hw_engine_group_suspend_lr_job_count"),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_JOB_COUNT,
> +		     "hw_engine_group_wait_dma_job_count"),

This is will be helpful. One nit, this is really isn't a per-job
operation - it is per queue. Can you change the name to reflect that?

Matt 

>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index d8348a8de2e1..826727eac485 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -44,6 +44,8 @@ enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_SVM_4K_BIND_US,
>  	XE_GT_STATS_ID_SVM_64K_BIND_US,
>  	XE_GT_STATS_ID_SVM_2M_BIND_US,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_JOB_COUNT,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_JOB_COUNT,
>  	/* must be the last entry */
>  	__XE_GT_STATS_NUM_IDS,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index fa4db5f23342..47a9d1af7d81 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -9,6 +9,7 @@
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
>  #include "xe_gt.h"
> +#include "xe_gt_stats.h"
>  #include "xe_hw_engine_group.h"
>  #include "xe_vm.h"
>  
> @@ -203,6 +204,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  		if (!xe_vm_in_fault_mode(q->vm))
>  			continue;
>  
> +		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_JOB_COUNT, 1);
>  		need_resume = true;
>  		q->ops->suspend(q);
>  	}
> @@ -244,6 +246,7 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
>  		if (xe_vm_in_lr_mode(q->vm))
>  			continue;
>  
> +		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_JOB_COUNT, 1);
>  		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
>  		timeout = dma_fence_wait(fence, false);
>  		dma_fence_put(fence);
> -- 
> 2.43.0
> 
