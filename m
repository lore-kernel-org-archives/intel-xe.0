Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47DAC369C2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 02:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576BB10E3F2;
	Fri, 18 Apr 2025 02:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpFIysKp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C3010E3F2
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Apr 2025 02:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744941707; x=1776477707;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZB68XTf2McOI1m93qRQTKVmO8+45mo0VNlXc29WVMSQ=;
 b=MpFIysKpeOwwh7AokhpbxiBKMlaMSwvV0DP1EkQ9EQqJC4Jwn1HzLxTu
 l0/PPSzIQn1PdWBOewgu1Qw5tW5c7WlzFQivKkz0dlir9djn6OgnSxgQq
 KKdfyTGOb3qnII0gbCaxvnBOBuU7KzpoDq+bJF2fxeuaZHNrRnfhzq7Wp
 iWa/lLKm+QHApNLFH00hDxNQeEChy8d4lMf+5g2hbvMSzDME4lnFJgjkR
 XVrUnfqh7WQK9aZKqYgroZ3j6pK+C8N13p8rwBZQl4xn1N+smJIXRYhmq
 C0c6jyYyKAVSryJ10JCuSQJjlnZVMgLn0i/VZZoPiNk+PV+ye8PoweSj0 g==;
X-CSE-ConnectionGUID: Wvt+y4CFSPC3YcpcHrq+Bw==
X-CSE-MsgGUID: wuYvUCOQTPOJEUp7MzK1Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57231928"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="57231928"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 19:01:41 -0700
X-CSE-ConnectionGUID: Qxc7Q/VyRWWwiLItZkSKYQ==
X-CSE-MsgGUID: X7+kIc3cRfyviHfu6BnfYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="130751687"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 19:01:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 19:01:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 19:01:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 19:01:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuxtIJoAUh0LZhzq4ikUY+UFNDqD+Q75q/hi6q6+esuGO2mDp4F45aF47F7DZ83+BYAs+2rzUZu6qSf1CXKPW4UPt6xeEt6o9bgqwgDnWPWKu8CnBNZ6E7QFYFM3aXSAFKlj8ezz1nBeCsBGluJv5ryG2YPPkTzeWgGJkpzl7Dn5EpzryfrtNmIDcTTWKZ+jlr9hbPOsN3jAUg2Q++A/A7I563H9UfxQ+t4GMDHfpSH15MMGAYAdXZgiTEqSIz7zFTHtcrBtC/OSoZjh3KvS50MggQEfHveSTHs5pf0SDTewWTOTENurJ9CMe2RkOIplwDVBrmuzpCQkLoHMHyc1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GU62uG5e5Pf1A8+hx9Yq/Kt2v24BPHxMflxwYkTzvpM=;
 b=N06Q+dycSjNd/z7qbZcX1Ma8O24TRMWEz3HGJgTh/xy5rSLUfchPgg8yrOyx5zJlOpzpRfcV6htjURzWeCpv5+y2OiW4MopRKaAC8XUFpY3V/9PABCdXPPU4mLheRzBq+5IYXTU68j40p50Uxmr7WFu0WrVqrCkZQTSVwC7zeh5MZlDJj8Klawr25N/WMOxRgotXxxj38QyJVtCLpT9x4ZVCTmZodqzeRPpqHIEsOBvi8tUcm1s60hExffkc/qyXAzUddRvr2udmQXYyI7mb03KQeKSg8bhduTyTr5+VjD8mNVxCWW5W4IurZ7QnANqpSSg8z5Kc2LebiLCDemSVgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4514.namprd11.prod.outlook.com (2603:10b6:5:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Fri, 18 Apr
 2025 02:00:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 02:00:56 +0000
Date: Thu, 17 Apr 2025 21:00:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jagmeet Randhawa
 <jagmeet.randhawa@intel.com>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Add page queue multiplier
Message-ID: <d5luza26lh3incrhbi5idyautyt5c6in2h66fvnpwvliuzf6tt@fm644orm6pv7>
References: <20250408155915.78770-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250408155915.78770-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0358.namprd04.prod.outlook.com
 (2603:10b6:303:8a::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4514:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eaad3f8-6ac1-428e-ac63-08dd7e1cdb85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FCGBDRoHCA/q+2OTwXqfS6zD15s/qh5sM7BT4hfy1G+cAu63NFjSjOODkcgV?=
 =?us-ascii?Q?gqY2oaEAjrbYdWSmDzAvD5Si1TXDZweuktytP8XrclVafFZhOqnCn3p2NBcg?=
 =?us-ascii?Q?VSOcnNj908qHzJr3r6Ry4SkL7a++hnfZIAGwsiOeTYJeFV6F/CyUYbo6KEJb?=
 =?us-ascii?Q?8TBSYaer8K8YJ9KQOdTPkwCFMgH8qAfYLcLVmIRwJpne4zCN/B10lrG26496?=
 =?us-ascii?Q?kSVaVcwmEPRvVTfdkTafwtZQp0XkmaWCvI/DnRWzbnEVbeLMLsvgTYpO5TeH?=
 =?us-ascii?Q?Cadbevjp5HvBTJE2nr5mA9A3EEK8rfCwl+1evfaOp7ylnYa7g0mkf4s6NBiD?=
 =?us-ascii?Q?3LNddykcbtCRtNtnflv05yXKPAZZoqehuWCyJX+wjjSjDga+Hi6R+p8JxebT?=
 =?us-ascii?Q?HXK1jB/rJiTW8yB+xRLQH5VZuZJMrQQvLXpXpL5JuTbIt2KWRAn/LFLRwHGM?=
 =?us-ascii?Q?hF2qboWjeCHUROpmfO69XXSNn+Je7Ycqab64/z0AfapMXR0Ao8wj2+tlPoKG?=
 =?us-ascii?Q?jZHNNPmYdc2pgUfzbuDRq2VbdDC5wYSQDkJGTExKOcVFf7X2TXMN+2ilVsXT?=
 =?us-ascii?Q?jTi85A6mZYnF5sC+qMqEBjJHTIPF5ZGk7ro4mYOkL/NOZlFSPNJD5j8ZReRJ?=
 =?us-ascii?Q?454oERadYDSZ4+bdLvndiKOC3Z/D9zBJtP//Eyc9H+dFtJQafNl2XG06yOxB?=
 =?us-ascii?Q?33Fdk2qoXyLneGaQIkoP3EsJUp+5AxZmoPxH9uO3lVsXPoP1bon+DCMfv8i6?=
 =?us-ascii?Q?Y/afWYIFKISOaCPoD/XwIAky1Q/ool4kqn8wysNXTMx+LJCWzFiEYXsBpMLn?=
 =?us-ascii?Q?xSogjihl4gnCY5Q343efNubXLIve+PQdw+aYqtXT0mKu/WAP/ZxbjrPSUbZj?=
 =?us-ascii?Q?B4RoHpnGED1jtBxSkl0xQKtnO34jMN5dZzHvKyCmFWMmeShQweKJyWXVl/8t?=
 =?us-ascii?Q?yVzKrPZRI4M3bKWFk0J3bFW5eQMRR3MJUdUZqZ8G7MAAbVUSe48gFNbs+H6f?=
 =?us-ascii?Q?dCpqS5bG10sCLrVA41B+4qsDtgXmhMVYgVo+dxbD1vzCGOXeiBVpZykNrlyb?=
 =?us-ascii?Q?fojcOC4nRgms2QGjIcYBJYHcFzPGi9R6ViLgeUoUDB+Z4DP6loQa0W503gKN?=
 =?us-ascii?Q?tyRU4tNHDEW9Xvy2wDZijHktUu48O1kBN2t2VAWyFrWPWSlpl1RG7nhynEtJ?=
 =?us-ascii?Q?o2hfRvZrRd3eof+p3tQXIU3tu/4gClHyRdELE93R1JTl3X1SyQrb2hD38LUS?=
 =?us-ascii?Q?TPFWChyLdt6q9qim+gMkOucbHWdeUkCRh33Zyd66B3I5sb/XbcoxBSefXoSw?=
 =?us-ascii?Q?rqrVdrEXY6EZoOfoMWc0Dinpuo03vRGy5HTvsOJZxb/ZWbx6lO0AHqT8NDcv?=
 =?us-ascii?Q?3cixhP44y+JZIfkFiBlCfg2n+hRCbsloaPmvCneVbfukm9halcfbWf0BK8bT?=
 =?us-ascii?Q?ov+bN7tcMp8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PImnKUVItL6mHm8s08xh+/u2qfCCA2j+jiblwEMZLzS8Fco7y11E8koFpCLk?=
 =?us-ascii?Q?6avjwVN5vQ7JmEnR7Dj9nC+X5Esq434N627A/QHcUXkF97yvmIJOfu7FpJrS?=
 =?us-ascii?Q?f58Whl+su/3bezl7QQRkYwcpRNjdGtDLfj1qQoOmczSXcM+e8HZC5kAvn5LV?=
 =?us-ascii?Q?VrHFmo/uvgPxbu5JoinIL9HeIHc9w56gtWngUZkPgPuyA7jDyckWbK/VKdwb?=
 =?us-ascii?Q?Mq7mdqbzwG2DjX78JE3UwAwcpMCVDxL4deUMAmTLykQmafCJiGu5W0FXbZGT?=
 =?us-ascii?Q?kH98MgRl5rYcnwEjrqohbyvisqL8FvpLNfXWcY784NgR2vXriHwfINbRmnlb?=
 =?us-ascii?Q?IsRSVZZ6klQAD22Z8mDRKyQ6d4/qg7QtbIbwYuUytnT7MlKneQFTdK6cnRB2?=
 =?us-ascii?Q?JM8Tp1JPQAszdFQ1CLEbNutOlUaS++6KnaLyBSCljIWKPUHtiq6n9DWR3AVI?=
 =?us-ascii?Q?AbAIs16EKvYReYjJAifokHadXGTjzihFEwb1V80F7pwTxjhYrHRS/rFBKsb9?=
 =?us-ascii?Q?PMSLStv/E3OkAxX0l7AWrIm0UtGufrPJRvO7RGTdEaKPcHEri7S29GeOQGO2?=
 =?us-ascii?Q?WuuBcHVsxK//8P3X3q0HMWbREZWaL5kEkbIQa3nmKw63DTrcqWEGU3xQFdVw?=
 =?us-ascii?Q?aIcb6uAnLdOBe50z6kY1q74aac5g2uMgCDOs4S8ZgLPX9XniwTuJXJz9S0n1?=
 =?us-ascii?Q?M4qmqnkhM6UgZUkv3pqqZtQtvrgZTF4nh0d2kZ68GTbi4D0NOS+QRM+5xY9a?=
 =?us-ascii?Q?njlrFeZUdCg6JuJ73Ro6PUqWtL+x+r1xUaWgJgeqUiwkHD5jqqjWi+UxllRm?=
 =?us-ascii?Q?Edz3FRglHM+sW/WzAyiM4arsQA5gYnlJxCd7eNJmjIFy+mrt3YdPYX5IxHLF?=
 =?us-ascii?Q?1DGlvKbskWICX1cAKHehHI6DJE8RZv1MTWUa0UhBrPU9BlJAWvghqYF6tu35?=
 =?us-ascii?Q?rek+1XjOh+zhftXQQDKMqL8YMw6QhajHvjC/5LHQr2AQGzqie3EVSSJq5Kq2?=
 =?us-ascii?Q?M6s6LvmWIhePPhIVjNq/ZRrMYea9Zg0LrhGCQtlEo5k35iRCrCFNnAvbTnsO?=
 =?us-ascii?Q?y7hBF7SOc0z4dG9F+8SrxocqnI0Tf4HabHSfyvJ4MORrSl4mOgTNPT3+3p7u?=
 =?us-ascii?Q?B/hzxxvJpMqzRF+DjD9lvrK59F5uubivkhXkcFN/3P7Mxe1xqRaTpRQvKXjL?=
 =?us-ascii?Q?1+afIycrK+ZCMrvaPEBYqtf8OGXea/w++wp9w7FMMArfFPsS4IXSfXJWFLpP?=
 =?us-ascii?Q?bl9fGV2R7O4a+QKSco8V1sYHUQCiHcatSD2pWu2su7XsPI083m3aSk2VtYz6?=
 =?us-ascii?Q?0kqpMvxlWVzX8fDGHKIUcCjwF6wNBV38ll45TbL/Xtksyzvx7xejE/GmsTDh?=
 =?us-ascii?Q?QtDvmCHfy/SAcDzuSF8xiPL+slZ24FcmrCBi3qNEBv03Rs0fMHMf4e8FqKf9?=
 =?us-ascii?Q?wriSk3HDL6JSOsv+LjZSHqANEujhuKvpolemmJi+jSCLhJid4l7gaj80jNKd?=
 =?us-ascii?Q?5dDhkAFLy9bwMQSa3nJ49GxiZel8fVT10mwvv+jqdRxYhW0+Y0z/9azto6DA?=
 =?us-ascii?Q?hAqbTfEp1EOOFOjIqJarknO86G6ZBEJy3erdLbHu//n9krlkr9W7cGfqGT/8?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eaad3f8-6ac1-428e-ac63-08dd7e1cdb85
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 02:00:56.5635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1AdxVc5qW64JGcDfNwFDp6RTHCEUE6rk4jNZZ8GbNc9GMuEWOLzQsyuWXWBvSyFNb3jGUY3RcMkomB2oAfEZtLji3PzzzYSWr0WHI6f1+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4514
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

On Tue, Apr 08, 2025 at 08:59:15AM -0700, Matthew Brost wrote:
>For an unknown reason the math to determine the PF queue size does is
>not correct - compute UMD applications are overflowing the PF queue
>which is fatal. A multipplier of 8 fixes the problem.

Sorry, but that seems a terrible justification and I'm sure having it
"fixed" here is just a recipe to let it forever like that. Could we
spend a bit more time understanding the root-cause?  This showed up
on my queue for drm-xe-fixes, but I'm dropping it. At least until next
week in the hope we have more clarity.

>
>Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
>Cc: stable@vger.kernel.org
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 +++++++++--
> 1 file changed, 9 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>index 9fa11e837dd1..10622ca471a2 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -435,9 +435,16 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
> 	num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> 				XE_MAX_EU_FUSE_BITS) * num_dss;

So... for Xe2 we have eu_type == XE_GT_EU_TYPE_SIMD16. Would that be
something into play here? You said 8 fixes the problem, but I don't see
anything about "does 2 fixes it? what about 4?"

Another thing is about 	"threads per-EU" as documented in
e.g. bspec 67165.

>
>-	/* user can issue separate page faults per EU and per CS */
>+	/*
>+	 * user can issue separate page faults per EU and per CS
>+	 *
>+	 * XXX: Multiplier required as compute UMD are getting PF queue errors
>+	 * without it. Follow on why this multiplier is required.
>+	 */
>+#define PF_MULTIPLIER	8
> 	pf_queue->num_dw =
>-		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
>+		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW * PF_MULTIPLIER;
>+#undef PF_MULTIPLIER

First of all, that XE_NUM_HW_ENGINES seems weird as we are talking about
engines that are not necessarily enabled. As that OR between
fuse_topo.c_dss_mask and fuse_topo.g_dss_mask also look odd when the error
you mentioned is in the compute umd and we document num_dw as
"Dynamically calculated based on the number of **compute** resources".


Lucas De Marchi

>
> 	pf_queue->gt = gt;
> 	pf_queue->data = devm_kcalloc(xe->drm.dev, pf_queue->num_dw,
>-- 
>2.34.1
>
