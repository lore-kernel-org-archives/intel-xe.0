Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526C8D12663
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCD810E68E;
	Tue,  2 Dec 2025 18:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHwbTh5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4305F10E68E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764701312; x=1796237312;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5sHz7Y3X4R116Gqbhr+/7PLzKgDB8bbFrFutWOvqTfU=;
 b=gHwbTh5PlOaFiD1XBfz4rr0ZKghJQLBi5bSac2N6i25AmpaicllZo34k
 v1FC2MmKynA4CaD/IwZgFVTfYg6Wpt2n6r1/WQZM3cAitYSiQt4kFwwBm
 QJcPJA1dztEW5dyU2bRsuwemki6lg36E63uRT9S79bS4ktSwHi/OJ2Ggj
 klbiFyxWWEVzxmV7Hpq3P79dtt+21FQNkbVkSytrqlFIwf8yJtpyAQzrz
 DbY9TcDX5GmBCY7PoBAA9BfyRgTC+KWU1PzGZVuWqGECR5JWtmULbn5/u
 9gqd+aJQQRaidALwDV8MktRXHgtj8BrYdk+MyuBANXqeskDSczixUL/6E w==;
X-CSE-ConnectionGUID: VACIkoQvRsOiUHZ9G6zmqQ==
X-CSE-MsgGUID: kI31qtlJTiC/uRP8t5+6AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66848686"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66848686"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:48:31 -0800
X-CSE-ConnectionGUID: 4chxkpVzReG35CQ8FJ9O1w==
X-CSE-MsgGUID: RcGL/JSyRx+K9qWK/cHKKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194276122"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:48:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:48:31 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 10:48:31 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:48:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8yJznHYA2HpWyQUCRw5fHyUPFjXJ+tMSd9Jf4lJ3V7mn+R4nBq+b7VVfm3Bj9hXkkV+/rt5jv7bBDBAC1p0Uisi+CkhCAQCP/9LG/DeqaXMOc5mPpZZIfKn8B5khBV1bT8fpsRrq9KnVEuWimyS2dximQU1MCTKyEMR1qNFEdJ2uwzXzfZofJnEcYdWeaJiVuHLGzSuZp23P8wl4dfbcH4mpXBJByz8zthNx2XylfYad1NB5z699YSiPV/Z7TwvTvEHWN5RKwupFpSj5PuV4QFFSlk0qTKrxq+Kng5l8UKOl75v7xSsmR1Po20L9aKNKkc6CbSux0yn18vOwJTFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZF/ONb6H3EUwMMVC29fArbc/Wxb7BWcjQBtRLDnC1Lk=;
 b=HI8K0wSCB9mAVkxqlCLo9RwDkM/yup/oNzwrkEWuRycU2iFVBpnQRnjIsLnFplT5qet4ISXdDunBYahiYDeMf96FJvzOOzGNZw536vZ0QQkNW0PKsgG8xzVSNK7Vj5OecKiJZw2S8CN8fuTS3UC+lUEd9MRx2223oTuAuIkK2D4hojJ9MYVp0io/z7ycxz14JdQXRbshFkV+rwToSVCFgSi5Gy3yzV9gp1o2DOdah0ZkpsqV8WAHjBlhKC16xXkbJy/cq9Xdn7HrgGq4VVdNGfavtctV6Rz83iPnC+mwLqpUlKoW5fZJIGXQfe7mr3WBJfxyqZG2UL9C0GmZ8zBoOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4736.namprd11.prod.outlook.com (2603:10b6:806:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 18:48:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 18:48:28 +0000
Date: Tue, 2 Dec 2025 10:48:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 5/9] drm/xe/bo: Handle CPU faults on purged buffer objects
Message-ID: <aS80edjt8NMTWNYo@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-6-arvind.yadav@intel.com>
 <aS8zH+PBu9yDmRc0@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aS8zH+PBu9yDmRc0@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0104.namprd04.prod.outlook.com
 (2603:10b6:303:83::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4736:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb1d9d2-841d-407e-c606-08de31d36205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?L8Csc5b2Ymcp/g5hOq4L66Xt7jgrZplgQIJHrX4Qv7+DKsN6npvt1Lx99g?=
 =?iso-8859-1?Q?mqyItOpWV6AI5AwSMgWXdn4r7N5+6VIiv+WDA8WLQIK9eoWsxXzrLLtAAN?=
 =?iso-8859-1?Q?NZa/+tyvnlfh8qp1kNqACbtebbFtzrwsA8XUMkrkEK46Y0eKqaIWCj26An?=
 =?iso-8859-1?Q?UlJriuGQLTX0BCuVyrU7RVVM7entNGiWeSuVhOMTgG1S6B75dOJQj49Cgh?=
 =?iso-8859-1?Q?3MUJP/l3Zt3P9asK/kOBVKnaPW48wzYngKUwGtR2Qktuxgkgo3aMVUcaFI?=
 =?iso-8859-1?Q?uP1EJd7u19f9QzpCS/WqKhebL+8GMe8bAoOwssWes7bfu+BxwQURkU/z1W?=
 =?iso-8859-1?Q?GRCV5HSZOOa2dDQGCGsJptdqILruE6T5KZHMry24hSNSWZEQrUrY9uMN9f?=
 =?iso-8859-1?Q?zQgG9PA5aLDB+QHrJPPZAKa11BJY+NmQN/whDlmlnzd6lWUcB9AQgeg20+?=
 =?iso-8859-1?Q?njDPDWTFlfhzNxKDIkCdphwUUH0iAHuMT3BAm60DJLURHwqP5U2pa2oEVP?=
 =?iso-8859-1?Q?jo3oU3DKzkV93jTmpAKd5K9+t7OV0FHVcB/xs1lF+xEuBYaRwcmPtezgms?=
 =?iso-8859-1?Q?S+VmjfWhdkmytyh3+QmpvemVqphnC5BLkkA8P8FRwAgEHlUUSZNQmXCYb5?=
 =?iso-8859-1?Q?56deDDbg35yT4LLj3o09thYN8Mnw0E4H9l3A80Nfh6b+V9vSNkPi7O/i8M?=
 =?iso-8859-1?Q?kB0Dved3RgcccnTcmIhvSc5/pJ4MfTD6Z5yFC6IgFOgEIWOpbh1XOtlo8Y?=
 =?iso-8859-1?Q?u48qomIkbTrx86E13A9+5a341jyFTJAKkeET/COeGd/LSfpHL2aQpPGUs9?=
 =?iso-8859-1?Q?UXx/wgjFLxDn/RPwjWuB1u2wag14RBPHXwCwOp5OWT3pntIzGy0OE9q377?=
 =?iso-8859-1?Q?j4ukIko+kd9NKt6BLRJaWcLaaFMcV+z6yI62oUraoBgB03vA6YZdYjmrtH?=
 =?iso-8859-1?Q?kpzdfX3Q/2mFIrQM5+ep1Xa/JvN9CITgkQep10m1QR2L6VPUV27BS0Y+K6?=
 =?iso-8859-1?Q?7d2YV4wcukfIF2FaO26ouHcVnjarVDgw6274pyRdoc3lPZPXxhdWY278MR?=
 =?iso-8859-1?Q?q0fNuRyKVYXAeRR6OC3jOE9PfCRkdFlkZWZ2p3Osrl9Gq/W5J/y/T5W6aj?=
 =?iso-8859-1?Q?/HGbhlk43rNFTOxHFsp0WtZqXTsXBH5upVazb45O9JKV0/VGXyBSEGkE4M?=
 =?iso-8859-1?Q?6nlev7fC6kHaR0RvLeGslrFjhh5BHYsGktJ0T+0LdtuWnTgC9FdQWA5/06?=
 =?iso-8859-1?Q?VFMuiK32LBzxOq/c5fiKwVHh3Iecjg22S0fDseb08h3SF6x3vuWKM9VQ3N?=
 =?iso-8859-1?Q?hT0RnbGMNZLyGg5du1HPba09lqimdb9Fij3xUABx2CrwAj54wmwAE4Pptd?=
 =?iso-8859-1?Q?292rFMkjkGfznBEn3APfeJaWwHAyV77QLweqKv8BKOgtyKO9aL4TR+Rwe+?=
 =?iso-8859-1?Q?JFB8p4LlDWACHeLy1lYzVQYuZ4FIODwDjTW/Yq+dfvoEC9GSYsV6LmlSdH?=
 =?iso-8859-1?Q?h9KoGd4XviKtiXNm2qxHUG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PnfzouczHBmhfS3jsFfdZje7wnbFlR2tMOEX0J2feRoDdwyCPYXz0mGY0N?=
 =?iso-8859-1?Q?79EnTAndxjOOTrZGd6JE5Stp0kH4wnlahTwpCva7u2kxET43CXsL79sltE?=
 =?iso-8859-1?Q?ws51MyK+f8lTMbb80WEC6mYfidqnKQ4xkdqyqB/cvDQpzo6kWfVbgkEICK?=
 =?iso-8859-1?Q?eE2CKEzDrg1Bib+wJqQCHU90Rymb55WljdimX7TdDn7zOT7Cba8jzxoDdy?=
 =?iso-8859-1?Q?FhO/cwRN2OaErYbLlzcUbESnDh1sBLOgwlGSfoct7Vw1ZLCkh2Y9aMMGEa?=
 =?iso-8859-1?Q?wETZPz/fRAGb+ZqXSU5Ilm92+zgp3iqAicI/cJUidD2cW+s1MoyZofI3Tz?=
 =?iso-8859-1?Q?O1wfqZ+21I6k+D71MQTlNQ4TEWL1j9FhD+QjaXGXEXI1DbOpKXAIn6WQMg?=
 =?iso-8859-1?Q?Eyfu/3gkhOAa3UU1NQWyT6ZfP8Syykeeail031GhClhyKe4dgyCO9RrTuy?=
 =?iso-8859-1?Q?2c2gIC4O+17Gy4aIq1xcDfT4h+BHi5tSijVtN5eIFVKuX+3ixmgayzZMdH?=
 =?iso-8859-1?Q?IQ0g1Acexbxnbmfqd9mxRrh14UgoIuSCNiFUWC5UFd65Be81C3BbTk0HFf?=
 =?iso-8859-1?Q?uRNjS8Ki9VgHW8W+CDAi9KUCM7zGul4pw/jpv6BJX5cUlEDk9KWvDndcxP?=
 =?iso-8859-1?Q?jNO9ogKiyjEIf1mOgvdMSSbOyzu44d0B8g5ja3MZLXR9tnR1jjLOunfdLv?=
 =?iso-8859-1?Q?PRpdZoK8l4IyLDtld1mDdtnQuP9s/dYutjNHCYDLxLJ8oI2Dz3fDlgOFN2?=
 =?iso-8859-1?Q?5c6IwRuj8qJ2r10C41eIfBkGjkCCmD/axLam8BblI+9PAx8RGbzuphPSse?=
 =?iso-8859-1?Q?gzLea/KfMm6uAQpfzXLkURQR/+gqWkyxn0/wLrCbikDKmqVVViAvRV6sb1?=
 =?iso-8859-1?Q?UtDbZehCHz0gqltutmBXY/YXmCYusErK7TAU9FmF16lgyTSlUKnbyDS/iz?=
 =?iso-8859-1?Q?JdE1pANRQvq91FoNnYYlq6PuOUtnu8ZZidQQkCtaAWegUd4VFzyRzChDRO?=
 =?iso-8859-1?Q?8b1Y595lZPUAM+wMb/cEM9aQT0oFpLjable48hk4NbAN9E4J3CA/5sWNjA?=
 =?iso-8859-1?Q?XHOdqTi2Ko/lCYvjE/DxPYGNQQS9mz1vs5XFyMSqn3fQ9tbiIQD0G9MHde?=
 =?iso-8859-1?Q?WJcsqYWWKVRa/9W6MBcs0jVo69vcQhlTjQyxbd3gnkEFdujf7NaVdsm3nR?=
 =?iso-8859-1?Q?Ec2eSDTV1Fxfo7S6BK4JFMnFSGswQHrr7Kxh10K85zP1Lq27+c6X7iqZTC?=
 =?iso-8859-1?Q?VOJQEt/t02+ENyqcjH7AJJflN0QdocIs3/rBeasOz6HL7a6x+dwGpTZzrk?=
 =?iso-8859-1?Q?pGkPOU9hG3n7r96KyGccinLDji1rBvvNUQX7NkBUb0JZMjqKRIt4Ue8q8E?=
 =?iso-8859-1?Q?A4mDHEn8aosvgkKx5WZddMCXcas45zwoP98WvbRf4uqHZt+qoA5gENXIc/?=
 =?iso-8859-1?Q?qsxOfQcv4wP/puqdew15T2B6YF4//KT7roHtwQu5msT5ziLHaRFIPu+1j+?=
 =?iso-8859-1?Q?ppWs0cJ/EiZ1swDBowrN4p3pEYlmBNOSaAXeBGqgHZuKZNtFFXI6sH6Tw0?=
 =?iso-8859-1?Q?d2b2KukDAc62UVNqI1fZDtVl3YvHZnje/D3RpSUY0Sm4vQ2ptgbEgQJ2Ln?=
 =?iso-8859-1?Q?2OwRVkM77ivG9NcXfcQG+Oy5eDQKO5GRICXmc0cZYixkJGKxJ2nbfMYQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb1d9d2-841d-407e-c606-08de31d36205
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 18:48:28.6866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3eIuj4QVSPTbpdeXQnST6MzOIx0tLvT0xniUAcbWqlBTcC5HzEOv/1dMzZokMhW3svamZ3RmhlWcauX0xGZZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4736
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

On Tue, Dec 02, 2025 at 10:42:39AM -0800, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 11:20:15AM +0530, Arvind Yadav wrote:
> > Modify the CPU page fault handler, `xe_bo_cpu_fault()`, to correctly
> > handle access to buffer objects that have been purged.
> > 
> > When a buffer object is in the `XE_MADV_PURGED` state, its backing
> > store has been reclaimed by the kernel. If the CPU attempts to access
> > this memory, it is an error that should be reported to the application.
> > 
> > v2:
> >   - Added xe_bo_is_purged(bo) instead of atomic_read.
> >   - Avoids leaks and keeps drm_dev_exit() while returning.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 

Ah, actually I think I made a mistake here.

> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index f0b3f7a13114..7f5bcf114ed4 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1992,6 +1992,16 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
> >  	if (!drm_dev_enter(&xe->drm, &idx))
> >  		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> >  
> > +	/*
> > +	 * BO content is gone. Signal the user process.
> > +	 * Once purged, BO remains permanently invalid (i915 semantics).
> > +	 * Application must destroy and recreate the BO.
> > +	 */
> > +	if (xe_bo_is_purged(bo)) {

Doesn't this need to done under the BO's dma-resv lock to avoid a race?
Consider the case where after this check, TTM evicts this BO changing
the state purged. Now we grab the BO's dma-resv lock and try to get
pages on purged BO. Seems like an issue.

Also with that, xe_bo_is_purged likely should have lockdep annotation
asserting the BOs dma-resv lock is held.

Matt

> > +		ret = VM_FAULT_SIGBUS;
> > +		goto out;
> > +	}
> > +
> >  	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
> >  	if (ret != VM_FAULT_RETRY)
> >  		goto out;
> > -- 
> > 2.43.0
> > 
