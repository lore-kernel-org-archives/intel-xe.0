Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A841ECA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 17:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556A410E36C;
	Mon, 22 Sep 2025 17:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSPAMLYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1366610E36C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758560856; x=1790096856;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=CpJuDYevrbDY4H7FaDeHtivNUQwo8YxSba0HnNFuhnQ=;
 b=LSPAMLYjRh21WYGr0Y8p0VaMNy3jioZh/S8s5SlK703ixgNhRd/v8XQM
 VV4/J30ODQgiJ7J0T3wqkRiJsuxAt1Ujum524SkRdf634Phzf3pWE2zCj
 dhjQZg+6/tJHl+7Smay+h86l8Dxi0/1sMmuIw1R/1mA30v27MkKtY7PJU
 c0UpGFOZiZ0JLStxZxmFqpqWkbaC7ohCyA6B9bw6HIvd+K35vQxM7Kf2P
 sEaCaasjj4BcvgiT0nhJP6wDsOZzwu82AH3V50+uFSNM7D7/A91e2WaMU
 WczhOmgMpteb6okv1GJPjMMwOy1z5XCI5yJ2XqrKM74PgTBVCfiDdiPAX A==;
X-CSE-ConnectionGUID: y/nrnTavS6q2gVPLcOymJA==
X-CSE-MsgGUID: rfR72JWmQhGvPMru4I7YgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60527357"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="60527357"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:07:35 -0700
X-CSE-ConnectionGUID: 8UhphR2nRQmpZbtOJOVN/g==
X-CSE-MsgGUID: BquJfHRZTraovKGO3evWJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176456854"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:07:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:07:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 10:07:34 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:07:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQnIR9rY+j0WrlXLxbSJrq1bUGykizz1zXsXsCww5pv8F9rIUtwl2v8ezU5oHnstQiGIlpYciwmKw97L9tCVWkWca/18GC1bvUcmU4vGAuN7S6yUmJPQpeoy3l+xPEEI88IAaEXSmi5piAaWrPNuL88nPwI5eigzWczGBs4u4+65FQNdFIKp9WTU2HPCGbSetCjs1+0Eljjlh0QS2Vd7BOeI9LKP4PfhY66ZZzOkOR09eLweyufQo+9WZ9rlJPYJ7QvSzETj8oFULfAS9GhEhLnhtI0xdDdmxZuql/O5vafQb0AZUEIBi9GcWG4wBTESzIdbznwn+JVoap92/kSVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRfrM7LUFQsIJ0Snu6+q/oow0oK37r0g68O37BAg83A=;
 b=Z2uQxQcfUyqx+p3+n6SDShw7fJZXYjLbdJz/LZ/zV72FJnh9ESCSLihMy0Cdais9gxqmpJn4w+V2fIMGyamByuPu61bCPqViLCEXnq4aPQQ/0oxSti+B7uF0JHNk8BOc5vKXhIFonaRxO21JWBxXAooj3SEUDbKQgoFmt6PodDNZazp01mxgB/JjqnRxhemqCh4qk2lFCOoIDWyojiK7IexeqRMgBEfzzg/7/irU02oM0YOonymSjJrTExPe3M/mquRpXmpVDMEe7kLDjXGeyGLa+BLq6+h64zIsOWclWuZ3ZURgPLUrdwR6RyMvXcJPZbCaNXjm+nkSb055VjdAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB8097.namprd11.prod.outlook.com (2603:10b6:208:457::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:07:31 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:07:31 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 0/5] Preliminary support for separate VRAM region for
 kernel allocations on tiles
Date: Mon, 22 Sep 2025 19:07:02 +0200
Message-ID: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0051.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0b94e0-e8e2-45c0-5885-08ddf9fa844e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wno5NUFmejd3SGtJZXVYL3NGckxqSmVvZWc1amdEdm9pMFk3a3V5bXQ1b3Ar?=
 =?utf-8?B?RFdodDN1eDRja2c4Y0FGa0RGb2dNeWlMcExWUTJUT2NYbTQvS1dpZEorRUtR?=
 =?utf-8?B?Q3A4eGlaYTc0eWYvVUt5c0NycGZNTnNibVI2dDJtalpDT2ozUHl6ZXNucFhJ?=
 =?utf-8?B?cnJxTEkrZklBNElBZ1Vid2RxamNEamFQQWo0NXFIM0d5MGw2Rm4yOVJPbGgw?=
 =?utf-8?B?dDlheXRBVzBnZ1Z3U1FZYkN4WHNkTk1hei9VM1U4dEFFYTNONlpJZ1dTejla?=
 =?utf-8?B?MWZBWXhacHlYWFlTNEFaODZMME1jWk0rbldVU2ZzbkFlellMSmRwSURIZ1A3?=
 =?utf-8?B?NXFwVnA1ZjNnSVZ2V29vL3ovYjluRW5hYjhpdHFjODZxeGh2OG52YUxTVDQw?=
 =?utf-8?B?ZzRvbi9XejdkRk1xZndOYnlpYStKbS9MWExpU0hlejBQekkrcE5NQys0L2JG?=
 =?utf-8?B?NFpzbnJHN09JcFB4bUZXdzJudWNXam5nQjV5ZnBVRElmUFE5RmpkdC9DT1gr?=
 =?utf-8?B?c3p3emZOWU53L1RYVTFDb09NczdVTDNOVENwWHFTRVFwYzczSlFaMDN5T01Q?=
 =?utf-8?B?S1FYeVJoUGQ5Q3ZqVGk4WFJSZjB0MTRQcElqSCt6bjM5VldIMTB5MUp3U1k3?=
 =?utf-8?B?WUlmcHJlbkRwTjJpQzJTTUEvcDJIQnF6OFFUNGhVRzZ5eW5UY1J1K2QwWDhR?=
 =?utf-8?B?V01xcEZpZEJsK25CODdMdmJzdzAzOVJpWVF5SVkwTm5lbmdQczdKaGdTM2or?=
 =?utf-8?B?ZTBkcnQ3eGJ4a0VNQm95eFJudVhuWkdHNzFmOWRaa3M1WGhwSkh1Y0FEdTBr?=
 =?utf-8?B?dFZqTUpXSjRZSE1mbW5XbmdJNWpWYU5xQ1lFTlpaV1Q2WEVEK3lnaTZ4d3RG?=
 =?utf-8?B?YUlpdmdweWJKcUxqalZtdmkzeGd0QnJSaGZRVlZGT2ZrYTVsdENZWHcyVXBE?=
 =?utf-8?B?d0o3NzlNVHZ6VDVWZjk4ZTV4VTI2OGVZK3VIVDhLQkFYMDVUZ0g2ZnVqV1c1?=
 =?utf-8?B?VEZWcUh5OXBvSDgrblJ4eFJId1FQNTM0Zkl2Q1pZNWhFMUVhVitJRjhxUEFS?=
 =?utf-8?B?eUlRRlNBZVhIc2JXSSt3Y3IxUFNBZUFUbVIyY2l3a0lhUW5lRlZyaWFkOGYy?=
 =?utf-8?B?c29JT1IrSnY5bU40alRXYUFPeDdZTWN6L1ZUbUQxTkZOblFkZnl6akxzQTNt?=
 =?utf-8?B?S1BPU2NkajVWVGZxTm9LbXI4Ri9HL1cybkNUYjV5VlR6Qks4bWpiSC9UMmw4?=
 =?utf-8?B?M2Jjd1Rwd21BQkpZcEd0dTY4UWdkdjltOGZVWk41VXJhNEc4Q2xOdGV5SGF5?=
 =?utf-8?B?dDlYOXdTUUMxSlY1bHg0UVhMUlVxV2F5SXA2WmQ0YklGRmE0Q2hkY01pVmRh?=
 =?utf-8?B?U1hYbmJNK1FteWZjaHFkdmxuMnp5VXUvWDh1b0RnWVFMZjJqcUFVd3o5TVVH?=
 =?utf-8?B?UElSV3RkVUdsUTFWYXptSVNncFlLa21ERmhOUmloTEIweGM0QVJJVlRJL3Jp?=
 =?utf-8?B?dHhXNXpabDNja0NkWGxLRUY4VUNrQmJZT3lSSmFUdUUwaDJTWjRRbHhTMENG?=
 =?utf-8?B?cU1xRmJuSnJnYW84S0Mxa3AxSGdJc2NLUmtxLzNZZmRtLzI0a3lFMzZZYmZE?=
 =?utf-8?B?aGMxcmVCM3l3a3Q5ZkI4cXFNdmVVNmdnSWE5ZEdsQmJ6Z0tHWG1VdkJteC9i?=
 =?utf-8?B?eWNUK1RsNHZ3Wmh0UUlleVNTdmg4WFBqUG5NR01DRFNMdVR3dEVLVGZDYnhC?=
 =?utf-8?B?TjBUQU1JalVJc3AzSHpNYnkxQzNNT2R5MU5FYno0L3pHSVRNbk1qZ05tZWVM?=
 =?utf-8?B?K1d2NWZ2di90OWJIY051dnNFWitMcGpMTXNpdHozUi9iYzAvWGF4OTVSRlVl?=
 =?utf-8?B?WFhwTWtYY1lHS2MwRDI2d3dSSG9pMytTUktuLzBpeUpGcUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlhYTmpJbm4vNHVFQWFGZVBNY3p0QzFRd1g4dm45NEpRU0grSEl3L1FQbVRk?=
 =?utf-8?B?NzlCbDVVcDNsTTJnck5tL2tvaXBESVYvSUpoK3hTYU8weHRIQVh1bkdkclFY?=
 =?utf-8?B?RXozZStFTHBUa05zb0F3YkhTU2RnelA1MXltTFJzakxsblZ0VCtwOURzcnZt?=
 =?utf-8?B?alp2dEY4Z1RhaUo5cDYvMytmUkdvL3BIYU04THArRzNOWXAxT0lyOW50em9U?=
 =?utf-8?B?aGQ2YkdaRC9YQm90cm51Y1VEWjBtYkV6ZjNucWNqbnRLSWtUS2xna3lhNDIv?=
 =?utf-8?B?cloxVUpVWWxHY3hoejlyRzA5eW1PWlFPeTNKcW5JNjl5aGdCNlZnbjd6Yjdo?=
 =?utf-8?B?QWdoVjhtS1VoKzBiamh4QkQrc3F5dm03VjVDSWZpRThEQzFXclcrcWs1WlR6?=
 =?utf-8?B?OUxHTkNBa1p3YWwwNmpEbkJlOFdFUTBSTnMxS005VlRTNlJrMVBxSHVCZStE?=
 =?utf-8?B?clU3dFhqUkRDQlhlWnIzdnpBcE80aCsxYzY1MXAyY3kvRTh2SjU3UkxwelJ4?=
 =?utf-8?B?OU9ucEljeEtqak9jSy9rQVZudXpOQVBQMGs0M0VOdWRLdXJDTHFaNjI5VXps?=
 =?utf-8?B?bE5pRU1SNUZrMmx5cHhkNG5OSENlZC9wOFBCa1Z4cmYvQ21LZlE0ak5qaDhl?=
 =?utf-8?B?Ti9vRSs5eWdRazRraGpwUy9kSFFGSnpneVVuUkdGbEVmcmJEWDdkQjF2bksr?=
 =?utf-8?B?cVp0emd6VlBQQTAwRGZiUHdxWWtNbzJqcGhqUTA4WnkrWTlnWUhDQzlndmtK?=
 =?utf-8?B?cXN6K01rSjZYVHg0RVBiTWY1YVdXb0ZrQ1hKMUkyQWdyYUdCY0k0clpWa3A5?=
 =?utf-8?B?MnZHclovb1UweCtzcFR3dzEvVkV4N2J0eUNwSkxwTnhWaUtlVnQyNHBzZ0h4?=
 =?utf-8?B?aXYzMnZSZndsdURBMVlsMW43OEc0Y3puZktjUmtRZkVudnNBZ0ZjZlVLbXlo?=
 =?utf-8?B?SmgzRURzbDFubWdYUXMyaVZLRmZ1VjBaTzJQRFQ3YUxQc2FJYlFXYmJjNS9T?=
 =?utf-8?B?L1NUUVg3Z0RIV0JIZGZQbmNBVXRaT1FTQXRtRys1QUUxNHVLcHdiTDhkT2pt?=
 =?utf-8?B?V0xwVW1sa25ldUJvekFZQWo0cHJMS0czbUo2UFkzYVE2Uk9XMGdQR21VY1Uy?=
 =?utf-8?B?U2RTSUw1WitCSUJGZ0htVmJ4Vm9KL3VLN25aeGYyZkdIMlBsYXhJZll1MEhU?=
 =?utf-8?B?MGhpTWVKZ3U5ZVBLa3g4bXpua3kxeThpMjlYbjVVdWt3UGVFUG94Qy9veW1W?=
 =?utf-8?B?QjVBWnR0NkNkS2hJekZGVmJ1eFA4ZjJ3eG1VQmM5TElHWlQ0THV5NlRIR2xi?=
 =?utf-8?B?VkhDUXVTTjVOWTdDdkE1YVpCMXNGQzBSL3Q2NGw1Z0JDaGFxWUx4RVNERmFU?=
 =?utf-8?B?RjcraTlndkRxenFOQnhLRXpWNktYVmVVVTBqb1htNGNBaFlLV2ZIcXdTVlpQ?=
 =?utf-8?B?K1hWYmFJaGFhbzVXRkg3Q0RmNTM4c2lOTW9QRk5vd1R0VnA0dDVtU1NRTVlS?=
 =?utf-8?B?c2dVVWEva2JJRlR3cDkvMUc3YzUvaURaN3d4K0Q5UWZRZnFxakFma2U3NlRL?=
 =?utf-8?B?VmtRUW9FazhnVmdhbndIbHpSb1lDKy8rdUtWQXFHWUVVWkdONDRIYXU3RUs4?=
 =?utf-8?B?WDYydDZSZjY0VEpmNXdkTzE3NXhUbVFEdWtieFBNUmpxL3dVZ3ZudjdMSUZ5?=
 =?utf-8?B?MDVsd09SZXdTbStNNWoyUHZPQUNKOE9GVWF5bU1Jb09DT20rdXhHZkpKWVdy?=
 =?utf-8?B?Y0R1eVlvQWdCS2FUY2JvMkdXajNiMmJsR2ZsVEdxZXV6NHppUDVlSWZaTVpQ?=
 =?utf-8?B?ck50NitEYWZkaGxYNkgyWXFwRko4L2VqN0w4cWJCQWM5Rk1DT3hVRzVuOHZE?=
 =?utf-8?B?YTYxeExydENtdEZwOXkzZW56VVZoMTkzcUxEU0d3aWUwSEQwaitVY1RtY3BO?=
 =?utf-8?B?QnY0a0o2cTN1SjUwZm9CYjRTYkxUYUE3Lzc4ODg5M2tpTUpqMTBSN3phRnFF?=
 =?utf-8?B?RWdKVEFiNDZ3M3pnUkxqbTBEQnRQVFVUaG1IL253SmljMjFnd3JTemcvSkZY?=
 =?utf-8?B?ejltN0U0aGlhYit5cVg3OEMrSXQzNUVOcERFUlQ2S3NtWWVFcVRCc0ZqYVo2?=
 =?utf-8?B?Q0lQSTRYdjE0UENJYVNnR0Rha0I2eEN0L2NiRk95WDRXTkVSdDQwWi9sVjdZ?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0b94e0-e8e2-45c0-5885-08ddf9fa844e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:07:31.4819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Nk3jOqUkdEw58s95WmnfFnHcQCLshLBF7oGUy/ogc5neeUIlX5V9QYSWZGxXcMYOql/6ihzyGjaKmU2Pz+eqRUnD0Hxg1b0f8c995pgfeY=
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

Until now, all VRAM BO allocations, whether from userspace or the kernel,
were placed in the same VRAM region assigned to a tile. However, in some
scenarios, it may be necessary to separate these allocations and place
kernel BOs in a dedicated VRAM region.

This series introduces initial support for such separation by allowing
an additional VRAM region for kernel BOs to be assigned to tiles. In this
implementation, such BOs are identified by the ttm_bo_type_kernel flag.

To maintain flexibility, this series introduces a new BO flag:
XE_BO_FLAG_FORCE_USER_VRAM. It forces BO allocations into the
general-purpose VRAM region, overriding the new default behavior.
This override currently applies to BOs associated with user contexts
and BOs used for VF memory.

To preserve backward compatibility on platforms that do not have a
dedicated kernel VRAM region, the kernel_vram pointer will fall back
to the general-purpose VRAM region.

v1 -> v2:
- update commit message of "drm/xe: Introduce new BO flag XE_BO_FLAG_FORCE_USER_VRAM"
- replaced for_each_bo_flag_vram with the improved
  for_each_set_bo_vram_flag helper
- moved the VRAM flag iteration macro definition into xe_bo.c
- drop unused bo_flgas from bo_vram_flags_to_vram_placement in
  "drm/xe: Add initial support for separate kernel VRAM region on the tile"
- use hweight32 helper in __xe_bo_fixed_placement for readability

v2 -> v3:
- rebase

v3 -> v4:
- add 'drm/xe: Combine vm->xef and XE_LRC_CREATE_USER_CTX checks to detect userspace context'
- remove unnecessary VRAM fixup id

Piotr Piórkowski (5):
  drm/xe: Add initial support for separate kernel VRAM region on the
    tile
  drm/xe: Introduce new BO flag XE_BO_FLAG_FORCE_USER_VRAM
  drm/xe: Force user context allocations in user VRAM
  drm/xe/pf: Force use user VRAM for LMEM provisioning
  drm/xe: Combine vm->xef and XE_LRC_CREATE_USER_CTX checks to detect
    userspace context

 drivers/gpu/drm/xe/xe_bo.c                 | 78 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_bo.h                 |  3 +-
 drivers/gpu/drm/xe/xe_device_types.h       | 10 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c         |  7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  3 +-
 drivers/gpu/drm/xe/xe_lrc.c                |  5 +-
 drivers/gpu/drm/xe/xe_lrc.h                |  6 +-
 drivers/gpu/drm/xe/xe_pt.c                 |  2 +-
 drivers/gpu/drm/xe/xe_tile.c               |  8 +++
 drivers/gpu/drm/xe/xe_tile.h               |  5 ++
 drivers/gpu/drm/xe/xe_vram.c               |  6 +-
 11 files changed, 97 insertions(+), 36 deletions(-)

-- 
2.34.1

