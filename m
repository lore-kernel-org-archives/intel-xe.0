Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AB1C83F1B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 18:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4028F10E32D;
	Mon, 14 Jul 2025 18:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EW/Of0kT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2C810E32D
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 18:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752518965; x=1784054965;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=9643ykSLGE12Zf1/GT+f+aS1lVusz2BR0SlP59MpPLc=;
 b=EW/Of0kTvqLJFLqvuChCtwEWJc7xJkLmkLyuHCkosq0RpC7vRo2DqWBv
 o4HgCXEDyeHyzMUG1Hlw4eAN9DCpwa3HdQqtHS9+qlB/Q0LlmhMjFMSwe
 zS91Nb0Dwpq1qjMOMuY2C5PMBH1LkMvfLyG6/clhLFvj4PFulXGYyss53
 wmr5BBLVRq0hV49tfFplRHSOy9WL4pjM4u62fD5ZW7D90xWgXMi73bQOg
 Y4YLOjn9mB3WY485L6hb7ZSCELly35VR5YoXOUwy654uhb8W0hr7blgal
 FiaTPl5ju6EfPn493ZHGzRW6eT+NVcb6wFEL7y4CxBFYNkra3J+7SqaG0 g==;
X-CSE-ConnectionGUID: 5rxtWhQeRf23rNuMiiDMiw==
X-CSE-MsgGUID: N5ep2ktRRaupHx/0ftc8+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65789056"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="65789056"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:49:25 -0700
X-CSE-ConnectionGUID: RJnrumwYSk2kHn4r7mtGYQ==
X-CSE-MsgGUID: bWNMJBG1TTKprqV0ha/Irw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="162561390"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:49:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 14 Jul 2025 11:49:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 14 Jul 2025 11:49:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 11:49:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUt6akv9b5ehB6XhqwJgJnBUXtFf93yW+0oQKpD4kvzqQ53XTBPVeBSjb2G0UDjRYi9Zik/T2ufZcSRSmhZ7bbMfSfY8CQkJZmW+94tLv9k7xxGBmzFAFOhIdlMsgmcygyVjXrTRNhhimj3ZXNBFvh3te0Sz+NYkt2TCnckmqg1ADPmiVv15xUrtdTxuQ0JwIM9Dc5aIlKjg3Y9BLQh8NB1z8+65w5MT9Tonlx9RPdQZget8t7YmqHsEmeZ5ww82NasDL5E7KoAdLd9RDwT+8hGi9T87RVufp8CXZLMqGAmhfRVl61Lol2DSNFP9z55W0RHz79+VHaEiL7SG46SgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H72x7or7vJTGrlet3k1tqZVlMUQH4pDLakagby1jQV4=;
 b=fcq6zPh4RmBLuac7yDGu78CfjhgtTluuej8FdgC+w/YJZrMnSe4cNvAHONjS/alUcgkGUX7KmN8BXy+HXbhDV29TYvbjdcj8Go5X4vh/4Fg/9g8XwVuK2+okzWQpWt9gI1HhWRfxik4AvPCa1c9nK7p7PeAu9XQJbmRjP8bIpaQWdrWfeWi5d+vFupp8dHnKao/p/YfVv3wCPq+OrH3ltzcA3Nzv5V6qgnQnWT+kBqEri6vfE5duQISW7g70LXXu1ORjZ2X/h41QP+/a12EuKyJryNYjzI6YmRTr/ddh6JafoDWgjxXb+FGundkzvdCHNL6/99w477Y6c1GvVfX+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Mon, 14 Jul
 2025 18:48:28 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Mon, 14 Jul 2025
 18:48:28 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH CI,
 v11 1/5] drm/xe: Use devm_ioremap_wc for VRAM mapping and drop manual
 unmap
Date: Mon, 14 Jul 2025 20:48:14 +0200
Message-ID: <20250714184818.89201-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714184818.89201-1-piotr.piorkowski@intel.com>
References: <20250714184818.89201-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0249.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c0b121-8e2f-46d4-9e0f-08ddc307056d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkpVRkZGdXRrcHRwSzZvR3Iwby9YK0lXWmJBbjFJRldEQTkwNU56d2ZvdGx4?=
 =?utf-8?B?WjlsSDlJREczc0krV3NVdC93MVpPYm5YeTN3R0dmc2VqU29Bb1ZhNmhLZEVL?=
 =?utf-8?B?RE9oN3doZnJncHMrUm8vYzA4bGt1blp5ekwvNmEwcjdvSFZ0Nm5yamtoNmRa?=
 =?utf-8?B?Z0R3eTdOcWZvTXNuU0JZOThFdEk3WmRFbkVTNDRrODR2UzVab0FnRTBOV0lz?=
 =?utf-8?B?cHBTeExwZXhOMXRDUm5rZytVd2JneGgwWWdOTVpKMW1BZW4zNUVoVXJQWW1D?=
 =?utf-8?B?bXY3NTdHbi9LY25OZVhlUXhLRUF4a0lYcGI0amdqWG8vRHBQZHFJQTRmdzlm?=
 =?utf-8?B?UHdqa2RwdHE1L1ZOV1ZHaDlwR3BkaUNpd1lreDhuTkJaQWVpM3VTRmV4dEpQ?=
 =?utf-8?B?OWVXWTIwNzJyRDVNK3JDQlhhYjgwUTN5aThGMld1UkR5T0pQTlRNMGZKdjNN?=
 =?utf-8?B?MFdmNmY3ampNL0x6M3hwUllWcGF5Wnh2VHBDa3dCVWREZFJYM0VaL3c4U2VU?=
 =?utf-8?B?d3VpUHorMFJyR2JDcUFKd3FXWlJObVRMVzFwdGF1TlJWUUpMYlRvd1pZbU90?=
 =?utf-8?B?aHF1UlZZYXZ4dEhwM28rcUx5UkxoK3htU3RBNHptOHN1SFVvNWVBWVZIUDNz?=
 =?utf-8?B?MloxRUk3WllCZGNyV2tUaWRvSURxbUNhTkV1MUZxVnBvSitnMGwzN1dYV0tI?=
 =?utf-8?B?THNHN3RXS3BtbE1UYk1sVUhBb205b3hoTVUvZzNDOU5EVnlxQlhpZlBZOSs3?=
 =?utf-8?B?MllOMlNUanNNcEZhdCtBc2pwd1pNYkRLVXpmY1VPOHc0T0xtM2RZY2pTUENO?=
 =?utf-8?B?VFJ0SDMvcU5VdDhmekJHMDlQTk8xT3MvdC9wbWU5RjFMY1lrbjJJTjFRdTZv?=
 =?utf-8?B?UEhoZnNHRmRNMzRwcVdEZ2V0dis5WWVWd1YxL24vazF3ejFza3FSYlptdC9L?=
 =?utf-8?B?VmZ4V1NFR3c0aFAzRFR3N3h1cE0ydlkwbXdUV2duYWZVZ3ZYWUs5U1I0VVQr?=
 =?utf-8?B?NnBqWE0zTkRKWnlEZGlnd29icjBKNU93SmExa2h1ak00bS9ad04xVkVmelFM?=
 =?utf-8?B?S2RMWDdZOXJyMk1vT0ZiMzVOVDNUdGFNNmVRN3lwUE43ZnZYOE85YmxJa095?=
 =?utf-8?B?ckhwNHhseTNDejU2cDZhYXhUd2tHeEJMbklDRVpCdGZtejFqZkhLYkZuTVhq?=
 =?utf-8?B?TGtpOFNCZDBLcWRvSFc1UitKb2JoK2tlWmt3T01iWUUxTFdzdGtNWGhYcC9B?=
 =?utf-8?B?UkdFektZWEhnZmorVHkyVms4eU5jWkYvWDNhRHQ3NUk3ako3WG1GRjVJUDlL?=
 =?utf-8?B?NE8rUTZ5cEtuZXRRalFHYjFzSjdsTXdtQXBTOFlza3hCYTl5WFJIbWs5Nitm?=
 =?utf-8?B?L1NnQ0VjdXd1MWg5cndzOWVBZE1Mcm1Lb3NWK25MVlgraW1XQzJPLy8xZGJq?=
 =?utf-8?B?b2pmeEttZEdraVQybHBUM3ZxQ0U1dWx5MGFOaDZzcm5uZWsrUXlTOXI4Yjc5?=
 =?utf-8?B?NWJUZ1Rub0ExSGFkV2xNMDBqclJCN0EwMmRtSDU1S1BrSGczZ01WMGZqaDNr?=
 =?utf-8?B?TENDUkUvQTJnc3FpV1N0b0pnaUJzRy83NkRLb1VHbUc5OU5zc0tucjh2SlJI?=
 =?utf-8?B?NCtoTlI1dzRrUTRTM29ka29Nc2RtTTY1YlhramVqakkyTEFtME15NER2SkRI?=
 =?utf-8?B?eER1UG9ySG9GeE5yVFhTOEhLa0RHMWVsUi9PdysxL0hwWFpLMUxza2pXTm9N?=
 =?utf-8?B?UExYN2pXRTNma08wUnAxSVRiWWk5UTZMR2N0enFJcVlUZUQvTlhka01CN2VH?=
 =?utf-8?B?N1I2ZWF0enJ4dnJCUzJTYVNZN0Q1YWx2YWZqUHJHR2k2MTVDalR0Ym81N29X?=
 =?utf-8?B?S0RhdWpxUTM4Z1NsT1NHb1N1bjJqM3AzV0pjL1h6aGhmQW9ZOGVxNTlkQzRw?=
 =?utf-8?Q?Cl2qfL/GQNA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1orYjdwVXdGOXllMEptLzJQY0J6aGhreU5vQlNXSzRvOERKWkFiU2VyaXN2?=
 =?utf-8?B?UWY4TUxmRWUvOUxEVjBWQ3FHTmF5RENEY0gxWkJVVWluWlBIOFZ4VkRqdjA1?=
 =?utf-8?B?NnBXekhHOTl1SUx2dERzMU1HelV3UTJ6dXhvYmt6OHF6Wk9UREtHbEJQdVhG?=
 =?utf-8?B?V3lUWDI3QXJ2d2JFcFVHSUlXSndFaGFRUzlteFRVOGh1WVYrV2JWOXdWdVJ5?=
 =?utf-8?B?ZFR6UEpXYjFZTVFvMUtXS1NCd3NiWFhDNEF3NWdNdzVKVmhKK0tZRldCeDE5?=
 =?utf-8?B?WnM4cXpmbFg3MVh0SkFlVUQrNGM2cEt1RkhIT3pTc1IvYXUreklRSlhLcWxR?=
 =?utf-8?B?MUo3eGR4MEpIZG5LUU9mcWkvZzcrZG5LRzI3eS9GZHM5NGlraGpScEQ4b0xC?=
 =?utf-8?B?N0xkK01sUU5KSEZYTlB1Sit0ODdOMlJTMnpzWXovbW9JWFJ4UUs5clgxTlp1?=
 =?utf-8?B?SThRSExjN2o0YWN2NWVpOEVYTlNZM0dTb09GYmFRUGdRK3NJU1I0czJtTXhU?=
 =?utf-8?B?NDJoL1lkTUwxNUdEZkNPR0JZOGE5OTgzQWxlVFJaNDFwZ2JEUWNwQ2ZIOUg4?=
 =?utf-8?B?b2FEOVRGK0E2TDd0TDZXNFY0elQvZThqOGJIYjdLa2FFRGJQUkpYaE02bFcw?=
 =?utf-8?B?S2ZiblA1M3JwdVJXTktEV0xzQlJZVFExeXRkaWtRdldhbjFrVXNiTHBiRlVt?=
 =?utf-8?B?OS9rU3M1SHRuVEhoMXFaZ3NSWlJ2cTVsNWVPZkhVWUw2Rm81R2Mrei9pazFV?=
 =?utf-8?B?NWVqU3BKYVl0Qk85SFZOd2cycVNtYXFHS3BYT244OUcyM1crVzJNMUxrNWV1?=
 =?utf-8?B?d1NHVTVVUjRNM2VKS2RxbHZFZGQ0cU5CdE9HSW9URGYxRVJPMkxUbzEzdWNK?=
 =?utf-8?B?eGsxVG83dnRVMjIvaExQVVhrUWFvVkEySXFNMXA4WnpHdGxIN3hiQW9WTVYw?=
 =?utf-8?B?YUNhMWtWSnh3MHBrV1oxSEFHR2NvYi9qQmEvQlllOHZrelI1ejRya1ZtV041?=
 =?utf-8?B?cEFDcVZJWmsvZW9JQVJxT1ZLWjVKOHVXUHVoa1ZRczFZdTd3WkU0OGNGbUZj?=
 =?utf-8?B?Q1I0NHNuZWlZenl4NHErbVMxVDVEVXVwSWszMklzOTBLTmEvWTBmMHNGYWhG?=
 =?utf-8?B?RlBUNjZEQURZMStzS2ExOEIzSFlTTCtMN3k5dEQ0ZHpaZmJrVFczYXYrdVB5?=
 =?utf-8?B?QXM2VkNBRmFBNjg0NmsrVXo3RzZhUFJ2ZjNXM014bmd5OTZiZG02S0UvUnFn?=
 =?utf-8?B?WmNlT0grTms1QnhZb0pPYmJ6M0pzMVVPeVVFNmJ3OExpb1dBWWp5VmI3QXdB?=
 =?utf-8?B?c1l6RmFGa1J3dU9vbVR5R0pTMHc4aHV0UFJoNHZSMUNwc0NVL0ZJckduY3pT?=
 =?utf-8?B?Q2VRd3JDRjZnZCszNElLUVlNZ2dRYk1tSUdxd0I5MjR6TTlkdUwva0QxeEVx?=
 =?utf-8?B?dWFPczU3VzA4a0ROcDN2NW9XM3RwOHF5RmdXUzhZaWoxazQrV1dMRk4zZ3Rx?=
 =?utf-8?B?UDdqK2N2N0R5cmNKOEplcHdCTElucGFFbmJwOHNOMzE2clcwendTV1ZsTlpQ?=
 =?utf-8?B?K3l3ZC9FTWI2cVN1SmJOamdKZUFXcXFpN3M3R1c5cXQrU2xWcXRpU3IvZk9Q?=
 =?utf-8?B?aTNjM2dFL2w4N0Z3RnRqTTRpYWJtc2MrMEdOTkV0ZWdBME1aamlGWGQyWjZQ?=
 =?utf-8?B?UlVPVXlTaHpEelh4Rko1RzVMYlBBeGp0dkx6NkxicjIvaHFWTFVaSXlLNzAv?=
 =?utf-8?B?ZjRYMGVGcGRrUWZlVUhMS1l4bFR5TmlwK2NIVHNhdGFUL0ZvOHdNQlk4TE5C?=
 =?utf-8?B?elIvR1cwYm5vSVFBYXU5ZWV6cFJkbjZReThpbVFwUWZ2WUlPNms2Zlk0dmda?=
 =?utf-8?B?ZytyMkN1UDNQQThjVHRkajhWOFh0N284OUQxZGk4R3l0S2VzWlllbWVWQVE2?=
 =?utf-8?B?MjlDVGVKTWFzQTB2cWg0T0tjSnB5R0pBY2ZuSW5Fa0RQOXk5V0dxL0lKWkpJ?=
 =?utf-8?B?OG9kUFRWQnFRSGNHdHNCNWowMG5PMzltc0svUUZHS0IxckVyWHYvWHdHQlVR?=
 =?utf-8?B?NTRVMWdYWGsxSGttZ1ZGSmtEYjZ6TnRPbklBd1d3UDZtUHE0Y0tCWE5VaUVM?=
 =?utf-8?B?ODR6OGszdWdLemtqb1I5TThUNWx2cld6OGdldytZYlhibi90VTRjaXAwL0sv?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c0b121-8e2f-46d4-9e0f-08ddc307056d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 18:48:28.1591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bR/BhL/gCe0WAuTWFcA6NFbPmQfje6+mY5/P9XMtM4pjb0M43LdZA3Yn0qAVGqsI0+UktwpvvsvbpGB+6f0dBMTE/+Qh6Zm7yu2H7aR5z/o=
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

Let's replace the manual call to ioremap_wc function with devm_ioremap_wc
function, ensuring that VRAM mappings are automatically released when
the driver is detached.
Since devm_ioremap_wc registers the mapping with the device's managed
resources, the explicit iounmap call in vram_fini is no longer needed,
so let's remove it.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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

