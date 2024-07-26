Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4434BC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 17:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF30F10E249;
	Fri, 26 Jul 2024 17:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuGjBrOx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC8910E249
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722013379; x=1753549379;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7tsAAT//FoCctP3TTUtNTGAvTgWkeeHGrtkv2zJiGPU=;
 b=NuGjBrOxypyuZ42+2wqEzYQ7FhAubr1zioNSPkl8omZ6lmmu6Ex3kOWu
 WgCb61ADGPWy6dfsC8uIXxPnePSc5xM3bzjOHJw15TwjveKwHUr0wMhut
 HotrGTpvv+eIbiB7fEYofQgbLnsgP+VB7fN2j0SzHQ0lGPaJh5XcP/tXp
 buLS09evxO9QZP4lG2LkaYQMi6X1TWC1KxPWmoDo0kIskdW2ywz/h54KX
 kyezmECNwfuzf9kz4Ub4JsoHEh2KzXMeAV85SLD7Nt5w+VJ3Sb+nlqBT4
 qbllK0q4m7N+haVYhFCD+dS+84Et95vKbgaAims1MLR5EHT5ZfM1Ecxfz A==;
X-CSE-ConnectionGUID: N4llQE6eR/qQ+e6sDpuj4A==
X-CSE-MsgGUID: EWFlScyaT1KKvdN7WuweSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19956523"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19956523"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 10:02:59 -0700
X-CSE-ConnectionGUID: shl876cjRBCJEkawn8kCAg==
X-CSE-MsgGUID: u2BcQxPJT4C4xsJ/Vu94mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="57485824"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 10:02:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 10:02:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 10:02:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 10:02:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 10:02:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WP9GaGYFnWVamt1em7mwPbyQIvTqYUukNIb9W1162ryxXeIFsSps1usrzcwFl4XTKWLoz+z2MOtsZPj1jbR8B6mG7UxePv1Pl3nFK45Zs10JVs+GkZcFstx/i1ruXeKjVvsOGOmzeR+lMYzLprX+OeH6Ih7s0T8binbzXg7nqsJPyCBdmTZR1fgTFirnbwn8kZ0e/XoPn70Yrv691zbkZXOXH/C+aJGCJ6iw97LGsb44ywDD+Nlyx9IX3MrtI/g+8SsXwigDSuTduCdCtvK8cRGp6kdWYLqAFiUkVY8pTmZcax3vP9e8cIwFhUPE2ejzezFqhqtyv+QipPBtK+vfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1CLJkNWZpXocUxZafTxDgBvPmFUyhF8keiYb648vwM=;
 b=g4b9QXRHzr3OEq5EwDK4zZP38h1icI6ybNJJCbHqEIsgWf2YzcBGPBwuZX2Vr0h49rJBgNDqllnzbqI5qi0r5yVYQO6J8n3VG2pOT3ATu1Esxxv7AZtdrKUXNTbAeJmTj7yWmAOxRO/2wKDy6PkhUC53CIY5+Pk1HABMie2KFSpQ9AREvcY77djnILSm6ew1xughoVPFDr60zyqEMLzMxJM/iuL8SE/IPmW1Q9GhOSfO4/qEVI/hU5HfIAtmwBiByAb3Rcc5o5OmPEWWL7RVd7tUAiMHaN7waWJdBsI/nXopBCD3p4JIDnHGke5R54MWM8zMTq1cIWIAyDiAe0O0lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7680.namprd11.prod.outlook.com (2603:10b6:208:3fb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 17:02:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 17:02:54 +0000
Date: Fri, 26 Jul 2024 12:02:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/7] drm/xe/rtp: Simplify marking active workarounds
Message-ID: <bruygz2iyntxffeslwn5f3s4dn4dq6oymqdeylry53n5mgv4if@2baceiloowxp>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
 <20240726064337.797576-8-lucas.demarchi@intel.com>
 <172201237134.1586.8196077901199945907@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172201237134.1586.8196077901199945907@gjsousa-mobl2>
X-ClientProxiedBy: MW4P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 849b495e-0902-4efe-9607-08dcad94ca3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9b4uuGVhpzczHrRDJwzy6HmBv1gyGKoUo4ghGqqExVBHOERLctd5LjsGRM8v?=
 =?us-ascii?Q?twgluvHiO52IkOgnozuiPHR5DomMTDhG8/jQPQASnS2bb7xj7//NYwzFmgEp?=
 =?us-ascii?Q?yV1V0UTvMQHh4dty5xWo5BDSZEkD0Req1BVqLNvx1D+U4GkEiiArue7SfxIr?=
 =?us-ascii?Q?8NuPJUGUNH2oeNRvSoW8DgTkP3aOtHtOSWQ1JSJnvgxUng/3ukTWEJRnDQjV?=
 =?us-ascii?Q?JGR0E4juQrN9agzQcMzLQFpdN09FPg5q1YY1jSKGWWHFT38M5bITELJ6Xcqx?=
 =?us-ascii?Q?z5InMMm9Qyc+f8/wk0/QpZyffApubYnGUnDOEILG1Ffx3R/U4qpx9wQefqtX?=
 =?us-ascii?Q?X+/KiwqiFgMurhMdpSAqrfGwjwhHEIhIi8Y2LMDh63qMuvDyN5vWbE9/z293?=
 =?us-ascii?Q?ua6yVLFQEkuFF+dJNvyEUJopwTTm4D9SDTe4hC27a4mydnQPn+prX2S3f+Cs?=
 =?us-ascii?Q?ox+LlBGfH+7aT4FLgflUZKOxeMoFnfSsXDdYabk7SB/GkJSi+abBqcz+5E7a?=
 =?us-ascii?Q?0vpQXd2/6fPTHccaKNJahOyWW9AZAsES4oUNj518UpiZEhbOXb0hKuMI9o6n?=
 =?us-ascii?Q?5TZCoPrbop+HXIFS6MkAxbT8u6Q7DdAUsayRMjLGUvi3ErvM53Ai25qgPZiI?=
 =?us-ascii?Q?yF8JNFs+OG3gwA1BcjOuPDmn8k4T5M3qS4ROQ4N/8kA2Zvb2B6pd9/F7m3B9?=
 =?us-ascii?Q?TK7+LZL1LhM6k7sHlneMDW4Nf5UUmAQwY+tj1Mo/Hfg+7VbKaS85oFcaO1rR?=
 =?us-ascii?Q?1TlGhT7jUQOqjXdVw/HiHZ0ftI8I5FjCeVXF8PHP8m/7al0Xk7KdL3yXJv72?=
 =?us-ascii?Q?2i/uAaAE6YqQFVArSvb0BccKTPJ5k87fInQA9HQDadGd63RSnpTjUK649Vcz?=
 =?us-ascii?Q?HJ0gK/Tv4InnhlLoQQRWojttl75NmmV+VbsMjKJmUIITpII6fDwK8S1FSL0E?=
 =?us-ascii?Q?32DI29qnicgcpR33EhNWf/gQPUZA84gDTrKCPx8ZiPmVcpcPUlelmD3Pvb+A?=
 =?us-ascii?Q?7ilGwHTwGlwFipxmAZRoDB9RVQn7sNJ3oIfmZtPglo6xJl8l/DWGLF+e4FCC?=
 =?us-ascii?Q?bWJzjBsD4cOm154p83CLkHOVXlZYiSIZipNMUfrx3/C3f4fni7eWOXvXoY+U?=
 =?us-ascii?Q?is+6FWLaZdSjHA/ZW4w8Tby/fziTy9QLsUvRSmmec4lhBvP+3BkP/TQCgzrA?=
 =?us-ascii?Q?FN6ElCloUC9tdSZtQ5JIIdlI23mTOjWOFdwIJhkDzLTnLTeWOSgFFUbl/Hz5?=
 =?us-ascii?Q?PlGA79p0APpQ/WS0f6nA69k8zoifgfbd6S9BicFwFiBZMu/aPlIpRYNgbyxi?=
 =?us-ascii?Q?7anaS3rDaGM11pJXssofVuqKV9VMJQmmQqvSOpTsJjPBGw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YfX/S63lsDXgMuQ4AL0V9/n94AB2TnCKni/T1WKHyjqeYxa+VRs0OtJde9I4?=
 =?us-ascii?Q?nqDPmDMZce7s2qxWZIWYIhKFayqFr+ZDM938Tl8dHh180vVSrcJbdmD+fNvd?=
 =?us-ascii?Q?zzqztPE2fvEUrjthHcE0RVL4g8vy+poC2G4neZpIQnIejjahF5zpU1bb5GAk?=
 =?us-ascii?Q?sI9f2xXWTRqgaQeTBAMof8cAaP9URUhybPGEQ3sm7r1r+Hg76Zc6CD2kVSv7?=
 =?us-ascii?Q?hNqHTIwx11ZAA+y0KYrBxk0I50uLxn0DlG5HUtZ3lgePP7paVfnMA5i9cYBe?=
 =?us-ascii?Q?l1O8ZhvTs99+LOAYAbElvvftx/9Zsv7NH5jhr0v4C7tC+xQAvw2oCUnOrbzR?=
 =?us-ascii?Q?tkY3gv4ASjkQZ58GzjC7SwHvFaQICxbPIanygsspFLi84snKo2UymNGzb9AD?=
 =?us-ascii?Q?0lRLp1CScuEQW/hjiHlFwqbRANjhZ/Gf+xPgnkd72KlTWSNaAZm6pkfh2EDH?=
 =?us-ascii?Q?56S6yUF1L0NL00K/f71EA8SaLws6JKRnmej/T8zwTs89WpsFm6x59zKM6g+U?=
 =?us-ascii?Q?r8M10kMdKt86a9Dys60/DpbRKyGiYTdspNxLv9GzB1SN9Ek9/gApWPfxpf7v?=
 =?us-ascii?Q?zad7DGCWN4XZCzTFpupqBv71/tl5xbRsLG0NRQ4j6gE+1Vk9XnAh8j1p0YrD?=
 =?us-ascii?Q?KZgmQBJwDI5NlhzCHvodKkPHENd/U3v5y05mwEOe36LvlBv9MWoHyf4EH8y9?=
 =?us-ascii?Q?s8M04ZN2vnVv/kvEpvnq5FX6hNTh+nNlO0OSeGbC7/oqlqViUCdHo/wr7bKT?=
 =?us-ascii?Q?E6BpNL/vHOZT6BR1/XWiPzn4DIvWWmdhY9a1vemB+6G9t/IMCpUDdf5fkGvb?=
 =?us-ascii?Q?Fzc/Ms2vx/VeNZpShRKHPA3txDETHO/6cpj2DERlJqvkfYXGrWkjFC6s9aZQ?=
 =?us-ascii?Q?wMdJYvHtLgGzedE/KtaEHZ6bqDyz7vYSgCpTZxrzrdCIfQ252pzGeFAV7cd8?=
 =?us-ascii?Q?Qo3VveWEfEMfHutQH2KPZVpbjWRQVRNsaMqvzj3G4vZPLCNaruVDk549BT0V?=
 =?us-ascii?Q?Gvu6oiXnejPBgiye0gArQEqld1zSuaP0nHm/7VsumVFxNJD20w7hOMOYDfqA?=
 =?us-ascii?Q?b1Ydflh0dKGG6t0VIUdo+N0D2LeL3LfKJ9XKr+H5ySaD5AD42ftxth+ruyhE?=
 =?us-ascii?Q?8nHKQjJ++f5xlmCXWZsR5L2NIvOwmZLKet9NB6t8Cxm1LtpAX9C39LW2x0Ij?=
 =?us-ascii?Q?/WwcMhYZLY7GuvHrhvMMzf9Tvw8Vr+hx2l365F/l8/B7pDOr2skL57te3HW6?=
 =?us-ascii?Q?il76suMSYRPiUUxlQbIflj/67zcoV97DjOLZQznijHgEqLgs3WTh6inmLQuK?=
 =?us-ascii?Q?AFXpAzAJfpz2XlnVKHm8wPDSfCijQVBeVV9y59JA6cHDkJJLIJRWptANVWVK?=
 =?us-ascii?Q?HhTXHNzLO4SvCbw1v+kqctMDVtAMnrB3PUe+Zqyf3HzXyUD8F+eLBE+lAvjr?=
 =?us-ascii?Q?F52Amc3lrTykP73GFhfsfPr5EOLyz+vjW5ELZMEDIeeyigbzpK4UOr6PmR7y?=
 =?us-ascii?Q?VF5bSDo7nTKHL9dqN4pfDGyLHHM7xo0sc98m1qek1/HZMXIsm9imOm7S5VAG?=
 =?us-ascii?Q?dogqniTM0YR6/Z3tJzvtkWxnMms4DoCz9w6K6umOGAQkYzy03oWHu2KUj3cv?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 849b495e-0902-4efe-9607-08dcad94ca3a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 17:02:54.0797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOtNgBwyxQKc1DcVfFMcv7nxDMo73Wepte4EzQ4Dbe45nCu+bAt4ghGzZgxQySSxaCV5/xgwUgswJ5E2ut75xZKUmw21VjJH3zssGuo1uCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7680
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

On Fri, Jul 26, 2024 at 01:46:11PM GMT, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2024-07-26 03:43:37-03:00)
>>Stop doing the calculation both in rtp_mark_active() and in its caller.
>>The caller easily knows the number of entries to mark, so just pass it
>>forward. That also simplifies rtp_mark_active() since now it doesn't
>>have a special case when handling 1 entry.
>
>By the way, the "first == last" case was not even necessary, since "x -
>x + 1 = 1".

yeah, after the fix s/2/1/. I'm curious if something changed along the
way or if I hadn't enough coffee when I did that + 2 one year ago. I may
try some git/mailing-list digging to find out.

>
>:-)
>
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

thanks
Lucas De Marchi

>
>>---
>> drivers/gpu/drm/xe/xe_rtp.c | 14 +++++---------
>> 1 file changed, 5 insertions(+), 9 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>>index 1c641cc0f5a1..86727f34ca25 100644
>>--- a/drivers/gpu/drm/xe/xe_rtp.c
>>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>>@@ -221,18 +221,15 @@ EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_ctx_enable_active_tracking);
>>
>> static void rtp_mark_active(struct xe_device *xe,
>>                             struct xe_rtp_process_ctx *ctx,
>>-                            unsigned int first, unsigned int last)
>>+                            unsigned int first, unsigned int n_entries)
>> {
>>         if (!ctx->active_entries)
>>                 return;
>>
>>-        if (drm_WARN_ON(&xe->drm, last > ctx->n_entries))
>>+        if (drm_WARN_ON(&xe->drm, first + n_entries > ctx->n_entries))
>>                 return;
>>
>>-        if (first == last)
>>-                bitmap_set(ctx->active_entries, first, 1);
>>-        else
>>-                bitmap_set(ctx->active_entries, first, last - first + 1);
>>+        bitmap_set(ctx->active_entries, first, n_entries);
>> }
>>
>> /**
>>@@ -277,8 +274,7 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>>                 }
>>
>>                 if (match)
>>-                        rtp_mark_active(xe, ctx, entry - entries,
>>-                                        entry - entries);
>>+                        rtp_mark_active(xe, ctx, entry - entries, 1);
>>         }
>> }
>> EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
>>@@ -324,7 +320,7 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>>                 entry--;
>>
>>                 rtp_mark_active(xe, ctx, first_entry - entries,
>>-                                entry - entries);
>>+                                entry - first_entry + 1);
>>         }
>> }
>> EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
>>--
>>2.43.0
>>
