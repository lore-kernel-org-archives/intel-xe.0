Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05451CAC58D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 03:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD91210E29F;
	Thu, 11 Sep 2025 03:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKCHSdua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F2610E29F
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 03:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757562591; x=1789098591;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=637yM1waRFwNxPTV8cBbg8/S6dlo4KnsOSJjA811Nhg=;
 b=DKCHSdua4m4GUkZ4TozKA4dlvP6ztenkt1GW+bGREWV8zdFpKMcPz/VH
 VDcNhgunM3b8sVP2Jk1D+ZWaR9Eih3IKKO4yiyK1v8FFg0kEWLSzbDqVy
 6KMAVzWEw+VMtmKLOxt66MC4kdrCTutFmrrIDTOsSs+/KzcLY+DL5kNEv
 FsLDLRYrTkkJf+A1MPFCiDvkaYriGB4X/CPFBIvjTL9iHBofjOUeLVm0i
 6ZrKMLdE73zTVt1qzvOBcOHcc4MtbAzauM4zisYk+xlEtswJ30z05GjB+
 4KUoKyoun3XeqVUwNheAfMr6IzLXfNNHB71KK84XGLUB16EGD6ry6XVhY Q==;
X-CSE-ConnectionGUID: Xv/bpi6NTeGPsDkF0lfhzQ==
X-CSE-MsgGUID: AIZpaPgZTQCjXhHhj7Bhdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59959427"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="59959427"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 20:49:51 -0700
X-CSE-ConnectionGUID: dXC8CAyHTFinMIKSVou8tA==
X-CSE-MsgGUID: Cp7e4OUzSpSjPfggazVh9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="174015615"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 20:49:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 20:49:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 20:49:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 20:49:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvqUxG+Uig/ohuZE4tBL/q/q+fF3Wa78wm911D73pMUe9GOAq4X46/ydyH2LWUYZM56OPKlyqktjEZMYa57dc2JAWCEl7fMT/MFE1S9taONeSk+4HpGxh7FDE6CXiaKmUG7cPqIS2xC1WzMpDxLh/fRWzkznYnADmNjunrulhMRGbU7WW7EDng3JeP7FihJOSt6LzVXnRihtH6LXWMA0HO81DaDE5JwOXKpy3XXzJh8k+ElUjFeKdVH23l8Xrll5O2p7o3msG0KMXkSoFoS/UUdPoXVCrlCBv588SS/K+Rb7q5f6lmYp5FdX1/ajwGqXVVNGUQC/RgSU/QOWBnIjkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=637yM1waRFwNxPTV8cBbg8/S6dlo4KnsOSJjA811Nhg=;
 b=iMcvjH8P+zQjQ+8EpmQ92z9GOYoR78lUtTG7ot0ikm1+ZmJc8gZ5H4pYRY3w8aZ6bnKFUatu7mXkAr940blQ9WsrfSrU5bPQAVG215zqIrKfuisCxcmf2uXVmhFq/gaX9joUx5+3KarJVhfBPMvUFRJZOo83YEkvU5G1vA5i1bsbastnhIA7W9/KEg+VTXz25jnnTlyUdjvdwQM9Bfqt90DO/g/aBIvCrHK2ab9oIckMEa3o4UK6oiZD9IRkmFyJ6MJcM18CJPFfllTJ3AyC7G8QvpNDG2HdaUTq6JaV6QzWJJRVhv2RDra6pIHsL9XfK1okjuiZ2n5H7HF2wK1VXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB9494.namprd11.prod.outlook.com (2603:10b6:208:59c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 03:49:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 03:49:47 +0000
Date: Wed, 10 Sep 2025 22:49:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe: Prepare format for GT-oriented messages
 in one place
Message-ID: <2kvxmoytsmptuy2dlgtaze5ld4qq5bouuupsrhpy4tbuhxojwo@mko4syzewux4>
References: <20250909165941.31730-1-michal.wajdeczko@intel.com>
 <20250909165941.31730-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250909165941.31730-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0179.namprd05.prod.outlook.com
 (2603:10b6:a03:339::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e6088c-1a51-45cf-01b7-08ddf0e6405a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ftjgpaaeNL4V/xvzND7QBpgsFaeFhdGuv4oqnkY+a2dqEr00K0x/iiZ2srFi?=
 =?us-ascii?Q?yFDdYXWW61M/+kd6msneaUh7nQiEf1EYmqNiVqvgYtxy8VfKok63cGAXVQ6A?=
 =?us-ascii?Q?Zu1B8mQ7peZ/1DspO50Q9z4lmyCDRqnY1uFavF3E2FFbJb/8Y2KdleJBZJJb?=
 =?us-ascii?Q?P9b+1UU5Wy5xD9ONSi/UvEwRDCqTBqwDixr6Kupf8qreJIzYDWnh6utMI5PG?=
 =?us-ascii?Q?hOO1UE7uZeHQFwlWvRn7UMAy40f/qpm6SSDrUrk99qT56Cn/xwcG+nSgGpFr?=
 =?us-ascii?Q?RHRZWFbwN4R/N71XX0U0+o+n6w9oz6P3I/tayvQxAktRRVQifXKQwvn9Miro?=
 =?us-ascii?Q?bEbCViRBxuTzBwpnVIHxH+lejCYwAGJNocGw2ru2BHCA1Jk08h25sugLrBkD?=
 =?us-ascii?Q?sv6YepqqBP+5FueUQf2glcnKwoN86EAmrf4bo3T99/lNfvH7xGbiMxXRmwk3?=
 =?us-ascii?Q?85dtLcNjR86hcS4doX3TKb7asAWvN/lYtRJpjEDzEPracYD2HR5CemJ4wvaw?=
 =?us-ascii?Q?aT2+uFsctW1zPhadNZIzD+4DyqM/zLKsswhMRWYLdXLwEo7sMcbyipT1Tn/i?=
 =?us-ascii?Q?RpoZuhYA4D20iPByecLQcUehGcxI8XeceIk0+fFqEK7ibe2kSTdDhDBVjszK?=
 =?us-ascii?Q?ShZw7+Tz4vBi2mc17/x86MDdzqhVZTBqcJNz1EYdprgv0TrVerjyn4nBhp6r?=
 =?us-ascii?Q?hz5U+/n+8LBt8lBtYNS6hY/aLZSzB3IC7XG+skbGIUsz8+KIhls7Wcvyph1k?=
 =?us-ascii?Q?gcUS1rIMIezOGglBsVSbdDLUkr6MH8G+bI7DlBGXOxc3L+Lrm4knP2ba2Tzk?=
 =?us-ascii?Q?V/TviiuorOs2EmkL7l+SXy5I8bSIfVT688Gzay5v0tmlZZw2eWmR9e2QoKaC?=
 =?us-ascii?Q?vIjz8D5Ywc+DLC4+DlVo3UcO/NgoUVGGUm04vOVJzj5T8bEOTtTVkgEtYFBP?=
 =?us-ascii?Q?kKzklDSLvt3aaSetUs3kDX4yzuAouxxj8z+xRbKj5DbLJxkMbHLQC+9sYPKR?=
 =?us-ascii?Q?rCHitvPxtOIo4uVXXFn3FFwLhpG0oqqDhAATjOlA4df1pdse7Kjzupdo2Z9t?=
 =?us-ascii?Q?xiygKW3V6qeJwQ42Gv/xKCxaE+T+VFT3h8UL1gdHaw3owTAbWD7XLg1JjI9T?=
 =?us-ascii?Q?5qXGYqlTUEnNKbvOYo76xCanAAa1Nvs3O78JQY11/BMstsTodXc1r8sqQUmM?=
 =?us-ascii?Q?7jHRg9U29bK0g0GhRzqotKrU7W+2V1cW/tj0vbVctt3UpvnwPHSY2V8Wdecy?=
 =?us-ascii?Q?s5WopTii3L5nVOHB1qFcNuS0GPpp0bc262lXRO6OAVXryUdlMn6bvkmcfIIL?=
 =?us-ascii?Q?8mD88cnDg2WDGcU4WKlkQzM18UNECHMABn8Se7y+h4kiu8EwQcdDmwVPoZFF?=
 =?us-ascii?Q?u8Y9iXe0qAMYcsyvTUp5LV6DIm1TZ6znGJ4QDnLQ1vxBMuLin2JK6srd+ZXB?=
 =?us-ascii?Q?10NWCYVxmtE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yNMDlAug448Glq2g9sQdsMIg6wTcPNR4yO2htIynoZVnvuM6eJ7zSjeOf4rp?=
 =?us-ascii?Q?9TKxCNLgexWo6Azj35eMx1AdY2gNW/WnX5lUlP2RTird6BIj/fuazvox+0dF?=
 =?us-ascii?Q?on/R75YFxaO7BKF6+1y54BIkcRSOkW3zCrTIIitq9vgPvsJVOLVDuwO0Wd1b?=
 =?us-ascii?Q?ZWWAZnZ0ZSrvgMolt41YqOOuu0dXbzeTzSmwCA4GcFj5lxzrcptibSBXft26?=
 =?us-ascii?Q?m3/t1RiVFYQaeBdF8y/OmkLcao1qNkWc2be/Yshvsg+c98z2zUHm/u6D4PTI?=
 =?us-ascii?Q?o2/7pXfRlBml1MhILXEfaMegE9gL41pgaEPw83DYUCQ6ah09LDA2EdhWeYlj?=
 =?us-ascii?Q?b518MAAIzOYTq31Mm1ZoZkadqFMiGO4raK9nPjh+hWUW6WM+3VMnUtmIMaKE?=
 =?us-ascii?Q?8i/hhwprow2qEVaNFNYdsy4U0MGXP2CXUIFQz7S5uSo1KewUdWHp0on9aEem?=
 =?us-ascii?Q?3S4AaSltc5mZe7POcNnczoqJhZ4y8A7oDN980T5v2voQ/tPd1dVY+W8Gy5Sp?=
 =?us-ascii?Q?ll8/9lAebtR3pkTHo0v/5pWKoc/6xGIAC3FCOUAsZcirA336hCgjwJrwJlfA?=
 =?us-ascii?Q?tIJGAxK9V3O/e3q56dJ5j8JPuGP/Ybhx++ukt472GXbcx4raFM4kP16LGtZX?=
 =?us-ascii?Q?1+v8MRsLnE/J1TEgycOiYpQViKCckpT1S6i3gaDcWtWv5oFETrbIhvEIqZJO?=
 =?us-ascii?Q?MK8Cg4z+7enlUjusOF5hWVBiZ99G109urhkEXHWKDwLlGBSJGGJxFZ7Cycq3?=
 =?us-ascii?Q?ad2Gqkh7GOOTE7rLdPqpKAu6YHl4qoRLZdNWFRFnsupIlQeRo4KEJ2aHg4zF?=
 =?us-ascii?Q?nYKPyUmfa6MJpgm3Qbr2vBhpOfWttmzxK+P3qAlKou2smqzrlw51CK2K+dAD?=
 =?us-ascii?Q?EgkHtySb2FBFj5uIavMsgMq9kfKLREGfTKSZ+Rcw6CoppwMIO3RcpwsH9G74?=
 =?us-ascii?Q?CbpDQPTtr2TvL7J1LdRJuhR1UkSO6VCm5FaiogxUZrBS512Rpd91/VHuWQeL?=
 =?us-ascii?Q?gO8f0CyoRVsBP21/kkA0ShpWcgaKbdNL5uRYinEtWZm9fS1cFrWo2LZFGCKW?=
 =?us-ascii?Q?OZ8+0mjjO3yogNy4rmCChEOG2jxPJBRiwdxPRIJdKZeDbITkYDEJnNt2/LKL?=
 =?us-ascii?Q?uHEpcr5jNdEeUFiguCCOyoGBDBZ2sFPRZSfmDxceWotXXap4mSaZrdcBDR+i?=
 =?us-ascii?Q?DyMW9s+RD7h+yUhMEkKeSUGQu1JeJzZgy1krbT9aZ+mFEVcHEUpf/VdZxXIG?=
 =?us-ascii?Q?XiAUmnoyPjnaoEZ0PV3mgyXyNYchl1CWf1haiuglY+pa7l3NN7m2j6ACKVc8?=
 =?us-ascii?Q?8F+tHBtXWLVC2cmdJ/4CuqUwvXXMobLWN6mN1gUlbzrsu+4lh8kSESfyRwq1?=
 =?us-ascii?Q?jS8bISDvkH3X87W/NZNy2ptG+Dd8+2xVZ5G2YoNOWZoWnA7xaDJ0c1qr8/bu?=
 =?us-ascii?Q?dfMrXriCQ9zmuw9p0fTQh6zN7wui7jui786FUl7Rii4RIT0aKjp5k0o/3eyV?=
 =?us-ascii?Q?IR8PWaShLv/AXP2nD6eWRnoa+ss9M/wESrXqKnNffXqoDPcHKXSsGIrJnDWD?=
 =?us-ascii?Q?/nm+ZrRLVDs+QYg9IOEDTx8k1kxn9nazaMtDFFF5pGpao9wlBWI9c5X6yLXI?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e6088c-1a51-45cf-01b7-08ddf0e6405a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 03:49:47.1122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJto4UYUcOuQ/hvz5DZrPl74Y4R0o0Qic9jJ0MU4dfiNF/n2AOxY8XkZjVuPdLAknPPjtEkeCI9IBnC958nPEMWEnXfsZB0O+TKkvA2FMhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9494
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

On Tue, Sep 09, 2025 at 06:59:37PM +0200, Michal Wajdeczko wrote:
>To avoid code duplication (and thus potential mistakes) and to
>allow easier changes (if needed) of the prefix format of the
>GT-oriented messages, prepare that prefix in dedicated macro.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
