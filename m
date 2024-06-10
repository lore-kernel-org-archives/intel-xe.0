Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CF3C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 20:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270CC10E314;
	Mon, 10 Jun 2024 20:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgvXD1WW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D0410E314
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 20:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718050389; x=1749586389;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qpkb4Gq4pkpV9Y23S9PRdjwhmG9YtxjMWuiWufIzjHc=;
 b=NgvXD1WW6FYbXdmtrFFNgcnjDALKiZW3hZhXrEZugyRExC8WcCnZ5e/O
 NNAUcDt/BbseQIjBa6+nXfIFTKR3v8b3bHhiryBvYLIMv/gQ6mTkNoWB5
 Tp1ibWLB7e4GESJjuP0Knl4/eZt6TMxLiipCyfiRYDRgijeCInyOrnfnM
 1yNiVHZ3sXBFtu2J/Yr42rycXQZhm6lIYn56DjJ24TEEf1cZmuRSs5XFr
 hBnyQ/EaN9qAn+QgWuwMKSyIh5oLY00xql9O/AfOpPhCWTjF8vSlM8Bi9
 R5uz74SgG+2BQMJTmxyaIx/BrX1ySyC6IcAf391y6n3gBcJ4LpJ2OPhu4 A==;
X-CSE-ConnectionGUID: oIEoXpjpSiCwfajNeV2/Tg==
X-CSE-MsgGUID: 8hWU8cLST5uYR8AW/izHgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14680645"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14680645"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 13:13:08 -0700
X-CSE-ConnectionGUID: VfWWtrkSTuCnQeZdFZYajQ==
X-CSE-MsgGUID: LIqWisQUTEyi3dXqdaLDkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43602596"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 13:13:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 13:13:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 13:13:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 13:13:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZbJoHlLqX2nVuLusfPrBUqbt0uaAt4Aqkf7/2XUZBqv8MV0e8Gtveoub4s/9Anr7o//AgfGeGTOdT+QCQqXt+z+mznl+S36V5N6N04LF2KDqzffhGGAIDWiaHYPWSVD2pcWVrFuwe3RceHQvWWCCN7ko2Z3P4m8/ljJ4tj8LOq7wu01Unw19Tqx22v1jwG3cCRwuQrvAeiNiFidpqnj6aLMjOsaBM5U3a9dndJIGqVAvYY07N0S9DKR8oYuMy2rXmbVotML+YUiZ/fMLquJ63VpKSX20ilz5XFMD06Ries2HOVZzUrCvmIZd3sAtmIFXtdITsd8Rx9N7Ygn9ud8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRwg9diJik7J3RGT751nwBWWBOqV5vdamLVCrtR9tjw=;
 b=HY9SQEk2vllDtnxbLKIKH1NffmttOH5kQA8v7K+tY5Qq7dx3Pe6TMM9vd1bU+uZac4pWwkXTTt00LJzGXBLQE36H+lg0ySXWZ8F7Rn/Xr2pJDc2l3x2IHBpPAgsLlavxUHYSpz7uSiS06dIT0oMwOQaEGrBAW0OnJEjzMyg2p02s68UNXssl6xDeLUmt68yo0osarQG1n7N4TK5FhD/+yiIcPiiaRi+GnTKLQmDgIkLHhR+CmmnWScsXoVj18ROya/kZ1GQoHlefhyxUzB50JbLBn+tjVmo2VI40sARMAvup7GIzdHcBl6xTzoB2bd/8mmcze/pabQmfVdZ6dn5CNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by SJ0PR11MB6695.namprd11.prod.outlook.com (2603:10b6:a03:44e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 20:13:02 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%3]) with mapi id 15.20.7633.021; Mon, 10 Jun 2024
 20:13:02 +0000
Date: Mon, 10 Jun 2024 20:12:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 10/10] drm/xe: Sample ctx timestamp to determine if
 jobs have timed out
Message-ID: <ZmdeMIGPNKgZoxwc@DUT025-TGLU.fm.intel.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-11-matthew.brost@intel.com>
 <CH0PR11MB5444C7037501C9DAD6F6C563E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444C7037501C9DAD6F6C563E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::38) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|SJ0PR11MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: f348ce39-253c-4e55-f476-08dc8989bb16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RWLFnH8hsG0Eu0MmAtDqiQQ3qQMqoKO1qO8FzJpVKk5vwKWTSN1hGjc+GICx?=
 =?us-ascii?Q?AYa5MJsDp1/tn91JQ/hzeJ56wtcj2Xucj1seoxerrrz3vIepKXrmL/jdHIEA?=
 =?us-ascii?Q?DLZE6fkHb6kNLYMjTQ1p4pXiKcoWNqCa9jrb04tdClR0cCc+iECaAE7Ytnw8?=
 =?us-ascii?Q?tRqOutWI879nLsWh4SWKbuIeRBWexkj+U7c1FtkpIGkadSU2ZXAdDqE/DE+i?=
 =?us-ascii?Q?BUAd9hELL0R5qqLEejczydZi7w8Nh9EJIpkMIQzUXU6gDw31oQ5m8Kj7Fob9?=
 =?us-ascii?Q?X0nZDuhm1pJdgm2/exqwdsXbOaP7OJWOaJwVlOrr2E4mMaPuzIyuQKKdypMI?=
 =?us-ascii?Q?pK2wIlR5ZJmsA2IfTX5q5FGPXcJBMdl+avDIilbEcP49By3+Hwy7oV0nduFt?=
 =?us-ascii?Q?cRY50JaFaSZlzA2PZRvX7agwQv3ErvM23oZuzvGbhRIPAd2jSfEVXrdYIJIO?=
 =?us-ascii?Q?KBF+ufxvQdUQkCPqPi/0YVMRVbFeaIpzx0K8dYRrsE3Cta9NmW5LQyJ8jXpZ?=
 =?us-ascii?Q?dKE77Xo5i2RrSUADg2+44CN/Zvrnt8JnnFZj+Mjf06eNu99mU+I5AcrPYWUX?=
 =?us-ascii?Q?N4rCEmzzdCN65entNaHjiPPFQDEVIZgK/TJ9hGWXGTxmqtlnBdWSjMxfzyu4?=
 =?us-ascii?Q?t8tS52QbGCdXRtj6P1CY7lfm4OmdGlNuBS7orZ6yMczM3GQrqAkiz+5w3L2r?=
 =?us-ascii?Q?0gvFDYpw9O3JWjsejMtgIC47MPAQFIMcF8LuUz7lJmtrmLaRNTsb85akTQbt?=
 =?us-ascii?Q?Z+k4AK3XMTzPGvt+4Lq86c824M3aR4+0EY5M9pAFXCI95Wmamg/qr9fJlff0?=
 =?us-ascii?Q?TsHfW+T/CVhVLtOM1THF5/hnudzb6LtErpRiRTiD+QbP6K99ok7Un/+QpHwv?=
 =?us-ascii?Q?D0B3X1xz7VqIMBorJMnvL0hX3OMYRp143rI2IVjeSg3okxcO4Q1FYR0/Qxa4?=
 =?us-ascii?Q?dJ1EphjJG2nmwWo9GFHgR8SHF1ZoODIQLXu4gjFQS5lapMTR00THgsM/IGLQ?=
 =?us-ascii?Q?GlnxeYHWVccibEpAIsqq10i1ZKCzx6Z2H5oFNRs7yFUTiGPDXnlilvKQaAkk?=
 =?us-ascii?Q?5hUOiFFGLC0+ayuuwOZvfwlY9aUD3XN7Oslw6954omCmndrjB9RtfDeRIgDk?=
 =?us-ascii?Q?YngHXbjbMSRN/Q1pXHHV0Z3qO2Tob20i2ed++ziWK97TktrPdlYiZnQyogUV?=
 =?us-ascii?Q?9xhqIQlDODQcV6cfnaH8BUkjLgfRfVdNjtx5JBQ8FDhJ8LvjqDmMgDIHEGlM?=
 =?us-ascii?Q?5k5JvH2vxprWHx2RMyMrMZvbpabjgde8VLoyzY7UPeosFiu1HfG6pgIvqeFN?=
 =?us-ascii?Q?D/vYUmC6M8HVrV6nONQwr6lq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7YWiLoJ2M/VeUutzF7R5wQnxGf3MWWvZBbwKTzCe4YTRp65Dj9E5RTyYogwK?=
 =?us-ascii?Q?O8riFRXqUL5ohHzpLgANgV9FN1z5H3/16OYkGjkpGjcqtFtquvdGZgQAbh9P?=
 =?us-ascii?Q?gWknuLaxcyv+L3M1BVp5xfdSYYr/FZLQcpZu0ghT+zrhn1sfRNR+K80Q8BYw?=
 =?us-ascii?Q?cgdeAFX10hvR0n/PEqQn/OEzGIsp/oA3R2KatZpJ2UGJynWnLMswDbfzm3u9?=
 =?us-ascii?Q?oKxaP8s/9O03uDhVZdz8J6jHFGpG0rWPCP8ypLFL0TR6g2NxNjpQaLRaPgOq?=
 =?us-ascii?Q?GCXqHzvLWrjAhiD7hTttxn3edvqUrD20neg4BBnnsvNdO3qevmmpzlnat7YJ?=
 =?us-ascii?Q?PeBDjTTmpUgJEv+owMzAa8FNjwfBXixTMnIVtty/QQ6qMN2VvBlrnyn/rTSS?=
 =?us-ascii?Q?2VNxB29N7y4l0s+sHqRkOOiGK/vTR196Q3hxp1DWwWj6JeR6otDo1xgMZD8Q?=
 =?us-ascii?Q?GGBVLtDNwCTyBERoHxAxjUNhe8TJ0GKm3TU6T8kENHadoozmvsyl3lVroRVQ?=
 =?us-ascii?Q?9TY/NHEm2qHGqObG/7HEp99BGiN776PycKYjm1eXVJMr8V+ePN8GSl4MbiDR?=
 =?us-ascii?Q?8SYvmQL30yUjahtx/9TgWQNJFhHbZ8B8GkP3cX7YKRywcguvVznE59X6/f6T?=
 =?us-ascii?Q?Xo0YhKYNC2ScuGvslfsnbZzkh1vI+TgtlnMleg+3WuIm4ejit2SK6v/u4MW0?=
 =?us-ascii?Q?yiQjhK9829hGiF2AtINWk9doRshDuHEL/aqt1lcJ6kc4eLRB6bfpln7a8AyT?=
 =?us-ascii?Q?LbK7t2cTv0ALWwlvz0JrN+mZpXuZ0DWLrvxTA2UWaRzrZi0nAiVusKEJqX5s?=
 =?us-ascii?Q?l2EhScmfKqhJNwvFZpAwpv49Vcak9loKkJpXLRIri3b1mKmWZyQQJ4oGZz06?=
 =?us-ascii?Q?pYzzcOg3Qh9YDE0wP2t9ieif+xrKbquEnkIck0k85Gbsc3xk3vrWNHWW3s2P?=
 =?us-ascii?Q?0Yw3q9ZVl1CUVuA6Ovy4v+JElseeTmufetb9tt4o+Vmqh7r3sE1qXoaUBFZq?=
 =?us-ascii?Q?mqUZ0Ucem7A+RQr3UG0pbi4+xmX91vF52qldV2aeqUhh6WCf04OxybxDM7Yp?=
 =?us-ascii?Q?sXdCR7eQHXbbyBcL3SSzwATeyr2nGaBZguVwPW2AXNA2IJaLTJ4ixhQu314/?=
 =?us-ascii?Q?ArZfA0AdDbsbW2LQ8wpMw0VMK1sLtW/xzAqIfBEaLRKoB7GEEL1yMg+oUSI6?=
 =?us-ascii?Q?SYZdlTcLsnGis+AS8iy5XwrmpmoUare+mEyyhQNLjYkWOl5r5NaE0MCcJr+e?=
 =?us-ascii?Q?PSug4ec/qUFTWIcsicffNA64fgjh/rYCoLF9EOTCj8y6lR/eXFTSYQYARSNM?=
 =?us-ascii?Q?FMuohy7BIXHULQ5OFwbm36FCPAUU8Dq4yXnF1mGbM0kyXJMoEn/TA0juZtw/?=
 =?us-ascii?Q?unrLgocvdlYZiVFYtU8kJVbs19fUveN+1GGm7LdQ0nKY3rg8URVEuEf1gAsk?=
 =?us-ascii?Q?lyba2+/0HAqc/4henkM8IJu8nB90P6mCYH9uR/RO5sXBWeP4r3qege/AWkS5?=
 =?us-ascii?Q?liX+Ud7Pc604k/N9czDXUW5JtQDHHorlgqpCAJzntfb4tB0hFhC1fOoBUdo8?=
 =?us-ascii?Q?pZ9OnNTxZrJ0/PPlGsHpISfQYynYLighcA79fseJUq463mjFDqUfJnuGgB2o?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f348ce39-253c-4e55-f476-08dc8989bb16
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 20:13:02.3353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOc2jxZdZXgf5DQsqynlbZk6K5O9kW5fkj751c1eJyjFHwfxNS2TaXqjsUHEzOShk+OLHOm6tF2OoUFVEi+zww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6695
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

On Mon, Jun 10, 2024 at 01:32:01PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Monday, June 10, 2024 7:18 AM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH v5 10/10] drm/xe: Sample ctx timestamp to determine if jobs have timed out
> > 
> > In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
> > scheduling enable needs to be toggled to properly sample the timestamp.
> > If a job has not been running for longer than the timeout period,
> > re-enable scheduling and restart the TDR.
> > 
> > v2:
> >  - Use GT clock to msec helper (Umesh, off list)
> >  - s/ctx_timestamp_job/ctx_job_timestamp
> > v3:
> >  - Fix state machine for TDR, mainly decouple sched disable and
> >    deregister (testing)
> >  - Rebase (CI)
> > v4:
> >  - Fix checkpatch && newline issue (CI)
> >  - Do not deregister on wedged or unregistered (CI)
> >  - Fix refcounting bugs (CI)
> >  - Move devcoredump above VM / kernel job check (John H)
> >  - Add comment for check_timeout state usage (John H)
> >  - Assert pending disable not inflight when enabling scheduling (John H)
> >  - Use enable_scheduling in other scheduling enable code (John H)
> >  - Add comments on a few steps in TDR (John H)
> >  - Add assert for timestamp overflow protection (John H)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 297 +++++++++++++++++++++++------
> >  1 file changed, 238 insertions(+), 59 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 3db0aa40535d..8daf4e076df4 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -23,6 +23,7 @@
> >  #include "xe_force_wake.h"
> >  #include "xe_gpu_scheduler.h"
> >  #include "xe_gt.h"
> > +#include "xe_gt_clock.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> > @@ -62,6 +63,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> >  #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> >  #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> >  #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > +#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> > +#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> >  
> >  static bool exec_queue_registered(struct xe_exec_queue *q)
> >  {
> > @@ -188,6 +191,31 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> >  	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> >  }
> >  
> > +static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> > +}
> > +
> > +static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > +}
> > +
> > +static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > +}
> > +
> > +static bool exec_queue_extra_ref(struct xe_exec_queue *q)
> > +{
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
> > +}
> > +
> > +static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > +}
> > +
> 
> For parity, should this also have clear_exec_queue_extra_ref?

The compiler will complain if it is unused and not 'static inline' or
with the '__maybe_unused' annotaion.

> It's not a big deal if not: I don't see where we would have use for such
> a function as of present, so we can skip making a function we don't
> plan on using any time soon.

I'm actually going to do a follow up once this series is merged which
generates these 3 functions via a MACRO (similar to
MAKE_EXEC_QUEUE_POLICY_ADD) and in this case will annotate the clear_*
functions as '__maybe_unused'.

Matt

> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> >  static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> >  {
> >  	return (atomic_read(&q->guc->state) &
> > @@ -920,6 +948,107 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >  	xe_sched_submission_start(sched);
> >  }
> >  
> > +#define ADJUST_FIVE_PERCENT(__t)	(((__t) * 105) / 100)
> > +
> > +static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > +{
> > +	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> > +	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> > +	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> > +	u32 timeout_ms = q->sched_props.job_timeout_ms;
> > +	u32 diff, running_time_ms;
> > +
> > +	/*
> > +	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> > +	 * possible overflows with a high timeout.
> > +	 */
> > +	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> > +
> > +	if (ctx_timestamp < ctx_job_timestamp)
> > +		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> > +	else
> > +		diff = ctx_timestamp - ctx_job_timestamp;
> > +
> > +	/*
> > +	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> > +	 */
> > +	running_time_ms =
> > +		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> > +
> > +	drm_info(&guc_to_xe(exec_queue_to_guc(q))->drm,
> > +		 "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%u, timeout_ms=%u, diff=0x%08x",
> > +		 xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +		 q->guc->id, running_time_ms, timeout_ms, diff);
> > +
> > +	return running_time_ms >= timeout_ms;
> > +}
> > +
> > +static void enable_scheduling(struct xe_exec_queue *q)
> > +{
> > +	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +	int ret;
> > +
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > +
> > +	set_exec_queue_pending_enable(q);
> > +	set_exec_queue_enabled(q);
> > +	trace_xe_exec_queue_scheduling_enable(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +
> > +	ret = wait_event_timeout(guc->ct.wq,
> > +				 !exec_queue_pending_enable(q) ||
> > +				 guc_read_stopped(guc), HZ * 5);
> > +	if (!ret || guc_read_stopped(guc)) {
> > +		drm_warn(&xe->drm, "Schedule enable failed to respond");
> > +		set_exec_queue_banned(q);
> > +		xe_gt_reset_async(q->gt);
> > +		xe_sched_tdr_queue_imm(&q->guc->sched);
> > +	}
> > +}
> > +
> > +static void disable_scheduling(struct xe_exec_queue *q)
> > +{
> > +	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > +
> > +	clear_exec_queue_enabled(q);
> > +	set_exec_queue_pending_disable(q);
> > +	trace_xe_exec_queue_scheduling_disable(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +}
> > +
> > +static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > +{
> > +	u32 action[] = {
> > +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> > +		q->guc->id,
> > +	};
> > +
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > +
> > +	set_exec_queue_destroyed(q);
> > +	trace_xe_exec_queue_deregister(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > +}
> > +
> >  static enum drm_gpu_sched_stat
> >  guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  {
> > @@ -928,9 +1057,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  	struct xe_exec_queue *q = job->q;
> >  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> >  	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> >  	int err = -ETIME;
> >  	int i = 0;
> > -	bool wedged;
> > +	bool wedged, skip_timeout_check;
> >  
> >  	/*
> >  	 * TDR has fired before free job worker. Common if exec queue
> > @@ -942,49 +1072,53 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  		return DRM_GPU_SCHED_STAT_NOMINAL;
> >  	}
> >  
> > -	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > -		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > -		   q->guc->id, q->flags);
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > -		   "Kernel-submitted job timed out\n");
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > -		   "VM job timed out on non-killed execqueue\n");
> > -
> > -	if (!exec_queue_killed(q))
> > -		xe_devcoredump(job);
> > -
> > -	trace_xe_sched_job_timedout(job);
> > -
> > -	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> > -
> >  	/* Kill the run_job entry point */
> >  	xe_sched_submission_stop(sched);
> >  
> > +	/* Must check all state after stopping scheduler */
> > +	skip_timeout_check = exec_queue_reset(q) ||
> > +		exec_queue_killed_or_banned_or_wedged(q) ||
> > +		exec_queue_destroyed(q);
> > +
> > +	/* Job hasn't started, can't be timed out */
> > +	if (!skip_timeout_check && !xe_sched_job_started(job))
> > +		goto rearm;
> > +
> >  	/*
> > -	 * Kernel jobs should never fail, nor should VM jobs if they do
> > -	 * somethings has gone wrong and the GT needs a reset
> > +	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> > +	 * modify scheduling state to read timestamp. We could read the
> > +	 * timestamp from a register to accumulate current running time but this
> > +	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> > +	 * genuine timeouts.
> >  	 */
> > -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > -		if (!xe_sched_invalidate_job(job, 2)) {
> > -			xe_sched_add_pending_job(sched, job);
> > -			xe_sched_submission_start(sched);
> > -			xe_gt_reset_async(q->gt);
> > -			goto out;
> > -		}
> > -	}
> > +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> >  
> > -	/* Engine state now stable, disable scheduling if needed */
> > +	/* Engine state now stable, disable scheduling to check timestamp */
> >  	if (!wedged && exec_queue_registered(q)) {
> > -		struct xe_guc *guc = exec_queue_to_guc(q);
> >  		int ret;
> >  
> >  		if (exec_queue_reset(q))
> >  			err = -EIO;
> > -		set_exec_queue_banned(q);
> > +
> >  		if (!exec_queue_destroyed(q)) {
> > -			xe_exec_queue_get(q);
> > -			disable_scheduling_deregister(guc, q);
> > +			/*
> > +			 * Wait for any pending G2H to flush out before
> > +			 * modifying state
> > +			 */
> > +			ret = wait_event_timeout(guc->ct.wq,
> > +						 !exec_queue_pending_enable(q) ||
> > +						 guc_read_stopped(guc), HZ * 5);
> > +			if (!ret || guc_read_stopped(guc))
> > +				goto trigger_reset;
> > +
> > +			/*
> > +			 * Flag communicates to G2H handler that schedule
> > +			 * disable originated from a timeout check. The G2H then
> > +			 * avoid triggering cleanup or deregistering the exec
> > +			 * queue.
> > +			 */
> > +			set_exec_queue_check_timeout(q);
> > +			disable_scheduling(q);
> >  		}
> >  
> >  		/*
> > @@ -1000,15 +1134,61 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  					 !exec_queue_pending_disable(q) ||
> >  					 guc_read_stopped(guc), HZ * 5);
> >  		if (!ret || guc_read_stopped(guc)) {
> > +trigger_reset:
> >  			drm_warn(&xe->drm, "Schedule disable failed to respond");
> > -			xe_sched_add_pending_job(sched, job);
> > -			xe_sched_submission_start(sched);
> > +			clear_exec_queue_check_timeout(q);
> > +			set_exec_queue_extra_ref(q);
> > +			xe_exec_queue_get(q);	/* GT reset owns this */
> > +			set_exec_queue_banned(q);
> >  			xe_gt_reset_async(q->gt);
> >  			xe_sched_tdr_queue_imm(sched);
> > -			goto out;
> > +			goto rearm;
> >  		}
> >  	}
> >  
> > +	/*
> > +	 * Check if job is actually timed out, if restart job execution and TDR
> > +	 */
> > +	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
> > +	    !exec_queue_reset(q) && exec_queue_registered(q)) {
> > +		clear_exec_queue_check_timeout(q);
> > +		goto sched_enable;
> > +	}
> > +
> > +	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > +		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +		   q->guc->id, q->flags);
> > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > +		   "Kernel-submitted job timed out\n");
> > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > +		   "VM job timed out on non-killed execqueue\n");
> > +
> > +	trace_xe_sched_job_timedout(job);
> > +
> > +	if (!exec_queue_killed(q))
> > +		xe_devcoredump(job);
> > +
> > +	/*
> > +	 * Kernel jobs should never fail, nor should VM jobs if they do
> > +	 * somethings has gone wrong and the GT needs a reset
> > +	 */
> > +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > +		if (!xe_sched_invalidate_job(job, 2)) {
> > +			clear_exec_queue_check_timeout(q);
> > +			xe_gt_reset_async(q->gt);
> > +			goto rearm;
> > +		}
> > +	}
> > +
> > +	/* Finish cleaning up exec queue via deregister */
> > +	set_exec_queue_banned(q);
> > +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> > +		set_exec_queue_extra_ref(q);
> > +		xe_exec_queue_get(q);
> > +		__deregister_exec_queue(guc, q);
> > +	}
> > +
> >  	/* Stop fence signaling */
> >  	xe_hw_fence_irq_stop(q->fence_irq);
> >  
> > @@ -1030,7 +1210,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  	/* Start fence signaling */
> >  	xe_hw_fence_irq_start(q->fence_irq);
> >  
> > -out:
> > +	return DRM_GPU_SCHED_STAT_NOMINAL;
> > +
> > +sched_enable:
> > +	enable_scheduling(q);
> > +rearm:
> > +	/*
> > +	 * XXX: Ideally want to adjust timeout based on current exection time
> > +	 * but there is not currently an easy way to do in DRM scheduler. With
> > +	 * some thought, do this in a follow up.
> > +	 */
> > +	xe_sched_add_pending_job(sched, job);
> > +	xe_sched_submission_start(sched);
> > +
> >  	return DRM_GPU_SCHED_STAT_NOMINAL;
> >  }
> >  
> > @@ -1133,7 +1325,6 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >  			   guc_read_stopped(guc));
> >  
> >  		if (!guc_read_stopped(guc)) {
> > -			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> >  			s64 since_resume_ms =
> >  				ktime_ms_delta(ktime_get(),
> >  					       q->guc->resume_time);
> > @@ -1144,12 +1335,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >  				msleep(wait_ms);
> >  
> >  			set_exec_queue_suspended(q);
> > -			clear_exec_queue_enabled(q);
> > -			set_exec_queue_pending_disable(q);
> > -			trace_xe_exec_queue_scheduling_disable(q);
> > -
> > -			xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > -				       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +			disable_scheduling(q);
> >  		}
> >  	} else if (q->guc->suspend_pending) {
> >  		set_exec_queue_suspended(q);
> > @@ -1160,19 +1346,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >  static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> >  {
> >  	struct xe_exec_queue *q = msg->private_data;
> > -	struct xe_guc *guc = exec_queue_to_guc(q);
> >  
> >  	if (guc_exec_queue_allowed_to_change_state(q)) {
> > -		MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> > -
> >  		q->guc->resume_time = RESUME_PENDING;
> >  		clear_exec_queue_suspended(q);
> > -		set_exec_queue_pending_enable(q);
> > -		set_exec_queue_enabled(q);
> > -		trace_xe_exec_queue_scheduling_enable(q);
> > -
> > -		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > -			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +		enable_scheduling(q);
> >  	} else {
> >  		clear_exec_queue_suspended(q);
> >  	}
> > @@ -1434,8 +1612,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> >  
> >  	/* Clean up lost G2H + reset engine state */
> >  	if (exec_queue_registered(q)) {
> > -		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
> > -		    xe_exec_queue_is_lr(q))
> > +		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> >  			xe_exec_queue_put(q);
> >  		else if (exec_queue_destroyed(q))
> >  			__guc_exec_queue_fini(guc, q);
> > @@ -1615,11 +1792,13 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
> >  		if (q->guc->suspend_pending) {
> >  			suspend_fence_signal(q);
> >  		} else {
> > -			if (exec_queue_banned(q)) {
> > +			if (exec_queue_banned(q) ||
> > +			    exec_queue_check_timeout(q)) {
> >  				smp_wmb();
> >  				wake_up_all(&guc->ct.wq);
> >  			}
> > -			deregister_exec_queue(guc, q);
> > +			if (!exec_queue_check_timeout(q))
> > +				deregister_exec_queue(guc, q);
> >  		}
> >  	}
> >  }
> > @@ -1657,7 +1836,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> >  
> >  	clear_exec_queue_registered(q);
> >  
> > -	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
> > +	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> >  		xe_exec_queue_put(q);
> >  	else
> >  		__guc_exec_queue_fini(guc, q);
> > @@ -1720,7 +1899,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >  	 * guc_exec_queue_timedout_job.
> >  	 */
> >  	set_exec_queue_reset(q);
> > -	if (!exec_queue_banned(q))
> > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> >  		xe_guc_exec_queue_trigger_cleanup(q);
> >  
> >  	return 0;
> > @@ -1750,7 +1929,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >  
> >  	/* Treat the same as engine reset */
> >  	set_exec_queue_reset(q);
> > -	if (!exec_queue_banned(q))
> > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> >  		xe_guc_exec_queue_trigger_cleanup(q);
> >  
> >  	return 0;
> > -- 
> > 2.34.1
> > 
> > 
