Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B91CC43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 18:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FA510F5FC;
	Thu,  9 Jul 2026 18:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NM9IJ7O2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACB110F5FC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 18:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783622648; x=1815158648;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x4/2eOcT+CTq3zUtyGoxXyDRk85awxJzLHQU1yaS8F0=;
 b=NM9IJ7O2nQE2+tgCnJtP/Let/9mTodKLyhmy4JzokfArb6eNfbnQa7um
 vzaMaZyPvu0DF56e6nr7D+u37b4f51xfQ1JpobD4CpcI7H+i4PMDIPxON
 5OC1SOqiYB2gtjptTYV5GcqyplOtO+Rpxp1UUeeKw4jBHUgKn3XKed4lb
 d7RGcjKmKsWw+lzAQ/0I+t0W9JwdfOTa0YJEdlWNiPuWiqiAHgIDiykiz
 r4mj121X5NSQE3BNBieUdzPLZBi6XrD3o3CrMvvXHhuklfYiQcZsc2+YL
 1WJ+SlnxnNyzt7LsekUFNnkmuSvzTA/FJZrv07EMu0n54lujRT5iAAi5M g==;
X-CSE-ConnectionGUID: nlBsvAARTiem4GUO/ioAJQ==
X-CSE-MsgGUID: VqvHE2XORquJHjQJ8cQyQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88001246"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88001246"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 11:44:08 -0700
X-CSE-ConnectionGUID: DFUk4uIqTlGaYWzZ5mQ5oQ==
X-CSE-MsgGUID: JjimLaceT8enfBmLYtlQ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258533708"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 11:44:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 11:44:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 11:44:07 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 11:44:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdcsDSor/F3w1NhO2CVIPnRVxeMicckuHg1ywQbIyMst77vdppgr+Xi5AQlzpVoXfzmDKpTbaZz7gGxTHtCk6eMN8M+44M7BMmHQUh0cNaWkmWijTTnJlnaQaWs6bm6wpu2ndcCsdU5sWcY5VJBfB3oQtd/8NPK5n61ubQ0T/+4hjsDSjJXxUurx4tu3Za1VkeL5clfaN+qRUnmdMe5SEH8/eYWsVFdXG5SXYavmFsvJvv0OZdYfs93apFnJ3CTtU48s2S39LzQ6xSQbzbSd8tW3AHrUK0m8x+5E9cbF7MluhREIYvDDH0yhoXYXqonmBlmMhLcvoAcVe35Eem8aEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7Ah8+A4A/3gjjoLjc2rhpaex4hovIdU+MjL1at/LU8=;
 b=RybV7ILyIPjeDigU+j7+mCN76McqNIIJrGeZIHbyBcH3P/FxbBoC/ZQjZSa2uerzG6tsSdsIQC7gp9wD03AW00F6x8LIqmJUX2t9+r3i+R0V2QLlU0oWR9PSj9z4r0rnKvluO5/jrXFascbZsMaH6i6rLm3sF0KYdfyr71E0NbAlBer6pb70dR/1TvUwPJ6YGPFrS19D8rG7/kqLH6cmyp/YQwP92AE4fdWvHq+S4IOaYUeB9ZUxv78QVST7ip3HjJnCz26z5qa2qTPRUjBc5a430hdvtFLzUAT/dqZmNgx3+y1YjUYfEqQQRE3PRv5QnUizWyuqJ0WpDkBhz73nlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB8009.namprd11.prod.outlook.com (2603:10b6:510:248::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 18:44:04 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 18:44:03 +0000
Date: Thu, 9 Jul 2026 11:43:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind()
Message-ID: <ak/r783eVoTadyNO@gsse-cloud1.jf.intel.com>
References: <20260709024925.1731496-1-matthew.brost@intel.com>
 <512dde5212d036c9f6ad08c0dd53318180f96602.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <512dde5212d036c9f6ad08c0dd53318180f96602.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 437b7c52-8d58-4678-a880-08deddea0ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|4143699003|6133799003|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: BQ0xmOn5oOZGqrbFs5VOxNiqLNuxLQlTecl6N1JiUBRPUxHIT0qsRztvF2o/y9xmoTY+HfcZLvzJ9awBZv94affdHf9DzRSgomm2CZGSWgZn/SnMfVsXwpbq6UsE8cQbWvHpOm+IgJMSjVaGUcvV4SxPXijYVm1pCZQM9rU1JUSCFd1BY4ToZ8bZ8psLCkVBPsxwzFV+6EvBfzS+6H/SU3VX/V/z4D6hEfegB4KWhRkmWBCQ15Nt25KnNWUKLHFT/J2LRitreliGxgkFzufWdfihFHOOOqGg7hfgmnLhXHdhKvsYFNPFNJSXBvBSK0j1DzhBc4lHrEKVmtm8rgOCBGF90kOrgibB9fp3jgTzBrqjE9xWW4loy6vOxvLsx/EvAbO2N192u+vtLpqNT1eSg2vAXLOCI17TXOC6mC4Jhg34+fSzHZXkk8dMmSu+F4gQDk9Mwztyr+Q1WMLynl/+GY8meXyF2TMB4i6J0hLntmMcWGJyxQQ6AIYGtOWc58Ig9jLvWt4gR9glO+kSB5KP6byBrxIKOjJwa0AKIhm0zsmQIrDML/K21/GeNOniOQgVezcnzF9+REJKKL08qzEDuAURCjvbjjMBG4CFHRQjn+kCJsrQq2dPFrOlVTxqhLVAdt/NU/AKs642ToUxkXqhZUpAKbF6UGfR0Kq/Wwexpho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(3023799007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2EYANrarv0dUpUgPnSXFIXb7v1uyAyGcxMw8lMFy4JFghyfY1/Q5A+sm3y?=
 =?iso-8859-1?Q?EEcvDiMfJvg+TMEJTIxZ/sjfErIFjT1c7wAiKlL4RNsm4jtb+6OOC+z6Q7?=
 =?iso-8859-1?Q?26J7qxFMxsaMkxoaRGHsQF1PBL1SZPviWd6DbFue2pNTPADgXD5SfXEs7S?=
 =?iso-8859-1?Q?URZkBkIRHHoprXKCJ4tz9PJTlxbb0KjW9Q7Sns/T81q3cXCUru58otfapn?=
 =?iso-8859-1?Q?nxi/4wZBiDs3loXvu2GWE0FZpFr7qWMZpB6nL2mIoIVZpUe64iyrctHM8i?=
 =?iso-8859-1?Q?VVCCLyo0u94tmDBBV2KSLjOjvOUbSfPZ/Qq4/f7FSuyF6MzGe4G2b4M8CY?=
 =?iso-8859-1?Q?Y2TO8SMhS7No2DOFCL65/4jGz0SSyO9PAn3o7MaoGFzOCjs44bro0eoZJi?=
 =?iso-8859-1?Q?JRYvZHiiUQoev3CyirXS3Uh/+9hsmb77KC2URCZlyVMnPzT3qZvi2pidjq?=
 =?iso-8859-1?Q?l3p8/jyXyWdNPQX4EBRzAhfpkti6+lMVeJP1G7/z5NSPDUD0amhfz7CWJ3?=
 =?iso-8859-1?Q?g+OCoYZv9kYGcsCX1QaYwu3Tpl3eMtktaJCCI1/Y3kAoc7bOXA1E49qv7H?=
 =?iso-8859-1?Q?S2gV8GBQRmJ0jamFFuyuxCe1YwpTssSHuzWOLA7XuJHVK81z8bPUduRIsy?=
 =?iso-8859-1?Q?TobGhs/yOSLdPV9xQ2q0nyLMyB/WjPEitaR5p2v2YZcG67R/C/RAinP4m1?=
 =?iso-8859-1?Q?JV1MfW5lXQ0NE+AzNeOx4ftyC6C5fv04jyyn/xHRX8pzAjNCw1Gn1B4BSo?=
 =?iso-8859-1?Q?Ytf20a/iADChrzX87LVEtUme/eKxO1LQQtJf4W1s6qbRIR9oq3jQ5jeIfL?=
 =?iso-8859-1?Q?Yo2IhD4Ok61vtV25nfdgIyuzGViv8jYQDvALPlVabLClG7a09bIzTCsn74?=
 =?iso-8859-1?Q?gISCTbABaKPXoHL/+LFwHNkreGNCLv0PEVcnvY0z5s/audsygH25bTIfWi?=
 =?iso-8859-1?Q?9CAFRnAGAUY9mNJAYkPo6TGvA7Kyw98ZijmTvRQVPPQr2alysC53KBMcSD?=
 =?iso-8859-1?Q?N3gz3ESctvCkkCRR3kGZnjYRosoiPcW3Us3LPEOMzrCxJVqB+YEjKSqY45?=
 =?iso-8859-1?Q?Q8m9Y6bFDLBbs2yzJvKuRDHGycApGi4Qi6eKJ6niQJEV0y3+JVzT6bCL4U?=
 =?iso-8859-1?Q?ISkLOA9Gzh9AbVwwAX9zcqZ/KbTga9cLhFTt7oGuxov+Lw/abzZcjBL72h?=
 =?iso-8859-1?Q?sybrE55aYqirhSBfWj/G6suh5XmhpEBAsu0PtDA4rJ22laYeeVJVXONVd3?=
 =?iso-8859-1?Q?egdfcck/gSqxypZV/f5X1mIPGeYlPAJGBxWXlgd+1T5+AsXAQTsqtA+WYz?=
 =?iso-8859-1?Q?dksJm1E2Jef5Ov/KGaK8aAIeCGm8SD4QuCH0UEwaPkEIKSR2+5b+tmG7Yp?=
 =?iso-8859-1?Q?NcThM1D3/KtAlHdfDAuI36021L0zHvjy4ksaNJuHOLTYxgDzW/w1JDqEJ8?=
 =?iso-8859-1?Q?22v8uY9eHge1MT8Hv+19DHHhNirPWR8BtdrGKh99Vao3PVSIN/I1UNYfXr?=
 =?iso-8859-1?Q?NO81/g+r9eGm5I2awED2PYBD9MBhKi2rawpmC5k5WCmGLuPbYU2YbkDojw?=
 =?iso-8859-1?Q?7N1jhzX30eYqlqL1qshenKVQIuz/PPX6j7ABEX8UdNxHgB4j0lXnv/ex2F?=
 =?iso-8859-1?Q?2Jm2IBIUQk+ZcnFopZdOcvOjaTrHx7Xuf/MdTT4l0v3Bbo85aNGFInoX0M?=
 =?iso-8859-1?Q?SQpPTSGi2eMCB3TgFiJu0+FeLYtx1OwtLvoRNNSMJvvDR7eCmLaQxwzeUi?=
 =?iso-8859-1?Q?vr28xpAhJXtNHFjAwO+xv3XSAzzNOPY3XILsqrOQgWK0bIBpdAuyClmfSL?=
 =?iso-8859-1?Q?dsKF3fiq9ISpqFwxGgo5+t1e+SF2jTw=3D?=
X-Exchange-RoutingPolicyChecked: oVtDpFV3wX6gA/PBnW2AWE2dpwIXnvBI3o0lZB+dtwsJylrBp5t9BEGexqCxyZ3w3FwFl+gYsUh4QVJS4M7CANquvFGUV4g0e+xClbjQiTK7lGomxRZFfBipzyCU1vlcWC/2sQRKlTiGp/68KMyFmYku9AdTfqVtvyaSGqRhnPFSBWFSWgVFVQ1sXT91B33JLLhlptc4P237MPEym7R1KzMnJdyH4bDDq2hjb3FSZ5rdoJzAm6ZnI3Pi4409JY1mw0Q1Mh5+DMVVeKc9KAKbFB59YmKxh1ug1RcZggll5O0lfmusbtRhpKLAs9vWThZ89goAijW7dypjdgxiSl4urg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 437b7c52-8d58-4678-a880-08deddea0ba4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 18:44:03.0333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rgu5L84EyQjDPc0KeWchjR7UJEMXGSmRntFx4SqdlwgCpS4PQxOdMrPf8TfX0J/mAFZ8p/mO1CTnAvCQPXtUuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8009
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

On Thu, Jul 09, 2026 at 11:41:00AM +0200, Thomas Hellström wrote:
> On Wed, 2026-07-08 at 19:49 -0700, Matthew Brost wrote:
> > On L2-flush-optimized HW with a dma-resv (non-fault) VM, evicting a
> > BO
> > only needs to flush the L2 cache before the migration copy runs; the
> > mappings themselves are torn down and rebuilt lazily via
> > drm_gpuvm_bo_evict() and a subsequent rebind. Today this flush is
> > done
> > by waiting for the BO to go idle and then issuing a synchronous TLB
> > invalidation per mapping VMA from inside xe_bo_trigger_rebind(). Both
> > the idle wait and the synchronous invalidation stall the calling
> > thread
> > while holding the BO dma-resv lock, serializing the move behind all
> > in-flight GPU work on the BO.
> > 
> > Replace this with an asynchronous flush. Add
> > xe_vm_flush_vm_bo_tlb_async()
> > which, for each VMA mapping the BO on each present tile, queues a TLB
> > invalidation job on the tile migrate (kernel) exec queue. The jobs
> > depend
> > on the BO's in-flight GPU work, captured once as a singleton over
> > DMA_RESV_USAGE_BOOKKEEP, so the flush only fires once the GPU is done
> > with
> > the current mapping. Each job's completion fence is installed into
> > the
> > BO's dma-resv as a DMA_RESV_USAGE_KERNEL fence, so the migration copy
> > -
> > which waits on the resv - waits on the flush without stalling this
> > thread.
> > 
> > No PTEs are zapped and vma->tile_invalidated is left untouched: the
> > mapping stays valid until the lazy rebind, and the only work
> > performed
> > here is the L2 flush. On any failure the caller falls back to the
> > existing blocking wait-idle plus xe_vm_invalidate_vma() path.
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Assisted-by: GitHub_Copilot:claude-opus-4.8
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Is there possibly a way to do this using a GPU command now that we're
> making it async anyway?
> 

I think there are ring instructions that can issue various types of TLB
invalidations, but offhand I'm not sure how those differ from the GAM
port invalidations (the GuC more or less programs the GAM port on the
KMD's behalf). We could look into this, but if we take this approach,
I'd layer it on top of the functions introduced in this patch. I'm also
somewhat skeptical that it would perform particularly well if a GPU
context switch (which is relatively expensive) is required to perform
the TLB invalidation and cache flush.

Or are you suggesting that, if we know a copy job will be executed as
part of `xe_bo_move()`, the first copy job could issue the TLB
invalidation and cache flush, allowing us to skip that step here? That
could work, but I don't think `xe_bo_trigger_rebind()` has that
information available yet. It seems like something worth exploring in a
follow-up patch?

> > ---
> >  drivers/gpu/drm/xe/xe_bo.c |  12 ++++
> >  drivers/gpu/drm/xe/xe_vm.c | 125
> > +++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h |   5 ++
> >  3 files changed, 142 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 85e6d9a0f575..a08b983cb0b1 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -686,6 +686,18 @@ static int xe_bo_trigger_rebind(struct xe_device
> > *xe, struct xe_bo *bo,
> >  			 */
> >  			if (!xe_device_is_l2_flush_optimized(xe))
> >  				continue;
> > +
> > +			/*
> > +			 * On L2-flush-optimized HW the only reason
> > to touch the
> > +			 * mappings here is to flush L2 via a TLB
> > invalidation.
> > +			 * Do it asynchronously: queue TLB-
> > invalidation jobs that
> > +			 * wait on the BO's in-flight GPU work and
> > install their
> > +			 * completion fences into the BO's kernel
> > dma-resv slots,
> > +			 * so the migration waits on the flush
> > without stalling
> > +			 * this thread. Fall back to the blocking
> > path on failure.
> > +			 */
> 
> This more or less echoes the xe_vm_flush_vm_bo_tlb_async() kerneldoc.
> Perhaps /* Attempt to flush L2 async, fallback to sync flush on failure
> */?

Yes, let me clean this up.

> 
> > +			if (!xe_vm_flush_vm_bo_tlb_async(vm, bo,
> > vm_bo))
> > +				continue;
> >  		}
> >  
> >  		if (!idle) {
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 73ac031ffb04..4557a8a4d270 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -39,6 +39,7 @@
> >  #include "xe_sync.h"
> >  #include "xe_tile.h"
> >  #include "xe_tlb_inval.h"
> > +#include "xe_tlb_inval_job.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_vm_madvise.h"
> >  #include "xe_wa.h"
> > @@ -4401,6 +4402,130 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  	return ret;
> >  }
> >  
> > +/*
> > + * xe_vma_tlb_flush_client - Queue an async TLB flush for one VMA on
> > one client
> > + *
> > + * Create and push a TLB invalidation job on the tile migrate
> > (kernel) exec
> > + * queue covering @vma's range, depending on @dep (the BO's in-
> > flight GPU work)
> > + * so the flush only fires once the GPU is done with the current
> > mapping. The
> > + * job's completion fence is installed into @resv as a KERNEL fence
> > so the
> > + * subsequent migration waits on the flush. No PTEs are zapped; this
> > only
> > + * flushes L2 via the TLB invalidation.
> > + */
> > +static int xe_vma_tlb_flush_client(struct xe_vm *vm, struct xe_vma
> > *vma,
> > +				   struct xe_tile *tile, struct
> > xe_gt *gt,
> > +				   struct dma_resv *resv, struct
> > dma_fence *dep,
> > +				   int type)
> > +{
> > +	struct xe_exec_queue *q = xe_migrate_exec_queue(tile-
> > >migrate);
> > +	struct xe_tlb_inval_job *job;
> > +	struct dma_fence *fence;
> > +	int err;
> > +
> > +	job = xe_tlb_inval_job_create(q, &gt->tlb_inval,
> > +				      q-
> > >tlb_inval[type].dep_scheduler, vm,
> > +				      xe_vma_start(vma),
> > xe_vma_end(vma), type);
> > +	if (IS_ERR(job))
> > +		return PTR_ERR(job);
> > +
> > +	err = xe_tlb_inval_job_alloc_dep(job);
> > +	if (err)
> > +		goto out_put;
> > +
> > +	err = dma_resv_reserve_fences(resv, 1);
> > +	if (err)
> > +		goto out_put;
> > +
> > +	/* Cannot fail; consumes a ref on @dep and returns a
> > referenced fence. */
> > +	fence = xe_tlb_inval_job_push(job, tile->migrate, dep);
> > +	dma_resv_add_fence(resv, fence, DMA_RESV_USAGE_KERNEL);
> > +	dma_fence_put(fence);
> > +
> > +out_put:
> > +	/* Drop the creation reference (destroys the job if it was
> > not pushed). */
> > +	xe_tlb_inval_job_put(job);
> > +	return err;
> > +}
> > +
> > +/**
> > + * xe_vm_flush_vm_bo_tlb_async - Asynchronously flush TLBs for a
> > vm_bo's mappings
> > + * @vm: The VM @vm_bo belongs to
> > + * @bo: The buffer object being moved
> > + * @vm_bo: The gpuvm_bo linking @bo into @vm
> > + *
> > + * On L2-flush-optimized HW a BO move only needs to flush L2 (via a
> > TLB
> > + * invalidation) for the BO's live mappings; the mappings themselves
> > are torn
> > + * down and rebuilt lazily via the eviction/rebind path, so no PTEs
> > need to be
> > + * zapped here. Rather than blocking the caller on a synchronous
> > invalidation,
> > + * issue a TLB invalidation job per VMA per TLB-invalidation client
> > (per present
> > + * tile, primary and media GT). Each job waits on the BO's in-flight
> > GPU work
> > + * (all dma-resv usages) and its completion fence is installed into
> > the BO's
> > + * dma-resv KERNEL slots, so the following migration waits on the
> > flush without
> > + * stalling this thread.
> > + *
> > + * The caller must hold the BO's dma-resv lock and @vm must not be
> > in fault
> > + * mode.
> > + *
> > + * Return: 0 on success, negative error code on failure. On failure
> > the caller
> > + * should fall back to the blocking xe_vm_invalidate_vma() path; any
> > jobs
> > + * already queued install harmless extra flush fences.
> > + */
> > +int xe_vm_flush_vm_bo_tlb_async(struct xe_vm *vm, struct xe_bo *bo,
> > +				struct drm_gpuvm_bo *vm_bo)
> > +{
> > +	struct xe_device *xe = vm->xe;
> > +	struct dma_resv *resv = bo->ttm.base.resv;
> > +	struct dma_fence *dep = NULL;
> > +	struct drm_gpuva *gpuva;
> > +	int err;
> > +
> > +	dma_resv_assert_held(resv);
> > +	xe_assert(xe, !xe_vm_in_fault_mode(vm));
> > +
> > +	/*
> > +	 * Single fence capturing all in-flight GPU work on the BO;
> > the TLB
> > +	 * invalidation jobs depend on it so the flush fires only
> > once the GPU
> > +	 * is done with the current mapping.
> > +	 */
> > +	err = dma_resv_get_singleton(resv, DMA_RESV_USAGE_BOOKKEEP,
> > &dep);
> > +	if (err)
> > +		return err;
> > +	if (!dep)
> > +		dep = dma_fence_get_stub();
> > +
> > +	drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> > +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > +		struct xe_tile *tile;
> > +		u8 id;
> > +
> > +		if (xe_vma_is_null(vma) ||
> > xe_vma_is_cpu_addr_mirror(vma))
> > +			continue;
> > +
> > +		for_each_tile(tile, xe, id) {
> > +			if (!(vma->tile_present & BIT(id)))
> > +				continue;
> > +
> > +			err = xe_vma_tlb_flush_client(vm, vma, tile,
> > +						      tile-
> > >primary_gt, resv, dep,
> > +						     
> > XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> > +			if (err)
> > +				goto out;
> > +
> > +			if (tile->media_gt) {
> > +				err = xe_vma_tlb_flush_client(vm,
> > vma, tile,
> > +							      tile-
> > >media_gt, resv, dep,
> > +							     
> > XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT);
> > +				if (err)
> > +					goto out;
> > +			}
> > +		}
> > +	}
> > +
> > +out:
> > +	dma_fence_put(dep);
> > +	return err;
> > +}
> > +
> >  int xe_vm_validate_protected(struct xe_vm *vm)
> >  {
> >  	struct drm_gpuva *gpuva;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index c5b900f38ded..dd5b070eaede 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -26,6 +26,8 @@ struct ttm_buffer_object;
> >  
> >  struct dma_fence;
> >  
> > +struct xe_bo;
> > +struct drm_gpuvm_bo;
> >  struct xe_exec_queue;
> >  struct xe_file;
> >  struct xe_pagefault;
> > @@ -254,6 +256,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma);
> >  
> >  int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct
> > xe_tlb_inval_batch *batch);
> >  
> > +int xe_vm_flush_vm_bo_tlb_async(struct xe_vm *vm, struct xe_bo *bo,
> > +				struct drm_gpuvm_bo *vm_bo);
> > +
> >  int xe_vm_validate_protected(struct xe_vm *vm);
> >  
> >  static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> 
> Otherwise LGTM.

Thanks.

Matt

> /Thomas
