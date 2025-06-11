Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D40FC71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 19:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D770010E718;
	Wed, 11 Jun 2025 19:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y27hpD+8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A741810E719
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 19:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749668907; x=1781204907;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v9HFFW2jDOWayoY/y8KIlYw8oI71ZAizfK1VPOXPR34=;
 b=Y27hpD+80FritNbTOsEs9Hbig795AcW6yfDGmgkgOdrn3/wHbPMk+/+/
 SynNAhtDVJvAVF0fgfWrljclk4DIjAAYkkKVKAYTYUYtulQQNg9k4D8Rs
 JhBu2FibZva8RxNf8MmyuyF3ssTJ7eQE4agvUsg/rYLTHdDg/7EZ7lFKK
 Q4NMFvOtlxBOOVqF4GK45/cimNj00GUTIPS79TOu5yQnFNhTQbOf+7Cw0
 5rR48X3JIXW3LRp4AXI2t3tsTPBXMSgjrDFxj6V+TiiVoRY8c9gg/8o1u
 EwABkfwkYlsjs/YX/XGdfrBdmM0LCR6W6n06kiloWA4w1Bxwn4g0EVlCK Q==;
X-CSE-ConnectionGUID: NNQKloFiQCCFjtm71smpaw==
X-CSE-MsgGUID: 1fdNP0uFTX60O8hjj/VcfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62479576"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="62479576"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 12:08:27 -0700
X-CSE-ConnectionGUID: kYHDEqaMTYOmFojFZjMmcA==
X-CSE-MsgGUID: jKdJWHjERqKqsXDPYG0xNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="178194900"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 12:08:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 12:08:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 12:08:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 12:08:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQekkI4cByN4W6D/HanTHCWSl2LB0q+RIhE2lOoU77Q/BlqBGtgGSvnOMyNG4VA03R+4dCwVybEykKFLvm08NdoC6TS436TFqjzD9T/slN4ORY07cB7CwYRN024unRVdvhboTmeLbMFOollqImnqfkOzdoCsfCCkUG3ngeMGVcfC1SWnQXwRFpyljW5Jo+al17SKoG49/+pZLsARMv1X9ghP1DAGzpq/5gKfVyCIZqeW18BJozb+kGjSPODBhs36mhyoltyA7ZC0VnGrBBA3LZuyDySMV5y0ncdd433hHOeqbj8KekA17vAFUlCzWu922qtNPuOUdevcXbeHAWxnzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1906FyI6EtFvPM9odv5DknXRmJNw+ZCbOI+169SBEo=;
 b=nQZFQWso9Dq83jkzfK6ZBK95fEqT5IDs/j5Blm7lqCW8URmUkLVRVHrA+sWN2r/fvWSPDKrxDLpR07yIGc6xYI1OQU0QnFqxIInHdMosPBQrBW04tLH4VUSp47Fk9noSQb/E678XZl7fGpiCwZq/0Vd04C2g8/HzwVPCmZYJRYwDBGaXiL1bIghP5t+sN1QV9Y0socN8VVvCHR5e2nl2RKyIQkS0EpXbBWA4EwV0oFatwXy4Hqk4YOlXdJTf21yM5twGNrri6ex6X2M4mLz98HjyyJ71Rv/CHIbzfWotxHM5n5amp69FVDyi9k5fRLiQ51hSDQ3mYV3sNlqVJoomnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Wed, 11 Jun
 2025 19:08:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 19:08:14 +0000
Date: Wed, 11 Jun 2025 12:09:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3] drm/xe/vm: Add a helper
 xe_vm_range_tilemask_tlb_invalidation()
Message-ID: <aEnUfsBrPnVejB65@lstrano-desk.jf.intel.com>
References: <20250609041616.1723636-1-himal.prasad.ghimiray@intel.com>
 <7c4a125a758c00a506927cb3549736c1eb9d3886.camel@intel.com>
 <aEnKG6LYzYE7f3eK@lstrano-desk.jf.intel.com>
 <dabadd3dd43fa70ce9a13f5f507bc6b421673d8a.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dabadd3dd43fa70ce9a13f5f507bc6b421673d8a.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c44337-a022-4e5b-3341-08dda91b50dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uRzva40kIPZRpkgTD9ZdNwkVeZ/eLHxkNdkOEnZlpS6DJ+yhSMi+/bBkXB?=
 =?iso-8859-1?Q?FObWbPP60YuUnQ95fxQxBctQ9zHVcXkV3nGjCVqNem31w8kUt/pHsFZKpw?=
 =?iso-8859-1?Q?6qECz/NV9hlFyyK0GU5bcpJUxkb2iIkO5+PXhvcTmIAYavuwb2FXo9Wm9b?=
 =?iso-8859-1?Q?kZiASrkBvrL+01ANCTjaE5bp3B2MFvHXGj+2MxAj6vT00rXIp7465Otdca?=
 =?iso-8859-1?Q?CAcQGni0ZC8A7nLpJRzgfo+L8b3S4paYBMrlRP95rr0VpuAgieKrzmCb5P?=
 =?iso-8859-1?Q?y+TSsOnQ5pGGabrt3FH0RhoB2dAUnglR4Nv15UFrnZRnmDhhdkDAYb5ZcV?=
 =?iso-8859-1?Q?nzLU0+2euqRPWzthtaT6kdjzhDhLkkYJIVSGrFfXz8jbafn4X5ehDslWv6?=
 =?iso-8859-1?Q?KpKVJeFxPbsLpwrxof4KP0EXm/JXJ+qXtM9hxtJGLOkGGp4sWJCDsmwoz0?=
 =?iso-8859-1?Q?V+i/w8ESYWFpiL/2WtRQRAdJmuLIlFXJsB7N3/Nj3elY6xKVWTP0HWoskn?=
 =?iso-8859-1?Q?s7KusKgggMM/ozG/pURGM4Ca31hcJeLEa9Fi0eDwPcwByQLBmeIIhx3Ywk?=
 =?iso-8859-1?Q?ItcEco0N57YOmFqP7DB5IDIGwm85SVrNthhSIgjAogAha99+RfOY1deMf8?=
 =?iso-8859-1?Q?OemmzjeEWAarcN3RKRgJxSQQspQB8N8V6CthgGu35HxQuqo81eWnAECTc4?=
 =?iso-8859-1?Q?rQiJ/Mj90Dm/bOsbUqF4JMAOOZQFlHL7/w5yoghWVahk7TavphZ/um5MM2?=
 =?iso-8859-1?Q?S4vPvSswJ7x+Kg98/GSUXj5xXSjTUZQz970eKhweqCTII8L/bxFwo/6l1z?=
 =?iso-8859-1?Q?yaDIXVqAukA14WfFDZlfLNC86yQi7+JXBm2XS8MlAJN6amMdmDyvi+7NP7?=
 =?iso-8859-1?Q?U8CCg7joFnaFfMUYoI59ILjo8EH5zVO9PTQJVnwb/r7VNBglgmOPzU9dag?=
 =?iso-8859-1?Q?oK3R0Yk3KnMfBR0dv33I5UHzRp9L2S5+HwUekyB4FU5jDJi9Q6nY9aWzg0?=
 =?iso-8859-1?Q?6MOk5uPyKPZ3wXe8nyWzZTGHd9nXD2QWinGedlTPRDgGmtgQGO8gG+F4Mh?=
 =?iso-8859-1?Q?fQmTz4432wo4koFsdPJqSI+IlxSwqfix/zhUFKmqPwhCZBJkCCjNEoTUWD?=
 =?iso-8859-1?Q?3NQa8GFvayJR7VvXmyCorRGn0YnIyPj2v55T4y70/8n7Pu0OjJfop1zV9k?=
 =?iso-8859-1?Q?z2teoLMqXic1irTYs5q4Vof8chzTKhYlh5SVcuhg9Ai7Ay6i5J7Be0Gdw6?=
 =?iso-8859-1?Q?KBstwl/535DvZx42ESemyRVS2S/ncwpEJKHMYPR5LU8YsGMCApgpp9SEx1?=
 =?iso-8859-1?Q?VK4+kcRypjJLUlszXSlNxeRlVb34TAruFyz/H1fDx2JX92OTsK/965tmNT?=
 =?iso-8859-1?Q?WaKDjHYVvc4+mPIbnrXB/CGji8e3ieE2pCSToGi84J2u36GoHTHJJmlN/n?=
 =?iso-8859-1?Q?XmgpvZYZbR9g1ZsODV0xYafwX9Ow+8ahGEbuX5SC4HwfkbaFIEy5qxyTUH?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FLEgP34ro3sxRsiDQKvw2redsfVqRTB3RLre+qwNdKfcVPQYrGbNoKTL99?=
 =?iso-8859-1?Q?MVo1QprjeA5ZMRTtGYrWR2XdVKWTWyXi54JMOfDawVjD7GdWyPJFpwTLQg?=
 =?iso-8859-1?Q?ETzT1mQk2JNt4tJ2A0ImrFtGdGVjY9DvG4BS0saOnYAerPcXZCAdLg30UP?=
 =?iso-8859-1?Q?QYBgAPPfOmxlWYKgpFXTh0t0lAwmt120LpMv0ptPLDp8HbfeFRxXf5XCsr?=
 =?iso-8859-1?Q?ho/+3NTj3b94JAUd3CxbqcXE4Z34PB+O3M3J1eFA6c35V68T9rOBBJCByx?=
 =?iso-8859-1?Q?hzSTryr9Ef0b45KN4UP67fJOpNRucuuolsmqjDrCOlRwb+Kauyky5bQcPA?=
 =?iso-8859-1?Q?beF5JZ2RUrkX8roffwIxteVwxCBB0lghFw7XkfmdhzwRKMwnnrEdjw7meo?=
 =?iso-8859-1?Q?s+FfGQQ0gnATFjh8RvZK9k6N8to9IzfR3QXheuUr3NpVjPszhYsXyP1t8h?=
 =?iso-8859-1?Q?3uosqPw62U0cYXEcrMoCoMHmyzEe1YvyiXPh+U9zTjDj7hQYdeLS+kavWp?=
 =?iso-8859-1?Q?a42ixMYFHjpdZaZWsPIIuv0HVeZJMoMQ2vnJe7cZ1DIgE35FXk3/sdWu7W?=
 =?iso-8859-1?Q?hpyymCb+he8wScRHSwNjdc9TJwOQdimjjK7Sa/9L+aCACBePZRaAIO07Cp?=
 =?iso-8859-1?Q?mZDegD1+fG6EZMh6B3fF+h8qbgHLIrh2wBhcsB/wPtLtz6vOzBIt21/CD8?=
 =?iso-8859-1?Q?3+waZuKIAuoTm2xQvJI88dPpd1PKAff7v01QfImv533kJTrfcdLCLqWV/A?=
 =?iso-8859-1?Q?84Wmb7Y3CZzzHKOitzpimZ5yTJ64hUxYbsLBWCjKTMvYe3euvF5lK94Ssu?=
 =?iso-8859-1?Q?RpADpm8zBWrPbYq/PNCZzjx95RreRCBLFNXtJrymfisJ8ZkDehouSOXWrC?=
 =?iso-8859-1?Q?OW2lDufVDyeOKg5retwx+1sFL82RRS7WsNiI9fE5n7YNRAe/2oFNPNS/Uj?=
 =?iso-8859-1?Q?f8Ucw0gA/KZ2L5ciJ569KgTFIhzKTrt1EjOkUeAB69QCzgv5FEWDRpwCz6?=
 =?iso-8859-1?Q?VTmObB5CSVyJI2ycb0Snr90/+yM/TEOrL4IztqivsqtjZO5sRqsiCluyiG?=
 =?iso-8859-1?Q?YYZDH36j2vSTFbxcdFvYtrrv8kf/bBM2FFg+QBrwTZDgtOOVv8kdWEfUQQ?=
 =?iso-8859-1?Q?KU5dYgQvqU5K4olw52pMzosTwSIeaOReikEaaQhl6jLhbWznzJNKMlJk63?=
 =?iso-8859-1?Q?UIKZ2V2J94cUL2grQevc5e7y0l4CP5NljLY39d83BhPusEgIQ5/d7kwIWH?=
 =?iso-8859-1?Q?9eYdydoYspKTC0rjwnTCfDqCtLOAww6W0r8LAkSZqRg+9ak9fsnwDxnCXs?=
 =?iso-8859-1?Q?IHzSmJjjCQ1N+vklCqH1oC48COzyKiQPfg50dXK0Z1nQq1fRLpSMrhKkCJ?=
 =?iso-8859-1?Q?srR3FGCdjNZ4iCLLB8QATY/gIX+IAXOsu1riNHziwaSyiLjjy5hTusZlL9?=
 =?iso-8859-1?Q?rkfLFKSmwzCWNTVPedr9Hkbyu67/UGFPpIKYy3Wm6KjJ12A44pVFOO+hBa?=
 =?iso-8859-1?Q?sBErdiFjUVIhkLu3EOF1KRVsZsL5q+nExztIc+DGYgssrngA3NwBstSECR?=
 =?iso-8859-1?Q?VwL3iLPQMX76/1jYIHDgSFHTYfvgZvzGcGV2jIo+2w+ZxAGVugZnU+Q0bV?=
 =?iso-8859-1?Q?X44BjctUYQ12tAZjeXqpOTVzTPz5uB1Wm0OMG1HvvOhWl/8VsEXwCi3Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c44337-a022-4e5b-3341-08dda91b50dc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 19:08:14.4176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDeiKDYoSI5zfW3tBYmqsOcADPrWGszkx45uKS0MQk+amJLurADw088E7SQqnxbhDwWmDBKd8QWS7aQ5LsARlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6665
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

On Wed, Jun 11, 2025 at 12:27:09PM -0600, Summers, Stuart wrote:
> On Wed, 2025-06-11 at 11:25 -0700, Matthew Brost wrote:
> > On Wed, Jun 11, 2025 at 11:56:25AM -0600, Summers, Stuart wrote:
> > > On Mon, 2025-06-09 at 09:46 +0530, Himal Prasad Ghimiray wrote:
> > > > Introduce xe_vm_range_tilemask_tlb_invalidation(), which issues a
> > > > TLB
> > > > invalidation for a specified address range across GTs indicated
> > > > by a
> > > > tilemask.
> > > > 
> > > > v2 (Matthew Brost)
> > > > - Move WARN_ON_ONCE to svm caller
> > > > - Remove xe_gt_tlb_invalidation_vma
> > > > - s/XE_WARN_ON/WARN_ON_ONCE
> > > > 
> > > > v3
> > > > - Rebase
> > > > 
> > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > Signed-off-by: Himal Prasad Ghimiray
> > > > <himal.prasad.ghimiray@intel.com>
> > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  24 -----
> > > >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |   3 -
> > > >  drivers/gpu/drm/xe/xe_svm.c                 |  43 +-------
> > > >  drivers/gpu/drm/xe/xe_vm.c                  | 103 +++++++++++++-
> > > > ----
> > > > --
> > > >  drivers/gpu/drm/xe/xe_vm.h                  |   3 +
> > > >  5 files changed, 75 insertions(+), 101 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > index 084cbdeba8ea..0111ee59b81d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > @@ -440,30 +440,6 @@ void xe_gt_tlb_invalidation_vm(struct xe_gt
> > > > *gt,
> > > > struct xe_vm *vm)
> > > >         xe_gt_tlb_invalidation_fence_wait(&fence);
> > > >  }
> > > >  
> > > > -/**
> > > > - * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this
> > > > GT
> > > > for a VMA
> > > > - * @gt: GT structure
> > > > - * @fence: invalidation fence which will be signal on TLB
> > > > invalidation
> > > > - * completion, can be NULL
> > > > - * @vma: VMA to invalidate
> > > > - *
> > > > - * Issue a range based TLB invalidation if supported, if not
> > > > fallback to a full
> > > > - * TLB invalidation. Completion of TLB is asynchronous and
> > > > caller
> > > > can use
> > > > - * the invalidation fence to wait for completion.
> > > > - *
> > > > - * Return: Negative error code on error, 0 on success
> > > > - */
> > > > -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> > > > -                              struct
> > > > xe_gt_tlb_invalidation_fence
> > > > *fence,
> > > > -                              struct xe_vma *vma)
> > > > -{
> > > > -       xe_gt_assert(gt, vma);
> > > > -
> > > > -       return xe_gt_tlb_invalidation_range(gt, fence,
> > > > xe_vma_start(vma),
> > > > -                                           xe_vma_end(vma),
> > > > -                                           xe_vma_vm(vma)-
> > > > > usm.asid);
> > > > -}
> > > > -
> > > >  /**
> > > >   * xe_guc_tlb_invalidation_done_handler - TLB invalidation done
> > > > handler
> > > >   * @guc: guc
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > > index abe9b03d543e..31072dbcad8e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > > @@ -19,9 +19,6 @@ int xe_gt_tlb_invalidation_init_early(struct
> > > > xe_gt
> > > > *gt);
> > > >  
> > > >  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
> > > >  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> > > > -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> > > > -                              struct
> > > > xe_gt_tlb_invalidation_fence
> > > > *fence,
> > > > -                              struct xe_vma *vma);
> > > >  void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm
> > > > *vm);
> > > >  int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> > > >                                  struct
> > > > xe_gt_tlb_invalidation_fence
> > > > *fence,
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > index 83c63fd7b481..3fd2d63c73a2 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -167,14 +167,9 @@ static void xe_svm_invalidate(struct
> > > > drm_gpusvm
> > > > *gpusvm,
> > > >  {
> > > >         struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> > > >         struct xe_device *xe = vm->xe;
> > > > -       struct xe_tile *tile;
> > > >         struct drm_gpusvm_range *r, *first;
> > > > -       struct xe_gt_tlb_invalidation_fence
> > > > -               fence[XE_MAX_TILES_PER_DEVICE *
> > > > XE_MAX_GT_PER_TILE];
> > > >         u64 adj_start = mmu_range->start, adj_end = mmu_range-
> > > > >end;
> > > >         u8 tile_mask = 0;
> > > > -       u8 id;
> > > > -       u32 fence_id = 0;
> > > >         long err;
> > > >  
> > > >         xe_svm_assert_in_notifier(vm);
> > > > @@ -220,42 +215,8 @@ static void xe_svm_invalidate(struct
> > > > drm_gpusvm
> > > > *gpusvm,
> > > >  
> > > >         xe_device_wmb(xe);
> > > >  
> > > > -       for_each_tile(tile, xe, id) {
> > > > -               if (tile_mask & BIT(id)) {
> > > > -                       int err;
> > > > -
> > > > -                       xe_gt_tlb_invalidation_fence_init(tile-
> > > > > primary_gt,
> > > > -                                                        
> > > > &fence[fence_id], true);
> > > > -
> > > > -                       err = xe_gt_tlb_invalidation_range(tile-
> > > > > primary_gt,
> > > > -                                                         
> > > > &fence[fence_id],
> > > > -                                                         
> > > > adj_start,
> > > > -                                                         
> > > > adj_end,
> > > > -                                                          vm-
> > > > > usm.asid);
> > > > -                       if (WARN_ON_ONCE(err < 0))
> > > > -                               goto wait;
> > > > -                       ++fence_id;
> > > > -
> > > > -                       if (!tile->media_gt)
> > > > -                               continue;
> > > > -
> > > > -                       xe_gt_tlb_invalidation_fence_init(tile-
> > > > > media_gt,
> > > > -                                                        
> > > > &fence[fence_id], true);
> > > > -
> > > > -                       err = xe_gt_tlb_invalidation_range(tile-
> > > > > media_gt,
> > > > -                                                         
> > > > &fence[fence_id],
> > > > -                                                         
> > > > adj_start,
> > > > -                                                         
> > > > adj_end,
> > > > -                                                          vm-
> > > > > usm.asid);
> > > > -                       if (WARN_ON_ONCE(err < 0))
> > > > -                               goto wait;
> > > > -                       ++fence_id;
> > > > -               }
> > > > -       }
> > > > -
> > > > -wait:
> > > > -       for (id = 0; id < fence_id; ++id)
> > > > -               xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> > > > +       err = xe_vm_range_tilemask_tlb_invalidation(vm,
> > > > adj_start,
> > > > adj_end, tile_mask);
> > > > +       WARN_ON_ONCE(err);
> > > >  
> > > >  range_notifier_event_end:
> > > >         r = first;
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 18f967ce1f1a..a0c70698265a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -3842,6 +3842,68 @@ void xe_vm_unlock(struct xe_vm *vm)
> > > >         dma_resv_unlock(xe_vm_resv(vm));
> > > >  }
> > > >  
> > > > +/**
> > > > + * xe_vm_range_tilemask_tlb_invalidation - Issue a TLB
> > > > invalidation
> > > > on this tilemask for an
> > > > + * address range
> > > > + * @vm: The VM
> > > > + * @start: start address
> > > > + * @end: end address
> > > > + * @tile_mask: mask for which gt's issue tlb invalidation
> > > > + *
> > > > + * Issue a range based TLB invalidation for gt's in tilemask
> > > > + *
> > > > + * Returns 0 for success, negative error code otherwise.
> > > > + */
> > > > +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64
> > > > start,
> > > > +                                         u64 end, u8 tile_mask)
> > > > +{
> > > > +       struct xe_gt_tlb_invalidation_fence
> > > > fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> > > > +       struct xe_tile *tile;
> > > > +       u32 fence_id = 0;
> > > > +       u8 id;
> > > > +       int err;
> > > > +
> > > > +       if (!tile_mask)
> > > > +               return 0;
> > > > +
> > > > +       for_each_tile(tile, vm->xe, id) {
> > > > +               if (tile_mask & BIT(id)) {
> > > > +                       xe_gt_tlb_invalidation_fence_init(tile-
> > > > > primary_gt,
> > > > +                                                        
> > > > &fence[fence_id], true);
> > > > +
> > > > +                       err = xe_gt_tlb_invalidation_range(tile-
> > > > > primary_gt,
> > > > +                                                         
> > > > &fence[fence_id],
> > > > +                                                          start,
> > > > +                                                          end,
> > > > +                                                          vm-
> > > > > usm.asid);
> > > 
> > > Since we're already doing the refactoring of the svm and non-svm
> > > cases
> > > here, can you also refactor this so we have something like:
> > > invalidate_tiles(tile_mask)
> > > 
> > > void invalidate_tiles(tile_mask)
> > > {
> > >     for_each_tile(tile, tile_mask)
> > >         invalidate_tile(tile)
> > > }
> > > 
> > > void invalidate_tile(tile)
> > > {
> > >     fence[i] = invalidate_gt(primary)
> > >     fence[i++] = invalidate_gt(media)
> > > 
> > >     for_each_i(i)
> > >         wait_for_invalidation(i)
> > 
> > You'd lose a level pipeline with this suggestion. The can write is
> > quite
> > intentional - issue all TLB invalidations to hardware, then wait on
> > all
> > invalidtaions. What you suggest would issue TLB invalidations to each
> > tile and wait invalidations from that tile - if you have multiple
> > tiles
> > you delay issuing the invalidations until the prior tile completes
> > its
> > invalidations. This could be cleaned up with helpers but regardless
> > we
> > want the pipeling in place.
> 
> Ok makes sense. Then we can just pull the wait_for_invalidation() out
> to the invalidate_tiles() piece:
> 
> void invalidate_tiles(tile_mask)
>     for_each_tile(tile, tile_mask)
>         fence[i++] = invalidate_tile(tile)
> 
>     for_each_i(i)
>         wait_for_invalidation(i)
> 

That still doesn't work as each tile can generate multiple fences if it
has a media GT. Yes, we could have helper which takes a fence index by
reference by ROI on this low IMO - this is not some crazy a couple 100
line function which is hard to follow.

Matt

> 
> Thanks,
> Stuart
> 
> > 
> > Matt 
> > 
> > > }
> > > 
> > > invalidate_gt(gt_type)
> > > {
> > >     invalidation_fence_init(gt_type)
> > >     fence = invalidation_fence_range(gt_type)
> > > 
> > >     return fence
> > > }
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > +                       if (err)
> > > > +                               goto wait;
> > > > +                       ++fence_id;
> > > > +
> > > > +                       if (!tile->media_gt)
> > > > +                               continue;
> > > > +
> > > > +                       xe_gt_tlb_invalidation_fence_init(tile-
> > > > > media_gt,
> > > > +                                                        
> > > > &fence[fence_id], true);
> > > > +
> > > > +                       err = xe_gt_tlb_invalidation_range(tile-
> > > > > media_gt,
> > > > +                                                         
> > > > &fence[fence_id],
> > > > +                                                          start,
> > > > +                                                          end,
> > > > +                                                          vm-
> > > > > usm.asid);
> > > > +                       if (err)
> > > > +                               goto wait;
> > > > +                       ++fence_id;
> > > > +               }
> > > > +       }
> > > > +
> > > > +wait:
> > > > +       for (id = 0; id < fence_id; ++id)
> > > > +               xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> > > > +
> > > > +       return err;
> > > > +}
> > > > +
> > > >  /**
> > > >   * xe_vm_invalidate_vma - invalidate GPU mappings for VMA
> > > > without a
> > > > lock
> > > >   * @vma: VMA to invalidate
> > > > @@ -3857,11 +3919,9 @@ int xe_vm_invalidate_vma(struct xe_vma
> > > > *vma)
> > > >         struct xe_device *xe = xe_vma_vm(vma)->xe;
> > > >         struct xe_vm *vm = xe_vma_vm(vma);
> > > >         struct xe_tile *tile;
> > > > -       struct xe_gt_tlb_invalidation_fence
> > > > -               fence[XE_MAX_TILES_PER_DEVICE *
> > > > XE_MAX_GT_PER_TILE];
> > > > -       u8 id;
> > > > -       u32 fence_id = 0;
> > > > +       u8 tile_mask = 0;
> > > >         int ret = 0;
> > > > +       u8 id;
> > > >  
> > > >         xe_assert(xe, !xe_vma_is_null(vma));
> > > >         xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
> > > > @@ -3892,37 +3952,14 @@ int xe_vm_invalidate_vma(struct xe_vma
> > > > *vma)
> > > >                 }
> > > >         }
> > > >  
> > > > -       for_each_tile(tile, xe, id) {
> > > > -               if (xe_pt_zap_ptes(tile, vma)) {
> > > > -                       xe_device_wmb(xe);
> > > > -                       xe_gt_tlb_invalidation_fence_init(tile-
> > > > > primary_gt,
> > > > -                                                        
> > > > &fence[fence_id],
> > > > -                                                         true);
> > > > -
> > > > -                       ret = xe_gt_tlb_invalidation_vma(tile-
> > > > > primary_gt,
> > > > -                                                       
> > > > &fence[fence_id], vma);
> > > > -                       if (ret)
> > > > -                               goto wait;
> > > > -                       ++fence_id;
> > > > -
> > > > -                       if (!tile->media_gt)
> > > > -                               continue;
> > > > -
> > > > -                       xe_gt_tlb_invalidation_fence_init(tile-
> > > > > media_gt,
> > > > -                                                        
> > > > &fence[fence_id],
> > > > -                                                         true);
> > > > +       for_each_tile(tile, xe, id)
> > > > +               if (xe_pt_zap_ptes(tile, vma))
> > > > +                       tile_mask |= BIT(id);
> > > >  
> > > > -                       ret = xe_gt_tlb_invalidation_vma(tile-
> > > > > media_gt,
> > > > -                                                       
> > > > &fence[fence_id], vma);
> > > > -                       if (ret)
> > > > -                               goto wait;
> > > > -                       ++fence_id;
> > > > -               }
> > > > -       }
> > > > +       xe_device_wmb(xe);
> > > >  
> > > > -wait:
> > > > -       for (id = 0; id < fence_id; ++id)
> > > > -               xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> > > > +       ret =
> > > > xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma),
> > > > xe_vma_start(vma),
> > > > +                                                  
> > > > xe_vma_end(vma),
> > > > tile_mask);
> > > >  
> > > >         /* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
> > > >         WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > > > b/drivers/gpu/drm/xe/xe_vm.h
> > > > index 88d6c0ef89c7..acd3fd6c605b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > > @@ -228,6 +228,9 @@ struct dma_fence *xe_vm_range_rebind(struct
> > > > xe_vm
> > > > *vm,
> > > >  struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> > > >                                      struct xe_svm_range *range);
> > > >  
> > > > +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64
> > > > start,
> > > > +                                         u64 end, u8 tile_mask);
> > > > +
> > > >  int xe_vm_invalidate_vma(struct xe_vma *vma);
> > > >  
> > > >  int xe_vm_validate_protected(struct xe_vm *vm);
> > > 
> 
