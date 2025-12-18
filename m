Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3035D711C3
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AFC10E2E4;
	Thu, 18 Dec 2025 21:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ix2Uwrtd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FF810E2E4
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766092434; x=1797628434;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dEDi8I/W3HwxURZSuhMa1PRF2yaxvpy76sSn+CCHdRo=;
 b=Ix2Uwrtd+tPDSuQAy3rVNsbDHnWg2oxOMjOuvEc+Ta86bxEtCWRXbjvD
 ko+iXxMR76B41lamcLm1VbeSQapgK1h/8DU2GILePaXtzjX8Drwc/F0Fq
 63RbMIbjKmWwfmaRNQnGvxeEOmRND5X7h8MyHBKKJjPEx4Sr8MA5eIt7e
 eK3+qKHpskO/HdW6W+mzmma8R13DMk1TgE/2w6CkSXh2chprVyHTpql0L
 tlAmO5zwiLfJ5tagbAjPBNm2iOek+EM/GEPZwXkB1CxAsI6XN0DinDn32
 v5KsGwAPZ74CAX+J27+fTE1l2OcFZyTKw/ivykEiPr0PjJZcIipoQ/jMD A==;
X-CSE-ConnectionGUID: hpZXZsPEQFaDPfZp+n+g3g==
X-CSE-MsgGUID: dKS1WLjAQFq6/7Fpq2J+og==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93531320"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="93531320"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:13:54 -0800
X-CSE-ConnectionGUID: MVW5UZrURqW/Jr+Yb3xh8g==
X-CSE-MsgGUID: xOooD78tRm6gxY0qdI6Taw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="197840675"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:13:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:13:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 13:13:53 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.39)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:13:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCd6USFGJY+R1+Xn/g4KPKoetqJQKSs9kG+caSko12nnoBhZFBnMI9e1ZaRyDR2aLqaFMq/Op+KzZUQ5rRCvo8Y3NzWH8gL9Tp7e0tjmEFepEifXyNQYDmatRSrYVcWF6grfXpz5KNV6fQGGHJXKkm9sdkR231+dTlbs4lG011XVFkp/AfT+brJnHweuWITNKefqfCi1wq0okOj70GSRfRfUty17jkOoV2liGwMZLNGaL8Z7Z4jBqqv21rdtTx8AqrMgXS4pt31Hs6lFVekXIVe4b7ohP0sdw7moJ5QeU8qa3Ol1lrNKFyn8IwADqQ94yNLN5fLUZ9Ke8XF7M3/wKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJaEKLrUZ9mgw+Fa9x1eIMjr8RSlXMhSCGIArBHTra0=;
 b=vScLLsQNeKNylKpt9MUyojquagcB9GMxyuZnEMMbXwHrRniYLRFBhNaSxYqJQ0AyB+ebJQHzkqFnPASnEt1qi/9/xCIxkNGxL0KkHz6CkKwR8NGALgB1ir1lT+LcZuf+rfTTXFs7qn8cbcknvn/649ij3WZSf1rsqAs1tEfHjB5X7ED3rKUPL95St1QVTP1ha52G0i7fXR5MLOzJBMf5ZHmXRLSYk52UMO15KyGvMS660RGFxhAkphfGWqt7VDSVeHVnBgRxNJYadgCZpS6iJi06FgqXYaiD2TTia5RacNLAmmhWoyKLJYI0QPI4rCcG8vR5v5+YCw4tmF3260dlRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7767.namprd11.prod.outlook.com (2603:10b6:8:138::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 21:13:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:13:49 +0000
Date: Thu, 18 Dec 2025 13:13:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 3/3] drm/xe: Trigger queue cleanup if not in wedged
 mode 2
Message-ID: <aURuiZxyK4GCOkdz@lstrano-desk.jf.intel.com>
References: <20251212233444.1717326-1-matthew.brost@intel.com>
 <20251212233444.1717326-4-matthew.brost@intel.com>
 <aT0clhiMQQvMk02_@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aT0clhiMQQvMk02_@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 246a744e-f313-4f97-ad0e-08de3e7a5653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AWLyZoOta7eUW4uxwfxSTuuGPTxmZD4p0Tm9qcJmjW6Yxnl8RtNDIIxxhB3U?=
 =?us-ascii?Q?FSLTCwZilLKXac6axIqbv/nvWU4aEZ6SX2sFNOVoLgUCHaYKsqqDPvZUXAqC?=
 =?us-ascii?Q?iS4CSVmAZyuWqEZq5BhzFohPLxw9kJtd+1+pRS96Ao64Q+H8L82Ocl/fzBS9?=
 =?us-ascii?Q?pYBGxNu6OomxReEx+c4XclW+UxgxCfANM84nT4+RSK1t7Ri6q4cHEXJwJP8L?=
 =?us-ascii?Q?LZS/lDLT4XN2DSR98TvqghbL+gDezw9XQ44hraVHSG4ci0NzIzY/guOhrlhU?=
 =?us-ascii?Q?AERDVvXRgSkpFC/n4mZIgiXSAUP9MEFOkNuLGVvNAWeb8SDw0YuC1471LSnv?=
 =?us-ascii?Q?M+z4ZhWCdEOG0TcFsE/8wv1M2vOBpb/ZkVC1PI8jexJVzJqWWGNLp1oshPHJ?=
 =?us-ascii?Q?ApzSEv2Tz6WWqvRKBqwefLDxhlkSGSfzuoj8NudWeTNG787jDUDQVI/8anyD?=
 =?us-ascii?Q?e07RvsH+vuG020b2fqIDokRNNM2gonaJQxG7Hso2CVKC6a65HCFNZeZqr6DT?=
 =?us-ascii?Q?dnEKSdB6FBZfoROayPTj1pRE4K528JPnQyQBmU0J0NIFDeUzlYVsHupAtmOg?=
 =?us-ascii?Q?+a3HPNPvcteoTTCOWgpZVY7DgrGtirm8XccEzemeeXz9cK+/wXxl4Af62Ae9?=
 =?us-ascii?Q?ZneNfSmO4MLCFtHBx1qbkppIk8gfGHg/Cy6CSfVuoiKDrz3GB+R44wz20rBB?=
 =?us-ascii?Q?z3HBkSVgsyjdtT7hcwMljRZDdTu6biXU5wwMksqvGVU32i2nynDsKOwf9UOF?=
 =?us-ascii?Q?wp1vxoqhPrncghsFAmDTjcDsKMSShPsy983BT5n0nYRpx8zCJf6UGc0F5Ga2?=
 =?us-ascii?Q?j5xiCPYKrwPKQe364R+xbGVsmXkHk2XGg3+fDLcTP5iCcvLjLRAmHkmw+mFv?=
 =?us-ascii?Q?Ekvgf0bn1A+WXnbqWZmFhPhNtA+NVtxMW0XbLyQsNojDtw2Mg4ayDQyBpQAM?=
 =?us-ascii?Q?fIoC+FYkN7B7m8Uh8c19xirtPHWQXDIY+8HtJNSxe5V6MdTvW+C5LBRJzylV?=
 =?us-ascii?Q?jMvXfYQLrZD9oEfTMFQjCBzbtSDGPI+3RyS6TF8jyD3F/3PtZKjFS2wh8wtA?=
 =?us-ascii?Q?Mkjldnlf5ieQxOstTnVIVonKBwl7EDCjJjkb/d9JMq1RG2WuLQg+DxKIY1qO?=
 =?us-ascii?Q?29AKb8+6iJPGY6Ms5SKNA4rN5MV/7FBy6MPn+VGvEbfsYmuHvcft4T/Zog8n?=
 =?us-ascii?Q?yWgHek217uyCcGwyUbZR61QWx4afKAp4KGHbOsKBWL2PWyW/J5u2RQRYHD+B?=
 =?us-ascii?Q?/gO3hfoGtnTPO7AvhFSxU3m3yXi7arFPjevf1bQxfac9o2Ik6QMC7KPFBJrV?=
 =?us-ascii?Q?gXZgv6UHxE8WbR7dm93mmyPd91s0q01YP299BygA62ERR4BU3BONpLn9YXNn?=
 =?us-ascii?Q?sYpNrpziSAO8ZCGQKm62WVWz5hkDUkMMTT9Tt19L8txZPtpCFLmPyzwhuFqt?=
 =?us-ascii?Q?9apdrMEDsfr47ePPyvL2/aMZfRpFNF+BhQ2ucLQOUSRu7f+UsCvnCg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o21i46q88W0xkfd9GIFSCcFegkkrfksNE0hInFs868yufHnRFcFlukbi5fUz?=
 =?us-ascii?Q?P78PJZ3rFMFNd5ZlWSfVFOBHEHWAut7JPUwdQfNhd6qJdWKXa6zK3kRlUQEV?=
 =?us-ascii?Q?FQEV3d3r3mjkM8vyGgxu+LpplZa5IICt10lxfHtwcNsqRy3AwoL3/59ZvHOV?=
 =?us-ascii?Q?dyjR7ZAYS18A855Kf02mTXmVxzkM4gbfZjlIMcUXceqL1T94rkzivKs3Em9m?=
 =?us-ascii?Q?ViJ6uf0iG7TtqgqeELrdv6/f8TqxvsWaFsyx1hi8YGsL4Po23dEDuQMxw/45?=
 =?us-ascii?Q?d+H2S4E1BUXgRj651yboDr5OFt1CSXVcKWcHwZYYYy8kJxlQzW3NUPpmodNN?=
 =?us-ascii?Q?M8q/gKXBF1/pBZxUoXi/CxUZV6x6i/kx3IcZ9oM+csATQMs9NWKJMmvYfOja?=
 =?us-ascii?Q?fFaUCoqF7m4l4FjYUPHisjVih7Swb22XdL5P1FOYU5YB6glaOemqYjyQtOPT?=
 =?us-ascii?Q?HSfaDQRhK+8V89Eh1Q6iTlUbbiFMf+WoVFYBqSbID98F+F2zS0n7pFAPqLmS?=
 =?us-ascii?Q?1YE4J3eA5859Ce/lw7fPd2xDE546fkjC4VAGwOgu7/Jp9VKVy8gwrRjyZfTh?=
 =?us-ascii?Q?gNSPnkbeXuEB6/6caVGNee0Q7u+2IvVAQuLTsnuCfzs5UILC3Ln2GsmFmlmt?=
 =?us-ascii?Q?r5D2n9isTRd//ZvqR0oSPBo/FfcEAGAp41SqVR+c32HlIggFi8m5tnwv7tOS?=
 =?us-ascii?Q?UUdcqbwEbRDoLN+v3xMax/TSbFkrNso67OLE7YCFJ73dRbT2d1R5m2aaa3zD?=
 =?us-ascii?Q?paBzKsE5GwucyGAhK4Gu/d10dTxhLrODpU6e0Me8ggkwsuN4hDu+DyB8Jjv0?=
 =?us-ascii?Q?heHpUmZ23LyflHHdPP9T6KG1/QArXolaZdtiEAlynGBPSNhj74ULEenLwN+m?=
 =?us-ascii?Q?idCRqoNhbcQ9kvb8CryJC1KIJw9gFmvDzcNGaCp5xTA2sRXPwovdOXIZL9UQ?=
 =?us-ascii?Q?oAlQBuzueIAe698MF87S37ax00zy1+tItRzcL3rbKcztRRWqGudG3fjk3Lsc?=
 =?us-ascii?Q?7LjL43oVhvMlXesVPda7woTY22e/ZXkHnoSt9yP9eVz+vwZyyKxavIr0px4k?=
 =?us-ascii?Q?fU3qtY5aQgjI5OpKY9xiakVRegN/XfPT2sEHCXgBuHkx52U1/xUl18g/sBA5?=
 =?us-ascii?Q?UBO0LNpAOSvTuWI+zZbHxHOnB4lxd4+JjU/JpAWPeYi7IJbyOMkrSHs/fFIj?=
 =?us-ascii?Q?mQruM2V8F+w6/paxfdSHyYBLFOwcqBQYCrmc4/JvCfXPkiQhXN36Vl6+ZEXF?=
 =?us-ascii?Q?1ijYRR9xqDaeHlUWeLlUvP0dLqKrbqdeka8dcPxh2LTMGGcP4P9JZ7/TLdcJ?=
 =?us-ascii?Q?lGSBydlG7x5l9oRSB8+ZZhKSUIYRExY6dYr74EgwHyvi9Z91k8oCsBAEhJR0?=
 =?us-ascii?Q?j41JAvWYMRNMsg9RrM50mC9iT/cBpgDK3M3x5V/sRBh3MENwTDiDClt7z6kN?=
 =?us-ascii?Q?4KPl6T3k7xvfZWdoiF6+DrNWhnOVLfJX1ZGetKNtoWzFeijHyV9QH2V25BFk?=
 =?us-ascii?Q?vn97NKyL80Us2AS4Cit2k0oHr9V/nwUX7DVwlnNTdTD6JuCR3vCNamOJUWAo?=
 =?us-ascii?Q?jJGp29Vt83sVclt82qzE/Y5dd5KuZNImj54JhW+5PT+pRjrskiXA8V6fthCD?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 246a744e-f313-4f97-ad0e-08de3e7a5653
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 21:13:49.0597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezFl+sXKZDYVtP1i7whfaei4KwdDYb9D/hcHO+8sBolnbM7OiwE/3G4ukvepKrprwHXYuec/qzT79FiI1fxYRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7767
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

On Sat, Dec 13, 2025 at 08:58:14AM +0100, Raag Jadav wrote:
> On Fri, Dec 12, 2025 at 03:34:44PM -0800, Matthew Brost wrote:
> > The intent of wedging a device is to allow queues to continue running
> > only in wedged mode 2. In other modes, queues should initiate cleanup
> > and signal all remaining fences. Fix xe_guc_submit_wedge to correctly
> > clean up queues when wedge mode != 2.
> > 
> > Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 31 ++++++++++++++++++------------
> >  1 file changed, 19 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 857375be9a84..1eef93d474f0 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1277,6 +1277,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> >   */
> >  void xe_guc_submit_wedge(struct xe_guc *guc)
> >  {
> > +	struct xe_device *xe = guc_to_xe(guc);
> >  	struct xe_gt *gt = guc_to_gt(guc);
> >  	struct xe_exec_queue *q;
> >  	unsigned long index;
> > @@ -1291,19 +1292,25 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
> >  	if (!guc->submission_state.initialized)
> >  		return;
> >  
> > -	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
> > -				       guc_submit_wedged_fini, guc);
> > -	if (err) {
> > -		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
> > -			  "Although device is wedged.\n");
> > -		return;
> > -	}
> > +	if (xe->wedged.mode == 2) {
> > +		err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
> > +					       guc_submit_wedged_fini, guc);
> > +		if (err) {
> > +			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
> > +				  "Although device is wedged.\n");
> > +			return;
> > +		}
> >  
> > -	mutex_lock(&guc->submission_state.lock);
> > -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> > -		if (xe_exec_queue_get_unless_zero(q))
> > -			set_exec_queue_wedged(q);
> > -	mutex_unlock(&guc->submission_state.lock);
> > +		mutex_lock(&guc->submission_state.lock);
> > +		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> > +			if (xe_exec_queue_get_unless_zero(q))
> > +				set_exec_queue_wedged(q);
> > +		mutex_unlock(&guc->submission_state.lock);
> > +	} else {
> > +		/* Forcefully kill any remaining exec queues, signal fences */
> > +		xe_guc_submit_stop(guc);
> > +		xe_guc_submit_pause_abort(guc);
> 
> This is basically the prerequisite[1] as we decided at the time, but
> perhaps I failed to notice it. I'm wondering if we should also redirect
> page faults to dummy page as per prerequisites section?
> 

Yes, we are not signaling fences which you call out in [1] - that is
what I'm fixing here.

Given that also in [1] a requirement is 'All existing
mmaps should be invalidated and page faults should be redirected to a
dummy page.'. We should likely make this part of wedging implementation
a standalone fixes patch which we can backport. I am not fixing this
part in my series.

Matt

> [1] https://lore.kernel.org/dri-devel/20250204070528.1919158-2-raag.jadav@intel.com/
> 
> Raag
