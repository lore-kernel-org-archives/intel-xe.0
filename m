Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B67606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PHICSDBe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4123810F3D3;
	Tue, 20 Oct 2026 08:43:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4615310F3DF
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 08:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792485817; x=1824021817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dH6XdObq8iS2MNmASb93h11jL23a9PfDjjmLMd6E+5g=;
 b=PHICSDBe0fP7n4Td0xB/Gx8qOPEbrA4Bm22OEjc8mYm9y5/ZEBhV6Tgu
 zYOPNZDiOzAMNDo3fxPkDjpWHItEmCFRG86ZhOKMTAeZiNJx2SB0b5z3G
 nu/O3q17oorfd2ryTixg7Sp2H5ftDKkWtboQuxWpfQwI9YO00dXJIpM9u
 P4Mi1d4giM5SlP41p9LvCbIo7QEwCJ8c/caYxU5RrIp+Wzo/4DpzS8A0o
 VOcUJEZ9Ue2QkCivPZvZAvMRzlkXflDMk11S/Q+1rWHb1VoDDx8HVFKP5
 Z8AIcurwu2CGmjmWOFcDhbiXOlvqpkScNgrw9ErOlzcwxaCHrfZbzbPJf A==;
X-CSE-ConnectionGUID: TTBu0I08Tb2IKCh3nERqWg==
X-CSE-MsgGUID: EzckclLQRYyYlyUeEG1tLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1072129"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1072129"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:37 -0700
X-CSE-ConnectionGUID: A8YG05gnSlCjb8i2kdPuUA==
X-CSE-MsgGUID: hfghpuHkS5GG2I5wkwtiDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3221604"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 01:43:31 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoXR/LogI3SqPQNppF1SdoYHSeKN+ZSoxRls+1g83r5/IQ1X1qK/LPW5KlKK7gSunHa/17bHLO8M1KZ7VpTR2Gfo01tX6pYY6nO7Q/YQte9MgFvRY7ZOOav8EJsBxAZANj9XoJ1uy8eReRZr/Z9WwtuGReM7VIu1b5mZO+niUSt/qi4doZaXHmb4U0CvjGPVAJ74Ljl78PiLPdQPg/7pHKLGt1zsok+RfgiWUi9tUpg4p+HUVbdxUEAPxz4Rc+Q0QnB/cRWHlREXC/lwD7EjxBk5QJxz7e2K+Vdz0GM7CQXETd1iLU7kLOZp0e/hziUvD8Hhx0pwWzYQ9TAa4CwMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pC7f0L+zrbY8WoSWCKCmL0RILCkyQlosanTe0vpVV00=;
 b=Q4E5yxxO8xBW7Oiia4WRBqugt87+Xbl0/Xq+OUR7v4LRiyjck7ZN4dsWPdYfORm/5saUE/ywq53ibWpAQpWu137QnTbM/8gqye5sno90vYLAMnefqIurZXKNuvP6iRWOFUXZs/u76nRKoIaqJ1PjJYYIVmfBGO/nLDQlR2FQVZZruNWTGF2yOyF6u80f6/8n1ZzoI9kadoEr0pamtuB6/55Yu7kD6kQQaUPvgT49y9yOmMnStq5cAug5QIP1e/uIFUTPpxMth/+8taIvp2a0eOOEpR7HO30UW1MsHnjxVVQgKyfHG0hDSFNwgeN7jYnha3XKBfTw7wjO9v+1Z1CRbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSWPR11MB9581.namprd11.prod.outlook.com (2603:10b6:8:36e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 08:43:29 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 08:43:29 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 6/7] drm/xe/kunit: Test partitioned VRAM manager
Date: Tue, 20 Oct 2026 10:42:57 +0200
Message-ID: <20261020084258.443645-7-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020084258.443645-1-piotr.piorkowski@intel.com>
References: <20261020084258.443645-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P251CA0020.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::22) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSWPR11MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea08d6c-ca07-4d01-c231-08df2e863714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JF2B4pBq6WeQ1+Y0g7VcNpBjchiUoXTMYL2FePJAh6Hd48oNzSe1NVsLOewJWZpbU0Db15xz0fUPOzemrd3NGfHbULEvl/BVGopHFejZTEyW2wCmsbdoMKqN7TVRjnLAAV4Bd2RJ2SZbjIteTaplB6KHu2fGw0eY4TZ0F1yNnWphXsVYjhXilPXRfRL+94amPsufpI1Z7GiZVR7k4Nh6jodi8MqaO+0ntpE+v0PjgiIe11VZfd2D3yD/011j6CsB32coXooLw1YIQ02sfggaoV+omXl1GiqpcJVhGMgKNBxU/QUBoVFi2V4nH2+WdXplMbg5kDwSs9JyVAT4Qm2c8pdvJcCWPf2/aVzb6dB/PtTuB+k5Pt+nBZdtDum6HJI5NQXX6Lz8f0l63yyUSssd7nuRxo8L5Lk7RsDvSvGLIDuB1Nspk835xAXiZgTv88EqLH2xscvO550VIjcXdrNTqIijkJb7d5zLNBmkN9bdM+JI9BZj45QM1Fx9TyDRyvT+WYHIQF1DT1neS5xlIr0tDF2e2ZIKRW62pJhPZ+I0bFBQciwm4jZXY9Bqh2GChpjXjjDCokhTPpbeSFPVQjma86fO5ZHVmWb6KYNfQOKRWfps3DijPPL1z3w0LzwVy4m9D69uBQ6zpgtLEAvni9AIPVk85JcrZFUNNxELMomI1oQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTRHVkkyNHB2Q242UEprTUZVQkNwZ2trTExkbW95RUZ3MEdZbVdYTDAwSHIv?=
 =?utf-8?B?dzc4LzhKTG5Pdmt1QTg0ZUgwdWF5QUJIMlpCVG1LckI4Y2xzbm1YUjcrUWxL?=
 =?utf-8?B?TEZyYkdxUEhnMFZ1RFdkUFlYWlBMSGhUVlRtT25zMUVXK2lIa3BMYll3QjA3?=
 =?utf-8?B?bkd6Q3l4UFhtNVJQRGJORzQzay9hVzBrUDdKUXZZbS9iem9qcGNHV0JWR1hR?=
 =?utf-8?B?WE1hTWxraUV0MmJvV0VKRkxXdTFBTE9vaHhoYmRWY1hUM3MyWEZER3N2Ym1y?=
 =?utf-8?B?UHROTHhwWUVBUER6eERUa3R2VUU0N3FteWg5WGZLL3Rsb1AxS2JHaGlWQUZs?=
 =?utf-8?B?RkJud2JZZEVKYnJpWGFWeHBOUS9Jam9vYU9jdnF4Um1yaVdROFJBcEZHd2lH?=
 =?utf-8?B?dnBiWlVJUWVJU3g3RmMxUWsvY2pUalpCMW8zb0p6bUcwWisrQktSbnVUcWgx?=
 =?utf-8?B?VWxVNWhmbTFIQzd0WVFxamJFMTB4aGJXMDF3bmUzL1lrVjFoaXFOS3ZoY3hp?=
 =?utf-8?B?V1QwaWdVOENBSHZvTnZYZE5aQkhDcGcxTXF1Q3laa0VDZXJ4bjJrQ2gwcTR4?=
 =?utf-8?B?M0FYcm4wdXhKOTI1R2QzTXFSWnpIOWYvODRvc21URmpTN1ZlRWtNeXNGdnRQ?=
 =?utf-8?B?QVlPRjJsRjFSbDVOK3NHM0hHTXlpRUtUVVkxS1VMbGF6ZVc4c1Fpc1ZZbldW?=
 =?utf-8?B?T1BGcEg3SDVmYVlHcHpDdmtaR2txMHNMMi9lYlNlQk1nYnVsemhTT0VvQzV1?=
 =?utf-8?B?UXovcEhYUExMOWZ6U040aUFCbnpzVXdLNU9idUdtSVphVmN6UzRVbnQrblcy?=
 =?utf-8?B?RkhEM2Q4TWZVNDY2T3FOOExsMlNudlloMlRDeDNJeEF0cmk4Q1d6S1RJV290?=
 =?utf-8?B?Q0JUZ3l2NXZmYzV0d3NpNnFyZ0sxYmtkSU1NbzZlSnoxbUNYbWZ4ZDFVTFpu?=
 =?utf-8?B?eld2ZnNwZUlNaVlhYzNzQlZaYUhXNC80RlduNCtjY0dwY3pGd0ZLQnlKVnMw?=
 =?utf-8?B?SEkwUDFSM2ZZeUtSM081M1doVjRad2UzaXVMQkhoNlRKSkFwditEZ0VnaHNw?=
 =?utf-8?B?V0xsWW9YZDhXNEZCUFFjbFhrcmExNExkV3lMeGdGcGdHekMxNFcxeWcwK2J3?=
 =?utf-8?B?Z3djMGt0Qjc4UFgrQ0E1eDlFVXBmMlo5aHh2SXNPdUNyRlBuamwvNWwrNjlu?=
 =?utf-8?B?VEdwZ0lxUGRoSzMyTlcwSGZtMFp3alFTM0IyeVlhQkZSYk5OakJCdDVZRFl2?=
 =?utf-8?B?SnV4Z2VpYkE5RW4xQnk4Rm9yMnJVSXo1VDZZY2lDNXpiZWxSWnNPazZpZ0dK?=
 =?utf-8?B?bFMwWXZvMVlJVS9PY216TjV0TTh4Y3FuR1VpM0xnV1d0ek1VQWNvM1lsR1pE?=
 =?utf-8?B?WVNVOExSa0NsaGZWNENVQm1pZzlGcEVTQzcxNElRNFdORTAvck9VVTE4cjBX?=
 =?utf-8?B?Rkp2YUpFRFdOYmtyMU95dC8wYVJPTkI4R2VEeFNSbmc4ckZ4aC95b3Q0eVg0?=
 =?utf-8?B?NDJUbVI4UEZCanRIS2ZvQ1UyblJyN2VjdkIzYVRHcjN1WWFYQ0lyTzIrMitB?=
 =?utf-8?B?L1lOSVp6dHRoeUIwZVNqOVVjNFBCWHo3SUxueC82bW9WZDU2VEJjdWFWb2Q3?=
 =?utf-8?B?V3l1c3A1SU1ONEZaTDhkdE9DYkpiaEFRVVJVUDJBWEMrZk1LK05OQWJpOUlz?=
 =?utf-8?B?NVBXR09wTmtFV1RTdzY1Wkt0RGV3b0xCcEpMY3lXSWFHelNmOWRoN2JSK1h6?=
 =?utf-8?B?eEd0Y2NuWDhvK0JTVlJvMmxqUHlza0FEcUR6ZUtlVUhtUENjeVdXbGdGQ1RJ?=
 =?utf-8?B?VHFSUmFtYzJQUVRBQnJ6L3VRalgvWFRiN1Zibks3TWhTeHNLVFhOMkg2WnpQ?=
 =?utf-8?B?b0ZHanZhdVpMa2ZlVlJYVG1IL01sME8wNGx0ZEUweHoxSGZTSG1kN0huK1k1?=
 =?utf-8?B?VCs0Q2swK0NzR3RCLy8xSk9ZU2JXTGcwUEwyS09KTVlIZE8yQTljWFV2bVIw?=
 =?utf-8?B?ZndMSkMyeC9BR0RKY1pNRE1MOHZmNFJmNVBDdFVqMEZCZyttNWxyYVRpSG5j?=
 =?utf-8?B?RWJXdnhodDYrNzFMNWpXYUp3VUhOMHdPa1VENHljbGZsaGJIakE0S3VJbjA1?=
 =?utf-8?B?SGhxV2dOS0ZvNWMxUzhQN3kyT0xIcE95bjZjcGtaMUVCZ0Rkb2FXbjZZRDVo?=
 =?utf-8?B?Vkt0RUdsQ0hWd3J5M1VDeHlsTTNSM3RXdTY3M3NoOWc0RWJvNUdRY2U5aXcx?=
 =?utf-8?B?SmNodDIyZFk1RDBOU1p6Z0xFT0YrekR3V3p0d2FOZkVjWC9Pajk4VHVLZmtJ?=
 =?utf-8?B?cVlwcGZhcWg1TkhtT1hiZDkwSmYrQkcyMFZTVXBYaEthTStITW9ELzIzc0E1?=
 =?utf-8?Q?WOI1BHwWBtFHXRYA=3D?=
X-Exchange-RoutingPolicyChecked: WQkZMvFy0Ns2eLTLI2g1gzivkshZN5GoQF9eoopocBAiIF3LWw7z1BFY2ijAXUuno5r30/Y4EXHstynz3oUiyqvIQ6qo/Ls90CDkR3NTzSPv8eHfM38B1zbMzVEZiJG4eT4X9dttroDOVEp7eh5WR+NeobCdN7cv3nx6mYSO9FH8/OR+EDrq9cuHU/BXkx3DVdT5vDKbNGr955iEoRLa9x/sYpGzTeFZj3vmBBvUzsuXtsaMo1NqDOKXzrDTF0QpWIOjT3VPakfcuk6+okHXzcQMnG4w4lrdzdIBh+pSqJUg1GuIKR+ymJWaV5X4dCwudJGr6Q757YrLJ4tzyeNhUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea08d6c-ca07-4d01-c231-08df2e863714
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:43:29.5282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1o9pGzfz6ZHdgAkU50T1azwwr+fvsCT7Tin5N1GdgphF3qezw0uiWa+Rjsnvmt1x4wvmCLgpWpTn8qpXGv9tUWy+WYXswM6TsuPx8EZEq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9581
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
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Exercise partition selection and address lookup, plus pool usage and
CPU-visible memory accounting across partitions.

Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c | 147 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |   4 +
 2 files changed, 151 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
new file mode 100644
index 0000000000000..1ad3186e6d5be
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_vram_types.h"
+
+/* The layout xe_ttm_vram_mgr_init() derives from the pools of a region */
+static struct xe_ttm_vram_mgr *split_mgr(struct kunit *test, u64 kernel_size, u64 size)
+{
+	struct xe_ttm_vram_mgr *mgr;
+	struct xe_vram_pool *pools;
+
+	mgr = kunit_kzalloc(test, sizeof(*mgr), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, mgr);
+	pools = kunit_kcalloc(test, 2, sizeof(*pools), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pools);
+
+	pools[0].offset = 0;
+	pools[0].size = kernel_size;
+	pools[0].purpose = XE_VRAM_POOL_KERNEL;
+	pools[1].offset = kernel_size;
+	pools[1].size = size - kernel_size;
+	pools[1].purpose = XE_VRAM_POOL_GENERAL;
+	mgr->parts[0].pool = &pools[0];
+	mgr->parts[1].pool = &pools[1];
+	mgr->num_parts = 2;
+
+	return mgr;
+}
+
+static void select_part(struct kunit *test)
+{
+	struct xe_ttm_vram_mgr *mgr = split_mgr(test, SZ_128M, SZ_1G);
+	struct xe_ttm_vram_mgr_part *part;
+	bool exact = false;
+
+	/* The ranges a pool resolves to cover a whole partition */
+	part = xe_ttm_vram_mgr_select_part(mgr, 0, SZ_128M, &exact);
+	KUNIT_EXPECT_PTR_EQ(test, part, &mgr->parts[0]);
+	KUNIT_EXPECT_TRUE(test, exact);
+
+	part = xe_ttm_vram_mgr_select_part(mgr, SZ_128M, SZ_1G, &exact);
+	KUNIT_EXPECT_PTR_EQ(test, part, &mgr->parts[1]);
+	KUNIT_EXPECT_TRUE(test, exact);
+
+	/* A narrower range still resolves, but needs a range allocation */
+	part = xe_ttm_vram_mgr_select_part(mgr, SZ_256M, SZ_512M, &exact);
+	KUNIT_EXPECT_PTR_EQ(test, part, &mgr->parts[1]);
+	KUNIT_EXPECT_FALSE(test, exact);
+
+	/* Partitions are a hard split */
+	part = xe_ttm_vram_mgr_select_part(mgr, 0, SZ_256M, &exact);
+	KUNIT_EXPECT_NULL(test, part);
+	part = xe_ttm_vram_mgr_select_part(mgr, 0, SZ_2G, &exact);
+	KUNIT_EXPECT_NULL(test, part);
+}
+
+static void addr_to_part(struct kunit *test)
+{
+	struct xe_ttm_vram_mgr *mgr = split_mgr(test, SZ_128M, SZ_1G);
+
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, 0), &mgr->parts[0]);
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_128M - PAGE_SIZE),
+			    &mgr->parts[0]);
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_128M), &mgr->parts[1]);
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_1G - PAGE_SIZE),
+			    &mgr->parts[1]);
+	KUNIT_EXPECT_NULL(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_1G));
+}
+
+static void general_pool_usage(struct kunit *test)
+{
+	struct xe_ttm_vram_mgr *mgr = split_mgr(test, SZ_128M, SZ_1G);
+	LIST_HEAD(kernel_blocks);
+	LIST_HEAD(general_blocks);
+	u64 kernel_visible = 0;
+	u64 general_visible = 0;
+	u64 used, used_visible;
+	unsigned int i;
+	int err;
+
+	mutex_init(&mgr->lock);
+	/* Only the bottom 256M are CPU visible */
+	mgr->visible_size = SZ_256M;
+	mgr->visible_avail = SZ_256M;
+	for (i = 0; i < mgr->num_parts; ++i) {
+		KUNIT_ASSERT_EQ(test, gpu_buddy_init(&mgr->parts[i].mm,
+						     mgr->parts[i].pool->size,
+						     PAGE_SIZE), 0);
+		gpu_buddy_driver_set_lock(&mgr->parts[i].mm, &mgr->lock);
+	}
+
+	mutex_lock(&mgr->lock);
+	err = xe_ttm_vram_buddy_alloc(mgr, &mgr->parts[0], 0, SZ_128M, SZ_8M,
+				      PAGE_SIZE, &kernel_blocks,
+				      GPU_BUDDY_RANGE_ALLOCATION, NULL,
+				      &kernel_visible);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	/* Straddles the end of the CPU visible window */
+	err = xe_ttm_vram_buddy_alloc(mgr, &mgr->parts[1], SZ_256M - SZ_4M,
+				      SZ_256M + SZ_4M, SZ_8M, PAGE_SIZE,
+				      &general_blocks,
+				      GPU_BUDDY_RANGE_ALLOCATION, NULL,
+				      &general_visible);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	mutex_unlock(&mgr->lock);
+
+	KUNIT_EXPECT_EQ(test, kernel_visible, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, general_visible, (u64)SZ_4M);
+	KUNIT_EXPECT_EQ(test, mgr->visible_avail, (u64)(SZ_256M - SZ_8M - SZ_4M));
+
+	/* Memory taken from the kernel-only pool is not reported */
+	xe_ttm_vram_get_general_pool_used(&mgr->manager, &used, &used_visible);
+	KUNIT_EXPECT_EQ(test, used, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, used_visible, (u64)SZ_4M);
+
+	mutex_lock(&mgr->lock);
+	xe_ttm_vram_buddy_free(mgr, &mgr->parts[0], &kernel_blocks, kernel_visible);
+	xe_ttm_vram_buddy_free(mgr, &mgr->parts[1], &general_blocks, general_visible);
+	mutex_unlock(&mgr->lock);
+
+	xe_ttm_vram_get_general_pool_used(&mgr->manager, &used, &used_visible);
+	KUNIT_EXPECT_EQ(test, used, 0ull);
+	KUNIT_EXPECT_EQ(test, used_visible, 0ull);
+	KUNIT_EXPECT_EQ(test, mgr->visible_avail, (u64)SZ_256M);
+
+	for (i = 0; i < mgr->num_parts; ++i)
+		gpu_buddy_fini(&mgr->parts[i].mm);
+	mutex_destroy(&mgr->lock);
+}
+
+static struct kunit_case xe_ttm_vram_mgr_tests[] = {
+	KUNIT_CASE(select_part),
+	KUNIT_CASE(addr_to_part),
+	KUNIT_CASE(general_pool_usage),
+	{}
+};
+
+static struct kunit_suite xe_ttm_vram_mgr_test_suite = {
+	.name = "xe_ttm_vram_mgr",
+	.test_cases = xe_ttm_vram_mgr_tests,
+};
+
+kunit_test_suite(xe_ttm_vram_mgr_test_suite);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 83baeec2ef9b1..509f2e2345553 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -1303,3 +1303,7 @@ void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root)
 		return;
 	debugfs_create_file("vram_bad_pages", 0444, root, xe, &vram_bad_pages_fops);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ttm_vram_mgr.c"
+#endif
-- 
2.34.1

