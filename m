Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220EFC78849
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 13:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BA310E04D;
	Fri, 20 Sep 2024 13:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhsNdj7p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75CF10E04D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 13:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726840500; x=1758376500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iWtdccb0bIhl3xa7o8wHUGsP6r94hbrmuChPSha+bBs=;
 b=lhsNdj7p2DcZjvDz4gyGSo1QgLMj6NFgu91apdZuvA0rB6LoUAExU3Xl
 pVDVhw9R49nbECpS3iMfgYgvHemEGHEmxAkjMrtx+AjxRjgYAxoqSdwNN
 unj8shwxEKiYFNQsnxGgk/Pa7MZjClDjwhw5ZEHIREkhI/+DcM0s1ILGv
 Z4t2nF7NJOH/9kpgmgVVInIwr8ymM7fZmItBy8TPoURZqXObK+TeHE/KG
 EEvaURSyqVPEc5hzOVZ4W35yi3XFjhzBzqApkDLrHt/YFAX1obpOIdO7m
 Z7RW5YJF7HvL8KbwJVaV9kfXH8RI5vBMwZavwhbSCpHSPQZv/BoWgE30M g==;
X-CSE-ConnectionGUID: syFcy1L/QyiFOxl92zbqng==
X-CSE-MsgGUID: E095BejuR/SbUvRn9WKnIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25670836"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="25670836"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:55:00 -0700
X-CSE-ConnectionGUID: gcC8l2J1RHmB+gEyd2MoZQ==
X-CSE-MsgGUID: Re3pIHWlQ+WockYJxwz/3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70740024"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 06:55:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 06:54:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 06:54:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 06:54:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 06:54:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 06:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3bw0ptUrOAEp4d2r0SBtndmnSsYn9oiSt8jZQh7sP1li11bd1y5Edrq5pI+uiR/Nnir4kWXwAJRRmbwA8YH7oQPQITNj0awjM2p2GcL3pyEpG5PzNxxfA6n+aZZGX73KvGXMwYZ4Pj47SiJFfi61WlM+w4VjMfktejK6dgYlYqZJeLcpjAUNwNaf6/UdxM4Z+0VAJqQbaGUyJOWGn7+q1n2NBfgGYasH4Wsq0eOo7VZleUocQuUiB0Cqj7V9Kh/zLpsCgRg/+FBNln2HFqjVR6tGm+dSbF7PQtcMh9dx76jW9hpSBXrv6I/j0eaEbCAVA3pvTbA3KLSFsmWL420cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVIvvC436e4RaD8UekyAHE84fA/9R5xWBFp0SpPlycA=;
 b=ot8Y2EHsY8RD2xEGglqEBpje6/1Wk3QWe7AZM2uL/5i54EGtiqcSWjBVTDRZm+WC1ltfDdbB8pqH05s44U4WHeJoL/8W71fPHO0OLoju6JYBSESFwZvFUgoOkaDR+KhFI7j7WYkaZqxOrLhrMGifv4g4QPW1ysnz+So1+jB2C/W5Ye8ticFqrFHz0DoMBNenN0bo8Fq6iJ90i3lnN5qKUr0WpG4Bd3Q1xzaIH11a65ixQiewsWHuXiMWcZIPZkQu57ozn5vLmTJRd3sRXOWfR+dzLU31/KSdxcUOFvnIVzsPuR6ebOvX7a+XHJMmxrQZ85Ix5W38TmJdJ/JkdVaABg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5198.namprd11.prod.outlook.com (2603:10b6:a03:2ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 13:54:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Fri, 20 Sep 2024
 13:54:55 +0000
Date: Fri, 20 Sep 2024 08:54:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <janga.rahul.kumar@intel.com>,
 <joonas.lahtinen@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] [RFC]drm/xe: Introduce active ccs tracking
Message-ID: <wscurb6v4mzxoitxpb2mqr3olgpp5sahqssq3s6izccbl2mq43@eq2yo7txrv4m>
References: <20240920133514.84426-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240920133514.84426-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR04CA0119.namprd04.prod.outlook.com
 (2603:10b6:303:83::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f388f3-7364-4b7f-754a-08dcd97bcea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ItzaOod0/P/hXzjozHMhLN0m0z+LxYJeuiff6O2lK/W2RstYdYSitQVR7YfU?=
 =?us-ascii?Q?gSIGhXrLIpjeuur7/F8G4FxuzaKiwHn/kcXQ8Y6+ogvkyuF9B8wjjXtQ0Ojd?=
 =?us-ascii?Q?S+JxSBfvuryAKL1scOe0TSZGho7Fj+bsnCP0tncXS6SaSr6IVyf3e8ZSmRhH?=
 =?us-ascii?Q?CXLFmh6GDVCH0FMcqc2Y5cR7uT7n/NWNC5KjO2U5ZQmVqle4MSl/xrWt2rkB?=
 =?us-ascii?Q?101UBWWUfBwEHYbq2BtO9XfBBXevhv7pZMkxMbGncX2jAHy98seOmDpfqNUG?=
 =?us-ascii?Q?FpGrPj4C7XbtKWbBr3ZDR+g6Y9rJWD6qogpOQYoylH/I+/p2cn/UWxPsSX46?=
 =?us-ascii?Q?TSooDjF1mEntm9r07SMkLxH2xn7HGajwYboqtyQEu+GzzZrLhTMX3GtajBTc?=
 =?us-ascii?Q?1JJkDnN+19OYFCEK6q54HL+QT293xCrQ2r9PJUAzxJ+rSbok9h5vnZKP7dPc?=
 =?us-ascii?Q?1LclZSlfe7Gu2puv/0z6eafyD8jFZZG55CVKVbp5T+GplUto3mOkmVmcpS0r?=
 =?us-ascii?Q?UdR5rR71EJk/7suRPBwOOyFTHRcBoUYD5pX7aYqZZ4Of3h1USjR8JNIoifZM?=
 =?us-ascii?Q?MM3wJ+qL3/khcJ+INrJOZdusHeePgiPejT248zFOv+Ne5PumyHNbDCw5Y5+0?=
 =?us-ascii?Q?GghP2oaXIYozHx0+iXpMuQlGw8tkZC8ySAvqbQ923XzyalfvWDrXIR+ATpjk?=
 =?us-ascii?Q?n+VyUVCkDF9Y30uaCO2utCY6FJ4JQSCiJblnKNVDJCmFBaLnLA3bEjN8m6Um?=
 =?us-ascii?Q?rxSAru/g0k1tyqjnf3xu5sny1ICZk9ixcYmsAuB/dJUBxdE64B9WlorVO5lh?=
 =?us-ascii?Q?ODvz3AWNrJh6F6zfBJRCk0X56K8lVTkOjYp3QUEIBac8VkaBDe+Kd6i8Ro69?=
 =?us-ascii?Q?lRSMWPtldKOKNDyfYZ/ChDTgAjkBYS9WTtXAHeHa23dyBBg7mbfMjWZyuw05?=
 =?us-ascii?Q?h9AWn2iJwIqTF+lsuff4RmkCLUVPekg+mN7Vv4iu2dW0F5weVr+UcrENLZ3C?=
 =?us-ascii?Q?9w//oSGmsLw7OeWsk0PicUhS1+nQANB+4NL8cEcxsDAEyfcgEowDz4ef/r4L?=
 =?us-ascii?Q?5mKicO3UPa71pbOepuh4W4cMnLO3S1f5CVp3I7UMjKSYJOvX6eoUlwKpEbSa?=
 =?us-ascii?Q?2THILlpH1K051J39uQKZCGxcHXu5f60iiZKZTC3e3y5EPtRBRxH6rfFFv/eI?=
 =?us-ascii?Q?ROmB4O488GsxuFJYUjlhYfXnvCsCdGMYk83pJd5zevvg7GqpZhnldbX9hC8s?=
 =?us-ascii?Q?MVVIAc8awm0mrJ/t0tXNzMfmxCZ7tpbHiD7HC9L46w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UXURPkRKTdMxuVv1sSD1XBPhn/RNOsNo4LxQXObCXDyww6o4B9bxuD2uCMhl?=
 =?us-ascii?Q?w+8Y8O6TSvzeziMeznlzBvUad3mGXs3B7qAx+lmSRS2HeqxcAClkNtpb9S+3?=
 =?us-ascii?Q?Eiz/xWnb2ZO7sf9vMZ0QCUjV2ZEKmHpyF9eIc8aEn3ohnBfl7QA5RMn2jZVx?=
 =?us-ascii?Q?gziUnZDsyDODBQU5ROWb6wSY4QibNrvxN1Bq8UWSHFhEx4dwjSBxfLlH9SoC?=
 =?us-ascii?Q?tS97dOzQ7qtRmHYFZGU03YzqcDU5NEBQtyE0ToAz6C3g3hvyLpDmADQx0lLX?=
 =?us-ascii?Q?L3OGTFfhRXTfB2xynkeePCpyK0pl1q29xO541BiCw8i1on9iDFpew3MHssJ+?=
 =?us-ascii?Q?dmzDJkvk9/G2jB2TVLopa0KBpRpPfjSQBS/hjhUPlDt9Ze8x2bCnfmo8VkLK?=
 =?us-ascii?Q?rcS0fQ2JCWVzQxFJTkAUGlLm+l43y9Y1eje5DoLaQN1k4skOZ3ESLH75o6Ln?=
 =?us-ascii?Q?GbJoh438AqxYMgvqz6icH8+fW+AP63eyeBehx2fj7UNq22JnVDvOlzA2Z6oB?=
 =?us-ascii?Q?vCtaKaZeCc+Hmv6JaSdD1OEUBFvXWuYGzuoHz3TEuq2jQgOEe6j/mBG+oWnq?=
 =?us-ascii?Q?XlVYwG0To15wKFAef3rmYB0XfcH85MtgzJE/mhzP1K813VDjCvQniEegMBh8?=
 =?us-ascii?Q?KcACSqBwvveEhtb8jc/ym5yoRvpwmwxVDZgeSIMR05qluC+HLPUfUeKVAa4h?=
 =?us-ascii?Q?urky5r+94ayxwfw3rpXMEVH8dthNFsGe2TFv9pkXw1q98YB0qBew+u2ask/o?=
 =?us-ascii?Q?ri9ulHduBIOZZPj2K7gqMcOTsnZgsgKG1qCOm3x4w0xuns794DR5IEPZ5V6Y?=
 =?us-ascii?Q?5coVVNk5VcP2NQVuIRoP8gz6j1Fcg3+kz3AuR7/WU1VreR/QFiR98vBhm3jo?=
 =?us-ascii?Q?Z1wOBrEyC4fRDqwCOWCdXax615oiLz4xjPapAlJpMRMe3zBZCQQdPHzM9Ujh?=
 =?us-ascii?Q?zDg7CHjNa0zp57flhqdArf98tRbFObV44GZolsgDO3l4AurJwiGqyrP5QWHU?=
 =?us-ascii?Q?7Qmy94464+Gq9jXEswwAZIUeRmypzX+K6aTjwnpS3JaSAFJEG7EYtGS/8/zS?=
 =?us-ascii?Q?BvQGX8p/RIG2ohJNWTwckMX2zgtDU3vkBYq6WgcdAkYqFt1EpY3GizerqHxt?=
 =?us-ascii?Q?jCjUh8hesCl9WN3VI5Rf7KO1M0ue8Cs/oZGuZh5qqhrGmx/2LZ69XDo+4OWv?=
 =?us-ascii?Q?vGcW/imfXmuNh0N05TPMEv9d6+FyV8m1QI2KjRZcijiPd3Q8fOSEr1g0MFFj?=
 =?us-ascii?Q?xghkXIxp58gc2GeOgIaXPdEaYJgycaS/ithCspRTTRYM1BfxnBGp5CRjf9Sl?=
 =?us-ascii?Q?hPJJsxIx4N/1bAivsahHJQT/276RjlOdWixxVYn/g39fcRruRVCctqiSlpwk?=
 =?us-ascii?Q?8EeMrvbHtSuVRvaMUNTWS/r9P+BEinkOf2awoB59hpAwauADNYmS/eVxHU8z?=
 =?us-ascii?Q?2CtPtu75DRi7iNNbfmfHENxF9y8qp2OdSanW3rPoH++oGEFpJMxu6KyhharC?=
 =?us-ascii?Q?pS8z245Zi3sq6a3zyfVK+iTGNK3m9YdWPfC2zyB1wfdNrqHl9K81N0EeWyQN?=
 =?us-ascii?Q?0eJXwVUElBcASSC0095FGfUhMo369ThYDCkNfuqBGnNtyiglz3kxa57G+sh6?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f388f3-7364-4b7f-754a-08dcd97bcea9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 13:54:55.2761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVCsQgCCT4DHsKqXNWsUIrYK7lxrPC307WfxjfZuc2OaoQuQbYUpCaMpCDGh5pCajOuz86arLPh/yd9jfrnQiozSKJFbf+p1MmwtLiAP01E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5198
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

On Fri, Sep 20, 2024 at 07:05:14PM GMT, Tejas Upadhyay wrote:
>Current ccs_mode setting is allowed when no client has
>actively opened device. Instead it should be restricted
> if there is any active ccs engine in use.
>
>Closing device fd is always a async and may lead to show
>client present even after fd is closed from user perspective.
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_force_wake.c  | 3 +++
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 8 ++++----
> drivers/gpu/drm/xe/xe_gt_types.h    | 6 ++++++
> 3 files changed, 13 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>index a64c14757c84..51ab8e5dd583 100644
>--- a/drivers/gpu/drm/xe/xe_force_wake.c
>+++ b/drivers/gpu/drm/xe/xe_force_wake.c
>@@ -195,6 +195,9 @@ int xe_force_wake_put(struct xe_force_wake *fw,
> 		ret |= domain_sleep_wait(gt, domain);
> 	}
> 	fw->awake_domains &= ~sleep;
>+	if (!(fw->awake_domains & XE_FW_GT))
>+		if (gt->ccs_mode && !IS_SRIOV_VF(gt_to_xe(gt)))
>+			gt->ccs_active = 0;
> 	spin_unlock_irqrestore(&fw->lock, flags);
>
> 	return ret;
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>index 9360ac4de489..dbc49d595a6c 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>@@ -69,6 +69,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
> 	}
>
> 	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
>+	gt->ccs_active = mode;
>
> 	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
> 		  mode, config, num_engines, num_slices);
>@@ -132,10 +133,9 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
> 		return -EINVAL;
> 	}
>
>-	/* CCS mode can only be updated when there are no drm clients */
>-	spin_lock(&xe->clients.lock);
>-	if (xe->clients.count) {
>-		spin_unlock(&xe->clients.lock);
>+	/* CCS mode can only be updated when there is no active ccs_mode */

same question as before:  what happens if userspace cached the available
engines from a query (like it normally does) and then decide to submit
later?  CCS being idle doesn't mean we can change it. I think what we
really want is to track the userspace clients (i.e. ignore kernel
clients since those don't do anything with CCS, but probably add an
assert somewhere to guarantee it).

AFAIK it's not expected from umd point of view to have dynamic
changes on available engines. +Joonas, +Matthew Brost

Lucas De Marchi
