Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC33C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 08:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D982810F95A;
	Fri,  4 Sep 2026 08:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9KSzQuH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6DB10F95A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788510619; x=1820046619;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=d6WmYt+7XulCXtnSSRYGDdrJXXbKipLZaRfTFDgeZ10=;
 b=K9KSzQuHfAtFcaa0qLG1j6rYyw29Uv7eX42teEFe53d2nWGAcYGy6VS7
 cWHPPyUcfadMhsPddntMbaavuFycKAbYVHnmux118gzB40W8/4R15L2qt
 vsr1XaeWuVnOBI4i2dTKXww/sSaVx3IFQu/7i5Gr2tJ2S6CCs8g7GcScO
 hH7s4sI9Bv2DF3z0r6PMo+JG2B6bd2VxVyf2kdYmkSdSckomILraQkGfR
 RLWkpOxvJpmESdT8Dg6fBYoMAoqUQeRmQBZ2pHixfLEDmzjVYCE8lgd5e
 cHC6XTySzjd5IPY+4rHuqVYiicOJw/H36NE0jGFs7VXeh/wf+NyUFPT3m A==;
X-CSE-ConnectionGUID: AkeYzkfOQb2SuJ0wWr5hIw==
X-CSE-MsgGUID: BgGI4r5vT0+Eu6+45QjzqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88889107"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="88889107"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:30:18 -0700
X-CSE-ConnectionGUID: AUZNXmCVRSiEWBUDr/zqPw==
X-CSE-MsgGUID: Goa3/M39Sg+vr18JEFdHKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="265639116"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:30:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 01:30:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 01:30:17 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 01:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwHwr8ar0hPwXeJ9oxAMuCNgd60Ab735CYqRkJrHzygclhyDjkLKYdP5sSgeK7AoZx2STEfKup701E6tNQlJmLRPHMbgew+Kk/14s7pV9rGN1VTEmW3TGre24iq9h/oQkoQ/03A5Wy3odWypST7CW15DZqO4W3mNc/lJmPg6DtcAGVYC2Dbz0lGde3DL0qlZoIEeU3VFWxyMcie1/VZ27MP+2F4gudEObpHJNR4NE0uxYPfwQlSPfMVE/oJz8EKPGEslmlZZxMruGZiLCddpoA7Pt+hVUeKJ7ZNMIpFuwnjm0p0d4F0lVQuOG6NycJ9mUdh0X37zB79TPfxvnETMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FP3qWtIvWkLCeIgDRmOZCy1PJSbYVK7vpDSppWA+8XE=;
 b=AfNMIQCTRPyEjG5npovFkH2Kr8J2GiWKXUBs4blqOrj80G173OpdoRW3f5hzY85NiO8fp692cyUVkvlCpFhH5dM5jbhQn2rox/+W4jrpT//UdUimx3Azm83kNh8IBDn7bQhlbA6/YgxLxhV85v6m+1ksj7G3U8t9QwbMGzaFR9de5fVB5NkZBQeBSrA4citvyM/xz8X4dzvHsNNvR5JKYlFOGsaHuSs4ZZnqALGt7YgVIQsBxIJbYm3JrKDJK9Hw+HLRDm118A7GnacyhrolZev+gOp3CtfSreHM5aJIyQp/vfyhbmM+dLUPLridMazJ9RgWHmOl8QN35NVo26Tb1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PHXPR11MB9688.namprd11.prod.outlook.com (2603:10b6:510:3ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 08:30:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 08:30:16 +0000
Date: Fri, 4 Sep 2026 01:30:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <szymon.markiewicz@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Guard page-fault ack with runtime PM check
Message-ID: <apqBlUxnqRBJ9uBc@gsse-cloud1.jf.intel.com>
References: <20260904080505.4159219-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904080505.4159219-2-varun.gupta@intel.com>
X-ClientProxiedBy: MW4PR04CA0106.namprd04.prod.outlook.com
 (2603:10b6:303:83::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PHXPR11MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa53882-1a91-483b-b5a6-08df0a5ebf2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yMuC6fui8558RHEoZ0KjHiN+kF3vo9FVqAHuO2iDv4DJksxWD3h/Om+D+fUmbxwWxKPIG+4ca0kFw8cCsPpPPiUdXiQObT2BOFUl3GG8+5g3OHmUSx4n6Baxr/dAzVCTXkrDmpbdAOyI/Kqc6RM9tHat8BTfnvJQ1RUitn4OcEB6c2gldSyQkGlAOBcfXmYWzQuJWlmxsEdV3aQ/wQi0ISCO1P0odSRZSY8dzlXn9hNk2hTgb/c+RvSfcYzJ9iQ/Zr0YvlQEpj8znp0Tur2dNeNZMTbSbdf7r+hs72XeZ/CytnVzS30m031yrswnYm9aZ1iF/hBCaVPHihfXoNL7cCmwFZx9fCkl7Shlx+6BB5ubUf+gelg90AHqHwRa31Y1CaV+WKM8j1EQWXYB/bVBi0iavPDvsB5oRz0D1buQAGgt3TBKzwcRAtUrIGYV8GBjlMwtIDxCE1UnxPm/ubLhnBrV3tSIebjVdrXvpR4Ne2rRmJlWIACXbzcJZwjUuMGhNXs5jABwK3VtLQ6TifF+Wx+m5juArKB+NPq83+kKx5b8wWYtmgpkiFMMR7C3yoZnPRiZqP/mVUTwK9NiGIG52PDz9rPSiJ1oGgxJW3LptCQxtyugYvm7gQFJ6smSmdKtt4qd3Th53PP6UU8lv504Yb5KxK/Hcja7dzaK2ojXwac=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZmJPRhSF//8InRIQk0N37Hg3DtdisvNiMNTZnvqhGU9o+jtrnDD5Nl4sB7?=
 =?iso-8859-1?Q?8fOf/F1vrhonURjo9WOG4tEYaIxnaBUSwWIFNOk7TNSPwlb7nw+NL06NEx?=
 =?iso-8859-1?Q?SVApm7NdlWOO9ynepZmDuMyRq0ohtS0TdO3Ik7eUAia+MdL/gvN6SSQmaM?=
 =?iso-8859-1?Q?M2JLUHyQ7FMbIN7Hyr7PAhNkoqZ42pu1ZqIGpQv1IslV/a/wECHsKrsRWd?=
 =?iso-8859-1?Q?JnwmP5wgeMesJQmhOgJZoroFyyM4RXIoN824faXDyL81i0Ex7+NactDstw?=
 =?iso-8859-1?Q?mkyAO+94a4KNguBOko2jqGuN+xV4H2o0shwZgt+Y9IhcuC/d8LUuY7fOmW?=
 =?iso-8859-1?Q?+U3O0SbPKfJ6XKSZ9yOMTcoK+WIuv8YKlPfDCUvRzxrX0RNgI2ThCH9Pcg?=
 =?iso-8859-1?Q?8WQX6nryh897EbuXZGASgEOYBhX6Xq8UFeTC28GUE7Z7B5JowxJZZRz2Xo?=
 =?iso-8859-1?Q?L2QXn413CMsyYY/5dnSRHKoFG/reHTgNvNa/UxY4BVBfb1QUZtaprIG/m2?=
 =?iso-8859-1?Q?OnEoqPgH8WH1sZri5qHRg4uknVk16pAsJMI1cj0pEyqA4Q1f6pDJmP9chL?=
 =?iso-8859-1?Q?3bWSC2ymeJOt341HcijJFokBZs4o975yTM8CIw6sQSS9t66IJfUSRNa18b?=
 =?iso-8859-1?Q?117HLt9eXHdbOJ2l/DNb3e/soTY621RfFeIY9ndiltRJX/dgxP038qs9zi?=
 =?iso-8859-1?Q?oJ4NjmAQM0bxPAqXf4zPKvajypBGyz3VPtCiQcCYn0fK/QHtCVpq4IuR57?=
 =?iso-8859-1?Q?Fxa5np97yMs7Taa+rOtRdh0p0S8ayjc/wfRtbpfoO/BGl0hUuhQMcpGl1J?=
 =?iso-8859-1?Q?M13txSnxEDQIoRGBs0giBUjKgyFVVVpGneu5pA0g7SWldmRZnxWtKZKtVI?=
 =?iso-8859-1?Q?dAT+aDK5psFEHQof9ZNxQPVQQgWVOPMj4qu33jSNg3JfTI37mAwc67c5oi?=
 =?iso-8859-1?Q?eWH0QoL9CpQ8RNeokigwP2f6TOFADc16pB2p8ioYFdkT84CRciWSW34cPC?=
 =?iso-8859-1?Q?ioydyCACgRvpTCNEVxT36hn/XhrR7/5cOWtSxm58UkBFNJ6A9ex18yIsLW?=
 =?iso-8859-1?Q?JwXcVUHY60K9Ae0qcqCdVIAHHlluNBWa4aFFV/uVj0R3d8gfMT3j0VmfCS?=
 =?iso-8859-1?Q?mgS7TOYLbTGBzRlRcTyd4vBt950to3EjEDrDXaD4DPHoUnifnZYcJFjLkM?=
 =?iso-8859-1?Q?wts7iaZPpCsXlpgTMS3hCmCif6HlrUFNA5tPFYAhoEwBsID70RsGCYvvoq?=
 =?iso-8859-1?Q?6FhYZrNKbWZYjuxBZiUhBhKH9rzz2zqu/9lRIQwbGnEL1Jzf1VVsrmO5Yi?=
 =?iso-8859-1?Q?UOXYAJR9jMqgbUe2nCLz2QWms0CBaLGg2nZm10RwtiCFfbpPtBYt3P6YnN?=
 =?iso-8859-1?Q?zi1uOrUwuZePM0xSz5gT2xbG/1G+ZPwIX7GZBD200NyaN6mtytMbhmtgTT?=
 =?iso-8859-1?Q?evHeYmdHvBK7jChO6o4iGPNVJimtr4UV0Z77k0m39Fgj/RBc7g/SWy7ymt?=
 =?iso-8859-1?Q?BFUf2Qd+rfOthg3XuNGa/o/T4WslkaMxaLLR1NY7nm6fM4+2KdIqtnaEHT?=
 =?iso-8859-1?Q?1cpFrCwHu1LzNA+/44YDJapBG4uRswuE9qMzdeJ7QL6ZKDhWX+RS5MRp1h?=
 =?iso-8859-1?Q?+goB8OkYpwp6lSSaMkI27AzXviUvdYn7d2Jzp894XEEMGgFzyco5NZ5ryw?=
 =?iso-8859-1?Q?HtLQ/Tr5BOJL/AqAEF429xcz0JR0oTVDVuVpLLmX+4swpwcarD4ArVqMW2?=
 =?iso-8859-1?Q?r2mHRBfJK2joE6psHLAr/VhjmjJglkgLRFHnSWy0RkXV+XaAh8nIv1Pb1Z?=
 =?iso-8859-1?Q?6sIlV9WZDnNkbqWiInFA2syYigka16I=3D?=
X-Exchange-RoutingPolicyChecked: C2AYwORnh7VigwiJJi4N90VouxeaS7hzviv2pG32rfS+7lkTEG6gmBk0Lb0ae62jkegoq0yfMzXvekH8vLIvsz7Mt6JeDhoH8EEE9dEZb5bw+k1nlxpKnNtGG11PGj6fU6T+hJZsJ1uwUy5jO8LluZ/RIwNvWLdHG96mfMTQD2lOZQ6Pw/sR8S+veebPsN29iMxd4qeXc5fpZIsRf9SO/1AHb8Q6pgYpGB4a5YEhHlt3Qm9hPJhnP176pD0qy/I5MksePXEEYG0NWseHqEc+KBPoVhlP6BphSsshkc5QcZEtGIbnfj+2wDa6nsb9lpWaRJuIVkpimmYPFMKI1dFDOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa53882-1a91-483b-b5a6-08df0a5ebf2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 08:30:16.2097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4uikwBLoXhB4kOYChUd2d/WsPC6ktP356/Gu4aSAgpjPWczfnwJE9torKaXArwU0gjU6fQGiQcpngi9gkMXPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR11MB9688
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

On Fri, Sep 04, 2026 at 01:35:06PM +0530, Varun Gupta wrote:
> During VM teardown, the VM's runtime PM reference is dropped
> asynchronously, allowing the device to autosuspend while stale page
> faults belonging to the now-dead VM are still queued. When the
> page-fault worker later tries to ack one of these, it calls into
> guc_ct_send_locked() on an already-suspended device, tripping:
> 
>   Assertion `!xe_pm_runtime_suspended(xe)` failed!
>   WARNING at xe_device.c:1267 xe_device_assert_mem_access+0x11c/0x140 [xe]
> 
> A live VM/exec queue always holds a PM reference while it has
> outstanding work, so if the device is suspended at ack time, the
> owning context is already gone and the fault is stale.
> 
> Take a runtime PM reference across the entire page-fault ack batch
> preventing mid-batch suspends.
> 
> v2:
>  - Hold PM ref across the entire batch (begin/end) instead of per-ack.
>    This prevents the device from autosuspending mid-batch, which would
>    leave write_only acks written but the end flush skipped, and skip
>    counter++, desyncing the cadence check.(Himal)
>  - Add a comment explaining stale faults.(Himal)
> 

I'd guard the entire page fault fault handler with PM a ref rather than
the ack part.

e.g. At the very top of xe_pagefault_queue_work:

guard(xe_pm_runtime)(xe);

Matt

> Fixes: f289f7807119 ("drm/xe: Add xe_guc_pagefault layer")
> Reported-by: Szymon Markiewicz <szymon.markiewicz@intel.com>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 8f8210a732e9..9c9cd6e056fb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -9,12 +9,21 @@
>  #include "xe_guc_pagefault.h"
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
> +#include "xe_pm.h"
>  
>  #define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
>  
>  static void guc_ack_fault_begin(void *private)
>  {
>  	struct xe_guc *guc = private;
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/*
> +	 * Live VMs hold a PM ref, so faults during suspend are stale.
> +	 * Hold a PM ref across the entire batch to safely drain them
> +	 * and prevent mid-batch autosuspend from desyncing CT flushes.
> +	 */
> +	xe_pm_runtime_get(xe);
>  
>  	xe_guc_ct_lock(&guc->ct);
>  
> @@ -62,10 +71,13 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  static void guc_ack_fault_end(void *private)
>  {
>  	struct xe_guc *guc = private;
> +	struct xe_device *xe = guc_to_xe(guc);
>  
>  	if ((guc->pagefault_ack_counter & (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1)) != 1)
>  		xe_guc_ct_send_flush(&guc->ct);
>  	xe_guc_ct_unlock(&guc->ct);
> +
> +	xe_pm_runtime_put(xe);
>  }
>  
>  static const struct xe_pagefault_ops guc_pagefault_ops = {
> -- 
> 2.43.0
> 
