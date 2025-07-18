Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21753C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 08:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03FC10E925;
	Fri, 18 Jul 2025 08:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwMdUkrA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2ED10E922
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 08:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752826692; x=1784362692;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=dlv7m/RK4K6+ozgQFtM/p2PuCrIrbHyOOyVruA5Ck0w=;
 b=MwMdUkrAh3JRAUxlNB+P0C/ooXOGjg0re6snP2c7/JdJ4KBkcl3rKpXt
 dVlEx6K9BVSNMt6LsDFo5Crv67SeRHGeHPQWrgUbMrM27s2obef+lFAN3
 KtwcOU3jNfa7L7ZvQUrbZTSVZn4PQAJNFhIBKkjPP+BuBtWV3r654Rxdv
 AGkTNOduuaEMpaD9bBr8AOMdThZ/qdnzkm3e/ZJVU2ubsWwLxVCgWhXL0
 Ys5YZ2HFtYt6zrkl478rmLGT4860bxyvbIKn/aj6JlET7NknB3AqlUV8r
 4fcHW4fvKOWvmX7QQ29lfCOp7wWUQ+6HrV4l+H/V09VeFUc0Izw4K40KQ w==;
X-CSE-ConnectionGUID: 5mN8qnjJS6GugSCk31M/fA==
X-CSE-MsgGUID: kfcwxphzSMS6znxfrVaVfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72567786"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="72567786"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:18:11 -0700
X-CSE-ConnectionGUID: HsezyPS8RqOuA9Xs7TN0MQ==
X-CSE-MsgGUID: adYNpjSYT1S7hGKr0vOj/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="158117541"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:18:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:18:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 01:18:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:18:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvxDUj+NaKbwlF1So6SjUz7QJKLpg1aarpYpwEddZjTtP39zGVqBtZ9TVauaw5uO9W8SNrqba8lWXjAmincA4W19DIAEfxtgnof5TI7ziJK4hRvJ2T+T+DSBaFd7ZteVLO8VANrWUJbYqH88VZwxAB9I6k/EZvlcDCo1e6QnQL1iqY9tZzJC2aGW0MIspRzVfP0y3zW4FUaNpP7nyfWyClaa5K8+qQGajxO79vbHdLZrlKaVW5INoaK+YE1mSkyAUUpiXqEbp+WI0E8/zI1izzLTOgfAbLbjCsZXMPZlbTBHFhXIveis/JhcBa6Gkc5VE4Z219Dmeq4hheehoOxVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m45AK6E24DdfIkIHp/FLdGCnO2JdrxNtvkJvhh0AUv8=;
 b=Bg2Y6q07hUn9SnBDpYxsTouR2b/PRBhV3gpry/aRu0s2QzbsaCJu/DpUknzmYKZTCh7/LfyASzjxpIf1NSBKjcj1egDydtutuVAyZp8iwPvSZJHs2Sqmq9cebXZ2jRWEUowVsbvEeBB86V4CVlgpvmfoLxkDSOjcFL+6/GuDhoZDUsDMzODs1fmV0aINt8D4kTGOeLdeNaVTlRPRGUUvfcui7rE4BrubNoHUv3KIFjbke9QTcIPZPToUVKE4ZEJBumDlgNrEiItAehUfsBWMDw+J3XyvwnpupVcGwWQNEMapyGi1TXrkW0zvgF9oEun7k7DJPOjgQ1frdRt0r1/+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 08:18:07 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 08:18:06 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/4] Preliminary support for separate VRAM region for
 kernel allocations on tiles
Date: Fri, 18 Jul 2025 10:17:48 +0200
Message-ID: <20250718081752.630122-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0230.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::26) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fe8870-327c-496a-f651-08ddc5d39f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NldDc005VjlsTnBGZjY0Z2kxdDFwU3JHNEdLWlQ2azdnUkIzYnpVQUFYRERl?=
 =?utf-8?B?aEdKaVJSaURKa0N3QmpEVFpOYTFGNEdxalpnelIwZTdwWFp2Tks3STNQWXA2?=
 =?utf-8?B?bmVjQUkvUThRaHp5RHdJUm5zZnlNaXYrZXVSUHplS1V2TlNLNVlkMGU0eUpQ?=
 =?utf-8?B?M2pRNWFYb05MeS9QL0o3VlhPMlp3OFlnRkZLQTNoNWpmOGFSOWNydGIvVVgr?=
 =?utf-8?B?aW1sWlIzRm9BYlQwZWxMQU9JY2h5eXJZN0hRV3VYMGRWblczc3BaZEFCYUhw?=
 =?utf-8?B?YTBadmlvUDdhZktjZHVXWUJTY1lQV0ZWK2JpSGlMTkJOYTA0N0Z4bnNoUndW?=
 =?utf-8?B?ZTNXZ3BjaWd3alNhMk9wQ3RIZDcwMjdOK2dQbjc2N3VjRnJJZXVrTnlQOEt1?=
 =?utf-8?B?TGd5TGJpc3hrV1NIVlRGdkhXWFF1YWltYStDWmxxK2Nxa2MwTXVIRzJRbk4r?=
 =?utf-8?B?QzNnaVJPRmdwbmh4RlpFazk2a0E0VjRMUVYxblc0Y3d1SExUZ1ZSQkdCSTkr?=
 =?utf-8?B?NGZwMWxicXBzZnF1bmtGc1YwbjFJVmlPNVhlWkkxSkdPbXd3TlB4dHFicGtq?=
 =?utf-8?B?bnFNZ24wYmxiVE1UOEpQSlNLOUhKNGlTc05LTEhMVG9FenZYRlRwelNIdEdO?=
 =?utf-8?B?Z3ozc1o4YnhlQ3doZExESmtnVUVVRGREcVIwWTUyaTJDOWIwdnYyalhuU3M1?=
 =?utf-8?B?eUNCSU1zdllOT0Rka0gwcE5KS2J1ODVabkhmNlp1UVlTQlM4UE1wMVNORWp5?=
 =?utf-8?B?a3pRaHU1cmJzMzlLS2xBOVNXeDU4czhxaVIvWXRnQzA1b0lSMk45dzZtTXJj?=
 =?utf-8?B?NnVXa3E4a0lEU3pVdWxPdytqaUlVUjREMjI3V2VERndOWCs5WnZyNTZBMGxK?=
 =?utf-8?B?NnRsaWJoZERsMW1HdXRva2lqWVBPNUJHR2lrMU9wSlJtZkprWXRML00vRDE0?=
 =?utf-8?B?Z09Ddk9OOTRXQk16N0prRTlmTGpIbEZKSCtpKzlpR2JpMWt4KzJLUWlXWTdt?=
 =?utf-8?B?eHNpL1NPbDRaVC96cC8rV1ZxYWhOMWRVcTJUV0hpMTRJKzdmdkZpVGdHTlRS?=
 =?utf-8?B?bzRlTTNPOFFTUythRG1FRU1ici94cFh6SjB4OXB2RmlVQlM0MFlsT2piNWRH?=
 =?utf-8?B?dUI4SS9IYlVRNzdPUit1b2VhQnZ4d2w1NnMxWFpLYTFETHp4dnRibTJjY1FI?=
 =?utf-8?B?Z213UDJyb3FKRWNBOGNGK0w1cEl5ZE5nRXh6RVg3YTk0S2Y5UE5lMHdTVmUr?=
 =?utf-8?B?QWRyKzhUSXlwdGJRSmRxSXh2ZDl5UWJwYVBUeW1zVmZHUWRXUkMreWc5SS9o?=
 =?utf-8?B?cGwvc1N5UXROby9RbmlSU2hRcFBqeGl5MW1lZFZkV213bm42S1ZCZHVLbWZK?=
 =?utf-8?B?ellUTmF1cWc0Zk1ydjQ3eHpzd2ZxL1JhQ0NvMFZ6bWNiRVBrWDdIcW92M1Zz?=
 =?utf-8?B?dVFvQVhzZHluenRqY3NHbGQ2ZVo3cytKbHpkWk84THdSUHVFSjZBa0ltVEVj?=
 =?utf-8?B?SElVTWJ4Z2xvUTU0YjJ1UVlkamE2ZFJzZTNtdDN0OWFNMFhZTjB4d3A3TlFP?=
 =?utf-8?B?VDNyUTVEOVVwY0RMQWtpWUU1aDFFTnZaTms2RWxYOWFwV2kzUXRKVXBZYmdp?=
 =?utf-8?B?RWpDMGpnKzVwQ1c4cExESjc0V3pwK2plUDFFVEZKaWNLSkI2YkJGWUxwcFNx?=
 =?utf-8?B?ajNrbzVoeVZ2T1pXUnZsYnprNW1sRElSTW54OEpaVjY2OEVCRkJWMThDOFg4?=
 =?utf-8?B?VVVKeHE1Tjc4djA0ZWVWWGxZY21hZmxhdEVsa3lkdU1PTGY4Z3FvQjVMaFgr?=
 =?utf-8?B?c2p3L0ZZL0svQ2owaUtncS91c3pPeUtNWW8zOXBFUmViTVRQRTZPMi9KZEtP?=
 =?utf-8?B?QSt2S1RZOGhnQmIvODdkajJDbjVSMU83NmJ1Syt2azhzeHFVVVdlTFBtbUV0?=
 =?utf-8?Q?M2dWBdj5BKE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnBlWWdYSE5lWmI2Q1d5bnEwVE1HU25uenhTdmFaSHBTUnlPaTJVUkZwSWNs?=
 =?utf-8?B?TTBmblEwbkVxM3BPUmpKYWtSa0x1a3F1UitZYjc0L3JvL3FmQ3dFL0hWdzNQ?=
 =?utf-8?B?ZzR5ZFluNVpKZkdGeitkdjVCZE9vYTFPc1hORHRwK0JGV3NXemo2TWRLZFgr?=
 =?utf-8?B?ZUY2S3Y2RFRYR3A5a1JNa3M1cDB0WllxVHVabkg0bStiTzVUMU1yc0hjcEVx?=
 =?utf-8?B?bkUzLy9VdWhhbnV0czFTN3ZTQzI1ZmpDSWxnWk1qc1dUQW5FM2pXbm1ZR2p2?=
 =?utf-8?B?VW0wazhmRXNVSmUyeEdzVnN2RHpIdU9WcDlwWkJLKythalpKRmdYTTc2bGRq?=
 =?utf-8?B?eTBjUDlnTHNEemVIK2FiZ1lzTW5mUm1aRTY1NUhOU09TSnkxSGQxdUI2UG9J?=
 =?utf-8?B?T21oamkzRStFYXhRTU1xZDBJUjJ1djNMSzVNR2svRUwxdGxxQytRUDB6SnBD?=
 =?utf-8?B?YzhsSG9jTlZTazJVanRoL2NkdUw5Y0lyUnhlOFEzUHhQSWVIQnRkckcyRWR0?=
 =?utf-8?B?eGtOSG1YNE1IeXM4YW9CZi9zb0wzNkRRWlp1L0pwRkdMWWFtRG5idnpESzI1?=
 =?utf-8?B?US9ZNUJzZ01xZU4xT0dTdHlCUW8vVWlsNU12SEt6UXhNaGJqUTVQdFV3WEE3?=
 =?utf-8?B?ZFV0M01xb2s4QXJiSlhDM3JPWDROZ3ErUGhQbHVoMzh4cS9sUGdGRW91SHhT?=
 =?utf-8?B?K3RMcGZtblRVVENNc3c3RVozYUFDcGpjNS9Fc09XbmpJNE5ITlJFODZTR0dJ?=
 =?utf-8?B?NFpabUJlVE5zM1VmbjU4a3pzRDUyOVpYVnhDZjNYR3YvVTF3S2FmK2xwekNC?=
 =?utf-8?B?S2lHYVJGbUd6RDhpV1J5am82R3UrSWtxQ1JOZWkrVGtNYzJYTS9aOE1TSEtM?=
 =?utf-8?B?NThxMVA2NGpQV1FKbWZIMjBVY0hGU0V5aFh0OHAxdTlrMUFrb3ZBNUtmYllh?=
 =?utf-8?B?VkJsZUJsSUxOZi90VlNjQ1lDaExlTm42cnRiUjhFS1U3OUo0SXcxMTdVb282?=
 =?utf-8?B?eVpFRDRmek51R25zREpxOXk5QUtCT3RMVkVLTTd6VlRneE5QS01ETnRkS0Vn?=
 =?utf-8?B?Snl3ZUw2NXhuWDVkcmlEdzR5a1lvMTg5SE1IT2VwQ2ZnNzlEZU9MVmU3ekxX?=
 =?utf-8?B?SW1FT3hrU1Q0ek9NeDlMekllMEtHMzEydm5QR3NxcGs0bFEwT2FOQnVEN29t?=
 =?utf-8?B?Mml6amZKQnlacjZIMVE1ZDJXLzJzeEFVTlpJcHRNQUNZTVY2SnIwam5ta2Rm?=
 =?utf-8?B?dEJ5cGdLekJGdVU0SklDQ09XVndLeVQzSXpHL1ExNmFpR1ozWFBtWEZXUlZz?=
 =?utf-8?B?bVRsRzllTWlzbGdjeDNHSy9NZTVCbEVSdzVDaUtKSm84eHVWZCtEVE5sMWNh?=
 =?utf-8?B?Y3NNMmNITWpXVFhocEtMNnpYc0liT2c2bXdTNWgyOHpvaXY1WnRoSXdVUitX?=
 =?utf-8?B?cWR4WEpaY2NBVUJIb1FEL3hnakFhaTZmNjZSMmc3M253UU5pcDFhS1RQY0ox?=
 =?utf-8?B?MHRKanNpU3ZxN3Fka2RWZCt6QXJXa1BiQUYxSzBkK041RUpzVG9sRjZwK2RF?=
 =?utf-8?B?OXZJUGhpL0o2QXNMMGs5bkR4YVMzckFLeTV2SWVzNFp0NmZ6UGJGNlpiWk9Q?=
 =?utf-8?B?MThDTGJBa2U3dkx3WDZITno5cStDNENrdUJtdEpwVkpEQWUvaHpHdEhxM3BQ?=
 =?utf-8?B?VjMzdXVNNC9zelFRUjF1Qmcxb1Z3MXBmbXoyeHgwQWhRb2R4MTQvU25ZTU1V?=
 =?utf-8?B?Z2pPbTRxRmJsRWl4cVRINDFqMStyTHFDQnJid2RzMEJwS083dXFmMTBFemE1?=
 =?utf-8?B?TVpzUmtLVHhBVjNlVVBRbU5CVWc2eGRyZTRyNmQ5cERUV0dDY0h1RDRJZGZU?=
 =?utf-8?B?L24yclFWdk4rYTBab3lGanYzOFQyejBaY0NPUVg5dDJ6eVRBY25yZ1BzY3Vz?=
 =?utf-8?B?dXU5aWtVRWdWZWI1L0ROd2FjMi9oR3VnaHRHL09iUkRMQk5lMk5pOFNaN2tE?=
 =?utf-8?B?ck5ucUxEdHBXelpub3hQc2VWWFRMT2o0eUpjRzJPdCtoRjZvcllDdEJlUGJ4?=
 =?utf-8?B?ZEZZREtxemNPcnVMZnpuWk13U1VWQWRQemRVVWtwaCtZaWhsOGM1Z3F1NGFj?=
 =?utf-8?B?ZnM1MDFTUXFobnZDWWQzTi96cXU5VmlGVVNNU2ZYZ1V6RWFDWXZTTWw3Z2x0?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fe8870-327c-496a-f651-08ddc5d39f45
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 08:18:05.9043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dochmEgUY6wOrvq02x2G/bGh3254Rcb0MXRIt9FV7PX9B+ZPFV/aHnbrxlCav9+Ih6rzPl1ZhjVSFtBbfKpF5eQI+reZwP0KQyUXweQW2TU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
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

Piotr Piórkowski (4):
  drm/xe: Add initial support for separate kernel VRAM region on the
    tile
  drm/xe: Introduce new BO flag XE_BO_FLAG_FORCE_USER_VRAM
  drm/xe: Force user context allocations in user VRAM
  drm/xe/pf: Force use user VRAM for LMEM provisioning

 drivers/gpu/drm/xe/xe_bo.c                 | 88 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_bo.h                 |  7 +-
 drivers/gpu/drm/xe/xe_device_types.h       | 10 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c         |  7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  3 +-
 drivers/gpu/drm/xe/xe_lrc.c                |  3 +
 drivers/gpu/drm/xe/xe_lrc.h                |  5 +-
 drivers/gpu/drm/xe/xe_pt.c                 |  2 +-
 drivers/gpu/drm/xe/xe_tile.c               |  8 ++
 drivers/gpu/drm/xe/xe_tile.h               |  5 ++
 drivers/gpu/drm/xe/xe_vram.c               |  6 +-
 11 files changed, 110 insertions(+), 34 deletions(-)

-- 
2.34.1

