Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138CCC369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 20:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7DA10E464;
	Tue, 29 Apr 2025 20:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPOCnuZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B493E10E464
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 20:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745958456; x=1777494456;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J0kQp9PG7XPlgQQGW5Zf3mHr8uafS1mr4roHWAVQGkM=;
 b=WPOCnuZ5jUTdMvPFEZ6wov3gKkd6Edx0jSejHmztSUhXSgxwzWb2ubab
 jyB+MtBznwLTrjfQ85v1w0kjqtezm4L7fEvlBN4BOfNkaGg3pjX8nnJFL
 rtv9U+87uujqrMFTE6DNWULuIzdHokc1vk9zmnnX/VqtPTFcdM0jANUnt
 1QtmXzEpgmi0soERHgog8YrimyArcmnGJHDiwO7GcEysQd89nqCI3h2t5
 9GsLSCEu6QnBl/VQlEOdFnE0w7lef21Lrx3y3rZREz9qZiUXTVEx+rfWu
 4TAO1JnivEdB1XwmJwc0IXMZiYXujUKkSNlWDe3SdS4WWIWAga3vMbZ3e g==;
X-CSE-ConnectionGUID: 14jNBMDWQciZaIV7tvqofw==
X-CSE-MsgGUID: FLqbWPsDR/SDHCGPr2JZ3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47314405"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="47314405"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:27:36 -0700
X-CSE-ConnectionGUID: xCv7QvwRST+hyJH0oNw0Tg==
X-CSE-MsgGUID: WWNfx0txQ+aHQaMA27yUeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="139036389"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:27:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 13:27:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 13:27:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 13:27:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgMUD3Ngp7d3/CifKLF41LhZXBx9rENt8FT9qn92EU4+vqxGevGvrPqJVeWr8igXEwEMB0gv8uke0cBmARWUPeiWTphhH75OyAJLxXlNrt+sb16Y9OBVeJsv7RoVtJsG+tG9J1fT0D4QJkupQesiNMgIEkCbaLlOBhNlCtT+/xIfI/b5tLNuWBOcXNx6EDgkQF+PZF1LuzeyyP6CjMLJi7qujJTL1iMmIgRfRqL4dbKxq2rsfmmro7fnZgZH3FtooAVG0Mb71q+moeeX7BRFtwGDQHD/hf7ihXA1Uwfxp4jyGQz9T3U3aMUc8Mx5FlLgA9SDJ0YhB8IVwL+3Gk4ctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71aOSZugNjJvgXOJVetYdf85k/V31pao+7KL8rwNs+s=;
 b=OdQWUsbr6vn8f4sH+a8wYqRtQQNmxgiY/e2wyUHeKCKImp8SLB1BxP5n7vo4iW50o0ba0CPbHmxzKwveLXgU7CCB/i/GmksiO4L9+RByJiycMSjWIBrZtBVIu4T0k7CH1CPiKvN+RgnH6wYU8pwarEUQgeDl5HQj4lFormJGX8kfohhsFcAZ1GaJmnDECxlunbYMDvTU5CSyUuapp9rxNS2kTyQkLvSfE51rVZcQS0jWyJXYW9eqcVr/oXE70tQRE+JUGsyThx9l6LA2FqpTd2I84Na/mDQql6iWb0HtH9J4W22YlNtnTNrVyyTCQRmcldJ2XY0KDeRgd19j7VLPQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 20:27:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 20:27:30 +0000
Date: Tue, 29 Apr 2025 13:28:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v5 0/5] Enable SVM atomics in Xe / GPU SVM
Message-ID: <aBE2hW0ueLog0H8X@lstrano-desk.jf.intel.com>
References: <20250429201915.1025600-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250429201915.1025600-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: c7efc1af-25f8-44a8-fad7-08dd875c442b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DQyKgooFAJ8K1KGhkuVyeMrApUcMSN9uJZ6+sD9jYBUP0sHksoSt36auzZRH?=
 =?us-ascii?Q?Pb3C7kRGqiEcmvZAP84bDAGLzvs1tsrEbgWDRy9pJ/MjKYwbzBBpo60+Oljj?=
 =?us-ascii?Q?xB0qdfe1rUZ6CHYp2Cqoa2yI2kHjUdFizADdR1YVe3w6hHnxl5zWPGk84VXW?=
 =?us-ascii?Q?NV8n+MFBjgg4sBXfWsZBi4afkyPRN0IYVjnRHocXUgJwu4t+93GMpLMyKIY6?=
 =?us-ascii?Q?49MNBuDJ6i7GgBzjTSZ6iuq6NCy2Ob+hYaYw7rOlBwYnZMZbQFhMTE9R2hJF?=
 =?us-ascii?Q?h7hjxyUHClAhB1EN+HGzlsPsmyyg6uZEBTkdYJwAa9+mUemTdJtIYK4zoCuy?=
 =?us-ascii?Q?h0I4g9977RaK7XtVomYJkG6PqLkjQx2gUOXUXvrFbIw7TwPvVn8PqQFMxwgz?=
 =?us-ascii?Q?Xj/vHps8UC8Ub4R/TaqQnxOIoiHPFc45krDST53+zk0gfw5bplA7DbbKVa1c?=
 =?us-ascii?Q?CJOE4UH7LhD9gP1+4cf3054ycf78iLJqDff+5C0UquqVlKwP8Ql0PmwtbMG2?=
 =?us-ascii?Q?jUJW4TNZKbzMvLELOKRKM5zT0/ce415Uy8It13I4pTXqBup89uFcn7iVEkow?=
 =?us-ascii?Q?q0cMEKE8MWf6eJXVDxrUoFBwJ4gg8RlMzFbhzj2ZNcZ43Ptkap1yE1GlvvJK?=
 =?us-ascii?Q?7aoiSBhwtuQyMQWDplPP7bIIAsa4JVopXhtLzrXrO692MhcN5iM8tjcRX6EY?=
 =?us-ascii?Q?a4zwqqGTcxWlWs83x0xtGXkgmGmn07kAJV9OyLwdXIVNElk/NmC84pUlkPNM?=
 =?us-ascii?Q?BzA4bfW1Z9bMOn72FfANASjGu63+4kkW3oKrIS1S5ZIwZxX0v4Tf+swVmqAN?=
 =?us-ascii?Q?lwk2uqLF/6aZZLcFDryf3iEP+Tnw0C0OQZ5n4hWW/T8vNxEopTi9c8R2osuR?=
 =?us-ascii?Q?niyQHBU1rj7tedfkmFYxFSJlSKr3d3+5jWDRAz/zwwthOBuL90FvJG8D7n8X?=
 =?us-ascii?Q?zeeIMITXQxCUD74FX+7LKG/XyWnwN9kS3h+zP781MrizcI/s97dCBtZ1rVu6?=
 =?us-ascii?Q?6eb7LW6TiBQzyf6sZ9ZFao69zIWoI7dvkE15z/Mm8a67Za1n1PotW5ZI6bro?=
 =?us-ascii?Q?Gkdv8ve7cKcYWNvStxqoh1EuHo5S+tFUivoXxrw0wFxKeDB/lDxRPkrNuEK6?=
 =?us-ascii?Q?Z4UeyNAHz1GJImcsuTRmMkN2V9rYrfDtQdgM7q8+U33y5FMDoDZ3lVw2qilb?=
 =?us-ascii?Q?9MemDE4ELleQwT1hx0ZLmurONzA9V8xULbgc6aeB8exjHAK9tOJOn6zKWLqP?=
 =?us-ascii?Q?IahuwR6Oep8GIjp25V0y8yAXiGgPdOCaU95ujYw7ECH69USI/rnh9VAyXjED?=
 =?us-ascii?Q?opaEl/XsQHOMxyU+0E6mWIN8TP7eZe7hKO4qCVtr5niruHbk0hAQizgVrpDC?=
 =?us-ascii?Q?UEvKhGbBsnzhWrliPC7TfdJWO29GHD0sAVoSkGkrGPvQgwHuoV8tevBKdc/7?=
 =?us-ascii?Q?KXZNrtlNSnY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?virpA+cZPZ+tTZD1yn5n0I1FHW94bpOpV5/ZwEfcKinQ2JJnAoGfFfnlz1sz?=
 =?us-ascii?Q?C8N7sh0S4sNcGHhcBfwoRnl8+9406/0YqkkobGwNupxhEuKuLMO8kNQpQcEZ?=
 =?us-ascii?Q?Hl3dmfxD+P1FlMdcPHhm4k2mJBBWU71nGa9MK1iikQ2Zoer2uwIoO7b4wCw7?=
 =?us-ascii?Q?JN2CsqQQePvUG+u6+060ymBF5X07SUSYgiYMEzo0Q3/xEhORpu2x8PRm7LjQ?=
 =?us-ascii?Q?PeyN54HIkp47pi7n/DHmV7c34s4wr1vzGe0yUiXpykhhdTm/N+35WV4gMEz0?=
 =?us-ascii?Q?HPeyTH5GvvIJb7+fr3kiv3nAKkN6otHG4JCxB/Tescja6IstrJ8HZAayjVof?=
 =?us-ascii?Q?KXtoSL9Zsq8rG/ELvdql9qW8ZG/9v6s1Tie2XU9rkuvfdODQqLTO5/iBFvKJ?=
 =?us-ascii?Q?7Njk/UR/Du9S7dg7R8RzSi9qUnvfzKOtjKbRF/9A+uZXJFkM+gvo3kn38S7P?=
 =?us-ascii?Q?uz2YVlaQzyUpnNEjFVZd+zflQb1ZnvP8GuL4b2mBMe8AfTWlOfYD4zi4gWMh?=
 =?us-ascii?Q?SmD773OnvRJxr8WrXBzULRUQKN+YuTPh1iTBDuYFRBbyvDuEj0XXkyqKiaS+?=
 =?us-ascii?Q?UYLQwHQPqwUTAbJ+lANl6JJE+Bf5kETHLdNFZL8cgNq9qG+End2o6otG5G0d?=
 =?us-ascii?Q?xFt3BbxLRNiid+IFv9xk7vx78ETZNmEW0j5UCKt3mMdvzBpzIryPImW+NLhB?=
 =?us-ascii?Q?dsk0QGUUyxgIy0EYr0xqXb7HcksDBpMwS5rZKC4ue+7AV2HvzpI1bgvq8/28?=
 =?us-ascii?Q?Gjp0VAbKEB5UzFQjsh81BzFeWDNW4DiNUGB+04JhGpK1w7Hwp1Uf8eevxFAC?=
 =?us-ascii?Q?oICszWTbvErog8vmKOA0PXrSUvo2vN5JYxG2zxf2/iqm7okHTnugPwWhrU9s?=
 =?us-ascii?Q?IcJufsax/SdlTNAPPmFoz/6qzc31AORz9RCVP6pW8/VfPKW8Werm+cVU7vuf?=
 =?us-ascii?Q?1W4jrprEpyu6c9t3Ft1GQiYjbG9B4Mzekgn5HThoAecgbtS+2/yO0Fp0eSv9?=
 =?us-ascii?Q?z0ImlXj9J0vdVyjcK7Mk3yZdFQFioBrpUGFXH1iY9nzvzxiaylG3N8qHchUi?=
 =?us-ascii?Q?ERvvc3hg6weY5jmPd2ll54SXBs/IYU8Xl2mqjxmQ1eh5Tw3zRHYo7xX6Y+Z7?=
 =?us-ascii?Q?PWo7teSbks4d35eFFffkSZy9cEf4PKZcTNe7oKaSuEDf1XJV60wTrEL+V6MU?=
 =?us-ascii?Q?CGTHMWnAViUaZIdIdTTZNo3MGF6Jm3l6KHqWVoN8nLq4lN3nduw382J9VEyw?=
 =?us-ascii?Q?Cfqs7Vkq1OZDm6qx95eAZ3RFifi6rNvHCgY/ibbbXrpBz0+hf96od959KanX?=
 =?us-ascii?Q?OYqzaXgEIaY/ICrpePwLhvUwv17pwOvNlP2VJ4TXuG5Viv1IQg8nVhheiqxJ?=
 =?us-ascii?Q?BKgSmIEDsIYB6Kvxoi2+6DJyEEGmnLPocMmDtszsGnjEpLu5qWZUboPx5lcY?=
 =?us-ascii?Q?s8Dvk/gCzq6hVjxrUhKSt9T2LuOnqEmX3ksdkbEMyMAIXCsAIF5lcIlFsm2U?=
 =?us-ascii?Q?aX76NLXRnni0HHWKAlIYgprI06XTOAfEkQIoI46qX9sp+VjEbyQdDYDy6w5N?=
 =?us-ascii?Q?5w0fXlKbTnDMWAnFzoeOR64omLdtceTdRDtKyT454Q5pSIYmncJXbEDljR+d?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7efc1af-25f8-44a8-fad7-08dd875c442b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 20:27:30.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUZUBJcjpkbkXGYpRiZohyGhQ59b+pOD0rS9u+mwP2XtdvnCkCUYMyF55YorUH08A2nuasvc0DUguvjgGd7pcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
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

On Tue, Apr 29, 2025 at 01:19:10PM -0700, Matthew Brost wrote:
> Minimal set of patches to enable compute UMD SVM atomics.
> 
> Collaboration with Himal.
> 
> Matt
> 

I forgot to include the RBs on 4 patches - only patch #2 needs a review.

Matt

> Himal Prasad Ghimiray (1):
>   drm/gpusvm: Introduce devmem_only flag for allocation
> 
> Matthew Brost (4):
>   drm/xe: Strict migration policy for atomic SVM faults
>   drm/gpusvm: Add timeslicing support to GPU SVM
>   drm/xe: Timeslice GPU on atomic SVM fault
>   drm/xe: Add atomic_svm_timeslice_ms debugfs entry
> 
>  drivers/gpu/drm/drm_gpusvm.c         |  14 ++++
>  drivers/gpu/drm/xe/xe_debugfs.c      |  38 ++++++++++
>  drivers/gpu/drm/xe/xe_device.c       |   1 +
>  drivers/gpu/drm/xe/xe_device_types.h |   3 +
>  drivers/gpu/drm/xe/xe_module.c       |   3 -
>  drivers/gpu/drm/xe/xe_module.h       |   1 -
>  drivers/gpu/drm/xe/xe_svm.c          | 109 ++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_svm.h          |   5 --
>  include/drm/drm_gpusvm.h             |  47 ++++++++----
>  9 files changed, 172 insertions(+), 49 deletions(-)
> 
> -- 
> 2.34.1
> 
