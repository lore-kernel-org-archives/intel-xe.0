Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9317FC678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD3B10E730;
	Wed,  8 Mar 2023 22:07:16 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEF710E730
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678313234; x=1709849234;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e8tNBBH7uoDZ85jh1yZEBJ666YfNoPhuqANfLx/B1Uo=;
 b=QuNOnSeE58DWwJYmt9BRTRk6wLbDorPP2YMX3ui+L4sU0nE/thxMeQNi
 43Nl/3hP+29Y19EVfSGC0geAqA3p2s3I6FaIGFH6t0qdZQJKhG8eQX9Db
 BY+Xj6/2mEBGo28Px5x4uUZZARQix2Sd8jmMOjsZ30DZRh+kh4hhe0IO6
 tkIHKsobFEo0Cb0TXvLO8oyxDEcMDQ3N97PEpK+BFEM4PKdoy6s/yavov
 Sm7QSQXWmkuuPJ6GvHEAFlgEWovUAWlCNjwb5AKXCkg5mHF5Ig6PbzeA1
 J08v3hC6oc4BXd2acwC0T3kLGN3O7pA1Y6xZNdeh8Jz6XD9SL/Up3Wl+T A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="398868503"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="398868503"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="741278227"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="741278227"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2023 14:07:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:07:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:07:12 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:07:12 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:07:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hG4xO3CwbSkfJunPYcu3KXmbr9ons1UGwJHoyucdTzMHzmkDH5GIPNJvzYtk9tL/fhGHXfmmNkGSORVgfnQjhKpZ4z3IwmPi07OZ3Bomoc13ZoG5UYFSqQCnZZM2HTV/tfyYZlyjSoPGQLpJuNxS3NEyM9MxwCwcGoqytxFjbFniMlg9OJBRInqxa5nPwQoKzUD+46g6sROIMKULku57g4eQLZwgtoEiUnC/NYDPWA6yrsuGpQ7Pkf2PiVAtjtXE3MMluvgqBjjc5dItg3wjhAvSgWTqnyMmAM3WIPU3RWzdNYBpXN062Zx7ZvrYXoiNEzOGe6A//wqaDwNtHMeqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHeXTV5T4S29zomjcT/teDYaJsdnQsW6SqwXtCYueYI=;
 b=RzTLWxDnqD2PEclofVddr3Y6lMqq+ySn2CNOTaowk9rrTrcEf0I8esJykPVDcJO0NA+71zd8Q0PRqH+ovEbGYXhaNdsXRtYSL6WFijYXo+c8N6ObQWxWpS0VBw6f+ZT/U0SiccI5sLHHWielmIKs8p4Khkv3jk7XdKTzJbaTSszgC7oWPlxE6Y6h9l2ptqgw/8Yzpvi+5dE3L1GUsOK0Shdem5bsBV3xiZa6mQ1jTnUwvsrbHHNodIR7BGL/Hjr1PxMPAi51kf+RoC08F5pgbvoCixST6gM+mEKOF+a+0tWlzheFeUBA5JQgFtlw38qmvTBb0Egove5FnWCXg1OvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28; Wed, 8 Mar 2023 22:07:10 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:07:10 +0000
Date: Wed, 8 Mar 2023 14:07:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308220707.GB1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS7PR11MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: f9bbe8f5-ebc3-46e9-c3c6-08db20217699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: odGpw7keWijmYXLbcX0MGISgwatvvZPAfuaBx77bFsgYA/00WVfmtksmfKaWX/n6gyOv2C9qEJ0sCpacqiODy9+5K07qMVpvFk0+NbkuebFNObshhddOIUh/CYB1l4Xbpt7iy0jX1QxMBwhoXwLk6FryKtAAO6CALTtOisjcQjowPMrw5KbQe6vDzgxTdG218d45bVV8HzOY/8AUKeP5HLVk9g+DNk3yaPMHabk1Bg1fPTl30OvKwf1W7n63Ixj+xDU+Vv/cjSqA6mNB7w65G2kkSQ1GIVhPt4TL40MW1PwKUq1UiRGpJnZVhdZU5f+gn0KHaFz6F2f5UnFOyHAppVz7LUJpG8oJ6vkG0BlHbaXQkW8PjOLt27hJcfPaRvp8ocRYMcaU5yD9X+pZgxHmY0A5N//cKVdOx9BYOHTGxlf7xVRf3ncP/lxPCqtNw9Rqy8j6agtmREOWLg8kTAHJWH70m4AsIqS8H3WHb3vVhmL9td3Y68u/HAaUkgAvvCzN61Xy9/U1IeNayqFGR4dudoagnFNWTVsqEgESl+P40tj1/kdmLzvAwl+6gzW/sB7U4VlPrF4fbqhBw4VFgEHAcDUZdr8fPrP1qtdt9yPvp3vTJUNzSK4ommnvdaYcslA9KVJtXcF6ALnm4DGF4gM3rQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199018)(83380400001)(26005)(38100700002)(33656002)(8936002)(5660300002)(6862004)(82960400001)(2906002)(478600001)(86362001)(6666004)(6512007)(1076003)(6486002)(186003)(66556008)(6506007)(66476007)(66946007)(8676002)(6636002)(316002)(41300700001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Tu6d7wAAt89x6AKVcgb2noEjKnX9rfRGNeMNysUCh+0pb/84aGHBykIyGM1?=
 =?us-ascii?Q?cj9z7c9C3xHA1nsVJdBEQGQHGP3Q09eb1u4QINJS7t44Ud5mv4UwWFIS2GnO?=
 =?us-ascii?Q?nQeM1S44SobGqpASyWUGc6PefC3CSQnmdEBgsE0sv441Wy8XKKdd6s6MujBf?=
 =?us-ascii?Q?Ey3woDObdDpS7em/sK5ypGoSOC/EQ1/e82DI2iazpdEFFL2g4gqNeb045L6f?=
 =?us-ascii?Q?i3fUOFGOxbcIze+Vo7u3lLjtN2i5dsCWu4iH+FsDViLsMPUjJR8wQh4ydqKe?=
 =?us-ascii?Q?1dNFZ5KfrIYIbKxI3Ebbj2RfIF0kAAyVU2tZ5mTMGjrf5qLMj3FPi3y/tDHM?=
 =?us-ascii?Q?98lkyu8Nm/J27agpA5iP0Dss4GmFq7bFXH9xgXqOWCK6jbNU3t4creXcJXiZ?=
 =?us-ascii?Q?QWust4G+d6j3ObUOhW7BlYMQv9M8QOGQhdTyjGBQ+afSKRntFIV5ds5cKEdm?=
 =?us-ascii?Q?jm0ya+laaBH528aqzKjGh0smb4HxDkp6YJjo4uSUkcOE+z3G23S4mBsHx/I9?=
 =?us-ascii?Q?ZOHgo2ahYSCRcwn75BfIRVGAvU6kECjqvSyqu60Zg0jRSzN/h5FktP9M9ecI?=
 =?us-ascii?Q?scfuXp45XOvu6sKhH5OyRz5TEIMLpys3KfHLIYmu3sholDQ1AQEkwcKgc3Zg?=
 =?us-ascii?Q?tY/siHHNrho3Qynxl4Pr9d9XxzjkuPSH/cEhE0BiRvTMHlybM7nJq+wYjZ0E?=
 =?us-ascii?Q?6XA/Eb7auC9EQyuxmLKR4RttJnDcRNccEIOv0jLIQkZiNOoezKr6vcV/ldpv?=
 =?us-ascii?Q?bDUWQBqZJizpM1+N5+GEsorLlW8gkliE3bMik0qEgJO0FOGkXdsden3HORmT?=
 =?us-ascii?Q?4kAh3OogmDILBcDtPxhy0jgRbIz0EiETuFvdaE5v+B5QuRFYWTFAELekyMy2?=
 =?us-ascii?Q?R7RsTblFzv9+BfeW6QH2BmTt/gpOmo5jYUBYLS8mOL7BJkLyn2CEnAw0fpSw?=
 =?us-ascii?Q?pAJwH0jq038ECaHzMQQHlRy5bMWgNB5kRC8xW1B9IBKQI8I/0+1zAYHeVMmS?=
 =?us-ascii?Q?FIg1m2yK1YIIZGGl8xd88Xa5i1e7NuOQcvuyr6YEXY9qpK7nNH0//fanxrvP?=
 =?us-ascii?Q?NFBgb2IGFR+nme2l3xqsA2ndskNbwu/8OBO+1zh1Y1y/Vbj1DDScLa4OupJm?=
 =?us-ascii?Q?8lkCaHCYCisKaS5KWl9r0Lgw/br9dkZzUSopkDIzXCiKdl7llmqPDNFaOxzA?=
 =?us-ascii?Q?XbeHbLuVHVHwAqIcgn5l5HLiHe3aDKrmPalhJNXggScmc8Slp5D5yVo7gIvj?=
 =?us-ascii?Q?rDGKgyOfh16tPkuFs/fXx7IXu0nUSsrl3f0JBOYHI1nSKi/kjZt50CiU5jwi?=
 =?us-ascii?Q?X7EkDHAPbwfKV5Me/b6mHHwADKY5b6S/22PwK/aHtQJaQk6rUVlbKzgtjid9?=
 =?us-ascii?Q?hReiBYJ1zGFelrFEHjBzZEV3kwu6V+6Rpiw+PnxhFF0kV42w1/iu89cHISKP?=
 =?us-ascii?Q?cOKsaA0uZOB2S9Mhf/T8v8fmh+dpEiBeg1GJD8CdqH7zCXYZDx0D6hTKWqqA?=
 =?us-ascii?Q?LEz1euixk34nyhKwbKKoO4oKXBwwk3nnQ/UtRS8kxJ9p99x1c2CSSAv26yz2?=
 =?us-ascii?Q?RUYR2tKiITBIhBqS8mboR+C/ZlsHSxcT3DwBSZLeKqFHf+6WhmcU8F/Qa1vl?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bbe8f5-ebc3-46e9-c3c6-08db20217699
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:07:10.1681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJ8Ry68ZtmHCeSCeu8kM6pIMGho2Vmu0z3MWfBg57HdekdRBghs7I4/uFmkq6JyNfVd/jNs/gv1nDhBjpaHKNzil8tbXjTcEcJnXVlFd5mI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/19] drm/xe/rtp: Add match helper for
 gslice fused off
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 01:24:34AM -0800, Lucas De Marchi wrote:
> Add match helper to detect when the first gslice is fused off, as needed
> by future workarounds.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_rtp.h | 11 +++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 0d2f51bb06e8..dc5a1c62d531 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -8,6 +8,7 @@
>  #include <drm/xe_drm.h>
>  
>  #include "xe_gt.h"
> +#include "xe_gt_topology.h"
>  #include "xe_macros.h"
>  #include "xe_reg_sr.h"
>  
> @@ -170,3 +171,12 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>  	return render_compute_mask &&
>  		hwe->engine_id == __ffs(render_compute_mask);
>  }
> +
> +bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
> +					 const struct xe_hw_engine *hwe)
> +{
> +	unsigned int dss = xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0);
> +	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;

As an Xe_HPC platform, PVC doesn't have a geometry pipeline, so there's
no such thing as a gslice here.  It looks like this would be trying to
check the first cslice for PVC, which is confusing.  Should we just have
an XE_WARN_ON() if something is trying to check gslices on a platform
without geometry?


Matt

> +
> +	return dss >= dss_per_grp;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 433f0cbff57f..4140ef507fa0 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -427,4 +427,15 @@ bool xe_rtp_match_even_instance(const struct xe_gt *gt,
>  bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>  					  const struct xe_hw_engine *hwe);
>  
> +/*
> + * xe_rtp_match_first_gslice_fused_off - Match when first gslice is fused off
> + *
> + * @gt: GT structure
> + * @hwe: Engine instance
> + *
> + * Returns: true if first gslice is fused off, false otherwise.
> + */
> +bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
> +					 const struct xe_hw_engine *hwe);
> +
>  #endif
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
