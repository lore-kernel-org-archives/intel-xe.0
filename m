Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0797DC83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 08:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6B710E108;
	Wed,  2 Jul 2025 08:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aU/9ttq/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DDC10E108
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 08:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751445910; x=1782981910;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=cJkGi2VIG3ugkujpZJ2v2yjt5x9Q+RkBJBBj96LB8Os=;
 b=aU/9ttq/PDr3/WXjMKqNqyrf7rfS72LwJZmLwMMiaY8elb9OLdcWCAAO
 pPeaN2aP/c5/51qevT3TXd3vkQAP+9cF3aVxthhGUGWsqAKxhHfkrR9K3
 uxnizajgHb4fKxTWmQThT1ifbgA5Zoux0KAoEb+FA8nG33I3S56Z2FUqR
 ZTnS9fs6cQ6evdUw4eMSRMON08hs917BjRJN2+0YRT9AUk6x05kttxCo5
 oAZXH4LVZO/Hx+7n404bJlreh2IfQnQYQ9yAggMSeszh/S8gsqJxx34A+
 HoCrSGRvz3p34+DiAh21u1sZ9lthYjBdLnv7TaqeMDyjHvaksDkguOyGk A==;
X-CSE-ConnectionGUID: tnxVQdp+Qw2DrhsMyD8FdA==
X-CSE-MsgGUID: erwQPHg9RUmiXjnD0SjFVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53597952"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53597952"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:45:04 -0700
X-CSE-ConnectionGUID: c1baBWbXQnCgStYg4X3FAg==
X-CSE-MsgGUID: 2OaTs5l1TNKJv3zbLlhBcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159531367"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:45:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:45:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 01:45:01 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.89)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:45:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUyFZnk25KzRW7somBnnIYYDgozhTSpgE9HZClX9dQNEHni2q2sdkLTuZP6/mZf52ycfCLlgx0PrNANfb46XcV43+MQIvjbWExXOGGosgvL83ssH9Px3/1UZUBVf0VqKqOUkXrcvQnzchBDoLGNpD4ewCTt9CmuLzVXz3tqZP9S3JdB/dBXcGNWiuUKbw4d0euK2mWHEEZz2EM+esDVM/Lrs9OXict/TLRdHGRS5YJkXGU5hGLBVKc/5ncXhmQDl5n14L4v2f/DdgcClLKZ5d5yneo9mnnDF6E3OeBc2YR88rjy8V9Zpka4icPSomk1GhNPZwiWY8KmpyXcvK0Q3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ts7L3ffFknMSPV+7XgECtQY7F3RjeJqBsakScYR0iw=;
 b=YhVqnMvZoDKC495r4bjqUJgcPnI1r9YQNirAurbTOLePX2WEZtZb+U8kXDQ+6gMxjJK0F4QoAXECYZ6Ne4hUY5O2NpQEdX1lkN4B94cRRkaQoINxUUyPI1YzBuZucEiEHKqo/VxXOmziiWeGUPlvVdRXG/yaH4n8GBZO079Kv22kytBrsnTQJPfp7178T8LgAgifjNYyJRZ1WPB8SouQ4GTaHiWX0s0JIM296MbX5jhf3RLDsckHlFUgPaHNfqNYbliVZAj9vLtG3oHsycyqPYdVlD4OXbJzoeDBc8A+hW5nCKiF1cdLZ8M9KoAJngDJOW60JCz+0Fuq9Gh9uSwZTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 08:44:59 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 2 Jul 2025
 08:44:59 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v8 0/4] Cleaning up code related to VRAM regions and its
 initialization - part 2
Date: Wed, 2 Jul 2025 10:44:20 +0200
Message-ID: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 537b005e-2404-4059-33e4-08ddb944ba5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDdKOXBhNGRWTHM2TUxlR2ovdTlQQUtkL1htSEZwMEQzN0l3MkNhWmxzaHRa?=
 =?utf-8?B?UVdaUHNHSURTc09aWld6NVJxT3J3SnZ5U0YxVWdPcUhDV2h4ckZGMmNGZHZS?=
 =?utf-8?B?VnNKd3RLYmJnMUltZEVuVzZDTDJMYzg4ZVFPVm95WFA4OVYwSTA1SEhiRU1i?=
 =?utf-8?B?YWE3NmRPQ3NnL3Y0MWFBVUd4d3ZOcUpiaWxjRnV0QXo1RlpSeTF0ZTJkY3RV?=
 =?utf-8?B?ZUYveHJsN2kzNmlOOWZMeTlrMGdCWlVxVmVaSDJmdGFoV3JOSWpsNktzaEVR?=
 =?utf-8?B?bmVQMmEySkpzQVExWGpQZnZEZDIyNHc2UHpGZmFiem1nbUowalJrUXpITHBF?=
 =?utf-8?B?TWUzNlJBY2sydi9BbDR0VVc0U0swTFZPUDkxQ3JKTVRTektkN0JZQy96NGx3?=
 =?utf-8?B?K3J6Q2sya3V5VFRNUnkybE9aK3ZBWEpSY2M3bVhUdGNibmQ5Q0pnSmd3Rndx?=
 =?utf-8?B?c2xDZnVPYjJYMExNdDJCcktwNEtDbWp2R0RXZ3M1Zyt5ZzJDeTJ6NFk3aUxT?=
 =?utf-8?B?aEF1dDBhelBQVEN3WnNnZmlZVmJRMjRuK3pUYnIrUmtrMU53dmN4Rm5sc0FD?=
 =?utf-8?B?Y3czWE5UaWFpemdpTFNORTFpZUo2NkQ1L2ZEejRucnhIOWEwU2JWSXZLWXds?=
 =?utf-8?B?YjFPK1QxRHRlQnhtLyt4d0Q4Q0JLN1BqRXpMQmd2eWI2d2I2VUs1MTJTNTVk?=
 =?utf-8?B?MENheERBVkd2aklZYjBVMlAwcTVwR0xGaUZRU1VScXBWTjdvNWU4WkFTUG5L?=
 =?utf-8?B?bFBUK3BORk52bnVPem0wODdWMkhuNkpDbVJyVmE5di94c2JQVFNLUWFvT24w?=
 =?utf-8?B?MVBaTmxTVnlKNXRDS0g1cWhxSy9CM1ZkNjhXMXNhY0Erd2VwdHhySUpRRXBj?=
 =?utf-8?B?VERDWTJMQjk5VXUrQW9ZVXl5MDVlVDVVcHAzTk1hNElaUE1JRXRUemk1bVRn?=
 =?utf-8?B?dGFteHNtZGpLYmxqMzNDWjV6SmhudmxQMXNTR3pPTXFoNVE1anN3UW11cVAv?=
 =?utf-8?B?RXFZd3I2U2dhWFpBUEpYR3BqVUlYbHRuWHRiN3hWZWlRSlVIZDhlMncvQk85?=
 =?utf-8?B?eFg2VDJxUUN3Vk1ia0NTNzlkNEEwUXdRVHhHaEJxTWdmRGRUMGVVRjI5ZHFJ?=
 =?utf-8?B?OVBaRHFCclBYVzB0NWpLeHRLeHQyMGxGQlpLb1hHVVlrZHQ2MlM4S2dNN2s0?=
 =?utf-8?B?U2JLVTh5QnNUWUlXUDVaMTZMaE1rWUJBSmM4RWRScXdjZEx0N1hvVThCVWEw?=
 =?utf-8?B?RSs0aWx4TGtrd2FYY2xFbEZ2UWVzcGVIRHhUd1hXTHlwR09PRlNVbEo0bFNH?=
 =?utf-8?B?KzZuZnZRekl6S3pZS1F2V2JQUis5L1RRL0VkbzdaeHhDSnZYYmZ1VStxUGNq?=
 =?utf-8?B?MUFPRXI3V20wZXRuU3FTOWhCVVJiOHhWeHZmQ0dsRWFJOEwrOEdtY1pxSDdr?=
 =?utf-8?B?UTQvSzc4TFJySmFtaU82MXovM0FEZC9hMHRUbDJONS9RazVBd1ArWnJKTGc1?=
 =?utf-8?B?L2dlSFIyaURteGVMZTFOV3FHNWpLZnMrdGtETVBxbUJQSGY1TDllQlhsRnJh?=
 =?utf-8?B?SWo5Z0V0VUxLOU1YU09qcmRuYkJMTTZoSVlKcW05L0VWQ0xhL1lTSzgzREJT?=
 =?utf-8?B?a0hIK0pyMFgwSGUzL2pDRzU1Y0JQWVl6R0VtOEhtNG5qeXZMMTd3V0h1Z244?=
 =?utf-8?B?ZUtLcDVaVkczYTVyTXVuaVJVVzljRDY5QXl0UkhnZUlEa1RmV3RvZDE5ODZm?=
 =?utf-8?B?OWM4cHNENkkyTTNSNkFLWCtKN3E0WjY0Y1lJazg3cG5GZmVaZVZQcnZvbEt5?=
 =?utf-8?B?d2FlckU3VjFaSkI4Mm5iUXlhWEF6OHRmMmd1d0R5U252Y1JXZzJUZ2FreEgr?=
 =?utf-8?B?WEJpWkg1MHJzSVg5NTJQQ3JFSHlEZHhSMHpzTnRQYzlya3Jzakhrdk1GQmFQ?=
 =?utf-8?Q?DQjAekDzlPk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzBqd0V4andkSGdZemtEYzFzRnlrWUhEWWRzKzFTREQzL1JJc3VuQkRqR2xz?=
 =?utf-8?B?Z1g3VENiU3JtVnp6V0R6MDZ3N1pCK3Azb1lKUDdkUWZCTzZmd0QwUFpNK29C?=
 =?utf-8?B?Z2FqR1JXZGdYRVZzVU9zbVJQSHhtbmpWZFg1aGxiQ2VLYUxqVmRoVHVlWCtW?=
 =?utf-8?B?em1mL3BQOVJNNUxweHU4alhuTHVnSDlzamo4VjRhRjRkaWxYZ05LN3ZRK2Rw?=
 =?utf-8?B?clM0czZqczRCdis4cm1hdjRqRUJJTXBMNWN2dnR3OXBFR3Q5cUNLWndEci9r?=
 =?utf-8?B?eXRydXRJWWhKdVJpYjFJR2x1MHNocW4zLzlBTVR2enJYQm9VVkYzTjRUQmFT?=
 =?utf-8?B?Rkw4U0JqeWFsY3hBUUVuN1krSURXQzRQbmkzNUNjNGtKRUF1bHdnbnR2UVlC?=
 =?utf-8?B?V3U3RERTa0dXak4vMUpDbHhhbmdnci85TXByd3pwT0JQbzEwbXBUdk9OUGFq?=
 =?utf-8?B?QlV1enhGWnV3bjJ6NTBHNGNWQVNOTGRjUzJLcyszSVZKTjQwL0R2Q250M2Ey?=
 =?utf-8?B?MW40Q0xWQk1tdWg0c3lwMkpGUnoxYmV0K3BrdmdEc254YjNGOVkwMVBLVlNE?=
 =?utf-8?B?blRxSGFxRGxKK1YxTjZEbktDR3NUUS9zMXd2NUMzazRvZGJDeFJnTCtKYVhl?=
 =?utf-8?B?VC8wU0RFbzVVTWRKMStvTkF6aS9TUnF4ekhKc0w4Ri9TdTgrVmlrZXZuTlBN?=
 =?utf-8?B?M05LcHA0ME56KytYMFJ0LzIzcG1vYUJlbjhWbldiRXF0SW1nOGpWM3FBY3Ir?=
 =?utf-8?B?WWlIQmdXRmxVSkxTNmVLWkNRSVBHQU9CREF1RE9wdVlFQ25Gc1pQY240N3Iz?=
 =?utf-8?B?NlBlRFRLRlJETkd5UGxBa1owMEJwNy8xUEhqcmo1dlNNanNRcDRaVVR3NVZm?=
 =?utf-8?B?QUNmZEZhbmcrMjVCeGdEZjV3NWpqczJsSDczUXU3VEhSMXJndTFpandOTDdi?=
 =?utf-8?B?ZFh4b1lERDhMWHNwbWFhcVhtQXdvVTFtVU5YM3FKMTJtT2lhZ0tGRjJZNkdB?=
 =?utf-8?B?blpqang0bTlVTUx1OS8xYWozNWZZM0UzTmxNZGFBdVFJRkVpQVdVamlxVisx?=
 =?utf-8?B?MjAwb2V0QXhIR3g3OStDdmhKSGFOTUIvcFlnZkFzbVNLN20reDl4OXpFMXYz?=
 =?utf-8?B?eFdmZ01lOWhzNXBkYmVoVC9lQk1UZUtLNDJ5Z3FDalJ2ejl4cVloZUVTQ1p6?=
 =?utf-8?B?eHNja0xaVk11MFdTYUYwdGczd01Wc3FnRmRNNzhWdmw2NTRDb0Y0bFlhNExR?=
 =?utf-8?B?eS9uUWVoZmN4aVQwODhkKzRraWQydlEyWjhXVGFLS09hWEhNUUhrUG5Vemcz?=
 =?utf-8?B?N3EySGttcFdoRTY4OUMvYW9CL3VvWWh5bE11LzdxNzR4REdWQ09YWktOL0Va?=
 =?utf-8?B?VnYxMFJWQWtmRGJCSkg1bXpmZTF3VG93dUtLMnNrWDJPVVFvNUNGUmcxb1Zr?=
 =?utf-8?B?VFNHWkY5V3F2amtGVUZEZHR5dW1pWFZqeWpEcjlOZWJDUm1uOGhCZzM2Si9I?=
 =?utf-8?B?N1BTSmM1OXhRa2psV3ZqZm53MUw1eWp1dWdoNFhLc1dCTHVyYmRDSS90NHQw?=
 =?utf-8?B?ODVsTm9tT1FTRW1sc1BMVFB5MExOeFI4Qzluc3NIckxHSHNFelNXejE5Y0cz?=
 =?utf-8?B?NFBVNU9OZ1lIL2NWQjFGRXZyN01YRVoxTUN6NzRteGFiN1BsVzE5Wjl1alll?=
 =?utf-8?B?eFlWcys4NEVIUGQrWDhhRTc2MU45RHhCYm85LzYxZWxNYVVYcHFPZzFSL1Zu?=
 =?utf-8?B?RllzbmxRUDZIY1g4VXR3dHM1Z29DV3NDTTVaZlJLek5FRTlTZ0xqcTc3N0s0?=
 =?utf-8?B?TXdic0pyL1RMd3VoSFJtT0pxendaWVhyeUVCbkhaM3lwYUdyQ29ielZnTWFU?=
 =?utf-8?B?S2krZzJCeWUwb28yNGxaSTlLa3hmdzBjTnJrQ1NPNXZFWisrd3Q4VDh4OWJM?=
 =?utf-8?B?clJldG5rSTJhblMzc3hSV1ZNT21SWElMdE9XYTRxRGNQblBPYXdrWDVDMGds?=
 =?utf-8?B?L0lHUmdQamJ5WjdWc2w3Z0l5cmRNNlRFMHZzUmd6Y1ppT0lwYUlQMjZjS2Yy?=
 =?utf-8?B?dlUxTUNVNDRsUEsxbnZYazBad0pkTkR3R05VNU83dFFQODBmOHl5aWN5SGJU?=
 =?utf-8?B?VlNnbW5WZWJTM2V0T0NmNmxJcUlLQkx4Uyt6ckdaZDUyUlllTHRJRENZV0V4?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 537b005e-2404-4059-33e4-08ddb944ba5a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:44:59.2721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGtqCnp5y2oh1k8S/AuTCy/heaubmayejRdtoAbfZnZspENcIXN1IWH86tiDxnq5dit+rC9Jktk3HVyylRIaRyp1pjGnWdoMJbX9a2fb07Q=
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

As a follow-up to the earlier VRAM region cleanups, this patch series
focuses on further improving the flexibility and clarity of
the Xe driver's VRAM management.

This series focuses on preparing the VRAM region handling code for future
platforms, where a more dynamic representation of device and tile VRAM
regions will be required. Static allocation of these structures is replaced
with dynamic allocation to increase flexibility and improve maintainability.
Additionally, the initialization logic for device-wide and tile-local VRAM
regions is unified, replacing the previously separate code paths. This
simplification improves code clarity and facilitates future extensions
involving additional VRAM region types.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.
v4:
- add new patch "Use devm_ioremap_wc for VRAM mapping and drop manual
  unmap" (Matthew)
- add new patch "Move struct xe_vram_region to a dedicated header" (Jani)
- fix null pointer dereference in xe_assert when VRAM region for tile
  hasn't been initialized (Michal)
v5:
- Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
v6:
- Fix build if CONFIG_DRM_XE_DISPLAY is enabled
v7:
- rebase after new changes related to SVM
v8:
- rebase
- add a helpers for accessing fields of the xe_vram_region structure in
  patch "drm/xe: Use dynamic allocation for tile and device VRAM region
    structures"

Piotr Piórkowski (4):
  drm/xe: Use devm_ioremap_wc for VRAM mapping and drop manual unmap
  drm/xe: Use dynamic allocation for tile and device VRAM region
    structures
  drm/xe: Move struct xe_vram_region to a dedicated header
  drm/xe: Unify the initialization of VRAM regions

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   5 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   3 +-
 drivers/gpu/drm/xe/xe_assert.h                |   4 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |   1 +
 drivers/gpu/drm/xe/xe_device.c                |  20 ++
 drivers/gpu/drm/xe/xe_device_types.h          |  62 +-----
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  13 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   3 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  25 ++-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   5 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  27 +--
 drivers/gpu/drm/xe/xe_tile.c                  |  58 +++--
 drivers/gpu/drm/xe/xe_tile.h                  |  13 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  10 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  22 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 205 +++++++++++++-----
 drivers/gpu/drm/xe/xe_vram.h                  |  11 +
 drivers/gpu/drm/xe/xe_vram_types.h            |  82 +++++++
 21 files changed, 376 insertions(+), 203 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

-- 
2.34.1

