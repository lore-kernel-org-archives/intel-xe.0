Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C97CCE8D53
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 04:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3A510E256;
	Thu, 19 Sep 2024 04:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mf9OVDRi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6537F10E256
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 04:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726719743; x=1758255743;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TlOWA8MB6/2rqd1v3U8TDOAp+w/YT+E8lwV+HKVJ9yM=;
 b=mf9OVDRizvXXhfIiFMgORmDSlEmsqnA1f3v4mfempaz5j3+g6qDG73sI
 1smGB02vcbWWJluCeTwC5Fsoc5VQg5C43FWg7rIFt6s/cW6ikR9M15kPl
 pRQZkSqwxgTC/fIDLMXP9cXIL7TXFgEbFdkaPUL95s9VNPFRCwYQ5mX1H
 ToIdNnLB4uDHr57YV5XQ11txCkoH8CR01cV9VDOxx6Qfejke+pVMqaP8X
 L1eOKe8Ss9yoZH7g/ZJBHz33SO40iqbpj60LG7tx2/2IFA2dWG8WLHyD7
 tM2zn13h+MH0/Bs5Hgpya3uR+taErYS0XL6vQ2qJCzbDi24HnBsMvywXU A==;
X-CSE-ConnectionGUID: zqf2Bvq2SveQ3JZBgA4UXA==
X-CSE-MsgGUID: wcW8lUjfRca+s2iV6DOm5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25141034"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="25141034"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 21:22:23 -0700
X-CSE-ConnectionGUID: cHIc6/obTfe8cJcax4rDmQ==
X-CSE-MsgGUID: IMSDy49fRhuqTvg6uDZy9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="69405855"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 21:22:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 21:22:22 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 21:22:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 21:22:22 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 21:22:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlpsMG8btVGcchHUMZ0n/oyFSYEMFZaXHY8YFNpxWG/HaMxGZZ1brrl8+NpE9tCQyJF8vIQNf2/Ny/IkIC/xRAGwEWQoDMzK6BWQdS8vK9pUoWWYLZrLtnNY7np/RyaaVp82UxKSMmDSnI0uDFak58ONLHdDkUZFaqKoQ/PCtQNDuLgXRuBngHM76CzNYWrzQrsrOoDNght6cwVeeS9NSaq4xsZKK1RmucIPmOwxPIGHoyG1UbxEATRKmLfCUkZTyIX9jVIv7wQe9/VG3AgNAmEbgEbLLlo4bYQxxepXo9yVY+krLGTgHSWEx+rMaS9sVsmqOa1huluwOoEMaO97JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgyxixTw2xjNNQXsDp5eyAJ+RORGVYLcoIUmYfgqKFQ=;
 b=HclFTx5ySeE0dx6RYRL2L73sftutjJ2rS7u6XCr+Jefp41XYXlSCzSM3QCL1fWv/w6VYikOris1M3+VlppAJIkROjMhUtXzZQ2sEsnr0f5CKNQ7dqlTIj91yNJTRFnjMwPSwGdKetMMLM1+7E0fY2Y+anunEEIsFcfz+MFQLmmBa5tX5Kb9dAJ70WygrZLmnAp2xBycp7VX0E54yF9GQz2NkVe9jeCLrEso4K/xDhMxe5xPATy04B3+uPB3eTwUWS3i/ecLTqHgfeNOqMTeisIqKKGn9f863IDYY82ZEzeUb+Ho2xSDah2BX13QMJieeCeooesBH98NAr6F710fzmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 04:22:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 04:22:19 +0000
Date: Thu, 19 Sep 2024 04:20:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe: Add null pointer check for xe_migrate_copy
Message-ID: <ZuummcuUyTItF1m1@DUT025-TGLU.fm.intel.com>
References: <20240918221000.1124248-1-zhanjun.dong@intel.com>
 <20240918221000.1124248-2-zhanjun.dong@intel.com>
 <ZutVzBOBcklkarY1@DUT025-TGLU.fm.intel.com>
 <ba4d854e-81f7-49cd-8723-5967d7404e32@intel.com>
 <ZuukIs6ZwIQpYtep@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZuukIs6ZwIQpYtep@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4910:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cd313e-d9bc-4439-0679-08dcd862a6c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uNR9CRoDxB99EZ8dqJeKxV088lkDaLkAV55nwPrWNLECXMtNPUKuoCJaV1Yt?=
 =?us-ascii?Q?nt+bUXPZ2+RAn5cEpAe6u3R5miB7UQWZE4CEj7mYUfIAf2GxO598Ht0e+iM5?=
 =?us-ascii?Q?rdyO+pJ8efIh5PzTpKkkQcccR6u4xCocltbfYFw9Ww3dSZJFMccJQZyVxqQm?=
 =?us-ascii?Q?mEDq/TV8/SmJUPy2+/cCFJkM5NeKHUnEzhV4ekPj58lg4ZjFnUpphdt0w8uA?=
 =?us-ascii?Q?1UH2MxIsTskYzX1Rolvm60n/ooRSFap+nAru1PZupWZB37M9coVGKBQgtq3o?=
 =?us-ascii?Q?vLabdUV86R8utNoq7z4ZSDRmlckgmDNBShw18zvLQtvEKnJ5yy7oeM66ctxx?=
 =?us-ascii?Q?ht5vZPixTAtibzE9o8WGpKkK/Wfj+ncYUsUq8ejZkaEaQJbicqtxN1g7oiwy?=
 =?us-ascii?Q?ijnyo+HGPQEYPextZpzdSDbXa1PQwS4nkkl5mQd06T8ibAGOcgizj/kSy35q?=
 =?us-ascii?Q?62dYByWifL8xvdbt/cDNkLnqaQMsNs4hZZO2RSxfqgIMf8Dm4mTgC9yI8KL9?=
 =?us-ascii?Q?vRjOjEitF+dnbyMyFCJdyMvHQfgVwIxApy+hkX4NZmvLssj7u6uUJ5TfLlDM?=
 =?us-ascii?Q?VN/Cg+vcvfskFHsjmQaM25cNIY0V3Dij3ZZyWULZj1b1qDy8WS7NSpgxO5kS?=
 =?us-ascii?Q?usJzSZ1nq2gQVGy098Pr6cBzFPDWHmWUVx2oz93HRmkbAAy4C898JqwTdTXq?=
 =?us-ascii?Q?F2zBLOPthK5cWdNMnPSKvSfeeYCnknHm9vuCVsyYGwKjNFF03EPaUdKehymv?=
 =?us-ascii?Q?dO5u/WpKy14W8I/Px/RqMfnN4BlPdxOX/KMJC6pRZU6peV/3aGSWnqsA2Oyt?=
 =?us-ascii?Q?oEo8qQaEBPO+DaciDObN/2nQ27rs04Qhsf0xk4GOmt1+P64o+QUkm0ANke9G?=
 =?us-ascii?Q?um45vVs9eWyxzUMGUOfEtKGArkSeXygDuyyL2eJnf1PoDiT6T2itSoR5eyJj?=
 =?us-ascii?Q?mRWPbxn+NoyQCdJCvVGsy2dH9K3KSdjYOjotub5vnd/k9tZQSaVDJMCNjfHJ?=
 =?us-ascii?Q?3zirQw9zeTBydcjIQz7T9RxIJZMWERWN3LySlAcIUYNQialcKZP/D2DgT+a4?=
 =?us-ascii?Q?b3xVvLbSqfuzgh4hk/Dr2QDvB181Y8gNvdJ+aJ88uulUiXz0y+QT0/UcFa35?=
 =?us-ascii?Q?n7SF4puM5RkfIeNwdzLkweO2mNhotgQKvc8/y446zc9OjXz4ZNzMHS/21yiz?=
 =?us-ascii?Q?yghQG2tDkIUE8uO4ddh8DGrEvQlorIUNIn2LkqOU1KQc7B5+NtqfolGGy5ZG?=
 =?us-ascii?Q?6Bsf8VTiMsjdQySiM2G5b70qjUkCbNbhzLDzD2jPJ5o+H65nYzNr81l8kwZU?=
 =?us-ascii?Q?rt3lnXu+FcoXBqKxn0hhwxLiN7Q29kFMFDz7FQURTOXBlA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PI239w4QTHd/bETipL8oL0LCg2zYZLWHV0zIp1U9UtSAIrvw90bEHvZVDXcq?=
 =?us-ascii?Q?1dOzOsjmGUbmcjQgPTAQMr2rjVV5nhPPhkgVfbdew7M+wMEJHpzeTTdW9qbm?=
 =?us-ascii?Q?tbfDOR4XGJnJdWAtB81xho9iViCaOKYtF9YvZAW/I1WWZY0fapl8JjdR1RqC?=
 =?us-ascii?Q?XDfh4RAnU2Oh7uRKwZ/6T1urGS12atBSpgM7R5Vj4hZHOx+WZ+OcJaQBKa+B?=
 =?us-ascii?Q?TD/rbrcYg6kDShScQ3LMzdtyi9OQb1O3bdgT6qVCQxn41vzFehmwQWozcPo3?=
 =?us-ascii?Q?2AP7HnUA+YWcjowc015aIMGP/bhGdT9qrHqpg/TaP7Z5zwjDgd0EXUjBWcZC?=
 =?us-ascii?Q?TJCmWn5aifs5SQ71LE7nikskqiQcFzfVDHND6VeoYDEp/Xx2Za8tYyrbD07V?=
 =?us-ascii?Q?3V0eJgQmJG6jwQ/uCTKl4YugXV7z8+q/DjStBxPiVCSwkR2z42y72SghRvCi?=
 =?us-ascii?Q?yIvExlSysG27Wm9SlmQlrMJX+logdZneVTujx+jnUfmabNkNINMrq6XiCVBL?=
 =?us-ascii?Q?YH5IkAMMDPqsBZwFw9Q9s30cDjGZB8iSRLVTFQY2Kd+HfZ5wfMeRP+fR+J06?=
 =?us-ascii?Q?FusE1JyZRGpVfXJ8GCojl9iCO5YE/y3bNtwZaDkDt7gNzhmJQ9Dnfw6EZ4FV?=
 =?us-ascii?Q?xhhtU7sbkNXxpk7WytC+7QBnylRu0vSN8ydwAB7qb+naFkjizctq4vZOuWdS?=
 =?us-ascii?Q?6XVS4HWgPBJcRQRefV+xtE2RyO0LMVFlSLFtOim761tdhvjaUS/UkqmzsU1x?=
 =?us-ascii?Q?1mh5U43G3JQpOvb8TecC/Z1kD7Z1vZNLGI4TXWGo+7fgWsTt6GvY9UuF17u5?=
 =?us-ascii?Q?FIuEb70ihPokJX+fFh5eYC1ExmomEsi+KuTuq1Bxv5REdb7x5r3cLuzCfyZ9?=
 =?us-ascii?Q?moRPkuX3u16XxTXDpMjp+nIe6ElBjsx2HpxRVlLsdL+TBACiMZB6eTHGysyG?=
 =?us-ascii?Q?jHkUD7BXa12hjqLSLb4AgVlN6IyapZUuo/pU4lF/sAYEVolLkLMHxosVzbbx?=
 =?us-ascii?Q?O6LasT6xAxlpBN0sq45nm2dPyu92TdJqglY68GbSlqj9YLMWMP9D6oXHJPo9?=
 =?us-ascii?Q?aiXcwJ1wzoKfVKzF/V+AVNZrK4jD27v8lOnNeM83Da3U60hZ6Snrrc08pKSZ?=
 =?us-ascii?Q?l8G4ZCUv2UaLJYQivQZ8AzKOw+V2wmGLK9O3V4tH1520NVN598jNOsMfGo54?=
 =?us-ascii?Q?mq+1dUBKlb9XYcrh9/AE7otHj5+w3j72nRPNm354o+M6FRadGYanyC3vzz4V?=
 =?us-ascii?Q?RaZFQc7ki0a5HY7vXT/hAcaWMny8l37c/Br4HVgVfKwv3v77QrnscIYS5sba?=
 =?us-ascii?Q?QoR0v2skTNjGPtHdNZngOJmYp8hBgizphRFKfqXQNSSLgmxmn0zwiqEEFZfe?=
 =?us-ascii?Q?PMu2vUCaB++kWJv3r1n7cCEMlHrNY3MCTlaZmNQtelggKyToKMSZbP4Ofglt?=
 =?us-ascii?Q?0KinpvOzRY4yY3F34VHKlX31hxVAm4EtUY5VNJ/qpF/3ANTFXpSWPzgaVs5u?=
 =?us-ascii?Q?Tj6KwNSsZs6QFjy1SIuspulM2EMzHAf/NiAPV8ZEWTLq6DDZAWjTMMjV6ILy?=
 =?us-ascii?Q?vyxRvQPCqgodEil9xnJEpmVtB4GEeV6abJBXZO37b3lRDkDMnu/RBb/D/CTQ?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cd313e-d9bc-4439-0679-08dcd862a6c8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 04:22:19.7354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MttBtih+WUt5pL3u+H6Ar00i3pu5kSanROjiQl/DTEd5EgAk8c+xMf9MuDL6XRszcbMcTUs6ohCgZvLJaCEVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4910
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

On Thu, Sep 19, 2024 at 04:10:10AM +0000, Matthew Brost wrote:
> On Wed, Sep 18, 2024 at 08:12:20PM -0400, Dong, Zhanjun wrote:

Fixing some typos...

> > See my comments inline below.
> > 
> > Regards,
> > Zhanjun Dong
> > 
> > On 2024-09-18 6:35 p.m., Matthew Brost wrote:
> > > On Wed, Sep 18, 2024 at 03:10:00PM -0700, Zhanjun Dong wrote:
> > > > Add null pointer check for parameter src.
> > > > Update lack source flag to include resource is null case in xe_bo_move
> > > > before xe_migrate_copy called.
> > > > 
> > > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_bo.c      |  4 ++--
> > > >   drivers/gpu/drm/xe/xe_migrate.c | 24 ++++++++++++++++--------
> > > >   2 files changed, 18 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 5f2f1ec46b57..761130f0e9a9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> > > >   	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
> > > >   			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
> > > > -	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
> > > > -						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
> > > > +	move_lacks_source = !old_mem ? true : (handle_system_ccs ? (!bo->ccs_cleared)  :
> > > > +					       (!mem_type_is_vram(old_mem_type) && !tt_has_data));
> > > 
> > > I'd write it like this:
> > > 
> > > old_mem || (conditional)
> > Sure
> > > 
> > > But I think if old_mem is NULL this condition always evaluates to true.
> > 
> > The NULL ptr issue is found by CI:
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v21/bat-lnl-2/igt@xe_live_ktest@xe_bo.html#dmesg-warnings5406
> >
> 
> The fact this is a selftest is very suspicious. Self tests can do this

s/can do this/can do things

> outside of normal operations to trigger various bugs. If they do things
> like this, IMO it is a test bug not implementation bug. Thomas this so

s/Thomas this/Thomas wrote this

Matt

> likely a good idea to check with him.
> 
> > To get there, 2 conditions are:
> > src == null
> > And
> > move_lacks_source == false
> >
> 
> Yes, but my point is I think if src == null move_lacks_source should
> evaluate true as I think the 'ttm' variable here should always but NULL
> too. Not 100% on this. Again I think Thomas is the expert here.
> 
> > > 
> > > - old_mem_type will be XE_PL_SYSTEM.
> > > - ttm should be NULL (I think), thus handle_system_ccs should be false
> > >    and tt_has_data should be false
> > > 
> > > >   	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
> > > >   		(!ttm && ttm_bo->type == ttm_bo_type_device);
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index cfd31ae49cc1..45bba0d731ec 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -774,14 +774,22 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> > > >   	u64 src_L0, dst_L0;
> > > >   	int pass = 0;
> > > >   	int err;
> > > > -	bool src_is_pltt = src->mem_type == XE_PL_TT;
> > > > -	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
> > > > -	bool src_is_vram = mem_type_is_vram(src->mem_type);
> > > > -	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
> > > > -	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
> > > > -		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
> > > > -	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> > > > -	bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
> > > > +	bool src_is_pltt, dst_is_pltt;
> > > > +	bool src_is_vram, dst_is_vram;
> > > > +	bool copy_ccs, copy_system_ccs;
> > > > +	bool use_comp_pat;
> > > > +
> > > > +	if (!src)
> > > > +		return ERR_PTR(-EINVAL);
> > > 
> > > Can you explain if this function is called with src == NULL? That seems
> > > to be problem in the upper layers if that happens.
> > I agree, the src should not be null when this function was called.
> > The previous move_lacks_source change should prevent it being called.
> > 
> > Maybe keep the xe_migrate_copy not changed here and only keep the above part
> > in xe_bo_move?
> 
> Yea I'd drop this however this gets resolved.
> 
> Matt
> 
> > 
> > > 
> > > Matt
> > > 
> > > > +
> > > > +	src_is_pltt = src->mem_type == XE_PL_TT;
> > > > +	dst_is_pltt = dst->mem_type == XE_PL_TT;
> > > > +	src_is_vram = mem_type_is_vram(src->mem_type);
> > > > +	dst_is_vram = mem_type_is_vram(dst->mem_type);
> > > > +	copy_ccs = xe_device_has_flat_ccs(xe) && xe_bo_needs_ccs_pages(src_bo) &&
> > > > +		xe_bo_needs_ccs_pages(dst_bo);
> > > > +	copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> > > > +	use_comp_pat = xe_device_has_flat_ccs(xe) &&
> > > >   		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
> > > >   	/* Copying CCS between two different BOs is not supported yet. */
> > > > -- 
> > > > 2.34.1
> > > > 
