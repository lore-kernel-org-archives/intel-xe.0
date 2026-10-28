Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756D0606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 23:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FW6RRKij
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A61610E71F;
	Wed, 28 Oct 2026 23:59:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C7F10E71F
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 23:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793231972; x=1824767972;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vTjBmMzX7aRjdblbn3bBS14tHeKnqGGIh9CUdQiS0iA=;
 b=FW6RRKijekFwV5og9Xw8BFc6AncikfHKisMlmG3fWEqJD8v2dRhgxHf3
 TRaEMdte50OgEbXBrulbihJdapxqIYmL0zXSE/vUgwuIrXx3Ug3rsIGvU
 l1UY/MZ2+qwUcR6KTFno4u5/Jn9iRI//FIRU1Z5jiFxqBSMrT9wETDhK3
 QajBS09/TG+0mz+puOv2HuPaukF5nVt4ExPetNWyY+L8UOeywKOS8zgl6
 K37DNNU7E6EI5Hg1E7NeTbq7obTbukyoiw68nziGQF5LYKHzsStKto1TF
 Ctf+rmtaHD5OxC6Qk87Hpxlpf2TzCHmuOBkYbUZUjroeiZjOaiyMXqhuZ w==;
X-CSE-ConnectionGUID: hZ0f0A76TqC6h9pJlOifOw==
X-CSE-MsgGUID: 8c0aX8jlSyGcZRa33PWRcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1862659"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1862659"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 16:59:32 -0700
X-CSE-ConnectionGUID: NYL9RGd6SDCQK+bUb9RB1w==
X-CSE-MsgGUID: 6yLR8oTpRlChmRVuNBHZYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5501054"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 16:59:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 16:59:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 16:59:29 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 16:59:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/KZLwzBtpfzx1rgELtBv4MDq6kJzQ9OEzhOSR4E0V4XMbkKqEmM9HtNnFiQyvJGuo41cg79awDP/0N+s5NxCZbfgvg/BX1f1u4QWkUPlwfMnr1KdqDA4Iavxv9HQWyE7MDcFVqTpZx9Ax7w5ZTEb6zXZiaEsWZO9Ghqy/IrDYMWNLbwdGN94aKWE4bEcZhex8/TX1vtsH3/IkZm3wB5HBnE7MZyC/588BpT+pM7CMmPbAOznMTRmzbHEjJRjJa99cr/fLZKhEp+kgH+7m7xvOpGefdMHNVjsL9C+yhvKRpfQAAe7CqomdtfOsmaouhIthf6J+AyxFqG8ftECGyXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14KwXOU0MtKsHyp9i2OCiRW/DoSp23TonA7bM24d8SI=;
 b=itRlqdhWpPf993cKKwIKZWRXKk1fWVvdxaGQrA1D7LpR9kC8I9S/3BkE5tmxvmK5zUmyym5B2IAIN76otk0zt5IwH44GdFqYtkxQvTazTY+eZs8HCQphawNvKiOilqbIjcaU54sklPKiVF0Au7CBGo4SOdhmozJ/jozdLNRfYQ4q/di3vIAYnq+e3iO4NwqaUvJC4gg4KmniBXAWDGoOvjr6T9ZWtfuiD7SbroX0LEr3M0DSZp4XSjnYXad1Zwb30FQ30OSt9yb7oIOcQRYcs7Zd1NHSXclm4gIwYKaCQqcWnFGpeRgZVmlmoA/AOp7bZb0/fKisAoUlkBRxAb9PVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 23:59:26 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 23:59:26 +0000
Message-ID: <1ff9337a-5db1-424b-8714-7f92cf6f5d94@intel.com>
Date: Thu, 29 Oct 2026 00:59:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drm/xe/ggtt: Split GGTT into usable and shareable
 pools
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
References: <20261021085716.709503-1-piotr.piorkowski@intel.com>
 <20261021085716.709503-4-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20261021085716.709503-4-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0051.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::40) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SA3PR11MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d5526a1-a772-47a2-2f1f-08df354f7f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|22082099003|18002099003|261028144727099003|56012099006|11063799006|4143699003|261026140227099003|261022105027099003|261022075727099003|261026121527099003|10067099003|261021121427099003|261021123027099003|261021130227099003|261022115727099003|261021135927099003|261009223027099003|261022113327099003|261026130827099003;
X-Microsoft-Antispam-Message-Info: Jg4Ox1ERUyrYEi/Ku2MmoFuYK+sENU6ZNXVwOBAbwoTddmDcLCj0uVKOMpn5muH1EL6yrNn0fLOzArCfUjupaurQCXT0u/r8Yri9LaDt0IZ0Wks++lxjNByVsyrKFdbuOv0T04lBNMiC082RbtD5FlRW4bcbVKh1QfPHf425t6Kp9xqLIk+ytOHcNFxu28If3zOOOHBTyUyHvEyZoEXaaJE9cGXItzFAksnYFjojlC/9LEnCgEOv2/cHSkGLefGHRGxAJBkKg91FQr+QOxGVFjo+UxmLC9BkcanI2y3WjVulvbthXW7M3Y0/azT83/PkObORilA+GfB/VsaJphypsF/d7dLlZjDA4eU0TPnlCwn+O3eQxY9zCeZYYG9qyDCPOHSXVNxJoTsAZiN74HBnJwO4i09s/2vPfBrAbljRNFCjNRHduVciDNs2PFTtGq/Ai4tnIiCuPpH4tYLprPUJ+paeVvfWh0cnV34rdp7EnD6MDwKHSRZYStbyrd2SONMbbm2b+orVvVg26cKuygyQ9LiBC99uvdPaK8eOEmHYuyU6CrekGXlqO7+EfCZYvj48UpbR1IThwQxikJH1uf3t8eQjIT32IpO6e2hiIB9rOqUjCAzd0VqOv2A/hDiodmolhZgHqAH8i88n/1qzt0dryijVB1O4k6m+j8LrQ/RUT2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(261028144727099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261022105027099003)(261022075727099003)(261026121527099003)(10067099003)(261021121427099003)(261021123027099003)(261021130227099003)(261022115727099003)(261021135927099003)(261009223027099003)(261022113327099003)(261026130827099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNhU1ErSi9QVFo0TUFmSHM1ci9kRmt6T0ZKOFNtZVZ4LytuNUE1NkpieU4r?=
 =?utf-8?B?VS9FZHozKzdQS2NpbVpxM2czSFJNUytPeTFaaWREU2hLMUZzdUMzYXhMNnZp?=
 =?utf-8?B?ZkZ1S29nWDJqSy9BUU5GeTBkbUw5eCs2aC9jS3lRYWtHVFBSOXdHcHJkQlRH?=
 =?utf-8?B?bGZxVFJpT29EZzFqR2FPL09xNHpSdTA3T3cxY2dubVZDYVFsdmNnMWFJMkVt?=
 =?utf-8?B?UlJLNTBhNFJjQmNOODVEVkw5QXlpM2NjL0d0YXJLOHN2OGVqZ0ZwQ3plRjY1?=
 =?utf-8?B?bERTUzBTb0Q1d2VNREtFNGxFMWZ1SERmencwZlpvOS9NZXdoanVqbnhuTzJZ?=
 =?utf-8?B?bUVMMlNiYmJQdldwQVhjeWFGQWtsbU9TS2RjdWUxU25rb3poMEtVSmtaRkJV?=
 =?utf-8?B?YzlPYVhJb2ZWR0N0enBaWXVvVjlxVUgvOW83VS9pSkJReGtRNlY1Z01Gemhv?=
 =?utf-8?B?NCs3Z3VTNVdrK21iRFdzOEpPOXNqNUc0ZjZhSkZMWTlhRVRDSEdQZDhYMlNi?=
 =?utf-8?B?bGRETFN2NGVkUnQwd0ZEbG9XY2c1VE8rY2lxY1ZDMnZtUWI1QmdRdnBtMngz?=
 =?utf-8?B?Q3F1MzJjVGZGaUdMTSt5MUxuWnlBWkdqc1pZVWRxUVhZRVdLdlVCSjR2QnVC?=
 =?utf-8?B?KzY4bDdCZVNuNXpaWEVxVmVEYzlXVHlVd2pLTEFLcHFmaHNPcTBUcy84aUdY?=
 =?utf-8?B?Nml5SExybFZxWENyeTlGNGxWbkxJM0VzbTh3MHh6MVJCcUU4SEw2d21YMlly?=
 =?utf-8?B?ZzdUa2FJRHQ1VTV5elBueXRqNWhXbXY2TThiWGJ0UXhpc2d1MEh1ZlA3L2Ra?=
 =?utf-8?B?MWJTVXViLzFaRmlrUzZNRHg1RGhEQWtIVS8wWHNiVk5qZmwvMllmQlFQWWcv?=
 =?utf-8?B?UUthSks2VURGZ01sSlpvUzBYaDhieElmRGFUZW9IYm1TU1B4OStodXZDdTVw?=
 =?utf-8?B?aWUrczBML2hDVWtpRVhad0hEcUduODR3cDlJTCtlcXdOdlBlc3dIMXBKS3Nz?=
 =?utf-8?B?RDdTSTdlaXpxcEtQdExuMWptczQ2Wml3T2pDWFdHb3ZZMUdYS3crdWM2QzVm?=
 =?utf-8?B?UmZLMG5SVmZwc2h2a2E4NUlyUVptLzRmUnFEN3Arc3MxWGRoR0VNdFF0aDlq?=
 =?utf-8?B?UGNFS3dySkZiZXdzQTlOcjcyZlF2UzVVL051OHcyaWQ1c0Znbm00eTU3c3V6?=
 =?utf-8?B?a0c0M21MYThWQUJoUE9qNkdDcUdLcW8vdmhmR0YyVkJmdVkxWFN3ZjF6M2xI?=
 =?utf-8?B?Q0JYL2pQVTJTU0JocGQrVGs5VUtuc3RISW1NWS9takRIdzJEUDFtUmpSUkh5?=
 =?utf-8?B?azlyYm5vWUM5dlRaT0RZczdiakpDSVk4cHZqMWp6RHJNM3hUMzB4TlVNS2hH?=
 =?utf-8?B?ZjFpSmV0TU1WUUMwMTZsc2NaTWt4SkgrNHB0MXpURmt4U0Z2dFhWalhSSWVa?=
 =?utf-8?B?VDVPYkRyYUhwdVBKQWpiSHdtRVRTRm9qUUgyd0NLTCtpbCtBNG1wMmd2U1lt?=
 =?utf-8?B?WENUZXJjajA3K1Y3YU5XeFRob0FBMjdldml3eDJhZjBodXc1YzFVWkVJSy90?=
 =?utf-8?B?VXFyejBTK2hjZDVRUGlEd1JudUlNejc1T1ZVcUxlK2F5TytmZG1YOWdaQlRR?=
 =?utf-8?B?QkRuT2VuMThIYkFHTytCaXFZeURIMk42RzVGSXFZVTlRcGJxdUlxUDhDb3dQ?=
 =?utf-8?B?UVdsNVRQVllYNFFndmFYc2g3WlRZNUd1Vi9nWWl3OG5FdVdMMUZ5WlBIdmM2?=
 =?utf-8?B?NjdQRE1scHRjZ210U3hFbzJaTTlZSkkrZkNNMmczMVNia2Q0SDV1YzJCZ3FX?=
 =?utf-8?B?R0VnajBIYkRwNEJkdE03V3ZsMWdHUDhHQU43THFNUyt4VlhOOVB6SWplU01S?=
 =?utf-8?B?MkF0bmdaVjNHaktuZnlldVNOZzRzd0tSUkdkcHBUT25PSlNKeU95UzRIcUdo?=
 =?utf-8?B?WXlYYWk5VFhlRTUrN2ZaRHdYR3o5dTJ6bGRrMTBMYUpQQU9zVnlRdEY2Y05x?=
 =?utf-8?B?VzMvQXVrTG1EZUp5eHZtR3BJUkh3VHBBU0xSNlFocWpuSnBaeHN4MlBhWTRm?=
 =?utf-8?B?dytBZlJQWUlRNVRiQ014eHBqcjBCdytEWTNiUS9IUWRuNTcvdm1mMFVSL2tj?=
 =?utf-8?B?aDJXenhKTmlpOHJ3TlZ1WFNDN3pkdFJUUEJIVEFMdGpQSWZob1A3ZktUY0dI?=
 =?utf-8?B?aklIQXN2QlI2UWptd3lBY09tZ1NnNFFjczQzL3pPMjBVQnpGUUh5OEgraXV0?=
 =?utf-8?B?MTZjMmFCNXhXYi9sR1RDQTRuODJ2ZG85cFk5ZDZRenNCbmdaNkpKa1E5eFI2?=
 =?utf-8?B?ay91U3ZRTHJCMHVrN0FPUmlBMHRtQWlHa3hXWjFEaHFqRnprMGJpUT09?=
X-Exchange-RoutingPolicyChecked: PwN+MvWNXkjc0cWPZ3akZHzDa2In8H5A4PHwav5isaKFc8+d/eDLpJxTe66kOs7EcR5b1FHNmoWWcYl0Ueqcw+zcbkaalvHwSKWbiOf/RpceicUKDgRuksXvVnmnRK9cajC4kZs5lTuzHftOJVuS+1YWRKJV9Qr1tOShweTBDBlU/23ZtNOzMOF5/H7yxxfYgDf7FAxgqP84yrP2iqbm2Yik0f43yTg9qV0FqsnjuPLCzTfKjsIiuK4hpjpsXCSCMVGv1gKhHYLfnnENHHIUDd9txlNddQhVbrKk+rSPmAqXobYMjje9IEZmaFsHaRhj0vAmPu6aFEHRcsoStL9G/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d5526a1-a772-47a2-2f1f-08df354f7f67
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 23:59:26.7488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZqPv4AJfh8haJ+EUlLFHuX6KVE1h1H5F74uuwxju7N4+AoDodfB/RRqqXXJDs7mPVUmyeoKrCRraQvscTVChQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 2026-10-21 10:57, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Driver-owned GGTT allocations and VF provisioning currently use a single
> GGTT pool. Split it into a usable pool for driver-owned allocations and a
> shareable pool for VF provisioning.
>
> The pools are separate logical ranges and may overlap, but allocations are
> limited to the configured size of their corresponding pool. Allocate from
> the bottom of the usable pool and from the top of the shareable pool when a
> shareable pool is present.
>
> Add separate insertion APIs for the usable and shareable pools.
>
> v2:
>   - Rename ggtt->usable_size back to ggtt->size.
>   - Remove the ggtt_insert_node_in_range() helper.
> v3:
>   - Introduce the full_size struct field instead of the ggtt_accessible_size
>     function.
> v4:
>   - Set the shareable pool size only for SR-IOV PF,
>   - Return -ENOSPC instead of asserting when a large BO no longer fits after
>     end is clamped to ggtt->size.
> v5:
>   - Move range initializer rename and full_size parameter here.
>   - Use shareable_size and compute the shareable start on demand.
>   - Constrain regular allocations to the usable pool.
> v6:
>   - Rename ggtt_shareable_start() to ggtt_shareable_offset(), as it returns
>     an offset within the GGTT range, not a GGTT address. (Tomasz)
>   - Explain why the pool sizes are checked separately. (Tomasz)
>   - Drop the guard() conversion in __xe_ggtt_insert_bo_at(), so the GGTT
>     lock is again released before the invalidation. (Tomasz)
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 157 ++++++++++++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_ggtt.h |   4 +
>   2 files changed, 141 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 533c60446aebe..ad4180400a8bd 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -145,8 +145,19 @@ struct xe_ggtt {
>   	unsigned int access_count;
>   	/** @wq: Dedicated unordered work queue to process node removals */
>   	struct workqueue_struct *wq;
> +#ifdef CONFIG_PCI_IOV
> +	/** @shareable_size: Size of the GGTT range reserved for sharing with VFs */
> +	u64 shareable_size;
> +#endif
>   };
>   
> +#ifdef CONFIG_PCI_IOV
> +static inline u64 ggtt_shareable_offset(struct xe_ggtt *ggtt)
> +{
> +	return ggtt->full_size - ggtt->shareable_size;
> +}
> +#endif
> +
>   static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
>   {
>   	u64 pte = XE_PAGE_PRESENT;
> @@ -360,17 +371,35 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>   	.ggtt_get_pte = xe_ggtt_get_pte,
>   };
>   
> -static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
> +static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
> +			     u64 usable_size, u64 shareable_size)
>   {
> +	struct xe_gt *gt = ggtt->tile->primary_gt;
> +
> +	xe_gt_assert(gt, full_size);
> +	xe_gt_assert(gt, usable_size);
> +	/*
> +	 * The usable and shareable pools are separate logical ranges within the
> +	 * full range and may overlap, so each is checked against the full size
> +	 * on its own. drm_mm keeps the allocations from both pools apart.
> +	 */
> +	xe_gt_assert(gt, usable_size <= full_size);
> +	xe_gt_assert(gt, shareable_size <= full_size);
> +
>   	ggtt->start = start;
> -	ggtt->full_size = size;
> -	ggtt->size = size;
> -	drm_mm_init(&ggtt->mm, 0, size);
> +	ggtt->full_size = full_size;
> +	ggtt->size = usable_size;
> +
> +#ifdef CONFIG_PCI_IOV
> +	if (shareable_size)
> +		ggtt->shareable_size = shareable_size;
> +#endif
> +	drm_mm_init(&ggtt->mm, 0, ggtt->full_size);
>   }
>   
>   int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
>   {
> -	__xe_ggtt_init_early(ggtt, start, size);
> +	ggtt_init_ranges(ggtt, start, size, size, 0);
>   	return 0;
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
> @@ -447,7 +476,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>   	if (!ggtt->wq)
>   		return -ENOMEM;
>   
> -	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
> +	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
> +			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
>   
>   	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
>   	if (err)
> @@ -641,6 +671,11 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
>   	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
>   }
>   
> +static inline u64 xe_ggtt_bottom(struct xe_ggtt *ggtt)
> +{
> +	return xe_wopcm_size(tile_to_xe(ggtt->tile));
> +}
> +
>   /**
>    * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
>    * @ggtt: the &xe_ggtt struct instance
> @@ -652,24 +687,63 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
>    * This function may be called multiple times during recovery, but if
>    * @new_start is unchanged from the current base, it's a noop.
>    *
> - * @new_start should be a value between xe_wopcm_size() and #GUC_GGTT_TOP.
> + * @new_start should be a value between the GGTT bottom and #GUC_GGTT_TOP.
>    */
>   void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
>   {
>   	guard(mutex)(&ggtt->lock);
>   
> -	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
> +	xe_tile_assert(ggtt->tile, new_start >= xe_ggtt_bottom(ggtt));
>   	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
> +#ifdef CONFIG_PCI_IOV
> +	xe_tile_assert(ggtt->tile, ggtt->shareable_size == 0);
> +#endif
>   
>   	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
>   	WRITE_ONCE(ggtt->start, new_start);
>   }
>   
> -static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
> -				      u32 size, u32 align, u32 mm_flags)
> +static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
> +					    u32 align, u64 range_start,
> +					    u64 range_size, u32 mm_flags)
>   {
> -	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
> -					  mm_flags);
> +	struct xe_ggtt *ggtt = node->ggtt;
> +	u64 range_end = range_start + range_size;
> +
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	if (!range_size || range_end <= range_start)
> +		return -EINVAL;
> +
> +	if (range_end > ggtt->full_size)
> +		return -ERANGE;
> +
> +	if (size > range_size)
> +		return -ENOSPC;
> +
> +	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
> +					  range_start, range_end, mm_flags);
> +}
> +
> +/*
> + * When the shareable range is present, allocations start from the bottom
> + * to leave space at the top; otherwise they start from the top.
> + */
> +static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
> +{
> +#ifdef CONFIG_PCI_IOV
> +	if (ggtt->shareable_size > 0)
> +		return DRM_MM_INSERT_LOW;
> +#endif
> +	return DRM_MM_INSERT_HIGH;
> +}
> +
> +static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
> +{
> +	struct xe_ggtt *ggtt = node->ggtt;
> +
> +	return ggtt_insert_node_in_range_locked(node, size, align, 0,
> +						ggtt->size, ggtt_usable_insert_flags(ggtt));
>   }
>   
>   static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
> @@ -686,12 +760,12 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
>   }
>   
>   /**
> - * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
> + * xe_ggtt_insert_node() - Insert a &xe_ggtt_node into the GGTT
>    * @ggtt: the &xe_ggtt into which the node should be inserted.
>    * @size: size of the node
>    * @align: alignment constrain of the node
>    *
> - * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
> + * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
>    */
>   struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
>   {
> @@ -703,8 +777,45 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
>   		return node;
>   
>   	guard(mutex)(&ggtt->lock);
> -	ret = xe_ggtt_insert_node_locked(node, size, align,
> -					 DRM_MM_INSERT_HIGH);
> +
> +	ret = xe_ggtt_insert_node_locked(node, size, align);
> +	if (ret) {
> +		ggtt_node_fini(node);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return node;
> +}
> +
> +#ifdef CONFIG_PCI_IOV
> +/**
> + * xe_ggtt_insert_node_shareable() - Insert a new node in the shareable GGTT range
> + * @ggtt: the &xe_ggtt into which the node should be inserted.
> + * @size: size of the node
> + * @align: alignment constrain of the node
> + *
> + * Allocations always start from the top (DRM_MM_INSERT_HIGH).
> + *
> + * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
> + */
> +struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
> +{
> +	struct xe_ggtt_node *node;
> +	int ret;
> +
> +	if (!ggtt->shareable_size)
> +		return ERR_PTR(-ENOSPC);
> +
> +	node = ggtt_node_init(ggtt);
> +	if (IS_ERR(node))
> +		return node;
> +
> +	guard(mutex)(&ggtt->lock);
> +
> +	ret = ggtt_insert_node_in_range_locked(node, size, align,
> +					       ggtt_shareable_offset(ggtt),
> +					       ggtt->shareable_size,
> +					       DRM_MM_INSERT_HIGH);
>   	if (ret) {
>   		ggtt_node_fini(node);
>   		return ERR_PTR(ret);
> @@ -712,6 +823,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
>   
>   	return node;
>   }
> +#endif
>   
>   /**
>    * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
> @@ -795,6 +907,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
>    *
>    * This function allows inserting a GGTT node with a custom transformation function.
>    * This is useful for display to allow inserting rotated framebuffers to GGTT.
> + * Allocates from the usable range only.
>    *
>    * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
>    */
> @@ -815,7 +928,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
>   		goto err;
>   	}
>   
> -	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
> +	ret = xe_ggtt_insert_node_locked(node, size, align);
>   	if (ret)
>   		goto err_unlock;
>   
> @@ -882,10 +995,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>   	else
>   		end = 0;
>   
> -	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
> +	end = min(end, ggtt->size);
>   
> -	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
> -					  xe_bo_size(bo), alignment, 0, start, end, 0);
> +	if (end < start + xe_bo_size(bo))
> +		err = -ENOSPC;
> +	else
> +		err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
> +						  xe_bo_size(bo), alignment, 0, start, end,
> +						  ggtt_usable_insert_flags(ggtt));
>   	if (err) {
>   		ggtt_node_fini(bo->ggtt_node[tile_id]);
>   		bo->ggtt_node[tile_id] = NULL;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index c864cc975a695..59b2f02870195 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -24,6 +24,10 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>   
>   struct xe_ggtt_node *
>   xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
> +#ifdef CONFIG_PCI_IOV
> +struct xe_ggtt_node *
> +xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
> +#endif
>   struct xe_ggtt_node *
>   xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
>   			      struct xe_bo *bo, u64 pte,
