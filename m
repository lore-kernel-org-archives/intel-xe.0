Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443ED606A31B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 00:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ehz7ESyk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000D910E997;
	Fri,  6 Nov 2026 00:01:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863E210E2C3
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 00:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793923267; x=1825459267;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VsRgqKzKghr2Ajdzq6LGnDvRizLsUd5jviKiaYdo4IE=;
 b=Ehz7ESykBMG1nB4c5mBeUsDENDxJEC2uh8CPVsps38f6d9ixfR81oafD
 qafYjCYLwGUMHCr7SF3uZeU58Uk2QvjUF3D7Y1EpQkqHyjOt2v6s6LI7T
 xzdjKDPcz+63y88u3FW/T2EVHdqziqyAMgCk9SrwmmXGdR5Is0iUyHeqb
 PuU6pmpldz9dBfOBJYdCdoSWhtRJRK50irVVxtULKo4vrU5WkyQhTVvRU
 8zHXB7+DcupHAYULKeqcQQNrh/QEARRMI0ReMLxoH+K9tsytSz/30StCK
 Y17C888OcTG8QLa2ewVS/ocghlTOooeAoXxK+kJpMVhPli9Tg+V/X15l7 w==;
X-CSE-ConnectionGUID: cY01sgx3Tkiv9LWbpqPowA==
X-CSE-MsgGUID: ltkLaXqOTyKPriRZ83qDCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2771665"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2771665"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 16:01:06 -0800
X-CSE-ConnectionGUID: sB7aqmilTveDFkMvVShChw==
X-CSE-MsgGUID: 5l+5ARlKSc+k5PjNa7aj+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8897304"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 16:01:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 16:01:05 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 16:01:05 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 16:01:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSYDZcqJ7b6OgRYPVrjPnJnDY4x3M7PGKRqOkEdOb6DW9iCmmiwTZ7+XCqoTxtqR3sgJ28V+60VfN2qRnFzhIOYk3NjaT6DKzN7JeCWKxLjb5MoTINMm7sIKxuvx/wG8csXc8QGFcJwToEML/2vC/gIl9JaePOca3Slpiqi7A0RceeF7ZBsdyQzTgacFPJoH81C+UGleZ6i6Ji5BtZk8Bo5Sar76hfOqeY9OTtTgc/xS7J9Rb+FFpjg9lY2Q5X7WN/A83JEVliP5MFhtOtH78mzW9RpIbGi/gRCQsGdUUtkYlXiusTs/Cy6qbaehHb1RQBLO4Fs9dsiBk06kEAkqbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVpqDnjQI7xjiUqs18yKch8bkqK3RfZCqisRUbGXeQ8=;
 b=vANITsetHShFzEI2WRoGOGBWwHd4Cf1Bu/9h0SaipL77rNVvWIRTMq4E21dVe4j/O0bjAvVvUyK42OHEdn1ZOGxdIjMyL6gZ43RYzzZRiYbFrEBR3nw3uDfSm5ankcfpHphQJpmMJR8a9//QUKMA+Ps1PSO6kFzukyiKxEmLN5qn8BqIsbnyiRyRTPab38bigfZJKaOg7zgbGEV09IXjoT1hRESLd/oflHCr/niWKQ0oywErTWyB8VJYp28IUuT77RpIqcDbu/t0rLnD4sjQMRYBdyqgq3Nn27Ob/uvgCRMJgZreCbRruT7zn8FLt9lV6saDWHkR4hB5aREcSES9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DS7PR11MB7931.namprd11.prod.outlook.com (2603:10b6:8:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 00:01:02 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 00:01:01 +0000
Date: Thu, 5 Nov 2026 16:00:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Daniel Charles <daniel.charles@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_drm=2Fxe=3A_Fi?= =?utf-8?Q?x?= tile workaround resume
 handling and enable Wa_14028586678
Message-ID: <20261106000055.GJ6078@mdroper-desk1>
References: <20261103021418.654723-1-daniel.charles@intel.com>
 <179369697840.109284.413264902786386168@221881a7231d>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <179369697840.109284.413264902786386168@221881a7231d>
X-ClientProxiedBy: BY3PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::25) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DS7PR11MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efeb3c4-09cd-4482-b353-08df3b9908dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|18002099003|22082099003|261021121427099003|4143699003|261009221727099003|11063799006|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026135527099003|261026140227099003|261026130827099003|261021135927099003|261009223027099003|261009221227099003|261009223327099003|56012099006|261102123227099003|261021130227099003|261022113327099003|261021133027099003|261009220027099003|261021123027099003|260925022911599003|260925021911599003|261022115727099003|260925021311599003;
X-Microsoft-Antispam-Message-Info: YNNupCyjI4jpcuntlB56mkhXQIib+NRrZiH5Ilf4EOBB4IPjPFjQp2DKepI8gHanOE0MNwgzD954+LcGN31nUArH1InM3hmmmMlsWihgR7S8vI/R60/GMKdeK+eHDnxZRnyJQ9ntDuEGtzjrlgabn8rHmpziqR3Ze9Ms8PGnPjdRqMGrFdc4V1qq/QlbxMOKyLJRWmJm0Z0/PFdenuycIoH/bYOpI1GQIpASb5pfekoYjytIw1Zk7Ie5uwGMx/q+AoVMDmnYB1IBX153RK12DZ0VGuGeRtXz8mBLOHFHCAazdZAcOim1KlNJzYs73PW75OXfMYpxpQmQJydMFmWlsBLh0sk4QMDYTpT3r8BjbuY7XhFWZIrSIDme8GBKht2AY852ZvbOaep88khiX/ANYFz3gwbN2P5/cVDrugBPnVN+PTCtXbETVrRGxUMcVsNxiZ15T8QvZXlCdiJdpRAC25c2nX8AqmAd0MJAbVsgvBw4ZmbaWVu6pZPfN4zG1WXXWZ9wTS+293G2K7QcJp0fGj1lKt+rvevs/ZY3l4tl5t07NW005Kga3l21bDGRiAyYL9/mo2r4nxkKGbxhV4R0asVfaWUOy36JjGqKMwT8FJA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(18002099003)(22082099003)(261021121427099003)(4143699003)(261009221727099003)(11063799006)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026135527099003)(261026140227099003)(261026130827099003)(261021135927099003)(261009223027099003)(261009221227099003)(261009223327099003)(56012099006)(261102123227099003)(261021130227099003)(261022113327099003)(261021133027099003)(261009220027099003)(261021123027099003)(260925022911599003)(260925021911599003)(261022115727099003)(260925021311599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0zqCejd4KiryUvMHxVDqnHE6xUWE/FoJryV27y49S3zbXHyTexEZvevBdlfu?=
 =?us-ascii?Q?dsjKKDO3NpRjBTd+xAPhnwbtVRV8O3asb9BQN7j8D4bc0GcFzj35EekY3r7t?=
 =?us-ascii?Q?bBqsNgMDn3undw7X7erKg+kY+2IDh6z6yUsXTE7XpDp/js5JGN/S6vjEcnjR?=
 =?us-ascii?Q?pBpa/JjVjCpN75XNK1KoVBe+OaeI+U3s/Uux8XdeNVZBQf/JptFTEoU4dUbc?=
 =?us-ascii?Q?Mw5diquOlKX3qVTZQrpgYXPDMVrPvsIc6np7O9ulFdqxuGy3lkBLDvh/KU3p?=
 =?us-ascii?Q?KSCynC11U0ux8dBm7N9bQ5jmkhXtUqF0wiePXC9VwzqSZyWp7WSziRVynbma?=
 =?us-ascii?Q?H7DShLvzYq1Aa/7NLB4A9ir11Nf48Bs3vpFebrx4jNYqGci1RSec0EP3RtlI?=
 =?us-ascii?Q?yeg+JBA0dqsWUszplTdEFYShw2RkraEekr5mHvvdwqGk4cP7swpbCE1Wy/n9?=
 =?us-ascii?Q?UCy1wDOXbPKXEcrQ6Ne6PF5uYL5kMgMrG2G+DqLCJ5ypjtV56jbgODNzpzaX?=
 =?us-ascii?Q?Iy7dWs5cDH+13ETBzsOY7XWKwEkUBEyJbD6+1dWkklruIU+Q82wF8YH74pA8?=
 =?us-ascii?Q?jdpXF+Vkbh5zUmg9JsS0qAboDp/rIn8mc2xu/PgxaVj4sS0X6S8Ac03cO3C+?=
 =?us-ascii?Q?hUzmg+T4N3awZczYzmd4bg7lGMPDMrmNc9FBR3O2JH0D5+SehxFtQP9hq1uT?=
 =?us-ascii?Q?KX7M8rBvBiK/cOC8nAh7v2iWJVyzP33XIeEf0soMUmWP63u+hfCp19APCBT2?=
 =?us-ascii?Q?8jY03LCimURk1OgxtDz6+oogr9kF9kSRal/PUjsk0ZqFw9FDf36YoOu29WlT?=
 =?us-ascii?Q?2miuPrvnIaCRf70rkEC4D4FQZYtRneWqutNj0z11KU0COks2UjDzcUKUyjQt?=
 =?us-ascii?Q?FcrtwWuhAu66cnOkH9sSioIYvVIpC7QFKrgX4CG7+VQHsOJ332mK96fa3g94?=
 =?us-ascii?Q?hugXdUIYm4euDk5XsRSm05rPDMszUvLjSDyZ5LmG994hqRDt2VhbahHKb7j1?=
 =?us-ascii?Q?1fPdutZegwU1zWVdpn0LiFJVVZRP6aP16bOlYel00ntz7bzLYISe5lpKbvP+?=
 =?us-ascii?Q?9P8+r+q86cJjRPKdWlS8Gsz4SyCIPLnbGqHKunKbJeAs6DXpUb0K+cEi1V29?=
 =?us-ascii?Q?ZngNf3IeukeG1igX4GZ7zwUpab/pHMjUONjUMkv+d1YlPNDuywHCp17aA/fM?=
 =?us-ascii?Q?cWHySQAdevsfR0jblyHRToXnwt+L+HVTffhXyGTz2bJWoj8/uQck4GnwbRfc?=
 =?us-ascii?Q?H8lsXQNW/AdePZNl1GstU4BmkJELQ6AUjM+DP6CQVv7DPz2uKTN1Szvx6BdB?=
 =?us-ascii?Q?Zanw5ALhLwGzfLDb+noA7YJeM0egesJ6mMJxBrRNo6zRdn+18iK64RBLAPJh?=
 =?us-ascii?Q?yi9vYTOR2+/U+VLcsITkvmFOJELt+nKtYQJxGgwwuOA9jmwCOaBwgL0AgMmL?=
 =?us-ascii?Q?wS8cqIE2u5F9RZe9/G/g01o1Q7u+sZ79WFvqeUSlksKv2CD11ZCEyEZjVWwz?=
 =?us-ascii?Q?Bq/OjhmPab1oTxxiLBiygbVwYVXYlfJu47ayp97clAjsD5+Hu8tV6khTHsG2?=
 =?us-ascii?Q?krznCpvJ2JkUi30iwv96IbMXzBWWO4fsNA0xY5DGLE2IEhPNuWIs1ZwGFZqL?=
 =?us-ascii?Q?o8ZBoDC87sE6t2KaFH9T1eZVzybPanvSWA6Th6T2FQsLlZu6bt3+zrP5GENV?=
 =?us-ascii?Q?30Zq1q5UhhGv45UYrIsEG7XhtsdcVmXxhLo43fcnW1GLqZ30UPWXdqTe+7H2?=
 =?us-ascii?Q?HGlPmtS9FIOfZUaaUUWkXkU281usWuA=3D?=
X-Exchange-RoutingPolicyChecked: XVcG70xMJXkld6Dlghp/SQ6F1w2Sx823NLsn9QSiPZ9eKk3AFfvot2rabFD0RUHTE9ymzsjA5/nVvNzYbW/NVcLfjifOboNwE0wbsoHzVBIKNd8zTBcn5rSpboVsDDvvWxRpFSCZ84+Ox7gg/BsRH7Twv9B5krhhxoNj63A8qYj1HhaaKgqLF5wqv+z1b1ptgU9mzuN1QquAQ9DgXcVO0DOsya4e/3bwmkpnR/qXdThFV3WgIGiDUfYFafVFs9vBuGIR5s1XJOfv4acR3LQES9IMO/tbVnEpPLytZjZtSqSr+XHEXvrqYZEfIAHQWVBeOtjkNgc1wpzJ+J93HzAVGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efeb3c4-09cd-4482-b353-08df3b9908dd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 00:01:01.2237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgypQtGecKHOJ8E8gPlLbCeOA6q+N6GVKuVvml0sumw/arQPiMJRFwZb/hZs3U7hwa/uI5s0ETzHt26ElpNbTPdcIG727tSL9ULyqXX0H/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7931
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 09:09:38AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Fix tile workaround resume handling and enable Wa_14028586678
> URL   : https://patchwork.freedesktop.org/series/177530/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779_FULL -> xe-pw-177530v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks for the patches!


Matt

>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-177530v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>     - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
>     - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#8365])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#2887]) +2 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#5822]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2652]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5824])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#373])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#2252]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_sharpness_filter@filter-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#6507] / [Intel XE#7358])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_chamelium_sharpness_filter@filter-basic.html
> 
>   * igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#6969]) +7 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#3304] / [Intel XE#7374])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-6/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2390] / [Intel XE#6974])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5845])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1424])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#5900])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
>     - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#9539])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-4/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
> 
>   * igt@kms_dsc@dsc-basic-ultrajoiner:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#8265])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_dsc@dsc-basic-ultrajoiner.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1421])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#3098] / [Intel XE#3149]) +1 other test fail
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-4/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-5/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#7178] / [Intel XE#7349])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#7178]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#352])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_force_connector_basic@force-connector-state.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2311]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4141])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#5812]) +9 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#5800] / [Intel XE#6312])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#6312])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7905]) +4 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#7061])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-pri-indfb-multidraw:
>     - shard-bmg:          [PASS][47] -> [INCOMPLETE][48] ([Intel XE#6819] / [Intel XE#9259])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-pri-indfb-multidraw.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7061]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2313])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
>     - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#7865]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7865])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7061])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html
> 
>   * igt@kms_mst@mst-suspend-read-crc:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#8348])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_mst@mst-suspend-read-crc.html
> 
>   * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#8303]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#7283])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#7304]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#4608])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#4608] / [Intel XE#7304])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#1489])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1128] / [Intel XE#7413])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@xe_evict@evict-mixed-threads-small-multi-vm:
>     - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#5764])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-4/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#6540] / [Intel XE#688])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7482]) +2 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1392])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-null:
>     - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#5575] / [Intel XE#7484]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@xe_exec_basic@multigpu-once-null.html
> 
>   * igt@xe_exec_fault_mode@atomic-many:
>     - shard-bmg:          [PASS][68] -> [FAIL][69] ([Intel XE#8578])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-10/igt@xe_exec_fault_mode@atomic-many.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#8374]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#8374]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-prefetch:
>     - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#8374])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@xe_exec_fault_mode@once-multi-queue-userptr-prefetch.html
> 
>   * igt@xe_exec_multi_queue@many-queues-close-fd:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#8364]) +2 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-close-fd.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#8364]) +7 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr:
>     - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#8364]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr.html
> 
>   * igt@xe_exec_system_allocator@many-stride-mmap-new-nomemset:
>     - shard-bmg:          [PASS][76] -> [INCOMPLETE][77] ([Intel XE#2594] / [Intel XE#8159])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-mmap-new-nomemset.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-mmap-new-nomemset.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#8378]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_pm@d3hot-i2c:
>     - shard-ptl:          NOTRUN -> [SKIP][80] ([Intel XE#5742] / [Intel XE#7400])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@xe_pm@d3hot-i2c.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-ptl:          [PASS][81] -> [ABORT][82] ([Intel XE#9362])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-3/igt@xe_pm@s4-mocs.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-8/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-lnl:          [PASS][83] -> [DMESG-WARN][84] ([Intel XE#7727])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt1:
>     - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#9254]) +1 other test fail
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-10/igt@xe_pm_residency@gt-c6-freeze@gt1.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html
> 
>   * igt@xe_query@multigpu-query-pxp-status:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#944])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@xe_query@multigpu-query-pxp-status.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#944])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_sriov_auto_provisioning@exclusive-ranges:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#4130] / [Intel XE#7366])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-ptl:          [FAIL][90] ([Intel XE#8628]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [INCOMPLETE][92] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][93] +1 other test pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
>     - shard-ptl:          [DMESG-WARN][94] ([Intel XE#9391]) -> [PASS][95] +1 other test pass
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][96] ([Intel XE#1503]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>     - shard-ptl:          [FAIL][98] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][99] +1 other test pass
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [FAIL][100] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][101] +1 other test pass
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-5/igt@kms_vrr@flipline.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@kms_vrr@flipline.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-ptl:          [ABORT][102] ([Intel XE#9362]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-3/igt@xe_pm@s4-exec-after.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-ptl-6/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [ABORT][104] ([Intel XE#9362]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [FAIL][106] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][107] ([Intel XE#2426] / [Intel XE#5848])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>   [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
>   [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
>   [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
>   [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
>   [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
>   [Intel XE#5845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5845
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
>   [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
>   [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
>   [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
>   [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
>   [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
>   [Intel XE#8628]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628
>   [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
>   [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
>   [Intel XE#9259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9259
>   [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
>   [Intel XE#9391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9391
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#9539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9539
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779 -> xe-pw-177530v1
> 
>   IGT_9175: 9175
>   xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779: 0f5e7199aaceed05aa49dad4c97df2677e32f779
>   xe-pw-177530v1: 177530v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177530v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
