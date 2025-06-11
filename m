Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1735EC71133
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 15:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC7E10E69A;
	Wed, 11 Jun 2025 15:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJH79fme";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADAB10E6AB
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749656387; x=1781192387;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ENTYlE2q5LGrhAQrxILHCHA/6r0zr1iNtmgANcvhH8U=;
 b=YJH79fmeGPtmBJI4Wuk4+8b4TAauvvczXb8VZEdoWDl9BnlS0tU2BQoy
 96WqmFC4LjB5n6bpGZCWBF3029VzPSYBhBbeHeYwli/VOD8YtmBwmzG7c
 erEc/A3Yh4Wbn0bAAzEc0bcfVqE1w1zZRz4gm0IrA9u7heP+fruPpbuI0
 LeMcT5YLF4SvC5NkNCoXiEptz6PZnqs2sdMlPBmCNMNGX4DnAT+DLH1Es
 kMZ8YMeszNs5p/IzIttVkarZjqp6vlcqnpLZRiet2tVaSWrLd3s44VTmz
 f1blkf/cWuz5BB28hWOTTawTaJTwMX6ceWbKZqqg9khJ1RPeA3Xzkx2iX w==;
X-CSE-ConnectionGUID: rmGahkJ5S6avZSzv1/mLjw==
X-CSE-MsgGUID: DTx2YsafTriMUQOEByFL1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51519390"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="51519390"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 08:39:34 -0700
X-CSE-ConnectionGUID: I3UjJU8RT+SVJrWhI/NM7A==
X-CSE-MsgGUID: jwRpdDyJRyWjOvpvylAi2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="178140536"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 08:39:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 08:39:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 08:39:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 08:39:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aonPwOBtaW40EEqk5yJcsSqi3JSgO/4beb2w8iHQpgGsvhKJnPEQatDtmsLE/dYXFHTAS+yVg9g7iz/SJTP/v6xrdkFOq0HrSrxEKlSEuZMOBll8PWBqj8Z3fww3DruIrhGMkIKT0bbtn/rDxfDTedPis0kzVZXzaSNC2eFoxxZuFmygTsJN2LX3BiDvK7m8wbvaVYa4roHV26PzZPm+c08v6JJkpZIxtOZgdV6dE4nF5eflRQga0RkoaWPiI6PkLcHvp5i2qqyluglzEBfNaQRpLOv03j7gSzFQJLJ1rwj40V5sCRGP4Lx63HdIKx5QlmYh1GViqxn8HUMmH0VF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+7t7rZaH4gWHNyXLAnY3Ha35V0ixqJNVuIiqAGJ9po=;
 b=qFw9Qnw4McM+QKOLN6XPwNkt0UK/v36ZtOs6ftzy7ufcTVQlGmvwwGnK1KMGhAOS0Az2d1RW3ok41eFm7HUGb2y/lFMXyTeEvgYCl0CcBDCtO5w1N9+X5b4K1dTsj5cVzkZAOTjzyb3iy2Gqkk6lU+f4Rdz0gPjEsWHsCK84N7cO7yPclBdODqgosw92cgONqRgXlo1S+aWFVVxKbM8NzEoH5m4UmrqqClLCwIKxPFtQT+cVLiFL6TV4eVXkWfSkWCnSNMajjKLZKzEr1QO6l+PEtot9P26CqXJ1qH0H5mDH2vZPCf3NhMXkJdYFu8crUO0XioZvX6eTB/0at8266A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Wed, 11 Jun
 2025 15:39:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 15:39:30 +0000
Date: Wed, 11 Jun 2025 10:39:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 fixup! drm/xe/ptl: Add GuC firmware definition
Message-ID: <qpdaakenuc5oe2dujl22eapd5n7xjnsn2ftqeifek52wkrkpqh@qawjntawjdmc>
References: <20250610215523.645368-1-julia.filipchuk@intel.com>
 <174961808157.66340.3525141044312123470@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <174961808157.66340.3525141044312123470@1538d3639d33>
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d88165-fd52-444c-ed26-08dda8fe2763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fg1x/Dfi00QeShCJWFsiGCLQo/efA1EFqOHD2c/ZBW0usTqUFDg4KjJAUanJ?=
 =?us-ascii?Q?xmU8bp+6TJf/LkOizwFucpSIvtJGoexhEJdAD+O7e3vWI2UvYhYpM+Ru9ySj?=
 =?us-ascii?Q?FOn98zJvu6VxW/hJMfMKx79F7Kf2XgM8Plia0fs40BbrC5KWEYTCUbpf8Avt?=
 =?us-ascii?Q?FXhsz8lrZA8/e0p4VW+G22myEtL+qAWkHbMC1fjDHaq7uiH/vR6L26GtDKs6?=
 =?us-ascii?Q?V4gy9YuuzrB0fTO/GLLU0+7bT2lD2k7GTn73phWO4MKxTDYDVG160ryHeCF3?=
 =?us-ascii?Q?ZRk6VRXEGpx0LmCL9pRzJ9apmB255qjH4JUHJMOIxw3AiMM9VRpVAUdmzjEJ?=
 =?us-ascii?Q?AZHaP6Ii88cbr1kdN8oK8uGjPxhGaKSqXt77OOWJvYcTGYjocrqq0b2lGuag?=
 =?us-ascii?Q?Ap2plgZOBkW3xubo2vaqNbxgEuDlGwfoJj/ufuiie/M6v1IMKaRz1a+gkSoh?=
 =?us-ascii?Q?290x1CqLTKjikHxhcf4T1BJENE6emxPDlwK0l/ni8QTZNqJScY6ZjidWoYeF?=
 =?us-ascii?Q?xqk2gzbV8JcjOTZMf/SredssfNlWudSseKmNZmlpkqWxgAg5/oqp4sF1/bDx?=
 =?us-ascii?Q?gLolb+/GbY1r+wPJbI4AhLq/PsFjTSWED9J2vjDxCPB6fdf/4TKAI3UWRCX6?=
 =?us-ascii?Q?kefOwBpq65wcMmbXxpr4blFw/pR5D8ElHQAv1KEJ3+fJenlX29QdnvxFQkh+?=
 =?us-ascii?Q?rBqNWcVxyKcVEeZILM+MGNQrKtqEzvHFEMTrYqKGz+9QvC9Kn826j95Fi8Mg?=
 =?us-ascii?Q?zT2CEMawEB+ZXsDpUDKXh9w/mFsH14AwwquHrRvPS9TulvpAnu1PS3z2MMMt?=
 =?us-ascii?Q?tPyfz5aHZ3jMHPafdhid7l9eFCkxWesgHdcVV4w0FEjJxQnEz25hcu5C0VYP?=
 =?us-ascii?Q?VgyGsq+Y5XKdfMtC1zSkNPtWdgFVXCwx7YIyQ8urHnRtgorJAbMVtQOr/8gx?=
 =?us-ascii?Q?+VHvA8aAKQZ0Xl6lpYnSH8e1xn6J07UfNHOaT9X0qaUo+A0Hk4fi8G3GShKY?=
 =?us-ascii?Q?uMSh8oWN33E7rew4yRivfyH60wzBvzFEIOoazjkZoKnJxVtIElp2U1h9rvAU?=
 =?us-ascii?Q?CbuB4pIpSFVOM8tpnFtDTVDbbcadUJKXb2n5osxPWoekU3+S7UlBWeTka3+t?=
 =?us-ascii?Q?9piPykFUYP/5FAIUXJ28p044QizbkoBxKxKnb9Rp1Yd/SYBqPaMtZMWL9GkK?=
 =?us-ascii?Q?SePK+H3wOR1KjpYIrHEcQGJGZiU378VAK+lDs3a0Ib96M56BDHKRjTAR7tsg?=
 =?us-ascii?Q?c/fG2OL0f77QCv8TCEixZiHaYWWd+3noHFcoGovuoUtWO2k0DfNEHM5DLv7k?=
 =?us-ascii?Q?qdFPVOjxFku5xdt1jc5bPMipPgda5Klv7d7QB7dPlKwMOXDVBhHNMyq56TS5?=
 =?us-ascii?Q?diPGckVSgkBkk4S0mjFYuFf40qngwrkPjNJ871qfwZfW8Uk8q/xnb6GuNBFC?=
 =?us-ascii?Q?KUWCLo6gOEg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p3N3j+rqeshi+faewGmCG3aBCplQ094uCL730YHWpQa79Ku1HB2NX2AxWQ/B?=
 =?us-ascii?Q?Fw/e8lQVIZ1dL3JFagA0cOd23wg99lFkivF9Uq0Gpw2QYnXSmKpFhnYKT7XK?=
 =?us-ascii?Q?cs6qZtICy6a0lFzee7ivZHKdvD6Qu+1s2awcSxLq7TC1a5UP1MruwyY+BMFn?=
 =?us-ascii?Q?mz+m0Ub8E1jmdzwl7W6VSNHhqgkZ9XEc2D+TWYIYHN9BtlB0sQjfN7/z8kAi?=
 =?us-ascii?Q?eHKfH96w/XhZ0tvomvJ3xIHYDvUHQyCNKSht80YQWJs9+b29pQrUdR4csdMQ?=
 =?us-ascii?Q?HkckBjS7EbBYBqk86duKEjFCcLKFazezWj5704HElgfySlyVepLLcrZV4HqE?=
 =?us-ascii?Q?FtRT2FFOmjINfUo6+2c3U9Q/7llc4Tmpob28dXxRy6FBQ0qS9t/0SpHDYN5x?=
 =?us-ascii?Q?WGz0ixJDGVA8ZxpOS+BDwcWvTwzVWZK+Z/iZvmMkM1/6Q8CoVEjAdfte3xPM?=
 =?us-ascii?Q?Ho//pub9bwcp+HsMgCCRvTbZaOpJeEBjVLZ13co0w2Sx40cWv8zpDyql+bOV?=
 =?us-ascii?Q?enw0sSkcpDQyeGOg1P0+fcC9NwWvfhcBvdhjsMauzLPXzdSc/+eCuM2ZLt5/?=
 =?us-ascii?Q?f7eznDeQAWKJLMAhGFlybLZ4AXXa25oe6x4zAsA7rG5BSSb70VsH/Jz5sdGl?=
 =?us-ascii?Q?/CE+2LBAgbn2htJlW4yQog37tfyhvKpt9GRDrBPMheIqUNW2KKF1ib8QVIbc?=
 =?us-ascii?Q?syWuSPgtcBF0OftDwBYl2cfD+HIlHrDyeITftHUjDr8FuQVFaKq0cwwWxtKU?=
 =?us-ascii?Q?Ek08kJz+T8C3kng1tBOQ/ZUzJS+63LJDKoAhmVpa4ZoDIVRKiKIYxRXECwXT?=
 =?us-ascii?Q?JQDJN/wFPC2KdlRAo+GO0li1KcO8xSIVfyb69ExKUdQD+fLjx/SyAHJE5yPQ?=
 =?us-ascii?Q?FiZ52gYbcw5J5FkgTBOQQrYgXPLbObmUWboCYozRRIQc6Q8AE5z12ILCErJl?=
 =?us-ascii?Q?eQ2k6GdB0PlAnJRHaUCZO2gPXh8lTx0WIZVl/5/z4Br2PuRwByWbGj2H/lEh?=
 =?us-ascii?Q?7d4sEDgK0HkLXuF/dnIFXLTGy1pbwg9h4CCwYMm1zkmBKqZEHjWw7rfiXlof?=
 =?us-ascii?Q?7ftbQCEW03PKnNB2rNVZQYRaMUDEa+5bSOeMrB55asUnwGvuC+9HKg0r8Sx9?=
 =?us-ascii?Q?83wiDQZvkiQLRO/KP8vpt/eNpCtl8eeWvq0antGxqxoRptQ2UoxtF/mwB+Ft?=
 =?us-ascii?Q?STC7aVS3TbSSO0pnyXee4UBjjq4l1+a6F3gYGDIYVETHcpPpDRbCuF+T7yvD?=
 =?us-ascii?Q?WK+PAxtK3PKJdl32/4K772uCA4PEBN/vGluAl59wpvFXStoRh3aSy/MRu64T?=
 =?us-ascii?Q?bl8FxXNKe8YzHDj3Iv4UhkKPfeZ74Gjxt3BGhXtGVr6ZTyWrdL3JV6DTQ/YR?=
 =?us-ascii?Q?wlazn87T0DWHp4S3hRG3nNO7OdNgjpUEpYQkbo9zGy23sQ9mgWj0d1q9TpH8?=
 =?us-ascii?Q?Ue8MY3b5VaVLHsoo6ExPx6ASJTKCbfX64XxiORZo5n0cXMNGCXkNn5Z0rxPF?=
 =?us-ascii?Q?it4fCppdpTzIibPW4Gww6LpqXAOJZPyjYpYV+l8wKI+ZE3GVIH0+bHiYnAMQ?=
 =?us-ascii?Q?gqftGDCqB7LLeierXJHHKwHmdHOLVQL4WvUpFKIKYDh0nVJK3yAWbDPbtWth?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d88165-fd52-444c-ed26-08dda8fe2763
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 15:39:30.0619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaG+UR3xyWkIXYLRKZLSRu5PUoJbxGEOLKSH1R/5Ca1DhjzKTyHdOI9iqvhHymrFgQfJa4ssUEewdPUWSvpR1ldBFaZseEfNOdu4QlYTOxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
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

On Wed, Jun 11, 2025 at 05:01:21AM +0000, Patchwork wrote:
>== Series Details ==
>
>Series: fixup! drm/xe/ptl: Add GuC firmware definition
>URL   : https://patchwork.freedesktop.org/series/150068/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60_FULL -> xe-pw-150068v1_FULL
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-150068v1_FULL absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-150068v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-150068v1_FULL:
>
>### IGT changes ###
>
>#### Possible regressions ####

>
>  * igt@xe_module_load@load:
>    - shard-bmg:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25]) -> ([DMESG-FAIL][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30], [DMESG-FAIL][31], [PASS][32], [DMESG-FAIL][33], [DMESG-FAIL][34], [PASS][35], [PASS][36], [DMESG-FAIL][37], [PASS][38], [PASS][39], [DMESG-FAIL][40], [PASS][41], [PASS][42], [DMESG-FAIL][43], [PASS][44], [PASS][45], [DMESG-FAIL][46], [DMESG-FAIL][47], [PASS][48], [PASS][49], [DMESG-FAIL][50])
>    - shard-dg2-set2:     ([PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74]) -> ([PASS][75], [PASS][76], [PASS][77], [DMESG-FAIL][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [SKIP][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [DMESG-FAIL][89], [DMESG-FAIL][90], [DMESG-FAIL][91], [PASS][92], [DMESG-FAIL][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100]) ([Intel XE#378])

Unrelated.

Pushed to topic/xe-for-CI.

Thanks
Lucas De Marchi
