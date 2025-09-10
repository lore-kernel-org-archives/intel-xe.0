Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93650CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 14:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569E310E935;
	Wed, 10 Sep 2025 14:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NE07cQh+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D4510E935
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757515079; x=1789051079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TQPAaGPvQAuLN3n/j8AbnhzWpa432nkY/VqaX9uTOqo=;
 b=NE07cQh+fxOQp+uuQv44OX6Sz1Hqrd6c4JvhT79+IfoJU0T6wW2yny7R
 ouN3QA09Uo0Z1GxCLx98k99pwoNDujAPTVWYeJB+M+YzhUGBIXPrbWOyM
 8tijNRs7RtUfVd/utyZYbp3miCcz9ogjofQ3F15aN+Zd0XyPXg78RX2U8
 0Mq8s+fLQlRaZYq7ioavDwczaUfNq58/T2FJa9K6wcCrnb9EMGS4lRWHK
 doPEgEeCOMObS7WPYa2hT/DA6QmBhqkB4esiGrsXg0fJH295ryttPpZex
 rvorjsQ0skjOJRX2RmZVa8ExkX4cJqpanCD5Pgcar/N6NFHyHCQsSwk5U g==;
X-CSE-ConnectionGUID: 4fxfVA9cTUqS68/Tsz14MA==
X-CSE-MsgGUID: OejLMICzT/+KeC/G4LkL7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59776995"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59776995"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 07:37:58 -0700
X-CSE-ConnectionGUID: 1/fHC3kgSe+E8/hMHeGy2g==
X-CSE-MsgGUID: sKTqoh5QRJu8C8URoacRXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="173327581"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 07:37:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:37:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 07:37:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:37:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBP34r07imBdTp6P3DKs4gFeu6Gs260dwavwMwHGGQ8YrCWYh0AMAalMPzC45oEzjLPb5YnN6hJInKIyOUngJkEWYzh96WvEkUdDxHOZuGOHLteNqGJadc+Ry9UwebcXac8kdiP/kGe77udT08JxyIzE5aQJHy3nVvzZf+A06iYPZ/IA6OIuQBtntNAr/qBe7z0VFdHR6+Lnwxz2vj2rD8JTyaZTgIN/BtjIeR+A+6JTJax9ts9gj/+mmCpv0zdwjVcz/UnyM3c9xx31Ark3+IEqk4xQMVBzY98IHUyDWyi7G6QhosF1s8+WAAi8AZbshYxIVcW2thKK6/a8lpnlXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d170xli4m9ZL+5SRYX59CNGPOuv4fzaOQb8DRXrX/z8=;
 b=Sx+dV9AhaeiYOj3jRCF/YVdiAiAXeIRnUz8cWmce9wqR30rlr+UlBtu8Pl23ZIHn7QH7CMeTXWpVxMmswfiXk68D8/4EMATmCqwSptlL3KHFhk+BXHZT9Xgxn7Vp79F1u8vuXneIPtyNo9enr5cTmc4dpmEOvjyVJ+GFZ0iJjuzdaPjkDEG8FX2yo7nzV5U3Z8YuzC4J+QJ4Xh/anYFkzwjc9UslP0anz3dyW84Ud6gLqQdZxWxLGfGq2DKNUObIT/+XBlgkpUKrela0nanWqM4mMhEpBhI926y75WK5xjVpfJmPKO7yy6DzR98wawH+M4j7nvB/c5TEOCG+R4504w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:37:55 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:37:55 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v3 3/4] drm/xe: Force user context allocations in user VRAM
Date: Wed, 10 Sep 2025 16:37:35 +0200
Message-ID: <20250910143736.792426-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910143736.792426-1-piotr.piorkowski@intel.com>
References: <20250910143736.792426-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0045.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d4c5f5-7651-43df-cb6f-08ddf077a12a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHNHdlB3MVhzQzk4UCtHdEhFMTlGUXBpK1Y1OHdLeHhIUUxJSU1JS3NkYWhQ?=
 =?utf-8?B?R2pNZGJKVm5PQTYyTExzc2Q5QzRobENwMHpUUFM2eVE1V1RXWXR4bWZpMVNI?=
 =?utf-8?B?OEswOGw4TkVHaVM3eVFxSFZadW4rak1hZlVwaEw0bllNVUNMdW5xY3RKUjF5?=
 =?utf-8?B?NExqWW9OaVlLbTR2c0lZb2VZdzBZT1RDc2RWWDZVcHdGcTlTS3hFQzZLcG9F?=
 =?utf-8?B?RDc3cFhFN3pPTk9hRGVwWi81bmhvSmUrRUdNYkJhNjI5ejFobFBlTVZNa3p3?=
 =?utf-8?B?TWNSbm1ocWRxYVg3S3dKK2kreEE0TjJiU0U0YTVTZWpDN3RJYkpMRDVoeVRa?=
 =?utf-8?B?TGNCVHRPaVFLVTF1WjR5NzJqb0ZaNUk2T3k4SzZjTlZKYVY3a2VsdENyOXZt?=
 =?utf-8?B?UWVPZWFEa3Y5WU1vMzdWV1RmZm5FTWdEL3ROTm5kVDRpWHVRNFE3N280Ykwr?=
 =?utf-8?B?UGVWZlZiMXdobjh1ZklhV2UvdnVXd2dQT1FNQjljRWlUMm54ditrVmc2Y3VD?=
 =?utf-8?B?Mk9oR1lwdEovbkdqSGs3ajFtMEswVVUraXlURXQwSHRvSjQrS0k2d2V0TC9t?=
 =?utf-8?B?R3JmYko3OEprTVdiZXhnUzkvVWN4QWROMzI1MnZ0eHAycDc1c0tFTnpKYVps?=
 =?utf-8?B?YVlGYytMdHhCTFVWbVZKODV2T3RtdFdRbEI2WlJWNWI4QjhNN1RCU04vSFdP?=
 =?utf-8?B?dm9pL2hrWFN2VENDQzArbklWdU5mWnpsYmVsdWE3a3VZRlhhMW9PMDFFQnpa?=
 =?utf-8?B?YWRvYVQ4bVJCZGpJbE1YOC80dGtrSWI1VTRqeHZQdUpib1l1WGhyWHFFLzhV?=
 =?utf-8?B?OVdROGZkRU1zc0YzZG5KcE4rVlFrK2JuYys3d0IvbGdwSU92K25jektrdlBI?=
 =?utf-8?B?TSttVmFPNzE2QThsemhVcTdIYkVBUzJiRTMzR0hkWFgycFg2M2J0Y01uVks5?=
 =?utf-8?B?Y2xYSEp0NUx0NExjNXIyNmdCUm92MFQzWnJhZ2ZKRVdpSTR1VlkvVnc5aGFx?=
 =?utf-8?B?VThMKzNTQW1TZDNyUTRRNE5EM2FWM2EwTWhLUWVLaG52a3JiS1o2M3pHRTI4?=
 =?utf-8?B?OWgyYklWRWcvVzBmUW9LYUZyeUJMbUdnUDFxd3R5RlJ5RVc5bGk2UFkrOWJm?=
 =?utf-8?B?SGNVS2ZBRlh3U2t6N2RWL3ZiV0VOY1pZai9qSE1DN3FtQ0NGcHdCNnNDQTh0?=
 =?utf-8?B?U0dxbTFjMmttb1VEcVJ2V2tVWnNjaTFhdTF6OEwrR0t5blhKeTc2VFQ5cDdz?=
 =?utf-8?B?NnNPMnVHeGUzUXIxRWsrUEdqYUJhZzhhRkhsMWlrcnNUWGZtWStUamRvTGJP?=
 =?utf-8?B?ZUJYNUoxSTBoUGc5djh4T0poLy81UE9GQTI2ZGdMU1RhdHRmKzhOOFBmcjV3?=
 =?utf-8?B?SlZHRlZDTjJRRVhsNTBQVUdtbG9XTmcxb3h5SEZtT0YrUjgzcmdKN043VUZD?=
 =?utf-8?B?SGhBRTcxbGdhYllRTC9mMmFwYWJGd0h6VytSSDlxS3ZVekIzeVFhRUFTUHlj?=
 =?utf-8?B?aEM5eGlpQVhTRjZoQ0Z4b0JBNFhkZTRzUkpEQlNGK043NnorZkV0UmtpbkIw?=
 =?utf-8?B?M0VlR3lxL1FIcGludlNEUGhMMXBwTGN0dzJYUUNnaVVOOHJhUlF4dGdwcHZ2?=
 =?utf-8?B?ZTJ0aWlkMVBlREhCTDBHd0JnVHRocWEvRjdJRGpIS1J3M0YwVXFIbGhnakxr?=
 =?utf-8?B?L24vN0hKbGIrRHR0ekdTTGl6RTZrK0NVWDdxTXV3TzNvNnQ1R3graFlYSWdl?=
 =?utf-8?B?MmoweWl2VC9kMjBhbFVxOTZjRlNwTlVNQTlDSDRBT0tseitaU2RqczZNTFV4?=
 =?utf-8?B?amlIdkRJZnhKRS9MSmQ4UFNHZnVPS2hFKzR2Sm9ubVBMQ25OY1FpTG04NGJr?=
 =?utf-8?B?a24vOFVXS3hETE1yMzFMYWZ5MnNWMXJxdm44MUt6ZDI2SG1RMFl3clpjSnBs?=
 =?utf-8?Q?xKVV28MkNvo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHNPUXFWM0J2US9jRlBLSFU0eVdYNTluNFpKakFhUmlaM2dWOHVhak1Va0k2?=
 =?utf-8?B?SDlLSytoUzlsRVJuc2htYTMrOXRKN21lVTZ3bktPaTd5MVJpNm9hSm5nMzdY?=
 =?utf-8?B?TitXbXJKSi9sazM5M0liSVpPMWpNOGtZREl1a0VtWFdhWTc1L0hnSklBcHUr?=
 =?utf-8?B?N0grWHpUd1BPdzlaNSt0Vk5ORlRnbXFmTVJDTHhnZTRQbVV2M2d1NFJFclBz?=
 =?utf-8?B?Zndic1c1K0xjeUl2V2FxQVRBSTc0cmtsaTdrdHpralp0dm15cmdMekVqdlBh?=
 =?utf-8?B?czIzWVV0VURURmZLUThvazBRTS9FV2NxV3k5Qk5MUnorYmFYQ205M01hZUJQ?=
 =?utf-8?B?enFqb2U4Y0lhaHZGNkJaR09YYXRRYmVOS1VPNC82NHd1SVl1KzZya0xGKzg3?=
 =?utf-8?B?ODRoV0dWZGFieU84OTdwODdGYlE2SG1HS1NFb2lvQTdnd1ZLUW5IZ0dsM2E2?=
 =?utf-8?B?UjFwajVHUFoyZ2ZqazE4aWh1Y1BtbGFHSlFJVVkvTGQvS0JsNENLdzVYNHFI?=
 =?utf-8?B?dWUxUEgxeW1jTzFCNWdnaEp3ejh1Wkw4bmZFUWRhcmNYVnNsMDkzaU1HUmEw?=
 =?utf-8?B?OVoxWEFKczh1WHpHK1hKanRKL1JPbk1mbTVhSmp2T1lIQVQ2MGFKY1cwYmxH?=
 =?utf-8?B?TDQwa3VwaTRVazY1UTZES2hWcUZBRFpkTkVIYmtvS1FUM3ZPTEEvUmpUNmJi?=
 =?utf-8?B?NUVMNG1BL0xOWHpuUXVySjlhMGhCeTV1UkZWOUNrd1IrWjNpclZsV1BzMXY3?=
 =?utf-8?B?dkQ5QzFKS3EzbS9ubU12RnpvcnpBTENJUEphdU9NUzJFcERjbmxPTURwYUht?=
 =?utf-8?B?aDI5QWtueWduK1cyaCtzSzRubEdsMGRYdWtFVUZERWtDK0hMUG1HdS9DWWZa?=
 =?utf-8?B?Z3RPRGNTQTNpSit1VWNGWEpJK1U1WHFuWGt5ZVBjV0hkWHNPcmtqV0U0Yy9F?=
 =?utf-8?B?a1V0am9rcDBvZDd3U3Z0NkxteG1SNzR5d1FKeDlNa1QwU2tOU1hqNFE5ZmEr?=
 =?utf-8?B?cDNnQlpZU0NkQTRIaHJFUkhudGlVZ1lPL2l1OXV3NGtMZHg4UUF6S2E5NU43?=
 =?utf-8?B?dEpLZEQrdUNKYzlYYUorY29IaXFKdjkzajVlb3RyMVg3clZKZmRaUXFpaERp?=
 =?utf-8?B?ZWo2cGpXVjhyZ2RqWnBRN0pFWFdyUi9WS2xQY2V5c1lPWmZoSzFIQW9VUWNr?=
 =?utf-8?B?aFVYTWhqYlZqMHozV25JT29WRUVIWmJhMjBGZEh2TTJpOVhBQVh4eEphd2F2?=
 =?utf-8?B?ODNOYzR2bmtvTFVPR0xOeUxBV3pJRXlNeTYvdEhkTzJqRC9JdkY4N09COUQy?=
 =?utf-8?B?dkdnQnZ3VGptRngvaW1KMzZjMjZhM2VRNlZBaXZqNmo2M2p1b2RLYTFCODNu?=
 =?utf-8?B?K3VHSDZYc24xOVdQQUVDZVpNejFkdUJ3RWJrS2ZpeExnL2JlL2hxc3ZhV2hh?=
 =?utf-8?B?WXRmU2pmSEtWeUJBRDV1OVVyTWNGVWE1Ynk3ejI3ZDcyUEpJTTNJeks5RmVj?=
 =?utf-8?B?cmlGM2FNOUwvcjl2R0NxV3ZkS0lLdnRLbkY0Q2wxYjk3RFlQcVVCZnhoOHlW?=
 =?utf-8?B?Z2FHNHBjK1NFbGNndGpRcUVnVms4M082dWJQS1hzaFdBOWFITVZQRi9KTis5?=
 =?utf-8?B?NDY1OUhJSEUzV3A2T24yWFBicWlZYUd4Z0dFem4zUm9jdU1uOEtTMk53U0ln?=
 =?utf-8?B?THpkRWdIZk50SUNPQ09Ca2JENDJwZ1dhMWlTUG1KK3htRGpuMVdwVGVEYWE3?=
 =?utf-8?B?eS9ZcWxRVU9YYXFtclp5TXBzV2ZhVkV3TElXZHRuYlpFV1RicjRMcWF0STU4?=
 =?utf-8?B?dVJlQmpvdmR5ODlpbFE1d2ZXaUtrZEVsczJ0K3d6L1dWaWk1aGw3Y2I4eUg2?=
 =?utf-8?B?OGtxODdIYjJMWUw3dmRLaDdKMk85djN6WlduRHh0VFFZY1VqUnlZcUtwdVQ1?=
 =?utf-8?B?aW0vZGt6WlR1WVUyZU9wVGhKbmkwYUgwV2pmMXpjWkFmZ2lPTDB5aVZCaG9P?=
 =?utf-8?B?S255T2hpRk5YY01YcWRIaWJEU0NLVE9EaXRoQWRVNFdlTUNDblNsaExubmtr?=
 =?utf-8?B?VHV5MDExTW1xUUxxZjZ5QmhXS3RFRGNGSTh5R1B2SUkzdnRwTmJUSS8rV1Jz?=
 =?utf-8?B?WGIyNkVENVpMRW9yT2xBSUp3TTNyZVdkOE9FZjJpdUM4ZTBxRzA1b3lyWEt1?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d4c5f5-7651-43df-cb6f-08ddf077a12a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:37:55.3544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZ8LyNTCQAPh2OYzREXhwOlCUfxIb/Pq0mjOjEneo/8ZIk+CxcJF3zDoGRIFN8X0ZAdYXJeFAqXkZeGRPljIcbXX33lGgi2fbzITxeZr3rU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6744
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

In general, kernel structures should be allocated in the kernel-dedicated
VRAM region. However, userspace context data - while used by the kernel -
does not need to reside there.
Let's force the allocation of such data in the general-purpose VRAM region
accessible to userspace.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 7 +++++--
 drivers/gpu/drm/xe/xe_lrc.c        | 3 +++
 drivers/gpu/drm/xe/xe_lrc.h        | 6 ++++--
 drivers/gpu/drm/xe/xe_pt.c         | 2 +-
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 063c89d981e5..9a8fa3ed5d09 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -160,7 +160,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	return q;
 }
 
-static int __xe_exec_queue_init(struct xe_exec_queue *q)
+static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 {
 	int i, err;
 	u32 flags = 0;
@@ -179,6 +179,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 			flags |= XE_LRC_CREATE_RUNALONE;
 	}
 
+	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
+		flags |= XE_LRC_CREATE_USER_CTX;
+
 	for (i = 0; i < q->width; ++i) {
 		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
 		if (IS_ERR(q->lrc[i])) {
@@ -215,7 +218,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	if (IS_ERR(q))
 		return q;
 
-	err = __xe_exec_queue_init(q);
+	err = __xe_exec_queue_init(q, flags);
 	if (err)
 		goto err_post_alloc;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 6d52e0eb97f5..423b0a1cde99 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1340,6 +1340,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (vm && vm->xef) /* userspace */
 		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
 
+	if (init_flags & XE_LRC_CREATE_USER_CTX)
+		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;
+
 	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
 					    bo_size,
 					    ttm_bo_type_kernel,
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 188565465779..21a3daab0154 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -44,8 +44,10 @@ struct xe_lrc_snapshot {
 
 #define LRC_WA_BB_SIZE SZ_4K
 
-#define XE_LRC_CREATE_RUNALONE 0x1
-#define XE_LRC_CREATE_PXP 0x2
+#define XE_LRC_CREATE_RUNALONE		BIT(0)
+#define XE_LRC_CREATE_PXP		BIT(1)
+#define XE_LRC_CREATE_USER_CTX		BIT(2)
+
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 01eea8eb1779..1b9c497f30e1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -123,7 +123,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
 		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
 	if (vm->xef) /* userspace */
-		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
+		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
 
 	pt->level = level;
 
-- 
2.34.1

