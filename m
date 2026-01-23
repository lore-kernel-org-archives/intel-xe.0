Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0941BD778AF
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 19:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C468910EBD5;
	Fri, 23 Jan 2026 19:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUnybvRf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1D510EBD5
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 19:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769198148; x=1800734148;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HI9VaTgv3zNfhgOyVpex0LkjhQpPuhCDKmOeDEpzbfc=;
 b=YUnybvRflV2qgGOmV1/s204usKjy2ghUT2GhgAQynYK0AsfTgs+7D8ex
 TGQ8Mz05oBBVYNC+y2nn0yKjMysi3MeXvK2DhjLvqT8iu1Gn2YSk1SxnC
 LwBEl6MN0DFa+FnzZndjKcqY+vKBlATCT0ax3L4a4a1waYZB6VkkBLHrN
 tjY1TrPoRX1MmQkpZ5jW36c78neAh2Irui8KV/z02KSBpHNDoWgOQLLo9
 5BEre6+E9oFjBdXfrT3ZGyltkQm62Jp9aHza+kvCUNvMrhNkNX7njVln6
 LQf3HjRynmOWLKMVvG/ZaTsB4nzTC2GnpErsFWiS97z1wzwCRrxFNWrdi A==;
X-CSE-ConnectionGUID: ciNy9w4kTyK1HhbUw9t5MA==
X-CSE-MsgGUID: +/8R9zjnSwuPqt1f7dRFKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70372578"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70372578"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 11:55:46 -0800
X-CSE-ConnectionGUID: sjGTe5hFQLeZSphQ5ZL4Lw==
X-CSE-MsgGUID: MYnz6CuqQ32NMtVX6NfmTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="230059155"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 11:55:45 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 11:55:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 11:55:45 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 11:55:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPcXy8A/heltM6l7WVZsaOedFx/Vlnr4cDKnGakec7Ls+6pxFW4vgGgFk+16Ey0vb4TjVmiQqvF0CBwkv6BE9YUPxwZ1heole4B0AqlmhII0Wc+tfie1b3yd1pb4zM66JLnbOqB1yLQLuHYeq2LRL+HmvnU+wfP10g+eIxdJBHGcjF2NZ70HkphGhur9+M7CMMISyYKHR+CByMgvoEsC/jmfMN6yA0k8sjKnLLdbZREl/LmfkPK4pd8HluKjkBab92yUPPvqDNU5o22UaPsGmDOfM+iB/7fIZo1cTg507xuNfoegfjFDNa8h+B+xxjFw4blnXT4xd2xIGvkoHrUcUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXZO8IBoi5wOHRGW+u7wvEqU3b/y49Q0jdKOOoxLkg4=;
 b=FK8PWsNj+Kvre8QPExQLHEe5p4xXbBPTkugpKUG2TXKv2xERIfGmvLKGD83T0EsWP8NFYgg+LRVu2cEmAugbc5LzqT38sqtx7TFEtKJ+vtJckP3Iklu2j70xtEYuCuKFpd5OJ9cWAJkclSefchLUxSHaq70eqD3d5SnPyKFa9lYEi/1HmqcTn/23AxiegTvt2X8vmdgitbvzsfjrnEUc6lFXKw0+2M80wx2ovE0xOnariAFWN1rsVM6/BXe83HZygNasfs1umYouE1/9m8yRWq5wcvBiju1HtofBFYpaWBFt85aWjPCN7UBGzBvAe3hSmE2wlBLHGyBMooVZxuVl6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 19:55:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 23 Jan 2026
 19:55:42 +0000
Date: Fri, 23 Jan 2026 11:55:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/multi_queue: Protect priority against
 concurrent access
Message-ID: <aXPSOy6eylSUZbDE@lstrano-desk.jf.intel.com>
References: <20260123195124.3390157-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260123195124.3390157-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 8267a9d1-5f56-4dae-7753-08de5ab96380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/cZU1+jofo1dRpKLjipXCmEGfP1gAdwPoO19QAqw0pVQcI9BKAXiG+GAcBMh?=
 =?us-ascii?Q?PoLGj2r5IEMGjYJa1IW81oqG4w0oadOrEmk6PSpraAr8ELtdjfxa0WE/eVSf?=
 =?us-ascii?Q?Tx2OLHtPDDyB30W8giPd9J+91MCJWAWTzLMUqGQi8ZTzyJH5tpNkK/de3zHr?=
 =?us-ascii?Q?+mUk/MgcmauCsJFKfnhseA51rKmcpH/O7xN7dmmFoWwhiRGwxL5A23nyQkYY?=
 =?us-ascii?Q?QNAQVJp1ANFklY2JQgsvHnxJwCbKYU4F27pgIlUEd/mSNX9c6nkgn1MHF88S?=
 =?us-ascii?Q?EnNFYBYIBQ6KF4FHtExchfXnLx2bmH1aJq0kpYZATllTyUQCG/3nTFx/M1GN?=
 =?us-ascii?Q?AYfDHi+rSps5guvNGdaZilXxEAIqLQgnEMda80NwZGd8BeJY3/IZTSxEu7GK?=
 =?us-ascii?Q?fc/8fnoLHMG7ChBnbj6O/fup56oEAASf9KV+GoAp5mS15YLYjkRG0FHIFi9F?=
 =?us-ascii?Q?WU4VtlG/kbkJkR2OvwR5r0JiHiVFda7RuoS5/mqWfDDl/GTbYETQ1obdfD0z?=
 =?us-ascii?Q?b5A9ap4sU7DpI311FiQr7i22s7odn7+Sb/egkMXWAxM4u+qqyr4wS88g3q0c?=
 =?us-ascii?Q?a9QvI8GStVLMva8BzuENVnlCloO7hqJHLyJyEv99jRgdkXy+49NpPNfeKgur?=
 =?us-ascii?Q?UxUuEUEPCwbcHPAxncyeXpER90VEs3AvYNrNBq5jlaTLqfX1jMxd0zEm2xm8?=
 =?us-ascii?Q?asIsnV3vwygELUDPMPsFy6UhJzvXptrxP5gZKxIY5v9tG9T+NFEFvdqBEk/g?=
 =?us-ascii?Q?y19mRP9FgbMUyK3UXmrawKFOq9cy2r5n+k9n+m6jElNCkpscPTMm//iMt4Az?=
 =?us-ascii?Q?/d/hvfNEwh9DktmZuAkDWzJUWuzGrfolhzGLP4FdcM3c4iBDYmRrlxLJuE/M?=
 =?us-ascii?Q?NaBAGZ/+hmYrmTG3i36AL06EhVUnstFx6dRoo5nrvDV4g0R3DqL9XKUb8BGP?=
 =?us-ascii?Q?lL7oIpXiuz3m8gTPNlB/cOiszY+0Ol7tfHF7jeMnfFEdcJwlikaInOciYL5S?=
 =?us-ascii?Q?z2gXv3OsVzShnxl788xvcs/u//Wadi+3vYRw3aN0SGUsHpIB4ZYRceKV42fh?=
 =?us-ascii?Q?EgR7ibFg8/KR0pITmjASTS4FMraE70ZV7vQoa/+o7U1R787ci1uEoLbRk1/b?=
 =?us-ascii?Q?zkbCN0anUOp1AHYfr6ok7pE8vdjzkdnHzkYdr+7XOHSjOq++UL023kCh2cCT?=
 =?us-ascii?Q?imJeb+xdydOBT9QpV1ymQq5RdNiVi/WgWaVE4T/HGtfHGIhkoaAvlkROpYjU?=
 =?us-ascii?Q?CyiGRIGChk2TQPoUeGHh0d8qt8Sa2BFtYSAmVwC+xTvQVwFSxm6E1dvAo9Md?=
 =?us-ascii?Q?RGe/F4tQ/lYTLo8LOQqZpj0SJT+ZsuwL5h6eXwklNRJEx/77thaA8fTMOJv2?=
 =?us-ascii?Q?Xyz+ot5hI3czbZCFZBg8Ml4Sh74j44C1KmIIIqnMOT/0xQ6DSfIVg0A0nb+V?=
 =?us-ascii?Q?jZtNuMmhx4ELWW+SjYDgwjPRawAKprIUBY9mnoLL57ta5nlbb7LzA+lshOQ5?=
 =?us-ascii?Q?WGVblEY5zFdBkLh0KgM7gOnQsDD2kroDAKNtK9E3HL3khiYPlFN/vaFoQ2cp?=
 =?us-ascii?Q?FC8cXhTSm1pebSA0C5Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rpi/fVC3PWKJpRSBw3J8nA6o6+o+/9lOIFLnGGETNXcZFS+Z5zVfzUqPEZ13?=
 =?us-ascii?Q?SGjCkHnUHuU3B1lZF+VP8I5WjknwigAzgD6PVR73R12ArofRMvfWh8I0CQW8?=
 =?us-ascii?Q?neuh9M6ewPhlzHuhgBX0suoxyBQQQcOB4HvTFA1D8hzOyLeddXVg+Qlkru1v?=
 =?us-ascii?Q?NrN0nENBhKAlzi0scED9Z9DJAGIhW6q6AQM8L1ZF5pXFo+UVnTDVF7IdTLyp?=
 =?us-ascii?Q?6tFVoaJngYa/ey0H7CDlW3Ho+I/YGjBql9xMQ5cQfdVF9xK1ePFNBEP8h8o6?=
 =?us-ascii?Q?E6XrhFrVsk2pre3XgzaXxH1Z1JtYOBPmmEcKUAjkJZt/byLOScIYhDrSsqtM?=
 =?us-ascii?Q?DbKWqe1MpiuNkLPBxC9pIJRyg/yL+SDxoN5q3TSKkc8GOcdmAXOss4Lp7RJx?=
 =?us-ascii?Q?+0TZg4lrBVdlm59+JICVblED+9ajmz0AnQsq+Vl0GDSFqWS2PzX3OQweoH9k?=
 =?us-ascii?Q?mGACoT6I1OrV5hCG6HEX5uKFml73mzcDRl8O2+ACjYUlxFqsyfo/oO/zNA/v?=
 =?us-ascii?Q?s4KxHgEJ86RstVkjDQiVihfGhzJ1KfI36huF06HO16loaGYuIpRac/ygUxfO?=
 =?us-ascii?Q?XoArF7DYJnUL40cPvZyHO3LUEApeiAcLB1eGLw2Fc4O/7byy5nY51+kSqtmL?=
 =?us-ascii?Q?ZhodXR9IG7XMoIYvG5q2crEoTJ42hIo9xEyBRoS/qwyw58XkpurBF5uaMjjb?=
 =?us-ascii?Q?NveRdCm6DkXonfTa4B9hnbnmOchNu0CgbMxNefRfBcAZgeXRZA7zW2O7lpa4?=
 =?us-ascii?Q?+Xk/8eT2FkZKEMKO6YdRewnlZp1SLG5dX+gbOAmOfY5C/poqU4wbM++1jLI0?=
 =?us-ascii?Q?2nI/efS+eKJT62kYVAh1FPI78PPC+2pZN9ZmjGpm/N3UYCyEOLrdneKchUdC?=
 =?us-ascii?Q?88VyaxK2CU7dk/m203PTyZimsZ5Bykv2NNSAQd4oW3Hhz4b8Cbi4VOwAYlD3?=
 =?us-ascii?Q?i0xAasURnzShl+vtT+Zu5hS7k/ierKUiTjQvyqY4HhADuCRlbNzW+ioWLIYJ?=
 =?us-ascii?Q?pZ9sDnlX94cxB3fFf0XCRlxxdumtZpBOkiTeXoR/f8ECf3Rody0/oQXjZa+M?=
 =?us-ascii?Q?pGOtyYz1lODiR6IItQWPBUWjf01OQSYjeycGLPEg232eJiVj+Awuw9/HrvXF?=
 =?us-ascii?Q?nuum0b7taiyju/m1VjDHD37zDY60ovXB6qhMBbJKBWpaN3m+jCOMSL7uzSIn?=
 =?us-ascii?Q?yMcLExCVOwO5tUpyDA5ZA9GAXaJNfn/VQy+MgOVFprx5qawCS1wwp/unt5oO?=
 =?us-ascii?Q?GRZrWaZNjBfm0AGLPwowq/HG1gFZ1ID/POSfSCRBMtzm1lAf1XDoJjG3sOuZ?=
 =?us-ascii?Q?at8mKXceDW27Uw+t6G6vQJpqmRNDklYJRpBU20PHaZTi4hKtdY35P9mxkkx/?=
 =?us-ascii?Q?mvuCvYgGoJN8VmOf02FnC8MOVX0mymhVV50PxBv5a2Pu6hfE24gCI/bnUlQo?=
 =?us-ascii?Q?srwNYvTi0WHxiBNThGQXexfCR57cDe31Xocu5bdhfq4HW/PU5ULgSusWQ5YQ?=
 =?us-ascii?Q?+7goEpA18tBMK1B4Q0l3/NQUqefGnUEoiWi32CXbxEGGH9/MpJd7lkrrM74N?=
 =?us-ascii?Q?DF0FTXEgwYKHHZt5pKAr1QFXUs0Ofr7x5YB3zgK26L5/dnoY/AbYco+Uhe9o?=
 =?us-ascii?Q?u6SH2rIEtyMsPxT7/u4hvUJ0K8VmlxDDkDkQ1xv0JfbCozs1oqnuzgoBvCSf?=
 =?us-ascii?Q?/fj/C/6HJibz1Stq0iD4YRMHZrjtAIOc3NGew2Xg5a/U3oImTcaBajj08jJe?=
 =?us-ascii?Q?deVB0JwEUQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8267a9d1-5f56-4dae-7753-08de5ab96380
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 19:55:41.9248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9qwZFNErKw668q3KDc0IsYhfRCUjXFaJfVI9Du/mcKWmsXxYXBFHVInY9v7dKoo610NR6oSlWxaxf4OtyJANw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5832
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

On Fri, Jan 23, 2026 at 11:51:25AM -0800, Niranjana Vishwanathapura wrote:
> From: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
> 
> Use a spinlock to protect multi-queue priority being concurrently
> updated by multiple set_priority ioctls and to protect against
> concurrent read and write to this field.
> 
> v2: Update documentation, remove WRITE/READ_LOCK() (Thomas)
>     Use scoped_guard, reduced lock scope (Matt Brost)
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++++++-
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 19 +++++++++++++++----
>  3 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7e7e663189e4..66d0e10ee2c4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -230,6 +230,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	INIT_LIST_HEAD(&q->multi_gt_link);
>  	INIT_LIST_HEAD(&q->hw_engine_group_link);
>  	INIT_LIST_HEAD(&q->pxp.link);
> +	spin_lock_init(&q->multi_queue.lock);
>  	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
>  
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index e987d431ce27..3791fed34ffa 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -161,8 +161,13 @@ struct xe_exec_queue {
>  		struct xe_exec_queue_group *group;
>  		/** @multi_queue.link: Link into group's secondary queues list */
>  		struct list_head link;
> -		/** @multi_queue.priority: Queue priority within the multi-queue group */
> +		/**
> +		 * @multi_queue.priority: Queue priority within the multi-queue group.
> +		 * It is protected by @multi_queue.lock.
> +		 */
>  		enum xe_multi_queue_priority priority;
> +		/** @multi_queue.lock: Lock for protecting certain members */
> +		spinlock_t lock;
>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
>  		u8 pos;
>  		/** @multi_queue.valid: Queue belongs to a multi queue group */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 456f549c16f6..1f4625ddae0e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -804,6 +804,7 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>  {
>  	struct xe_exec_queue_group *group = q->multi_queue.group;
>  	struct xe_device *xe = guc_to_xe(guc);
> +	enum xe_multi_queue_priority priority;
>  	long ret;
>  
>  	/*
> @@ -827,7 +828,10 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>  		return;
>  	}
>  
> -	xe_lrc_set_multi_queue_priority(q->lrc[0], q->multi_queue.priority);
> +	scoped_guard(spinlock, &q->multi_queue.lock)
> +		priority = q->multi_queue.priority;
> +
> +	xe_lrc_set_multi_queue_priority(q->lrc[0], priority);
>  	xe_guc_exec_queue_group_cgp_update(xe, q);
>  
>  	WRITE_ONCE(group->sync_pending, true);
> @@ -2181,15 +2185,22 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
>  
>  	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), xe_exec_queue_is_multi_queue(q));
>  
> -	if (q->multi_queue.priority == priority ||
> -	    exec_queue_killed_or_banned_or_wedged(q))
> +	if (exec_queue_killed_or_banned_or_wedged(q))
>  		return 0;
>  
>  	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
>  	if (!msg)
>  		return -ENOMEM;
>  
> -	q->multi_queue.priority = priority;
> +	scoped_guard(spinlock, &q->multi_queue.lock) {
> +		if (q->multi_queue.priority == priority) {
> +			kfree(msg);
> +			return 0;
> +		}
> +
> +		q->multi_queue.priority = priority;
> +	}
> +
>  	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
>  
>  	return 0;
> -- 
> 2.43.0
> 
