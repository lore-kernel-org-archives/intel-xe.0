Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036D3C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 22:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D4C10FD70;
	Wed, 31 Jan 2024 22:49:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD11110FD6F
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 22:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706741389; x=1738277389;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pEBWIQXwMh6zorDwH443mCMsRYFfuqxy1Eb3PMJvNy0=;
 b=Uu8XWfDTgrZDnV4++n3S0XI0DcB4ld+Eo1LjCfLWovua5WlYBwa1QCUJ
 MBr1ZGNuMbBmy26L6/I9rKmWbXYaOrqbrJXF23xgdZEty6DTPyot5v1Qi
 3Dpz5VM2A/abLOZl5FpFjZwatc7kik9jscNpMJkjsmijoLvMwd+Y4BNoP
 JL+dUGX9LpUR8mpIsDMmGIY5+YPTqilv+S092/dIH4Ng2Xh7uvfl3n045
 uZ7hgziYu+HFLPLfYstDxUJACT8HbgX7KfJDrNZY8+XZXoYskKwywN1J5
 BVUv6mXsJcTAaNbHYbFjNWvGP/3RA5Z6p6gtrlk5hPdugA1GXk8RQQ1BZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434916415"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="434916415"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 14:49:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="30671145"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 14:49:18 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 14:49:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 14:49:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 14:49:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 14:49:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTm3stFQhYtOPu1wkDRhIkqGZmFekKoUT+xxQraXkyDDiWMFkwQ3cRpRTIFB49iCS6GSWWa/kojMwAPRlCPzF3QEqWmAeiWBVBVKZfYY6JZhVd2YdT3NqE3DUAaBnDXoMorniuphGZKqnHnidklvqVd0IeZs4mlPLTKMUgHSZqmHB9Xj5Bl4AU/j5KewMxbSzrHu2cKkTlTKPf5MoHgpweVMF2gF4AHQkySj7s7YDjnb56GDNPqH2etMFYFxBtjMhFAjTZPD3mdFKhFcqMCT+ik0G1OPNoPmD2yNRfvZqaOSn1K3locURYRqB52gWWO2iz9BZnJWxLVLMyqAN9s1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIZtvW/HViq3eVwdGntGiWS5Q4QNDbBsGa5ocLD4syM=;
 b=oWmohzyqtHf+9OpQhSwNYL4mre1nC1esONg+E0hO2kqYXJuW6OBE0kpbPCjphMMMPrjdXGubFR17QnCncw7P/Fymeo3AUNz2C4bxxobUAeDEEi2O5Gk7c0IGmX/GJ0VJdbdyq7WsaTKGxNmOrHpXMPciFQnU+5kdS1Ef3XgTCnMb/vM/bPWDL8fiQVr1Jko+ltMNou5Z5+nDpAAe4O5ByCsbQlueJqulEBBpU5+8GX5r3TU1iTOuHntoIQda8YyOnAmFjrdSFf51B7Qg/0J26jcG5nNvJV0cPJznfe9hdDEq+LYMvv60vKFNPr17NmBf5dgTIOTlz54JmCo+B+HSmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8211.namprd11.prod.outlook.com (2603:10b6:610:15f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 22:49:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7249.024; Wed, 31 Jan 2024
 22:49:14 +0000
Date: Wed, 31 Jan 2024 14:49:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 1/1] drm/xe: Add helper macro to loop each dss
Message-ID: <20240131224911.GA305461@mdroper-desk1.amr.corp.intel.com>
References: <20240131214811.309263-1-zhanjun.dong@intel.com>
 <20240131214811.309263-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240131214811.309263-2-zhanjun.dong@intel.com>
X-ClientProxiedBy: SJ0PR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:332::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: e90de334-1b1b-4a18-d534-08dc22aed906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tlYZJlkKdwuHCgY/Pa+PFXFP1xRu4VfwPSHBrOfXH8LVg84ivh0qomL9MC1UfeYVKI3wwWj5BajidnFCCdYfOhTK2P+l47ppzobSLrKhmFTvDHmiLHNx5TcQ/rH83qpeCPu9vyt0N7gAAGghiU25RGctpNrP6Xmrr9YUnxJA86hgKE6CAemey/JJJB5CHesMCjeGqGPzysEiau+KT1H+zL7uiVw+2lNGc+E0LQmuFnj2kvox+gf8daB5jloPBG6FAawiPPvfCDZ7Qpb91CPyA/yhjklm5U2INuuKsd5EnnZC3yX5WHB+Bpy8xqOQOEc9xbHToBtfZsB2/IiveIzAYVle9p3KrzezTLbt4MAOyrDSwfFAL7xuyxqodNZMnU5Hnf8qKSSuxB2W94TkRg77V/Y9IZ+WlNMsf8zRjp5D7KSrcVbohh8GX0cYDPohZBlv0PJhXCP202YwTfjMcICf5KPdJFcd3A90S4MtEAEhhSaq9aW2qLREhenJwZxxXJNxmoLFJx9Nh7W8/3ah/e9DkbKDa8iD9GnjFzw4KCCqnkqGeROVSd4R2qkfjlYYD6LL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(366004)(376002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(478600001)(5660300002)(66556008)(66476007)(6486002)(26005)(2906002)(83380400001)(6862004)(4326008)(6506007)(6666004)(8676002)(6636002)(316002)(8936002)(1076003)(6512007)(66946007)(38100700002)(86362001)(33656002)(82960400001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SHZCz9kD/6fbsL0OowS8fMB661/Kdl+XxlsSalsY4ibSUou3n7w/MwhazaaI?=
 =?us-ascii?Q?phm6RDCP9QZf0XS7wLmK5a5OmcGoQF0KfxuTR4njiOuGX1pkWfBmgDaK85OI?=
 =?us-ascii?Q?rGZhVIhdy3YVHzhgT+KXvg17p+mWHE9Gq+U11kBth8q2+qITsgH1+F8cnXiT?=
 =?us-ascii?Q?2T+0OqaqjPmKeyXP4NAWRDlRS+dd99WSLJKhnWNdhFfuHrq+Ga9GjKLFbxHg?=
 =?us-ascii?Q?YyKxP7+l2yOSdG9x3DApqc+21fwzB8g7Y5IgxMk3uGozQc6bEiJ/wTLB21Xm?=
 =?us-ascii?Q?Sc963B6kDggVMFaAHHr3KY9liPHjjASwM7tBr3I420bsjH4Vmxaq8q2NRnfJ?=
 =?us-ascii?Q?WLAoouoDidtG2JuduDghQPaMu/kbLhOC2Sr3yOryxc0W4hC1psGYP/d32Oq2?=
 =?us-ascii?Q?NerhVGk19Zs51swVSk5LDklQNjn8Ng9UNAXI8p1RyIXph9G0wxdzPnwYgnRY?=
 =?us-ascii?Q?4jd4JtS4uUwgPfG5hD0+CUwVl5a74LcwKBRNXC09ql79BDIzVGbmiYMz8US8?=
 =?us-ascii?Q?onRLlHgg49GuW6WZaVuMEaFP1gevX7SjpxmRJqfmzSmqomGKeu7t+LcRu3vn?=
 =?us-ascii?Q?A9GH+Qjd285xHYKKhE+YdoANgYI2I71FQxvUP7ewOXNn480Mz+jYjn6M6F58?=
 =?us-ascii?Q?I4FwkMWPoJdm/eZkm26DVAhvYXWIqugmHUJMSQuvxWonkez8DGiqCkLxGM1Y?=
 =?us-ascii?Q?whVjOFOKemp3ieAp6aRtlRxigjfRgNplmuzYs0a1XjZmBq9zlp2CTTPVhXkN?=
 =?us-ascii?Q?f7HJuMXYzPqvA7/tu8ZU8FblLG3m/Pv6efd/aFzs0/xY9XOFzPrjRmljfeGo?=
 =?us-ascii?Q?eparM+sdSRKaR8BXrRTTjisl8o7m+vynZfHEZ/aHEecXzRAkVBdbaIuyHbtR?=
 =?us-ascii?Q?o7xGv95VekNuREYtYYLhs3uNreiH7LWjJaqIFcTT5Fw7N94gSXBEPwG+zkAa?=
 =?us-ascii?Q?8QAWxA1o9NCdht2ZHxUSeQpSitEVQpbQE9XvJGrY+mE9MQPWqtv45k+wrstQ?=
 =?us-ascii?Q?lb2257Lt+LrAys2KPq3ncn2zIPDyde3kGUm+4Fty4HmqzjcsI6eRghpNhIZZ?=
 =?us-ascii?Q?7i3iX6rZ2yCDhCVl9YVVXzhL57E0FCFAixHuphXtltgSiehuAaYaQBv/w1bd?=
 =?us-ascii?Q?/9UN9koaWmg9kn3cSbViKf5tZ6htH7j1+sR+L0s9+zyo/3Q/tMk6PkbHIcwo?=
 =?us-ascii?Q?9fz1yo8MAESgY6C17Lqghiee6nIsoytTV0IUv7CDkV0pMdM8LUGEvJzemhOZ?=
 =?us-ascii?Q?GiKk8J0mnO8C5LClJkIJ2HY3lIGbSI0Cp2oH+RfaO56XHE3rK9rq1AFY7t4c?=
 =?us-ascii?Q?k2kak3aeDpCiuNm18f9TlNufSfkrU9yAYfk8JJFYzZh72h5C4I33+BmcUj3z?=
 =?us-ascii?Q?ZsZUfPatcwu/zln963rfzxpxUh5JnJUtb1amz1w29YHdH5Fh5ZWJVLNrSvXP?=
 =?us-ascii?Q?ZgztMXyw4qRbqNxiAjGiF2RPh4RHOa2/ioMdKgsMQ1RDf5k5RDt/V5Cf8jhz?=
 =?us-ascii?Q?IKslW1MbOYiUp6zZXuAMfHiJgZZyU6ld/yXP9nnI6bn4ahyH9WFDa0YcGbxB?=
 =?us-ascii?Q?UDpJqBPlYqnZ0WGi/9NiOg3BSiObh8FVUQ4AulNjWGkiNL0jm+Wsev7OZbJ1?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e90de334-1b1b-4a18-d534-08dc22aed906
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 22:49:14.1594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1Z0iFTqPZP5i+1bwPTlnHg9x3xcgH6NxmJvJ8oJuvLPHB+tue3gsD84zpka6s4h8CvTErgHoerUiLRdo8fXPHyUxw0pX5sgPV4Xa9Jk7jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8211
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 01:48:11PM -0800, Zhanjun Dong wrote:
> Add helper macro to loop each dss. This is a precursor patch to allow
> for easier iteration through MCR registers and other per-DSS uses.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c      | 34 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_mcr.h      | 14 ++++++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.c | 17 ++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_topology.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
>  5 files changed, 64 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 8546cd3cc50d..711cbfd8a488 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -291,11 +291,43 @@ static void init_steering_mslice(struct xe_gt *gt)
>  	gt->steering[LNCF].instance_target = 0;		/* unused */
>  }
>  
> +static int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt)

Minor nitpick:  We usually don't put naming prefixes on static
functions.  Just calling it something like get_dss_per_group() helps
reinforce that it's just a local function that isn't exposed to the
greater driver.

> +{
> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +}
> +
> +/**
> + * xe_gt_mcr_get_dss_steering - returns the group/instance steering for a DSS
> + * @gt: GT structure
> + * @dss: DSS ID to obtain steering for
> + * @group: pointer to storage for steering group ID
> + * @instance: pointer to storage for steering instance ID
> + *
> + * Returns the steering IDs (via the @group and @instance parameters) that
> + * correspond to a specific DSS ID.
> + */
> +bool xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
> +				unsigned int *instance)
> +{
> +	int dss_per_grp;
> +
> +	if (dss >= XE_MAX_DSS_FUSE_BITS) {

We don't expect to ever get called with an out-of-range DSS ID, right?
If we hit this case it indicates a driver bug at the caller?  If so, we
might want to just change this to an assert:

        xe_gt_assert(dss < XE_MAX_DSS_FUSE_BITS);

so that this gets flagged loudly in CI debug builds and we notice the
mistake quickly.

The assert will be compiled out of non-debug builds, and even if we trip
this we'll just continue on and return 'true' at the end of the function
anyway, but even if we screw up enough that this leaks into a production
driver we're just going to return bogus group / instance IDs; it won't
cause any kind of greater problem like a kernel crash or anything.  The
for_each_dss_steering() should still finish looping based on the
"dss_ >= 0" condition (since xe_gt_topology_get_next_dss() returns -1 if
there are no DSS left to return), so that loop won't go infinite either.

> +		xe_gt_dbg(gt, "DSS id out of range: %d\n", dss);
> +		return false;
> +	}
> +
> +	dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
> +
> +	*group = dss / dss_per_grp;
> +	*instance = dss % dss_per_grp;
> +	return true;
> +}
> +
>  static void init_steering_dss(struct xe_gt *gt)
>  {
>  	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>  			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +	unsigned int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>  
>  	gt->steering[DSS].group_target = dss / dss_per_grp;
>  	gt->steering[DSS].instance_target = dss % dss_per_grp;
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 27ca1bc880a0..91cf02b97bc1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -7,6 +7,8 @@
>  #define _XE_GT_MCR_H_
>  
>  #include "regs/xe_reg_defs.h"
> +#include "xe_gt_types.h"

I don't think this include is necessary anymore is it?

If I'm missing something and we actually do need it, then it should come
below the topology header to keep these in alphabetic order.

> +#include "xe_gt_topology.h"
>  
>  struct drm_printer;
>  struct xe_gt;
> @@ -25,5 +27,17 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  			       u32 value);
>  
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
> +bool xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
> +				unsigned int *instance);
> +
> +/*
> + * Loop over each DSS and determine the group and instance IDs that
> + * should be used to steer MCR accesses toward this DSS.
> + */
> +#define for_each_dss_steering(dss_, gt_, group_, instance_) \
> +	for (dss_ = xe_gt_topology_get_next_dss(gt, 0); \
> +	     dss_ >= 0; \
> +	     dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1)) \
> +		for_each_if(xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_)))
>  
>  #endif /* _XE_GT_MCR_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index a8d7f272c30a..37596d5f9574 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -11,9 +11,6 @@
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> -
>  static void
>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>  {
> @@ -167,3 +164,17 @@ bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
>  
>  	return quad_first < (quad + 1) * dss_per_quad;
>  }
> +
> +int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from)

We should probably add a kerneldoc block for this function explaining
the interface.  Otherwise it may not be immediately obvious that this
function returns -1 after all of the bits have been returned, thus
allowing our 'for each' loop to terminate properly.


Matt

> +{
> +	xe_dss_mask_t all_dss;
> +	unsigned long next;
> +
> +	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> +		  XE_MAX_DSS_FUSE_BITS);
> +
> +	next = find_next_bit(all_dss, XE_MAX_DSS_FUSE_BITS, from);
> +	if (next == XE_MAX_DSS_FUSE_BITS)
> +		return -1;
> +	return next;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index d1b54fb52ea6..44bd8a58f9ce 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -21,5 +21,6 @@ bool xe_dss_mask_empty(const xe_dss_mask_t mask);
>  
>  bool
>  xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
> +int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from);
>  
>  #endif /* _XE_GT_TOPOLOGY_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 70c615dd1498..b926606edb38 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -25,7 +25,9 @@ enum xe_gt_type {
>  };
>  
>  #define XE_MAX_DSS_FUSE_REGS	3
> +#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_REGS	1
> +#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
>  
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
