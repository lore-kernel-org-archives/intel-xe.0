Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B57606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 11:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ldGntlSf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE7D10EE67;
	Mon, 26 Oct 2026 11:34:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B152910EE67
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 11:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793014492; x=1824550492;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4Hoq8m5ZoWDMCg5KbNyePBlinDkaYIEfHtZM+z8plEw=;
 b=ldGntlSf28mn6V9ElbasDNo5WtSfrjfMoidf6uYxbmvUCmSo7brI5Htn
 2uH46x20cmb3GJa2i/k3Pi6bARaTxa1dldBId+Avfk5rHzIbkdVyDYjhG
 7AdcGnTwKdoUTVb+5jbroLWTc3XjHH26bP6RCgGdegQOW1wCxWpC5kKut
 B9FQXkusauuUFrBifTD43Cpsj+Ak1qO3mpo2OwPFx+lyl9v6HbBHreJ3Z
 8G+f6rsj+YGNrgu8pyqv9jl4QOH9oBAdHGuTWzWz+gsx0syZG5fz4o8At
 oxhonhTnaOjk7x104vLZ0BaBeE8rYfjJnFTqqnT1ptw6lmxp3wcPmmUx+ g==;
X-CSE-ConnectionGUID: nnbSM0GySayr1n+jzkNvnQ==
X-CSE-MsgGUID: jdk2Xev9TqOu5pUpK8TwtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1569499"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1569499"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:34:52 -0700
X-CSE-ConnectionGUID: WbJ9yq8xTTG/bxd3iZehww==
X-CSE-MsgGUID: WdlE+r9CQP+acZyH2YWEOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4641739"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:34:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 04:34:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 04:34:51 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 04:34:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ywf0Nhn4LfHaajq2TYaZHK5exWzHXOduvyFcffSmfVOe9twS2nu1JuLcobzb9NN94/1FdSGzSTThn4nLvxjdwQU0e1FooNQmZG0HObAF+lfemEKbQ87s0sJID3mWjc9B4AKvyaaoLsO1f96MHBAShq5v9eQR461Zx3pCe4DQXHtRGmeIcDp3XiaqXP4mMyTQ4JsgVXFYeEOLgYX8VFaL29llZL6KlPz7IAzraKFQ+hRuqtRQPEMoE9IpNw6fkp4M7QrX60czpyK7wj2UhWoEfBOR2ntWlQkQFJ/dftdqGUY7ce6DQT58xtcukIj+yC3HQLufiVI+83+L1XutwOANjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Afqn0d9+u2ibLfYHfIbIsmhSyqKP4Ftta/Ldi51E79A=;
 b=a57YZIyRksed4d4bMnVD57K7Le/dRbjR/mksCZ5oM5llfX8lLZIIfpQebY5Ue2srqjg2fFZ32KG+6tAEF0mtAdYRBGKqkvF+t4aCoxkzwV4nCVoMQ/HdOUJFeoF+90t9wFhMk9lOwvs4Q+Ff70wOmbsY6H8tdIOzSbw+ZggFN7FLQzu8aB+Mp9ea4JFLYLvZGaw50//4M+a1HssMpLE4FHfv3TW+mDfThVHJYEsZnH0CXU4KA98C3BtorwQWGdG4IAlXasvVdfzidW3zGPrsav9Pa1NfP34jeg/DgjX6WD1HhJjx2yT90hk+zhMXuDnsUosYS8C2bpGQd4LUl5kyvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Mon, 26 Oct
 2026 11:34:44 +0000
Received: from DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111]) by DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111%4]) with mapi id 15.21.0546.012; Mon, 26 Oct 2026
 11:34:44 +0000
Message-ID: <e4839979-963a-4298-9fef-5f4486a67442@intel.com>
Date: Mon, 26 Oct 2026 17:04:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Use overflows_type() for temperature
 range check
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <jani.nikula@linux.intel.com>
References: <20261023143632.461084-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20261023143632.461084-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0102.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::6) To DS7PR11MB8856.namprd11.prod.outlook.com
 (2603:10b6:8:253::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB8856:EE_|MW3PR11MB4649:EE_
X-MS-Office365-Filtering-Correlation-Id: 7036679e-030b-476c-70db-08df33552196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|11063799006|56012099006|261009223027099003|261022105027099003|261022115727099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mE2VhF4MCmHcb8RbI0WQU2sEpYv7eWiVRoDv9Tu0R+X69Sk6Tou/qJUG1Wi9C2CzEZICvOzZZLTt85W03g2H8QEL7Iy4KIVpg6rRswYAy5Pf4NogESHCtTiHnfKeNRr6u4Dbb34PYNWlU1exU3cdy4AqBgp7wZzDbudMLgAkXE4k8jCvK1/uPFyY5GBUPIWG6FdaAKsPyV4mS39OA2E2WPK1tr8A1z1m+u/KajvzqxTp2bKbvY6nx8K1TAbOymoRObM1NvAlRzuXji7ayu6/W4aedzb+Bm6p93RgummMwzxcd04TrS98Jew+bQxfTn18J5rO/mhdYhT9AVWgTD4ogqFjPfE0lb0/nawMgRAEVAS0xL2EJb1AKbydcYq6T/UUgnpy+YFNXe5uo+1OrtLW/e4TrAne9DvnTp40mSNHyxOw9guF/UdNA56z7JMttlVu+tDJtgOc+lFmuIcvjmvlpbuwJreKaJNa0nXHqoqVGtZkmjyLzrko7+gGFWIP/0kV149ly29c2lccgsGWa1hv5y1n+uskgLtHQctUTuCYdzBmiOIJyjh0PEhX6vX7Y3WoNxP5HbtrvRgOcEozaxXGeRVtbchdRjqH2gzKMO4UZHgYk/HQorFM3AeiUSD+AzeSqu9sHTqpMuy7bIonM/ZqDdPjmNTHgJ0yj/oIv/0IaWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB8856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261022115727099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEpiK0JrWmxPNWF0YlpVQkVvRE5IOVd5dDF0aVNtRDBYNEgyZzlPZHlLbzNv?=
 =?utf-8?B?eVB5cmd1U2pCZER3TTZoVkRPWmFXS0Fwbmd6bTlRREF0SHlSQ2w3bk5hS3Ex?=
 =?utf-8?B?alc1UDREdk91VndmM0hZUlQxdFZteEw5ZDlucHovTTBSWFZDYzZVU00ya0gx?=
 =?utf-8?B?TlVRay81c3RvYysyR1c4S0JUMmtpUFQrV1c3cE0vWVNKY2g5SFUzK3N3azRY?=
 =?utf-8?B?NGp4RFB5dlpkdmQ0ZmorazUxajlNWDU2Mi9wbnNIL081MHdLdmtzRFA1Z1pX?=
 =?utf-8?B?VzhGb1BHczk3OHYxMW51d2o5bk1BS2RRQThEb045b1E1bC83M3NCQ1VIKytO?=
 =?utf-8?B?aU5NaDZxM0xySXJ3c3IxSHJjQm5mYlVvYU52Y2ZaclFVR3R5VUhtZHJzOVVG?=
 =?utf-8?B?VG1KZXE2VFVlQWtmVkFVZGZQVWtHRFUyQkJKOE4xcXM0M2ZTdTk2T0dZY3ZJ?=
 =?utf-8?B?UE5icmtjeGcreWNvdTVON2xhRXFESERNdVZZSnlxVmJmd2xDNnZ2NmR4b2JG?=
 =?utf-8?B?OVBMVDFGV0lFVXhUTUtLWHRiRkN2V2RreU82SnRuR3lzQWh1OURjTlQrNjQ2?=
 =?utf-8?B?aTRPM1FmUllUaGk3bWovTTQ3Q3l5SkZud1AxVXVydkE5T0lDRDhsdFd3Tnpk?=
 =?utf-8?B?dzVoZGtpTG9NRjRDU285VEdZTmtldS9RaXNGZHZabmY3WVh2cFcyUlFjZzRq?=
 =?utf-8?B?MHNlNXF4U3lTNDNYenlCN3VrOTVxU0FUNlBtd1h4c3VpNDhQTUdyZ21LaFow?=
 =?utf-8?B?L0lpOTgvUmRJRnFSdlkxZnppY1pIRXZvN29ZejUrSFIveTFaNERiZWEwTWx4?=
 =?utf-8?B?WkR0T25PSjRZTU9LSDlTQ3AzYnovc3RGTHJtWm1HTElScHZhbGU0ZW85ellY?=
 =?utf-8?B?K3MvUzhlZmVPZ3R6elZaNFVWSnpjdzBTUzBPSVB1SGRhZC9IZjUwTzVNUEMy?=
 =?utf-8?B?ZWVPZmhqV2p2RXlrNG1rbnk0ZnN5Y0tJQTFZV2VKZ0o1aXFxWHRGcXdPaXFH?=
 =?utf-8?B?V1ZFRmxVSmJWdjY4bWN3cXZDVWVhT2dVRU9Kd0VtM0pOaEVvd1BlSHpvTDAx?=
 =?utf-8?B?UVZnN1B5UGVhOU9RSU9UWTdYL0dxcE4ybmlmNDRSc2E2UzZ0R0VKL0wzczU0?=
 =?utf-8?B?SW9KQVJyMTNyTGgraVFTYTh5N3pmNk1yMEdLT0M3Z1ltL3FZRjVPWHlCUFNF?=
 =?utf-8?B?S0lvR29PQUNlT0lNaUxoNFQ3dWE3VjFWZWFyRkhneWpJWm1ESHU2YURUaHM3?=
 =?utf-8?B?U3c4UGF5Rmxib2FzVWJtVHN4SzhUcjNXbVV1dlJUVkVSbkJ6bWFXc1FJZ3Y0?=
 =?utf-8?B?Z2p0dThTRDBHN0VjRWJpSDQwcGs5Mm5Ud0d4NHBBSjdDMjZRSEZUS3QvNklN?=
 =?utf-8?B?NUxMblZIMXhKSkdzVmk1NzhqLy9aYW5RejEvcC9iL1B6Ym40OE9vY2xjZU5D?=
 =?utf-8?B?Z3pEVWl5dEpxMmxiR0NmNlJxTnpTb0g3NGdjbWZITUhmbHcrOXBYSTRwRXpB?=
 =?utf-8?B?cC96Q0t6eVZpR2E3cmVoUTExZEd1dm96MG9FaUIxY3VaenJRQjAxZFhuNTFl?=
 =?utf-8?B?akJVdlkza3JkUUxBdHNPV0NXRVR6dENpeStkbHJ1dFVkQSs4cXp6d2ZoSDlJ?=
 =?utf-8?B?clpKUHpBNkp3R2YvakpPb1M3ajFOZGY3ZnM4dFlLaU93d3pYYkxCMnExclZt?=
 =?utf-8?B?b0llN3hxRVVzb1NuQzRBSXJFNTNqVWxnd092TUR0UDV0TDhtYWdNYlpXb2RI?=
 =?utf-8?B?ZGFPUkZaVHpPSVVQRmw1VlRmMUpNRnNyY21laXFTUHNVenNOS1ZuSjNoK2J3?=
 =?utf-8?B?WWcxcHF3c1hvQi9URHdmMC9NSk80dWJsNkFKOEg1VGk3WWZwOUZ0NGpuTTN5?=
 =?utf-8?B?R1cxNVhXNHhENjYwUlNQNjdZNTk2VkFmb002TlV6ZjBkWDU5dGxaTVRTd21i?=
 =?utf-8?B?S2F1NU1wNDlDaUlxbU55bUZlcFZTQndnSEZYNEtTbjNSbldleXRPaTFFbEs5?=
 =?utf-8?B?cERoMklDZXgyT29tSlRocWpreE9PcFVCUnNRbGsyUGJZZWIxR3FpcGVreXFt?=
 =?utf-8?B?cXFpUnFTN3Qyb2NUazBqcjF4d3NVNkdDMzdaa2hjZ0loZDZlTjhmbERHZ0xX?=
 =?utf-8?B?U29yRVBUR0dKOVlET0Rja0FaU0F3VVdiQ25XUVBiNHVudThnRmM5cW1ETzV2?=
 =?utf-8?B?dDAxR1pLRUk4YjEwNzgrcUhrOWdzanBmYXZKTWFUczh4LzRkZlFPVDRBd1B3?=
 =?utf-8?B?ZE0xa1hjcTliUTZxRVAyaEZhZlZ0eUxnT3o4UHZ1bVdaYnJha1REdTRVV2hO?=
 =?utf-8?B?S280QzFIY0ZONUNLWGZ6clRndHlmUFlTR0JVaFl1VnNBTzltMy9kQT09?=
X-Exchange-RoutingPolicyChecked: t93eofU2WQ5wlXl+nCBd+DeBWPUKLEfdBaE0rieebv41/QWiX3v2DCEyy9TtUUzlx9jUrJQW8eHlPwtHvA3xEiE6+DtYbxkn0siK/NXO//RcCR6xkkRi1ME9GLEI1kyZLHfNJ0BaujwkM/SesoAqG0yztMt+nZKctjmn03GeqQVoeRKuTf1mxCeJ3uZrUKOtSUIwwZD1UAMwtR+SRj8A8B0xW/OWmCI+DQOlK4zk41sdcdIuCDdKnK/ysEOs+pa5bcsCmWDGtPiBYqlNEMdH4T6X2wGN5tfRna5NQLYAi4XyBV+39wre96ElSIFMcC9lBPoWffbgGgpmwW+vn6GDAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7036679e-030b-476c-70db-08df33552196
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB8856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:34:44.2319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tq3a8ombAalWk3eKOGrPxrDIjhIetDFoNTe7pO9zbwxZfxgbhuhC504FRl5SxGd6GXgiLI/tw+nY2Ad9qc1+tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 23-10-2026 20:06, Mallesh Koujalagi wrote:
> The temperature value is calculated as an s64 before being stored
> in a long. Check whether the value fits in the target type using
> overflows_type() instead of comparing against LONG_MAX directly.
>
> This keeps the overflow check correct on both 32-bit and 64-bit
> systems and avoids architecture-specific handling.
>
> Fixes: 24ec15d64617 ("drm/xe/hwmon: Decode CRI temperature registers as IEEE-754")
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
> - Use overflows_type(), instead of #ifdef. (Jani)
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 42acfeb8818c..515b288f18e5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -6,6 +6,7 @@
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/hwmon.h>
>   #include <linux/jiffies.h>
> +#include <linux/overflow.h>
>   #include <linux/types.h>
>   #include <linux/units.h>
>   
> @@ -1322,8 +1323,8 @@ static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
>   		value = 0;
>   	}
>   
> -	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
> -	if (value > LONG_MAX)
> +	/* Ensure the decoded value fits in a long. */
> +	if (overflows_type(value, *temperature))
Is this change addressing an issue reported by a static analysis tool ?

|LONG_MAX| already reflects the platform-specific size of |long|, so is 
this still needed ?

>   		return -ERANGE;
>   
>   	if (reg_val & IEEE754_SIGN)
