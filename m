Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6397C5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 23:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5988F10E22C;
	Wed,  6 Mar 2024 23:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f23nl439";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E390510E22C
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 23:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709766654; x=1741302654;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e+qLxY4CdWioxs9xd2qJ0r2nzAsOH14r9vcyFH9yu0w=;
 b=f23nl439zHcz0TbpsyqQu/NRJIcyl61iWZj7btT5x1vwE60LQt3RC22u
 sYndT+SFCeYDdVkbWiP7LkQ+PJSLTtPI6s3XNe3piJ0siqacwOD+WqeaH
 mJgzQbBRsTe35TO8kz+NDd3I9c8MheiXtcZsrSmQzHpTT0+LCATom7Qr1
 6TUJCQRi/nqsKmIbcYjm1MLVV8sm4dU9bAl9X8k0/ALTjTTUZG+G2IJDp
 paV1QnLh/Wg2jLMBiBlr5vH1KdNE+Yqj8bo1NUMnBo3ssFFbIRIn2Fm+L
 80iX152iyaE5k+r5JE5Oz+dTEdFck5L76GFh47Zx/6vxpfSRujUOxpD+v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4277829"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4277829"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 15:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="40892276"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 15:10:53 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 15:10:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 15:09:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 15:09:59 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 15:09:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7AOZplcPM0IkR7ODHjuVKnuRwdoDns1wS2fkl/n4ExBYbpa/jix/qQIU8+gdcF45boSZS88nuSNdI2oNfGqGu1+YH8MPlUC7yfmGDk7t5ggtS7MZV/T7XxW1daQyujRI80I8Fl47VnA/ryoA9guUgN5jE6ScFVtCh9XyyDzjp9Z2D0a8H4HEO5eC1zrllWZyJ77Hw4I4mgrfWrrf9CcNpJ3MDJyL9L/yixFXZ7tlc5lbybJhkao4ddWPFE0s0+vmuPwLc71aflTNWqUOETFD3J9UGdBdeF15JWphHHH9sgyU5EWmPQXo8mlwF8CDla8kwztgo3lY1DdBP0zkfwoGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQlwHxhA+rgOlIH9YhP1J8R549if3uSefNcoMqphvVs=;
 b=VIusrkpG+ioIE0m+Zj7GWDQPiaQ3IeTgkiTZHFlyooDPtlwM6KGxE+fkTlNewuahC3u7FtkwV+qMOCdRQuwri0RYes0DN8r4l2raRzIU04O0dsdBxhCsnl2gTSXUZEgzOTZErwSqW3+M8ktxzci+m0DDPzhwFchabkx8JmtlWfJIsz91OuJaO1v9yGpF1/HkJjsoMUtKKQM9PCaJIOkQeF0r3aoNLEFkRZpHTrJEo1MJ01epLEeeyC3gMo6mBqObIkpUuLDvpFFjf1qySfI7ySwWLid1KPlMY8yhE/+epB9JPKjJC2h8NYjsz4EHWl6hoA/d2Uigbk7IdoXlsVU7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4990.namprd11.prod.outlook.com (2603:10b6:a03:2d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Wed, 6 Mar
 2024 23:09:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 23:09:54 +0000
Date: Wed, 6 Mar 2024 15:09:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/pvc: Fix WA 18020744125
Message-ID: <20240306230951.GE718896@mdroper-desk1.amr.corp.intel.com>
References: <20240306192128.1895603-1-lucas.demarchi@intel.com>
 <20240306192128.1895603-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240306192128.1895603-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 36118593-5a3c-40b4-8788-08dc3e3288ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HVEunTgkFOQbaGLY1WDvGZ6DWV+z4B6sJJEsiqdQz/B08UeFPUQufYJJyyAwoK2frf/qeYE0DdrhUwA6jvl2LMHJNBPco0M7QrvQsvDrbe3bU9SSwAChb+HqboWdITv4ZJntA89jyB+44Rs0/k1WPV3uvHFyXjxIzgYuBWqgld6BbYzihjhRZfuAWDgGZlx8P/BHr8w/Mk8LtcXQ5+VLdH8I7qENSXpp9QzZalHdJGKYZhYAG7JAgumI4v4WNOTuW02Z9e7OeZVAgw+VYFvlDKML5ERkWoUloY+Bk/Hy3jPicseyUHonxMKbsJDrsGbwUsPlw3jTIIbaISuAmAZisaRffQXgNSx8U4998DzCoh2WvHiZR/Kp3PdbAUOCCOCejudWKxbadcQPROKMc39l/oSeoPnNlniXD8jZ6I80q4wcAhIKihXDzvJephvqbY5YhcM/zvIRIbQlyek2wwa9uYJNbx9hzMKh4CENdcYBTijBk8Nydgdr7yvQffZbXIc9DJh6IEZXh//vkY+TZE3SkHryIdH0sM0XqSoTqxsuXgM5pfC7kt/xMzcogyg3nFE868SHFecFlrj+6mqS6RU77kmxL2yRTmEL5LWf/G+2V0bSgSnrUJUvzir+Lrdkxzk56qFLIBvHyG3/QsUVqJALJzX0bvJ1KnCpxO3Z3OO7f/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jx+PSvDG6iZi5RrgyKGIzoJ3XABCumuaZZreqivesCJwjWpUEtgkl0sGYfVj?=
 =?us-ascii?Q?kWIjTgBIJZtfaUPV/yL8mZBfgbey/sBLzbcKVq2WVrLZXKjnzRxQfmxWuwEs?=
 =?us-ascii?Q?OE5OlcKoTEq93/ALWxqs/t730rb8Rc5eVRiUw0Rl202kHuh8fYZySsAmJZU5?=
 =?us-ascii?Q?nA/8C4sGaieyF6cIFY3uLq0R/24g7YRI4siBhs08Dx0k+ly0wkIBGu5JJ+Cl?=
 =?us-ascii?Q?2GuWxUCpcstB1iXVt0YR6rr/nqMrr89wtpnox5wYijcn1vIshkiW5OpPgFt1?=
 =?us-ascii?Q?zceqs9O3aLxYpBWyGLuLKSGTSIAFdI/H+Tkgjjl6/9Gre5ORBCFdY3ihw2EM?=
 =?us-ascii?Q?1uODA3HKdLledJVz8ZiHVgcLtAgOq6bTLtLdC0J3G4KGiJeUEjPc2kD7JX2S?=
 =?us-ascii?Q?6f966nw51BmrjBFcIERXvDVvUsAqM/Toou2K8Oq1cRV8w+1Tv18we+HUoOQ9?=
 =?us-ascii?Q?nkzZncDw0Dcs4cRvqQ9YvGDaq7a3QNuS4cEnaCXD2MmrKdA7CwVITgK+8YZD?=
 =?us-ascii?Q?p0m8CalEFs1jgeEkvSR9gOq9mcRY9rJ88BkeqScmdoxH5AkA1wYi59O2j80e?=
 =?us-ascii?Q?wyEif/VDLL3zTKejp/loC+TSaMLHtJBvlGcqD8N9N+oCHLEylcJfj8M1EYjL?=
 =?us-ascii?Q?BlVBH0SdZGBvHLAFSA7ZBquZYheIZ2Bl1KR+kZvh1UyJpMh1DrWTHntO+9ma?=
 =?us-ascii?Q?83sJLQhTnepHdhFhucQ9FiHfjSFi5GNNlIjq/rzwIh9OiAQrJuxNXjx9OaF5?=
 =?us-ascii?Q?wFb4t5oI7Ubyxr8IzrenWiw0YBTgmGi+f+la9i9Fxt1x8BCt14lsBAajZ5IH?=
 =?us-ascii?Q?giA4u19wCui2NPk/VrME+dwdX4tLW1emy3cDzycT+CBaxBnhUBO0pHOIj0Gf?=
 =?us-ascii?Q?otgbMUL804WHbU5nE3Z3AbMrJH7XTkKQY92hWbbq2U+yGfELpoxv6ZxQkS+N?=
 =?us-ascii?Q?l/1t9k5l1QPktwA/eF6Gr6Ildvn+LPfu9vVUhnCCYHmtv/F+uXATZ0xk5lWo?=
 =?us-ascii?Q?xBlma0HGvOtJDeZ4SlRbolIRYVHQWYExsFB1ojslL7DWJiN+c8GhmMQ9gyw/?=
 =?us-ascii?Q?gBSNZbLvdWM724vwL66BTBvByR9lGHeC+lFKiEh/puWX/4ZqkQAyRq9ZBuam?=
 =?us-ascii?Q?9QsahSm3wBniIn90lRgDWFi71vTbh53s8+kJGngqinZ5GL4uileeoulUruyo?=
 =?us-ascii?Q?j4VM5Z/Ze7ZfJw85OcfGUN2aTtIRTe6MQZr0iz64/b+/dzIRvzUcp8SjZ54Q?=
 =?us-ascii?Q?VTHNDsglY7bPCM/kmm7VjgTpVaWOWvjw0o3Ntsj8AqcB8al0Noww20Ijcw+N?=
 =?us-ascii?Q?iPU5jC7p8PnuxBSbAB8e/9Z0pQM3Q6j9GxGYKzu+gJHrQURomulkJOMtMclQ?=
 =?us-ascii?Q?IiOk/Gyw7zsBTvPrOx+ph7RSbjOa/rJnrw8bxAA2hKQ+lAeshxrZ7Zb95ZYk?=
 =?us-ascii?Q?ICIrvYlPw+kiyUOclxZsZVISD0e6iJO28pKYMxqQ1yqcR4Q6UNvurKeIYQZl?=
 =?us-ascii?Q?hJ6riTNrf/w4+6eSjWf/Zqe6UntDb/rGLoDHs77Q0FTNUQtb1zuxcJoK3R0E?=
 =?us-ascii?Q?moRw4GWCn9APxqwIY/awb5Rzy0/aPSqI/HUXXX4MxVXMCt8nDjAUQIhr0cDX?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36118593-5a3c-40b4-8788-08dc3e3288ae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 23:09:54.3268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+uu5uREXJOKw55mMJHDcKuF3SM99YvCk2grBza7RmRg1Jq9PlKp6yLnySqccaF2YRoittPxCehtnMLfFMp+mUpE1bCi/pAVmBDyjbxLETo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4990
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

On Wed, Mar 06, 2024 at 11:21:28AM -0800, Lucas De Marchi wrote:
> With the current state GUC_WA_RCS_REGS_IN_CCS_REGS_LIST could in theory
> be removed since there is no render register being added to the list of
> compute WAs. However the real issue is that 18020744125 is incomplete
> and not setting the RING_HWSTAM on render as it should.
> 
> Writing this in RTP is a little more tricky as we want to write to
> another's engine base when the match happens: first compute engine and
> no render present. So use RING_HWSTAM(RENDER_RING_BASE) instead of the
> usual XE_RTP_ACTION_FLAG(ENGINE_BASE).
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 2460c570e628..54740d246310 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -377,6 +377,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
>  	},
> +	{ XE_RTP_NAME("18020744125"),
> +	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute),
> +		       ENGINE_CLASS(COMPUTE)),
> +	  XE_RTP_ACTIONS(SET(RING_HWSTAM(RENDER_RING_BASE), ~0))
> +	},
>  	{ XE_RTP_NAME("14014999345"),
>  	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
>  		       GRAPHICS_STEP(B0, C0)),
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
