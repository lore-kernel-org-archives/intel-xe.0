Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2F7C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 21:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6575810E9CE;
	Mon, 15 Apr 2024 21:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7napllW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D878210E9CE
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 21:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713216008; x=1744752008;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YQWHANqf2Ed7pV5dWrs4E1djRrTMEsKheC0v9AqiWzw=;
 b=S7napllWGBHHJeDxwmu6bBdTswEeUWJTKbrDp/u8reWZ+m9cJfuPZkEM
 5twEH5MnLugzgUp+VGwXZWT133zVykp1w0dLTHF10Nxxjyz+JtGqd7zfj
 EFpPRSSw16nP004dXr0PqEYlPPzsQFh6uTwnLG1Kbb37QK69t3FP7v+rP
 Arqz86aMZDK3oXntsbvV4dQ4uqfw/yAXp1UCGQLqXK2rqylEogUEc+IiN
 FR1z5JH86k9T0oRHb6N6yBa1ADx4uBbuvHWBAhmu+8MbteEBxLHoetkft
 a+tJVP6k0HzJTBfghpUc34AtX5uxT1eDxobqq0vSMafmx0OQ4GQ+prfFA Q==;
X-CSE-ConnectionGUID: IW30+DuERfWsYsAiJE2AHw==
X-CSE-MsgGUID: +N0msWb/SqCUxd5da0djFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="26139404"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26139404"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 14:20:05 -0700
X-CSE-ConnectionGUID: jqtB64rNShWBreYGXeGFkw==
X-CSE-MsgGUID: suaQKLVsS46YcZZ6rbQ+/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22622998"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 14:20:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 14:20:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 14:20:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 14:20:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 14:20:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp2gCcvPjRNgVnNhdh8C6aBcQeC2l33XLrPZ4EUkFdNmg1/ubtWLqGCwdy1gWC2VGTbHeSdYT/LbF0ffa6citLaDTZjpRTOyLJGSSpcG0aSIe7v+aHC8OT+VoAHY2ciWRSqLBJOf9C7o9FzSIb7wBbfXw5gZ9RHfI9A/BUcVX5hxZQ/f70gS1AKmyF+46QqpRVnDeMDdxnHWuSlKTtLs2EMJ/J1CHhx+Rd4qxI1FbUtvSLGScDX2txSzX+isc+8gWUFM2oHmt16gHvdBx3GdbVXw61jaKzTOCgZpzzwYy2HleIQt3lGXgDnRHKtfZIxQF7vPyGymdyUwg7b8a1UFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxImyVN37ks+o76ez0tf8GD8lnErSs5GpQxGQ8xgSrg=;
 b=JKkXfypiRQJSNv9tdAeDmkishqPdq07g8KICU4eFc4nbqkZw/9zShNFhZ6Wwqu8ryFbkF5ukqoO4E6TbNNVirYqXPNn+QHtoNJDkbC4DDhznsyhxSvKNc3V+9JuaQCsoNjKKSjXjqXHCvRUiL2GCLREOZNL4UXfEvZNbRLMKrDQFqkKsgtv9Xh2WRVTO5I9guZ7YuTDUBAvboCeWO8VXrsKpmoB8oy9Vyt0jqffL+W2UTHMFiDBZvRk2pJ8LYA4er7jwhAdVYuVTLHE0V7xwLtmFKImu7FXf+zxYICoN/K1PmS/3SJ8oJiGZz1pS7kwRAHyyqNwUVPhWhhtPupL0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.30; Mon, 15 Apr
 2024 21:20:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 21:20:01 +0000
Date: Mon, 15 Apr 2024 21:19:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate and free
 device memory
Message-ID: <Zh2Z/+CtwkX3ofkV@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-23-oak.zeng@intel.com>
 <ZhcRdy+QnvrA+sye@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991E536947CCFDBEDD9722D92092@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB6991E536947CCFDBEDD9722D92092@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR08CA0061.namprd08.prod.outlook.com
 (2603:10b6:a03:117::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 868e9604-47b0-479b-2b49-08dc5d91cf86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XeFL76B3hFGcwFcwjrOywsCCn78gJaP7YS/2JJtWvJaAxwOF0V6a8F3c2cUrPotPccmWiaQ5mL7Icof9+bx7o07QJFD5K6AiucvMSrexaK6nCqf3PpxErTrDrrpHEZBQv6hsKWzyTdrLo5Y5hk9eKqE4j/J2D5FlA2K7aUAVzumZzaBLTls0agloIq/TWJn232bTS+0knZoYPT32TcjePQ69TGIHHtRqggpp5e59C1oZGboMBmPHfW7DmuGCWlReldflgwR5h8IGhzcTNKp039nSG9hlg7O6W6cuzSNJHEFpuZMMjlP0cSU0LWOgFMTJXiPc/PRYQI6uNT3UHbSPButtEZ488ZPuzUf7x1WCmmdq1xbyOaHe4gH9pNSH42kt95pOwzUGevHJ+SX3Y8OfHzpUeoo+WlgjqloZjPUx10c7woPNzxdQ6TwQX4sAHdmjlLs3AZ+hJIZiFNksDT86zunTmSQqNVZ9q6wz6EuQs1ihct1hTWkH9smw8KNXnleQ6FveG8NZnvfESfqSwK5y5/8/OrwIn2rViRfWXCamhCre74al44bvuYW0n/CKcj7fTOmBXnrPusokPQIxavB/X9hLj4rIsVlnFUbRPGNiE76rwmZ+zHQMh4BMmFkftyywQKtbBs4qfx9w0X4NBbHn14jhArsLyt0OgSP2/KCDG3w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cWrBeIK1UNoURJ+/3NyktX6UsO6/Ojax4lha6ba91O98m0z/duCnIsb4Iu?=
 =?iso-8859-1?Q?RInAqJk6fsJ8jpUKFbGfZlk8ccMC2YqAZNq7mGSFaqo6aGK/075A7Oa/sd?=
 =?iso-8859-1?Q?Q0UvmejN7j+b/f9zsnY62zWc09uiu/YH6+QFELyAeX4OD29z6EWFej2eD7?=
 =?iso-8859-1?Q?++akiR0RuTc1RTRcMiaSdeg9oEcsXw8593tzUu8V783qR73S2+tm/OpWNu?=
 =?iso-8859-1?Q?MlUj6pDHYi/mX8pQtk8esCT3tqJKwU/H480PAlWToj+4Qd0FejrtnHNKp7?=
 =?iso-8859-1?Q?SSYviZs6LpSM7zI8pDiYelmNDJOPCjxz7ySuZ6WRu0Q7oJrdhErxpQOHuW?=
 =?iso-8859-1?Q?Hnyz82zs0pKOAiwvalWAvUeirBzU42furIz11pSKqXYL0U8CmVCWkCIpLE?=
 =?iso-8859-1?Q?2fA/wppOIwArVOuq1KThAj10TagrMn/RBfxYWP8NfZb5VjbEjRw2yyVwnL?=
 =?iso-8859-1?Q?ClyPZqqN0ztqA6e2J9rp79hnPhuQnDbKUcxGsNhhdtU9Fph78aU5uAxvou?=
 =?iso-8859-1?Q?0l2z/1ULD9J6/DhyePDdJZ/D2kioCkEgrnYWtiRnu9rwF8UCN95OA5n89i?=
 =?iso-8859-1?Q?vYV3il6KfDg12Ur+Klpzan78pO2FPddh2KoSffu9W6fmyDw5dqRSeB/74s?=
 =?iso-8859-1?Q?WNdPYKZ42xLzYutd4aDKrwKAGRiu5dZGZC2FqjOewBxYgeRSOBE/0RcyL9?=
 =?iso-8859-1?Q?8sDYjROC6Yp08cBm0XaxfUd6C2gtO1LmRg1TgauWdKRe6v2Y3fJ+EwoIGJ?=
 =?iso-8859-1?Q?2QR7iJKLAKLEZErVL5s7kMwtbfINFYQ1G14W9NdY+/CZ2Xq2dd/7xGY9Vc?=
 =?iso-8859-1?Q?AQ/h2XQBru2qc6xQPQ99hZbqK4h7ATS5QlK1gC2AkdqR+6oUUfUGNJCmjm?=
 =?iso-8859-1?Q?E5xuqdHgK0K0fweHeTKRo5pcok5r3oSBima5TdYOk898dKZFxXTCXfKxdj?=
 =?iso-8859-1?Q?TgWoeqLiIdwwSDQQnEBzSPQydzG0+AAI9PffFQqTVYOSIcGArycmZ5kFe+?=
 =?iso-8859-1?Q?p+GOAej2zqh9OuX/1SJrZuZO+X1bwNRQ36j0jGghgnIAWdq/Wt8NLp9D4g?=
 =?iso-8859-1?Q?IMjaKwDXG5jW8+9nGv0izb9rs9Acv49o6vdZJdXEwFoe5qFdRHFcWD0Umb?=
 =?iso-8859-1?Q?g4a7+I7RSdGJjpxwjrsoqFT3bZaY1qeKbA0Em51TAT+0oDc6k/PEaIEXr8?=
 =?iso-8859-1?Q?wQQ9Jqnn4ctFhM+/ehG+ZNQYf9XnxcALIxqk/gJBrwdaD8EpH2pbQ2i/Ct?=
 =?iso-8859-1?Q?k+UxGp65Mpo/R8MHvoBh2MjXKwQ2lz69xhL2miffAT66N+pZB4+trwg2ut?=
 =?iso-8859-1?Q?+SPzUaj76ZZ9g3wD8e4O/kfvWzpYe5i8VTSVx0ojUcrAsC+TNv0uurTyZb?=
 =?iso-8859-1?Q?uNXEOFamBQhA8sFCVHFQKvbGPgstGWXi8oyUx7AwgdPY2dN4NTp8kyBadr?=
 =?iso-8859-1?Q?R/y2/YQyUTqT8stsEybH+JZYrmAMvulI79OnF7JoFKUTdL15gChI7nNjH4?=
 =?iso-8859-1?Q?30FP0Pv9vnIdiA2Qb5sLiv+r7J8vV6TuSdSyV5Ox6ppa6Be0NxK5uaU3Ij?=
 =?iso-8859-1?Q?+Gv2MhQencMLi/i1qcqvaYh6j6WBd54DMUiHUqMra7V1z9yULLxNrh1T5Q?=
 =?iso-8859-1?Q?FbJHR0SU6UEMYhtvAwayVmt2jDETHPhsP/nX5eFXIlXWdH4LOU2Bo8XA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 868e9604-47b0-479b-2b49-08dc5d91cf86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 21:20:01.4384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7u15jb+IzFRuHzb26Z/rUcvG8U7cTBzSe1a1QYU9j2NmZwVh2q/80Q976EdRGLGKwunJcYxHAfcRtBpXtCJRAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
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

On Mon, Apr 15, 2024 at 02:13:55PM -0600, Zeng, Oak wrote:
> Hi Matt,
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, April 10, 2024 6:24 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> > Brian <brian.welty@intel.com>
> > Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate and free
> > device memory
> > 
> > On Tue, Apr 09, 2024 at 04:17:33PM -0400, Oak Zeng wrote:
> > > Function xe_devm_alloc_pages allocate pages from drm buddy and perform
> > > house keeping work for all the pages allocated, such as get a page
> > > refcount, keep a bitmap of all pages to denote whether a page is in
> > > use, put pages to a drm lru list for eviction purpose.
> > >
> > > Function xe_devm_free_blocks return list of memory blocks to drm buddy
> > > allocator.
> > >
> > > Function xe_devm_free_page is a call back function from hmm layer. It
> > > is called whenever a page's refcount reaches to 1. This function clears
> > > the bit of this page in the bitmap. If all the bits in the bitmap is
> > > cleared, it means all the pages have been freed, we return all the pages
> > > in this memory block back to drm buddy.
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > Co-developed-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > > Signed-off-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> > > Cc: Brian Welty <brian.welty@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_svm.h        |   7 ++
> > >  drivers/gpu/drm/xe/xe_svm_devmem.c | 147
> > ++++++++++++++++++++++++++++-
> > 
> > See comments about file in previous patches, they apply here too.
> > 
> > >  2 files changed, 152 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > index 624c1581f8ba..92a3ee90d5a7 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -46,4 +46,11 @@ static inline struct xe_mem_region
> > *xe_page_to_mem_region(struct page *page)
> > >  	return container_of(page->pgmap, struct xe_mem_region, pagemap);
> > >  }
> > >
> > > +int xe_devm_alloc_pages(struct xe_tile *tile,
> > > +						unsigned long npages,
> > > +						struct list_head *blocks,
> > > +						unsigned long *pfn);
> > > +
> > > +void xe_devm_free_blocks(struct list_head *blocks);
> > > +void xe_devm_page_free(struct page *page);
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > index 31af56e8285a..5ba0cd9a70b0 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > @@ -5,18 +5,161 @@
> > >
> > >  #include <linux/mm_types.h>
> > >  #include <linux/sched/mm.h>
> > > -
> > > +#include <linux/gfp.h>
> > > +#include <linux/migrate.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/dma-fence.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/bitmap.h>
> > > +#include <drm/drm_buddy.h>
> > >  #include "xe_device_types.h"
> > >  #include "xe_svm.h"
> > > +#include "xe_migrate.h"
> > > +#include "xe_ttm_vram_mgr_types.h"
> > > +#include "xe_assert.h"
> > >
> > > +/**
> > > + * struct xe_svm_block_meta - svm uses this data structure to manage each
> > > + * block allocated from drm buddy. This will be set to the
> > drm_buddy_block's
> > > + * private field.
> > > + *
> > > + * @lru: used to link this block to drm's lru lists. This will be replace
> > > + * with struct drm_lru_entity later.
> > > + * @tile: tile from which we allocated this block
> > > + * @bitmap: A bitmap of each page in this block. 1 means this page is used,
> > > + * 0 means this page is idle. When all bits of this block are 0, it is time
> > > + * to return this block to drm buddy subsystem.
> > > + */
> > > +struct xe_svm_block_meta {
> > > +	struct list_head lru;
> > > +	struct xe_tile *tile;
> > > +	unsigned long bitmap[];
> > > +};
> > 
> > This looks not needed to me but admittedly haven't looked at the LRU stuff.
> > 
> > I am thinking roughly...
> > 
> > - I think we drop all this special tracking (kill xe_svm_block_meta)
> > - Have functions to allocate / free the buddy blocks, store buddy blocks in
> > userptr
> > - Blocks are allocated before migration to VRAM
> > - Blocks can be freed on either CPU fault after migration or on VMA
> >   destroy (probably depends on madvive hints for VMA where we free
> >   blocks)
> > - Blocks allocated / freed at ia chunk (xe_vma in this code) granularity
> >   (conceptually the same if we switch to 1 to N ratio between xe_vma &
> >   pt_state)
> > - block->private == memory region so we can get pfn from block
> > - When we need migrate_pfns we loop over buddy blocks populating
> > migrate.dst
> 
> I thought into your scheme. The free of device memory is not completely controlled by driver. Core mm can call back to driver to free a device memory page. The xe_devm_page_free in this series is a callback function registered to core mm. this is why in above data structure I have to have a bitmap. This bitmap is used to mark which page is freed, when all pages in a buddy block are freed, it is time to free the whole buddy block.
>

Certainly in this scenario we'd also get a mmu notifier with
MMU_NOTIFY_UNMAP when pages are being free'd too, right? The notifier
puts the VMA in the garbage collector and the blocks are free'd when VMA
is destroyed.

The garbage collector only supports complete unmaps at the moment but if
we need to support partial unmaps (likely do as a users can munmap
partial buffers) we can with garbage collector transfering ownership of
blocks from one VMA to another as needed.

It is possible I don't fully understand the ref couting scheme for pages
either and we will need to implement the dev_pagemap_ops.free_pagses
(seems likely now that I am typing) rather than the notifier scheme
described above...

If we need to do this, then roughly...

- page->zone_device_data is still the Xe chunk (xe_vma currently)
- Ref count device pages in Xe chunk (or perhaps individual block?,
  need to think about this more but certainly bitmap is overkill)
- free_pages decrements ref count
- When ref count goes to zero, free blocks

Again this seems to align with Nouveu and AMD (haven't check Nvidia's
open source driver) and aligns with the design in Xe of everything being
a chunk grainularity (e.g. no partial migrations within a chunk).

I guess we will a need to a test to do partial unmaps to figure out all
of these details... 

> In your scheme, we allocate/free at xe_vma granularity. So I imagine you would have a list of buddy blocks in usrptr, and free all blocks in the list when every pages in all blocks are freed. While my scheme free memory at the buddy block granularity - I think it natural because the buddy free interface is also block based.
> 
> You would eventually need to introduce a lru link to link each buddy block to a lru list when vram eviction come into picture.
> 
> So I just explained why above xe_svm_block_meta was introduced, such as why the bitmap and lru field is necessary to me. if you drop this data structure, they will have to show up in another way.
>

LRU will likely be at chunk grainularity too (i.e. xe_vma not at block
level).

Also in most cases xe_vma == 1 block if the buddy allocator is doing its
job so no reason to optimize for block level here.
 
> > 
> > Also I noticed the drm_buddy_* calls in this file are not protected by a
> > lock, we will need that. Currently it is tile->mem.vram_mgr->lock in the
> > VRAM mgr code, we either need to reach into there or move this lock to
> > common place so the VRAM manager and block allocations for SVM don't
> > race with each other.
> > 
> 
> Yes, the lock has to be added. Thanks for pointing this out. Maybe move the tile->mem.vram_mgr->lock to the xe_tile level so it can be shared b/t BO-driver and system allocator?
>

Yea, tile->mem.vram_lock might be a better location.

Matt
 
> Oak
> 
> > Matt
> > 
> > >
> > >  static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > >  {
> > >  	return 0;
> > >  }
> > >
> > > -static void xe_devm_page_free(struct page *page)
> > > +static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
> > > +{
> > > +	/** DRM buddy's block offset is 0-based*/
> > > +	offset += mr->hpa_base;
> > > +
> > > +	return PHYS_PFN(offset);
> > > +}
> > > +
> > > +/** FIXME: we locked page by calling zone_device_page_init
> > > + *  in xe_devm_alloc_pages. Should we unlock pages here?
> > > + */
> > > +static void free_block(struct drm_buddy_block *block)
> > > +{
> > > +	struct xe_svm_block_meta *meta =
> > > +		(struct xe_svm_block_meta *)block->private;
> > > +	struct xe_tile *tile  = meta->tile;
> > > +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> > > +
> > > +	kfree(block->private);
> > > +	drm_buddy_free_block(mm, block);
> > > +}
> > > +
> > > +void xe_devm_page_free(struct page *page)
> > > +{
> > > +	struct drm_buddy_block *block =
> > > +					(struct drm_buddy_block *)page-
> > >zone_device_data;
> > > +	struct xe_svm_block_meta *meta =
> > > +					(struct xe_svm_block_meta *)block-
> > >private;
> > > +	struct xe_tile *tile  = meta->tile;
> > > +	struct xe_mem_region *mr = &tile->mem.vram;
> > > +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> > > +	u64 size = drm_buddy_block_size(mm, block);
> > > +	u64 pages_per_block = size >> PAGE_SHIFT;
> > > +	u64 block_pfn_first =
> > > +					block_offset_to_pfn(mr,
> > drm_buddy_block_offset(block));
> > > +	u64 page_pfn = page_to_pfn(page);
> > > +	u64 i = page_pfn - block_pfn_first;
> > > +
> > > +	xe_assert(tile->xe, i < pages_per_block);
> > > +	clear_bit(i, meta->bitmap);
> > > +	if (bitmap_empty(meta->bitmap, pages_per_block))
> > > +		free_block(block);
> > > +}
> > > +
> > > +/**
> > > + * xe_devm_alloc_pages() - allocate device pages from buddy allocator
> > > + *
> > > + * @xe_tile: which tile to allocate device memory from
> > > + * @npages: how many pages to allocate
> > > + * @blocks: used to return the allocated blocks
> > > + * @pfn: used to return the pfn of all allocated pages. Must be big enough
> > > + * to hold at @npages entries.
> > > + *
> > > + * This function allocate blocks of memory from drm buddy allocator, and
> > > + * performs initialization work: set struct page::zone_device_data to point
> > > + * to the memory block; set/initialize drm_buddy_block::private field;
> > > + * lock_page for each page allocated; add memory block to lru managers lru
> > > + * list - this is TBD.
> > > + *
> > > + * return: 0 on success
> > > + * error code otherwise
> > > + */
> > > +int xe_devm_alloc_pages(struct xe_tile *tile,
> > > +						unsigned long npages,
> > > +						struct list_head *blocks,
> > > +						unsigned long *pfn)
> > > +{
> > > +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> > > +	struct drm_buddy_block *block, *tmp;
> > > +	u64 size = npages << PAGE_SHIFT;
> > > +	int ret = 0, i, j = 0;
> > > +
> > > +	ret = drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
> > > +						blocks,
> > DRM_BUDDY_TOPDOWN_ALLOCATION);
> > > +
> > > +	if (unlikely(ret))
> > > +		return ret;
> > > +
> > > +	list_for_each_entry_safe(block, tmp, blocks, link) {
> > > +		struct xe_mem_region *mr = &tile->mem.vram;
> > > +		u64 block_pfn_first, pages_per_block;
> > > +		struct xe_svm_block_meta *meta;
> > > +		u32 meta_size;
> > > +
> > > +		size = drm_buddy_block_size(mm, block);
> > > +		pages_per_block = size >> PAGE_SHIFT;
> > > +		meta_size = BITS_TO_BYTES(pages_per_block) +
> > > +					sizeof(struct xe_svm_block_meta);
> > > +		meta = kzalloc(meta_size, GFP_KERNEL);
> > > +		bitmap_fill(meta->bitmap, pages_per_block);
> > > +		meta->tile = tile;
> > > +		block->private = meta;
> > > +		block_pfn_first =
> > > +					block_offset_to_pfn(mr,
> > drm_buddy_block_offset(block));
> > > +		for(i = 0; i < pages_per_block; i++) {
> > > +			struct page *page;
> > > +
> > > +			pfn[j++] = block_pfn_first + i;
> > > +			page = pfn_to_page(block_pfn_first + i);
> > > +			/**Lock page per hmm requirement, see hmm.rst.*/
> > > +			zone_device_page_init(page);
> > > +			page->zone_device_data = block;
> > > +		}
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +/**
> > > + * xe_devm_free_blocks() - free all memory blocks
> > > + *
> > > + * @blocks: memory blocks list head
> > > + */
> > > +void xe_devm_free_blocks(struct list_head *blocks)
> > >  {
> > > +	struct drm_buddy_block *block, *tmp;
> > > +
> > > +	list_for_each_entry_safe(block, tmp, blocks, link)
> > > +		free_block(block);
> > >  }
> > >
> > >  static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
> > > --
> > > 2.26.3
> > >
