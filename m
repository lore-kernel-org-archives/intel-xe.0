Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204B8CAC5A7
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 16:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D012910E94E;
	Thu, 25 Sep 2025 16:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPpob1r5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0172010E94E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758819374; x=1790355374;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uJqLY1VginO2Llsm6ReMx8GPnBPEwPYAXKrx6V2SFTs=;
 b=mPpob1r5nuZrMNFHbKGXWaBG/8LWXEEX92XiODnOMgynoEy6NgCSf1Nc
 R/oWLvvqf+YCki5sv9AShkQZgjj1nvbqNzI/200ezrSOc+DfNsqU1D3rO
 yPXmSVUiT7MVi9TN2UyLGkMoEh1Z4R1jcarNmAoN3QfR0GUYGIxwClGet
 aB3qlg4n5jWnz2zFTMAZUIxRe2F9dqQ9KhxlZP5R1YdaqN83gAfLzF2Qq
 4gIYeFeCOCerAfLTMFgA4G32okKfxutjHVJPQZpGZnLWz7cC6MR3pell3
 2ZIZG0gSWYPhhEmO4kiAwvBCi9ip3i80ROBmxeWO3AA60XNrV+S0ijqEl Q==;
X-CSE-ConnectionGUID: JGcpAPVeT2ydS4DDKDOlLg==
X-CSE-MsgGUID: Jo+oNXY4SvuGkZsqVLFyfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61198780"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="61198780"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 09:56:13 -0700
X-CSE-ConnectionGUID: DtPZJRqARbKAJ3bI5y24xw==
X-CSE-MsgGUID: eySaWB5lS72SZuMro06HjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="177441418"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 09:56:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 09:56:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 09:56:11 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 09:56:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBQuS1SYGySPNgLlHToxFWkmiySKEOlK0DNDSzvw6vDs4E1HszaaL3o5l2RjeSIrHWwqkFuAr+3ttlKTanGlWMd+is5BjgZJV3f5/g2SJNufmqu1pGY5+ORe92ejj4RhsoTayo6/nXaEUGegLJ4mGBvAocBj3qDrHcoxTuVX4KM2NfN6HnIgD0GHBe9tnA2kpd4JJZQXGcnAoWmXUPXD6aq+y1rIZ/tOGYsI+z0Srij8bbVBuJ4sXzwf8omCiORYVml0fwNoraTVUEO0R0cLM5CAfPfFdKAIGL9Lzr+INyUxCCL24n5FN9ycX268XD+1khpO3r6vRZz7aU4qkMUT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fgox/2KpvzUAP9h8H7VAxSUUgPnVy/5Yu+q6+TCLow=;
 b=KoJMqAlaks6xEDywVXuCeubDwAuTnpdc8jtd5pdgAZd6oLCRzIDDeIr5UVDxMHnLWPy788G2zLq4AB/Lgf8vzU07kujWhAk7pFzI1R7Vwa/B9r6204+iKb984jIkKQOb0EJYv+7QR5zEJ5QpHhRfcpZAiKl/eRpdhTzrTVdICe4DlR7g3BFK4U/q6I9BD6nVs9QqKspRir13ku+P3rLVPVtbs/hcWBGDrat1lEtlZhCnuQ13kuVDds3wrt6luyjuT/rPHrKjmG5XB9yZocDcgYRfagsAKvZ9d0bwPtbOu4CZZNAkDpmLTtQOgsZWyOSHdFetIa1D8A70M+moznyjtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 16:56:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 16:56:09 +0000
Date: Thu, 25 Sep 2025 09:56:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 12/34] drm/xe/vf: Make VF recovery run on per-GT worker
Message-ID: <aNV0Jvu+MbpqAuxN@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-13-matthew.brost@intel.com>
 <55c5e870-6823-4fb3-80ab-0e6914d054d2@intel.com>
 <aNRLmmK5yqXa3xNb@lstrano-desk.jf.intel.com>
 <dab8b427-41eb-46b2-929d-436b3866b7b5@intel.com>
 <aNRWIi9MqEghc4gM@lstrano-desk.jf.intel.com>
 <2adb41bd-cbd1-4df8-8f75-eb861f8c1e7a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2adb41bd-cbd1-4df8-8f75-eb861f8c1e7a@intel.com>
X-ClientProxiedBy: MW4PR04CA0373.namprd04.prod.outlook.com
 (2603:10b6:303:81::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 78bc499c-64fe-4116-088b-08ddfc546ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GonLOdSMlakQgMnXjyKRAmOlWLxSUgFXNTVfO8LXUW1iu5caANcJ5EBChf0P?=
 =?us-ascii?Q?069a4LTbRc+PZevd//FqsEb7BNTpIhoZZp8+AslkwMSun8gFdT3LDkOhDiVC?=
 =?us-ascii?Q?EW3B8yGWwI74Hu9kbXq35lQAD+O+aT+ObP/Re8Zvvx/XZC5Ziw1cY27p38qW?=
 =?us-ascii?Q?x2gkM37G9kFteobNf591S0dcwtJZhune/i2ZmWFznPOIGJTFMaDIZZe4lNw/?=
 =?us-ascii?Q?g5C9Jrk4POXIAnlyuRFXKo7Meo4Bg80KOuyvHKt3THXqFbLKmFM94d5QnVLU?=
 =?us-ascii?Q?617Qc7sjbs0y58IURMcvTlPYMssHSJ4Y/ZVP9Bj9qCQ/jevqlyL0jOCkmFT9?=
 =?us-ascii?Q?7+Rg+slweIoWVTrESQPv/nagrsM6eKx7Bp3rIOVpeWyZuNnTcLHdzXplVBJT?=
 =?us-ascii?Q?ZQ6obHqNDIlw9ojwDDXnmQekslkMKwh+huikG/WN9+LUpmdSD/p311oPMGok?=
 =?us-ascii?Q?GuH8dNRT0XeaYIB1Xjv50QVGEo+ZHK05tG/wF9zVQJGA3/wPCijhnBWLoz6n?=
 =?us-ascii?Q?pHunGhAnk1PvIseCruAccesLoRUN4ZMPj4iIjxczS8oMi5j1r1Or0NtcPgJb?=
 =?us-ascii?Q?3S2zcWs/beGwr/+WyCGOgqkmMSwJAYYm6sk+db1MlGmUoQUalfkv5jEoUwtB?=
 =?us-ascii?Q?jl6B+Sy3gEWFCT5jMc1u++WMfolOAiWwE7MKsV27m0DTpvH+DBng28deT2lT?=
 =?us-ascii?Q?4sCzRsi50Z/oknT8s3zoq3G0OUuaddgytvhzbAJFZZKEdb+97IXn1FSq2VLk?=
 =?us-ascii?Q?aMcUKHWDHumL4eUZEr9tRJJWEpZWLIf5+jZu7P18ttM9BSMajyPnCe/EJ+5i?=
 =?us-ascii?Q?urZmodh8H91FPq4WglPIty1lx0ohwA/vBH8iPKHGFc4eN7qkAwR+i1WlWcSk?=
 =?us-ascii?Q?M9BeZOSvtCMKy3GlmW2qdRA28MGgZ3oz4GcnTu7UKr912F2wnddJVK8vHt0L?=
 =?us-ascii?Q?2au/0235/wyOm5hakfHdKg696YsbqNpwB4Kym7Ds++PZG2u0ZDp4BUs/FD3D?=
 =?us-ascii?Q?3tUk5zFSfsIkjD5IgSTZ+7QolTzrbF7kUPZXp1vN+mc4nvZxuHURnKZJcBp+?=
 =?us-ascii?Q?sgYNxRoXwnCfO2G5xM89DpXe3pcxVFfd3VIIWwedG/Yv+bS58c/ATPNaa/qQ?=
 =?us-ascii?Q?vBuHWrQgElcl97/4L7k/dO7YCSCJoVWlIsiaBwFkZATLHcjxCxE5y0CsQu87?=
 =?us-ascii?Q?XJrQsA4AOVfIgr/HnuLC3khrwU/dLP49af88BuRZzNlsJ5CTJifftWc/Sba0?=
 =?us-ascii?Q?+xO9NKJA1RoZgHQNdUjqV53QQMbTcXPuNUkxY8J2OUkcLvhUade99Nz5t+LP?=
 =?us-ascii?Q?NyIxDdMvFcnDIoHRKhpNyJp7ypuA4dRK4WXm3V3cQojmoEVkoK9sddvnVyhY?=
 =?us-ascii?Q?8YN6x29EKoUNJi1VdOE+mPm7I4k8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mZBD0C+VkouCr4tmlEnpRXOHl8Q6z0cK4yMzfnQmableB/zUtjP3ZEbQ5ZIQ?=
 =?us-ascii?Q?Bhm09GJ4J7/u1XXRIGpu60pnbaOCXWBGrU/wFpX8Oh4HJVvIu11zY12jwM8i?=
 =?us-ascii?Q?4CxZB08DDEIrO93Rv6EYTocXTUrFXrnGGHRgplhCdxChwopG//HSGZSLJaCg?=
 =?us-ascii?Q?WGxE84vhUWy7FFpY0p5G65SV+cWBdy1hYArHrXGU1gjFrusOwN0lLIONOG1/?=
 =?us-ascii?Q?2gMm/ipOFIyIbMhV+0obCOwpy0dNuxXS0p9B4p5bWV7xpfhfGJVe30UttcNb?=
 =?us-ascii?Q?KrMHZILwe5b83ZbUbQ4My7PfQbSUt4kv4PeNJwVXrz2nDhi8PGGpLbsrue66?=
 =?us-ascii?Q?dbIwv2dPbpYPT8J+W3EeC0r0qo3S9GxBj8P9N0ohOHM6biQgk04poW7RMzjm?=
 =?us-ascii?Q?35U921cdimbf07F5s8EGmqITGMbfT2NrVqHmGXkUvKq+gdcSc9envgKNGYXO?=
 =?us-ascii?Q?uqYH7fWLkGaWa4qUtrdZztMNe6jA09saAGG/r2dKUdG0nrIjxR8U2VlVWxxu?=
 =?us-ascii?Q?ANnbuJgmm3u5gScev59+mb47unmRW9aVGgVv6JSzGKnTByrrOPxQJeJmMtht?=
 =?us-ascii?Q?pCtL5D9A6YKhl1AazjfffwUWeLm5ibxFFEMtZNZD4hMBIW/oikGeGsd7dbcf?=
 =?us-ascii?Q?OSToiVyeHQZsZKQ3DiI0Kaz37C2roVpyqJ6mr73qyAPOTjSyDn0WvR8Meqz2?=
 =?us-ascii?Q?+nPoW2FVYdlEVpRBubyiz4Mi/dtfufU15kS1PoPKSiajZzT0XwHVUco/o2B1?=
 =?us-ascii?Q?ZpD+oE7I42UkymgESTscyjy6KxdsWGehBWvXO4cd980w9rYN5oZL+Jx9Jzin?=
 =?us-ascii?Q?Fxtn0wh/FVof6EV6FJ2+20nYncNtpvPE4rLz7BWcewi8Fki/dSj/uXpFL/LJ?=
 =?us-ascii?Q?kgD3cMxHmpmMqzzLncBqml2pbO4369auVz809FUjcGdQ3qo30CPrE7EBzepj?=
 =?us-ascii?Q?C3mKn8FXA/13k03J3e4s+CCjt4CxX9xFW8MXQNcTfVxzZEAxQ3IOEBIiA2+u?=
 =?us-ascii?Q?R8ECoX4x8CUL/lNki7EImnsBz7c2xxS3HO70S3KFhd5dxLfqFSQrg8kYS1/B?=
 =?us-ascii?Q?vMUNIfyEYp/brPxS8Wih6IoGwL+/NIKTupQ6DHUoBCIdJ26DxCMsDvmLkWjr?=
 =?us-ascii?Q?wYW06iXM38lLGEOp9bLVY/PC6GhWSPm88LfMoINXbnkQmKBp0rCHf54bcB/Q?=
 =?us-ascii?Q?CqOIEnNIeuA90riQlFyx+47NQX6Sx3td5qcXGRfR94FEt0uZnc8DeJkvbuwJ?=
 =?us-ascii?Q?cAZRmJ1v/et3TfTa9I0JpqE/5ggAlbdb/xgGEQfgA7NnSsytlrjbu3Cj6DtM?=
 =?us-ascii?Q?1QEaboulSyNE3uR+pXC+LZjTq2X4MIg47g2S9WYEgygXx1bqjwZucJ19Kjlo?=
 =?us-ascii?Q?9j+LgK3KTmNs0C3XPqYaBtFG8uy1j2gDSZ+NToB6vtHQmhEC4QnzdTqICYL3?=
 =?us-ascii?Q?j/QkkccBB/w6y1AFsWIuM+LOs8+EcX75XnRfy5FQKIFOiWeEou0B/aRVZhXb?=
 =?us-ascii?Q?IIppwWh4oF5TT5re+RYgjtXSnODIpG8YvkCrWh8fZYMFE8Kl2atI9lO07kH/?=
 =?us-ascii?Q?xCIP5vK/hCyVeVwCXZNq+R7Ln9/O1vZ+dysvbHc6gNWqmc86bBq1mLFywKx1?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bc499c-64fe-4116-088b-08ddfc546ce0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 16:56:09.2104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1l4G9raweUjtL0Ikq/qpJNUvTpJxmQqfuygaq77e8UYv+plYABwjTqEPXifltZXBh2h1ElYf+VjHYrYJKRIZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7038
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

On Thu, Sep 25, 2025 at 06:27:55PM +0200, Lis, Tomasz wrote:
> 
> On 9/24/2025 10:35 PM, Matthew Brost wrote:
> > On Wed, Sep 24, 2025 at 10:21:32PM +0200, Michal Wajdeczko wrote:
> > > 
> > > On 9/24/2025 9:50 PM, Matthew Brost wrote:
> > > > On Wed, Sep 24, 2025 at 12:49:25PM +0200, Michal Wajdeczko wrote:
> > > > > 
> > > > > On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > > > > > VF recovery is a per-GT operation, so it makes sense to isolate it to a
> > > > > that was also my suggestion to make it per-GT, good to see it happen now
> > > > > 
> > > > +1
> > > > 
> > > > > > per-GT queue. Scheduling this operation on the same worker as the GT
> > > > > > reset and TDR not only aligns with this design but also helps avoid race
> > > > > > conditions, as those operations can also modify the queue state.
> > > > > but while the recovery is per-GT, we should still protect against that
> > > > > one GT starts the recovery sooner then other GTs notice about it
> > > > > 
> > > > Yes. There is shared state in 2 places:
> > > > 
> > > >   - The GGTT shifting, this handled by [1] in my series.
> > > >   - CCS restore on iGPU (PTL) handled by [2] [3] in my series.
> > > > 
> > > > [1] https://patchwork.freedesktop.org/patch/676394/?series=154627&rev=2
> > > > [2] https://patchwork.freedesktop.org/patch/676393/?series=154627&rev=2
> > > > [3] https://patchwork.freedesktop.org/patch/676397/?series=154627&rev=2
> > > > 
> > > > > > v2:
> > > > > >   - Fix lockdep splat (Adam)
> > > > > >   - Use xe_sriov_vf_migration_supported helper
> > > > > > 
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 170 ++++++++++++++-
> > > > > >   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +-
> > > > > >   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   7 +
> > > > > >   drivers/gpu/drm/xe/xe_sriov_vf.c          | 242 +---------------------
> > > > > >   drivers/gpu/drm/xe/xe_sriov_vf.h          |   1 -
> > > > > >   drivers/gpu/drm/xe/xe_sriov_vf_types.h    |   4 -
> > > > > >   6 files changed, 169 insertions(+), 258 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > > > > index c9d0e32e7a15..cfb71b749e52 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > > > > > @@ -25,11 +25,15 @@
> > > > > >   #include "xe_guc.h"
> > > > > >   #include "xe_guc_hxg_helpers.h"
> > > > > >   #include "xe_guc_relay.h"
> > > > > > +#include "xe_guc_submit.h"
> > > > > > +#include "xe_irq.h"
> > > > > >   #include "xe_lrc.h"
> > > > > >   #include "xe_memirq.h"
> > > > > >   #include "xe_mmio.h"
> > > > > > +#include "xe_pm.h"
> > > > > >   #include "xe_sriov.h"
> > > > > >   #include "xe_sriov_vf.h"
> > > > > > +#include "xe_tile_sriov_vf.h"
> > > > > >   #include "xe_uc_fw.h"
> > > > > >   #include "xe_wopcm.h"
> > > > > > @@ -314,7 +318,7 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> > > > > >    * Returns: 0 if the operation completed successfully, or a negative error
> > > > > >    * code otherwise.
> > > > > >    */
> > > > > > -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
> > > > > > +static int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
> > > > > >   {
> > > > > >   	struct xe_guc *guc = &gt->uc.guc;
> > > > > >   	int err;
> > > > > > @@ -808,7 +812,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
> > > > > >    * xe_gt_sriov_vf_default_lrcs_hwsp_rebase - Update GGTT references in HWSP of default LRCs.
> > > > > >    * @gt: the &xe_gt struct instance
> > > > > >    */
> > > > > > -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> > > > > > +static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> > > > > >   {
> > > > > >   	struct xe_hw_engine *hwe;
> > > > > >   	enum xe_hw_engine_id id;
> > > > > > @@ -817,6 +821,26 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> > > > > >   		xe_default_lrc_update_memirq_regs_with_address(hwe);
> > > > > >   }
> > > > > > +static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)
> > > > > nit: if this is static then could be just:
> > > > > 
> > > > > 	vf_start_migration_recovery(gt)
> > > > > 
> > > > Sure.
> > > > 
> > > > > > +{
> > > > > > +	bool started;
> > > > > > +
> > > > > > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > > > > > +
> > > > > > +	spin_lock(&gt->sriov.vf.migration.lock);
> > > > > > +
> > > > > > +	if (!gt->sriov.vf.migration.recovery_queued) {
> > > > > > +		gt->sriov.vf.migration.recovery_queued = true;
> > > > > > +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> > > > > > +
> > > > > > +		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
> > > > > > +		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> > > > > > +				 "scheduled" : "already in progress");
> > > > > with this .recovery_queued flag, can we hit "already in progress" case?
> > > > > 
> > > > This was existing code so kept it but I'm really unclear how we can get
> > > I can't find "recovery_queued" flag in upstream code
> > > 
> > This is akin to comment in upstream code. Again, I'm not really
> > convienced this is something we need to handle as I suspect this is not
> > possible.
> > 
> > /* skip asking GuC for RESFIX exit if new recovery request arrived */
> 
> Second migration could happen while `recovery_queued` is set, I don't see
> why not. Migration could happen at any point.
> 
> Interrupts tend to be treated with priority compared to workers, so if
> migration will happen in that short period, this can and will be hit.
> 

I was made aware how this can occur late yesterday.

> For the code near "/* skip asking GuC for RESFIX exit if new recovery
> request arrived */" - while its days are numbered, let's leave this method
> of double migration support for this series. We will later switch to an

Ok, 'migration.recovery_queued' implements the same functionality as in
the upstream code.

> improved double migration support, but that depends on GuC version and
> should be developed and tested separately.
>

Yes, I am aware of this upcoming change too. I agree this is better
solution as 'migration.recovery_queued' or upstream version which does
the same thing tries hard to not race but it is basically impossible to
seal that race without ridiculous locking which I chose not to implement
in this series. I suggest we leave 'migration.recovery_queued' as in
this series and remove once proper GuC support lands.

Matt
 
> -Tomasz
> 
> > 
> > > > multiple resfix IRQs without the prior resfix flow being completed.
> > > > Maybe Tomasz can clear this one up? Ideally I'd like to remove multiple
> > > > resfix IRQ handled code if this is not possible.
> > > > 
> > > > > > +	}
> > > > > > +
> > > > > > +	spin_unlock(&gt->sriov.vf.migration.lock);
> > > > > > +}
> > > > > > +
> > > > > >   /**
> > > > > >    * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
> > > > > >    *   or just mark that a GuC is ready for it.
> > > > > > @@ -831,15 +855,8 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
> > > > > >   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> > > > > >   	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
> > > > > > -	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
> > > > > > -	/*
> > > > > > -	 * We need to be certain that if all flags were set, at least one
> > > > > > -	 * thread will notice that and schedule the recovery.
> > > > > > -	 */
> > > > > > -	smp_mb__after_atomic();
> > > > > > -
> > > > > >   	xe_gt_sriov_info(gt, "ready for recovery after migration\n");
> > > > > > -	xe_sriov_vf_start_migration_recovery(xe);
> > > > > > +	xe_gt_sriov_vf_start_migration_recovery(gt);
> > > > > >   }
> > > > > >   static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
> > > > > > @@ -1175,6 +1192,139 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
> > > > > >   		   pf_version->major, pf_version->minor);
> > > > > >   }
> > > > > > +static void vf_post_migration_shutdown(struct xe_gt *gt)
> > > > > > +{
> > > > > > +	int ret = 0;
> > > > > > +
> > > > > > +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> > > > > > +	gt->sriov.vf.migration.recovery_queued = false;
> > > > > > +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> > > > > > +
> > > > > > +	xe_guc_submit_pause(&gt->uc.guc);
> > > > > > +	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> > > > > this |= seem unneeded
> > > > > 
> > > > This is existing code copy / pasted and is removed in [4].
> > > > 
> > > > [4] https://patchwork.freedesktop.org/patch/676382/?series=154627&rev=2
> > > > 
> > > > > > +
> > > > > > +	if (ret)
> > > > > > +		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
> > > > > is this the only possible reason? maybe worth to add %pe ?
> > > > > 
> > > > Again this existing code and will be removed in [4].
> > > > 
> > > > So with above statements, I'd prefer just to leave as is.
> > > > 
> > > > > > +}
> > > > > > +
> > > > > > +static size_t post_migration_scratch_size(struct xe_device *xe)
> > > > > > +{
> > > > > > +	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
> > > > > > +}
> > > > > > +
> > > > > > +static int vf_post_migration_fixups(struct xe_gt *gt)
> > > > > > +{
> > > > > > +	s64 shift;
> > > > > > +	void *buf;
> > > > > > +	int err;
> > > > > > +
> > > > > > +	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
> > > > > > +	if (!buf)
> > > > > > +		return -ENOMEM;
> > > > > > +
> > > > > > +	err = xe_gt_sriov_vf_query_config(gt);
> > > > > > +	if (err)
> > > > > > +		goto out;
> > > > > > +
> > > > > > +	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> > > > > > +	if (shift) {
> > > > > > +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> > > > > > +		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> > > > > > +		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> > > > > > +		if (err)
> > > > > > +			goto out;
> > > > > > +	}
> > > > > > +
> > > > > > +out:
> > > > > > +	kfree(buf);
> > > > > > +	return err;
> > > > > > +}
> > > > > > +
> > > > > > +static void vf_post_migration_kickstart(struct xe_gt *gt)
> > > > > > +{
> > > > > > +	/*
> > > > > > +	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> > > > > > +	 * must be working at this point, since the recovery did started,
> > > > > > +	 * but the rest was not enabled using the procedure from spec.
> > > > > > +	 */
> > > > > > +	xe_irq_resume(gt_to_xe(gt));
> > > > > > +
> > > > > > +	xe_guc_submit_reset_unblock(&gt->uc.guc);
> > > > > > +	xe_guc_submit_unpause(&gt->uc.guc);
> > > > > > +}
> > > > > > +
> > > > > > +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> > > > > > +{
> > > > > > +	bool skip_resfix = false;
> > > > > > +
> > > > > > +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> > > > > > +	if (gt->sriov.vf.migration.recovery_queued) {
> > > > > > +		skip_resfix = true;
> > > > > > +		xe_gt_sriov_dbg(gt, "another recovery imminent, skipped some notifications\n");
> > > > > > +	} else {
> > > > > > +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> > > > > > +	}
> > > > > > +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> > > > > > +
> > > > > > +	return skip_resfix ? -EAGAIN : xe_gt_sriov_vf_notify_resfix_done(gt);
> > > > > nit: this looks cleaner:
> > > > > 
> > > > > 	if (skip_resfix)
> > > > > 		return -EAGAIN;
> > > > > 
> > > > > 	return xe_gt_sriov_vf_notify_resfix_done(gt);
> > > > > 
> > > > Sure.
> > > > 
> > > > > > +}
> > > > > > +
> > > > > > +static void vf_post_migration_recovery(struct xe_gt *gt)
> > > > > > +{
> > > > > > +	struct xe_device *xe = gt_to_xe(gt);
> > > > > > +	int err;
> > > > > > +
> > > > > > +	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
> > > > > > +
> > > > > > +	xe_pm_runtime_get(xe);
> > > > > > +	vf_post_migration_shutdown(gt);
> > > > > > +
> > > > > > +	if (!xe_sriov_vf_migration_supported(xe)) {
> > > > > > +		xe_gt_sriov_err(gt, "migration is not supported\n");
> > > > > > +		err = -ENOTRECOVERABLE;
> > > > > > +		goto fail;
> > > > > > +	}
> > > > > > +
> > > > > > +	err = vf_post_migration_fixups(gt);
> > > > > > +	if (err)
> > > > > > +		goto fail;
> > > > > > +
> > > > > > +	vf_post_migration_kickstart(gt);
> > > > > > +	err = vf_post_migration_notify_resfix_done(gt);
> > > > > > +	if (err && err != -EAGAIN)
> > > > > > +		goto fail;
> > > > > > +
> > > > > > +	xe_pm_runtime_put(xe);
> > > > > > +	xe_gt_sriov_notice(gt, "migration recovery ended\n");
> > > > > > +	return;
> > > > > > +fail:
> > > > > > +	xe_pm_runtime_put(xe);
> > > > > > +	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
> > > > > > +	xe_device_declare_wedged(xe);
> > > > > > +}
> > > > > > +
> > > > > > +static void migration_worker_func(struct work_struct *w)
> > > > > > +{
> > > > > > +	struct xe_gt *gt = container_of(w, struct xe_gt,
> > > > > > +					sriov.vf.migration.worker);
> > > > > > +
> > > > > > +	vf_post_migration_recovery(gt);
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
> > > > > > + * @gt: the &xe_gt
> > > > > > + */
> > > > > > +void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
> > > > > > +{
> > > > > > +	init_rwsem(&gt->sriov.vf.self_config.lock);
> > > > > > +	spin_lock_init(&gt->sriov.vf.migration.lock);
> > > > > > +	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> > > > > > +
> > > > > > +	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> > > > > > +		xe_gt_sriov_info(gt, "migration not supported by this module version\n");
> > > > > we likely don't want to repeat that message on every GT
> > > > > 
> > > > So move this to xe_sriov_vf_init_early?
> > > hmm, maybe it is even already there
> > > 
> > Let me check on that. Either way will remove this from the GT layer.
> > 
> > > > > > +}
> > > > > > +
> > > > > >   /**
> > > > > >    * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
> > > > > >    * @gt: the &xe_gt
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > > > > > index bb5f8eace19b..2ac6775b52f0 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > > > > > @@ -21,10 +21,9 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
> > > > > >   int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> > > > > >   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
> > > > > >   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> > > > > > -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
> > > > > > -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
> > > > > >   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> > > > > > +void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt);
> > > > > >   bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> > > > > >   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > > > > > index 7b10b8e1e10e..53680a2f188a 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > > > > > @@ -8,6 +8,7 @@
> > > > > >   #include <linux/rwsem.h>
> > > > > >   #include <linux/types.h>
> > > > > > +#include <linux/workqueue.h>
> > > > > >   #include "xe_uc_fw_types.h"
> > > > > >   /**
> > > > > > @@ -53,6 +54,12 @@ struct xe_gt_sriov_vf_runtime {
> > > > > >    * xe_gt_sriov_vf_migration - VF migration data.
> > > > > >    */
> > > > > >   struct xe_gt_sriov_vf_migration {
> > > > > > +	/** @migration: VF migration recovery worker */
> > > > > > +	struct work_struct worker;
> > > > > > +	/** @lock: Protects recovery_queued */
> > > > > > +	spinlock_t lock;
> > > > > > +	/** @recovery_queued: VF post migration recovery in queued */
> > > > > > +	bool recovery_queued;
> > > > > >   	/** @recovery_inprogress: VF post migration recovery in progress */
> > > > > >   	bool recovery_inprogress;
> > > > > >   };
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > > > > > index da064a1e7419..7d91553c4acc 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > > > > > @@ -6,21 +6,12 @@
> > > > > >   #include <drm/drm_debugfs.h>
> > > > > >   #include <drm/drm_managed.h>
> > > > > > -#include "xe_assert.h"
> > > > > > -#include "xe_device.h"
> > > > > >   #include "xe_gt.h"
> > > > > > -#include "xe_gt_sriov_printk.h"
> > > > > >   #include "xe_gt_sriov_vf.h"
> > > > > >   #include "xe_guc.h"
> > > > > > -#include "xe_guc_submit.h"
> > > > > > -#include "xe_irq.h"
> > > > > > -#include "xe_lrc.h"
> > > > > > -#include "xe_pm.h"
> > > > > > -#include "xe_sriov.h"
> > > > > >   #include "xe_sriov_printk.h"
> > > > > >   #include "xe_sriov_vf.h"
> > > > > >   #include "xe_sriov_vf_ccs.h"
> > > > > > -#include "xe_tile_sriov_vf.h"
> > > > > >   /**
> > > > > >    * DOC: VF restore procedure in PF KMD and VF KMD
> > > > > > @@ -158,8 +149,6 @@ static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
> > > > > >   	xe->sriov.vf.migration.enabled = false;
> > > > > >   }
> > > > > > -static void migration_worker_func(struct work_struct *w);
> > > > > > -
> > > > > >   static void vf_migration_init_early(struct xe_device *xe)
> > > > > >   {
> > > > > >   	/*
> > > > > > @@ -184,8 +173,6 @@ static void vf_migration_init_early(struct xe_device *xe)
> > > > > >   						    guc_version.major, guc_version.minor);
> > > > > >   	}
> > > > > > -	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
> > > > > > -
> > > > > >   	xe->sriov.vf.migration.enabled = true;
> > > > > >   	xe_sriov_dbg(xe, "migration support enabled\n");
> > > > > >   }
> > > > > > @@ -200,238 +187,11 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
> > > > > >   	unsigned int id;
> > > > > >   	for_each_gt(gt, xe, id)
> > > > > > -		init_rwsem(&gt->sriov.vf.self_config.lock);
> > > > > > +		xe_gt_sriov_vf_migration_init_early(gt);
> > > > > still, this should be called from gt_init_early kind of functions
> > > > > 
> > > > Kinda a nit that I'm not convinced is worth while to have
> > > > xe_sriov_vf_init_early and then xe_gt_sriov_vf_migration_init_early
> > > > called in gt_init_early...
> > > we have global xe level initialization, something like:
> > > 
> > > 	xe_device_init_early
> > > 		xe_sriov_vf_init_early
> > > 	xe_device_init
> > > 		xe_sriov_vf_init
> > > 
> > > then per-gt initialization, that follows the native flow, something like
> > > 
> > > 	xe_gt_init_early
> > > 		xe_gt_sriov_vf_init_early
> > > 			xe_gt_sriov_vf_migration_init_early
> > > 	xe_gt_init
> > > 		xe_gt_sriov_vf_init
> > > 			xe_gt_sriov_vf_migration_init
> > > 
> > > IMO we shouldn't jump in sriov code from xe level to gt level init on our own
> > > 
> > Ok, let me refactor this. Easy enough to do.
> > 
> > Matt
> > 
> > > > Matt
> > > > 
> > > > > >   	vf_migration_init_early(xe);
> > > > > >   }
> > > > > > -/**
> > > > > > - * vf_post_migration_shutdown - Stop the driver activities after VF migration.
> > > > > > - * @xe: the &xe_device struct instance
> > > > > > - *
> > > > > > - * After this VM is migrated and assigned to a new VF, it is running on a new
> > > > > > - * hardware, and therefore many hardware-dependent states and related structures
> > > > > > - * require fixups. Without fixups, the hardware cannot do any work, and therefore
> > > > > > - * all GPU pipelines are stalled.
> > > > > > - * Stop some of kernel activities to make the fixup process faster.
> > > > > > - */
> > > > > > -static void vf_post_migration_shutdown(struct xe_device *xe)
> > > > > > -{
> > > > > > -	struct xe_gt *gt;
> > > > > > -	unsigned int id;
> > > > > > -	int ret = 0;
> > > > > > -
> > > > > > -	for_each_gt(gt, xe, id) {
> > > > > > -		xe_guc_submit_pause(&gt->uc.guc);
> > > > > > -		ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> > > > > > -	}
> > > > > > -
> > > > > > -	if (ret)
> > > > > > -		drm_info(&xe->drm, "migration recovery encountered ongoing reset\n");
> > > > > > -}
> > > > > > -
> > > > > > -/**
> > > > > > - * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
> > > > > > - * @xe: the &xe_device struct instance
> > > > > > - *
> > > > > > - * After we have finished with all post-migration fixups, restart the driver
> > > > > > - * activities to continue feeding the GPU with workloads.
> > > > > > - */
> > > > > > -static void vf_post_migration_kickstart(struct xe_device *xe)
> > > > > > -{
> > > > > > -	struct xe_gt *gt;
> > > > > > -	unsigned int id;
> > > > > > -
> > > > > > -	/*
> > > > > > -	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> > > > > > -	 * must be working at this point, since the recovery did started,
> > > > > > -	 * but the rest was not enabled using the procedure from spec.
> > > > > > -	 */
> > > > > > -	xe_irq_resume(xe);
> > > > > > -
> > > > > > -	for_each_gt(gt, xe, id) {
> > > > > > -		xe_guc_submit_reset_unblock(&gt->uc.guc);
> > > > > > -		xe_guc_submit_unpause(&gt->uc.guc);
> > > > > > -	}
> > > > > > -}
> > > > > > -
> > > > > > -static bool gt_vf_post_migration_needed(struct xe_gt *gt)
> > > > > > -{
> > > > > > -	return test_bit(gt->info.id, &gt_to_xe(gt)->sriov.vf.migration.gt_flags);
> > > > > > -}
> > > > > > -
> > > > > > -/*
> > > > > > - * Notify GuCs marked in flags about resource fixups apply finished.
> > > > > > - * @xe: the &xe_device struct instance
> > > > > > - * @gt_flags: flags marking to which GTs the notification shall be sent
> > > > > > - */
> > > > > > -static int vf_post_migration_notify_resfix_done(struct xe_device *xe, unsigned long gt_flags)
> > > > > > -{
> > > > > > -	struct xe_gt *gt;
> > > > > > -	unsigned int id;
> > > > > > -	int err = 0;
> > > > > > -
> > > > > > -	for_each_gt(gt, xe, id) {
> > > > > > -		if (!test_bit(id, &gt_flags))
> > > > > > -			continue;
> > > > > > -		/* skip asking GuC for RESFIX exit if new recovery request arrived */
> > > > > > -		if (gt_vf_post_migration_needed(gt))
> > > > > > -			continue;
> > > > > > -		err = xe_gt_sriov_vf_notify_resfix_done(gt);
> > > > > > -		if (err)
> > > > > > -			break;
> > > > > > -		clear_bit(id, &gt_flags);
> > > > > > -	}
> > > > > > -
> > > > > > -	if (gt_flags && !err)
> > > > > > -		drm_dbg(&xe->drm, "another recovery imminent, skipped some notifications\n");
> > > > > > -	return err;
> > > > > > -}
> > > > > > -
> > > > > > -static int vf_get_next_migrated_gt_id(struct xe_device *xe)
> > > > > > -{
> > > > > > -	struct xe_gt *gt;
> > > > > > -	unsigned int id;
> > > > > > -
> > > > > > -	for_each_gt(gt, xe, id) {
> > > > > > -		if (test_and_clear_bit(id, &xe->sriov.vf.migration.gt_flags))
> > > > > > -			return id;
> > > > > > -	}
> > > > > > -	return -1;
> > > > > > -}
> > > > > > -
> > > > > > -static size_t post_migration_scratch_size(struct xe_device *xe)
> > > > > > -{
> > > > > > -	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
> > > > > > -}
> > > > > > -
> > > > > > -/**
> > > > > > - * Perform post-migration fixups on a single GT.
> > > > > > - *
> > > > > > - * After migration, GuC needs to be re-queried for VF configuration to check
> > > > > > - * if it matches previous provisioning. Most of VF provisioning shall be the
> > > > > > - * same, except GGTT range, since GGTT is not virtualized per-VF. If GGTT
> > > > > > - * range has changed, we have to perform fixups - shift all GGTT references
> > > > > > - * used anywhere within the driver. After the fixups in this function succeed,
> > > > > > - * it is allowed to ask the GuC bound to this GT to continue normal operation.
> > > > > > - *
> > > > > > - * Returns: 0 if the operation completed successfully, or a negative error
> > > > > > - * code otherwise.
> > > > > > - */
> > > > > > -static int gt_vf_post_migration_fixups(struct xe_gt *gt)
> > > > > > -{
> > > > > > -	s64 shift;
> > > > > > -	void *buf;
> > > > > > -	int err;
> > > > > > -
> > > > > > -	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_KERNEL);
> > > > > > -	if (!buf)
> > > > > > -		return -ENOMEM;
> > > > > > -
> > > > > > -	err = xe_gt_sriov_vf_query_config(gt);
> > > > > > -	if (err)
> > > > > > -		goto out;
> > > > > > -
> > > > > > -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> > > > > > -	if (shift) {
> > > > > > -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> > > > > > -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> > > > > > -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> > > > > > -		if (err)
> > > > > > -			goto out;
> > > > > > -	}
> > > > > > -
> > > > > > -out:
> > > > > > -	kfree(buf);
> > > > > > -	return err;
> > > > > > -}
> > > > > > -
> > > > > > -static void vf_post_migration_recovery(struct xe_device *xe)
> > > > > > -{
> > > > > > -	unsigned long fixed_gts = 0;
> > > > > > -	int id, err;
> > > > > > -
> > > > > > -	drm_dbg(&xe->drm, "migration recovery in progress\n");
> > > > > > -	xe_pm_runtime_get(xe);
> > > > > > -	vf_post_migration_shutdown(xe);
> > > > > > -
> > > > > > -	if (!xe_sriov_vf_migration_supported(xe)) {
> > > > > > -		xe_sriov_err(xe, "migration is not supported\n");
> > > > > > -		err = -ENOTRECOVERABLE;
> > > > > > -		goto fail;
> > > > > > -	}
> > > > > > -
> > > > > > -	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
> > > > > > -		struct xe_gt *gt = xe_device_get_gt(xe, id);
> > > > > > -
> > > > > > -		err = gt_vf_post_migration_fixups(gt);
> > > > > > -		if (err)
> > > > > > -			goto fail;
> > > > > > -
> > > > > > -		set_bit(id, &fixed_gts);
> > > > > > -	}
> > > > > > -
> > > > > > -	vf_post_migration_kickstart(xe);
> > > > > > -	err = vf_post_migration_notify_resfix_done(xe, fixed_gts);
> > > > > > -	if (err)
> > > > > > -		goto fail;
> > > > > > -
> > > > > > -	xe_pm_runtime_put(xe);
> > > > > > -	drm_notice(&xe->drm, "migration recovery ended\n");
> > > > > > -	return;
> > > > > > -fail:
> > > > > > -	xe_pm_runtime_put(xe);
> > > > > > -	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
> > > > > > -	xe_device_declare_wedged(xe);
> > > > > > -}
> > > > > > -
> > > > > > -static void migration_worker_func(struct work_struct *w)
> > > > > > -{
> > > > > > -	struct xe_device *xe = container_of(w, struct xe_device,
> > > > > > -					    sriov.vf.migration.worker);
> > > > > > -
> > > > > > -	vf_post_migration_recovery(xe);
> > > > > > -}
> > > > > > -
> > > > > > -/*
> > > > > > - * Check if post-restore recovery is coming on any of GTs.
> > > > > > - * @xe: the &xe_device struct instance
> > > > > > - *
> > > > > > - * Return: True if migration recovery worker will soon be running. Any worker currently
> > > > > > - * executing does not affect the result.
> > > > > > - */
> > > > > > -static bool vf_ready_to_recovery_on_any_gts(struct xe_device *xe)
> > > > > > -{
> > > > > > -	struct xe_gt *gt;
> > > > > > -	unsigned int id;
> > > > > > -
> > > > > > -	for_each_gt(gt, xe, id) {
> > > > > > -		if (test_bit(id, &xe->sriov.vf.migration.gt_flags))
> > > > > > -			return true;
> > > > > > -	}
> > > > > > -	return false;
> > > > > > -}
> > > > > > -
> > > > > > -/**
> > > > > > - * xe_sriov_vf_start_migration_recovery - Start VF migration recovery.
> > > > > > - * @xe: the &xe_device to start recovery on
> > > > > > - *
> > > > > > - * This function shall be called only by VF.
> > > > > > - */
> > > > > > -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
> > > > > > -{
> > > > > > -	bool started;
> > > > > > -
> > > > > > -	xe_assert(xe, IS_SRIOV_VF(xe));
> > > > > > -
> > > > > > -	if (!vf_ready_to_recovery_on_any_gts(xe))
> > > > > > -		return;
> > > > > > -
> > > > > > -	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
> > > > > > -	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
> > > > > > -		 "scheduled" : "already in progress");
> > > > > > -}
> > > > > > -
> > > > > >   /**
> > > > > >    * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
> > > > > >    * @xe: the &xe_device to initialize
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> > > > > > index 9e752105ec2a..4df95266b261 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> > > > > > @@ -13,7 +13,6 @@ struct xe_device;
> > > > > >   void xe_sriov_vf_init_early(struct xe_device *xe);
> > > > > >   int xe_sriov_vf_init_late(struct xe_device *xe);
> > > > > > -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
> > > > > >   bool xe_sriov_vf_migration_supported(struct xe_device *xe);
> > > > > >   void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> > > > > > index 426cc5841958..6a0fd0f5463e 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> > > > > > @@ -33,10 +33,6 @@ struct xe_device_vf {
> > > > > >   	/** @migration: VF Migration state data */
> > > > > >   	struct {
> > > > > > -		/** @migration.worker: VF migration recovery worker */
> > > > > > -		struct work_struct worker;
> > > > > > -		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
> > > > > > -		unsigned long gt_flags;
> > > > > >   		/**
> > > > > >   		 * @migration.enabled: flag indicating if migration support
> > > > > >   		 * was enabled or not due to missing prerequisites
