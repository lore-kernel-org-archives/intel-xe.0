Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEC8C4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 19:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECC010F27C;
	Wed,  1 May 2024 19:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Av23IwQM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF06210F27C
 for <intel-xe@lists.freedesktop.org>; Wed,  1 May 2024 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714590936; x=1746126936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z8E5x8wCY/AIj/C60osqA7HDLDDDsEdHT+gR5iwChis=;
 b=Av23IwQM5bblYqT1RzYMZEYjlGwmrx5RJXA8rTDHKk3G8HHYMJsrBCEb
 mCD2aovKV7mjVEb004vVK05ryQBQEizqWTLj1GZ4eV+CAbx8GD8WiTaLk
 xoH3wwgDXsna1WNBCqXiV3mtv2qsRAOyTPNw8acEeY9buPSu/Xt0XLx+t
 gVu74V4Soa12wRkVM4F66PpQrJVfj4J7UdutU/WuG3k/x8j2inbGSM0vy
 45aN4i/nCKSRym9zVSqiSrLcn9RUobWmwI6qSyegt8QcGr8Hb+l9VmvQG
 F+nNPb6hzgUIqqBUlAvWNRY2AzyqrRRiUufLIbsWjX1LDmxzp7q9m6NSL g==;
X-CSE-ConnectionGUID: yhiHoaGITwCRril+YAcLzw==
X-CSE-MsgGUID: XmzZWIoHTKKssHVQLYzbIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21487352"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="21487352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 12:15:35 -0700
X-CSE-ConnectionGUID: MT+6GVmfQEioKwW/6fnOCQ==
X-CSE-MsgGUID: w370gjeUQge9eQQ1dDgHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="26843801"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 May 2024 12:15:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 12:15:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 1 May 2024 12:15:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 1 May 2024 12:15:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jj5UZq7UfHdeVoZVbE4wJkK7+PGfSCby/ap6772HJWYPaLRo2JPA5vWTBA2wwOk6REubgPPIZAQ892c7x7TASpO2kwpryz7Vb8d1qZkuNkmJ+iX2r584mO5F7eHRCB8DWt0qW/0ZDDRw2SWUUHy4k+M0dNGhc9ZNt+/QvKfOqEo56K6wJF0HFepmE5q2u1tmnbW/RFHczRo47eMXzWemzlIusuP2TySPrHzzRDM7yeozOvTTwTi9z/moPYy7j2fAXBT8iKqSQ3wyKmgwMFnIhcW1wztdUmuNtalyFvdr9wnqvcc2ch1WyAyrX/SbHweu73T1AktAmaMzgwtsAPP8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3zjIFxkijtNh2SenvOfvJRhBmTEY7pkhGw+WlfPj+Y=;
 b=f1cdkIp6BcbSnNlEQ/FPbURMbdrBSZEG+G2upZg1CzH1Q+KEHF+YCJQuHxykw4dYN/kTwjY24k6m5gWk2ZOuHka3xDFiPXBusOJy+9q0VRsrkMmrM3JR+HviQC3lwplgzwknazqU7mdCwhSjIUd/Ggl2cR10WJ+fxNBh7AD+418rVqq5TveuxMQz9Ouiyg88GZN00Ox/eQW78SPakey+30NTQtO9ag0F1l33oZNBcDtKjm700pB/1R5pWyljv6i3vyFv6uJKRCjMltTE3QTrVgYro1DkxTl/JlYSCi7/avNq1FVnECvAdRLs5zfAcIm3tv3MCjlN/LrLuA3PjvFA+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYXPR11MB8690.namprd11.prod.outlook.com (2603:10b6:930:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Wed, 1 May
 2024 19:15:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 19:15:32 +0000
Date: Wed, 1 May 2024 14:15:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3] drm/xe/gt: Fix assert in L3 bank mask generation
Message-ID: <z23x737lhyqilayigva6yptjw5dba6qdrhxn6lvm3dtfagxemk@sgyakeuwhobf>
References: <20240430163905.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240430163905.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYXPR11MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 53bb0cbd-72ff-4eeb-fc9e-08dc6a1311f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015|27256008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+b8tG7BHN1l70ZoNkZVlsnP2zf4RItFRAtj4/zTgNmuB9NeiIOsTgO3spwZf?=
 =?us-ascii?Q?l7/lV4aAZ3e5fiuNnb97SAMPEPQEmlRxiIRSsFzW9awVlpYq72RlEgd4fDym?=
 =?us-ascii?Q?y3rGE+A/sKQ4mVetVIxfM8jD7W3Q1LcZc6Kpk8OxpXxjWedyxqiVGKd3p5Q4?=
 =?us-ascii?Q?SHguJVnTiC/207NIXYiwY8TWtTLVhLo9iQb6EBF/B2l2WGTQCLQpPmNwjOhE?=
 =?us-ascii?Q?taVMAfDQX7ya0oRoiJ5QX/XvevVZcVf46n3MEMRyeGkcUUIj8xsiH7uOIICU?=
 =?us-ascii?Q?ppuT4QfYreFqF4pAbIEpdOwK1js4NQPPrM+ksPnt2g7Fv4TQXuUVZOi2hng4?=
 =?us-ascii?Q?aHXCZJrPGx2MGuxaFI7ETydBicGfUFCQU1F/syM64v+B+BTE4BC4y1nBKnja?=
 =?us-ascii?Q?qoR4+J5beh0oW30V7zVNEwqVic4gBflG7QpSwoTnPP9kHs7GDfxq+NauR6Sx?=
 =?us-ascii?Q?x/oD1T4N+cOxIc9Srp1AVTaYCIBoaSihGegigueTcQHdVrdNpnswoNjFE/wu?=
 =?us-ascii?Q?RZuIIJSqmKZzWtJiMd2mkSvn1EZQmSIxfG7wnRHy/VuWQ+yYOe0Dj21qlspk?=
 =?us-ascii?Q?XndYgjUWUOfHmFAeM5jsHZ44ZkLGRmaOWWuYTkr8PP71DwTwq/wxv8vbrgRh?=
 =?us-ascii?Q?mYcpkDEVT6dpqbqIACvtC8XYF/gWExiob7mC96Y8c6Z5HxZjT9Jk+6SSrI0p?=
 =?us-ascii?Q?4Fg4rC3sP/84Rl13gb8NZHIy75r48oQx5olhFgUfNO40IKKMoPBHC1kzaqpl?=
 =?us-ascii?Q?ZGQM6pufRDrCgUL97p+Fvo0bRycFXFYDfnr6DgHoqp5wkJMPp8rlAEpxk1lW?=
 =?us-ascii?Q?6D6oAo2PfSygQ96z6Bh3aXItXUDC8ilein4HQJbYF8dwtCwlEoQaK2Wd8lhb?=
 =?us-ascii?Q?lVFGmO86vNLBAynwr/u8R0hSWzxExlYa71+E9XI9fUXYPdDwi56itHpPsfWC?=
 =?us-ascii?Q?6vp9OzycbPHQiKpsiqdEH7H8L0ArN3SeNhwZY8m1OF6G8LH/5ZSqLR+GkMnL?=
 =?us-ascii?Q?Z/6teYgN7SUq4gUuC7kNa2fbX/rECMerDOQHgqx8hmCxPmeBOdwsYvvN5wA3?=
 =?us-ascii?Q?65HG3beX9ikiZ148O+8AgFjZQ21I+th2BM4HoMrA8WujxdMk8oA1Dguomkcz?=
 =?us-ascii?Q?yIe+Vh6f/8q73jNrxtN33irU6ZE2T09njM+djHqGePOQJ1bL+SSC6Wq9uT1a?=
 =?us-ascii?Q?FTzozolez4c41payd6CilC3I2lrlesSJ0jdsOn5b9jkn7sWad7s+wyti8ZI8?=
 =?us-ascii?Q?UBViDMf1SAJp/vCQFGWuVzNpIjoZCXlVptl6Z25gjJ/kLxV3gxJr9HdJc3Ly?=
 =?us-ascii?Q?65kyk0BcGqogqSRh4CuvIf2fbIbA40wJOM8LrV2tTIblMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N8Ec40fbOEjZYYy0fRcu8ggGlakZwFax9lW4GMcihosv2ctd5krvyJPAdBwb?=
 =?us-ascii?Q?hDkTDCkUkjD98HYYxKHSDTZ9dlFnXUD7QCDX/ZoNMuY3EicyGrlFDJD/e1bC?=
 =?us-ascii?Q?pwE6BPmrE2vkM9HIeXyKptuIIdbfH4fVCXFbbi1F+pnPVN1RdJVCPgt/MOrX?=
 =?us-ascii?Q?qvmYA9m6JqRXm6r0wQ98fl/g/IWu68nUaJyvtnL/SSJP9LhEh+2KtpvFPho3?=
 =?us-ascii?Q?xinDEra4wrKmPr2eZLiclnjDy+sx5iAvtMh3xnJnJ4D+219wk3EzIevwBfWO?=
 =?us-ascii?Q?aZ2yMMDIvX9xVSBDaCMPvlT7Flbi+I4pbDcsgbfa7kgOBgmIYfHYo3vGbkir?=
 =?us-ascii?Q?WJKv8f//1fRlfK11y7sdvWe+klztdwS6hjWZBPrzTHF8ZjYgpov9B3wem3AI?=
 =?us-ascii?Q?UdRLGlEArlNZaIUhUhtbJggz5BH410KKgyXEHDECGGRCDS92XQJNkT043zbT?=
 =?us-ascii?Q?XRAwjU6RjP4LdrxZaGoEDfVe5Io1RiL11xAnGjTjzwRR193mTxz3/jf5TWsn?=
 =?us-ascii?Q?U6bzrsDM2jISHMG+zBINNaQQc6+2z6rCsOWbj1F+ZkshSQGgX9D7il35atWh?=
 =?us-ascii?Q?QEghL4eFYVtv74Mm4DA6ABcVMHatrvLxfykdVLmP4PO0Jf5L92wDLtx5ESy0?=
 =?us-ascii?Q?1sLqAYPNZgWV8FIywtxZ5KkOO8y3mUWIoOopKWtAWEk9dRseZzcXHGJdklJj?=
 =?us-ascii?Q?D8WKvihkd67fXZPp7h2vRH/Ukvv0HuMjLYIWs5ZW1RDnzuGwrZm0qYE4T/Za?=
 =?us-ascii?Q?RATPfCxjtkO7LSyiXLiqZ2yRs82e7/IjIuQC9zhW5z64rcxrIM2mxKR0tURD?=
 =?us-ascii?Q?LQX58PVdymBWs+UIUJQ3lEzCPj5DO3r/fmC5d3AdymUShppeGRe1n/1aMXJI?=
 =?us-ascii?Q?gBHRA8M9ekAswioShRsH8+n1QdX4CNHiA+YLlg9Wwn6Qru8yjdVczRK3kVlZ?=
 =?us-ascii?Q?N7JyplfSpKFKJiGnrUbwyx/lCf/s7mi+ojipfSkyMmy/LlqYo4ASzZIpx5nr?=
 =?us-ascii?Q?TC9t79ZHZ9M56GtT5dDZIa6fAKt0XAp0/JeEBCmu9PlhQ58NYZlssgYywlUi?=
 =?us-ascii?Q?XTq2XLYjhZwUvQ77QYYXI4jnOjd2gCDNBHFpGb1caITjgfI0G3kJMgLP/AIA?=
 =?us-ascii?Q?1UDwvcLknSwIXBTGrg+pzk48dcNKF4+Vs7mYpb6peyGRvhT3a7i6px4Yty9Y?=
 =?us-ascii?Q?K9PZDWK2AZvEU16GWUlbKMc+s12j/zL+r2/6Ui0Y8Tc3FOwWcgb5m7J/UEdO?=
 =?us-ascii?Q?8xUOoUY0GXE6We6pSwADvFxU14CTge1KWBV5DP45IEhxacXIQm5JWm1y0nJq?=
 =?us-ascii?Q?GrDgKXSC+BDoYKOnt3Yi/ruvi8p2qOFNIsgkWfsiCFUs6Sbw1InrNhAaVtNC?=
 =?us-ascii?Q?8hZgmestJzCCogAzyM2DtLfbxUFicaaToOCu4cQGB+8eAhaNyGJ7IRKhGtwx?=
 =?us-ascii?Q?PZTC+GXbw5cw6Aqx7ZProGg9kgM2+HVr1h5/4tPS2WO6Qwpkrw1mnVeQZN1i?=
 =?us-ascii?Q?mahNzyfsIf5VsAe9Fu7Ya6AqTxUHEbfRxJYLCZQQHKEpCHQrmac7tMyRQlYr?=
 =?us-ascii?Q?lWM3HVVoAKKaaK83UyDZq3oQ0U/sBjPptae3fXskcQAf6gGes2vwGkNhLvSv?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bb0cbd-72ff-4eeb-fc9e-08dc6a1311f3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 19:15:31.9795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOkn74K+TpWgtxSfT8m8kBQKxkoxZ0sLdQ52ovHr2Yz259YKrk2f7KsO66VTmxRDQhdmraOxJs1or2482bu+GOcMel9ZvM3MPOGESvcoMcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8690
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

On Tue, Apr 30, 2024 at 04:39:05PM GMT, Francois Dugast wrote:
>What needs to be asserted is that the pattern fits in the number
>of bits provided by the user in patternbits, otherwise it would
>be truncated when replicated according to the mask, which is
>likely not the intended use of this function.
>The pattern argument is a bitmap so use find_last_bit() instead
>of fls(). The bit position starts at index 0 so remove "or equal"
>from the comparison. XE_MAX_L3_BANK_MASK_BITS would be the
>returned value if the pattern is 0, which can be the case on some
>platforms.
>
>v2: Check the result does not overflow the array (Lucas De Marchi)
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_topology.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>index af841d801a8f..b51f40493123 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -108,7 +108,9 @@ gen_l3_mask_from_pattern(struct xe_device *xe, xe_l3_bank_mask_t dst,
> {
> 	unsigned long bit;
>
>-	xe_assert(xe, fls(mask) <= patternbits);
>+	xe_assert(xe, find_last_bit(pattern, XE_MAX_L3_BANK_MASK_BITS) < patternbits ||
>+		  bitmap_empty(pattern, XE_MAX_L3_BANK_MASK_BITS));
>+	xe_assert(xe, patternbits * fls(mask) <= XE_MAX_L3_BANK_MASK_BITS);

sorry, I didn't notice before that mask is a long when suggesting
this... just copied from what we had. It seems we need to do:

	xe_assert(xe, !mask || patternbits * (__fls(mask) + 1) <= XE_MAX_L3_BANK_MASK_BITS);

I still think calling this with mask == 0 or pattern == 0 is a problem
the caller should deal with, but if we are dealing with one of them ==
0, we should also deal with the other.

with that,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> 	for_each_set_bit(bit, &mask, 32) {
> 		xe_l3_bank_mask_t shifted_pattern = {};
>
>-- 
>2.34.1
>
