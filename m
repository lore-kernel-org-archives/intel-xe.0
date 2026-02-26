Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E708DFD9E02
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 19:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C4110E081;
	Thu, 26 Feb 2026 19:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyPky32q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9663710E081
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 19:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772134591; x=1803670591;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8qNNuo49dIXK2bDX4MLUV0W6CREL92tsViYuyB+bqYQ=;
 b=XyPky32qvV+vbEQoRNgpb755Rv6PNZNuehCpeGdFwHFgidhScxKw+efr
 3resig6TwmbwZINYi10aa7sJZFsE4X5PN1Pq1dEy2pSWECzv70bpEwORL
 tsn9cr1k8NWPRLDtUsPOOKoeJtGmDWfj8l2j5vStMFrOGbSdda+CcafCU
 UbpkTYCwHEIi0CtHIZCJpt603XNsfBJZMuWOOUaasQN92K9siks/KIkYu
 i8eWSwqAhCYEj5R4gmqT84D44iKUHfa6XErhQicjHCe5HWB2flSKlRdta
 Xr6JPqQGI3mz6tI7sxtOglUox7fKkV7Y9whNPNkeJCdFKTSgo2D7Ph2cm Q==;
X-CSE-ConnectionGUID: JQ5moJ5bQA66HeCAuGqlBg==
X-CSE-MsgGUID: 8/pMvwVPRPCi6a5T46eFXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73277112"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73277112"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 11:36:30 -0800
X-CSE-ConnectionGUID: NB/ecDS1Q3mqitb0oqEftg==
X-CSE-MsgGUID: LsS/x3QtSzaxmLEjcvtRjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="247189358"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 11:36:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 11:36:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 11:36:28 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 11:36:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1Oqfn9X1Nm/Id1Y7Qlkzjs1YN5SukrCqowKm7F1N2yHB9cpMFkjbu8LPNU2DDgTuBm1AqU5ZxFeDhA2WbSv+WcnGM0J6+ZD+qcdNSzIXwIbaPxvPBzwYgV74WUUMUS3sSEl1xNMBAFFxMg/VEeUlU/LtJLl8YpDBj2Yx3BFSEatfTQCa7W/wnXBHo0GTkSPEVld8XOltpeJoKbcRDRr4PZfFDxkHdX3LPK6hblE6r4cjMz1M40k7FyI2nm8vAfIUAGxyDku74qmnhiSZN8pTg+8vO2cJYgg2olMn+V5Rqbz64qVO2jUFD2wA6W2jF9jej1KZ/UZ5t4/wka5pEJOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8M9yQmXs/Cv7fUOj8H5f2vNoAoaJkDPE91mGYles874=;
 b=vaIfyiitRfkmMpuxtbkvrJ9x9+3vbGw8vyRu6wHKV99oFk34noGXF1c3KwfoIDoTup9fgwWVV6cn//cwMuBXK4bjbJbqSTw7UZL+izaSB+t9vk3x8FM3PNp9Wd17t6B1kSHe2FUwKGcid43pGoYXD2x0SyShzoxbVjRjY/tw8UDi5Gqi2I2iN74kXXhKQbG0zajoV2sVHtLP2EB7enbO5QxuIwLwOKPD/R2/38B/7bwfErU0zi3TdFMfrUid5TVLkz7E9oQ1OPLvzt8iIAqtalvO0vHP+BVvDXnAZHXC4wSaMlJNGXRMYFyAIrllLm6hqAbCl1h2rPOHD4/edxFpRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 19:36:25 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 19:36:25 +0000
Date: Thu, 26 Feb 2026 11:36:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <francois.dugast@intel.com>
Subject: Re: [PATCH v4 00/12] Fine grained fault locking, threaded prefetch,
 storm cache
Message-ID: <aaCgtYQNFYLnvZoR@lstrano-desk.jf.intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <e967bf81cd917fa3086568458cd9100a4528517a.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e967bf81cd917fa3086568458cd9100a4528517a.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0197.namprd04.prod.outlook.com
 (2603:10b6:303:86::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc6ffdf-7481-4659-b7f3-08de756e53f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 4eMpPxc2k0N2Y0/uMDYcH2fMKD2sYG1qJInGvWPBIAb3SFrGWEflzr4P1QNZs/PK7mMXLnboJR4GbGcyQZ1EnapdWkqtBAmnLi8YNwCQW+vScqk9fWJeAc2LPr/7txr/W6sTDHUu2F6/HYjxVp8NwuQeEakQ6d4xBe4VBFIZ0VeHHmakozMeBqIodFR7SAr1ucSri2viRkvLmhZw5stbmZnzh6Jmle0j867vAp1df8mzWrpRxWPfzznbwaCRA88bGoOcxGPThmntY+vH9IXJuacJrLpudMkUe96/9IJ3evcFNzN+ejJFeInXXfUSREv9dBunRegG76U5P2fQpF/76xO1CgN7kmRUSpZvRiqt3berRS7WinBkpxeIe5T2n9nFD0Ewvd7m6C1gaN0pWdrZBLCQ26cJYwdsrRiqBqiPp5cpxd9kwQQrmzVcKXMCDVrPqXF/oQeY6dw48KyF9CIXoKyIsh8LD922KFsyvZMj3bzyr3wG85K4jjMK0iprANWUK+N3BkqALixqgnvtri74A3MSKiJrDuDUETp6LSrxQIRNgh85jn/47HLSYxFyzPo0+utjakCxhzrwq9J/eIJqnQb5bIiI+RZOVTe8nDCJBDyC49PRVYpIVspGcYQdxmFyOjXX5oxciBOtirDthsv0DM1Fu+mmwJeUlH89fnhJJGPRz5jgctVmioy23WdZS1L9vnm2nI/BW+hjTAE8sMA//muLPnvVN+e+wb82zED2XgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkJOWlFrZGJuWVpaOVpqRlA4OE1UcGtUdndPbEI4ajBuTmt5SWpHaVlCM0s4?=
 =?utf-8?B?UEFwUWkxdE44MjhYSjdWQzZNYVI4L2VmN3dKY2tscU4xQ3Avckx6V1E2OFVT?=
 =?utf-8?B?Yk5Tb2RkUDZwWk5mTnJMWlQxQzJ5aXBZK0hWSmo3Y0tPVzlaQnVUbk1WT3lH?=
 =?utf-8?B?bjU5dXR2MTRlQ1B5TzFQdFZoRm54NWJ5V1I4Zm5hUnEzQmVoUk9adE80RW4y?=
 =?utf-8?B?b2htOFdjTWdBcWtTQ1NuVUZJbEYxd1VIK0drYXljVC9rVTlIb3oxVWZoaytE?=
 =?utf-8?B?ZjE1MDJGMG00VFdZazRTS2htZTdSWU5HeGxZTlBLSDdnNGc3UFZNRTFvL2Va?=
 =?utf-8?B?S0FJVFpvQW83UXBSUks4bHhuSmJCeUtkNUdkMllxWWFmSWFmSmFBK2luZitp?=
 =?utf-8?B?djNQS1VIcERWLzJYYllKTnRqTnJiQ1lSa2FVclhtOXczK0M5YTV3Z29Jc3dh?=
 =?utf-8?B?cHBkZGxBSGV2MTQzbDZqeER1SjMxUEVaTmdQUmo5STVxeVFFRXRXVmxOZmlJ?=
 =?utf-8?B?c0Z3b29NTmpZd2UxRm5EV3hweGtNZHlycGxEb3JVbDJDMzhUZU1oTFdwdzFu?=
 =?utf-8?B?Ujk2aDdTRkhiQ05PSE9lRlVXb1MwbXhpWTFOZ3BLeGd1WU5jRTF4V2lMOERT?=
 =?utf-8?B?Y3JBRmRFL1BMTFJBUHIvNHNkWHpreG5PV1ExRkV3UVFrQTkyaWM5WXF2ZlZv?=
 =?utf-8?B?djZDSnJ3QkZpdlFWWFB0bjVING1pNGorTHdrSkl0M0FpZlIveXg3WXgzSDFn?=
 =?utf-8?B?R0hKdW1udGNqcG8xUnNNMWJmb1VwYVRTeTRCdFo5blp4bVFzdW1acmF0REI0?=
 =?utf-8?B?aVplL09oUXNUZ2x5NUpjc3Z2bUx2TmhnNXBQU3crZThWQStjL0xkd3RBcmVW?=
 =?utf-8?B?N3dEakZsZ1hSajJ0UVlBTFJuQjZPSU1xdEtnL3Q3NE1iUzhTZitKUFRWeCsv?=
 =?utf-8?B?SHFwa3N2MjZ4UFZiSHNMWU5Hd3NraFlUY21KNmF3eGZsMmRLMWo0cGR6M24w?=
 =?utf-8?B?dFRQb2xPQ2gzUGprYWZnektMNjY3b3BNWnRpSWV4Y0RZa0FRSjhGd0pCdDhC?=
 =?utf-8?B?V2MvdzdQTWNHRDRGeTJqQU4yL1hmZ1d4OEJGeXNEV0Z4ckp4dnhnTVp0UVo4?=
 =?utf-8?B?djBLbi83M3J1RHZGUHI0SzY2WEM4WUg4UTZHbTZqdHdwakNtZHh5aWlVMEdZ?=
 =?utf-8?B?Sy9CdVdkVmFYbmZCRDRUNG52eFF6S0RTdlVGTk5XT0JKNVB4eUEyMm9IbVV3?=
 =?utf-8?B?VVo5VWpVVHJoT0UxcHFwdDZGUGdPamJNUUtSNWFjNk0vSFA3ZEdTTy94TVk2?=
 =?utf-8?B?WXUvNVVZdHM3SDBqQVl3dG9KTHNKYzVLdkhDM2FkNHFldkdDK0lFSlpacTZs?=
 =?utf-8?B?VHhEdkJqN0xROXZDUjNweGhuU1Y1Z3Nnc1lDYXZBSCs1YXVMQjZZaTdtL1hn?=
 =?utf-8?B?UHlSbDA5ejdsU2p0Nlgrem1Ib1BEZ2xObjZRdEtxVUtNZkFZU3NESk5kZFFV?=
 =?utf-8?B?S3dKRmJlTEd0UFNZNTQ3VnowOVRBRDF4REozMmFycnhYYVBXaER2d3hPekhU?=
 =?utf-8?B?dUhndTZ0Y1puTWRXSnJtK1ZCbUcvS2N6Szd1dnZaek9IMUFkWjNXR0VRRzVz?=
 =?utf-8?B?RFhWeEp3SzYyUjkzRTBLd0Fub3VGeVlOMS9FTjgrUEdmSW83MHh1VDlrRG5i?=
 =?utf-8?B?VUxrMkI0dUZxNHg1NTBvd1BzSGpQR2hvSVZWTjdsNkNWYVgxL3Y1RWlHT0ZD?=
 =?utf-8?B?clRQMkZ6ck1lRzlUZHV1SFM2cC9nT1hySTA2Y1I4N25xZGhzeFBmeUFkc01C?=
 =?utf-8?B?WHhFOWUvdDgreWVvbGRhSHNYNW9DWHRtUEw2QkZNVzQ0VXlQbDROa0FLOGE3?=
 =?utf-8?B?RURSV3BpZ2tDZ1ErYnF4MzVXb3lGeG9MK09TMFgvK3NSeWJYaTlxd21yWWdt?=
 =?utf-8?B?WHhNWXBNQkUvdzNUajdtM3d5RkpPR3JYT1gvOEFWakhUTkpSZVZhWDcrbytC?=
 =?utf-8?B?ZWZZQkt5ekgxNHBUN0JhVC9nVmxCbUpyY1dLT2VGWkFLam5uQmdFR25XTVF5?=
 =?utf-8?B?TmRBRy83bWh4V0VzZXJqU05EOERPQzQ2MDdUOWtROUx3bXBVVFV4RVVXVWg2?=
 =?utf-8?B?dzg4OW9mckZqYzUvU09acXlWWmFuSXI0elA1VU9lWW9QU0RpS2I3UUZrMXJF?=
 =?utf-8?B?RnpNUmpPY2Q3emJmQ1dIUythMVB2UjdHdXZOYm00THpCWis5eHEvdHFYN3FC?=
 =?utf-8?B?MWFqWHhYV1VCN3pPeEFpVEtwQlhMelIwcXBYTCtSak95eWdjd0dJamlWRkZ6?=
 =?utf-8?B?REZKTzBoL0EzaUlaeGU3eVI1SDBPL2NJM0paMHliNjZGdUpNekRmQjZPTUdp?=
 =?utf-8?Q?zmzBdNV8Ha9kw0eY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc6ffdf-7481-4659-b7f3-08de756e53f7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 19:36:25.1364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pWyB7lxOwJnPYqN09LktG5molY3vwMdhK/wyh3jCsRMBYFR80BhgcoJz6JUUCTjdKwCGPptEXscaX5ZLwAtUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
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

On Thu, Feb 26, 2026 at 02:43:29PM +0100, Thomas Hellström wrote:
> Hi, Matt.
> 
> On Wed, 2026-02-25 at 20:28 -0800, Matthew Brost wrote:
> > Fine-grained fault locking provides immediate benefits: it allows
> > page
> > faults from the same VM to be processed in parallel (unless they
> > target
> > the same range) and enables a sane multi-threaded prefetch
> > implementation. UMD prefetch benchmarks see 10% to 50% improvement in
> > prefetch performance on BMG depending on PCIe bus speed.
> > 
> > Once parallel fault processing is available, the pagefault queue can
> > be
> > unified into a single queue with multiple workers pulling faults to
> > process. A single queue then allows a sensible pagefault cache to be
> > implemented, so that multiple faults targeting the same region can be
> > batched together and acknowledged in, ideally, a single pass. This
> > saves
> > CPU cycles during pagefault handling and improves overall throughput
> > of
> > the fault handler.
> > 
> > Significant improvements in UMD pagefault benchmarks can be seen when
> > utilizing this caching.
> > 
> > v3:
> >  - Fix kunit build (CI)
> > v4:
> >  - Actually fix kunit build (CI)
> > 
> > Matt
> > 
> > Matthew Brost (12):
> >   drm/xe: Fine grained page fault locking
> >   drm/xe: Allow prefetch-only VM bind IOCTLs to use VM read lock
> >   drm/xe: Thread prefetch of SVM ranges
> >   drm/xe: Use a single page-fault queue with multiple workers
> >   drm/xe: Add num_pf_work modparam
> >   drm/xe: Engine class and instance into a u8
> >   drm/xe: Track pagefault worker runtime
> >   drm/xe: Chain page faults via queue-resident cache to avoid fault
> >     storms
> >   drm/xe: Add pagefault chaining stats
> >   drm/xe: Add debugfs pagefault_info
> >   drm/xe: batch CT pagefault acks with periodic flush
> >   drm/xe: Track parallel page fault activity in GT stats
> > 
> >  drivers/gpu/drm/drm_gpusvm.c            |   2 +-
> >  drivers/gpu/drm/xe/xe_debugfs.c         |  11 +
> >  drivers/gpu/drm/xe/xe_defaults.h        |   1 +
> >  drivers/gpu/drm/xe/xe_device.c          |  17 +-
> >  drivers/gpu/drm/xe/xe_device_types.h    |  17 +-
> >  drivers/gpu/drm/xe/xe_gt_stats.c        |   7 +
> >  drivers/gpu/drm/xe/xe_gt_stats_types.h  |   7 +
> >  drivers/gpu/drm/xe/xe_guc_ct.c          |  94 +++-
> >  drivers/gpu/drm/xe/xe_guc_ct.h          |  35 +-
> >  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  35 +-
> >  drivers/gpu/drm/xe/xe_guc_types.h       |   6 +
> >  drivers/gpu/drm/xe/xe_module.c          |   4 +
> >  drivers/gpu/drm/xe/xe_module.h          |   1 +
> >  drivers/gpu/drm/xe/xe_pagefault.c       | 675 ++++++++++++++++++++--
> > --
> >  drivers/gpu/drm/xe/xe_pagefault.h       |  74 +++
> >  drivers/gpu/drm/xe/xe_pagefault_types.h | 109 +++-
> >  drivers/gpu/drm/xe/xe_svm.c             | 129 +++--
> >  drivers/gpu/drm/xe/xe_svm.h             |  59 ++-
> >  drivers/gpu/drm/xe/xe_userptr.c         |  20 +-
> >  drivers/gpu/drm/xe/xe_vm.c              | 215 ++++++--
> >  drivers/gpu/drm/xe/xe_vm_types.h        |  37 +-
> >  21 files changed, 1309 insertions(+), 246 deletions(-)
> 
> Before I get to reviewing this, some suggestions from Claude:
> 
>   Confirmed regressions (3 commits with issues):
> 
>   c664c1b91090 — Fine grained page fault locking
> 
>    - Reference leak in vm_bind_ioctl_ops_create (xe_vm.c). 
>   xe_svm_range_find_or_insert() was changed to take a reference, but
> two paths
>    don't put it: (1) when xe_svm_range_validate() returns true → goto 
>   check_next_range, and (2) when xa_alloc() fails → goto
> unwind_prefetch_ops. 
>   The validate path is on every prefetch of an already-populated range,
> so 
>   refcounts grow unbounded.
>

Indeed. Will fix.

>   80012f80c75f — Chain page faults
> 
>    - Commit message typos only: "samr ASID" → "same ASID", "IRQ pathd"
> → "IRQ 
>   paths". No code issues.
>

Yes.

>   569104fb76ed — batch CT pagefault acks with periodic flush
> 
>    - Off-by-one in flush period: guc_ack_fault_begin initialises 

This is pretty good, caught this one myself after posting.

I'm convinced everyone should use Claude as a spot check before posting.

>   pagefault_ack_counter to PERIOD - 2 = 14, but the comment says first
> flush 
>   should be at ack #2. With counter=14 the first flush fires at ack #3 
>   (counter hits 16, 16&15==0). Fix: = XE_GUC_PAGEFAULT_FLUSH_PERIOD -
> 1.
>    - Commit message typo: "Assistent-by" → "Assisted-by".

Yes.

Matt

> 
> /Thomas
> 
> 
> 
