Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7F0C369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 21:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0883410E284;
	Mon, 28 Apr 2025 21:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZfsks3H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7252010E284
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745874163; x=1777410163;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a3MAjDhLOoiBwQGdveSD/lHnKIPActhyk0c/SUQufwg=;
 b=MZfsks3HX8eU59M+YJORa5sFU/mw31WjmHAf/EhrIp82zApyEHtxk089
 I7jXQ3rcYS4ULn8TVwKWccXkrHGTdnHuQy6G3ysz/gfpP6sbF2plcip3U
 yNrqDbxAFnjYb5ecaJzU1uveXdAlNNxTaKSTZJ7cPoBDsazyrSAvlhG3L
 CWwQ2AGk+Ff+SsDLplTLrUZSeV6GOf6x7I4HiN06IYdxUiLEcIV1d8p1E
 4Sj7byb8GZTJ59+q3X2NIu3CKbiCiSFPBvij5Ew3kYRL7/XNw6puZ2BT6
 mCHwDrRQwfUSNRi3G+hANoTg38x2cPkVq4lym7VCiFMFAZxTZJW9FK/Yp A==;
X-CSE-ConnectionGUID: HnyOQPgRQnSK7/UmhcgdAQ==
X-CSE-MsgGUID: wnA4Cx3dS6yjPEs6T3ir3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51298750"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="51298750"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 14:02:39 -0700
X-CSE-ConnectionGUID: Wh4lM2qnSoWUlHN/WUYW/A==
X-CSE-MsgGUID: Xn5enkOfTdi0HRal4Vqw3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="133531193"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 14:02:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 14:02:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 14:02:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 14:02:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbKz83t1J8l/VxG+SgK3eOSlc3xMziKMtpQ5VkPtkfH1nNcD4rxcq6msSwp7Jxfz8BdY4m5abjIwcTnZJtVwe2NM02WrPoYZ9tEsgJx23Kqeu/rla24m7sx24ZogHjf7GzBNPz5JzmI2CG6Ij7N4Ys/6pm4BGN+UFOpzycgfKy4dgsFN4HdsgR7SHRZ022HXY0VWgUcw8Oxe0ovwjMbKQ2GnMUPN3C+6IjIpT1PsQSar6Q28gvqqujlIn84PdptfCsHkhOy+2spsrNan4bij+ImJE4oX98a9wnvBvIjJ+xkmYpjzzlK+ErWvHiwPzzkp+JZg0zHePqXdKHMiBzfmFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8zq2jvatRB4o5xx89ne6vtXffHXoWguHwUSmoVr/+Q=;
 b=vSxPh4ibe/lTG4LyxaIB/UVLTwT8P1FCU0roXPw9n1c6Ge2QKc8rhQ26jxAe4nr6wcYK4DWQhq3bds2qzvu9p9UPtnNWICe5BthRzIF4j3nIU4SxOC6Hb9g1e9MMrv8KmOenROwSFRjb1JxPfsrCk5NaRepUYeiNS+SuOpAIp0miiPHVLjU0/PIr9mimkFAtfTMUTX3pn4br4WIAKSXZHzaJk5hdDhuJ2tiqRrQCa6eQgJg4mxjZ0bOQ+kvP24x/Uu1yVVWVf/gnlK3O3KYHfmn5xdFSOzjzu52P2JCJyIm1kHzK6bl3634VCG9FKtKoIHQCHI1kl1txoaqfUfHvlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5194.namprd11.prod.outlook.com (2603:10b6:806:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 21:02:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 21:02:33 +0000
Date: Mon, 28 Apr 2025 14:03:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: upon page fault, use generic uc fw
 instead of guc
Message-ID: <aA/tNSnOE2uWjNgI@lstrano-desk.jf.intel.com>
References: <20250218112702.262780-1-dafna.hirschfeld@intel.com>
 <20250218112702.262780-2-dafna.hirschfeld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250218112702.262780-2-dafna.hirschfeld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5194:EE_
X-MS-Office365-Filtering-Correlation-Id: cda52baf-534a-4744-6c45-08dd8697fed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h7B7KOP+thBaZgh4jyFEDvPDtjEuOHW58pCaq/RorOvbZZ6tlZKzTFKdZg3r?=
 =?us-ascii?Q?at/Nu+jVIWKzLmIW1acUQ3l3aIoH4XJkC2/3TPJniA1kmulCQOU0ZFrpmuD5?=
 =?us-ascii?Q?JcGlDNGlFgi0XPfpZxkXFNgcxb2akOhmj8phQiloqVcGs4dQoARJ4sDQRHd8?=
 =?us-ascii?Q?Z1XtGs34G22piJxJKL448XoiW7ghVGsn0ymPe6q6UvGAGsOiiSuGKYnPSiyy?=
 =?us-ascii?Q?aQ/T8jqIqqDgEPuv9nYndx16kJtMCRrBZlzMXecsZC6W1uWc92DOXKkMSJCO?=
 =?us-ascii?Q?fwZDiitVEpnqFkdTaIncPxNh3WMRPGrauyyDPLaO98hWGT5pIFdcfByQ0on6?=
 =?us-ascii?Q?Eyw+eoYEGZaKY7Btywko+yGZYwNrRPgYiSJKmIYkP4VeZAxjJ03gZSEB97jF?=
 =?us-ascii?Q?FqN77CVDoIK7BTuoH7mCDE4hRk2N/CWFvsoGfTIIowpuDBxomTxelY0jYyE5?=
 =?us-ascii?Q?RwRk16Sb1eATwJf7WeXSAEURbP3qvOXNh7KdfLafQJzmJibwd+kqzBVTZ2J0?=
 =?us-ascii?Q?pO8yYnTYox/VYg5+L5kPdsnO7W+DIOfpQXl6hjhhsMcl/zs/xxia5BANCOT4?=
 =?us-ascii?Q?JnaKwNls7nM0nWRwfk+0IoEUjJNQlhlbSTOhznDSf9d7Iuas4oLPthp6CusR?=
 =?us-ascii?Q?K2e6BYEUn3SyNTHkwecFkLKGxrABo8AQWOlLcIR4oSKuH9xeRKSc9LwhCluA?=
 =?us-ascii?Q?bQiZri6HOwEZ2zUTLDCN0MRQCfw7WTFxMLsKS2aNOiiTJApGsdRT1fCzFYeB?=
 =?us-ascii?Q?F+L74DRLJWBwT1YQ6cXw/jym+8JuLXwFAkzaTLqYFOiznUtdYC5PONHvarM4?=
 =?us-ascii?Q?80bdN8Ygxr+C5tG02xHqrEUY0sDxU2VJhZRi+vbKLtg1tVC57D5r2aqzzqQN?=
 =?us-ascii?Q?IP3gUmK7MNrwoiyApB3717YIMtT59975Nit5c95HEb21/5aV9EZmhOPZ/H9p?=
 =?us-ascii?Q?k+uciXXrMLWjMx6Fy1sSUPekcGXYTK4Jh8Cs0+yVI9K5Xgp5bniad0w5VYf0?=
 =?us-ascii?Q?o7Hvxuss0v93MndFkei0X/RcYtNt7ePh3a05ECvjaHupcXxDPMFRUS+dyF7X?=
 =?us-ascii?Q?ZiiV5Oe6TwXVCFNwjZQrqkIqHLK6867w3MIgafCCRXeVwycNeSUjwtURHxxn?=
 =?us-ascii?Q?yi+2O2sv1R6P689MjKPoHPGBvqJ9t2tZ5/4nDR/cse76IhXITR7bMrovjZSj?=
 =?us-ascii?Q?w0iLu+O1GlXnMbUflOTr2SUjOoVdayHMfmQQqgUlGs4mggT3xCi073taaG4S?=
 =?us-ascii?Q?bcmxIoDtXhqi40f+QkMP0S8QtZzzYZWnW7WYiJUEkqqFZiLXU2vBSGpIrC1H?=
 =?us-ascii?Q?sNVXck14Y9snNwYlD5DCLKvb+2MHUoz39lLkZXtwYwSlsREDyfXdAas0BWV0?=
 =?us-ascii?Q?HH5MFug2sW7xYzwlak3kLOviKfr1IZ7+CK7MGrnfI7VGppCgKQPyoDyMBhZO?=
 =?us-ascii?Q?5ql7E1VgXRg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FDi6IY90EP4Vmu/LUBDi9tGkLmzCeso1Pen1A9/XzTjft369Osleu2rmOFdi?=
 =?us-ascii?Q?bgFYbsZgJ4zu59Lp/+pnURXX1/OR1zhpJBnMXzNzZSoH/TF4s2jMsCghiaHq?=
 =?us-ascii?Q?RNiYEXzsiWUXyYFUQDd3SFNwK3Nbj0iJe5mfbQvUgslYxKjvVGReTQq4SIBM?=
 =?us-ascii?Q?sKNPBHza7sEx4oVPHoyW+4aDgxH5kfUfnjaKMhYVV2sFqKzcrfgZ48JikJD0?=
 =?us-ascii?Q?Mqi99Gq8hxyRJOqc1Q6F7lbO4/QsJnugFKbdP91P2Q56LaHM+hoU985Tqg/a?=
 =?us-ascii?Q?i8aBUy05U2Gg4Jr9OMFCIuw6Dmk5zt2dyIauom7WAwBM39MNDaqWj9WJ0tpL?=
 =?us-ascii?Q?NCSA5zZgyUpsiCB0PiGSYJFi9HU9Ux0L/M6jgMB8Qz2LDi2IaYBtri4T7tii?=
 =?us-ascii?Q?fy+PDfZalzAPoSLwasZtgTrYhMnGIzqRSJOIIHgMk2kQ151vYdq6OuUdUKdO?=
 =?us-ascii?Q?rM4URz4bkGDyhqDrjlUYKeR9hQpxi9Rjxg+WBW1gM5tY9k8hKvEQyif2oL3O?=
 =?us-ascii?Q?s/DYgkrUNJunPImEy+pDuF2o812g3lJdiF/7AUuoW0HHIZ32Nkkd9O22x5k9?=
 =?us-ascii?Q?ezGHjCUHQkwBNt0giPkqIqKOcqfaIKHHUo+7j34ortTQnwnKAsH/KZ4jlrW/?=
 =?us-ascii?Q?mGXEOUOvXzgF348PWYC5itYR2S3PKMQCyeXuxJ2QFuHDtkLgxmBPlgaLJAEk?=
 =?us-ascii?Q?CRxXlZYgoZJFoxXmjcr5j9ykWlB0v9PUAsPivnyL3KWnXc+FHnQTFBW1gmGQ?=
 =?us-ascii?Q?oUPwQSf4ROW5Rq6Mm3s45g7qXrisUgPmNn0YI3q00GOQuCFvYtiEVUK7OTW3?=
 =?us-ascii?Q?CSaL7TgUVvKDSnXwwIPSGd87WbP5N3Rm43NCPb0iKWYhay/PsSXNbjnT439I?=
 =?us-ascii?Q?cbxrr5r4TqEVu4H0HHZ/5rySFXqiLkBHd3uvTBZEKUU2dbdcLvs5i3K9MDHp?=
 =?us-ascii?Q?H07Ckc5XnzzbzgASuTWbmrSTNPVPiEQNT1CsVOdsEKexGYNdp60p7RxtK94a?=
 =?us-ascii?Q?da1pQqwZqyWoHGNFX8IywUNRdv9vIqAfesEJyi57v5C8hULpZDAtxWNBK4lJ?=
 =?us-ascii?Q?DaxXtgx3Y5qVBD7R8muGnB3vSAmnvzz9rMChiHVmQV8EZHtX7RVr0m2n0XAO?=
 =?us-ascii?Q?SmxMRhK8/Xob2c9LSbqPi4+B9Isz7W1fxvb3R5tCMJE7AQsXKpKrZLTgrgOf?=
 =?us-ascii?Q?XUCmIGT5p+ENKvs6qgmVnu0gJ28D+SKmSQDd7Naa2zqTvHNPMNoABTlcXElC?=
 =?us-ascii?Q?NLDH8sN9N8E9S9w1EK6anrVXRYYAGzjnv2z4Ouxs4ERKg1XrFUZxT5BLF5Cu?=
 =?us-ascii?Q?K/8XRvzQx4SVuA0ZvmuJTdbKGzb6DorVkC/OTw/zVLCTNtI8sqrd8iTsribo?=
 =?us-ascii?Q?Gl+7Kh+rUpqSI7tvh7XRYzHkQUGfXaQ6dOlPaJQZbLYICp8SlXCzTb+rmX2g?=
 =?us-ascii?Q?Im+AMxcyO0OdtSP7vUmYWp/wx6H/sWigqxFq+ZH0Rp1y1C1IO1eJCPIlwC38?=
 =?us-ascii?Q?TUgpgcHwUlF6HWBCYBODc4+aGKVRONIZa/aBbCCR/oKAdjbql5sFRRWzzPZt?=
 =?us-ascii?Q?0JICFYX1aYJRAoj3ODF5W+i4QCM0jYElFqWEPUBdYkmY/ONda16H4KOhGdMb?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cda52baf-534a-4744-6c45-08dd8697fed8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 21:02:33.2676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0p72QH61R/vK3aVxjKuZCryM1udE+u/vggzmUP5XGemsbvguPhTLubHiB5bL0zv5iFrFrktOIGAlaHINU41oOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5194
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

On Tue, Feb 18, 2025 at 01:27:02PM +0200, Dafna Hirschfeld wrote:
> Future asic will have different firmware to handle page faults.
> Change the code in xe_gt_pagefault.c to use xe_uc_fw instead of
> xe_guc and add a callback to struct xe_uc_fw to send the page
> fault replay to the fw.
> 

I think this is on the right track - the current code is clearly layered
incorrectly.

> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 24 ++++--------------------
>  drivers/gpu/drm/xe/xe_gt_pagefault.h |  6 +++---
>  drivers/gpu/drm/xe/xe_gt_types.h     |  2 ++
>  drivers/gpu/drm/xe/xe_guc.c          | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.c       |  8 ++++----
>  drivers/gpu/drm/xe/xe_uc_fw_types.h  |  5 +++++
>  6 files changed, 33 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 51c4bcc769d2..c1e076e14219 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -11,13 +11,10 @@
>  #include <drm/drm_exec.h>
>  #include <drm/drm_managed.h>
>  
> -#include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_gt_stats.h"
>  #include "xe_gt_tlb_invalidation.h"
> -#include "xe_guc.h"
> -#include "xe_guc_ct.h"

Yes, removing all GuC specific code in xe_gt_pagefaul.c is a good idea.

>  #include "xe_migrate.h"
>  #include "xe_trace_bo.h"
>  #include "xe_vm.h"
> @@ -246,18 +243,6 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	return err;
>  }
>  
> -static int send_pagefault_reply(struct xe_guc *guc,
> -				struct xe_uc_pagefault_reply *reply)
> -{
> -	u32 action[] = {
> -		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
> -		reply->dw0,
> -		reply->dw1,
> -	};
> -
> -	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> -}
> -
>  static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
>  {
>  	drm_dbg(&xe->drm, "\n\tASID: %d\n"
> @@ -322,9 +307,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
>  		PF_MSG_LEN_DW;
>  }
>  
> -int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +int xe_pagefault_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len)

s/xe_pagefault_handler/xe_gt_pagefault_handler/

I think this needs a interface refactor.

This is still assuming the 'msg' field will be the same format across
firmwares which I don't think is a assumption we can safely make.

>  {
> -	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct pf_queue *pf_queue;
>  	unsigned long flags;
> @@ -336,6 +320,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  
>  	asid = FIELD_GET(PFD_ASID, msg[1]);
>  	pf_queue = gt->usm.pf_queue + (asid % NUM_PF_QUEUE);
> +	pf_queue->fw = fw;
>  

This doesn't work as if you have multiple FWs queuing up page faults
this could be pointing to the wrong firmware by the time the fault is
processed.

>  	/*
>  	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
> @@ -390,7 +375,7 @@ static void pf_queue_work_func(struct work_struct *w)
>  			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
>  			FIELD_PREP(PFR_PDATA, pf.pdata);
>  
> -		send_pagefault_reply(&gt->uc.guc, &reply);

I also don't think it is the job GT page fault layer to encode the
response to the firmware as that could be different between firmwares
too.

So roughly I think we something along these lines...

- The firmwares parse the fields which GT page fault handler needs to
  understand (page_addr, asid, access_type) and passing these in as
  arguments to xe_gt_pagefault_handler
- The original FW message is also passed in, we define max length for
  this, this is just opaque data to GT page fault layer
- The firmware passes in vfunc for send_pagefault_reply, this accepts
  original FW message + pass / fail value so the firmware can encode the
  reply
- All the above is stored in a pf_queue entry
- Internally in GT page fault layer we drop looking at firmware specifc
  'struct pagefault' rather the new format which encodes page_addr,
  asid, access_type, the reply vfunc, and opaque firmware data.

This will be more data in the pf_queue but it makes the GT page fault
layer truly opaque to any firmware interfaces.

Does this make sense?

Matt

> +		pf_queue->fw->send_pagefault_reply(gt, pf_queue->fw, &reply);
>  
>  		if (time_after(jiffies, threshold) &&
>  		    pf_queue->tail != pf_queue->head) {
> @@ -664,9 +649,8 @@ static bool acc_queue_full(struct acc_queue *acc_queue)
>  		ACC_MSG_LEN_DW;
>  }
>  
> -int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +int xe_access_counter_notify_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len)
>  {
> -	struct xe_gt *gt = guc_to_gt(guc);
>  	struct acc_queue *acc_queue;
>  	u32 asid;
>  	bool full;
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> index 839c065a5e4c..0c01af3b7124 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> @@ -9,11 +9,11 @@
>  #include <linux/types.h>
>  
>  struct xe_gt;
> -struct xe_guc;
> +struct xe_uc_fw;
>  
>  int xe_gt_pagefault_init(struct xe_gt *gt);
>  void xe_gt_pagefault_reset(struct xe_gt *gt);
> -int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
> -int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len);
> +int xe_pagefault_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len);
> +int xe_access_counter_notify_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len);
>  
>  #endif	/* _XE_GT_PAGEFAULT_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 6e66bf0e8b3f..73f7bd044828 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -249,6 +249,8 @@ struct xe_gt {
>  		struct pf_queue {
>  			/** @usm.pf_queue.gt: back pointer to GT */
>  			struct xe_gt *gt;
> +			/** @usm.pf_queue.fw the fw that handles the pf */
> +			struct xe_uc_fw *fw;
>  			/** @usm.pf_queue.data: data in the page fault queue */
>  			u32 *data;
>  			/**
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1619c0a52db9..1ea3678f1463 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_guc.h"
>  
> +#include "xe_uc_fw_types.h"
>  #include <drm/drm_managed.h>
>  
>  #include <generated/xe_wa_oob.h>
> @@ -642,6 +643,19 @@ static int vf_guc_init(struct xe_guc *guc)
>  	return 0;
>  }
>  
> +static int send_pagefault_reply(struct xe_gt *gt, struct xe_uc_fw *fw,
> +				struct xe_uc_pagefault_reply *reply)
> +{
> +	struct xe_guc *guc = container_of(fw, struct xe_guc, fw);
> +	u32 action[] = {
> +		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
> +		reply->dw0,
> +		reply->dw1,
> +	};
> +
> +	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +}
> +
>  int xe_guc_init(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -652,6 +666,7 @@ int xe_guc_init(struct xe_guc *guc)
>  	ret = xe_uc_fw_init(&guc->fw);
>  	if (ret)
>  		goto out;
> +	guc->fw.send_pagefault_reply = &send_pagefault_reply;
>  
>  	if (!xe_uc_fw_is_enabled(&guc->fw))
>  		return 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 72ad576fc18e..14ff5f255d45 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1293,15 +1293,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  								 adj_len);
>  		break;
>  	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
> -		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
> +		ret = xe_pagefault_handler(gt, &guc->fw, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
>  		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
>  							   adj_len);
>  		break;
>  	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
> -		ret = xe_guc_access_counter_notify_handler(guc, payload,
> -							   adj_len);
> +		ret = xe_access_counter_notify_handler(gt, &guc->fw, payload,
> +						       adj_len);
>  		break;
>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
>  		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
> @@ -1494,7 +1494,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  	switch (action) {
>  	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
> -		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
> +		ret = xe_pagefault_handler(gt, &guc->fw, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
>  		__g2h_release_space(ct, len);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index d8714ccb3f78..4d82430e3274 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  
>  struct xe_bo;
> +struct xe_gt;
>  
>  /*
>   * +------------+---------------------------------------------------+
> @@ -228,6 +229,10 @@ struct xe_uc_fw {
>  
>  	/** @private_data_size: size of private data found in uC css header */
>  	u32 private_data_size;
> +
> +	/** a callback to send the page fault replay to the fw */
> +	int (*send_pagefault_reply)(struct xe_gt *gt, struct xe_uc_fw *xe_fw,
> +				    struct xe_uc_pagefault_reply *reply);
>  };
>  
>  #endif
> -- 
> 2.34.1
> 
