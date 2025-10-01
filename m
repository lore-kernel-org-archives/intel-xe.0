Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7804CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 07:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F92910E693;
	Wed,  1 Oct 2025 07:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvnGexH1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4325610E693
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 07:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759304083; x=1790840083;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=X5VdRiJY0PGqmMLXZeGT3zlMoRtiYX1C9GPHCIZ+Zo8=;
 b=BvnGexH1qL86ZOOyAIsyEhSCUMvo0ot2km/9TatmhuVadhk45l30PsHv
 E+5rEsDBHNNGUAGroRcLIxyNuO1aFAKipgA+1D1inYp0EfllUUphvjp36
 pjRAj7waJYPfTw9pyPaF+uGnXj8IkzeMqnolIbbCm2SrnCI64ISbNZ7So
 7rLBnllB+eJtvA4RI0Y9/yG9zBqVaodBf19mNOPwQ2QlP8kvk4HgMztUv
 aXF4NC0q8bwMfDQIZcpp/pfbyJHY3O7GYcI9wEo2raDUA+cOIqDr7+J3h
 gFFT2NQ2t5eL7Di0AThl7twdFb6uT9C57/O+qAIH8tnV6Wrar9uDGkYtG Q==;
X-CSE-ConnectionGUID: LcmkQ1XLQXKqu1TAixrgTw==
X-CSE-MsgGUID: wq0XJBcbQqy9OtDNY1o8PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61279820"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61279820"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 00:34:36 -0700
X-CSE-ConnectionGUID: oSj0pyJxQU+ucAKYJVk1Xw==
X-CSE-MsgGUID: /ihMv8eMTP6okZbueuiRIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="177849711"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 00:34:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 00:34:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 00:34:35 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 00:34:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bawHvCRQYwO8IOagbt+tUoJWo1yq0hbHSuDz2HgoOslwiScrZ5YSfvLX35Y1GFv6GT8ZwmdZAu9nJ5ks7b3O4WiTlpC4sWzXtjcd7ggBi4W8O+IqcpCyU93XU7W4UJPtuZvIq7UERXr8+eOUU74ASntdT/aE3Tek1lx4cABfA7ZYLxHwi9k06J+jEVSJ8pKgdMByDJxI2WOUnkfZWomvpfOBcK+BTKD2891tJFYhDdckXa6fyMWCotrA1INbvepLbNpwOhOxqoJwJd0Nn9P8EWfP1dhAa7ysfLd83Zy32aE/Bt0j/+b231wKMx/aww6APqfRlgJlfiY2MV2YlwJGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0yT9qFARWeIZwtpZkDRA5V3TWiREnmiIAnlt1M//hE=;
 b=VNXbLwFNpDMKWDXU8hCgiJ2mtQJQXCopio4LfzNrYEof+cL21gEQQrUSqmO49J/fC+23xWBG9z926VkUN2zEj5eIhnll3N1E+1G+yrcf1rcVEeb7HjCq9mRGnh7yVq+KhdP8S9aV3xNQwHMlbSVhxanDM1GGmMI49piuCd/Vl6V/IH0nzwcQiz1eeUUzeUB+7G809odjiqFfnoVYaiDdwfPASvZmWF8kXE3PX/NWqaBrwh9D19c0FZOO7b/SodErIG8hqyN/nuJHChhcgj1zteiJWY9sfdpZAOhRL2Ys3czRSimPjqlkLisuhF+d4FQGnDweiDyQOLp65GjAjqBxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 07:34:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 07:34:28 +0000
Date: Wed, 1 Oct 2025 00:34:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/xe/pf: Add top level functions to control VFs
Message-ID: <aNzZgNIIAgd6OBzn@lstrano-desk.jf.intel.com>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
 <20250930233525.201263-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930233525.201263-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:303:dd::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: b291963f-e06e-4f55-85e4-08de00bcf416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?z1+ggz3uWO7SL32ijA/yD64HZ1FvZlcWzRd3Fmf60vusSpdaeNPDkzQTIF?=
 =?iso-8859-1?Q?+BqgKVtC3K43VffS+NhtM5Wwd2L/X0T6jBwi/b/B/0Cg92vqOKNjBTGEbS?=
 =?iso-8859-1?Q?0dsc/PLjH5CvMdI4MM87Bx74Yxa+n7mB6aAX3iJdg8hEmwAoY+jyBYpWhh?=
 =?iso-8859-1?Q?TkMvkglxjaxFUS+MJND4bpOwSWA0PKwcUewexX2/NokP60b/1pXIJPYy78?=
 =?iso-8859-1?Q?X6sbvhp+e5i1EWEc82rABzcg7H/D98jkp0SvaQACzw+07kQI72lfrfGEhT?=
 =?iso-8859-1?Q?yvhdzsEdzf5JWoDzPaC5BzF8zaqWjDGgbIksDhg93nObl5wb3+bhlvu169?=
 =?iso-8859-1?Q?6LO6lOA0vEfqToOQHUe/ReKk6XCtB2+Lx/HlUv3wBH6WMVleac5bKO3fnc?=
 =?iso-8859-1?Q?Lg9WHrawS+PEkub9F6YunMfTcn4Yucf+XLAOy5RBsJFLyERlqUWuGkpnm+?=
 =?iso-8859-1?Q?iMcbCgG6mcyMUu0yzlM+C6mlmWC+MUtSswBmdjsfWWWguHjzzY2+g6FzX/?=
 =?iso-8859-1?Q?jdhODkjOfKcCEHjb16//hIB9WX1OQ1bkMRBLeHUKPIxWf+B7KlCbMccDlh?=
 =?iso-8859-1?Q?cdO9qiv9UlQB1EmsvgNUGvebPiyucmIAWi4LEYHRRGioDQigJP2o0uISj/?=
 =?iso-8859-1?Q?ysjbGetl29p8CBjvVm4QrzpWi2CET61a9tcQUJU+4EkQct+0jr2NaFytW9?=
 =?iso-8859-1?Q?HOP0nKrQkOgs5Cz9dgCbq3abhQ37sGZ7zYblGzN+DPkk/FydGgU9llLa34?=
 =?iso-8859-1?Q?Pw5t2lZfQCXAbS++bPsNxwscLSrZaeS4YHKTZeyZaafIvso19qIaoH4wCf?=
 =?iso-8859-1?Q?WuXlh29GBid3SsmiLT4v2TWY41z58tuOzs1ifS42ie5UbhbO/Lfz5cMIb3?=
 =?iso-8859-1?Q?k23/SndvFniYOith1UJ8LzsuFepugJjSuiP8eI7a+Sz6i2lwfLNGR3Stv0?=
 =?iso-8859-1?Q?izFqrxZIZa1MYu5//kar8P5L29PDC3HokgWdgte2il0ryak0JR26a5zbJD?=
 =?iso-8859-1?Q?JAYa48xs6j/pavfupa2kodgCoo+aybgJa+N7vtM+NgDSU8JDz8bSyt5Lew?=
 =?iso-8859-1?Q?F5/rDor8yTiUmBpw9ZLk4LRdCDFbhntDRBzJvMDNhdvaneKYn+A+MOA4pG?=
 =?iso-8859-1?Q?5hsA1lfQADfXG5DgeyXk5DeqOhh1S8Ll1vPjzHeopGRDyfzNpyaLaFOdy/?=
 =?iso-8859-1?Q?/8xFsnpAeNd8dyR1mWlxnbluBoM1DPa+SVK9U7oMLFQuffGok1o3uCN60C?=
 =?iso-8859-1?Q?2pBbJ9VrxAWWrj3eJMnlKkwBVssFwAeP+0yFvTK/DWRTrI33K0JeGdekAe?=
 =?iso-8859-1?Q?9Tu2UEy4q6h+bAHPTJN2YNJb9hntl6nd+Ha55+G4oniG1z1shM/wUp+gvV?=
 =?iso-8859-1?Q?AYta8KQy78kXPJwRBgC5XwlhVkn7xk7T3VqAC9nq20uEBZzh77Ykv38ptQ?=
 =?iso-8859-1?Q?hYujKE3O+yaggwCGpV+jXz2XsPOLxNZ1/vYXAKGbnI4EELitaKNL4/3Q0j?=
 =?iso-8859-1?Q?HMP3cace3RHuDUSh4Hs6h6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Nb1pvcAtFKGmsMLjeXHVXWCD4JlFGo3XwMhogtLdwbPZtCGWPow2rAItUy?=
 =?iso-8859-1?Q?u3H9s92vWyvRQnnW0wabCFnauLCcS0FoEWzLzbSPHBfv1r6gY58lNTUo7t?=
 =?iso-8859-1?Q?I5Tqc5sIdtzUA2e4sS7X7I+WzmNFTzNkSwJrJy7SMm5RgAAVCtCfxRSXt6?=
 =?iso-8859-1?Q?cWOnm2Uu/MyPTWJy1q9pHiq0YxnqhaIeUg/XbEK2aNGELf/wsjxUYpyB38?=
 =?iso-8859-1?Q?BE+om3kCrNXE/f+NFPrUdpOZ0N8N0sZ0QoL9BOih58ZiHLWjwNIaiB7CD0?=
 =?iso-8859-1?Q?3ovcjKz/750hih3xWQN7Vm0c12O+RhnSWwuX3b2rV/6RfUvK073A1qvtGi?=
 =?iso-8859-1?Q?9QuwHviCJX7mMauY5RtnIR51oj/Z+8DViZ5QZxo5SnOHxaM0D3E9tIIMk+?=
 =?iso-8859-1?Q?bRPqoPJc488PeCNzYcaK+mbObLpSqENGxt8/EzRp+36p59W9GtL/17m/Du?=
 =?iso-8859-1?Q?YJdtlNY4C5T2++Dp+Mg9zFwWXpovcD0lgTluVd8+GXOJ4MAK3pzvZf2Qb3?=
 =?iso-8859-1?Q?gqSL11FK/6CQ6WSdcXwEeGBczku8CQGsmYLwLfcMDqn3YWskJqYz9IGoOh?=
 =?iso-8859-1?Q?7x7kJvVx2yVOPBgJdQbChNgrsrfcP5ZTqt8/gTovZLIsR3fKkHHZGHOydj?=
 =?iso-8859-1?Q?26IUV6/ZDJ2ysDOu9jOK+LvfoLCIH+6+t+oBFijunp1NUeA6yvJOPAftSU?=
 =?iso-8859-1?Q?/BeQodZT8mFf774cUfjvzYWVIzKMIWFU4T/jB0t4Dq83B2Mk/ZoygKVluT?=
 =?iso-8859-1?Q?1a4Nd3ZlmNqrKP2NtzzZluMUl5JvaxErK8luN4CZeW2o38HCPnipgotJ9w?=
 =?iso-8859-1?Q?a6dghwffRS3zqYxHUMS9840imiMf3eUsRMU9Y4OnLMm8sOwYIxNuC3NlEW?=
 =?iso-8859-1?Q?TZTcA1LZjfFH+iAAB4Yss1EhV/d7WefN1KcAh93LafiAzziyzllFm28o+D?=
 =?iso-8859-1?Q?2Vt0+l0ejPiNvEyXM0bZZdL13qXsFtVwPfyOT0C21ldfGPmP/gX++wzFnE?=
 =?iso-8859-1?Q?fyIuWiEX7YhHuhvGVFtF9b6aXdeszfILrATgzPMiKhqhYJV/mnKTWipInO?=
 =?iso-8859-1?Q?7Ac2xBvNUx8oTF7S4ig1VAxuwK+frYbwWE4kvoA40y81idVWAF6nBPh3Rn?=
 =?iso-8859-1?Q?s1Hr3sX5zlnsxtgLUKpKfqkTtyQUFFp+v5R4HwFlVm7td7h7Clvy4k5S7h?=
 =?iso-8859-1?Q?w6upmeREutczxDv7/TH76c77djlUr6jBd8BPdYdt+B/DQmPj7DCY2NqBF6?=
 =?iso-8859-1?Q?BIZdI748PpzeqkLaB6i+jGwJth2/FNFRVhadhmIAnS3UpKpJXZqBWyhxKo?=
 =?iso-8859-1?Q?EjMDZDu7NbqAwZjrd4gRa3ISJ4yZN90Y+HCqpp9x1EZqfVRg3wWMaMU/Cl?=
 =?iso-8859-1?Q?/JqkJ1aE1cFkKfHm9eDWt02KHrTGvF/IehUrqYp3gwMT2etbzC56nUx/Ln?=
 =?iso-8859-1?Q?O9HPYKvJ8Sc/H7R5z1DHRMQFlVrleHkcRnfYN3hZPOe14KZiBd9U4EmnKW?=
 =?iso-8859-1?Q?D0yuJ4P+JKVkrMC74/M7Eg8/f/gw6LImj5QRDG3cHGjYoKcvHQV1PRwhae?=
 =?iso-8859-1?Q?SR5k/OE2ws0xvF08yAxCLOb+vz40Pa1U9kkqBEQ0yP/OoiBgKYKc1F+dTY?=
 =?iso-8859-1?Q?64dRhZWjl88vmTeGSGkPc4KHA8yLvbYGSVm4UzaNBmC9tHLuLCIQ5Xgg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b291963f-e06e-4f55-85e4-08de00bcf416
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 07:34:28.3468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcUsW5NuFB7FrYLvjNMzlVAUTHH4rAjjy1V2j44WtswyjNVJ+QjdFZkjnRY3vvs+dhgonlasBPcNgywCCFTRiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
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

On Wed, Oct 01, 2025 at 01:35:19AM +0200, Michal Wajdeczko wrote:
> We already have control functions that we use to control the VF
> state on the per-GT basis, but that is low level detail from the
> user point of view, who rather expects VF-level functions.
> 
> For now add simple functions that just iterate over all GTs and
> call per-GT control function. We will soon allow to use some of
> them from the user facing interfaces like debugfs.
> 

Will the VFIO driver hook into the level control like xe_sriov_pf_control.c?

Matt

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile              |   1 +
>  drivers/gpu/drm/xe/xe_pci_sriov.c        |   8 +-
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c | 104 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_control.h |  16 ++++
>  4 files changed, 124 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_control.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_control.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 3c5d2388997d..84321fad3265 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -174,6 +174,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_lmtt_ml.o \
>  	xe_pci_sriov.o \
>  	xe_sriov_pf.o \
> +	xe_sriov_pf_control.o \
>  	xe_sriov_pf_debugfs.o \
>  	xe_sriov_pf_service.o \
>  	xe_tile_sriov_pf_debugfs.o
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index af05db07162e..9c1c9e669b04 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -17,6 +17,7 @@
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> +#include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_printk.h"
>  
> @@ -60,13 +61,10 @@ static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  
>  static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
>  {
> -	struct xe_gt *gt;
> -	unsigned int id;
>  	unsigned int n;
>  
> -	for_each_gt(gt, xe, id)
> -		for (n = 1; n <= num_vfs; n++)
> -			xe_gt_sriov_pf_control_trigger_flr(gt, n);
> +	for (n = 1; n <= num_vfs; n++)
> +		xe_sriov_pf_control_reset_vf(xe, n);
>  }
>  
>  static struct pci_dev *xe_pci_pf_get_vf_dev(struct xe_device *xe, unsigned int vf_id)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> new file mode 100644
> index 000000000000..56c0dd382262
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_device.h"
> +#include "xe_gt_sriov_pf_control.h"
> +#include "xe_sriov_pf_control.h"
> +
> +/**
> + * xe_sriov_pf_control_pause_vf() - Pause a VF on all GTs.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier (can't be 0 == PFID)
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_control_pause_vf(gt, vfid);
> +		result = result ? -EUCLEAN : err;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * xe_sriov_pf_control_resume_vf() - Resume a VF on all GTs.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_control_resume_vf(gt, vfid);
> +		result = result ? -EUCLEAN : err;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * xe_sriov_pf_control_stop_vf - Stop a VF on all GTs.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_control_stop_vf(gt, vfid);
> +		result = result ? -EUCLEAN : err;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * xe_sriov_pf_control_reset_vf() - Perform a VF reset (FLR).
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_control_trigger_flr(gt, vfid);
> +		result = result ? -EUCLEAN : err;
> +	}
> +
> +	return result;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> new file mode 100644
> index 000000000000..9bf059f746d4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_CONTROL_H_
> +#define _XE_SRIOV_PF_CONTROL_H_
> +
> +struct xe_device;
> +
> +int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
> +
> +#endif
> -- 
> 2.47.1
> 
