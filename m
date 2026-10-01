Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E357CA5FD2
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 12:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D744110E24D;
	Thu,  1 Oct 2026 12:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzklNCZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E2B10E24D
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 12:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790858532; x=1822394532;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/ww0A8Q4xbvtfbuYl+tEX9Fq/NfeAfoWBNtoYEzrHwM=;
 b=WzklNCZcizvS9x38lWP+Y8f76be5ttXxK66Po4Zy9o1ROQ9iMUL9q9Yn
 fVGJSa/wLbpXtWIgDdKS7CmLhR8QPEWHAwxEkwqC7IabL0pUyZxxCxRFg
 7zJI1ZLL+1yWa4stqr1rbmZXFCf27ajHKBoyxGhoYcM/v9AzLaoOrBDEn
 Ggq5jjpq0ldMl8J39w0bELJ2dX2VLHQZD6VNplMiDA6Cxw8tSzS13ky9s
 QnwOjOSpOKLhibeNbIuzLzrAMtBz1mwcvvhYNNejZcembF+XcYsgTUipl
 8KIr6OvZWGks5SK4+Tcn6ckmTyfSUqxH/GofHQzTHoYRLRYyvxtefuybI Q==;
X-CSE-ConnectionGUID: pgNApYtSQFS505dgGIqpAg==
X-CSE-MsgGUID: d9Cq1fygRNKGRrqwWI0u3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="107994558"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="107994558"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 05:42:11 -0700
X-CSE-ConnectionGUID: 1dF4vSKNS8G5ebayG+QFVA==
X-CSE-MsgGUID: qOTf+ceyQxCeG1NmcpRySw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275529452"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 05:42:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 05:42:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 05:42:11 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 05:42:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSq0oL/ukO7OLLzRhYShAgxlrEfkV26ojd1qoo4tKVIKWSvSK0X0Jd7bszIi7/4YE4UPpr70ihYYjM2DXVNHAeW0Scj4VVrhvMkhhxjCfulDkVVsyx2/hjUH9PPU0qjAh/DVSM4KCg3WKkOXk/Xszrjs3LhB6oeUydyjaK7GHEQ6w15v4TUSX5IXewMgCrzvMHqhyeWfUi1OHzsK+npQB0LUms+gLl4kJDIMlo3ImpevEu/Kii673Wnt9swmxo0iWYAbMCFygQlB9wdEPuWVfu+Phw6EpY8QEVKJ/lOMHWYJNd/lUxPTOlaia1RIXY66ff7YPNzcgWckel54FPsbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnslVcXlCaEmc0yQ21U1crh5qRrVjgQbpr0N9rND5ow=;
 b=TXs+ubgamUeNP20aBEbZFjVTzPaPk/Frk59lwVX12wuVdJ/ENHppL3K6WnyKLxsAgUEPrHJ+LETTalTyvNQUYGTBmHOS8sLCJpCkARG5SV7Lx3tKAGjUe43rc+eEplfB+TNY3TaGUBpW1DSNyRClIwqqVQSAJwPG6jhpfX7wSIKfCP32be1dZ7QnF4/7cGMlEHrqColyHjdXIs8RxyzueslZQAGPXN4SNgcZ18IN0pRAt/5gTdvP0zAAUUsQp3q24oujxh3AXfQbxUGjOUvhU8PnM7T5NAt3kxM0gRgllvNWHX/ycGec3JszvWcXvo6gKTBpZk4wwxnTaCt4Q1LMLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Thu, 1 Oct
 2026 12:41:59 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:41:59 +0000
Date: Thu, 1 Oct 2026 08:41:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Violet Monti <violet.monti@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Add a new PTL PCI ID
Message-ID: <ar5VC6_a7lqYHUQe@intel.com>
References: <20260922165607.129560-2-violet.monti@intel.com>
 <arL_YfVMnFsqzzjm@intel.com> <arQIKbgr4QbAJ-Lj@vmonti-desk>
 <arcahvIqBmCytAmw@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <arcahvIqBmCytAmw@intel.com>
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7f8683-e370-456c-91e2-08df1fb961fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XZOR37pHNFSKhJLs/fPYxpgGGEw7g3kw9HdJNEe1kUdzR7xBQKnqPMaeVgPugUma/Kmfp4BtlNtO5pnZzbwjUggmLdsYEIwOGE1mDeE2ewLxBmA7nfneZqHLj5mNcvMyJZXdmqgWx4Uvhszc+hjMSMzx7fzCzFAYVZLJr/P5H7QdZE+0F8Ag6M2hIJhtSJaWT16YmkEWF5hYLjj/BzGPAkc0XDgKqVPniWgC3eTknXljicziKdOqgBp/xnIp912DUINVtPLXEH6tvou0mTQu7GOVR3VXMuGg8+8q/hTCXLAe3SjgST0mEX/1JcV/YcVLEDjrAV8zwqVvrfGdlPSYtFJeHfCbHxVEYRKOBksxZuAniaNk8obOVanfRGOgcDCvfh+vmZpNXk71EMdIOhulupwunRizK7Muwgl/J2iaNIZl8TGcuhOd0f8q9GWb0WsRne7q97mrc3A6z5bNJyyZdkjs6gjpG2K3twEXWrU6SuJJmFjSYWEtKvnF3yh/dPCcOi9+3r29Px2Gz+tvx1SyuRQ2YvpuVmvJohXrakmMuzDIgbVNmYKF4fXp7yDvVtJ9lxTvrSvoUWTbwuu/ioQ/46czr1qr4W+XNLpKVQpan73F+BDESb6RAKk/kB4oh8aZow31IOD38RTF12O+rfeC4wJYGeZ6KEjsFrr16yCkXTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hZjyh8xrviNxgI+DkfJvapjqP2IWcHJKt18S2h+HofKYKG1JHPs3TXesPeEz?=
 =?us-ascii?Q?zIe8UfDG7w9cGwpg//YCvzqjo3vMEh2jAdwLG3iMmghw+wk0LmuinW1xvCqz?=
 =?us-ascii?Q?F9YyzCBinY4fUPRQqEqr8dhSTSf0GG86r9becS+1BpR1cfOm+cdZ2NktUGKi?=
 =?us-ascii?Q?CYD29eeNH3AzNwb/29gb/jm4nGMK/mA3jJ9+cMzZTxBdhR3G9NNMdXkkziy7?=
 =?us-ascii?Q?IL15QHBLG8OCeAvUrdYYirf8qhZ/4g8pwLP03LpdSt8H18rcKgUSGxc8KMsg?=
 =?us-ascii?Q?xv9hsAeloI2dghObkbarq0TQAhU9+BStgqK7ouwGe4hjge85nCKxfNmOcgxL?=
 =?us-ascii?Q?IFi9JVZq/zPaGcKGI4iS/KO/HmMIsJoko7FTX2s49wnK4X7LT2G560NmHXus?=
 =?us-ascii?Q?f7BQZnEJKVSaEmw9ocIdej9xLLpgHrxno79mm+eITLOn+UCaOJLp59BwwwBQ?=
 =?us-ascii?Q?ViSgpI0BJFAQNdw9247yr0U7IRRWh28r3ckEP/5qaOy5EMjj2Y9gLg5h3dO/?=
 =?us-ascii?Q?2DaDGn97eMG3gfNeu705drEhhHjRqrhPGzLxqHfzc721QnYa0VQkxJ+3aTe5?=
 =?us-ascii?Q?kGv41OQxWjJCM5yzTXr/mnYGrtHC89hwfO3vu48DGqCjAPPDjP8L8rG63km0?=
 =?us-ascii?Q?P7CAJ5WNhQi6hf5YZN4gMuBFFUiEk7dUVuxnHkvA5HlnEnCsT8lxP0J1Q9EE?=
 =?us-ascii?Q?ra3R3puiLcWe+NiFJdnAAa0L+lqRWSPFTQ36fierAduCMOh8Rd8PnAIPBUjw?=
 =?us-ascii?Q?d5yMRx0/zOpXZcyqMxJb4I58bXBUlGriXzXaf7BerG19MCLyBV5FsAquokMw?=
 =?us-ascii?Q?Ld3T0Mu+amfX4jX48L77BLO36yGwzbUUmbjzubZuKpxwcWGIUrtuia16ORDE?=
 =?us-ascii?Q?l6jqLdz1CxFsaGllwhK5H1SO2lUH+5v6hq/QFzqcyna7fdqGrdG6QlEkmpkp?=
 =?us-ascii?Q?dFgRYcsKUz0bdZZbtJogXsqKyl1zo2nYvlvl+2SAXiPpo77MTWJLLL+Zk/BB?=
 =?us-ascii?Q?iY+COmn0obxyqUphNJGmW1YWgTL6hhA13yDz75LE4nC3ybnYsito7nhwhcmp?=
 =?us-ascii?Q?wkJpnxVNcxBNkAihVuNh2CwRFqK8UdQUjzDgPj2wnsxC0bEvuojTVV1Je27D?=
 =?us-ascii?Q?2Ft9MZmlKoTfCQySJTOdA0sdnrlgikr2xRz3hVdsx45vVrOEAQXcq7mjTqv9?=
 =?us-ascii?Q?a+UTZXbexVGg6Lik7mb9Z69ngS9zL7koRbcSSjhF7zVluXTaIIex8SVGHiHE?=
 =?us-ascii?Q?5iS9MNvXFqDBKOvT8Gx+Zp8b8TSox/bBQnqGOqaK38YyaqAUvJJH2mAtZQBs?=
 =?us-ascii?Q?lQZUtf9rlCJCvQByqqkl34u+dx86GNLxb/GbZ+vfIuaTHDMnxzqnbmWaYoAn?=
 =?us-ascii?Q?9PBcr8yNj3l3JTfdZHpRzmD443Aevx+TZIweNSVxZI2jYDP2dy4EtR+iG/KO?=
 =?us-ascii?Q?ZCDUKUhaNKxj9g+iiprNfS7AsY6+J4jj58I5QkB8MA0gOusUi6meW4QKY4kO?=
 =?us-ascii?Q?JAlI5iQjn4n2ap352pAaR/tr/DIUVq0XRL1RjUPa4HkyAhiUZCeCjUHAl9Bg?=
 =?us-ascii?Q?4udIDTYevaID6XAzI+zk+qvgnzzmThWxb8rk4CiGJkz1Oq/arFMFA2GkKn5/?=
 =?us-ascii?Q?eg5WutM/FMSdM4/UinA+IuRBBTP5oIA3ri2eoeuRUZOAeNM0ZaPKaS1nnR+a?=
 =?us-ascii?Q?oIxDn7TRxpqsEzI8RU+R3SIbdUOH9W3G76VkzSh97LGqXoKcuJ9kXsPD/Yjy?=
 =?us-ascii?Q?lbILi5TycEuK8I8X0345q1b5m0/l+hE=3D?=
X-Exchange-RoutingPolicyChecked: Trwc4aGtN/dDMYKEMvCqxLoWsvWhGiOGTUo9KlRSIq+UjlrMc6ahLnaiP2YgU2KgmNu20ky56H7c/FHTvyHp91L6CeI9EeCzaOaj7rsrJ6CkAmeBFwGktRgDN1165KP4XiDU6qIvh96OVz+kSvaJaioK0/I7Q9BPXiTExKsjjJC5Fewft08V7fC/zqHXJVwd4uM3ACjaUcGN/SA6jq8wB5EGYAc59o6c7Z4QWIGCWORva3g4OS+iI9dFZqi/gl08/icBlY6FOorpxAx6GvUSFH17bJJI2oRqV/+MMoKee412QcSOrkTEiZ1ZzGOFT4aO/Uc/G2nbZ0FsVnmAxOGWbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7f8683-e370-456c-91e2-08df1fb961fe
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:41:59.2238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qs+LEPVj3v0C+gb9XWJ9pOidMry3LJQbWyFNS4joLc91aCHMfO30SWySpWCaoLfXgIc5BzboSvmWVB7Y4VNVTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
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

On Fri, Sep 25, 2026 at 09:06:14PM -0400, Rodrigo Vivi wrote:
> On Wed, Sep 23, 2026 at 10:11:05AM -0700, Violet Monti wrote:
> > On Tue, Sep 22, 2026 at 06:21:21PM -0400, Rodrigo Vivi wrote:
> > > On Tue, Sep 22, 2026 at 09:56:08AM -0700, Violet Monti wrote:
> > > > A new PCI ID for PTL.
> > > > 
> > > > Bspec: 72574
> > > > 
> > > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > > Signed-off-by: Violet Monti <violet.monti@intel.com>
> > > 
> > > I honestly believe it would be better and faster if you had just reviewed
> > > the version that Matt sent yesterday instead of resending it.
> > 
> > The reason for my resubmission was to rerun the CI results after a KUnit
> > failure unrelated to the PCI ID change. Matt is out for this week, and
> > delegated this patch to me to review and handle in his absence. Since I
> > am not the owner of the original submission, I was not able to rerun the
> > tests using the resubmit.
> > 
> > Is there a preferred method for re-testing patches that have been
> > delegated, such as situations like this?
> 
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> and pushed. Thanks for the patch and diligence.

Matt, please accept my apologies, but I just noticed that I pushed the patch
with the wrong authorship.

Violet, next time you are handling someone's else patch you sign it off, but
never ever change the authorship of it if you haven't modified the content.

> 
> > 
> > Violet
> > > 
> > > > ---
> > > >  include/drm/intel/pciids.h | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> > > > index dff389b56eb3..32c88a690ad8 100644
> > > > --- a/include/drm/intel/pciids.h
> > > > +++ b/include/drm/intel/pciids.h
> > > > @@ -880,6 +880,7 @@
> > > >  	MACRO__(0xB08F, ## __VA_ARGS__), \
> > > >  	MACRO__(0xB090, ## __VA_ARGS__), \
> > > >  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> > > > +	MACRO__(0xB0A1, ## __VA_ARGS__), \
> > > >  	MACRO__(0xB0B0, ## __VA_ARGS__)
> > > >  
> > > >  /* WCL */
> > > > -- 
> > > > 2.43.0
> > > > 
