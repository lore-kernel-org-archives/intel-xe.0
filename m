Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C215CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 18:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0ECF10E2B4;
	Tue,  4 Nov 2025 18:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgAnTOLR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7700110E2B4
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 18:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762282564; x=1793818564;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qbgl7u7i9ivCRDIYC5dckB/s/1ZhHOYaMApUC//hgp4=;
 b=EgAnTOLR8MZLp3bXcz07x7orCYGb/IHOS/LEtU0WSaTsWcSx0taWEJhm
 Md3TvteYI4UMLBNTe0A6dNRrQQOfVVAxOPW2yWP1qf1CqbtJ9J8eCbrOw
 jaM63D724pnJaCgaaygUn5B63uH6CfdsGhCpMqIWphjKdqf4qtvs5ho6V
 dntPyG/zRmhmZ4oyOBzhyWWnavPSkeRPFV4NkD64qd0BmDdMO37oXMufB
 HYODpCQA0vqGTNi69dIFUNlXPuB+3hbr8C205AHKcMOx7giQB7WLxIuTS
 YMYef8W7Y8pfiCtOCJW5juP1ERp+b2DPh7PxmF5di4m+Saz/urPHYS06k Q==;
X-CSE-ConnectionGUID: 8fEETPheRtiwmUqb8USdMA==
X-CSE-MsgGUID: mdarU9SzQtSGq7IOqCtaBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64426472"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="64426472"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:56:03 -0800
X-CSE-ConnectionGUID: sEzkbOQuRvyksdUaWoDIkA==
X-CSE-MsgGUID: 2slUE0yKQFCK1gVB1UGL5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="210731581"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:56:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 10:56:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 10:56:02 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 10:56:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxLROnkDmYVMa900ZWPw8zmBV5Ke4QgtxIf+/bzwHz0eCRXoGLCwHAWBfTPcnuH0yjXssHrg5lo6KTdUj3A6PToi1X7xjj7Kx39qhI6QVTTmdqwlE+2auh0+KgjRXW2uW+UmA0lI/VW6H2+1if0uWloeJP+nFt5FECZe0ZYkPz4O1+mbCBWvdQp2tYA30mXJ1VTropDBS2SzeFkQEbdInfJsY9misWGGCVQIvbV5LWiQzF7Z6gKyj3cBt7u8NGu1GIm66Phq/auE9OSYfjQVmxe6A4si/HBUqjCk/ssFGK0LB5GfPUGhX9ajrvE9Dk+ZMYG8B9U8MRhb+VeZ29hrIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu07CbjtH+927h1xTWeHbng/1gbSEjHFDnSyV9xbPl4=;
 b=iYJaen8wXaer6FJqIQrap+H/TAICjy+1SYmoHOKT+fizOK9kqSr8mir/8t42rzsKMXp6u46NfNwi674sKESQ1cJA/g4UmgeQArl71CZ4PBK5DVqBm/X+rhidKa8qwdV7sx9koY9aYeRtALPC8l38E6wesZtZegbOk0rj1kF4WdheSzVDakpckIiG/GpMq6AVY8AGuYIYiqsbvfAYEuIMuIVLz5fh6QFH0AK8NTefB3/yT8HQfgvQvwUfmkg7RQmVNPXPR2Q1G1bUhBU137gaT1Wbr8Ao9V2KziKvqzo2CC8twNZ5c89eMgMjqVm72oMADUjv/ICWiZoW//NTpb3dFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by LV8PR11MB8746.namprd11.prod.outlook.com (2603:10b6:408:202::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 18:55:59 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 18:55:58 +0000
Date: Tue, 4 Nov 2025 10:55:54 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/16] drm/xe/multi_queue: Add GuC interface for multi
 queue support
Message-ID: <aQpMOtVprHgzDxmO@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-4-niranjana.vishwanathapura@intel.com>
 <aQZMTMd7JftUTcy5@lstrano-desk.jf.intel.com>
 <aQmHhz5htpispAv-@nvishwa1-desk>
 <aQo63JqpgA+ooy4Q@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQo63JqpgA+ooy4Q@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::27) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|LV8PR11MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: add0264a-4e8d-41b7-121b-08de1bd3c9dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T7FmeU525K9eVuSRqjMTQ2FOWIoLa7qxVuSsWraxUD3iWA6Z+suFkPaMsdb0?=
 =?us-ascii?Q?6+Yoeg2JEcWoSsUft/zhdcx01fsT7itEWOUIgK8CHq6qi4fKzwKud4ohF6f4?=
 =?us-ascii?Q?qbE9ZJIhUC0Z+Mpr5o8lDup0NAC+b7oEVMdwDIfZI1dkE+kdiWpR2bBmcigl?=
 =?us-ascii?Q?ng7KdYf0SQDbTsc8UyagXOrGZpEx7qmg4ikMX6V4RwkySsNd9cFamBD7Xn/g?=
 =?us-ascii?Q?KaA7bzWp6SegPBg47mav8P2js2jNwfYo4RB1lCsDp1Hm0RDYk/KWlTDM2mTs?=
 =?us-ascii?Q?OdfFPAdQR6VMRp5M/6e8bHaSKC5+8246nfmNkxM5P71YbIqA2g/iz/kfLd0L?=
 =?us-ascii?Q?Dj+S7mCN3gu2/Fkm/PX7YagMoa37PFBEADmBPCLSwsqxMZ6tBwkG6+K0Dpb1?=
 =?us-ascii?Q?dC21BKUnIbYkkOiOPwdAsGIx9zkSP/PRFm2g0quLzIAvfSY0RiC2Wo8yv8/v?=
 =?us-ascii?Q?G/LcOL9GJ6yNkWchB3sBlaXcPWUZRfMpwUYc/ga/iwIrTJMu0Y8ft3NxYJq9?=
 =?us-ascii?Q?HFzs42//h+NTW30B2Of1rNh6dgJmAcibvBHM7q2nMgEsPoShwRBdAGanNhAU?=
 =?us-ascii?Q?iVGIhHmVP1hcrmxF2XrvqMay5FRujS5Xn9GfjC1/7JLXNmIL3zGATOzh7zya?=
 =?us-ascii?Q?vWfJs8a2PSmNTZfxapaIAlev/+c7FZ1RDxErizufttQtCTlQdtPXjvHVWU1h?=
 =?us-ascii?Q?P7PE75ygodr8Ocxkso7TldhTv4s45Mmmx8/vthz4ZaeavyJEz2keaQwJ7ec3?=
 =?us-ascii?Q?IGkbAy5ffRoT43nAtH6gaJJtlVpuMwAMoeIKCUhetOGUDcMfmNuEx8Z9J1Qn?=
 =?us-ascii?Q?jEUeRf3FqTn63uNXhQghcK/3Z0M8o/RZSRl80t1vm7pGdrHxTh9UGU2MBt9E?=
 =?us-ascii?Q?xLwaiSl5JI+D0n4fw4MoFZBq6KnifjG4gi+5VvWLWpethQeTNc4qjCDiGDjU?=
 =?us-ascii?Q?mNdhD6efF79NT/SRNfe+zEG267R42AfIGm2sbCf2vaJgJepi4OZExbj86gRF?=
 =?us-ascii?Q?evFI7gbW5jF9pMHvnjR9MVRRYfWotnOP2uLZQGZK57dpgXNF6h1iMwPxS77S?=
 =?us-ascii?Q?pS+qUDb4w9UIdk+11IdqcISP2bm+2dXnG43/wA5ELIQPpA6IjU54bdaGLGXw?=
 =?us-ascii?Q?JOA05/udpX1ZCKwIAY1gf2DUJFYmtPG0IpyYWFBy5JkfuLSZbZ9M9q64mRKu?=
 =?us-ascii?Q?gMipz/ayZ1ECWk0J4gsn7FqzGuenwt949j6Wb7rEOh59qm0Xzi1lZRQldo5q?=
 =?us-ascii?Q?k0enOEot9mujgbiMUgk0KOxWx6XveK+UfjS3yL1IRu68jw7NkCdIMCiPnVhN?=
 =?us-ascii?Q?giJFfWGk+0VhkFsUdGcfwE7pr9t4BhoXBtRhSTRKBa58XSWuuIJF/7BVHhjl?=
 =?us-ascii?Q?P5T36lRGpkypawGME9lYB2dFnMHnV7kUKCNnupBYwpJXJo8aqA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MuwfN9Lwu1vhUFIx76fAtcnFXue1cNaEVgjNK425/UWC39Z18u2sYcMzml1a?=
 =?us-ascii?Q?t8TBktVBcHkXgIj6OX/aNWD7F4f9LdHKYT8pOhLLHJB9uO4rC7dOKCRu0zhO?=
 =?us-ascii?Q?lxWWcWKdl4ZeM/gJiwn3yiDnloTdcp5/+Mir7JJUPjlj3ZD3M5rSE01JHnLP?=
 =?us-ascii?Q?1sj7qPK0It8pJKCrWGQQP174mzRJ6uKZQiK90IpJWI+QN55YJCnmOJG8JlbC?=
 =?us-ascii?Q?1icZe+scdEDgcha325ib40e7R9gWQMnQFK2OAoXF2FU3B0XQaLBhKdO/1p7b?=
 =?us-ascii?Q?mJW1CmnXmInRyDYjZChuJYVbLtwPp3ZpL2zJPj61pkO6PtlJYwGVd55tGZDi?=
 =?us-ascii?Q?kLqNsYek7R67LTh6qIQdBngcDhZ7E06lYRZUTfq2/PnI/f8Haq1K0cQLjUeX?=
 =?us-ascii?Q?m0NnhTmdJdr2gmbD4LX8anozqs8XQvNzzjzMk2LLIp3KZVbruZ51Y20j99ku?=
 =?us-ascii?Q?4cDm5mjznoq3+n6+Z38QtSJKxjRqhKb6oEjOTlKDOiwnD9q+8xtXEqmWevnw?=
 =?us-ascii?Q?6zTVnTVkgvBjTejSOeEXlU3zb8+vdTGGt6M5Kh4PrJiXnl66cTMRUP8Ch9cd?=
 =?us-ascii?Q?WileOpjibYGjeONFOqXtphHLJUTICshAqQWZWDktUS2/V7xqmuhJ6NSZp2kg?=
 =?us-ascii?Q?GYmNfqAG9v2kRa2HRPumRcIBVOMLrNncLtHk8PDxWDbkTIwHXosHu/xBv0P7?=
 =?us-ascii?Q?q1W+1dEf1ogJYTIcA4Yoh8p2jvn5rqwQ+NY6uik38CqohsFuUCw5uEcsnMyn?=
 =?us-ascii?Q?hO5YqDe17jOgGqWqZNzGlkbEb7agameehvLkb96yP6NgY85B5OKY08y2cxaX?=
 =?us-ascii?Q?8B1RH2jHNr/wSLBGI2dW3V/fPZRvPIL9e6APr7a/T17TNVgb19f8qcQ4PzRA?=
 =?us-ascii?Q?ml/wt7v2EPwASRLBsnf4Ega1txQMgg4Yn6CoSpuMMaaRzsr2Zd8x75NojzMd?=
 =?us-ascii?Q?aTCEXGZ4bTc0WbUbLpKdh6svoboLGh9xPU+QR9K8uF8AKH5D0rW55SNJ/XQv?=
 =?us-ascii?Q?euJAcXWmEW8NE1ZtZH//W4WB4tuEu9VP567zdkyP6du4mniZfX+VqTJwKhOK?=
 =?us-ascii?Q?lIjsRoqnVV3sPDP1x9PqOPgStR9Ptgkix0Gdr5GSaF+C9QCYsr3BRLh/DId+?=
 =?us-ascii?Q?/JI9DG187ciBnCYLgniUYmRslPDLp1/+kC72osYWrqKFBJVuRU2zg+S7D+GV?=
 =?us-ascii?Q?XFBAm7RXVFfy8+33MGGdZK4SKXcs0dxhybE7clxKEt2XUfCrchcYBcqyfgBm?=
 =?us-ascii?Q?eQ3oBB5E8PJdatYb+YXDtVsHzCVwOKjbT8RaRc6vFukNlz6clXzbD7AtSLil?=
 =?us-ascii?Q?Acvlb/14ZXbsVNXjKhZt4lcU6ZD5As+wCB4PQBk50hFbJARTql8v4VGwAvMj?=
 =?us-ascii?Q?pKGxLrkXMIuTeg5kpTkAbXRL9HPN9DyshbwFyz+0DfQbmDhZpLByz9Ek3tcG?=
 =?us-ascii?Q?mrw8ddxDGpaQs/H4SIjyrkD2Gn43ywI1eI8srp8ahYNHx8TXWKEtQU6dfC3F?=
 =?us-ascii?Q?Zdf6gjcrDxBbo54x7jhahwfXb3lOds4hHEL+kuT0g0OjPetcibfWuJp/dX/q?=
 =?us-ascii?Q?2oo9SbT4k5HkP4pna618CzSA2YexVGBP31uvTHze+KKo2pa6K+t+hYV/vzY3?=
 =?us-ascii?Q?+po3IFnBk35bClG+llai0Rs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: add0264a-4e8d-41b7-121b-08de1bd3c9dc
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 18:55:57.9730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56kDCWNl6HhsEkhC0s7S0o4yvpO82dKIWi4hg4iGKW3I0FIxUpKxbppTcm2FNi8mICWPvX9NtW2RoqWXasOsi2vQbgtdORJGTbQPNfj8v29xsq6vCK6kvhSx0Jozx57G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8746
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

On Tue, Nov 04, 2025 at 09:41:48AM -0800, Matthew Brost wrote:
>On Mon, Nov 03, 2025 at 08:56:39PM -0800, Niranjana Vishwanathapura wrote:
>> On Sat, Nov 01, 2025 at 11:07:08AM -0700, Matthew Brost wrote:
>> > On Fri, Oct 31, 2025 at 11:29:23AM -0700, Niranjana Vishwanathapura wrote:
>> > > Implement GuC commands and response along with the Context
>> > > Group Page (CGP) interface for multi queue support.
>> > >
>> > > Ensure that only primary queue (q0) of a multi queue group
>> > > communicate with GuC. The secondary queues of the group only
>> > > need to maintain LRCA and interface with drm scheduler.
>> > >
>> > > Use primary queue's submit_wq for all secondary queues of a multi
>> > > queue group. This serialization avoids any locking around CGP
>> > > synchronization with GuC.
>> > >
>> >
>> > Not a complete review, but a few comments.
>> >
>> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/abi/guc_actions_abi.h |   3 +
>> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>> > >  drivers/gpu/drm/xe/xe_guc_ct.c           |   4 +
>> > >  drivers/gpu/drm/xe/xe_guc_fwif.h         |   3 +
>> > >  drivers/gpu/drm/xe/xe_guc_submit.c       | 302 +++++++++++++++++++----
>> > >  drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
>> > >  6 files changed, 270 insertions(+), 45 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> > > index 47756e4674a1..3e9fbed9cda6 100644
>> > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> > > @@ -139,6 +139,9 @@ enum xe_guc_action {
>> > >  	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>> > >  	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>> > >  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>> > > +	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
>> > > +	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
>> > > +	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
>> > >  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>> > >  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>> > >  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > > index 3856776df5c4..38e47b003259 100644
>> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > > @@ -47,6 +47,8 @@ struct xe_exec_queue_group {
>> > >  	struct xarray xa;
>> > >  	/** @list_lock: Secondary queue list lock */
>> > >  	struct mutex list_lock;
>> > > +	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>> > > +	bool sync_pending;
>> > >  };
>> > >
>> > >  /**
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> > > index e68953ef3a00..48b5006eb080 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> > > @@ -1304,6 +1304,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>> > >  	lockdep_assert_held(&ct->lock);
>> > >
>> > >  	switch (action) {
>> > > +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
>> > >  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>> > >  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
>> > >  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
>> > > @@ -1570,6 +1571,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>> > >  		ret = xe_guc_g2g_test_notification(guc, payload, adj_len);
>> > >  		break;
>> > >  #endif
>> > > +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
>> > > +		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
>> > > +		break;
>> > >  	default:
>> > >  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>> > >  	}
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> > > index c90dd266e9cf..610dfb2f1cb5 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> > > @@ -16,6 +16,7 @@
>> > >  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>> > >  #define G2H_LEN_DW_TLB_INVALIDATE		3
>> > >  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
>> > > +#define G2H_LEN_DW_MULTI_QUEUE_CONTEXT		4
>> >
>> > This value doesn't look right. I'm not sure where 4 is coming from.
>> >
>> > The length of XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE
>> > appears to be 2. So with a value of 4, I believe the G2H credits will
>> > leak.
>> >
>> > You can run a multi-q test, then check the following debugfs:
>> >
>> > cat /sys/kernel/debug/dri/0/gt0/uc/guc_info
>> >
>> > In particular, these are the interesting fields:
>> >
>> > G2H CTB (all sizes in DW):
>> >        ...
>> > 	resv_space: 16384
>> >        ...
>> > 	g2h outstanding: 0
>> >
>> > ^^^ This is what an idle G2H should look like. I suspect both G2H
>> > outstanding values will be non-zero, and resv_space will continuously
>> > decrease when running a multi-queue test.
>> >
>>
>> Looks like G2H_LEN_DW_MULTI_QUEUE_CONTEXT should be 3.
>> 2 dwords header (HXG event) and 1 dword payload. Will change.
>>
>> However, I always saw 'g2h outsanding' being 0 and resv_space being 16384,
>> after running the multi-queue tests, irrespective of whether I set
>> G2H_LEN_DW_MULTI_QUEUE_CONTEXT to 3 or 4.
>>
>
>That is really odd the credits didn't get out screwed up. I'd double
>check on this as that doesn't seem right. Perhaps the runtime PM refs
>drop to zero and the GuC gets reloaded? We are removing that though here
>[1]. Maybe try with this series.
>
>[1] https://patchwork.freedesktop.org/series/154017/
>
>I still think the value should be 2 here as this like deregister_done
>which delivers a guc_id in msg[0].
>

Yah, it is similar to deregister_done. The value of
G2H_LEN_DW_DEREGISTER_CONTEXT is also set to 3 above.
I tried with 2, but got guc error.
I have set it to 3 in the v2 patch series.

>> > >
>> > >  #define GUC_ID_MAX			65535
>> > >  #define GUC_ID_UNKNOWN			0xffffffff
>> > > @@ -62,6 +63,8 @@ struct guc_ctxt_registration_info {
>> > >  	u32 wq_base_lo;
>> > >  	u32 wq_base_hi;
>> > >  	u32 wq_size;
>> > > +	u32 cgp_lo;
>> > > +	u32 cgp_hi;
>> > >  	u32 hwlrca_lo;
>> > >  	u32 hwlrca_hi;
>> > >  };
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > index d4ffdb71ef3d..d2aa9a2524e7 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > @@ -46,6 +46,7 @@
>> > >  #include "xe_trace.h"
>> > >  #include "xe_uc_fw.h"
>> > >  #include "xe_vm.h"
>> > > +#include "xe_bo.h"
>> > >
>> > >  static struct xe_guc *
>> > >  exec_queue_to_guc(struct xe_exec_queue *q)
>> > > @@ -541,7 +542,8 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>> > >  	u32 slpc_exec_queue_freq_req = 0;
>> > >  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>> > >
>> > > -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>> > > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
>> > > +		     !xe_exec_queue_is_multi_queue_secondary(q));
>> > >
>> > >  	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
>> > >  		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
>> > > @@ -561,6 +563,8 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>> > >  {
>> > >  	struct exec_queue_policy policy;
>> > >
>> > > +	xe_assert(guc_to_xe(guc), !xe_exec_queue_is_multi_queue_secondary(q));
>> > > +
>> > >  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>> > >  	__guc_exec_queue_policy_add_preemption_timeout(&policy, 1);
>> > >
>> > > @@ -575,6 +579,130 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>> > >  	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>> > >  			field_, val_)
>> > >
>> > > +#define CGP_VERSION_MAJOR_SHIFT	8
>> > > +
>> > > +static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
>> > > +					       struct xe_exec_queue *q)
>> > > +{
>> > > +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> > > +	u32 guc_id = group->primary->guc->id;
>> > > +
>> > > +	/* Currently implementing CGP version 1.0 */
>> > > +	xe_map_wr(xe, &group->cgp_bo->vmap, 0, u32,
>> > > +		  1 << CGP_VERSION_MAJOR_SHIFT);
>> > > +
>> > > +	xe_map_wr(xe, &group->cgp_bo->vmap,
>> > > +		  (32 + q->multi_queue.pos * 2) * sizeof(u32),
>> > > +		  u32, lower_32_bits(xe_lrc_descriptor(q->lrc[0])));
>> > > +
>> > > +	xe_map_wr(xe, &group->cgp_bo->vmap,
>> > > +		  (33 + q->multi_queue.pos * 2) * sizeof(u32),
>> > > +		  u32, guc_id);
>> > > +
>> > > +	if (q->multi_queue.pos / 32) {
>> > > +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32),
>> > > +			  u32, BIT(q->multi_queue.pos % 32));
>> > > +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32), u32, 0);
>> > > +	} else {
>> > > +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32),
>> > > +			  u32, BIT(q->multi_queue.pos));
>> > > +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32), u32, 0);
>> > > +	}
>> > > +}
>> > > +
>> > > +static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>> > > +					     struct xe_exec_queue *q,
>> > > +					     const u32 *action, u32 len)
>> > > +{
>> > > +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> > > +	struct xe_device *xe = guc_to_xe(guc);
>> > > +	long ret;
>> > > +
>> > > +	/*
>> > > +	 * As all queues of a multi queue group use single drm scheduler
>> > > +	 * submit workqueue, CGP synchronization with GuC are serialized.
>> > > +	 * Hence, no locking is required here.
>> > > +	 * Wait for any pending CGP_SYNC_DONE response before updating the
>> > > +	 * CGP page and sending CGP_SYNC message.
>> > > +	 */
>> > > +	ret = wait_event_timeout(guc->ct.wq,
>> > > +				 !READ_ONCE(group->sync_pending) ||
>> > > +				 xe_guc_read_stopped(guc), HZ);
>> > > +	if (!ret || xe_guc_read_stopped(guc)) {
>> > > +		drm_err(&xe->drm, "Wait for CGP_SYNC_DONE response failed!\n");
>> >
>> > If this occurs you need a GT reset which should detect
>> > group->sync_pending in guc_exec_queue_stop and clean it up.
>> >
>>
>> hmm...ok, let me give that a try. Not sure how urgent is this as ideally
>> it should never occur.
>>
>
>It shouldn't occur, but for correctness best to at least attempt to get
>this right upfront.

Ok, will work on it.

>
>> > Also here is where VF migration needs to be considered. The
>> > wait_event_timeout should pop out on vf_recovery being set, but not
>> > trigger a GT reset. In this case we need likely need some per secondary
>> > queue tracking state to figure out which secondary queues lost the CPG
>> > syncs so that flow can recover. We can figure out part out a bit later
>> > though.
>>
>> Hmm...ok.
>>
>> >
>> > > +		/* Something wrong with the CTB or GuC, no need to proceed */
>> > > +		return;
>> > > +	}
>> > > +
>> > > +	xe_guc_exec_queue_group_cgp_update(xe, q);
>> > > +
>> > > +	WRITE_ONCE(group->sync_pending, true);
>> > > +	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
>> >
>> > The problem here appears to be two fold:
>> >
>> > - The value of G2H_LEN_DW_MULTI_QUEUE_CONTEXT looks incorrect
>> > - On multi-q registration both G2H credits and count are set but multi-q
>> >  register doesn't produce a G2H response. See my comment above thinga
>> >  getting leaked, that can't happen as PM will be off and eventually G2H
>> >  credits will run out and deadlock the CT channel leading to a GT reset.
>> >
>>
>> Responded above.
>>
>> > > +}
>> > > +
>> > > +static void __register_exec_queue(struct xe_guc *guc,
>> > > +				  struct guc_ctxt_registration_info *info)
>> > > +{
>> > > +	u32 action[] = {
>> > > +		XE_GUC_ACTION_REGISTER_CONTEXT,
>> > > +		info->flags,
>> > > +		info->context_idx,
>> > > +		info->engine_class,
>> > > +		info->engine_submit_mask,
>> > > +		info->wq_desc_lo,
>> > > +		info->wq_desc_hi,
>> > > +		info->wq_base_lo,
>> > > +		info->wq_base_hi,
>> > > +		info->wq_size,
>> > > +		info->hwlrca_lo,
>> > > +		info->hwlrca_hi,
>> > > +	};
>> > > +
>> > > +	/* explicitly checks some fields that we might fixup later */
>> > > +	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
>> > > +		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
>> > > +	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
>> > > +		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
>> > > +	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
>> > > +		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
>> > > +
>> > > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>> > > +}
>> > > +
>> > > +static void __register_exec_queue_group(struct xe_guc *guc,
>> > > +					struct xe_exec_queue *q,
>> > > +					struct guc_ctxt_registration_info *info)
>> > > +{
>> > > +#define MAX_MULTI_QUEUE_REG_SIZE	(8)
>> > > +	struct xe_device *xe = guc_to_xe(guc);
>> > > +	u32 action[MAX_MULTI_QUEUE_REG_SIZE];
>> > > +	int len = 0;
>> > > +
>> > > +	if (xe_exec_queue_is_multi_queue_primary(q)) {
>> > > +		action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE;
>> >
>> > Again as mentioned above, this command doesn't require G2H credits
>> > unless this produces a XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE
>> > response.
>> >
>>
>> Yes, XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE will have a
>> XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response from GuC.
>>
>
>Ah, ok. That at least explains why g2h outstanding is the correct value,
>doesn't explain the credits though. Can you add a comment indicating
>XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE results in
>XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE?
>

Ok, added comment in v2.

>> > > +		action[len++] = info->flags;
>> > > +		action[len++] = info->context_idx;
>> > > +		action[len++] = info->engine_class;
>> > > +		action[len++] = info->engine_submit_mask;
>> > > +		action[len++] = 0; /* Reserved */
>> > > +		action[len++] = info->cgp_lo;
>> > > +		action[len++] = info->cgp_hi;
>> > > +	} else {
>> > > +		/*
>> > > +		 * No need to wait before CGP sync since CT descriptors
>> > > +		 * should be ordered.
>> > > +		 */
>> > > +
>> > > +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
>> > > +		action[len++] = q->multi_queue.group->primary->guc->id;
>> > > +	}
>> > > +
>> > > +	xe_assert(xe, len <= MAX_MULTI_QUEUE_REG_SIZE);
>> > > +#undef MAX_MULTI_QUEUE_REG_SIZE
>> > > +
>> > > +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
>> > > +}
>> > > +
>> > >  static void __register_mlrc_exec_queue(struct xe_guc *guc,
>> > >  				       struct xe_exec_queue *q,
>> > >  				       struct guc_ctxt_registration_info *info)
>> > > @@ -622,35 +750,6 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>> > >  	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
>> > >  }
>> > >
>> > > -static void __register_exec_queue(struct xe_guc *guc,
>> > > -				  struct guc_ctxt_registration_info *info)
>> > > -{
>> > > -	u32 action[] = {
>> > > -		XE_GUC_ACTION_REGISTER_CONTEXT,
>> > > -		info->flags,
>> > > -		info->context_idx,
>> > > -		info->engine_class,
>> > > -		info->engine_submit_mask,
>> > > -		info->wq_desc_lo,
>> > > -		info->wq_desc_hi,
>> > > -		info->wq_base_lo,
>> > > -		info->wq_base_hi,
>> > > -		info->wq_size,
>> > > -		info->hwlrca_lo,
>> > > -		info->hwlrca_hi,
>> > > -	};
>> > > -
>> > > -	/* explicitly checks some fields that we might fixup later */
>> > > -	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
>> > > -		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
>> > > -	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
>> > > -		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
>> > > -	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
>> > > -		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
>> > > -
>> > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>> > > -}
>> > > -
>> > >  static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>> > >  {
>> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
>> > > @@ -670,6 +769,13 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>> > >  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
>> > >  		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
>> > >
>> > > +	if (xe_exec_queue_is_multi_queue(q)) {
>> > > +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> > > +
>> > > +		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
>> > > +		info.cgp_hi = 0;
>> > > +	}
>> > > +
>> > >  	if (xe_exec_queue_is_parallel(q)) {
>> > >  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>> > >  		struct iosys_map map = xe_lrc_parallel_map(lrc);
>> > > @@ -700,11 +806,15 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>> > >
>> > >  	set_exec_queue_registered(q);
>> > >  	trace_xe_exec_queue_register(q);
>> > > -	if (xe_exec_queue_is_parallel(q))
>> > > +	if (xe_exec_queue_is_multi_queue(q))
>> > > +		__register_exec_queue_group(guc, q, &info);
>> > > +	else if (xe_exec_queue_is_parallel(q))
>> > >  		__register_mlrc_exec_queue(guc, q, &info);
>> > >  	else
>> > >  		__register_exec_queue(guc, &info);
>> > > -	init_policies(guc, q);
>> > > +
>> > > +	if (!xe_exec_queue_is_multi_queue_secondary(q))
>> > > +		init_policies(guc, q);
>> > >  }
>> > >
>> > >  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
>> > > @@ -833,6 +943,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>> > >  	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
>> > >  		return;
>> > >
>> > > +	/*
>> > > +	 * All queues in a multi-queue group will use the primary queue
>> > > +	 * of the group to interface with GuC.
>> > > +	 */
>> > > +	q = xe_exec_queue_multi_queue_primary(q);
>> > > +
>> > >  	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
>> > >  		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>> > >  		action[len++] = q->guc->id;
>> > > @@ -879,6 +995,18 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>> > >  	trace_xe_sched_job_run(job);
>> > >
>> > >  	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
>> > > +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> > > +			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> > > +
>> > > +			if (exec_queue_killed_or_banned_or_wedged(primary)) {
>> > > +				killed_or_banned_or_wedged = true;
>> > > +				goto run_job_out;
>> > > +			}
>> > > +
>> > > +			if (!exec_queue_registered(primary))
>> > > +				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
>> > > +		}
>> > > +
>> > >  		if (!exec_queue_registered(q))
>> > >  			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>> > >  		if (!job->skip_emit)
>> > > @@ -887,6 +1015,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>> > >  		job->skip_emit = false;
>> > >  	}
>> > >
>> > > +run_job_out:
>> > >  	/*
>> > >  	 * We don't care about job-fence ordering in LR VMs because these fences
>> > >  	 * are never exported; they are used solely to keep jobs on the pending
>> > > @@ -912,6 +1041,11 @@ int xe_guc_read_stopped(struct xe_guc *guc)
>> > >  	return atomic_read(&guc->submission_state.stopped);
>> > >  }
>> > >
>> > > +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
>> > > +						    struct xe_exec_queue *q,
>> > > +						    u32 runnable_state);
>> > > +static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
>> > > +
>> > >  #define MAKE_SCHED_CONTEXT_ACTION(q, enable_disable)			\
>> > >  	u32 action[] = {						\
>> > >  		XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET,			\
>> > > @@ -925,7 +1059,9 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>> > >  	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>> > >  	int ret;
>> > >
>> > > -	set_min_preemption_timeout(guc, q);
>> > > +	if (!xe_exec_queue_is_multi_queue_secondary(q))
>> > > +		set_min_preemption_timeout(guc, q);
>> > > +
>> > >  	smp_rmb();
>> > >  	ret = wait_event_timeout(guc->ct.wq,
>> > >  				 (!exec_queue_pending_enable(q) &&
>> > > @@ -953,9 +1089,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>> > >  	 * Reserve space for both G2H here as the 2nd G2H is sent from a G2H
>> > >  	 * handler and we are not allowed to reserved G2H space in handlers.
>> > >  	 */
>> > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> > > -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
>> > > -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>> > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> > > +		handle_multi_queue_secondary_sched_done(guc, q, 0);
>> > > +	else
>> > > +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> > > +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
>> > > +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>> > >  }
>> > >
>> > >  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>> > > @@ -1161,8 +1300,11 @@ static void enable_scheduling(struct xe_exec_queue *q)
>> > >  	set_exec_queue_enabled(q);
>> > >  	trace_xe_exec_queue_scheduling_enable(q);
>> > >
>> > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> > > -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>> > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> > > +		handle_multi_queue_secondary_sched_done(guc, q, 1);
>> > > +	else
>> > > +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> > > +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>> > >
>> > >  	ret = wait_event_timeout(guc->ct.wq,
>> > >  				 !exec_queue_pending_enable(q) ||
>> > > @@ -1186,14 +1328,17 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>> > >  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>> > >  	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>> > >
>> > > -	if (immediate)
>> > > +	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
>> > >  		set_min_preemption_timeout(guc, q);
>> > >  	clear_exec_queue_enabled(q);
>> > >  	set_exec_queue_pending_disable(q);
>> > >  	trace_xe_exec_queue_scheduling_disable(q);
>> > >
>> > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> > > -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>> > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> > > +		handle_multi_queue_secondary_sched_done(guc, q, 0);
>> > > +	else
>> > > +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> > > +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>> > >  }
>> > >
>> > >  static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>> > > @@ -1211,8 +1356,11 @@ static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>> > >  	set_exec_queue_destroyed(q);
>> > >  	trace_xe_exec_queue_deregister(q);
>> > >
>> > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> > > -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>> > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> > > +		handle_deregister_done(guc, q);
>> > > +	else
>> > > +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> > > +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>> > >  }
>> > >
>> > >  static enum drm_gpu_sched_stat
>> > > @@ -1660,6 +1808,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>> > >  {
>> > >  	struct xe_gpu_scheduler *sched;
>> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
>> > > +	struct workqueue_struct *submit_wq = NULL;
>> > >  	struct xe_guc_exec_queue *ge;
>> > >  	long timeout;
>> > >  	int err, i;
>> > > @@ -1680,8 +1829,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>> > >
>> > >  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>> > >  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>> > > +
>> > > +	/*
>> > > +	 * Use primary queue's submit_wq for all secondary queues of a
>> > > +	 * multi queue group. This serialization avoids any locking around
>> > > +	 * CGP synchronization with GuC.
>> > > +	 */
>> > > +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> > > +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> > > +
>> > > +		submit_wq = primary->guc->sched.base.submit_wq;
>> > > +	}
>> > > +
>> > >  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
>> > > -			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>> > > +			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>> > >  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>> > >  			    q->name, gt_to_xe(q->gt)->drm.dev);
>> > >  	if (err)
>> > > @@ -2418,7 +2579,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>> > >
>> > >  	trace_xe_exec_queue_deregister(q);
>> > >
>> > > -	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
>> > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> > > +		handle_deregister_done(guc, q);
>> > > +	else
>> > > +		xe_guc_ct_send_g2h_handler(&guc->ct, action,
>> > > +					   ARRAY_SIZE(action));
>> > >  }
>> > >
>> > >  static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>> > > @@ -2468,6 +2633,15 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>> > >  	}
>> > >  }
>> > >
>> > > +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
>> > > +						    struct xe_exec_queue *q,
>> > > +						    u32 runnable_state)
>> > > +{
>> > > +	mutex_lock(&guc->ct.lock);
>> >
>> > I don't think you need the CT lock here. This per-queue state which
>> > should be safe to modify without the any lock. The CT lock never
>> > protects queue state, we just happen to have it in G2H responses because
>> > of how the CT layer works.
>> >
>>
>> Without the CT lock here, I get lockdep warning from _guc_ct_send_locked(),
>> h2g_has_room() etc. So, I guess we need to keep it.
>>
>
>Ah, yes. I missed that part. If you send another H2G you will indeed
>need the CT lock. Can you add a comment around that? Easy to forget
>this.
>

Ok, added comment in v2.

Niranjana

>Matt
>
>> > > +	handle_sched_done(guc, q, runnable_state);
>> > > +	mutex_unlock(&guc->ct.lock);
>> > > +}
>> > > +
>> > >  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>> > >  {
>> > >  	struct xe_exec_queue *q;
>> > > @@ -2672,6 +2846,44 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>> > >  	return 0;
>> > >  }
>> > >
>> > > +/**
>> > > + * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
>> > > + * @guc: guc
>> > > + * @msg: message indicating CGP sync done
>> > > + * @len: length of message
>> > > + *
>> > > + * Set multi queue group's sync_pending flag to false and wakeup anyone waiting
>> > > + * for CGP synchronization to complete.
>> > > + *
>> > > + * Return: 0 on success, -EPROTO for malformed messages.
>> > > + */
>> > > +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>> > > +{
>> > > +	struct xe_device *xe = guc_to_xe(guc);
>> > > +	struct xe_exec_queue *q;
>> > > +	u32 guc_id = msg[0];
>> > > +
>> > > +	if (unlikely(len < 1)) {
>> > > +		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
>> > > +		return -EPROTO;
>> > > +	}
>> > > +
>> > > +	q = g2h_exec_queue_lookup(guc, guc_id);
>> > > +	if (unlikely(!q))
>> > > +		return -EPROTO;
>> > > +
>> > > +	if (!xe_exec_queue_is_multi_queue_primary(q)) {
>> > > +		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
>> > > +		return -EPROTO;
>> > > +	}
>> > > +
>> > > +	/* Wakeup the serialized cgp update wait */
>> > > +	WRITE_ONCE(q->multi_queue.group->sync_pending, false);
>> >
>> > So here - I suspect we need to associate the CGP_SYNC_DONE with a
>> > secondary queue state tracking in order to get VF migration to work.
>> > Again we can figure his part of a bit later but should be considered.
>> >
>>
>> Hmm..ok.
>>
>> > Matt
>> >
>> > > +	wake_up_all(&guc->ct.wq);
>> > > +
>> > > +	return 0;
>> > > +}
>> > > +
>> > >  static void
>> > >  guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
>> > >  				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> > > index b49a2748ec46..abfa94bce391 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> > > @@ -34,6 +34,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>> > >  					       u32 len);
>> > >  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>> > >  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>> > > +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>> > >
>> > >  struct xe_guc_submit_exec_queue_snapshot *
>> > >  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>> > > --
>> > > 2.43.0
>> > >
