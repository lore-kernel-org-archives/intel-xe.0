Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A71CC79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 17:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E7410E1F9;
	Wed,  9 Sep 2026 17:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ey1vqwrt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC75B10E1F9
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 17:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788976407; x=1820512407;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Li9rx2G9KNm8cB9vC/w1s9ERth6JoM8+ksCsdhDS6PA=;
 b=ey1vqwrtT22XladfWs465PggSQDYgQNT6dhFJoLl9aNKRa8Wqvyt5Y8g
 UfkthUW8Q8wtbQNERSUJtHNytQuEE875Vgica4+q6Zjg8OsW4l0IT+eT9
 m8gu9qz3VCojxxjCjTqpk1tcBdxGbd4PRwSKFE9eC53QYfi00geIbziXZ
 zWI7/DCLh6pzdZEH7uVNGFMGEz1Uu3ZanrLiAslKx7jFW6GL5I9bK4zmA
 dJegsBhLG0wYF3ZkmHVEMeAvdkM1pwZ7QZd1Zz6Nre6welku+KISPDsN8
 zvOa/iH90Zu7nsgcA2n7m0oiaq9sawYt5hXj9lvZxc/zu8P26GbZGzW2h g==;
X-CSE-ConnectionGUID: C1adHaRZRpeBPN1FExeBrA==
X-CSE-MsgGUID: NI8CwKYhTH+BIyAV2NnKYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89283339"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89283339"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 10:53:14 -0700
X-CSE-ConnectionGUID: b/AipOyeSNqq5BOsVG87NQ==
X-CSE-MsgGUID: SjtAs7b1QIW0s0THhMJckw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="309648981"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 10:53:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 10:53:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 10:53:13 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 10:53:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9JJkF8IeH4DoSK2KJ5fIAqrAHp5oROYhc+JRmQcUrjxE5toN9pY01VKm8EeGUNuKoJab71ruPp0rPZ+FHcw85UTAEJkoK+IrN6D/m6t+iIsi7tZmcAmSFnKpeY0jKAeZMt5Za94TzGBEZwDv1xSzXMx/shdUpjoifzVeHujKoxYqo+X3M3nm2Kh/D4MD7LIQF+x18G0ThGbExiiXcIyf+0jGUaRzmHn3MXpzZtfvj4z7oI+hIOc03QCLRBCEUi/Q1TQDA0I26hY+tK5sr8GH2QBRyyOs2dw/dbggoRSzFeunwtbq15a/X58Pe3oaF6mgPprDiOAwo0NH/Zevi9FiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCotY4Xvvig+8J5kRSB6sa7cncmEimXIWOn06hT8/wQ=;
 b=hfgp3RqayE47LOchstXtclhwqeZNPXslfVURIjnrrgBzxbwFY84Iins7hlkQlPZCbiirY/sKqPgSQaez4uSClvTfK7uP5s34bkv7HCgthKDFuW39QBXU6OAywMHVvOBBXDeNMCQMbxPhyOMfmlENK3FpR+GjkZQ/Zht9X++Lqx9jrFJYl6BxbutswUNqgMHkOC2v9NXupJLBjdRwl2doOQKmZN5uPQzQMZOfaee471jd8C6+ynnwI0GOKlpm0yteFcEuDvM/dFeFzNdLKeYUo3hMKD14OLoSf9Nu8WrZE5r/izmImsRTS1/ZupTr6r8D4CM+1NS2/Ks3KKtTptpTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DM4PR11MB6066.namprd11.prod.outlook.com (2603:10b6:8:62::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Wed, 9 Sep
 2026 17:53:08 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%3]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 17:53:08 +0000
Date: Wed, 9 Sep 2026 10:53:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 24/24] drm/xe: Document ULLS for migration jobs
Message-ID: <aqGdAl+RM5X07May@gsse-cloud1.jf.intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-25-matthew.brost@intel.com>
 <ebda3d9ad695bf5fcb69c67d98afcd2098c5acad.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebda3d9ad695bf5fcb69c67d98afcd2098c5acad.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:303:16d::23) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DM4PR11MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee45b57-0bae-40c3-c3d3-08df0e9b3508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|3023799007|10067099003|4143699003|5023799004|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1eYSo9rP43xsXeukIoUrRvVOeZ7Mmj/nQb5+In1FdxloshOBuEiMTaBkyG9jK3CMR+6GCJCa5Yp/zzrP4iRq9abx+tr63fhiJZ9Hs1FuFTcKysQaMblLuB5HytH08sa6K5+jkkeDfPkwBaEdsNkvmW48aos3fkgP6KGkBVx1kzA4UZeummacFLz/+i+fIHbYYjJFxZIldPw5B2yboibrCsci7F4yUXcfbBKLVwQVnLl/LW3OK4Z5l4LsjuLtP0X61CKvQRZpZh/ufYG1zjlfBP/9uzR7UTtJzJcQKfeGb/1pkFYAvws8o2bY2CWjCy+zVpI5x+MfmQn2Wbt0W3sgCcx+QIHdHNoyGaaKr63o9/U/z72aWPlz0faa8Hhs1fcKGEDswI2xve4es2q+dRagIWkLGvJongUGlRiWoCUhDksIB/RQ7VrEh8WokdtO1YOzY0JkhF0p8J1sDrjNVqaXHgGbJan2KZVdkUaAmtertVlX36s3DsEU5lwPqFN5BpqT1EZHoDnTyEQtovfWY2roOjt6AfnIRxDiOiKr6VO/koQuTLFs0c7nj8U3qMOHojz9+xanc9/RPNurcNEXikxTLA71QIWjYmhxLEj5GZ+KvgPca3HLe3XeW7EJx1/PxcFERXNkafZIt+/5aGNKuhQOsYe4xq1tN1aGzSVBV92JDCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(3023799007)(10067099003)(4143699003)(5023799004)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?shipEBQUeDF9meY7pFCDGH9Xhd18cML5AzBtw+pd1zE10x0+3+53vihc9V?=
 =?iso-8859-1?Q?2TudwGhqYmPTQwbbYtMHVvF5xgssN15/s0Fcjw7Bhj9Zqs2gpTUhYhbSlf?=
 =?iso-8859-1?Q?66byaRqknjdL2yImFxeU6SK+srVJBvMhO0cFgG9OnDE4BFeG9tVcfJIgoX?=
 =?iso-8859-1?Q?6NeKkMIsDo3joTuXyjWFPWhQfCe7nfRH2TJBWRYciogd0TKLuxfF7gcUDo?=
 =?iso-8859-1?Q?LIjHZn1uCPjV7HUzSibfVUK5Kxr8ViDOYClyddwkLgf9RaXcj8Zy+6fGCS?=
 =?iso-8859-1?Q?3mBE7ct6R7h8qOA6fbMeKG5sFIsCYDZ7kelblt2LzOGm5F4NN/A83EbrQ6?=
 =?iso-8859-1?Q?BzM/wx3judFpEXg5+P/CKolqw7Qy+gsCbwnM1KFOhBqZIH4w1pvyU06lTI?=
 =?iso-8859-1?Q?Ut972kCN1qtnFcqwWTJSkSsrCZiUVQQJ1uJuFeB2rDkKsFPQFQjAKnEhpR?=
 =?iso-8859-1?Q?W+eevdaUHBr6DMvc6sDoSkhpFXRUPB7Ry7OsqMK+jnciNUWlFth7c6WAoX?=
 =?iso-8859-1?Q?FAwYe1/21r42ytAn01522Ewbzcv2MLE7X4V3MlGA3MreyMYsIuITdgm3jG?=
 =?iso-8859-1?Q?bP6znnI7oQRvFZVj6TVTz7WB7KmPxPvXx+HNo/j/Ap7PMdGoc7+8L3nBGl?=
 =?iso-8859-1?Q?XWt47w603z6/3j9NKC5+pcsy43ifoStkdClCrmbtATgHBhyoUF6Hyfux9v?=
 =?iso-8859-1?Q?qqMdoP+kU0PFA89XvxLtfOFLn0uOuUuWTDfWo+p58LeJ9p+rI7A6XStmei?=
 =?iso-8859-1?Q?aqOCMYGWC/yb4RBQDUyA3r88DKS9gIN6sW3uDWDY2yjziQvgBYxO4kc8/A?=
 =?iso-8859-1?Q?JLo7Mwnrs1ke94YQEyTu7suLRvvKrqAMyNJ2Ri3XHKdDY0VTcB7tuN+Hm8?=
 =?iso-8859-1?Q?Io9/ut0BuB67D9k9dt6Usew+pwvis4B+jpqJWHzwdRWG9tU+T/WrWq2rqO?=
 =?iso-8859-1?Q?GOj8/WxHTu+KaU4lQ6/SlvwEF5maatMmJC8CgB6SSAXm6t3X6dJLVznf3j?=
 =?iso-8859-1?Q?HXZO25axMw+q3PcoJG0S0uVbNMPOs11AfhEdlXSM5XhCVwC+o+SS/U0o6Q?=
 =?iso-8859-1?Q?D/3h2EM+qP8n1clgoAoGYl9LpNgb4yVjmdAMgRzPCJ1MexPE3bXZyokYdb?=
 =?iso-8859-1?Q?OWe3f4RO9/nf+gnB52davjfHRnVtw9BjaqQRHRpA//5+yF2fztNPYui/IZ?=
 =?iso-8859-1?Q?GTl+l7/s9VEZXezHO7h62tyF9G9e1/NyDlguJ33rwS9tOyczy+1FBywDRJ?=
 =?iso-8859-1?Q?PDe5IGrbhKdKxa7i1GvWuKLANGtXe+Dcz9bFuZX8EM44R9ZcqGGLUf3OcW?=
 =?iso-8859-1?Q?DcJosAaIFBqw/7/ElOd80pLTjT/5KTOlrwr24Sndz/ewb63bF3+IpUwmiW?=
 =?iso-8859-1?Q?d+GbRSXfqTbmP6pRqWOE6JbwVZ50E6dlgjz4hjSNlD6QVJJpyVEzEC+03f?=
 =?iso-8859-1?Q?WWWx6OfhAGctke63hWM2sVdaSjQLLsFTFe6+vP3lJvoFyB1s/JoeIZkm5T?=
 =?iso-8859-1?Q?lS7l1fAzRzdlX4dqQuf3sJpXHt0MvAy63KFmkcFsphqovZ7qtHCAP2zXgO?=
 =?iso-8859-1?Q?EUohYsciSEBIqnagUBW3MISeTIY1R9emNm4CkU/q6oBEspZTMb5/NH9AzG?=
 =?iso-8859-1?Q?eu31JzcBs44ZMD4qTgPMXTjdVVP32X/jQVI86tNiLDJAYksAouYznOysIO?=
 =?iso-8859-1?Q?oNuJ2c0fKfb8uOayFsY74UnldzXaJ6T/ar5Uoqz+1DQEkCqv8giLAEckdc?=
 =?iso-8859-1?Q?iIbn+bz0mHSg9QsVzTPZdSQTWC3vbKFJSXszEO69BD7vziGgQKw8a5Kos5?=
 =?iso-8859-1?Q?uRX0KjIKT3GRw+qpNvJqXmKiXG5Yxz4=3D?=
X-Exchange-RoutingPolicyChecked: 1UUxn82GLj98q/Gjv2B6VdyzMc4giLBeQTRxz7F2z+HRQJlH1F0dK5v4A74TcGoU8TD7BYhGLiiXHs4RaM2cVTcJ8g5a5n+Qc9G+3VzSisOyYCHNjZ8qVDuzJW8+p6xlVH8go98ZRpzokIuUfDq9KiNuL7h4p75DsUZ6WPT2GMbouKKsQU8iZdkuTUgeEPgiBqp5wtoqBhygaTqWxWX1wmxYhIJDrhEqekTG66CZEh3bNR93PsFuTorWzI2jf9CrxzrobK9qUSGgu6TGhGrzJSZoVBtYyqqxrWLd9pEVimHUMlWlPYw9hcGdL/h2cowQrdu6qvcdBmmCPhfuqFAMcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee45b57-0bae-40c3-c3d3-08df0e9b3508
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 17:53:08.6337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4mkb124ur2vsk8fgVxXw2IiRfANN+lmH6y7s1Z2h78cKhAcGGJph5lMGDlCJ97iChG7VitKlqvyob7n8Lu7VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6066
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

On Wed, Sep 09, 2026 at 11:01:50AM +0200, Thomas Hellström wrote:
> On Fri, 2026-09-04 at 14:16 -0700, Matthew Brost wrote:
> > Add a kernel-doc DOC section at the top of xe_migrate.c describing
> > the
> > Ultra Low Latency Submission (ULLS) scheme used for migration jobs.
> > 
> > Cover the motivation (removing the H2G / GuC / context switch latency
> > from the page fault and SVM prefetch critical paths), the platform
> > requirements, the LRC PPHWSP semaphore layout and its relationship to
> > the migration queue job count, the fixed ULLS job size and why it is
> > needed, the ring preamble / postamble emitted by the ring ops
> > including
> > the in-ring tail update, the semaphore-only submission fast path in
> > the
> > GuC backend, and the enter / delayed exit flow along with the ULLS
> > job
> > flags.
> > 
> > Hook the new section into Documentation/gpu/xe/xe_migrate.rst.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Assisted-by: Github-Copilot:Claude-opus-5
> > ---
> >  Documentation/gpu/xe/xe_migrate.rst |   3 +
> >  drivers/gpu/drm/xe/xe_migrate.c     | 146
> > ++++++++++++++++++++++++++++
> >  2 files changed, 149 insertions(+)
> > 
> > diff --git a/Documentation/gpu/xe/xe_migrate.rst
> > b/Documentation/gpu/xe/xe_migrate.rst
> > index f92faec0ac94..d297ee53a582 100644
> > --- a/Documentation/gpu/xe/xe_migrate.rst
> > +++ b/Documentation/gpu/xe/xe_migrate.rst
> > @@ -6,3 +6,6 @@ Migrate Layer
> >  
> >  .. kernel-doc:: drivers/gpu/drm/xe/xe_migrate_doc.h
> >     :doc: Migrate Layer
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/xe_migrate.c
> > +   :doc: ULLS (Ultra Low Latency Submission) for migration jobs
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 3bc78f761f23..94ad1e7e8bc4 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -48,6 +48,152 @@
> >  #include "xe_vm.h"
> >  #include "xe_vram.h"
> >  
> > +/**
> > + * DOC: ULLS (Ultra Low Latency Submission) for migration jobs
> > + *
> > + * Migration jobs issued on behalf of GPU page faults and SVM
> > prefetches sit
> > + * directly in the critical path of a stalled GPU workload. The
> > dominant cost
> > + * of such a job is not the copy or clear itself but the submission
> > latency:
> > + * the H2G round trip to GuC, the GuC scheduling decision, and the
> > hardware
> > + * context switch required to place the migration LRC on an engine.
> > + *
> > + * ULLS removes that cost by keeping the migration context resident
> > and
> > + * *running* on the hardware engine across jobs. Instead of the ring
> > going
> > + * empty and the context being switched out between jobs, the tail
> > of every
> > + * ULLS job parks the engine on a semaphore wait for the *next*
> > job's
> > + * semaphore, and then advances the ring tail itself. Submitting the
> > next job
> > + * therefore costs the CPU a single write to signal that semaphore -
> > no H2G,
> > + * no GuC round trip, no context switch, no MMIO.
> 
> This all assumes the migration LRC empties between jobs. How common is
> that to the case where a new job can modify the ring tail before the

All I have so far is data from UMD stream access benchmarks, which show
roughly a 50% increase across the board, GT statistics showing a 20-30
µs latency reduction per copy job across various IGTs, and a prefetch
bandwidth IGT showing approximately a 7 GB/s bandwidth increase on our
highest-end BMG part. All of these results point to excessive
context-switching overhead, as the ring must either go idle or initiate
a context switch.

> previous job finished? Will the HW autotail feature affect the
> usefulness of the ULLS migration jobs?
> 

The auto-tail feature appears to be based on the same concept: allowing
contexts to spin on LRC tail updates until they are context-switched
out. The documentation is fairly sparse, though. I found bspec67276 and
HSD 220160875, which seem to indicate that this is supported on BMG. Do
you know if there is better documentation available?

I also haven't been able to find any KMD patches that enable this, which
seems a bit odd. If we can get auto-tail to provide roughly the same
benefits without impacting other clients, it may be worth investigating.
In my opinion, though, that should be done as a follow-up and added to
the backlog.

The ULLS patches are thoroughly tested, relatively small in terms of
both lines of code and complexity, and can be reverted if an alternative
solution proves to be equally effective.

> Also worth adding is a discussion around semaphore context switch-out
> when stalled, like whether we're inhibiting that explicitly, whether
> the engine is assumed to be single-context etc.

Let me add that. I don't disable context switch-out, and having a single
queue on the engine is not explicitly required. However, for practical
purposes, the idea falls apart with more than one queue, since you don't
want to delay another queue from being switched in while a semaphore is
spinning for the duration of the timeslice period (1 ms by default).

My idea was that if we need more than one queue on the paging engine,
the other queues would detect that ULLS is running and issue an
early-exit ULLS job before their submission. Likewise, we would elide
ULLS entry whenever other queues are non-idle.

Matt

> 
> 
> > + *
> > + * Requirements
> > + * ------------
> > + *
> > + * ULLS is only used on DGFX with USM support (where a hardware
> > engine is
> > + * reserved exclusively for migration jobs). Because the engine is
> > spinning
> > + * on a semaphore while ULLS is active, it can not be shared with
> > user
> > + * submissions. It can also be disabled at load time with the
> > + * ``xe.ulls_enable`` module parameter.
> 
> Update if decide to use per-device sysfs entry.
> 
> Otherwise LGTM.
> 
> /Thomas
> 
> 
> 
> 
> > + *
> > + * Fixed size jobs
> > + * ---------------
> > + *
> > + * A job updates the ring tail to cover its successor, but it is
> > emitted long
> > + * before that successor exists, so it can not know how much ring
> > the
> > + * successor will occupy. Every ULLS job is therefore padded out to
> > exactly
> > + * ULLS_JOB_SIZE_BYTES, which lets the next tail be computed
> > arithmetically
> > + * from where the current job started.
> > + *
> > + * This is why the shorter jobs still have to reach the same size:
> > the "last"
> > + * job skips the batch buffers and the postamble, and pads the
> > difference with
> > + * MI_NOOP. The "first" job is not covered by any predecessor's tail
> > update
> > + * and so is unconstrained, but is padded anyway to keep the
> > arithmetic
> > + * uniform.
> > + *
> > + * Leaving ULLS mode always goes through a "last" job, which emits
> > no tail
> > + * update, so an ordinary variable length migration job never
> > follows a
> > + * prediction.
> > + *
> > + * Semaphores
> > + * ----------
> > + *
> > + * The semaphores live in the driver-defined portion of the
> > migration LRC's
> > + * PPHWSP (see LRC_ULLS_PPHWSP_OFFSET, mutually exclusive with the
> > parallel
> > + * submission area). There are LRC_MIGRATION_ULLS_SEMAPHORE_COUNT of
> > them and
> > + * a job's semaphore is selected by ``seqno % COUNT``, so the
> > semaphore ring
> > + * wraps with the job seqnos. To guarantee a job can never overwrite
> > the
> > + * semaphore of a job still in flight, the GuC backend caps the
> > migration
> > + * queue's scheduler job count at LRC_MIGRATION_ULLS_SEMAPHORE_COUNT
> > - 1.
> > + *
> > + * Ring layout of a ULLS job
> > + * -------------------------
> > + *
> > + * Emitted by emit_migration_job_gen12() in xe_ring_ops.c::
> > + *
> > + *	preamble:	clear semaphore[seqno]	(reuse for a later
> > wrap)
> > + *	<copy timestamp, start seqno store>
> > + *	<batch buffer start(s)>			(skipped on
> > first/last job)
> > + *	<seqno write + user interrupt>
> > + *	postamble:	SDI saved ring tail = end of next job
> > + *			LRI RING_TAIL = end of next job
> > + *			wait on semaphore[seqno + 1]
> > + *						(skipped on the last
> > job)
> > + *	pad:		MI_NOOP up to ULLS_JOB_SIZE_DW
> > + *
> > + * The preamble clears the current job's semaphore so it can be
> > reused once
> > + * the seqno space wraps. The postamble is what keeps the engine
> > busy: it
> > + * advances the ring tail over the next job and then blocks on that
> > job's
> > + * semaphore, which is only signaled when the job is actually
> > submitted. It
> > + * advances the saved tail as well as the tail register, keeping the
> > two in
> > + * step without any help from the CPU, so a context save and restore
> > can not
> > + * rewind the tail behind work which has already been published.
> > + *
> > + * The tail register write must be non-posted, i.e. it must not
> > carry
> > + * MI_LRI_FORCE_POSTED. Posted, the new tail is free to land after
> > the command
> > + * streamer has already drained the rest of the job, at which point
> > the command
> > + * streamer sees head == the old tail and parks as though the ring
> > were empty.
> > + * A parked context can be switched off the hardware, and the fast
> > path below
> > + * has no H2G with which to ask GuC to bring it back.
> > + *
> > + * The tail is published ahead of the semaphore wait rather than
> > after it so
> > + * that the non-posted write drains while the engine is parked
> > anyway, keeping
> > + * a register round trip off the path between the semaphore being
> > signaled and
> > + * the next job running.
> > + *
> > + * Submission fast path
> > + * --------------------
> > + *
> > + * In submit_exec_queue() (xe_guc_submit.c), a ULLS job that is not
> > the first
> > + * one reduces to::
> > + *
> > + *	xe_lrc_set_ulls_semaphore(lrc, seqno);		release
> > previous job
> > + *
> > + * The XE_GUC_ACTION_SCHED_CONTEXT H2G is suppressed, and so is the
> > write of
> > + * the saved ring tail: the previous job's postamble has already
> > published
> > + * this job's tail both in the tail register and in the context
> > image, so the
> > + * semaphore signal is all that is left. The previous job's
> > semaphore wait is
> > + * satisfied and the engine walks straight into this job.
> > + *
> > + * This does assume the context stays resident for as long as ULLS
> > mode is
> > + * active. Nothing else is scheduled on the reserved engine, so the
> > only ways
> > + * off the hardware are the "last" job below, or a reset - and a
> > migration job
> > + * failing already wedges the device.
> > + *
> > + * Enter / exit
> > + * ------------
> > + *
> > + * xe_migrate_ulls_enter() is called from the page fault handler and
> > from the
> > + * SVM prefetch path, i.e. exactly where low latency migration
> > matters. It
> > + * takes a PM runtime reference (the device must not suspend while
> > the engine
> > + * spins), then submits a "first" ULLS job. That first job carries
> > no batch
> > + * buffer; it exists only to get the context onto the hardware
> > through the
> > + * normal GuC path and to leave the engine waiting on the next
> > semaphore,
> > + * pipelining the GuC/HW context switch out of the critical path.
> > + *
> > + * No forcewake reference is required. Nothing in the fast path
> > touches MMIO,
> > + * and the engine keeps itself awake for as long as it is executing
> > the ring.
> > + * Not needing host MMIO access is also what lets ULLS run on SRIOV
> > VFs.
> > + *
> > + * Keeping an engine spinning costs power, so ULLS is not left
> > enabled
> > + * indefinitely. Every enter and every ULLS job submission re-arms
> > + * @xe_migrate.ulls.exit_work with a ULLS_EXIT_JIFFIES delay. When
> > it fires
> > + * with the queue idle, it submits a "last" ULLS job - again with no
> > batch
> > + * buffer and, crucially, with no postamble semaphore wait or tail
> > update -
> > + * which lets the ring drain so the context can be switched off the
> > hardware.
> > + * The PM reference is then dropped. If the queue was not idle, the
> > worker
> > + * simply re-arms itself.
> > + *
> > + * Job state
> > + * ---------
> > + *
> > + * The state above is communicated to the ring ops and GuC backend
> > via
> > + * @xe_sched_job.ulls, set under @xe_migrate.job_mutex:
> > + *
> > + * - %ULLS_NONE: job submitted outside of ULLS mode
> > + * - %ULLS_ENTER: job that enters ULLS mode
> > + * - %ULLS_ACTIVE: job submitted while in ULLS mode
> > + * - %ULLS_EXIT: job that exits ULLS mode
> > + */
> > +
> >  /**
> >   * struct xe_migrate - migrate context.
> >   */
