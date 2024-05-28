Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF41EC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 23:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF1E10E4E9;
	Tue, 28 May 2024 23:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="friFENxM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FA510E4E9
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716937423; x=1748473423;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yBAopNje2LR98sr8O4B0nD3fmJqZA9l0Kt3Lr9JIM/c=;
 b=friFENxMx7NHr84xwDzLgp3DsD/7SmqewkJs3+7CLcKodQdjW8KPJYKO
 wjLeK8umKNUtpAXahXt48SJ5ExiHAP46yOxBBMTKG6oh9HGvFC8ARG1w9
 N+t56CK1osHqpOiaOzCGaIU4b1ZAs2Mf1yaC0qecbSoWm2G7e/eKDoOf/
 T5S9v1sHmoY3K53BFihinBRYt/bxYBFc95QJm7ZuCXcg5KF6DlIYRHWGo
 uIDtZ0d12DoWF7jfnE/XoLmbDsASNIhC1VWgWuj4pFxKG30/Kck6TehdH
 KfwvwGEl795hr8kD1gfd9t1rCdpFhbGYYN97xwrHpBeGR7qwLdR1mtTEr g==;
X-CSE-ConnectionGUID: MRHRS3WiTJSKPoMmzxXeJQ==
X-CSE-MsgGUID: IAkV+33RTLa5P1IPluEp9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13481960"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13481960"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 16:03:42 -0700
X-CSE-ConnectionGUID: d4DedY1YSB+G6BNncDcwOQ==
X-CSE-MsgGUID: iK+qUT0mShuea82p/bnODg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35315335"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 16:03:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 16:03:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 16:03:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 16:03:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 16:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGFntKzGFhubEVl9IkUFOw4+tFY8IYVtxYxBhchieAeGiCFV8Ly2TfKR+1lX67jab6Qc0eSlkPvFkJyUx8dM/GdP2YjKOGN+3V+Scb8eEhWWd9CQfIVYugM1/ZFMbKghFXkzDMUqflEZc3c7Fsl6GXWTcCzH06BkCxyCCOY2NQn8uA16P0m8cc5o1d6jKN8IgZrnBQcU7HH4lAp1T3tIdwsXpC0beXrm4YY96K4WWBh5NfDNgmviUD35YF6o65iBSOEyfKpT90t74aFMptl17TdSmp9Yb3cLwsd2k+mFb2Tc9qQwPHNaWWRvp1pSygeuuYh3Y65ur66KwJRoqaaCtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1d2dmB8MRI0LjHQWXJTTlkJE1stIYySSR66VNNdqJsk=;
 b=JxKO7zns11LDjvjj6Uh2CyJNZt8Op0RJ1bRg1PhMVoVT89GSM11CuMrm0BizobJj02vB0I6ZekuQtbQuOQQBPtdiEerDnwFFaVMh6HXoujbpLMu0sVLFEPVETTjA8iTXRfg23sPK8UHU87/rRbc/uOYxUUgRC+xUWsdH2kXIr71lLmAhN24ebRnkKPY2HIV6YHnCIKs55p56V0h3WUWSYMKvoG5IHCFYkpFRVJL7Mx/Gf1tJ8mk1Yr420eU/xfxOntBmdjo0Ub7wQg84FHc6i+Ns5hMnF5GvVqgGuhLw8jRquhVNEFg+bw0c7hkZLfpw01MRy9IidOmbSKk9xpD/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 23:03:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 23:03:33 +0000
Date: Tue, 28 May 2024 16:03:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Message-ID: <20240528230331.GK4990@mdroper-desk1.amr.corp.intel.com>
References: <20240524063228.127423-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240524063228.127423-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: c3afadd0-5a82-4aa3-e971-08dc7f6a65fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D30PJ2HcNVDVkFq+BGth++L6GJIXSC43NvhIULvOfJMXkIhkV+KZxIABdeng?=
 =?us-ascii?Q?OAyjqxd3UwUrfMEQVFLbMLOL+VAPreYELZP4z0dsgR7jd/n8MkspuitKSaFb?=
 =?us-ascii?Q?sfLkCgd/92HZ/Oog/E5Hz+AZLUN6TC2Mdmq2DvSBCKVIUNnJ5rqzjyuCLHd+?=
 =?us-ascii?Q?A6NFic6xCMZlquIxq7N8STh4GK2l3Fc+8H+KFEG7TnFjo/dHPmBepWcy6Hyg?=
 =?us-ascii?Q?QSycsCJEgYql70iAZj/2acWN0rrE5Oq8/OHKnrZal+ZS89f6f3l8Y8ThsRlB?=
 =?us-ascii?Q?Rb6XS86Vva6jTl0xFIKfm2y/ogWLrub3QAc+jU+GNoqwpHS+FIg7t3VXwfiK?=
 =?us-ascii?Q?2A/OpGvlzffrVHXWHdvFGdFVeRlolOR9teQliLuEjXjUBi85slJjPW2iWNnW?=
 =?us-ascii?Q?zHN90a3MjlCuemGg/H/PJgbGvFmjXbe/hRgozEjqVDodhrC7G0d2uZgmjolU?=
 =?us-ascii?Q?RdVsZzti69oP0K9ktSYnZwWSTupmyPRmOYLKav+ZizMhdg7baJxVPwx9hRvK?=
 =?us-ascii?Q?qORyK3n8h828wDqJj/bPRvax+FB4XcojGT2FF7JFfc4BcOYCHphJcuybTZcE?=
 =?us-ascii?Q?sIjmo88kjxAT+98Y3wSE4bDWYfiwzfodlXIg/pNVtXG1I0fouNsSVLfGeGGP?=
 =?us-ascii?Q?eWyPvh05y44G7NYYH/ciljqULxjQYLB0JtwoFz0cVIHDKa82VjbxAgEcsbYH?=
 =?us-ascii?Q?B7zoqf0kYJU5Ecstp2EiohxSKaV0nXEWLTE12nPwzTmv//xmHwZFAEhMP/LN?=
 =?us-ascii?Q?CqFMLnCBX3J8Ic/oVGlNgBzdyiDQk0XMWnh05q4BqXvQlssYjYGYWWKuWXnQ?=
 =?us-ascii?Q?IQ0XAalB4N0DT2N2lYkALhYVEG/H1qIDwexmDV/5Y1WX9DXXODnLi+AjEUB6?=
 =?us-ascii?Q?XQ8ZgYKATWl/H6DWCwekaXu8IQ0vDRX4l2ss4MQEQeKUWMh546V0ZOFn2WWw?=
 =?us-ascii?Q?N0c8rfcZ2gw5JhXvIxHa1BOeHRFxMysJbfIejQncbNLIvqdGZEMQKD9S5nek?=
 =?us-ascii?Q?SK7ygv5Ni4fAu3oBdKGjCe5sRfdt1yj/baOeH1s72QVzPiWYXG2vq4uo7tKX?=
 =?us-ascii?Q?B5TtwQ3aw4Qxl6ZjE7phbPfZrdGr0IAQu1B6+SNAEjyqbW/kgiDfwUlUdOAu?=
 =?us-ascii?Q?Nqf9nt9fTsfleRZG5UT2viGKxRmb45zPYXLBdtpXcueAXnlojXVRm8COfiZD?=
 =?us-ascii?Q?y9siI7/R2PdRw/4AXeHWrAwabwWNzWIzAFQDAJbHanCXVSwNY4E80mXX5vEO?=
 =?us-ascii?Q?O+CvF1v1+YIby0JdNwAgeRrCBPBX0mmrM4ZdrJmxCg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?28Y6IBLKOhBPG0P7iaRwvXxRqEBrqg7sJc9uoK6nlhRPZGnuAV21UNdKOhwf?=
 =?us-ascii?Q?nyWyKq6+6PwsPPnEVdPYL9eqVh8V7jCWB6q2KdEql1j7ba1W3mvyT1W1xIA+?=
 =?us-ascii?Q?w1ecuqlYkxSZ5z4UHZVVE8pnMk3cyDSgDyMFWFFT/RmO1O18eB4wFOljlS8O?=
 =?us-ascii?Q?IrY7zPVUefLv1LZPwrCdN9e/aJqvPTvzXcvUJ5SANdZ/T7I4yZyLiRZz5XdZ?=
 =?us-ascii?Q?7ZVI5YnKxDcCf8Z9O6tADE+rivJ2XxOnTmrYUz92w/tLyzf0lpedfDRHQ96B?=
 =?us-ascii?Q?5NGyoC/k0r7FtFjNpVCzXwwAgo3NTb2ajIbmwxArgI0xK6rJMdYPdJfFLfmX?=
 =?us-ascii?Q?Hq8+nQdZ1sXlhyqB8AkVpQaCx5bcT0SsC+ScVZqcW+02gH0oihuLAbl1o/NS?=
 =?us-ascii?Q?tYoloSAGf18lWMzudeplTBWbL8aJnr8UKZfX49qa5t/somm/pN2Rw4q9CPnO?=
 =?us-ascii?Q?vs0z8XkUx2IdpBkoda78FH8nU2hLkBSsjTbC164nIpdiCFPEoikxFLippFBM?=
 =?us-ascii?Q?yxYTO1/81CHT2fmm1FPdXOGyR35hUD2VCeyf/F4CqIyhKmbZRNY82H0hqw0j?=
 =?us-ascii?Q?OMqsk+ULFVs73mZs7RDwZZM1hYwxSyRLFsWDyYOfvacRlWQs3BsseCEauygW?=
 =?us-ascii?Q?d8SG77qpBjtvd0ovC4ILfp2KMNRirv+QlW29dL182TqwgJyoQuqdABv9ob7k?=
 =?us-ascii?Q?WrnvmHHA4YhIca6uOaXN98Fl5/vmsPmUINABKqeiEeDxwLnMPOylFC1ufJix?=
 =?us-ascii?Q?YYW6YyQkJwNjHKm6qQnCgqZXZZbX0da2l0K7ACXjqlEKPI44qOccKIlsbeRr?=
 =?us-ascii?Q?t7NABxkh4E7znPA7bEUtKN+YjgK3LmVQbldi+8Lqh+pXukq81rm+zqvznvnO?=
 =?us-ascii?Q?cj6wU2JisN0ToxzFRqhsQjNwtP7hQeGDrpNxzt0b29BhLFvWa2k6LIeTMLBl?=
 =?us-ascii?Q?VyXLGF1OExr5ghDUfMX6Z3LLxqXoRJw5tRxlndd0Tq/nrZUbjYP/jEojfN3e?=
 =?us-ascii?Q?2M/zFZU/B7/62g/aPXAYmPNXQMKGZ9VesbpF2k+M3y/XbvkINVyF86K0jwMD?=
 =?us-ascii?Q?LW1UEZdo6k0/1T1cl8PORKdlMlldMYTBJiqneJiZE3sWQhcXCKFRCEc1dS+0?=
 =?us-ascii?Q?KZ+xODw6IbQ03KrrMAIhnQncSpgR2tfVxzJ06TTUq3/544Y79CTMWXJR8j0H?=
 =?us-ascii?Q?JYuKKbUcxczkQNASQHktEnxT5BQPkzXJ3cefFGKzmeNPqo/X2/31KHzwZ5xA?=
 =?us-ascii?Q?+GBJglfJLcN0pSdFNEz3ToGpYN/hbrrem7H05SM0vl0FFxnPlZijXVOGXfZE?=
 =?us-ascii?Q?DVR4kO4YTWA8rpV9emIlOaRi48PyLgjgum9bvC3hpSiMO58ZkdxIc9BSDeJd?=
 =?us-ascii?Q?fHcS5Y84i3Xsn2MxlyPdEVd9DhiMzGY0EAGzc0U6JDGGq6HTIGMCqc4gOyIi?=
 =?us-ascii?Q?0AkQC14DfIJVZdYNDSOK5YImV1CaxcQZeY0gB29Mh6KcLhr9aJfR/LeIhxcV?=
 =?us-ascii?Q?QAZ1AanUPnySJTmEocHwuddKCCLtcc195L44I244B5Xy+fh51vuEz0TP9zBf?=
 =?us-ascii?Q?q1KzAHwIViPTGqV+PcdvwydprFMtUMr7YmkiONxf1knoUtoI0RLkc1Hxkvh5?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3afadd0-5a82-4aa3-e971-08dc7f6a65fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 23:03:33.5738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYOqs8tvmZpTOuI/Nqi/f9SQ5FU2w86lUSSjawHloFho4mICBWd0T5YF8bLJJ/278PTUrvbXJZujGqUrWdhonCJvPLAyWEkOlt21XzetsWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
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

On Fri, May 24, 2024 at 12:02:28PM +0530, Tejas Upadhyay wrote:
> Wa_15015404425 applies to xe2_lpm all steppings
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_mmio.c      | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 722fb6dbb72e..07c8a23bd7c2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -42,6 +42,7 @@
>  #define STOLEN_RESERVED				XE_REG(0x1082c0)
>  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
>  
> +#define MEDIA_DUMMY_REG				XE_REG(0x138000)

The workaround description recommended using 0x130030 as the target
offset.  Is there a reason you're using 0x138000 (which is a real
RP_STATE_CAP register that you'll probably be clobbering if you write to
it)?

>  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
>  
>  #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index ff7a7cf99530..e1dc87078387 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -450,6 +450,21 @@ int xe_mmio_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>  }
>  
> +static void mmio_flush_pending_writes(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!(xe->info.platform == XE_LUNARLAKE))
> +		return;

This workaround is a bit strange; it's tagged as only applying to
Xe2_LPM, but the description indicates that it actually lies within the
SoC fabric.  Our usual graphics/media workaround database doesn't always
capture SoC workarounds very well...have you confirmed that this applies
to all SoC steppings (which is different from the graphics/media
steppings)?

> +
> +	if (xe_gt_is_media_type(gt) &&  MEDIA_VER(xe) == 20) {

The description also notes that we need to apply this workaround before
issuing a "read to Gfx GTTMMADR BAR."  So even though this is tagged as
Xe2_LPM (probably because they didn't have a good way to express SoC
details in our usual workaround database), it sounds like this
workaround is probably needed for any reads through the PCI BAR, not
just the ones targetting media offsets.  In fact from the description it
sounds like it would also probably apply to any reads of the GSM through
the GTTMMADR BAR as well, not just the registers.

> +		int itr = 4;
> +		/* 4 dummy writes */
> +		while (itr--)
> +			xe_mmio_write32(gt, MEDIA_DUMMY_REG, 0);
> +	}
> +}
> +
>  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -479,6 +494,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);

There aren't a whole lot of them, but technically 8-bit and 16-bit reads
probably need this workaround as well.


Matt

> +
>  	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  }
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
