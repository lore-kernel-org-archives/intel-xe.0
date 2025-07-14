Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B15C83F1B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 18:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A25110E32D;
	Mon, 14 Jul 2025 18:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQVPiz99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C70A10E32D
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752518990; x=1784054990;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=STcVOysB0Z4didKcQeAsucAFRmFBadPbZZK0sW19Hno=;
 b=iQVPiz99/THmtTK0ZkNOSKVj4pixwOZQBTZrADPaomFYqDCCdrs6P61j
 GsqZtQZMflkBajD+Yb0Xip630Jso0lB6RGuZ2zqcj7r+gg7BICtch0L8H
 ugTErqHBsOgBQbxcI8IAXsAZufyxxu+nMUrpu0NBSH3CkHjbsZJM1HshV
 etGBnY+PRjSN5TVLpL75ZJhzFkkS/IIC9OtQ/Uz1W4Pl5Sjtz9npj0K12
 G1dY8F95+kTcU/PHkyYGpZwGHY/aQ34QQ+5W4EjUk+WoK+y4pAnYkggGK
 3BqGcM9gYJWfkGjUg2DT6ChLi7pcn6OfH3dJW+sLLYO5zu4QLGZiwCm/A Q==;
X-CSE-ConnectionGUID: r4VJuplTSt+B2PBpw1c+gQ==
X-CSE-MsgGUID: DJjOKhA8SpOPW9OiAs4f6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53832659"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="53832659"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:49:50 -0700
X-CSE-ConnectionGUID: psaq0N32T/eZHVUG3RAKBw==
X-CSE-MsgGUID: 70NA3WqbQ0GN9WNI+NDI/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156421628"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:49:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 11:49:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 14 Jul 2025 11:49:46 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 11:49:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFiKyInv4Fh2/dNi3eOcRsEqOt8tYbVvTxl988a2UZFW0+IiLltO2w3PQgeet9cmo6zDCjZCgnWznGPc0DWccMhEXcCHE1Lc1y1yOCiEdn29DNDMZ+6SmmDPB2uFtkHGlGBhVv0WqSHg5I7d5usZlQwWNWNF8KVXN97w77DGM/O4iozXJZR4g7rpu89qcoG+40/gxR0FxkdOX0uJGQR7nWYY4d1pi6m9bHAhWQJPI/Uu/V4CQoOO3N+UzlmhpbDgevcAhVq13IBOw3VllJ5tsJMio2oMXx6nzQ8sHVVovmV8ZxotLgs+U9kgowvnAQqg7u7u5sMDFXPW8qYMFvomZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUzw4zD9PJv3ifwabxNggKFXMg2gdbiE++iHu1ESPoc=;
 b=vZA9w4XCSV4vs/NC8qT5Q9q1qAwRUfhSWegdWeLr2uZdKl27hhnvofj0WDBp1gLWgoaeFKWjfOJz42RpM57P8bV/8Z92FhKcvyfsJ7RKWzhU68W6/bERRx1ddSx93LJUlqraQYKOB/zCz0V7zwfFF+HbvN2O90c9mwcdoKarz8I3IRgweGLdGQO6EiLP2y/dYTb/9c8WgmZ1SJLLPuMQVyrVtp5fkgKg6nHjNWUfw+NbNkBdlbkDQIlVnzzsJMNBb8GbAmELsLPTo0ZUKgQIscQBhEG9XPDSDsa0b69y/8JBUfTbf3n4yIxDFEBolEWYXSsvYxw1xmiB7zkGkB6hzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Mon, 14 Jul
 2025 18:48:31 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Mon, 14 Jul 2025
 18:48:31 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH CI,
 v11 2/5] drm/xe: Use dynamic allocation for tile and device VRAM
 region structures
Date: Mon, 14 Jul 2025 20:48:15 +0200
Message-ID: <20250714184818.89201-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714184818.89201-1-piotr.piorkowski@intel.com>
References: <20250714184818.89201-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0126.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c780a13-013e-4aa5-12e6-08ddc307072a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3orbDB3NDR3cldJeDlvQ0tESUVma1FCV21kSWVhREV5SzFKSmdnSzBIQVhP?=
 =?utf-8?B?aFIzV0JuQUpXZE1iV20yQ3F0REZ3NFF0Q0svSnZXZDJQWmZzL1paU1VTZHFT?=
 =?utf-8?B?b083d0N3M2cwMFlKaHBzOC94c3g0cWg2aElPblZ4Q2xnbzNkV1ZTWnpZWlNG?=
 =?utf-8?B?U0dkWU5UQ2hDV1ByNngzdkpSUG5aSVkyZm0rcGZCVldreUlqWTV1SEJkbllY?=
 =?utf-8?B?UDdCSTF5eERIaVJFRDRBVkhQaWZWaEc1MFVBZ2tscEZYSzAzMGpJaFErckpO?=
 =?utf-8?B?ODBnTVRTMWRqeUFRaGxlYXJnSGFOeFBpc0lOVE1NK2V1SUo4ZTluNk95UUtk?=
 =?utf-8?B?ZEFlbXFZMGl5cnB5YnJwY0VMWFNvV2J0WDV4VHRTK2VnS1FkelAyOWZXNFBv?=
 =?utf-8?B?RVpMc053Qm1EREtjckpGVmRTa1lnZ0QzMU55SlQ3dzIraUgwQ2ErN3pFemtS?=
 =?utf-8?B?SWFBNU43U0J3V054TjFjendkakMwREwzNmZ3VTdMTGtHM2pUVDhtczdNSEtX?=
 =?utf-8?B?RnBGcCs0SVlSaXAvL2tpYll5OVcyN2FvYzBGR2pUTzdwTGhsaGZkSzhPQWFk?=
 =?utf-8?B?MkNhOGhFUm9vM3M2YlBEWlBTZndCK1huZ0FOZnJuc0pBR3B6UXBUd08yNEhM?=
 =?utf-8?B?enpqUUU2eW1wdTd6UlB6Q21YdUlMdG9kMXE3Mmc4MUhBTFNDenlNZUszTHNV?=
 =?utf-8?B?cy9jb1NiNVZHVzVROVE0NFBVcys1bXZSRTluZkkyZkxub0VlYitmZmttK28w?=
 =?utf-8?B?R21FS0k2WllnV0Fhd21TYXNGMmhLM3ZlTEd1RFNPMUtRaC9zdnQ4K2FUT0FH?=
 =?utf-8?B?cllHMHhPTENvY2xHZ2ZVa1RJRk85TEFNc1VCUEM1T3dxMDRITkRwM1VPL2xq?=
 =?utf-8?B?Y0EyRDN4dHllQTJya0p4a3lKR2tnZ1A5OHlqODdWNDhIcnJVVFRHTVRXMDV0?=
 =?utf-8?B?ZGtmdjRkQ2xOSjNOM2dyTjJXZndKMG1hc0c2VnJKSHI0cldoTUNObWVORUZR?=
 =?utf-8?B?WHppSEdNWitFUWxCeTcxSVVGZzE3d0cySHNRdnlPVURjRFpvZUlOTU9TblZj?=
 =?utf-8?B?T1dvTlE2MTNlaWlNSWJtTTJyWUFodysySHljRXlVYnB4N2s0TjVIbWZpSlZj?=
 =?utf-8?B?NjE3dk1KSXQ4MUxwYVgvUVI4ZWJ4Mk5wMks0a0E2WHdrMDFQVVVRMTJoMzFN?=
 =?utf-8?B?RFUwT3BCMXc2Ry9TYVlrZGErWEQ2UHl3SWd0Sisxd2NoZ3BMcnYvcHlFV3Nq?=
 =?utf-8?B?T1RHQnNJcTRocjJLQ2FPNGxOOVNmVFVUZ0Y5RW5rYnRHWUZRN01jdzFNNnJT?=
 =?utf-8?B?NXJsVnIzWjFYSGlxSFV5bEhoUlRYRjRJWlRTeDE1NzJ0WERQRkpLRWgvb2Rj?=
 =?utf-8?B?TjBGY1dacUxyMjBVWmxHbkdVV0UybXdQbjRDUzdXc2JGWnFocG9mejRVVEIx?=
 =?utf-8?B?aVZHNXJhWGFEWDhRMWJFNDFqU1RaMG5Gd2lxUzRLeVJrVUxNTnJZWjFENWp5?=
 =?utf-8?B?QTlTL2R3TWx0cW5nbm5zUHpQckUxeUEwcU1ybnpRZlQ4Y3dhcmFGbW5paGwr?=
 =?utf-8?B?d0daQlZOOHJ1N1Y0cmhoTzNoTnc0aG1NMUs1MlRkT05EeXBORTR0czVFM0xx?=
 =?utf-8?B?d0krb21aNms2QjNtOHBoYmNsRkpwMm0zYW81NXkyamx5RTgvWmpoMnV0WElR?=
 =?utf-8?B?SmFsUzlBenExclFPNkdZQjBHWkZHam9DZTB1eWJpWW9nczFlTWtTT2haSEov?=
 =?utf-8?B?YkcwcmxXS2RpMUh5WEdORjhOdGdYQXovSW0zd0xYTTBDWE9DbjlmRmQ5VE1J?=
 =?utf-8?B?dTdZaEtoR2JqN0E2dU15TnozYzN1KzRLd0IrV0VkZGJMc1RFWEtLYSs3Ylpk?=
 =?utf-8?B?NzZLK1FQTVp3TDEzL25aTmkzajFiN0dGTkYzam1PL2ZsSW5pbnhYMytFWkhC?=
 =?utf-8?Q?4FxNtSrGKT8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmdqaEliZHFONzlMckx2dWtDUzluRTBLaWNKczI1Y3I4bDAwU2xlZTQ4MGhi?=
 =?utf-8?B?cFhmQXd5M1dpM0FUY05IdTRZamtLb0pIMTNLZ2FWOTJQSldCZUhrb0VZVStM?=
 =?utf-8?B?RGZwR3RoN1pyL25Ec1g3aEI5aC9OaXFPenJ6NS80eThaQUpJVmcrb3hGczNw?=
 =?utf-8?B?dytuM1pORFhoUXNOckdrdmJnbjFpTm96TFA2czNKS01sb3hHaG5YY3ZMdlRv?=
 =?utf-8?B?U0pRenlCMzRtV3dkek1ocndDYzJidlZyRmJSMXNzRWorSlBxR0VzUFV1OTJP?=
 =?utf-8?B?ODZWbUIzSys3Y1ptZWtpWm9TLy9NMDRlM1FmaG5SbjFTdmxEKzc0N0MyQmY5?=
 =?utf-8?B?S21kZVNpai9BeW9CbUpMREVIWllwOWZ4STNmbXBUcjlwRnN3blNFSEtrODRO?=
 =?utf-8?B?NWg5QVBEUkpwbHM2U3dCTEVLYml0WEc2UFZNQU0zOE1zQzQ1M1ExNmlkN1FJ?=
 =?utf-8?B?Q05BWXhWbGljdGNzaFVMckNsaU4yMDBxZ1hwb1dUbWNPT0ZYbERCVU80Qksw?=
 =?utf-8?B?dytiUjkxSXRvNTQxSDgyWVFOZmNkUWhINXcydnljY29UdUFvRm5QWTZKV0l1?=
 =?utf-8?B?emN2V2Jma2I2MlFpWUpsVDdBK1hJSm1aSWNoN0VTcVMzVEtENWxoL3ZIWlZY?=
 =?utf-8?B?NUhIMTNGRVhMVkdQR21wdEoweHJFUkVNSGNqVU9COXppN1VKeHpVTlFsM2Jo?=
 =?utf-8?B?ZEVIcXBpMHcvN3NKZytkWXVwb1JlT3ZJK3pKZ3d2RGtXc3FoNGdLUTdENFMr?=
 =?utf-8?B?cFgvWnlvSTZ2UHl4c25DakxrcThicXBkMGhpU0JyMDdHQjg0TUV6eW9rTHVh?=
 =?utf-8?B?Z1RYNmRjL3gwNXIwWjdycG5GcDhoUncwUVd2YTVoZi9TQzF3anB2Ry9ZQ0lX?=
 =?utf-8?B?NXFNdEVYbFFKc0tsOGlHTWtweXB1TUw5MFhqNFQ4dEttNXMyRnhPUGlkMkVX?=
 =?utf-8?B?bVFDMzRKTUhYUC9Ed243RWN3eVNPT0NCcHBxNFRwek85d25IdHRtc05VOWhn?=
 =?utf-8?B?cHZUYURuZEgrZmYyT2R1MHhFOWVXSTlnQlhUYjNDdy9lSDhUbUlXd1ZzNVB2?=
 =?utf-8?B?M2tUQlR3VWNpM2ZwWTFwN2ZnM0ZkYUwybzBOblhMQmFMblh0VHIweGcxM3hO?=
 =?utf-8?B?RlM0aW1nQlBHT21jUklmT241WUt3a2RPRDBRcmtTUDc1a3VoUE5zZndhV0p2?=
 =?utf-8?B?V0UzVVJhSTNQK295RGMxWWJNeUNWT3hGZFdTQm1QZ0Vza3BVNm52d1prSTNV?=
 =?utf-8?B?bmpjM2pOT0NIN0QwZFlCbE1oZ1VxTU9wdGlVQzdGbEVDci9HVXdYTldReWR1?=
 =?utf-8?B?NDlNamtDQkxpN3R3SVFRSnZIR3ducnlXMU54Z2RvS1h5WGhnN3hkZ1laanZT?=
 =?utf-8?B?b25leGl4aTlRMlZLUGNLVDNUVUtQMjJHK3lKV05wc2JvU0g5TXJSM2JWSHph?=
 =?utf-8?B?V1U1amdHNkZsSlBOZ3puNTRHTzlFWlk5QXRtWE9BZnVqNHZSSFpoUFdiYzI2?=
 =?utf-8?B?TThiNjIvenhQRGRKaHVKK2NJWUY1cXRGY1lGUnJUbnhJemkzMHp6Z1NXcUFC?=
 =?utf-8?B?V3BFN2ZyREtrN1JXMHpLSUdsZTB1ZlYxK2ltT09BaFB5b0hUTTYxN2puWlIy?=
 =?utf-8?B?Qnp6cW1VK0dCYlBlTlJaOTJQaVMwUXFSZWZxTUpwSVQyeWVyYUVOTzcyUUYv?=
 =?utf-8?B?aWV1ZEdTNnQrWkY2THhWWTVTZG5QNER3YjdJYWV6VVU2OHlOSkhwa0xZTjBP?=
 =?utf-8?B?Ym1ESTRmRWVBeE9yT2JJSmVkUU5kb3hBS3B3NkNNbmtMei9JdXh6eWh4ZW80?=
 =?utf-8?B?amtTa3NqYno2NjM1VGp2eERrUHp2OXNnbzZ6TFpuUWhxdTF0cExlY2Fhc3ls?=
 =?utf-8?B?QXNHcGJXYllpVmh6a09OU0lPM0hkQVhjdVJBVWJJYmtLREU4Z2VLanEyZTk3?=
 =?utf-8?B?MWFjRVUzUmwxcXc1WUw3WUpVb3F1TVl3ckVaZjJ1OXQ4VlltRXYweTI1SEdJ?=
 =?utf-8?B?Q2lCS25xRElQdzAwYWZoTW5iWjhvYVExNDFNQVFWcTFNeStnb01qbkZxVC9a?=
 =?utf-8?B?N2hCTVZFZWFmTUtvK3o1ZjMrOEpjZXZIQzR5YzNqUFpTQzMwQ1RLSVA2QzlD?=
 =?utf-8?B?Qk5YdHNmT21SL3l0WmRqNnBBcTFkM1RJRlkwK0cvK0hocC91enVGY0t2QnBu?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c780a13-013e-4aa5-12e6-08ddc307072a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 18:48:31.1518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ImkPOHCkyJ6LmAB7JHbVqwPHB2oq9iVRITn+vrnZcww0MeqZkpQuWn9Rw8D/nxYj6gNrAm8O0JFsULF9hVq1EwYCN/VBI8JyzHq9E/tPFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5176
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

In future platforms, we will need to represent the device and tile
VRAM regions in a more dynamic way, so let's abandon the static
allocation of these structures and start use a dynamic allocation.

v2:
 - Add a helpers for accessing fields of the xe_vram_region structure
v3:
- Add missing EXPORT_SYMBOL_IF_KUNIT for
  xe_vram_region_actual_physical_size

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   4 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
 drivers/gpu/drm/xe/xe_assert.h                |   4 +-
 drivers/gpu/drm/xe/xe_device.c                |  19 +++
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  25 ++--
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   2 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  24 +---
 drivers/gpu/drm/xe/xe_tile.c                  |  34 ++++-
 drivers/gpu/drm/xe/xe_tile.h                  |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  10 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   7 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 121 +++++++++++++-----
 drivers/gpu/drm/xe/xe_vram.h                  |   9 ++
 16 files changed, 202 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index c38fba18effe..2187b2de64e1 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -289,7 +289,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
 	    intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
 	    !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS)) {
-		struct xe_tile *tile = xe_device_get_root_tile(xe);
+		struct xe_vram_region *vram = xe_device_get_root_tile(xe)->mem.vram;
 
 		/*
 		 * If we need to able to access the clear-color value stored in
@@ -297,7 +297,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 		 * accessible.  This is important on small-bar systems where
 		 * only some subset of VRAM is CPU accessible.
 		 */
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
+		if (xe_vram_region_io_size(vram) < xe_vram_region_usable_size(vram)) {
 			ret = -EINVAL;
 			goto err;
 		}
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index b2ede3af9345..873f4e18cb2a 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -103,7 +103,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= tile0->mem.vram.usable_size) {
+		if (phys_base >= xe_vram_region_usable_size(tile0->mem.vram)) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 68fe70ce2be3..a818eaa05b7d 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -12,6 +12,7 @@
 
 #include "xe_gt_types.h"
 #include "xe_step.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Xe Asserts
@@ -145,7 +146,8 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
-		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
+		      __tile->id, ({ string_get_size(						\
+				     xe_vram_region_actual_physical_size(__tile->mem.vram), 1,	\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6dc84e4ed281..df6f1790d6a6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -687,6 +687,21 @@ static void sriov_update_device_info(struct xe_device *xe)
 	}
 }
 
+static int xe_device_vram_alloc(struct xe_device *xe)
+{
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	xe->mem.vram = vram;
+	return 0;
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -734,6 +749,10 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe->wedged.mode = xe_modparam.wedged_mode;
 
+	err = xe_device_vram_alloc(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d4d2c6854790..8262a935ddb4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -77,6 +77,8 @@ struct xe_pxp;
  * device, such as HBM memory or CXL extension memory.
  */
 struct xe_vram_region {
+	/** @tile: Back pointer to tile */
+	struct xe_tile *tile;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -216,7 +218,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
@@ -412,7 +414,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 		/** @mem.sys_mgr: system memory shrinker. */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 9ba9dc7c4ee9..7e7102cddfd7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1574,7 +1574,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
+	return xe_ttm_vram_get_avail(&tile->mem.vram->ttm.manager);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ba1cff2e4cda..d6186ac530cb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -34,6 +34,7 @@
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram.h"
 
 /**
  * struct xe_migrate - migrate context.
@@ -130,34 +131,36 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 	u64 identity_offset = IDENTITY_OFFSET;
 
 	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
-		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+		identity_offset += DIV_ROUND_UP_ULL(xe_vram_region_actual_physical_size
+							(xe->mem.vram), SZ_1G);
 
-	addr -= xe->mem.vram.dpa_base;
+	addr -= xe_vram_region_dpa_base(xe->mem.vram);
 	return addr + (identity_offset << xe_pt_shift(2));
 }
 
 static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
 					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_2m_ofs)
 {
+	struct xe_vram_region *vram = xe->mem.vram;
+	resource_size_t dpa_base = xe_vram_region_dpa_base(vram);
 	u64 pos, ofs, flags;
 	u64 entry;
 	/* XXX: Unclear if this should be usable_size? */
-	u64 vram_limit =  xe->mem.vram.actual_physical_size +
-		xe->mem.vram.dpa_base;
+	u64 vram_limit = xe_vram_region_actual_physical_size(vram) + dpa_base;
 	u32 level = 2;
 
 	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
 	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 					    true, 0);
 
-	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+	xe_assert(xe, IS_ALIGNED(xe_vram_region_usable_size(vram), SZ_2M));
 
 	/*
 	 * Use 1GB pages when possible, last chunk always use 2M
 	 * pages as mixing reserved memory (stolen, WOCPM) with a single
 	 * mapping is not allowed on certain platforms.
 	 */
-	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
+	for (pos = dpa_base; pos < vram_limit;
 	     pos += SZ_1G, ofs += 8) {
 		if (pos + SZ_1G >= vram_limit) {
 			entry = vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs,
@@ -307,11 +310,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	/* Identity map the entire vram at 256GiB offset */
 	if (IS_DGFX(xe)) {
 		u64 pt30_ofs = xe_bo_size(bo) - 2 * XE_PAGE_SIZE;
+		resource_size_t actual_phy_size = xe_vram_region_actual_physical_size(xe->mem.vram);
 
 		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
 					    pat_index, pt30_ofs);
-		xe_assert(xe, xe->mem.vram.actual_physical_size <=
-					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
+		xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
 
 		/*
 		 * Identity map the entire vram for compressed pat_index for xe2+
@@ -320,11 +323,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
 			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
 			u64 vram_offset = IDENTITY_OFFSET +
-				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+				DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
 			u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
 
-			xe_assert(xe, xe->mem.vram.actual_physical_size <= (MAX_NUM_PTE -
-						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
+			xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET -
+							  IDENTITY_OFFSET / 2) * SZ_1G);
 			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
 						    comp_pat_index, pt31_ofs);
 		}
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index dc4c8e861a84..f4ea13527945 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -692,6 +692,8 @@ static int xe_info_init(struct xe_device *xe,
 	 * All of these together determine the overall GT count.
 	 */
 	for_each_tile(tile, xe, id) {
+		int err;
+
 		gt = tile->primary_gt;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.id = tile->id * xe->info.max_gt_per_tile;
@@ -699,6 +701,10 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 		xe->info.gt_count++;
 
+		err = xe_tile_alloc_vram(tile);
+		if (err)
+			return err;
+
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index d517ec9ddcbf..66ea3403afbe 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -337,7 +337,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
-	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
+	if (xe->mem.vram)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a7ff5975873f..e6871734ffa9 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -306,16 +306,11 @@ static struct xe_vram_region *page_to_vr(struct page *page)
 	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
 }
 
-static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
-{
-	return container_of(vr, struct xe_tile, mem.vram);
-}
-
 static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
 				      struct page *page)
 {
 	u64 dpa;
-	struct xe_tile *tile = vr_to_tile(vr);
+	struct xe_tile *tile = vr->tile;
 	u64 pfn = page_to_pfn(page);
 	u64 offset;
 
@@ -370,7 +365,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 		if (!vr && spage) {
 			vr = page_to_vr(spage);
-			tile = vr_to_tile(vr);
+			tile = vr->tile;
 		}
 		XE_WARN_ON(spage && page_to_vr(spage) != vr);
 
@@ -508,7 +503,7 @@ static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
 
 static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
 {
-	return &tile->mem.vram.ttm.mm;
+	return &tile->mem.vram->ttm.mm;
 }
 
 static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
@@ -522,7 +517,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 
 	list_for_each_entry(block, blocks, link) {
 		struct xe_vram_region *vr = block->private;
-		struct xe_tile *tile = vr_to_tile(vr);
+		struct xe_tile *tile = vr->tile;
 		struct drm_buddy *buddy = tile_to_buddy(tile);
 		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
 		int i;
@@ -683,20 +678,15 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
-{
-	return &tile->mem.vram;
-}
-
 static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      unsigned long start, unsigned long end,
 				      struct mm_struct *mm,
 				      unsigned long timeslice_ms)
 {
-	struct xe_tile *tile = container_of(dpagemap, typeof(*tile), mem.vram.dpagemap);
+	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
+	struct xe_tile *tile = vr->tile;
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = xe->drm.dev;
-	struct xe_vram_region *vr = tile_to_vr(tile);
 	struct drm_buddy_block *block;
 	struct list_head *blocks;
 	struct xe_bo *bo;
@@ -722,7 +712,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 
 	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
 				&dpagemap_devmem_ops,
-				&tile->mem.vram.dpagemap,
+				&tile->mem.vram->dpagemap,
 				end - start);
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 86e9811e60ba..858ce0183aaa 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -19,6 +19,7 @@
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Multi-tile Design
@@ -95,6 +96,33 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+/**
+ * xe_tile_alloc_vram - Perform per-tile VRAM structs allocation
+ * @tile: Tile to perform allocations for
+ *
+ * Allocates VRAM per-tile data structures using DRM-managed allocations.
+ * Does not touch the hardware.
+ *
+ * Returns -ENOMEM if allocations fail, otherwise 0.
+ */
+int xe_tile_alloc_vram(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	vram->tile = tile;
+	tile->mem.vram = vram;
+
+	return 0;
+}
+
 /**
  * xe_tile_init_early - Initialize the tile and primary GT
  * @tile: Tile to initialize
@@ -132,8 +160,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
-	if (tile->mem.vram.usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
+	if (tile->mem.vram) {
+		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
 		if (err)
 			return err;
 		xe->info.mem_region_mask |= BIT(tile->id) << 1;
@@ -168,7 +196,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
-		xe_devm_add(tile, &tile->mem.vram);
+		xe_devm_add(tile, tile->mem.vram);
 
 	return xe_tile_sysfs_init(tile);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index cc33e8733983..440bc9e11c8b 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,12 +14,14 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 int xe_tile_init(struct xe_tile *tile);
 
+int xe_tile_alloc_vram(struct xe_tile *tile);
+
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
 {
-	return &tile->mem.vram.dpagemap;
+	return &tile->mem.vram->dpagemap;
 }
 #else
 static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index d9c9d2547aad..9a9733447230 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -25,6 +25,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_vram.h"
 
 struct xe_ttm_stolen_mgr {
 	struct xe_ttm_vram_mgr base;
@@ -82,15 +83,16 @@ static u32 get_wopcm_size(struct xe_device *xe)
 
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
+	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	u64 stolen_size, wopcm_size;
 	u64 tile_offset;
 	u64 tile_size;
 
-	tile_offset = tile->mem.vram.io_start - xe->mem.vram.io_start;
-	tile_size = tile->mem.vram.actual_physical_size;
+	tile_offset = tile_io_start - xe_vram_region_io_start(xe->mem.vram);
+	tile_size = xe_vram_region_actual_physical_size(tile_vram);
 
 	/* Use DSM base address instead for stolen memory */
 	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
@@ -107,7 +109,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 
 	/* Verify usage fits in the actual resource available */
 	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, LMEM_BAR))
-		mgr->io_base = tile->mem.vram.io_start + mgr->stolen_base;
+		mgr->io_base = tile_io_start + mgr->stolen_base;
 
 	/*
 	 * There may be few KB of platform dependent reserved memory at the end
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9e375a40aee9..3de2df47959b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -340,10 +340,11 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = &tile->mem.vram;
+	struct xe_vram_region *vram = tile->mem.vram;
 
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
-				      vram->usable_size, vram->io_size,
+				      xe_vram_region_usable_size(vram),
+				      xe_vram_region_io_size(vram),
 				      PAGE_SIZE);
 }
 
@@ -392,7 +393,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
+		phys_addr_t phys = cursor.start + xe_vram_region_io_start(tile->mem.vram);
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 3a4c84e9efc6..c93e9b96354b 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -3,6 +3,7 @@
  * Copyright © 2021-2024 Intel Corporation
  */
 
+#include <kunit/visibility.h>
 #include <linux/pci.h>
 
 #include <drm/drm_managed.h>
@@ -147,17 +148,17 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram.io_size)
+	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!xe->mem.vram->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
+	xe->mem.vram->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
-					       xe->mem.vram.io_size);
+	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
+						xe->mem.vram->io_size);
 
 	return 0;
 }
@@ -279,10 +280,10 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	xe->mem.vram.mapping = NULL;
+	xe->mem.vram->mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-		tile->mem.vram.mapping = NULL;
+		tile->mem.vram->mapping = NULL;
 }
 
 /**
@@ -318,10 +319,10 @@ int xe_vram_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.io_size);
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->io_size);
 
-	io_size = xe->mem.vram.io_size;
+	io_size = xe->mem.vram->io_size;
 
 	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
@@ -329,45 +330,105 @@ int xe_vram_probe(struct xe_device *xe)
 		if (err)
 			return err;
 
-		tile->mem.vram.actual_physical_size = tile_size;
-		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
-		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
+		tile->mem.vram->actual_physical_size = tile_size;
+		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
+		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
 
-		if (!tile->mem.vram.io_size) {
+		if (!tile->mem.vram->io_size) {
 			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
 			return -ENODEV;
 		}
 
-		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
-		tile->mem.vram.usable_size = vram_size;
-		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
+		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
+		tile->mem.vram->usable_size = vram_size;
+		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
 
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
 			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
-			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
-			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
+		drm_info(&xe->drm,
+			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+			 id, tile->id, &tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+			 id, tile->id, &tile->mem.vram->dpa_base,
+			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->io_start,
+			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
 		available_size += vram_size;
 
-		if (total_size > xe->mem.vram.io_size) {
+		if (total_size > xe->mem.vram->io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram.io_size);
+				 &total_size, &xe->mem.vram->io_size);
 		}
 
 		io_size -= min_t(u64, tile_size, io_size);
 	}
 
-	xe->mem.vram.actual_physical_size = total_size;
+	xe->mem.vram->actual_physical_size = total_size;
 
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->actual_physical_size);
+	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
 		 &available_size);
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
+
+/**
+ * xe_vram_region_io_start - Get the IO start of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the IO start of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram)
+{
+	return vram ? vram->io_start : 0;
+}
+
+/**
+ * xe_vram_region_io_size - Get the IO size of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the IO size of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram)
+{
+	return vram ? vram->io_size : 0;
+}
+
+/**
+ * xe_vram_region_dpa_base - Get the DPA base of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the DPA base of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram)
+{
+	return vram ? vram->dpa_base : 0;
+}
+
+/**
+ * xe_vram_region_usable_size - Get the usable size of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the usable size of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_usable_size(const struct xe_vram_region *vram)
+{
+	return vram ? vram->usable_size : 0;
+}
+
+/**
+ * xe_vram_region_actual_physical_size - Get the actual physical size of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the actual physical size of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region *vram)
+{
+	return vram ? vram->actual_physical_size : 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index e31cc04ec0db..d4bf1f9c2a72 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -6,8 +6,17 @@
 #ifndef _XE_VRAM_H_
 #define _XE_VRAM_H_
 
+#include <linux/types.h>
+
 struct xe_device;
+struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
 
+resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
+resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
+resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
+resource_size_t xe_vram_region_usable_size(const struct xe_vram_region *vram);
+resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region *vram);
+
 #endif
-- 
2.34.1

