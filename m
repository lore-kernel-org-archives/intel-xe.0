Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48E3C54F30
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 04:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F5C10E7D5;
	Fri, 30 May 2025 04:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mbk+hykm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C321B10E7D1
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 04:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748579985; x=1780115985;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cDEUNZ//Atb+x1rwY9ZLXYDymlDwFDj47omptSlE4T0=;
 b=Mbk+hykmMYHyJFJprEwXB/REiHCiC3ya4fMdKMkcQfDgrCgB1DPQdJiO
 cNfSE5JegDCeY97y6I9CVm3pugsrYz2TnRvReX3GBJY1JkbOs9PBAWRTX
 5APjbwHHrGWrCcSaD/WOYHvbZhEwXmRlRHRa1758+lmBIC7X2dkV8dwOT
 L8zqMV9GO4vRCRDQCf3KJu1UhsuFtfdhTjvi0vfh3LPJ4zIxsnNto5BlY
 OgqCFYhv85gdaTzAKm+TYUISbpug2WAEAqehsSoOgpPYm9A5e37FbKtO6
 CKrKkP/wz8pyS3af93Hu4vNSUSPrZa7Xndvssdya/2ejTAlcp/m+GgUuB Q==;
X-CSE-ConnectionGUID: xe1r9K5RTlyxamovbA97Wg==
X-CSE-MsgGUID: 9ERYg8L4Qv6B0PFmpRm+0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50810029"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="50810029"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 21:39:45 -0700
X-CSE-ConnectionGUID: q7uE2YeZTC2yUZ8km3u51Q==
X-CSE-MsgGUID: P5iZVaQQRNS1aBRBK8o4Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="148795378"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 21:39:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 21:39:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 21:39:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.77)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 21:39:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=it6H+xSq15u/mgv9dZDPV2mCt0egAB/aa6axJTQjpDuyeXGNb+1qPGg3ZuMd8M6OQrI3zmB87xWdsZn0MX/bOH6iswWD1F+1TP6JO29jehE3mFeASwMbdzsOyUN7XvPuLrE/4P+wgAL8vlYubMfN/xJbMqBNOYef0AoXQJ714lT1crei63zX/AH6jI9zVugdoeCA1pIM4gicnGWxZg9IW1enqqchpPuHU40LAaOQwNerDjehtfw8i78WSgPIolWxW5JxaEH5YTEbudprStQM52eBURGPCJoR8ZPB8EpfYCVeY0OBq7vrN1w9NnPMB3YekeudoCMFQheV0OZoulQkyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InyjWSJVeKv5QCKNjECAnWfUuzEhg2RKa1DZSSrtdkU=;
 b=FhFPVPFD6ACUKH9zWlkcsDHK7odl/I2puLAZ+ah3H3uCCnkMsN77+OOfVjBf/odIO72op5Qrxvr31g7tWMcx+CsmE3a/cJ8E0stLho690eNpx2vu0aGDpSwjvNORhCajqzZ8SksJ4J04Bp8Z0LZppB23zfwFaZasVTgTsd4gDMs6TxeAaD/Fbh5oDNVXUit+ocMLZl2AVPPfgPbjs7ol8GFxYTEZr9Cy/B2xIoNo9o/vvepdOIuCxLZXtvlefbfiNKudrb3NkhD0G18K0ZKa9rkfx8cXivOR20zafSvdOSyx+zAXQ3jwltnRj3v/Plpfryten7/3ehOJeVazzsF8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6832.namprd11.prod.outlook.com (2603:10b6:510:22c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 04:39:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 04:39:27 +0000
Date: Thu, 29 May 2025 21:40:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 12/19] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Message-ID: <aDk222LBF3u77HOL@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-13-himal.prasad.ghimiray@intel.com>
 <aDjtTXKvpuUdgSlT@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aDjtTXKvpuUdgSlT@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0318.namprd03.prod.outlook.com
 (2603:10b6:303:dd::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 02768d22-6398-4911-01bb-08dd9f33f60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mHtqGiZwKRImpgg+35nJ1n3eqhBCrwR5eKgXl23p7qyvduPDJ+PqmpLCi3de?=
 =?us-ascii?Q?42rrPnMs1Dt4g068U4HrEbZJD80OAMTfaCzKakdNS5OKq9cVAbt7UMLMqsc5?=
 =?us-ascii?Q?4Rjshc0W4cajJ5EpgI+csoHlKGGRJaMzPjnMMMTP1LVBs6x+MCc22NwKeTpz?=
 =?us-ascii?Q?0Ey9U0LkFgFtOQPxVEyljP82ODeyAWEF0pG4qKotS4WZh2lPQ7maTBJo8+89?=
 =?us-ascii?Q?/n6cPEof5J/OVNoHrtHyyDxqGA09BKp+iWR4fM+6YMjG0Tca1zU+13IEBqcD?=
 =?us-ascii?Q?SIe6BIrUDcXzNjm/Q3Cxr+HPKF9qF3OPnMpIROo2P8ApgHFOpey3xssl7jQC?=
 =?us-ascii?Q?jiPEV77J8lhtqHMJgvgGK2x4T1jrcRSSTjWguY1J35/tP3QkvUzduTKxsAtM?=
 =?us-ascii?Q?elTmg5QHRcBIDTykMJ2yx7hOoS3iB4tgkLuorXCBxOklelYu+EBtvvIFM6Pq?=
 =?us-ascii?Q?LU3zlBVWSKAmxSqSRg/d+aqPDIjg47uZhk3+RUu9TdCJHdd/JuNpv/O4/U9t?=
 =?us-ascii?Q?nq5xGRG/xQS/52PVmPi54nCyaiIOtW0oAWFxPPaSXN4691k7fchP5cPP8TZl?=
 =?us-ascii?Q?gfCDNsnEF9AZn/58QMEX/lglcfyQp0zz9QZ9bucn3xdS2NvEjciGUG8brYRO?=
 =?us-ascii?Q?bRSGiLY5mKj0HVMXlR/6FkPEGEqqsUAc6vWxy+3iydYCogk37tbN0Fh98rbl?=
 =?us-ascii?Q?yo3rl7aE/I+H/EdywaAxMmJ7m3PSaUMjW/mWt7Cvv494dBlUi+8wJ7I/ikPQ?=
 =?us-ascii?Q?lBxK2hfPh+v5aE9VGlGjjkBCdlJjKJDZZ3CSOkl9yY9/PWCg0/yPGL3R+nC3?=
 =?us-ascii?Q?mKDluvMoZTlHPAMcewk/hOg7r3byc4LUWmn6+R805FvTOMOxAK/tQCdqcSyq?=
 =?us-ascii?Q?sQJ677L00GZKWlULbw4apLOQb0kRBgve6MsDQ83bhiwvor+p0gUJujN1YNFy?=
 =?us-ascii?Q?MkeQw62EhtIjT/7Bo4yag9dkuShPaulz6QS+3XRCSESonE1RxZNinfA+2l2m?=
 =?us-ascii?Q?IRA88ii5LZPWIi9UAXh8srUPSdUOP/NjWIOEp2Zs5pFErW9F9I/O7z6n/q+5?=
 =?us-ascii?Q?9/mpSzTjdxXvvqZQM7WGnQBEJxrTVFf1K+n8tH1pCyDu/kvp6xmrp8mG19Qf?=
 =?us-ascii?Q?rKgd3asPjw7STgXp5Oa3PxJ1i/iqrWRXuCbhoAjLi7qb1BFF0K/v4vBKmQtN?=
 =?us-ascii?Q?QvLHzdPVi7Xs67yThXPyE0jwpepFInQYxKOcfMdp1Bzg57vaQ5Ij7YkabBwt?=
 =?us-ascii?Q?4wRCaMbBQE1XkgU0KvLFQgR8PjKZch4WYE5v5hqwcTWbgVCGPT2XPxmakbq9?=
 =?us-ascii?Q?I2NpaErujVFz7ukg+oDHASbGviAM5dgNMt7+ryaCRw4xxmwZbdKe+koFc1ls?=
 =?us-ascii?Q?GBEoR53LKg4NwTlOd32gwt/OL02RgcMKAnj547DTiFLsSWAlXvYWNdJtvlZZ?=
 =?us-ascii?Q?MMLzzAhZOtU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AW09h/kqugv7Jq3pD9Xwi8N39Ub8k1Lri5aQG+WA9EPxD/HgUNsV8J0JGVzV?=
 =?us-ascii?Q?sxhqbD7kD5HQANiUDB6zgXdVh4ZeYEUTMwoa/DaXdIi/ZgNnRWSsZuzQs6OV?=
 =?us-ascii?Q?Bs9nRXaC9NaIw2tOh7trjmXhRDybKrzGUfmaeruj4t1d90BFNJYiqbJV4FfR?=
 =?us-ascii?Q?b7aDLrcOq6/1Ke+Sr29FKUZADRrHHdKwEOxixLHNcsRf9YhtdTIiyy3r9MwG?=
 =?us-ascii?Q?gcobDtOz+GyZLGtTvULFc7QbNVp8iRmsh68l7WcjjQJ8Iikrq3VAmLCLIQuk?=
 =?us-ascii?Q?KPcbdaQbAVKHmNSYzs1WCrVtIIsursFTqvGHSVAUtUPnGQd7WyRU0vaLjBMC?=
 =?us-ascii?Q?2DhYP/UwW946MV5ZnIK60/LgQhUCOUr+Pz0WPrSGTjBamZvPVumRhDpEo9Y0?=
 =?us-ascii?Q?PXH7WT+rrtKAUbKkIrd4vefdctnX/S1DCDQDs4NsTSk2mj9TuxpXcJDfRwXL?=
 =?us-ascii?Q?WKoMI5XA2ILGKuxdG0X62dAYSeMkqaGwcLHgAOu/h4g0D9QJB+ABwtB4B8Cu?=
 =?us-ascii?Q?FC0bwhpUn9vEj3bJLFIeanzog2hh02jHO+buN6m2DF9Z0Ccc8ozNYlczFua5?=
 =?us-ascii?Q?UjKhqk/Mhk6HBBvXBTHbS144Uux4tW5amsx3D3YQWYWpjC5PJAdfMhdMc01I?=
 =?us-ascii?Q?oEyL34YhpXLWy3dXSUPSabdanmn7vRY9FNHVxI8XdHE5r46XB/ZAd9Xkn409?=
 =?us-ascii?Q?cF/llNBKl3dyDrsLCxO+5VEtIf5ReqZRy1gFtVw3PMaWE+qPq73m8eyxoEv3?=
 =?us-ascii?Q?o0w1wRDSZvgQODmBnTQf4Ay3vErgB04lU73b6EriZR+O/2OdvWmFrlqxwGNH?=
 =?us-ascii?Q?NW7EssF2HvozPz1PC4d1CZSlAnakG0AoxhALTG565IoKKE8XKERVMWc+cBOO?=
 =?us-ascii?Q?lf9Frm7bnMDiZwmG7vU44Eaqvwvnpeh81EXsVHs16b55Fhd5+XApBsJv3Olu?=
 =?us-ascii?Q?nTLMh5G42g8Yf2uPDsil9qHEARjaXJaFDg6Gjf7dxPQGARI85IS6HCgNrLxS?=
 =?us-ascii?Q?sI388cLRLNVllcjH8P+UUJMP+sqUSNAbZyeQ79IX0BJc0Kv5ScHBOzuJVUrh?=
 =?us-ascii?Q?XqRPXcCq4gQUn91J7Tk1SSFdhUFxM35gm5GnCJbU1K71dIlZL16dovI7w3yo?=
 =?us-ascii?Q?54scrZYuWQ39L5MZ6Ta8PQaudOX9GAR40BT9WzNtwewGZt2yFQ3INoMRrL9Y?=
 =?us-ascii?Q?NgXypA1LiqQmqzO+OEf7KlcN0pywiIjgEXzEx+8gDLCDc9kCsxBOzWr7NJQv?=
 =?us-ascii?Q?VWqYEpQFm0ruUh6VdsUdf+R9lqNyHj6AkpUc/0Snv8Z7aB2ssodgn2Sxd9UV?=
 =?us-ascii?Q?/HdxfwywJM7dzLOIIqDCCqP/U+yqiXJvbD80lvyrwk+P+sgh0QgPsv5csAzh?=
 =?us-ascii?Q?yXExptFVw7Wd9ZY8K8wU3nrTlWZmTHAQr8kWFFMHinpqjB3K6a69acm/eGfr?=
 =?us-ascii?Q?WpO604tQFKjTbuYyJke3omZv3zV7r1yiYf78v0HaUQi+4VVCXtKmHty7h5QK?=
 =?us-ascii?Q?Sd2NOTUTTn6jFs+rkHcaMxEfwIYRz+J5kvxAomA8Q60OoOmBjy7g7gKle989?=
 =?us-ascii?Q?24Oe0hCMDwd8mHyDasJiXAoxdv1n8IF4QQJyPOAtp0FmHSnWjUDR+UIAGuXA?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02768d22-6398-4911-01bb-08dd9f33f60b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 04:39:27.8432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQc8QKCl5/eC70u1oWHr4sRizNl3wqS7T13LNfc1ySERl2f7Uhbg8TK1WDMe6hJUp7Qm/xySjy9K6dbrNKD1eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6832
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

On Thu, May 29, 2025 at 04:27:09PM -0700, Matthew Brost wrote:
> On Tue, May 27, 2025 at 10:09:56PM +0530, Himal Prasad Ghimiray wrote:
> > If the platform does not support atomic access on system memory, and the
> > ranges are in system memory, but the user requires atomic accesses on
> > the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
> > operations as well.
> > 
> > v2
> > - Drop unnecessary vm_dbg
> > 
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c         |  9 +++++--
> >  drivers/gpu/drm/xe/xe_svm.c        |  4 +++-
> >  drivers/gpu/drm/xe/xe_vm.c         | 38 ++++++++++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_vm.h         |  2 ++
> >  drivers/gpu/drm/xe/xe_vm_madvise.c | 10 +++++++-
> >  5 files changed, 57 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 39bc1964089e..ad17ded0ecaa 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -645,13 +645,18 @@ static bool xe_atomic_for_vram(struct xe_vm *vm)
> >  	return true;
> >  }
> >  
> > -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
> > +static bool xe_atomic_for_system(struct xe_vm *vm,
> > +				 struct xe_bo *bo,
> > +				 struct xe_vma *vma)
> 
> You can get the BO from the VMA, so I'd drop the BO argument.
> 
> >  {
> >  	struct xe_device *xe = vm->xe;
> >  
> >  	if (!xe->info.has_device_atomics_on_smem)
> >  		return false;
> >  
> > +	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
> > +		return true;
> > +
> >  	/*
> >  	 * If a SMEM+LMEM allocation is backed by SMEM, a device
> >  	 * atomics will cause a gpu page fault and which then
> > @@ -745,7 +750,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> >  
> >  	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
> >  		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> > -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
> > +		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo, vma) ?
> >  			XE_USM_PPGTT_PTE_AE : 0;
> >  	}
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 5691bb9dbf26..743bb1f7d39c 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -771,6 +771,8 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
> >  	struct xe_vm *vm = range_to_vm(&range->base);
> >  	u64 range_size = xe_svm_range_size(range);
> >  
> > +	preferred_region_is_vram |=  xe_vma_need_vram_migrate_for_atomic(vm->xe, vma);
> > +
> 
> I'm not sure about this. Shouldn't we just set preferred_region_is_vram
> at the caller (prefered_vram || atomic fault) in the fault handler?
> 
> >  	if (!range->base.flags.migrate_devmem || !preferred_region_is_vram)
> >  		return false;
> >  
> > @@ -812,7 +814,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> >  		.check_pages_threshold = IS_DGFX(vm->xe) &&
> >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> > -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> > +		.devmem_only = atomic && xe_vma_need_vram_migrate_for_atomic(vm->xe, vma) &&
> >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> >  		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
> >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 8208409485f6..e5fc2c2be8b2 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2930,13 +2930,22 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> >  	ctx.read_only = xe_vma_read_only(vma);
> >  	ctx.devmem_possible = devmem_possible;
> >  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> > +	ctx.devmem_only = xe_vma_need_vram_migrate_for_atomic(vm->xe, vma) &&
> > +			  IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> 
> I still wouldn't set devmem only for prefetch as I don't think we should
> fail the prefetch unless we absolutely have too. A fault will still fix
> up atomic faults that are in system memory if needed.
> 
> >  
> >  	/* TODO: Threading the migration */
> >  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > -		if (!region)
> > +		bool needs_vram = xe_svm_range_needs_migrate_to_vram(svm_range, vma, region);
> > +
> > +		if (!needs_vram) {
> >  			xe_svm_range_migrate_to_smem(vm, svm_range);
> > +		} else if (needs_vram) {
> > +			/* If  migration is mandated by atomic attributes
> > +			 * in vma and prefetch region is smem force prefetch
> > +			 * in vram of root tile.
> > +			 */
> > +			region = region ? region : 1;
> >
> 
> I don't this logic needs to change until we have preferred location is
> implemented. I don't think the atomic mode has any bearing on prefetch.
>  

Sorry for multiple replies, things come as I look at other patches.

To be clear, I think if xe_vma_need_vram_migrate_for_atomic is removed
from xe_svm_range_needs_migrate_to_vram, we don't need this logic as
region non-zero or tile in the final result will always be non-NULL.

Matt

> > -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
> >  			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> >  			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
> >  			if (err) {
> > @@ -4178,6 +4187,31 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
> >  	kvfree(snap);
> >  }
> >  
> > +/**
> > + * xe_vma_need_vram_migrate_for_atomic - Check if VMA needs VRAM migration for atomic operations
> > + * @xe: Pointer to the XE device structure
> > + * @vma: Pointer to the virtual memory area (VMA) structure
> > + *
> > + * This function determines whether the given VMA needs to be migrated to
> > + * VRAM in order to do atomic GPU operation.
> > + *
> > + * Return: true if migration to VRAM is required, false otherwise.
> > + */
> > +bool xe_vma_need_vram_migrate_for_atomic(struct xe_device *xe, struct xe_vma *vma)
> > +{
> > +	/* Note: The checks implemented here are platform-specific. For instance,
> > +	 * on a device supporting CXL atomics, these would ideally work universally
> > +	 * without additional handling.
> > +	 */
> > +	if (!IS_DGFX(xe) || vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_UNDEFINED ||
> 
> I think DRM_XE_VMA_ATOMIC_UNDEFINED is same as GLOBAL, right? Isn't that
> the default? Or global the default? We have been told whatever the
> default is, just has to work for SVM so maybe set to GLOBAL by default?
> 
> > +	    vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
> > +	    (xe->info.has_device_atomics_on_smem &&
> > +	     vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE))
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> >  /**
> >   * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
> >   * @vm: Pointer to the xe_vm structure
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 8151b1b01a13..edd6ffd7c3ac 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> >  
> >  struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
> >  
> > +bool xe_vma_need_vram_migrate_for_atomic(struct xe_device *xe, struct xe_vma *vma);
> > +
> >  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index f7edefe5f6cf..084719660401 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -69,7 +69,15 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> >  			  struct xe_vma **vmas, int num_vmas,
> >  			  struct drm_xe_madvise_ops ops)
> >  {
> > -	/* Implementation pending */
> > +	int i;
> > +
> > +	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
> > +	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
> 
> >= DRM_XE_VMA_ATOMIC_UNDEFINED, right?
> 
> Also santize this input before here as discussed in patch 19 and 10.
> 
> Matt
> 
> > +		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
> > +
> > +	for (i = 0; i < num_vmas; i++)
> > +		vmas[i]->attr.atomic_access = ops.atomic.val;
> > +	/*TODO: handle bo backed vmas */
> >  	return 0;
> >  }
> >  
> > -- 
> > 2.34.1
> > 
