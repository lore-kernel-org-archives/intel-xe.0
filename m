Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C283CC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 21:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5890E10EC99;
	Wed, 13 Mar 2024 21:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fttrOsqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC3E10EC87
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 21:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710366252; x=1741902252;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TTQYceppUGDFz4nih/s/89Ngr4SDcbYCWOdP4qmgvUk=;
 b=fttrOsqIp4juGw3P0HiugPHuy1gxTFYhUN/QiuAYk90oOhEWqKVuvBws
 35cF/4g0Vov7X1ZA7i9r2fE2/GcdWfTp1ruVE/vpqCbz+L7FjqooS9/Id
 jjFmuE1Ksm97JN+51S+IABRIQVk3VkM3f0loiCaP/4QYoOofRgrdD801K
 ocG61kxaVTU2Oy1cW4U80VPb/cIjJ5+0nVZYmZ8QqYPgxCvPQyP+xti7W
 rxtCle/sCOmdjlcqNMV4MagrC0ZsoRyLyx5wQk2obKZUq4OfXqVPgSju6
 QJ6Pndpk/PloFVrlNM4+D9U9VByVWWPwad+0h7B43j8V/lCJ1vqGCikX3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5338276"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5338276"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 14:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="16808899"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 14:44:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 14:44:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 14:44:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 14:44:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 14:44:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j28tECycLVu/s6L/9whWg1QveWNseROFp7HKIV+Zy3YFFu348rMIa77xJtEMUcAbG4f5KivJqX6tFUykMP9QMO/24memW2bNjz1W309m7u0TpDYb5ubmGwxW/YWJ7gV8p8f+seXSP93RaChaSftfXwIRtWTCVFzNtOqw9IFolsal8QM3XOCEEIui9TvVljdFsvWK691uV0OxKbSwwQTVgtz0vJtHDL2BDjyW5OlZokGdZICAfwxyKaZ6RZoz9DBMDfym8QnZ7/WeirswvTDNaNpH6uid/mwDUW48QmhBXUVlLZ2k1wUpT3etff8DKuD2QFGecaDt2EOcTSSwFkGSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKzwrvPkMoGArwZv0UDjQQKW4Jm1PAdW1e3JqtyWGVA=;
 b=Rk538qKKTuw7fyiS1us90cLPeZ9ChK8+ju5NND1t/PkMxziHtMyLW2fnehpgjrWdqHlWKbPhjQ7UFrq28yURfmg+/vW+ZBv2tuUSwcSzG1L57fDsP7niH4hT11KK4QLhKM1MOfBpOPXbl+yHRGsbl9UPeJup1l/Zr7TlfBPi3lAvFlUVZqIDjpBV6H2MPBnqsyYeUxwyySkn13nAIBsXh3D9FujDPf5QY+6u5RGSv9/utvJ3yWQ0SEKkY9MnKcDPZLBVCk/S78rnzJDFsfPVkYWB5rhkz+rV/lMZniKoesLs+olhGKy92NqktzB9SqJOIuJTr8QTo4tiKQVikaRM3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8156.namprd11.prod.outlook.com (2603:10b6:610:165::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 21:44:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 21:44:03 +0000
Date: Wed, 13 Mar 2024 17:44:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Message-ID: <ZfIeINI5VJJaaVto@intel.com>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
 <20240313195459.141463-3-rodrigo.vivi@intel.com>
 <7chi3xtzjj46u4ape5o5uz3mkgqyogyu4egb7772j5mbk5i6z2@glcn273zt7o7>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7chi3xtzjj46u4ape5o5uz3mkgqyogyu4egb7772j5mbk5i6z2@glcn273zt7o7>
X-ClientProxiedBy: SJ0PR03CA0355.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 5001b2b1-d3f1-4fbc-9e9e-08dc43a6b380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QPMsue9B3NyMMD8bcRGSeUHh49SXSjKQbdJdb+NY2NYe/ZiRF783dV7VIO5E+AtJHWiWwsqbBiJnRk/9jZWAPvYou4AfatsyteXOZDB7PgrD8r8E12aMor/OCtKk8dmbS0cqx4HNlhB5x42nWSqulDWK3RQotlHvj21+QDF/B3lrLuIOEBOiEzRlF1X4K/+qwtccFYUN2rcxXGraZykvjuodOeQprwkOYQOOA7Y58ucESbyd1PTy4x2nAdTTUTKfUv7TkifwWgJEqv1Mx7HZjWPKR31ysg9jnZA/McwcvS82ERTOQ+V/wtIVUYYqs2sA+pwgOG/yNnno7XshhMsMx6739bEocp4JP9krz2vpjPtgN0MvmyOIvfQuY06tZLw+LZfzk46C3+/7u95hhGsDhAB5fo47dnQ+UUQ8p//qmBcn/Kk08uLLsFp+Kya0LmrHEkab28sUY2hmHQ3nfKqfnZwAh4ZiLnFNU8VvdiKmOD1KEvcUvMhDHjcu5Iu9DjnvTAeC3vQgav1SeaNuJdjyVcSSryqyaiERC3Nn2l9mmdc3cOM/d6VipVz+lFqsDVRpEKbnlBWykR2ZXmfkxt+QeEjvtQfq4XQYLpjpnpskqjNTDlokuPYfqTdMnnT5T/DttCkhQCF6A0lZ6nLMvFZ1W+kvQm9XUcOvsOcNoucH+l0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z5NykTzQq/ihoDKnj69oygbVlP1E+1vZI2uj4pJwK9sETuCHlhnlMyJB5VpI?=
 =?us-ascii?Q?yZB4FAXm/IaYlfSUPcxkYI1aatHlgsYJIXqM17aJ5SVzI9sgjL20N2zkkXw9?=
 =?us-ascii?Q?xUgWsiBiEIbpo1e3UH7w2nDK0ZlNLhlKB4ik8NiSXdBTDD6yOXNsywUcSOWS?=
 =?us-ascii?Q?tUeyWDQj7nbp8ISlVh8+bnRtjgObyR8pGXugQVK0cTlq8eyp766U/RV0dops?=
 =?us-ascii?Q?opnhiIS4KsJCPbRes/wNSvYWSohO6EJNwmG0V6Mwu6GBcRJYvfPCQeMv5lNv?=
 =?us-ascii?Q?2UEVoxYVLpUkXMzpYuiZDKMfPhJp14VwPgZY2DFeS31zVwp96jY8zKv9XuSg?=
 =?us-ascii?Q?toN+FqPoCImdpDxZxc7W8romWA4gS9SHxJZLuNnFeja+iOQjWZ4r43whwz9X?=
 =?us-ascii?Q?ic48/REshzkbi/ngEN5J+w3aYvUngokz2ag2M12NFUf3abY4Q0QG0kDYcnoi?=
 =?us-ascii?Q?xSHzJZxswg52DuCbaPuSIPJn6IUr4YA/na2+jsjnjhNscTd45PdJnBnETe7b?=
 =?us-ascii?Q?+v8bBqE1KhQBKkWvllsX2v9blpEq4o3osMIvgsdPTQ5FL/ns2cJS+Jy4JKW2?=
 =?us-ascii?Q?hW2bbcb8J5cYHdJlwA5jQcO0U2mvGZTYTepcLVX+a9r/sAahCAco9TUZ4QCl?=
 =?us-ascii?Q?7NKlRBXllKn/7VXfFFVBiqN4fTC5+p6SjUeEgZUZ1nXLZKgLtzNHYsLer8Ut?=
 =?us-ascii?Q?u662ujNQ2+4uDtcAyDc7yP71i3zd/fNYENabZu2x8ETRmDMtosmUu5xPyUV0?=
 =?us-ascii?Q?99vU5O017RCEqKDLtbI2Fyrgd6gWkl1KuCw3pd6PEk9+VaU21l8abHeFd8P5?=
 =?us-ascii?Q?wvODezNT3s0MgkiXlqFszrwsMvQLUoHNKexWeufy6MuXZ7bPMRcOBIhgb96Y?=
 =?us-ascii?Q?I25ipVPxvpO0vZ+CWx7Ftt4tIwHpAEJ0iPRKZIisbgTjgtyE/QQbionSoQgJ?=
 =?us-ascii?Q?KIu3jLIUnaXszIwN9iEZBgbGMlX/VwF45OJ+3cTkNakAGrJEUHLS6BNu5krW?=
 =?us-ascii?Q?lnW2a/DLMJxIqhRjS2U0KX2Bp7URePeM7Ueb/CnLijhsubplS0kryVrDM3uz?=
 =?us-ascii?Q?zcWPoLdHGK3RFoPbgxgYgxKBZQuz7AntpAza9jJQ7NKuy3RPx70/R8XPUG3o?=
 =?us-ascii?Q?IpWWGjGSi/DiHkILtdsNB16af4BNFxccYo878xRcoi1kav7/e251gDkWUxqJ?=
 =?us-ascii?Q?5l1T+bKGo6YfnNFioXZ4IJfmmcER5J4K7bi9WdP44qlvXEWnLmqLcIZKmkic?=
 =?us-ascii?Q?9VHaQmuibeGb5Z0ZIYN7ffPn7VKNL/nATVQM8EFLhfN6IqGlay6CCTYHvhqQ?=
 =?us-ascii?Q?F9tMiXvJtHPJDNyTLsPtyA8W5B5SMJCQ2hDSbn7VAP5YzdrkU032jsMc8wo1?=
 =?us-ascii?Q?muGWtQSc9EGVdXwKBem3zAHADEsklcfmhNCLz4xSvnwxFbcpzpMWF0MN/u0m?=
 =?us-ascii?Q?/am5zPZotRXI1sQQkkS0VYaVY3t7/RTbegW/o41uJcIShM2IoQXOgUQtjslB?=
 =?us-ascii?Q?gvima87V7+YeuhQ4WVVABozlW7tuliXcQUv+2ECct4xXxxDAsCRQ0vgU70t/?=
 =?us-ascii?Q?t5dUK3E5obiiSFZcKjv2w96Xh3CvmtQlol3PoGAUC0C495mHFkDJluhMwLcA?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5001b2b1-d3f1-4fbc-9e9e-08dc43a6b380
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 21:44:03.8465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYFLFjvCXp/S+phpVuc/ImKGkiMA8OMTpKK62rYKaEZCz9q+mULYgqK72cmqRidbHt7CHT/5zcH7wAxtq3onJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8156
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

On Wed, Mar 13, 2024 at 03:49:56PM -0500, Lucas De Marchi wrote:
> On Wed, Mar 13, 2024 at 03:54:59PM -0400, Rodrigo Vivi wrote:
> > In many validation situations when debugging GPU Hangs,
> > it is useful to preserve the GT situation from the moment
> > that the timeout occurred.
> > 
> > This patch introduces a module parameter that could be used
> > on situations like this.
> > 
> > If xe.wedged module parameter is set to 2, Xe will be declared
> > wedged on every single execution timeout (a.k.a. GPU hang) right
> > after devcoredump snapshot capture and without attempting any
> > kind of GT reset and blocking entirely any kind of execution.
> > 
> > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_device.c     | 22 ++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_device.h     |  6 +-----
> > drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
> > drivers/gpu/drm/xe/xe_module.c     |  5 +++++
> > drivers/gpu/drm/xe/xe_module.h     |  1 +
> > 5 files changed, 33 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 5f0a2bdb7c24..296bc75a55f7 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -774,3 +774,25 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> > {
> > 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> > }
> > +
> > +/**
> > + * xe_device_declare_wedged - Declare device wedged
> > + * @xe: xe device instance
> > + *
> > + * This is a final state that can only be cleared with a module reload.
> 
> same thing I mentioned about module reload elsewhere.
> 
> > + * In this state every IOCTL will be blocked so the GT cannot be used.
> > + * In general it will be called upon any critical error such as gt reset
> > + * failure or guc loading failure.
> > + * If xe.wedged module parameter is set to 2, this function will be called
> > + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> > + * the issue is preserved for further debugging.
> 
> Maybe make it a little bit more drastic so people don't use it when they
> shouldn't. I really hate the amount of reset=0 I see on machines being
> used with i915 with the additional patches to achieve a similar goal.
> IMO it should be a very targeted tool in a toolbox, not the hammer it
> became.
> 
> "In this mode, GT reset won't be attempted so there will be no recovery.
> Any GPU hang will completely kill the GPU so an autopsy may be
> attempted.  Use with care, if you know what you're doing."
> 
> > + */
> > +void xe_device_declare_wedged(struct xe_device *xe)
> > +{
> > +	if (xe_modparam.wedged == 0)
> > +		return;
> > +
> > +	atomic_set(&xe->wedged, 1);
> > +	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index d10664d32f7f..de3149baf82f 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -181,10 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> > 	return atomic_read(&xe->wedged);
> > }
> > 
> > -static inline void xe_device_declare_wedged(struct xe_device *xe)
> > -{
> > -	atomic_set(&xe->wedged, 1);
> > -	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
> > -}
> > +void xe_device_declare_wedged(struct xe_device *xe);
> > 
> > #endif
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 19efdb2f881f..987a57205fc4 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -34,6 +34,7 @@
> > #include "xe_macros.h"
> > #include "xe_map.h"
> > #include "xe_mocs.h"
> > +#include "xe_module.h"
> > #include "xe_ring_ops_types.h"
> > #include "xe_sched_job.h"
> > #include "xe_trace.h"
> > @@ -949,6 +950,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	simple_error_capture(q);
> > 	xe_devcoredump(job);
> > 
> > +	if (xe_modparam.wedged == 2)
> > +		xe_device_declare_wedged(xe);
> > +
> > 	trace_xe_sched_job_timedout(job);
> > 
> > 	/* Kill the run_job entry point */
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index 110b69864656..61272553f40f 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
> > 	.enable_display = true,
> > 	.guc_log_level = 5,
> > 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> > +	.wedged = 1,
> > 	/* the rest are 0 by default */
> > };
> > 
> > @@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> > MODULE_PARM_DESC(force_probe,
> > 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > 
> > +module_param_named_unsafe(wedged, xe_modparam.wedged, int, 0600);
> > +MODULE_PARM_DESC(wedged,
> > +		 "Wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
> 
> as we chatted earlier today, I think there's one thing missing. If an
> engine hangs, we won't notice as GuC will reset the engine by itself.
> We still need to pass GLOBAL_POLICY_DISABLE_ENGINE_RESET as a policy to
> GuC in the ADS structure. This is what I was attempting earlier today.
> 
> I was wondering if we could even update that in runtime with
> INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE so we can target the debug
> only to when we are ready to reproduce the issues and only on the
> specific device.

I like that... Perhaps instead of the module parameter we have a debugfs
entry where we switch the state?

So, on a debugfs write to switch to this mode that gets 'busted'/'wedged'/'dead'
on every timeout/hang, then at that time we send this sched policy change?

> 
> Lucas De Marchi
> 
> > +
> > struct init_funcs {
> > 	int (*init)(void);
> > 	void (*exit)(void);
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index 88ef0e8b2bfd..0f95dcd8942f 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -18,6 +18,7 @@ struct xe_modparam {
> > 	char *huc_firmware_path;
> > 	char *gsc_firmware_path;
> > 	char *force_probe;
> > +	int wedged;
> > };
> > 
> > extern struct xe_modparam xe_modparam;
> > -- 
> > 2.44.0
> > 
