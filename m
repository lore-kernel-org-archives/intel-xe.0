Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004CEC83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 08:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF47A10E316;
	Wed,  2 Jul 2025 08:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpjO7eYO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAE910E108
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751445944; x=1782981944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9ufC3tX4LIe8JBG2tu9I5qziHaAY4QsBlJdCpmdKBTE=;
 b=hpjO7eYOULDLZvbSwsut0GOSW9MlamDjKwAoqsG2PNJR0ke0LBn7oOkY
 daULTNiHUxV8urNHDGQ+7L4IM59DNDxX/pcPHZdlzBYNbPmWf6qRMBnaX
 634X2l13bTZ3j0RBu0PKwENP89GJkb4De7xKgrH3xj2CtzAeFTEaqA1nv
 VVsaDBDGWcKabDUdZfC/d3FKLccY1XOOlf0TW6YVFfvfh4lM69egG81Vs
 J6AtxEc46Bo3E7qT3HrTnNe5gudRy1uShozsxuTWM1dUE37ClL1f47Mkc
 p44fsboSArDP4V8VHM3EjCVZeJnoO+fnmwdhc25uUAWCTQHi2yVUUHYdC g==;
X-CSE-ConnectionGUID: afF+MciOSnmjLJjeYIjQqQ==
X-CSE-MsgGUID: iarGIcQmQ4GqBjzdglyIwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53597995"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53597995"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:45:43 -0700
X-CSE-ConnectionGUID: 1TO0gTNiTL+CGTKf7SgN6g==
X-CSE-MsgGUID: GuPsYU+mT4uL1SGl7Vq9kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159531584"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:45:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:45:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 01:45:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:45:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQqdGZouqPosTpC+Sy28CeLBAh7EJY2Lq3K5KRWpJPi9M6kwQ4Nyfv1m8f/Hd3ioQ2IFVFEQ0ykPQfQXoEGcZgsW5IQkMFhkIkyLeQdOoPSqHE6S6QbyxyHWtXk0oRhrNe30LsWM5/oPznGPtKgQzczZMK03pP9qEv0GCrJtL1QbQhOoHx8Vol/HkIxsRDuREBaph06s1AT03hsGSEKdE2mBKzhHQipf49370QA/CuFKZ9SkvSCNKHUZzsIDJqW0VOkUp6zrliBjeuTd/UrGBGa2RemRbnoqd8Ob6V7k6QfkIB889yLkYg4YVZn5TBzt3M/MM6fHOQfk00lyHowZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjiJSD/gtsnH00NtG20BrLWKSIt0ZOranAXiiXDQ8m8=;
 b=ntEIhgSzPlAL2vDpABD3+SxYpg5CITvWm/ZPNo6fFPkRoTr95ovfBEw+01Uc5k7ZSfQoAJILHVlry8HmPtAJ22K8SupJI7rNnh5487AwifdyuM1xYZahyCEGxXwHUrOfIjgmDitsonMsuQYBQ17IPKrjcQ07sX5i7D0jXwM5+oW5SDZFlCwyjCz2gH608Sc0m+XrRqrmDWb9CKWlMT3DljpTSsQVgY6x+mH5ckPc+PaQzETRpqkmlgsz4ugFikC33D3XdxigWZykz1J2MeRp3H7QXAHi6qgAGxJYoDKqdhO4fj4cQEkpfit1BkkJKguTPjcL9O0O3JRigW1Rr25Ddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 08:45:05 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 2 Jul 2025
 08:45:05 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v8 2/4] drm/xe: Use dynamic allocation for tile and device
 VRAM region structures
Date: Wed, 2 Jul 2025 10:44:22 +0200
Message-ID: <20250702084424.3609863-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
References: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f2e6c1b-8bd0-431b-b945-08ddb944bdcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTVEODJLbmJTTExxazdZU0Q5ZnlYQnhVTGdVSWNRSGx5U1c3Nm9DR1hVNjZm?=
 =?utf-8?B?a3JRTjBaMkViZ2tlTmRlQzJFUzZuTjh5Qy9YcDNGbG0zVmFPWlJtZWNiOThG?=
 =?utf-8?B?bUhzZTNaTzlZYjNRRW95NW5qVlBVQWJVOFd0NFVpWEZ5anRNOExhaHJhWXlt?=
 =?utf-8?B?cDBxekNDajg1SkY3ZXFLOEwyVVF2TENUbEtKcWs2VkZGZnBFVVNQNFRiT1dP?=
 =?utf-8?B?THB0QzZ5Vm5DUGdBMk1QUWtqWGtjQTlSZFhUa3FjM2duMFdkNWRDU0R0cXNX?=
 =?utf-8?B?d25Kc3E0R29VM1pJVmZpSlkrZkNCTnVpQWhUMUFFeWd5VDV4cHJRelNEeVE3?=
 =?utf-8?B?OFRCWTZjMFRpeGNTMGhIUFZQK2hRRHpoOGJXL21PVzdpd25ObkJkL3ZkazZC?=
 =?utf-8?B?SmRmZWI1S1lQdjZrZUhpbEUzZ3RkY3dlTjhOckxWMkNQWlBJRjFvdU1zMWdv?=
 =?utf-8?B?aFRYYU9UV1U4Y1pNUGhvVnRlU3FqUG9iakQrSG04cFNjMnF3RTR0dndvRnFh?=
 =?utf-8?B?NmZ6Mkpmb2x0ZjVDdDZHYW1TbFY1bHlVVDMxcXhBUmcxVmhYRERRN05JK3ZS?=
 =?utf-8?B?NE1wOS9UcTVsMFRWNExFV0tiaE9MVDY2SnVkTThhRzBYT1F3ODRaWVlkKzB2?=
 =?utf-8?B?Q3pad3M5Umg0YVllRUJSV2N1WDhaSUxzMUVscVpzVVBkcnVXZlFBQUU3bGY2?=
 =?utf-8?B?aE1qd0JBR1IxSVhIWmthamRVT0piOWdoeE9SMG9UNmd3bEpaVFJ1a3Z4Rncz?=
 =?utf-8?B?QVVFNEdIYTJkRk1nc0UwRGwzUlU0T0Y3WlQvb2NkWWNLZEh3b1BOREd0NjM1?=
 =?utf-8?B?ZTdZNE9SR2JpdHRockc3ckNTUWZhSjBhTnJnNWV0T0V1NFVkdHpHbkExVXE1?=
 =?utf-8?B?cW9Yak1MY1N1Ri9IR0hyQVNBd09jSHpocDY5UDdSRkFrdCtDL0s2eG9ydGpr?=
 =?utf-8?B?QnJQYnRXeDFXVlArcWliRElxM3VPcHBrRGxTY3NhSklWVEo0TVVKbUUzU1lS?=
 =?utf-8?B?Yi9iOEFBYzY1M0w3MnRWYXJ1bGV5cTBTdEw3NkU3Mkw4Mm5FQ3RvWjNtY1dM?=
 =?utf-8?B?RFFMbzhUdWVaQ1RjZzdkSG5hNEhkWXpNNi9rejU4cGd5anBLT3JJRkpReUxy?=
 =?utf-8?B?N0haWU1tMWdNUklvbC9FWFZucFlxOGhDeGpTT0lLZk1hUlVDcHZyVnNsODJ2?=
 =?utf-8?B?TXFpdHhJWFM2RlF3VnJCeUVvSU1rV1RkWGlSVE5NRWhaUEN4YmhUd1BFeVlX?=
 =?utf-8?B?RnRIN3k2aXF1dmxHZ01pNkMyNk9HL2VuZUVYVHk3YmRFRmZ4c2wzYkZiUzAy?=
 =?utf-8?B?RTltcGNjL2hkcVRJWXZzaGQ3SFB0UDhHWEk0YzQxWFAxa1h4bnlEMlMvK1BI?=
 =?utf-8?B?Q2wweHd6NUtQUFRCSmxYdGFEdjRiYytJYnZHQi9HSm4ySlA2eVVaTUhWeHFK?=
 =?utf-8?B?ZSswOVVWODVPSEJWRWxCUDRicFpGaGttZHZ4bG01cUl6RHpIb2x0RG9GU25M?=
 =?utf-8?B?SzAvdThIdVZaTzhVdEhRckV3azdFRkJZczd6VlBNOHpubzJEN2Q1NFNuSzlL?=
 =?utf-8?B?dDR2QklGaHFTNW1WNktkdDZwdTFBQ1RuSCs4QXpFUXFBZVdGd01YaUdMZnVl?=
 =?utf-8?B?Qlp1NG5pd3VNVnFoWnhJWHBKTDI4eEZyZlRTZXhPdUdkYkZQaVZycWpUMlV6?=
 =?utf-8?B?cjJyVnk2Z1AwelJsQlpqdTlCSEhuNGd5MXgvMkp2b09GU0dJZFR1ckJORVJl?=
 =?utf-8?B?WnFVU2dYR3YwRU1ZZDNhSC9ja0hrZUNWYThyWGswUGN0ZFZyZCtyOWxuQlo1?=
 =?utf-8?B?dGtqNDBnQ25kbWNDK040Q01OQXE5L3NKV0JTS0lFV0cybU1WcUhnRnczWUl1?=
 =?utf-8?B?VVIwN0twN2NuK1JjeTJPTloxVVdCbnJ5b0RkZndsSFFJbTF2aDFjMzZKV3Bk?=
 =?utf-8?Q?TSxjoia7YlI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTRwQ2pUakQyZUdpUkxxT1VVZWx4UXA3MkJJUHZORU9KMEpSeFZXQUFkaGhw?=
 =?utf-8?B?WG52YjNra1VSbVNUVTBpUlFzcHFocEZsN3ZSeCs0NCswU3F3djI3QVhCUjVo?=
 =?utf-8?B?S0VGQWVlWVQ3d2JiUytmWWt5UGFTNzZ4RzcxcjFSK1BMd1J3bjNza3YyK1hX?=
 =?utf-8?B?Q3lJcUpMYnpvNVJ3dkl1NTZiRXpXOHJjTTNNbEZjcVdLMzcrM0lQeWhtRlFa?=
 =?utf-8?B?MUxudkxNa0l2ZXBsTmpBOWNGOTBueFRSYkMwMXZ5bWhxWWd2MzRSSWQrS2dr?=
 =?utf-8?B?Um94ZklsM3Jsa3R3TmZ4U3prYW53OW1JQ0x2Ny9xNUNNV3dieGJzdWhqMTgy?=
 =?utf-8?B?a0RCd012US8rQkR0ZHB6SkJZSENBMTR3YXJGSjJNTWI4R3VCUmFzczNSQ1hD?=
 =?utf-8?B?UFlyQ25LN0Z4RUswMnJQYjZEcEh6RTl6c09uaEVwdUFrWGFacERsNytQdkZ2?=
 =?utf-8?B?bVpuNTF1SERMQlA3WDJGL0VmR3JIVS9MbGhIVlBmQlA0bWJsSnVORFhuaHk1?=
 =?utf-8?B?d0pZVGJFRmJJNDhJUDNMWFBMSGlhL1VxRndqaCswdkNpbmFWcTNwK1lnaHVH?=
 =?utf-8?B?KzJ4aFhJenNqZHgzNFRqdHZydml2c3hVdGhxYjNSNVV6aE14WTZHcTNZczRE?=
 =?utf-8?B?M2VGWGpZSlF2YjhPWlRXSmFhYlRNeVZBZ2k1K2JZREg5WC83cTNDb2owS2Zp?=
 =?utf-8?B?UTRYaXM5VHF0UWJDOFZodDlnOHk5dUFETnF1QTZDRzlibVBFQjZVcjZDTVJR?=
 =?utf-8?B?U3c3KzNMQTE4aVlZWDVSWHhGTXpEQml4OHVablRzak45elJ2UlU3VXpxc0NP?=
 =?utf-8?B?NmpLanNyMW1DeDhad0xuVzRQV0FIQVZkdlNGbXZnMU03WnNxZXRXVTA2Vi9O?=
 =?utf-8?B?SmhUR3ZVZ05EWUZzMWltdGl1ZXZoZmwvVDVBcUhnZU5JcEN1YW1tTm04UDBw?=
 =?utf-8?B?TWVnRGNXTFNhRUh2d3AyNTJyNzZ2SUF1enZDVWd0NVRoNDBCWDh0NHJrWEg3?=
 =?utf-8?B?d1U3dTFLTk02M1FFN0NiN0ViV0s1b29IbThGNTNxdlc3MkozdzZ2RXFhT0VR?=
 =?utf-8?B?anYyeDg5YlpHcGx5TStxcTk4YzJMSVFoSHhKRjloWW5tTTRjWlpDRDBPVXRz?=
 =?utf-8?B?aTRpdFo0UWVQbFQ2STNxYnV5dHp6YzlicDhZeEppNndRU00xRzA1Z1BnWXJt?=
 =?utf-8?B?MXIzbTFXWnZoRkFNMHBFa2FBYWdHYUNON0tTeGY3d3JnVFk5SmFQUGxDcHAw?=
 =?utf-8?B?akEvT1VTdGtvdkxiRnNES2txY1ZxVVIxM0YvSis4NW1qQkdXN2puc0g0U0RF?=
 =?utf-8?B?cXZSYktNWFgxQktRdkFoSGJSUXRaRXVId0JodVYwNzhxQk1KdFFTZktYMXpF?=
 =?utf-8?B?YklFc1pBU1Y0dkZkenNObUJRZTFXTDZEeHA2enNpQUlqZTdQQ0QzdWU3SUFG?=
 =?utf-8?B?SGduY3FBZzRIZHFvYmowVXdpdSttNSswT2c1ai9WSmZXRlhtUmVvSGl0aDgx?=
 =?utf-8?B?MkxReXJrUGZheVZyRUVFbFlMY21Td3JjdDcwSkRtREdlZ2J6T1NnTFBBblZ4?=
 =?utf-8?B?R3ZwWU94ZndHNCthV1dheFhvRlU4ak1IL0ZqRkJVR1BINWs2OVZoOEdpVWRj?=
 =?utf-8?B?T1FiTmhxUy8vMHVTUERGdjlmdEhzTjFXeHJVYkRnOXZ2azBJUWR5eS9yczRJ?=
 =?utf-8?B?eHZCM0dsWE1xSWE3Mm03cmVjTHYyYWVkNzk4TnZ1L3BsOXpYelJhSS9RdDlV?=
 =?utf-8?B?dlZQK3B5MnM5akM4Wm5UVWNONi9iclExZlY4N0Z6VTdKS1p1UG9TQnB6Y1N4?=
 =?utf-8?B?M0MrWDIrWDNYc01KMlpYdWJ0aU9EUHUzcU1tR0xNRWswYkt1N0dLRjFXWEtV?=
 =?utf-8?B?Zks0SmxmRUY3dlZtS2NQRzU2U0N5Ylg1NVFrS0FKTFJSQW1OSjA2ME1lQjF5?=
 =?utf-8?B?Vkc1M0RXaG8zaVhFWStWdjBlS3IyS3ZGRXBsbG4zZ0ZtOXJsYnJYcFEySUFy?=
 =?utf-8?B?TlZhbWlGdmJHbkVHa2hDUW9rTzZNNlY0b1l2T3MxTFR5SjNUQmd6L3l6cmJn?=
 =?utf-8?B?dDJUTjNBdU5kdEZoai9KQzM2bG1hVFVWRzE4MFZlY1B0MUZ1U0w2MUIyenJj?=
 =?utf-8?B?dXJNQk1oUGdWYWllVmtIdm8vNkVzTWNPSndoMDhva3dJSVVZb280VThFaXQw?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2e6c1b-8bd0-431b-b945-08ddb944bdcc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:45:05.1461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYENXRGD2d/FTwyB9G7O1wLuEZFcyg1WvkFcDY1HD86WlnVuUD7omb6NsYVEU2XWWDESKER8oJsAGEqcXJoYz36JIIOwzcSsaajgUDaykz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
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

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
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
 drivers/gpu/drm/xe/xe_svm.c                   |  24 ++--
 drivers/gpu/drm/xe/xe_tile.c                  |  34 ++++-
 drivers/gpu/drm/xe/xe_tile.h                  |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  10 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   7 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 119 +++++++++++++-----
 drivers/gpu/drm/xe/xe_vram.h                  |   9 ++
 16 files changed, 200 insertions(+), 77 deletions(-)

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
index 0b73cb72bad1..19019b032c78 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -685,6 +685,21 @@ static void sriov_update_device_info(struct xe_device *xe)
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
@@ -729,6 +744,10 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe->wedged.mode = xe_modparam.wedged_mode;
 
+	err = xe_device_vram_alloc(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7e4f6d846af6..bd8aa742618b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -74,6 +74,8 @@ struct xe_pxp;
  * device, such as HBM memory or CXL extension memory.
  */
 struct xe_vram_region {
+	/** @tile: Back pointer to tile */
+	struct xe_tile *tile;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -213,7 +215,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
@@ -394,7 +396,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 		/** @mem.sys_mgr: system memory shrinker. */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index d186f780885d..e69a05126dae 100644
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
index 0838582537e8..0d169f23bd6e 100644
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
+	resource_size_t dpa_base = xe_vram_region_dpa_base(xe->mem.vram);
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
index 824461c31288..90494f16d3d8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -714,12 +714,18 @@ static int xe_info_init(struct xe_device *xe,
 	 * All of these together determine the overall GT count.
 	 */
 	for_each_tile(tile, xe, id) {
+		int err;
+
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 
+		err = xe_tile_alloc_vram(tile);
+		if (err)
+			return err;
+
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e8e1743dcb1e..ba9b7482605c 100644
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
index 066a3d0cea79..fb0473fa9098 100644
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
index d9c9d2547aad..2f5243343446 100644
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
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
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
index 3a4c84e9efc6..71f463f2c3be 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -147,17 +147,17 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
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
@@ -279,10 +279,10 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	xe->mem.vram.mapping = NULL;
+	xe->mem.vram->mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-		tile->mem.vram.mapping = NULL;
+		tile->mem.vram->mapping = NULL;
 }
 
 /**
@@ -318,10 +318,10 @@ int xe_vram_probe(struct xe_device *xe)
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
@@ -329,45 +329,104 @@ int xe_vram_probe(struct xe_device *xe)
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

