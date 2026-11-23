Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D61606A336
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eMZhYBED;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=XoHqhI8N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3B010EBB7;
	Mon, 23 Nov 2026 09:46:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5145410E7A9
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795427190; x=1826963190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=j7jLI8MEy5CpWaqNXSlLDYj8ooa5zHNY3fLHxXFUbbw=;
 b=eMZhYBEDWcIyMBkhIg6cyzeMHqVGE/vcGweh9/6jANUM8x2y3r/BJGmB
 Zq94isnN7jK3y1AqwluV0R4dmRjgsWiUd5qnAMyQrSeBOkPpEYiaEke0h
 HOkPZA1MCZCHn5mjIL/N8nbHHzIqPqbIvOee6ghYt9c9W/NVqDBiDnsrE
 dU9Fh7v0fLuIUZ7zaHhdYmKVW7dxg5JvxNlca9SDvD1igqqfJ/gxN+esT
 V6oOLzEW6EpNeY6w0wnY1/GRQM3p75QVUFiFWzmz6ZoKDZTR2KAkkXzAH
 WJVRQXYa6G0bclEwD+AtKhNA9mg/EonykVImg0nAFT8hVYH2/i/4/Zj7C w==;
X-CSE-ConnectionGUID: XU+KIWNhTfil0cV7V6EAqw==
X-CSE-MsgGUID: YJbfbUUrRo62k+OmzuSFYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4137893"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4137893"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:46:29 -0800
X-CSE-ConnectionGUID: wE5WgaIWRm63Gd7UhwidRw==
X-CSE-MsgGUID: s8nS5w3sRAmz45MMHhjy3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11271859"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:46:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 01:46:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 01:46:28 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:46:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcrFHjcY6HcA4DJze6RoDJnVWaRea3dOKRo6ujDlLS30I3WSah2wpPFI9HQaPzOQELFvLwfiBh29PgidvCSE1OnUosKxel6l1riTe8oXZ3fM5IVG84aLWxXLm/FBbef4W5hV7FjFoaO6kZJ13kkEy+OrBF7cWsNS0X/CwVMXcISTbAhNOglOiV1t0H8TQu9HnnadT/CK38HtMV7yOw6bwLnkF6g3cyCY88byZtUGRohHEnVJ31siIWYaEJss1v+oNTsSP02H7A9CTyNOfBvG0Vh1pGLsCPQGMNru93N0Sx8jX744+JozUrWoXbsAQh0kIuhAKIOX29jmDqul71kNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0D50xXHZkBKmjFDGW7WciLBFH5qAGT2EXNra1cYeKY=;
 b=fCnpbzXYi+7YG9hEPP1xtZSHKgNWIpt2mk1ybzmtkf+eKjYNGGpMU1WRjn8MOoeV+wujjIgbB/AB/OdPOM65vo7fJAeXFG9ppGrLXH/eEYJ3Uxz+tk5OYb74CwqWfYiq5mLzi7EdslPRLhClIOTU75L7bbZDHSvu1NwkXPVfDvpuiCpIab1wFWx0fW8V+d4GBC0GxTmSZ6Ei/N0ncCDLmoxbkohiE3Oc79vI/blRDgzwGbGF7nl7EP6KTtilCnfbsDbQTpAxyvyK2tHv3WTtUvPU/iYxSZZW9XvQOn1m8fN9ByUqGTpsoZlZeyXygY2UgEPf00NwX1EurnlJreLBFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0D50xXHZkBKmjFDGW7WciLBFH5qAGT2EXNra1cYeKY=;
 b=XoHqhI8NM46ikYpicZ0p+ymxQVoBb3GqMgra5yZ42YhXdvJdttT8ARFshWXlsl1AlJXEWjzr2SLd5I+zwfjYkHP7q8NnCO5sRlQphlPIuZ+eYUvp86qtJ5k18wgG2FxnPTe6MsN1Qhg3qcjsjR8DWrulYVQ+Te8AajxFkyOaHfA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 09:46:24 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 23 Nov 2026
 09:46:24 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 1/2] drm/xe/pf: Extract VFs enabling revert helper
Date: Mon, 23 Nov 2026 10:46:06 +0100
Message-Id: <20261123094607.3300722-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123094607.3300722-1-piotr.piorkowski@intel.com>
References: <20261123094607.3300722-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR05CA0021.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::26) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: b57bf09c-8800-4c4a-57cf-08df4946a301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|18002099003|11063799006|56012099006|261026140227099003|261102123227099003|261028144727099003|261021123027099003|261022075727099003|261021121427099003|261022105027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: kit8ii4hAmMEiFWxPIqJRzePFCYHb4hYA8iB9Hidm2abtbLdJ7hNSw9vEj5QQR37Kih6KHPsxCvX3pwv79dulALRkNSfppHTPBLzehXJxYpCSYNQ/3nPN92JV5wsULDSEzt9xGSTado3NGy652VQDsZoRo3MJCIrNodZiO418hYDriBm82p3LeYCgb2CB0amFeeu+nHns1yCWfWYlaGHTmyB99Ux44L9VHn7+mhSgvZN7a9XtZZYzGfJrQept5XumICLu76pXG/Qc0DKsjA7dqyUD3C+Z6uIgSPsEc4S4HbQ5BsqsJ35v0LW4FTpIKpsdHthoi7nqNG5THGSn7frgOvXgeuGUBoTo7nisSm5kF/kBM+vapXxSrzrTOwCS7mWwJMrxhZWMjdsOXqwpm7UjQXLYPWD24igmvdOOGv7Q5k3EQemrmVXmyQpoSJfBfcWzuD9bzuvj5U40FXSJflGJLt92jMNQPf51m2C282IGK9BFQsp/voU3p61zS7MVO2iDDN4h3jm8f4IFTprJ9V7LpbJUu8VYsKN6f4Bs/jCw2K1BHHbEmgt7OH+STt22AsECyQxncHj3IbZ1yRopi4d/DudOJnyMD4J8D0bPTbXECR2s+QfhGsvmNv1QytnQkGlSSmOFnlSJlzxoRGKGvyJVlEY9gsTCUG464sdYiyZJIo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(261026140227099003)(261102123227099003)(261028144727099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWEwRTRHVk5EOFBzWnBaUmFsRytlODJmeDB2TFlLTGRNaXhOcldaMEZnaXdk?=
 =?utf-8?B?V0RJdDlIY3puVEd4YXZ3Z05ULzRiYzFFcEhPOHhuZ0h5NUJPbDl2T01WMll0?=
 =?utf-8?B?Tk5LdW0zM0RUSGJoM3BEWUVHU3J5OEZtMXhmQmFLa2ZTY1QyR25GZFVFMGY3?=
 =?utf-8?B?TmwycWdod1ZlcU80T3Ivdk4vSHI3K05qcVlnZVI4bUdzK1Q4Qko5SVNjZWVu?=
 =?utf-8?B?NW5BTEJYYlVVU0RFbTU2U2xKeVJuYUdXdXF6MHVJdENrcS9RdTVneFFqdmJL?=
 =?utf-8?B?UWhBeU1tYnJRZEY0NUpUd09zRGZBZnh5UVhaNzFvcGY1ZlJBSkdmK3BVR2Vv?=
 =?utf-8?B?TjBSc0JnUTBuRlJpdWcrQzNuRVROZFY4ajl6NDFib0FBYzFLcElPVExFcm5R?=
 =?utf-8?B?MTBRdWVyVUF6Yk14Vnp2eGRPR1VqaHVBcTRWbEFTWVg4RFNMeTV4NEQxOUtZ?=
 =?utf-8?B?ZGNIdE5PREhRNzJDVVJBMTMzN0NlaEtpYUpSMUpVem1CeVdzbTRSaWcrWXlm?=
 =?utf-8?B?UDduQU9ZRkJQM0llUXJpN2JtTGp2YUNKVW9rY0xBSTltQmMxRkFjK0dtdElv?=
 =?utf-8?B?M3V2Q3dIa0FZTUVzejZmdkNlUlBxcDlsS2F3dkRQeXdVckwxYXpTcVRoTGhF?=
 =?utf-8?B?RGpvMnI3aTNtd2hHUkpvN2NPSDZxdnN0bDZTaXpBV01ZajMxcE5RMFBsQ0g1?=
 =?utf-8?B?M0h3dGtGdXk3bHN2czd2Y2RuN2RtYzdnWTFWWm84SEZxdEpzOU10eHZuendw?=
 =?utf-8?B?QjlJcVNHUDA5K084NTNzR2IrT1FKdm9MTUpHclRGMWVhVy9LUm5FK2F2ZUkz?=
 =?utf-8?B?Sk9VRTgxeHIzaDhDa3p5L0dTRlljTjZveHhLRThaZFdRdmVjMVg1SjlVV0Ri?=
 =?utf-8?B?alV1NExMNlFTR3c0ODJEMHVZRk5KV3RHT0lpTGp2dmpTaFphc1pqbVRWTFpa?=
 =?utf-8?B?czdTdys2VDU4eGdISXNKVndkOGtKbkFxYldJV1BDNDdCN1EzbldrQVRHaFp1?=
 =?utf-8?B?R1BhbFpyeHlxK0hreG91Q2Z6RGpZKzY3NkdpelNuTjkrZmt1NDZCTG1idWpJ?=
 =?utf-8?B?ODRicXB5a2tWMHN2SGxzR1ZDUlhKREc0R1VmeXBrcGdVYTRPTTNmQXVKbkdt?=
 =?utf-8?B?Sm9XMnVVQWpTUHdiUGp4N29wS2dES2xlNEFYc1hwcWdzRHF1KzlQYVcreXc2?=
 =?utf-8?B?WlJGRE9qaS9sM0lxc2d0dkp5M3YzVVpPZEFtemNlSnZRS1NpaW5JQ1JqVEtC?=
 =?utf-8?B?YkpVZlFvcm1DeGRnVWdoT3J4d1MwZkRVcXEzcjNGQkYrSWEyL0JaQ3J2Rlhp?=
 =?utf-8?B?V215WnRhMlRmMkhBVThnT1Fsd0gyQVZQZTh4ZVhpcWdJQzRWSWFEcVByZVpq?=
 =?utf-8?B?a1JaeXFXQm5sM1ZwaTk1aGNPcllTVDFPNkhadG5ieGpzRldaOVFLUGUxSUl0?=
 =?utf-8?B?STF1RTRiZmFqVzdrYlZNd1NrTzVLMWc1RHNZY3NiYUdVdDZSWFJOR3VlNm03?=
 =?utf-8?B?ekd6amR4OXZyOU13MDkvRmFPT2dlS0Z1MVMrVThGU3ZJRy9zYUttVTVsMU14?=
 =?utf-8?B?dlI4WE9PN3pndW5UOUt5UnhHdGovR0NRNVZHdGNkWmU5emUxN00wVWxCYjF5?=
 =?utf-8?B?TlFmOVpOMXNZUzVMcWtadzd4QzFVYnNGall0V1NOS2NBdGRZYjdta2U5SmY2?=
 =?utf-8?B?WmRVVStxY1dEcDdmbWZBdCs3bkJGQlhucE5pU0hiK1htZDZqMkhpLzFoM3pu?=
 =?utf-8?B?aVNjc2g2YWJLRWJDL0hHak1qSExMMlB3dUE5YlUzU2lKNE91RDJmNG9lOFJp?=
 =?utf-8?B?MEt5enVkcThuUC9NUDFodFViMGNRYzRsTWRaQ2ZNV2pKaGhSbVVFTDNzS1ZG?=
 =?utf-8?B?cEFZVWtUT1NyS3B0STI2WjFEclZ0Q1BpWk1QMEUwMmhjQmt6bGwzcHhWMDUz?=
 =?utf-8?B?WHNlTlpObEp0USsrY05TT1FoTnd1TnZWcTgyT2tQQms1LzZJSEhzaEkrRWlW?=
 =?utf-8?B?UVN1L3QrbStMR0lCN1VLTE9GVE1kS09JeWcweWIwZ2o1U3BCZ0dhaFpyT1Qz?=
 =?utf-8?B?bzZxcnJUQzFITXFZanNVa29JQTRiK0ZtZ2tjcStGYzJtY3J6V2FUMWdxRnVD?=
 =?utf-8?B?RjBzWFZyeS8ycDhLdjhyVFBMc1hRcHVmZ0dBam1PL3JpZnc1ZWdJV3NaZFUr?=
 =?utf-8?B?bzBYNXJqNmRJby9BRGloQnJ2YllnRzNSNWI2UlYyVjNpSWR2NEp3bHpHZHRt?=
 =?utf-8?B?VHBsZmd3SCsvZWRiZmtzMjBneFhmZFJnak5waWNJTkhWNFdnYlJYVGZmZzNG?=
 =?utf-8?B?Y3RxSTVXbTN2Y3R1Yms1UmlVMU9HWG52WCtObnh6U3Z5RDNrWVN0Zi93cUlT?=
 =?utf-8?Q?JoVGzyl9UogU/qfc=3D?=
X-Exchange-RoutingPolicyChecked: AWbjiEuKNJ2trVZ2AejqslKJ04sJ5VFWbfGkJ2dutLzA5yM1hxUZDPII0T8NaOfdRIS3nowGzgDXpc2DlMlirsRKkwjSBNOdwqxYbIqzlnyQeaqo1TsazNHd4DJn7cXy/q7VGmpGgTgkXjlLyoJ4VCIxA8Vy3mKrfru7+ZXytPDufFRAbzXxPWnofRx2iFe/9warXkuV3t65oGmLPXQ3ud+m8uIAM890LnR0ew8H0KsiCHNwaaWAOe8vN5BdOceJuYBYVA4SoIQbonVTT1Q9FjfhtfhgraA+7jaqGpFPh1OgAfC1Gostc83I4rX8+OBGTzPRJDTqbz+ONfWVVdh3TQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b57bf09c-8800-4c4a-57cf-08df4946a301
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:46:24.2423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtuPStfgB+RlieNLMBieMm2u5OVq0L4EWMX1OtmXdWCb4jj8hJ1fTqzLPqk8LKShfwd06xiqz3cGvmJkNozvhFP9JUZ7F/u0/aMLB2SYBXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Both the error path of the pf_enable_vfs() and the pf_disable_vfs()
are releasing the same set of resources acquired during VFs enabling:
VF VRAM BAR size, VFs provisioning, extra runtime PM reference and
the VFs enabling guard. Extract this common code into a helper.

Note that in pf_disable_vfs() the VF VRAM BAR will now be resized
back after the PF reprovisioning and VFs reset, but since at this
point the VFs are already disabled, this should not matter.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 31abcee55211..6c839eff0db8 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -125,6 +125,18 @@ static void pf_finish_vfs_enabling(struct xe_device *xe)
 	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, false, NULL);
 }
 
+static void pf_enable_vfs_revert(struct xe_device *xe, int num_vfs)
+{
+	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
+
+	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
+
+	/* Release additional PM reference obtained in pf_enable_vfs() */
+	xe_pm_runtime_put(xe);
+
+	pf_finish_vfs_enabling(xe);
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -151,7 +163,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	 * With PF being in D0 state, all VFs will also behave as in D0 state.
 	 * This will also keep GuC alive with all VFs' configurations.
 	 *
-	 * We will release this additional PM reference in pf_disable_vfs().
+	 * We will release this additional PM reference in pf_enable_vfs_revert().
 	 */
 	xe_pm_runtime_get_noresume(xe);
 
@@ -177,10 +189,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	return num_vfs;
 
 failed:
-	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
-	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
-	xe_pm_runtime_put(xe);
-	pf_finish_vfs_enabling(xe);
+	pf_enable_vfs_revert(xe, num_vfs);
 out:
 	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
 			num_vfs, str_plural(num_vfs), ERR_PTR(err));
@@ -205,18 +214,11 @@ static int pf_disable_vfs(struct xe_device *xe)
 
 	pci_disable_sriov(pdev);
 
-	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
-
 	xe_sriov_pf_reprovision_default(xe);
 
 	pf_reset_vfs(xe, num_vfs);
 
-	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
-
-	/* not needed anymore - see pf_enable_vfs() */
-	xe_pm_runtime_put(xe);
-
-	pf_finish_vfs_enabling(xe);
+	pf_enable_vfs_revert(xe, num_vfs);
 
 	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
 	return 0;
-- 
2.34.1

