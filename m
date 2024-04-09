Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D550ACD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 15:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C5A112D53;
	Tue,  9 Apr 2024 15:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gy5wh/PV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA1A112D53
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712677584; x=1744213584;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Nba7rxey2RLS7WrJPNyTGY+GM8AXt0VBCXMZjrKVAl8=;
 b=gy5wh/PVBh4By0fxXNM4k02cTSpDz0Ijaz7USWUwQ2lzhLDwwckZ5qsV
 l0UtBS6OujwLl82d2vTzzSvCyGDyDYJr0/U51cEecVFsNMwmJWc8Q3mp/
 IZeTq0DYcbypWygNB0TRWaDroNwtXpao8Q18aPJLbGmF9MOQbB9Z4KK2O
 /daJLTioJEpt6Ax5chsBy4YsQ98r3tfhFYPMvJFcCKkAQcpv/uM2pLGyc
 wCdJhDn8e5I/I7J9p02XjqtuW01jRPImvcm1hSTiq7hUzyp9+cVvPCi8D
 pal6eygTtnHkjkyhrzgskQrqfRQPCdQpmDsoeg2ATYq7elaGSvwNQ7BNA Q==;
X-CSE-ConnectionGUID: HgZt0/WBSFOiYOAYj0reYQ==
X-CSE-MsgGUID: b7xePSxRQ3qk00tRN3G9CQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7867501"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7867501"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 08:46:23 -0700
X-CSE-ConnectionGUID: kP2QL+n3TMqcw1HnyJsZUA==
X-CSE-MsgGUID: kXW6lMBORIuarUdXENO0Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24890927"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 08:46:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 08:46:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 08:46:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 08:46:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGmLVeRXIEH13FnepbkaG3iOIAdyPgEyFxeK55KXZ8jln2UnhDBvEBXlrOu6PBp0bTn/5tuIOWrluBL3zX/3M7hDDZiUshd318g9F4lyA0ymZeUcf6hOOGWu1/8e1wIBpix0Zf8iAePjd4KWa2egFO6ovcfSdqpNSrKMStwP8y+7o0vy9Axh5sC3o1qPJoYRjM/MeRrqEFQNDXtVRV7evfgCSkHWS70O1olXkS6x9lzbRFYepn8YM83BW0li8i21cVsJKVeTcEAqghamxZ/d0CCvUtcE/PIi2l58VO/ZyFSnWWob8GyvYU7ZBFmFFqSW0WJvYnOSDQSR4Aj79Q0sNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sl5wzd3AxWvy1UrC5AkVnvQ6KWtQ0t2Fjk+bmJ+v2uI=;
 b=DeO5osuE+1k3lRD/uOrW94+0T7zcvaSI9oK6BsrBcUcV6r8szItsJs6WLnqUJb/q822MQKN0k/4E/N1u9PpmPg0Ed0N3SKs6w6yv3zrsDksIA8zUj2oR3fTdYrbPSdEHd/VQx8SzXVs5Kke58fj+25AzkaNEdZl0CVcvo/hLmJRZcnjv/oWVOKsYSeQFVgqNKLrBTKEX3VWeo12xgldwIdO+AHdyWz+rx1Q/qN7X7RYOZZuEKjnpfKM13suexEpwYUeW9F7OcxFBizguH1Npft9FG4Cyz0Y44X5tsn4wBeAQIkNwRI92gIo8dX4f/4H6yxcuO1bpG2RfwW1j4krzqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7845.namprd11.prod.outlook.com (2603:10b6:930:72::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Tue, 9 Apr
 2024 15:46:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 15:46:11 +0000
Date: Tue, 9 Apr 2024 10:46:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 03/11] drm/xe/bmg: Add BMG platform definition
Message-ID: <tfh3hmcmqbebzsxmdtw5safmqw3wo6t44bit6zjmaly2t7xo2t@4szqtwyiaxom>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
 <20240408170545.3769566-4-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240408170545.3769566-4-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:40::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7845:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XM7BJEA8+I9/5eMKWSqfSyY9+cYerHmAlLPvY6KpSOTtcEKsbYN/jNUu7VPK4Pguq/WbbOX1KhTyGzlR6sOUb074W7K36El8XAF1WU00z2RXFOkVdRcHTunCYqMuC9q5OaY78IqILFAIaP089btxHybDyzQsN4b6ieMQG9rR3T4s5uAg21rtKTSmOiYwwvpMCrDcra2ckSXa9K+1qsVsUJA3QES2CgNLdQzjOwitaKSXUziGAZYviCFGC0vVsY6uQEuMIiLZQlGJ7q9aI9J9CymrZ+t87WABIqOljvvSgcb+k4Mw/4j9nJG/aQwZGRYoE/TfzTC2ByybMmHhRMxQ6fP5PRbpaxkJ46GRBNyjmU2LtQesZ/+qmXu0m3IJz3GCsKKVEdSy2v0w2xt5eyEZPPEYMTk0U2fcwX8EWSGVXMRpyFkA2xv2ZDuHcVRtZ/l8Hzh6dVYMm+S3rCz1qFGC/JZcgDMBf0HJzqzt0759GvmEK6B/wahtnz/KnYBx3QWtjkv+l4fpbv7Eqk+Rbv9IUhZb2ktCk99ngrWmj5JL5JfJue4i+F1BZFnlPkHkJcJzDfYD7le4pQYiOZpgO9YB8yXl1OyH2iTJj4YXrwRoeIPCdKv92ttuD4fR+E8hwayU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s0rckQfTWUby7vH0DkftY62xOjysqd15aI9VIIFwzlmazSAybPCbcNN+WD2Q?=
 =?us-ascii?Q?M1CpqJROGj7JCSNz6r+ltCnJ/z/PD45OTP2iB08v8Fspg4a7I6X0ccvdJUKi?=
 =?us-ascii?Q?ek6QDFVdaje5RiA42K8+RK+ijVC1a0MvR1iWZMfOh8AQJRps9DZtSIqRjgz6?=
 =?us-ascii?Q?ieMsUssw4fo/vExVq6S5ydh85aAortsmqY/uMsxygiSEr8i9cDzniG/5UwWR?=
 =?us-ascii?Q?bpla2VeS/J5/72yL5r8k7ButT68LregffSuZK2U6XU0OVCj4JmB1Nkjio2ga?=
 =?us-ascii?Q?x6kC82ctSYlKf3UWtc/IvouXYESuSCspOcXAzDiUGh+XB3OsmtAuM/xE2/jC?=
 =?us-ascii?Q?ThMd7QttzdKOtuhFTZybtEvrXapDPLfJ5E3TSKK2Fcen7bRB79fmsr7Azpah?=
 =?us-ascii?Q?ASKTLtIIye52QYI7qvTa2so0nK3fELrbuQnJZtavF4ZuzEFTp1Ux5VHlrmP4?=
 =?us-ascii?Q?JKqPuSRIxbkfx1rmBtHHAty6ebLZnL9i9vawRzyFQBfpuqV032ahp8eRhheq?=
 =?us-ascii?Q?622zdpjDSeuYhovIk1xbXL18oDj9ktJALhCGSLaOtKCDWKOnE9Kq6cuS4cOt?=
 =?us-ascii?Q?EW4ZJr6PVVkJKfBcCEnOgb0IOs0hQDLV6dVMZvECsmmwjcNHUHE/XuSAeTl2?=
 =?us-ascii?Q?hEZO6NCZqKEDkYmoifnEKx/1lqWRcIxIfq5vS+I58DXMmLKoXBAyga6DScjB?=
 =?us-ascii?Q?I95tlvk0OtlOxdIk0YFDFJ9zia8lKIDqR8U+1W4aTQnBvrAj65tCzAyteB9E?=
 =?us-ascii?Q?JYkcE4H9RHDzeYxdNWLYtzAelNE6TPUsWef/3iWwW+4lx9PhdoDfYsVkkjKG?=
 =?us-ascii?Q?Mm0uBoAF+/urhxNbZNroCHUBbvQ3jgzG4Kfh9vLrWitHV4aKKDUxH7WJK1cT?=
 =?us-ascii?Q?6Jpxt63aqeKLfvx5LX4CjJ8VjGVYI+GoPb+KV0+6KqL6netgYCcZH01jiV2G?=
 =?us-ascii?Q?jA7hJwVuwMfdV/iZIDuDVbL6deOWcGt5v+E+JnZ0AYpyYz5djXaaL+vGHLil?=
 =?us-ascii?Q?IlxTLSh8dOEf4V4WtdUk2moylKUy4eyd1xcgAXpFWyfj+QMD6VM2k/zZ7kwF?=
 =?us-ascii?Q?kyu4mb4ujfmpZLv3jUon8ZVPoVOW5t33C3L24KdT87MklRBe4HtuDnJj2U8+?=
 =?us-ascii?Q?isdHS4rWsvyJcFAIvJN73E1DrzV5LVrV23kmlB+om1e0OtsYhXCtIXu7vz8w?=
 =?us-ascii?Q?iA9qK/CZhryJS20vA69b6sxWxnVUhAjgXiFMdgtqbJLtlP03CNiCq+3LPgyR?=
 =?us-ascii?Q?lJPvnOlhIMjOQNCNGh4XvQcx2kxovSWJ8MThqj0zXeEmrK6sh7vo+PAirTGG?=
 =?us-ascii?Q?L3pHxDKPluiU8AlC0pWMyteS4lXaRR3gjqjaucEymILkK3fr8GonVSV6vdJL?=
 =?us-ascii?Q?OpMzL/qpj9RTzya9v8Z2aPSZl8uhJcdkQafApjB3TphJRIv4R7ZdbN1PWtvo?=
 =?us-ascii?Q?F7mttTPfBOUiFProaxSwJlF2NDb9gQCJxJ2wpscEaDYo8DGN6ak+UUSJGEgz?=
 =?us-ascii?Q?j6RRpec/RUXI8BYdThpy87XRGlFhSk8rjQdbtzQwXXqhnD4P393uydjlAB1x?=
 =?us-ascii?Q?a29JzYbjFECIfyMV2E+fnViysk7NZnpW262gz8bGXSvT/3KJaPkiLMAjW3Sl?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6529766b-8b82-4d35-c38d-08dc58ac2e5a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 15:46:11.6614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPQNZaJJA7Z+vJ3b2Kp2KfU0MYqhFjQYtbv/xCWHb8yvkhvvpnNKMD+329TztErCyKaURi+UBhq+YqrevOXlLNz3xntLyckUvEeebbHzNAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7845
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

On Mon, Apr 08, 2024 at 10:35:37PM +0530, Balasubramani Vivekanandan wrote:
>From: Matt Roper <matthew.d.roper@intel.com>
>
>BMG is a discrete GPU based on the Xe2 architecture.
>No device ids are bound to the BMG platform descriptor yet.
>BMG device ids will be added once we have all the basic required
>platform enabling patches landed.
>
>v2: Removed device ids, deferring it to a later patch
>
>Bspec: 68090
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c            | 6 ++++++
> drivers/gpu/drm/xe/xe_platform_types.h | 1 +
> 2 files changed, 7 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 2d3b18d6404e..3b30353dbc09 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -337,6 +337,12 @@ static const struct xe_device_desc lnl_desc = {
> 	.require_force_probe = true,
> };
>
>+static const struct xe_device_desc bmg_desc __maybe_unused = {
>+	DGFX_FEATURES,
>+	PLATFORM(XE_BATTLEMAGE),
>+	.require_force_probe = true,
>+};
>+
> #undef PLATFORM
> __diag_pop();
>
>diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
>index 553f53dbd093..79b7042c4534 100644
>--- a/drivers/gpu/drm/xe/xe_platform_types.h
>+++ b/drivers/gpu/drm/xe/xe_platform_types.h
>@@ -22,6 +22,7 @@ enum xe_platform {
> 	XE_PVC,
> 	XE_METEORLAKE,
> 	XE_LUNARLAKE,
>+	XE_BATTLEMAGE,

See https://lore.kernel.org/all/jmgaruuivoineqbkx6rvu6n5qasuq4lev6vwwytyt7vwnog3q6@fl3tkitfwbfv/
I don't see a point in not declaring the IS_BATTLEMAGE()  separately
in https://patchwork.freedesktop.org/patch/586853/?series=131983&rev=2

Having the sw-only platform sketch in a single commit IMO would be
better. Anyway, this is just a nitpick if you have to respin this

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


> };
>
> enum xe_subplatform {
>-- 
>2.25.1
>
