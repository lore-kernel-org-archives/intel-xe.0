Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B39AC3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 14:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9FD10E7FF;
	Wed,  7 May 2025 14:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gp1syRxD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5D210E197
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746626680; x=1778162680;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=wcnBad9wr23JpSHGi4Xjs/OiCNy9oc8swYZrXmlwmzA=;
 b=gp1syRxDCAInXx1aYl9eOVdEpCYqssrQZ0MkIpPkfqcK2sV6ctvhub0U
 69DpoJpXyJgfRDiD7aF2LJ3fileQOqI+6+5A/SnA4lCa0x5OSGbvll5c9
 bsRytwWwsiX5FGGgPN14SqJDF1/y3S1xve7PgiNsKfyWiDHgv9ObIBrGI
 O4/XwwpZ4SWb8CpTXA/FhibI2C6MCBMFyQPF6bmY9pod1pEp57s6UGpDz
 OA2EVpflExeuA/htopdpwU9r3rgvBx9y/+jitC9JzqbHuChLNm1aPw8d7
 LUWNsJlO++QCZIMeCBG2G7c+MhfFxii7JZTP4LHPxJTeT/3RAqXuXZa+I Q==;
X-CSE-ConnectionGUID: gKk4OhcBQdebU3wvxw2u+A==
X-CSE-MsgGUID: NqbPZPoYSaqQGJaMBFo0kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47460890"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="47460890"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 07:04:38 -0700
X-CSE-ConnectionGUID: zWEAJ4p6R22h06rqn+SUMQ==
X-CSE-MsgGUID: L1XDDpE0TteGI2dDPBXVqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="136369701"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 07:04:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 07:04:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 07:04:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 07:04:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWQQ4djpxHtgD0y7NJgKooSJDsBjc8wiE2bHai++f99cGU7/U5t5w61Cm9km39sKsWRZktFbL3xsQ3zQsFe1jGpdbT3EVBfybwF+CCIPuz/x7PUP4pc3zJper/mhia9E0sHiEmvpBAscSxvGAX17bVb0B26pbuUNPryB10dLDOu/B/cSutv0YFa/3dzmIiJEGD6gGJPTtnyMMzFnrYo1c6lpuiYcxiZYzlFK4wJug5o48zhSlAukpaeY+HcqFEpH/sRyQXWBG2BnfpLp7bihP+Dx8WdjpUyVcDui+4lxlOIJrUFCONMm42u8O/jFxe54PzQI1ezlRs7vPoyKu1/xrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhoBxKrBEVs83cTvDSfFN7YonnlkQRXR29JvqOjre20=;
 b=qipc4bszlYVY1g8gIPpXJ8HJQxaT41Wo86dveIx9t3VLiUpntjDvDW6NQm4pZFqq2XfsBpSDrI/GffgGFTGqAYb3Pw1Jabttwos5G2e9miUpinsPCx0bDmkoLUENNspr+yslOl/aG7zGfhI0XSnyCOMDUPxhHYVbGChYQml7CddoLMqY00UhJk19E8VsZ8QRI67mJ45fEXU7RyR9PNR/QPffZc/u21sDF/a/Nc374Yrqy05YUWuJAHkvTa0be99Hk605VnguNVEua1BOkUH4ZBo0LJdwnEGdhVBHhkUOA6VUS6UvtV//eB83oCsMwhTtPP2toMIJ1zqfkei68byabQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 14:04:35 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 14:04:35 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250507101112.4678-1-aradhya.bhatia@intel.com>
References: <20250507101112.4678-1-aradhya.bhatia@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2hpg: Add Wa_22021007897
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Intel XE List <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Aradhya Bhatia <aradhya.bhatia@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Date: Wed, 7 May 2025 11:04:32 -0300
Message-ID: <174662667213.2473.4222988895493880968@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
 To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d771808-3127-4c88-dba5-08dd8d7018a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2pNR0UwZ0NFSGtTc21QVGlKTU80NVl1ZHA4a01KcGJySDFkV1c4eHlBQUU4?=
 =?utf-8?B?TGg4OXJ2V0RNUmpnVEwxcVQxbTc4MjBQSFZ6TlRQcnQwZTdDZEhCYlpYL2lP?=
 =?utf-8?B?MEQzZVdnd3k0amVyMUorWWsxa1dPdDYzQjVCYUN6a0RxOWZVRllua1dxL3Vz?=
 =?utf-8?B?NzVSVXdiQXc1eHdxL2ZGTm9JalF2dHN2Qk5Pa2RDbVowMTVoTi83WktWaDJT?=
 =?utf-8?B?eGJLTHZFSFgxQUxjOFI1R2pEb2cvdGYwOFZNWGZMUFhKU1hSdm9RVk12YnlR?=
 =?utf-8?B?R1U1OHpucmJsRUx3WFNQVjI0bWhjSjlEUHhTbkhQY0FlemZZWTN4WWN6K2dD?=
 =?utf-8?B?Z3ROMUxvZWV0TCttcnVZeDFQejg0aWlQdDJkczhaRHJwT2pvZ2s2N3UrY2JF?=
 =?utf-8?B?ZFByUVZYTEtieC9JZFdXS1VNVmY2ZWZ0blJwQm5wbDVuZGo5ZVI3Z3BROVA0?=
 =?utf-8?B?Zkt6RXYvRHV0Qjg1WDMxRHBoRVNBNEt0cVQ0eTF6ZWd3RXFYc0gwTTJ4cFpL?=
 =?utf-8?B?c1ZBSS9LVEd0aWJpa0tpbWFJZXNKU2hRNlNhQTNyVkFyUGY2NDBDSUtjVmdq?=
 =?utf-8?B?TGRHUmlFT3d2QWFJUWwxeHZ4K0tNZVZBeFRMWjVNdjJWc1l1SFZSL0owTFFS?=
 =?utf-8?B?a1MwRFRLaGZscFB6SkRZR0VSV05udWg5RHVDaHJKd0puSDh4aEQ5N3o1NE5q?=
 =?utf-8?B?b2dOdEh2YmZPbzdHVUk5NHkyRFRZcGJWRENRK2l3TEkxM003V01RdEplSkZO?=
 =?utf-8?B?RGlIZllUZ2FRVC9qSjhOODlFdXgrd09lbmFEN2tsaDF2d25sNkFVT0MvUmEr?=
 =?utf-8?B?S2ZjZG1jVzVEMFIwMVU0a1lGbExCOFA5UUhvcGFXK3gyS01RTmx6Y25RRHVq?=
 =?utf-8?B?dU1aRnlOSTZkWVpQTmNlZm5MaGRUMVh4RmRxdm5oUDBjdFhBRjlrbG10UU1S?=
 =?utf-8?B?SVpvajhycEd5MCtGV3Z4NWhaUjN0V1VOc01nSURwQ1NnVXphY3pHWGRPT29p?=
 =?utf-8?B?cGlQM08xbDdDaWlPeTc3dHFMa25JdTlUTmlKeTBKK1dUTGJoN0YwSkZUNERP?=
 =?utf-8?B?Q0k4U3dtUlY0ZXpVRE9pLy9wYzRqUzNEalBNMWRYc0NteDFaK2RVckZqbExr?=
 =?utf-8?B?M1hDU0pLaDNZb2RaVGJKOEZSS3hZQmlmWnVNekEvYnBMMWdJdU5TclBtRDdB?=
 =?utf-8?B?WkJuYVpubTJZb3dYdWtpUG9RYlQxWVFyTnZqZ1puUEcxbUEyYm9VN1BYK0Yr?=
 =?utf-8?B?ekhmNnpRR29SZzh5RzVBa1pNb0VOSndJYm1rSW0yemh2OGlJWFFFSTVlMU1N?=
 =?utf-8?B?STY4UEZKS0RTcmprNGtHaksyTjhwT1g0RExSSUErOGZNUDIybkJwTXd5WEp6?=
 =?utf-8?B?aDJEZ3lrQVRuWXh1VjdFbDB4VlU2blRKY0I4ZEM4WmxVSGQ3Mkx5UlIzckI5?=
 =?utf-8?B?QmJTVDFJY1lINTR1MERLUVNHbFcrcXlvU0gxUy9lZ1BFSkJVSVNFVzlDTWNk?=
 =?utf-8?B?WVcrZTVxNEF1Sjk2QXdyWkJVZHV4N0ZWSDZzWHQ4cWk3RUFnWXdXaFhEcTda?=
 =?utf-8?B?OTArSllXZVdvenRiK0I1Q29YWm84SCtUTGZjOWEyWUJuUGVwVElVb3U4Uklv?=
 =?utf-8?B?TWZDVXQ5NlZ3NUU0Z3hyY2pYOW14TWZQd0ZoQ0pUUEhORW4yVEIrWGwrN2ZY?=
 =?utf-8?B?ZEhGbnZyR0ZKbkFpZUJKMlNkTHhzcmNGRHpwMk5XYThXdEEyK1hHTk01U1lz?=
 =?utf-8?B?VldhUWxhcWRBU21PK2QxRCtUTFE0RXo4Y25oRVNYQUlmWE1WTUxHTzM3bXNv?=
 =?utf-8?B?bkhCUzBaOGRlb25lYUhVdXdteFVoTXIrYjRjN0dqMEdzdHpWM2FNVUJMOE83?=
 =?utf-8?B?L091YUpZc3Znd2FQT2RrSHZ1RHovWGoxalk0aW8rWGNpMEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0swRGlQb0pLbjdpK1RVdTdFeTNBVk1qVC9VdVlqdmkvMnUzUjljUXl1VDd4?=
 =?utf-8?B?S0ZHZWlMa0g0ZGVpNzVoeWI3dXVPUUVHVDk3Yy9JL3JGUHpxSSttOVBPeW8x?=
 =?utf-8?B?WGJJdy9kczFpQnB2NFJIZkNldFI1Zkh3a3VyMGZscVpseXRhekM0WHgzZ296?=
 =?utf-8?B?Zk5icUVxQ3VoY1ZPSmN2RVlZWHlLbkwzSFJHNzVHMUxseGdRUlZTK3BYcldE?=
 =?utf-8?B?aHJwUTVlR2pKalM1Sm9qT1JsZ1RTUmpUbUUwOVZaWkhIc0xYR3h6aVFBN1ZT?=
 =?utf-8?B?aVo5bDYvcnpubHdDMFk4cy9zNm5qeXdsems4dlorTGhUdHl6NEgzSDhSWUw1?=
 =?utf-8?B?N0g4RTNZSXhGZWZyY09Na2Y1NGdGeFlLR1Zja1NZKzlKSnhPTTR1R25mN2cz?=
 =?utf-8?B?bXBTYnhFM0UzVm1memVyL2FTK3B2bk5vcWZjNzhNYUdFV2hxZjZzczh1SEhm?=
 =?utf-8?B?RUZadjJqTUJVb0hvRVVWZSswZzBiQUNtSjhnWlR4cVJmMlNWSkRWUXhEdHVD?=
 =?utf-8?B?VmFpZStQNGpzZjMrOTg3NkdpWUkyWi9aczhXZC9kekZaU1N3TkxyMDJuYUhI?=
 =?utf-8?B?bFArbUpydkdnbnM2V3RlMDJoQWR6NnhUeWN0eW9mZDZwNUliaDZKZVlYRm1T?=
 =?utf-8?B?RS9ZSU84aGg3Y2l5a2FkTi9QbytUSlBZZEZXLzVJTVBjS1RLaVRBRGNIMGRX?=
 =?utf-8?B?dXdMN0JoZXp0L2IyUThHQkl4bUJyc3M4MGNVa29kZ3d6WUhIaWROZU54WGk5?=
 =?utf-8?B?bGpGeXl1UHlDM0JoV2xmYUptMGNyaGJIdFVoNzlpalJOcE9peVRHR2tJV2sr?=
 =?utf-8?B?Q3VSS2luM01VQW5vR3ZEdU9PSW91RnJPWm1NczZRSEN1M05mTlpiM0RhZ1hx?=
 =?utf-8?B?Z05CYzR3K3QvQ3VHTWx3dzltOHBudkM0SE9iNTMrNWo0L1Z4bDVFd0E3MEhB?=
 =?utf-8?B?RXRtYlJLTlhuMGhTdjg3VDY0UGdsWnlvMUhGYzlLRXdYRy9oSldRanRuKyt6?=
 =?utf-8?B?QjdVaWhNRFA5dklBRVlHc2twWkkwOGhsTHBndFRkTkg0allIOVFmT211NGxs?=
 =?utf-8?B?Rk5PbjR5dkJzemdreGJRSnM2QTZOV2xQSFhkK09TYlVQOWsrSDVGY1E3TXdo?=
 =?utf-8?B?VjV4Z2FVZjIxWkJBcEgzYXhMYStHUGtHSVVpdCtmM0pOTUYxaFFCVUJ0Nnp0?=
 =?utf-8?B?UmgyUGlNK3dRbVRaR2djSEFjcWZob0NnZEp4cUNYc29LdnpSc1BTd3BtWmVU?=
 =?utf-8?B?WEFxQnAxUzd5L2E0UGhrTmNvK0VBS2U2eHJUZE9NWHdRMkRtMTlpd1lHOUJt?=
 =?utf-8?B?dFNDeDRMekVic1FlWms5RU1sVU9PY3Rtci8wWHRyKzdkVTZlMGkrZUtIeFlO?=
 =?utf-8?B?cFkxdGNkdkgwTFNlTkJmMHpxV012R0NmMUF6UmUvdFVwNk5EcFgwUS9yVUdT?=
 =?utf-8?B?NUsySndXWlc1ZXFuSGNQRFJ6VTdTRCtYeVVRaFpwUXZDT1N5OFpybHoxaTk0?=
 =?utf-8?B?UVJKZkxDZk5IbHZldFQ3Y0dodjRzZWtOT2NrZk81enZSL25UOSt0TDRaejdw?=
 =?utf-8?B?eXN4QlVyNkF2bVZXZEhaKzE1dzloTEFnNVdwd0krWFQ3a2d4WSt1akNkdVk0?=
 =?utf-8?B?SXU2MFFrVlpHOTZtcHdmY2hlakJlR0JJYlhDTS9zL3ZGWk1qUWk3RDBvTEZD?=
 =?utf-8?B?dWk4TjB0NU0zd1ZJbVRRL0V6cCszaCszcDcyMkxweU5EK25EMDFndHk1NkVj?=
 =?utf-8?B?SWE0WWt2bkdadkF3b0x2Tmc0WVVWc1E5Vm94b2c2SXJ0anQ4emlsOE9OQkRN?=
 =?utf-8?B?UHlYZ0cyKzhVQzA0SllBN01NMTBXcjRXblBMMC8raVlBUHJEMmJZZSs4bEJ1?=
 =?utf-8?B?d2grNHhpam9DaWQxRXJSSlBMOFhiY055MkRsTGZQdzRPdFcrTnpUU1hSQnlG?=
 =?utf-8?B?QzBVMXBRU3ZFdEdwbjJLbDBRbEJZRjdBaEpFUlJXNnNDMUJQV21Ud216TEFF?=
 =?utf-8?B?bmJBV1ByVHNabmZyWDJPZHc5dDRnWVlhL2ZjZVBXSUo1ekVrQk1wT1RRR28r?=
 =?utf-8?B?Sml2bm9yM2VSeVVGSEllSTJEVi93clBPc1lRRFVwVXZ3RUp4TDRhZlQ4RWRW?=
 =?utf-8?B?YnJqd0tjN1FrOUE1QUZ0akRKOHpTMXhTK3Z2NXlPM2swOUNGZng0TFpiYVFC?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d771808-3127-4c88-dba5-08dd8d7018a0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 14:04:34.9810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DBdayALvpjzsuw5kE73UA7RnVSEa4UMNJKZLLVoEUWlCmXWcldIm3mBSqIwxjzXEhJ1AgRVu/VozcK+owc88w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
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

Quoting Aradhya Bhatia (2025-05-07 07:11:12-03:00)
>Add Wa_22021007897 for the Xe2_HPG (graphics version: 20.01) platform.

s/platform/IP/

>It is a permanent workaround, and applicable on all the steppings.
>
>Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
>Changes in v2:
>  - Fix typo in the SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE macro.
>
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
> 2 files changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/reg=
s/xe_gt_regs.h
>index cbb9f7cbcfc0..5cd5ab8529c5 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -156,6 +156,7 @@
> #define XEHPG_SC_INSTDONE_EXTRA2                XE_REG_MCR(0x7108)
>=20
> #define COMMON_SLICE_CHICKEN4                        XE_REG(0x7300, XE_RE=
G_OPTION_MASKED)
>+#define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE        REG_BIT(12)
> #define   DISABLE_TDC_LOAD_BALANCING_CALC        REG_BIT(6)
>=20
> #define COMMON_SLICE_CHICKEN3                                XE_REG(0x730=
4, XE_REG_OPTION_MASKED)
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 6f6563cc7430..67196baa4249 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -827,6 +827,10 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>           XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
>           XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING=
_BOX))
>         },
>+        { XE_RTP_NAME("22021007897"),
>+          XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
>+          XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEH=
IND_FIX_ENABLE))
>+        },
>=20
>         /* Xe3_LPG */
>         { XE_RTP_NAME("14021490052"),
>
>base-commit: a127cd437da1f18b6ecc9e03226d8e2b2aa79dab
>--=20
>2.43.0
>
