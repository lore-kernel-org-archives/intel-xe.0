Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BB5C5472D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 17:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3658A10E27A;
	Mon, 26 Aug 2024 17:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvctdLX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387AE10E27A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 17:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724692982; x=1756228982;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=atN5TT4b9ARgpxXYdNVyX9z9g/W7v03X1QKLH4WQva4=;
 b=NvctdLX29WkW/5PNTp4jMYJn4OPq5xll5kbnG1SeZYys++HU6/emxEU9
 DfXwfQGoOdKIt7z285fBfbmmcQje6xeZ5wtdKGcFbOmzElULDIDB4jPY0
 IWhOHk0vxvnOs8HOvotcVbZIu2IxwywmaLk3qcPLfB8sA7GBt9B00Wdga
 j7VxmSXIjIiqA+5Jnt45boZVLa1OgYXS9KzAzcoGi0P2sQZpugvev3FL3
 0jvHDWQ3I1r0ZGYmJGSt+k5zIC1QAJAWVSuJ7jx47JllxyXq2Xvb7T1l8
 eiuVdyjrNG3ogiLukcVQ8FyHr7GVjhNbNhIaY20cjJn1YyZpFWOGsWMyC w==;
X-CSE-ConnectionGUID: /fPpt+WBRjqbedDM4JBh7A==
X-CSE-MsgGUID: xyYpo0ctT1im3MGn0jnT7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13217270"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="13217270"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 10:23:01 -0700
X-CSE-ConnectionGUID: GyveQUJGSUqm8F0kndN4wA==
X-CSE-MsgGUID: g1lG5EKiS2yDxCI0VaadYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="62407670"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 10:23:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 10:23:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 10:23:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 10:23:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 10:23:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUN7yV32Q0nrDCwnSXKtTfUrvtitwDGqRfq6opewBveRvQSq5F25NNGb8y2zOqELOwEl694NYeCHW9RxhEtAgaH2lOcdpLIvP9AduRKEs8XElu6zpZqN38yZhxm8PGuH1mgMlWVOf3GkhBtsXlTnWXxkd3KEonhuQ+q+bGq5DE2CZiBa5b8OYgvSS9PfYAroaCi7HRJteGy4/zczh9zqWcTzxWNywUX1Cg5sruGmGzA4TBeZ6EJZqtMLE2fUmSag3m80C6Z4bdjrMaza6ngfMT0JKPjfHhoFNydbqrS99SzuBuv05ekomGEgaaZkz6XpwBXkrVp0k5b4Ji+hrFNBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUBkzIOe5exTwmocZvCF3YVmIiuHPxjCSdstvEfbfDM=;
 b=pg7rqOp+Zc0qAq+NxkfQ/bdfJ332p/zc8Xpclm2OLfAlj3g1viNw1ojnjVvMK1L4N5e6BLXTv7x8wQiW+fAa5OM+biDOd7ker3AVPvknB3u1T3gj2EXjbWz8OjLldVdCOheeFIix2Dyi4HtFsN8hPiLE1jwEnvfQXiOKLt3VpGUSbFztBiNntXWtOM/8TUr09eQn4lNy4JL+cRq0ptOUHfO9JADthiAihnwrkfJfwZ+ne7Lmp7KJfXX20Zh+V0VuwYj6ig49+907WuBivbV4Y5/J0jNwL/BHbbz6DBcq5WTEdY2Eb0VxnJ1w8wlU5P93oGguR3b5S2QEKRDaFI1U9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 17:22:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Mon, 26 Aug 2024
 17:22:58 +0000
Date: Mon, 26 Aug 2024 17:21:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [RFC PATCH] drm/xe/lnl: Implement clear-on-free for pooled BOs
Message-ID: <Zsy5p5w8nqMmIwwU@DUT025-TGLU.fm.intel.com>
References: <20240822124244.10554-1-nirmoy.das@intel.com>
 <7645111403a453311b16ff2b11d49cb63a74518f.camel@linux.intel.com>
 <a20245c6-7628-470d-bd6e-4e719dbd198f@linux.intel.com>
 <e76049b03dca87599346ec1db3ac6bfec97efee3.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e76049b03dca87599346ec1db3ac6bfec97efee3.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 798a4fbb-e935-4f2e-27ff-08dcc5f3bab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oyAEVPS04OOxHXyPz45usTbKdZA+becMEpTqlyWfWXcbfGPVJjly8rDhne?=
 =?iso-8859-1?Q?9NQEldmrTrncv/rUiVZkSyW9K9MuDdFDMDZrEKRLIaGtQMK0nkfdWtUEFs?=
 =?iso-8859-1?Q?QbzhS0F+tcGcOYB+fvwKa+Urx68Aj2RwK8SP1YvS+iKE0zB/b1V7LTqu5a?=
 =?iso-8859-1?Q?NLtci0kUFFjeikcMPra5fqr1L17bMKm/WwOwtppgYGlEmRDo6+3tqswhmo?=
 =?iso-8859-1?Q?83gl01RdfIFcwHMupiTWYlGIq1o0DuK/odjqJWaRBHI+A+fuVFuJ2NC5EB?=
 =?iso-8859-1?Q?nQuVxkHSkZEGx76rGdf/ixaT5iCLUgk49DFlmeMcMMdXGU9fJy1B65QoJP?=
 =?iso-8859-1?Q?+Q8f0IXlEAxGqSMKjpTc+be+InUtZ6FBCcjVpO/iM7Rkgt+LZb2KE3+f1J?=
 =?iso-8859-1?Q?/B3vC4i+SeCkG9iJL3suBp7mQtTpWCALNnpG7nnW4+uzZ53BqJkn/ywrn0?=
 =?iso-8859-1?Q?l4G2ObVXPL59Jpg8qKGugFiwRPHEo1/GOOTa0G09Q3VlLIpg27Bu6csFQ3?=
 =?iso-8859-1?Q?52kePT2MM7OGZxHNIE93M1tzbP+KmhKmG/WN9fuEfWLxN81F7FTbz6FpYG?=
 =?iso-8859-1?Q?SSf0fGfuuCmT0yozIg+zABjAvCHDDfTArSGMy8W3U3t+s4ftSHzDh8BJuV?=
 =?iso-8859-1?Q?zaiogicEe13jFUd4ehGoPmz/COf4psFb6ZWElu/3o/uwjJK3Ll8NQHbr+o?=
 =?iso-8859-1?Q?ekK0f1Ai3aoxzsK3pJThsZoupkyjH1bkShmjq0eqxfOWblKdvOOWLZc0rG?=
 =?iso-8859-1?Q?ZnYN24OvecJnNsgP/GUd+WbmjT+5ifM0ZB8T9snIz3j3DnOW49qeTZQpgO?=
 =?iso-8859-1?Q?10ndEzuD76o7hVsZEwYHY8lprFvQqqFCMwm/T5RxDR0LkC8LH8vKVellyK?=
 =?iso-8859-1?Q?GPjiIK1nf9wHR+Fxri/OFOJNhwYpo17IPmgEHn29Gkp9W+xHgWHBtg1+50?=
 =?iso-8859-1?Q?9tSMpndMP+KtU98UwlQRipi0Kh6GMsVcO8x08ECF8Dl44j0ULMas+e/DBi?=
 =?iso-8859-1?Q?+D+tdpDJ6qf5hADReAQQo95ITNmifRSIHIw+U5gNt+h1NJXgTbks7qs+rM?=
 =?iso-8859-1?Q?VCkj9OEc30ztDDk2Rrj7mGDhoana2HRcYtebCmmVXvf4Hqkgf+meTBb1vf?=
 =?iso-8859-1?Q?oo/4FKxaejUaRQ1MRw10k+WvoEhYjHPbnfwxIWB/u1tWxdc1PNAysvqMyY?=
 =?iso-8859-1?Q?L9Uquutcid6WUHb02kHpv0zpbTzQvY0oY+MMfwIXz+ftBk5m9p/uKNpGCX?=
 =?iso-8859-1?Q?uW8qcEwWD7gQ9qpuKM9y5ZAEFgMdu2QFaMN2pJ8NOzUzYlUbjBufPM8Kgm?=
 =?iso-8859-1?Q?k+artPDPA0STSB+Q+CbOkMkMyeq5tfFIOSSML/8rDk+wA9+nRRQiQgoTlc?=
 =?iso-8859-1?Q?Jq4wuDzkAU5QEweX/7+ECCefEy91hciw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SKpiNo3i7uwDpnMaJmxrBTr+3j6OZvH+OFCALvAHGvNGoFMvWCR5O5YHNF?=
 =?iso-8859-1?Q?SKq/ldzqtG+WH2fdpNPmfnQaPn9XIP+doTDrOgj6YNWX4hlMQMlRzWwLZv?=
 =?iso-8859-1?Q?dfNwEa4npU6NplU8eualdi7B2koqEjZbnqxInhhlYuJxlTm2Q9jNkLe5Ev?=
 =?iso-8859-1?Q?vKJ2Qm4GQUf/HgFNICMJagUOKtHgiN6NdETUQwV27z2MK04UIn/VKFgNEq?=
 =?iso-8859-1?Q?GsV7M85sM/d+ucEOUjq3EbbGoAnoHycNSK+sgx17/0gslNy3NhWq53mjZy?=
 =?iso-8859-1?Q?3Gp+nyCt7aUzspRakYKIquwR+YVXA1I9ZtCsMa+MdxPA2SdH0tsGtAZMcQ?=
 =?iso-8859-1?Q?KWeBm/XU2e7EqEGRkgu5NL0vnNVSSZyS9U9cfyaPz3z1BPoHsbTDeoRu29?=
 =?iso-8859-1?Q?vdu6Kgyl8abnCZuG2KiePST+g5pztBCsTgQ6aE+NaJuKsZ4LH+x6NtV/ji?=
 =?iso-8859-1?Q?OZ1btvZUUqzJf8lpO8liK1F2RzEkCNtknEfJojbMymUhDz9UKmx2FLmQ4C?=
 =?iso-8859-1?Q?WS5jB0PqXZf+CYGtl6bUavvfC6Gc5hw/YOPm6hYrygX1tP+GnOUDX/cuiY?=
 =?iso-8859-1?Q?KEm5f1r5uzRUjtl/7tl/3V3z4ElfXCJ2PvlfcLWd/cDz2Kp+MonmzSlJll?=
 =?iso-8859-1?Q?EK28RmlDXiOJrL0R5bCgwsL7h5WykgOHIT1xUMUpgupu1/ex+4Bbe8DN/j?=
 =?iso-8859-1?Q?HfCsqrRb/b4aFrNC1WWWBhSfRL1WRujNJMXKbW+0l1/f79bR/CPLMZ5luP?=
 =?iso-8859-1?Q?3wP7kgQgSNZj4AGLXZU4K60oensMbG8/7OOC1Lhslzc0ZSJ0zEY8FtmxA4?=
 =?iso-8859-1?Q?51OgDe+0JunhHtxKcYtQqDf6HQTDW/TiGziAs/e9SP2Aegupem70cSLYT9?=
 =?iso-8859-1?Q?vQbLVL1z+Al/QBnn2pcbNbbnH4eugpEFS1XfFd0GqI6QJY2/rBu5j2mVIq?=
 =?iso-8859-1?Q?nm4u86Y4oqBU7ww8lPAaCJJ/wl3A3WQ0FDS3EHNKvwSSX89raMf67AmWmD?=
 =?iso-8859-1?Q?8C8UoPJGaAe/RRZcsakBXtkHz5Vwkz11nQuuOTHrVOg2uQljFh/q62MT0c?=
 =?iso-8859-1?Q?/howfkXqyH2yw4hJshPsIKO8v97UK6WwIqcCPvgDYi1OV3S5Raf93TWLeu?=
 =?iso-8859-1?Q?Agbsg/tNhFeG1d2KuMVaA6Xk+R+nc4w/j66C7CG4QNaUs2ZOC1jPHHNkhl?=
 =?iso-8859-1?Q?+6nP1FX/paHX4gU+aA03KF0bFDWhF5viMIxvCSXZeQaZwKthIGP55qqEQM?=
 =?iso-8859-1?Q?xf0Z6BtwRBSovMCSotCJ449J8YdbWH1NMBZHpjdKl/6MqkyfLl+qxcZCny?=
 =?iso-8859-1?Q?KMHYZBQ355IJniMhOsoYJsW7tpCUJd9axaWlEz2oQoasayrkL1Z4CXUSWi?=
 =?iso-8859-1?Q?7njeAWRNIMWISemL0Gw5CzVUZJ4S0yzNFXMTuVfPC9x8E9IyjszXRMALU/?=
 =?iso-8859-1?Q?Fm/mOeaxquAZG5ciI+38UhyAlUTNXzkhrLT+E67AfEKyWGv8DmBLQpCIgE?=
 =?iso-8859-1?Q?N55H8VLUpnT2/ZW63mse8Adnv4VcTYNKoGyXM+WKjSRLfggjXwdALhIYDw?=
 =?iso-8859-1?Q?zcApbOSei6U7r/ByUjfFHC8mYgO/9XbF2i+/rUaIesMjqfss3Fyz3Myx7Y?=
 =?iso-8859-1?Q?ZDF0c5m521OPbNAiP/r1om6zoB8onGesi40Ixtd4t9faM2OQuH7ZRmEg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 798a4fbb-e935-4f2e-27ff-08dcc5f3bab3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 17:22:58.1032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9OIUG/pMrMLRz4T3H9Rl/oVdx+Lh3v10xNnezgus7icu/FznG6+LALQ2cgJVS5/HNGdfgi0Gks717sqGBqY+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
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

On Mon, Aug 26, 2024 at 10:36:24AM +0200, Thomas Hellström wrote:
> On Mon, 2024-08-26 at 10:26 +0200, Nirmoy Das wrote:
> > Hi Thomas,
> > 
> > On 8/23/2024 11:38 AM, Thomas Hellström wrote:
> > > Hi, Nirmoy,
> > > 
> > > On Thu, 2024-08-22 at 14:42 +0200, Nirmoy Das wrote:
> > > > Implement GPU clear-on-free for pooled system pages in Xe.
> > > > 
> > > > Ensure proper use of TTM_TT_FLAG_CLEARED_ON_FREE by leveraging
> > > > ttm_device_funcs.release_notify() for GPU clear-on-free. If GPU
> > > > clear
> > > > fails, xe_ttm_tt_unpopulate() will fallback to CPU clear.
> > > > 
> > > > Clear-on-free is only relevant for pooled pages as driver needs
> > > > to
> > > > give
> > > > back those pages. So do clear-on-free only for such BOs and keep
> > > > doing
> > > > clear-on-alloc for ttm_cached type BOs
> > > > 
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > While this would probably work, I don't immediately see the benefit
> > > over CPU clearing, since we have no way of combining this with the
> > > CCS
> > > clear, right?
> > 
> > 
> > If XE/ttm could do clear-on-free(data+CCS) with GPU all the time then
> > I 
> > think we could
> > 
> > skip ccs clearing on alloc, assuming only GPU access modifies a CCS 
> > state and on boot CCS region
> > 
> > is zeroed. I think that can't be guaranteed so we have to clear ccs
> > on 
> > alloc. I agree, there won't be much
> > 
> > latency benefit of doing clear-on-free for ccs devices. I will still
> > try 
> > to run some tests to validate it, I have done that for this RFC.
> 
> OK, yes this would probably work. Do we need to clear all CCS on module
> load or can we safely assume that no useful info is left in the CCS
> memory at that time?
> 
> > 
> > 
> > I've discussed this with Ron and it seems there is on going
> > conversation 
> > if there is a way to avoid ccs clearing if data is zeroed.
> > 
> > Let's see how that goes.
> > 
> > 
> > >   So the clearing latency will most probably be increased,
> > > but the bo releasing thread won't see that because the waiting for
> > > clear is offloaded to the TTM delayed destroy mechanism.
> > > 
> > > Also, once we've dropped the gem refcount to zero, the gem members
> > > of
> > > the object, including bo_move, are strictly not valid anymore and
> > > shouldn't be used.
> > 
> > 
> > Could you please  expand this? I am not seeing the connection between
> > bo_move and refcount.
> > 
> > Are you saying release_notify is not the right place to do this ?
> 
> Yes. At release_notify, the gem refcount has dropped to zero, and we
> don't allow calling bo_move at that point, as the driver might want to

But this patch isn't calling bo_move - it directly calls
xe_migrate_clear. As far I can tell this function only touches TTM owned
fields (e.g. ttm_resource and ttm_tt). I would think that should be safe
as there shouldn't be fully released until release_notify returns.

Matt

> do some cleanup in the gem_release before putting the last ttm_bo
> reference.
> 
> Thanks,
> Thomas
> 
> 
> > 
> > > If we want to try to improve freeing latency by offloading the
> > > clearing
> > > on free to a separate CPU thread, though, maybe we could discuss
> > > with
> > > Christian to always (or if a flag in the ttm device requests it)
> > > take
> > > the TTM delayed destruction path for bos with pooled pages, rather
> > > than
> > > to free them sync, something along the lines of:
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > index 320592435252..fca69ec1740d 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > @@ -271,7 +271,7 @@ static void ttm_bo_release(struct kref *kref)
> > >   
> > >                  if (!dma_resv_test_signaled(bo->base.resv,
> > >                                             
> > > DMA_RESV_USAGE_BOOKKEEP) ||
> > > -                   (want_init_on_free() && (bo->ttm != NULL)) ||
> > > +                   (bo->ttm && (want_init_on_free() || bo->ttm-
> > > > caching != ttm_cached)) ||
> > >                      bo->type == ttm_bo_type_sg ||
> > >                      !dma_resv_trylock(bo->base.resv)) {
> > >                          /* The BO is not idle, resurrect it for
> > > delayed
> > > destroy */
> > > 
> > > Would ofc require some substantial proven latency gain, though.
> > > Overall
> > > system cpu usage would probably not improve.
> > 
> > 
> > I will run some tests with the above change and get back.
> > 
> > 
> > Thanks,
> > 
> > Nirmoy
> > 
> > > 
> > > /Thomas
> > > 
> > > 
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_bo.c | 101
> > > > +++++++++++++++++++++++++++++++++--
> > > > --
> > > >   1 file changed, 91 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 6ed0e1955215..e7bc74f8ae82 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -283,6 +283,8 @@ struct xe_ttm_tt {
> > > >   	struct device *dev;
> > > >   	struct sg_table sgt;
> > > >   	struct sg_table *sg;
> > > > +	bool sys_clear_on_free;
> > > > +	bool sys_clear_on_alloc;
> > > >   };
> > > >   
> > > >   static int xe_tt_map_sg(struct ttm_tt *tt)
> > > > @@ -401,8 +403,23 @@ static struct ttm_tt
> > > > *xe_ttm_tt_create(struct
> > > > ttm_buffer_object *ttm_bo,
> > > >   	 * flag. Zeroed pages are only required for
> > > > ttm_bo_type_device so
> > > >   	 * unwanted data is not leaked to userspace.
> > > >   	 */
> > > > -	if (ttm_bo->type == ttm_bo_type_device && xe-
> > > > > mem.gpu_page_clear_sys)
> > > > -		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
> > > > +	if (ttm_bo->type == ttm_bo_type_device && xe-
> > > > > mem.gpu_page_clear_sys) {
> > > > +		/*
> > > > +		 * Non-pooled BOs are always clear on alloc when
> > > > possible.
> > > > +		 * clear-on-free is not needed as there is no
> > > > pool
> > > > to give pages back.
> > > > +		 */
> > > > +		if (caching == ttm_cached) {
> > > > +			tt->sys_clear_on_alloc = true;
> > > > +			tt->sys_clear_on_free = false;
> > > > +		} else {
> > > > +		/*
> > > > +		 * For pooled BO, clear-on-alloc is done by the
> > > > CPU
> > > > for now and
> > > > +		 * GPU will do clear on free when releasing the
> > > > BO.
> > > > +		 */
> > > > +			tt->sys_clear_on_alloc = false;
> > > > +			tt->sys_clear_on_free = true;
> > > > +		}
> > > > +	}
> > > >   
> > > >   	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
> > > > caching,
> > > > extra_pages);
> > > >   	if (err) {
> > > > @@ -416,8 +433,10 @@ static struct ttm_tt
> > > > *xe_ttm_tt_create(struct
> > > > ttm_buffer_object *ttm_bo,
> > > >   static int xe_ttm_tt_populate(struct ttm_device *ttm_dev,
> > > > struct
> > > > ttm_tt *tt,
> > > >   			      struct ttm_operation_ctx *ctx)
> > > >   {
> > > > +	struct xe_ttm_tt *xe_tt;
> > > >   	int err;
> > > >   
> > > > +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> > > >   	/*
> > > >   	 * dma-bufs are not populated with pages, and the dma-
> > > >   	 * addresses are set up when moved to XE_PL_TT.
> > > > @@ -426,7 +445,7 @@ static int xe_ttm_tt_populate(struct
> > > > ttm_device
> > > > *ttm_dev, struct ttm_tt *tt,
> > > >   		return 0;
> > > >   
> > > >   	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear
> > > > system pages */
> > > > -	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
> > > > +	if (xe_tt->sys_clear_on_alloc)
> > > >   		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
> > > >   
> > > >   	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
> > > > @@ -438,11 +457,19 @@ static int xe_ttm_tt_populate(struct
> > > > ttm_device
> > > > *ttm_dev, struct ttm_tt *tt,
> > > >   
> > > >   static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev,
> > > > struct
> > > > ttm_tt *tt)
> > > >   {
> > > > +	struct xe_ttm_tt *xe_tt;
> > > > +
> > > > +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> > > > +
> > > >   	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> > > >   		return;
> > > >   
> > > >   	xe_tt_unmap_sg(tt);
> > > >   
> > > > +	/* Hint TTM pool that pages are already cleared */
> > > > +	if (xe_tt->sys_clear_on_free)
> > > > +		tt->page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
> > > > +
> > > >   	return ttm_pool_free(&ttm_dev->pool, tt);
> > > >   }
> > > >   
> > > > @@ -664,6 +691,7 @@ static int xe_bo_move(struct
> > > > ttm_buffer_object
> > > > *ttm_bo, bool evict,
> > > >   	struct ttm_resource *old_mem = ttm_bo->resource;
> > > >   	u32 old_mem_type = old_mem ? old_mem->mem_type :
> > > > XE_PL_SYSTEM;
> > > >   	struct ttm_tt *ttm = ttm_bo->ttm;
> > > > +	struct xe_ttm_tt *xe_tt;
> > > >   	struct xe_migrate *migrate = NULL;
> > > >   	struct dma_fence *fence;
> > > >   	bool move_lacks_source;
> > > > @@ -674,12 +702,13 @@ static int xe_bo_move(struct
> > > > ttm_buffer_object
> > > > *ttm_bo, bool evict,
> > > >   	bool clear_system_pages;
> > > >   	int ret = 0;
> > > >   
> > > > +	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
> > > > ttm);
> > > >   	/*
> > > >   	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path
> > > > when
> > > >   	 * moving to system as the bo doesn't have dma_mapping.
> > > >   	 */
> > > >   	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
> > > > -		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
> > > > +		xe_tt->sys_clear_on_alloc = false;
> > > >   
> > > >   	/* Bo creation path, moving to system or TT. */
> > > >   	if ((!old_mem && ttm) && !handle_system_ccs) {
> > > > @@ -703,10 +732,9 @@ static int xe_bo_move(struct
> > > > ttm_buffer_object
> > > > *ttm_bo, bool evict,
> > > >   	move_lacks_source = handle_system_ccs ? (!bo-
> > > > >ccs_cleared)
> > > > :
> > > >   						(!mem_type_is_vr
> > > > am(o
> > > > ld_mem_type) && !tt_has_data);
> > > >   
> > > > -	clear_system_pages = ttm && (ttm->page_flags &
> > > > TTM_TT_FLAG_CLEARED_ON_FREE);
> > > > +	clear_system_pages = ttm && xe_tt->sys_clear_on_alloc;
> > > >   	needs_clear = (ttm && ttm->page_flags &
> > > > TTM_TT_FLAG_ZERO_ALLOC) ||
> > > > -		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
> > > > -		clear_system_pages;
> > > > +		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
> > > > clear_system_pages;
> > > >   
> > > >   	if (new_mem->mem_type == XE_PL_TT) {
> > > >   		ret = xe_tt_map_sg(ttm);
> > > > @@ -1028,10 +1056,47 @@ static bool
> > > > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
> > > >   	return locked;
> > > >   }
> > > >   
> > > > +static struct dma_fence *xe_ttm_bo_clear_on_free(struct
> > > > ttm_buffer_object *ttm_bo)
> > > > +{
> > > > +	struct xe_bo *bo  = ttm_to_xe_bo(ttm_bo);
> > > > +	struct xe_device *xe = xe_bo_device(bo);
> > > > +	struct xe_migrate *migrate;
> > > > +	struct xe_ttm_tt *xe_tt;
> > > > +	struct dma_fence *clear_fence;
> > > > +
> > > > +	/* return early if nothing to clear */
> > > > +	if (!ttm_bo->ttm)
> > > > +		return NULL;
> > > > +
> > > > +	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
> > > > ttm);
> > > > +	/* return early if nothing to clear */
> > > > +	if (!xe_tt->sys_clear_on_free || !bo->ttm.resource)
> > > > +		return NULL;
> > > > +
> > > > +	if (XE_WARN_ON(!xe_tt->sg))
> > > > +		return NULL;
> > > > +
> > > > +	if (bo->tile)
> > > > +		migrate = bo->tile->migrate;
> > > > +	else
> > > > +		migrate = xe->tiles[0].migrate;
> > > > +
> > > > +	xe_assert(xe, migrate);
> > > > +
> > > > +	clear_fence = xe_migrate_clear(migrate, bo, bo-
> > > > > ttm.resource,
> > > > +				      
> > > > XE_MIGRATE_CLEAR_FLAG_FULL);
> > > > +	if (IS_ERR(clear_fence))
> > > > +		return NULL;
> > > > +
> > > > +	xe_tt->sys_clear_on_free = false;
> > > > +
> > > > +	return clear_fence;
> > > > +}
> > > > +
> > > >   static void xe_ttm_bo_release_notify(struct ttm_buffer_object
> > > > *ttm_bo)
> > > >   {
> > > >   	struct dma_resv_iter cursor;
> > > > -	struct dma_fence *fence;
> > > > +	struct dma_fence *clear_fence, *fence;
> > > >   	struct dma_fence *replacement = NULL;
> > > >   	struct xe_bo *bo;
> > > >   
> > > > @@ -1041,15 +1106,31 @@ static void
> > > > xe_ttm_bo_release_notify(struct
> > > > ttm_buffer_object *ttm_bo)
> > > >   	bo = ttm_to_xe_bo(ttm_bo);
> > > >   	xe_assert(xe_bo_device(bo), !(bo->created &&
> > > > kref_read(&ttm_bo->base.refcount)));
> > > >   
> > > > +	clear_fence = xe_ttm_bo_clear_on_free(ttm_bo);
> > > > +
> > > >   	/*
> > > >   	 * Corner case where TTM fails to allocate memory and
> > > > this
> > > > BOs resv
> > > >   	 * still points the VMs resv
> > > >   	 */
> > > > -	if (ttm_bo->base.resv != &ttm_bo->base._resv)
> > > > +	if (ttm_bo->base.resv != &ttm_bo->base._resv) {
> > > > +		if (clear_fence)
> > > > +			dma_fence_wait(clear_fence, false);
> > > >   		return;
> > > > +	}
> > > >   
> > > > -	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
> > > > +	if (!xe_ttm_bo_lock_in_destructor(ttm_bo)) {
> > > > +		if (clear_fence)
> > > > +			dma_fence_wait(clear_fence, false);
> > > >   		return;
> > > > +	}
> > > > +
> > > > +	if (clear_fence) {
> > > > +		if (dma_resv_reserve_fences(ttm_bo->base.resv,
> > > > 1))
> > > > +			dma_fence_wait(clear_fence, false);
> > > > +		else
> > > > +			dma_resv_add_fence(ttm_bo->base.resv,
> > > > clear_fence,
> > > > +					  
> > > > DMA_RESV_USAGE_KERNEL);
> > > > +	}
> > > >   
> > > >   	/*
> > > >   	 * Scrub the preempt fences if any. The unbind fence is
> > > > already
> 
