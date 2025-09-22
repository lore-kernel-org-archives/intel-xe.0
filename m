Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93032CA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 17:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E7310E384;
	Mon, 22 Sep 2025 17:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FMRBVn3M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C19410E384
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 17:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758560859; x=1790096859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NXDsThP5elIstJD3B1Hx7l0lgxVIModG7WcQYlilOvk=;
 b=FMRBVn3MFIGWXrm2BPhUvrD8ZUDj9XmgGPq1eufbzQkiygV6FnsJhLWC
 1iuFQim4emXcbcHZL2W0/KajeW8XX5vsroOYdsxDT8slGg+CYaecdPl82
 El1IUZnVMH6xxQoR7Qov/KIHo7hOY3TDhZx15Vf8PgqoVNm8BdLNQVX15
 RpAH0DGmm3bSCkyZbkNBNmQcT7DAYC7ZG4nSqugb4LCnO8ui/YL+mGnnp
 tgP/mQMl2D9SJXp9I+mYlohY8O5jE/+NLDQMKeOkUFEhVQJxMLIV7sw3Y
 kp+EApsr4q553RRxNOrTgmk7vETpFAROgm36Fy+ifyL+iZCObQYgKM3Mg Q==;
X-CSE-ConnectionGUID: Y26c57r5SsSumbtsiycK3w==
X-CSE-MsgGUID: 5QcuvnCvTxqTHT6hdX+oJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60527369"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="60527369"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:07:38 -0700
X-CSE-ConnectionGUID: ATWsFJK2Snq+lG3w5PtPBQ==
X-CSE-MsgGUID: niQtanyOR1yOdciCPUiQeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176456863"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:07:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:07:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 10:07:37 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKZgk/ZGNjFX3TUmUwMnfCutiS0Q5gO+N1lHZ7CP+ZWyZ9ILzSiNHIbf6B40VCvktd0p72EmZxNylcWd9TbWUj2Oo0GuUQ4k8Q6hxy0efp4p1gafAgod3vngB1TjsBpKjr3fgN5matn6F54hgZUKch0d1gfcF8+q6O+FHl7tmOL1ualbx0ojRPdTFhCxp8aqMJN80W7AJ981a7NKcjEe2GEYdjoqZ7bXK/11CcPOoYSWxhXzGzUc1naGDL06ebXzyfp6MIa3618owtM+IyGVXfs2g3zR2/ukX+kA8Djd1SwTlJZtJPbtp+X80/PU5N7K6BA9OZZ24NotRGCzf7H09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pq4i5x8ppgYwA8x1uwonyBc6gWg6cG3SWV8eb0nYyk0=;
 b=wnAj0f03d3J0AfUEYF+Owx/O+bpAqXQu73c/OooBalCdVVGL7NO7fnGYjy44E9KSzL0jiHOfEz+yaLKjkEHF2gPJZL8Vnd6qB0xgqaQ4QnGemzW2tG+uLdaV9Es0FM2V5lQTFqM1S785VE2MLc4tXBgcRrKl8nF+/pTHEKEY/gvTBXynEmGNFadRWEituimBmL3SykcopJf0lifH13/IohUDP/N1pMg27KwbOaFI2R7kRYSQzSCfEwuL+wk9dqhCEPSDLvNq1JF1Cz8g20g7X6RpUhcoKwWNFPUlNbiGxS4OPX0xIXI66h0kOfH2vetYuyRvEL92alwcnvaAlHd15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB8097.namprd11.prod.outlook.com (2603:10b6:208:457::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:07:34 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:07:34 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v4 1/5] drm/xe: Add initial support for separate kernel VRAM
 region on the tile
Date: Mon, 22 Sep 2025 19:07:03 +0200
Message-ID: <20250922170707.1556781-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
References: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0067.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 1238099c-bd0a-4922-33db-08ddf9fa862f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTV2UFQrMW81dG55cnFIaFhPQ1IvTVM0VCtVRmZPcEZONjBOM3oyT1o1Z25r?=
 =?utf-8?B?Q2RvVXgveEdWSWJ1OXZ4YmxLMS9zZDEzZXFYWGRUVmIvSHl5VUp5T2FrcjRr?=
 =?utf-8?B?RnpxOUdHQStOeTdSMjQrSk5KU3VYWkJzdjN5eGl2cThDbGQ3eTE4bHJOS1hs?=
 =?utf-8?B?SHZQdlFRbEY5eUM4Vk11UU1rRW5hbkR3UmFzbHhIQ3lmSTZlUWNyRlRUT2x1?=
 =?utf-8?B?TjFQcUdvcmFkeVpHWjVBU0YySzRqOWFpOU1uemp0UEhQQSthcFNjakpxSHZY?=
 =?utf-8?B?ampxVXlpM0NFbG5lakd6aDhhZWRmSVJRSzY4VDBRUG9tWDgwUFRTc1Zid0E1?=
 =?utf-8?B?L1JDNjdWcHdRbjVTK1lnbFFFNTNqQTNiVmhVU091emVzK3hzWGZ5UVN3d1Nk?=
 =?utf-8?B?RjV0bHZ0RCtRazEvRFpPU0JDWWtrOEpFTmFUQTY3R1J0L0VXRk95WklNRXdN?=
 =?utf-8?B?ZzZDTExkYXJhbWdYbzZJam8reHJUL1lBVXVVNTIreDNsS3hvYkp6M0g0QXBX?=
 =?utf-8?B?dkw1ZHBXZUg0TGFUai9scUJHZmVPTnJ0M2s0ZUJ3bk1yUTJuRWl6UXU0VFF1?=
 =?utf-8?B?blpyWURtMHUzNWdvZ08vOFg1ZXFvMi9rUEVRcVRzdmNwZ0pYdU1EZXFJa2tD?=
 =?utf-8?B?d0kyNVhLa3ZENjlUN2ZRTnZuN0kvd3NGaC8vcnUxVTF4WDFFMXRqQitPZzFP?=
 =?utf-8?B?ZFl1YjhENEIrc2hKMFdTYW85QmtINUJ2dDZDTlJLcFlSQ3Q4am1hT2dUc0ZF?=
 =?utf-8?B?K2dvem9jZytXVjk5WkQvdTZIYUhacjNpNWYwSzJ0YTlleTBFWGI4b2hOUlJI?=
 =?utf-8?B?OFBQMldQZndOQTdMcVpRNnNUWHlMVDJNdUZEUmJ3VzgxdlRNam1YbXdHeVZN?=
 =?utf-8?B?VmdZNmxoQ2FaVHpxZ2xXMXdVYyswYkhmcDZlK0dXdndOajE3Y0VaVVpIZnA4?=
 =?utf-8?B?MEtxNHRTVDV0TjFMZjFOL2Z4R2Z6aHZUdnNFbXNUYkNjdmhMb1V4SzlRWkJL?=
 =?utf-8?B?N1ZuTjA1eVhTamEzOWE4Q0o1UFkwYjZYNWt4NlNRNHlhVEJ1SnF4WHJwemtQ?=
 =?utf-8?B?WXd1Qjg4OFEvL2dlT3UyYUFzb2FZSUhzK213cldIUUFEeFl5K2JwbjBMZlNL?=
 =?utf-8?B?dE5vWFN6bW5YRjFRS04rQ2l4QmpONWJ5bVkzMFZwOXFlV0dtSGRER3pRYkRu?=
 =?utf-8?B?Uy9Db3VUZGwwb2xwL1E3UFJ5Y3lBR0F2bGI1bXhMSmxteE1jTVdXRHkwMmpx?=
 =?utf-8?B?QnlQQ2pLSmxFNjVTRm1RYjdLRExrMGhFdHRWTUsvNHp4MDFIUFRJNWx5UkdR?=
 =?utf-8?B?cHI2Zmd4SFdqeDNqdExLbTlZRmIvMUk0OFcyNkl2M3YzcHhVOERSbGVQTmRo?=
 =?utf-8?B?MHkzenhEV05WNUFydkI0R0kydERQcDhodmFZalFENXpDbXI3Si83Ykxrd1M0?=
 =?utf-8?B?bFhaZFpWekYxcDFMMW9kdlQxSlZ5a2F0M3VTWVNyeTdwYy9jMTlqV08rK3E0?=
 =?utf-8?B?ai81ZkdTeUVTRzBRazlqbE1hblVCVDdQWEFOcVp3OTJFM0xoVlIydmF6MmNG?=
 =?utf-8?B?cGFzZlZUbUpGK09RRXArUjgvMU5lUmRkNm1JWXorM01TSEVPeVVseXZLUmNV?=
 =?utf-8?B?eDNHTWlaTHVJWTZOT0czNmpiS0RTVS9aZkhUQlpIcGROa1VGY0J5SUZqOFVU?=
 =?utf-8?B?aSs3UVZmNis0aG16cUNEV3ZJQlJMemhtdURuWU8yZllWcUUrZ2NFd2ZlTHRZ?=
 =?utf-8?B?QVZ4b0JiVHpkOWVqVFU5MTZEWnNIQU1lSklpMjVCRC9GYnB0SElNaXgxU0du?=
 =?utf-8?B?Sm0vZU9IVmRaT0ZWZHZoa0RQUytQM3E1a1JmU2lMdjU4RlozZk9Sb3pLSW5P?=
 =?utf-8?B?VVpqKy9BSEVETVEwdFdGTGpVUU5rYm5Ccnd1NENrVXE2WUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVloNVJyQXhaaDd1ME9jaStCbjVFbFVLeUU0dU5DalBudXRPdGZtU0p2REM4?=
 =?utf-8?B?aGFnN1B2R2dSQjRnUU4wK243WEJzaEwvVDlTSktRbGtUTmI3NG9odDN1TWxR?=
 =?utf-8?B?eFhxN3dBNGtnUGhQK0lrK2RBNmdrczFidzZZdEJ4bjV1a2lQRzU4NjZoQzRP?=
 =?utf-8?B?UzhteXMreEJIendpTWJ3VExxZ1Z2cWh3anJBUmQzaFozckZNL011b0I0eGNh?=
 =?utf-8?B?amE3YzRXQnRBOW94Y2xOY21SVHpqZTI1N0tHYVBCSGl2bnNySTYrNS9XbVg4?=
 =?utf-8?B?TFRNQzAyeUhkM0Zzb2JqQkVXMXZIU2hOQkRmT2M2RnQ0VVkwdjFla3YzY21y?=
 =?utf-8?B?cU5TL0w2amZIRFpsWU1ESjR2bXFZS3lBa1Y2Q2JUVDVwcXkycm9yU295bjJy?=
 =?utf-8?B?bEZYY2tKVjJ0VEJVRVVjWXdYZTRMWFIxUTVVNzIwZStjVEZWSjAvZUpKQTFp?=
 =?utf-8?B?eXZFNU9PWno2eFJuV2ZIMnVlTHFlUXFsK3VzbWpUSi9COVA0Tk5CcmtXbDBR?=
 =?utf-8?B?cUpBTGhCa0FnZUVQdmpNWTJkTG96SnQ4cUpURmppQkhYNERDTHdTVjhPaDhI?=
 =?utf-8?B?bktsUzlDeUZmaEVCQVZjMURkeTJUNEp0MFNtcHVZUEgrQmdxZVovc1R5VEZ6?=
 =?utf-8?B?SzVxYVRqeFJEVVFQeDZWN2lpRnVLc1FmOVgyblZ2T202ck5TOXIxcjJWZHc0?=
 =?utf-8?B?YVduc3RGNzJQWG10NVV4SU1rSWZwMmlTbTlCVHBwS1IrVW9aSE9RdmRZVjRz?=
 =?utf-8?B?L0FKZ2k0ZVFUYzlkemlkZERCSTU3RzRqY2pzQmpNYUxaMUxLUW9rZ0ZPakRP?=
 =?utf-8?B?QTRFOUJYS2NVRlNiTWNFYTBHV1NINDl1MDVXalREcEdkdU8zMDROZEtqYTlt?=
 =?utf-8?B?dDA0cTh3a1FUYTBvN0RGNkhzajRSd1h4M2lpV1dGNEh1WXFOdHcxR1NrSzFI?=
 =?utf-8?B?Mlg4aSszQkM0YTdFU0NKSUtOSjBEb3NQOUVPVUZXNEdPb1pkRU4zbGFMYVF6?=
 =?utf-8?B?OHZIZEVHWUowYVZ2SGplVE1EOGM2L2tqMmRRK3FEQkJkWHdOaG5wNmFRN2Zn?=
 =?utf-8?B?bUJIaTRVR2x2eVdkSTF5TU5OcEg5T21LZU9VblQ1TW9QcHFERFkyWXkyZE10?=
 =?utf-8?B?b2JKRXBaemJoU0lTYUJSQ1BVb3R0ZTVML0FnTURuSUZEYUlJWXk2S0RPdkxY?=
 =?utf-8?B?U01lMk1NZzhoOEdlSEU3ZmVhRXg4RTR0MklHTnRoZzdCdzlFVEhNdnVpZUFT?=
 =?utf-8?B?OENWUVVHNjJTWFZzS1FRbHpvdEVYNXNyV0p6a1B1SXoyb201QnFWckh3YUlz?=
 =?utf-8?B?UnBTV3dHUVBjdXFQS2tmZW1IUlBUOHNFeklNMXJ4dVVZU2FQWEhWcURVcHVq?=
 =?utf-8?B?NTFzbFI0cWZFUU5pbnlKTTVEQ3JNSjIxV2l1SDVTMjRKeXVvZXFEUkZ2WHc5?=
 =?utf-8?B?bnBERHAzWjV2SmIxNWR1djVaUXlWM2pEdkEzTXFWVE5BNjJsZDJGR0ZRa2U4?=
 =?utf-8?B?RDYwNkIzcXFWWVAybUxubkV1VGpMMkJtYVFYUDdFTlkzSmlxbHhudFVuNWlj?=
 =?utf-8?B?OFd3THZWUnd5ZFg3Kzd3TkFibjlTaXhyUzZablQ1ZW1Vcng3Q0hKRDV3WTVW?=
 =?utf-8?B?SVl5Z1pBc01mYnRvUjl3Q2JMS3NadFpiUlNQa0RKNG93QjByQ212T2tmakdS?=
 =?utf-8?B?RDEwM1lzZkdTL3Z0ZkZZSVp2bDVLSW5acm5wN0toYmtYNlpkZ1BrdnJiTmIz?=
 =?utf-8?B?d0tUcXBQWWlYd3FNUHpPR3A5Uk4yYm8zcjlLQ1lDTFo3eFVMQ0RjZDBYWHpD?=
 =?utf-8?B?WlRETTcwY3A0UFpPdDFUTU1uQ1g0UlYxWWkxRENmbE5QRGVTdjZMTHg3M1BD?=
 =?utf-8?B?LzFudU10YnFJTVZIcGZYYi9qLzA5bVAxZEh2ZC9KUWtDSUVnNFRWMVlyZVQx?=
 =?utf-8?B?UjdxMjg2d21RL0Y4SkZjUi8vOU51UVRVYkMva1VMSlhEY3dXdmpWV0E4bkVN?=
 =?utf-8?B?RS83aGRxM05ZaVMrUEJvVXVJdmZNcG1YNG5HVVFCNmQxeGI1UjdZYmptZy85?=
 =?utf-8?B?ZHpyQkhoQTJYR3VtRDBEYlBFVnFYdytIWmJmYW03YWlRSzhHTVRJS2NacDcr?=
 =?utf-8?B?ZlFLUTI4TGtQenAyaUk2c3pVdGhEbHNmT1BrdVZpVjFBSlZodS9FZ2g5K0F1?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1238099c-bd0a-4922-33db-08ddf9fa862f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:07:34.6745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8BkLMslEcV6TweB18+1RJOe87+099yflBJUrGEmBQS4J5NulpbO0dWGPPjs3QD1tG5vwhbZx5hsn7+H3JmLr2nVhmIND2kDAQSwuahVUbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8097
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

So far, kernel and userspace allocations have shared the same VRAM region.
However, in some scenarios, it may be necessary to reserve a separate
VRAM area exclusively for kernel allocations.
Let's add preliminary support for such a configuration.

v2:
- replaced for_each_bo_flag_vram with the improved
  for_each_set_bo_vram_flag helper (Matthew)
- moved the VRAM flag iteration macro definition into xe_bo.c (Matthew)
- drop unused bo_flgas from bo_vram_flags_to_vram_placement (Matthew)
- use hweight32 helper in __xe_bo_fixed_placement for readability
  (Matthew)
v3: remove unnecessary VRAM fixup id

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 78 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_bo.h           |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h | 10 +++-
 drivers/gpu/drm/xe/xe_tile.c         |  8 +++
 drivers/gpu/drm/xe/xe_tile.h         |  5 ++
 drivers/gpu/drm/xe/xe_vram.c         |  6 ++-
 6 files changed, 81 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index edc6e29f0cc1..0fe7ce1f15f3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -34,6 +34,7 @@
 #include "xe_res_cursor.h"
 #include "xe_shrinker.h"
 #include "xe_sriov_vf_ccs.h"
+#include "xe_tile.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -81,6 +82,10 @@ static struct ttm_placement tt_placement = {
 	.placement = tt_placement_flags,
 };
 
+#define for_each_set_bo_vram_flag(bit__, bo_flags__) \
+	for (unsigned int __bit_tmp = BIT(0); __bit_tmp <= XE_BO_FLAG_VRAM_MASK; __bit_tmp <<= 1) \
+		for_each_if(((bit__) = __bit_tmp) & (bo_flags__) & XE_BO_FLAG_VRAM_MASK)
+
 bool mem_type_is_vram(u32 mem_type)
 {
 	return mem_type >= XE_PL_VRAM0 && mem_type != XE_PL_STOLEN;
@@ -213,6 +218,27 @@ static bool force_contiguous(u32 bo_flags)
 	       bo_flags & XE_BO_FLAG_PINNED;
 }
 
+static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
+{
+	xe_assert(xe, vram_bo_flag & XE_BO_FLAG_VRAM_MASK);
+	xe_assert(xe, (vram_bo_flag & (vram_bo_flag - 1)) == 0);
+
+	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
+}
+
+static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 vram_flag,
+					   enum ttm_bo_type type)
+{
+	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
+
+	xe_assert(xe, tile_id < xe->info.tile_count);
+
+	if (type == ttm_bo_type_kernel)
+		return xe->tiles[tile_id].mem.kernel_vram->placement;
+	else
+		return xe->tiles[tile_id].mem.vram->placement;
+}
+
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
@@ -245,12 +271,15 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
-			 u32 bo_flags, u32 *c)
+			 u32 bo_flags, enum ttm_bo_type type, u32 *c)
 {
-	if (bo_flags & XE_BO_FLAG_VRAM0)
-		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
-	if (bo_flags & XE_BO_FLAG_VRAM1)
-		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
+	u32 vram_flag;
+
+	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
+		u32 pl = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+
+		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
+	}
 }
 
 static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
@@ -269,11 +298,11 @@ static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-				       u32 bo_flags)
+				       u32 bo_flags, enum ttm_bo_type type)
 {
 	u32 c = 0;
 
-	try_add_vram(xe, bo, bo_flags, &c);
+	try_add_vram(xe, bo, bo_flags, type, &c);
 	try_add_system(xe, bo, bo_flags, &c);
 	try_add_stolen(xe, bo, bo_flags, &c);
 
@@ -289,10 +318,10 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 }
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-			      u32 bo_flags)
+			      u32 bo_flags, enum ttm_bo_type type)
 {
 	xe_bo_assert_held(bo);
-	return __xe_bo_placement_for_flags(xe, bo, bo_flags);
+	return __xe_bo_placement_for_flags(xe, bo, bo_flags, type);
 }
 
 static void xe_evict_flags(struct ttm_buffer_object *tbo,
@@ -2152,7 +2181,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 
 	xe_validation_assert_exec(xe, exec, &bo->ttm.base);
 	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
-		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
+		err = __xe_bo_placement_for_flags(xe, bo, bo->flags, type);
 		if (WARN_ON(err)) {
 			xe_ttm_bo_destroy(&bo->ttm);
 			return ERR_PTR(err);
@@ -2210,34 +2239,33 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static int __xe_bo_fixed_placement(struct xe_device *xe,
-				   struct xe_bo *bo,
+				   struct xe_bo *bo, enum ttm_bo_type type,
 				   u32 flags,
 				   u64 start, u64 end, u64 size)
 {
 	struct ttm_place *place = bo->placements;
+	u32 vram_flag, vram_stolen_flags;
 
 	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
 		return -EINVAL;
 
+	vram_flag = flags & XE_BO_FLAG_VRAM_MASK;
+	vram_stolen_flags = (flags & (XE_BO_FLAG_STOLEN)) | vram_flag;
+
+	/* check if more than one VRAM/STOLEN flag is set */
+	if (hweight32(vram_stolen_flags) > 1)
+		return -EINVAL;
+
 	place->flags = TTM_PL_FLAG_CONTIGUOUS;
 	place->fpfn = start >> PAGE_SHIFT;
 	place->lpfn = end >> PAGE_SHIFT;
 
-	switch (flags & (XE_BO_FLAG_STOLEN | XE_BO_FLAG_VRAM_MASK)) {
-	case XE_BO_FLAG_VRAM0:
-		place->mem_type = XE_PL_VRAM0;
-		break;
-	case XE_BO_FLAG_VRAM1:
-		place->mem_type = XE_PL_VRAM1;
-		break;
-	case XE_BO_FLAG_STOLEN:
+	if (flags & XE_BO_FLAG_STOLEN)
 		place->mem_type = XE_PL_STOLEN;
-		break;
-
-	default:
-		/* 0 or multiple of the above set */
+	else if (vram_flag)
+		place->mem_type = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+	else
 		return -EINVAL;
-	}
 
 	bo->placement = (struct ttm_placement) {
 		.num_placement = 1,
@@ -2266,7 +2294,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 			return bo;
 
 		flags |= XE_BO_FLAG_FIXED_PLACEMENT;
-		err = __xe_bo_fixed_placement(xe, bo, flags, start, end, size);
+		err = __xe_bo_fixed_placement(xe, bo, type, flags, start, end, size);
 		if (err) {
 			xe_bo_free(bo);
 			return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a77af42b5f9e..9a8401300b15 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -122,7 +122,7 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
 int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-			      u32 bo_flags);
+			      u32 bo_flags, enum ttm_bo_type type);
 
 static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a6c361db11d9..621aa0ab3de3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -158,7 +158,15 @@ struct xe_tile {
 	/** @mem: memory management info for tile */
 	struct {
 		/**
-		 * @mem.vram: VRAM info for tile.
+		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
+		 *
+		 * Although VRAM is associated with a specific tile, it can
+		 * still be accessed by all tiles' GTs.
+		 */
+		struct xe_vram_region *kernel_vram;
+
+		/**
+		 * @mem.vram: general purpose VRAM info for tile.
 		 *
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index d49ba3401963..6edb5062c1da 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -124,6 +124,14 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 		return -ENOMEM;
 	tile->mem.vram = vram;
 
+	/*
+	 * If the kernel_vram is not already allocated,
+	 * it means that tile has common VRAM region for
+	 * kernel and user space.
+	 */
+	if (!tile->mem.kernel_vram)
+		tile->mem.kernel_vram = tile->mem.vram;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index dceb6297aa01..5d834378b354 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -23,4 +23,9 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
 	return tile->id == 0;
 }
 
+static inline bool xe_tile_has_separate_kernel_vram(const struct xe_tile *tile)
+{
+	return tile->mem.vram != tile->mem.kernel_vram;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b44ebf50fedb..7adfccf68e4c 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -13,6 +13,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
@@ -283,8 +284,11 @@ static void vram_fini(void *arg)
 
 	xe->mem.vram->mapping = NULL;
 
-	for_each_tile(tile, xe, id)
+	for_each_tile(tile, xe, id) {
 		tile->mem.vram->mapping = NULL;
+		if (tile->mem.kernel_vram)
+			tile->mem.kernel_vram->mapping = NULL;
+	}
 }
 
 struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
-- 
2.34.1

