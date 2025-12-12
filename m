Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A884ED59D71
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 16:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A52710E59E;
	Fri, 12 Dec 2025 16:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkLv6JlD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E56410E59E
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 16:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765556317; x=1797092317;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PtN81VXhuyYTfS5ZgBmWS7VsTS1q01VALkSmu56tMbU=;
 b=LkLv6JlDL6uVXKJynDyNxJ/cRdNkonlle/QmCsPzCGBADou2cZBD/XsH
 fOda6Zy6pgddUDTOtTC38MenOEHiKZEAAFeciF9j8CpGsxMfgoWl3kfxw
 7+pBH49pWy1aZCFoERxkRWBMdOB86eJA9HBQJJfLJW13hbEKdFt0BQfIE
 FlBB5JNzymI3Ur0ByLpnY8uhG4xoGX+ZCmT6ByeGs0bb/58IihoXxNVs7
 EcEvVqAFrAJp8rLPWaNxh4V/e8Y+cNXVaZxAG24D/NkQxAjsWL7rR5AtW
 2+1JfMq8AApD2ssMXFCSp4ejsWana9Ubktk1k4+yjWpugkXWGGskjsNqz A==;
X-CSE-ConnectionGUID: 9u6y+C2JT4uIc3Un68EaKA==
X-CSE-MsgGUID: NR+sjlVMQbqvZ+yeWu0MIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78676994"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="78676994"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:18:37 -0800
X-CSE-ConnectionGUID: ieyJ4+lOT+2AsJBixZCk2w==
X-CSE-MsgGUID: Th0FY+UiSGe9sWX1YKB1/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="197185912"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:18:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:18:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 08:18:35 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:18:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkzXdFogPwrtIk9mcRywJxTM/jRS3LWnaYCHxVEgrKxJvce7CfADdPM2eLUDy11rUM3bwpOmIf6r1fBcFlDyWo9ngQmZj5rGAZkyGV3CY7pu05u52+WZMzJNXtohidEVPZ8N2Wk8+hNQlz0sZgJflgzDKWcq415pKL172XsSitUYXJAIDdrHLWAxPWrh1LnIGx89m4/D4Sy8pj1TtVgiPmdqkQetpKQBj/5gz5GhcV2VzF1MhNqq/XgZG7Bc/5H2cEUqWMdB5CxvfWUzrvfW4NCsFHbg6Kp7ZsULTwt5JRkG76qKMHecgDGXPfZgcgUYV6J5Yjp7lxJEqt1glLL9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TjEV8l871vXzMPuKVuSWb3WeIq+iRp7nXUoIm6856k=;
 b=SrGLDHg1obLtWfSOSbqMDqHuZjuECHQiBI4HJpUvI5rzsZf6MwzlJdSwqj4MuYSE/0+ddbbTNFegYXTeNodmUUhzMES2sySdBgQJLYtnet2nicrAyclJhs3xC/MrIf7s4WrsOZ5jfnt6DOzNlj67wSAERuzVTlL9Dp1btM85TwvmeT6mC0t2IoDOEZzflxzO08RwOfhzwXxnJwBRG1Fsg443jttLz2mVkeqhqErI5JXfsGjuCoiSZJRmLz2tawRWBDN+3Hx0GEyInfs5QBa6o+8Z0jLPjGhaoYFFwJwttCC07SH6ojN//ssGnqxLLU48UILFJzrKScaX4bK3MwLXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 16:18:33 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:18:32 +0000
Date: Fri, 12 Dec 2025 08:18:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Add more GT stats around pagefault mode
 switch flows
Message-ID: <aTxAUxUV3y/dNuAr@lstrano-desk.jf.intel.com>
References: <20251211210032.1520113-1-matthew.brost@intel.com>
 <20251211210032.1520113-7-matthew.brost@intel.com>
 <aTw92bivvBa2-1yc@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aTw92bivvBa2-1yc@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:303:dc::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA0PR11MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d98567-83ec-4925-ae2a-08de399a1726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u85iW5+HSwIWM/Mtn60onV+zYWLDjjDQvTcnFlbybkv41uvSochhoT0SEWsS?=
 =?us-ascii?Q?8kAQu4TuPD5r9jpKLJ7s092KHhBv3b808wp1/alCHzvxbW4hQagtdbp2FpF+?=
 =?us-ascii?Q?mKXW27+e1E2O2RQymEAtZRMpIjSXWNYfg93jLJAGSNqvWSOgZiJ45nuPXbdI?=
 =?us-ascii?Q?4xkPNtIE8XTOaZ/PhF6WuhhKwILeO6Pj5lka3Osm+CuQ08U3eZSi3jRP1ySR?=
 =?us-ascii?Q?jLVgwa+MCqgJZjWhqc2TwyLeaoPcwJ5AG1oCcRPZF6LL2vB/3F0iFo+nsbR4?=
 =?us-ascii?Q?FaKmI97gFJripIIJfXIPfgpMY5HrAaj7IcfaNRPA6EjU4JMlV2l9r8AAt+h1?=
 =?us-ascii?Q?l/+bgKg1wyVXtUn7idbHfcp1L2T285wVMTRgLTnCvaGWUN59Ti0hJnp++6Fc?=
 =?us-ascii?Q?Tg/wrXcjMVAX0ZH7G6rj4mHJORZUJsc0tdAz4OplTBkSp929GjSw6cv9SRfE?=
 =?us-ascii?Q?igW4FS/RxwEKOXNZ4Q8Yp8RDrYJaNwuiN0i2J4dO5RItSjHwVkUpvxlr+wco?=
 =?us-ascii?Q?b/Vw4IMZDfZiZGInNM6KkTGDnXL9mjsz2i/TpOZv3dwvX+nrNhszjUM8PTPM?=
 =?us-ascii?Q?Aq3i/6nqaTSi/bngPgm22dqIUyRyc0AeSzeqrrvFHHcvP2xWQpaIpF0Akk5+?=
 =?us-ascii?Q?CmzgeS6Tkek2bB0EE4qQ3cpby2rtRJ79UVkdPHRQWTjbFNptODqbp/zoA2kp?=
 =?us-ascii?Q?0WN3EImXhe3GtkiPdZU5mOr+WFa7uHxoyrVn9iWHWxyKiQSJ8NmNieUZS6bs?=
 =?us-ascii?Q?uJSFS7PALHXeKyAHNwgRn0sZmZr02AbW0PTMEZKpVShvlvFHXnJTKt9csnkS?=
 =?us-ascii?Q?zMPzxfXIkIcsbYcFLB7NhWS2vBn1OlnuUk1UiAplU+qNFrqWQwgN29uTCPEj?=
 =?us-ascii?Q?kVzjIbfp/nuynw9tHwlDiwohrNc5KCT6Q0fb71U8zyybzWY9UsTNLcQbBOld?=
 =?us-ascii?Q?2R8knGjX8mK/vZETvIs1tZ7EkbauYrvLChgmpQh03LGR2xdROf9BDZ+EBpve?=
 =?us-ascii?Q?LlwhALIiugHqYtgRMFtfnFrhSqTkwd8VLrjgbsfgT3a+Dx9feQ2b2gMJou1F?=
 =?us-ascii?Q?jEVu7IvlQOS0St2VfHBY5swSDSBhTQYmyOww0ovRtu7YLvSCP6zXSFOKkI3f?=
 =?us-ascii?Q?YFLVN1xuX3JTFu2g7+W/lBiTwtZlO9fgtSE82vz2gIZxk2kA6MxKp672zDz2?=
 =?us-ascii?Q?vGpmVLv75+vD4gwFjiR8K3xOdsF1DwexpgKb4n9KJTKf2ldb2tWc6CMek7LL?=
 =?us-ascii?Q?io3pbuRedJPXFWJsg0jERdd6NLIj3mcOG0JkGehDh5ZdrROQetRQJXzRFwia?=
 =?us-ascii?Q?6Yo71NBfKYmXVmmUoqnvD1PCCHB7aJ4dKzQNThnl8ln0Z0K64GukKutnUVyR?=
 =?us-ascii?Q?Zgwd6rCb+wrQZxZvlDhILlkXgVPMnGw/9WSsq9YNcwam4lUi2tNppzvW3xPI?=
 =?us-ascii?Q?kubmYth3eRSMAsOt43MprjzmIPb//TFQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jB3ikzrnowaINUp4piNQdbwtlrhTxmGqhvssj6oJdJ39vVMaBxr9yFFT30Ls?=
 =?us-ascii?Q?nWyOHR/ooinnywiC2LEp8u7T3cik3CGvuzjYaZdNiG8LqjRlZlUrmh0GFYfc?=
 =?us-ascii?Q?7lATPDu3P1MdtHzt5lk3pl7E2p3n0lEGUp1o81OcaNKTn/oYIv2rTQEh1KJM?=
 =?us-ascii?Q?PIpAgKbiD6+GyxWIpJce2JEq15AohLL3xhzrBde9wxIo/txftJWJdExXTpHV?=
 =?us-ascii?Q?oE/G65lS7esfyIr1cMcKhs7nt3oHAZONKHv6hnr45YIpbkcjT1381vEuipho?=
 =?us-ascii?Q?WW5QFjIIc/TlhPS9KcYUzJVKDnssu1p/9ZK2SPvSjGy2w22iFVUkQTVGOrWD?=
 =?us-ascii?Q?u2Bo8a4C6MnzGPYjmCez7My6RcUNz3CmYjpHWzUoZEAu/20eR6HUqLUPUtHG?=
 =?us-ascii?Q?rTXtoBiGK9/437RIa5fvSWZAE+zkCUcKzeIC+izTtHGQ5JuVel5WAI4emxBl?=
 =?us-ascii?Q?5MrEMFRTB+WHG/QpTwNISzfDen1S7c5uwx4NIHmnNG4KeMzBkDkTECkumbXW?=
 =?us-ascii?Q?nQnRMEAZeeebuId31TMywOtiVlKTEviJeOk/X+1152Fa1dfPmaRhxFOAKFXS?=
 =?us-ascii?Q?zOYaoCtJTYjYh3GMXcfXnU2aZm73p3UmGHF6DixRWdcylNdwpeyNa6RUn34g?=
 =?us-ascii?Q?gO3YgnVIqE+/B8rX7vDkiE+MQxlzFrQy5C1auIIrN0GJQIsXCF4poxwpWiTl?=
 =?us-ascii?Q?tlyWtTBrD3FCPsBXF1Si4Xp+2NT7pqsqRZs1VUWchP/E3amQaRbB2Wklwxq1?=
 =?us-ascii?Q?VDTW7V1dZLlN/NUOuC8ZXL0SMIAuzwm7z0PPzV+Z2n8KDkmaqHN6mR4sO3t0?=
 =?us-ascii?Q?fR0g/AexuAaCPfwACUl5oRZ24zQIbT4QzuL1Gg68DVNC7N7ymasd380pMNGI?=
 =?us-ascii?Q?VdvCEadMx4NCEBS7MEZmw5lGEGkDcKhLoeNBMXygBYvcBYeuo+8YbiQ7Z6gv?=
 =?us-ascii?Q?7uJDjfmZdSpXbe3wclSmsjvqzYo9VqIu/yzQqRqNfMc1W3D3pzzFeOmhRnIB?=
 =?us-ascii?Q?M2q0gV0t+9BgWv6Y86jHvCeGxexpFyIah59CBQBsgsGvYEF0lb0LfIKmOhvd?=
 =?us-ascii?Q?+rzZtVmxG1jg+xWjQNJqZ74/2m2jN8/R+44bJ+ekyY97L9k1yavTGWq9wIQU?=
 =?us-ascii?Q?WFbjnkFIQTb9v8o+EmH1pO0qOMeXYhrBO6rkIRcr54Pmac0KZ1ECiActrZOk?=
 =?us-ascii?Q?gomDuISW3wZ/RmTLobWRBos7SY7A5sPXDDWAJ8zw31E/eDmZ57R5JxvBYQbW?=
 =?us-ascii?Q?l+Z7wBufKYR9OmMsdQ9JJ+La6lh9/cW0qq+GTvUbPw09lwda208p8QAJx6cm?=
 =?us-ascii?Q?MKis9IOd7TdKSSrm0dUCIlyOBAgxkT9GjbBzKeGQw1WezK0TweY+QZ1u2ipT?=
 =?us-ascii?Q?yigTqt0+4TmO9sQf6zlCpqbpbUtHxclqQEE6ArtjCjkHWfYv9UzA7h6hbgwP?=
 =?us-ascii?Q?AYlX5XVIFJETks0nreVJj0TQr2jiYWb9ZmKcZGPiHtNc/eD/c6GmcaIChY7d?=
 =?us-ascii?Q?m17c5hAYjhuF7dfytwQoCQ7jJjeiMPxb6JDDADzVqKGiL6jIpS8bj3q4F62B?=
 =?us-ascii?Q?WTH6yETRjfzAOqRikJTs7Cfhkn7sKKez+OfzTrazedLksQTvt4D9ZX5Unwa3?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d98567-83ec-4925-ae2a-08de399a1726
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:18:32.0509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqZ7852g2rQ+02TMQTwmJFojcZFCALd9Zpem1X3d9VMxtwaNtGtZeewfkRBIX/2nHKzNqT7f6qAEKZ0X1Jl85Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
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

On Fri, Dec 12, 2025 at 05:07:53PM +0100, Francois Dugast wrote:
> On Thu, Dec 11, 2025 at 01:00:32PM -0800, Matthew Brost wrote:
> > Add GT stats to measure the time spent switching between pagefault mode
> > and dma-fence mode. Also add a GT stat to indicate when pagefault
> > suspend is skipped because the system is idle. These metrics will help
> > profile pagefault workloads while 3D and display are enabled.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_stats.c        |  6 +++++
> >  drivers/gpu/drm/xe/xe_gt_stats_types.h  |  3 +++
> >  drivers/gpu/drm/xe/xe_hw_engine_group.c | 32 +++++++++++++++++++++++++
> >  3 files changed, 41 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index 714045ad9354..fb2904bd0abd 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -68,8 +68,14 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> >  	DEF_STAT_STR(SVM_2M_BIND_US, "svm_2M_bind_us"),
> >  	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
> >  		     "hw_engine_group_suspend_lr_queue_count"),
> > +	DEF_STAT_STR(HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT,
> > +		     "hw_engine_group_skip_lr_queue_count"),
> >  	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
> >  		     "hw_engine_group_wait_dma_queue_count"),
> > +	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> > +		     "hw_engine_group_suspend_lr_queue_us"),
> > +	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> > +		     "hw_engine_group_wait_dma_queue_us"),
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > index aada5df421e5..b92d013091d5 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > @@ -45,7 +45,10 @@ enum xe_gt_stats_id {
> >  	XE_GT_STATS_ID_SVM_64K_BIND_US,
> >  	XE_GT_STATS_ID_SVM_2M_BIND_US,
> >  	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
> > +	XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT,
> >  	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
> > +	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> > +	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> >  	/* must be the last entry */
> >  	__XE_GT_STATS_NUM_IDS,
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > index 35966889c776..8236fdee0901 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > @@ -14,6 +14,17 @@
> >  #include "xe_sync.h"
> >  #include "xe_vm.h"
> >  
> > +static s64 xe_hw_engine_group_stats_ktime_us_delta(ktime_t start)
> > +{
> > +	return IS_ENABLED(CONFIG_DEBUG_FS) ?
> > +		ktime_us_delta(ktime_get(), start) : 0;
> > +}
> > +
> > +static ktime_t xe_hw_engine_group_stats_ktime_get(void)
> > +{
> > +	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
> > +}
> > +
> 
> As they are not domain-specific, we could move xe_svm_stats_ktime_get()
> and xe_svm_stats_ktime_us_delta() to xe_gt_stats.h and avoid duplication.
> 

Yes, good idea.

Matt

> Francois
> 
> >  static void
> >  hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
> >  {
> > @@ -200,7 +211,9 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> >  {
> >  	int err, i;
> >  	struct xe_exec_queue *q;
> > +	struct xe_gt *gt = NULL;
> >  	bool need_resume = false;
> > +	ktime_t start = xe_hw_engine_group_stats_ktime_get();
> >  
> >  	lockdep_assert_held_write(&group->mode_sem);
> >  
> > @@ -213,6 +226,9 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> >  		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> >  
> >  		idle_skip_suspend = xe_exec_queue_idle_skip_suspend(q);
> > +		if (idle_skip_suspend)
> > +			xe_gt_stats_incr(q->gt,
> > +					 XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT, 1);
> >  
> >  		if (!need_resume && !idle_skip_suspend && num_syncs) {
> >  			for (i = 0; i < num_syncs; ++i)
> > @@ -221,6 +237,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> >  
> >  		need_resume |= !idle_skip_suspend;
> >  		q->ops->suspend(q);
> > +		gt = q->gt;
> >  	}
> >  
> >  	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> > @@ -232,6 +249,12 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> >  			return err;
> >  	}
> >  
> > +	if (gt) {
> > +		xe_gt_stats_incr(gt,
> > +				 XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> > +				 xe_hw_engine_group_stats_ktime_us_delta(start));
> > +	}
> > +
> >  	if (need_resume)
> >  		xe_hw_engine_group_resume_faulting_lr_jobs(group);
> >  
> > @@ -252,7 +275,9 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
> >  {
> >  	long timeout;
> >  	struct xe_exec_queue *q;
> > +	struct xe_gt *gt = NULL;
> >  	struct dma_fence *fence;
> > +	ktime_t start = xe_hw_engine_group_stats_ktime_get();
> >  
> >  	lockdep_assert_held_write(&group->mode_sem);
> >  
> > @@ -264,11 +289,18 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
> >  		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
> >  		timeout = dma_fence_wait(fence, false);
> >  		dma_fence_put(fence);
> > +		gt = q->gt;
> >  
> >  		if (timeout < 0)
> >  			return -ETIME;
> >  	}
> >  
> > +	if (gt) {
> > +		xe_gt_stats_incr(gt,
> > +				 XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> > +				 xe_hw_engine_group_stats_ktime_us_delta(start));
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > -- 
> > 2.34.1
> > 
