Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D4DCA0EC4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 16:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12B710E61C;
	Tue, 12 Aug 2025 16:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ihyk8C/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9145D10E61C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755016748; x=1786552748;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HpvgJaV6y6vdPgTnwLtJyA+iwYSa/f8Pqh0Tm8D/Rhw=;
 b=Ihyk8C/nP8FCwNqKUcVepR/HhkTN3/YKGmBQ8NcK5R0Z6qAgiSIv3wGV
 0TSNicDPHe7A5YAJ2je9sk0j5YpJrQP73Uo8DI/AA+d6zjN0ZCTuANXlE
 Q5mmmkmeuFOhPZmfUgm4C/Yko+KBJM43abHWpuVzPXRqDW5FCFCPWe+5Y
 s07UQOkn/N775AMMttm4xB1ytRmm9UzJtZSa53nwtfTec0VAkNnvfLYOM
 n5WCNnG4sG+Avl2IZVwQgNDHEcp4w3ZvEZwe21KmOxE3eO/AKx0WUWtil
 wlVxa+RhuiO6/PCuaekXWfp844tw2tMs/XCYNupfMh1gG0jEE5SRJO67a Q==;
X-CSE-ConnectionGUID: 71/e0LkTST+/XQIzF1wTtg==
X-CSE-MsgGUID: KnOL1ojiRzSPm2WC22uTuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60921681"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="60921681"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 09:39:08 -0700
X-CSE-ConnectionGUID: DcO4laOCSWu4/bzRU+Spjw==
X-CSE-MsgGUID: cratYWPoRY6US5VkDTvK5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165874896"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 09:39:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 09:39:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 12 Aug 2025 09:39:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.77)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 09:39:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQXeZOVX6WcE4AVDh480GgcGPkK0tDrIz9jsSEj7lLdHZbnvW3Soo2rQwCBShQXXsXccx5bIybsh4N4lZEq8BGe2N1fzcHRmhB4KUinsU2qHT00hYZq4HJuk3Tllq2iqTct5zVhE6ZGOCLA24LZzrX95QE+SPNNereBVun1/xfWueTTCrEg8hrMPNffF/O0U+YtQ7DmE0cgBD0BvxUHfJmeLDMNHw2sIoOYQYoNYtdcrJycaWyNicTDSJ7lgGnt3M1LFxMZ4QP4sihx7B3Qui1OIFKr13oIFQ97IBPrWMYg2JFVacnLAgLGvO56Ptwfz3P/S4mV8UiPrOdQmtziR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2xaHJx6mxn7JDTXAwOQghXKdbLS13JXeLy/VzzIL2U=;
 b=KeJYCL/B3Fnh/ta7tCqC0qweu264gt0q1yTGxzHWWNwtMu4wNRCy6YoKCaZFzUGTnTlkjLBpHsWVp2D5VoOzkb3naXI1M1y3lXskx5ZkimgmFth0UBNzK+VhHN4pAOeRuJLTL17PSfzMRDJIZS0FIdsEZwjllKgNXyZgIKsmRsi0NbvjnH6sGJgWlOKvIgfm5nSW7wH3mvb5WUbWz29QbwaFso/TUs2pnH7mk4V4yO0EiVR0hYQ1bycIQrMH7/KkNPkhYYgfgFT2Bs6IiyS6/xGW0f8J/wGwwJ97Hjvbtsd9hJcvKplsFTFWeURb6h0pCBSC+1jM1JIszoTMUS0HSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 16:38:53 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 16:38:53 +0000
Message-ID: <f86b4dcc-77b4-41da-be75-f633ae2341f3@intel.com>
Date: Tue, 12 Aug 2025 18:38:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/8] drm/xe/vf: Post-migration recovery of queues and
 jobs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <john.c.harrison@intel.com>, <jon.ewins@intel.com>,
 <kimmo.nikkanen@intel.com>, <luis.strano@intel.com>
References: <20250801015045.957609-1-tomasz.lis@intel.com>
 <aJrHY+xO+01Fd4gm@lstrano-desk.jf.intel.com>
 <55abb33a338eebc4dfecead75545315f0b0b721b.camel@linux.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <55abb33a338eebc4dfecead75545315f0b0b721b.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a865fc-6dbb-4407-6f27-08ddd9beb94e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UklGUHNLRFBrbE9mK3pUVzdEbU5OcFNWQXBKWTlpSDFyOFZrWnpaeXpLa2VR?=
 =?utf-8?B?NTJrRHVKTHFwMk9vVlZTMGQ5Y1ZQZnZ2Z0xYaG5XWmRDSWh0akh1MHR1dlMz?=
 =?utf-8?B?Y2MrTjdaN3l0VXJjdmlJNFRmemlLWFQ0MkU4eTZuRVgwbHU1TE9rd0NITmNS?=
 =?utf-8?B?cHBNaHB1eWZWWUU5Q1UvQnlKK213d2JEenBRQ2JVTHl2NkFpVUZXRHpVaDVW?=
 =?utf-8?B?ZU1zMk1ZeUVSRVJoMWc5S0dkL3dqYnZZWWlLSy9Vam0vdjgvMGN3c0RwTlE1?=
 =?utf-8?B?ZG53dVFmK1U1RTJ5MzRVbmsxeDNNcHBMdzFURFNHQzhQd2I1ejd0aUdTTUJ6?=
 =?utf-8?B?RWhIdzE3RHo4UytmVTU2UFRvWUYzYmlYdGhaTHFxU1BkdkJHSmhHTS9DM1RF?=
 =?utf-8?B?Z3lEZzd2bWJIR25zM2ZrODVEdFlOUTBGcjMwMEF5c2N4WEZmWFBiajRsd3JK?=
 =?utf-8?B?V09LNGRyaUxkNUhncDRMMHpKR0l0bnNjc2hRbGlwZW1lSWoyNFovRzlSbmpa?=
 =?utf-8?B?VkV2dEtDa0VIWnZpQW14WjB3Z3dlRVllVUxZYmR1enVPQ20yZjV4QUFzb3JN?=
 =?utf-8?B?ckpNU2UvNFhNdHJidEQrNVJ4ZG5oa01vNnRNd1R4b1VtTC8rSjhDWVJJbDFo?=
 =?utf-8?B?YkUyWUw4Rm8yNUdsbHFPcVhRUkhVYkY3dWFUOWs3MTFCSlloRkVvYUhjV0No?=
 =?utf-8?B?M3c2MWlFbVNqakRuTURYdlk2a3JIMi9KakdlTER0dGpmS0h3aUI5MEJTZUxv?=
 =?utf-8?B?M0JDMnl6Vm9kSXJRb1BXb3FSR0xzTTNKZmNTZGlNSmYrVnczeWs3RjVHOUp5?=
 =?utf-8?B?WGwzeTVPYTVXL1RLUUJIUXJBSFdiZllDSzRqa0RrUDNJRVZ1Y21XdTVNRTNq?=
 =?utf-8?B?L1BnbGtGZi9CLysyaHdML0x5allnemVmYzNicjZPKzNLMnlFSTR4dXRWaEUr?=
 =?utf-8?B?b1RNczQ2VEpSUXE1aHBqSTZpZFBxT215L0l6RWlQc0ZQTWVSZ3htRHcrd0tJ?=
 =?utf-8?B?Y243TVN6Ly90bkU2ZWFkajBqN3RGL2ZjS2hXNkxDSHltcDB6ZGxlNGcyeit4?=
 =?utf-8?B?a1A1UURmc2pJNDltcndjV3c1OXRTWEQrTHozNmRpU3kxNEdsbzFweWdQd3dE?=
 =?utf-8?B?K01mWGZzZGhhdDVtZ0ZpU3huLzJUSTE0cjNVSzdoYVcySitBMUpQS2llSnBU?=
 =?utf-8?B?YnFpeC8rQ09yc3kzdGVqTU1HRkVIUXJLenE4eFBEVHd0elZOSGtMTDJkNVlG?=
 =?utf-8?B?ZVl0VngzVlJ5cXhHbU80MEVlendIMHd6UWdpWUMyVzR5ZDdsbTFhZDFBTHVx?=
 =?utf-8?B?NW9xN25aT0lvdE5oTWZVRHZYenFXMVBUcnhtQnh3Wi9vQjl4dkhaTm1FaS9z?=
 =?utf-8?B?ZGw0ZDZ3bXdiWkhsSExWZ3JSdlg0UjBPdmVkdzNsYTR0aTZodzlzcGRja2JB?=
 =?utf-8?B?cFZLNHNYVjZqRGhTc0huSGx5S0dQam1NWkliNDEwZ1Zxc0NNdDRoSjBhTXow?=
 =?utf-8?B?V1luRGVGeUlYNFY1R2hwZVRRdWpqRDNrK0NBajhKcmNFYk85UzI3TEdybnJQ?=
 =?utf-8?B?dXJqQ3V6VHYwdXlxckhFejdaeXJGa3RzOFBTU21QYkVMaEhnZWp5N1poeXN6?=
 =?utf-8?B?dXh2TkdJYXVsVWtXWTZrNmkyUVdPZWZTbEgveHA4ZFZtS09BbXJRZEdaS0J5?=
 =?utf-8?B?eWdVaGFBMitYM0FPVmtwdEh3RGFuVG9WOXJQdm0wQzhpTmIyZi9MQWZ3VkZS?=
 =?utf-8?B?SGJNSktBY0pLY2VnRmljWW1HL2xGN2U1bk5tQkE1K05GbmwwM1VyanFGbHUx?=
 =?utf-8?B?b09obW9xSEZRTFhDUVpuYm03TDkyaG1UZnF2SmtOOXAzRTl6TmxpSGVodGNt?=
 =?utf-8?B?OElSRWVUQWU0UlFKMVQ1cnBUWXRORFdqUGJoOGU0OHpoc3prTmRFYXBjL3pW?=
 =?utf-8?Q?FS4fHAhAVQA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWM5ZWV3U282d21yU2g3OThZY2Vtem9sWWpQKzFFaUxJd2ZsVFhZK0FJODRF?=
 =?utf-8?B?N1FMNDVEb3ZzdmhINjN6VHlvb29sVlBielRXTEJ3bVJBb0lCMzV3Q3IyWFds?=
 =?utf-8?B?Rk54NXJhR045TWZhaVlsMHczYnNvUWNRMWNDN2Nvd3ZuWEFNaXFuL3luS1JK?=
 =?utf-8?B?QUtMUmtSWVM5RSsyTFNnd0ZxK2I5L2ZndnpjSXNJRzczbG91RjFPTkhJdko1?=
 =?utf-8?B?dkJsMzFSL2U1aDAvUXNqdzlpNFhNYUo5ZnFHMHRxM1BtQVNuMVllYzNMUXJs?=
 =?utf-8?B?V1NDZ0w3aTUzOGx5bW5HUzJOL040ZEM4SVFNM3k4NUxqQWV3NGJDS2ZyOWVJ?=
 =?utf-8?B?SFFSZW5vSFhxSWwvVVVOdDQ1R2pobmEyZ1Q4U0lyZlFPUnVMbGhqM2V6amov?=
 =?utf-8?B?ZEZ4OUFpK0ltTmF0bnpCWVM4cGxyQmVOV2Z5LzVQVXNlS0trY1hRdHZqdDJS?=
 =?utf-8?B?SFNTektDVXBQRGt1by80ZmdpaEJhYWZQdEY5dHAzaUFNMzNYWUZ3OTdzQjhl?=
 =?utf-8?B?V1ZoZG9rbENENytka2VVSVUxc3pJeVliTmpxRmdSTTNQMlJnMlVKWXVCSDhT?=
 =?utf-8?B?eUJOcWdMOFBBMm9ISVNidGN5Q0JZY1dzN3VFaXozb2ZTZk0zcS9FM1g5YmFZ?=
 =?utf-8?B?UmFjV2c2U3hTY1g2ZXlYbnNldWVjRWFJeGF1MkNvMGRkNWNTcmx6c25GVU5h?=
 =?utf-8?B?ZDRGMng1SEFxMXlYWnZWTmkyU2QxaGpFTzl1T29Vd2J6L3RZR0ZyMkVCcDR3?=
 =?utf-8?B?UGpMbSs3R09VaWd1UkVZZmpIYXM2OWdqTU8vOTlvelNOWU1PcVQ5QlM0N0dU?=
 =?utf-8?B?THdPVHVxbVZTaENQRGgvYWVQY3hwYnRBaWxQMncrTFV5RTcvZENOT0x4Y1h3?=
 =?utf-8?B?VWRIR3VyMWhraEZaUXZPMEVicVYrb1lLOG1wNzRjZzBrMGp2RVZ1M2UxenpT?=
 =?utf-8?B?MExpUjByZVZFWGhhc1pIdGJjUndpTk9wNmluV21heGdMOHZENU5ZQWo2WTRI?=
 =?utf-8?B?WTRSMVZQOVdBS01NU2R6SmZDa2xUK1N4T053aGVMQlVZYTJRL0c5dXJJbFRS?=
 =?utf-8?B?TzQ1ZnNiaTYxdzAxRCtZNVpDL21uR3N1L3NnOFBxQ2xqTnR4anlNQS9oY2No?=
 =?utf-8?B?c3RkdkRMekpTbFlaNE1kYmNGQkNJOEpLUXhPNWMzeWFJUjM4d3gvZmV3TnRa?=
 =?utf-8?B?WTZUd2NySy85cFVIdFlkb25YaVh2NkZUT0VFbDlIM2lSSUZRQWZWb2hnZmtD?=
 =?utf-8?B?QlREbm1Xc3lDQTZPOGdDZi9tY01YVUNDdmZXWll1VGRQT0dDR2lXeDhZUkh5?=
 =?utf-8?B?MEJzSkJLaDB6bnM4bjdUejlIYjVuQXphSDQySFA3c0NneGxoazNUOTk5Z3RE?=
 =?utf-8?B?UjJwL01FdFVYUFhGOUVaZDdZZFV6MjRXU3VpdUxHV2xPZjVxZklwbWR3OUlX?=
 =?utf-8?B?Y1VNeHQ4RmVQc2JaclU4ZGtKQXpwd1psUUdhcTNNdlhCYkN2b0pBcEk0eDVM?=
 =?utf-8?B?ZTNRQTB5cnFuemxWWDhIaW1zVjFINy9GZFdTd1h4MmJ4NDErRlRaM2I4cGhy?=
 =?utf-8?B?RThHQ080anplNUJTdUFCZ1RtNUU2UmlMRjBxU2RYWlhuVWVXZEVNazc3SkY2?=
 =?utf-8?B?eTBqK2UyejJMQ0taaDJPTExkZ3VNWm42U3FwRUY1ZHJPSlpSNXV5UldOU0Ry?=
 =?utf-8?B?U0VXUEUwd2dYTmJlWWlCTTM1ajVtaG5YOENuOWZPNjNGVzFWV0N2Nmw3ZGhR?=
 =?utf-8?B?ZFpWNkYrUVhyZUM1bHdFL1M5TEtjUURqakJvR2NJRURNTExIYmcvaDV2SS9i?=
 =?utf-8?B?TGovanFtSDBEZDFHNDhIRVd4NG5Oejh3VE5OazlpekQvRGYvQWt1TUttWUc4?=
 =?utf-8?B?a0xpbjNvOXRKd2RFQXFNTkNRMWxGMElzN3BQanVYeEREUDY3WmFMV0VZYlc5?=
 =?utf-8?B?VGF2dXBjdW90aGNhVE1WdUp2OXhUd25GRXo2bmFQWnhveXpYR0hjb0tINlNT?=
 =?utf-8?B?M0hoUFhGY2FxWkRKUzRBZWt6OVlCdXdkRDR4TE9rcUhNZUM4YklvNERGdFh3?=
 =?utf-8?B?Y3BEU0t3S1FBbmZoU3BQZWpsS3U1RkZiTms2anJWZERqOHgwZFRBNGpVSXh0?=
 =?utf-8?Q?tJSHMu3CM5SyDZoRElZBGxm6Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a865fc-6dbb-4407-6f27-08ddd9beb94e
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 16:38:53.5717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gh+BZc56e0xhYUSjJ6gjjszt4Wkg9XhnOGeJh0EbyrsipHxwPhEwhYTBJPNBFHPuFl9773NxPRSUm9zUij9iNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
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


On 8/12/2025 5:55 PM, Thomas Hellström wrote:
> On Mon, 2025-08-11 at 21:47 -0700, Matthew Brost wrote:
>> On Fri, Aug 01, 2025 at 03:50:37AM +0200, Tomasz Lis wrote:
>>
>> +Maintainers, public, consolidating threads.
>>
>> IMO this needs to be fully reverted or at minimum a subset of
>> problematic patches, along with [1].
>>
>> To start, it was brought to my attention that this code was not
>> tested
>> due to a lack of internal infrastructure. I believe it is completely
>> unacceptable for untested code to be merged, especially for a complex
>> feature like this. After spending some time reviewing the feature, I
>> found clear bugs, and the overall software architecture appears
>> ill-conceived.
>>
> Tomasz Lis, Michał Wajdeczko, what type of testing is missing here? Is
> the code not tested at all, not even internally or do we lack igts for
> this specific functionality?

Most of the patches were tested with simplified VF migration scenario - 
where

both PF and VF driver is probed on the same kernel. This scenario 
limited the

ability to test objects flowing due to the GPU being busy - like jobs or CTB

messages. This is because the scenario doesn't use VM, therefore VM cannot

be paused. But GGTT address change was tested.

Recently (circa 3 weeks ago) we've enabled complete testing environment,

with VF KMD running within a VM. We are now testing the solution in an

environment where we can see the ring emit position bug noticed by

Matthew.

To conclude this was tested, and is now going through more thorough

testing. The issues are:

* A bug with position of CTB messages within ring was not spotted by the

  testing.

* The patch "drm/xe/vf: Pause submissions during RESFIX fixups" is

  too naive with its approach - this one patch is introducing problems

  which may end up in deadlock.


All VF migration code is only reachable in debug builds:

```

static bool vf_migration_supported(struct xe_device *xe)
{
         return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
}
```

The feature is not enabled, because it is not fully merged yet.


-Tomasz

>
> /Thomas
>
>
