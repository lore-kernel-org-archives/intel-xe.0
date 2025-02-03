Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E534BC02194
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 13:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B35E10E4EC;
	Mon,  3 Feb 2025 13:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQV7tCdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E3B10E4EB
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738590883; x=1770126883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WUsHvESoWSEn4886Y3MQkL8Gozjpi1nanqA9pQbFv/s=;
 b=IQV7tCdb4IPkPZzN1iTWN8xpV+5gVrdxPrISrmmVU7gxV7PubQo4O0rT
 HGwdQ2QSUv24UgOL0tAv//qh1A+ntpW0DkluGnFvGP399gIafesPpIzYI
 4CpFpdIC8ip+J08KpiJaS8enkVYROWr2sr+XNVuV6JE9k1+EVC3MZ1peh
 BMU3NeLTJ+QfKz+6yZRh/r4kksW5yvanfY2CJmZCunGVQECj8pupZ78PA
 XqeSylkBmY16gOAIHDy4Yc0nL6ZjS64/nCsFbPq+YfJZ/PQ/pRgpfyYL7
 p2iVdMg6lGMxVVk6xoNILX02jx6L9tL18PAmIWbx0YGM6iyWsEzCidsjW w==;
X-CSE-ConnectionGUID: TpC1lCHNQ8+LD4+HP4on/g==
X-CSE-MsgGUID: 3z9naL3jS+ur/5OMREsZYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42740586"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="42740586"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:54:43 -0800
X-CSE-ConnectionGUID: H/a4xT5OQxKzIwzSB3X82g==
X-CSE-MsgGUID: HkFJYyJVRraHstk9nSyrZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="115293940"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 05:54:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 05:54:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 05:54:41 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 05:54:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjCIaiScwGFoowANdleLdLWgq1b67FzGUMU88oMvhut+EyePwUj68mGMTfyGr2Hbf9VPbq622HnRWsC9hZtos3ksCUZCZs1PjaHC5v3A4WBOHpoE5Sgoqz6fPs8kCKuYasuyAN03w9+4MmrNyLUCVz6ufxj/gdJjU3P0Wf90hZAL68zObgrhojaMLIi+pMuq7nEeBQgTdpoLbsPF1uT2+u+ORi9d1xHEwXXLdYnDBVkiDB+U8XnoEzRum/J2Q30ZsQHu9w3O555YSb4OjIsqI2vXxcpTWQDFd5KbA+Sxb/EjZG90u0gQ8iSMvsyb3QxMzfJtlzGF4FXRldVj8NWvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PXHmbI4qUu1tQcGfakf4PemCKg4lM1dUYjswhIkRyU=;
 b=xnpl8G16hznY1KYg6Mvjot3bX0Ik0bKVCUgm5yvfHKQ1le909dqZryZb4hOAs8Wig6HOIPCe3C1W0HdqVPfUSFnKFBWQBXS/8DNAzeH3jRLgqIDXAj6OCmOZ6w1bFL16HwWVAYOqqZvGicl+T/GE4yFWltGH8oB6I4Y7VnxMWLqkudN1hHz98winDAdcB8/dDH9L0XEd+q2K8aLSAODMrhEiXfjLrlHL7KCdL1MN5RB+96s5PKwRS0FnUd9fwWVIMg+Od7sG6XXO42+GRMWDx08Ozr5zGbJ6EQ5vR3ZjPxVDqQw4+5kR5XyBJCeDG5zw71RpxPpS8uT2tjXc3KDF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 13:54:18 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 13:54:18 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Move VRAM manager to struct xe_vram_region
Date: Mon, 3 Feb 2025 14:53:59 +0100
Message-ID: <20250203135359.735832-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203135359.735832-1-piotr.piorkowski@intel.com>
References: <20250203135359.735832-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::37) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|DS0PR11MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 59769a3d-c688-4e38-fdd8-08dd445a40a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmprS09POUU1MVI5T2VydEF3eEZKQkU3aElTclhXV1dxeWZIWHlBbGhRYUFP?=
 =?utf-8?B?d2hwR25ZbmtMS3Vvc0EyUkFQSHM4SGVQTzV2SWtyT05Rdnlsb1FnSGJTa2p2?=
 =?utf-8?B?MmUxZ3BKR1FIMVhzNEJlOVRsNXdha3ZvaksyNGc2dHozMkV6UnZveW94MG9k?=
 =?utf-8?B?RWVjcVR4UGJqeG1EZW5IbmtwNnBZRGkxTGNuaXdIMWdvTnVQSTZJcFo1MDA0?=
 =?utf-8?B?Vm9EUW5FekgxMTc0R3orb1NUeTcwcm81RUh3RUhyekFNOTQrRzRWWWo4VjlV?=
 =?utf-8?B?NURZUjUrb25VbDltVjNRcDR4VUYvWWpPN3lVNGFqVjNXRVY1K3NSdjVEaExm?=
 =?utf-8?B?M3QxZzlZSCtkbFBzbjBOOWFMQ0RUUjhtOGo1ZEhYNnBzaVJiZkVTb0NMWi9l?=
 =?utf-8?B?d0hIbURRa1lNREpsdVh0OWtOajJ2aGY0YmpleGVwUUJiNjdORU5HaFJXVWZ5?=
 =?utf-8?B?NE50WXRGMGZEUU1hUms4QVNmM0R0WE9rN0JKSDVHUWhLcldFbGpMakFzZjJt?=
 =?utf-8?B?aXcyL21vMEcwTXRNZWZFL2IrcVhrSVpIME1YM3EyNEd5UG00OFZFYUJmZDUw?=
 =?utf-8?B?RmxqU3o5dWhNQUM1amkxWjh2M2pkblZ5b3R1Mk04UWg0WFFNeEpkRFJaYlpq?=
 =?utf-8?B?czgwdG1lVlZUQm9KM2tRMU1iaCtCQ2s5Q1JwNHRaei96bkFFaEVDZUNpU3Mr?=
 =?utf-8?B?ZWNteXZmTndrQllOQWNMNmpNekV0NGVqK1c2Y3JVSWpKYzdPT25LZ0lNOFgw?=
 =?utf-8?B?OTMzdzdlWXNQWHJtMlNQZEZWak5IMEhzbThZbk5MSEUrWTdhbjdwaGc2TU9u?=
 =?utf-8?B?WUxqZ3JBdGI2cHdVeEFxRUVpL0VWRGdmMW15U2x4dDRwQWpLVFNIWWtXcmxn?=
 =?utf-8?B?b1VFQVMyVGFsbTNSV0tWTVhya2VmMGh6d1lOMzhpU1lod200SWJmQXlWQTYx?=
 =?utf-8?B?di9oeXRiSkE0L0w0R1Y5QTRxVEhxSzR3S0R5SVpQQ3YveWdKV1ZCZUhVZUw1?=
 =?utf-8?B?b3g2QVhFcmJaK3ZudnYzUm0wLzhWSFNaRHE1TEF5N05jYWxia0RNaFd3amU5?=
 =?utf-8?B?UkFUbVhkSzhlNU85M1NtVHJUam5kTzloeUdFaFdhUmlHaWRBUFRFbEtsaFVu?=
 =?utf-8?B?ZEZkZ1BvUURCZWl2MVJQRXU2YmY0Y3pBZ2dKRlNkcE01QzAwMVNudWVNVDhr?=
 =?utf-8?B?MHU4QlJUZmRCVFJNcTBnMkwxeWR1TDdRZWN1S3d3R1FUSUQvQ0xJNWVGTUdt?=
 =?utf-8?B?aWhCYVhTUFpLMTB3d3NhRDdVR0F4TU9iSXZHZy9tanF0ODl6aWFTbEV4dkU0?=
 =?utf-8?B?VjJtZTE5QkVZd3BIZjlyMzNmNndZdFR4YXFnTXE3ZWVSUm1ZYmIrcXl6M3R1?=
 =?utf-8?B?ZG90WWd3YnU0eFdBOW9zbjNaRGp3TEluZFhmVjdBZUIrbldEUU4xSnJlazND?=
 =?utf-8?B?SWJSdktSc1FtQ3JUbit4WDgwcm1iVW5hcFR2cjhublc4TTh4bnl4VG9Gay9R?=
 =?utf-8?B?Wlg4bXJGVFd6NU1TVS9xbyt1TzF4VUpVeElBYnBOUHBacUY1WWdHM3VGWStK?=
 =?utf-8?B?K1N1ZDh3OGZoaUpHeUNsNGg5aFBPUGZyZW1CeEZPeUJRY3ZRUmpDbXNpdXRZ?=
 =?utf-8?B?SXBiN3dhVHZ2eVdtZjltL0FCTUI3ZDY3OWY1eE1vOHJYZkcvQitCYk9XeUZn?=
 =?utf-8?B?bWhqeTlyZkhNSkwrTSszOU5qNDFCcFhkSVlBMFkzSEFDSTBpQnI3OWRDSHRa?=
 =?utf-8?B?Z1lCMTZyYUE1MlRNUTVYWHhZM3llY3dpaVpLVEEvKzdEMTc2aFhXQzJzZ0Nw?=
 =?utf-8?B?QnZHcDB0QWMxQk02c0t5RWtYbXJHU0hxMjlaVmR2Wnk5Z2d3bVFpenRza09P?=
 =?utf-8?Q?r3wQn+WZqX5nS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGVsRkFHWmdGL09CbWpsTXBmamlpeXVRaWxNR20yK0Z0UDAvWUovaVRucHM3?=
 =?utf-8?B?TG84UnlQUGF3YzBoK3hqdXZyUGtpRVY1VW9ocnpOOTMvYVZaQU5MRUQ3ZU5H?=
 =?utf-8?B?L2FxaEtWdFFzMm5DOVdESGNuUXpNVjFnVThQRjVkY0ZFeHJzZGVHOXNoNnVy?=
 =?utf-8?B?SWNnZXVzV3VveW1wSGVEZEw5bm5xbnRhRkpKNGNlOGQ4bkZKaEFxRnhhdFYy?=
 =?utf-8?B?WEE1NDJpdzVBdit5QmtHeUR1eHhpbnBzSlFjc1Y3QkNBa1Z6cXZRWlFodkpR?=
 =?utf-8?B?c2VUc3NpZFpUbk1uRlZpclVwTVR4UGI2YXBISGFxYnhEQnBWV1NicUw1VTNq?=
 =?utf-8?B?MjVseGluSkJ4Zm0zd0VNUXViYnUzOGRzdlNhSEFwNUFlNEZmRW1rQ3J5MnhQ?=
 =?utf-8?B?QWdxTC9WcnFNYmtWa2lvRU96NFN5cjZ0Wmx0dnRmaUFzLzVWeEtzRGlUVkFR?=
 =?utf-8?B?M09XTDVUek52U2xFSDltaWMvVzErZWFtbmErcWRXNEFqN1VuUUtwVnRUYlc4?=
 =?utf-8?B?RGZmeHpwbU8zMVI0RlJPKzNLWTVIRWdDVE91aktsSGFCejVyZzJLaXI0TTVt?=
 =?utf-8?B?TS9rclltNDVRcG9tcUlrOVhFN2pXQytsNEhWamZPZFBpeWRGeUxjZUszODdY?=
 =?utf-8?B?WFBMdlVuZGt5cUhnZnhpVjhqNXVSK1BQRzlHUCtETnNRanowaWU4dUNoSHdz?=
 =?utf-8?B?K2k3a2JMZVdScU1OY0dURFZGNCtpQkxXUzZSTzVBam9iVlZMRktUYlVRQVBv?=
 =?utf-8?B?Mm13UkNiWEZVZEc1V2dDSXlUVnQvcWFBU1V4dU1qaFRWbC9raWIyUlFzVU1Y?=
 =?utf-8?B?MXlUbEw1VW84RTM5aVdjL3BGUmtSUERjM1V5bFlFbkt6R0REakNDcXVYTWRY?=
 =?utf-8?B?QmJvSFNKWkR5eDE0emlNSEdhZUFMN1dURlpmS2pTQjFsa3JlS3hxR3YvN2Ru?=
 =?utf-8?B?bFhKbUtOL05XU0JVYzVsbHJzZmNSTEU2WmpXd3ptM3ROZS9OS2hrSzAzc1dK?=
 =?utf-8?B?RlBGK3Q1QlF1SlI0bzRWSEdsMWtSRW1PWjdkR3UwWWc1dmNXNEs1djRSaTVW?=
 =?utf-8?B?dVFiYTJoaUlHcUd0aVdDZzVtQVFYd3RKdkFrZ0NDRFliSDlndStFLzJxdkMx?=
 =?utf-8?B?eXJaWEptbW8vYXMwS0xNVklJWDEwSHVMZnVwUzl5UFVWdndVeWFQa3NlYWRv?=
 =?utf-8?B?aGxwQTJhSkRLSHd3K2g4UGlPYU5ZcGtzSUZEemVEYUN3NWJabmNiMWMydGJa?=
 =?utf-8?B?bDFpa3ZSUzBDNzd6TDdmaUVzNXVZbFRYMUN6VVRiR3J2ZW9xZERBRkhWVTF0?=
 =?utf-8?B?dXkzK2hQS3d2eEpsVDBGSlkwaUFpNUVRT2x1clhJQ0tUZG4wb0RoWGxQTzVM?=
 =?utf-8?B?dkhHRWVucUNLZU44TW03cVRKYTczbmMxbldhZXpsa0lSQTd4aHMzaU9kNVBL?=
 =?utf-8?B?a1IwR3l6amwrTEgzbWZ0MS9XOTAySnQ0eWRVUzhVSDZOaUx4bGZjZEdWaDVk?=
 =?utf-8?B?ZDFBYldkOVpIdjlFdUZhQXlvc3VkNXB3aVpLR2lIekY5eGtaTGN6cVNZa2Za?=
 =?utf-8?B?OHcydEhaU1dINldqaFQwTTVIWjRqRXlWTzV0NS8wNGtqMEQ4bkJQRmhWZ1l2?=
 =?utf-8?B?VDREc09OdWFJTDE3WU9hZlZHZVRxZUY5MkhSZFl2d1JLUklWK2lIbEl1dHo5?=
 =?utf-8?B?RHRuUjJnajhhQW1BL0RNdU5DaEhlRlRseTZ4V29kM2lhMks4cGM2TzB6VU1I?=
 =?utf-8?B?VGZSU1NObnFtZStZRUh1NmRJZjhaZ3d3S3hIalAwS3lDNlhWVHk0Q3FRa1My?=
 =?utf-8?B?T3VkRkoxUzFqcW83RXM3cFhac0o1TEw4TlJSeVBUOFp6T0NOWFpPWXpNUmRm?=
 =?utf-8?B?VmZvMG5LQ0owNVNWQjhGQlU2TDUxUGdDVERxRXVxZEpiTEp3RE9jWnV6a0hq?=
 =?utf-8?B?bXVBR05CY1VVeVlOdm9rczVyTzVMVHpRNUtmVTdra2czRWN3ZG9yT2FsbEZ0?=
 =?utf-8?B?STEzb05kaFE4Zmp1Uk94dFFZSjQ0dVFkRkxIOTY4TUdXZTFpM1h0SXgzckI2?=
 =?utf-8?B?c2RUOGZMV3lkdkNjY2FIYVNPM1d1a3FtWTdMOHhoZ0VUYkV6aGE1MmlMY3pn?=
 =?utf-8?B?Nkt3TjlGWnp3NUxzOTZVOFhBRmk5QVByeDZPQm05YVAyT0tQTTFLYmlPKzl3?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59769a3d-c688-4e38-fdd8-08dd445a40a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 13:54:17.9947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CB8h5H7U0gcjs+OnEZtLjj8YazeX3hCQ4OgRwGTSZtqrmo7wkf10NnXWoTJzcJq/S4a8rA1Sr7hXSnmG9l+AUp3l7cbQAl2Fvh9Ql2SUEPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
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

VRAM manager is related directly to struct xe_vram_region so it
should be inside this structure.
Let's move the VRAM to struct xe_vram_region.

v2:
 - remove xe_vram_region pointer from xe_ttm_vram_mgr
 - stop use dynamic alloaction for xe_ttm_vram_mgr in xe_vram_region
 - rename struct xe_ttm_vram_mgr vram_mgr to ttm

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                 | 10 ++++++++--
 drivers/gpu/drm/xe/xe_device_types.h       |  6 +++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  2 +-
 drivers/gpu/drm/xe/xe_tile.c               |  6 +-----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  1 -
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  4 ----
 6 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 095794200438..c2724847ae25 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -145,10 +145,13 @@ static struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 	struct ttm_resource_manager *mgr;
+	struct xe_ttm_vram_mgr *vram_mgr;
 
 	xe_assert(xe, resource_is_vram(res));
 	mgr = ttm_manager_type(&xe->ttm, res->mem_type);
-	return to_xe_ttm_vram_mgr(mgr)->vram;
+	vram_mgr = to_xe_ttm_vram_mgr(mgr);
+
+	return container_of(vram_mgr, struct xe_vram_region, ttm);
 }
 
 static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
@@ -177,12 +180,15 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
 	struct ttm_place place = { .mem_type = mem_type };
+	struct ttm_resource_manager *mgr = ttm_manager_type(&xe->ttm, mem_type);
+	struct xe_ttm_vram_mgr *vram_mgr = to_xe_ttm_vram_mgr(mgr);
+
 	struct xe_vram_region *vram;
 	u64 io_size;
 
 	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
 
-	vram = to_xe_ttm_vram_mgr(ttm_manager_type(&xe->ttm, mem_type))->vram;
+	vram = container_of(vram_mgr, struct xe_vram_region, ttm);
 	xe_assert(xe, vram && vram->usable_size);
 	io_size = vram->io_size;
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c7c285c6a6c9..6d44de9a31f6 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -23,6 +23,7 @@
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_ttm_vram_mgr_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -104,6 +105,8 @@ struct xe_vram_region {
 	resource_size_t actual_physical_size;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
+	/** @vram_mgr: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
 };
 
 /**
@@ -198,9 +201,6 @@ struct xe_tile {
 		 */
 		struct xe_vram_region vram;
 
-		/** @mem.vram_mgr: VRAM TTM manager */
-		struct xe_ttm_vram_mgr *vram_mgr;
-
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b1d994d65589..af788c147ca8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1560,7 +1560,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram_mgr->manager);
+	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 2825553b568f..d9a7a04ff652 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -94,10 +94,6 @@ static int xe_tile_alloc(struct xe_tile *tile)
 		return -ENOMEM;
 	tile->mem.ggtt->tile = tile;
 
-	tile->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram_mgr), GFP_KERNEL);
-	if (!tile->mem.vram_mgr)
-		return -ENOMEM;
-
 	return 0;
 }
 
@@ -139,7 +135,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	int err;
 
 	if (tile->mem.vram.usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram_mgr);
+		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
 		if (err)
 			return err;
 		xe->info.mem_region_mask |= BIT(tile->id) << 1;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index a8c37fb4fec0..9e375a40aee9 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -342,7 +342,6 @@ int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_vram_region *vram = &tile->mem.vram;
 
-	mgr->vram = vram;
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
 				      vram->usable_size, vram->io_size,
 				      PAGE_SIZE);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 4c52ced4ee44..1144f9232ebb 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -9,8 +9,6 @@
 #include <drm/drm_buddy.h>
 #include <drm/ttm/ttm_device.h>
 
-struct xe_vram_region;
-
 /**
  * struct xe_ttm_vram_mgr - XE TTM VRAM manager
  *
@@ -21,8 +19,6 @@ struct xe_ttm_vram_mgr {
 	struct ttm_resource_manager manager;
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct drm_buddy mm;
-	/** @vram: ptr to details of associated VRAM region */
-	struct xe_vram_region *vram;
 	/** @visible_size: Proped size of the CPU visible portion */
 	u64 visible_size;
 	/** @visible_avail: CPU visible portion still unallocated */
-- 
2.34.1

