Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB3BC61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 19:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E586210EDC7;
	Wed, 26 Aug 2026 19:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOE4W2SS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCADA10EDBC
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 19:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787773092; x=1819309092;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IiOaIbjThk7nCh0oZjjgKztcXuRskFYI5HXpEr60G+0=;
 b=jOE4W2SSfpaBm//QvZlOw+6c2sfPQKu+X2F4owiED/qru9LIrA24dj30
 klgtyTqRYPslPYzFih4SUFTnCMdGOdhd56a4276qjmRbTcgT1WCfLuLh1
 Lrj2+WjDp358BQlytohBGpmkoLYfo/Fpl6bgxy9mXqZ94/UjnxlFed8jK
 P13W1jzIg5EPv1qK0rUmPlXwSz2mMN7b9t8fs+jlSy6D/szvkCv27y0uA
 UWaUkuKgDbR01+GVSxHiRCCfP28B9YuZEBCvtk1SctgWrlzRhrN5RSZgp
 8jW/SvnqEYb20jUZSoB0/Q5WFHmzaW6qnj8oxAA/dSJg6WGWeu9Y5xvnu A==;
X-CSE-ConnectionGUID: 1Bw8io73S0aa8IRdLyKEmQ==
X-CSE-MsgGUID: flHM342dSMqqZrU0bCALRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105641355"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="105641355"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:38:11 -0700
X-CSE-ConnectionGUID: cYyd2puIQyOOEIHBQISTWQ==
X-CSE-MsgGUID: /lmKPo3iQdW1s1e4HSqrPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="297554502"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:38:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 12:38:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 12:38:11 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 12:38:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDakEGl5wuAVM62djIUzwOfkvyWgH0FgkJ5x04N78L1EK8hKU3VVLveXLQpmNm/h2+q4ZqsrEP4WQKzGYhTnIAE7YyFO4SCubG/N0K8X266xhTfZQDYoMRXZ75n0xR6fh4Li/cipm6eLGct8phici+hxxlFunKg8v0AhyBRidU6T2PNlThFcGMCBcbB/3zPXwn71jj/f95rQTu9IFbWEWj78j8c3pDygyjOG6i+q4xxP4MWksLnj3m01KKR/r04RkSE0OH/KCjDH0eRflLIFWSAa9UBgWM7ekOKApN1eYeco+Ucjcwm83FK1gQMnEdcKfuBfv75MN3lC9ajqHTcFwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHUkMAYjqJw7Jnbqp5uxOyl/UqKz7T6/AYvsGnDJcPQ=;
 b=FFEWATRpPNL33afy+rqcyw/KcnhFMagsFgUKjkd2nJHHigUpo8/TXGOA3e4hU5RKsGURGdqbALD7/H6w7LIOktWOf7ES8BBi50n+wiAf2gBR3XfSYZKr7cFHMDr5Z4PRjTa15XXvOWktzLc0Oy7Qz/f2n+PlsQHfi0tJWSRiZPWBlM/E36ti2hnSxfFqMC7XgNnck6SV5eoAaE9503GZAIj526tXhqftvxKZdoRMUhWhxSUqZL+svuyLb/MRToIuAXPXIbfi82Yj2Vc6CKJP3Tt7nTvg1q/xguWW+N/NyCsA3tS/VT2vaS3u6dVY6dRTbTnrWlsC7e871O7wx2sVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DSM1PF21183B112.namprd11.prod.outlook.com (2603:10b6:f:fc02::145) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 19:38:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 19:38:09 +0000
Date: Wed, 26 Aug 2026 12:38:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p: Restore sampler fault for uninitialized
 surface state
Message-ID: <20260826193807.GI681121@mdroper-desk1.amr.corp.intel.com>
References: <20260824220458.520358-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824220458.520358-1-jose.souza@intel.com>
X-ClientProxiedBy: BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DSM1PF21183B112:EE_
X-MS-Office365-Filtering-Correlation-Id: 0522b5ee-d9a1-449e-7c25-08df03a98ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: o+rbe4uUDS9JAsJekPAuPZZ8ZGGWigTUTY0kFP85lnH3vq9a7P5sC60kYUq/zyK09ay8k46VMTV4fS6WGXH0UVH5T4AnPA875fGLoQtdc9ke/jVW+8fC+VrKeANA3wldiPW4PzEIfpVaf8hubP5KPYXpkxKxWozSX5sEQ7mkUn1JgLXapDBSqFdZEsfGId3TgNQfW2My/tWpqRk67GClGdTdAYSd498fU1XB5VxxfWR8fo5hDktlJOs2H6Q2A7gRSm2oc/kXU291CGCe4sREUAui1h+gRCVs1AoxOZR8ciHbkbc3jBPhQ6gSNA409yCAcaPYr8z3M7OZqUOvbphA9HROMDcKauJdQgTTqCpX5FAXHv821NmKY08rH8nmirnd/eBunlvf/DiBUzMteYo3329ZICJTcZhh71vI+seNN6NGGoepHnUdHI4NsGInvigjIEeqDEpQj8DWwIxHy3H7qXBDwdTsrXstx9KKG0laPBmsPtN/eH3+stkUJWWSwmtaz1uHnTZi2BPd12AYpLgUw3Jd2Xy+e86pDnsVQu29rLRJUcwZQ/wKvj2RvBBMIBsIfXU2D85vHSX4dAoHvJW6Wbq594kTQ0spqaSJrxt2D9ofYwF0FaCiAcbsbuXpT5KQWI2SbJ4leS6JiVjlCoawdD37Z8CBHMmnwuedCmhS2kg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VPrikDkc7yR7i+oHf3KedgI5DLue5JSA2Gd09f1Fhxg7Zag8gGDvrTauqp?=
 =?iso-8859-1?Q?zKf8/WLY/ENHEkl4NZJN8WBd2TX89GU6rWQNDDTF2oO3SbOCAJ3l2s7FcJ?=
 =?iso-8859-1?Q?eoW3RLx4nv9jsOj2xe1hxu+ZSEhYfZD5Wec+oMn454lx2ryump1KNObf7+?=
 =?iso-8859-1?Q?SSW0oKpIsQa7ws6Jur++kBjCuIIRrlSkNu7gjf8juqwAO4DsQNs626hdFE?=
 =?iso-8859-1?Q?GspxhB1nUNL0Oc1lA07yayxpngmGToyXv9Lkm+DUSElGZVJxLUBcR2C4lF?=
 =?iso-8859-1?Q?Za+ZOlVrekshH0CLgdjYs8XqRD7EM6chRmQFpdi9GMiCEcTRvtFkXSAXjo?=
 =?iso-8859-1?Q?sJzrMFxZfWPtfPpI3yHzsrQypIPi4rB/X9pEjAEsxd+4ws6iLt1YPwfhAn?=
 =?iso-8859-1?Q?kG+LSL6XhmclLUPH8aCfCQrmXL2xT/2ALtU27f8MqxgjZq/7pOMbv+PJqo?=
 =?iso-8859-1?Q?KyBClNA6fR3QmHI9zmDadI2jlEmuDg7EyqdollIhDgJ0+dcAV7x+h0uiqy?=
 =?iso-8859-1?Q?YjhmhOog7869h9yShEsqSDwiBbtt5U1FOx0rob8WnRWDEeXXV80RKpYjGY?=
 =?iso-8859-1?Q?boW3YBVIJgPtQWEcGIjYFuEKw2ayIw2tiqcuTxs0LMEfuOm+sJ6bSxj6Oy?=
 =?iso-8859-1?Q?GAgkHqqnq85Hg8AtZ3Fi0xsLs/mfTccsS5pQvlDrceqnRhPGAMPEnKcQLT?=
 =?iso-8859-1?Q?GBAFXJ8XKdQGjBw/N+A51yGivUlUjeKkVhi5dAvcFgEZPUKG51fkGInfNs?=
 =?iso-8859-1?Q?ANxhRePwIGvZyNmD9v+uykr9iidelza+JZl6v7oF7Lzar2MjOKPUGTyfMQ?=
 =?iso-8859-1?Q?9Nzgfc4QlxAkloqsg/SgeRce99da18AcrM18X0UfNvR/kQVtF5jHkiDeOO?=
 =?iso-8859-1?Q?4lnXotJgKiZc9S8xEAYwWqHVy4qhZ/R5imP1Xh1u7MK88iGPEOMtajyeWN?=
 =?iso-8859-1?Q?hScdeNzxKttijKmxGzANE4fud68cIISeeIwUJbs356yosTiETdOsZHrC4l?=
 =?iso-8859-1?Q?luKs3ltGtHf7kYP1UuHjatQRfVHTxOjunm/8SovoVBcenvo1ZdmQbQ364D?=
 =?iso-8859-1?Q?or5x3oP5NB85i4CJW6h3Ajst3SD8QvZsnLis7kmhrWdYJ60/CsXlnMG2Ji?=
 =?iso-8859-1?Q?bBkd7CE6EW5l34/USXi0C6szRGFSSzqqWNyQQp3ODF/lkyWjp9AySHDCg/?=
 =?iso-8859-1?Q?gYTVFyTQuUi6hYZ7ouR79BVma6IGYl4GVcr2OfST0haqtCHGoK0at+HWS5?=
 =?iso-8859-1?Q?5hRu6ctj5iZoQ6K8Isc2whQvUE7owI4wQgwEilY8jUpvd1N468WHAr5+R6?=
 =?iso-8859-1?Q?p9Y6sm3EeU+UHlTqCUwPpQa5s01/LfYZt8KZCvsIO0Hex4YorpF3ZOHyzP?=
 =?iso-8859-1?Q?HSEPkbXCOWoG0HkpgFeuL4/TBIVMwJL6L/P5ul8yv5zudOIzaUBdvgTkZ7?=
 =?iso-8859-1?Q?wI4RVXFv/+VOOHJm9crCGk+uvgXcYY/ocowg5th4yoE5XGRvRO/JyyGqUi?=
 =?iso-8859-1?Q?U9ZqxbNsCdY1yDUKqs/6YP4ubTHEzHqqnFTnZWzrLZ42DfNPcTk3Dh9rH4?=
 =?iso-8859-1?Q?Eh/lo3aLU9t8MdJRhcyhdAfHoiNTxQLtSOWe0Wi51GE/R8EoTdH39PAd7l?=
 =?iso-8859-1?Q?AOpm+BHIwvwE8e+y5WHG3YfFdByAgzxGowkxh2oPqI3uKaPVL8pbIVm2Bu?=
 =?iso-8859-1?Q?Q+dj0LEUBecfviGwLWV1ADZ/B6deDlmv9vb3y/YlnBoba7KGtI+gw3ATPl?=
 =?iso-8859-1?Q?EyFhc7ufIpl8jBLyoD+XuHcMD5q0SRY9LAS7qiy1qkms/6q1skKJBk91z/?=
 =?iso-8859-1?Q?ITbvkM2nqIZxdaWw8+ABwKU3aXrE2gs=3D?=
X-Exchange-RoutingPolicyChecked: vozVN2FOR/MUPVdnTU64jModVmDgS72PSqrSTnWps0zcL7nJO6gr7tS17J8ZG0tam8ta9PWnUlVsA+o37geCxg/2CVJsx/kkVIFsPRAMCteQfxmpE07/Ldv3HDFR81gsltJ+ejVzPyUN4iqT9sPCe7QOrx2FYGkRKZhA8ZwFskrjj1auGK29gd5UnYni3lIwY51tR1/EAF5/m2NlviWIFFTX/hErID/4ra1MV9vIUef3QuEU6V4HZCTJNKjM3GXfpsU9eJmWa0NjzXcRn+IDuioZ2gFwmcQ5ztqTPSrg4pdZPEAQ3QMKhgB4X3iWFAAEelZP9AQdn58vGhjrUM6BPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0522b5ee-d9a1-449e-7c25-08df03a98ec4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:38:09.2300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YRHNRJJNpyQXbFJanKuNRFQ+Y98dNlLDQhFjeXCvI8VOvgC2JX0mcgnuhkI3ZGQFM8XSJhJYsCZS7twqiKF37JjPHm3QvH2IFB6/C+IqA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSM1PF21183B112
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

On Mon, Aug 24, 2026 at 03:04:58PM -0700, José Roberto de Souza wrote:
> Xe3p changed the default behavior of a fault in sampler when surface state
> address is 0x0.
> With the default behavior some default values are used instead of trigger the
> fault, what would make pretty hard to debug bugs.
> 
> So here programing SAMPLER_MODE to change back to the default and expected
> behavior.

Reading through the tickets associated with the original hardware
change, it sounds like the change of behavior here (not faulting) was
deliberate.  In the illegal (but apparently quite common) case where
applications write shaders that reference uninitialized descriptors,
this allows Intel hardware to gracefully handle the mistake in the same
way that other vendors' hardware does rather than failing.  So it sounds
like making the change below has the potential to regress some
real-world applications (even though those applications are technically
behaving outside the spec).

There are also notes indicating that the chicken bit here is
intentionally placed in a privileged location so that it can only ever
get set by privileged software in specific debug situations.

So maybe the best solution to avoid causing regressions would be to just
leave the default setting be, but create a debugfs interface that a
privileged user can use to toggle this behavior at runtime for dedicated
debug situations?


Matt

> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 15 ++++++++-------
>  drivers/gpu/drm/xe/xe_wa.c           |  5 +++++
>  2 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 48c515d91882..e6e51d04ca57 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -503,13 +503,14 @@
>  #define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
>  #define ROW_INSTDONE				XE_REG_MCR(0xe164)
>  
> -#define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
> -#define   ENABLE_SMALLPL			REG_BIT(15)
> -#define   SMP_WAIT_FETCH_MERGING_COUNTER	REG_GENMASK(11, 10)
> -#define   SMP_FORCE_128B_OVERFETCH		REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER, 1)
> -#define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> -#define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
> -#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
> +#define SAMPLER_MODE					XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
> +#define   ENABLE_SMALLPL				REG_BIT(15)
> +#define   SMP_WAIT_FETCH_MERGING_COUNTER		REG_GENMASK(11, 10)
> +#define   SMP_FORCE_128B_OVERFETCH			REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER, 1)
> +#define   SC_DISABLE_POWER_OPTIMIZATION_EBB		REG_BIT(9)
> +#define   SAMPLER_ENABLE_HEADLESS_MSG			REG_BIT(5)
> +#define   FORCE_FAULT_FOR_UNINITIALIZED_SURFACE_STATE	REG_BIT(4)
> +#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE		REG_BIT(0)
>  
>  #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
>  #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 139434946f8f..5273dea83df6 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -602,6 +602,11 @@ static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN5, CPSS_AWARE_DIS))
>  	},
> +	{ XE_RTP_NAME("Force fault for uninitialized surface state"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, XE_RTP_END_VERSION_UNDEFINED),
> +				              FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, FORCE_FAULT_FOR_UNINITIALIZED_SURFACE_STATE))
> +	},
>  
>  	/* Xe3p_XPC */
>  
> -- 
> 2.55.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
