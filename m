Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D88DC3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 18:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA6410EC8F;
	Fri, 19 Jul 2024 18:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bk5Zx9Ab";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8FA10EC8F
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 18:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721412682; x=1752948682;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lBq9rpXQC3Tl2TOT5/l6WYm+y0RUULJjgt+BPjgbSqA=;
 b=Bk5Zx9AbhbPh4se9pnEc9QMzXzfRlxOdzuDfDQwaeCdYvGP2fKD2rCEP
 8HTC35G101hPkrkHm/7mwuGx/Bzum+YWTv9bSfg8ykFQqTEs1cMUGMT1Y
 LgmV/DPaK5NpjJXZ52qDIjp368CfVkzPhEX/7I0kJuBpD5HjKUCUABGpl
 vXDkTC/FVc3I4gFBsSjjq1JbpBC2c26EPh336B6huJxdjCMm3khlQNm4j
 qj6msrX0Jk+tVED4RTfDcLebcdER47tgDwd8ZRf1r5YmAVZcn18hvKt6H
 DgUuQRSG35aHXvX3xQKWK/AAj1Wto/b/K9BtxCEygeXs0pMZrmE7U814/ w==;
X-CSE-ConnectionGUID: +GTz1Sc7RWW0htVGSX4p8A==
X-CSE-MsgGUID: V4nuZK37S5uDN5fNwPnZSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22907777"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="22907777"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 11:11:22 -0700
X-CSE-ConnectionGUID: B5+TSQxCQfWDKyt+MIgliQ==
X-CSE-MsgGUID: pM1rKr4XQE+dLUB1VKbDCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51928567"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 11:11:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 11:11:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 11:11:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 11:11:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQqzdWvPbP/+W4MqAQqgKsaI8wh3Ee/UBUP+x3XRbj8tqsBNckh9eUdeHA5M/d2C5PqkqcnQ6Va4lAUuOaflAKAavJAdygYsxgLgHhQ+VfDg54/9LMxoasqepRFMHtSVxprg82NVO3JAN4uYq54liPyyAKBcbdPoVsB+fNp2luH5/WoBhakxweCGsBH8LN4vS6AUVgyIeHFD1z5BAsmspT/qPJm7B3r2SiUmdBN5PUjQ6e1+Rul6u5rIRcrDGP/T9zbSAqBrnoni3bJiqcUv4UgUAKXkhSXzH8ZJH+WpemI27qbrYU1FsSjuejdA+N31Eha66W+Acu8gmdtKU1k1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IL7+bg6pnWwslq0CD+Hg14Bk14qqofPWQ1P1dwReV10=;
 b=MPCdJ/CXjAbskgCG12Tvxg58UXokwNid2fJBn3I4l5LYm7CNdFblgJ7cNnWgy5Ss2IIhDWM6tGvHYX4OJKxtO0V0f2p/LoTiuzvlKqbcdCRnvoFQZTTK9CH10gskuj+OL3ideqeKqtPoB1WWuyxtorWl9qtU/8h1s/8AhZYHrxsYTRUQTN38NBpKRu9jZKhIU+X5D7ZKWWwHjjgkMeKt3VE9RahFKbOKpikHggzdy1qomHRjSkFBXlNwx/sjfgAzy3mcw1dbeJSCGglG8VmdNfF53e6JRcklvQ+RR9KAc3GzmfigqhQt7BZNzDcXR1NjXDjMGWSECTIU/bPqhwWClg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8251.namprd11.prod.outlook.com (2603:10b6:510:1a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.32; Fri, 19 Jul
 2024 18:11:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Fri, 19 Jul 2024
 18:11:16 +0000
Date: Fri, 19 Jul 2024 18:10:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <John.C.Harrison@intel.com>, <brian.welty@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/guc: Bump the G2H queue size to account for
 page faults
Message-ID: <ZpqsE6BEB52jnuqP@DUT025-TGLU.fm.intel.com>
References: <cover.1721411802.git.stuart.summers@intel.com>
 <6a9eaa520c06e49b6f4b259f0447d17635bf6bc1.1721411802.git.stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6a9eaa520c06e49b6f4b259f0447d17635bf6bc1.1721411802.git.stuart.summers@intel.com>
X-ClientProxiedBy: BYAPR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:a03:60::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 920a448b-d6b6-4b88-f8bd-08dca81e2e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2lQtTpW3gWvd/jc1uSrws67PFIONQSEc/rLWXyzjBrOvY5gYnbSqjuRf5nMd?=
 =?us-ascii?Q?+hNWwp8Mdd+jedtkCp2Z/PCO0m2eZNsS203STaTEMD6qbUNmRzhYyi2OkCrO?=
 =?us-ascii?Q?fd6hLr7CS94yQ4a8zpVR9dPVYYNRsw8fBwm3EYgkX+QLujFTkkQAcpLrTKZ2?=
 =?us-ascii?Q?WGYon7bvNTQugioINRWdy2cvabwR+o48pUyHupwKa9UtKEsh8dEUk5tKdOGx?=
 =?us-ascii?Q?eQjfT0666nX9mA7t5T2wAPrMIiwkBz9r9Yi/YVbI+C+mTmaOYuhO09CcI3iY?=
 =?us-ascii?Q?wD6OPthvJT272usAA10DOiZAoioplvPWJecSrWgcovSyqw0IwLFycZwtUCwK?=
 =?us-ascii?Q?zycTPUtV38drTrg7P+R6jcmOCVwO76LPOkFhn2xl7D+QDrxQrr7itUlNQ9+g?=
 =?us-ascii?Q?ZCLPwYV7lF9jmQWt0YUqIqg+wE+hMf7t72eLMLjvRT6ulCRlt24XWcw3MuGC?=
 =?us-ascii?Q?0Tjg/Q0UnVepTXdZu5NXVWY8dF4OFaxa545HShLAFnV693IIdXkkTlaX7pO9?=
 =?us-ascii?Q?OfQlBmOYxTlmN2FChSuciz589Vz+E6GUS3U52f4NRg4sSTE+7WgVaJbfUlIU?=
 =?us-ascii?Q?iD8LrNVcTeBHXBDO4t8W3sPZXAbVPdClOSFVq8Ww7JH+vCbmimkIH/H1mxHO?=
 =?us-ascii?Q?Psmxi54HEjG6THWREJboa3m3hiDA6/3EAEPIFHtyrYPPTpCqxyio0ULRNyQu?=
 =?us-ascii?Q?WKRdmLxR4TCsYkX4+NT/6lzY2aLKOtZ3zDqCxgMDnPl9QZaRIwHpA68Em/GC?=
 =?us-ascii?Q?FeU31tmBX4CEmBG34xIZIOVyUwyRA6WbsSOohWVBfpb/eNFJ9QzuA7n/Xy9P?=
 =?us-ascii?Q?hb45AwZpWs8ADUdmhMfYCybWMjIdSiT/81/guun3RXqRf+jdgmeZueW1HYnu?=
 =?us-ascii?Q?cZGBnNagiVxR+RLRZqdlATuU4rY7ZI7LE0O1YxP3Q2drykmtBXSml6rOxAUJ?=
 =?us-ascii?Q?guwD99pbrR8NZtYQK5Mu8gjjk+znt6T8chV8uU1zEkgXaJOJQqiYSxUVlNL1?=
 =?us-ascii?Q?gFJhGdVFQZ5jleQPexNNt5c07MF3gv7DKo3l59Vy+evxnWTqbug6GFaSUmLK?=
 =?us-ascii?Q?e2WKHIuYIj5DLtpoBvrPKguuEz/Ytv1IsHtvDBccVIaJzzUrkaGOK1a7ZAzu?=
 =?us-ascii?Q?OcJfsnEMWklNKaOHM+NmMJTeAtgMj+8wp3PpE4aupsbepLztWoXSKDIz6Jnf?=
 =?us-ascii?Q?2HUXAfJgUjCGd3+9/t3doLZT9WDWdBMXitc2VKD5J6jF/MS5wXkC+ZFrFORg?=
 =?us-ascii?Q?gFFut3TDpgVW3n7oPCzBJlixTxSl9xZu86Ak0t8Cg3zk2L70pFxGgfWHn0VT?=
 =?us-ascii?Q?qOBfy3Ga26u1aKqL/UgD9Je3ZDjjvPjejAXLgwlLvGIiEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HSIv1yuKLpu2+NgJ945gM8+gKqk0USdrZfWDsH3lnDm/NILFS9l8UlB5/I85?=
 =?us-ascii?Q?TZNdCLsutjTo9/b5qVGUMHTCokwj1Okr6brhTTq9Dy4rZdBZJFcOxsi3I6RJ?=
 =?us-ascii?Q?yHfM5N5/x0WFrbCN1mtk8U4rQHhbmhhNjafHMe7DWyT7Ovz8bW3e/Ci+3VtA?=
 =?us-ascii?Q?yAojUwjEB0rUQMC4rJgiZeiqNnIiWUodbYH217U0PjmbYDawMDATSmRjCLNg?=
 =?us-ascii?Q?YjLXFQXXId/gK527xUztjAs8u3/X2NPCNeTlCsyVCVjnRk6xPBfuxQ9CjqxN?=
 =?us-ascii?Q?+faDKdtsdgmdSZuEMqqUPwM9D74LlcRfVnCJM1xwQUYL9Un8iVunrUOTJbcT?=
 =?us-ascii?Q?tZYUHDGdI1Px4L1O6uuHxb+Nv2n8t9M5wtcwUWzQiczLPok0RY0dMCkZMNZ+?=
 =?us-ascii?Q?++VL8my1a93yQIEa4EGN+rLwm1rcuWEL2jVlZeh2pTvFgKKiU8Ocm3I8IM1z?=
 =?us-ascii?Q?NqghSEJwHhxGJRKr7awaA8Xkfen+l1tshqFSLjtr2FgICGcVpySit2V5jGux?=
 =?us-ascii?Q?6jVBDEcWzZMzHV7/PMj1GTSHOfBMFW7su6wWL0U9dJTRKAGXt/ll7Xh3gMpz?=
 =?us-ascii?Q?0o9epvxX5YcXEG23wAMIngbkdNMr0W7QhPytHcaz+1YfYFgP07I/b3vxUpd0?=
 =?us-ascii?Q?hCqPoZ2Udel01HSPgsxO33yj1mE9nJ64NsJefQkryzGhoVzb5ytLo0dzaBLG?=
 =?us-ascii?Q?VZ6zOZXgNXWEFUBw6WqFLbNHpknjogxJQNp5nsslwlUTPsK9rivwjfISR0T4?=
 =?us-ascii?Q?C49gwV9ZEozVfShjuk8lE/kTA3klVRp9tsNPgB6wX6lUQD2+EPEqU1NWPyDJ?=
 =?us-ascii?Q?0DgxCkupGY+Z6uVmtCiJTTWeAXWfMPJYozx88t/7rE7ZA7aTH5W8dIR4uMEF?=
 =?us-ascii?Q?TwEd63p29Aqgylm3Ny7AbGEQ/5aMN+1f78yuBOThCaEvCGj4ALRzCWkUgFpK?=
 =?us-ascii?Q?L5wcohOoqaUUQYztBRxUhAL0LWXxr2c6yd2C/Q36W7A6ZPNqibrxE/5XBm91?=
 =?us-ascii?Q?MVW+Ja9L5CaGNBrGS8zyZx4c+mnnbL7DOgNdBg/j9Pwlpdo3kXPPbCJAq1Hk?=
 =?us-ascii?Q?Sm0c5wNXPPsohHjyM4zrhUiyzURTDtQ8BSq1loxK3sHHw8Fg+9/yAF2BsfAK?=
 =?us-ascii?Q?Fv1g/EfQUS7AepQPB3jFY14IjzFhOZthVUMOKqGM4kTRevyU72MBi47ZF6yh?=
 =?us-ascii?Q?27CgJRVY3dmnzaAmIaXDShRBWQ+aJYNM96vi0q3hRdB5b689mZdGDkXxJ1z5?=
 =?us-ascii?Q?j08ZN+hdsjpTtA+u+XHdqHA2m47cqK9uAC+P2bnpONeLQilFgG5rvUODcKES?=
 =?us-ascii?Q?zds8HtCjrYHVpqSTi+b9r76zevPD+58boquUEgZ+h5Uj8as4RW+6dpy0nlJD?=
 =?us-ascii?Q?RCD7PngQ95m/hzE7rnirJQGhbCGja7s0hoNXqlOAtmqgeoP2ffl2gIbq3ZmO?=
 =?us-ascii?Q?6w9D12C+PW8xtF2NuZw7mNe6+KOINDZ+3VOl2kzlzJADbEcKw/HlhEDnT6Pn?=
 =?us-ascii?Q?9HCE1jMZq/HLknvkY9xBUfPwvhEeQ3HuJ8+OvezZWpJfic4jri5uALxsyeLa?=
 =?us-ascii?Q?wnNARz7riFsc0inIYuvqtuxNcpuVGK7JGQG3QboLcgdD2rdjAOaGUs8qy8jD?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 920a448b-d6b6-4b88-f8bd-08dca81e2e3d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 18:11:15.9349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztx1jQq9YX3XOMdf/JXiN8yNjCg8FICzmNS2ZeI4gaMkr+c+rFxnT2MtLe0eL+82d0BcVrtwpiE1trf8l7noQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8251
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

On Fri, Jul 19, 2024 at 05:58:28PM +0000, Stuart Summers wrote:
> With the increase in the size of the recoverable page fault
> queue, we want to ensure the initial messages from GuC in
> the G2H buffer have space while we transfer those out to the
> actual pf_queue. Bump the G2H queue size to account for this
> increase in the pf_queue size.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 7d2e937da1d8..3135f5812827 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -105,11 +105,19 @@ ct_to_xe(struct xe_guc_ct *ct)
>   * enough space to avoid backpressure on the driver. We increase the size
>   * of the receive buffer (relative to the send) to ensure a G2H response
>   * CTB has a landing spot.
> + *
> + * In addition to submissions, the G2H buffer needs to be able to hold
> + * enough space for recoverable page fault notifications. The number of
> + * page faults is interrupt driven and can be as much as the number of
> + * compute resources available. However, most of the actual work for these
> + * is in a separate page fault worker thread. Therefore we only need to
> + * make sure the queue has enough space to handle all of the submissions
> + * and responses and an extra buffer for incoming page faults.
>   */
>  
>  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> -#define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
> +#define CTB_G2H_BUFFER_SIZE	(16 * CTB_H2G_BUFFER_SIZE)
>  #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)

So I think G2H_ROOM_BUFFER_SIZE needs to be roughly 64k as this is the
part of the CTB to sink unsolicated G2H. So how about...

#define CTB_G2H_BUFFER_SIZE	SZ_128K
#define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)

The cost of the larger buffers like this is a little more cache
footprint but I think we have live with that until this properly fixed
in the GuC.

Matt

>  
>  /**
> -- 
> 2.34.1
> 
