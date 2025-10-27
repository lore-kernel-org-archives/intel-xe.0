Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96179CCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 19:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C89310E552;
	Mon, 27 Oct 2025 19:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBU/8NGK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CCE10E552
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 19:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761592661; x=1793128661;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7PNAHjTy6YwTZXVwE7iS5FZNYlWZ+ZIvKhhsXQCTeXQ=;
 b=HBU/8NGKPsIORljTbHer+wdUsK7/fPecKMmhA8FAearI8rWcTjMFb0ej
 rQW6xAvAp8MZb3CUWC9bpRVE4Sj1AoOegYxugTcUaW93hi/dNGorYXPoK
 lstp8Bcy/bQjZ45pqvtXbH2sZwmHs8uExDBX50EY1EixUItFy3XQ78DQW
 mm7ySa4kEPJa/CfBf/Ka8Dph3/Dxre2w03mDGewIkfm0OSDBhhyKZBTvK
 UzPOz5koUTYttyZm2IV24hHygCtKrWuVgRTcDy6+KSItBO8ltSjEH7p1Q
 QVIB+ugtLlv9ssQ+LSBb6HozOgiWwCE0IzmSmwD9Z7CPbEY13UhHAtJzS Q==;
X-CSE-ConnectionGUID: iDuglcjqQ928CsAKfFEA3Q==
X-CSE-MsgGUID: BL8UNKtDSFmiVS7lw38ibA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62714948"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="62714948"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:17:40 -0700
X-CSE-ConnectionGUID: hWrqnQgNTeu+QaKopz/cxQ==
X-CSE-MsgGUID: RPSLswuFQemIsEnEUcf+NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="222337766"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:17:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:17:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 12:17:40 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:17:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7hy7O4fmrJ4usgkqy4+g3NP/dD2Sb97+L+mhI4yvmG4sJWFAhttdP8Z4jmeBIBvf/MGxHMlNTbYtY0V4+XxEchxknO9EjGBeNsVGdRUOoUM1HcbDjjJV9a98p4bAXRsFhLxA7It3f0IEIEaJ/TTDunZrDdqXH3mYNcO6S6l91TFCAds5L4YfbKVkAyc7x/KcgY9agvc2I0AcL27SV/rpcTIAN8y/GxUPzFgUhNxA7i9EGI9lu2cATDj09zXvvsERWO4/l7+kqE+tE0gOUNkjaHZxYXbtNpndX8TbwLu5xyVvTZWIGMcCM/YyI9ya+9IvdmC6Q/RIyJPWCJbIerEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQD5iFYYctlT54vkimrrVjNaA4y3Ig699xOoyN6tDrE=;
 b=waCeGGUEc4tFdRad1Mc7ANiUvGpbGfYqniZoaAUBMlVdjPrkYLB3TGhKIuqjSIAiXi69SHqMTSSw8E0oOSRehgh25gq2+OlAIHKqjZGuEyN8Btev/+SUNbskg/1q642zyF0LiO71MSUNUhJ/jhx8xHh8ku+ZBcjCwo41L0Hf7mCB/WdDLovhGA5nUIs0DAV/vJHgQpAa480sIfzYR7LvAHoEn/dgiWLu+ivwBm3xivBFkIo7X0lMu23VTAlqlDQ1BqDrw261wlaKM/QhkxGgsfEnkm2AtcpmS38ZzQxZHR8L8eIT3JZHxCExsnQyEvzj5wb3+ZgRg5Hoyd9OhiM2OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8990.namprd11.prod.outlook.com (2603:10b6:208:56b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:17:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 19:17:37 +0000
Date: Mon, 27 Oct 2025 12:17:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v7 3/4] drm/xe/pm: Assert on runtime suspend if VFs are
 enabled
Message-ID: <aP/FTqwD8y4wT+6v@lstrano-desk.jf.intel.com>
References: <20251027123057.3738059-1-raag.jadav@intel.com>
 <20251027123057.3738059-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251027123057.3738059-4-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0328.namprd03.prod.outlook.com
 (2603:10b6:303:dd::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b19e3f-6344-45b9-92c9-08de158d7daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?msVY4oLW/MiZa+4TavZi6vKVQ3MFK8xPFcySMWwC2EJU7EHMbBu/9FcW2tSg?=
 =?us-ascii?Q?+/egEafY9C27RzTapsYJfCO+vx+5iYjLK+QkctrU6fqjiydSpnTS64FASQp/?=
 =?us-ascii?Q?MBpqje1T4zcexQm55P/bz5htFHUzoOY464ejo6tWcD9fp/Lk10lFey52R85V?=
 =?us-ascii?Q?NK17Wn+5Mxrs3DZi0Y55U8QoYYgGFfsqgPRV/GDBV7kmD4lEQYr7/bPoA5qL?=
 =?us-ascii?Q?oj9aLqAYLoCeH164LI+sI1CG+uXCWlg9kltfUzENd9h/gu0rttG4CBLEH1US?=
 =?us-ascii?Q?a09URpNubvKlcBf3xUHPVJs7JgyBoMiFde9+u4tzIIe4Ef/+DOIdAuN1/odL?=
 =?us-ascii?Q?y6tQszdqCjCTThdPNNXBBogYFVkz4FvBwhtM09Vfh2TDL257F9TwtLqSw+7n?=
 =?us-ascii?Q?4RfbLW9tbOre3CBZCzyNCT6yGmVpui53f8uQQLYRgpzVdvUeREj2RFgneVUN?=
 =?us-ascii?Q?CfqQIgBjgANJ/0M7mMzHV2AL4qvz++1c8/yHmKBr3rV/Ja/2ROTVivwCKHS2?=
 =?us-ascii?Q?lawhxLlwBiUeT+syClgKNP23UMXpU0edwmuDvIhhWkl/naAo0aUVi/eJTTL5?=
 =?us-ascii?Q?l6DbqE+2+xYRYocZWukS+RUUnxyDoKxCLscDEFqUULXL/I6QUSBGLrJqdh9V?=
 =?us-ascii?Q?0Z1bG1AOOAVv5r/Jn/kaetd+oJyGYnJblFj3Z7JfDixwU28b9wZVJ8TXUbSV?=
 =?us-ascii?Q?svDxmk3cfuwp1kSzfBO8Qo2YQKJRhj5a9D0mdNLoNNyZvTnRuVJi6scx5ma5?=
 =?us-ascii?Q?Y+hgrVMhxsKhfjmBL2+BHM6SbcuCIcbswJeFdAk13TzF+7GYzjcZTReFKO50?=
 =?us-ascii?Q?xi68ewJF5KYetc3Dyq+V8LjcK9qTtNvC8dL6rpLxz3aEvmj0B5xnv1bnLERr?=
 =?us-ascii?Q?/uHPH9Rl7tnxC22yteKH3R0275jLM/aWsXSjIug3YgDlf2f6Q1Nv3XdTC8H6?=
 =?us-ascii?Q?yNe2RAwhqADUdJf9UAQTsWoS3MLtUgcsIXcNAblb6HYlltNST2pYt6hnjILa?=
 =?us-ascii?Q?BQBrLzpPR0Kyg4ryQRk+csqmcubu5Xo+4Ha1DgJMMI0gKZAH9q2XQmYwklVW?=
 =?us-ascii?Q?odlSEHVBzv6KijqNdMN3aT5xh/eydSGct7qKp0GC7NxbbVy71vfpTkK10dwD?=
 =?us-ascii?Q?91VgnWq50HbcUBeRPeuFFqLq8phYFDnaYUyLrMc0LFE0UpqTq1VAEcExWmzy?=
 =?us-ascii?Q?J5v7WfBITgnYncIEuWZwHDqgnOCPrq7LrPerPhFpmZ/ppwDJRPHt8nLDSpya?=
 =?us-ascii?Q?IleKp2lP2vbopItfozTcVNdiTNSZlCjHK5Gps95D2t3lxnBzK3S4j9SXZx2g?=
 =?us-ascii?Q?Xl7ygJgU1OuAmXmZSSyACvoznkrG02CdHh4ynFdF1ldTnCNQzYomHkfFE2Uy?=
 =?us-ascii?Q?Lx0j6X/SJ90erBhqgHsanA5DHtiuKM96o3ZXhdKTEqIGjZLaoNWZBXi8aKrN?=
 =?us-ascii?Q?Yi3KHFda+xps1eU7gxEN0xup3kDJ/Efl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vlvRl9JSRQPbD/IAL40v+EK4Bh5jqztTATOhYWBVo6VEi5ty3sZbZ/Hb42cT?=
 =?us-ascii?Q?PlhQZ3sovqodvbS9yCJe24Lh5EOaT/tT86t3cR5RnR02VE+eIx0LN8leiUjl?=
 =?us-ascii?Q?HGusGDpFpZVhjTkHzL/H6Uo+fFC3K9b0ERLB+qnTideln5i8478JpVli9Awj?=
 =?us-ascii?Q?xww/gM611yo6f2puzPtmZQYeyR/u2GDp+RSMOPNUk0kPvvjPKxmE+faH2TwQ?=
 =?us-ascii?Q?Jom188OBr2VjxczLEPMdYZxko3dDV+UPrunLmmJnKwn2SayquoJL5Qb8uBlJ?=
 =?us-ascii?Q?i3EmuUsxRUgEpRjc4Kp2xXMvTmp1HYtgwrzSmWPAaLcIFiLVNplFWgHcBLjN?=
 =?us-ascii?Q?UYRHNjnIwiryLJWI1P3ET3Yxqgz3uwF9QApHPQAgtXreOZboBfSw+MT8m8k7?=
 =?us-ascii?Q?tmRqXp08SUpHeFhR3OVZMaA3BT8EOJRHGPTztipxPVDqK2uLgqzX6gORxdeV?=
 =?us-ascii?Q?c4NaccrDgKmMEjNwzqw5li8TY72BE8OhIUScu11C8MfQDvhteq1a/mQPqQ/a?=
 =?us-ascii?Q?+F/r4Qnm+T2a9KuEEaJT04OYeJuZgW6LYBHzh8sKDruYerCLiC0ZhapH/yxT?=
 =?us-ascii?Q?J/f5R5J30GGsZj3UoC62KT/LTAZyfb4czpXrKgcIvna9wIo2r4mZuTy/o+1o?=
 =?us-ascii?Q?+lLmaxLB68kG11JvTUS4fD8Ow2XaDfv9KYY7ylbuR8ICPoNmjMHdeBgGVVkn?=
 =?us-ascii?Q?COp54dv9VQtpxXkxWAufceqMblPId+5+Yc4wmT6S5ibkLw8V7m+pHeSppuHV?=
 =?us-ascii?Q?Yu36+8AVnu3ssczHl+f6iwfXuRlygGqolKr7X6m0/ryHEiES6yBoQi8ZkiaY?=
 =?us-ascii?Q?PvmvD59zAwuJIjr77Qt5CIa0qPLA9sVbWzI3+njEy91xV7IEDFcHNeKFY0Um?=
 =?us-ascii?Q?EzfusToWMXqh1ccPiSAXcvhmCiycUSSD6PpK6/qlYX9FX3zzaFeTBEPl4RrQ?=
 =?us-ascii?Q?X/SwcTgbi8mZistJ9/YGJJ9S24eWCIDAxCWvAydlT3/QMNnBDvexI3jauHy3?=
 =?us-ascii?Q?Z0+J8V43/RRrDtq5abdANN7LKSaFNBsuCTNt/EleuQsk//WNZ/kfB7Hc38la?=
 =?us-ascii?Q?xytbkWlGjXgEtvAknVS44ARvtt/SlqPbBMeiN7EFKM3akNUlu9ksO/ck5SWf?=
 =?us-ascii?Q?aEF8/ZRP6og72SdrESzwAL3asAnT/LoFWx1C6vVnJLBF6D9E6Cf9Z/6V3KTk?=
 =?us-ascii?Q?iGTAXQttv4U5agfnB1nkL7Iasizh5Z0mgtFyLA4AW8Tub+tcG9mqVDJ9YnyN?=
 =?us-ascii?Q?oA64tQTQt1XJh4f+Zbz9CznllE6lH9EsHYmg676Ia77gzPR2WKB/yzvWiy2Q?=
 =?us-ascii?Q?v/BcaDZ8tdMGhjO4N3tne0dRNpwlrT/Hgnzon1DIibs+6dvEueEJjmQbdoP0?=
 =?us-ascii?Q?Mqt0b5zqxMOtvx1y8PT1dsEuPriMCKCNeaPE+Gifgm1C7c+X7FkAHnLzFnxy?=
 =?us-ascii?Q?tYhEE2zU4b1Iri1l6tEA1kcD/f2+78APtyphWL32fj4noDmapIJlATWS6hk9?=
 =?us-ascii?Q?R4c1rLOaaI9/gcL/hoCjms3IP2hvpTmOmxl4afVzQvYtNOaFUjBncdOJCUgl?=
 =?us-ascii?Q?4z5S+bH/x+fvSKQv38QrpHaT/WaJ/CTtJ4RDJP6wSmWGvafhtxY4t1qC9MCt?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b19e3f-6344-45b9-92c9-08de158d7daa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:17:37.8008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBhoT84z77Nx2j1m1GmSmnLrASm1gZf+eFFuxPOxCYCfAo4Dk1wHq+bWnXvxlSnDsJ6TIh6j26BempxwefKgQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8990
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

On Mon, Oct 27, 2025 at 06:00:56PM +0530, Raag Jadav wrote:
> We hold an additional reference to the runtime PM to keep PF in D0
> during VFs lifetime, as our VFs do not implement the PM capability.
> This means we should never be runtime suspending as long as VFs are
> enabled.
> 
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6e59642e7820..ab4b8c48c86c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1152,6 +1152,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	int err;
>  
> +	/*
> +	 * We hold an additional reference to the runtime PM to keep PF in D0
> +	 * during VFs lifetime, as our VFs do not implement the PM capability.
> +	 * This means we should never be runtime suspending as long as VFs are
> +	 * enabled.
> +	 */
> +	xe_assert(xe, !pci_num_vf(pdev));

I'd write this like this:

xe_assert(xe, !IS_SRIOV_VF(xe));

Matt

> +
>  	err = xe_pm_runtime_suspend(xe);
>  	if (err)
>  		return err;
> -- 
> 2.34.1
> 
