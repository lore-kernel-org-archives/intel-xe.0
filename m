Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBBAC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 15:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E3710E1E2;
	Tue, 28 May 2024 15:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvJyUCRf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1327910E1E2
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 15:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716908909; x=1748444909;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=DR2ERmUVFOF2+A80Fu3pSgX+48wZKuxV5NO25zrToLE=;
 b=RvJyUCRfHp9qRe3eoVRppZ4kaanrMlcoAYpD6XC9+rpnNe1GfiDGD4nV
 20E7mXcqzCQXq1TXOjvL0AXR03iolxmkhqsI/Du2jWOHuwoq/LhrVKnHZ
 I4mN70NZIqmMR93WfBSmo/wQ4x56zn3P5Ek4TmlhJWEYmf4/AWkg8bFfU
 A5HjHwRa/hnCdmQr8nvdH9MY96WDu3QOunuJBtP+wi1K6eoQtt2s2Whd4
 lhy5XS/i8/WsAa29t1656EG/VwsXMksbxElpMyzPuAx1tPCVJDswQF8SI
 8tsIpZj4o1rGr+Er7Ysb6ebmy/xE7dgqxh1k/VZkYvdhh4fcB1X4u3O17 Q==;
X-CSE-ConnectionGUID: 1xDsSnQVSAGIU9QaX3M40w==
X-CSE-MsgGUID: ZlDJritKR8+kWrWb2Jze/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11729333"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="11729333"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 08:08:28 -0700
X-CSE-ConnectionGUID: es4pAkBKTnimsKr2+LFpqw==
X-CSE-MsgGUID: 8afIbcPvQkmI+HmsAMz7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="72542100"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 08:08:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 08:08:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 08:08:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 08:08:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 08:07:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv+MUT4q+fI+JCxkA2wpxIjUeUieXMppyQxAPPnZJF0XqaJO+I70fyfNZca00nL4MVzVJE7RtWsuAXvyVdjY6BfHsqX8bpKWnnZPZFTFcQZCpMDTiB6BOyfwpHU+HGwSNXScc7oDQxzJj2FxeJL9wwM+A0Wc5o2UTf6cSfDuFq5X+1X/PGXm1Y9COfzOaX9W9CI6/B+r4pB7AAoRsbzFFX4ASN3eGf4MLu58jAWRtMqijO2mhyqFlxoaORpAyJMzrISo+DVtGNzMK8ZwhiPxdE6Z+yJNZghfOgexmZh0jt6gq41w7vhzBjVgLlcpavUSYxm+9hB+r5rE+ni5AGjL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1SloeMC5ff4MJfw4vUAimQlPi6ipxKPY/BS1Ymzy4g=;
 b=WIz6HwIUpx4vmSh800XYI/P7yR0t59X50hi6DFqatK1IgN6xNY6/f/+IJYpRuoFcwatwuApdSyltLKl04ttLl3NS+GyP1rpNfQJ/uEwvlxP+U9rW0gvIKflheSdQ1IK19NBVJV2ib6EGubFxIIigt8BAh2643adhe6IgspRoGbcicAyVPxPCwWAichvkQYW1xj0xk6kg0XBkjlBMUi2Io7604FyH1jSYjRWVstiymCySGosXP3U9LrlodfDat1XrCquL2t7R5a/JEr8SbUtGjLCw3utkJvkse/pLhmYCXEdC6amTWtCYBFDqGhk0z90KVPFBBESyIoQ6NoySgt1COw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8422.namprd11.prod.outlook.com (2603:10b6:a03:542::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Tue, 28 May
 2024 15:07:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 15:07:43 +0000
Date: Tue, 28 May 2024 08:07:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVDogZmFpbHVyZSBm?= =?utf-8?Q?or?= drm/xe:
 Don't refer to general LRC initialization as a "wa"
Message-ID: <20240528150740.GJ5383@mdroper-desk1.amr.corp.intel.com>
References: <20240524230444.1447797-2-matthew.d.roper@intel.com>
 <171659491430.2210664.16973494253654723769@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171659491430.2210664.16973494253654723769@8e613ede5ea5>
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b0c471-8924-4ce5-0f2e-08dc7f27ecbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5WtSEVGU6Rune2wiKPidYP99dabHCI07UsEAps2lcndHeZ/fiX7bou0sb84c?=
 =?us-ascii?Q?VW1RnvIYAh0pWXNhD5V2YaFnVuLxjZ/WxhnnGkPstsYvy1qKS3QMoi2L8Lxc?=
 =?us-ascii?Q?KmotJoem+sBDz9zo7LS1YtXYCg5C8orgD77n9V6A1Opaj7XDQOypBL3cI3pV?=
 =?us-ascii?Q?/PMoZBWK8dVlEWM7DE/J6DCEKg0IRMu4MpCbRZdjfafg/Ewjzzl9bjNmlE54?=
 =?us-ascii?Q?fkznWT282gWiJm8VPmHXp53K/zKpyIpb3t7R2uVHzCfCtGQunQadhcNhI3MU?=
 =?us-ascii?Q?ezXEzbvmkW5lwBHFnV8FReAJKXo8xW3t6I64z2pmcWi4YyrCjm5TGMITaptF?=
 =?us-ascii?Q?DWKkbvD0MIm7EgprmtrgB2Yxw8gt0rlk6aw3tCGVxNzW6E+puHlrMgGOIlan?=
 =?us-ascii?Q?MDEL3vKWQhW8tVCdEQHcRes7mzXXH+iQ34oMZcYbUKJ+2IqaDWSt9GpJgbZu?=
 =?us-ascii?Q?DtVF+J7NchFTekYAsC0cUinttYvkgOxpf5QwzFzLGOoidUYKL1FhZOYPXvmF?=
 =?us-ascii?Q?0+ZFrzQsrmvQ9PdPoKXeB9N+T4WG8tSWuncPUEVqp6KxFkDVTM8MaIP9FQcL?=
 =?us-ascii?Q?GEHJaXlRMkAsIlYIwA00qOkZYGCbRML1fOInk4kpX/75NjU07uKEfSgwrAcF?=
 =?us-ascii?Q?jDvQMQR0di1fBsXFkRvgHPHxqfJVOX+10TcNIqRyhQUzwyY8zLTSXxzHPVLW?=
 =?us-ascii?Q?MuPp+0eJHSZwcQyi1yDQv/rKkP847Rojf+9zTwIqaJPBkpvaYgWlqhIA+xfC?=
 =?us-ascii?Q?hKOgDeTBqXh6cz7CTHk1hZOEsyPdwnWSFo/bOG0w6zlpjpGzPePn/VSOXyzW?=
 =?us-ascii?Q?AGmiV8dNQ1lZyWRk7j+NuYNJpwd2PWCl0Ansua3k/sca5h/M40/tOGz9/XM+?=
 =?us-ascii?Q?FCQESZgTJI4/KwdseNis77Wl4OROAuKkVbmbP92mBvwULTgDCx1TyD33v7K7?=
 =?us-ascii?Q?GIDG+Pp+ASu1ZELIEI8TfP5ytOVbG/v3Tbcq3O0QyqEGnba1bMABCW39WrC4?=
 =?us-ascii?Q?yb/D2l/rUhthWvd+t61fNkJ0qkjA+6nO2usaV5yQDOw5Y4lHVlBdQkbC6sXy?=
 =?us-ascii?Q?40+gst0JQevNwXc2EnQry2GK1+qje5Y0VA1vYbme581ZproOLONV2v055ZFA?=
 =?us-ascii?Q?y3Vtr+5ct4sTdDRDautfzPpNpg+DGqc0EfdOS7TvrMX5deSFfqxfLS/O9g1W?=
 =?us-ascii?Q?q9STpgptXz48cjP2PVSwBgb1v9/SOEK8Db+PCWltZcY7HbD4YC4DlYiAvgM?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?88L5rJdCHyGommjWRam6J1P7qqbGr4V3SfgYZ+fawBTC3K+EtDncx9ElnHE+?=
 =?us-ascii?Q?qe9AD7ojy3BB0GWku44WzvWzyvtgoQWeDakxdz9rYBr9cPrQBHZw8QyVhV4J?=
 =?us-ascii?Q?pX9WkLl6aIffbFhFUEhwX1Dml9pUkN6/W5i+nlVFZPbfreNBzN7jLLGHcijz?=
 =?us-ascii?Q?70JIDARSxy6+jObxX/ZKzM7rlFz9SVuw9AEh/wNKbwthpTK5CQ1ezKfSitBx?=
 =?us-ascii?Q?0z4dKf+IE+MYcgVAwIp28n/s3/BhWddOqrvkT33DYLajk2krrlLJ+uc3gKn3?=
 =?us-ascii?Q?V8r5adzjmxUkNFTzJDRPwzkUEPdevqbc7Uzf+3FuvHlWarjDnWXa0hcKU9A2?=
 =?us-ascii?Q?6wTm6jmIPD7lG02dLf3vcneR2lyo0rMBZzulp8Is5FmQPaaL/kcQfiC1UCoM?=
 =?us-ascii?Q?Yl6Zu+F+KF4/SR4YP3AJ3IVW8TOnUvQqWIvZA1+DWpEUPtVj9UhlpPs+HhM0?=
 =?us-ascii?Q?LHYy4w6PMsABwjgceyKI2het1+W+aoneo9qBxNZ0QBnLu4HXjt2Kob5sJRw1?=
 =?us-ascii?Q?lHI2G1vfCsRo/t7obnPrGo3gLTKB+ds1J6RwW6rv/xg7rRWeE+DLaxRuOItf?=
 =?us-ascii?Q?jziQIWelXeAz1xWdP1tUqSP7d4Ctm1WL+gg+mt5Q6XApXc/FnEL5Dcm/+yw4?=
 =?us-ascii?Q?pjBoNejqBX1alV5IM0956H+pwUzRBoFobDGb174/zHyfrxM+eV2ukYLidyt5?=
 =?us-ascii?Q?yEv/JPb6mvdbcNVFJWAN7L36ugiLP0mMPhnTaNF3VugvZ7XtJlLXFvaizOEw?=
 =?us-ascii?Q?/i8J4UofaklvVo0jCSMI/4g71hTvx6EOS6eLP/Nk9wTZrRvUFvbxpDxAI/sh?=
 =?us-ascii?Q?+WPqF5wwQxiz89Tet2323qhUDxaP8EJW/Wkt87gOGFgGMCoy7r60TLqmAVPF?=
 =?us-ascii?Q?0YNdPuakfvn1Ru6tpiLLtPF2nG5aBsbiZkK4mT6WW+jTVqsF3d3iotf6Zpt1?=
 =?us-ascii?Q?fPHiVHdz8viDGYDudOKveQl07Snwxk3GNeApNwUEC+/vav++xrvK8UdC4DGa?=
 =?us-ascii?Q?UTIiHN7DCEtkTcdsHGBsvP5Mhx5Pd1hMv+QmCczG52gHRyMCU81gIg4FzNl4?=
 =?us-ascii?Q?ogCqyTmP1fBH9WgRBh9hU/EZhk9jaHRidjfj7nVfN6FlyvbnbQPQJEOagDZK?=
 =?us-ascii?Q?HqqSt8tdl+bcKVx2rwtQu7UuW5uUQKndCrRYZ052ThnQHWImTS6hXpTg6Sgi?=
 =?us-ascii?Q?glCSOKkxhA7wY7h6mZCAalzW/sKp7JVoLtipXzLxsbrL/XFBXapIL88iaudP?=
 =?us-ascii?Q?l4LuFUetoSBNPV/YUS02cI4hLqVCJRDDhMbXv4Rz9lOh8O6J4gbKnWeLSw83?=
 =?us-ascii?Q?o/cI2pv4i3hcGto1Loh4FKAVmwg9jlwVOO6LZEpS7lsIxxBLAm8CGFlPWBgK?=
 =?us-ascii?Q?6IHEH077BJR7XGHzXRigW4OlXm5fLgIons3NaeR7vGyJ0O27BIGEL2Pe32pS?=
 =?us-ascii?Q?MEhhSpe/2Bx5ZjrPquQzUgIvfikKTcJQ1YpLmdXs/TwBHTkJXDS8MrAswmpM?=
 =?us-ascii?Q?yxm5ziKmPp29ag9eT/of47zzBptLftKq+ta9cOtsjnt6gDMN+hADsvgqhJ9u?=
 =?us-ascii?Q?6u7TauvlII9gJ/ojnMPUG13n2A2NgK/XeeNGEATjqUmsiCSFLXotunAV0KJ0?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b0c471-8924-4ce5-0f2e-08dc7f27ecbd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 15:07:43.3591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ES3p+CHKiFjfwM5dtfaLrLAEj7LzRmnSq8ZPwjHllEaY4LsGY6OpdWZJUC2sHNdXNvVcUqRXyAjPo9aLgty9rM8JqqF94OcvJRNLkNmWBac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8422
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

On Fri, May 24, 2024 at 11:55:14PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Don't refer to general LRC initialization as a "wa"
> URL   : https://patchwork.freedesktop.org/series/134035/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f_BAT -> xe-pw-134035v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134035v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134035v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (5 -> 5)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-134035v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_compute_mode@twice-userptr:
>     - bat-atsm-2:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134035v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr.html

Not related to this patch; this patch just renames a variable and
doesn't introduce any kind of functional change.

Applied to drm-xe-next.  Thanks Gustavo for the review.


Matt
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134035v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_evict@evict-small-cm:
>     - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134035v1/bat-adlp-7/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_exec_compute_mode@twice-basic:
>     - bat-pvc-2:          [PASS][4] -> [DMESG-WARN][5] ([Intel XE#1908])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/bat-pvc-2/igt@xe_exec_compute_mode@twice-basic.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134035v1/bat-pvc-2/igt@xe_exec_compute_mode@twice-basic.html
> 
>   * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
>     - bat-dg2-oem2:       [PASS][6] -> [ABORT][7] ([Intel XE#1908] / [Intel XE#1939])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134035v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_exec_threads@threads-mixed-fd-basic:
>     - bat-adlp-7:         [ABORT][8] ([Intel XE#1908] / [Intel XE#1939]) -> [PASS][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134035v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html
> 
>   
>   [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
>   [Intel XE#1939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f -> xe-pw-134035v1
> 
>   IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f: 573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f
>   xe-pw-134035v1: 134035v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134035v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
