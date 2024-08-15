Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C02C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 20:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBFB10E53B;
	Thu, 15 Aug 2024 20:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2h3uofi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B5310E53B
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723752593; x=1755288593;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fI3Ylv1KtQLE4KsfPKqeamwGe2dB7iJFbt0LmSWIpok=;
 b=k2h3uofitTjFvlU1RGTA59acrryst8J+nPP4RSV9mMq9tPTuiEV/z5Qz
 QME62WtMeiLklncG7mwo4r0/nErguAxIcWPluJQy0QnsIqjfKbMI+EtWH
 QI3YPXjMCHD/6D7s7S959TmqvtZEzm4NpnnR57U4MfFofYFdE15Q1J/uA
 aE733xmUC59PtxTTITbmW/L0yHU1TL4GDOyY+aS1ELOAFvTFa9kyyfbqX
 KCw3/OoYZD766FZmgBLXAdm/EG8Mhgec32OVHGoUzjZp67+7hCzXpUSqU
 /X6yOOYBYYKa03ympQ+ScIUpbI3tYDmQN9HXtmvJAiBXmFH7fOMS++SGH w==;
X-CSE-ConnectionGUID: 4eGdDfHiQHait+Dt9J8tzw==
X-CSE-MsgGUID: cTr1CmDdRjG0TwmpStc7yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22002356"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="22002356"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 13:09:52 -0700
X-CSE-ConnectionGUID: Edb/RNkfRFeiPKIKu5S1UA==
X-CSE-MsgGUID: A6E44LyVSEymUtiZxjTZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="82654329"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 13:09:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 13:09:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 13:09:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 13:09:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2cUR95NtbjnGrR1T3tNnpliXWe9opvLvc2yZT2hUzaIDSAeMMh03kZBNjZV8mXhcb3inr3S7Rs53NPAeN/a19pR6Tki5bdC8cm/Qn7U8+PWInT1Y3D3c/aU7lDnPviETOGJHTUKvdqnbaPb08HN3Gct54EYuACz53LNF6J6Gqz72GAFEpJriqhM6u6Ug5yU4OJTDzQS7ZixmfyXLon+qpZ9i0VJ9bvpuD+xpQlottg8rJDXWys1V28BEanvByf3eTnHfyv22NlRhBc0EhyTp4RUDCgetaXeU0h7FBJmdHQH0aEz29K5+9H6nA0Cx0v1Epq1F2yXpCPFYaSQ26ZHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyQCPGv8r0+boHlq8iE3gETDI19RkAdOvaacwPP/qVo=;
 b=idSjV8J9voh0uGnYo1TM0A/wz6TypRORbAibMkCg4+LQGLnhyXJRWa7tsj5oHUUPfS38fUhyWrYt3Gf7fXl0GKq3SPdmVeUIzUdJgpwqRCUL12+qim2cMjx7XcOkZ1Yayo66906neXkcGycjpdzM8ijOUYzASm2diEOpNC1iO99w2sBzOzLFeMgWXHziO498P7+Defy8cmxY0WCUnqEgagaY3tsfUZ9I9tkPsv3ATDJvwHMx4dfO724WFYsrLGFWOjQjSE+xA41kNDt6hKo2OmB7Ybx3zHvF1VFvWzwCD1f7cbxgcumXQ/J56nSBHPy5Fq4QMTeVUHdrvqTdcHxsJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 20:09:46 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%5]) with mapi id 15.20.7875.018; Thu, 15 Aug 2024
 20:09:46 +0000
Date: Thu, 15 Aug 2024 20:08:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Add debugfs to dump GuC's hwconfig
Message-ID: <Zr5gTbtkpfqlGgsx@DUT025-TGLU.fm.intel.com>
References: <20240815172602.2729146-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240815172602.2729146-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: be1c008b-8df6-44c7-fd31-08dcbd663573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E4hJ7lLLCtjvWEw2zCAdqaovmm2MP1YhXF/B9xliSD5YMI7vxom06aMY9ue2?=
 =?us-ascii?Q?73tW0RYkwTCzowV3FdFVDfu1rCkhZz9CeGUOzRcUCwQPiJbjx3zMgYX6qanZ?=
 =?us-ascii?Q?Jybeqc+hU+PPS6AMS+LoAZsMLDi8ig8G+Pfv8ms5jGBvHzq7O33dfAUyxO/H?=
 =?us-ascii?Q?1V940n8JedyNlEMn31pC9uw2WwWs65HB87w2EVcPf+THk6DwA0P14Vq3iV7u?=
 =?us-ascii?Q?bxfntgD8ZGuEfYAV6DrlxS/VFvoCLnR9ehNWouiQ5meGUGR5aVBqW7ADkTc5?=
 =?us-ascii?Q?SuX2FnEhkS8WQX78h8eOyOY7W74lxV7AVB8GufUCiBNzmyB0lE78eub6N/qC?=
 =?us-ascii?Q?2m+LSfoP5Pw3zELZzpwCMbGB5XLX6PF6RjKp0ziXZixJ2hxTRwIGrmMA42GT?=
 =?us-ascii?Q?GXRDJlrz3oTaWwqjDxtj84JRxO+dnQ1U/Z6Dgz6m6fcR//o5ZEA752m1Eu8o?=
 =?us-ascii?Q?nAUzVs4q1Dyv2/RGsx56luO0fB/uwFCa+LbiKjM7zi4zv9g+1k/m0BTSow61?=
 =?us-ascii?Q?31LJpICgCdSBwuIGPX3M33Q8hZv83H6S/JFMqnvtqcZ2Swb4Vuq5FZ6mHADh?=
 =?us-ascii?Q?/Z0vEqOMmsZGjef1fMZuYRogJwkPbSJcPFTkwrPKVBA3YSKi1IJx3y43TuUt?=
 =?us-ascii?Q?VhdeSwRRaTMn+8KguNRSRy3r0wiTYjlyoUf8D5//y4e+QT8kQXpoSsx2Fwbs?=
 =?us-ascii?Q?DWhOjoLvfV2SolwGCyWVb+J+4Vl1Ypywhrvu5iL22UT6clrNEwZobSJT/nIE?=
 =?us-ascii?Q?860P9RHxbIrhYE7LRy4bL/KBZu8zlsf+7tCtNdlVeX39lB4mbFnt1L2dgg2y?=
 =?us-ascii?Q?cNK4Ico4DXWg8v2wrVw3EFacuNDXLBvTg9VKKIeKvp+hUJ5bzmlj61BKudit?=
 =?us-ascii?Q?8lFcjKtWPR+JypRMuTGdNMVnP1H7Omkh7kG5mq+7HVHpiVl0dMav5QKg/hGa?=
 =?us-ascii?Q?B8DnczVr4u14Kt9Z/tbVpx+jkdoqvLDe7DIOmLZCvni6AWnYyZG3cW60JNr/?=
 =?us-ascii?Q?weVDoqc8nUGwXjxlVmviA2Mqad/xnOgSx4WZrarM+AQEP3S6PBhBgCHaydwT?=
 =?us-ascii?Q?5JmYmX2P38654CQgWcosGCYzzfFxit+L4KpnjoGp9ffDmI30u2g5Fwvzyiy1?=
 =?us-ascii?Q?bKtUR68OMeOfig5FmDhFv4PnEo3xNFy+OeBcGL9G6edEI4a0nLMDnmpJfi4s?=
 =?us-ascii?Q?6F/RxLlk3D79cxs/i3wSe4BPyNisuUbdiOeKIGd4ReigjlVLrEUdO2S7245r?=
 =?us-ascii?Q?FCy6p0rilCRZs3ioZ/spxhQR+M8/Ao41IiOSQK4i9OrPPkhJZoKbjkTkGyLL?=
 =?us-ascii?Q?0qXxy+Lq/+44xTEORYG9W0PMHRpFBAuo6y9PBQlXCdcvMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ANQ57DJzbS4QYp8gEP3p47tCRJwzT4G0xlBr46swD5ztMpDdBnu0J7d8WNGZ?=
 =?us-ascii?Q?PUP77qWBNs9AyScX0GzYCkdkG5eb2EHix7i8OkyKaTHxz64Q08BNfd2l4Yap?=
 =?us-ascii?Q?sHTcqAMUCBuFKPwjNbNzBeTv8YgHrsISH995a4m4bv7Ohm436yBzO24t1DM6?=
 =?us-ascii?Q?J6OHymUE2OAxGEBUDZWmVUrP4utBmud61AWn4M6f6oYor2flYpEOp2FBtole?=
 =?us-ascii?Q?eR56+1H37Huhs2FB75P2GVQXXX4XV+C4ayJpPFY4BkyI5T2SJkcwo2xvOWtt?=
 =?us-ascii?Q?sC3z3GjYoEQld7Htf4Q9sO0JcQiwNgyB5LxF0wc+SPDH0OG/AV3gEwAelipF?=
 =?us-ascii?Q?gT+gyCukJbQnfHaSpkhjiiHUmglcZbBfkgZjmMvnWz9R0OnMa03o76mIzyzt?=
 =?us-ascii?Q?IRvAzj2NHwtLMZa2LasXFvf55s7jf0MPFlWvGH2MjbJvKkpaxeg6jdPQu5LG?=
 =?us-ascii?Q?c7EBzY0ZTzpxxfku81ql30I35/MSneORwtlJkkNXgGZeIBglDPLS4gpvqUxo?=
 =?us-ascii?Q?s5G8tLnEGsRlGdV7M+gfAxMmccinU2d8HIrwlsalooDi+zJMxYh4mPiSIwHI?=
 =?us-ascii?Q?f0j8pYVckbn8Cva68por4LrRn1e8TMouYdHuNlU+mus0sY5vL1cPO9MAZd5u?=
 =?us-ascii?Q?x9LndZgO/bDWkqKBFB7UENkf4C3mpG0tav3VOjC94gHqDL6rC0+PIfyZNhIv?=
 =?us-ascii?Q?TJ0kp8M1m4qrmaCsvTZLrRPfxUrIyVUxoqyWGC6kBq3FJLlPmx4jwIrBeSCr?=
 =?us-ascii?Q?WcH+id8brMcVNgmKBO77UUVU7hpkudysbYx0Is8IUoXxwykwPQxq4CwOp3Qt?=
 =?us-ascii?Q?DCDL86+T3bpOf6g5UuoiNh45iRcllT7t0ReZWr7in6Mhzkkc+kKiQAQZATwn?=
 =?us-ascii?Q?nkwIq6ATxn8uVN6DCE7GKiLh84fV0n2pTPSggBXtTtUKD4tBvkfjKzJlYxug?=
 =?us-ascii?Q?jExaoRUbpl/sByQlYWn8y+RhsKeGr0ykxzNPkeXWjm3fTOGe/IwEwAVL1R+Z?=
 =?us-ascii?Q?AIT46TtGUOb/nLS9rO+iSeZNCZzAyCxsPje6N2LlpEOeqmxaK9WFPPKU8rAI?=
 =?us-ascii?Q?P8x/eVLwgwvYtNnb2DnAZTmiLcapBG0spK6nnWiw7rMmGMCV6pE9iXGxYaF8?=
 =?us-ascii?Q?cmpS9GmFuR8kXc8Hzx/Jw/UaatshA1kZ+K3YapnzfwPwIHr7raiOOdzRZCOW?=
 =?us-ascii?Q?Pmsq59VgBM81Jqnqr1z6s316E9Hm0I0tpteUHZXsc8XiJuElofwk1fk72eyW?=
 =?us-ascii?Q?g9TPOKGtDNjfDLBpsTTeunhQOs+Ho/SC8eUr8NdG3Sk7Q1dNwjixjwhI45CJ?=
 =?us-ascii?Q?nx4f4skDUqC63usyESVz00A5fDd9IB7pG8l7wxEGrnx6BV6kRJuUHPqzDen+?=
 =?us-ascii?Q?T0PBp8pZRPNdTAulkCwaZOSC3s5k9ArUFdpXbQvqHo+otgBrCNL3Mm8zArQm?=
 =?us-ascii?Q?MUJhsLRNod6bl/JnPZltd6+evbuQDcdBlG7xOI5HLYJm0ZS3DzNBq/dLfn3z?=
 =?us-ascii?Q?x+EW/Pd6uHMrhqL24ikuSZa4ZCtSlelgHVQZuzDKwc0mTOD96PmFh5iD5y1s?=
 =?us-ascii?Q?t4ya6bv9TR2FKGuXLjeBPJ+yKCHMoWTsW2wmjKbsiQv6nhqbO81i1EBBHGcz?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be1c008b-8df6-44c7-fd31-08dcbd663573
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 20:09:46.1777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4b6naYxP/gZpfVoKpC7nuBOeElYuSO0GtlwKgVbJ+X1laopml4iFtOyu7gKNJ2imlHsfTHxj7epOahhGfkXtdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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

On Thu, Aug 15, 2024 at 10:26:03AM -0700, Matt Roper wrote:
> Although the query uapi is the official way to get at the GuC's hwconfig
> table contents, it's still useful to have a quick debugfs interface to
> dump the table in a human-readable format while debugging the driver.
> 

Patch itself makes sense. Question though, would this be useful to
include devcoredump? If so we should code this with the snap semantics
for decoredump. See guc_exec_queue_print() for an example of this.

Matt 

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 ++++++
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c | 57 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_hwconfig.h |  2 +
>  3 files changed, 70 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 5125d76ccfac..8f95d3a5949b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -19,6 +19,7 @@
>  #include "xe_gt_sriov_vf_debugfs.h"
>  #include "xe_gt_stats.h"
>  #include "xe_gt_topology.h"
> +#include "xe_guc_hwconfig.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
> @@ -270,6 +271,15 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> +static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	xe_guc_hwconfig_dump(&gt->uc.guc, p);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
>  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> @@ -288,6 +298,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
>  	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
>  	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
> +	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index d9b570a154a2..025bad701556 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -6,6 +6,7 @@
>  #include "xe_guc_hwconfig.h"
>  
>  #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>  
>  #include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
> @@ -103,3 +104,59 @@ void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst)
>  	xe_map_memcpy_from(xe, dst, &guc->hwconfig.bo->vmap, 0,
>  			   guc->hwconfig.size);
>  }
> +
> +void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p)
> +{
> +	size_t size = xe_guc_hwconfig_size(guc);
> +	u32 *hwconfig;
> +	u64 num_dw;
> +	u32 extra_bytes;
> +	int i = 0;
> +
> +	if (size == 0) {
> +		drm_printf(p, "No hwconfig available\n");
> +		return;
> +	}
> +
> +	num_dw = div_u64_rem(size, sizeof(u32), &extra_bytes);
> +
> +	hwconfig = kzalloc(size, GFP_KERNEL);
> +	if (!hwconfig) {
> +		drm_printf(p, "Error: could not allocate hwconfig memory\n");
> +		return;
> +	}
> +
> +	xe_guc_hwconfig_copy(guc, hwconfig);
> +
> +	/* An entry requires at least three dwords for key, length, value */
> +	while (i + 3 <= num_dw) {
> +		u32 attribute = hwconfig[i++];
> +		u32 len_dw = hwconfig[i++];
> +
> +		if (i + len_dw > num_dw) {
> +			drm_printf(p, "Error: Attribute %u is %u dwords, but only %llu remain\n",
> +				   attribute, len_dw, num_dw - i);
> +			len_dw = num_dw - i;
> +		}
> +
> +		/*
> +		 * If it's a single dword (as most hwconfig attributes are),
> +		 * then it's probably a number that makes sense to display
> +		 * in decimal form.  In the rare cases where it's more than
> +		 * one dword, just print it in hex form and let the user
> +		 * figure out how to interpret it.
> +		 */
> +		if (len_dw == 1)
> +			drm_printf(p, "[%2u] = %u\n", attribute, hwconfig[i]);
> +		else
> +			drm_printf(p, "[%2u] = { %*ph }\n", attribute,
> +				   (int)(len_dw * sizeof(u32)), &hwconfig[i]);
> +		i += len_dw;
> +	}
> +
> +	if (i < num_dw || extra_bytes)
> +		drm_printf(p, "Error: %llu extra bytes at end of hwconfig\n",
> +			   (num_dw - i) * sizeof(u32) + extra_bytes);
> +
> +	kfree(hwconfig);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.h b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> index b5794d641900..7df315900e1c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> @@ -8,10 +8,12 @@
>  
>  #include <linux/types.h>
>  
> +struct drm_printer;
>  struct xe_guc;
>  
>  int xe_guc_hwconfig_init(struct xe_guc *guc);
>  u32 xe_guc_hwconfig_size(struct xe_guc *guc);
>  void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst);
> +void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p);
>  
>  #endif
> -- 
> 2.45.2
> 
