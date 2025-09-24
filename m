Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE14CAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C880A10E7CC;
	Wed, 24 Sep 2025 20:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FY/tWrM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BBE10E7CC
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758745236; x=1790281236;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UFFlxDRALY83K66K8KHVJWOPCSL2mmDZdth12X7oJS4=;
 b=FY/tWrM/Lg8rYtxXTF4OuIY0npgiUOURRm42d4tMr3YMDY/qQTgHk8iX
 K6u4YtVMZgayuc8BDD1d3ttGTGVKwpElW5ClpEzA608sAfouc3trXHRwU
 SxwtfzaKT6bEskRozVEif1C3gLO/r+o1FHs2KqLCk6yL3OM7t2S3+D6RR
 J9fBnbL93FzlR6L3as4hpYRiE2Xd7VKPhoGgWNlGvZfKga114rQVYQahL
 nsf5biW6ItF/xpSNu4s3lacWYi2OOLFbRPSBK65NSol6ojt6VEAoqCs/U
 2FAYhg9wab/Wa4YosCvFfuYTl1NgjP58rcx+SVCk8RwndKYGgOSw1oP25 w==;
X-CSE-ConnectionGUID: 34Vm6v4JTwChbJgteaq1iQ==
X-CSE-MsgGUID: AupHiuG8RbG7XsmSoq0Wiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="78492461"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="78492461"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:20:36 -0700
X-CSE-ConnectionGUID: grw0TBWHSv23DJCkn1vDxA==
X-CSE-MsgGUID: emWYP2DGQjq9RIl7sVKDJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="181511449"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:20:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 13:20:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 13:20:35 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:20:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVKSXxpvBYv5/9opI/esMxG3o98hXy5bA6U+MMOTVWO3OF+I0khAKzUtbiALH/9fQyxb3pv57oQWm/R993+hNlAjM+f+DruuCncF8OF5DTe6dsePsYHFA8vpIlOVx+JWoe443faT31eCcv0+oCzI+OF6IJPyjyxB4CnfwmqMXoY1Zv2ay5tRglSvcKU+QvWQeG/Z9xElHgdAkMJrB6au7YYnmbVrjb90mYzpvqS618BExR24vNFvgY75Nok8dj8wE+SsCMxTiM1JugaLO3lLKPK1qXE6r4XJ7qm7ZPZdPFXNU0NWGHyPw+kaWaxLixdzBfXPmI5fZyhSMJ+cG/F/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dmUlurwFdb2xGkDcx+Nbm80fLZGOBPajXC6k+42VI0=;
 b=RoOldgTWnaOJWi8irBm5sWZdk2JpcVz7P2hB3ZAGvQtL60QeJxMJpqPhYm4uf8KUMqjOS3yJDBg/viajCKCSEOaQmFjbbv8ruqwpW2XNlmMa0x3yRdxK20mEL4qkvCl3ttMPq6rDV25vwV+txSlCJO9CwusW5gFjD3hZujoblaT28wgZAY+Ur3Dol4n3ucVAxmKMlvYosGmadihMRQ07vg+b7FsC1kSSpbudG+a2T9XoQOklVe/29jISRkmf9GsK7nOSfmkK++t6IoKY0TwRZUUVZBCgoxJw8xdTak6jy6DxTR8DfwnqpMrfdYt02GmXJd6YKxcxdM4giMOH/QQsoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4925.namprd11.prod.outlook.com (2603:10b6:a03:2df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Wed, 24 Sep
 2025 20:20:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:20:28 +0000
Date: Wed, 24 Sep 2025 13:20:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 10/34] drm/xe/guc: Document GuC submission backend
Message-ID: <aNRSiV200WPUmBNC@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-11-matthew.brost@intel.com>
 <5b8a1b50-b725-4869-a631-5059fd5f7424@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5b8a1b50-b725-4869-a631-5059fd5f7424@intel.com>
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4925:EE_
X-MS-Office365-Filtering-Correlation-Id: 83cb8c53-7cd2-4909-0ded-08ddfba7cd78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ABofFKMJ7y27nnBve5N4Hrb0fZmLJiETQBLD//p9bfGVSREnnD42NLqQ5Bta?=
 =?us-ascii?Q?N7TV9jvdmi0ze7vbQGy/mbsaBmq8xBdPb1kcTYoQnlA14cevxwQ+TQxqIHC8?=
 =?us-ascii?Q?3UfgM7poDtcczkHUTHniywJIO6qWRV5Q08ZqNFPHAJKZUzWG0FRIL/3ar9V/?=
 =?us-ascii?Q?Gg2HkrI17EXIlayQQtK8UENSY4l+I1xRjWDC3IK0fFL6bbDDpC5gAIO4zURL?=
 =?us-ascii?Q?8aTKZTyTrBbetzZlrqWx9iq9P2P9e61/EO8Pfcx5abZGC+JEQmi+w1PYMsDz?=
 =?us-ascii?Q?HNCtn+MDewITZN4kYLp2bl52QuRCXwdttqzTJm3pq8S1kdIgSZYeDPefTQN1?=
 =?us-ascii?Q?QVxQrwfKxOBUrFxiGb5zr6vFgJljscvCI74TohXAC9IDwOufMDGxp3cFqxNI?=
 =?us-ascii?Q?CPmyRvpnwCxXBP6N5SR2UclPpXl72ETdqFqYNQSJBbLHQ4YPCsAtB9EQfMZq?=
 =?us-ascii?Q?MMRY0lLmnr3//rDZUh2IRFQM40rux2HL3aAs8z6T0vSPfDVuFkcoIyFVIXlD?=
 =?us-ascii?Q?8BJqVncFCe8CnXi85J2+EDAZLLtvlVZUMj6BjeJZ+xMOeXrH0ahjTo9kw5No?=
 =?us-ascii?Q?avi1vkKiBsVtleOHCd8YjZGk9+crxf/VxDykLBqDnhAiOpxZTbPiNicAuRgw?=
 =?us-ascii?Q?RmzatR8d55SwuMKx9beLyWPSQ2tXc2Vlw0MsnCapvyAa1eT/Q8K0yD1bER7C?=
 =?us-ascii?Q?n5hRjTpFbrR1ZZdjJ9mPKSykuQWvROI2Baz0FOH84YLXmC9tJFP00RCy1SQx?=
 =?us-ascii?Q?IvaMY94zul6ShDbIsvjm1phC9baA3XCpECDNwUyx5A0ODfXmF8euj4pP6yJ2?=
 =?us-ascii?Q?oDUbwM49bg14kotSGq+ClbDbhZbuCYMRi3iWVBUvU1sQtVweWpCtu3Qt199u?=
 =?us-ascii?Q?O29ykCKWBBUFw4wao4xblm2igNql407VCJpiQ2gzDC0QUubcWMIqbEWsEnUX?=
 =?us-ascii?Q?iUURellVLst5g4qrdQtv/VsO6LXQ73wE33s0xPL/axSMmnxPYahlXcn7/5Vh?=
 =?us-ascii?Q?JoM9/6nHvBF47pj9Swo8wDDrYVQztEpZrsRjxeEklgCeTYJrNiUQaVCTO2xY?=
 =?us-ascii?Q?CiWBsCsghSMWpLAi/6bM2WYY51wG8M3BOov0wgx7N7hPy5NnK7sn66TFZ3o0?=
 =?us-ascii?Q?zfmQYGDN0xFuEj5ymr5uPpqk1R7TnfGbZ+ZeXUaIRIcN2uynxIKnDIOLAo1N?=
 =?us-ascii?Q?8ina7ZpB4/cShm3Id4iMmd8JYc+FKN23eBdWbrBmGXfWywwqxIeAdqsGIR4x?=
 =?us-ascii?Q?Fs7QyLM8/4ZvKxbHOq4jFdpLPhrQwePS+k9uwIwVPm1zryEW7P1QtikS13er?=
 =?us-ascii?Q?zTO048lKesL8Ln/LupUpLIela2/mSbB0Ov1NkZMjEun03RRZ80qcW7wXTCDi?=
 =?us-ascii?Q?tGgSQXYeVXB9YtB1B+7mUTEby7YWU2kZAWGSkeH5OuMGY6/LKGFGa+ppbALt?=
 =?us-ascii?Q?v7XD/loZCZ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0sHYNQPiSY+DLFXSWeL9cfpaf067OtmHXMg5VmZYW2g1N/erK1ORA7kLe66n?=
 =?us-ascii?Q?ih0RgvxXF9/BrWpt1LknCHjJeQ/3WLrNu5wTj3AHa6nmbVSq5Rke0Vpg/h/C?=
 =?us-ascii?Q?71uVRc6VZ1P0U5Wr2E8cF8zbleEeV8OESwmEUX8iz+DHKRvhCXAtgM4q/lwr?=
 =?us-ascii?Q?PbAXspGss0WH7j3mgeN4cViiYbtNcQmMzO331s1pXahQ1YzWkFez5l7Tv/7s?=
 =?us-ascii?Q?02CEp8RLdL3hxkmUBQ4atQnaIKZPmxHSG2yNxQUt1PsbnHTmln4wy6ypglAu?=
 =?us-ascii?Q?CbdUaOlf40lU6y/sJtLGyC4Ufza2KR1Kc4iu5ZXqp9z6WbuC5dR44aLy8YnD?=
 =?us-ascii?Q?Lc6/ud4NmH8SRPTjE5PW684H0uvZUQmOjbEeI15VNL3SpLXQausUf9SDrO2+?=
 =?us-ascii?Q?91GAN16YpO1e51QFpe/pE2RmWxb9gh248TbCgFF6WUueGrTQXaT91OsSawoo?=
 =?us-ascii?Q?P1T3YImBja1hgzzNFRs1odb0sdGs8Xnna1rkfbFmFktns0iYWvc86RlcjNt6?=
 =?us-ascii?Q?/FVkrAhmb44sdO2ZDBAKDXGEh5CaXwdXLQUjnffn5N+t+c2MAuTWtX12n30r?=
 =?us-ascii?Q?Sg3QPfKt1/5lUQhqMPhKS81b7MEHSwDWw1Br2oYB95Pv9JOrqZ8c8aw/IuXJ?=
 =?us-ascii?Q?RDLP1HN1r75CO+XI3MsYFDBSJsqnIB59LBwYiBpwR2PhoLxc3/Ns7sf1WG/v?=
 =?us-ascii?Q?hofBPbga1Zn92YhM65QyrV/eqc0slrYBDcNURnX+NLP44ZfZ5eBPbYbXyGBq?=
 =?us-ascii?Q?wucKyQGql3QdW/Xe+4wP5MjXk2+iUpE413+Xd72Sur5yH0E9vNR37I4dkXII?=
 =?us-ascii?Q?JqOn7lBnmD+uv+TPJKUqSEhB80LWLnlrwj4BRobbpuP8W95bdkcn51e6t4zL?=
 =?us-ascii?Q?h+ZI65an7AqKgsJIS3AaEYZGFXWCZm8L1+sO032aV16dimqYBa6II5sR21iZ?=
 =?us-ascii?Q?neHztPhXoMn11Es0qf4bjLgDePE3jhidGIhGbXbhimVYLz9H/OC19rXge7Rt?=
 =?us-ascii?Q?eP1MuOX6efGD9Ry+hB3Roiu3Bg57/yBx1N1nyPEbjviMZV358g/8dsJBWkQP?=
 =?us-ascii?Q?aPFEWUY+wTaA/suxGYWk69dSPOiyIzYtJNfQrlKQ4NnOPEPWwgYknZMP0HSO?=
 =?us-ascii?Q?40N/vK416dOISJW5BQgvB9LN5K2HLUKHrhGrhJJ32305Qggrzcjstbo3mFmx?=
 =?us-ascii?Q?8v0FT49/EFN0QRRnqULKFVnTCUYk0i/hKq3roHd7YdT3nOpWXskH/UbUQPWJ?=
 =?us-ascii?Q?up7TJj/4ducUcVzbLtujuGpIncxPA6FTxjwIcYAvGTg4BislI91Sd2/MAE4k?=
 =?us-ascii?Q?ulI9NQGCb4P3vvfnLiF9JNY3LPbnAKyGBD7B9eMH2/D2UFeprC2/oh1rQrkd?=
 =?us-ascii?Q?h1zQZoY3DVsAa1Y9YPCoy0wHtQSzoSm+I3NZXWN9z7gKQFOQXG8DdJHe+VCh?=
 =?us-ascii?Q?iKMY1YkP/YwnYeRuxUrRH45KZXLWmtriW8Vtt4ulA+0uLH0GRbvg8hJxznrg?=
 =?us-ascii?Q?QWIuZwcAbtZUHk4NQ8mePayGsdVzHZdNIU3IrZ1NhQEzkxSsWcZzn1/iGb5I?=
 =?us-ascii?Q?fWp8HYTcrYawXE20cowPjaPGgP/czKNS8vAZLRMGk/rNl/hsY1mEg6ji463S?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cb8c53-7cd2-4909-0ded-08ddfba7cd78
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:20:28.3377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebrTVvPDBGA8ABT12rJ0F+byyTaSJpTZQRoAFWzp/x2vz6IKy0dNWayJLFeTrFDvfP1vrIsvEAOKtKY5CvzPMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4925
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

On Wed, Sep 24, 2025 at 11:35:23AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > Add kernel-doc to xe_guc_submit.c describing the submission path,
> > the per-queue single-threaded model with pause/resume, the driver shadow
> > state machine and lost-H2G replay, job timeout handling, recovery flows
> > (GT reset, PM resume, VF resume), and reclaim constraints.
> 
> can we split this patch into "general doc of submission path" that could be
> reviewed and merged separately from the "VF recovery" doc that will stay
> in this series ?
> 

I don't really see the why here? Ofc merging this patch as part of this
series is a blocker but included it as largely explains everything this
series does + overall design of GuC submission which was entirely in my
head prior to this patch.

Matt

> > 
> > v2:
> >  - Mirror tweaks for clarity
> >  - Add new doc to Xe rst files
> > v3:
> >  - Clarify global vs per-queue stop / start
> >  - Clarify VF resume flow
> >  - Add section for 'Waiters during VF resume'
> >  - Add section for 'Page-faulting queues during VF migration'
> >  - Add section for 'GuC-ID assignment'
> >  - Add section for 'Reference counting and final queue destruction'
> > v4:
> >  - s/VF resume/VF post migration recovery (Tomasz)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  Documentation/gpu/xe/index.rst     |   1 +
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 282 +++++++++++++++++++++++++++++
