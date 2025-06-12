Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8030C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 18:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9671110E095;
	Thu, 12 Jun 2025 18:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HUBUorf8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E01610E095
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 18:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749753273; x=1781289273;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eniCmh4/GjWTfeVKmKubY2yz3s+tfLWeg/Na/eqhoM0=;
 b=HUBUorf8duZN8EtAajVzCLY9j7CFP/ocxh9LhVYeYg07ENfuaocG2zQe
 0Q5F9N1+3BhNbTeye7vNnggZ5vUnknIa8G82HhArk5qE4f9mjjvFbkq8o
 UK6gWD+ak/+nYrIWqav75wQoF+vdJy98rUJGsurZkI/7zKykJ2gR1OThg
 IXgKAwCXYR4MoiqNydmPo6cDHaqj10uK95ddwUcaukzyP+r1eYARoTC/u
 gMCnzRFPRvQS0jTnpBaANyGDyAqByMf5w1Q7VavVBOLuF085aktiLEZlB
 I16bksS5h+GHDWzdcYRD5W1SKeNledd0Ndt8Rxw926pk9+tkpzCGKXC8x w==;
X-CSE-ConnectionGUID: hL8xfCIbRdCuMQkBu2I5kw==
X-CSE-MsgGUID: MAiBFTfeQJCe+zpPqjVlyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="55755105"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="55755105"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:34:33 -0700
X-CSE-ConnectionGUID: yZahaU4sQa64wB8EcyjCGQ==
X-CSE-MsgGUID: nDHXT5FWQuCCBQVmi9kwIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152510497"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:34:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:34:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:34:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.88) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:34:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHL32NicbdvzaJeca49AdGKrwk5k9wggq+J0/J6xCT0Z/uLLby2ZSiIomJ6hBeitU14A74C2dSYRESjkfQvvDqxoWyCJ2yQ6i6kqYmrIUFK16ziCvR+YQ1/LJKfgQA6hWUKs/4xcNTE3a84bk0MorWtS9RTFKqtoK+J3XSI8DmboyXRUAV9liRYUjbkC4NxFRo8NXh86Ea0ZeGusPeKzWfVQyE87PhBLTSwqZnipaS97JaaoOOgQrkTwqL9SMoBKyH6T0oteGfeHakXkJQkOoJRj1KO+4I6WfhTKM/j4GUzk1pBKEhJD2jQmk2bzS6XDlYV7rr4SG8iED0RI5DUYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9CyNbFJ/XG0NnZm3HHM+4J49t0VaF4qleehJ8RnvuU=;
 b=dktFJmuBxHZb6R++QFubNGwP6Fm+pWPu+Eh6fasXqXodGuszBq5En12+d3CdTwykqf1RFHmRXDu37lClMHB5qqK5HkUtYHCYeDV9zMkbWg8YuPEc2W3rpadK5OwFdkVGxC/ZCOGimHCIkSDyIO0soTZ/7/vEI1A7/f4uDyvZ/Nh/SqsJVGqu/utQi1sMs1XXHFHy8qdfPG/Oa7YEriEKd5hozU8RNgZBZrar8KKtNRPdLK3y88TPKCoxneGEyOcodYtgjNaNFBYuMV/tDMYCPoRn8rpQ+yyD4HIkdzJgJS/dmfwykK0jwYchCBCS5QW3HAXV0Vn1veSwJnCGLWqRfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6489.namprd11.prod.outlook.com (2603:10b6:208:3a7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 18:34:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 18:34:00 +0000
Date: Thu, 12 Jun 2025 11:35:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Mrozek <michal.mrozek@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc: Default log level to non-verbose
Message-ID: <aEsd+BbcIVobVtQk@lstrano-desk.jf.intel.com>
References: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
 <20250612-guc-log-level-v1-1-51f124a3be6d@intel.com>
 <aEsatLTQ5+93aO1T@lstrano-desk.jf.intel.com>
 <1caeda49-7355-4e68-8546-f127d222f52c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1caeda49-7355-4e68-8546-f127d222f52c@intel.com>
X-ClientProxiedBy: BY3PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb6359e-da75-48ed-4edb-08dda9dfb301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?60yBZ7YgK4HsOhavj+LtJB+u6RzJZF+igNYph1PhnDAPH/89erT9yFr+0AiF?=
 =?us-ascii?Q?7jbKpiupOT7T9vxX04inVEGKauipDcjn2EruF71q8xx3/2TLkRBazcjWJenN?=
 =?us-ascii?Q?WjefLY76v+4JYlyMpC6AuOsnk2STawUUuPyIj97smxoA4nvG4iuTnEuP+TdH?=
 =?us-ascii?Q?BGUHn6+1/I0VpkYvcv2zum65DBwIzHe/fno5sTmFYL921WTYUPHf3R3cT/O3?=
 =?us-ascii?Q?B0zkwbULyz8euWG3YgTV+gFxkkzwrUckTUG16aqotCcDrzPCgl61jOZ+swZx?=
 =?us-ascii?Q?ZQfxJAy4ijBsNyUv076M1WXalXsBxO1TzdXfuGeTRlnfejNsC03OkkI5T4Ez?=
 =?us-ascii?Q?hfmDxn6kX7+eii8Zi+tMV9SNRp3JhENY34WEwNtXOuE82L8yC1+hc4dM29hO?=
 =?us-ascii?Q?81MCfQp4o0M3o91HundOBOzF1lc+Zll4cAMslVdnY1iw0dbhrJ3Ls4BebYqn?=
 =?us-ascii?Q?Hf8yEUU5pgPJawchEerbHjRv5WGNeh62hSp1OMRq0OU4DEIz/NKR3wyHaAQV?=
 =?us-ascii?Q?br5gt9q4tRiSJ8dV4cV/H3UGbPQ9BkBObquWZ4AJEYpwu0Qs/pwPzgLmdBdR?=
 =?us-ascii?Q?HWwmFoc5QgZDVeN2Qn5QsSTxm20jJUKEFR47ku6oADkhgaq2DH9R9BETXQtb?=
 =?us-ascii?Q?24ZeJtsrjbM/6KY4LcsdmFDmfQ4D5qYQFuIFLpHJY+u6X5QdVEkGmxmjqSob?=
 =?us-ascii?Q?xWoSbFi1SSxP3Go3rweE+7ycZk+88g0gcBj4ZE5tgaeZyjxWpV0mGFwP4m6O?=
 =?us-ascii?Q?fte6uc+xpcUx7Uqd1sflctl4vcClaBHJZd/UbRySnnhH6TMzCXRGIdm+ITek?=
 =?us-ascii?Q?5d6FNkIyuvG1Pl7I6as2CMAHQGL76rsEfeN6JhLL72tiUucJD1S9pIjjKgW1?=
 =?us-ascii?Q?Cux0mr65Abg+CyiaV4AL74NdggTsPkgxKi0lTNFpql6ucTzQ6rnKhWE956RD?=
 =?us-ascii?Q?o/5jk5qHRMvMxlsJFiSlSAzM9JhGOFtAHOozCQBy59Myk5vhSmrEIL7tpyyR?=
 =?us-ascii?Q?RO6dgDlEMtQ3sONXbOCuIMsVl7sQVs/4BHzEnCJZo7T9bm0Ig+WICRRrUuW1?=
 =?us-ascii?Q?PiVZJ/Z2yU2UeaAqqtsedBZrXmvNhudy9iltDlxZoSr33xLPGECWgx9S/rkf?=
 =?us-ascii?Q?aQ6xvUCzpWqyUIDYI/PwwgCXrBj2uSSHm0TOWFKAkWUWr1UAManDVTzfJBqu?=
 =?us-ascii?Q?iRnrdMK/nStNnrJLtPblfs+n9w/HWiWvm//7sb7vcqg3S9puPwTRhA5nS1qz?=
 =?us-ascii?Q?JPnYO+Xl/LpEtVEqFjzHLyH6RDmG31h/KX015ggruU/L1QNzCo1EO9urRNRQ?=
 =?us-ascii?Q?LrMymGq/G7Uajaz9M2bKNUs9IgYdLo8l7tl0XoBha+QZYWedsyjZXAqDPV2c?=
 =?us-ascii?Q?ottBnQRliwZjc1VaMRt4Npqfk/uC+5P74d5I1sGMQB4q4Ftj9ZXCIKuivmTR?=
 =?us-ascii?Q?MOoUA5t5ou4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OnyMz2Rvc360qRpnRERKpmBvV88guAJhI8wa4KRaV/Hw6YlX3YC59EEId4ad?=
 =?us-ascii?Q?nPxephTlsyxvsvTbyUlo2UW2lGudTmT7y84x2NOBgY5V53Dr/ce/d/3/lbal?=
 =?us-ascii?Q?JG9Xewd6rDcry7i1Elc00hnw+jTXu5oR0FugBE/1CoKg/eu7Do04OIcRx4QH?=
 =?us-ascii?Q?HHs9xy76AmTizHKpV0ew2IusM2VMW+ioCfLEbG6UfLZefbx9/jycQw18JszH?=
 =?us-ascii?Q?+ATf6sdES3PsgLsqrAY1kI8tGbjKEShvz0E3O19TXPQT2pe78X29yjmy91X5?=
 =?us-ascii?Q?k40clIixU0ALjPUhpYloaF6uaH+S2OHfRDKnP7R12uiKyvEHXTJFZanCNJb8?=
 =?us-ascii?Q?X3jBrzkDLCA5zMXndoiWTSk62n0bpJSpLq7SxF/gi24X2VA6pUM89rpVydBM?=
 =?us-ascii?Q?YW4n13m6uG300wm9aO3oO2QU51UHKykGVYVBzQ6ymlriJQWCFg3fZEBQyi3r?=
 =?us-ascii?Q?RILCtiGNi9TxNGraayry0ZrZC7uk8kxgJ/ukWgHHPZ9WqYcLvLDMEIdhKKHP?=
 =?us-ascii?Q?ROzfWDyXFG3hq2pQmZ7mUh/IA7vXEYJLNzfDtQfgxlzRcUQSyczBAWLc7O/Y?=
 =?us-ascii?Q?cc+zPDmp3BS43iB2zKvOJ8rSfMV6HR0HSwvHsy1Jqyb9SxuApjMOxvw2I7+C?=
 =?us-ascii?Q?5x1aYqbHg7PVnRBu7s0/tNbUPx3+Ccoq0Ngg3uyX9W/gvyl7a6K/cdowOtC4?=
 =?us-ascii?Q?6M4Wp4isvUY92ZFsv18lYx618Z6CrMtxQz6ZMQm+GJzqq6cpYHicd1O22OFn?=
 =?us-ascii?Q?goAKtPzOnxS9Vu5JEOahkKvHazagCAH8dvlyF63zkj28g+tghEu3H1mkDCEN?=
 =?us-ascii?Q?0ZSqaQc/2GHD2K/4+t8JcPLVDz3+mZJS2pfUCHXcERN15QOwFn9BHpb6pwKI?=
 =?us-ascii?Q?xBtL4S2XAIwMEDLmJBPD1zlIJvB33sQgzswdO7fTV6VvQdcxnnpJk45QT+HL?=
 =?us-ascii?Q?BOJEIq8TBxwdaoYLlX0vnPrPAIA0Pkd/Aqpg5mB1nPMgT6G8WIe/oJZx5acB?=
 =?us-ascii?Q?xUILux6y1CikitYueFR/3zD7tDBt6qWFIPksXauRiHFTXsriii6mFvQfIaUv?=
 =?us-ascii?Q?vZEEjPvBi/ChOEmBmJ/zE4Yvjr05relHbDWXCTMPT/8lWXHKzAmvhmMwTj8j?=
 =?us-ascii?Q?0fXkwwDaI8Jud7yV4fTGM3Vf6HrhWmKcS6Usyx5/MgqrHLq/Tja8f38d55R9?=
 =?us-ascii?Q?JJsiSni216h7Vv6XyJmbCoBMWsTcVdcI3n4WvSL2O9QNGhPZ9VHg5seeKSqp?=
 =?us-ascii?Q?mxQgEPZl50Y5LEQM4ffTsxO2fpbf7EeItXKG55tHd9rtPIY1KvvDzYCsDxDD?=
 =?us-ascii?Q?dYphjStRwVUOE0LUsI3un65DjM+0ZdCpQHlJyN0QWhAL8zhzK6phOFp/Yzgm?=
 =?us-ascii?Q?D1wiK26RazXAtFt6Jm4x4Y4EeEzshYk/zQvHVzvjtSMOEevgamhf4XzyYPQH?=
 =?us-ascii?Q?lpQVjdNE3p33clZYZXN07v3f6+lEXLkvauV6sFGZwJpkelKxscBbjMpPER+K?=
 =?us-ascii?Q?GMc5lrWwXmaupTpc2GYBIqpiKawTWGM3m5o8hRyPnpXVmkQViU8nm99z8EDL?=
 =?us-ascii?Q?aMhtNHzG3RzHWvvj1Uac1zdWxL/elrf334l2DLLQKqI/wM0V3wFHIX0H+6/x?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb6359e-da75-48ed-4edb-08dda9dfb301
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 18:34:00.4841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeS8S4tSesj7R9WhstkdP9yo5js4xHBFXjtzGPlP6elPRVwU6o1p/ILxz8gjZRqd8BiiBX/RsoQUvUu41dWm8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6489
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

On Thu, Jun 12, 2025 at 11:26:08AM -0700, John Harrison wrote:
> On 6/12/2025 11:21 AM, Matthew Brost wrote:
> > On Thu, Jun 12, 2025 at 11:05:32AM -0700, Lucas De Marchi wrote:
> > > Currently xe sets the guc log level to a verbose level since it's useful
> > > to debug hangs and general development. However the verbose level may
> > > already be too much and affect performance.
> > > 
> > > Michal Mrozek did some tests with the L0 compute stack for submission
> > > latency with ULLS disabled. Below are the normalized numbers with log
> > > level 3 (the current default) as baseline for each test:
> > > 
> > >                            Test \ Log Level                        3      0      1      2
> > >   ----------------------------------------------------------- ------ ------ ------ ------
> > >    BestWalkerNthCommandListSubmission(CmdListCount=2)           1.00   0.63   0.63   0.96
> > >    BestWalkerNthSubmission(KernelCount=2)                       1.00   0.62   0.63   0.96
> > >    BestWalkerNthSubmissionImmediate(KernelCount=2)              1.00   0.58   0.58   0.85
> > >    BestWalkerSubmission                                         1.00   0.62   0.62   0.96
> > >    BestWalkerSubmissionImmediate                                1.00   0.63   0.62   0.96
> > >    BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=2)   1.00   0.58   0.58   0.86
> > >    BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=4)   1.00   0.70   0.70   0.83
> > >    BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=8)   1.00   0.53   0.52   0.78
> > > 
> > > Log level 2 is the first "verbose level" for GuC, where the biggest
> > > difference happens. Keep log level 3 for CONFIG_DRM_XE_DEBUG, but switch
> > > to 1, i.e.  GUC_LOG_LEVEL_NON_VERBOSE, for "normal" builds.
> > > 
> > For series in general, I think this is a good idea - no need to slow
> > down performance for customers.
> > 
> > Downside is devcoredump from customers are going to have less
> > information. I'm wondering if the GuC log level is low, if we should
> > print something in devcoredump indicating this, and instructions on how
> We already include the log level in the GuC info section of the core dump
> (and the debugfs dump), I thought?
> 

Yes, GuC log level is in there.

> And note that the minimum log level is meant to include the really important
> logs. It certainly isn't as complete as higher levels but it is hopefully
> enough to give us a first thought of what is going on. And if we need more
> then it is easy to add a comment to the bug report saying 'please re-run
> with this extra setting'.
> 

Sure. Typically for really difficult problems you need ftrace (which is
not available either) in addition to the verbose GuC logs to really
figure out what went sideways. I guess I'd hope customers are not
hitting those types of bugs too.

Matt

> John.
> 
> > to turn up the GuC log level for filing verbose bug reports? e.g., A
> > similar message to what we print in xe_device_declare_wedged?
> > 
> > Matt
> > 
> > > Cc: Michal Mrozek <michal.mrozek@intel.com>
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_module.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > index 1c4dfafbcd0bc..4809afa7ce3f9 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > @@ -20,7 +20,7 @@
> > >   struct xe_modparam xe_modparam = {
> > >   	.probe_display = true,
> > > -	.guc_log_level = 3,
> > > +	.guc_log_level = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? 3 : 1,
> > >   	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> > >   #ifdef CONFIG_PCI_IOV
> > >   	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
> > > 
> > > -- 
> > > 2.49.0
> > > 
> 
