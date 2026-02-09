Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89E9E94602
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 20:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF4910E468;
	Mon,  9 Feb 2026 20:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXwb2vBj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3609010E468
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Feb 2026 20:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770669161; x=1802205161;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/4KmZPUIXgTruwuVdQG9j3p9HsfJwgu2gczo6ReERMA=;
 b=ZXwb2vBjca0USIyVfOI+35QanrPUdHaUg73CG2/pqOyckC+V6+rhnf9e
 K41aqVBLYYS1ukhr6ZQa0vCxAeHIss20nMp9jcd4BgzwBO+3AXJvZHRM9
 XRN0VJ6xJdEHo/nXZQzgSPR2t+7oHTjaYfLNaEzRyxN2DipNncTOGWGQO
 mGP4aKVLGMUgpUcU5UDR2sNmw6ilS/IW7oMOK7bhAhKlLmVsqlQ/UNzUz
 NGArEumlabBPtDnGPk2X+xISFFiqawhCe1V77qrcAIKrHzRIP6kc+kus3
 qqrGY732VTRDNIAgkeD7XGQ6Yat1YeuxPUKdBB+MujPkqvbwbaQSh9Gh/ g==;
X-CSE-ConnectionGUID: gTZCE/kZSFipOcPVLLUeVQ==
X-CSE-MsgGUID: vYE0XYpARrGcH6XfTo+3Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71511996"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71511996"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 12:32:40 -0800
X-CSE-ConnectionGUID: ojhGBAjySRK5TGWhtcaA8Q==
X-CSE-MsgGUID: Bg7OYDAgSN2VFnQczkMYeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="216214998"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 12:32:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 12:32:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 12:32:40 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 12:32:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6hEj9PjRdIkbllJ1l8g363UC0iyGQRWZm3nuhDSvJcUNFiZwQ80kXwbXHctB/QWNBaktBmv5/Cha3NVCXueIWeOVmmeIxqFC6B5wlcXbHc7HTMrVLzcJ3FpjEqTXo48LXByAkRe2hwBUWvjC9Sg/qh6pZ9QUZcidSCXjLSFDmhFXVA26L5jmKM6oltvINViX3d5GbXwd9tILP9v0lFUApjYOnHIzZkQxdza6cHYexqC2LHg/n/BufKqLqhEuA73k8XD8OUil89Mh8lefKVan9uj520UnsvBP1c/pM+/CvBLYzyHsHm8WwuGEG7JArkEQ6Oyf+rney2TToPt8JSheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OU8NdHcxD4FX+0lNu+Y7zNKkitB5blAptQHAQF6YnR0=;
 b=mDfoNanlJQdf7SW8/Wyq0yIuX5AqVeRB+giOK/UupwUsycFUo9PRoBdeQqrrVCnsztoBZLUAff8kdayPz2d6Ppp1dkZ649OUZp2q6iRUcuqZxaIdXujz+lYY9Ile+t3REtHhl0Y6SpNcgpwY1ORmkjXFVvndLNEcPSnpxxm8Sx7OF6hwBozYcnHvgYDNSZT/hbCSkv/rn0bUQYhvCdSHO36pwncci1kuKQk3pgmIDBqPXALgWO1dqD/d+8eRfG85Ot9zbAZlpWJeLwi61yfgPKl1THtWmUB81Ei9wU/2ZB5EYZ8rH49Fk7c+MVh7aroXttH5Vlg/Q7586nUgGxp7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 20:32:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 20:32:37 +0000
Date: Mon, 9 Feb 2026 12:32:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vf: Allow VF to initialize MCR tables
Message-ID: <20260209203234.GG458797@mdroper-desk1.amr.corp.intel.com>
References: <20260207214428.5205-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260207214428.5205-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b115d9-57a8-4569-4550-08de681a5cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8YjFncdjwybqVtTdN3ZtQ1L6hjYhkuaRRwebFXnMP3VPmfrEWmcOMbFGqyCf?=
 =?us-ascii?Q?5rU/vWtnbO8kS5VnlfxUBU+/pObOaK/T+F65wDwKU/X3kQHRXBQV0CIYK1cK?=
 =?us-ascii?Q?n+59to2dUZ8IPD0Qa5+0U0FdCrx8S42V8ciRyFhh3ns5OR38ljkhgWDz1loC?=
 =?us-ascii?Q?8mK0P/750ERqTJPTzNN9OGxJC/FNQYGMY7pSKr7ATanZBAYnOrdnnZjB5hBF?=
 =?us-ascii?Q?SAvk1/Y08YdNHFwYfXC+zuwM3JANAvcWY6YrNmH1q6YLWhMuDtocgQf6bNlP?=
 =?us-ascii?Q?ORCvDBfH8ZVIzcwKN1kSF1hN7TNFFIydNN/uC0raDKPJRflv7GCAlyeLAzHg?=
 =?us-ascii?Q?v3ik2LRg0QQ/6UFjj/VwYhIG5vR5nxM+AJYR3i9MI01mtUeYbfrYQT7lFqH6?=
 =?us-ascii?Q?du4hir79xxyXfSOQJ56f8JInUeL/5yYdG3c1PN0xGZ1orfL9mVmK5dKqcx+Y?=
 =?us-ascii?Q?ROraY704Td3HVfeA1ZA32S/ehRl8MC0t5UbuG4DknCErC7U65MFlK2N8euz/?=
 =?us-ascii?Q?53/zRCL7PlG0ouYaKYYKnIAZItkivkCTnZULUSFmPRZtjz4ksacGbYp02hpz?=
 =?us-ascii?Q?JJnNpAlJRmpvqefy+9oo5+ToIwfiSjWW9NRr+LDZ04SOKZePnAZ5KqkuSUjC?=
 =?us-ascii?Q?yxYnRaQrjU3zH5vtCwuRoOn3x/rQoe2fTawq6uiB5xeF7V+mmK1iZ28BoNfo?=
 =?us-ascii?Q?8mbmAluE2PATIEO6y5DhLY7PALCRTStNY6J8xJk7gymbHe7AYMf50LXLJ5IX?=
 =?us-ascii?Q?kkdno5OpE2xvC/nS9zcUt22HF5fdtCFWrMYz0wlPUF7Z1TYyh9uXkONEPSCZ?=
 =?us-ascii?Q?nuLcHZJOOWEwerefDfT9ORBO3Qf4XU5FWAXoa77hR7vIOQMnxWB3+fggr7gO?=
 =?us-ascii?Q?3SCHUVaqpubCTO1ZkQeYUrQD56Wfj9uj8dJSaRfKad5VC6TEHSGGA2QZXanf?=
 =?us-ascii?Q?obx8mM1DvxrGmIbrd77HWRanF3GDHpefTjrNHHvJxBgRmJPspBokte27EvKE?=
 =?us-ascii?Q?iEZM8Jk6zOvu8Z/zGp3HS4YE2saSTLgBdGSnZ6oEFw4qewWE9+Rfs+VItUPO?=
 =?us-ascii?Q?86L6pmstRB1rB3yu6k3Cpgs4SDe7ibL3l6XIv1RRPLBriWAIeBZWLnMu8VfO?=
 =?us-ascii?Q?NAZxHXd6A9w8SwO5mWAaoGHr+v+zvU+3+IlCW9raR6mAhscR3Nq3Ilw9LEKc?=
 =?us-ascii?Q?zX0qF71JDPFOpKF79tXDoHNq7WPMmL5RuNu+jL4bTfLZfHdnJLabrPRCyjsp?=
 =?us-ascii?Q?5bkO2TtnJVCbx35fj3epaA5qVvGx/edCkm2DCQ3xuCSLgMtALB9Mzk99IEvL?=
 =?us-ascii?Q?U5wuy5kEqc4DN9pJNCVPvJQsaPiVjunOZIYZC9kraNVjnlXFdoSzfH1KUELS?=
 =?us-ascii?Q?RN1IyeSHViA9W3iW3JC4O4EfB6WM/GfWJtnmpOMhhABmwUDomjGIFjsi3Yqc?=
 =?us-ascii?Q?aziRyhYZ6RdHjIhmzF+sxBbXmgSlIjupMlvPioBebk6WL7EP7fWhM3Za358W?=
 =?us-ascii?Q?B7Bv/QxaFgAmm6VkP52wmezUNKkHykuyAs4XuA28OgX/CrCKMPTflSw4w6RB?=
 =?us-ascii?Q?nDO9pYrbti7Gq4C8dWk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YTwNKSlfM9q7uwsIq6uDyKjnxQVmdOC5xpSj3rWs0/mQu+NOjYY9Bl8Qqmti?=
 =?us-ascii?Q?thDaDSWw28+qpKJYIjj4EdgdTpJzJ/TuVI1Ppkz0IQBk8NgPZZ91NRFjp0KL?=
 =?us-ascii?Q?KNDaST5C934Accp93vYlOjj4bJ7IFQynM07Skm7O/1PvCvGAKuSNyRZTvTxM?=
 =?us-ascii?Q?Fgf3shB8eyuNZ5VApP5plhpOT5G43/8SshjHcIK/A3hUhknXfH54+J3e4GnW?=
 =?us-ascii?Q?9u3aypvqCzjpgwii6m/tvfB2Rz6RRZfwDl2ijUDZ/DeHxPYmQd3HI6awYaEi?=
 =?us-ascii?Q?Zsugz0TqYF/OzpVMHXBVLWnZjaEXdqlbJGXD4GC/7H5WSYDYkvDxPCyPaXzV?=
 =?us-ascii?Q?qnxFAzbRVy6oKr+LYL6oivQfRGnFMq1V8V8XiR1y4hxcYtpih/c41cFRZnJW?=
 =?us-ascii?Q?fXfLo3fGCQbm0tM5AqWUCM1F3NFMtr3Taprrpx8UlWKkcCRn3uzmykCvU/ao?=
 =?us-ascii?Q?tMVuENiZU7OSuSqj1y02lQhf5bUQKmgVBue4RlXfhjyksKSgfmTedqPcHE3t?=
 =?us-ascii?Q?PlJ576oOMXVIy5A0AdfmGTcmkozeeBE8CuhfIDwYvWer5XoppJ538Zm7jLql?=
 =?us-ascii?Q?+KIWUi3O3zs8T5uhRr8qpmMx0MD98YTn2Cn8Ir45BEo1fphMv9MGyGk3uf7g?=
 =?us-ascii?Q?Egh55wOyXZh+Jin6cXABm0d5T8ADQwPEttlk4f3IQxnuCbmNsQuD2+6IFhMj?=
 =?us-ascii?Q?zJOavpkfVYbXg2EAJf/1Zq/mDB41EbaTSzUJzUGbgIIJDwUoVrzXoTnHZ5qT?=
 =?us-ascii?Q?AUk7/ZEY0wU9kF65BOt12MTf0ZSVnY0ukjJpfdsm3EsSjvIzRvHTPfZO9UEb?=
 =?us-ascii?Q?xO5Ys2WQLHT5RdwIAxqYHEYqgYLA/tlLTGmmWA+lkWTzn8JOJPC3hfF3y/w6?=
 =?us-ascii?Q?Ku+qorcWIB0xjT+m9SfG4jJc0Izy1XzS0aJ6ZuNj2RzHbRfTV9wdTzgAY8wF?=
 =?us-ascii?Q?Zi07NgIJ6SIUTSNXWJ0oF451EHxn/e0Z7iZ7E2TvVzNQ91jyGC8k+aSjUwGN?=
 =?us-ascii?Q?J8mXM0lAZU1c3brGQiLUvfd3ngU1T2PAp/R9oPWq+cDwd9hreE+6wHQ10v9k?=
 =?us-ascii?Q?rhi8dawwIvon3uXNWdlDGmZDXp/Mh/8YJi4oOxFO1WSTUKtLQq8DGE/ZONN8?=
 =?us-ascii?Q?hE38/bCTwP4NoFtpZCjjtPigCKW3W+XCepRHdwZ6+rZsdakXE/wxcG2JrB7B?=
 =?us-ascii?Q?IQCM7LysaV0hHg7N2Pw+8o9kDIMHMNT49Pj98C/wbBPCCNCso55RPLNK/L7o?=
 =?us-ascii?Q?9WIrxlwkq8DdZhugiT+2899fd0jXjgSmn5uNQtBDqzcdjUI21opqChrNt1Xa?=
 =?us-ascii?Q?guvv9XW1yGq67dsN2pfH/N85i/bhmgRjlvYnU//EvnGomsOtRcKTE3Z9PfkY?=
 =?us-ascii?Q?p1vpF6ZsF8crV7ocDL0LPnGBjBl26qKhJF56OEGGvBSE3KRpwcljAFSXdYp0?=
 =?us-ascii?Q?L0iA/8z0URwolpeb2Iet8k8a6l3ybN4tFLtLp1j6CT/5qGYps578JfMHVa85?=
 =?us-ascii?Q?RDypGOUfmafiz5SqvEnEZNU/sadqoEbRLpvcxUQFMENr2dCR2628gDL7Y6lT?=
 =?us-ascii?Q?5r3miPrXadq4U/vh6mOSA7s2hgkcQ2LaeQUpuS37PJ6BazzOTGfSZFypHkaw?=
 =?us-ascii?Q?DfCmY2dTjSa24w5Qp2ruKhOQnAC3rYxllQ0gMv9pK2rqBRErZ9zU4qhqW79i?=
 =?us-ascii?Q?Pfoau3VaxfUtF06j3VCkM0uEW3AUMW9N7h+D8hVmxPhTBiMKEyeozvkzuWsR?=
 =?us-ascii?Q?GPEaMT3aIlv1yuC4KEfYjEpnbDfu48c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b115d9-57a8-4569-4550-08de681a5cf1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 20:32:37.3278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6OmgMu+7B0QFPLg050ffoKkHsmrwpRwV6rS71AIqt7SjbHv2+5QuFnnK0VS0RPkBy/w0HkNTsmPtMNsuiXhPG2sqiNLcMPDbmuaS2dCD0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
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

On Sat, Feb 07, 2026 at 10:44:28PM +0100, Michal Wajdeczko wrote:
> While VFs can't access MCR registers, it's still safe to initialize
> our per-platform MCR tables, as we might need them later in the LRC
> programming, as engines itself may access MCR steer registers and
> thanks to all our past fixes to the VF probe initialization order,
> VFs are able to use values of the fuse registers needed here.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-xe-next; thanks for the patch.    The CI.Full failure
reported during a KMS test is unrelated to the MCR initialization here.


Matt

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 7c1fe9ac120d..66c4efca80fe 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -505,9 +505,6 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
>  
>  	spin_lock_init(&gt->mcr_lock);
>  
> -	if (IS_SRIOV_VF(xe))
> -		return;
> -
>  	if (gt->info.type == XE_GT_TYPE_MEDIA) {
>  		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
>  
> @@ -568,9 +565,6 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
>   */
>  void xe_gt_mcr_init(struct xe_gt *gt)
>  {
> -	if (IS_SRIOV_VF(gt_to_xe(gt)))
> -		return;
> -
>  	/* Select non-terminated steering target for each type */
>  	for (int i = 0; i < NUM_STEERING_TYPES; i++) {
>  		gt->steering[i].initialized = true;
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
