Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3D5D36102
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 18:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C81010E425;
	Tue,  5 Nov 2024 18:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsypzaMN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5624110E425
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 18:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730833014; x=1762369014;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7KlNTBMz9QF2nD9uCbiKWJre0eT5BNLmsmAVRpIwMPQ=;
 b=GsypzaMNL+lYkTGeg34yKxeXRqeb9U8YwQqZe3CGYuuEkRhW32wax5XB
 fh2nNfwZQyEmc0THFGJu/qxxl9jvi2lsnmFxSHsU3RwkYmAOndqv3usFQ
 FxSJ9HZygqu8REr0PBoncmM/lyNPv4eqHSmAghELNLvbxIylqi9jL4IJv
 2bLAzBDWOBjvMD80WNGLk1wWviCCaW6f67usfFFC3v6ZWtXzLW6R5Q4pI
 gqLVyBM00g8PnXOwJo1rD1K0e4Tb/as0WkCb+2z0y+pUKUiiLPHnlCUXy
 M3VzIhD/rSFwmvttCQMKFbgmckkgw51ZPYrw3jq7plZWuqcFCbwJxuBrm Q==;
X-CSE-ConnectionGUID: AVW/r5ROQ22aEFP4UzQwKA==
X-CSE-MsgGUID: SR96TEIbSdqgJqQ7X6fkfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30557180"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30557180"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 10:56:53 -0800
X-CSE-ConnectionGUID: BqX1JPRcRm6BcE5XY3Wu5A==
X-CSE-MsgGUID: vu6tdWkrTZSF9SgUpUu9cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="84082843"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 10:56:53 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 10:56:52 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 10:56:52 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 10:56:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgLcuX1h18dlPsYl2V1VrzhdFi+6QJz3Uh19g9abqEw5FTc/2kNw0b8TDwOU0Lqe0T9LlVIq07sm33lS/Mcm/AEVBzYY283G+RbM5Jvz1fBv7R9fqXF0DJUMv09P2smxLWRL5ak8FWUCA54cVuAYkmOv+J1ALmU+M/3HGwOBgTQK1+qmVulXQK6JR1VMJ6CV4Ln0AGXuZ1S9KhPFhD4eNZvNTYOcbHWSvBJIDbX5oAlPtkb5+UbbOCG82zJGy8+Q4Bboai+hp9gsvcqF6nbrP7cpv84Z5uA2SCktOQ1emUMfYRNUr7m+YVItZTqs4Vy7aypw28XjVNdOi7yDz4sIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+WLDSjGTfGhSJkz3/++ZLPZagK7VzLgtCfssof+/ek=;
 b=euJkQW1X5/BvdRvqbk0CctkCXjVB0o8HR/+Qyq9DOCZLc4vWhgHW4pkA8Au3INF5oHQx6HtK0/EBSe/OEgBMki5fpfrQnkeFy/E+qhSIeCcMY/KLf+xj7Q36+G/491+uSy+OnZIXgiUkSlHpEC9W8lAEROUhPs0Sbw9chUlOuhN64LKn55XWVO6g4ZKpftx2DfQAvc7IJGqUab2I4vEAnQtg1Xj8Ncg1Lmg6hfwdTWb19Qrrrm7xUSRq/0nLC35x9AXqtbTjzLe3LNnLvWxP8r/4HtsYtHYqk0wgkHQsN5w8tGb/fsqv8kz3gfzlyXnWK7HMdsHkIJv2Ug1jgK4mSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6326.namprd11.prod.outlook.com (2603:10b6:8:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 18:56:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 18:56:43 +0000
Date: Tue, 5 Nov 2024 10:57:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Add read/write debugfs helpers for GGTT node
Message-ID: <Zypqis6jym2nBAt6@lstrano-desk.jf.intel.com>
References: <20241103201633.1859-1-michal.wajdeczko@intel.com>
 <20241103201633.1859-2-michal.wajdeczko@intel.com>
 <Zylrsw40oX0fGVU2@lstrano-desk.jf.intel.com>
 <e88b6d0e-c433-42f4-896b-cad5da2b061b@intel.com>
 <ZypYapAzDwD+pzux@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZypYapAzDwD+pzux@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW3PR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:303:2a::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: a74cea96-5e54-41f4-8f78-08dcfdcb96c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pM9JUz7B8HPcVu/F9h7GIsaRLVUl8MDffCgMxgYaAXyC5AhDh3pU8nx2A/Dt?=
 =?us-ascii?Q?+PGUjzf6S9JOWcjnYdjmNMTeanmHH+cY19AEF3Ec+iVZ7vPAUjN7CxpDM2GV?=
 =?us-ascii?Q?ilEUTlIeZdfV1MZyhLuKmYUrJYx0e12PQRHH0pZu0ukVmR/CSNxfs50Kyz/N?=
 =?us-ascii?Q?2h31nzAYRK8s7NoNcrrSAzEP3/VmKL0NfZXFX+4cq/WwPeddH+0Vjoglm2ZB?=
 =?us-ascii?Q?w/Yjg6+7xmszIMdW2bN3f7cy2eeFKo+vYel7AD8TXW2u/Xbe8KebWmAh/Ep7?=
 =?us-ascii?Q?36AmN6ZPx78L26vRIIjFfYxZgVH+FReKNBDG4S/oO6C2ZjkmzF0PkNkj+bDT?=
 =?us-ascii?Q?MHCkk276eCzV0A7wOtaAXV1jRVL2Ec0s6klbbuCI1pvisN31NeHGfnqKHMta?=
 =?us-ascii?Q?RPOtAahQ/jljkOg+zS0E+SFV3f9BJrVMPzfw/5alGstcyEXBT28wvyNY6jVh?=
 =?us-ascii?Q?zvl3u4PGhqyWUtynMsLAv0Vpj0O5RFfP5jOXXHfmNIHa+yCqTOQSF7c/Rjqz?=
 =?us-ascii?Q?gGAPeIqi7SCjjllxl3c9iJ8v18i7tmLPmW9BwRURdW8E1xkrLQx6z/w6bKQd?=
 =?us-ascii?Q?xqZyY4uiVyUCHZx8R6l2vDvAtZWyRyDPMARC3I9tJWp7kQ7I/HnoTofm6cuh?=
 =?us-ascii?Q?nNoMdDE02WfoYFu2tEf+UQxKQjC/8Bq7TFjdt9PvMQ9++YJb7VRCsyeGh1pS?=
 =?us-ascii?Q?pbPJPszYP1RA+XRIiBqGhnrz1z/dAecp6Gq0qUhIANL9mJIxKHGQ79DsyYAi?=
 =?us-ascii?Q?oyNayGNesRSjz0U+MYJd6juP/z+f9j+9c54TRrXuHldwYAz/+q0IxBQDSajE?=
 =?us-ascii?Q?bhivnoMHukIoUxforfvGb8QtSCevNrc5kTMyOEI30I6z4jp4/ZaDyXbllTQq?=
 =?us-ascii?Q?ijaVQ3ljDi+1RUzMzNH4AKbO1INfRjMa8ANclP1Y3/g8xa/sCMdU0Z3e97Vg?=
 =?us-ascii?Q?7OjqNEINXUy2AKInZVvj3vVWfgMieIq7EuTt5QmYSFzggy5k2wU8MChwaFYu?=
 =?us-ascii?Q?B0JSxccbWV48P0XY54P0Rsbjim2G7ot0S830kW0k555h7mijTnuxPgKQQ1wx?=
 =?us-ascii?Q?u6/8EHbyyYyfk5HAdLuM618Ep2LmfcJSnmrCj/iloTb4L7zc16wLjyFLVUtR?=
 =?us-ascii?Q?nWROXQvRYeHuB2hOg0NDTZvO4/Cv6Hyk5JzAsF6RaSIPzDCImhIkVM615WHH?=
 =?us-ascii?Q?78n9agsePdFzfJ0rqQwZpOJDtxL+GH+GcZTFICjeMX3q99Hd9iWLgRqAIEdc?=
 =?us-ascii?Q?b7Oyp/3NSDsN8haBkTUY7Vw7xKG+BQEam/P4YWR56w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j426CARWvRtgfLSKtehO0K8A9ej0AOLmTSKehUeGApgnrBZHcbb6/8K3VhQ6?=
 =?us-ascii?Q?vMrwede24j99f9bg9chEq0oUP0+Yf/GS7ec8gkJarn+/iAHulguJaYH52KJm?=
 =?us-ascii?Q?DnyfZ5z7d1N4UaysJSHOxN8zOEwkpdY0SN3UQ0Kh74YTnlplHF9etQMOxy7H?=
 =?us-ascii?Q?HaVEPKhyPMSv0JvwH+qUzvTCNSKC9jw4DARwCq+foApzfep/LGXpcYWHhDn2?=
 =?us-ascii?Q?sG8gJnS5H6adCGaeU3RvL3vTbGSsOqTcC0r5gTc5NcsvGCC8teFkS8SHRFqy?=
 =?us-ascii?Q?Omh3VRhMPt/EkjkkYteSHTX6LLb8ZP3C08ujtMKcSG0ms8mYTvkplD0M7KWy?=
 =?us-ascii?Q?/Hk78lcCo8NqzSRKnKSam8cx+fCZTlVL4rT7rL0ZjYGu+SJGmMmjByH/2r+L?=
 =?us-ascii?Q?B9ZZ9r/xr5Lc4awxKkSKCZBJsM/UI6b/Y/Rt7doAC6qR16OWu/Ogr3M7Orar?=
 =?us-ascii?Q?RTanQb+PAjuSlX0k/LO/hfUC0RLlF4NF3itJOt3XLcjn+Y6Mc2ereQZ0ZFB/?=
 =?us-ascii?Q?c7zlp7TqvByfL2SB3Gnl1BO5P5SyGfOHkQvEdU0JRIc5SN7WSTJWWslXMgNK?=
 =?us-ascii?Q?dbE3+J8CJk6Fc0l3iKe1O+9Y2J3rgnFMsYHV9kqOGU7bDrOcfNEPe92P6e3/?=
 =?us-ascii?Q?Z6hHRojdRF2mXraKdrUt73QM0UP+ob+lbmI4LotQw7dOmcT62xHNzRPeYsPr?=
 =?us-ascii?Q?dqvNKNAe+qhbPsE6E2hEae6OU45vDTVT1lEnyHkuGLOFZRbIgW0kJgDruCAT?=
 =?us-ascii?Q?MS3DApy+ANSrFkdNWbRkuVrGj/AtC8IjGpl8d/5hTWxH5LdkxvJLT/0UxPO+?=
 =?us-ascii?Q?qs9pqDCc9vzS6J1rb362ogpiuI6XI6M3qic7Cq/Lt6b53kX1g00r9U8AsSoz?=
 =?us-ascii?Q?PaTjvAJoDSNm7pIP0EeMevWRltB+MqsQrw9kV0xL4iYQKETLcmJmkIowT+Pp?=
 =?us-ascii?Q?RmAblAACCHYn5XzVzzKCTkEeuCfHEHc3fvMayZAXG97A9GN5IbmS73jIgabt?=
 =?us-ascii?Q?AiZkztV1zEad3/A1y4U14kDGZT7jV+1/QFDmvXmjEmfoBTEN8jrWS+8Ax4V9?=
 =?us-ascii?Q?PhfMXHMkb3JTQMHkYOR57BxIApxMnTGh4JnGMr5u3NGmNVh5w0a/OvIq6veM?=
 =?us-ascii?Q?NGbiehgnVh0n+yDfbHUgbpB3NpHSCxEpl9G1Zox79TEcB/Wzh8jE222zXC2x?=
 =?us-ascii?Q?FMj1id2OrdeMIh7aCDwyxX/pR8yOiMPw3Myo0b5Na1743RHfHNerq9gxf0GA?=
 =?us-ascii?Q?ATE1TjWQKUDJ+BaYZaOHBXuUkEDttJ2WGUQk5CzwqDFCrDdu3S2FJ7xR7izU?=
 =?us-ascii?Q?NsnvvhN6VsjNbsKWWFTl+wGsl9SE4rwN0GehwbMZGKzu1An7gxys9d+/Okiv?=
 =?us-ascii?Q?NpuM+CVYX9d9CZrgEN0o7D9C8lSRAj1urhfL+YxpTovHRFWIZDsbpOBTG+Hf?=
 =?us-ascii?Q?whLZ4/K60kbFm1gzRcGmhU0HOhz4ovMcYzq7rSgoyKYg5+EpCxyItksStgS5?=
 =?us-ascii?Q?h8TQFy9kRqNncvVCyVzKKNcCSPgHEyncFGWWVvYLMLo+lKYpAty58HIJoKzE?=
 =?us-ascii?Q?1FTPeJ4RKFoRxOXxvLIlqOJi3V9vZd3ScqCD7T7GWesIRSXyk3fRAKToDiSk?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a74cea96-5e54-41f4-8f78-08dcfdcb96c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 18:56:43.0960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkGxOMRWqlcjBUSocRBiz5hEju4jODXOuocgwAk/ojEY0Cd+KBYw+9RhmDbmOHO6ycPRZlPSouIi209kPVnudQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6326
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

On Tue, Nov 05, 2024 at 09:39:54AM -0800, Matthew Brost wrote:
> On Tue, Nov 05, 2024 at 04:25:50PM +0100, Michal Wajdeczko wrote:
> > Hi Matt,
> > 
> > On 05.11.2024 01:49, Matthew Brost wrote:
> > > On Sun, Nov 03, 2024 at 09:16:32PM +0100, Michal Wajdeczko wrote:
> > >> In upcoming patch we want to allow copying and updating PTEs of
> > >> some GGTT nodes over debugfs. Add simple helpers for that.
> > >>
> > > 
> > > On the surface it very much looks like are reinventing something that
> > > almost certainly already exists or if it doesn't we should try to do
> > > this in a common way. Have you looked for any similar code to this in
> > > the kernel.
> > 
> > There are similar copy functions in sound subsystem [1] under CONFIG_SND
> > 
> > 	int copy_to_user_fromio();
> > 	int copy_from_user_toio();
> > 
> > and some time ago [2] I was trying to define generic read function
> > 
> > 	ssize_t simple_read_from_iomem()
> > 
> > but that didn't get any traction at all, so this time decided to start
> > with local functions, as otherwise we will not move forward.
> > 
> 
> [2] is basically what I was thinking. I understand the challenge of not
> gaining traction, so I think doing a series with local functions to
> achieve functionality seems fine. In the long term, I believe [2] should
> be revived, as it appears to be the correct solution, and I think we
> want to avoid Xe maintaining code that could be shared.
> 

Forget to add - maybe add some comments in the code indicating that we should
follow trying to do this in a common way so this doesn't get lost.

Matt 

> Matt
> 
> > Note that some other attempt to make code common [3] also actually ended
> > with local solution [4] that was merged to drm-xe-next.
> > 
> > I'm more than happy to define those new helper functions in fs/libfs.c
> > but without wider usage this will be just another dead series like [5].
> > 
> > Michal
> > 
> > [1]
> > https://elixir.bootlin.com/linux/v6.11.6/source/include/sound/core.h#L269
> > 
> > [2] https://patchwork.freedesktop.org/series/133507/
> > 
> > [3] https://patchwork.freedesktop.org/series/133123/#rev1
> > [4] https://patchwork.freedesktop.org/series/133123/#rev3
> > 
> > [5]
> > https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/T/#u
> > 
> > > 
> > > Matt
> > > 
> > >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > >> ---
> > >>  drivers/gpu/drm/xe/xe_ggtt.c | 178 +++++++++++++++++++++++++++++++++++
> > >>  drivers/gpu/drm/xe/xe_ggtt.h |   7 ++
> > >>  2 files changed, 185 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > >> index 558fac8bb6fb..e003f5f51ac6 100644
> > >> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > >> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > >> @@ -838,3 +838,181 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
> > >>  
> > >>  	return total;
> > >>  }
> > >> +
> > >> +#ifdef CONFIG_DEBUG_FS
> > >> +
> > >> +static size_t copy_iomem_to_user_by_chunk(void __user *to, const void __iomem *from,
> > >> +					  size_t count, void *buf, size_t size)
> > >> +{
> > >> +	size_t chunk;
> > >> +	size_t rem;
> > >> +
> > >> +	while (count) {
> > >> +		chunk = umin(count, size);
> > >> +		memcpy_fromio(buf, from, chunk);
> > >> +		rem = copy_to_user(to, buf, chunk);
> > >> +		count -= chunk - rem;
> > >> +		if (rem)
> > >> +			break;
> > >> +		from += chunk;
> > >> +		to += chunk;
> > >> +	}
> > >> +
> > >> +	return count;
> > >> +}
> > >> +
> > >> +static size_t copy_iomem_to_user(void __user *to, const void __iomem *from, size_t count)
> > >> +{
> > >> +	char chunk[64];
> > >> +	size_t size;
> > >> +	size_t rem;
> > >> +	void *buf;
> > >> +
> > >> +	if (!count)
> > >> +		return 0;
> > >> +
> > >> +	size = count > sizeof(chunk) ? umin(PAGE_SIZE, count) : 0;
> > >> +	buf = size ? kmalloc(size, GFP_NOWAIT | __GFP_NORETRY) : NULL;
> > >> +	if (buf) {
> > >> +		rem = copy_iomem_to_user_by_chunk(to, from, count, buf, size);
> > >> +		kfree(buf);
> > >> +		return rem;
> > >> +	}
> > >> +
> > >> +	return copy_iomem_to_user_by_chunk(to, from, count, chunk, sizeof(chunk));
> > >> +}
> > >> +
> > >> +static ssize_t simple_read_from_iomem(void __user *to, size_t count, loff_t *ppos,
> > >> +				      const void __iomem *from, size_t available)
> > >> +{
> > >> +	loff_t pos = *ppos;
> > >> +	size_t rem;
> > >> +
> > >> +	if (pos < 0)
> > >> +		return -EINVAL;
> > >> +	if (pos >= available || !count)
> > >> +		return 0;
> > >> +	if (count > available - pos)
> > >> +		count = available - pos;
> > >> +
> > >> +	rem = copy_iomem_to_user(to, from + pos, count);
> > >> +	if (rem == count)
> > >> +		return -EFAULT;
> > >> +
> > >> +	count -= rem;
> > >> +	*ppos = pos + count;
> > >> +	return count;
> > >> +}
> > >> +
> > >> +/**
> > >> + * xe_ggtt_node_read() - Copy PTEs from the GGTT node to the user space buffer
> > >> + * @node: the GGTT node to read from
> > >> + * @buf: the user space buffer to read to
> > >> + * @count: the maximum number of bytes to read
> > >> + * @ppos: the current position
> > >> + *
> > >> + * Return: On success, the number of bytes read is returned and the offset
> > >> + * @ppos is advanced by this number, or negative value is returned on error.
> > >> + */
> > >> +ssize_t xe_ggtt_node_read(struct xe_ggtt_node *node, char __user *buf,
> > >> +			  size_t count, loff_t *ppos)
> > >> +{
> > >> +	if (!xe_ggtt_node_allocated(node))
> > >> +		return 0;
> > >> +
> > >> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.start, XE_PAGE_SIZE));
> > >> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.size, XE_PAGE_SIZE));
> > >> +
> > >> +	return simple_read_from_iomem(buf, count, ppos,
> > >> +				      &node->ggtt->gsm[node->base.start / XE_PAGE_SIZE],
> > >> +				      size_mul(sizeof(u64), node->base.size / XE_PAGE_SIZE));
> > >> +}
> > >> +
> > >> +static size_t copy_iomem_from_user_by_chunk(void __iomem *to, const void __user *from,
> > >> +					    size_t count, void *buf, size_t size)
> > >> +{
> > >> +	size_t chunk;
> > >> +	size_t rem;
> > >> +
> > >> +	while (count) {
> > >> +		chunk = umin(count, size);
> > >> +		rem = copy_from_user(buf, from, chunk);
> > >> +		memcpy_toio(to, buf, chunk - rem);
> > >> +		count -= chunk - rem;
> > >> +		if (rem)
> > >> +			break;
> > >> +		from += chunk;
> > >> +		to += chunk;
> > >> +	}
> > >> +
> > >> +	return count;
> > >> +}
> > >> +
> > >> +static size_t copy_iomem_from_user(void __iomem *to, const void __user *from, size_t count)
> > >> +{
> > >> +	char chunk[64];
> > >> +	size_t size;
> > >> +	size_t rem;
> > >> +	void *buf;
> > >> +
> > >> +	if (!count)
> > >> +		return 0;
> > >> +
> > >> +	size = count > sizeof(chunk) ? umin(PAGE_SIZE, count) : 0;
> > >> +	buf = size ? kmalloc(size, GFP_NOWAIT | __GFP_NORETRY) : NULL;
> > >> +	if (buf) {
> > >> +		rem = copy_iomem_from_user_by_chunk(to, from, count, buf, size);
> > >> +		kfree(buf);
> > >> +		return rem;
> > >> +	}
> > >> +
> > >> +	return copy_iomem_from_user_by_chunk(to, from, count, chunk, sizeof(chunk));
> > >> +}
> > >> +
> > >> +static ssize_t simple_write_to_iomem(void __iomem *to, size_t available, loff_t *ppos,
> > >> +				     const void __user *from, size_t count)
> > >> +{
> > >> +	loff_t pos = *ppos;
> > >> +	size_t rem;
> > >> +
> > >> +	if (pos < 0)
> > >> +		return -EINVAL;
> > >> +	if (pos >= available || !count)
> > >> +		return 0;
> > >> +	if (count > available - pos)
> > >> +		count = available - pos;
> > >> +
> > >> +	rem = copy_iomem_from_user(to + pos, from, count);
> > >> +	if (rem == count)
> > >> +		return -EFAULT;
> > >> +
> > >> +	count -= rem;
> > >> +	*ppos = pos + count;
> > >> +	return count;
> > >> +}
> > >> +
> > >> +/**
> > >> + * xe_ggtt_node_write() - Update PTEs of the GGTT node using data from the user space buffer
> > >> + * @node: the GGTT node to write to
> > >> + * @buf: the user space buffer to read from
> > >> + * @count: the maximum number of bytes to read
> > >> + * @ppos: the current position
> > >> + *
> > >> + * Return: On success, the number of bytes written is returned and the offset
> > >> + * @ppos is advanced by this number, or negative value is returned on error.
> > >> + */
> > >> +ssize_t xe_ggtt_node_write(struct xe_ggtt_node *node, const char __user *buf,
> > >> +			   size_t count, loff_t *ppos)
> > >> +{
> > >> +	if (!xe_ggtt_node_allocated(node))
> > >> +		return -ENXIO;
> > >> +
> > >> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.start, XE_PAGE_SIZE));
> > >> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.size, XE_PAGE_SIZE));
> > >> +
> > >> +	return simple_write_to_iomem(&node->ggtt->gsm[node->base.start / XE_PAGE_SIZE],
> > >> +				     size_mul(sizeof(u64), node->base.size / XE_PAGE_SIZE),
> > >> +				     ppos, buf, count);
> > >> +}
> > >> +
> > >> +#endif
> > >> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> > >> index 27e7d67de004..64746e23053e 100644
> > >> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> > >> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> > >> @@ -34,6 +34,13 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
> > >>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
> > >>  u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
> > >>  
> > >> +#ifdef CONFIG_DEBUG_FS
> > >> +ssize_t xe_ggtt_node_read(struct xe_ggtt_node *node, char __user *buf,
> > >> +			  size_t count, loff_t *pos);
> > >> +ssize_t xe_ggtt_node_write(struct xe_ggtt_node *node, const char __user *buf,
> > >> +			   size_t count, loff_t *pos);
> > >> +#endif
> > >> +
> > >>  #ifdef CONFIG_PCI_IOV
> > >>  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
> > >>  #endif
> > >> -- 
> > >> 2.43.0
> > >>
> > 
