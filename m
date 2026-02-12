Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D19EEA845
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 19:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0988F10E2A0;
	Thu, 12 Feb 2026 19:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DO1unZIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D51110E2A0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770923108; x=1802459108;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=zZeLqoy7Q+PUuNvKdah+ZnBOKs54Cn/GN3SsRZA16LA=;
 b=DO1unZIYooPCe9bTYugcMQ4VXm21vWUAKB1DFQwQzQYTtO6e9+DZCH5G
 GRsdAbsU2T274z0EWbVrEzJ8iNnlQlWvBUje7ZXQRxPxgJFyeXVIOs3D+
 mynAU7Dnb/tcavi6sUyd7JQmxw43AZd6jgIuywii79qXwi882wHdS6D4n
 uHWfTfVuZC50lLI7NWSZD/mAgr2kkeOSNagsPDXsm2lumMuq4A9Nqnm7m
 BIjCn7aAyZ9QeA/sfZcwrb7NjCSIdRtdZTgiOoJWRe9bQubQ+yrNuvMuz
 4WHiBHzy7CToST4Ibn3Kev95p3TGeifsibkClUH9opQrjQCIUNXUMqAm+ g==;
X-CSE-ConnectionGUID: V4E8tXVDQIWts2h0wWyUTQ==
X-CSE-MsgGUID: wNuhNuH7SVKKJ7TD2veiYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71821529"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="71821529"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 11:05:07 -0800
X-CSE-ConnectionGUID: Ar5V6fRQSqK/GtXt+308fA==
X-CSE-MsgGUID: /rXX2y3+S2abQSlXzGSyYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="212791757"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 11:05:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 11:05:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 11:05:06 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 11:05:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1TI8xIedQRNuNmeEVOVubbxZxwWDsrJTtU0+GbhB8jk7si0gBaiDKWa5MZQC8vb36kn/XY/+lWP2lFxUkVHylGW1AKI4HLmAPvpX+OdKXrpikMZjqtOm9TkiHkhM3YA4mEq7NJ0jpLu8tgyp/QrPaGQPkbUHZXSwAIi8jyFLyc0T7QOfKhtsBVQJF25yBxw2N8qLKDz2maNj5i2PoFA8dAlWIz1JP9gt7XylrHflStJRzlteSI2FVV2VHzvkOY5a+lGd0V8LmWrjXoSR5WMffehMdBDCzPwYmJ1rbOcq8zUl4vwLU3riugQVBdH8XJOjS3A92Vb4USWo9RfaBU06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZ3AEyWDROCvguilM4WOB49A+g+6RNQ8Yagi6/Guuhw=;
 b=FdUUrMZwG9W3i55S2s88boJaOpddJp5w9LJQ6sZ9beHaG8ViTChaKHJRtgyV6GJGN30ugH1ZurQOQSEtLXw1icdb4FIojFfTsnDq+eiBZqx2dG703FnKr/sAKSqQ1n3YMTeK7sOja79JxSU5iM83qCAW8yluLI9aPdnEtRSCdaeZ9694q38FpIttrTyweUpFInw+5FcqqjcP53u5Pn1hQdGoAydEKaUe6cQnB6OXQZ4t8JF+Y9qhJZKgAAlVfAxty2bD9ZWQxU3aGDwmcUGG2vaX2/1dABjtmVERHAgnyvzzDJTeYcxHg9u8rD0GMr23LjFxowMTeYrXFcprRyG6vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 19:05:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 19:05:00 +0000
Date: Thu, 12 Feb 2026 11:04:57 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe=2Fxe3p=5Fxpc?= =?utf-8?Q?=3A?= Add new XeCore fuse
 registers to VF runtime regs
Message-ID: <20260212190457.GM4694@mdroper-desk1.amr.corp.intel.com>
References: <20260210182519.206952-2-matthew.d.roper@intel.com>
 <177077359645.244788.3679526339999924253@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177077359645.244788.3679526339999924253@a3b018990fe9>
X-ClientProxiedBy: SJ0PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bbfd91c-524a-4764-99a5-08de6a699e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TL5Sgh13ZXu5mSrmXDy8bQgwLZI9Ngcz8izSBbp6BqAeE18t+s5+xKfEuSpy?=
 =?us-ascii?Q?dlxvcVbqaKQQ4NUWdl/Mja2wHDHdDCIpBwfLNtdxiwoFr2lDNQ8mF4904gsn?=
 =?us-ascii?Q?AhnLyc/I6l6yVeVXol96rO3gRt3PRxYOhv8tel5gNuJk8ZFXDdKZ2paJhf+I?=
 =?us-ascii?Q?WiDoh3oTnmq66mLreKhmsKaBK+nT/IdP/6EcFpBIEn48vPM9KvCRfKbubjXO?=
 =?us-ascii?Q?Nb25uzcoPlWNhQQkSc+QPdVzf8tbEKBp0hPYYzzuqSU7n8zpwWjr72vRtzlL?=
 =?us-ascii?Q?Qt122+un7fhXvnWcuXh8jHR1uj8ReJVQzsjKCJW+YDFxQdl93oql3JT6YLmF?=
 =?us-ascii?Q?7QMViKlQGQ7v+fvXNz7EKQlRbVwiZwLd2Fu2AeNnCaxZELVeoPvVgK8RyJf9?=
 =?us-ascii?Q?JBLHsiux4hbCPvtKQcIG0WnfJOwGBYmdk7nQYTc69I1T1Mdk960Vv8LMTXXy?=
 =?us-ascii?Q?xMDv+mYnof3Rl7Jxify6jp9AC5eI0WfBNXWBXfUQRTe4MM+RgrqPfPyGAW9/?=
 =?us-ascii?Q?TmX5oLjScylQpiCBLOPj0Oun0gnn4jbA5lIEwrNpLm2kbB2D0aXAcBLcwEHs?=
 =?us-ascii?Q?Tb6Z4BRs4QWULSD41MdJmsfaivDbZNktnX+7P63ivK/r+PQUzZE+0XEhlI3O?=
 =?us-ascii?Q?Wkq6Ic+V0Yx6wa5CX9Y2N1L3mhg9y/+8LS3P//tsbEgdBcb/HhDJv+zi04q1?=
 =?us-ascii?Q?Utdr177bpHjMs3Oe3OA+JDNseblOJsE3xGXzPwGAfTor4bUAi00ntsjhWirI?=
 =?us-ascii?Q?6YENacr6wepeb2bVoiCcf0Qj4o+oWSv1IrUFnP0rmjwRvYUCpwYJFb+qZvrr?=
 =?us-ascii?Q?DQoGHOwlBQbs6GQ0ORWf/qdiarmP9gx3AX9kRrHjyoX6Jg3Obr3tgiYcUnlz?=
 =?us-ascii?Q?Yt/aCpmuMaRdn/b3E4VvmeLS4xi/ro1qCj9ceg9GMsuKvFspRDvUdyXzi1+3?=
 =?us-ascii?Q?a9qRw3p0XviXFNPQuVgiXPAVTsVxXNMIoD/E+N1VhHGGLtDndTathpdrNaIW?=
 =?us-ascii?Q?uvsnYRhMvZg22z2vlWIYwtqZ45L24damU1v0z5Lx9jkzD/BQArSIIEh2JIFA?=
 =?us-ascii?Q?R3E1LQaVZ1dkhEAZyUBszZTf6vfkpiDUITUElpw3UjjpPhGYw6jAIpeNflCA?=
 =?us-ascii?Q?FHqm1ppIkVCWx/yfMudi5u7X4ZASGmKbiJjvk9Y2e5CT3AkwtDvLg+6OvqvU?=
 =?us-ascii?Q?2+TmiRdt7KZVOE9mx9yPTWk1KaCmZ2pIBJI5lpP7QI3LtsLEHU6ucXXwV+96?=
 =?us-ascii?Q?7CFC39c4HCw4G5feayqwT7lLA8cnEYbBLcJWnphtNz9n6zUtmeF+Tl6VA/Ip?=
 =?us-ascii?Q?4LBxXERDeABRb1Y44vdckYa4wttZpX64X1Zjd7jEjtX13CsAmssWhbR6tB2m?=
 =?us-ascii?Q?eNLjhSeBUFV8SY4ZJff2UGAcbpDjFGPiLtBkMiNUJj0/b21ChLV3Lk6kbc6m?=
 =?us-ascii?Q?reVhgee2BttWRBcByParKIgvlH8Pmc/oPI+yO2nxXGudDvx2zf27paolHPqK?=
 =?us-ascii?Q?3ar+WUrX6mnSVKMCxeLAd5ykLy+mvY/Th9t3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bFH9+8UCUooIB+8NUxydGw63peilDChk2kCvBIroN7P/biKl6uKA6a+FXBCg?=
 =?us-ascii?Q?G8Ug7nu/MksAb4RXnjBGg/DK+ptzftOBkPHh02sBFyU1qS/DHBjmzDFAkAhd?=
 =?us-ascii?Q?h2XHVcKbh0Rjvz/aDiJTu3T3Pror7xnYRGxhOZCEsL89z/TTzg2RCktrPc3Z?=
 =?us-ascii?Q?CkqI6bYq9Ew8LyWPLPU31J8mOOx7uPIzNkLW1lJsQCh6PU1YTorMsNNoS58Q?=
 =?us-ascii?Q?4t8M8x9DRCsvmGvvfzh1gOQslKl5On0R6qSyR02wsM4LQIcvtP/bxbXzyLMo?=
 =?us-ascii?Q?1vS7FcIORTcDexPPjihjeVLV3/cWUWjSZ6QUFkRt9sZKXfE/SjPiVaCl/dwD?=
 =?us-ascii?Q?0VARBp6tWN+nWJa6ie8TzmdPylFgQuVTqX4Kl4bbouFn2z0w4ikN6av6lf5m?=
 =?us-ascii?Q?GwXSAfdub4yr16wRDF96IL/GY9iRCGHi6/Ie+9KArEhADQnua4aMLwHYyJKx?=
 =?us-ascii?Q?ach882BvVmDheKgOhfnLxJCZapINaIBA7GikCPg7ZO9/bdpDRsopsmXOReEZ?=
 =?us-ascii?Q?S9XToaRQ46f5RhVoDUOGUQJTG5xrkOkmSp4DnoFn2YauJQnk90yjHALWxzgS?=
 =?us-ascii?Q?wWBwh7hsmTr+qkoj9/PzSdHvVW8flQb6NZrAc0o+AYUso0jGn4El7a8TszMR?=
 =?us-ascii?Q?EUgJOURBsRSnwf/Zp0tNmi+op9Y92hEQfgcxIHLtyNgm0qIOVtDHDHl/Sw6H?=
 =?us-ascii?Q?hBqjJO4tk8DIgN3qVrEIq0sy1BSTnnBh0/GDMouBLLzUnc1tTEK4+LrVz3ge?=
 =?us-ascii?Q?zypZUTibzsaap94yukATbmM3esS+z3D/mEvjpuR+5aRqGgi3BDJjXMKnE5ZY?=
 =?us-ascii?Q?mYlUbrBecR4f1IYYrAjiJId7VnElQOFRVzJ+5SrEafnK5016DLaJsjaTr0hC?=
 =?us-ascii?Q?Hr/APDpfqc1Wm6TurYMRziRhYk9epP0OeQC8vX6BZtCrCH/tkUcSeUiUsEAW?=
 =?us-ascii?Q?sGnAwGvVGBOS5J/7VGPpuM0BT1xK0rAb9Us2IHAqweM1DB+nFzoXh7ELXRok?=
 =?us-ascii?Q?aVKJBIaNCNSYrvPSDL0gV6pIvwQzQrISsne7RNvTuI3jL3FsowrSAxa6jyxj?=
 =?us-ascii?Q?Fl8KcwGCgRJm+0iQWQuGTfSmeS1QtePjNckfobe69RabNhHvWgzQwQyVPs8c?=
 =?us-ascii?Q?zlBSxl6/3Z8ioVNrCXtlCDgESlWSlz3G0em3Ethppo0Y8Q0A7TpFYnieRMj8?=
 =?us-ascii?Q?AAcjuPFKOUpiTPYtXHHFF1Qp+A1iD1UxCOXIEqPuo/aUaXCtsNbJqGE7jsMy?=
 =?us-ascii?Q?yTvlPcLKJZYc5GzdQsxi8Tc77U6pvno5nFUUo4F0ncELn+lAJqvoYVRvtLqN?=
 =?us-ascii?Q?uom5p9GCEg9Rmq7nt3BR1LEJPJ+T5fROOlwMR3HFJA9Rvkt/x808v6WAP8QD?=
 =?us-ascii?Q?SV9PCDq7fByxJ9YoWmKa6vKzB8Yl70tvT5RJF65tQF3aAMC7MrEL+2oiXyvu?=
 =?us-ascii?Q?8SBVGDHGEzanXF5UbwMYAVTLFXwk02oaykeVAqznQUMFcAJTZc8/3/9CnfNr?=
 =?us-ascii?Q?IzGEEZYWHFOtzxLZ/yjvmgiZuyzeI75++jsR9ptemEZI+sgTnfAv3cMQK2Us?=
 =?us-ascii?Q?hqYN5hTj92ojAEkRsdIfOsOppB6uU2IkLZ9Mcktwbkx8ezzBeu3eK7f3Lo7D?=
 =?us-ascii?Q?EktPGjIMfGW8zASNFAE6vpmhyZdH63Wh+jMtQjIwhLY9QTwez7rbo06DUSSB?=
 =?us-ascii?Q?ZAUmd1OCUbetTMYazKDrn1R178ByG1YYIS6nruc8Iok37yM34lBMQnQHv/4D?=
 =?us-ascii?Q?U0QpdH756YUGbN6kYjC/eOpXFgY4SQo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbfd91c-524a-4764-99a5-08de6a699e9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 19:05:00.0293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3t+etnr3xvzWAESRGcBbJ8UW/+KvPEkwVc2JlnyyEE2UHehfEqh5lOTbgYpYYlg8gfzYeAVqlDfhj1vJFsaldjDhtEwx25jbg+sqBGmtucs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
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

On Wed, Feb 11, 2026 at 01:33:16AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe3p_xpc: Add new XeCore fuse registers to VF runtime regs
> URL   : https://patchwork.freedesktop.org/series/161454/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4540-83567893a1553b91cc76ab3bff0579f521e17861_FULL -> xe-pw-161454v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-161454v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-161454v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-161454v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html

System never came back from suspend.  Unrelated to this SRIOV patch.

> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3321


Applied to drm-xe-next.  Thanks Kwan for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161454v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2370])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2314] / [Intel XE#2894])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][10] ([Intel XE#1178] / [Intel XE#3304]) +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#3304]) +2 other tests fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-8/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#6707])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2321])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>     - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2291])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#4294])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2374])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#2316]) +3 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7178])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4141]) +3 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2311]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2313]) +3 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3374] / [Intel XE#3544])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7130]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2393])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#4596])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-none.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2330])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_setmode@basic@pipe-a-edp-1:
>     - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#6361]) +1 other test fail
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-lnl-2/igt@kms_setmode@basic@pipe-a-edp-1.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-lnl-8/igt@kms_setmode@basic@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1499])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4837])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][38] -> [INCOMPLETE][39] ([Intel XE#6321]) +1 other test incomplete
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2322]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7136]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6874]) +4 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html
> 
>   * igt@xe_exec_system_allocator@threads-many-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4943])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7138]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [INCOMPLETE][45] ([Intel XE#7084]) -> [PASS][46] +1 other test pass
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-bmg:          [SKIP][47] ([Intel XE#2291]) -> [PASS][48] +2 other tests pass
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-bmg:          [SKIP][49] ([Intel XE#2316]) -> [PASS][50] +5 other tests pass
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][51] ([Intel XE#1503]) -> [PASS][52] +1 other test pass
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-bmg:          [SKIP][53] ([Intel XE#7086]) -> [PASS][54] +1 other test pass
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-bmg:          [SKIP][55] ([Intel XE#1435]) -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-9/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
>     - shard-lnl:          [FAIL][57] ([Intel XE#7072]) -> [PASS][58]
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
> 
>   * igt@xe_survivability@runtime-survivability:
>     - shard-bmg:          [DMESG-WARN][59] ([Intel XE#6627]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-4/igt@xe_survivability@runtime-survivability.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-5/igt@xe_survivability@runtime-survivability.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14:
>     - shard-bmg:          [SKIP][61] ([Intel XE#7194]) -> [FAIL][62] ([Intel XE#3304])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-8/igt@kms_content_protection@lic-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@suspend-resume:
>     - shard-bmg:          [FAIL][63] ([Intel XE#1178] / [Intel XE#3304]) -> [SKIP][64] ([Intel XE#6705])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-9/igt@kms_content_protection@suspend-resume.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-6/igt@kms_content_protection@suspend-resume.html
> 
>   * igt@kms_content_protection@uevent-hdcp14:
>     - shard-bmg:          [SKIP][65] ([Intel XE#7194]) -> [FAIL][66] ([Intel XE#6707])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-bmg:          [SKIP][67] ([Intel XE#2316]) -> [FAIL][68] ([Intel XE#3321])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][69] ([Intel XE#2311]) -> [SKIP][70] ([Intel XE#2312]) +7 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][71] ([Intel XE#2312]) -> [SKIP][72] ([Intel XE#2311]) +8 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][73] ([Intel XE#4141]) -> [SKIP][74] ([Intel XE#2312])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][75] ([Intel XE#2312]) -> [SKIP][76] ([Intel XE#4141]) +5 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][77] ([Intel XE#2313]) -> [SKIP][78] ([Intel XE#2312]) +6 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][79] ([Intel XE#2312]) -> [SKIP][80] ([Intel XE#2313]) +12 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          [SKIP][81] ([Intel XE#4596]) -> [SKIP][82] ([Intel XE#5021])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-bmg:          [SKIP][83] ([Intel XE#870]) -> [INCOMPLETE][84] ([Intel XE#2594])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4540-83567893a1553b91cc76ab3bff0579f521e17861/shard-bmg-9/igt@kms_pm_backlight@bad-brightness.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html
> 
>   
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
>   [Intel XE#6705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#7072]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7072
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
>   [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4540-83567893a1553b91cc76ab3bff0579f521e17861 -> xe-pw-161454v1
> 
>   IGT_8746: 8746
>   xe-4540-83567893a1553b91cc76ab3bff0579f521e17861: 83567893a1553b91cc76ab3bff0579f521e17861
>   xe-pw-161454v1: 161454v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161454v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
