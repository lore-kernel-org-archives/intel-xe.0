Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185E8C3DA42
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 21:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A7910E027;
	Tue,  9 Jul 2024 21:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWKnNxSm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008EF10E027
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 21:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720560275; x=1752096275;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IY2h/m76qOxct0SB8F/9EVW8N+unq5N5hCqqymsCUiQ=;
 b=UWKnNxSm1K1/deRzigSMxbcQ7tVeBErGpNiQgTrXWYy4gIwadYH5xpYY
 /bbSyRSgECK5VLYf/RuDs9MHhdW+LSvtnD0NhEjE7TnEd7HJATrzJ7e9W
 3xyLP1nKp+xkuqM9uLFkcQqivPLPdPrchzVzTUlnrQgkYL9IrK5h6HqCO
 T8Qzy2nHtWOxgTZav3DZm8XIZRK0Vpsqvqrze8kSgwV2+iXlRiKS5DXOh
 fe9DcnHJ8b6X409k56iCeWdJLsfCCdBSVSADXpkt3Rejighv6Nw9B2pJF
 8wQ02kOLvx3pDozi290HEcxw0RevrOD7rT7kq9/xpjkMiG8xeDr5bpNu+ Q==;
X-CSE-ConnectionGUID: HInv0X2ZTa6ycy/RCtP47Q==
X-CSE-MsgGUID: DoRLbwHbSK+i1Rr+tNt3cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28440969"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="28440969"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 14:24:35 -0700
X-CSE-ConnectionGUID: b8w5CCDSRxWar9c9dbk9Kg==
X-CSE-MsgGUID: 9F5XX29QS1+HGerBLi/hQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="47987915"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 14:24:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 14:24:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 14:24:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 14:24:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 14:24:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCL/bU/7WXJiILoHv+BAKx8LrWdfwp9eS20NwMMfUTpHiYhFPIzUFEIjALLwMj4w8w5iaaKPSUXImjNgfS/KdkYyxJqHOOdzV4MHkj1IQJacMmNx8iZGYmoa6QPWqfKVT1YCkhk0weLIQgXNfVHH8R34ACAbShQ6w0td9777Ob4xUPHn0jT8YSnVCt0II0lMCJcv7iQZ6JnDj1IAU83WJQ7/pjenfyxxRyFTJzNakVMnQ36nE16lg+iceqKL/WBoewapIsd0+zj/3n/KKSvKr8+c9AZU96XOrHP/sC984pCZxVRjIjj/gq/Ur9KEitbx2DBfYaYz/+l6itu0JRH8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEFZT7FvBYCoX0XS5KgEmG3UZ+ibPA98IMljk6iAaO0=;
 b=hS0O26L0iDUQzYvsXojjDx6y+YVR5rQ0ntMpUnHKbzMu0JFAc8qA4Zsvm/GXj88f7PFjFhvIWAm+q5vX8Xq5mw4osAfFAkVt4lSU0nZbLSrDzbUtKdSVgGuH6daOt3r8IhFuEYy7jk1BycK4BwRjgdq0GklmzyXLqvUMap5Moc+Gvk3IPMznca2YNfFkG51MUq6+dFLQKluVAR8EvH0Pc3alKNuHf1gxtt0xUrYlzBYIRI/Y127ydgtlV89WXXaXbU0EGZHFvEkyAEGb2cJHRAatnjw/FpoE2oNKsZjahbIq7b+bOQ5etNQIH7RjyhwYioSf91flAcpURftp6TMFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 21:24:30 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 21:24:30 +0000
Date: Tue, 9 Jul 2024 21:23:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <nirmoy.das@intel.com>, <farah.kassabri@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 00/11] Proper GT TLB invalidation layering and new
 coalescing feature.
Message-ID: <Zo2qY/YplZbOZpLz@DUT025-TGLU.fm.intel.com>
References: <20240708040331.766264-1-matthew.brost@intel.com>
 <6aba8e53-55fd-4573-ad0c-e8c62ebe1297@intel.com>
 <b008d72f-8123-4f3e-827f-9e5fd9368983@linux.intel.com>
 <Zo1m7r+f0kfXsUSC@DUT025-TGLU.fm.intel.com>
 <e96424e6-31ef-4b50-92cf-dfb3349a1a6f@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e96424e6-31ef-4b50-92cf-dfb3349a1a6f@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA2PR11MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c33706-468c-40b5-2e46-08dca05d84ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ztVtkmWeYQ9lEsosVfBkrNQz19jF9rxHnJleLPZCDxcMQTHaEt9EbJ9s2Cqd?=
 =?us-ascii?Q?bmQWRlHvmHG652OP89krF/aLoiDJSqmrw4xMkW1XRbYdDWvJsKQs/fydMWfG?=
 =?us-ascii?Q?R3ke4o7nxQfrLR9PqcGAGmki4Ldqtg+pAvCZ+kPFrHA1xxgmh/EEXuHsf5G2?=
 =?us-ascii?Q?7eSuPE7zDsQpX6oEjSm+tu5JEr3S2ZSjV81glL55J6MRJ/TxycUYyyWR9BBZ?=
 =?us-ascii?Q?5T75HR89EViyqqpZ18DtSdBZfmFY+p9QVPRvuHEdm/YXIR5mn2V9Hr27FNNs?=
 =?us-ascii?Q?SWfyBph/VO66se6nwhuG/kYU8u30zH3uoCmzCW7EFcCiOuvfckChut2SyDAH?=
 =?us-ascii?Q?tfaDHMsT4kClJkw9VfKdRWmtGg4lY9bbM8RrPFNBwDtKv85J3GZM/NnMXLhC?=
 =?us-ascii?Q?N5n7fSeYoN1Q9AvFDzQjt0EQI+BhK1/lN/MvQRMYLb93RtFaS3djLbcpz/8E?=
 =?us-ascii?Q?vGIiEikUpedtgC+GgLaPdnvjpwuZ5RPHPOwcB9VJ7BgT9EVk3pzDoHIZ9//X?=
 =?us-ascii?Q?rhn1vGrf7L2eMUqnNG3Z2TjiGa4tdYuiNQUmfdkPVWJSBEpQcsXf1W0KVUzi?=
 =?us-ascii?Q?3OtiTIJt0WICESOCPk7bJFR8cMBUZbP0UHE941istcaH9GOKTxATlQnNtML2?=
 =?us-ascii?Q?8kAAoItaHD40UMFAb9xH9OhOlvdBOFlaJb5iX2ykLW/7yIgqy8GnoYe4ugKw?=
 =?us-ascii?Q?0/XrroJhOfMupoVRoTxHplJYaT9BHaOUVg+ODFzPJULVomDwkH34P3ie30we?=
 =?us-ascii?Q?7USAdv1293Z4cILgsAW7iUkeHA6JaNAqlSCOfI4wzObotZtr2gE4qlMiF6gd?=
 =?us-ascii?Q?LvPdWVuA9WIWbCoTvVU6Ejx/4wd5YK89V9cHpmSjx6tybKbSWRPreD5uJxgi?=
 =?us-ascii?Q?Gkx7EkGG3ydz3/bKNJc8gc4bwg3jTsonFgeSkWk8T32b8KORtvrZ1423Aqbf?=
 =?us-ascii?Q?hy5Sm+f81nAFluWWbfTofp9AJth50If1/z7EUBqjUm/0F50vwkIY/Y5/yVP7?=
 =?us-ascii?Q?P24hm2wODuNSOvaR9MtIf8GGwXcALsgeKpz2/pmrYLIHcsykWnlumyILMHMW?=
 =?us-ascii?Q?WITWRPO5v6ntFlat150yivbIM1ouuGD/BmLKKyQQHkyPk9Mg6xDXgohLKTjr?=
 =?us-ascii?Q?mOZi+/3Q9JTQYPlegkB8bQRcN/UL/IOa+iwv9IDSD9bfb+IdFkf4CfZCZoG9?=
 =?us-ascii?Q?zlB8gZ2YRxSb6tYTrTzofA4Dr9WUoWGVVCTLHOdkZDbSQBApBr8BCxIZjm1u?=
 =?us-ascii?Q?bzomONWhJwJv+o5aiAS8+adfwrnQP4MoEYYQfQ07XfRe/J5mBt6mLk8KfaO2?=
 =?us-ascii?Q?+f4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1usnb/afJLVjnl3dLMUQKx6CVTkaFrfKAPtTiiys9bU93QjL2+J6FASu5IJK?=
 =?us-ascii?Q?TwHmPBZqixiC0a95fjJhagBwC7H2s57HYmMb/6VHRvsZzga8cWBBFtMLdo7K?=
 =?us-ascii?Q?Fhyrd0zrDKPbzSVlnn4D1oVY5DReANBFFtfoi7sotvtdG09N/6FKC4QmXnfx?=
 =?us-ascii?Q?a8vCScAqeWj3pRpKAWrg3zarXLdhB3JP6RU0Ive2ua5RG+DDMxjRkPG2WvOO?=
 =?us-ascii?Q?1rHaLb3/iatwaCVXuC6Ghja8KK8DQGcmdznmYv6tZk9sArDUnUkr4jmIcZaj?=
 =?us-ascii?Q?9qiMVxKvqrc08h1isN1swkby8gOG9d5WcBgL5jIaP1/fh/lzLuDXWjwenuRK?=
 =?us-ascii?Q?udreG1D3ZTnw85rHVmU8odNcLAO+9VO3drZiDaJuf55MwoZbnC4aDox48+bM?=
 =?us-ascii?Q?wyIvitTiseMufiezTaXfEuQ9P/A/iDcq4IgmzDXrN3BuVSAO5tJIrrtvb7gG?=
 =?us-ascii?Q?2GUHSYoFkm3BE9EtcbDrCrrpjzcke6IoBxBKTqBCbC3Iui0iUmegjZymJ+Lg?=
 =?us-ascii?Q?mAJ8lKYt9XY24QWRJfmbwqAI6yJemXiQa2Paw3pWm4MaY0T9DEwwb1gCnzDk?=
 =?us-ascii?Q?4I9DG/w6INkX28sIv/Bk7rXzAWQczXjWOCH03fZFpDI6QyWGvrDejf8tbbQg?=
 =?us-ascii?Q?k6lo4OlsT8mihc33+DQzTdp7ibJJrcSouXWFXcSuhx3YMEGY4zjdQReYk3oB?=
 =?us-ascii?Q?qX55TpzGk+jpPXsxfh6xquzIZnXCdjt09y8oJhqR4mbkw8/A4en8Y4jpxJzM?=
 =?us-ascii?Q?EqgCtdcVjlAiawxswWES/94ZtI1yPcr/h6OHZM6DopvxaoX5vdptPu62GCks?=
 =?us-ascii?Q?a7TXzKUAcK2Hz+XJmRd8txVpiRzqm0rYHrQjot1Lo7u5kLfjmAPu3i1wqdUY?=
 =?us-ascii?Q?QeFn5XgHM0Zeb9xzoTZbOLLg8ZO6/PAQB2b5+LYXh3xi57ZfFRZTz3++FCOf?=
 =?us-ascii?Q?Oy4mEpNBI5Z4NfGwsVpt47IewBEtpoHfEPtEVoeKQNxtzT33/G7dAPQKlXuy?=
 =?us-ascii?Q?mJao5iwnSqYfHIAJLbHePRgOKyUqXMWV9DIWrKoBi0vCsEslDZSd1M1wNJ4P?=
 =?us-ascii?Q?bEANTXNhMpbN6ppUh8NOnn1LqaxzSUacmwfeCd9ktitubUIo0KA05OpugRNq?=
 =?us-ascii?Q?aIOO1bswLQ2ETMeDXO2JdXN6QxY3xD9N03wiWlx2KiVzUy8Zn0zXrIqhTtXJ?=
 =?us-ascii?Q?D4xU47f/Yjz7wZataC1CMDMudEVNlgpV797axi5m2bMb3T1OJYhBythzN2J9?=
 =?us-ascii?Q?CJioGFfhA3w8YWsR555K5CfNttyS+kxjYuNVFHIhfxEa2qbRzwuHhd9816WU?=
 =?us-ascii?Q?+yJ18KDae6PKQPGSPLnu7AH6NfkBdt3mmW09zkVC3J8ti5bjZ3++q1pxtaoB?=
 =?us-ascii?Q?bx907p05WZ2zgv++l1KugAaNd1o7QZ11W9vEpsA4OfIsAWCBU6zM5IvR9QrB?=
 =?us-ascii?Q?E7VJ75D/f/8G/RWWFOzjvGbz14ih2LF7UBRhwOoqrNhQbxhhzFCkzu7wMxfT?=
 =?us-ascii?Q?PSH5DJ/6Yx82Tfm8tFZpfHTYeVJ8fqJLkp43kC2GbmIY4HWGRidOvweogAIE?=
 =?us-ascii?Q?WyL8pLEy7iLMe4t0WVlJ02D0l2QQQqT4qtWj58sk4iaZm1YvnASyKDvoylNN?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c33706-468c-40b5-2e46-08dca05d84ef
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 21:24:30.3894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsgTsTHYTs5lJtF7ddBCchoOM4pKymAuoaFclLYeoFcDEW3AKljKxCOrGOJdX5ysR3XwBVo3+AweIRdzPx5E4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
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

On Tue, Jul 09, 2024 at 06:42:34PM +0200, Nirmoy Das wrote:
>    On 7/9/2024 6:35 PM, Matthew Brost wrote:
> 
> On Tue, Jul 09, 2024 at 06:08:54PM +0200, Nirmoy Das wrote:
> 
> On 7/9/2024 11:57 AM, Matthew Auld wrote:
> 
> Hi,
> 
> On 08/07/2024 05:03, Matthew Brost wrote:
> 
> While debuging [1] an issue was identified in which if too many GT TLB
> invalidations are issued to the GuC, the GuC can get overwhelmed to the
> point scheduling of jobs starts to stall. To avoid this, hold and
> coalesce GT TLB invalidations in the KMD if a watermark of pending
> invalidations is past. Add gitlab for this issue has also been opened
> [2].
> 
> Layering issues with GT TLB invalidations are known [3] which needed to
> be fixed first before adding this new feature.
> 
> - Patches 1-8 fix the layering.
> - Patches 9-11 add coalescing feature.
> 
> We could merge these two as seperate series if needed.
> 
> CCing various stakeholders (Farah, Michal, Nirmoy) which have raised GT
> TLB invalidation issues in the past.
> 
> Maybe worth mentioning for [1], we try to process TLB invalidations
> directly from the irq, however we also only process the g2h queue
> in-order, so if there is something other than TLB invalidation or fault
> earlier in the queue then we do nothing useful from the irq and just
> return, that is until the wq can eventually process those earlier items
> that couldn't be processed directly from the irq. In the past
> 
> Seen this recently :
> 
> <3> [3763.731822] xe 0000:03:00.0: [drm] *ERROR* GT0: g2h outstanding: 611
> <snip>
> <6> [3727.857273] [IGT] xe_evict: executing
> <3> [3730.165480] xe 0000:03:00.0: [drm] *ERROR* TILE0 [GTT] GT0: TLB
> invalidation time'd out, seqno=26858, recv=2685
> 
> Missing the last digit of '2685'?
> 
>    oops, yes:
> 
>    <3> [3730.165480] xe 0000:03:00.0: [drm] *ERROR* TILE0 [GTT] GT0: TLB
>    invalidation time'd out, seqno=26858, recv=26857
> 
> 
> 
> Which I think fits your description. This series should help but not sure
> how much.
> 
> 
> From arch level if this is a continued problem, perhaps we should ask
> for a dedicated G2H queue for TLB invalidation done responses. It seems
> like a fairly reasonable ask to me as TLB invalidations really shouldn't
> get stuck behind other G2H processing...
> 
>    Yes, that should work really well. I am currently trying out this
>    series but haven't manged to reproduce the issue without/without the
>    series reliably yet.
> 
>    Regards,
> 

Also worth mentioning that I was able to prove this series helped with
the scheduler starvition I issue I was seeing [1] which triggered me
writing this series. Will include this in my next cover letter if I need
to send another rev.

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2483150

>    Nirmoy
> 
> Matt
> 
> 
> Regards,
> 
> Nirmoy
> 
> 
> I have seen TLB timeouts where the TLB invalidation is clearly in the
> g2h queue (and has been for a while), but is stuck behind something
> earlier in the queue that needs the wq, but system is under such a heavy
> load that the wq can't be scheduled in a timely manner.
> 
> 
> v2:
>   - Fix CI issues
>   - Clean up some of the series / patch structure
> 
> Matt
> 
> [1]
> [1]https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497
> [2] [2]https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162
> [3] [3]https://patchwork.freedesktop.org/series/133001/
> 
> Matthew Brost (11):
>    drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
>    drm/xe: Drop xe_gt_tlb_invalidation_wait
>    drm/xe: s/tlb_invalidation.lock/tlb_invalidation.fence_lock
>    drm/xe: Add tlb_invalidation.seqno_lock
>    drm/xe: Add xe_gt_tlb_invalidation_done_handler
>    drm/xe: Add send tlb invalidation helpers
>    drm/xe: Add xe_guc_tlb_invalidation layer
>    drm/xe: Add multi-client support for GT TLB invalidations
>    drm/xe: Add GT TLB invalidation coalescing
>    drm/xe: Add GT TLB invalidation coalesce tracepoints
>    drm/xe: Add GT TLB invalidation watermark debugfs
> 
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   drivers/gpu/drm/xe/xe_debugfs.c               |  38 ++
>   drivers/gpu/drm/xe/xe_device.c                |   3 +
>   drivers/gpu/drm/xe/xe_device_types.h          |   5 +
>   drivers/gpu/drm/xe/xe_ggtt.c                  |  21 +-
>   drivers/gpu/drm/xe/xe_ggtt_types.h            |   5 +
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 641 ++++++++++++------
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 +-
>   .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  41 ++
>   drivers/gpu/drm/xe/xe_gt_types.h              |  43 +-
>   drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
>   drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  | 145 ++++
>   drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h  |  18 +
>   drivers/gpu/drm/xe/xe_pt.c                    |  33 +-
>   drivers/gpu/drm/xe/xe_trace.h                 |  10 +
>   drivers/gpu/drm/xe/xe_vm.c                    |  45 +-
>   drivers/gpu/drm/xe/xe_vm_types.h              |   3 +
>   17 files changed, 801 insertions(+), 279 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
> 
> References
> 
>    1. https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497
>    2. https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162
>    3. https://patchwork.freedesktop.org/series/133001/
