Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C436CCD195
	for <intel-xe@archiver.kernel.org>; Sun, 19 Oct 2025 02:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2BC10E04A;
	Sun, 19 Oct 2025 02:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njyWLclN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D18710E04A
 for <intel-xe@lists.freedesktop.org>; Sun, 19 Oct 2025 02:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760842539; x=1792378539;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZxxBrngtsFGKc4FHsisRLgs+E+fNvXHm1TJ1gKkK0dQ=;
 b=njyWLclNdjssnV9HruJVBToKOThh453uAzbWBB5bEjnIPvLM/yxF9Gr2
 LUhvBo3w+iPf+QmjhBMdXhivML5942MWP07YqkCrjEDURThv8ay5ZFlZg
 c0bTSbESe3VZ5rd0tOO/rLBda10i5n2HDg2vFjDE0CZmPb4Zib5b5dX+N
 VXT6/z9kdZJnLUvovsij70Wcb0EBI6GW+dD4mdV+e+hGbLDEW8Rw3sP4k
 nFOUNyBZGg8RwtXxUrHjzB27edPBEn7CUspzNDzk52eVFuNj0lGbBLRC6
 Lrvxb2NleA7CzKxtIMEYjAGWEk+C/lIWe/4HNVo6mvUFxp5WZaxId9Uja w==;
X-CSE-ConnectionGUID: rtM6oVcETuqnEE7VC8XZrg==
X-CSE-MsgGUID: Z2HLu3MsSWOZ+cG/gaERpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62914585"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62914585"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 19:55:38 -0700
X-CSE-ConnectionGUID: P8U4Hm8bRaG97pdVwDlkcw==
X-CSE-MsgGUID: +++8azBiTBu5qgl4e9HTwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="182180858"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 19:55:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 18 Oct 2025 19:55:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 18 Oct 2025 19:55:37 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 18 Oct 2025 19:55:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGThm4Zjl9TrgOP0A2jPaZKhT1/G57J9HaO3yIGTY+0FlYBJ90/swC42fWcgx+aM8gcF16t+1/WpKpBA3HvD7w65x8Gh0D7FLwxnnmnpUdrQ1Nm4ckwgtuumb+j9lY7GSvchOrHhBiP8cRuF4FmVvgSOZWJzJVlQvUrzys0Ef+tvphnbrfVF6vsKB882lcVoql9xKDzQlNxyxSg0XU4VC2yJ2ltrT21ybXGBtt0VyCBqsVVQm0eFDAUZwdCcuFVvkKlm6zVpiSyKttHIwBWNf6/CZuxzbp4VcUb94tKJch3A9Gr/qYinKwUVEDoXA7amZotm0Z3t2SBocgpVMvZPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxxBrngtsFGKc4FHsisRLgs+E+fNvXHm1TJ1gKkK0dQ=;
 b=KZjNyCdAmHG9SRSh9TaIWDm3wct/rY6v4aojM+16gFyw7sXJyDB58YBQR4EfeOieuyWV936XTCMcNykjyx6yde1/ObYzMaHTIu8i+YoRGbYEGoGdoSgRKPI9LF56ITZZYIG5+VPdh9gGdsZqzRzePAo86UM8DhEYQ+2cPK++MmaUnT/WQFcmx4hV+cH0Qy1hGJqYDGG4hLJMuOd8jIM6cb2U45ettsfv4wGIaahBxvc1zxi7Pv0b7tl3wgX5JVeR0D7k3i75xpLqkMgKCHOxe6IsE0kHeEhDfJU1qT/3IW0V1JeDprtpnlHkZz+YsiVeKJ1oVnfLaRaiZXwnvke7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB6245.namprd11.prod.outlook.com (2603:10b6:8:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Sun, 19 Oct
 2025 02:55:35 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9228.014; Sun, 19 Oct 2025
 02:55:35 +0000
Date: Sat, 18 Oct 2025 21:55:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Shekhar Chauhan <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Wang Xin <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, "Dnyaneshwar
 Bhadane" <dnyaneshwar.bhadane@intel.com>, Fei Yang <fei.yang@intel.com>,
 "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, S A Muqthyar Ahmed
 <syed.abdul.muqthyar.ahmed@intel.com>, Harish Chegondi
 <harish.chegondi@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v3 00/24] drm/xe: Add Xe3p support
Message-ID: <6rarf4sctkx5cuvx2r36ub32evb4uesubk5eajdnfbtg3tvahj@b3c34oljhrla>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e76dec-7ebf-483c-fb56-08de0ebaf9c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nswyyujEBjlmxZc8vEvJQ6AWzs5nqFhOYqk4/40Q/2OGLEYYNEFhxmbJLgYA?=
 =?us-ascii?Q?sAxNIijjo7u0cPuw9D6Xv9KjBEUHZnQTdfXla2qO6gczQj+obHYUU8bW9IG5?=
 =?us-ascii?Q?U8d0rC+jqby5IQjiqs4+shmtwE7ERTWPmR39CU90mi8AP8PyZJBwChcDzSfd?=
 =?us-ascii?Q?X9F9UQB/e7L/AnJSEb0JiAhAv4W3R3LIp5YpbyllX//DniVYSwiCxqpr2vKn?=
 =?us-ascii?Q?yG0xiKoxnAGipF7Jo4+f9Bg0W3cfXmvH9k8EuwBa9EKkq1Zdt+PS5r0PkFiC?=
 =?us-ascii?Q?WyF/vuK1u6rNcuAlGrevJbtAnB6VSb4NV+LsYy3RbfWRwb9hZjEzrLFNufdC?=
 =?us-ascii?Q?GYMTRsSsMNvAbjX/dX/oIN6+IzaIbKmL/sTHX7mVl43X3vIa6aT85O0Sdy86?=
 =?us-ascii?Q?L4Ez6VHhAMe2DD8aRqMBTTe66NI3c4kBRovbXKLcXmVd5EyZSQ3VcSM3ANuw?=
 =?us-ascii?Q?cStkR2htRD8EaznPGAAG8wXyI/mFKsLfygSr6Hk4qnvAEbtSDxixu60rtDrF?=
 =?us-ascii?Q?Hg9banJDpAr5xWmaww8g0ZJZ/5ev4B0kwsiKIJjOw065OHeAI51m/nUJfRG3?=
 =?us-ascii?Q?LuD7Lcl7Q9edxwzmK47hUdca4dj8Aq+5vn/14KYQuNM16J9gd3QstxJrKnBp?=
 =?us-ascii?Q?X2hSGJXtiFcwUc0oulUcEcT7pB5bmRycy3SPfmza4cf7v9H+aOV6GLHorQXz?=
 =?us-ascii?Q?Cvi+1X5yq7befDaE40FBGYi6wBrpbZoHKp8J2sF13+yLhK9mSbqtCefIJ2DQ?=
 =?us-ascii?Q?kbqHQ3CK7rDAQ0gKlmv8u56eBYD+dJ5ESrfHesECCMRJlzfnDGzDkWCP2KPF?=
 =?us-ascii?Q?EpqbrcsEeNskbxxQLqdVM/B/D5kQP9YoEWyGsR4mrf4XpYwwwoxIXb8krBEF?=
 =?us-ascii?Q?6uFWlC84TPtwa8awFVmD4WO4g1Mr9gNR6cXL6EY88frhNi6r9UQqife/Bi8j?=
 =?us-ascii?Q?nzIFc2LNPKRHErj5+PtOJTM6yNvo39ua5QKikN6Unrr7/orJtxdwVdKiwids?=
 =?us-ascii?Q?qsO6u5v3ylYPm/j4vJCukqZHOPhflMxzQfdVtGoxQac3xyWyLzTlFNF7ZeFN?=
 =?us-ascii?Q?YHlSRJlpzUHwEjx2xtwKBAlzH339BOm3TvVjYWN/cOhvtnYCzeVZks24akPz?=
 =?us-ascii?Q?71PvZDSGjLBIt75KJ0uB79BPAxhoDliiFhR3ASkpooFEatm10CWzpFlzl9To?=
 =?us-ascii?Q?sFmaGfyG5GoL0O56DE5/6PtYtaqTpesUbNn/xl8zJlpvljZIZC6QTOtrq0Zg?=
 =?us-ascii?Q?VNJhGoNB0nlgxGFB/PBrhv/hjW24iNMSg+R59WC49Iqq28ngzb5IuHAyVK+z?=
 =?us-ascii?Q?IsNiAqfRtM2eh2IXwcS1iAqyIpy+xyQnNpjFX63Gg9X42DWlEb6dV7+4pA7/?=
 =?us-ascii?Q?tWORfASuLwCIVWiqnNjuxQi0pHz9Z4Fl3J2touyqtAY3ysqlczmcwd+tTEmc?=
 =?us-ascii?Q?VSMdDa4rEJEQcU2jC5Pk6NsvF0EwytvW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?semrc2YdE5h+SnkbqXktBeGcf6T+qbMhYLnybS7OomOdPX/JTPEar3/189Wg?=
 =?us-ascii?Q?4Xb934jFz9QekkZGvtMflfPCv7vOzr1qUwCra2jtZKIYM3inYnSLAP9+lp7c?=
 =?us-ascii?Q?hvw2MjCRyU6QoiZscqVmYLUvORywYj51uUE992w4619FsRsj2SI1Z3KqBX6X?=
 =?us-ascii?Q?IuVM+Ub4HKcD3KZfzk3RDCXBwLdtriA9SZno2Aui6n9lCUFcu4u+Q+xB8Fu8?=
 =?us-ascii?Q?E+oZbQ253jRiYgzAEw1YE5EEahmxrxC7kjxtMiB0uIlgNgBlUDehR/6pvmlx?=
 =?us-ascii?Q?gyKODUFhw7QxOzWbgP6S/NXaov6oXWuUadgHCdb4lOv7Bnv7klp6KE5SXccO?=
 =?us-ascii?Q?0Zy7KESxMugDeAzVJYjROfj2/7qxBPxyrWbIlh52rGCV7/S7wUbfnVFfniAX?=
 =?us-ascii?Q?N+cQEgg49y7mSafVUMRTLnwAZulrcjwyf3igoTj91boMYwOiEinMqGfqoMJv?=
 =?us-ascii?Q?A3T4+VjrBSmOpj6qsEIr3aH/AdF3TvBj4ZDUBpV/saC7qy0CPmWeDqkzvP1U?=
 =?us-ascii?Q?AHbApsFsMImuWhGQu0ZDK8QwK7fd42EjLd4MKVivVDTS0EY9Iqbi4MgcPfsZ?=
 =?us-ascii?Q?arudlOP5Dgse24tN1bqC4ucJA/mZWmR0IH9a25blxRVl1KyLq2a7UN8VuvoV?=
 =?us-ascii?Q?YvIWAdQQOESn8v8ToXW68HKY5t7bVEccxzntA+BrwOk44/N6rgdogx/GJ8tJ?=
 =?us-ascii?Q?FVbH9A/YT/Wlf1GofaMzp0Vp6Lx+x6cz//y+JIcDW5fyfhtRIdCPRg6V4K+a?=
 =?us-ascii?Q?SpjAX7ZVWvkMqyXFU2x+rBh3Ruletut0ryAMdppW/ipAZicWdCHnFUcMw4Bd?=
 =?us-ascii?Q?vwfCOVQobdaD/wzBvQFkHmv81GiMgJokFEMy67JRr54+ZUWEISrZlP5hCXXf?=
 =?us-ascii?Q?OQtvDlOqPgGOuYcd0CgahAwrx2qRQMmQLkAXq6QNTTUqmNi4M2sySjo+K7/Y?=
 =?us-ascii?Q?VskdzdAUHNKEeL0SkSd7rtb/S0cHzAbareBd0i+5eW2gtsEKjsFBqZQ0Y4J5?=
 =?us-ascii?Q?SfFaKGBo5SjXWOI/QbtHVL/wG01njWkr3gJJBgUHx3FqWfmu3nH9HxTW3yj0?=
 =?us-ascii?Q?mmZo23Wvpd8sHxqeTzINrId6mzx34S82PCGRw/bf4lajXQFGwHlcJmzEpx4/?=
 =?us-ascii?Q?SzW69K3qGWRLuiQ8qNQKQS7mm9gyx84PTdXZuK+XHZYvdRwz3Iv26E6cCv6k?=
 =?us-ascii?Q?hYLvonAwUEz+TAMQ/dZO6lPUXkPfe6KLDXZJkX/zQCnLsydda/8t9lfe4p83?=
 =?us-ascii?Q?oWQCFhiau1aeMa50Vp/4YQjriR7AXqldFMJLWA4/A+ME89off+Yw+cWHBT9l?=
 =?us-ascii?Q?TSeOg1MyPXDVqBbBV5yWI3YTFrfdcaAVLdAIfJYaQcX/LxW1RzyFdjsO/kJY?=
 =?us-ascii?Q?w3RIRu3W3O/rU68Vz04n5TU3rQ1QYSvGVHEBDLDLiRDcB//thRWhZTQn4kEz?=
 =?us-ascii?Q?ccmW6uuEIHOQe86PTBKToVgPAb8LjiW8yzaNq4lgz9BGGUUwPzvGeuCoKQuf?=
 =?us-ascii?Q?m7333J18hOqgerhlus6KQU8OKYrIRoauiWnwL+0aoVkEbIB4Wj+Mknb3/nv4?=
 =?us-ascii?Q?XRAOZLZJUt7rBRrxIZBh7KMe4BCUzKSXNwTUAD4bBw1qocB71+AmXU+nz4ho?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e76dec-7ebf-483c-fb56-08de0ebaf9c3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2025 02:55:35.6481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztosI+u1+FfxLdtquXaSNCgPrQHUQLvWThdCvv7m4RfPLWxVfQnd+WUrwcIkDFY9UKQuvbxfxwhXzGInnhVGm62MdzXO9UJO5zcSxOrfrBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6245
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

On Thu, Oct 16, 2025 at 07:26:19PM -0700, Lucas De Marchi wrote:
>This begins the support for the Xe3p arch - it contains generic support
>for graphics version 35 and the Xe3p_xpc IP, the Xe3p_LPM IP for media
>and support for Nova Lake S (NVL-S), that uses a mix of IPs - the
>display side for NVL-S will be submitted separately.
>
>Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
>Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>Changes in v3:
>- Add more patches for irq refactors as discussed in v2
>- Fix vecs irqs from v2
>- s/Xe3p_LPM/Xe3p_HPM/ where appropriate
>- Some other changes, mentioned in the individual commits


thanks you all for the reviews. I merged the GuC patch to
topic/xe-for-CI and all other patches in this version to drm-xe-next.

Lucas De Marchi
