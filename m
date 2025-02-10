Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5398C0219B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 17:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7439010E377;
	Mon, 10 Feb 2025 17:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsSoScSR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E65B10E377
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739209316; x=1770745316;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AN24bQFD089tqGYBDlDAq8migOXqvYxO7oWtcE85xbE=;
 b=dsSoScSR2VvtwF31wZtF523zM635HBIec7imEDtC4ITkGY6NIXStRv3Q
 iPCXJTuVuuU875mQBO5z5cO+XG7NoWkJK/l0Z3kivYRVylt9t0URFGEUp
 Qk1KgYLJu4iNMKElx8vCxuKXHvxTg9871Po8kSU7olm7ycHkLvl2zRV8g
 jpFB+HG+FIT/X7VwIxY4IsTjrLh9N3fo/w2cEiv0g0vL1f/lcRboLQnxn
 CAf5ITk7KTaijxzWszZqBQjfCEjbqXQEKI6Q4hbsYoFfwTqj/4YUR5u7H
 Adh9py4upJJ/hmeRuDqMEh/1t7JtqYgGptTAav+Gp1efsKuMXMWBIqlC/ g==;
X-CSE-ConnectionGUID: JR4BCreER7y/Sc2N9cw8iw==
X-CSE-MsgGUID: /2jDk+o2RbaSAfh879geuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39042103"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39042103"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 09:41:55 -0800
X-CSE-ConnectionGUID: 7q+r9EntSR6BcNvcxrnq+Q==
X-CSE-MsgGUID: aymjc/v/TA2fzbX0vWZ3Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112005465"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 09:41:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 09:41:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 09:41:55 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 09:41:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUEG2dO7C2WHGQci4nNpR2atD+TBC1fzI04AjIVcAaXZnBxDbR5+gZ0TKYyzbLtsbTQqJ4IXA1EZz7O0DMy97v/d8vjY5MsMj8lQkeMiJjkrxYLq9QQn7Xh5PYz7cKRsBzMxoR6Tdf7jHEFiyOfIh3rImpKkQ+CqGx45mt2ljSGyvPqtlo8/MjG3K/uKA5MS3RdYKugic3XsLnoHrYLrSFKVIfoE7ybgVX/4m8yNhJ9lxUvwppgEasrWiaBYEuZbxHeYEEavXDyKZrlUil0bROlM/ThszmFR2s16bUboj6MDJs5RoXu4TkRtk8dDruZFSBNu1sDzpuR3GBlo14RUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aasjmtCNZyNxv5Aa45x9dsk3QQECMrd66yrdc7NbA6k=;
 b=ZtuSFqhrcJxhOuYeiU495r4IJy1nOZWWpq1eCrEB3XuAIIcdL8W5A6v7QiN6OMEWnzCaxaZQZyQ4TId8wWg6d4IidsydHCVhnXFi9s5Ws5G063JXGxcfI8gK/v0BFKg/LhW3BKuXE43XTMpoe+iwmH2AC+nD59hqrmjw51A+rwaz2NwiyUpDz5Az3LhDkS1FL56niUeRCPN3yNxlNnCQcFPd4+ZA7IkJUA0OOEFWk1dqIbR6cjhNOse1yjsVYm7NnkRDTccNsmu+uLMgm3aSQY8z/25Qco9NozjjRKTZZn8YAOh9D9fFDVh27K43o7QxvWy9PoZaxLLbV1VPtTWeVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by IA1PR11MB8786.namprd11.prod.outlook.com (2603:10b6:208:59b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Mon, 10 Feb
 2025 17:41:50 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:41:49 +0000
Date: Mon, 10 Feb 2025 12:41:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 06/13] drm/xe: Add callback support for driver remove
Message-ID: <Z6o6WpGqz_B0bj3W@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207221945.2878241-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:303:b6::31) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|IA1PR11MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f54636-16b1-4296-54ba-08dd49fa3289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VnURAwjqsrluUB6XxzHeVk1PqxuCtoIUAV8auHpc5zeXOWTaUfB5RtXDhn?=
 =?iso-8859-1?Q?ZgwyjDN63sSpQU4SInrDvT/ayBxdq6K8mb4NjU0B0gEbjeLmqKfGH3DCZd?=
 =?iso-8859-1?Q?KtKFN5Aojb5o8KJVYeEs2yF82cREMtB9VqBEpRTeo/nIHGVg7+XfI9gevG?=
 =?iso-8859-1?Q?4tVdnoNEMkfYqyPN635zKRGUy+6ByGujw4Ly2PeNIaVAggMdtmMxah/k/S?=
 =?iso-8859-1?Q?pwloOo4yGrkVAiTNxKIJH496MsB7z9snKMiOP+6zyPnhDLKd+M7n3NJgDB?=
 =?iso-8859-1?Q?PyhNUhC5xjbcFwmD+LQmQiWGWiwS+q5q+HBzXAQDI7OuoQVt2gqNGh1B9L?=
 =?iso-8859-1?Q?8HXi+q6M+tG1B3BAifyf3Jdfv34xUwS0CNaFs7XqnA3IhZQgjgVWZVttmw?=
 =?iso-8859-1?Q?1956cu1Han6FJic9fov0mq/s2YZRBdBh9w3zJ9ohFYnWcW2Y90OAYpQONW?=
 =?iso-8859-1?Q?lKwMajmd30jl+/JvG/7hiuTibKxa9AxDjI8LmiqQ2ZxiL5A/r6Pucm9Sr6?=
 =?iso-8859-1?Q?dG+6XGGqRFvAHx9yuZAZJcBXc9XdlBPJ2o842sjmkcoj4edXW1zggzungl?=
 =?iso-8859-1?Q?sdCPt8Ty2UB81ZWCgKV49oVOgQzHibDUc8bzdj9xXbN33AgTA2lWag/fH+?=
 =?iso-8859-1?Q?hw1Q3s+gC1ZNVlBCEbPC1sMG7bCM35vuzZUUoO3/sdm6wlXO0scXJAReOu?=
 =?iso-8859-1?Q?4CP4s95p6qETa1d/vBD9bdB5wbk0zb63uH/vuwYZEe4gPi/Iase+Pp/+T7?=
 =?iso-8859-1?Q?hMIc2YrZupvtnQJgiVjtDR3qofSfS9reHB3nLh/YI1YZ5B5jWlsFdoA7Mm?=
 =?iso-8859-1?Q?Oa6M16+bvce0vgiJzhle7ZIZSbB/PLS5tIi6+MCvj2k5MfW9xnVzb5oig8?=
 =?iso-8859-1?Q?kID2J5oyjzJ+ABQfPzjoOZ/2h7vdeV8/CADiXEdTrklFUuedu7WEizsZ6z?=
 =?iso-8859-1?Q?EuFgJlQ5IBnfhBnN6+9T35IqiLaeov7j4RtVKZ+5nIoqvwi07zxN7NNN0k?=
 =?iso-8859-1?Q?S59VJnLtMw5H+w8Dyg5WC9FrQuETaJq99xFa2rLzdye1ix9Q6P+95P179J?=
 =?iso-8859-1?Q?/dPsMLTTnaonNBC4Gn7z/dgEsT2dXpm9gHGI0mq44Yz7hp4lyvNILuK5nU?=
 =?iso-8859-1?Q?+y6MOlwlr1xPRN1KQ/p7B5YFqeA3XryQwClc06FuYjX4DKpixg6i0nr4x4?=
 =?iso-8859-1?Q?C1A+HcGy7mrVxEdVRTlhwkpc02d1JLCq9ORkBVv32jqDOQkBAx3mdUB/Yj?=
 =?iso-8859-1?Q?65eHOPNd/Lnj+9Cqwnz89Fumqf6n0yCvZWsmvB+GY8YKd7DLgZR4KLZRjm?=
 =?iso-8859-1?Q?IcLFj3aL8he1cb4XoRu4tI78DZZiusbgAJHFmqHwdMzWWaelzJsirC4VG3?=
 =?iso-8859-1?Q?x41DQR2lXR4prWw6bzY9BK5oWUU5RGvCC22nmZJnfblH7GAxtJJPFOhxxx?=
 =?iso-8859-1?Q?7zbQ75oQR6lEbufH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/RqnbZT+fhNn1Do4HeBTicnPeOuDFkpNpKD7ynaio1Gw1yB+UDCCR42T0+?=
 =?iso-8859-1?Q?2gW4UH9mhIPA63ZV6jL2yk1cbNkx6N8kZXJtJqHHrY84Xgcr81P63KDd1A?=
 =?iso-8859-1?Q?rcizsALL7uc2ak/yjkb2fr80jQtWNLpwS6I1BXUwF7Vk7kTGPFjsOhXiPD?=
 =?iso-8859-1?Q?+xR4bvnXvzie6GWul2X+LXjUGKkqJN8VqaLxjtD4VutC+tNZCJGpqpMOPF?=
 =?iso-8859-1?Q?YIX2oxF4jUDH4YCRxxCpjnna6FTTLNVDxeul9PDbxTr1zfpUnA5dQTHdQP?=
 =?iso-8859-1?Q?9O5EwdGlGB69iTlcXT/U8BeUTkkI8iQyUKE/++3lRFwbQZNoCiS1RfbuX7?=
 =?iso-8859-1?Q?OoexONllit4gHNPrqErSjkiD9vOgLMTPYsvggsjp2xX75G/JQBrM6JmaMn?=
 =?iso-8859-1?Q?GwvOco/+TBeGFDIVueVdDP8LDjgNCgTCNB5Huh+akpiUO7HuL8Y2LiATXc?=
 =?iso-8859-1?Q?/bOYUkK19u9Dkv5dlMSup3dd05l83rLszcR7xyWFIrx0Uw1N9bK3UHZPtk?=
 =?iso-8859-1?Q?3egOFgUiUthSTqW3JJl80IJlExA0zHK5EYSimOezVoUy+1+L8ZGd/3DGzI?=
 =?iso-8859-1?Q?fyxrlbocSVCPg5+DvMO6M6M9/nppFG4Wc6Lmq3GayS/ey/sEhbTpp3e2JS?=
 =?iso-8859-1?Q?GSwT5LtmltBQR3mlK3x1ueh9pT4mKCuX36zqxQPYxbv021c4KIt7KQl8ZK?=
 =?iso-8859-1?Q?dvRdWrfXaKFJf/8+/sMCzje4Q4ceXZjUqgmvhT1yHCGYbPC2y//bDithoW?=
 =?iso-8859-1?Q?Ee4CNUPgZV2jCS22MvqH63hLUOdeRiWLbMyKGIq8evqW+W0Vw4H7JOxmpf?=
 =?iso-8859-1?Q?CE/wOwZqr/C3IfBg6TkVK2gM0NvKFJ/FJJwHxo7EuRBFWPcVCHnplHfeiv?=
 =?iso-8859-1?Q?Ls1DnCAUVO634bNwYGPlVdAZQV36RSTS1l/IqI2xM5JjMiGhRO2NElFq9z?=
 =?iso-8859-1?Q?l/6och/yw2ELC/Ip04sgqSeC8W67Ec2cuNIoR175h7c2u/z1jXAu3TRPha?=
 =?iso-8859-1?Q?ApoDal00brCGOA0vdJ2oM4Zkt/poMh3SOua1OcdOoy20+6DEr8Czn0iUQ9?=
 =?iso-8859-1?Q?DgMZ2DDs9/8IbC9wxGMmOw9837qi6gIpZtb+gD2Ved5Ex4dGjdgSfJyvsa?=
 =?iso-8859-1?Q?xa9AwiWQ5qUkXp6LJTQhgk+eKMnqafIEaQv0zfNBBO2EjYLS2mrg8ABO7u?=
 =?iso-8859-1?Q?ZBjJ1LmEtJHeaIbM+L3CBA+YgWmeSJRmSuCKgFfzZSKftStZFP+zaIL0N0?=
 =?iso-8859-1?Q?lZwcOlMYA+c2SzvYLl10u59tq22rwAXA2IWchcQgMkYW/ZEBQuUDWLBpSq?=
 =?iso-8859-1?Q?ggOplFMwnRFp/amknfM9ZeZs9dlkNnEqMrB288If1JPkIgqhM4lJ5SI80t?=
 =?iso-8859-1?Q?qBtdJfZ4NPrLRB0iq63aZth3P9i83M98/Mz+thtcKfX/xEBDs1ofdjt35G?=
 =?iso-8859-1?Q?WHJvb5BW/+LNAfArGJeqpkO9052DNa5Wa35N7dxr1IRITQ5WOLhu8CFquN?=
 =?iso-8859-1?Q?LAKB4n16cMukPLKLkxNyFjTrJj08q5Q/01IIRxNCf4R1uhkVZeEJzPewlK?=
 =?iso-8859-1?Q?XP4rkdYdJjkTYrDpYHz0jBq76NZsKXndxZsSGW89i/K64l9YdVIg9JJm58?=
 =?iso-8859-1?Q?26HyikhT0OWRxRu55dwGogWtxWeITI0HMatHzfqUeyafr55bmCiqRS3w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f54636-16b1-4296-54ba-08dd49fa3289
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:41:49.7633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Va6BMVEst/7icK4opIkigEtATWv5Z4cI8xVr4RvyH17sLXmHaga4gHmCoZ27csDvaATjKqsDQqXaDIL3AvcqOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8786
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

On Fri, Feb 07, 2025 at 02:19:38PM -0800, Lucas De Marchi wrote:
> xe device probe uses devm cleanup in most places. However there are a
> few that are not possible: when the driver interacts with other

"few cases where this is not possible" ?!

> subsystems that require the cleanup to happen before the device being
> removed from the bus. One example is the component_* APIs used by
> xe_gsc_proxy and display.
> 
> Add a callback-based remove so the exception don't make the probe
> use multiple error handling styles.
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c               | 59 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h               |  4 ++
>  drivers/gpu/drm/xe/xe_device_remove_action.h | 24 ++++++++
>  drivers/gpu/drm/xe/xe_device_types.h         | 15 +++++
>  drivers/gpu/drm/xe/xe_pci.c                  |  4 +-
>  5 files changed, 105 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_device_remove_action.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 90275531653fe..5fc4e696262f9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -747,6 +747,9 @@ int xe_device_probe(struct xe_device *xe)
>  	u8 last_gt;
>  	u8 id;
>  
> +	xe->probing = true;
> +	INIT_LIST_HEAD(&xe->remove_action_list);
> +
>  	xe_pat_init_early(xe);
>  
>  	err = xe_sriov_init(xe);
> @@ -892,6 +895,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	xe->probing = false;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_fini_display:
> @@ -911,6 +916,58 @@ int xe_device_probe(struct xe_device *xe)
>  	return err;
>  }
>  
> +/**
> + * xe_device_call_remove_actions - Call the remove actions
> + * @xe: xe device instance
> + *
> + * This is only to be used by xe_pci and xe_device to call the remove actions
> + * while removing the driver or handling probe failures.
> + */
> +void xe_device_call_remove_actions(struct xe_device *xe)
> +{
> +	struct xe_device_remove_action *ra;
> +
> +	list_for_each_entry(ra, &xe->remove_action_list, node)
> +		ra->remove(ra);
> +
> +	xe->probing = false;
> +}
> +
> +/**
> + * xe_device_add_remove_action - Add an action to run on driver removal
> + * @xe: xe device instance
> + * @ra: pointer to the object embedded into the object to cleanup
> + * @remove: function to execute. The @ra is passed as argument
> + *
> + * Example:
> + *
> + * .. code-block:: c
> + *
> + *	static void foo_remove(struct xe_device_remove_action *ra)
> + *	{
> + *		struct xe_foo *foo = container_of(ra, struct xe_foo, remove_action);
> + *		...
> + *	}
> + *
> + *	int xe_foo_init(struct xe_foo *foo)
> + *	{
> + *		...
> + *		xe_device_add_remove_action(xe, &foo->remove_action, foo_remove);
> + *		...
> + *		return 0;
> + *	};

Although the cover letter mention that this should be the exception, the
documentation here doesn't make that so clear.

I believe we should be more clear on what cases this structure is aiming
and some basic rules on when to go here instead of devm or drmm.

And probably even keep that comment where it is used with the GSC code.

But other than that, the code and the approach looks good to me.

> + */
> +void xe_device_add_remove_action(struct xe_device *xe,
> +				 struct xe_device_remove_action *ra,
> +				 void (*remove)(struct xe_device_remove_action *ra))
> +{
> +	drm_WARN_ON(&xe->drm, !xe->probing);
> +
> +	INIT_LIST_HEAD(&ra->node);
> +	ra->remove = remove;
> +	list_add(&ra->node, &xe->remove_action_list);
> +}
> +
>  static void xe_device_remove_display(struct xe_device *xe)
>  {
>  	xe_display_unregister(xe);
> @@ -934,6 +991,8 @@ void xe_device_remove(struct xe_device *xe)
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_remove(gt);
> +
> +	xe_device_call_remove_actions(xe);
>  }
>  
>  void xe_device_shutdown(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index fc3c2af3fb7fd..3fecf865957b0 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -45,6 +45,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent);
>  int xe_device_probe_early(struct xe_device *xe);
>  int xe_device_probe(struct xe_device *xe);
> +void xe_device_add_remove_action(struct xe_device *xe,
> +				 struct xe_device_remove_action *ra,
> +				 void (*remove)(struct xe_device_remove_action *ra));
> +void xe_device_call_remove_actions(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
>  void xe_device_shutdown(struct xe_device *xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_remove_action.h b/drivers/gpu/drm/xe/xe_device_remove_action.h
> new file mode 100644
> index 0000000000000..e0322c4660dda
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_device_remove_action.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_DEVICE_REMOVE_ACTION_H_
> +#define _XE_DEVICE_REMOVE_ACTION_H_
> +
> +#include <linux/list.h>
> +
> +/**
> + * struct xe_device_remove_action - Action item to run on driver removal
> + *
> + * This should be used like a list_head, embeding it into structures of the
> + * individual parts being initialized. Once the remove action is ready to be
> + * added, call xe_device_add_remove_action() to initialize and use this struct.
> + */
> +struct xe_device_remove_action {
> +	/* private: */
> +	struct list_head node;
> +	void (*remove)(struct xe_device_remove_action *ra);
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c0e886bac1831..4c902e0cb4ba9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -13,6 +13,7 @@
>  #include <drm/ttm/ttm_device.h>
>  
>  #include "xe_devcoredump_types.h"
> +#include "xe_device_remove_action.h"
>  #include "xe_heci_gsc.h"
>  #include "xe_lmtt_types.h"
>  #include "xe_memirq_types.h"
> @@ -428,6 +429,20 @@ struct xe_device {
>  	/** @tiles: device tiles */
>  	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
>  
> +	/**
> +	 * @remove_action_list: list of actions to execute on device remove.
> +	 * Use xe_device_add_remove_action() for that. Actions can only be added
> +	 * during probe and are executed during the call from PCI subsystem to
> +	 * remove the driver from the device.
> +	 */
> +	struct list_head remove_action_list;
> +
> +	/**
> +	 * @probing: cover the section in which @remove_action_list can be used
> +	 * to post cleaning actions
> +	 */
> +	bool probing;
> +
>  	/**
>  	 * @mem_access: keep track of memory access in the device, possibly
>  	 * triggering additional actions when they occur.
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6a8e82aff3853..70b697fde5b96 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -905,8 +905,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return err;
>  
>  	err = xe_device_probe(xe);
> -	if (err)
> +	if (err) {
> +		xe_device_call_remove_actions(xe);
>  		return err;
> +	}
>  
>  	err = xe_pm_init(xe);
>  	if (err)
> -- 
> 2.48.1
> 
