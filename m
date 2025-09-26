Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5368ACAC5B0
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 01:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0379E10E9C6;
	Fri, 26 Sep 2025 01:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDIg6xW4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904BD10E9C6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 01:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758851029; x=1790387029;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=104m2qx1I1wwYugBlKudViY3AB/QsDKzk84NrW4nwyU=;
 b=fDIg6xW4CVO6UqD22BiM0G4UbXNN0BDIAfZO9q4Z4iY1BI+k3F4oz5qb
 9eHuHxoHYr/gW9nxypBwfk0vCn8UNNX9qgT9xRFITrCZITpMiA0Z5d/ok
 1eWn0oC8BSiTSaaxz8gfysUjJVRCCVtrabdVUJvbZ73nimkoZw+Ctb2Ds
 Y1JgEdWe29XFXwoHWhsk2EytkJIdjQEQDIZxALq0CsXlas6CKrGl3/tgm
 rIrahI2MC8zrEg77Gbg2ZtA0i9SegWxxaokdOHvpMLIng5WkjkiJ2iEk6
 ikAIf+a+Yza60pxyiEeqpPNptw2glc9KtWIWQCDbPmCbKtCXaFb91c3Xy A==;
X-CSE-ConnectionGUID: JGtxz/TpTp6J9kxbvCA8tA==
X-CSE-MsgGUID: XOoFpaP1QMqwfHjB2N+dMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61101918"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="61101918"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 18:43:49 -0700
X-CSE-ConnectionGUID: JHzuFWhCShKuRTAV9XQ5GQ==
X-CSE-MsgGUID: xuw6K+2YQhqrfDPI+zv+bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="177940413"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 18:43:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 18:43:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 18:43:48 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 18:43:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xiGJS8g4SNUEtlXuN5XLnumWGi3HZopfph/OV2K9MDxDAd96ZO9cJtebluAjdxbxb9NHyZLZ3luAaErwA37umvpEDnTjtG7ZRbCIEPFFjlgws/YaKeftPiLwa6nBUKgPCiF482VtTh4Agf2LnVmYso3+Rgd5JJBNlfSMIYuSauyNVhmb2asJFn3VjZJ+d2KSqX+2fpLFavny1Rx76snHiYjGc2rRSrDw6SKmIN+uqQ3T1rgDO4wMeI6m92C5gRZTGBnAal8a9wfW2DID+iz1ZNxV9AodKgW+vpQq02qEz0NFRc7Tprh7q2YbDCetJGWpqDDTWUwrtFHBnOcXsJITRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JIEJTD2M7O69mvJE3PLs56xFaRNzK7WGv8WAwvZ68Q=;
 b=aFX6MM3MUJ/LG6Q1Q1Lux5wERWeuFWmDvXFrWIPop8O1YLtOIp7yDQWaTjfsucos2K/fL5MocEmsB8gzBdSoSIpbR9737vlpUcRgt2eypIhkCa8esGitp3avcDZSjSX8gFUTSAoO7v1VI3sl+jwgr1bflBmqFGla4d1E+f9Up7wP8t3n2xxJ9/3dVJ2mK6lJjJRaV5xyppjU0KqjPb8wGPktHcqcSSxAE67rmzlS/9UXnAhEVM25PFLMY6pJ4AoecfM0Ct4wG/Y4buAnzde9inZkW+em5tzfbPmzViETU6d+h4oQ6DX7MOK7KH4PJWNlnRWNAETNM2Toa9bgFkNlVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 01:43:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 01:43:43 +0000
Date: Thu, 25 Sep 2025 18:43:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 14/34] drm/xe/vf: Remove memory allocations from VF
 post migration recovery
Message-ID: <aNXvzPBKizZjBxzn@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-15-matthew.brost@intel.com>
 <60a52da8-6949-4c51-b7a1-16c71e4b4fe6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <60a52da8-6949-4c51-b7a1-16c71e4b4fe6@intel.com>
X-ClientProxiedBy: MW3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:303:2b::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 462e3ef1-4f3b-4e56-e3bb-08ddfc9e2051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bkab2C2T5w1h1LwR0kkNXsS1GIxhwMZ9SB6EaMAghKZiizRUBL0t4NxjNaF5?=
 =?us-ascii?Q?gdE4ahvuXGudCCJo3P/hUiSbh7NLkKzYDNPDMEpP619WViOBVTOgbJ68kiXD?=
 =?us-ascii?Q?Wcr5X7DgZR8GGjsMBFf0Bh2JzrHZvpV+0c9LB53JSRNRtuSRzJb5kxX7akJZ?=
 =?us-ascii?Q?+TQOu008QLQxUG/XPXBk3OycaqyFhqMphiYevZdk0XfLOGMQ/aYYhI9ZeTlH?=
 =?us-ascii?Q?Ogah+2lWDT1aZHe8i2pwetpOMJyV1Xt3hnJScFQL5G2s2HR3rhjtGuw7QMhU?=
 =?us-ascii?Q?4bc2gs0nMaT39lDt8PiBsrx/l4Yne1wpuhv4KyHkxykI0TfH4NdkAoxHMoZO?=
 =?us-ascii?Q?5JAUnlioP+5kmqZ30CgOBQU6i2cqHvOcfpJT7WYWxsQVnQ9jdKjnRB4EAWVa?=
 =?us-ascii?Q?H64ySQtNr9X/KsjTVY55Palf2zR42GSqTpOjVfbGnwbh0atGyKDfmxcqNS/4?=
 =?us-ascii?Q?7T2K0fjvPcTcgCR76J3ITUn6kvSLvhPEuQRV5Cx02bi3LLQvDtbtKIlFXPtp?=
 =?us-ascii?Q?vUmVi3MuxP6J83VhFzcHolwdE1sHqW4aWbjps2kD0iAnXuhvJXwmLXzHocD4?=
 =?us-ascii?Q?6kapJRT0iuis/w9KwdmE4fL00LlBCb6LuqgNEIRTwSBsY/dCjT7Z/18Zk6Ko?=
 =?us-ascii?Q?ihjMGy2nVG4U/s3c4EG3TUXMQo27tcqhNLSY4LMuYhJuolqShT3FO1dQekqk?=
 =?us-ascii?Q?jAWAWyyYXS1EGAutEH9zIUPc2G4A91FkXLP6d5ReMHQjCUumbRf/POTVRR61?=
 =?us-ascii?Q?tiTtm7WrXWh7wL97cbONq5WD/NUvHKX0p4fsU0dhYwNNrOoe86t098fhaLRv?=
 =?us-ascii?Q?VLzruPV48dX+VEmC5DCrwKSx9zzg7TNjKIFEgspEPn2g/YmStk6nPCbZHm5g?=
 =?us-ascii?Q?GdhJxKz6KZYl8E7JyQ5e8UIZreX2egMFYhXDpPb244zNCBXOjx494NCghVRr?=
 =?us-ascii?Q?yGzhiv2KKk7FTTwF0GmelKmPPbcNe5/oSRabX2P7rweWh8BwU3TSeEhCdAM2?=
 =?us-ascii?Q?4ODTsS6ZK3TmvdGDbbbdZc5TkjJ9DsOnXvpGqrnjpr3YPbFT6OrTyAkbq1LS?=
 =?us-ascii?Q?Z0G5I/Fy2JGVFnbDPgVnDdeDFT7j20kDJ5FsBSBTLrH3nKADP/9r24kgK+i7?=
 =?us-ascii?Q?tmMGJXDavgf+K/UPWjOUxF1uEoBa4a2xD6PuVP36Ymze5AHPqovLmFWpWSsJ?=
 =?us-ascii?Q?BO7RQrbtYYLdu7chQKa+HVQz+x61VvxDKeUdEq7LaYBXMNXM5kF0+ml4Sw6Q?=
 =?us-ascii?Q?4Nm5FDquJUtgonMDGl/JazryCA8YOdF9ratuSX5Gon9qtfnAJ5rPZdfiONGD?=
 =?us-ascii?Q?KcfHPBrtclIzV8/n79J380oolAlIcF2+lzOA9uISt6wwbyY+4e5GIbFQeqs+?=
 =?us-ascii?Q?rbd3+kJNmALTX9HvdpwUkIPzhz62FVB4NPJ3cwHK+VeFTSew2XKOLlSKfP7d?=
 =?us-ascii?Q?iWxkWbuFFRU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aKlZqXiPbYPxYIKCoWexS8tGJ6saxteX2M+3/9TlZBSbImADU2ALekE6i0Pt?=
 =?us-ascii?Q?Irg3IFxI+od42UIJLZo0mgj+ZjpB7OQd9UWW46LP9ksyux6Gw2PVp61ApoZt?=
 =?us-ascii?Q?6B9hOzFC80RervkD773Y2pc2pXcHqxvknoZpi2zvyqSt9LZxL64xPmbqnWo3?=
 =?us-ascii?Q?eeAIOYKQ4wEj0mY/3jlFuE9Xoeu9kms0VhA0OnJNMsDWg1DbY/mqVS/U7VVK?=
 =?us-ascii?Q?tlKIyM+QDTfqIdQnF0v6vK3sNiZI05wuIEOddYDOLNXM8/xm50YdIRaw2y5F?=
 =?us-ascii?Q?0u8voPbmI+PIqZSAXwTTogeqgcq4c+8FPpRIg4hUsdb7f6lxUpLMXjHA6am3?=
 =?us-ascii?Q?EF2fEZ+LjdQm+ZQndOrEf72oIylnwv9yeyUXwmKpoppL4WrmFxw9WngKyU9s?=
 =?us-ascii?Q?G0SXFLjGNbEylra1zigXvF5brdajj1N/RYC0ey/dddJFOaVvKTE3nUGkeYC1?=
 =?us-ascii?Q?dgTBFpx+W54i8quRr79kPfTh7AXndshKZ2j/Mc7VS0w8Dkw7shwqbZcZy35B?=
 =?us-ascii?Q?4TpoRjmfomjxgpQk1C9AxaQSJ5y1u6azIBcbMNlMNgcmNxJNuc9P0Zj2YO/E?=
 =?us-ascii?Q?MxL3lPpnhs9F/OJiaSI8yhrh7VH2+66mjN5sMA0xElS7utxPOVvs0D0Ry4gT?=
 =?us-ascii?Q?0YD7Av1zw+gSbzKVZ4cdubCphPwyrSuqGs1rMbq4QkGeTBTV+vfIkVlR4D+C?=
 =?us-ascii?Q?AMd+HJp19KtUwTK1OPv9qcKbnUTQxh2oxeDq8nsPP1XOzjK2fE8Z0EH18lpR?=
 =?us-ascii?Q?RfbD4G/ZZWYk6wp6jzJK4EkWrIpRn2gh6HxCZD7fAU8N50KgBRq2OAuQHo5p?=
 =?us-ascii?Q?wHFB+u5Q5IE8g0Zw1QKksilFDUBVUEeadYk3ltM3znROA79e09bUfqTBOxaQ?=
 =?us-ascii?Q?VVH/vhhGyqtX+ELFLGRG+WgOiT95SXPNnWlTi3D5yN/BOOTIFL+SEjHC+VRL?=
 =?us-ascii?Q?QaSPvlXS0l9xEoOZKGmxFEE0SZZ1r8pO1nr1O3l6nB4Y7eUUUPleCVj5lYzR?=
 =?us-ascii?Q?0gZksuT4oOY7NNrFSlPcLt81o8jU6p76YcvLLCaYo8vj5JV9xH/DM6LIwQNr?=
 =?us-ascii?Q?9lspF65fASjJacDQJkJppPfLZkrd9HFrMrOwURfjPxjsEDzMl20Iv/jjRqYV?=
 =?us-ascii?Q?q4Pidj4fK33wQJc+LKX8LTO6QPDbniXLzhwy9lNcPuorHhbG4A3NCEH3Hg9e?=
 =?us-ascii?Q?ShBNpqCjOTkS9qz5QXGsKx1EAKYT+ggOA/Me9lsoU5nnNivLUyldObsnyS9P?=
 =?us-ascii?Q?/KkLky55UiSsbz5OLtP2xPbhLAqMRg4XVY5vq1aIwYpdnDlUyAsAfWkYPbme?=
 =?us-ascii?Q?CLU8CEK2QD2APxfxJHvC8pYenMedyy7aFl3OjclzLV0hyL8v7M6yCW0txclh?=
 =?us-ascii?Q?WEgHaphwqHbypZJ7W5LVGN1Zk37d1MyXtSwzuVHpd79yC9mvWPG+OkhurLm9?=
 =?us-ascii?Q?OKqJxiK9UFs0NYwzx+Axsmuh50r7hEVsZbXPJ2CotqDMh7i8CFaA4/LX4EHz?=
 =?us-ascii?Q?VeoL3H9f+YBo/4y3cIWDIydJzkum7J/l53Q7tsjjrzquUG0bg5cnnkscEc1v?=
 =?us-ascii?Q?aXgQg74gJY/jF1whYqm0s0FTqNjGjX/b2BbmwJkKMajhcH3elNL8q2mFp1Ec?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 462e3ef1-4f3b-4e56-e3bb-08ddfc9e2051
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 01:43:43.5930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwHBuEUTJaEx/wTtMEbrncM06Ie4ojB0ibYGr3ZZ+BXic2UeFEgrh8paKoPEq55pJZcGYGrq2paKKBjKHaKKqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5981
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

On Fri, Sep 26, 2025 at 03:35:33AM +0200, Lis, Tomasz wrote:
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > VF post migration recovery is the path of dma-fence signaling / reclaim,
> > avoid memory allocations in this path.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 29 ++++++++++++++---------
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +-
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
> >   drivers/gpu/drm/xe/xe_sriov.c             |  8 +++++--
> >   drivers/gpu/drm/xe/xe_sriov_vf.c          | 14 ++++++++---
> >   drivers/gpu/drm/xe/xe_sriov_vf.h          |  2 +-
> >   6 files changed, 39 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index cfb71b749e52..8304c26c076e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -1214,17 +1214,13 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
> >   static int vf_post_migration_fixups(struct xe_gt *gt)
> >   {
> > +	void *buf = gt->sriov.vf.migration.lrc_wa_bb;
> 
> can we just call it 'scratch', or 'recovery_scratch'? The current use is
> limited to lrc, but besides temp buffer for WAs it also stores MEMIRQ regs.
> 
> This name makes it look like something more important than it is, and does
> not describe all uses.
> 
> Besides that name, LGTM.

Yes, that is a better name. Will change.

Matt

> 
> -Tomasz
> 
> >   	s64 shift;
> > -	void *buf;
> >   	int err;
> > -	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
> > -	if (!buf)
> > -		return -ENOMEM;
> > -
> >   	err = xe_gt_sriov_vf_query_config(gt);
> >   	if (err)
> > -		goto out;
> > +		return err;
> >   	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> >   	if (shift) {
> > @@ -1232,12 +1228,10 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
> >   		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> >   		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> >   		if (err)
> > -			goto out;
> > +			return err;
> >   	}
> > -out:
> > -	kfree(buf);
> > -	return err;
> > +	return 0;
> >   }
> >   static void vf_post_migration_kickstart(struct xe_gt *gt)
> > @@ -1314,15 +1308,28 @@ static void migration_worker_func(struct work_struct *w)
> >   /**
> >    * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
> >    * @gt: the &xe_gt
> > + *
> > + * Return 0 on success, errno on failure
> >    */
> > -void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
> > +int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
> >   {
> > +	void *buf;
> > +
> > +	buf = drmm_kmalloc(&gt_to_xe(gt)->drm,
> > +			   post_migration_scratch_size(gt_to_xe(gt)),
> > +			   GFP_KERNEL);
> > +	if (!buf)
> > +		return -ENOMEM;
> > +
> > +	gt->sriov.vf.migration.lrc_wa_bb = buf;
> >   	init_rwsem(&gt->sriov.vf.self_config.lock);
> >   	spin_lock_init(&gt->sriov.vf.migration.lock);
> >   	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> >   	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> >   		xe_gt_sriov_info(gt, "migration not supported by this module version\n");
> > +
> > +	return 0;
> >   }
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index 2ac6775b52f0..195dbebe941e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -23,7 +23,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
> >   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> >   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> > -void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt);
> > +int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt);
> >   bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> >   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 53680a2f188a..496b657119de 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -58,6 +58,8 @@ struct xe_gt_sriov_vf_migration {
> >   	struct work_struct worker;
> >   	/** @lock: Protects recovery_queued */
> >   	spinlock_t lock;
> > +	/** @lrc_wa_bb: Scratch memory for LRC WA BB in recovery */
> > +	void *lrc_wa_bb;
> >   	/** @recovery_queued: VF post migration recovery in queued */
> >   	bool recovery_queued;
> >   	/** @recovery_inprogress: VF post migration recovery in progress */
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > index 7d2d6de2aabf..358a35c80d5a 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > @@ -116,8 +116,12 @@ int xe_sriov_init(struct xe_device *xe)
> >   			return err;
> >   	}
> > -	if (IS_SRIOV_VF(xe))
> > -		xe_sriov_vf_init_early(xe);
> > +	if (IS_SRIOV_VF(xe)) {
> > +		int err = xe_sriov_vf_init_early(xe);
> > +
> > +		if (err)
> > +			return err;
> > +	}
> >   	xe_assert(xe, !xe->sriov.wq);
> >   	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > index 7d91553c4acc..e622a7c562c4 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > @@ -180,16 +180,24 @@ static void vf_migration_init_early(struct xe_device *xe)
> >   /**
> >    * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
> >    * @xe: the &xe_device to initialize
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> >    */
> > -void xe_sriov_vf_init_early(struct xe_device *xe)
> > +int xe_sriov_vf_init_early(struct xe_device *xe)
> >   {
> >   	struct xe_gt *gt;
> >   	unsigned int id;
> > +	int err;
> > -	for_each_gt(gt, xe, id)
> > -		xe_gt_sriov_vf_migration_init_early(gt);
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe_gt_sriov_vf_migration_init_early(gt);
> > +		if (err)
> > +			return err;
> > +	}
> >   	vf_migration_init_early(xe);
> > +
> > +	return 0;
> >   }
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> > index 4df95266b261..13969c6910ce 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> > @@ -11,7 +11,7 @@
> >   struct dentry;
> >   struct xe_device;
> > -void xe_sriov_vf_init_early(struct xe_device *xe);
> > +int xe_sriov_vf_init_early(struct xe_device *xe);
> >   int xe_sriov_vf_init_late(struct xe_device *xe);
> >   bool xe_sriov_vf_migration_supported(struct xe_device *xe);
> >   void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
