Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EA1C531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 18:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BC210E08D;
	Fri, 24 Jul 2026 18:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZzzgLXOr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A129610E08D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 18:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784918663; x=1816454663;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hmIQ0QkAxgD29r/IJUqCFiP6haPlm3tnJ/PFTudNNH4=;
 b=ZzzgLXOrzTahMrNJHMZQrkLSv2EyggYc4UJ452OjvmU208BIgwL9Pj1N
 1Bg6zAkVCskoVOlH0QU7xNNcKQcetUv1XKtfsAQfPWCk1+2syTzFJUNKk
 oTN0MGUkRyccHcsiF+Aw0Xq51fu346Neg3u11a1kqSQwFgrKV6Vzl+tDL
 XhN3QtYhN+JqiIJ9Utjn2VpiTqLrcpl8PxvFfgAqEnRzIslIx1mvFB6lB
 NC88DP5pO9SsNJbJmtKIMDcOk5dzmonBRs6Lm3QcsscHJr5Hs0hxUkthZ
 /GVYWlwnEbvmiysJL4ihl99uqMRHlBYFLiO62ujqucry6I5zYBcJDpwmh g==;
X-CSE-ConnectionGUID: oepYbKrBSvWpMz1WWVPlnw==
X-CSE-MsgGUID: 6lB09kWoTQOlDcPkIdipow==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="103001791"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="103001791"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 11:44:22 -0700
X-CSE-ConnectionGUID: xOKji7M3Rtudwgb5ADSLEg==
X-CSE-MsgGUID: bl1e6f+SSG+EhU4VRB3VPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="283287974"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 11:44:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 11:44:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 11:44:21 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 11:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cw1rlJwaHuEJa7nZgan2iIOVPeOAGfRWvKWcFJNpsjw42P9h0B2VTBCpeHXaYa14AuJm0tYakWeSdrPXxogX4OuK/csR+QilAT3Gwqfrltj/3WA8zm5YBTok4wRmG1/1qF9avsGOaDwPIOTuqMyCPOJ1PX1erB/fBNX2s1UI/cy7CAKLtaYUFsqSevfycKXJ+l5GodfoZovwpU2vMC1IcODpr9YgN44bE2wvwVWTJ12ktXNdo7aHpQ6O9FZSjWQ21CiWpWTpRauGyI/XoN4XnfFi6xw8yGjmhRbwOUmeBShEyY6cmd/FGe37rEoTQ3Pz3OMSLmkBiUa9gTrpVNKh+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQfMjSo4v1eKyaI5sCcgNTtQ9u51sf5/nf7KQoi2Jro=;
 b=urTI2nB4HYFeFepKYljnYyN8NZ7+GJ+svjCKFcybKMqMe8HG6f9Yd5cdxdkMV6IPX7cpp4T6a0UT9XqQy9APK17T2ti5WKAFmsaYtQqUHysnCnfMtIFCTgKC16jyrBM+B3lkM3ztBRn/UeeXG2IMob2E+2nFplHlERsF0pWKqNRhGSilQFkVd2YSHR1CFG6uJX7LrTKq6jzTH3vKXhTxGAXlwi2bEOvvOzgJD3NWzKaUUd51QrmJzrYZ5A/WbKfkzA16j7ErKnXAO+qFDEFiS2Rk1qDBYqgrzoPlSpQ/KfXCUP9BeRUCsHiSm/P76iCA9NW5Q+Om0R1D5f99PlZU2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by DM3PPF8ABC16DA2.namprd11.prod.outlook.com (2603:10b6:f:fc00::f36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Fri, 24 Jul
 2026 18:44:15 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 18:44:15 +0000
Date: Fri, 24 Jul 2026 11:44:12 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_series_starting_with_=5Bv5=2C1=2F1=5D_drm=2Fxe=2Feustall?=
 =?utf-8?Q?=3A?= Add WA 14027054324 support for graphics IP 35.11
Message-ID: <amOyfLom0Ce8S23q@intel.com>
References: <16b6b972691943daddebad6e7b93b9d73add5249.1784745545.git.harish.chegondi@intel.com>
 <178483938154.222631.18342108634041208280@6beec6c84f66>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178483938154.222631.18342108634041208280@6beec6c84f66>
X-ClientProxiedBy: SJ0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::22) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|DM3PPF8ABC16DA2:EE_
X-MS-Office365-Filtering-Correlation-Id: 05c20e9e-84fc-4a2d-9601-08dee9b38fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|6133799003|56012099006|5023799004|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: wUFpxjCmvtkoanvKMOQGRwiY8C44OYG3zSIUdtJWUiqXsGThz/s0dT1Qv3Jvf85PfogRPtgLOvS6322mTLrkR2ZZ/6AQSS6bd/MDVS1TLo3tQPhevLhYxpMajAdEqRmYblCS2SIgGY4i4ccd+hp8v3BpT0f/ZRAN9pHjWND3+EXXJMwrVyfU+Ku/rroIx+npA7EHgVJJyYdvUUbV5afWH3rTpTTfBHZ2+dRANEDXoLqXy1NzP7cvWbpikrgRYb6BXjlS/UNsKD33CLdVBSndKkFrKnLRnJvMjuGmGOZY0YBpvuQfHpMA2ipla1do8/IpOP8AgqoJrsltw7KNM9YYOuKmHnNZ7sXtb4kscHkBk9uZkgaE7JxGvUXS9ES/pxYt7yAhjjuOx3EjK8kM+k36oEShuqgb0uGljjLIrbZB9LuDeuhPEnrn+MM25tAWGbqJ0Ik0CJ+6gi8d0vxNGiVKPswR/X6QmBysUx6HQY9zs9f3V10n+i5XNr5/GG628zVcbh6GmAQR4rPFS19ordyn/4NBFjC2XWnPwBz3k6JPxF+BVB0VdcTA5rs2wbsg99QIdC3f3/JHAvLe6sW8/NcuUlMqcHwO/HgX6nh5slQ61ZZVPeenuhVIpol5TXwUWTAH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(56012099006)(5023799004)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YktYWUsxQUxHcnNpcE9FZ1FTNjYybFF6bm9MRjhJUU1Ub2R4OG8yZyt6WDF3?=
 =?utf-8?B?WU9JY3ladVFHbjdnUXQ2a252SXBuNThEVHRYLzNFdnZLcCtUcXhqS1N5K0Za?=
 =?utf-8?B?a0tJN3pULzFmQzd2cDEzdENLQThub1oyNFc4OVZEWjgzeUg4MU1lMUtIRDdX?=
 =?utf-8?B?OGhCWUIrRXZEc3VKeVBqSlpuVGcxY1pxUWRGdmRER1ZyajQ3dUdSaFVIQ21r?=
 =?utf-8?B?VFBKcU5XQUZMZGc2Qm5XbUp4SXlheDYvUTl2Mi9MWXZhQ01ZUW0xRUNId0VS?=
 =?utf-8?B?L0R0MVJWbGt6Sk5LYmhiMTY5TW43aitCR21DQm82R0hLZXBXQld5U1F3N3Fu?=
 =?utf-8?B?NDBiT3pKZk5YakZsOXJ6dlpqTEN3WDByK1JYY0dpL1lJdElORi9za1lBbVpR?=
 =?utf-8?B?cGxud2I5cTJxa1Rsd2NSajZhb1laTHJocWV4LzNMZWNTZk8rZ2o4R1RZU1N4?=
 =?utf-8?B?RG41ZWF4OEdhU05oM2lsZ08xRGlESEtLOHFBbk1xQXprRjZuUEFoVWhnSFdR?=
 =?utf-8?B?NFJ5ZEovNXZSZlNPVDhma3hYTllEK3pGdTQ5VjgyVGdBQWwwRTBzc1ZRcGR1?=
 =?utf-8?B?dFdWS2JhVkZNM2dqOVVtWkVDV3BBN0FwZXFHQXhiSTRTeFczNFhkZWl3MUhn?=
 =?utf-8?B?eldQMkhXeDBiZ0ZvUWVYUXFib04yZHlaeXJiNXRjdWVRUFFsbG1NYit1VXEv?=
 =?utf-8?B?WDhzV1VNa2JNNEpNbllJMUNxT1prNDJxemFVbjM0NmRVdXpmQjFvWWUzaDl5?=
 =?utf-8?B?N3VQUENJSk5IbCtXWjZiMjNPWGkwR3pyKzVvdHc0d0hJTGhjRmJOckdoaTE3?=
 =?utf-8?B?cjZ4VDhxTndYM1V0Q25rZ21Jek9VazhNdDcwQ3RDVFUzWUFXQ1VTSlJ5cjJG?=
 =?utf-8?B?NnpzWkRQcXFiRDFEMG9Cc20rT3hOU3l4eml4Tk1nVTZ0dzNqRk1Qem5PazRS?=
 =?utf-8?B?ZG9HcE0ydzVIK0JkdnlMMko3WVNtT0JSWk5HaU00eWlqZ1VzVFJQczFaTjZM?=
 =?utf-8?B?WkJSbitkSi9zdGp3YUhGejZjWHNQUDVMaVRiY0t1a01EQTdJQml5cmRDenUy?=
 =?utf-8?B?bWxHRFc1cjVobDY3eVd6Z2U3UEsvaEM0Z1N4cmdoWklFdHNqbXRZWGxGdGVO?=
 =?utf-8?B?dTZ2VUJQbFZhZ2dKbk9aMm5aL3F3K1lJekZqRFE2dDJPZWlHa293Ly93QjJy?=
 =?utf-8?B?bWJPSFltRnIyYkpFSXFsQlQ5UlllRVJaaUNDQVpna1owMDQ5NE1pY2JHaUtw?=
 =?utf-8?B?TzdEZEs1RDc2QkVGanQyVXFJRXJEd291ZSttNjlKc1BNQ2M4ZEhTY0VrdG1X?=
 =?utf-8?B?b3Boc25BUXdIZDZUdUpDeVBuWGo0VGVHZ1I0YnlVR0liZnBwSWUyb2FuTnJJ?=
 =?utf-8?B?MGNpMXFYSWZYSis4YUJiem0rblJoNm5XWGpWcHJrbmkyL3djWFQ3MzUwQWNE?=
 =?utf-8?B?ZDdnOGNyOUVlb2NJUE01NVhRYVJuM3dGaWtSOHZsUnh5RkN5YjZvOTkrRE9M?=
 =?utf-8?B?djZUa1J3Z1EwL3NuTDcrLzdmVlBnL2JTdFY4UEp3SnN2SFBKK3plWmNrL2NS?=
 =?utf-8?B?cFRZZmE1WmNqbUhldXZPWWh5aytmbG9IQWR2VWtpWWhJUHBhTmU1WGk5N1BE?=
 =?utf-8?B?V3o4UHRqeU4xaDBXSjlGSGM1aks5b1Y5QkNTNHFJdW8wcTRiUHR5UDkzRkg0?=
 =?utf-8?B?ZVNpRXJmUFlwNVZ1bHFSN1NXTlRacE9xZldDK25hQWpVaTIwT2dRdlMvRFZ4?=
 =?utf-8?B?R3ZYTnF0K1laV09wdFVRVkZzOHlTaUdnUCtuejVpK0hRK2JvOVFXaTBXZm5M?=
 =?utf-8?B?ZHAzSlNtbHQzYURUNWZUWHh6V3NvWGI4Q2phQTROejlUUzVTNjRNd1BoR3Rr?=
 =?utf-8?B?YUVNcXhKeTFQZlpxR2FsUHNWbzh4aVpET3lPSCs1cGpOSEdjY25lVndab2Qx?=
 =?utf-8?B?bno0L28wekR3QStPUkpwNExlN1FEbDVIMFNEWXJVczlRZXc4OGxzZ1FnNFow?=
 =?utf-8?B?SWp5bGxHZ2lHTTgxaEZPODVBdFJkSGhTWFhRYVlyMEN2RnU0b1IrSFI4MW81?=
 =?utf-8?B?WGhkaFhjTGh5NERUeGdvVEMrZkRHejU1dnczYVhHblpaSmtETjQ4NklHM1Bi?=
 =?utf-8?B?NUdZSWxmQzUyNE1YMmtrUjR6ZHY3QmdZNXJsV2lxTStYQW5TRFB4SitLQWVV?=
 =?utf-8?B?MklXWjcrSG91ZUNIQ0RrSUpYZ09sZHczbXNBeWRFbzN1SC9RajRPdndiMlVo?=
 =?utf-8?B?cnhuVDVNTk5MT3hhZWZJS0xsVTRJb2IxV0pDQTVLeHM1SzB1YXY0cmdNMnBy?=
 =?utf-8?B?ZzdzVTlNaUFHWjZPN3hCN0ZLZlovN3N1VnpLblRxU01EK2w1RmxibUdXMFVu?=
 =?utf-8?Q?fVqfaR/BM+ia2plA=3D?=
X-Exchange-RoutingPolicyChecked: qkRy0n7fnvY6SX277LOK11P6aSwQDKl853QXPvEXitq6V5MkbX3+3NTDSxhd/0tqSf0mVPIOsj0wXJ1tHVEzjOJRX7fvf5lf6TnemLl3ndAFlyjNiqrA4vTSyH+mt4yEtwz45ubtDZTeGF8WppPBSUxVvtDJSaUkRcvuvvtQN4tOcQIvJhBJ0sd1g1NDg61xtA411C60i4uNJXSnpL4v0aYh9Ne+AgJu6oCm6qDgodbNhNgQ/E3yVa/evjPxCCgt1DK8WJFhoQrNNbGjEwXmQ6cpfsdBYK+2gUppdxle2/MMlkwpC32Zx09uK3wRZ51dx0OGioApyZABkUoUph1pcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c20e9e-84fc-4a2d-9601-08dee9b38fd5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 18:44:15.5962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2V3KEHFsMmPAYyiV5eYX4+P8bTBR5DrOm6b1w3RGmgd3ZfgKNmqKds9pqPMZK/vuiDMkJ0/eWuRZzL9cWgtSjLmtrBUuoJRxS7vAqfQO7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8ABC16DA2
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

On Thu, Jul 23, 2026 at 08:43:01PM +0000, Patchwork wrote:
> Patch Details
> 
> Series:  series starting with [v5,1/1] drm/xe/eustall: Add WA 14027054324
>          support for graphics IP 35.11
> URL:     https://patchwork.freedesktop.org/series/170932/
> State:   failure
> Details: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170932v1/index.html
> 
> CI Bug Log - changes from xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004_FULL
> -> xe-pw-170932v1_FULL
> 
> Summary
> 
> FAILURE
> 
> Serious unknown changes coming with xe-pw-170932v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-170932v1_FULL, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> Possible new issues
> 
> Here are the unknown changes that may have been introduced in
> xe-pw-170932v1_FULL:
> 
> IGT changes
> 
> Possible regressions
> 
>   • igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
> 
>       □ shard-lnl: PASS -> INCOMPLETE
>   • igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
> 
>       □ shard-bmg: PASS -> ABORT
>   • igt@xe_pm_residency@cpg-basic:
> 
>       □ shard-bmg: PASS -> INCOMPLETE

I have verified the above failures and they are not related to this
patch.

Harish.

> 
> Known issues
> 
> Here are the changes found in xe-pw-170932v1_FULL that come from known issues:
> 
> IGT changes
> 
> Issues hit
> 
>   • igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1466)
>   • igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2327)
>   • igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7059 / Intel XE#7085)
>   • igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1407)
>   • igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1124)
>   • igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1124)
>   • igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#367)
>   • igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#367)
>   • igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +2 other tests skip
>   • igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +2 other tests skip
>   • igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>   • igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2652) +8 other tests skip
>   • igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7358)
>   • igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#373)
>   • igt@kms_chamelium_frames@dp-frame-dump:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +1 other test skip
>   • igt@kms_color_pipeline@plane-lut3d-green-only:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6969 / Intel XE#7006) +1 other test
>         skip
>   • igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-1:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6969) +7 other tests skip
>   • igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
> 
>       □ shard-bmg: NOTRUN -> FAIL (Intel XE#1178 / Intel XE#3304 / Intel XE#
>         7374) +1 other test fail
>   • igt@kms_content_protection@type1:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7642)
>   • igt@kms_cursor_crc@cursor-onscreen-32x32:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1424)
>   • igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +1 other test skip
>   • igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#309 / Intel XE#7343)
>   • igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#309 / Intel XE#7343 / Intel XE#7935
>         )
>   • igt@kms_dp_link_training@uhbr-sst:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4354 / Intel XE#5870)
>   • igt@kms_dsc@dsc-with-bpc-bigjoiner:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#8265)
>   • igt@kms_feature_discovery@display-4x:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1138 / Intel XE#7344)
>   • igt@kms_flip@2x-nonexisting-fb-interruptible:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1421)
>   • igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>       □ shard-lnl: PASS -> FAIL (Intel XE#301) +2 other tests fail
>   • igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
> 
>       □ shard-lnl: PASS -> FAIL (Intel XE#301 / Intel XE#3149)
>   • igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7178 / Intel XE#7351)
>   • igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#7385) +1 other test
>         skip
>   • igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#1745 / Intel XE#
>         7385) +1 other test skip
>   • igt@kms_force_connector_basic@force-edid:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#352)
>   • igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +15 other tests skip
>   • igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#656 / Intel XE#7905) +7 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6312) +1 other test skip
>   • igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7905) +8 other tests skip
>   • igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +3 other tests skip
>   • igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6312 / Intel XE#651) +3 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7399)
>   • igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7061)
>   • igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7061)
>   • igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +12 other tests skip
>   • igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7865) +4 other tests skip
>   • igt@kms_hdr@invalid-hdr:
> 
>       □ shard-bmg: PASS -> SKIP (Intel XE#1503)
>   • igt@kms_joiner@invalid-modeset-big-joiner:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6901)
>   • igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6900 / Intel XE#7362)
>   • igt@kms_pm_backlight@brightness-with-dpms:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2938 / Intel XE#7376 / Intel XE#
>         7760)
>   • igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#2893 / Intel XE#4608 / Intel XE#
>         7304)
>   • igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#4608)
>   • igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#4608 / Intel XE#7304)
>   • igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1489) +1 other test skip
>   • igt@kms_psr@fbc-psr2-suspend:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#7345)
>   • igt@kms_psr@fbc-psr2-suspend@edp-1:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4609)
>   • igt@kms_psr@pr-sprite-plane-move:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +1 other test skip
>   • igt@kms_psr@psr-dpms:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +1 other test
>         skip
>   • igt@kms_psr@psr2-primary-render:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2234)
>   • igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#3904 / Intel XE#7342)
>   • igt@kms_sharpness_filter@invalid-filter-with-plane:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6503)
>   • igt@kms_vrr@seamless-rr-switch-virtual:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1499)
>   • igt@xe_compute_preempt@compute-preempt-many-vram:
> 
>       □ shard-bmg: PASS -> ABORT (Intel XE#7893 / Intel XE#8300) +1 other test
>         abort
>   • igt@xe_evict@evict-cm-threads-small-multi-vm:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6540 / Intel XE#688) +1 other test
>         skip
>   • igt@xe_evict@evict-mixed-many-threads-small:
> 
>       □ shard-bmg: PASS -> INCOMPLETE (Intel XE#6321 / Intel XE#8355)
>   • igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7482) +1 other test skip
>   • igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2322 / Intel XE#7372) +1 other test
>         skip
>   • igt@xe_exec_fault_mode@twice-multi-queue-userptr:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#8374) +1 other test skip
>   • igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#8374) +1 other test skip
>   • igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#8364) +4 other tests skip
>   • igt@xe_exec_multi_queue@one-queue-priority-smem:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#8364) +7 other tests skip
>   • igt@xe_exec_reset@cm-multi-queue-cat-error:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#8369) +1 other test skip
>   • igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#8369)
>   • igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6196)
>   • igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate-race:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#8378)
>   • igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#8378) +1 other test skip
>   • igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
> 
>       □ shard-bmg: PASS -> ABORT (Intel XE#8007)
>   • igt@xe_mmap@small-bar:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#586 / Intel XE#7323 / Intel XE#7384
>         )
>   • igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#6964)
>   • igt@xe_page_reclaim@basic-mixed:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#7793)
>   • igt@xe_page_reclaim@binds-full-pd:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7793)
>   • igt@xe_pat@pat-index-xehpc:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1420 / Intel XE#7590)
>   • igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#7370)
>   • igt@xe_pxp@pxp-termination-key-update-post-suspend:
> 
>       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4733 / Intel XE#7417) +1 other test
>         skip
>   • igt@xe_survivability@runtime-survivability:
> 
>       □ shard-lnl: NOTRUN -> SKIP (Intel XE#8415)
> 
> Possible fixes
> 
>   • igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:
>       □ shard-bmg: ABORT (Intel XE#8007) -> PASS
> 
> Warnings
> 
>   • igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       □ shard-lnl: FAIL (Intel XE#301) -> FAIL (Intel XE#301 / Intel XE#3149)
>   • igt@xe_wedged@wedged-at-any-timeout:
> 
>       □ shard-bmg: DMESG-WARN (Intel XE#5545) -> ABORT (Intel XE#8007)
> 
> Build changes
> 
>   • Linux: xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004 -> xe-pw-170932v1
> 
> IGT_9020: 9020
> xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004:
> 447a47cf86f97a1f5362d0675d65d129be27b004
> xe-pw-170932v1: 170932v1
> 
