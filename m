Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1100606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 06:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UjRKZMjb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A304B10E529;
	Fri, 23 Oct 2026 06:24:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC30810E54A
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 06:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792736681; x=1824272681;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NBYmEMcLMPryT4uWBBy9+f1GZzzQHuLANQbE951KkU4=;
 b=UjRKZMjbfNK2b4gXIv/JtAPqJV+IpAsI5MX7YCbiErYBb9c+EWJPmb05
 oJxWcz+5J8tLBrj6ID5bP3jE+Ht1uYsjVVdcze7Qs9WV1Z2IZWMmpl5aZ
 JEFjvm1dpAKH2jhD9fEgJtuS76Jdd5/RNnVY8FoauMab6+WdxfVyuuZjx
 6g1y+CvK5xULLU3cZDWnwMYbWvQnhn8MFaCyWSrOcRdYscMnR/fx1wnZH
 q9QDpEEFcvD+oZ1ob8SPCYUV1Ff5l3PVp2pjWVFP+hZTK4nVhamljpJAq
 a5fog/xDMvrjTQE8NuIqXbbIhh+J/nFuOQA4dnjbbE1jj5n3GUomcam49 A==;
X-CSE-ConnectionGUID: R5+KDzmiTAe1rc7jmPBvDQ==
X-CSE-MsgGUID: eNgbm9MZTkmW+Vh3ET8iZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1375255"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1375255"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 23:24:41 -0700
X-CSE-ConnectionGUID: gPXGciOVQKCThA//VyW7Kw==
X-CSE-MsgGUID: UwiJk1NKQrOutZFFjtT5jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3936395"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 23:24:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 23:24:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 23:24:37 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 23:24:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODd0RcrGq0RAUTzCav+K5/2v0pT85eDrlejjRM1YNqojEJ1CQZA5K0Y/U9sbFw4hlHE0FPNMNRZV+LxWlfMHg46pUz7Q2CMCKlzbPBtewUs0oNTiuh7w9aBS9rmZdEudBUko2mYD5bbT8iwC1RUoh08J9DTx+cAAPFBzVV0Luapl5cDXIolcw6hr6VDsNxkvbL41FMFjy8bkUDE6y7jnyq1R36kdx1QMK9cVurHWbdNEBAOu+AhWyf5j+ibzeT1WN6fid9IVxXO5D4TFfAeUUxsHhzKE06XDmunqujgDFWfB8BpKL9/rNO3Hz41VEJHJWg1b6GFIqY8blxCRxXtCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PuN9CfDyJVCq3LKZwPfQBjN2c2MVXFe3bNfA0Q9EEA=;
 b=hk7rx23A3jPqAmv0ebahkIcgWVc4nEAV9Q0DmUcOj9wDdwKVgV4/C0buONc0eIM9nt2kNGYwuwnMqpTytiieYc78P6lt1fmF6HXuZq+y8ZAgjBandr5fUm63ykC1WTmABVcFLGXIQjGg6SOiqLafgWOr7OJykvuXun4Iqu38mlS1aPA5j5FjneoKXF752vNPTeA8vNKWlh0KqgcP7NUdfmn4GuonCcR9EelTy/4rakunbYG5n02KC/6zYaEopFbcj2AYEDpmTEqhjbxTZkcFoK256ls1I4bDNIIAPWHExBWYd1lsrjc+KEIq9CW0/Ms8cH9SgY4A8xI82LaNY9dwsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA4PR11MB9203.namprd11.prod.outlook.com (2603:10b6:208:55d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 06:24:28 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 06:24:28 +0000
Message-ID: <5fde7140-0251-4c9d-9acd-ebe720a36ed4@intel.com>
Date: Fri, 23 Oct 2026 11:54:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] drm/xe/xe_ras: Report core compute errors using
 SIGID
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-23-badal.nilawar@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261023043422.681260-23-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0160.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA4PR11MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f42155-b59e-4cfd-9cc6-08df30ce4a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|261022105027099003|11063799006|4143699003|261021121427099003|261009221227099003|261021123027099003|10067099003|261009223027099003|56012099006|261022113327099003;
X-Microsoft-Antispam-Message-Info: QFIlY52Vz77ECK4XGwUWp5ogIElJFNCfIzlDTmkMsllF89iaRJFGXOyuUsXqkhjllbSzD03De3TghKnBH+RjQzFi09PQooJhyU0yg0JjVAj3FWBUscB7VL9X+SuyYqYYdwi0LifN8c2bZCaBSL7EowrlTkDjOpMV+Pc14rnVOFo6Q/Lch5OMIU1JMMIM4JukiDwFcNgohjnGTkDf2gmCQTVv8aYlmEqmFDKAxRvZn/c0k2dDne+r2qJ7Z/R1/7X9Q8E1z/Lytx0wezzxtyHmIMeQej3wnJqMcRB7KHIR/K3xdjr2g19HLujDI5RKm2VH19JIlQtNysxc7AVuhszLiE2Uq/ZbwIzs/varzI6c+GMpZzHuAjxsUUAb7ZSCcqfQCygfE2232afWo0FZ445yGqvmr5PXbyvVp/qKXVJawcDkjjydMzy/E4tkovsUibTYPemQqh2C5QRxAGJIabTbHy3QtiKOKJ9wmSUKiuopU5gR+vB7Rn0srzKwQZWFL33Vg6Cgg31fpofyPJUKyh1Vc09kDK4eK6/VPdg3wpwNJgVFvTCOUfOyWnnwaiqiO+6FRfmi4ollnCWc4DBtBEWTUtQnTR0c2NWj9YzZTvSi/62qt7YOY/ifROdsHM8pnmB1hgQjAbu2PJuKb4GXXnh1JxXlZQaHIm1W/dHNgSaWXDQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(261022105027099003)(11063799006)(4143699003)(261021121427099003)(261009221227099003)(261021123027099003)(10067099003)(261009223027099003)(56012099006)(261022113327099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVpnQlpqQmNuZGRpV2EvekU3Slp1VEVSYmw4Q3JMQ21JUTkyTzFGcHRRNitz?=
 =?utf-8?B?WGsySlNPc0Frd1dkdkR5WXR0RitrOGlUWVJtL3M5ellKVTg1Z3BhZ0hHR2Va?=
 =?utf-8?B?cCt4MFk4bWh1QnFOcm9tVUE0VlQ4SXFUZmFycVFrYVVQYWdZclBiTGZZSlBM?=
 =?utf-8?B?VlpDejdvbHBOVitNNjdjL050Tm41OUNHTEllYTdmS2daU1FHYzFqWndUN2xo?=
 =?utf-8?B?ZkhJeTM2SWxyNHdRYkFKREsvRnJqcW1pL3JHZ2hlbjJCMHpHT3AzaStHYzEx?=
 =?utf-8?B?djdObXNyMTcyYnptMkVKOWwyRFV3ZFJpRVJ1VjZ6RlphSUxCd2lDQ1hkVG8v?=
 =?utf-8?B?ZFJzdVhpRWY0ZmhrV1RIY01MbGRCWnJQRDk2bGhBT2dZWXVEbzVQUnVrekxU?=
 =?utf-8?B?MWcxL3k4UDRZVDZPS2FrajJndE9tTnVTWndvOWxpYno2cnBiUTNrSVFMcnlp?=
 =?utf-8?B?dXYyVy84WFRGcVFuTTBoajNaR2R0OUVGRVcxdVJWOEJidzNpUWxLU1E5QU1T?=
 =?utf-8?B?UHJNZkR4YkpCUlc2L29vZ3h2VG1CaXJlN0ZZV1FnZjFWVWQvMzZQMzdncTFX?=
 =?utf-8?B?SkozWnRtWVpJSGJHa25EeHQrYnp5SEtXc3VoU1FhWVRrVVVPMW5RMlMzdEl2?=
 =?utf-8?B?aENaYVVDOE8raFR2Yy85b1NTNGhhRHZhYTdaSDZ3czM4Rkd2OXFDNjJPWERL?=
 =?utf-8?B?aVBndXhnZFNxU1ptZVlvTFQxaWwzQUtuZFJQYy9leGcvRERlVys4K2N2TVQ5?=
 =?utf-8?B?dUFNaUN0UWJVdGM1T3lnMHpPWHphMk5uUWtMbFZGVXJmR05KY2JJN0ExZTFn?=
 =?utf-8?B?aWJIVjV5VXRqcFY1NnFab2dhSys0TFdJU0V0R1MzOE51TzJ0dUdPcEJteGEy?=
 =?utf-8?B?ODVWOGpMZjV6VWhqa0J6dzNxRytvRUJXYzI5WkVFWE5QaW1LVFpBZUhMSU1i?=
 =?utf-8?B?NTVJY1ZQUDh6dkVKWEM0QnlrRWtqQ0hlYy9qM1FKQW16UE9NYnhCZDA5SGx6?=
 =?utf-8?B?SldCNDc5YmxKZHZDZy90SFRybDdtK1NqSlN5VTg1RFZZZzVDZUVQN3JJelVt?=
 =?utf-8?B?bEJMYU9LYzBGRyswNmJsUEtFazBvdUhSMTdjUW9RZmdxd094K0l0UXJYUm8x?=
 =?utf-8?B?Rm9uY0FYWmpjTEN3cEFpTVM3cTI2YnY1WHBYb1VmSlU0Uk5rZ2pKOUhwZitZ?=
 =?utf-8?B?eHVtTzVweXdTWXlHOG11S2ZmSlNDeU9Jb3RTVDRvQ2pkN25BK25IblhBMXBs?=
 =?utf-8?B?bVFEMURtSTBsUC96bjJGT2E0Z3AwSGt3dlF5VkVscC9hb0F3V1VLdTN5aFY0?=
 =?utf-8?B?MWp6VE5QQTZuQjRYSDdoVVZvV3FFUVE1VDhrTVdsamdhd0pVK1RVQXFiVUEz?=
 =?utf-8?B?YmEyMWQ3QklMMWhDbWF6V0xRblp0SEtrUndNUXJUY3JNQ0tOdGd3YVFodE9N?=
 =?utf-8?B?UEhabEN6aS9KMmNHb3lTU1NQZ211Z1MvUGphTlVpNzE0QWdnR3NkZ1NrWVZx?=
 =?utf-8?B?V1JmaFRUZUwrQytSVE1nRTdJZ093eTh4TlFMZmJNR2twYSszMUd5cVVYbTdR?=
 =?utf-8?B?QkxMMFZVRENMbnJjK20raFpSRklubDFkWnVTblppZW5pcE9sWkI3U2lZckxT?=
 =?utf-8?B?dEVaNTNkM1Z5elZkZmFsL1FRajVsdTg0NG9USUpnNVlndHh5NiswVjM1SWZo?=
 =?utf-8?B?d1VGdXJJY0N3d3ZTVzBJa1AwbGpKUkppTVk0eEpWeXpXWkV6aGFpZjJZR1U0?=
 =?utf-8?B?Rk8vWnNDTzNwcHJrMDJnM1paNlpjdW9pN3BqcWpYSUFDaHFJNGtTQkJ3dElC?=
 =?utf-8?B?MTVYR0ZEMWlCK0ZJTVVnVTkrYVpleEkwSTRUVWZodDBicEdoOHcveGdXZU4w?=
 =?utf-8?B?c1RobGpUTThXMHliRzRsRFh3SEMyMmgyNDRwU1daT3pjMTRzSCtzUEMxbHIy?=
 =?utf-8?B?V0JmWHU0YnVkMFNpOENUeFJTT21VcDByd3N2dldYMzJmS3NPdzFJMStiUnBR?=
 =?utf-8?B?RG1IbExod2VlSFozQU9ja25SSFE5MlNiWFZuVnAyaWxLU014MTRVbnZONDlw?=
 =?utf-8?B?T2VoaDNTMnJRYldXenRhUlJzQzlzSFVKTlRERG1ORmdpR1JUcWZCcytCVmxS?=
 =?utf-8?B?Nk9DOFVXcXhTbkJSbzE3ODlyaU9jc05MWWtVUkRRM2trUUNxam5YU21JLzVk?=
 =?utf-8?B?bldKRnFwM0tsOUtTdk1QWjU1R203NEhYOU5DSTlsZTNjSEdlamtOdktpUEZs?=
 =?utf-8?B?M1gwaHA2ZG9xczc3aFVFS3NGTkVnSjN2dE5wUEs1L2huN1ZtU1dmODBhWXdh?=
 =?utf-8?B?Y3hweXhXNVZCOVhZTjh2a043YVFXdGJubjVHVzhJK2dlMlBnQjB5eWFmWkpt?=
 =?utf-8?Q?KJA9jG8+fTS4ucfQ=3D?=
X-Exchange-RoutingPolicyChecked: A7692w91SgRhHuXp1wWhSxYrEIkEyGfzYMPAIjuaS4TIM5EiRsSKS7xog9Nt7Xoru3rPB/JSbdGSlmGd09TUcm2FEHhw8svw1un5HI2EcPF0notjKxLyv5fxpJ6fWYpDfDud1GgubztmpKAXDP0TPSpwn8LeXFkX3Upk50WhhXpLnjuJgzoKJhVU/fon/qEybvB8D0qhT5dc8VA+uPWsI/ruciZO/Zw8p1RNI4Mta+urT5WFkvgk+MidEoHgaLAYhobHtnOsShKi334zulREp93nQLMYzN17XQWjUEAL6iHr4xD/oTbUpn+hAJGrkMKJj89nWX2Ahzvhn0sBcO6eUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f42155-b59e-4cfd-9cc6-08df30ce4a74
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:24:28.3820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIWm+6LZjkxNCUkCqOPGFlMeLEAsrc+MRC15Z/psvON8s4MvrECwVh5h1H8Trq/K/Y7Myj5IROMrNMWfKr5uUY8oZX5m9vplfRu3Q8UyjM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9203
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


On 23-10-2026 10:04 am, Badal Nilawar wrote:
> Use xe_log_* helpers to report core compute errors.
>
> Example:
> 	xe 0000:03:00.0: [drm] *ERROR* SIGID=203 (02020012000a000200000800)
> [Hardware Error]: CORE_COMPUTE: Uncorrectable error detected, type 2
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v5:
>    - Print uncorr error type in sig id log (Riana)
> v2:
>    - Pass RAS firmware reported severity to xe_log
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 5ebfc6e8dfc7..1f94dd1fb91b 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -577,13 +577,17 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
>   	xe_drm_ras_event(xe, drm_component, drm_severity, value);
>   }
>   
> -static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
> +static u8 handle_core_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>   {
>   	struct xe_ras_compute_error *error_info = (void *)arr->details;
> +	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
>   	u8 uncorr_type;
>   
>   	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
>   
> +	xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
> +		    "Uncorrectable error detected, type %u\n", uncorr_type);
> +
>   	/* Request a reset if error is global */
>   	if (uncorr_type == GLOBAL_UNCORR_ERROR)
>   		return XE_RAS_RECOVERY_ACTION_RESET;
> @@ -867,7 +871,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   
>   			switch (component) {
>   			case XE_RAS_COMP_CORE_COMPUTE:
> -				action = handle_core_compute_errors(arr);
> +				action = handle_core_compute_errors(xe, arr);
>   				break;
>   			case XE_RAS_COMP_SOC_INTERNAL:
>   				action = handle_soc_internal_errors(xe, arr);
