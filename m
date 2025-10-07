Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7054ACCA471
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 01:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DC310E282;
	Tue,  7 Oct 2025 01:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CB4FjfoK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5AC10E282
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 01:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759799486; x=1791335486;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FAf2+NqnPnMeOGMH4uhMNTIQowxDm06XH3pB4qVZ8MA=;
 b=CB4FjfoKIhOjbBOr9ILKzfKEm2kEaYG2akPguMni3kN6Ko/PDph9Dtx1
 CdA7bwQ5a22hMvN0nvVQYvbZZUS93iA+zxjKHblR7FU8bS9IcGS41UeQI
 th45uAwycvySBglFyd+p1ITk/bnvNflAiAeTnBn1yQTNQtryw09zCFgBM
 kHkW02sVBIzraB5dOK2DV8JPe9srZ+uBxV+egIFYc9L2NjMVgm1fltcJr
 vZtosR5+pM0pbFb3iDW8vTTJXSYG6nVnzLofDtxRSVaA9slD6Zr2dJCEt
 s56TNef11tNhdOXLOkaGw4wfaadB0/KoU7gOwqy8XGGhgW6sOHXj1xSbs A==;
X-CSE-ConnectionGUID: u9Hcde/ORdWADxV7/XuiCQ==
X-CSE-MsgGUID: CAr8MHFISLCHrierXpuH3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="72236219"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="72236219"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 18:11:24 -0700
X-CSE-ConnectionGUID: JVe5eZFqTsCz+Jlcs9MvsQ==
X-CSE-MsgGUID: 11kwqGtzS1e8tYHtWub9Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="179679167"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 18:11:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 18:11:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 18:11:23 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 18:11:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ydLEEKCQiUz78WrpHloplzKk7OBGDKR2YNr+drE5pN6xyGayZwTg2ElEYhlT6cph+dsNRpmkFq1WXAaC0zvCfnL2PRYxSRV+fh1YW0i05dpej+RgZ23oR/I1VrWa7mOsJSv5vVRxNo3Xgou31RDJklXdfj7xB5fQQ5DebLeZZRcXazuC05yx+FVi1AC/7qllmlAUHDJ8oyBi9c9f8GMU1j44eXWw2Sgx2A+xbAo7zylaYZCsDw65bKyzRKugFalOPzNGL4C4yoP/AP1tgB4cOlMG8T7601Vdcni1Jw1qKb/mjLdznmHxn7opDvLAFLOZ1b+piEuASNqRlT5VvkuXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMeB7Mw1ytaQzCFIbHdrjLtXuBgyigOEmDXDv1XQoI8=;
 b=GpRGfsv9U5CuPFNqA1WPmAZY1oKKgDS2kxVrceGpKWC1ie0ml8vTZVMipreiqPzvO0rVQUsRhmltdyVIBh45Vtoay4K/1HbrArmPyZ8K56CzDRtIcKX3nMptrIpQj4eNMf8++mdxZp3mDoZQKRl12gCVT0fE8mgZSnkmX5+KnS8mXA4QlZLkyyMrgnDSPZNo6DTGsl8nxObWQdhgj0TDaOmygo5ugJAdCt2O992mSv3UqK6Z3Fz86VsGrwz6zXCqFqNYQ/fU2VtsmHbsF3H0TVHOqN+38aRV4qWjZZHNrq7YIRKcJFZgml+eFWv29zBmMtUGu1FZYg5hGoVYif2ZPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5083.namprd11.prod.outlook.com (2603:10b6:806:11b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 01:11:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 01:11:16 +0000
Date: Mon, 6 Oct 2025 18:11:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 00/30] VF migration redesign
Message-ID: <aORosc0ksVPDVmT0@lstrano-desk.jf.intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <aORcuItiopcmMl1o@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aORcuItiopcmMl1o@nvishwa1-desk>
X-ClientProxiedBy: BYAPR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5083:EE_
X-MS-Office365-Filtering-Correlation-Id: 107c7d20-83fc-4d93-029e-08de053e69e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hMkL9BsNUAZyyB5kmIrsK/9tXcTWi07+PYNANd4enhM3jnxdShqPquwXzkaX?=
 =?us-ascii?Q?lUYzsXePU2W6LMWNhVihGjg64lI0PO9VZA0Vrb7U4ctB59LkYWlXkemcEsY4?=
 =?us-ascii?Q?/KdGhHnIZWf4hbyulWttqyq+nNn9BzAQS2JZcZFeM3wDKpGYlVZGpYgsD5Hy?=
 =?us-ascii?Q?AAf9MLuj1LGnZ6Y5Zqv0LOzV/E8t/B+RVMOSYVT+pxwKjtQsBjPZmNctRMUH?=
 =?us-ascii?Q?YSqmY/UZobBu/nhokoyoVreWLYJQOy2fJLy4NORatqdoP5GgmxoyF7ZY5F+u?=
 =?us-ascii?Q?aNRisrJyYU0rF2LlhrKBfAsCo8PT0qr89PK939vxlg6dD6Bn1S2+sHaye2P5?=
 =?us-ascii?Q?22wnGL7zeFkLEuutizHHI7KoOCdio9ti9yPZ4aaByxvtgWDK1eeJWh9ZdnuS?=
 =?us-ascii?Q?T9e/2fuetsl5ImHe7/GErGqIx54Ui27G4nOLEFExpCk6K7poOiQxCldp/hHg?=
 =?us-ascii?Q?JQ9p4taQjhZmQPGQ6baFX1wZFl+fs4acESnaTaDUS0YQzUV3unz627Rjx1+P?=
 =?us-ascii?Q?aPwQktA5nkM/IHM0bVRKQiQKZoyGAaM852Zxy0ZrL7yjBekS0vV6tL72Sr/f?=
 =?us-ascii?Q?NwQB9HsV7/Y75rTKHawmFqIoAEyP8O+f0dkwruUbKgGBS82jVR1eVHjT/bec?=
 =?us-ascii?Q?P7UpbgPDNCJee7iNimfkmpmwu7SHcXYmbAXW8xu+Q9jzKvhWznkchv24SuJp?=
 =?us-ascii?Q?962V4BRVAorsKrIV6TeLhl+O0EyJlxugNauKQY9S85gl8IqZzc+6spS5wOP1?=
 =?us-ascii?Q?GOV3toZvmJh2KYKhwIZl2RF0uUq/ZQ9+dHKgrCOOs5qc2DGKQue9o0ErDuRr?=
 =?us-ascii?Q?CyALGCUg5FqKxHDWDMQS1/fciDVPy9ZUVpnaRgcTbOmEovcbRGTzB+oAzBfJ?=
 =?us-ascii?Q?QmNnReM46n8GnlyVbEd2raO90pvl32njAR8F2NvVyhwZ80uZQstuAIOmbvmo?=
 =?us-ascii?Q?mJwgTOotf7kMoAXsVEcjGBPhZCRWDjhRcI7bGzlHlp5o95UakMcmdcQIWJ2O?=
 =?us-ascii?Q?6h9RE7IIlS03K5UOcI0bnA2BoDpV7uh5bktsXtww2optEZg/ReDoGjJRaAuW?=
 =?us-ascii?Q?C49tb2SnVgJ2AmiANaPtSbWC3xu4sq0iX5+b+lWNlEycUbA+3Dw8s01Y5WS1?=
 =?us-ascii?Q?YZlISzvpqlF/AJ14BqCJkk4nKaG6Htysc9fRCEUnV1dOlhD8pNq4Io/bdXTF?=
 =?us-ascii?Q?klJ72M8F6uoXhFKDeiSSMmoG2XdMgcGRIGRB3QcaISnnkZ8fKUmOuFmeGszK?=
 =?us-ascii?Q?BpcMD8cqZ1SSVBS1PHqXeB6xPh9R5UDMEW3c84qJkQVmEzz8J1Yw8q0VnX6A?=
 =?us-ascii?Q?Ulr+lbOAgKrMT3pcgQ0X6U6jf5OASrbqnlaidiQlaMOqzv7W6zktt5yfg87+?=
 =?us-ascii?Q?k/OyiTQ1h9uXH0vXISsFCYMp+DC6ln16WGuqx/rmYxdGhTotIJoka/C1geKi?=
 =?us-ascii?Q?xLcGLp7JbmJuEhym9ZHUsXLG0N+XDAKD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UCKwW0xEcbt2kqko5JJIMdAPsggnwAnwZ0EauJWhrnpay8eTl3qO+k0QxinQ?=
 =?us-ascii?Q?1nSg/KciEwnXsC3rW40VIjCHWgExxX5Nl6kotRtQXZ/d1jz3OwVVfuvTKgd/?=
 =?us-ascii?Q?mvIFfoogrHlUgtHb40Qm2g8cu+gyFTPujw3PBHFwT8LqpBURYJNt2NZGXwTK?=
 =?us-ascii?Q?68yenzNwf9J3uAjNW7F0Ogt3EwVjawSb8+UXGhqMdj2OydQBMS4qssbGz1AA?=
 =?us-ascii?Q?5atakN46oDko89/YftfkyRNbJgMQCY2IFvjaaxz8CXtlvIzYXKTKSJDDZ9/s?=
 =?us-ascii?Q?1r1RFy468WHBKePONAEVeF7Ftk0UapWSfawTTxlZOWkifne4HGbVQyfHDB42?=
 =?us-ascii?Q?/oNYWk+uT/VirQmXi5FbbZY6awYAVoyH7Cb0PXnA279FPYldiMKERXh61NA3?=
 =?us-ascii?Q?W1IDny8n/IAz6rxVUWcVGOMEEDu6Hyp49s0fxLaaEUPwPiyQe0MxOYRwAUXN?=
 =?us-ascii?Q?M0FzYDtu/iJgoWJYP0uGOq+ri6iUxPnJzbTYUmba093gI3lgdIO2cgWjYZ1n?=
 =?us-ascii?Q?Z6TdXGyI27h4JVH7Y8t0RNgoebpPXLCjDNEdbYsHNuLgYJweorMwDipHd0VY?=
 =?us-ascii?Q?sME/FUE9VMgqlOiMyTL4ol4nKHP0ySpt/f35AtMzWWYT27wTuUb6gMT+qK/F?=
 =?us-ascii?Q?PfluiEpYVM8GPGWhMAlmtQAk/kR8BEv0UrNHnlIpTT3HSrtymBn9I1bg7+qy?=
 =?us-ascii?Q?0+638eep0HMBIfSCjwgdE0dfA7E/jaJqDDdLQMU4CNeqnALBugSpm1B3knPZ?=
 =?us-ascii?Q?BblgS9AfZpqYFN6XhHy0KKPg8rS9oeTdcwdcRA2Gk/7DEXUCQKSHi4C7Z+Vk?=
 =?us-ascii?Q?GL5UQFNNi7dFClgRzYSUL4GBZ5l+TLB4l7UYZvhxhk+j36s2xDCGvSZOxNW2?=
 =?us-ascii?Q?ILZkyCIm+PcUkd1/ikjszQSYs6KMXP2rq5wpN4kB/YDA4HBlS3ZwqimOPnxu?=
 =?us-ascii?Q?AddzxhYJWwdSdVi5hzUuEzqjAdHrbbunvot7UePkY4tioPaR+dT/89ahEE9L?=
 =?us-ascii?Q?inllGaJQomcG0FcA05DF2Cvsv2HvNYAPlb3dYwRGDQpFwgim7YmrHL+ZG2Ni?=
 =?us-ascii?Q?FRuQsLoUhThGYGzis92Aq/jw5AckKn/lsWdviFv7V2R8IZVF1bB8ra7Tdl83?=
 =?us-ascii?Q?uTa68nMPvSRU3S2+F+BAIoexSs2sQRAEYrd4DYnAFY21J823RECOofOAf1wS?=
 =?us-ascii?Q?5UB5kt0nrTTNPLTNfeByfcBiCSVGD8xrs7azBaqwzhclVYcMg0o8cmRx6SCg?=
 =?us-ascii?Q?Ubt5sTNt4XuJgS4I5Tt/9jB6i6PSFFItkKQXxx9H4VqKeYJDtev/JVjXkq5d?=
 =?us-ascii?Q?s9uu48s21/PwkwdsqQT1a7+VrHLhJsygmVsCzwlvkinwCy3ZmG5lKLqDEn6p?=
 =?us-ascii?Q?34hpEwKgO2m4xCJ85EpsweOAJwTLgz+a5UeGJSQiTYW/SiEA+bucT8f7JytA?=
 =?us-ascii?Q?RZ2kSrOTRfIDUSK37snP2EAy4rkxIwUIoDou3xo/wEk3xr0IBKRinwf8NjUl?=
 =?us-ascii?Q?vB/ci8iJPh5ZnlW+XW8vHaQnCHUxKuR9EMJDRNS7qZLLQZXAUFgwKWjHvsCe?=
 =?us-ascii?Q?AI0Xea975wuOzTd5oZIbLvhfIet4tclSuNDFDaOj83X0aPvqmiQKCqP3YtZI?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 107c7d20-83fc-4d93-029e-08de053e69e6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 01:11:16.0131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4x+Qcm6baxCw4TTPHHPHvVlsp+rfjvuNA4L3NWP7hFnTZzn/QPyzwLU1fbFTwLQJDLrtCNlpPClrrkQTYwM+2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5083
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

On Mon, Oct 06, 2025 at 05:20:08PM -0700, Niranjana Vishwanathapura wrote:
> On Mon, Oct 06, 2025 at 04:10:08AM -0700, Matthew Brost wrote:
> > Rather than modifying buffers in place using GGTT addresses during VF
> > migration, this approach relies on the submission backend's stop/start
> > mechanism to issue fixups. The patch titled "Document GuC Submission
> > Backend" provides a detailed explanation of the design.
> 
> I don't see this "Document GuC Submission Backend" patch in this version
> of patch series. I saw that in older version of the series, but there
> also, I think it was missing xe_guc_submit.rst file.
> 

I think that patch will be posted in a standalone patch in a follow up.

Matt

> Niranjana
> 
> > 
> > Testing was performed using an out-of-tree PF/VFIO driver with manual
> > triggering of VF migration while IGT test cases are running.
> > 
> > IGT test cases:
> > 
> > - A new series [1] that exercises active contexts, job resubmission, and
> >  compressd memory.
> > 
> > - A new test [2] that actively creates / destroys queue on each
> >  submission
> > 
> > - xe_exec_threads basic sections, which test context registration loss,
> >  schedule enable loss, and job resubmission.
> > 
> > - xe_exec_threads balancer sections, which follow the same flows as the
> >  basic sections but include a work queue (GGTT address shift).
> > 
> > - xe_exec_threads compute mode user pointer invalidation sections, which
> >  exercise the same flow as the basic sections, plus replaying
> >  suspend/resume flows.
> > 
> > All code paths in "Replay GuC submission state on pause/unpause" that
> > replay state have been manually verified via debug messages "Add debug
> > prints for GuC replaying state during VF recovery".
> > 
> > v2:
> > - Fix lockdep splat
> > - Fix checkpatch
> > - Fix PTL issue with LRC W/A buffer
> > - Fix race creating / destroying queues across migration exposed by [2]
> > - Include a version of Satya's patches in [3] which enable CCS save /
> >   restore across VF migration /w GGTT shift
> > v3:
> > - Address feedback
> > - Fix preempt fence mode deadlock /w work queues + VF recovery (Testing)
> > - Add NULL checks to scratch LRC allocation
> > v4:
> > - Fix CI failure
> > - Remove config lock
> > v5:
> > - Fix CI failures related to lockdep
> > - Address various comments
> > v6:
> > - Rebase for CI
> > 
> > Matt
> > 
> > Matthew Brost (28):
> >  drm/xe: Add NULL checks to scratch LRC allocation
> >  drm/xe: Save off position in ring in which a job was programmed
> >  drm/xe/guc: Track pending-enable source in submission state
> >  drm/xe: Track LR jobs in DRM scheduler pending list
> >  drm/xe: Don't change LRC ring head on job resubmission
> >  drm/xe: Make LRC W/A scratch buffer usage consistent
> >  drm/xe/vf: Add xe_gt_recovery_pending helper
> >  drm/xe/vf: Make VF recovery run on per-GT worker
> >  drm/xe/vf: Abort H2G sends during VF post-migration recovery
> >  drm/xe/vf: Remove memory allocations from VF post migration recovery
> >  drm/xe/vf: Close multi-GT GGTT shift race
> >  drm/xe/vf: Teardown VF post migration worker on driver unload
> >  drm/xe/vf: Don't allow GT reset to be queued during VF post migration
> >    recovery
> >  drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
> >  drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs
> >    supporting migration
> >  drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
> >  drm/xe/vf: Flush and stop CTs in VF post migration recovery
> >  drm/xe/vf: Reset TLB invalidations during VF post migration recovery
> >  drm/xe/vf: Kickstart after resfix in VF post migration recovery
> >  drm/xe/vf: Start CTs before resfix VF post migration recovery
> >  drm/xe/vf: Abort VF post migration recovery on failure
> >  drm/xe/vf: Replay GuC submission state on pause / unpause
> >  drm/xe: Move queue init before LRC creation
> >  drm/xe/vf: Add debug prints for GuC replaying state during VF recovery
> >  drm/xe/vf: Workaround for race condition in GuC firmware during VF
> >    pause
> >  drm/xe/vf: Use primary GT ordered work queue on media GT on PTL VF
> >  drm/xe/vf: Ensure media GT VF recovery runs after primary GT on PTL
> >  drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
> > 
> > Satyanarayana K V P (2):
> >  drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
> >  drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC
> > 
> > drivers/gpu/drm/xe/xe_device_types.h         |   5 +
> > drivers/gpu/drm/xe/xe_exec.c                 |  12 +-
> > drivers/gpu/drm/xe/xe_exec_queue.c           |  64 +--
> > drivers/gpu/drm/xe/xe_exec_queue.h           |   2 -
> > drivers/gpu/drm/xe/xe_exec_queue_types.h     |   3 +
> > drivers/gpu/drm/xe/xe_execlist.c             |   2 +-
> > drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  14 +
> > drivers/gpu/drm/xe/xe_gpu_scheduler.h        |   2 +
> > drivers/gpu/drm/xe/xe_gt.c                   |  28 +-
> > drivers/gpu/drm/xe/xe_gt.h                   |  15 +-
> > drivers/gpu/drm/xe/xe_gt_sriov_vf.c          | 458 +++++++++++++----
> > drivers/gpu/drm/xe/xe_gt_sriov_vf.h          |  13 +-
> > drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h    |  33 +-
> > drivers/gpu/drm/xe/xe_guc.c                  |   4 +-
> > drivers/gpu/drm/xe/xe_guc_ct.c               | 121 +++--
> > drivers/gpu/drm/xe/xe_guc_ct.h               |  11 +
> > drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  15 +
> > drivers/gpu/drm/xe/xe_guc_submit.c           | 486 +++++++++++++++----
> > drivers/gpu/drm/xe/xe_guc_submit.h           |   5 +-
> > drivers/gpu/drm/xe/xe_lrc.c                  |  15 +-
> > drivers/gpu/drm/xe/xe_lrc.h                  |  10 +
> > drivers/gpu/drm/xe/xe_memirq.c               |  48 +-
> > drivers/gpu/drm/xe/xe_memirq.h               |   2 +
> > drivers/gpu/drm/xe/xe_migrate.c              |  28 +-
> > drivers/gpu/drm/xe/xe_pci.c                  |   6 +-
> > drivers/gpu/drm/xe/xe_pci_types.h            |   1 +
> > drivers/gpu/drm/xe/xe_preempt_fence.c        |  11 +
> > drivers/gpu/drm/xe/xe_ring_ops.c             |  23 +-
> > drivers/gpu/drm/xe/xe_sched_job_types.h      |   9 +
> > drivers/gpu/drm/xe/xe_sriov_vf.c             | 240 ---------
> > drivers/gpu/drm/xe/xe_sriov_vf.h             |   1 -
> > drivers/gpu/drm/xe/xe_sriov_vf_ccs.c         |  28 ++
> > drivers/gpu/drm/xe/xe_sriov_vf_ccs.h         |   1 +
> > drivers/gpu/drm/xe/xe_sriov_vf_types.h       |   4 -
> > drivers/gpu/drm/xe/xe_tile.c                 |   2 +-
> > drivers/gpu/drm/xe/xe_tile_sriov_vf.c        |  30 +-
> > drivers/gpu/drm/xe/xe_tile_sriov_vf.h        |   2 +-
> > drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h  |  23 +
> > drivers/gpu/drm/xe/xe_vm.c                   |  26 +-
> > drivers/gpu/drm/xe/xe_vram.c                 |   6 +-
> > 40 files changed, 1250 insertions(+), 559 deletions(-)
> > create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> > 
> > -- 
> > 2.34.1
> > 
