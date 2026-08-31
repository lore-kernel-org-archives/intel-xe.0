Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C1AC624A4
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 16:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CA510E9FE;
	Mon, 31 Aug 2026 16:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="beJUQamQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E56410E9FE
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788194909; x=1819730909;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1KLVCAJqpKqkkAPnkvcnqhurliDpXjKgE69RRFSCzPo=;
 b=beJUQamQONNgNyhmRaf48GILJwZ5SuHtkNiEhmZnIaOhuHrg6i7pBkX8
 coIP+SFCrcIGDnDNWnBbOLH2ICtZ9fAADtvNdQGXzVoURVGUkHXZUl1ZZ
 C3ThQyOxHWUXG5eNoi0cYIN/mjP7KosM7YfJZhHSUAQ+GM4afxM0GNwz7
 fZSjPQCuqzkHa8DNg5/70HO0Gvv6MPNJL83HWUxxakDjEo8vFPXYS5sjW
 3kwlc7dPlD057snjh7lcPnLz9qceQ1lOWDx77CzeaAwGEpqN6QqDNwA97
 xVDI+Qrez380tWdSnWcDjjq0xHYSlHBWnlvk63+dl6f5JETnQvQfEdulN w==;
X-CSE-ConnectionGUID: aqkHHH51R4aUhtgCYz/DSQ==
X-CSE-MsgGUID: 9yhfqExuTzG7AJhbAdATiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88460238"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="88460238"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 09:48:28 -0700
X-CSE-ConnectionGUID: TqyVW1BXRPmYPYkk7jWghQ==
X-CSE-MsgGUID: Jc2vgz/SS/KyI3GUKQP+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="267039959"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 09:48:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 09:48:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 09:48:27 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 09:48:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/3WB5m4IskLbOjMtV5lN71CC0NIo3PbzCwB8pCY4qZ2EI7PnoC4VGiugSbn+UbSMx8B10IEXZxak6bPTiaMVi+Xy0XGoK2+wFfxPFPonW5bdThNffyU0nlTSIEj02wZZOSvJ2ryTm/3dKznJ/pzGFI+Aj9LrhQiiaeUW/Z+ehoH9TA4dmT1X9y9iXEZtZOHrwLANvETCk1h8nwJrTrWqYecixQZb2KxlozQworSCQDfFLhSQqqnWXBRC85ib9oERA6TOORE4//7Iwk+73dDVtpaN94wwnazrtBekGoTRms2COSu921Bv2TmeP74MfljiZZBKg1jiPIjSRvJDpFDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ws/KtKbbcBaTmqGlRj36JYHGpgMGm29LTpDSgYoVPzI=;
 b=tXO+y6Yzu5wYjvC2uqoLGpWFMkVpylccCBrhDIWTU9G34tmmKkBy8Q0mPhi6Lf3vf3SH6yBnYBN2yyutth9NJNvFHx7sThQHvP5SpyqbSb19BrEHhcUhNBDwNp6+I2qu33St/QfS6WP3ArhB03zZzW6tAwAnuYVLIbf7iGPAcBe4BwEjY8hJ+CnhLjML4sqXxiLM6NsVdaG+v5GTW4LcTuX3bSY5rUSo5xqolpl3oFbRXBoDo2mmAztHdZUDnzBKtOELKkU1OovoaFHJtiVVGGnhyJRTnf9Oe+7D/uPAC3PRamXv3rimckS+VF6yEwP7/z+tBpIG6VjbfhBSW7MU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH3PR11MB901483.namprd11.prod.outlook.com (2603:10b6:610:348::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 16:48:26 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 16:48:25 +0000
Date: Mon, 31 Aug 2026 12:48:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, 
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Increase timeout for mailbox power
 limits
Message-ID: <apWwVQkMUtIwRiIs@intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
 <20260729171546.3368457-3-karthik.poosa@intel.com>
 <ad776a91-9b0a-4a72-8b05-8890a7b5a4cd@intel.com>
 <2c61329e-a7d0-4524-b585-5d10fd970ffe@intel.com>
 <dc04b171-55dd-4a9d-9ba6-fb3960582e33@intel.com>
 <apUwOZpuO1kOhyVs@black.igk.intel.com> <apWIek2rVOLgbTre@intel.com>
 <eb8ea8ab-d465-4105-bb1a-db05ddf930ee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eb8ea8ab-d465-4105-bb1a-db05ddf930ee@intel.com>
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH3PR11MB901483:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eab26e6-dad9-4a35-3da8-08df077fad00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 62vyO5ZQwEhB87N+bgl8nOxhmHbHPj6PYvcGmV4Hs+tr44BNMPbnliGnWFtnxPbJPKxP50jIA0QQY/AGxVTu1i6tBjXCv/bUdt96YU9jblztOtAXRkLz15P7VMNlyp+aIM/6l3LnBg6ZvkycHEN48PZuXowmuuzM/kAbHo4bJLEd9fwhKVXZGyjN3Mfh3JihvOPPVvgnKgq/3mn8ES26xqTjSFW7HM86TAFkNHK2HOwl/sbM/UAKLnAsVIioDiEpCJqQKAchTz0oQZisYqtNjXb7Mdphc6CpZYgmyioYFg9rsPV6jMnxi2CvJ8Pvj8RNeCd4PtcGPg6k5CPossyXdKqJ0ObkLT6SXttbvuXtsnqjtrlA7qeib/xbWl8Ta3h2rAaIXXYIi3NOQcfurBqxJBHfUSu4DSNgz/Vhna4pt+eODOhTHmxpoycnZYto45498qYX8fzCMy9djDWmt9Qk8jLEQhSjMkR3gJLNBLj+hA5KvXyWRKloXJKJZuzQIBM2ZkE3lHTINBc/YZ3mAdvMuNjHXynQXqAfw9Ey2q3X/LBUTD0/oVXcc8BayGrhbWS1uCzV9v8j5m95MLxQS4rke8Pa7GnYji5FShwr60gUGhu27LaBu0b3deQU145cj1qeIkmva1d1rSX+eGQK7wSk+nK+3oDlH4RjlHQjN1Z5SjU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YRe0vdIAEHQcO2W3GSkmsIeHf67JIHTML8o2G9zpPLwPQgCOGWIGE26LB0YV?=
 =?us-ascii?Q?h1un1g9v5M+xit74in/F5vT/CgNdoDeHDgtqkqTQ90Gd0S/zDxM6G7K/Wl+U?=
 =?us-ascii?Q?InivHne8pRJgf6yGUnPdmP2h5ZzWNKFmk8U8lEmkZowcY4NUDoMgehhzK5mN?=
 =?us-ascii?Q?McN+9b0Xs7tmYOqN82ChiaQL2fD9fn2MwguuKqh5uyU6Sc5CRzNrH7zrlZDr?=
 =?us-ascii?Q?d92rhIdhXbHvCUBHoNxQjwLltJ23/ZJ4POrCrWCOTDVWHrKM6Mj6rs+qFy2p?=
 =?us-ascii?Q?TBQQPNsyKwsPnaG5YtBZ0jLCKBzgJEejjX9g6qX7xNS7meZ70iXAbmrd/hhz?=
 =?us-ascii?Q?BdXUT/Zk4VLXKcCkZHFywvF4WfFXU816L4Dzn2begpVR3r2d3zph3iA4vnc9?=
 =?us-ascii?Q?Jss235rAM7+Gv8kPX2dDKdTQoiC4Ls8+HDsjtlnGCHGWnZ3Pn3BUCxrIzEG0?=
 =?us-ascii?Q?xNzb5WS0l2VXmGr6zZonf9+2ttPwE2uq/l3Htrf865LcseaVcFOsHm5HZ3Km?=
 =?us-ascii?Q?GCkfmNka/b3l4w7UQTBXxNe8qYOKDOAcj7NKEF7S9ZVGUHMgNsAYkm0+qb/J?=
 =?us-ascii?Q?Sx54zBfW3Cd5myDl1HueZYiEtoq7+zAoBKUZAePfitLDvFYJ7e685MbLpLIL?=
 =?us-ascii?Q?FRfI+J+wN+JQKZBuebqfm+OuO5c0PTFZzVy4lVan/bgcDFvDXybThqi+4Hhw?=
 =?us-ascii?Q?M4YV3hBmxKqPXfEag879dQ7XW7m8pH0uq4KbGO8OzGoR1LXIHYbz0B44Q/Wf?=
 =?us-ascii?Q?Gqy+2nMIaV2HemwE4P77ZRtVuVZI+YxhyAczT1P7KOCiYVy2YlWOxWyKZ6GS?=
 =?us-ascii?Q?J1DLI5c82ifLAqvV4VJ9t9U8z0Lvv4xhnO8k22JpXYQGw7BfKCN9KMSmZK0Y?=
 =?us-ascii?Q?vR1cu4Q4PLs1rEpqdhYElilymj1ThLiyTy6HS5OUxumuajz8cah/FFvC7C1i?=
 =?us-ascii?Q?nBzOt9a706y4IQNFRX/WsEy1Al6yVd9ewiseZHHYwtZJdHk2/WZPuTLbXp8h?=
 =?us-ascii?Q?aBPTioqpXf42cAU7cj02IqDJA3qSmmyyTayj7r60MJIIB2+i5MgJb/ghtCeY?=
 =?us-ascii?Q?rtAoG+A0fhpHwykda8wVFAif/7P3CvcNEwZPTuB0oJyYGLg4RVoQ+MmhUlf7?=
 =?us-ascii?Q?N/58hXX2zjjj3Z3lDDhIioSc8nKPDsM/jhQ2KhA5m+RwAPfWdzb64LP8DD1+?=
 =?us-ascii?Q?n3Y6AeT6mEW77+XVMR4tOr0HvpvC22UV9YFjMTBTkDa0+V/j1kxmXr1X5QkD?=
 =?us-ascii?Q?KAJmbFlUihMmskLxfPp3JKQwyumPbzeI/Rem0G0wNrZtP4Sevn3GyjluWVKJ?=
 =?us-ascii?Q?Qu/YYVkih0R+bPN1KdDybVmH0cMweP/zF8z1qrwN4wOQ/3FRHPUEEGKVrBcs?=
 =?us-ascii?Q?PVdEJXJ/7R099YDWq1nxgw2AWxgfDdFnT46i915D8x8AGB49BH/hljdeRq07?=
 =?us-ascii?Q?G3tGb8JTwlAOp/6jYPwfu9FqlvGZXbLhkIHeYlRvgA3TDLhcg8slCzoV25sA?=
 =?us-ascii?Q?ETiyDCmVXpGE7d8npcNHYWIUWDUoDAh4g3TmFQubh2MflY+WUDJWlb00URk0?=
 =?us-ascii?Q?afrzCCqDRayxyDzba6U3Wan4TLC6YGJy/9a/ZkGl8DFNlayBxPRKRWtRXdKX?=
 =?us-ascii?Q?1MHRJLgVEHeqFazEfMcTfj01X1gfCUeebdYiuN494g/InLGLav56EwTMUyvi?=
 =?us-ascii?Q?tyJSWLTb7KlrFlsm817UcVL9dnr/YKfkKhno67zecjopNyY86kKqCeBN9ZGh?=
 =?us-ascii?Q?jWWA4sLxPw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 5Sm3LpaV1W290P2Qlj5MTFt7ZreAVY9cRX6WszEyEXnmz6lcLMQJXu/nxsva22v1KlKqqELTa41WOrFNLWSSeJVauWL4im/yCEgh22pXHjfu2M2S2G7pTMigpNXj8aIzvx+OMfcuRcCBSFBhBiuQd9VIyPs+EDwkvjaJXJWhfgCxJ1jtnPCiEhaluoGk0xY67RkJ/jgGaTm6eXK5DF9W8BYik5BDSEh+GMAAGX0jS7YMkoUKTWgOSOrVYkXExWmbNTuIG1+llDn8V/ckx6beI84h+RlIvZmL3afBAj7XddLPuVu6UahOGmVicduqxKX5Urn54vN6oprywdX9Iop3lA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eab26e6-dad9-4a35-3da8-08df077fad00
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 16:48:25.7305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gy85EGfHefHlZrwKSmd8dNMEUtEFUH30W8cjhQCSpgBUuySeXDDt0MkgM2N7di2g5DiA6yfktb5I/j2zFgMCWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB901483
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

On Mon, Aug 31, 2026 at 09:57:26PM +0530, Poosa, Karthik wrote:
> 
> On 31-08-2026 19:28, Rodrigo Vivi wrote:
> > On Mon, Aug 31, 2026 at 09:41:45AM +0200, Raag Jadav wrote:
> > > On Mon, Aug 31, 2026 at 12:39:50PM +0530, Tauro, Riana wrote:
> > > > On 31-08-2026 12:24, Poosa, Karthik wrote:
> > > > > On 31-08-2026 10:59, Tauro, Riana wrote:
> > > > > > On 29-07-2026 22:45, Karthik Poosa wrote:
> > > > > > > Mailbox power limit operations can occasionally take longer than the
> > > > > > > current 1 ms timeout, causing sporadic failures.
> > > Why?
> > > 
> > > > > > > Increase the timeout to 10 ms and rename PL_WRITE_MBX_TIMEOUT_MS to
> > > > > > > PL_MBX_TIMEOUT_MS to better reflect its usage.
> > > > > > Why is the timeout applicable only for power and not the other
> > > > > > attribute reads?
> > > > > Because the timeout is seen only with mailbox power limit commands only,
> > > > > default 1ms timeout wasn't enough here.
> > > > Any reason why this is not seen for the other reads?
> > > +1, these things should be coming from a hard spec with valid technical
> > > justification and not some random email asking us to do so.
> > Well, you have such high expectations :)
> > Sometimes we have to live with the empirical... while we hunt other teams asking
> > them to do their job correctly, of course...
> > 
> > Interestingly enough, I just found in some of the many spread pcode docs:
> > 
> > driver_to_pcode_mailbox_spec.html#mailbox-response-time
> > 
> > """
> > Mailbox response time
> > Mailbox response timeout shoudl be set to 10ms as worst case.
> > """
> > 
> > Perhaps we should simply change the default to 10ms.
> 
> Investigation is ongoing to understand why some pcode mailbox commands
> occasionally take longer to complete.
> 
> Until then, using the documented worst-case timeout as default timeout seems
> the better approach.

I agree.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
in advance...

> 
> > 
> > > Raag
