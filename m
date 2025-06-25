Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D1BC7EE32
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 12:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E78E10E6F4;
	Wed, 25 Jun 2025 12:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ht7a0GiZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5328110E220
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 12:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750854183; x=1782390183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zT4rSB5dAWJuucPyP+/tWshWqZVajtrGyu2yQtx51GQ=;
 b=ht7a0GiZ+8hRSIyx6DVcmMJVd7M6rIQVuqOZ/famYRc9e1lZPbF6CLVR
 QFDYSOqYdjZJc5fyMOm+Dn072BmLbtZ+RZx3njs79iIGArB/FJfTEToCR
 q46j49fT15srBgKDCmWS5wJChWwM4thShWY//Usq2KtPKiVA0oln2hLmA
 0etR4SNQ6Lt/bvYVqgcoDPDhhSTpWUb50a3NH5dKkpdOLDrfGk3pQ68Sn
 7pgC8xNOXfHrvurm7ubhcAbhNzLbIlO13rF9rP/emTg0qyG1+0JRQE37G
 btj2rofmOGrfYjFv81EMl3gGRQ/N42bUjpGwTfOMAcb3EJ03zmIj4kBfj Q==;
X-CSE-ConnectionGUID: 4xxe7NzMR7CYcB9WZnRevg==
X-CSE-MsgGUID: fnQlPcw+QLeuMsGzgtt/uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53054562"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="53054562"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:23:03 -0700
X-CSE-ConnectionGUID: J+CN7ATOQjibs7btxCGaZg==
X-CSE-MsgGUID: KgbJWeh+ReylN6x/gyF/UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="183091788"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:23:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 05:23:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 05:23:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 05:23:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OR4isnGEFYsgcb0d9o3aIWtCBaqqTIsCFTZQuEc4jeOc0rtq4W4m6DD+aY8xecUaGHIJtloDcoGesfEJ/ulY4MBa07YQlvOZp/vM9pnvyAR+Aip33I8J1gtVAsjPI46coBtgN52SNHbsO3rkhDGTPFR+dC0UAZeWWFfFP9Yez9OtUMMIWiuy/u1ie56CsFvWaUIXC0vmbBG+SEFONE3Z2BZ9KMds6NAPBfnLiE+mrcRV3RbmRs6hgUcfSzFllNeJqv/unXNuK2KZO/X9QZ8QlTRjtfT6JNrt3Yvlr/2Lb/DRAvmmmB7wB9WtVrr7Vz71za/pIHqEFccijARvaa22IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USH+YgURMkjfMbzD5bPWYo5DSNwa9VyZnJy4vbwDTfY=;
 b=Pz4nxvRRFHqdap1s6tU/Q24MBHujbNftD225oqB8etDp902RoAUCK6Uq+2MWylQXucn3zKwBIF99+hgV99CyBo5jY444/Pon4U3U744FkAzbyI/tiUEG/Hbkw7RJQWS49mvcwd0hVtqKLt4XFgWWgw6UfkBmnf+r3PlCdxGE/GYHsijpwYCsG5tf7XMeYL+ci1GIu+bUHBaJTd8vmI6fPIpDsGCyr8B9NFMREUe0pSaqqTT4hTaWlSgoVDjdDVmc30e4713cSUnk91/W49F0ZQQDjKlJHk+K1K7ZGZN26NhuuUtt0UZiL5yEmD9WWBcy+jOVHJRESx5oQI5SVwO9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB6062.namprd11.prod.outlook.com (2603:10b6:8:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 12:22:49 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 25 Jun 2025
 12:22:49 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v4 1/4] drm/xe: Use devm_ioremap_wc for VRAM mapping and drop
 manual unmap
Date: Wed, 25 Jun 2025 14:22:18 +0200
Message-ID: <20250625122221.3061437-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625122221.3061437-1-piotr.piorkowski@intel.com>
References: <20250625122221.3061437-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6PR0301CA0096.eurprd03.prod.outlook.com
 (2603:10a6:6:30::43) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: cbdfd7cf-9252-4454-d9a8-08ddb3e2ffa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3I0dVEyZytjdDVnbmhVb0o3WURrYjBuYmRCQnpJNVpXMkpLV3lXSVpuN1E2?=
 =?utf-8?B?UjZRZUphTFJHdytMcGdDaG9WM0UvVVpGdFNiMEtQSllaNmkxSHdRU0l6dmpq?=
 =?utf-8?B?cGhtVTBqMGVseE05Zkd4cWcwb213RnR3c2VZeEd1U2UzYkRsSzlJOWY0MHR1?=
 =?utf-8?B?Z082YW41cXkxYlJDdnVaNVhaUFZZMlJCMkJQc2NRNVBxaEZNNW4yOXZiT0VO?=
 =?utf-8?B?WE1kT3M5QjdIMmZwM2hGSFZVSnJxM25KZ05GdDN2WEdxUlpYV0RXaVF3aG5U?=
 =?utf-8?B?NlpOSklBUTh0MUZneGc5Y1Q0cHMrN3ZKbFVPRFoxaUNRNE92TCtiL2lWMGht?=
 =?utf-8?B?cGpyRnRUbWNVV3ZveTFaUmdmeEVZUlkyZTlpaGlWMU9LUTdadDhpTHJESWNW?=
 =?utf-8?B?dTVzb3poWE8wemZHbWhZUHJXTkJZMTJLZW1aZ2tZZUs2SnUwSFZsVk0raTla?=
 =?utf-8?B?bUVFZGZCK3pLNCtGdlBtNXVIU0RFK2ptdEd4RXhWWnN0WktPMmFXaVIxRGIy?=
 =?utf-8?B?R0ZXdDBwSjBUMTF4eVFRdHJYY0NkdVRaS01QbFlsLzlNS3FVWE1Qd2s0d3dL?=
 =?utf-8?B?YWZSczVTdCsrb2JpTWo4OTFzUGRDR2lhT2M2QXk0MlZEN3J2eU11dzhJL0lX?=
 =?utf-8?B?dG52UEVtTWk5d2VPWGE4RUtMUXRzQjdQR3ZlM0p2aFFlNEM5WnB3QzNTYXRr?=
 =?utf-8?B?TThVUDN1cHpBb0lsTkpuL3VleDFweVBGRWdzU200OEd6ZWJITTRlYXVHczRH?=
 =?utf-8?B?bWtPajYyNGc1OU92dm9TUzYrZDV5N3JzT0YyZTgvNmVyVXdWVXhiTjg0MWR0?=
 =?utf-8?B?Skl0Nk91QVVuQ2svVFpaVkNadmFxbEk2MzRZR0UyUFBLdk16ZnZxelFHWHhZ?=
 =?utf-8?B?OTJ5VThjQ0tPVjE2NDlkY1h4UnJsQjN2ZCtOZHF0akRXcUllTHhHQWJGTmJF?=
 =?utf-8?B?Z2ZQZ0luMDMzbzNIWnYybGhPalVUSmlCck1JZTdzUEg0ZmsyKy9wZC9pa2N4?=
 =?utf-8?B?L0RxbGdxcU5mSU4vdGtIVGxGZG9vRERWYS9HOGJadzVuVGQ2dDJvTEx3Q3JC?=
 =?utf-8?B?ZS8ya2tKNzh5dGw2c2x1UitZN3ZQRnJUTVJRYmEwWjRHUTRWVGlmWDdGWXI1?=
 =?utf-8?B?UWVyc0IzOW1JcC82NVVQaHRDKzI5NzNoTVNpZkw0d1ZHWEk4TzNiR2lhbS9n?=
 =?utf-8?B?SGZpT3dPQitlYUZscHZxL1lqalQyOW1YTHVkU2lmeTRraWp5cTVSOEVXaGZ4?=
 =?utf-8?B?UzNyTkl3YThEeklxZFJTU1Z6aDNreW4xa2xncVJFZS9kanl5ejdtT2xIMnNh?=
 =?utf-8?B?L0pXR3NqUTBLeVVPcnhBYzJ5RlI2V1VkSWhBNW5CKy9xbWxhcEFSOTY2N2Jl?=
 =?utf-8?B?Tytzc2Y5RTZXODRzYzlrSUN2WWJEMHMzQ1JhZklVV2p3WkFhNEtpbTlFY2Y4?=
 =?utf-8?B?RUc0S3JaWFZiVVNhSW5DWjlHNG1vUTVMT3NtVGVjMFRCUm1BbGtHMXN5UWRk?=
 =?utf-8?B?OGtyZkVqRWZtK3FxNTJ5RSt3TFkzdElpMldtUGt2UVBleG14L0xjU1FrQ0J3?=
 =?utf-8?B?Ujg4d05HTFV5ZW9LOVB0TEY5TlNqaHFRVnRLQnl5S3BuNGNpdWhCYVRTcWYx?=
 =?utf-8?B?TDJGdEh5cUtkTEdhbGFFQ3hqazlSZ3pYYjdudUxSU3d6ZGRwMHM4NWJuTHFN?=
 =?utf-8?B?Q0hheUdzbDZkcU1tNGR6NXNpMjJ5bjFjYnhSNGkxRHhpOUNaVmRnaUR4MWVx?=
 =?utf-8?B?dENsNEN4VWNuVkl4bEljU3pMSU8wNG9aMk0yVFFwNXVkYXNVcGEzRzM0N0s5?=
 =?utf-8?B?L1JQQzA0dWxuSWtqV1hnSFU3bXRDNkgwUXpBdjRXUmxPSThlaGtTZHZlYkRl?=
 =?utf-8?B?SnNsMHdLOVk3NStMVWNvZ2ROQ255Lzd4RkttdkVlTUQ2eFJEL2J3ZFUwdno3?=
 =?utf-8?Q?fFrdsxQrw70=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alNRdkwxS21DS2FhR1Nqb0hWdW00K2VyMnNDdDVyZWVvTnY0a0FYWFZRMmNB?=
 =?utf-8?B?Nk1WMko1Ui9ZQmM3ZDJDS29WYzdnOWY2MSswWDRPdUZEbWFvSHNMaE03Q2tZ?=
 =?utf-8?B?cFRaRVhZZVA2YURDbmZFWi9jNDBScGFVMnNPdWpJZnNhc2xzcWtjcGNxVUFs?=
 =?utf-8?B?Tm5lcDFpWTFSS0Y2Q3ZJL2NmbEhzTzVLSnBQeXE1MzZ0dUp3OTJiZG5nQkZx?=
 =?utf-8?B?aWthTVIxSFk0Y2V3TEdEUEJ3UjFBMGJ1QVlZK0pCV0Yvc0JQRXBseXA3aW9S?=
 =?utf-8?B?UndRSURSK0hnUnlaaTdUTkV6WnlYWkpKckM4azZ6YStVTm9nckRaaEJYUStS?=
 =?utf-8?B?MEU0MEgvYVFDdUpLbStDaDBYNExTeHJQUFVoSnRKajdOam5EdHQxL3V0ZVpH?=
 =?utf-8?B?Mks4SWxtL0ovb0l2S3B0am1hZXo4K2lqZ2haLzErL1RyOUlvVjZIdWE3ZTJ2?=
 =?utf-8?B?NnRrZk1yMnZsUkI4bTRUWHBud1dPWkF0UHQwZWh5d1pWU1U4Q0dCaW5QNkFU?=
 =?utf-8?B?eG1XSTFHUHlHQVNPWUN0dGlhTHlnMHllTnJUVVR1SzduZ0FBbHhQdW5wZFkx?=
 =?utf-8?B?VTdrNVZyb1JQQlNYQkU3VC9yUFRodWZQS2dLMlZ3MGlDL2RJRXUxa0I4SHM4?=
 =?utf-8?B?UTluMzVkSHhjcmc4QTY0WG9JR1gzSGVZV2VEb1RHYW1WUFR2VWRrWlBjbjI3?=
 =?utf-8?B?bnZVOUFjcW9OdERSYWpIZ2YrUU1KYytVQnU2MFZoT1hPcDFJdUF1UmZrZEI1?=
 =?utf-8?B?R1JHeElDOGF0ZCtRTks2Z2RUK1VqWEN4bkJqNlJrbVp2UGdQUDdMR0lPMDUw?=
 =?utf-8?B?dXRMQkdIT3ZtZGN1VlFKeldrd1ZPMTg2NnVaeHNGWFpranBpNGVnVG15TG0z?=
 =?utf-8?B?SXI4REdtZCtadUEzQmhscjJMMWsyU0IxY08vSUdzUXRrekJ6QXRrY2Ztdnhp?=
 =?utf-8?B?ZTdZZFBsRnVCVGhNU1QzV24zbmh5ZWtBdkZoRFlZRWUyeWhZRW1VbzN3bmo3?=
 =?utf-8?B?TUZCa3NleFQrZys4aW5Xa1N0SVJpSHhqQzU4S3hFT0ZHdFdYQjhwVTEwTVVt?=
 =?utf-8?B?ajFtK0RXdCtLZXJtWVVsMFlaV2RWTXp6M1BpVGlEbko0ZXg3S3l1R1BsMUcx?=
 =?utf-8?B?aHQzR0pMTVFxbHJkNGxES3NEUWZHUHMrZi9YVlNmNjlhT1ppM0ZVakZzNEVu?=
 =?utf-8?B?cWhsbnVTMTFIcWpONUdoVkJaaDc2L3huOEl1NzdpQldTaXM3S01XM2F5dkdh?=
 =?utf-8?B?dXI2Mng3UGZtUmNMZFYyTWtwUE1XbkVqYWZzWHdocm81ZHJlVDFKWjhON0di?=
 =?utf-8?B?QjhTWElHeVMzakYwT1lzZVpzTy9CaWVkV2IvWEM3NS9YeVRLakpHWVRHUk5p?=
 =?utf-8?B?VzNLU1hlTThtM2plY1V2S0xqVit1LzFrODI4RkxNb3NGdFdkUzNKdHFhVVFw?=
 =?utf-8?B?N2xOQWo2MEFwQ1NUQXlSOExPa3UwdG1jYnNQZk9KcTI5YXBKa3M0YUVIYUJ1?=
 =?utf-8?B?aENWSlAwZzM1aHNvNWMyNXB3TlBOVHcxeStCN3gycHpseTRtRm9nOGYrMy9O?=
 =?utf-8?B?SW95TTJkK1RqTldBWjQrTmZPU2dBQVZUc3VsZFlIemhXUnhud1VyZ1JLSEJh?=
 =?utf-8?B?bjFYY05XVzZhVVNQWEV2d1hIYjRuZzR5VkxqdS92MVFRbmEzSExCTDhiYWVq?=
 =?utf-8?B?MDFYV3JsemFvenFMdXdBck81UXIzQm00dkhFckF2Qk1FNlVqWDdWMkNNZ1Bo?=
 =?utf-8?B?Mk54Mnk0dFVlQ3VldzF3enl4RjNscWJNN1Y1VjQ5RHVLU1R4SmkyeFVreHZu?=
 =?utf-8?B?RzNSRFZxekdXNm5rbHRqazNsMzZDakd4bVc0blJUM3JNTkMxeThieDhDSnA0?=
 =?utf-8?B?MjJySFltbUhNbG5LU3BCbEZwVmhodUxZdEx0UjZOOG9iODdjWFJGME9YWHZP?=
 =?utf-8?B?S0ZpUWNxUXBJUmV2QjhpbDY1YUdiUUs3YzVWdFVhSHB5Vy9Oc3pWY043YStF?=
 =?utf-8?B?Tjhab3A2R0tTWi9sT0p4T0t5TUFtbC85RXFoVUd6MWNsbnJPOE1MaFZPamcy?=
 =?utf-8?B?SHgzNFhzMHZsbEhxY0s0aWNxdXhQTFJ4VlY1VnJ4MmNpWGZrM2E2dWNGeVg1?=
 =?utf-8?B?Mm9aVjdZNTNvWk5XWXltd3drVzRkVUg3aUdTR0w4dk14bmRQUnlHRHZ6SGky?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdfd7cf-9252-4454-d9a8-08ddb3e2ffa7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 12:22:49.0736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzS8Zr9SEH42Y3SSdZf4G94owLJ2RVahkI9AWOst9tLB2qH7W5xR9TyXYP8fdjRb9uyJgUdE5+5DeM2eqjdynY7cu66/Rhh2sk749vpq8Ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6062
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's replace the manual call to ioremap_wc function with devm_ioremap_wc
function, ensuring that VRAM mappings are automatically released when
the driver is detached.
Since devm_ioremap_wc registers the mapping with the device's managed
resources, the explicit iounmap call in vram_fini is no longer needed,
so let's remove it.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e421a74fb87c..3a4c84e9efc6 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -156,7 +156,8 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 	xe->mem.vram.dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
+					       xe->mem.vram.io_size);
 
 	return 0;
 }
@@ -278,9 +279,6 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
-
 	xe->mem.vram.mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-- 
2.34.1

