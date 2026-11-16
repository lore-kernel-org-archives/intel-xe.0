Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8136606A32F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BBrYbq6w;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=i1d7hK2z
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D83610E1F4;
	Mon, 16 Nov 2026 09:47:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD8210E1F4
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794822428; x=1826358428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=O/SaNw6m6h8OnwQ5FAXbRqgFwNrbopuqTZy257O9zaI=;
 b=BBrYbq6wBNbkxtq+lelSPX4sdAmlQJFwKZgX98eP8CkvS09GpXv9GcT1
 lXlAM5p0zBhEisgN1ZVrkM5dmqtwnb0x3h+prf/5zH98CO3yahierJSZS
 aHMs3AKahznnycICai3SazTUCNf2CnDzd/81DLBIYhmTr/Qx+E8qYEQmi
 NOx7ZNwZvePCWOzPhEZ1j+KIkgfuo5ByxQAvb1TgYQv2yhvZjx/c8uIzn
 w8UFUCxIZoHWwIZxHdpYU2v2sPj6EcnAUlxMporP7GxxSGoyF4ntHJvU6
 M91IYS5SP8nI+F7quCuKv2mV5R7ndWKgm1RXNe0gwAqv4lDFOislzkxc5 w==;
X-CSE-ConnectionGUID: JaV4wtbTSHarmTetopazIQ==
X-CSE-MsgGUID: KM8hzOClSAubXRekNGmOrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3426447"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3426447"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:46:57 -0800
X-CSE-ConnectionGUID: iMjy4MwMQTq/K33doSQWUQ==
X-CSE-MsgGUID: Fmz9HrPARQC/On4nI6YE/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9312402"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:46:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:46:50 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:46:50 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:46:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdHSY2tAwyAA4FcmQoYQ7NkXIJHqkQqJmLjATO99vlTJI3XS7fkqR90FmwpydV6XXjDYBYa5F796womurjp/OPnK8Wmk3rrE3rxVvfHDurYb1ykMRwSHwHIBSD59WgMqCl86v6uH29Wz477hkUi4/1sfElYkH33dKaQG68pkjIHZE7o3cf7aFvWD+1735t1NkOhOkVdfJS4lJNVb2nuvkglbHBtEufrVhu6T92uuU9ex5g+8sJXAfU6LFvd+B/8krDGUA6nDYwLDQz9WhImwmBkpvQITeWbQaBXJYCZL1Oqa9Mnzj/osXgObTYAONuGqHW+QszfGlL+mFCaML4tP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxrFZ4C/9oTnJ5MnlajvAIqz55wiMWxXMSd/EaZxDjs=;
 b=w/urehVQG9ji0wPbY1DOq8r58kvZaw08S7SVpMVMzRON3XKhM6Lv/sdtICLpOC7gvcfe7RJJQ5zQkEihZpzxEW2wlsqFxkK3KKaVPsUlF2F2XUV1Id2OpoAns3bZA7YfBVEU6PkserkcgeyiMRO0QNzMdC1jKn13a0Ps12rLfZsPHWeID3PLhXn6r4TsybQldqIPw98kWjN2CYvCMfJ9rmx6cA+SEzD2gmWhIhRywi5Hon7ewIU3wgH2I/+5zEhC2khEhij7bHz2FFrI/rTus3SHzXLJXuYizUjTbaElr7ZBUSnMtHn0PlJFhoQXcLVJwg/IHnlgs7TWJjvd5wewMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxrFZ4C/9oTnJ5MnlajvAIqz55wiMWxXMSd/EaZxDjs=;
 b=i1d7hK2zOqtwi9Jjw0qSCD0j8QVAuOQwffBrEXzGLj+s1npd1D0z+SEwg0t5AZj7f8hXoXfFmCUfe4DfPRZBFZvvS1Ul/DtGr1C3VWoYXF0AVaKOGNGqkYM/E+R5At7b5GfKyxZcIWakcfgmT/qpXnrz5jPK4IB2GpqvANt9aeg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PPFED21B01E3.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::cd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:45:51 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:45:51 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 5/7] drm/xe/vram: Allow splitting a region into pools
Date: Mon, 16 Nov 2026 10:45:21 +0100
Message-Id: <20261116094523.2484301-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0023.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PPFED21B01E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d97a4f-2094-4175-1186-08df43c666c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|11063799006|5023799004|56012099006|10067099003|261022105027099003|261028144727099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: sH9icHq7ZolZw+oeKK0qskRVpJzMI/VV9eUBVHOUB2kdHapgEk/SU1e4mOmGOAuJlIncLDoqcDM45Xjlr1TREDNDP6vtsqxbMGhzJwpPAzs4V9ta6xiJ8Nq1HoXJKMNGVTAq9jjeLFfI3Wku91J9lmRyHcunGPVC6Sz0KtqZnTv2CjOfkI7pkdlf38jKmmMQkxePPjOMXHVeoh0HKWQZ9N9JYqiSpI7UzX4NChwG/0r1AyqNkGZ0+6nLlL2bFtW72SqbiOcRez7MLlEKzPnJMp0CoKZXme0W6zYUx1rKg6TdvBzX2W744g/QCsD8m8MG1soVGMu7Vs/sjSchjJXdDTyamPXGzyf3+b99YkbPDptxp5Al6Bi1biKYIh9cPg4bQhePX6GJ6hwv0NLaN4xa0NZ7OjtTsPpzYdS+pZ9ZxI+nCu2ic79HBX+me4T+No6mYGPqUshKysroVifSdvYfIBybn40YBoDeR3geeE3VsyMiyPQa/RwIdgZ7kuYr60/WqEHKFZBkHa1hLLLCN1t5l/E4gR1jMz/qT+CxhQZkqU7T/HLY7GvRCd7Zfmfrv1fKOj/KhtooHAD4jrd/BBcxt+Evcs4sCDnEoarxBdiYyDRjkMComLmfg0g20HwRzzm069XThI5CaCdAtbvIQvpjiPoWy/NLzuBLOC/lMBeOiEk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(5023799004)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHFpWEZtTVRxNFN6YTE0TTA4c2MyRlBsZ3I3U2FMUVMxbnZvMGk0WHVBTG1j?=
 =?utf-8?B?WHVNWnlyd2hEK2d6NEpWK1lka0Vid2NpeXF1cmtUT2hvUU5qWmtLTFpjb2tk?=
 =?utf-8?B?MUo1TGNuTjV0Qlk0QjNpYzdnQU5VT2JOa29kODYyNW41c3dvdkp2TTRKekc0?=
 =?utf-8?B?Q2g1VUNvZUxlQlJBVTRUdWRwNmppNmxPYTVkUXJ2S2hzU0p2YmJzaGFWVEhQ?=
 =?utf-8?B?dnpxbjlob2pXV0ZKQXJ4eE1aODcrMXdyNlIzcTJRajFtSGdadjlRS3NhckRs?=
 =?utf-8?B?Sk9FMHpOVThhc1VKZ2NPb1d3WFR0MGpXSlJVVjBYSDNFWDVScHRqd2FrRnJp?=
 =?utf-8?B?amRzODN4SnE1UXBYa0hKaXRrTDNaaEZPTmwwNEkwSWRtcDFQMzU5OGtqSG45?=
 =?utf-8?B?M0FLeU1GWm9KNzdXMGVGVElubm9hVzZMazNKVzQ0UTc0WlVLYTBBNWU5bUpw?=
 =?utf-8?B?K25JY2owZTZHUlEzSUkxTEJKbDVwUlJnem14OXNVTnhCcWE5akpCUzZqbTFM?=
 =?utf-8?B?UFFqb2pQeWF2enlCd2Z6YnJySU1QbXpJcTFySFgyOXN4d1JXSmRzN2R1ZVpa?=
 =?utf-8?B?ZGlvUEJUSVVnWXNqelFsV3c2czV3STJhSnRSa3F3REV3QWV6bVdESHNITFdO?=
 =?utf-8?B?MDBzTjFFZ3RzbHlNY3dPdllrb3c0a2ZBOEZQOEt4L1BFY0pmeU9qTWNKdTBu?=
 =?utf-8?B?SEZjc3ZQelpmTGY1TGRsbUllZGpMNWRsUDJDMFNPbDZSTzd5YStFeTN5Z2ZJ?=
 =?utf-8?B?NTBFeDlFYUh2UmZURmUzSElMMzhZcUw1UjA1WkpRRHQvRTJ5NVlzSmxyMDJI?=
 =?utf-8?B?Wlk2V0xmaWlQYnp2M29vb0hSM2Q1UFFWbnZxenpsY2lZOXNzOUZSUmhGdGFi?=
 =?utf-8?B?NjBqelV5UUhRL0EwRXM4THhDbG4xTmsrQkNndHdyY01LbnIvMDVhbDEwREE3?=
 =?utf-8?B?ZXNGc0tuUEo1ZlV5VWQ5eGtQcDhYYjJ6U1BvZWxUUnBHa2ZwNDNWL2hGQms1?=
 =?utf-8?B?clR0Nmw1ckltUWtNcFZFdkpDWjdUdGNkc1UyeDkwQjBlS2NYNUE3RzFNamFj?=
 =?utf-8?B?UHk5RDQ3NlVzTUluQ0laaVBYWmUxWkY3QzYvNGp1Sys1blQ2dzU0d21ueGR6?=
 =?utf-8?B?RVRtbVdDL2ZrQllwS21PZlpqc05SK2UwNUxhc2cwOTFRZU5rN0VLMmwvRGJr?=
 =?utf-8?B?bUt1eGhVQmVUemZMZDNXcVRQbHZyUm42d3huWW9abkRxS0hLL1FrbDNhWm92?=
 =?utf-8?B?ZGYya28vajg5Y3d1UVNDNGtKWWZ2QjgwWjJ4R2Q3WGgyWGpnZU9MSVloTjhl?=
 =?utf-8?B?WGUzb2ZjQlYwRFF0QUNLT3JSNlozK1piSkEwOEJrRlgyVjlnREJoSXRaTHBz?=
 =?utf-8?B?TlBhRXZ0ZDAwcXNiR1I5NnRBeHZyN1o0NnM3U3EvWGdGN0IzTUVFV0pRa0ZH?=
 =?utf-8?B?NmlVQjl5d1ZaZ2d6T3loek5BWjJNRUFMdkwzeUNsbGFpLzIvQXJBQlp1MXM2?=
 =?utf-8?B?SFUzT3N1cXp5NGZEL2dJTjRwbXQ4VGlMd0RjbjY2MlhmVWNEZ2Rna0FmcnlE?=
 =?utf-8?B?WDhhMnNETlpqd1Z2UE8zT21wTFUwcjFSaGdWU0lGOUh4YVlycElXdFRtZ2hp?=
 =?utf-8?B?THROOFQvTzFGOUxPNWI1dWxWNGxHVVk2d1dDUGZwRkpDUzE4MDZMQm9Hc2FV?=
 =?utf-8?B?c0hPcWJFTGxmSGpwbDJqeXRMWDdycnhjaGJlclBwZnVjYUYwMHV4Yjk1dTRq?=
 =?utf-8?B?emdISk45SDYvNGtib1dGdWw5N3JVUTdnSXh5K1VXMmZLQUlmRThoRDh4MVFV?=
 =?utf-8?B?U205NXJwTHN4RUtKbXlncTF0L1VrTWxQb2Q2QlExM0Fac1oxVDdTYVhkYlFD?=
 =?utf-8?B?M2xIcldFelFwejZsV296ZVRCVVVXTkhoRzRwYlVjOXlaaXNmUmhoaEUzU1gy?=
 =?utf-8?B?UkVpYnRaV0t0WDFqMzhqVXFtWW1aZE5Fbk9teVNSak9uK2NmSnNpT21WT0RE?=
 =?utf-8?B?UjhmRHlDS1hQSXNXTDZ0RmY2N3dadmJxQWtBTnRpRDBlNTk4R0Nzc1dGU1V1?=
 =?utf-8?B?YnNETTRJeHluOC9qcytHMlBQWkNSV1ZrVjNZQzNGR3ZTcG1qUkFTdFBqeHM3?=
 =?utf-8?B?NGRyMjY2c0kxRTROYm56bk5YUHlsTU5KZzZ5V3V3blF5M2xhYXN4L2xPaWRI?=
 =?utf-8?B?OFlSZzNGN0tvSGVEWG1HTTZtSFVURmVuYU9BR2kvZUlnSk9veWY5RFRoQTU2?=
 =?utf-8?B?bzNDYmdvKzd3NW5QczZTN1dvRnA0NVRHRGl0MVpZNmZQbVZZK1Nqa29ibjBK?=
 =?utf-8?B?aElZVGlLekxEdS9OTmIzNnU4WHp3VzZGc25oN25RYzlOMk9LY3dWbTZ3WDNC?=
 =?utf-8?Q?U5ZTuNSEuInRUjes=3D?=
X-Exchange-RoutingPolicyChecked: v2h4aMJSPpg+bMMoceMgrFDdggGggplO0j/dwCSqYAZw/7Nxl1c4ApH19H+E0SX8sGOyyItqel0ossIpHq84UHRdKI7wglgeGH4Qyr+JR3USROl4Vocp0zwUHCpR9yl2+kwItFMwgThzeGO5NWjYPevB92eo95iMUdyXbqcL9arQH7Q+LBWjWw4KEsXfL7NVm/1jYmBVAh08mtR2O1AjbRUnXdXpb4V6ZG3ayLiHiqdAZAfV4pj5aRsXZu11e/KYY293uOHTvXtjtJsQTgagwzn8zzi7NubHlwzkjFqfpwIsIZKu9kwSKnN9I36SRJLiU5aQiPfuSF8IheLWJwo+Vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d97a4f-2094-4175-1186-08df43c666c7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:45:51.8037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhxZbBP8f6onKAaY/gyAmRCzKupP/Wh9agMetVmYfrpA8IMfRNCJVJAC1XB+Zq1aCmSHDXPg1GnA65nCVSFuFZjPQ3QnrmnYMV642lXtBxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPFED21B01E3
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add xe_vram_pool_create(), which carves a pool with a dedicated purpose
out of the low addresses of a region and shrinks the default pool
accordingly. This is the building block for reserving a range of a
tile's VRAM exclusively for a given purpose, e.g. the lowest chunk for
kernel allocations. Placement of such a pool is narrowed to the page
range it covers, and the VRAM manager backs it with a buddy allocator
of its own.

BO placement resolves pools through the tile, so creating a pool does not
by itself redirect any allocation, the caller has to publish the new pool
in the tile.

Nothing creates a second pool yet, so there is still no functional
change.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 88 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vram.h |  2 +
 2 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 583906f93bc43..6e0f5c4660e4e 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -42,6 +42,18 @@ static const char *stringify_vram_binding(enum xe_vram_binding binding)
 	return "Unknown";
 }
 
+static const char *stringify_vram_pool_purpose(enum xe_vram_pool_purpose purpose)
+{
+	switch (purpose) {
+	case XE_VRAM_POOL_GENERAL:
+		return "General";
+	case XE_VRAM_POOL_KERNEL:
+		return "Kernel";
+	}
+
+	return "Unknown";
+}
+
 static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
@@ -299,7 +311,8 @@ struct xe_vram_pool *xe_vram_region_default_pool(struct xe_vram_region *vram)
  * xe_vram_tile_alloc_kernel - Initialize the kernel VRAM pool of a tile
  * @tile: the &xe_tile, with its general purpose VRAM pool already allocated
  *
- * Kernel allocations use the general-purpose pool by default.
+ * Kernel allocations use the general-purpose pool by default. A separate
+ * kernel-only pool can be created explicitly with xe_vram_pool_create().
  *
  * Return: 0 on success, negative error code on failure.
  */
@@ -364,19 +377,88 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->dpa_base = lmem_bar->dpa_base + offset;
 	vram->usable_size = usable_size;
 
+	print_vram_region_info(xe, vram);
+
 	/* The device aggregate only reports sizes, nothing is allocated from it */
 	if (vram->binding != XE_VRAM_BINDING_DEVICE) {
 		/* Until split, partitions[0] spans the whole usable range */
 		vram->partitions[0].offset = 0;
 		vram->partitions[0].size = usable_size;
 		vram->num_partitions = 1;
+		drm_info(&xe->drm,
+			 "Created %s[%u] VRAM pool[%u]: purpose=%s offset=0x%llx size=0x%llx\n",
+			 stringify_vram_binding(vram->binding), vram->id, 0,
+			 stringify_vram_pool_purpose(vram->partitions[0].purpose),
+			 vram->partitions[0].offset, vram->partitions[0].size);
 	}
 
-	print_vram_region_info(xe, vram);
-
 	return 0;
 }
 
+/**
+ * xe_vram_pool_create - Add a pool to a VRAM region
+ * @vram: the VRAM region
+ * @purpose: the purpose served by the new pool
+ * @size: the size of the new pool
+ *
+ * Add a pool at the bottom of @vram and shrink the default pool accordingly.
+ * Existing non-default pools stay at the bottom in creation order. All pools
+ * share the region, the TTM manager and the placement, while the VRAM manager
+ * backs each of them with a buddy allocator of its own.
+ *
+ * The bottom of a region is also where its CPU visible window starts, so on
+ * a small BAR device the new pool takes CPU visible memory away from the
+ * default pool.
+ *
+ * Creating a pool does not make allocations use it. BO placement resolves
+ * pools through the tile, so the caller has to publish the new pool there,
+ * e.g. in &xe_tile.mem.kernel_vram for a kernel-only pool.
+ *
+ * Return: the new pool, or NULL if the pool cannot be created, in particular
+ * once the TTM manager of @vram is initialized.
+ */
+struct xe_vram_pool *xe_vram_pool_create(struct xe_vram_region *vram,
+					 enum xe_vram_pool_purpose purpose, u64 size)
+{
+	struct xe_device *xe = vram->xe;
+	struct xe_vram_pool *pool;
+	u64 offset;
+
+	/* Splitting is only safe while no memory has been handed out yet */
+	if (ttm_resource_manager_used(&vram->ttm.manager))
+		return NULL;
+
+	/* A region without partitions, e.g. the device aggregate, cannot split */
+	if (!vram->num_partitions ||
+	    vram->num_partitions >= XE_VRAM_MAX_PARTITIONS)
+		return NULL;
+
+	if (!size || !IS_ALIGNED(size, XE_TTM_VRAM_MGR_PART_ALIGN))
+		return NULL;
+
+	if (size >= vram->partitions[0].size)
+		return NULL;
+
+	offset = vram->partitions[0].offset;
+	pool = &vram->partitions[vram->num_partitions];
+	*pool = (struct xe_vram_pool) {
+		.region = vram,
+		.offset = offset,
+		.size = size,
+		.purpose = purpose,
+	};
+	vram->partitions[0].offset += size;
+	vram->partitions[0].size -= size;
+	vram->num_partitions++;
+	drm_info(&xe->drm,
+		 "Created %s[%u] VRAM pool[%u]: purpose=%s offset=0x%llx size=0x%llx\n",
+		 stringify_vram_binding(vram->binding), vram->id,
+		 vram->num_partitions - 1,
+		 stringify_vram_pool_purpose(pool->purpose), pool->offset, pool->size);
+
+	return pool;
+}
+
 /**
  * xe_vram_pool_place - Fill in the TTM placement of a pool
  * @pool: the VRAM pool to place in
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 1f15ca456f191..23283cfe5fed7 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -21,6 +21,8 @@ int xe_vram_probe(struct xe_device *xe);
 struct xe_vram_region *xe_vram_region_alloc_device(struct xe_device *xe);
 struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id);
 struct xe_vram_pool *xe_vram_region_default_pool(struct xe_vram_region *vram);
+struct xe_vram_pool *xe_vram_pool_create(struct xe_vram_region *vram,
+					 enum xe_vram_pool_purpose purpose, u64 size);
 int xe_vram_tile_alloc_kernel(struct xe_tile *tile);
 
 void xe_vram_pool_place(const struct xe_vram_pool *pool, struct ttm_place *place);
-- 
2.34.1

