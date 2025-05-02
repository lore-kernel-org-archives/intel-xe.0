Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74058C3ABAA
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 17:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEC610E97B;
	Fri,  2 May 2025 17:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKX1ZZI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66B110E97B
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 17:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746205705; x=1777741705;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vnbJq4F3ORzbDLJWUYPeg3OTnOHvXcAvdojLteIoNhE=;
 b=IKX1ZZI2Nrx/Y7XXSYtnMk5CNospU03TBEPzFysUIp0aGUeBSYm+QkFa
 8CUyElyj5s8W2ylz1J208ABOeF+nw7NqUltdxGJgpF88AiNDDk82SNqE/
 Cc4U2qFoM8/UmC94JTCjbW2Rc4O+2qraqbNR+GUX3E7/gyqzY+z1v4m3j
 mbnvVAOM31v1VBe1swlNA2i7FNiX+hcVNjV/qKonIKWANNq6swIMwXsg7
 gT3ksLE1cJKiWhGmENFzYR9Ec00tYZ/0rFA29VCREQ0H7EgKd7yzBLS2u
 CIwB18BzTgSktor+gejm09y7TwPLlrJCHjQX1F+dB0aJEzjB4eGBuaLKt g==;
X-CSE-ConnectionGUID: tG36cu1wRniBUsiUHDIu+Q==
X-CSE-MsgGUID: 6lMb6cOHRyKXHjEMszb/lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="65422231"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="65422231"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 10:08:25 -0700
X-CSE-ConnectionGUID: 5S7yAgGXThiqZ0rvGQL7lw==
X-CSE-MsgGUID: ZUsKl/kmQmqw+vSM0u9ARw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="171938351"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 10:08:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 10:08:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 10:08:23 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 10:08:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6MCGLDiUb2umMLK/Q03rVqKd8dzGzBiEwcVEcbnqUkOUcA5Jz/aHS2J6VO1hoWCjrLMfzqt+UZOLhnsnUAqvXeYMDwMB46y2HsFpIOXmlR69nUj/qZmeefR1WNl+kEgwM6OwfsNSnOIGSu30kjZmm9bk/fj9shPd0EtuRoMAKNZn12OPy74vZGNswAzwjSJL/QYQ3Tiwpyo9Pp7RbGMWDppwDYk1sSmSqQABtsj5k+usank6vkxAa40TLTA8MuWm7kBd44azV4nDPAlUCwZB+tNsH9EEt9U3VXSjrJAg9vaqBy7z+AVl2cbCcSUgNR0sv6FsZXEkoxjXIQ13NC/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vktbNO9+Zv0/Dj3SWYNvj8C9pk80Xw3Ks/Lug5vNsck=;
 b=O7UuA0kNMTMiBaM+DBUAuXzfNjDQ8UPAlbWr3DuHhDnTM6i30DizDiKAcEww1IzVAhat0x9DJcvheIYzmqYWXwZrmGmXqA2fkMdQ7XTwzDrPts+Vquhq0UyfkiGSgF52Nc95KvFdDDCe2tRG1aal8YrrXxMxQzlFbS9fLd88kEZGEvdZ1x//CYu/QixKb7S10tjpvU0n4rq/3UubmIP/FoDepd2qM5c2uWSH4xDusA2XPoG0uDhZUhX3lMZMKkMhV4ae+PCNl1mJU6x71vTbReZZl+JkeED7BH4at7sgBl6gredvp6tqrII7KRiwIRG25N+5I/fXEs7l70nSXyTtEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9038.namprd11.prod.outlook.com (2603:10b6:208:57a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 2 May
 2025 17:07:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 17:07:39 +0000
Date: Fri, 2 May 2025 10:09:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Add config control for svm flush work
Message-ID: <aBT8L2f44VrIGlzO@lstrano-desk.jf.intel.com>
References: <20250502040757.1722973-1-shuicheng.lin@intel.com>
 <20250502170052.1787973-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250502170052.1787973-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: BYAPR06CA0042.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eae4534-da2d-4813-bcd1-08dd899bd7c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Js3Kv5tFUidBhR5m4ZgZi4bA7R2mXoFVTK0mOZOAID7/MFQBs9VhpVO1Iz74?=
 =?us-ascii?Q?CwVSX/O/TwK0zchHznnJngULeZtf8FPQLxxg7+7Amtw1qSrD7McOnH6t8IK1?=
 =?us-ascii?Q?XNXOyll5/8MwU5bVutK20TmcdeAS0wDgxRRB3ju6Ag5rIUp1b3ZH1jI1HpIt?=
 =?us-ascii?Q?EVpjOZz+bXHdiVkYJWsxXEVDF+N8Ak091QRg5RcHsKjca05bsNM/Mr69mBli?=
 =?us-ascii?Q?crVhxQxeAs84lwP559D9X28yUxsYwWEVxHkAJe0+dVtbA4/UpameR3wcVVAo?=
 =?us-ascii?Q?UQURiyHcZSCDYcZy9WjgMsXfV8lJLTJZ9XYTz9XXfmXx/B6m7IlMxuyTOClB?=
 =?us-ascii?Q?AuzPAB99eo1HzLMDWC3o7I/bOePV6P7hj9uFS3Xk/tDwzL1vn8btGFYQibWs?=
 =?us-ascii?Q?96WfPtZpbQbkQNDk+eAE10H4aaGtJasXDEeJKGkURI7mTB9qPscZN2aIoOnv?=
 =?us-ascii?Q?EEBIASt5DrpD/tmRrvAmvPJLHe5KGB9vGWGIwq6HDmInA3TiTNGLCxPlj3yh?=
 =?us-ascii?Q?xiM1Piav5mncjSlzSOsMl7pnrct5Rs5AO8UKDd0HridWswCaytM5+M35yAgl?=
 =?us-ascii?Q?sKTtPGeQQslh9VPiR+sMwOnZOfcGNnfrbWWQAo/N1ykUsEJMrgKouqPF3aLn?=
 =?us-ascii?Q?vOFa3NIZp8FeEcQea00jdoUJpsA4tbNGqQkTJzyF/kuzlCx8USQiMUMeHib9?=
 =?us-ascii?Q?bwYIM3CFaS+Yr2QXGVWgLNvZn29JgZXir9JzVPLJeGw9+KjsxdvquzUiHjPF?=
 =?us-ascii?Q?Qsl6wGXS2uGt5vzQ41PoRZBZ2yFNOlqs1cZIKq0rt576XoYZkTuYIMcV+INY?=
 =?us-ascii?Q?ottF8FVsMejvzN2P6regyIecGH39SkxTGJvCfBHnLizMXfFtQyHQvfv84GD/?=
 =?us-ascii?Q?1+rHfzGt9zYalJkwhk7NLM+5LjZHuI/JRHr611Seggc6NAyEw/DBaB/BQZBn?=
 =?us-ascii?Q?s3QwHV5AQR30wTkUbm/H1kWyToKKGo17d/6fjL7fzCZSs/BZQKKr6GA8Za/I?=
 =?us-ascii?Q?3UM3uTQXv9xStZOFWFg52lPCIbIeV1odGx7KWJYa2CVq146gmuYI7HHMklQa?=
 =?us-ascii?Q?kKImwswHIxISUatmao/73LdRsNF44/qsV+p76n8GCU75XigqtY0DHk+Fz/W5?=
 =?us-ascii?Q?H95O2p894WUJcEUplfRfeuAExw/SvanVtzYn06QZ8jwTQ0dBuP8B1lA4TtXK?=
 =?us-ascii?Q?nINNe6HCSAAQBGqfPgxxR1CtQVlVcQCd7mO3W055gQjlcHgHB5W6dNIW7vYN?=
 =?us-ascii?Q?SsTgR20TfeSxajnqoKdPiBCZXjYVH87fPZfRtQai7wbSsv4Tx3RcRlc/F+iS?=
 =?us-ascii?Q?dqfjFJo66GhZgA8GvX4eG8mJdcLcIP2HdLV4GFalgI7jPnyE/zSu0auX2qGi?=
 =?us-ascii?Q?EqZaCV3J5wb7NdmHDiyk5ZFNu1Rz+f3O40KPgqnFMJ+1N/loQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vuovLItSg7BvQzpRVDxjZZN5ZAElmU0ypG0ZY65n/fzBZi/pg5cgNJpPSIzY?=
 =?us-ascii?Q?Jr4sg2VhlqNlpZnJyv65ypmdCI0RY9TzshhJUnoOEX70nYL0cqLykLbdco6i?=
 =?us-ascii?Q?5ca5zmOG4HdC062pTpd7ygIHIcQCs6uMR9EbmtS5sOXjtKCzlNLNh0C2N1xc?=
 =?us-ascii?Q?kPXNKrKD5+2UQ/bPLjxlAw1WPVdYlIVExT6ilxTr/RLs6wVlRfuRAqZaVtJx?=
 =?us-ascii?Q?0WFdQ8mb0b/FolSw2yNAmyE1OdhabldY1O89GF3fp+W9m/G+BukKQAyY1Kce?=
 =?us-ascii?Q?/mbrdJkcQSkOppWSnyYLo5rJNRFm4B0MsvyKi9RoPk9B9SbwJM+NCH7/nQO7?=
 =?us-ascii?Q?rWHmt3yMoX/tsU5W7vUgwG8BsW6eEqv/oEQK/JTM6mAub1u5GqMiuGiSldZW?=
 =?us-ascii?Q?9K3MuZmHfqzAzoNf6JkTySZIXo4p0UBTkHhLNhVYZsidxjh4F4cNgh24K6Fs?=
 =?us-ascii?Q?PyhBayteWXqgJjAYSfH1MzWV0QgPZi6V9tNh+Eu4MiECeuIvgH9kDioV3ek2?=
 =?us-ascii?Q?XvHAj6lUMf/q3NU5Vwo7gGgfgNJS/vv/QHdGrQdsfh5F5svt8Tu4cYkk8Gt6?=
 =?us-ascii?Q?KZqMkAdc34sBT2Xossse2ryB1Y+JXHOaijsSMiPZvHD517ipdlIKg5IQ7k/S?=
 =?us-ascii?Q?hL9WoGnGZnuLYDMWy2JBi0ppYjOOtriB5VJ5W9c2heMJeZLb7xpR43BNXQzm?=
 =?us-ascii?Q?zAH/zFi+JVbw3ycJ/6pa1rEhZt59nj3dOlD8LEJatGRPRp7byZ+WCghs8UxR?=
 =?us-ascii?Q?RJe9zYK3NNdZVZKLSLf8Q+yEAl1v6uoDsGZ2TTai9eiXvyFVu/BpYnU2k9VK?=
 =?us-ascii?Q?QpfGWZ3cwElLlWuFf8duHvzqyWlsROAGlcNr4bCRb4KwfNcT7eTYBRlvXXvl?=
 =?us-ascii?Q?ua1OivTluLAktlecWOCmFJAQ4lV7jts5h6c3V3mN6TTqqFyefWciJvmCFvec?=
 =?us-ascii?Q?PshXQK81OnfAmcLfZNOuQ4ZRN78Eyj14w3tznn9NhWUm/Cz7AU8wH+ZMzJ0I?=
 =?us-ascii?Q?4eLv/NhhTUHZpJXlvoRmfCNMd9P62p6aLD68IQMDOMuhn6KXkTitaBIsWrlW?=
 =?us-ascii?Q?LBq+lb0W5VSjWr7MAmRX44jSbtve/x5W6sEjzE/8yGq9KLIWnO1fFrwADNXj?=
 =?us-ascii?Q?w9su9LQDYPtrozWKd+BOBBaJ6AMGhVjZ2jXqRm5HNDTj1VbRL5JL2zszT+5l?=
 =?us-ascii?Q?ovyvmjaEt1ug4eD7x8Q18ux6CcOcZXsR14fBQ/m/GJBirMzpzWqKA4++q5Ai?=
 =?us-ascii?Q?j8KZKljNhT6UK8V8ERLhJqGskvl6h7DupTfoMrAzWuNwQEWKyhalu7KoBuwt?=
 =?us-ascii?Q?20jNNyON75Z/ueSMagC7zqeCBz5oW1X0JmPxkwSWribH7Noej39eQHkEI3rw?=
 =?us-ascii?Q?aIEVVulDmUyL6y4Q5tw6piqp5rnWrGERtz3frZNI8HDyRgZQoWZvTZ4y6+wr?=
 =?us-ascii?Q?rdDAfV8eZPLnNVpxgM/hApA6TXXbAcg1VU5n9tqPwvyvrbOzFor/D+RGuNGW?=
 =?us-ascii?Q?g0gFCMU5skz7w7VvonROyGT6JVoictzvquc2gjc7G8yX0ydMDViAFCwOHhek?=
 =?us-ascii?Q?NmsijfDmdQnM6JRgaDePSSCV6MsZHc+jMgo4wrhL7EgTBsEzXZe77uBYDXy3?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eae4534-da2d-4813-bcd1-08dd899bd7c0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 17:07:39.0940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlNWEVt7x2BNH0XtQcxBTVwtN/J1h0JW0Gq9chs+vfQUTSGKdff09uioBa40Is2MOCC8VH6mYyN6IXIuTDwelA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9038
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

On Fri, May 02, 2025 at 05:00:52PM +0000, Shuicheng Lin wrote:
> Without CONFIG_DRM_XE_GPUSVM set, GPU SVM is not initialized thus below
> warning pops. Refine the flush work code to be controlled by the config
> to avoid below warning:
> "
> [  453.132028] ------------[ cut here ]------------
> [  453.132527] WARNING: CPU: 9 PID: 4491 at kernel/workqueue.c:4205 __flush_work+0x379/0x3a0
> [  453.133355] Modules linked in: xe drm_ttm_helper ttm gpu_sched drm_buddy drm_suballoc_helper drm_gpuvm drm_exec
> [  453.134352] CPU: 9 UID: 0 PID: 4491 Comm: xe_exec_mix_mod Tainted: G     U  W           6.15.0-rc3+ #7 PREEMPT(full)
> [  453.135405] Tainted: [U]=USER, [W]=WARN
> ...
> [  453.136921] RIP: 0010:__flush_work+0x379/0x3a0
> [  453.137417] Code: 8b 45 00 48 8b 55 08 89 c7 48 c1 e8 04 83 e7 08 83 e0 0f 83 cf 02 89 c6 48 0f ba 6d 00 03 e9 d5 fe ff ff 0f 0b e9 db fd ff ff <0f> 0b 45 31 e4 e9 d1 fd ff ff 0f 0b e9 03 ff ff ff 0f 0b e9 d6 fe
> [  453.139250] RSP: 0018:ffffc90000c67b18 EFLAGS: 00010246
> [  453.139782] RAX: 0000000000000000 RBX: ffff888108a24000 RCX: 0000000000002000
> [  453.140521] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff8881016d61c8
> [  453.141253] RBP: ffff8881016d61c8 R08: 0000000000000000 R09: 0000000000000000
> [  453.141985] R10: 0000000000000000 R11: 0000000008a24000 R12: 0000000000000001
> [  453.142709] R13: 0000000000000002 R14: 0000000000000000 R15: ffff888107db8c00
> [  453.143450] FS:  00007f44853d4c80(0000) GS:ffff8882f469b000(0000) knlGS:0000000000000000
> [  453.144276] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  453.144853] CR2: 00007f4487629228 CR3: 00000001016aa000 CR4: 00000000000406f0
> [  453.145594] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  453.146320] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  453.147061] Call Trace:
> [  453.147336]  <TASK>
> [  453.147579]  ? tick_nohz_tick_stopped+0xd/0x30
> [  453.148067]  ? xas_load+0x9/0xb0
> [  453.148435]  ? xa_load+0x6f/0xb0
> [  453.148781]  __xe_vm_bind_ioctl+0xbd5/0x1500 [xe]
> [  453.149338]  ? dev_printk_emit+0x48/0x70
> [  453.149762]  ? _dev_printk+0x57/0x80
> [  453.150148]  ? drm_ioctl+0x17c/0x440
> [  453.150544]  ? __drm_dev_vprintk+0x36/0x90
> [  453.150983]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  453.151575]  ? drm_ioctl_kernel+0x9f/0xf0
> [  453.151998]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  453.152560]  drm_ioctl_kernel+0x9f/0xf0
> [  453.152968]  drm_ioctl+0x20f/0x440
> [  453.153332]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  453.153893]  ? ioctl_has_perm.constprop.0.isra.0+0xae/0x100
> [  453.154489]  ? memory_bm_test_bit+0x5/0x60
> [  453.154935]  xe_drm_ioctl+0x47/0x70 [xe]
> [  453.155419]  __x64_sys_ioctl+0x8d/0xc0
> [  453.155824]  do_syscall_64+0x47/0x110
> [  453.156228]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> "
> 
> v2 (Matt):
>     refine commit message to have more details
>     add Fixes tag
>     move the code to xe_svm.h which already have the config
>     remove a blank line per codestyle suggestion
> 
> Fixes: 63f6e480d115 ("drm/xe: Add SVM garbage collector")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 13 ++++++++++++-
>  drivers/gpu/drm/xe/xe_svm.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_vm.c  |  3 +--
>  3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 890f6b2f40e9..d25f02c8d7fc 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -726,7 +726,6 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  }
>  #endif
>  
> -
>  /**
>   * xe_svm_handle_pagefault() - SVM handle page fault
>   * @vm: The VM.
> @@ -966,3 +965,15 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  	return 0;
>  }
>  #endif
> +
> +/**
> + * xe_svm_flush() - SVM flush
> + * @vm: The VM.
> + *
> + * Flush all SVM actions.
> + */
> +void xe_svm_flush(struct xe_vm *vm)
> +{
> +	if (xe_vm_in_fault_mode(vm))
> +		flush_work(&vm->svm.garbage_collector.work);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 3d441eb1f7ea..2881af1e60b2 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -96,6 +96,8 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
>  #define xe_svm_notifier_unlock(vm__)	\
>  	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
>  
> +void xe_svm_flush(struct xe_vm *vm);
> +
>  #else
>  #include <linux/interval_tree.h>
>  
> @@ -180,5 +182,9 @@ static inline void xe_svm_notifier_lock(struct xe_vm *vm)
>  static inline void xe_svm_notifier_unlock(struct xe_vm *vm)
>  {
>  }
> +
> +static inline void xe_svm_flush(struct xe_vm *vm)
> +{
> +}
>  #endif
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2a9d58a4471c..91a0570abb16 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3419,8 +3419,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	}
>  
>  	/* Ensure all UNMAPs visible */
> -	if (xe_vm_in_fault_mode(vm))
> -		flush_work(&vm->svm.garbage_collector.work);
> +	xe_svm_flush(vm);
>  
>  	err = down_write_killable(&vm->lock);
>  	if (err)
> -- 
> 2.25.1
> 
