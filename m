Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F81FC36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 17:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C1310E19A;
	Fri, 21 Mar 2025 17:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTLhIv4/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E116610E19A
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742577351; x=1774113351;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Xg0h1p2H7a7eja7y5oezmpgffzb2U9n5hI/Unx0KKK0=;
 b=cTLhIv4/j4PouZ9n7tnM0Iq+uLDdo3OZr6VMFj4f0G2rR1pAQ1bIM1lu
 6Vq7Y7oG23PlDnhinqdiDKr48T39FB60dWwCT9v9dsawOLj05jzpnUDTP
 iMw3QBtZz4AUrrNx17rRbok4fRi9USG5VNfV+qf3xtz0w59xRo1pEekeG
 KGK+LPUqQHQiCbYcfXvEm4Exmd+//MOZi/h1W+fq6qSx6BrZE+Kv0D31z
 OMAOOwuReW/bcpTOw5eIASsbw6CgNXOYo7/EvLAMmT7++P8P1lCx5Jgos
 AalqVsbI3YLkG1wuuo1IL+C74zbKGgQHjy/K4h0LFxBSLtPt2UICc6SRQ w==;
X-CSE-ConnectionGUID: jjTMYD/0T8G81yTIG0tCzA==
X-CSE-MsgGUID: 87H2Q6HyQn+Pa++DXj3H2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43015414"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="43015414"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 10:15:30 -0700
X-CSE-ConnectionGUID: yd8nWUpNSLCDLBCHHLz4kg==
X-CSE-MsgGUID: /l8F1g36RlKNTu89O3AoAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="128286421"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 10:15:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Mar 2025 10:15:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Mar 2025 10:15:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 10:15:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOG0vn+vhRoOTZY/AlcxQatGTo3H55ajYeTCSe9yIYxCrrLDIeFn/GBfRQfn72+zosQXtwnQGmorczTefTJGtuRimDUt5vfV9bS76d1sQKtncFeOo3GW3xv2jBgFAXR1iwaG6XjrndWLakFA6qEdTErnyGcwZidfjzNEVD9H3sDPRzzNY7MbDpZP0hKNr5YsvuFcJDKjxv4DGyRc9/iFFlp5/RqeOweJB+yho3el9erYRBmWUb/SjO9ocRjBXgdYRRBG3AtLpfaknheiw3xYsn5lbOYx5f00g69ADNhB+HSQB7GfNGD+6tepHywFbwM0Z+Ed57kHL5kh0XHNriNTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfmo2WMKcYlAPOkU4fmWx1z3LBJLZreya/Fd2DSI3B8=;
 b=dhJPnpDGOF82gnW2jpA+FOgGygOkxZKTHlCHqRmKkBu1peG7+BfVX0/IaL5IA9bUxF0vslG9VxCCGiLSCLe6SBCkvakYNAWDJAJu27PBxa3D0aWOvOUwLRUdDPfcSNwCU512C4NCIqeHZALyMJLAA+WpY6MDNCWylxwLM8oMWGi58z5I0ZdFo6sBEab6fPuihVb9grxD3t4vDvPtTOGda0Nc9a/tFRru082p7tMIv4DkPPbmX6ekOXXsHciTY35/XxYRaul/WLsJDrV9T5psSFUHHYAylT/3rAifXEzM8HYHSZxyPtKm7Gx4COannmKN9fQrF3/LFP1yen2WfnCODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 17:15:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 17:15:26 +0000
Date: Fri, 21 Mar 2025 10:16:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/uapi, drm/xe: Make the PT code handle
 placement per PTE rather than per vma / range
Message-ID: <Z92e9sx7PdSSl3p4@lstrano-desk.jf.intel.com>
References: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
 <20250321163416.45217-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321163416.45217-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0253.namprd04.prod.outlook.com
 (2603:10b6:303:88::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4649:EE_
X-MS-Office365-Filtering-Correlation-Id: 4860fccb-9cc6-4c25-a82a-08dd689bf935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XvthOCuSXbND7JqSsGBwAiRX8lZRKxQekm5F1BmVb2G23Mln6zt/JZCVS1?=
 =?iso-8859-1?Q?3NX6snWqlHChVpmzbzlb+xTqI/GabyXqSIueNDhgdx/DZo6+wU0+2xo5DK?=
 =?iso-8859-1?Q?w6wTcLvvCn6aUVt7NOFQeAhLjrmceBRjAI4zndkpbQu8tpOWwYBkn/Buqe?=
 =?iso-8859-1?Q?TAboDgCdfDrzBkWwsm4bwPH0IQ9W3qkmpZqVuhQpmiDJG8aj8gEqoK+9uN?=
 =?iso-8859-1?Q?8NA+Cj3eR6vCeLPYCu8vV7JsPT2mE68ZTRfOxouP1JRd2f2zgNxP21chXo?=
 =?iso-8859-1?Q?/bLjiP4ExE8iypXodMbCynWdzgPJhfCSzMmVUDswmmJTYcX4F0m1nrMoKC?=
 =?iso-8859-1?Q?YB/pp8Y+q2my//cQxQiEe1f2nomqaQdPg75ut7zHQSlx5u3IdXtUWaImiY?=
 =?iso-8859-1?Q?v/jvWWV9abFW5FMVzP2tCK/KaZbVXUKtXkJ29Z2XKRjswzRK6lG6K+1NLM?=
 =?iso-8859-1?Q?XhJODtwlCtTZRCByEv43kLZd+n3YIEfKuNtjgigjiChuAon5J+oYdKIFS4?=
 =?iso-8859-1?Q?A88lyH997iK//nJMdIx5Cue8njch7VRaUZK6M46jFwTtzrJiEO9iePgdZW?=
 =?iso-8859-1?Q?gL/jZYB5Smh254uun//TxV5iEQXtqHQ8CCw+Qt5nEe4FWHaIc5hVjjjXbk?=
 =?iso-8859-1?Q?NJCPXOGkv0YLbUEzyvxRN0Z5mE9tg8sYhehF1tOB+X0a5l8976WKcRO6Sm?=
 =?iso-8859-1?Q?xoHPxNxpQAqCwyukSo6fblYt1OnT7UhUpVTMc9+kKekSqkRwH6GCt/Yc3K?=
 =?iso-8859-1?Q?EgT/Y07Zqyp3eRie/mYLiYLFgdGbXNpR76aZCF7gRR/01Td6tPSNIfdlPZ?=
 =?iso-8859-1?Q?TnlXw4c9KWyiRwriEXGd7p1zQ6DXr4PW/zweQ7fyk4c4UYyZ7G9X65AR5I?=
 =?iso-8859-1?Q?sFA6khq1npZxG3crVfVcfXro4qUE8ZEhlk+kUIHf0BCmKIqvHNfni+MfjV?=
 =?iso-8859-1?Q?DHcHmjNfb46SusxbTicGYzUaydcWgo2NFgMG5XMlNvd7Wj+y8U9+flgVGh?=
 =?iso-8859-1?Q?6jUDMR4mZUVKzx91Ue7Rse56Wafgid5OJMzc3WT6nBNCXNJunh861faXkT?=
 =?iso-8859-1?Q?FRUJ7yJerXmh4si4Zl1KDI9TcuPA+LMkMz1EozGoH/qTd7AqcOLLcBJuzK?=
 =?iso-8859-1?Q?1H2EgQJenwm9j+bZKb7UR5mICVhL86JAUQPyyIuBWgeD3ud5X2HeITGADn?=
 =?iso-8859-1?Q?P+IafRpbNRps6bQhECoX0hfgXgGJDb1L0KOhbx4ia7a2AA/2c2xA4HCwBo?=
 =?iso-8859-1?Q?0b5b1byMWNstyhhxGxan4KnSdzREFB3/Pro2Z6Lne/eGaoxErZyDNVbtJN?=
 =?iso-8859-1?Q?RLMYVHxmsZTL0KLaTEb+zqRY4J+Rp+Kn+vWazc3lTOOgenA2o7PbeI1O/a?=
 =?iso-8859-1?Q?sllBBvs7f3+8QYpktlr1qzWyD1aFPURB2JUDr6WBI/8dvSkA+iaPY1Te0b?=
 =?iso-8859-1?Q?ue7gG3gl0PxZ9hfX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aqJ5a/opIJJcFbM46IjHrq/YGzWVel7tqjeK0k5z7TsNjUKD+fANXTz58b?=
 =?iso-8859-1?Q?IjY3TucYV/LAw+no8p2ZsiqXnYJAVtLHCXUF24nw6adGwLklDxtzgA7vRL?=
 =?iso-8859-1?Q?jtPcA16Sbhlb3P+RmLAmXEpEmaM1n1yrFFKNHEqRjUE2crU8p1s06noohB?=
 =?iso-8859-1?Q?YKBejfYbHQG42rEdEL5tBSRO7r2MhQ6jISvplbp8Hnz4wXOKV/thaEvF5+?=
 =?iso-8859-1?Q?3Wl48ZszRPNTycodbprTE+WGguNvY3SjMXZHPYH8sFIBWyBnACpoO5Fc3V?=
 =?iso-8859-1?Q?FI6F8QBO1ZuGgAcus6Zly32dmx7UZfFll7aYOLirclQtNoA8fadP60yT+B?=
 =?iso-8859-1?Q?oYwR0+61j34Kdv/jTN8xDRHPyF6sBvJn/bZjVfJx/r6D6+W6Vp+BDdqm8b?=
 =?iso-8859-1?Q?mMkVeJQBXCVqw+t7b/vJ80dVH+O3mfOINFU+CumgxGmo58uX06sXDu796/?=
 =?iso-8859-1?Q?hKMYjoH07Fg7lGRcICjuvZd/qS6K8jVtHT7aebdUiMKAcj76nuK2HCHDTw?=
 =?iso-8859-1?Q?4euPQFXrodNDEM656l47KiYSAHoMEBQnBoGX2op0fgEHn1qVS/1nTXiAxb?=
 =?iso-8859-1?Q?ZEylp2GN8tgPZqZm6BAeC7/7LyZxBPYgn7yI/Sq+S8r9s1tyOkJoawPY35?=
 =?iso-8859-1?Q?lL2UcKN/iDECfeyio3d9M+RybyRb0uzz+VN17qX6ttSI0zNcFux1tI3nYU?=
 =?iso-8859-1?Q?7VuK+lWMXGEgCQCGgLSY4uKO0Xn0k4i/KfO2w+7LQ5wx12yi0d0Qksx7Oc?=
 =?iso-8859-1?Q?KJUSGLae/GYqLFycQPGFzO08FdojDWuaDqr24td0FRjgLgMYv3t/SldTHc?=
 =?iso-8859-1?Q?zK94aw9asu1SMcoqfIGRYmro/k12L65mc82rgQow6P+PsGA76RWKeIyzrS?=
 =?iso-8859-1?Q?JZH5ynWWscJg1cegP+hvzlsUjoyEWiowAxCbeqM6Z3zPorSKdXwu39Bq0T?=
 =?iso-8859-1?Q?xA0+ZpcB3bvZgTFb25JzM8MjStcdV51xnhKzCp9tpoT073CpYF8EzSyj/m?=
 =?iso-8859-1?Q?Xll7iARsqIDb7Dd53VrEOSf5TTw0/ke3+Bes6Xetv4XqcwD6FFuQbuEWsh?=
 =?iso-8859-1?Q?lQdm6iWdv2z/lM4U3cPn523x8SZJUIIB+H76PIHrXfd/7ss060uGRZqUx6?=
 =?iso-8859-1?Q?5VtyPUX0y7sn2E6HTLVHzvt9HLBEAZD4gjYihuwX/zVwOeS+RNbxkTWYpe?=
 =?iso-8859-1?Q?Wm9lk8Nse9K040guAhtXAXxZ4/pksmwG/IV7ig5F/wSfKR4VcnWfgCebyd?=
 =?iso-8859-1?Q?106FyUXi3+d0/CjaOu1A4LH6mCIcYA+9696GfQvLyamqHTAjWprRS/d/CB?=
 =?iso-8859-1?Q?GVzGWUJ9A+JrfTrspbQmJXchkyuPnN/Sun279wYAECiGLUNuJoBPnHfDZ6?=
 =?iso-8859-1?Q?ZIu83F/+wYNuGJRCl5KpxS5m/aSTw/XECcHJoYBe2p9TadqyLxVeFvXZap?=
 =?iso-8859-1?Q?F29a6U8uM+z8dxdCZ9UYVXmu02F5Aout2ABCPndozbOBQxv2kN68+JERhr?=
 =?iso-8859-1?Q?iGZV0oWj3SnY+0uJy0rlXascGQAxXKXAFco5I5nGYVTWodbaLeKGqEier3?=
 =?iso-8859-1?Q?wdq2QsmI5kFVpH/4rK0a8b9Xo9syWmHy4sC2lDBfuoonPSzbNVYzkpS8/a?=
 =?iso-8859-1?Q?pa0H7dB7qfXC4McW4zVtpdOu5zTKk7ZSBI3ScqzGAjlq6yDDrnNWaKEA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4860fccb-9cc6-4c25-a82a-08dd689bf935
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 17:15:26.8891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hz1jaWwYeoO00AW82FndhbcXK0yNDbD8t50dGwDmlhY5gV68RHJXOH1kv86sxct7v6y7IWfaHmxZHMtmYqRDKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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

On Fri, Mar 21, 2025 at 05:34:16PM +0100, Thomas Hellström wrote:
> With SVM, ranges forwarded to the PT code for binding can, mostly
> due to races when migrating, point to both VRAM and system / foreign
> device memory. Make the PT code able to handle that by checking,
> for each PTE set up, whether it points to local VRAM or to system
> memory.
> 
> The UAPI is changed implicitly in that before this patch,
> global atomics required a bo with VRAM/System placements. With
> this patch that is changed to requiring LR mode, and
> if the required placement is not available upon GPU atomic access
> pagefault, an error will be generated and the VM banned.

I think the queue will get banned if I'm reading the code correctly.

> 
> v2:
> - Fix system memory GPU atomic access.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c |  12 +++--
>  drivers/gpu/drm/xe/xe_pt.c | 106 ++++++++++++++++---------------------
>  2 files changed, 56 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 9d043d2c30fd..3c7c2353d3c8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2116,10 +2116,16 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
>  {
>  	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
>  
> -	if (res->mem_type == XE_PL_STOLEN)
> +	switch (res->mem_type) {
> +	case XE_PL_STOLEN:
>  		return xe_ttm_stolen_gpu_offset(xe);
> -
> -	return res_to_mem_region(res)->dpa_base;
> +	case XE_PL_TT:
> +	case XE_PL_SYSTEM:
> +		return 0;
> +	default:
> +		return res_to_mem_region(res)->dpa_base;
> +	}
> +	return 0;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 9e719535a3bb..3ffe135c27f1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -278,13 +278,15 @@ struct xe_pt_stage_bind_walk {
>  	struct xe_vm *vm;
>  	/** @tile: The tile we're building for. */
>  	struct xe_tile *tile;
> -	/** @default_pte: PTE flag only template. No address is associated */
> -	u64 default_pte;
> +	/** @default_pte: PTE flag only template for VRAM. No address is associated */
> +	u64 default_vram_pte;
> +	/** @default_pte: PTE flag only template for VRAM. No address is associated */
> +	u64 default_system_pte;
>  	/** @dma_offset: DMA offset to add to the PTE. */
>  	u64 dma_offset;
>  	/**
>  	 * @needs_64k: This address range enforces 64K alignment and
> -	 * granularity.
> +	 * granularity on VRAM.
>  	 */
>  	bool needs_64K;
>  	/**
> @@ -515,13 +517,16 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
>  		struct xe_res_cursor *curs = xe_walk->curs;
>  		bool is_null = xe_vma_is_null(xe_walk->vma);
> +		bool is_vram = is_null ? false : xe_res_is_vram(curs);

So xe_res_is_vram is still per range / VMA. I assume a follow on will
change this to be per page? 

Patch LGTM though. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
>  		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
>  						 xe_res_dma(curs) + xe_walk->dma_offset,
>  						 xe_walk->vma, pat_index, level);
> -		pte |= xe_walk->default_pte;
> +		if (!is_null)
> +			pte |= is_vram ? xe_walk->default_vram_pte :
> +				xe_walk->default_system_pte;
>  
>  		/*
>  		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> @@ -531,7 +536,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
>  				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
>  				pte |= XE_PTE_PS64;
> -			} else if (XE_WARN_ON(xe_walk->needs_64K)) {
> +			} else if (XE_WARN_ON(xe_walk->needs_64K && is_vram)) {
>  				return -EINVAL;
>  			}
>  		}
> @@ -603,6 +608,31 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>  	.pt_entry = xe_pt_stage_bind_entry,
>  };
>  
> +/* The GPU can always to atomics in VRAM */
> +static bool xe_atomic_for_vram(struct xe_vm *vm)
> +{
> +	return true;
> +}
> +
> +/*
> + * iGFX always expect to be able to do atomics in system.
> + *
> + * For DGFX, 3D clients want to do atomics in system that is
> + * not coherent with CPU atomics. Compute clients want
> + * atomics that look coherent with CPU atomics. We
> + * distinguish the two by checking for lr mode. For
> + * compute we then disallow atomics in system.
> + * Compute attempts to perform atomics in system memory would
> + * then cause an unrecoverable page-fault in preempt-fence
> + * mode, but in fault mode the data would be migrated to VRAM
> + * for GPU atomics and to system for CPU atomics.
> + */
> +static bool xe_atomic_for_system(struct xe_vm *vm)
> +{
> +	return (!IS_DGFX(vm->xe) || !xe_vm_in_lr_mode(vm)) &&
> +		vm->xe->info.has_device_atomics_on_smem;
> +}
> +
>  /**
>   * xe_pt_stage_bind() - Build a disconnected page-table tree for a given address
>   * range.
> @@ -629,9 +659,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_bo *bo = xe_vma_bo(vma);
> -	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
> -		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
>  	struct xe_res_cursor curs;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_pt_stage_bind_walk xe_walk = {
>  		.base = {
>  			.ops = &xe_pt_stage_bind_ops,
> @@ -639,7 +668,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  			.max_level = XE_PT_HIGHEST_LEVEL,
>  			.staging = true,
>  		},
> -		.vm = xe_vma_vm(vma),
> +		.vm = vm,
>  		.tile = tile,
>  		.curs = &curs,
>  		.va_curs_start = range ? range->base.itree.start :
> @@ -647,26 +676,22 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		.vma = vma,
>  		.wupd.entries = entries,
>  	};
> -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> +	struct xe_pt *pt = vm->pt_root[tile->id];
>  	int ret;
>  
>  	if (range) {
>  		/* Move this entire thing to xe_svm.c? */
> -		xe_svm_notifier_lock(xe_vma_vm(vma));
> +		xe_svm_notifier_lock(vm);
>  		if (!xe_svm_range_pages_valid(range)) {
>  			xe_svm_range_debug(range, "BIND PREPARE - RETRY");
> -			xe_svm_notifier_unlock(xe_vma_vm(vma));
> +			xe_svm_notifier_unlock(vm);
>  			return -EAGAIN;
>  		}
>  		if (xe_svm_range_has_dma_mapping(range)) {
>  			xe_res_first_dma(range->base.dma_addr, 0,
>  					 range->base.itree.last + 1 - range->base.itree.start,
>  					 &curs);
> -			is_devmem = xe_res_is_vram(&curs);
> -			if (is_devmem)
> -				xe_svm_range_debug(range, "BIND PREPARE - DMA VRAM");
> -			else
> -				xe_svm_range_debug(range, "BIND PREPARE - DMA");
> +			xe_svm_range_debug(range, "BIND PREPARE - MIXED");
>  		} else {
>  			xe_assert(xe, false);
>  		}
> @@ -674,54 +699,17 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		 * Note, when unlocking the resource cursor dma addresses may become
>  		 * stale, but the bind will be aborted anyway at commit time.
>  		 */
> -		xe_svm_notifier_unlock(xe_vma_vm(vma));
> +		xe_svm_notifier_unlock(vm);
>  	}
>  
> -	xe_walk.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem;
> -
> -	/**
> -	 * Default atomic expectations for different allocation scenarios are as follows:
> -	 *
> -	 * 1. Traditional API: When the VM is not in LR mode:
> -	 *    - Device atomics are expected to function with all allocations.
> -	 *
> -	 * 2. Compute/SVM API: When the VM is in LR mode:
> -	 *    - Device atomics are the default behavior when the bo is placed in a single region.
> -	 *    - In all other cases device atomics will be disabled with AE=0 until an application
> -	 *      request differently using a ioctl like madvise.
> -	 */
> +	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
>  	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
> -		if (xe_vm_in_lr_mode(xe_vma_vm(vma))) {
> -			if (bo && xe_bo_has_single_placement(bo))
> -				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> -			/**
> -			 * If a SMEM+LMEM allocation is backed by SMEM, a device
> -			 * atomics will cause a gpu page fault and which then
> -			 * gets migrated to LMEM, bind such allocations with
> -			 * device atomics enabled.
> -			 */
> -			else if (is_devmem)
> -				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> -		} else {
> -			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> -		}
> -
> -		/**
> -		 * Unset AE if the platform(PVC) doesn't support it on an
> -		 * allocation
> -		 */
> -		if (!xe->info.has_device_atomics_on_smem && !is_devmem)
> -			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
> +		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> +		xe_walk.default_system_pte = xe_atomic_for_system(vm) ? XE_USM_PPGTT_PTE_AE : 0;
>  	}
>  
> -	if (is_devmem) {
> -		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
> -		xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
> -	}
> -
> -	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
> -		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
> -
> +	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
> +	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
>  	if (!range)
>  		xe_bo_assert_held(bo);
>  
> -- 
> 2.48.1
> 
