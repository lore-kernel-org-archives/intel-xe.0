Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC07CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 04:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F6110E22F;
	Tue,  4 Nov 2025 04:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QlYsTuzX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437AE10E22F
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 04:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762228931; x=1793764931;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=reX6vXsbH30mPhzFhLlDXsrLXq8Qn+cslNtJfPNslGU=;
 b=QlYsTuzXQ6HGwk3u9GxLc8ucRwYLm9ylgQxD+tmeXV5Ha157VGVanXbf
 G5VR77L39vOVUVLN72pY3pMBE8NwSZi9IWK48VnxXd6u+4H2vVsjB82F3
 Vh39/TQNvovox9z5BTnIxrXPnXAISG5WXioecessS7+J46pT/db4p2inv
 GbcH46POSOiJScUjK90aN+WVxAzem2itGdOBTioGEuYchR27jBawL0dfI
 2qqKRcLphVSQnfmJUZW+679DvAMh5XB17yeMGNqej+49Rt3kedjEHor8j
 ZwWhgbubTBiJ/QPRRz66jJPt2nXvZkvnV0QM6j2wJQqxshLZxrcYYV8W4 w==;
X-CSE-ConnectionGUID: d881adL0QRqjhTjCLRq2fA==
X-CSE-MsgGUID: oZW+u9n5QfCOl3jYcCVLvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64347199"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64347199"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 20:02:10 -0800
X-CSE-ConnectionGUID: mR/Q4htHSV+6jMhfxEkG9Q==
X-CSE-MsgGUID: SbPTbUSUSHiuzmuFbqz8QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186288970"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 20:02:09 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 20:02:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 20:02:09 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 20:02:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNTsgwukm5OB//rweQgiG5nHrplzQ9rtdFmBBsmtzS20lILv2/3zJ22/3mARfYRwEHRrNIXuAW6/QBbzyNlwKdpqBA9tdjgRpG1lxPOPs/acQDM6msV2KpsbcojM2NJVlNorRfUXgxcsnEr+FPvxTYbAacMTtwp7Ig51Md7yJXk7M2KWGTJdKyV6SXwdIi4hpBLduV6ZDYKOkAiR1qq7cbAW4/mXiF53DxiVA3SdLfV1k9WkMOBTvvyQV0MsCqjsySn/PyX9fLETK1ijYF/55m4l3A8i57VTBWIlFgskcPOyHys6hP2mbezkfWt11fzcKEmNcM64ZCVD2WVLNI9Beg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reX6vXsbH30mPhzFhLlDXsrLXq8Qn+cslNtJfPNslGU=;
 b=WB6ddKslcNvxIi1BiLFr5+vPRA8O1ILzahfVa3505ASx2xBTB6kNI8tP8fHidGw4INIUUmDr0NLjZR1WQmdd/x0cPInAMU+x4McJj20TImV3unbqlP2BeTahJeGnyGnyrx1CDsuOGLDeHyk65rrdNuuXbwnUBHGdqO71zr26BLWHwcJZUjHDBKYKE2nSfNxwjOE4fogFwTe0tkAdI/byJBr/J/bYpo3PQmkvQWmTrlOBRgNTtPWcSVfVhtBeXYLMOFXEkCo/N2QaFQayMZ/pzDsfXu3Y15ogkg4PBsJ9+SHhpgOVzMF5GwKlKqIyVtNh8bHCLuLVMZXsclmTA6nzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 04:02:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 04:02:04 +0000
Date: Mon, 3 Nov 2025 22:02:02 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>
Subject: Re: [PATCH v4 3/7] drm/xe: Implement xe_pagefault_reset
Message-ID: <pug6zm723rnkzcvuvv7tfi7huhq5jhg6undh667o3a7krs7iu7@ghkkb2ar6f6t>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
 <20251031165416.2871503-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251031165416.2871503-4-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d8369b-cd2e-42e2-5a85-08de1b56ea29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8det1RbDQ5/HamcKIvolvErRp5O6bAs4HDa+9MCSvJSA/krmN0jT/v9o6Z8z?=
 =?us-ascii?Q?Eg4PgU2sbyLJPD22GMmY5ic0Hyrhrf+25NBbJPvKeRgjTZnhNDVpSMXJbvrn?=
 =?us-ascii?Q?724MZdIAeV3GIZ94Wn/jlOW8odttpYXKCLfIlHW978mijR6LqgvrjL/5owRV?=
 =?us-ascii?Q?tj+0tbVA/CMm9WprSG417z0SB5yZPZj62+0XSQsRN9JqCUw/zmo0f8E+/gXP?=
 =?us-ascii?Q?TJXzmQ86F1N351RoR52rLFKiiknO0faom6G9yvzDvwklH2NP6rNFGW2w03+k?=
 =?us-ascii?Q?Cqb0qCzDRuQoBmDozFjiiM+DRgtpHIAsPBJFCP2ipTDmXqA0m1xBO2JDKabb?=
 =?us-ascii?Q?RsEoNLlLKoLhN4VoGTPF+KCYFQUb+CuJm0HJWs6g25t6QUfXEksQKG7WhYVE?=
 =?us-ascii?Q?b/Y1qNnWIfDay2ltArtEuMPjEoCnQZQ3bOd0Dg6ERRtqZxzltqIgUVU42Fxd?=
 =?us-ascii?Q?dm7ahnYFfznX2KL81t+K6cAYiCM+Nqb5uLYMOC3T5KYxbosXJOOp1Bdk/26j?=
 =?us-ascii?Q?1SezHhm1LPfaxJqPnge8bHoRn7aZZ09DDCpc5Ict9c1y04Im/X7yqqPXUL2F?=
 =?us-ascii?Q?ujeQhoZQcPU8U1MSPthmfB/usc0QONtvwCH18dc4BHGCdX95TYLWSldizKKc?=
 =?us-ascii?Q?4hkfkZx16Ce01EFaJ71ExVqLCEe6mXMaqOxsyCZxlKq0YfQk/7Km/AvYfCw6?=
 =?us-ascii?Q?w8iBVQRJXjGWzpcT+J/v+ScTBtvBRY+47X4q0zCMeaVTlhv8y1rMNYFWkyZ2?=
 =?us-ascii?Q?1SOzkpfrSwHKlWHoQlBV2Rmmd5o7td6eQrzGOhpj3NiwWyYHA1e58Np3IsT/?=
 =?us-ascii?Q?cjop+c91zqiCzF7gsfMBYtudoY7N63uRwDWgbJAGle7qPZy8zk5VpjtHljm+?=
 =?us-ascii?Q?xXvS5RavFpabyF5BnO+KGHLNjzd0n4gflMl3rB3DnURQ0zNndpwMOIdqfoyE?=
 =?us-ascii?Q?oSKzKyk8wcVbC3KIOegMPuPOz415z0j+XdLWtIV9zZXHtdEdANlSFPc9eTdr?=
 =?us-ascii?Q?jNKTB0KmT1kQJsCQQgqJWHze/ZoY1jDanzB9fhjxcyofzdVkmTCvFAtmGd2B?=
 =?us-ascii?Q?Ihh/Fu2akAsSailTZPPjSqE5+E1uhJeAZgwGOqadBThzmL0Ul21WGI8Sae//?=
 =?us-ascii?Q?19xiWKVpsnCVQMd2owVBF3eTBLo23c52smwvV6JxoveNm1O6/keE+4OcXMKY?=
 =?us-ascii?Q?gDTlUk+C4CVTbW3Emzxw7kJbeMEVdHdVe1wItu3znmK+btzVBzO5UbvY/zC5?=
 =?us-ascii?Q?Qib+wsx4DOUsN5eTUJa2fpj7sdqXJVh1lNsEnuW55X7GZGSjUZLkAhEUVtpT?=
 =?us-ascii?Q?78TT95YtWB8BtfuB1Rp9a76jpkTtoNLm75nFu1QJIJj9TzzYBeaeOSJiEYEl?=
 =?us-ascii?Q?ik6ePTyYgupXdgoQMX0U90apVemwxJZqnB1nlQWnpjv+cDIppYDl804gY2nL?=
 =?us-ascii?Q?WXrskc3zK00LKaprKzyXH7KDrSNm8A2x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zp7/AAUMAe0gYHg7uO1xDjyTbxS6sJu8kUoQmjpyNVpeSrIq9kZbTXqizQNT?=
 =?us-ascii?Q?1FTYN+bnwCeGY2GbukwvrBc8Zfldr4fZ1Hm4XKCbL9SpyWvd+m07ejO+0nh+?=
 =?us-ascii?Q?XOqJ4FXFW8h3CzJtj6X/Z4FTMwITVDwR5BRS1XW+euBsY3WFiJCyfJu/0H73?=
 =?us-ascii?Q?d025FgtwBWMDtywwZK3sjXXNNrZejx7GYKLNaHboYux5JzJ0Nq4nFptu/STi?=
 =?us-ascii?Q?0QLObJiLH/SGMCNy3eJnIDaV0K/uDITruOkk2HORX5YFIL1do2GB+pGWnQIG?=
 =?us-ascii?Q?0sOJre1D1QI689uQSYm0UKMkYz6AjvXx8EiPBfVC+KrEf4CIPQk6ejrS0uAq?=
 =?us-ascii?Q?KUzEJW1sAKR3Iz/xCxcyJFIDPSLj2q3/j3s8d9r80Qysd6pRSFbrrj3vDt0g?=
 =?us-ascii?Q?jDQT5xn1XeDoPuajIxBhZ29G67gDbdFAZn0/q05yi4KuyOPFv6JsVZZbjsFn?=
 =?us-ascii?Q?+PHD7mhtSPg8akb8rps1mXjnkQPZdzOexH4Hon5J92A7pZAuaLJK+SNG51YZ?=
 =?us-ascii?Q?L/rvgD9PxXSdOv2dPPvSymyX86UAkVebHJb7IcJWfppd5PccyDDTxHfKogN/?=
 =?us-ascii?Q?mYGNAyO/KbmFZUlLDVbZjMWR8kDf5Zflc/wtFb7l062+FNeHNzcLy0kjKHmc?=
 =?us-ascii?Q?9NMHiRx1NyhpTleleUnMODr28UTfYtuZRkJE6GTRuHhARlXUKt1pPaboBLVq?=
 =?us-ascii?Q?ILJQTPIRi/F9YErk9f3MQTAbo/hMWW/xfnm2hQ3vc/X1k9njW8ChrEa/zDWX?=
 =?us-ascii?Q?zqS5/9ega0Kb4I3opG0pZM09Ba0TXY5uL/KeGCgriVgMz9Z9D6G+8An1hncX?=
 =?us-ascii?Q?rVBN/q8Qi6Pu+WA+/WX+jGcQHONnA7pYRoXlvpJ52MCLB4A9rKhPabNam77a?=
 =?us-ascii?Q?c6yXVO/aZWkdRfUDYnqAA/BorR34gofxzChFskUjFD/gAQuNvemG5O1qBzbK?=
 =?us-ascii?Q?BM4hmITcRGmYRVOmgm2PUEBjnWFjVScIpHsivnxCfHAUOLMCkpwU+Gaw8MGx?=
 =?us-ascii?Q?gysMftd4n9mkKiy3XT71V0enTXHC0IHa9h5upcfVYz0duKK19xEBzWBhy3Gf?=
 =?us-ascii?Q?pK6haBImavBj0qk6mKHg0tvoMeE6lQ8FwA+cIOx7mNvofR3DTirOw9lfT8nb?=
 =?us-ascii?Q?i9tqSwkoO0AiFeOJyTbDH12hJDKvVhwIW7tDAuv+q7u9bOOmMYbfJNzg0/bk?=
 =?us-ascii?Q?jqVN7jllYoZSiq9lg1dH7Q/w776syol/Ik2EiGZ+LUelYmmwBTwhZU9vXUT3?=
 =?us-ascii?Q?jt58GM06Y7iiILTp394IyMGCfjdjjWOUHzcfsr+1zXvDzLKhab0YVhtBmI/Z?=
 =?us-ascii?Q?ldzf1+GjXPavtL9c9Q48cbWOf0bUg7xQWoaxeVJk/g91dvhz79LplLKVBFMF?=
 =?us-ascii?Q?ycNFrLkmdYzc0hLUkt3mcqQkoLvr7ij5FCKmUkU1Pz0JZi9FDb7zSn7E77xW?=
 =?us-ascii?Q?RhtwHcnvbuXd5f8B30tVZwWKSdKSKIVt4W+eKRLGdXj2RhkZvOBcsqQF/HSa?=
 =?us-ascii?Q?mfbOcNYhbUa2amMzGkPwO5/jAmqJJ1+M9qAxzMGLjxI9aMMh2ANecauI2MmF?=
 =?us-ascii?Q?8t7hDmvBj+emvKG94fI7ZyIhFb0nSmx7IZt/jdi9FRT96LMzS9mNzpK/POV3?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d8369b-cd2e-42e2-5a85-08de1b56ea29
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 04:02:04.4348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/YSemAS8CWup7HvCryuTff2u6truvmxLtub9e2v0Bop4SO7nGPjdWmb5nAlLUAIPgEzojjHha8+Hy8FHL54eItYoasfmdMwObbXGoJWNMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

On Fri, Oct 31, 2025 at 09:54:12AM -0700, Matthew Brost wrote:
>Squash any pending faults on the GT being reset by setting the GT field
>in struct xe_pagefault to NULL.
>
>v4:
> - Only do reset it page faults queues initialized (CI)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
