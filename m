Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5858C44501
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 19:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736A010F260;
	Wed,  8 Jul 2026 19:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3XqeBby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6523D10F260
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 19:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783539683; x=1815075683;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4xKf7kBYbCmqGOovKV0ks6dhf2eqqYaqsK0ErAJoDa4=;
 b=E3XqeBbyKAw2zXFL4R4slneQeCwVpmk9hETmMUNIV9aLWPOmjwZAzd22
 CblbuA4GuIcL6B8UbihX9wh1dW2u1RsDww4nGJC7u//oeSl2Jx9kNnvBo
 3GnYtRxs+qtfJpgajhuOZsNbROgyo3KdDF36CARts4s+drcJJeBbr4FNS
 BIhDB9tadNLnlKjgGt9gAY4XXGhumvO+gwgy0rKsIz4er9pQ5p6EbhpGc
 gzj9YPrpL9KlqCxiomFKlDMdDtDSUjx3wsCY+9XHx7zYNPmMiA5VOpGxf
 KgPyHU6BsVgBhwjgEnPRyEwe1Yy083ne5FNaS1qIVYOqIiE+TSQr7p3qA w==;
X-CSE-ConnectionGUID: fvALiXc3TbOhNXdp2FvQ+w==
X-CSE-MsgGUID: +IdB3w+MTvGe/AcVS029xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101641417"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="101641417"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 12:41:23 -0700
X-CSE-ConnectionGUID: nN95H7BIS/moPeo3Mof2Pg==
X-CSE-MsgGUID: 8wJVuUIZS9ypQR5r5ca0Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="250380615"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 12:41:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 12:41:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 12:41:22 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 12:41:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TiEK3Bw5d3B6d4J1uWgcMwjj2g5GUCu6M9ea47MYkHWJkxhPgs8vThAnAj6zhN+bH9B3zYqYg7qFg53BicXzgw8Ilit+zU3r7eYA+ShLV8VE1ZcvSiElxsJ+sCicd+gRon53OtxKfOtbxGM2PIjU2hIq9l2EZ6eKjBzk+v15VKKvres3OaVEs7n4+5h18HMnwGHgDyIMwJpCsHufH9vatE2mbls4a2U/ZlLKZYmP1M+OfmzpEileThcYkpR61Umf+u/BbZ4angDbIFoyGHACVsI7kVRQwlz+c9g7QmaIKOVQqgbevGV88C8jZjq93rpXcxnLH9P9npIaBnqc4po20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJSLPVfeo2Dch2WpuQs9UjPfiMl2FL7ILF0FSyBtrxI=;
 b=brrYkMKmmfj9o8/py7vVSgok8y+o1+zjhFKJl2QEz0l2S88NmrOHl2lguJ60v7/Ewwzud/OsQQ6Vq/2XZj8OcKycjkRUiMI3uV+GbGYey6GkclOOplmoNVfnRuVEZ0bMbXpi+qDGXS4LZgQ2R3sO/Ulk6aNRUca9hIqmP+Bd7lsXG6lyVoX3v2jAGvVu2YfGekdv9AywLhOoXRdJfHdJW8suIPgaA+knbnUkB8hi4AYJ2eKfTWBbecVHK/40V7hwAYWFt1fFFCmBTheTmtVEKSqggp+ETdVVj7HrER05InfFD2VMPHPci78LIH+RhTjUZuU2hbQOBLiDicPhnLAVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by IA3PR11MB9376.namprd11.prod.outlook.com (2603:10b6:208:570::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 19:41:14 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 19:41:13 +0000
Date: Wed, 8 Jul 2026 15:41:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: Add sysfs for GT/IA bias
Message-ID: <ak6n1pBJ8ILIJ7fm@intel.com>
References: <20260706213636.2743937-1-vinay.belgaumkar@intel.com>
 <20260706213636.2743937-3-vinay.belgaumkar@intel.com>
 <61173c7f-5937-4772-9c47-aba57b5868e3@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <61173c7f-5937-4772-9c47-aba57b5868e3@intel.com>
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|IA3PR11MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d0be2ba-0eab-4ed1-9fa8-08dedd28dea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|5023799004|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: aOKa1PzFYqJvB21P50+M6m1dLXvZ6ptpVpdQtxSgfaSSVDsskv/vGZUSTX2SpvLAOY7L28ngwCaxQcvFYKKHFmzeg2W1r+DjOgrMhHacelcwTD2+4rEUQxi726u9BbFO9LqyYowZQpEVGlngN7iBGqibLNuW9p+J/Wr1r5Ggrtrwkq2pkRxMCpEtnDU/ciCqgi4kBviK3Tm2phwgoBqGCcRdF4F0C4SxEWRgs8y6scse3VfGRp6yiQDqE+GuRg82ec1TRaPwGggvq/QRHz6Ce8yZcCEkDCzCBFR7m4ZwwGBQcyg353LHu1du5Y9iq2zwYs0si74YYIiLtCnMDYxc7150uzBn1eveDvLFRNg4Ks/fosAiF96w+MXys//oanvf1u/e7SyIdJPN8F1d/oc+j7LmTl5SjonfO1psKGaFMxJ7bY1O+XBGI0eEFcyb4Ies58BC4kQ5eIjiVR0xyg2eM+UwdgxNiAme3RJa48UPCSBMuoQeJeWjERwkXmS7NjWL9CEeIQoHXXrRIOVUmCKNR9K7TC4B78xzTrvATBlsuCnp+2O5neCzOfLQ7gqPbfNbDvHKJGeJtkeb1RMRQIISIZqUoNz+zvSw/iLiQXBw4DMAQoh/uKLtiWb5C9LBpn3prtjGMXfnjcMxgXnuKTuhdhHFveydd5STxoSnGVbuuHw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(5023799004)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1k6kfW+TCnwDuEfpozD/R/o5x3EfgA8CAOppo3ZSpqf4HicxC4qpu4B43240?=
 =?us-ascii?Q?q6bcJ/B3CxmC8Tdj+R1fpEurVm0oiJaHNSnJde3BoEAdAyCpbuqd9Pb5Rrr7?=
 =?us-ascii?Q?7lBZohiK7XsxKg60T3GxOedz54OspsigKLDvOvfugzKAs/y0Sj1iLQLAfQ+y?=
 =?us-ascii?Q?AxEQ1lCzMYLj89pc8rBR7jV0v+59Aq/lXkHNth1LQ1YneSAJRz895/dvl237?=
 =?us-ascii?Q?1jWBsDIr9lV3742QZ5jqPZ+1JooByP6bqaHSDcZVn1Rk5jS4Q0KMqmfgdJn6?=
 =?us-ascii?Q?2gVWUTMUREH4hQVpIxbj0ZvxY3YipwXEFJZLoLmD4bGPWQxmJRJfRd1KLajw?=
 =?us-ascii?Q?+o9svqgnA9DehqwM2Hf+1hro20MVs7OjIJ8ZgCw9SkLkXYELRbqizoSLkax6?=
 =?us-ascii?Q?AYtw1umjGYQKn7Bsj6L5EUeYOnnLJ2oDLubrjdv/fyzKgcFHyA9CxF+uVbgA?=
 =?us-ascii?Q?4hZYehDe0ShC2iHb4laakpY9woVq+Bsgy0pqHEVlCGM7pSwiYYhxps+MPzrF?=
 =?us-ascii?Q?dRTTivT7Csq5dOH5nbo9ZJRTIhoHEWKIOKBpGxnaleTRy9HF3YrAQqsYVyaG?=
 =?us-ascii?Q?d5DE2aRzmrpraoo+ig5+RVXcpuh1KpENV5vzwnOQCTfGzMGZ9EL6DSiHyeS0?=
 =?us-ascii?Q?QaOCEfTI3aC9di8ija4mAFTmjTrt6CwJ5B990wZixmi4OKGOyTPQfBpy26uq?=
 =?us-ascii?Q?BhahgZSQiMgMeCAz/uuBCm2MWk2fIv4fmctfQ/B4jXM8zbvLGcW2V7yc6vbL?=
 =?us-ascii?Q?L3bvB//EfFeycqRs46FN1yie6IMxM2G/IHw6VdsZH2+TZa4Ie4dOl7hWB0/S?=
 =?us-ascii?Q?k4wb3rA9Bi4qokg/FAJcrexD5CpF5l2L1dE+jXOBY8qj9RzHYN7nA4rHYcPd?=
 =?us-ascii?Q?zV9lGKRe7ji4R8nh+O0LAoyCYpix74GV2V0XpAofvlg1ARzy/iJ4jMc10NoD?=
 =?us-ascii?Q?sl+fEXAGxx/pX52pjGddpT8Y7wYo31HrUqoPzd/8dLlEFU1iiLt1JY5SVxT6?=
 =?us-ascii?Q?5AfHlii11fiFNrDpiIEGaFer1clUkQB1TXKFlBp63xmuWSH0aYitM//VQXxT?=
 =?us-ascii?Q?3vXS3rFUpgKJZxVTHLFUyj1lu6LI5GIJNMcJCrb8IiMvFeeFGjMtvsDHD5HV?=
 =?us-ascii?Q?ETXU/Tsq+zrApTIb6CaBRQHzZnJmV2O53Tg2FeVRtk0eGSMO9r9SfEdCdKXl?=
 =?us-ascii?Q?9lBIMFmcxFG6yprr9QY/R+zX/4d1PcQIBOf5f0btGtTbqfGANpSe5Dx590HE?=
 =?us-ascii?Q?sUeCyTw3VfNLB6bckzxdwoW+btZEy5HKOxUNMqIOdMsCpx2xwoFTQQgMjXRz?=
 =?us-ascii?Q?sE2qObey9H8a13k7t3P7W2mokzMgot2/JUG3pnpGVpupToUhhNdanoTsF2S6?=
 =?us-ascii?Q?j+LwMc7jn/TJo+NIPaSx9kJ2ixGql/DnWYiiqkEuKFwWVOLEmRhM233yXn4Z?=
 =?us-ascii?Q?/c3EnQ1OrlNUpD6c4xv4eCLETMM4zWPjK79lCXB6bK7cf5+1t0SRfw0HWN6j?=
 =?us-ascii?Q?sHG018NNfzhtkQQa4Yfs5tdvIcItfN/id84tjtdfAfCjkME8Te2Awr9Icn2I?=
 =?us-ascii?Q?5CpiCY7vzllb6VimSKsdt+wTyIWgqwd+aeB9a+5q5/heeifUCS1LXFLA9R9b?=
 =?us-ascii?Q?F9HZdMpAEKFGDEmpo8nmz/2jNrhBpEOfE5dgB9coe0CkbG8bA1x3QKV8csmC?=
 =?us-ascii?Q?8aORHUYU8nQWyBNzBcbQ8KG9t5tXgIhxpAOX8Cphb7prgYz7VSqQBTOTk7zY?=
 =?us-ascii?Q?Juui2S6cwg=3D=3D?=
X-Exchange-RoutingPolicyChecked: bjbblBkwxgMN6oiIzaBdvqiG2WITOTMNdVWFKOmjOUuJ/WFHYHdX6wDloHwmoEcoa3Yt4ArF5uLDjoc0kn/b6FiOW870goedRMKqJFvJdHglu145PRHuxRcg6iedYOyA2wtG4+vqMZih6DyHzqD878/7jrSz+YPW7nsIzmd1t/R5KCkpGYMYudBoJ2S1w4i/ls0NNLuCKBXGFNs8/i73rnwuz9WmyyHJwakBxN9SFhniGqTzOamtO2zigRvDa6B1fs+J5A9om3iYUXBYJWV16XZm7GvymAqdIPAUf6pZA+81V4KIz7o5xIvNxMqyGQKWlPNmSxgtrxCZIHPiAqV+Bw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0be2ba-0eab-4ed1-9fa8-08dedd28dea3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:41:13.9219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlOUHn/7zUWKSAHG5UQrDARE7dFdiO1Nmd0w/rqHjMGhHVPcps6qDWU6LnMGXBgfUb5bEsEMpq2bcYkYLam9ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9376
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

On Tue, Jul 07, 2026 at 12:48:05AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 7/6/2026 11:36 PM, Vinay Belgaumkar wrote:
> > GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
> > Lower 16 bits correspond to IA and upper to GT. Higher value
> > indicates more bias towards that plane. The values are in U1.15
> > format.
> > 
> > $ cat /sys/class/drm/card1/device/tile0/gt0/freq0/gt_ia_bias
> > GT Bias: 1.000
> > IA Bias: 0.500
> 
> "Attributes should be ASCII text files, preferably with only one value per file"
> 
> see https://docs.kernel.org/6.10/filesystems/sysfs.html#attributes

indeed. But I think the main question here is, do we really want this
to be a stable API?!

Why don't we go with the debugfs?
So we print the Hex and the decoded values in the single file
and we accept the hex as input file?

If we go with sysfs, I wonder if we shouldn't go with decoded,
but then having 2 separate bias files gt_bias, ia_bias.

But also, if we go with stable API we need a whole documentation, explaining
the use cases where that might be useful and its limitations. I don't want
to keep receiving bug reports because people are randomly touching these
files and getting nothing because they are not in a limited TDP scenario.

And even worse, having to debug other corner case bugs because people
decided to touch this. So, debugfs?!

> 
> > 
> > This interface will allow us to observe power budget changes while
> > running workloads and also, if needed, tune it.
> > 
> > v2: Decode the bias values (Rodrigo)
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 +
> >  drivers/gpu/drm/xe/xe_gt_freq.c      | 71 ++++++++++++++++++++++++++++
> >  2 files changed, 73 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 08251c7a1a4b..41c5c5f20964 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -634,6 +634,8 @@
> >  #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
> >  #define GT_GFX_RC6				XE_REG(0x138108)
> >  
> > +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
> > +
> >  #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> >  /* Common performance limit reason bits - available on all platforms */
> >  #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> > diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> > index a40dd074106f..08c0be8defd0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> > @@ -11,10 +11,13 @@
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_print.h>
> >  
> > +#include <regs/xe_gt_regs.h>
> 
> use regular "" include
> 
> > +#include "xe_gt.h"
> >  #include "xe_gt_sysfs.h"
> >  #include "xe_gt_throttle.h"
> >  #include "xe_gt_types.h"
> >  #include "xe_guc_pc.h"
> > +#include "xe_mmio.h"
> >  #include "xe_pm.h"
> >  
> >  /**
> > @@ -242,6 +245,61 @@ static ssize_t power_profile_store(struct kobject *kobj,
> >  }
> >  static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
> >  
> > +static ssize_t gt_ia_bias_show(struct kobject *kobj,
> > +			       struct kobj_attribute *attr,
> > +			       char *buf)
> > +{
> > +	struct device *dev = kobj_to_dev(kobj);
> > +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> > +	u32 val;
> > +	u32 ia_frac, gt_frac;
> > +	u16 ia_raw, gt_raw;
> > +	u16 ia_frac_bits, gt_frac_bits;
> > +	u16 ia_int, gt_int;
> > +
> > +	guard(xe_pm_runtime)(dev_to_xe(dev));
> > +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
> > +
> > +	ia_raw = val & 0xFFFF;
> > +	gt_raw = (val >> 16) & 0xFFFF;
> 
> use REG_FIELD_GET instead
> 
> > +
> > +	/* Uppermost bit is integer value */
> > +	ia_int = ia_raw >> 15;
> > +	gt_int = gt_raw >> 15;
> > +
> > +	/* Rest are fraction bits */
> > +	ia_frac_bits = ia_raw & 0x7FFF;
> > +	gt_frac_bits = gt_raw & 0x7FFF;
> 
> maybe it is worth to define some Q1.15 helpers?
> 
> > +
> > +	/* Up to 3 decimal places */
> > +	ia_frac = ((uint64_t)(ia_frac_bits * 1000)) / 0x8000;
> > +	gt_frac = ((uint64_t)(gt_frac_bits * 1000)) / 0x8000;
> > +
> > +	return sysfs_emit(buf, "GT Bias: %u.%03u\nIA Bias: %u.%03u\n",
> > +			  gt_int, gt_frac, ia_int, ia_frac);
> > +}
> > +
> > +static ssize_t gt_ia_bias_store(struct kobject *kobj,
> > +				struct kobj_attribute *attr,
> > +				const char *buff, size_t count)
> > +{
> > +	struct device *dev = kobj_to_dev(kobj);
> > +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = kstrtou32(buff, 0, &val);
> 
> hmm, shouldn't we accept decoded values as we show them?
> now it's inconsistent and admin must guess how to encode it properly

right. it should be consistent, easy to use and not so dependent on hw and fw.

> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	guard(xe_pm_runtime)(dev_to_xe(dev));
> > +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
> > +
> > +	return count;
> > +}
> > +
> > +static struct kobj_attribute attr_gt_ia_bias = __ATTR_RW(gt_ia_bias);
> > +
> >  static const struct attribute *freq_attrs[] = {
> >  	&attr_act_freq.attr,
> >  	&attr_cur_freq.attr,
> > @@ -258,8 +316,13 @@ static const struct attribute *freq_attrs[] = {
> >  static void freq_fini(void *arg)
> >  {
> >  	struct kobject *kobj = arg;
> > +	struct device *dev = kobj_to_dev(kobj);
> > +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> >  
> >  	sysfs_remove_files(kobj, freq_attrs);
> > +
> > +	if (xe_gt_is_main_type(gt) && !IS_DGFX(dev_to_xe(dev)))
> > +		sysfs_remove_file(kobj, &attr_gt_ia_bias.attr);
> >  	kobject_put(kobj);
> >  }
> >  
> > @@ -289,6 +352,14 @@ int xe_gt_freq_init(struct xe_gt *gt)
> >  		return err;
> >  	}
> >  
> > +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe)) {
> > +		err = sysfs_create_file(gt->freq, &attr_gt_ia_bias.attr);
> > +		if (err) {
> > +			kobject_put(gt->freq);
> > +			return err;
> > +		}
> > +	}
> > +
> >  	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
> >  	if (err)
> >  		return err;
> 
