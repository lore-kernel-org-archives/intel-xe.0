Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AA6C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 16:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF0A10E5F3;
	Tue,  9 Jul 2024 16:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TNf8R7yc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C5410E5F3
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720542713; x=1752078713;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A07Iazn8nPUiGNr7/qPwwZfTu+XStv3E5yDH9fnQIac=;
 b=TNf8R7ycaZ1dpTr9T8swYnndRegzKKmzTg8xwmi5/QXkmxa/F7FGk7XL
 YRSvjKFso//nt1y5tapdAm3FesjT7C5AdKIkguXH7tcXHG35eZ42k6x3m
 An70W2BTFlWQ3Hk/Vi6/YmnPXv58EWY3QuiQUlwUs4fTvrzbPdwbFubIb
 kAMxUPvu9KkE142OxRDbEZUu5VQfwplcPl/9KhrwaRpw4sFlVX/w427OY
 I09QSMvgQ+y3M0z3h2syrb4lYOQKdreSX16XXHUbrIOlJVj0Wc+ydBvtP
 XeaYBqBybeGWU0wyENPDcpqH0fMTBPS646EErhOlJgq3Vc+Ack93KmNy/ A==;
X-CSE-ConnectionGUID: EuRbCSDwTDK8iFmTy/iySw==
X-CSE-MsgGUID: yej+PgRWQt2DB8I6nvsG2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17646881"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17646881"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 09:31:52 -0700
X-CSE-ConnectionGUID: RZDPXYy6QLe4i41jexayhw==
X-CSE-MsgGUID: OW0ODwjATVqzesEecQcPVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="47890494"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 09:31:52 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 09:31:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 09:31:51 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 09:31:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2ANTj30XTSr0VZFSE000kAFMu90TKJ3g6Jo3SFU89UxOmkz6D3qwroL7dsGT319zhNboze1IgYBUPDBQ8uetcn6oWkRnVHWVojtGrJ2bClL9umL7j24KOITTdvclBJ5hlWmUXWsgauQVlnfgEVWbo9ZKaPDfqqZ2HW+moYioNnQewe+zJTx8sJSF8ajz5B3OFL9hrxVXGDJN1sydfPrJRXu1FtKDtEIf4LCc5/pye2e2ot/2Jv1Loa3z4eQazCpTJuIA9MCnyLlJCR1JD/+MIkA8jX2bvvEydbm/tBn4D8oI5n9hy8FBR85nlafWXHg0rkb/kr2mFDFnjqYZCbxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsFV0tSrhZBEhEVKlFa9SqjMmIZuDVV2Zyf6WpXAx/w=;
 b=cOAzI/DQ4vfQZM2HwGFfMeOZ0wAbRbW3+T9Exgetmc+LoBGOTIiD3j1ZTHG2lYJNRDyJssqnr1yIb6Xf4Knx8S5D9zwwk7UPHcc4GqTJAp1GKCjku+Flz8AcBHzPftnsKi+5JuICpDXUBkCuIBHs5uujeRBadezA3jD+/IjLKhGNGvqHlC2W7GbHunZhzFYSC+Cdp1gYl9qBr5u89NfR+SgGJmrrYJpwSe7I4ND4IrrPwCUCoSr4TTtWnYFVxyDEzHdZfE4pH+UjMdh7lbzlog22CR6EUP+FKyUaKmuPyd8J6l2lTQKC/hW01gi0FSV9XEUXO0im3pfmxqmn084rqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5166.namprd11.prod.outlook.com (2603:10b6:a03:2d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 16:31:48 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 16:31:48 +0000
Date: Tue, 9 Jul 2024 16:31:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <nirmoy.das@intel.com>,
 <farah.kassabri@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 00/11] Proper GT TLB invalidation layering and new
 coalescing feature.
Message-ID: <Zo1lxteMKSIRyjFu@DUT025-TGLU.fm.intel.com>
References: <20240708040331.766264-1-matthew.brost@intel.com>
 <6aba8e53-55fd-4573-ad0c-e8c62ebe1297@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6aba8e53-55fd-4573-ad0c-e8c62ebe1297@intel.com>
X-ClientProxiedBy: BYAPR11CA0059.namprd11.prod.outlook.com
 (2603:10b6:a03:80::36) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e66e78-cd75-4375-f803-08dca034a0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lzs/pI4SkcxWjy3LV5eo1qmqqlF69GS/mduNnoIEic3BFADn4jh0T1BCoG+A?=
 =?us-ascii?Q?ynnIeSAa8tb2vLQ8t/Ps3znKbFQ689BMCw4ahFh8Dv5s3IllTZdkS9ALNLak?=
 =?us-ascii?Q?GlZhTlSiYyUv3JaJn3Ewb2KoW4Xlo20LQD46/8qqtnYNob9GTFy0+A1zwXNb?=
 =?us-ascii?Q?wglRl0hFvd/UFXAq7jmG2KuKmtWucGOfL5NzR60osxugxfQDh1sSstWVZ+sP?=
 =?us-ascii?Q?nIAbk0iLj5c+1WDBPg8lY+4qqNiPm027IUpjHZeOS1dotrabaoUSG356KIl4?=
 =?us-ascii?Q?/P9KnkfBZ2FX5sYBOWn1IdCrVGm/OtRfDi5kJbl3RUuYfxqvIbqpMwnEMbuM?=
 =?us-ascii?Q?muWoQtOlRGzETIpXOHVHoyp1+inmnsw8DYe3K+W1hJLtHuKwkHmtkb+xMBGU?=
 =?us-ascii?Q?RmrafOJcBpkO6HkhU/N/6NB6OsKR2CjAazXy8sj1tX7wkpdsqWrHvbMbO/e/?=
 =?us-ascii?Q?llpokVD39ZQT1IVVDppNMAjm4isRqaJGDVW6NCfuNAf1KUVDVps1ILY3gloC?=
 =?us-ascii?Q?+C+9X+OTom3wSAeSXAvQEPUx4EI2HOse7Ik3J8uzpDcUmYSoxLwmLg5HtZnp?=
 =?us-ascii?Q?CbVP5fSUU5lyH6Vtf9kd6YL6kU9/7miZ6JmGz8JWGPfc6Vi1bnEry1zRdxEB?=
 =?us-ascii?Q?0g6ggJECNqKjwh04q60DxNNjI4F4gu8hyy0XzZPnCz5WyAh/ECSkPsjQF/I+?=
 =?us-ascii?Q?H1Su1WqGjullSC94Rhofm/ZkSLOZ2e1xRpqYhif11TDQeiJaeyRcaV8/dgeB?=
 =?us-ascii?Q?V97wsqghtZySiY9UWKqZtHxa/J8MMfTS2XPyQnu3K0w0ons+vY8zuEA0vH+w?=
 =?us-ascii?Q?4AP4xAuRMzib1gE9elO3kL7s5Wth3Sexczj7y2T0mkLz/KZ0FmhAusAqHwfP?=
 =?us-ascii?Q?bVekVaHI04DotIx8IqmMt1rATcvuMaHy35tqkguggEqFTbunzB5ocEPOrV0e?=
 =?us-ascii?Q?XWv9WscYHSNYPXIJGry2SG/WZBCLLUYpEZv2A+gTuyE/0WUGBh6otvSLjCF8?=
 =?us-ascii?Q?eiLr/GF2TgYZvjEJVgnPYdbc0rVIMPI9mJ5Segb5AS7oDP1Ijpj3n59AZj7z?=
 =?us-ascii?Q?B4yqycEXFHiXl7wYIoZxROpqEOsyBu0PdlZSU+eykzV1DAMJfch5eT2VjI1p?=
 =?us-ascii?Q?ZyzIfGKLWX3MpRhH2StHKVh5rzOzZ9aW0A35h33jUD4VI6HnwKv4PcRFJy9d?=
 =?us-ascii?Q?33m/C2CI6ZVvjjZp13/SBdY1sACkDR+Eqyv8Y1SEJTNHzr0JEEbAd0PIS7sp?=
 =?us-ascii?Q?hYoCyvxzojPd3BZlOvFmjzBM3L3lsuPrwMVzai41bZDqYKBu/p477CZczwjm?=
 =?us-ascii?Q?w4A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ijyYjcHRyyRqvzypnG9vWVlZlEoyocGH+8Q88joQNa4kM9q572cKocL4tPf?=
 =?us-ascii?Q?A1JAk6BlwtIxQI7OIspZHrO+Ivgay6WkNYc0q3m5gp/KGpl5KytO2IbV4Tdm?=
 =?us-ascii?Q?D/+UMfNqsS109u4QlHgpmSVFdR/AOtMeURduGnzvK61lbjf/ChcFKdfLWHN2?=
 =?us-ascii?Q?Y2gajyxKHjLihFknsbq5g8Oosh/CsDpv9eyg7v6dCvNnoDU6SqNJxNJbIK8N?=
 =?us-ascii?Q?0iPS+YOIxYlNOHjV2GHJTHGpuA0OScmUcdaVhOEn2qbkAO9p1/MoWUtWKSc9?=
 =?us-ascii?Q?2atv85rvgKFJ1P6c9W3H/scJcPM6bp2Cn/g/gxrsI4OnmOeueux1yDlC4+VR?=
 =?us-ascii?Q?xkekiZnb4R8L/Ci+DlIdwm4fHyRA0BHCRdkSUw8Fa4B9oN+rZOVFJu0+Xo7m?=
 =?us-ascii?Q?2hoVPkquTOynTfJN9AE+9bNozuph2O8Onf/gJSNVCVFIfMnUgeV4Eb6M4cPw?=
 =?us-ascii?Q?tPv/1Eo5eN2A/EAoEk+EaAGxipWEDFTI/RUCwHQZrSdSrg/xOU4Zny7dLWSW?=
 =?us-ascii?Q?dKs0zmVQINbUKDUp+8qoTSvr1AgF1w3VV6XtGAHkNs+xza3KNgBQFuIYag4X?=
 =?us-ascii?Q?DZhdf6yKtnpGMhIdQjmSqmmygCSvXqfFi1loX67sWz57e7tEG9r9dkXPtj7r?=
 =?us-ascii?Q?NnhkqUKZa7X6zC914AKoJxMyy7Ug213c/e+PBCxGzFEAU0Zk0vAKv+KNO8uM?=
 =?us-ascii?Q?r4XmeOLoocBDxSyxiyc/kE7GzMWAU+YGHCOSlbSnjE0F8TTyamX1vnaoZHqt?=
 =?us-ascii?Q?88l36qWtJR+gGnlUgt+YLrkbByRSmof0cgEpRI0z1fHlmxY+fUFv0PIlnuqA?=
 =?us-ascii?Q?wo2TwX/yQ1CdaTEJ2AbJWcAuYY7+YxDEE0wgFKKTvDmgbyvyAOtLOgykWaXs?=
 =?us-ascii?Q?KtH2MC6qA3klRHFdP3WhROrbw5EY+T9oPIY3GeMKapfuZZ9EzbUqhUowgFoI?=
 =?us-ascii?Q?MyhpQj97/vu1orYVdEaBl/Vrlt/jNEJBlfRPhIN2QnrMUg1Th9mVPELIzP+b?=
 =?us-ascii?Q?NTypw9u0p81uGfstx37XqTIw6d/uPGqF8H/uXGZlbyZxrtPW5y0/jAEAm5sY?=
 =?us-ascii?Q?o10MP2KiMjuRZBRRpxzlo6AGbO9hHcVWsZVlGGu5U7rE12wwXrz/F/1s0kqB?=
 =?us-ascii?Q?V0iMtU4JdIE6l4TCgtsUip2fpuccFggBQvdsR8ky/rQFvRQuT4/93rqhurxF?=
 =?us-ascii?Q?Hu8+TI1HtOd79i9ReqrtoYmcMs/Ju84aqh1iCyTAHZTskIUqKh9GSvminh0M?=
 =?us-ascii?Q?N3u/nGD1o+RoLr1vlpri/AU9i7Pfs8EnyTFrUK/bQR5yHlXa8FLP/e/LEdo3?=
 =?us-ascii?Q?MWAcNMpIsmGVn1slDmmusR4MjYp+L6zpdS4wXJR+smlBq/XvXH3+8jrGvk1c?=
 =?us-ascii?Q?c7ukbk20vaorpGwd9Z4Mg6lpvKRcTnrPNoF2agjsyR8Msuy8ad2OF42wOsiX?=
 =?us-ascii?Q?xa+R1IkimuWuij3skRtwF1K2nCzoVKHblwDGw5oJtz58076IyhrWIQsfasl2?=
 =?us-ascii?Q?1Ta4v0Ok1dTkHbW3h9Rfcu4ehpdvoZmV7UqJz52dNLXw3OY3npbmgtTf0ink?=
 =?us-ascii?Q?wIwOqPLrVqmq/wN2Pby59QILiVGp+L67toi48F9BdUhNfX0A93rdy/vQAvGM?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e66e78-cd75-4375-f803-08dca034a0be
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 16:31:48.1619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyOQ7AW8sqzp8pYejR/KLUAWU6w/62YxX65KoI0fYuH7kZP0S/8R4K2M3M8fbKesiE4PJvCKKCgF5UjlCq3UlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
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

On Tue, Jul 09, 2024 at 10:57:14AM +0100, Matthew Auld wrote:
> Hi,
> 
> On 08/07/2024 05:03, Matthew Brost wrote:
> > While debuging [1] an issue was identified in which if too many GT TLB
> > invalidations are issued to the GuC, the GuC can get overwhelmed to the
> > point scheduling of jobs starts to stall. To avoid this, hold and
> > coalesce GT TLB invalidations in the KMD if a watermark of pending
> > invalidations is past. Add gitlab for this issue has also been opened
> > [2].
> > 
> > Layering issues with GT TLB invalidations are known [3] which needed to
> > be fixed first before adding this new feature.
> > 
> > - Patches 1-8 fix the layering.
> > - Patches 9-11 add coalescing feature.
> > 
> > We could merge these two as seperate series if needed.
> > 
> > CCing various stakeholders (Farah, Michal, Nirmoy) which have raised GT
> > TLB invalidation issues in the past.
> 
> Maybe worth mentioning for [1], we try to process TLB invalidations directly
> from the irq, however we also only process the g2h queue in-order, so if
> there is something other than TLB invalidation or fault earlier in the queue

Faults get sunk to a secondary queue to avoid stalling the g2h queue +
work around dma-fencing rules.

> then we do nothing useful from the irq and just return, that is until the wq
> can eventually process those earlier items that couldn't be processed
> directly from the irq. In the past I have seen TLB timeouts where the TLB
> invalidation is clearly in the g2h queue (and has been for a while), but is
> stuck behind something earlier in the queue that needs the wq, but system is
> under such a heavy load that the wq can't be scheduled in a timely manner.
> 

Great point. Will add.

But perhaps we need to change the 'ct->g2h_wq' priority too. I think
this should be the highest priority WQ in the Xe KMD.

Thanks,
Matt

> > 
> > v2:
> >   - Fix CI issues
> >   - Clean up some of the series / patch structure
> > 
> > Matt
> > 
> > [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497
> > [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162
> > [3] https://patchwork.freedesktop.org/series/133001/
> > 
> > Matthew Brost (11):
> >    drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
> >    drm/xe: Drop xe_gt_tlb_invalidation_wait
> >    drm/xe: s/tlb_invalidation.lock/tlb_invalidation.fence_lock
> >    drm/xe: Add tlb_invalidation.seqno_lock
> >    drm/xe: Add xe_gt_tlb_invalidation_done_handler
> >    drm/xe: Add send tlb invalidation helpers
> >    drm/xe: Add xe_guc_tlb_invalidation layer
> >    drm/xe: Add multi-client support for GT TLB invalidations
> >    drm/xe: Add GT TLB invalidation coalescing
> >    drm/xe: Add GT TLB invalidation coalesce tracepoints
> >    drm/xe: Add GT TLB invalidation watermark debugfs
> > 
> >   drivers/gpu/drm/xe/Makefile                   |   1 +
> >   drivers/gpu/drm/xe/xe_debugfs.c               |  38 ++
> >   drivers/gpu/drm/xe/xe_device.c                |   3 +
> >   drivers/gpu/drm/xe/xe_device_types.h          |   5 +
> >   drivers/gpu/drm/xe/xe_ggtt.c                  |  21 +-
> >   drivers/gpu/drm/xe/xe_ggtt_types.h            |   5 +
> >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 641 ++++++++++++------
> >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 +-
> >   .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  41 ++
> >   drivers/gpu/drm/xe/xe_gt_types.h              |  43 +-
> >   drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
> >   drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  | 145 ++++
> >   drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h  |  18 +
> >   drivers/gpu/drm/xe/xe_pt.c                    |  33 +-
> >   drivers/gpu/drm/xe/xe_trace.h                 |  10 +
> >   drivers/gpu/drm/xe/xe_vm.c                    |  45 +-
> >   drivers/gpu/drm/xe/xe_vm_types.h              |   3 +
> >   17 files changed, 801 insertions(+), 279 deletions(-)
> >   create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
> >   create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
> > 
