Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F86EDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1A210E8F1;
	Tue, 10 Sep 2024 18:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GXO7LvoT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B17210E8F1
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725993798; x=1757529798;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XIVFKiRurSSiMxPXUzrQHtSlqIC+q8V5rS4ohGQRqTA=;
 b=GXO7LvoTRABs5cNkK9AWn+Xs0warjSwgMWKPH2GhD7krDAkQI81Zv3Ek
 sCh5o6M7+4uHnuYNdYQT4ELvDee1OP0ijJLJXKR837TxHn1osDzDcDU40
 yPHz3VeeIU6qtS7qEeq2xpjNMZ6KlwIMB5QggPU94Vn2vPfdYImG2ee91
 mNVSJ+/w95aLzUKUW/olVLoWZl7hk4MHtw5Qj9vtD7CaLvtIlwdYfRmTE
 R5Q1eUB7Uk+sme0VTmlVixFqEfk4d+JMEwckgvMUl6ljgbGhAGDV9h4Pp
 fcLMl/FIin4vvI+ESnSlnf2pOeBo/dVMpYHjU31SHTPT+jPnJmFS/sCwu g==;
X-CSE-ConnectionGUID: 73w+x/TxRRqY75iPFBnDuQ==
X-CSE-MsgGUID: 5Zl/mUOOShyqWjJsWefjXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24630561"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24630561"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:43:02 -0700
X-CSE-ConnectionGUID: dES15JOCR76icUGhkHi/1g==
X-CSE-MsgGUID: u6gHwfcmT7yWVv8DHl+uOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="90403012"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:42:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:42:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:42:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:42:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:42:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFK8NfsWLSIaLxV8ZvXCsNTG8L6V0UhzbuPGJ4x35kPqARq5LloGLPB2TjfKwWbyrwr4d3NKqWDhJp1RpOsQ4yMl/Zup9VoX+epsQQyooDOOSKmoxny2eQCrdzgXIapnr4I9D81RFdL0QrUOdKl5m91PX88/KhH+6FG02RBtnzCCKm0uE86AvzVgaTJNWgoHQVzIPoc2womJ06dvDEuZLac3au4PtR3Taiwgo+4M1Cd3F1jFWYWY1S+CybxgxmNlkwY5caPeGumA6zPzDQ6n0HiduD23DlmNdhifvfgqtCRjXOlSz1E+yGVqXSZvO3eP2rK7ZgGVNC1UW9MA8NgNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeYgXK1FeSwg9FqEWAiD0oOP3tWzmEhP+PCn01/1XNg=;
 b=kyj8zLSzFTas+kazeg0QWY5Y080Vq/jRQdVF04XQQf5U1hbSsys5zvkoJZCo6yGfEyayNT6ja+/FUfZoEzK6tdXOPEfMw5y95XkjWGmxyCP8ymYpfrUwyrfH5I3SQf6uBA7leNCwVCHeGxVHoemJaGZYONQZLyG0wIRQSOq5HgkpSmlzxQ+AP/HakmSZ2SU4cTviO6e6u98IhezN/YuW8rEgh5CsMSyz07Rz5cTZNhP+mTSTB+CMmJLj5CBtYPZ3ByHVoXTuT4x380V0298Gs6zcPRDSyrjfZ0Ws/4oSgwgGJ19uxjf3D0+0wWAT4ht5XIHCYJizBjX6AsDE1Pfwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:42:56 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:42:56 +0000
Date: Tue, 10 Sep 2024 14:42:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 40/43] drm/xe/forcewake: Convert register access to
 use xe_mmio
Message-ID: <ZuCTLYZMeRrCx6ni@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-85-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-85-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: e3400f8a-e3e0-4d58-022a-08dcd1c862c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5hQyUGe1W0oV1QxNQdyD0GLwwUVJBOvbq2jRgOG4tLhe5jQxuOnHO/NIrb0g?=
 =?us-ascii?Q?6kuv8V19Pd+IZspyhLaYhrsYpNr3kXon0NjIM5DJEanqPFzZ074RlE8OF/Jv?=
 =?us-ascii?Q?wouRkkJselcwNNY8OYnzpfbUlYrDvw0H10JZnqCWwH15EpOZNM7a9yI/7KsC?=
 =?us-ascii?Q?/3Fk3r5mI+UTMlqFuDVj4EkuQR5H+yg9VZO43xNN5V5QSwt8JH1RhZftP6gl?=
 =?us-ascii?Q?+kkl2Tx9CzYDYEzhoMiczMEdw3nXg183/8cTRUNuodl//Mf+mXeWxIHB1dfn?=
 =?us-ascii?Q?m28YScJBbWy7S+afEZASmELqOgjhRWcmSSXmBTn9Qx1TvKeU96dqK2JYiA6c?=
 =?us-ascii?Q?0eY+GE9cKOZ58HVB7LW1Hp0sSt9Pe1cOgXyB0N1xeyLEtViU8t9JneyveeIa?=
 =?us-ascii?Q?Y5Jhv8U9GI1U5s5Q2c6OEdxyED/j4VqnFV7AWz/Eg67Zjj3Ebb7FK4gJ9Xqe?=
 =?us-ascii?Q?T+DV/01wcZeQWY1BIq2WcXQM1rw3FBbuoMzcIM2+NsUyBTww2Hkv9gWIStD9?=
 =?us-ascii?Q?lEULj8PsMP6VycLA7lZ1wgpgREOl4Y7Q8uf14ZD4VxlfepyPIJ1parhieo8H?=
 =?us-ascii?Q?02HuDVl7/uYbczqklDuEQqDR5KsCeIUa3jE3pKMS8QxeWKdWMadysnxBNC2P?=
 =?us-ascii?Q?ELpIW3mBFWfGXmAEgoPQtL4ITYPDjM73RMVu4yNfhK1a4MkHcUtE69jc+OwO?=
 =?us-ascii?Q?NTs+1831lEvUalhwA3zn0iEf1bDnA7RwxHqkUJAASnOI6MihUYh9FnJJLV6M?=
 =?us-ascii?Q?mULdPQ2HZjWfizaVEdlNCrhMlLckv8hqzRuU1PhZnCr33uTi/sb6XBMJ4aCx?=
 =?us-ascii?Q?/hJUB9674mg3WVN9lY9G6m6092a1CdeSDCtbU7p2c1qnd1cWZWgePkovpJV3?=
 =?us-ascii?Q?n9zJVfegxpUT6lTG5dVWspcG588f784e2qljA7MPjd9PWuM7xLDRl9U0f/h5?=
 =?us-ascii?Q?kLdkFT4+PT6MtWwUeoDIcGl/w/TvJKcS+GrSO7koGcKVPchy2jKlGoxEk5GJ?=
 =?us-ascii?Q?LfEVdmmowDiukgecFxTyrArcmibpV+CsQVJjp/vtvTuiMJ0GxIzLloaj6msp?=
 =?us-ascii?Q?BEFaT2NNHzMq/TKEtg0UhLPqiMZjZ/OHrbfHBevtFSYSB9cx5njPyDXYA9ZY?=
 =?us-ascii?Q?PMveRo8MFuzZzez0WE30kE+zcTfHVf/aC6d3IwXvTq0fOnBVfhe2C7+EuXvs?=
 =?us-ascii?Q?u7j3NxgxfK9I7S/8XtM/rgLU5zp4LQWRE6u1QrdP7u7GkJTSY06CnCSTElcK?=
 =?us-ascii?Q?SBGjjw3AHCzCsXA3rBpJapp63zmZcxpwSOs/yPQCJceo/0GGOCQuPk88ELU3?=
 =?us-ascii?Q?3fy2ld0pTr3LeycuWxwtBUUe+8PqJd9DU7hQWF6FMsnJ9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IANgCP8dygYlQ2ckC/yFuUH2SUN8HLbbyfGagrkCUjG8x5JLsG1eRb79fXtU?=
 =?us-ascii?Q?x3k+S+Ui+kqe6bgZHx7NzqeyHevds1JlZKHbEp/gGK3tjEeo/SXOkCLCtHZm?=
 =?us-ascii?Q?5fkU5sVcwZSlA3hU+A8k627NpXPcOwBJddoijMfcM3oIuFALj0UGg1XRTEEe?=
 =?us-ascii?Q?JPvzawM4dm9QgH8jMIa28uugoScWjyMGRQrTaDfP5ORspbtKddyMylCivs4K?=
 =?us-ascii?Q?KJBFlfvZPfO7K7e8iZXL+SpVRVbWbEiHbx5U7ELhPP5EhSzKBzNloJAwemYK?=
 =?us-ascii?Q?7TEuImlRh8WnXz0rCz/yeRvCqGzy4WZd0PLTiOM31LBUu8d0zpwgwO1RHW6K?=
 =?us-ascii?Q?sY5+u3Xzf1Ii7vn/Ae02zi8uU5Y8fhVj/xKKGDAHQCpe+HzBRR6yIqsJXkDo?=
 =?us-ascii?Q?pBwFlGGfbDvBKl4XcxI6n0KQgXKXLPaQ+ZhJ77tfz1VgM+HID2W+JvituOhl?=
 =?us-ascii?Q?NjM2DuxvC89433VfOgFC28bEP3CbjDQm8Lm/SrQLW7cDHBYjh65ercJzLyWg?=
 =?us-ascii?Q?Q3JPMciTs/aCCYvEAPyNtf2HwdnIhReXzeNVwQEi7WZglQDvplLNRdEvAXUI?=
 =?us-ascii?Q?p9oteEaZXFfB0yqPNoTC2WzWP9fRtr/7tdMVIfb6JdpweLR4oy4XT8P6433c?=
 =?us-ascii?Q?2AlCEhRlcaLmErzNQUBU8smf9nwiKYbNtJpBg18FUSziyI0mLIZkKW/SQghq?=
 =?us-ascii?Q?cZLDvUYya1xi47PaIjYVnyx8mFMFr+60JA7ba3d15iEnW0lZnig0ZTcB405l?=
 =?us-ascii?Q?sCq83xvwpYbVRxeKZdAIPjHTe6R/wsDsYF5zRxYfxH8jDJZiC2opEz6fNet3?=
 =?us-ascii?Q?lOqev/wNdVrKWYxvud1rdcCPPudDyek1sWciiKD8feg02tOgK3irNeck2H9s?=
 =?us-ascii?Q?nCgC9NY/AY7EtzJf4aNfXw7wMJBxvvHWwCrZOosWQkPdiEoquX4dflhpyP/1?=
 =?us-ascii?Q?J5SAK4V3gZ73JKodzW5N136CqFsKcETmTASgXRytWtO2eoPoQkGtrDJC18Ge?=
 =?us-ascii?Q?Jsf0bcBFFMqnr2BvLW/U4GwQffI5gfV174KnOcPKZ0Xl+T5sjTov4LYeYDaw?=
 =?us-ascii?Q?y3vw28ZLsV8sM1GPW6XawD94F61gl+OpHxmP3jpGCAhtlq5HSK9hS/9GhXQd?=
 =?us-ascii?Q?DFhID2fYfnpjiTeFArS9Bluc6RbyI+KlKrDFsx5cfcOdgNZDV9NZ8vhhVdH0?=
 =?us-ascii?Q?W1tXORqRwb/BsPTTMB5WlxSVCgx5Z/W1lXkodjgG1AicJmrrwTRqRN8a9G8+?=
 =?us-ascii?Q?WjU5zDDeyVNKamaqipx1A56SEEF9Sm4z/7JJJ1J6aDGesVF0Uih2TOmK1Z0A?=
 =?us-ascii?Q?mvqOMZ+W/gPcahcCBsmNtOt/OptmlUB97+XiLn8UYoZxxZQpqVCoy6bRH+/+?=
 =?us-ascii?Q?FktQV8jTtaDoDr/1mQSmdZk4Y4s+UX2mNxvIFRdvG7das/+uGE6D6LAY/Zae?=
 =?us-ascii?Q?BAhFzKGtCJGJqGsyoDy74xkJTJvMvr/uIkJBxTUWgvQCGzr0xl9WGwJirKp2?=
 =?us-ascii?Q?fc7e/gW3U6IHdT2cH79OnKjMZlpIvLTmWUuVRXMYTXpPV7fSqiBp/q4YeX14?=
 =?us-ascii?Q?EM643xRGrI9wQYL20B2YxjkauhSGkBkwVozVtCVVqX2q4y6XqeXvdoNGTGX4?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3400f8a-e3e0-4d58-022a-08dcd1c862c4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:42:56.2610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBh67A3PE9eubEKmJHZGLVIX5Pi3HAui+PVv6BAIW1dnTdPVnw2LslMP9NHtpvPfHhxhrP6Ab++J8QH871ImpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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

On Fri, Sep 06, 2024 at 05:08:29PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index b263fff15273..a64c14757c84 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -100,7 +100,7 @@ static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain,
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return;
>  
> -	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
> +	xe_mmio_write32(&gt->mmio, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
>  }
>  
>  static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
> @@ -111,7 +111,7 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return 0;
>  
> -	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
> +	ret = xe_mmio_wait32(&gt->mmio, domain->reg_ack, domain->val, wake ? domain->val : 0,
>  			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
>  			     &value, true);
>  	if (ret)
> -- 
> 2.45.2
> 
