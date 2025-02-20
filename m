Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673BFC021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 21:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ED910E9E2;
	Thu, 20 Feb 2025 21:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQ9BnjKs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EE210E9E2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 21:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740085747; x=1771621747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i8OU2nBb2rWX89sCEUO2UbfzlqNtjFkPIgOiOJDjSeg=;
 b=aQ9BnjKspFhJlNox7qLXvZ8eD5j1Hz6WZEWnyGjcAxtiIPaKHS1Wfdjv
 m9y3dNgVHPTNEwQbdeJT2KB+WLKjKsFq2MUJibzeER3PnTJLxxj4uvj1i
 Tv4ptYwqmnHk3ue+TwucVjZtsF1TAClUQ6fpK7zAmfVwGvoojMXYpnWLt
 CGmuDcpbd7/Kjit1ttQApRUP+I+XLs6oYL7KFw6K0O6htEpjfOZmWCUSp
 PVhj0XtuWLWxn3SjWKdxStlcFITYUCiUHHpR56l7HFOHeCyujKPCHAF3A
 L1dBVm18ewHUO/JqANOKTBjCzCOIGwJdYcG8ihKR9bA+DGSTV32e2XSX0 w==;
X-CSE-ConnectionGUID: /b9tnvLkQCyoct+6jdjefA==
X-CSE-MsgGUID: QMcl8QTdTZaXmtAA/06wlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41151468"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="41151468"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 13:08:48 -0800
X-CSE-ConnectionGUID: pzR11M8uTaWdOAzbDnNuKw==
X-CSE-MsgGUID: irpdxZXJRl6WapdlAF2EOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120403018"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 13:08:48 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 13:08:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 13:08:47 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 13:08:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioH+9ZIXJSVvwYwkkT+aPO0MXMxKHa45scGlJH6maflqVy43Sog0leMH7J5o0eoLR99sfPxaueXIYgpr/KKXlbD+VnGOzQj20nsWSVD46mn1DKJD/8LUJ9C3Tq/Re4LTtg9o/Nm8ZCFmla6l3OSkWog+PP882kNC7wg2zIUBqd6J4iiNeLyTw7ASQpb8+lmdGZuJ1oN3yPlq5g21BvwbvY0aBKWqYlz1Pq0tfHU7gRYOE6etUcHyWF+/WtHaRS5wOLmzMmgPFBRRbiSJ4hZgI2smigNhZfA12s32LbPBD0Cpo4iaeY66cDwSp33Fo9NK92d5Oofn/g8Ue5nApAx7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkgNDxbojkRZYWj4Bc7VfNNvWlToZVkxazZAZP2mEeo=;
 b=Ao0lii+oDn3nGEYfXSD7EQgfpk+Wu/HNfidacCt9NB/Noz7cfVzmAAVZ072JILbR/qCK719ok0JNP7gLtcrDWuk4A9Uq06yMpd0R+9QhuB7hNB0ZQl62NzIDKZBvzfm//5QmzROM6eZQddABwch/9Ifnw6uSc+Wh3EkB1V7+qxT6PlNUtkLmRzTDDL26VHQ60DKJ26eHUMJQAxgy0KJrfP7h9UB7iCQDKf7bKOy87EpcvMCWlyPSeOXT0x9pDlJp4Fj7aBPFE9zP8p7eu48j9zFH75FPufCXy+DHHsaIM0Qii6gJud8z9d5nRIiRVyinXtX70vRZLekJWV7Ss/Y8Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8319.namprd11.prod.outlook.com (2603:10b6:806:38c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.21; Thu, 20 Feb
 2025 21:08:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 21:08:44 +0000
Date: Thu, 20 Feb 2025 13:09:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page on vm_bind
Message-ID: <Z7eaGsUJQ6ci8hdZ@lstrano-desk.jf.intel.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
 <20250213022331.265424-2-oak.zeng@intel.com>
 <Z7YZGEgvzjY5mjN5@lstrano-desk.jf.intel.com>
 <MN2PR11MB4728C3F81D6F795E5C08AACB92C52@MN2PR11MB4728.namprd11.prod.outlook.com>
 <Z7ZDPMDz1UdFAsE7@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z7ZDPMDz1UdFAsE7@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:303:b8::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d43507-69eb-4a0a-1b18-08dd51f2c246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MpOM/Clqbmb6dY2entxMyqhugCuJ0sF4NENCIIFuFMqprT+yWtJ64yUMOFAi?=
 =?us-ascii?Q?43vHt3Aj4fmzUJOuLklf+fmrV+opnQNhuh2itmXQ2/8Nj0dxTEcfUzzv6JGe?=
 =?us-ascii?Q?Z2U9pQU1Z/HGPZ6hYsDk5W4panKF4ee5jJJMboVkCzRHx2arxzgDHz5caVQE?=
 =?us-ascii?Q?S1PFZ/1KVWeqcMgTZxsUmsNA7VyjOWPJDm++QYvGCz5e5xX5uH9yFWA3/Avx?=
 =?us-ascii?Q?kxm+a7T4I7ruUvV9WwO2IcztxmlKU4wwvrAY+bAteAmSAJxdcqyqKduWkJex?=
 =?us-ascii?Q?ddUDM/sbZb5kLQXO2qjBLy88vObdXiRSiHU9YPadoHnnFUZqWk9r47kTVAxR?=
 =?us-ascii?Q?LKSTZJnyzFXHvjwEZw02dcOnWIPW7wyGCVlPb35usdOGBEKRSvQ23q1zg+0k?=
 =?us-ascii?Q?Aj28nISbJbTUhqe+A1PJhwGUIYS3tbJ5jtXAPa7dz3sMc+onjgBZqwbFR9b0?=
 =?us-ascii?Q?WlizamMMIEEVqSDraXjBPh3HPevYrLk0Eiaeqn/2mVNudWMUc2O4TNFeVXOY?=
 =?us-ascii?Q?f4kUjh8+hf8b79o/ynTw87PVuAuxj1jCbHViMw+wjFYvsaQe4pYuw4zUbnwy?=
 =?us-ascii?Q?jSJij++JIM5rztkUHCcOunznTYv/dVs4hr9TvCLkYvg9/ivSxt4o14L78yXD?=
 =?us-ascii?Q?OKfxJZf3SVuSDf3lCtEy8gtQcnLs6zdY8JY4qqCuEy89sJWI50khTVPBs0VR?=
 =?us-ascii?Q?28pwpQMMnYiLO+6j92wAliYTkH1whxL8pSukVFvhJYE+jDtWpv5SAYalCc1x?=
 =?us-ascii?Q?kPVq+ZVL/nay4X+W2OQLmELBJBPSl050Sz6Bw+w0FUk90pnnPf0v0jQkW43H?=
 =?us-ascii?Q?JdQoHkg1p3jeg2COAe5MaDLRTmhM846z0eIBe0AKOFJVzkSYBh93KwxDJxzz?=
 =?us-ascii?Q?zpT894oQqO76Eduxh4c7zpQyuKUV4xmmo2wxrG7T3XO8vThDqEB3lj2cXKNd?=
 =?us-ascii?Q?5DJl5lXJCtE9OsiKQ+a3rBnmgTcBg/xYk+10DDfn+Ug+tZh8bRm7+uVPjpBA?=
 =?us-ascii?Q?ArXcPUFA2AKtMaRn7sqBF6VqptAisufX71V/YsIFq8h5QH17NHgvcyK/o2Q5?=
 =?us-ascii?Q?jD9X30pnZktXa+HgZm7rG5cJcX6nNzIAownnSUfXbHUw5UjxdxhoSPHHrozZ?=
 =?us-ascii?Q?qZ4+GS30yEHNjff5+llhmqgcHlx12vka03nimH++FB+vDQRJIpSkNC2NEsSL?=
 =?us-ascii?Q?gMT4eQvHQ143Y9TiUBU7TdU8ADXlem4L00B6UAhHYg4HFWIX/cqN7LCj6S0L?=
 =?us-ascii?Q?oVSKXCRwrzloVBfb5EIEElHD0lw70W+I2yRfJD+WA7+5SyzuwkJYNRmDo90l?=
 =?us-ascii?Q?IFCSay9qLrzoiVTIZ1/Bnejk9X21tMk4+5VQ/H/rB6pCytckKypDhjA7f4Id?=
 =?us-ascii?Q?JzjdWoNVoNWD4a23mfpTAxjO2i8w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nDwr9Oa/uVnkR48XXpCYebdm6o8tPY5sj0mdkX8XfFThHQl1+SoBYq1EV4eW?=
 =?us-ascii?Q?oelE5yKJQcVG0DpzvcQDm8/sKGUQGLkKLcz+4LPPMJONgg72UADIildDLhzS?=
 =?us-ascii?Q?s19hQtlTCDWitC1Rinh8WFSM7gCSY6lWb0PYKpXjCop+ECfXwQwm0U6ZblsR?=
 =?us-ascii?Q?5MBNqREWECnhOpTQ/gvcS5aV5A8Y6VUpq2+vKNlRvanNK5UA9Gg/RU8w8YIv?=
 =?us-ascii?Q?SaZsqKht5E3nvt10C0gGPV1xgecC2I8h+s3aNTaMr1uzQ25ThuKm2avmPpBW?=
 =?us-ascii?Q?poq5NaRiq2y6fPBcOepdcAN8kjnJeRgqH+V0vRAAMtxaE9QR9YahSUWo+2ud?=
 =?us-ascii?Q?uT93AGmXfwCyQJkwV/vMQVTRAp4ToPp45A474H+1GlIjQYlw8XmuF1zlVTOQ?=
 =?us-ascii?Q?4HawZDhWo9bgCAijVDCuf/Uilx81RN7sedtEuWaRwChNmV9o4uNBQl4mYJvH?=
 =?us-ascii?Q?PGCfN9UHkT5Mhunv1vaUzG36sLMoxkedZIQxapWLYnWy6lyQAOpFIQgMyo70?=
 =?us-ascii?Q?sSVWO0U5U9qUi7OjHPXEnWh8BgHaHOQY1C3Dg2TiIkLKtOpRJiq9rq8xMswN?=
 =?us-ascii?Q?F/be3YCHli2S7TzETtwvjkkmoudPqMFsC/qZXLl+p0CTqF3RYIwNPFw6LOT1?=
 =?us-ascii?Q?vFtL7QqPODQeD0IutsqgwIuxPx4dC4IHa9t7m1Rte88fivCJpDnmmiXHfW3Y?=
 =?us-ascii?Q?d2VI2WtcC15hde+ht/J8tpKPh7IPZ7SRPl3Cv9I+492CrAqpg6AXaziJhqeQ?=
 =?us-ascii?Q?/yHiv4w5JiOAz2lJxVTtEp6aD4HYOIU6pmOOMuWAJ8Nyt3tNzC4iwDL+xXcy?=
 =?us-ascii?Q?B+wpiVQuJ7tPFJ7UMXzfbK5NATyXC5qhTD7ISBx2vIk+kXtCnpFgcq7VEskF?=
 =?us-ascii?Q?iAJZyNspwS6bYxjbbrrOGEmVEKgR/5QkAWWN7ehdoXmpVmpJwGNXoIuj7kK0?=
 =?us-ascii?Q?fkMJ4dsO12h9Ar9p6ue5+LuH6QPA8NWxze0SMB0bg8XcgdQxEFGCxVX0Fqph?=
 =?us-ascii?Q?eEas0CSHzrxy/dUlsH+KJB23VUQRyOyS3awf8SWXFIrxQd63pJF+xKVCoS1D?=
 =?us-ascii?Q?G7uY7o8N63rQN9siT/BokP1473vfnFnfjyBsBXc7GkuSF5M2VuI4+hkCbj4y?=
 =?us-ascii?Q?U44jIG6Jmja6e5gVxuLbUxlh5hq5dIhccYgv20jX02XAtPe2ZOPc1RECKUSr?=
 =?us-ascii?Q?QNDfUbUNiZSNhsT1Mq/ze2rYcIyYRvHzhdYfavzNowdEGXfRjCF0/E1ixkz7?=
 =?us-ascii?Q?vYwtyCYXvrj1BFNPGxzuxpZ/ofJ0pwllcDKzkNVbbvue2Vau1Kdy8Y00sib1?=
 =?us-ascii?Q?gxBfQ3dEDGwzlmt3t3zzdVg2euttbNYXI9gXl5KvmDiZAxWgakwz29X5+v8F?=
 =?us-ascii?Q?rM9excyx6Yg7zhtzCxlL2D/1DChAEtIxTCu3I9ZORoTckHeY3WY09bvxptGE?=
 =?us-ascii?Q?i3yZwVc4IlxMrKCIPtQySav5Tsn8AQ5xDaCboleY1NeLbdAP1Vxu/mwsI6cs?=
 =?us-ascii?Q?MEn7Hcl+ZEip3rRuHikNGqbmjifanXvsU/KykmdDCMChxo4jcfu7fLg82LfD?=
 =?us-ascii?Q?1YJM8Znx2raHAEv5XIqb2QMFqVzospmFLwXKiK1FvEZutkJg99weSRJQvwm6?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d43507-69eb-4a0a-1b18-08dd51f2c246
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 21:08:44.1865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QS/VttjHycWPBVEP9mhxtWmX85G9bI1yqRpdDRMRp8E9AoAOxP6yA2Nhjd4zWsIy9KXtiol8v89cnjAFM5NiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8319
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

On Wed, Feb 19, 2025 at 12:46:52PM -0800, Matthew Brost wrote:
> On Wed, Feb 19, 2025 at 01:19:10PM -0700, Zeng, Oak wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: February 19, 2025 12:47 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org;
> > > Thomas.Hellstrom@linux.intel.com; Cavitt, Jonathan
> > > <jonathan.cavitt@intel.com>
> > > Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page on vm_bind
> > > 
> > > On Wed, Feb 12, 2025 at 09:23:30PM -0500, Oak Zeng wrote:
> > > > When a vm runs under fault mode, if scratch page is enabled, we
> > > need
> > > > to clear the scratch page mapping on vm_bind for the vm_bind
> > > address
> > > > range. Under fault mode, we depend on recoverable page fault to
> > > > establish mapping in page table. If scratch page is not cleared, GPU
> > > > access of address won't cause page fault because it always hits the
> > > > existing scratch page mapping.
> > > >
> > > > When vm_bind with IMMEDIATE flag, there is no need of clearing as
> > > > immediate bind can overwrite the scratch page mapping.
> > > >
> > > > So far only is xe2 and xe3 products are allowed to enable scratch
> > > page
> > > > under fault mode. On other platform we don't allow scratch page
> > > under
> > > > fault mode, so no need of such clearing.
> > > >
> > > > v2: Rework vm_bind pipeline to clear scratch page mapping. This is
> > > similar
> > > > to a map operation, with the exception that PTEs are cleared
> > > instead of
> > > > pointing to valid physical pages. (Matt, Thomas)
> > > >
> > > > TLB invalidation is needed after clear scratch page mapping as larger
> > > > scratch page mapping could be backed by physical page and cached
> > > in
> > > > TLB. (Matt, Thomas)
> > > >
> > > > v3: Fix the case of clearing huge pte (Thomas)
> > > >
> > > > Improve commit message (Thomas)
> > > >
> > > > v4: TLB invalidation on all LR cases, not only the clear on bind
> > > > cases (Thomas)
> > > >
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pt.c       | 53
> > > ++++++++++++++++++++++++--------
> > > >  drivers/gpu/drm/xe/xe_pt_types.h |  2 ++
> > > >  drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++++++++---
> > > >  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
> > > >  4 files changed, 70 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > index 1ddcc7e79a93..319769056893 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
> > > >  	 * granularity.
> > > >  	 */
> > > >  	bool needs_64K;
> > > > +	/* @clear_pt: clear page table entries during the bind walk */
> > > > +	bool clear_pt;
> > > >  	/**
> > > >  	 * @vma: VMA being mapped
> > > >  	 */
> > > > @@ -415,6 +417,10 @@ static bool xe_pt_hugepte_possible(u64
> > > addr, u64 next, unsigned int level,
> > > >  	if (xe_vma_is_null(xe_walk->vma))
> > > >  		return true;
> > > >
> > > > +	/* if we are clearing page table, no dma addresses*/
> > > > +	if (xe_walk->clear_pt)
> > > > +		return true;
> > > > +
> > > >  	/* Is the DMA address huge PTE size aligned? */
> > > >  	size = next - addr;
> > > >  	dma = addr - xe_walk->va_curs_start +
> > > xe_res_dma(xe_walk->curs);
> > > > @@ -497,16 +503,19 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > > *parent, pgoff_t offset,
> > > >
> > > >  		XE_WARN_ON(xe_walk->va_curs_start != addr);
> > > >
> > > > -		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> > > > -						 xe_res_dma(curs) +
> > > xe_walk->dma_offset,
> > > > -						 xe_walk->vma,
> > > pat_index, level);
> > > > +		pte = vm->pt_ops->pte_encode_vma(is_null ||
> > > xe_walk->clear_pt ?
> > > > +				0 : xe_res_dma(curs) + xe_walk-
> > > >dma_offset,
> > > > +				xe_walk->vma, pat_index, level);
> > > >  		pte |= xe_walk->default_pte;
> > > >
> > > > +		if (xe_walk->clear_pt)
> > > > +			pte = 0;
> > > 
> > > Is there a way to move this clear to later in the pipeline? e.g. At the
> > > step which actually programs the page tables via a GPU job or the CPU?
> > 
> > Isn't the design here generate all the page table entries in this stage_bind stage,
> > And actual programming of page table using cpu/gpu just focus on writing the
> > Page table entries to the actual page table? From this perspective, it is more
> > Natural to set the entries to 0 here for clear_pt case.
> > 
> 
> Yes, but for userptr an invalidation can occur *after* the stage_bind step.
> 
> > Of cause you can do it later, but it is at the cost of sacrifice the design.
> > 
> > 
> > > I
> > > ask as I think our userptr code is broken for invalidations which could
> > > hook into clearing to fix this. 
> > 
> > Can you elaborate how the userptr invalidation is broken? Is it broken by this patch?
> 
> The existing code is broken. One option being discussed to fix this is
> convert a bind to an invalidation at the very last stage of the bind.
> Checking here to see if this viable. Hopefully Thomas and I agree on a
> plan in the next day or so.
> 
> > I don't follow here. As I understand it, the userptr invalidation doesn't go to this 
> > Stage_bind function. It goes to xe_pt_zap_ptes. So I don't follow how userptr invalidate
> > Is broken...
> >
> 
> It is about if you have large array of binds and single userptr is
> invalidated between xe_userptr_pin rather than restart the entire array
> of bind just convert the single bind to an invalidation and fixup pages
> in the rebind worker, exec, or page fault. The code tries to do this but
> it is wrong from security standpoint and may have a possible UAF.
> 
> Anyways let me get back to you once we figure out the direction we want
> to go to fix this - we may land on just restart the entire array of
> binds when this occurs making my comment here irrelevant.
> 

After some further thought, I will be fixing userptr issue converting
userptr invalidations which raced into PTE clears at later step in the
bind process. However, this is a rather costly operation as it has to
search the OPs list to do so, so I think having your solution in this
patch for expected PTE clears also makes sense. Sorry for the noise.

Matt

> Matt
> 
> > Oak  
> > 
> > 
> > Also I think prefetch for SVM could also
> > > make use of this too.
> > > 
> > > I believe for this use case this patch is correct though.
> > > 
> > > Matt
> > > 
> > > > +
> > > >  		/*
> > > >  		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> > > >  		 * this device *requires* 64K PTE size for VRAM, fail.
> > > >  		 */
> > > > -		if (level == 0 && !xe_parent->is_compact) {
> > > > +		if (level == 0 && !xe_parent->is_compact
> > > && !xe_walk->clear_pt) {
> > > >  			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
> > > {
> > > >  				xe_walk->vma->gpuva.flags |=
> > > XE_VMA_PTE_64K;
> > > >  				pte |= XE_PTE_PS64;
> > > > @@ -519,7 +528,7 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > > *parent, pgoff_t offset,
> > > >  		if (unlikely(ret))
> > > >  			return ret;
> > > >
> > > > -		if (!is_null)
> > > > +		if (!is_null && !xe_walk->clear_pt)
> > > >  			xe_res_next(curs, next - addr);
> > > >  		xe_walk->va_curs_start = next;
> > > >  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K <<
> > > level);
> > > > @@ -589,6 +598,7 @@ static const struct xe_pt_walk_ops
> > > xe_pt_stage_bind_ops = {
> > > >   * @vma: The vma indicating the address range.
> > > >   * @entries: Storage for the update entries used for connecting the
> > > tree to
> > > >   * the main tree at commit time.
> > > > + * @clear_pt: Clear the page table entries.
> > > >   * @num_entries: On output contains the number of @entries
> > > used.
> > > >   *
> > > >   * This function builds a disconnected page-table tree for a given
> > > address
> > > > @@ -602,7 +612,8 @@ static const struct xe_pt_walk_ops
> > > xe_pt_stage_bind_ops = {
> > > >   */
> > > >  static int
> > > >  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> > > > -		 struct xe_vm_pgtable_update *entries, u32
> > > *num_entries)
> > > > +		 struct xe_vm_pgtable_update *entries,
> > > > +		 bool clear_pt, u32 *num_entries)
> > > >  {
> > > >  	struct xe_device *xe = tile_to_xe(tile);
> > > >  	struct xe_bo *bo = xe_vma_bo(vma);
> > > > @@ -622,10 +633,19 @@ xe_pt_stage_bind(struct xe_tile *tile,
> > > struct xe_vma *vma,
> > > >  		.vma = vma,
> > > >  		.wupd.entries = entries,
> > > >  		.needs_64K = (xe_vma_vm(vma)->flags &
> > > XE_VM_FLAG_64K) && is_devmem,
> > > > +		.clear_pt = clear_pt,
> > > >  	};
> > > >  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > > >  	int ret;
> > > >
> > > > +	if (clear_pt) {
> > > > +		ret = xe_pt_walk_range(&pt->base, pt->level,
> > > xe_vma_start(vma),
> > > > +				       xe_vma_end(vma),
> > > &xe_walk.base);
> > > > +
> > > > +		*num_entries = xe_walk.wupd.num_used_entries;
> > > > +		return ret;
> > > > +	}
> > > > +
> > > >  	/**
> > > >  	 * Default atomic expectations for different allocation
> > > scenarios are as follows:
> > > >  	 *
> > > > @@ -981,12 +1001,14 @@ static void xe_pt_free_bind(struct
> > > xe_vm_pgtable_update *entries,
> > > >
> > > >  static int
> > > >  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> > > > -		   struct xe_vm_pgtable_update *entries, u32
> > > *num_entries)
> > > > +		   struct xe_vm_pgtable_update *entries,
> > > > +		   bool invalidate_on_bind, u32 *num_entries)
> > > >  {
> > > >  	int err;
> > > >
> > > >  	*num_entries = 0;
> > > > -	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> > > > +	err = xe_pt_stage_bind(tile, vma, entries, invalidate_on_bind,
> > > > +			       num_entries);
> > > >  	if (!err)
> > > >  		xe_tile_assert(tile, *num_entries);
> > > >
> > > > @@ -1661,6 +1683,7 @@ static int bind_op_prepare(struct xe_vm
> > > *vm, struct xe_tile *tile,
> > > >  		return err;
> > > >
> > > >  	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> > > > +				 pt_update_ops->invalidate_on_bind,
> > > >  				 &pt_op->num_entries);
> > > >  	if (!err) {
> > > >  		xe_tile_assert(tile, pt_op->num_entries <=
> > > > @@ -1681,11 +1704,11 @@ static int bind_op_prepare(struct
> > > xe_vm *vm, struct xe_tile *tile,
> > > >  		 * If !rebind, and scratch enabled VMs, there is a
> > > chance the scratch
> > > >  		 * PTE is already cached in the TLB so it needs to be
> > > invalidated.
> > > >  		 * On !LR VMs this is done in the ring ops preceding a
> > > batch, but on
> > > > -		 * non-faulting LR, in particular on user-space batch
> > > buffer chaining,
> > > > -		 * it needs to be done here.
> > > > +		 * LR, in particular on user-space batch buffer chaining,
> > > it needs to
> > > > +		 * be done here.
> > > >  		 */
> > > >  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> > > > -		     xe_vm_in_preempt_fence_mode(vm)))
> > > > +		     xe_vm_in_lr_mode(vm)))
> > > >  			pt_update_ops->needs_invalidation = true;
> > > >  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
> > > >  			/* We bump also if batch_invalidate_tlb is
> > > true */
> > > > @@ -1759,9 +1782,13 @@ static int op_prepare(struct xe_vm *vm,
> > > >
> > > >  	switch (op->base.op) {
> > > >  	case DRM_GPUVA_OP_MAP:
> > > > -		if (!op->map.immediate &&
> > > xe_vm_in_fault_mode(vm))
> > > > +		if (!op->map.immediate &&
> > > xe_vm_in_fault_mode(vm) &&
> > > > +		    !op->map.invalidate_on_bind)
> > > >  			break;
> > > >
> > > > +		if (op->map.invalidate_on_bind)
> > > > +			pt_update_ops->invalidate_on_bind = true;
> > > > +
> > > >  		err = bind_op_prepare(vm, tile, pt_update_ops, op-
> > > >map.vma);
> > > >  		pt_update_ops->wait_vm_kernel = true;
> > > >  		break;
> > > > @@ -1871,6 +1898,8 @@ static void bind_op_commit(struct xe_vm
> > > *vm, struct xe_tile *tile,
> > > >  	}
> > > >  	vma->tile_present |= BIT(tile->id);
> > > >  	vma->tile_staged &= ~BIT(tile->id);
> > > > +	if (pt_update_ops->invalidate_on_bind)
> > > > +		vma->tile_invalidated |= BIT(tile->id);
> > > >  	if (xe_vma_is_userptr(vma)) {
> > > >  		lockdep_assert_held_read(&vm-
> > > >userptr.notifier_lock);
> > > >  		to_userptr_vma(vma)->userptr.initial_bind = true;
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > index 384cc04de719..3d0aa2a5102e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > @@ -108,6 +108,8 @@ struct xe_vm_pgtable_update_ops {
> > > >  	bool needs_userptr_lock;
> > > >  	/** @needs_invalidation: Needs invalidation */
> > > >  	bool needs_invalidation;
> > > > +	/** @invalidate_on_bind: Invalidate the range before bind */
> > > > +	bool invalidate_on_bind;
> > > >  	/**
> > > >  	 * @wait_vm_bookkeep: PT operations need to wait until VM
> > > is idle
> > > >  	 * (bookkeep dma-resv slots are idle) and stage all future VM
> > > activity
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index d664f2e418b2..813d893d9b63 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -1921,6 +1921,23 @@ static void print_op(struct xe_device *xe,
> > > struct drm_gpuva_op *op)
> > > >  }
> > > >  #endif
> > > >
> > > > +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm
> > > *vm, u32 bind_flags)
> > > > +{
> > > > +	if (!xe_vm_in_fault_mode(vm))
> > > > +		return false;
> > > > +
> > > > +	if (!NEEDS_SCRATCH(vm->xe))
> > > > +		return false;
> > > > +
> > > > +	if (!xe_vm_has_scratch(vm))
> > > > +		return false;
> > > > +
> > > > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > > > +		return false;
> > > > +
> > > > +	return true;
> > > > +}
> > > > +
> > > >  /*
> > > >   * Create operations list from IOCTL arguments, setup operations
> > > fields so parse
> > > >   * and commit steps are decoupled from IOCTL arguments. This
> > > step can fail.
> > > > @@ -1991,6 +2008,8 @@ vm_bind_ioctl_ops_create(struct xe_vm
> > > *vm, struct xe_bo *bo,
> > > >  			op->map.is_null = flags &
> > > DRM_XE_VM_BIND_FLAG_NULL;
> > > >  			op->map.dumpable = flags &
> > > DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > > >  			op->map.pat_index = pat_index;
> > > > +			op->map.invalidate_on_bind =
> > > > +
> > > 	__xe_vm_needs_clear_scratch_pages(vm, flags);
> > > >  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> > > >  			op->prefetch.region = prefetch_region;
> > > >  		}
> > > > @@ -2188,7 +2207,8 @@ static int vm_bind_ioctl_ops_parse(struct
> > > xe_vm *vm, struct drm_gpuva_ops *ops,
> > > >  				return PTR_ERR(vma);
> > > >
> > > >  			op->map.vma = vma;
> > > > -			if (op->map.immediate
> > > || !xe_vm_in_fault_mode(vm))
> > > > +			if (op->map.immediate
> > > || !xe_vm_in_fault_mode(vm) ||
> > > > +			    op->map.invalidate_on_bind)
> > > >
> > > 	xe_vma_ops_incr_pt_update_ops(vops,
> > > >  							      op-
> > > >tile_mask);
> > > >  			break;
> > > > @@ -2416,9 +2436,10 @@ static int op_lock_and_prep(struct
> > > drm_exec *exec, struct xe_vm *vm,
> > > >
> > > >  	switch (op->base.op) {
> > > >  	case DRM_GPUVA_OP_MAP:
> > > > -		err = vma_lock_and_validate(exec, op->map.vma,
> > > > -					    !xe_vm_in_fault_mode(vm)
> > > ||
> > > > -					    op->map.immediate);
> > > > +		if (!op->map.invalidate_on_bind)
> > > > +			err = vma_lock_and_validate(exec, op-
> > > >map.vma,
> > > > +
> > > 	    !xe_vm_in_fault_mode(vm) ||
> > > > +						    op-
> > > >map.immediate);
> > > >  		break;
> > > >  	case DRM_GPUVA_OP_REMAP:
> > > >  		err = check_ufence(gpuva_to_vma(op-
> > > >base.remap.unmap->va));
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > index 52467b9b5348..dace04f4ea5e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > @@ -297,6 +297,8 @@ struct xe_vma_op_map {
> > > >  	bool is_null;
> > > >  	/** @dumpable: whether BO is dumped on GPU hang */
> > > >  	bool dumpable;
> > > > +	/** @invalidate: invalidate the VMA before bind */
> > > > +	bool invalidate_on_bind;
> > > >  	/** @pat_index: The pat index to use for this operation. */
> > > >  	u16 pat_index;
> > > >  };
> > > > --
> > > > 2.26.3
> > > >
