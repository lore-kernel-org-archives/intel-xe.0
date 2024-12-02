Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C523D78337
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 17:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0C610E222;
	Mon,  2 Dec 2024 17:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCpIuwot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF1410E7D4
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 17:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733159712; x=1764695712;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DMHpa01mPFZ5s1/JM4dRRhhJBf0RDK4x7Vi2koDvXIA=;
 b=eCpIuwot6uPABPUe9w8Xsvsnv0f6LbII0IpXUil/w64/jl3AQ7kWI9+1
 gse6tz+HqY9ACjGngV9oVWnbh7PVIgWlHITcGU4KXQECj4LSiVYGYjNvJ
 3+8uWP5dlZG4oHVrdEl+vywY5Ls8r+jQA8GjgwgNq2JWwQCbTGcyvgJ6S
 H8eacXS3ZvCF+ZOrUA5yuzTVOSSPmYaUAvEcEtBqnveLnUMA5PUrUjGlL
 aOIdp+dcuY3j3Qqt/dBLcZLTJQuT0v/Y91Ov+pwc+j+xVWWqgSt8i6yXd
 D4ELPKSRXKYkKuAqL3KiTVkvXRNQzbxDVNgGSMsvOjCk+ItlmeWFpuIY2 Q==;
X-CSE-ConnectionGUID: gA9h6KWwQh2kmK4gPAvidg==
X-CSE-MsgGUID: PPROjc5XSvaeiLwRp6aNNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37004986"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="37004986"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 09:09:15 -0800
X-CSE-ConnectionGUID: JvYauDeTSAmYrBnUB6IFGQ==
X-CSE-MsgGUID: l1o61L0LQE+AH2xo/EZa1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="93486571"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 09:09:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 09:09:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 09:09:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 09:09:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayfQvQZDEX5hc9t7HnXr1n7x+aSZg7VyJ/lYwMecZRaq6S4BEwVdbT60AkhVHMeohypQG8o0mOZrSbpPM5Ta52sEOPPhEqYBGVhsOBWr7KF1UWnWVEKfYDbTI7/ogAnrVnfPtiVb0u+gQwgI/e/bjIXDZ8O1XFp/L0xtcJoeROAgzefpI0Xabb/Mdye+u0gqqYBCtMWCExWsBlsN/7V7zoJL/t6Lzi96BLU6gvokA0Qbp6AVPCwc5OX9DhLJPLKXbPpBLzx1cRSBKSDR41RRIFMb5O8h3w/wFFLNApDxcEzstbumAX89j4OLgK25ySJ9LYHp+bzgScUtlAa7T5qr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Msg4o7oM2ybsXJbvVtWPt7f4UlknegD24CDNTJpqm8=;
 b=qSgz8kRbG5oKKbsjSCQXm4VQ0+i3/17WAxyAZQ4iireQJq6ALKuKlEPj0XXKFNf+GAJjbE3q3gNNPFvUcZyn7VtJQCez3oecYKFefALLdZLsx5KuioX/ywkfVqJWtOtHlax4KKchDyopEo/QtyW+ylssHNatWZIZ9Sp1WqYvsPWADPWlXrBtwQXwGnZREN85CEa1GgbltlKCuI5KleluyIGmaoZsVoGVkbXrQeHMWLYS+E/R87E5L5WvEtA2WCDhzkBRsZUho7RolcH/j3DhbxMnm8LJJE39tlxsBEDQUy91VI8M42nbgG2x7ZrUMWxSURRzII2BsqrY8IJecH2RbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6797.namprd11.prod.outlook.com (2603:10b6:806:263::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 17:09:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Mon, 2 Dec 2024
 17:09:07 +0000
Date: Mon, 2 Dec 2024 12:09:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <Michal.Wajdeczko@intel.com>,
 <ashutosh.dixit@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe/throttle: Log throttle reasons
Message-ID: <Z03prv3v2LZUzRfH@intel.com>
References: <20241129074300.1304068-1-raag.jadav@intel.com>
 <9f227ba3-4f59-418e-bd20-dbb462aaccc4@intel.com>
 <Z02941ro8eHHTxTM@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z02941ro8eHHTxTM@black.fi.intel.com>
X-ClientProxiedBy: MW4PR04CA0243.namprd04.prod.outlook.com
 (2603:10b6:303:88::8) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: e4378024-7eaa-45c0-5021-08dd12f4081f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CtgzhSO35gFiTCdvfIFWGAM+Vr2MgqJOVK3dMaPLw5GmffFcNnUFykX5E9N8?=
 =?us-ascii?Q?SsPgvmqeSiawGXbX9e4UckRimiwwCwhMuEgSKhI58/Cx/PXB3eS2QBq+P+fR?=
 =?us-ascii?Q?JcFwYxMOqGIGuC5adIRChIGpsHHkOW7bxhXEC7f5lcGWyu6W0DLvpKEraJPO?=
 =?us-ascii?Q?LGmM+o8y8yDdQx9jt8XNX3tP019npA3hNuBHjm/GmJ+O70IP9xUOOHru45le?=
 =?us-ascii?Q?DhcdZu91POfWgFoA/n54R6amDVNZZOXb1ftOHGA/o4w7asLx2cGv6zqdpxWY?=
 =?us-ascii?Q?EmMXmX/X9WHQNsdwU+0YhrYe9lTbloLEAewPRdXO3Y0lzLsRGVfm1mnJ7zVY?=
 =?us-ascii?Q?SFnoIv9XLJBP7cUszkh5qY21rOTYJ7p9qDU8q1bsqRDcwp821xrQHyYeVgXT?=
 =?us-ascii?Q?sMa+m/WnkNBtILtneMgvuaiUlhKv5Zj5gxbMJwgIGVii9ejhU5ZOsafUsIu6?=
 =?us-ascii?Q?3ppEC+bXF/e5jLx20rcC+seIcB13cqL5e7J7sOTRikSDpu0l9BsNFa7jAYZe?=
 =?us-ascii?Q?zSEK7ixqiDsBKfHlz1ziNI4ynL0+01XCEE2qtUZ4onUf21cgcpPrfb90UNYY?=
 =?us-ascii?Q?gEb79etXwflGVqgw0p/gCEcpFcrugnrEf9uei5eXs1L1m7HynuT2hwd4Ge9G?=
 =?us-ascii?Q?d+3mt23M4bX6SCdmXsTpclfuP/10fo2zHWbaPbbOp6PS04vChmAsk0l9Pw8x?=
 =?us-ascii?Q?lwZ2/evdUvJx5QOEiKuvqCJgaCYGFdK36Fx4PnX9HW8iQp/2yf53tzObWFps?=
 =?us-ascii?Q?MiSZYxndePuewetB1l5pVxBYXhrGhoW89e+onVDqyYfru+CpUeXrgawzQvAT?=
 =?us-ascii?Q?YxxtQ9FAKA+fGrpzm3fpSQPnxyPndkUCaIuS5vJcXHNW6P4TBj582uxoMeyp?=
 =?us-ascii?Q?DRmI+RtgWXEGcbk764ZUNBncj2RKNQGIleMlEokHWIFvLcaJzRSTEIUPiaCe?=
 =?us-ascii?Q?pWJuVGSxIbaWxBUSJMJthkNzMvpWfSmRgtuUsnGvXD3UAzwgPwvfWe+S05Ma?=
 =?us-ascii?Q?pGnvcuirWldc9MtcPkBlntRt8djtawqdb2ZAq0Q83qxaUyNM+45um5qIViXB?=
 =?us-ascii?Q?PxNT5hpfeQE+tbLWsjDPPtyFwNt8kuoPDnAj6vvJZV5y63gxLiWTe/7lDwEQ?=
 =?us-ascii?Q?3OOTEfDNhResr/j7L2SfV2OotFL8C0jARoME1NdGzjcn7e/XGKtAuSUfMPK5?=
 =?us-ascii?Q?s5A00R8JTkqolOTxNgtjyGYMTHuYcf4XECOLvyOr4VeqVQse0xYx++l2Hzxx?=
 =?us-ascii?Q?PG6tUWqaxsT3rNQ9ZbufntfPYqbF+4e8d4AgpbvUWS2N6D1A4Wa6mrwV8CRT?=
 =?us-ascii?Q?bPHOETn10rdwqtwq5Sr0fZSGZITopXXzva7QUehaKKcw5Qasv4Pfs/RCMvv5?=
 =?us-ascii?Q?pJGItHw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VSwoC7AemPeEhai/eeKcjkWsuRhNx/ebD0A7BB0WdPsln/7mQV2ZVe5SzwWV?=
 =?us-ascii?Q?A0fB1w77ovApGKRBKzrImkWWapjsctsTpJfwo5Y+GTpSwJPStbkbIAkyOhTB?=
 =?us-ascii?Q?P3ZMJMTyZy4HEBRADVD0EbxWp+8/64KhucbbI4l5QtkxF1I5zH/THMpKRBNf?=
 =?us-ascii?Q?lP0LflvE/bDOigqJMQQ5KGRRolPWEdXrD454nqPNa/Fw5BOFjXpt3Ez7krtg?=
 =?us-ascii?Q?FlxGd911CnhfM5e9lSixZwtgN9sw8yQ9x4scRqFPpmS6DSzdNl1yGCo8wM+n?=
 =?us-ascii?Q?zYwXNMV8mtdlmkJ7J66EidgI/7oY28XfBy/pprQTKBV78YDcRycD5N6n87pR?=
 =?us-ascii?Q?wJCkFXm9M3nvsnmtfUbHe+KdnAGvyIbxpKKELqHddGJyvJiabftx6Nlq8njq?=
 =?us-ascii?Q?+j5VlO7DyZJxIquefDVuTSsEDwnYfICasp0DoCv9ckzzz2PF0qOBWsHTEjYX?=
 =?us-ascii?Q?TZ6+KSYkdipNoXdwS1YBNKJPetIT7NvzdiENB1M4EP4eCptEZRfL5W4IsAVI?=
 =?us-ascii?Q?SsiJFQoXcwhQaVJgOWMRT2g8pa/XXmc+oLR1h+FAH+qh2xCyFeTffF06aH6k?=
 =?us-ascii?Q?UkR0ZKGQdn8v7hOU//4ulhMoJXSMqhkobFZIWy2XA0wAnLfUuklkeygqrABZ?=
 =?us-ascii?Q?1zmikxYNAVYhhbgsNT3dWVhNDxER3enONWc8ZGOwMlPvc8JxOGpZ4UwA7LSb?=
 =?us-ascii?Q?m/Din2tx7GC+2ThjRHmDkibfBp5V87ld9byZ9Y1QLmHqk9w+3weVSKARStXT?=
 =?us-ascii?Q?nNS67k6NinhceSyreHHtM2I21QgbSHqWq/a53TMPsLJtJ+hbKzhAAZ4yjv3/?=
 =?us-ascii?Q?krOCv6OPltmrt3IEfDHFIDSMdFgd7DakRYRMUTwvb8+mCS3mZtzCVvEHuIXu?=
 =?us-ascii?Q?/y6cVFGjoJ0gLn8GM8mAny6jqiLWDv0KZEmy/B0YQFh9W01dBV4I0w8PeBEa?=
 =?us-ascii?Q?TlCWODTSxxVLwwjhhRQWv/2qukxXdwsNTtpMRfl4DtnDWXft/mdm04pbjPqY?=
 =?us-ascii?Q?SBBX1FKoJMI2xYC6IlmWPxM8Oh3XeBce4U4x9OwC0PUgT5QLR+Wp7vikW9WT?=
 =?us-ascii?Q?MCSrr9Gfs3yH4InVIUjAgGwIvLYvChXB/Gv75z9SKUJJcSrNY1RE4FRuNFu1?=
 =?us-ascii?Q?b2dejDV9RsZ5ojZbG4squnkafAIf1QXqJdinCtWh5D0z//gvLmCns4EYdpGs?=
 =?us-ascii?Q?/T/wrNQ3YT9XRGih/a4K7lX62XDuyrW+ZY3o79hEm0ASkngRWYdMOgB9Ik7D?=
 =?us-ascii?Q?WZH4APjS86J7jEJo+8vUtUUk/Q0pgPWZgHSqwWswdhKIYib6Cy9xz4OZzHJc?=
 =?us-ascii?Q?ZwH+pA7GQgjC54r/nLEFZgUZytT7gtnYrk0r1lH3DM3z3FPovke7b4hv/xoF?=
 =?us-ascii?Q?d6Rvvcbb6msrd/v4wQ+Q2m0mM+peMCIu7ZsVe6udCWketyxtJuEplSJt6GzA?=
 =?us-ascii?Q?b61Byswesyos/ckY7GqmTovtJINdvT5lzkIMn6UysfXwO9ESFdAljRnze5H1?=
 =?us-ascii?Q?Wyw9xMlzmbgWHYTCLzCRUsQLbKvZCagKeF42Gb2egcYKVmlU70YqkkgmCvuH?=
 =?us-ascii?Q?Bmm9xebUvhkOYxXeDwq8XiErffcqDPF38DKcMrgu/WrpUIFNO6fPPIDqjCjp?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4378024-7eaa-45c0-5021-08dd12f4081f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 17:09:07.8159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fu9w7rYm4+tn3PLrlZSqSzHTu7mNYskkjFwfnJ0vL4AT0O7TI6WqszQCKAELC6xF9IKV74PswoJqna9kdHJ3yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6797
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

On Mon, Dec 02, 2024 at 04:02:11PM +0200, Raag Jadav wrote:
> On Mon, Dec 02, 2024 at 12:20:45PM +0530, Riana Tauro wrote:
> > On 11/29/2024 1:13 PM, Raag Jadav wrote:
> > > Log throttle register MMIO reads which will be useful for debugging.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Looks good to me
> > Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> 
> Thanks.
> 
> Rodrigo, can you please pick this one if it's okay?

done, thanks for the patch and review

> 
> Raag
