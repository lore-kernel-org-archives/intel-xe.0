Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D20EED63A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B17910EC13;
	Thu, 12 Sep 2024 18:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bF4JdvNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11D710EC13
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726166624; x=1757702624;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M1Z08Ps9El+BLj94sf3oaOOWl9saKupbKQkW4lO6GPM=;
 b=bF4JdvNhtiqB/UNUBi0XZfJLNYLwNBpcZsWyuQBZpZyoOYozeeCma1tX
 znPZO5dJnbyEve63YarCqiTmh+ibVurphk7BKefbg8iznB+V0xaw/6Trh
 iAIILSN8oRSorTHNq2jIct1cPNJCLbvboJBwpVqopzZAXTxT6jZDYaY2j
 HYoyqyWqAmBDAhgC6MroU4f0N9NZPIurMHT2jt7Dh0JNmzHfKjR9h7oip
 CGZrzsN276/nf1Cy9BW23Hz7hsbXCu5DAj2SaNrOEm9jLNZnJyU2JGgeL
 SXXsIqYJwgC4D15PwtX8gMbBXFgfIVlNzOX1vb+wb+HhhQiwjiA2zkNTF A==;
X-CSE-ConnectionGUID: Fi+4nhWqTd++epyyWx6H2w==
X-CSE-MsgGUID: l59ZIou9TlaJPVn66RKU9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25201233"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25201233"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:43:44 -0700
X-CSE-ConnectionGUID: 9NuiUHs8Q1yfEmi2TdgNvg==
X-CSE-MsgGUID: Ypt4Pc9rSyOPO0trqnHc5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71906906"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 11:43:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 11:43:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 11:43:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 11:43:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 11:43:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABrXpmVpg9O7LHok3asf3VT6y/PH8Vj78ARY6beFaXg4jPTArtJi4r73/0iQc7ZND5I2XireV8ymA+cskzGcHK0w1AOtHTgSWaCkVYIkhR5wjnLeuHAerJESO4vkeT55dZgBgNSk/JoS8M1ocheCamGQCsErIGsRzoWUX6DGTnZWOCz7ieZp1gSX6FRmKwWxHHZ81l+tXPM4H2JtNes2SJW6Uvxm84aK+fsXh6xXDq26tdaTu21nRQwsu31HLTygIC5+dtsJof4k/J1X4xkX2kPG9hGL61bG3tTDbh8/fsRG6k/Xcvme+NPO1/F5yuJc7nuq6okPRinKJVpetePXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rxPDttx7eKzSAZj9CMCrV1J5trGV5c0gWZNIgZjqgk=;
 b=QAu4UIjhn++/3Momhx57zuxrE6JNshvNVRStfaqBuG2wPWwfiwf0DRUY/XU0qPwEEKnO3CMvGjaNUYnd/FVukskgInwX0P3E+Jxel9E0XVjd6AhXX02KZVLDrQwaHHURyFRUXovF0uWzAy8ztrvibsW1vbPAhZ3InB9AXVWQmZtaN8RotS6TmkSyCjDHsa5fNZXtrlVFBUfBVEMOh8dQakoGNcvA2+aZZkv+gWmnSeUyGY0UQhgdNA3BiZNnjlsURKr+n5KzFoE1I/kSeaCKkhBS/HezShEbPmUjzzwBKC2t/6vQEtg4Sm09W6fOboyjjXgylgtHZpuu9c0RJ8ArYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH0PR11MB5127.namprd11.prod.outlook.com (2603:10b6:510:3c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Thu, 12 Sep
 2024 18:43:37 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%5]) with mapi id 15.20.7939.017; Thu, 12 Sep 2024
 18:43:36 +0000
Date: Thu, 12 Sep 2024 11:43:30 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>,
 <james.ausmus@intel.com>, <felix.j.degrood@intel.com>,
 <jose.souza@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/eustall: Add support for EU stall sampling
Message-ID: <ZuM2UuqSag-Sw4Mc@intel.com>
References: <cover.1725866097.git.harish.chegondi@intel.com>
 <5f7adcc0dffec68bf88b282a5d2f92a9f05834ca.1725866097.git.harish.chegondi@intel.com>
 <20240910000914.GD5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910000914.GD5774@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0312.namprd04.prod.outlook.com
 (2603:10b6:303:82::17) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH0PR11MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0a5081-ecaf-453f-80a8-08dcd35acfd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnIzVWVYMkJ3UWRZS1NDOXdmRzRwK0l5cEZGdXo5eHpUYW1FUE1UTTVnaGpx?=
 =?utf-8?B?Tnh6TlVzN1haRTRwWFh6OHI4M3lvb1R5MUZKM245TWNJRDhsZkRLRmlmcUph?=
 =?utf-8?B?RlRQNjRIR0FRdFNDa2RjSGJTSjRFdFhyN1pZdXk5ektpSDU5N0dpa204dmw2?=
 =?utf-8?B?Q3ZncG5TOFpkaVBLNytFUjdkS0c5Y0JWWkc3bll3R0pFcWJsWGpJK3ppVjhG?=
 =?utf-8?B?US9FY2l4UkVBd3N2TmI2enJWZ3lOekNwUlJZMHBhc2RqMmEzalE2Q2dvelYy?=
 =?utf-8?B?cmQzUlJsY3ZaVGkvaUtGWlVpK3FQNjlmVDZBMGFtR0t0dERFenorV3JRWmc3?=
 =?utf-8?B?SmlySlU5Q0h3TkYrT2IydU8wU21GS3ZtZnpPNkpKZjkyMk5pclhDVlJ0MG9p?=
 =?utf-8?B?MzlGbGhac01YTXFmNTVKY0lkQnpVK0wwdWdRWGRvMTJLcWZYNFBVWlpOM0Jq?=
 =?utf-8?B?elN1L1hkeEhIeVRnMys3Yi9FRHFqcnZyb1dOWFVVOWpBV2FIZGxXWHY4MVRH?=
 =?utf-8?B?S0FBTXJKWnJtUU1oSWdPYUFJQkZ0S3h6bklyYWNZQ2xjcFVtN3pXSVREVkov?=
 =?utf-8?B?Z0NUcThjMWdSK2xqYkxBby9aRHJzeFJsU0RpZHVZTjEyb05uL1RhcUNxSTlm?=
 =?utf-8?B?aXZSUHRrVTFTbkhJWWloemNCYmF4MFBXVXB4SkNucjVMWUhhWFVtU1ZjOVZN?=
 =?utf-8?B?SkxVdkJXTllXcDZSN2pBRCtPZy9HL1FYY3hRZ1FXUFZEZUpyOC81ZFRLNXp3?=
 =?utf-8?B?L2JVaFN6elRzYWRuYW9qMmY2N3lDZ1VZVTRuL2tyOHVBem40Q1R5S0l3YmVS?=
 =?utf-8?B?MlZnMitVbFN2YkU1RzhHTFFxK25FeUZqWmZ5aHl5eFVZMkw2eWdIa1V1VGpv?=
 =?utf-8?B?Tnk5ODV4U1FEeklVa0o3NFV4a2RWdHNSWVQ2RG9jY0R1cWN4UVhmbW12UE9G?=
 =?utf-8?B?VG9CVU9LZUFTYmlEMUcyS3RSeFlxekFuUTZVSHc2Z3dxM21HK2pRd25mbElE?=
 =?utf-8?B?VC93OFo0RzR6UEViblpCMlloSGN5d2daV3QreHJmbFZ1VFNlZDl2UE1JQ1Mv?=
 =?utf-8?B?dzJ4a0dySWgrQ1RQMGVYbjJhWGcvSjFBaGNGdE9LYm0vRnJSdHNvemtZb2x5?=
 =?utf-8?B?YVNoWnU4YitmTU5jNTRvNWxHMEhsQmxxVlEvWmE1SnpSR3pQTkpLbXA3RDFI?=
 =?utf-8?B?REJhajNTTUhMdTRBLzQ2NzBMWkRlVk5WQmR5SnpZSklCQU4zYlZIS0E0bnRX?=
 =?utf-8?B?cUZMWVluRE5KMVArZXZxWFZScXIzbURZT3luVS9IK29aVlNDZ3RWSVFrcW9Z?=
 =?utf-8?B?VWJZWW9ORDdUc2dNTHFQRTRqZGtsbFNMb2oxcGMxSzQ3dUJ6K3dZanNtRzV1?=
 =?utf-8?B?aUhSUDlzNzhKcTFHK3VIM2Y4QnBWZVU2NVhsVVhpVHBCdU1hSG5La0h5OHBX?=
 =?utf-8?B?bnUyZU9WVHJRMHFQaWR3d0FXYmt1UDIrWWhQaGp1RmN3OGZMMzhPWGFwTmIy?=
 =?utf-8?B?eDA2QktnckFmYythVkNnZDZzeEFZQXdNYnZNR2ttVnpDdGFwU1dxZ0pkNTQ2?=
 =?utf-8?B?QWFSUnE0UkVPbEFLb0JZSTdCME5Ua1dnbnZCQnFkMnJsc2w3Zm9XdGl3a1hM?=
 =?utf-8?B?N2hqRmdMSnJjaFV1K2luRElRK212RTJjcEhwVWoxaXozU25mTEV1bEs1ZlBF?=
 =?utf-8?B?WDlsVjY2UFVkM0s4aU02aEV6cU5kK3crRU95YzgzUTBKRGxTOSszU3Q2RjVz?=
 =?utf-8?B?VlY2R1l5SDdZemFxTkEvT3RaQm11bmZUNXM5ZkxkNUJqYk9pR1ZZbTRxalda?=
 =?utf-8?B?T0lxOVdnZ3ZYL1N1SGZhdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmFSV1BvT0E4czZlanBDcWRjV29UZkJtd1lhazZQL1Q5YXNzRmdpYmZiZGd5?=
 =?utf-8?B?UHVJVXB3UnpqYm9kcDFhZDRCSVArMklJTVdhN0tEd0RCYlBFME1MZTVWdDda?=
 =?utf-8?B?NDU5MzkvendrbHQzbUUva2JpZnRXSHB3d0NMTStnbytiY0d5MnIxSitaSnhB?=
 =?utf-8?B?eHNDa2FxZzJwWmhOMURuRm5aYmVUMExVWVErVURYMk5ab04xUnhwWHRQdjdF?=
 =?utf-8?B?MGhsVVFwSlRQSmtNV2QxMUorcnpZRUNFRUxtSmpObG5tVTlyd0dSVE5IMkk2?=
 =?utf-8?B?Z29KQVc1a0dlM0ozUFY1OGNsZWtTczFHREsvM1MwVWsxaHBIdncwK1NlV3kv?=
 =?utf-8?B?cVQrN1N2bjFhY09SRFZoSkM2eWRKY05MYzNvSjBpb0tXS1dNZDZkN3gyUGl3?=
 =?utf-8?B?U05QWlVGSU1EVnMwWHRUU01rZ2xMMXJlbFBCa2MxZUVZU09ncHFFanNHS2Y3?=
 =?utf-8?B?d2NlUEtNK3JZZFlDWWc3Vk1zNGxzV0lQVldIV0V5OEhXTElER3laOHVFbThq?=
 =?utf-8?B?UXNmeVRjRVpGd3FPaGdFTlVpTmFiMm5PamFEOGFRM3FWT0Rud2NmSTFPT2Fz?=
 =?utf-8?B?ckM0OEozdmNaUXRPTThLbmgwSnhKQXk3dTBmN2traDN6VlVSb2hONmhST3Jz?=
 =?utf-8?B?Zm1xc1RoK2IwRGwvOWN0azVpSEYyZ3Q0VjQ5Si9wYWlUT3Ixd0E2OG1zTCtL?=
 =?utf-8?B?aFFLaXRKK0VTZkVjSW15eGEwTHBteU9rbWJVNjZ5MHJVUkYwVmE3ZXBrcHY0?=
 =?utf-8?B?a1VoVFkrWmd6cGtpajFDcG80VnRhZmFiSHRrSUlJWmd2QmplRWJLUW52cVVu?=
 =?utf-8?B?czdWQ0JpeXpvUUJzV05GR0RqQWg4Nm53Smc0QjEyR0NoUnVTQXRIbkVIeWhk?=
 =?utf-8?B?eWFNYnVlZEIvMFFWV2RVMlB3cXpwalNGTjgwcW1OdllSV1UvSmx3S1lrUTE4?=
 =?utf-8?B?ZXpDWFJ0bHlWczhibkxxRk5oNDc1UHY2cUllQmp3clFEUFFwTjVUeExiQ0dv?=
 =?utf-8?B?TkFLcTdLSDFvRzdRWjRibG9VL3M5a3hKNVU4ZC9PWWVhM3h2cTNpbFN5ZG1K?=
 =?utf-8?B?YTY3ODYvK3Nma1FTMXlQRTd1ZzZ2djdzeVEvUVZJbXp1L3VvUUdIVGJXWERO?=
 =?utf-8?B?YVhORm9LYlNqamFTVy9QWVEyQlJnM3BkeGU0TUltYkdjZXJlSHMrQVYydHJR?=
 =?utf-8?B?VEVHcXZ4cjgrSjcvVTBMdWlyUW1kQ3BUeEZESnBML0h1OG1wM2VEcmZ6ck8x?=
 =?utf-8?B?VXlvbnFkVG5YcjNCdzNjdEVhZitEeXM2ck1iYUpnVURBbld5ZG1MTWdyZGJE?=
 =?utf-8?B?NlJTelFqNjhSTyttenk1MUhHYWNiejNydjVrZFlpWWhmdGZMeWI5Tnh2c2NI?=
 =?utf-8?B?WEhWdk96dTZuOWt5NVB4OUlvc3BMUUVTcTZUdHQ0SkpVS0tRZGNpZSswQmFv?=
 =?utf-8?B?WUdHMHRIZHdVSy9qUkFIaDJweHhHditWbG9YSWpCZ0xSa2JaVGRseVNla1VG?=
 =?utf-8?B?QVkrdlMwTnR3Zy9HL3hoL281TFRKek94WUYrNW1NSW5vMFd1dE5rMEI5aGIr?=
 =?utf-8?B?S2RjWTZjNVFPZUJyWXlzNFRrRzZHZUZZRUUxS2ZYUXlHUVpnVXFSNGJmNjJL?=
 =?utf-8?B?MURPZmZPN0ZwVFFNbjlUY2IvTGJyZmxlT3owUGlpM1Fnd29MNXFybHRqN0d1?=
 =?utf-8?B?WHh2VUk3OTh5elh2Tk01aFQ2RDhES1lLWExLWVlJVkVKMUFLSjN4bzRvSGUv?=
 =?utf-8?B?SmJxalUrelpUSlpLVGJzQjRUblRBNFV2WDI0ZEZzUHpPbTd6V3h3RktWK2hQ?=
 =?utf-8?B?NGpndHBaVG9mM2JCMU03TE0vYXRWRWpXbGR5U1dVSjUzVlhDZTU3VmYvK0Rk?=
 =?utf-8?B?S3ZiN1l1SWwvWFZPSURZK3dwUE42WUxEWVFwcFBNTjZuRjdQRWRQMkhBYzkw?=
 =?utf-8?B?TDltbjg2V29KWGpnQjBHTTd0b2Q2MzJ5ZzhSaVZwRDZDYzBmYldEdmVRck5z?=
 =?utf-8?B?T0ZpU2xYK2J2L3VJVWJqaWs2QlhzZ3A5Ykt1eGhGaWVnZ0FkWmlIc3haQlZa?=
 =?utf-8?B?RnB1M3B1dEFLbDBYZy85Rk45ciswNGZ5UVJIdkJTajBrMldBU09tRFMrSzZX?=
 =?utf-8?B?Z0srOTdkb3o2Qm42eFB4c0RvSHFCQTdsaDJmbVcwZXVzN2JaUTB6UllPSWFs?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0a5081-ecaf-453f-80a8-08dcd35acfd3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 18:43:36.8807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2svadwUHgEK7cEHfRrhKws5tAmCInks3XXWVTweALR795KJPxpqeUYPcAsix0P2dOYgUV+FvesnOy6F2GusM7zoQDgtbp/4h6GhENOmBx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5127
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

On Mon, Sep 09, 2024 at 05:09:14PM -0700, Matt Roper wrote:
> On Mon, Sep 09, 2024 at 12:36:40AM -0700, Harish Chegondi wrote:
> > A new hardware feature first introduced in PVC gives capability to
> > periodically sample EU stall state and record counts for different stall
> > reasons, on a per IP basis, aggregate across all EUs in a subslice and
> > record the samples in a buffer in each subslice. Eventually, the aggregated
> > data is written out to a buffer in the memory. This feature is also
> > supported in XE2 architecture GPUs - LNL and BMG.
> > 
> > Use an existing IOCTL DRM_IOCTL_XE_OBSERVATION as interface into the driver
> > from the user space to do initial setup and obtain a file descriptor for
> > the EU stall counter data stream.  Input parameter to the IOCTL is a struct
> > drm_xe_observation_param in which observation_type should be set to
> > DRM_XE_OBSERVATION_TYPE_EU_STALL, observation_op should be
> > DRM_XE_OBSERVATION_OP_STREAM_OPEN and param should point to a chain of
> > drm_xe_ext_set_property structures in which each structure has a pair of
> > property and value. The EU stall sampling input properties are defined in
> > drm_xe_eu_stall_property_id enum.
> > 
> > With the file descriptor obtained from DRM_IOCTL_XE_OBSERVATION, user space
> > can enable and disable EU stall sampling with the IOCTLs:
> > DRM_XE_OBSERVATION_IOCTL_ENABLE and DRM_XE_OBSERVATION_IOCTL_DISABLE.
> > User space can find the EU stall data record size with the IOCTL
> > DRM_XE_OBSERVATION_IOCTL_INFO through struct drm_xe_eu_stall_stream_info
> > parameter. User space can also call poll() to check for availability of
> > data. The data can be read with read(). If the user space doesn't read
> > the EU stall data fast enough, it is possible that the EU stall data buffer
> > can get filled up and if the hardware wants to write more data, it
> > simply drops data due to unavailable buffer space. In that case hardware
> > sets a bit in a register. The driver read() returns -EIO error to let
> > the user space know that the hardware has dropped data. A subsequent
> > read by the user space returns the remaining EU stall data.
> > 
> > v3: a. Removed data header.
> >     b. Changed read() to return -EIO when data is dropped by the HW.
> >     c. Added a new DRM_XE_OBSERVATION_IOCTL_INFO to query data record info
> >     d. Added struct drm_xe_eu_stall_data_pvc and struct drm_xe_eu_stall_data_xe2
> >        to xe_drm.h. These declarations would help user space to parse the
> >        EU stall data
> >     e. Addressed other review comments from v2
> > v2: Rename xe perf layer as xe observation layer (Ashutosh)
> > 
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> A couple general comments, then more inline below.
> 
>  - I may have missed it, but I don't see anything that prevents this
>    functionality from being invoked on platforms that don't support it
>    (e.g., pre-PVC hardware).  Presumably there should be a feature flag
>    or IP version check somewhere to block this.
Yes, I missed this check. Will add it in the next version of the patch.

> 
>  - This is kind of a megapatch.  It might be best to split this up a
>    bit.  E.g., an initial patch that implements the basic interface
>    and such, but just stubs out the parts that actually go touch
>    hardware.  Going back to my first comment above, with just the first
>    patch landed you'd effectively treat every platform as a platform
>    that didn't support EU stall sampling.  Then the follow-up patch(es)
>    you can add the hardware implementation for PVC/Xe2.
Will split the patch into two in the next version.
> 
>  - I know Intel has changed terminology several times over the years,
>    which makes our driver codebase a confusing mix, but for new features
>    like this (and also for the EU debugger stuff that other people are
>    working on), it might be best to just use the term "XeCore" instead
>    of the older terms "subslice" and "DSS" for naming local variables
>    and functions.  Since "XeCore" seems to be the preferred term these
>    days, we may go back and rename other parts of the driver at some
>    point too, but for brand-new files like this one it's probably not
>    worth starting out with already-obsolete terminology.
Will change all dss/subslice to xecore.
> 
>  - Do we truly need all of the API extension properties defined here?  I
>    commented farther down, but some of them (like the buffer size) seem
>    pretty pointless...there doesn't seem to be a good justification for
>    just not using the largest size always.  If we're just exposing stuff
Yes, it makes sense to use the largest buffer size always. The only
reason I can think of using the smallest buffer size is when we want to
test HW dropping stall data which happens only when the buffer is full.
It is easier to create this condition with the smallest buffer size.

>    because the hardware has a knob, then that's needlessly complicating
>    the API; part of the reason we have uapi extensions is so that we can
>    add extra things later only if/when we decide we actually have a real
>    use for them.  On the flip side, some of the stuff like GT ID seems
>    like it shouldn't be an extension; that feels like it should be an
>    intrinsic part of the API and it shouldn't even be possible to open
>    an EU stall stream without specifying which GT you're working with.
> 
> 
> I didn't go through the entire patch in detail, but more comments inline below.
I am still working through your review comments and will address them in
the next version of the patch.

Thank You
Harish.
> 
> > ---
> >  drivers/gpu/drm/xe/Makefile                |    1 +
> >  drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   33 +
> >  drivers/gpu/drm/xe/xe_eustall_cntr.c       | 1000 ++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_eustall_cntr.h       |   60 ++
> >  drivers/gpu/drm/xe/xe_gt.c                 |    6 +
> >  drivers/gpu/drm/xe/xe_gt_topology.c        |    9 +
> >  drivers/gpu/drm/xe/xe_gt_topology.h        |    3 +
> >  drivers/gpu/drm/xe/xe_gt_types.h           |    3 +
> >  drivers/gpu/drm/xe/xe_observation.c        |   14 +
> >  drivers/gpu/drm/xe/xe_trace.h              |   35 +
> >  include/uapi/drm/xe_drm.h                  |  134 +++
> >  11 files changed, 1298 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index edfd812e0f41..9c5325796bd7 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
> >  	xe_device_sysfs.o \
> >  	xe_dma_buf.o \
> >  	xe_drm_client.o \
> > +	xe_eustall_cntr.o \
> >  	xe_exec.o \
> >  	xe_execlist.o \
> >  	xe_exec_queue.o \
> > diff --git a/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h b/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> > new file mode 100644
> > index 000000000000..c70f35f82cc5
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> > @@ -0,0 +1,33 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_EU_STALL_REGS_H_
> > +#define _XE_EU_STALL_REGS_H_
> > +
> > +#include "regs/xe_reg_defs.h"
> > +
> > +#define XEHPC_EUSTALL_BASE			XE_REG_MCR(0xe520)
> > +#define   XEHPC_EUSTALL_BASE_BUF_ADDR		REG_GENMASK(31, 6)
> > +#define   XEHPC_EUSTALL_BASE_DSS_BUF_SZ		REG_GENMASK(5, 3)
> > +#define   XEHPC_EUSTALL_BASE_ENABLE_SAMPLING	REG_BIT(1)
> > +#define   XEHPC_EUSTALL_BASE_EVICT_TDL_STALL_BUF	REG_BIT(0)
> > +
> > +#define XEHPC_EUSTALL_BASE_UPPER		XE_REG_MCR(0xe524)
> > +
> > +#define XEHPC_EUSTALL_REPORT			XE_REG_MCR(0xe528)
> > +#define   XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK	REG_GENMASK(15, 2)
> > +#define   XEHPC_EUSTALL_REPORT_WRITE_PTR_SHIFT	2
> 
> Do we need a "_SHIFT" macro like this?  Generally we can use the field
> get/prep macros to handle shifting (and get extra compile-time sanity
> checking in some cases too).
> 
> > +#define   XEHPC_EUSTALL_REPORT_OVERFLOW_DROP	REG_BIT(1)
> > +
> > +#define XEHPC_EUSTALL_REPORT1			XE_REG_MCR(0xe52c)
> 
> This is a masked register, but we're missing the flag.
> 
> > +#define   XEHPC_EUSTALL_REPORT1_MASK_SHIFT	16
> 
> As above, we probably don't want to be open-coding our shifts (or our
> masks).  There's helpers like _MASKED_FIELD() for generating the proper
> value for masked registers (with extra checking for mistakes).
> 
> > +#define   XEHPC_EUSTALL_REPORT1_READ_PTR_MASK	REG_GENMASK(15, 2)
> > +#define   XEHPC_EUSTALL_REPORT1_READ_PTR_SHIFT	2
> > +
> > +#define XEHPC_EUSTALL_CTRL			XE_REG_MCR(0xe53c)
> > +#define   EUSTALL_MOCS				REG_GENMASK(9, 3)
> > +#define   EUSTALL_SAMPLE_RATE			REG_GENMASK(2, 0)
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_eustall_cntr.c b/drivers/gpu/drm/xe/xe_eustall_cntr.c
> > new file mode 100644
> > index 000000000000..d8546fef8dd6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_eustall_cntr.c
> > @@ -0,0 +1,1000 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include <linux/anon_inodes.h>
> > +#include <linux/nospec.h>
> > +#include <linux/poll.h>
> > +#include <drm/drm_drv.h>
> > +#include "xe_gt.h"
> > +#include "xe_bo.h"
> > +#include "xe_pm.h"
> > +#include "xe_trace.h"
> > +#include "xe_device.h"
> > +#include "xe_gt_mcr.h"
> > +#include "xe_force_wake.h"
> > +#include "xe_gt_topology.h"
> > +#include "xe_eustall_cntr.h"
> > +#include "regs/xe_gt_regs.h"
> 
> Aren't you missing an include of the EU stall register header you added
> above?
> 
> > +
> > +#define DEFAULT_POLL_FREQUENCY_HZ 100
> > +#define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
> > +#define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
> > +			     __stringify(x), (long)(x))
> 
> We probably shouldn't be using a non-device-specific WARN.  drm_WARN or
> gt_WARN would be preferred since they'd let us know which device or GT
> actually triggered the warning.
> 
> Also, it looks like this is only used in a single place so it might not
> even be worth using a macro.  You can just implement the warning
> directly at the single callsite.
> 
> > +
> > +extern u32 xe_observation_paranoid;
> 
> If this is meant to be used directly like this, then shouldn't we be
> getting the extern declaration from xe_observation.h instead of placing
> it here?
> 
> > +
> > +/**
> > + * struct eu_stall_open_properties
> > + *
> > + * @eu_stall_sampling_rate: Hardware EU stall sampling rate.
> > + * @event_report_count: Minimum no of EU stall data rows for poll to set POLLIN.
> > + * @eu_stall_buf_sz: Per subslice EU stall data buffer size.
> > + * @open_disabled: Should EU stall sampling be disabled at open.
> > + * @poll_period: The period in nanoseconds at which the CPU will check for
> > + *		 EU stall data in the buffer.
> > + * @gt_id: GT ID of the GT on which EU stall data will be captured.
> > + */
> > +struct eu_stall_open_properties {
> > +	u8 eu_stall_sampling_rate;
> > +	u32 event_report_count;
> > +	u32 eu_stall_buf_sz;
> > +	bool open_disabled;
> > +	u64 poll_period;
> > +	u8 gt_id;
> 
> Nitpick, but the current ordering of these fields isn't very good for
> packing the structure...
> 
> > +};
> > +
> > +/**
> > + * num_data_rows - Return the number of EU stall data rows of 64B each
> > + *		   for a given data size.
> > + *
> > + * @data_size: EU stall data size
> > + */
> > +static inline u32
> > +num_data_rows(u32 data_size)
> > +{
> > +	return (data_size >> 6);
> > +}
> > +
> > +int xe_eustall_cntr_init(struct xe_gt *gt)
> > +{
> > +	gt->eu_stall_cntr = kzalloc(sizeof(*gt->eu_stall_cntr), GFP_KERNEL);
> > +	if (!gt->eu_stall_cntr)
> > +		return -ENOMEM;
> > +
> > +	mutex_init(&gt->eu_stall_cntr->lock);
> 
> Should there be a corresponding mutex_destroy() in the fini routine to
> help catch accidental use-after-free?
> 
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_buffer_size(struct xe_device *xe, u64 value,
> > +					 struct eu_stall_open_properties *props)
> > +{
> > +	if (value != SZ_128K &&
> > +	    value != SZ_256K &&
> > +	    value != SZ_512K) {
> > +		drm_dbg(&xe->drm, "Invalid EU stall buffer size %llu\n", value);
> > +		return -EINVAL;
> > +	}
> > +	props->eu_stall_buf_sz = value;
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
> > +					   struct eu_stall_open_properties *props)
> > +{
> > +	if (value == 0 || value > 7) {
> > +		drm_dbg(&xe->drm, "Invalid EU stall sampling rate %llu\n", value);
> > +		return -EINVAL;
> > +	}
> > +	props->eu_stall_sampling_rate = value;
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_poll_period(struct xe_device *xe, u64 value,
> > +					 struct eu_stall_open_properties *props)
> > +{
> > +	if (value < 100000 /* 100us */) {
> > +		drm_dbg(&xe->drm, "EU stall data poll period %lluns less than 100us\n", value);
> > +		return -EINVAL;
> > +	}
> > +	props->poll_period = value;
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_event_report_count(struct xe_device *xe, u64 value,
> > +						struct eu_stall_open_properties *props)
> > +{
> > +	if (value == 0) {
> > +		drm_dbg(&xe->drm, "Invalid EU stall poll event report count %llu\n", value);
> > +		return -EINVAL;
> > +	}
> > +	props->event_report_count = (u32)value;
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
> > +				   struct eu_stall_open_properties *props)
> > +{
> > +	if (value >= XE_MAX_GT_PER_TILE) {
> 
> I'm not sure what the goal of this check is.  If you want to make sure
> it's a valid GT, then comparing against a compile-time constant doesn't
> really help since what really matters is the runtime error check we do
> on the return from xe_device_get_gt().
> 
> On the other hand, if we have platforms at some point with more tiles
> than 2, then this will artificially prevent you from doing EU stall
> sampling on the third tile and beyond.  Same if we have a multi-tile
> platform with multiple GTs per tile.
> 
> > +		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
> > +		return -EINVAL;
> > +	}
> > +	props->gt_id = (u8)value;
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_open_disabled(struct xe_device *xe, u64 value,
> > +					   struct eu_stall_open_properties *props)
> > +{
> > +	props->open_disabled = value;
> > +	return 0;
> > +}
> > +
> > +typedef int (*set_eu_stall_property_fn)(struct xe_device *xe, u64 value,
> > +					struct eu_stall_open_properties *props);
> > +
> > +static const set_eu_stall_property_fn xe_set_eu_stall_property_funcs[] = {
> > +	[DRM_XE_EU_STALL_PROP_BUF_SZ] = set_prop_eu_stall_buffer_size,
> > +	[DRM_XE_EU_STALL_PROP_SAMPLE_RATE] = set_prop_eu_stall_sampling_rate,
> > +	[DRM_XE_EU_STALL_PROP_POLL_PERIOD] = set_prop_eu_stall_poll_period,
> > +	[DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT] = set_prop_eu_stall_event_report_count,
> > +	[DRM_XE_EU_STALL_PROP_GT_ID] = set_prop_eu_stall_gt_id,
> > +	[DRM_XE_EU_STALL_PROP_OPEN_DISABLED] = set_prop_eu_stall_open_disabled,
> > +};
> > +
> > +static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension,
> > +					     struct eu_stall_open_properties *props)
> > +{
> > +	u64 __user *address = u64_to_user_ptr(extension);
> > +	struct drm_xe_ext_set_property ext;
> > +	int err;
> > +	u32 idx;
> > +
> > +	err = __copy_from_user(&ext, address, sizeof(ext));
> > +	if (XE_IOCTL_DBG(xe, err))
> > +		return -EFAULT;
> > +
> > +	if (XE_IOCTL_DBG(xe, ext.property >= ARRAY_SIZE(xe_set_eu_stall_property_funcs)) ||
> > +	    XE_IOCTL_DBG(xe, ext.pad))
> > +		return -EINVAL;
> > +
> > +	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_set_eu_stall_property_funcs));
> > +	return xe_set_eu_stall_property_funcs[idx](xe, ext.value, props);
> > +}
> > +
> > +typedef int (*xe_eu_stall_user_extension_fn)(struct xe_device *xe, u64 extension,
> > +					     struct eu_stall_open_properties *props);
> > +static const xe_eu_stall_user_extension_fn xe_eu_stall_user_extension_funcs[] = {
> > +	[DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY] = xe_eu_stall_user_ext_set_property,
> > +};
> > +
> > +static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> > +				       struct eu_stall_open_properties *props)
> > +{
> > +	u64 __user *address = u64_to_user_ptr(extension);
> > +	struct drm_xe_user_extension ext;
> > +	int err;
> > +	u32 idx;
> > +
> > +	err = __copy_from_user(&ext, address, sizeof(ext));
> > +	if (XE_IOCTL_DBG(xe, err))
> > +		return -EFAULT;
> > +
> > +	if (XE_IOCTL_DBG(xe, ext.pad) ||
> > +	    XE_IOCTL_DBG(xe, ext.name >= ARRAY_SIZE(xe_eu_stall_user_extension_funcs)))
> > +		return -EINVAL;
> > +
> > +	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_eu_stall_user_extension_funcs));
> > +	err = xe_eu_stall_user_extension_funcs[idx](xe, extension, props);
> > +	if (XE_IOCTL_DBG(xe, err))
> > +		return err;
> > +
> > +	if (ext.next_extension)
> > +		return xe_eu_stall_user_extensions(xe, ext.next_extension, props);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * buf_data_size - Calculate the number of bytes in a circular buffer
> > + *		   of size buf_size given the read and write pointers
> > + *		   into the buffer.
> > + *
> > + * @read_ptr: Read pointer. Uses an additional overflow bit
> > + * @write_ptr: Write pointer. Uses an additional overflow bit
> > + *
> > + * Returns: number of bytes of data in the buffer
> > + */
> > +static u32
> > +buf_data_size(size_t buf_size, u32 read_ptr, u32 write_ptr)
> > +{
> > +	u32 read_offset, write_offset, size = 0;
> > +
> > +	read_offset = read_ptr & (buf_size - 1);
> > +	write_offset = write_ptr & (buf_size - 1);
> > +
> > +	if (write_offset > read_offset)
> > +		size = write_offset - read_offset;
> > +	else
> > +		size = buf_size - read_offset + write_offset;
> > +
> > +	return size;
> > +}
> > +
> > +/**
> > + * eu_stall_cntr_buf_check - check for data in the EU stall counter buffer
> > + *
> > + * @stream: xe EU stall data stream instance
> > + *
> > + * Returns: true if the EU stall buffer contains minimum stall data as
> > + *	    specified by the event report count, else false.
> > + */
> > +static bool
> > +eu_stall_cntr_buf_check(struct xe_eu_stall_cntr_stream *stream)
> > +{
> > +	u32 read_ptr, write_ptr_reg, write_ptr, total_data = 0;
> > +	u32 buf_size = stream->per_dss_buf_size;
> > +	struct xe_gt *gt = stream->gt;
> > +	struct per_dss_buf *dss_buf;
> > +	bool min_data_present;
> > +	u16 group, instance;
> > +	unsigned int dss;
> > +
> > +	min_data_present = false;
> > +	for_each_dss_steering(dss, gt, group, instance) {
> > +		dss_buf = &stream->dss_buf[dss];
> > +		mutex_lock(&dss_buf->lock);
> > +		read_ptr = dss_buf->read;
> > +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> > +						       group, instance);
> > +		write_ptr = write_ptr_reg & XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK;
> > +		write_ptr <<= (6 - XEHPC_EUSTALL_REPORT_WRITE_PTR_SHIFT);
> > +		write_ptr &= ((buf_size << 1) - 1);
> > +		if ((write_ptr != read_ptr) && !min_data_present) {
> > +			total_data += buf_data_size(buf_size, read_ptr, write_ptr);
> > +			/*
> > +			 * Check if there are at least minimum number of stall data
> > +			 * rows for poll() to indicate that the data is present.
> > +			 * Each stall data row is 64B (cacheline size).
> > +			 */
> > +			if (num_data_rows(total_data) >= stream->event_report_count)
> > +				min_data_present = true;
> > +		}
> > +		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP) {
> > +			spin_lock(&stream->data_drop.lock);
> > +			bitmap_set(stream->data_drop.mask, dss, 1);
> > +			spin_unlock(&stream->data_drop.lock);
> > +		}
> > +		dss_buf->write = write_ptr;
> > +		mutex_unlock(&dss_buf->lock);
> > +	}
> > +	return min_data_present;
> > +}
> > +
> > +static void
> > +clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
> > +{
> > +	enum xe_platform platform;
> > +	u32 write_ptr_reg;
> > +
> > +	platform = gt_to_xe(gt)->info.platform;
> > +
> > +	/* On PVC, the overflow bit has to be cleared by writing 1 to it.
> > +	 * On other GPUs, the bit has to be cleared by writing 0 to it.
> > +	 */
> > +	if (platform == XE_PVC)
> 
> We shouldn't really be doing platform checks in code like this.  A
> graphics version check would be better:
> 
>         if (GRAPHICS_VER(xe) >= 20)
>                 ...w0c...
>         else
>                 ...w1c...
> 
> > +		write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> > +	else
> > +		write_ptr_reg = _MASKED_BIT_DISABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> > +
> > +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT, write_ptr_reg, group, instance);
> > +	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_REPORT.__reg).addr,
> > +			write_ptr_reg, sizeof(write_ptr_reg));
> 
> Why are we doing manual traces here?  The xe_mmio_*() functions invoked
> by xe_gt_mcr_unicast_write() should already be showing up in the trace
> log, right?  Same question for the rest of the trace calls farther down
> this patch.
> 
> > +}
> > +
> > +static int
> > +__xe_eu_stall_buf_read(struct xe_eu_stall_cntr_stream *stream,
> > +		       char __user *buf, size_t count,
> > +		       size_t *total_size, struct xe_gt *gt,
> > +		       u16 group, u16 instance, unsigned int dss)
> > +{
> > +	u32 read_ptr_reg, read_ptr, write_ptr;
> > +	u8 *dss_start_vaddr, *read_vaddr;
> > +	u32 read_offset, write_offset;
> > +	struct per_dss_buf *dss_buf;
> > +	size_t size, buf_size;
> > +
> > +	/* Hardware increments the read and write pointers such that they can
> > +	 * overflow into one additional bit. For example, a 256KB size buffer
> > +	 * offset pointer needs 18 bits. But HW uses 19 bits for the read and
> > +	 * write pointers. This technique avoids wasting a slot in the buffer.
> > +	 * Read and write offsets are calculated from the pointers in order to
> > +	 * check if the write pointer has wrapped around the array.
> > +	 */
> > +	dss_buf = &stream->dss_buf[dss];
> > +	mutex_lock(&dss_buf->lock);
> > +	dss_start_vaddr = dss_buf->vaddr;
> > +	read_ptr = dss_buf->read;
> > +	write_ptr = dss_buf->write;
> > +	buf_size = stream->per_dss_buf_size;
> > +	read_offset = read_ptr & (buf_size - 1);
> > +	write_offset = write_ptr & (buf_size - 1);
> > +
> > +	trace_xe_eu_stall_cntr_read(group, instance, read_ptr, write_ptr,
> > +				    read_offset, write_offset, *total_size);
> > +	if (write_ptr == read_ptr) {
> > +		mutex_unlock(&dss_buf->lock);
> > +		return 0;
> > +	}
> > +
> > +	/* If write pointer offset is less than the read pointer offset,
> > +	 * it means, write pointer has wrapped around the array.
> > +	 */
> > +	if (write_offset > read_offset)
> > +		size = write_offset - read_offset;
> > +	else
> > +		size = buf_size - read_offset + write_offset;
> > +
> > +	/* Read only the data that the user space buffer can accommodate */
> > +	if ((*total_size + size) > count) {
> > +		mutex_unlock(&dss_buf->lock);
> > +		return 0;
> > +	}
> > +
> > +	read_vaddr = dss_start_vaddr + read_offset;
> > +
> > +	if (write_offset > read_offset) {
> > +		if (copy_to_user((buf + *total_size), read_vaddr, size)) {
> > +			mutex_unlock(&dss_buf->lock);
> > +			return -EFAULT;
> > +		}
> > +	} else {
> > +		if (copy_to_user((buf + *total_size), read_vaddr, (buf_size - read_offset))) {
> > +			mutex_unlock(&dss_buf->lock);
> > +			return -EFAULT;
> > +		}
> > +		if (copy_to_user((buf + *total_size), dss_start_vaddr, write_offset)) {
> > +			mutex_unlock(&dss_buf->lock);
> > +			return -EFAULT;
> > +		}
> > +	}
> > +
> > +	*total_size += size;
> > +	read_ptr += size;
> > +
> > +	/* Read pointer can overflow into one additional bit */
> > +	read_ptr &= ((buf_size << 1) - 1);
> > +	read_ptr_reg = ((read_ptr >> 6) << XEHPC_EUSTALL_REPORT1_READ_PTR_SHIFT);
> > +	read_ptr_reg &= XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
> > +	read_ptr_reg |= (XEHPC_EUSTALL_REPORT1_READ_PTR_MASK <<
> > +			 XEHPC_EUSTALL_REPORT1_MASK_SHIFT);
> > +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, group, instance);
> > +	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_REPORT1.__reg).addr,
> > +			read_ptr_reg, sizeof(read_ptr_reg));
> > +	if (test_bit(dss, stream->data_drop.mask)) {
> > +		clear_dropped_eviction_line_bit(gt, group, instance);
> > +		spin_lock(&stream->data_drop.lock);
> > +		bitmap_clear(stream->data_drop.mask, dss, 1);
> > +		spin_unlock(&stream->data_drop.lock);
> > +	}
> > +	dss_buf->read = read_ptr;
> > +	mutex_unlock(&dss_buf->lock);
> > +	trace_xe_eu_stall_cntr_read(group, instance, read_ptr, write_ptr,
> > +				    read_offset, write_offset, *total_size);
> 
> We do this same trace twice in the function (both before and after we
> modify some of the values like read_ptr).  Was that intentional?
> 
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_buf_read_locked - copy EU stall counters data from the
> > + *				   per dss buffers to the userspace buffer
> > + * @stream: A stream opened for EU stall count metrics
> > + * @buf: destination buffer given by userspace
> > + * @count: the number of bytes userspace wants to read
> > + * @ppos: (inout) file seek position (unused)
> > + *
> > + * Returns: Number of bytes copied or a negative error code
> > + * If we've successfully copied any data then reporting that takes
> > + * precedence over any internal error status, so the data isn't lost.
> > + */
> > +static ssize_t
> > +xe_eu_stall_buf_read_locked(struct xe_eu_stall_cntr_stream *stream,
> > +			    struct file *file, char __user *buf,
> > +			    size_t count, loff_t *ppos)
> > +{
> > +	struct xe_gt *gt = stream->gt;
> > +	size_t total_size = 0;
> > +	u16 group, instance;
> > +	unsigned int dss;
> > +	int ret = 0;
> > +
> > +	if (count == 0)
> > +		return -EINVAL;
> > +
> > +	for_each_dss_steering(dss, gt, group, instance) {
> > +		ret = __xe_eu_stall_buf_read(stream, buf, count, &total_size,
> > +					     gt, group, instance, dss);
> > +		if (ret || count == total_size)
> > +			goto exit;
> > +	}
> > +exit:
> > +	if (total_size)
> > +		return total_size;
> > +	else if (ret)
> > +		return ret;
> > +	else
> > +		return -EAGAIN;
> > +}
> > +
> > +static void
> > +free_eu_stall_cntr_buf(struct xe_eu_stall_cntr_stream *stream)
> > +{
> > +	if (stream->bo) {
> > +		xe_bo_unpin_map_no_vm(stream->bo);
> > +		stream->vaddr = NULL;
> > +		stream->bo = NULL;
> > +	}
> > +	destroy_workqueue(stream->buf_check_wq);
> > +}
> > +
> > +static int alloc_eu_stall_cntr_buf(struct xe_eu_stall_cntr_stream *stream,
> > +				   u32 per_dss_buf_size, u16 num_dss)
> > +{
> > +	struct xe_tile *tile = stream->gt->tile;
> > +	struct xe_bo *bo;
> > +	u32 size;
> > +
> > +	size = per_dss_buf_size * num_dss;
> > +
> > +	bo = xe_bo_create_pin_map(tile->xe, tile, NULL,
> > +				  size, ttm_bo_type_kernel,
> > +				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > +				  XE_BO_FLAG_GGTT);
> > +	if (IS_ERR(bo))
> > +		return PTR_ERR(bo);
> > +
> > +	stream->bo = bo;
> > +	stream->vaddr = bo->vmap.is_iomem ? bo->vmap.vaddr_iomem : bo->vmap.vaddr;
> 
> Aren't we losing the important details of the iosys_map here?  And then
> potentially doing non-IO operations on an IO pointer later?  It seems
> like we should be storing the iosys_map in the stream and then using the
> appropriate functions on it elsewhere.
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static u32
> > +gen_eustall_base(struct xe_eu_stall_cntr_stream *stream, bool enable)
> > +{
> > +	u32 val = xe_bo_ggtt_addr(stream->bo);
> > +	u32 sz;
> > +
> > +	XE_WARN_ON(!IS_ALIGNED(val, 64));
> > +
> > +	switch (stream->per_dss_buf_size) {
> > +	case SZ_128K:
> > +		sz = 0;
> > +		break;
> > +	case SZ_256K:
> > +		sz = 1;
> > +		break;
> > +	case SZ_512K:
> > +		sz = 2;
> > +		break;
> > +	default:
> > +		MISSING_CASE(stream->per_dss_buf_size);
> > +		sz = 2;
> > +	}
> > +
> > +	val |= REG_FIELD_PREP(XEHPC_EUSTALL_BASE_DSS_BUF_SZ, sz);
> > +	if (enable)
> > +		val |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
> > +
> > +	return val;
> > +}
> > +
> > +static void
> > +xe_eu_stall_stream_enable(struct xe_eu_stall_cntr_stream *stream)
> > +{
> > +	struct xe_gt *gt = stream->gt;
> > +	enum xe_platform platform;
> > +	u32 reg_value;
> > +
> > +	platform = gt_to_xe(gt)->info.platform;
> > +
> > +	/* Take runtime pm ref and forcewake to disable RC6 */
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> > +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> 
> Do we really need XE_FORCEWAKE_ALL?  Are we doing anything outside the
> render domain that requires waking all the other domains?
> 
> > +
> > +	/*
> > +	 * Wa_22016596838:pvc
> > +	 * Disable EU DOP gating for PVC.
> > +	 */
> > +	if (platform == XE_PVC)
> 
> This should be an OOB workaround, not a platform check.
> 
> > +		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
> > +					  _MASKED_BIT_ENABLE(DISABLE_DOP_GATING));
> > +
> > +	reg_value = gen_eustall_base(stream, true);
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> > +	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_BASE.__reg).addr,
> > +			reg_value, sizeof(reg_value));
> > +}
> > +
> > +static void
> > +xe_eu_stall_stream_disable(struct xe_eu_stall_cntr_stream *stream)
> > +{
> > +	struct xe_gt *gt = stream->gt;
> > +	enum xe_platform platform;
> > +	u16 group, instance;
> > +	unsigned int dss;
> > +	u32 reg_value;
> > +
> > +	platform = gt_to_xe(gt)->info.platform;
> > +
> > +	/*
> > +	 * Before disabling EU stall sampling, check if any of the
> > +	 * XEHPC_EUSTALL_REPORT registers have the drop bit set. If set,
> > +	 * clear the bit. If the user space application reads all the
> > +	 * stall data, the drop bit would be cleared during the read.
> > +	 * But if there is any unread data and the drop bit is set for
> > +	 * any subslice, the drop bit would continue to be set even
> > +	 * after disabling EU stall sampling and may cause erroneous
> > +	 * stall data in the subsequent stall data sampling run.
> > +	 */
> > +	for_each_dss_steering(dss, gt, group, instance) {
> > +		reg_value = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> > +						   group, instance);
> > +		if (reg_value & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
> > +			clear_dropped_eviction_line_bit(gt, group, instance);
> > +	}
> > +	reg_value = gen_eustall_base(stream, false);
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> > +	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_BASE.__reg).addr,
> > +			reg_value, sizeof(reg_value));
> > +
> > +	/* Wa_22016596838:pvc */
> > +	if (platform == XE_PVC)
> > +		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
> > +					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
> > +
> > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +}
> > +
> > +static void eu_stall_buf_check_work_fn(struct work_struct *work)
> > +{
> > +	struct xe_eu_stall_cntr_stream *stream =
> > +		container_of(work, typeof(*stream), buf_check_work);
> > +
> > +	if (eu_stall_cntr_buf_check(stream)) {
> > +		stream->pollin = true;
> > +		wake_up(&stream->poll_wq);
> > +	}
> > +}
> > +
> > +static enum
> > +hrtimer_restart eu_stall_poll_check_timer_cb(struct hrtimer *hrtimer)
> > +{
> > +	struct xe_eu_stall_cntr_stream *stream =
> > +		container_of(hrtimer, typeof(*stream), poll_check_timer);
> > +
> > +	queue_work(stream->buf_check_wq, &stream->buf_check_work);
> > +	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_period));
> > +
> > +	return HRTIMER_RESTART;
> > +}
> > +
> > +static int xe_eu_stall_stream_init(struct xe_eu_stall_cntr_stream *stream,
> > +				   struct eu_stall_open_properties *props,
> > +				   u16 num_dss)
> > +{
> > +	u32 write_ptr_reg, write_ptr, read_ptr_reg;
> > +	u32 vaddr_offset, reg_value;
> > +	struct xe_gt *gt = stream->gt;
> > +	struct per_dss_buf *dss_buf;
> > +	u16 group, instance;
> > +	int ret, dss;
> > +
> > +	init_waitqueue_head(&stream->poll_wq);
> > +	INIT_WORK(&stream->buf_check_work, eu_stall_buf_check_work_fn);
> > +	stream->buf_check_wq = alloc_ordered_workqueue("xe_eustall_cntr", 0);
> > +	if (!stream->buf_check_wq)
> > +		return -ENOMEM;
> > +	hrtimer_init(&stream->poll_check_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> > +	stream->poll_check_timer.function = eu_stall_poll_check_timer_cb;
> > +	stream->event_report_count = props->event_report_count;
> > +	stream->per_dss_buf_size = props->eu_stall_buf_sz;
> > +	stream->poll_period = props->poll_period;
> > +
> > +	ret = alloc_eu_stall_cntr_buf(stream, props->eu_stall_buf_sz, num_dss);
> > +	if (ret)
> > +		return ret;
> > +
> > +	stream->dss_buf = kcalloc(num_dss, sizeof(*stream->dss_buf), GFP_KERNEL);
> > +	if (!stream->dss_buf)
> > +		return -ENOMEM;
> > +
> > +	spin_lock_init(&stream->data_drop.lock);
> > +	stream->data_drop.reported_to_user = false;
> > +	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
> > +
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> > +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> > +
> > +	reg_value = gen_eustall_base(stream, false);
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> > +	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_BASE.__reg).addr,
> > +			reg_value, sizeof(reg_value));
> > +	/* GGTT addresses can never be > 32 bits */
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE_UPPER, 0);
> > +	reg_value = _MASKED_FIELD(EUSTALL_MOCS | EUSTALL_SAMPLE_RATE,
> > +				  REG_FIELD_PREP(EUSTALL_MOCS, gt->mocs.uc_index << 1) |
> > +				  REG_FIELD_PREP(EUSTALL_SAMPLE_RATE,
> > +						 props->eu_stall_sampling_rate));
> > +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_CTRL, reg_value);
> > +	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_CTRL.__reg).addr,
> > +			reg_value, sizeof(reg_value));
> > +
> > +	for_each_dss_steering(dss, gt, group, instance) {
> > +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> > +						       group, instance);
> > +		write_ptr = write_ptr_reg & XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK;
> > +		write_ptr <<= (6 - XEHPC_EUSTALL_REPORT_WRITE_PTR_SHIFT);
> > +		write_ptr &= ((stream->per_dss_buf_size << 1) - 1);
> > +		read_ptr_reg = write_ptr >> (6 - XEHPC_EUSTALL_REPORT1_READ_PTR_SHIFT);
> > +		read_ptr_reg &= XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
> > +		read_ptr_reg |= (XEHPC_EUSTALL_REPORT1_READ_PTR_MASK <<
> > +				 XEHPC_EUSTALL_REPORT1_MASK_SHIFT);
> > +		xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1,
> > +					read_ptr_reg, group, instance);
> > +		dss_buf = &stream->dss_buf[dss];
> > +		vaddr_offset = dss * props->eu_stall_buf_sz;
> > +		dss_buf->vaddr = stream->vaddr + vaddr_offset;
> > +		dss_buf->write = write_ptr;
> > +		dss_buf->read = write_ptr;
> > +		mutex_init(&dss_buf->lock);
> > +	}
> > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_buf_read - handles read FOP for xe EU stall cntr stream FDs
> > + * @file: An xe EU stall cntr stream file
> > + * @buf: destination buffer given by userspace
> > + * @count: the number of bytes userspace wants to read
> > + * @ppos: (inout) file seek position (unused)
> > + *
> > + * Returns: The number of bytes copied or a negative error code on failure.
> > + */
> > +static ssize_t xe_eu_stall_buf_read(struct file *file, char __user *buf,
> > +				    size_t count, loff_t *ppos)
> > +{
> > +	struct xe_eu_stall_cntr_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +	ssize_t ret;
> > +
> > +	if (!stream->enabled) {
> > +		drm_dbg(&gt->tile->xe->drm, "EU stall data stream not enabled to read\n");
> 
> Here and elsewhere throughout this patch, it would be much better to use
> xe_gt_dbg() and such so that we have more useful log output that
> identifies which GT the messages came from.
> 
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
> > +		if (!stream->data_drop.reported_to_user) {
> > +			stream->data_drop.reported_to_user = true;
> > +			drm_dbg(&gt->tile->xe->drm, "EU stall data drop reported\n");
> > +			return -EIO;
> > +		}
> > +		stream->data_drop.reported_to_user = false;
> > +	}
> > +
> > +	if (!(file->f_flags & O_NONBLOCK)) {
> > +		do {
> > +			if (!stream->pollin) {
> > +				ret = wait_event_interruptible(stream->poll_wq, stream->pollin);
> > +				if (ret)
> > +					return -EINTR;
> > +			}
> > +
> > +			mutex_lock(&gt->eu_stall_cntr->lock);
> > +			ret = xe_eu_stall_buf_read_locked(stream, file, buf, count, ppos);
> > +			mutex_unlock(&gt->eu_stall_cntr->lock);
> > +		} while (ret == -EAGAIN);
> > +	} else {
> > +		mutex_lock(&gt->eu_stall_cntr->lock);
> > +		ret = xe_eu_stall_buf_read_locked(stream, file, buf, count, ppos);
> > +		mutex_unlock(&gt->eu_stall_cntr->lock);
> > +	}
> > +
> > +	stream->pollin = false;
> > +
> > +	return ret;
> > +}
> > +
> > +static __poll_t
> > +xe_eu_stall_buf_poll_locked(struct xe_eu_stall_cntr_stream *stream,
> > +			    struct file *file, poll_table *wait)
> > +{
> > +	__poll_t events = 0;
> > +
> > +	poll_wait(file, &stream->poll_wq, wait);
> > +
> > +	if (stream->pollin)
> > +		events |= EPOLLIN;
> > +
> > +	return events;
> > +}
> > +
> > +static __poll_t
> > +xe_eu_stall_buf_poll(struct file *file, poll_table *wait)
> > +{
> > +	struct xe_eu_stall_cntr_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +	__poll_t ret;
> > +
> > +	mutex_lock(&gt->eu_stall_cntr->lock);
> > +	ret = xe_eu_stall_buf_poll_locked(stream, file, wait);
> > +	mutex_unlock(&gt->eu_stall_cntr->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static void
> > +xe_eu_stall_cntr_enable_locked(struct xe_eu_stall_cntr_stream *stream)
> > +{
> > +	if (stream->enabled)
> > +		return;
> > +
> > +	stream->enabled = true;
> > +
> > +	xe_eu_stall_stream_enable(stream);
> > +	hrtimer_start(&stream->poll_check_timer,
> > +		      ns_to_ktime(stream->poll_period),
> > +		      HRTIMER_MODE_REL);
> > +}
> > +
> > +static void
> > +xe_eu_stall_cntr_disable_locked(struct xe_eu_stall_cntr_stream *stream)
> > +{
> > +	if (!stream->enabled)
> > +		return;
> > +
> > +	stream->enabled = false;
> > +
> > +	hrtimer_cancel(&stream->poll_check_timer);
> > +	flush_workqueue(stream->buf_check_wq);
> > +	xe_eu_stall_stream_disable(stream);
> > +}
> > +
> > +static long
> > +xe_eu_stall_cntr_info_locked(struct xe_eu_stall_cntr_stream *stream,
> > +			     unsigned long arg)
> > +{
> > +	struct drm_xe_eu_stall_stream_info info = { .record_size = 0, };
> > +	void __user *uaddr = (void __user *)arg;
> > +	struct xe_gt *gt = stream->gt;
> > +	enum xe_platform platform;
> > +
> > +	platform = gt_to_xe(gt)->info.platform;
> > +
> > +	if (platform == XE_PVC)
> > +		info.record_size = sizeof(struct drm_xe_eu_stall_data_pvc);
> > +	else if ((platform == XE_LUNARLAKE) || (platform == XE_BATTLEMAGE))
> > +		info.record_size = sizeof(struct drm_xe_eu_stall_data_xe2);
> > +
> > +	if (copy_to_user(uaddr, &info, sizeof(info)))
> > +		return -EFAULT;
> > +
> > +	return 0;
> > +}
> > +
> > +static long
> > +xe_eu_stall_cntr_ioctl_locked(struct xe_eu_stall_cntr_stream *stream,
> > +			      unsigned int cmd, unsigned long arg)
> > +{
> > +	switch (cmd) {
> > +	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> > +		xe_eu_stall_cntr_enable_locked(stream);
> > +		return 0;
> > +	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> > +		xe_eu_stall_cntr_disable_locked(stream);
> > +		return 0;
> > +	case DRM_XE_OBSERVATION_IOCTL_INFO:
> > +		return xe_eu_stall_cntr_info_locked(stream, arg);
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_cntr_ioctl - support ioctl() usage with xe EU stall counter
> > + *								stream FDs
> > + * @file: An xe EU stall cntr stream file
> > + * @cmd: the ioctl request
> > + * @arg: the ioctl data
> > + *
> > + * Implementation deferred to xe_eu_stall_cntr_ioctl_locked().
> > + *
> > + * Returns: zero on success or a negative error code. Returns -EINVAL for
> > + * an unknown ioctl request.
> > + */
> > +static long xe_eu_stall_cntr_ioctl(struct file *file,
> > +				   unsigned int cmd,
> > +				   unsigned long arg)
> > +{
> > +	struct xe_eu_stall_cntr_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +	long ret;
> > +
> > +	mutex_lock(&gt->eu_stall_cntr->lock);
> > +	ret = xe_eu_stall_cntr_ioctl_locked(stream, cmd, arg);
> > +	mutex_unlock(&gt->eu_stall_cntr->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static void
> > +xe_eu_stall_destroy_locked(struct xe_eu_stall_cntr_stream *stream)
> > +{
> > +	xe_eu_stall_cntr_disable_locked(stream);
> > +	free_eu_stall_cntr_buf(stream);
> > +}
> > +
> > +/**
> > + * xe_eu_stall_release - handles userspace close() of a EU stall data
> > + *			   stream file.
> > + * @inode: anonymous inode associated with file
> > + * @file: An xe EU stall stream file
> > + *
> > + * Cleans up any resources associated with an open EU stall data stream file.
> > + */
> > +static int xe_eu_stall_release(struct inode *inode, struct file *file)
> > +{
> > +	struct xe_eu_stall_cntr_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +
> > +	mutex_lock(&gt->eu_stall_cntr->lock);
> > +	xe_eu_stall_destroy_locked(stream);
> > +	kfree(stream->dss_buf);
> > +	kfree(stream);
> > +	gt->eu_stall_cntr->stream = NULL;
> > +	mutex_unlock(&gt->eu_stall_cntr->lock);
> > +
> > +	/* Release the reference the EU stall stream kept on the driver */
> > +	drm_dev_put(&gt->tile->xe->drm);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct file_operations fops_eu_stall = {
> > +	.owner		= THIS_MODULE,
> > +	.llseek		= no_llseek,
> > +	.release	= xe_eu_stall_release,
> > +	.poll		= xe_eu_stall_buf_poll,
> > +	.read		= xe_eu_stall_buf_read,
> > +	.unlocked_ioctl = xe_eu_stall_cntr_ioctl,
> > +	.compat_ioctl   = xe_eu_stall_cntr_ioctl,
> > +};
> > +
> > +/**
> > + * xe_open_eu_stall_stream_locked - Open a EU stall data stream FD.
> > + * @dev: drm device instance
> > + * @props: individually validated u64 property value pairs
> > + * @file: drm file
> > + * @gt: GT from which the EU stall data will be captured
> > + *
> > + * Returns: zero on success or a negative error code.
> > + */
> > +static int
> > +xe_open_eu_stall_stream_locked(struct drm_device *dev,
> > +			       struct eu_stall_open_properties *props,
> > +			       struct drm_file *file,
> > +			       struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = to_xe_device(dev);
> > +	struct xe_eu_stall_cntr_stream *stream;
> > +	unsigned long f_flags = 0;
> > +	xe_dss_mask_t all_dss;
> > +	int ret, stream_fd;
> > +	u32 tile_buf_size;
> > +	u16 num_dss;
> > +
> > +	if (xe_observation_paranoid && !perfmon_capable()) {
> > +		drm_dbg(&xe->drm, "Insufficient privileges for EU stall monitoring\n");
> > +		return -EACCES;
> > +	}
> > +
> > +	/* Only one session can be active at any time */
> > +	if (gt->eu_stall_cntr->stream) {
> > +		drm_dbg(&xe->drm, "EU stall cntr session already active\n");
> > +		return -EBUSY;
> > +	}
> > +
> > +	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> > +		  XE_MAX_DSS_FUSE_BITS);
> > +	/*
> > +	 * Enabled subslices can be discontiguous. Find the last subslice
> > +	 * and calculate total buffer size based on that.
> > +	 * intel_sseu_highest_xehp_dss returns zero based position.
> 
> What is intel_sseu_highest_xehp_dss?  That sounds like an i915 function
> name, but this is Xe (and no such function exists in i915 either).
> 
> > +	 * Therefore the result is incremented.
> > +	 */
> > +	num_dss = xe_dss_mask_last_dss(all_dss) + 1;
> > +	tile_buf_size = props->eu_stall_buf_sz * num_dss;
> > +	if (props->event_report_count > num_data_rows(tile_buf_size)) {
> > +		drm_dbg(&xe->drm, "Invalid EU stall data poll event report count %u\n",
> > +			props->event_report_count);
> > +		drm_dbg(&xe->drm, "Maximum event report count for the given buffer size is %u\n",
> > +			num_data_rows(tile_buf_size));
> > +		return -EINVAL;
> > +	}
> > +
> > +	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> > +	if (!stream)
> > +		return -ENOMEM;
> > +
> > +	gt->eu_stall_cntr->stream = stream;
> > +	stream->gt = gt;
> > +
> > +	ret = xe_eu_stall_stream_init(stream, props, num_dss);
> > +	if (ret) {
> > +		drm_dbg(&xe->drm, "EU stall stream init failed : %d\n", ret);
> > +		goto err_alloc;
> > +	}
> > +
> > +	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall,
> > +				     stream, f_flags);
> > +	if (stream_fd < 0) {
> > +		ret = stream_fd;
> > +		drm_dbg(&xe->drm, "EU stall inode get fd failed : %d\n", ret);
> > +		goto err_open;
> > +	}
> > +
> > +	if (!props->open_disabled)
> > +		xe_eu_stall_cntr_enable_locked(stream);
> > +
> > +	/* Take a reference on the driver that will be kept with stream_fd
> > +	 * until its release.
> > +	 */
> > +	drm_dev_get(&gt->tile->xe->drm);
> > +
> > +	return stream_fd;
> > +
> > +err_open:
> > +	free_eu_stall_cntr_buf(stream);
> > +err_alloc:
> > +	gt->eu_stall_cntr->stream = NULL;
> > +	kfree(stream->dss_buf);
> > +	kfree(stream);
> > +	return ret;
> > +}
> > +
> > +int xe_open_eu_stall_stream(struct drm_device *dev,
> > +			    u64 data,
> > +			    struct drm_file *file)
> > +{
> > +	struct xe_device *xe = to_xe_device(dev);
> > +	struct eu_stall_open_properties props;
> > +	struct xe_gt *gt;
> > +	int ret;
> > +
> > +	memset(&props, 0, sizeof(struct eu_stall_open_properties));
> > +
> > +	/* Set default values */
> > +	props.gt_id = 0;
> > +	props.eu_stall_buf_sz = SZ_256K;
> > +	props.eu_stall_sampling_rate = 4;
> > +	props.poll_period = DEFAULT_POLL_PERIOD_NS;
> > +	props.event_report_count = 1;
> > +
> > +	ret = xe_eu_stall_user_extensions(xe, data, &props);
> > +	if (ret)
> > +		return ret;
> > +
> > +	gt = xe_device_get_gt(xe, props.gt_id);
> > +	if (!gt) {
> > +		drm_dbg(&xe->drm, "Invalid GT for EU stall sampling\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	mutex_lock(&gt->eu_stall_cntr->lock);
> > +	ret = xe_open_eu_stall_stream_locked(dev, &props, file, gt);
> > +	mutex_unlock(&gt->eu_stall_cntr->lock);
> > +	return ret;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_eustall_cntr.h b/drivers/gpu/drm/xe/xe_eustall_cntr.h
> > new file mode 100644
> > index 000000000000..417c38838432
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_eustall_cntr.h
> > @@ -0,0 +1,60 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef __XE_EUSTALL_CNTR_H__
> > +#define __XE_EUSTALL_CNTR_H__
> > +
> > +#include <drm/xe_drm.h>
> > +#include <drm/drm_file.h>
> > +#include "xe_gt_types.h"
> > +#include "regs/xe_eu_stall_regs.h"
> > +
> > +struct per_dss_buf {
> > +	u8 *vaddr;
> > +	u32 write;
> > +	u32 read;
> > +	/* lock to protect read and write pointers */
> > +	struct mutex lock;
> > +};
> > +
> > +/**
> > + * struct xe_eu_stall_cntr_stream - state of EU stall counter stream FD
> > + */
> > +struct xe_eu_stall_cntr_stream {
> > +	u8 *vaddr;
> > +	bool pollin;
> > +	bool enabled;
> > +	u64 poll_period;
> > +	u32 event_report_count;
> > +	size_t per_dss_buf_size;
> > +	wait_queue_head_t poll_wq;
> > +
> > +	struct xe_gt *gt;
> > +	struct xe_bo *bo;
> > +	struct per_dss_buf *dss_buf;
> > +	struct {
> > +		bool reported_to_user;
> > +		xe_dss_mask_t mask;
> > +		/* lock to protect mask */
> > +		spinlock_t lock;
> > +	} data_drop;
> > +	struct hrtimer poll_check_timer;
> > +	struct work_struct buf_check_work;
> > +	struct workqueue_struct *buf_check_wq;
> > +};
> > +
> > +struct xe_eu_stall_cntr_gt {
> > +	/* Lock to protect stream */
> > +	struct mutex lock;
> > +
> > +	/* Execution Unit (EU) stall counter stream */
> > +	struct xe_eu_stall_cntr_stream *stream;
> > +};
> > +
> > +int xe_eustall_cntr_init(struct xe_gt *gt);
> > +int xe_open_eu_stall_stream(struct drm_device *dev,
> > +			    u64 data,
> > +			    struct drm_file *file);
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index f0dc2bf24c7b..0f661ebe9403 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -59,6 +59,7 @@
> >  #include "xe_vm.h"
> >  #include "xe_wa.h"
> >  #include "xe_wopcm.h"
> > +#include "xe_eustall_cntr.h"
> >  
> >  static void gt_fini(struct drm_device *drm, void *arg)
> >  {
> > @@ -158,6 +159,7 @@ void xe_gt_remove(struct xe_gt *gt)
> >  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> >  
> >  	xe_gt_disable_host_l2_vram(gt);
> > +	kfree(gt->eu_stall_cntr);
> >  }
> >  
> >  static void gt_reset_worker(struct work_struct *w);
> > @@ -620,6 +622,10 @@ int xe_gt_init(struct xe_gt *gt)
> >  
> >  	xe_gt_record_user_engines(gt);
> >  
> > +	err = xe_eustall_cntr_init(gt);
> > +	if (err)
> > +		return err;
> > +
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > index 0662f71c6ede..031782247723 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > @@ -264,6 +264,15 @@ xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
> >  	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
> >  }
> >  
> > +/*
> > + * Used to obtain the index of the last DSS.
> > + */
> > +unsigned int
> > +xe_dss_mask_last_dss(const xe_dss_mask_t mask)
> > +{
> > +	return find_last_bit(mask, XE_MAX_DSS_FUSE_BITS);
> > +}
> > +
> >  bool xe_dss_mask_empty(const xe_dss_mask_t mask)
> >  {
> >  	return bitmap_empty(mask, XE_MAX_DSS_FUSE_BITS);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> > index 746b325bbf6e..7ee022784397 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> > @@ -28,6 +28,9 @@ void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
> >  unsigned int
> >  xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
> >  
> > +unsigned int
> > +xe_dss_mask_last_dss(const xe_dss_mask_t mask);
> > +
> >  bool xe_dss_mask_empty(const xe_dss_mask_t mask);
> >  
> >  bool
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 3d1c51de0268..a8eb312c28fd 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -428,6 +428,9 @@ struct xe_gt {
> >  
> >  	/** @oa: oa observation subsystem per gt info */
> >  	struct xe_oa_gt oa;
> > +
> > +	/** @eu_stall_cntr: EU stall counters subsystem per gt info */
> > +	struct xe_eu_stall_cntr_gt *eu_stall_cntr;
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> > index 8ec1b84cbb9e..b1942bc72ae0 100644
> > --- a/drivers/gpu/drm/xe/xe_observation.c
> > +++ b/drivers/gpu/drm/xe/xe_observation.c
> > @@ -8,6 +8,7 @@
> >  
> >  #include <uapi/drm/xe_drm.h>
> >  
> > +#include "xe_eustall_cntr.h"
> >  #include "xe_oa.h"
> >  #include "xe_observation.h"
> >  
> > @@ -29,6 +30,17 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
> >  	}
> >  }
> >  
> > +static int xe_eu_stall_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
> > +			     struct drm_file *file)
> > +{
> > +	switch (arg->observation_op) {
> > +	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
> > +		return xe_open_eu_stall_stream(dev, arg->param, file);
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> >  /**
> >   * xe_observation_ioctl - The top level observation layer ioctl
> >   * @dev: @drm_device
> > @@ -51,6 +63,8 @@ int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
> >  	switch (arg->observation_type) {
> >  	case DRM_XE_OBSERVATION_TYPE_OA:
> >  		return xe_oa_ioctl(dev, arg, file);
> > +	case DRM_XE_OBSERVATION_TYPE_EU_STALL:
> > +		return xe_eu_stall_ioctl(dev, arg, file);
> >  	default:
> >  		return -EINVAL;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 8573d7a87d84..dfb1eb121337 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -421,6 +421,41 @@ DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_ioctl,
> >  	     TP_ARGS(xe, caller)
> >  );
> >  
> > +TRACE_EVENT(xe_eu_stall_cntr_read,
> > +	    TP_PROTO(u8 slice, u8 subslice,
> > +		     u32 read_ptr, u32 write_ptr,
> > +		     u32 read_offset, u32 write_offset,
> > +		     size_t total_size),
> > +	    TP_ARGS(slice, subslice, read_ptr, write_ptr,
> > +		    read_offset, write_offset, total_size),
> > +
> > +	    TP_STRUCT__entry(
> > +			     __field(u8, slice)
> > +			     __field(u8, subslice)
> > +			     __field(u32, read_ptr)
> > +			     __field(u32, write_ptr)
> > +			     __field(u32, read_offset)
> > +			     __field(u32, write_offset)
> > +			     __field(size_t, total_size)
> > +			     ),
> > +
> > +	    TP_fast_assign(
> > +			   __entry->slice = slice;
> > +			   __entry->subslice = subslice;
> > +			   __entry->read_ptr = read_ptr;
> > +			   __entry->write_ptr = write_ptr;
> > +			   __entry->read_offset = read_offset;
> > +			   __entry->write_offset = write_offset;
> > +			   __entry->total_size = total_size;
> > +			   ),
> > +
> > +	    TP_printk("slice:%u subslice:%u readptr:0x%x writeptr:0x%x read off:%u write off:%u size:%zu ",
> > +		      __entry->slice, __entry->subslice,
> > +		      __entry->read_ptr, __entry->write_ptr,
> > +		      __entry->read_offset, __entry->write_offset,
> > +		      __entry->total_size)
> > +);
> > +
> >  #endif
> >  
> >  /* This part must be outside protection */
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index b6fbe4988f2e..c836227d064f 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1395,6 +1395,8 @@ struct drm_xe_wait_user_fence {
> >  enum drm_xe_observation_type {
> >  	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
> >  	DRM_XE_OBSERVATION_TYPE_OA,
> > +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> > +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
> >  };
> >  
> >  /**
> > @@ -1694,6 +1696,138 @@ struct drm_xe_oa_stream_info {
> >  	__u64 reserved[3];
> >  };
> >  
> > +/**
> > + * enum drm_xe_eu_stall_property_id - EU stall data stream property ids.
> > + *
> > + * These properties are passed to the driver as a chain of
> > + * @drm_xe_ext_set_property structures with @property set to these
> > + * properties' enums and @value set to the corresponding values of these
> > + * properties. @drm_xe_user_extension base.name should be set to
> > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> > + */
> > +enum drm_xe_eu_stall_property_id {
> > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_BUF_SZ: Per DSS Memory Buffer Size.
> > +	 * Valid values are 128 KB, 256 KB, and 512 KB.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_BUF_SZ = 1,
> 
> Does userspace really care about this being configurable?  Even if we
> have a platform with XE_MAX_DSS_FUSE_BITS total XeCores, the difference
> between the largest and smallest sizes here only saves 48MB of memory.
> The hardware makes this configurable, but is there actually an ask to
> expose this through the uapi?  If not, I'd say we should just always
> pick 512KB internally and keep things simple.
> 
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> > +	 * in multiples of 251 cycles. Valid values are 1 to 7.
> > +	 * If the value is 1, sampling interval is 251 cycles.
> > +	 * If the value is 7, sampling interval is 7 x 251 cycles.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_POLL_PERIOD: EU stall data
> > +	 * poll period in nanoseconds. should be at least 100000 ns.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_POLL_PERIOD,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT: Minimum number of
> > +	 * EU stall data rows to be present in the kernel buffer for
> > +	 * poll() to set POLLIN (data present).
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_GT_ID: GT ID of the GT on which
> > +	 * EU stall data will be captured.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_GT_ID,
> 
> I mentioned above, but it feels like this should be an intrinsic part of
> the API, not something coming in through an optional extension...
> 
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_OPEN_DISABLED: A value of 1 will open
> > +	 * the EU stall data stream without enabling EU stall sampling.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_OPEN_DISABLED,
> 
> Is there a reason not to make this one the default behavior?  Is there
> really a benefit to auto-enabling on open that makes it worth the extra
> API complexity to make this configurable?
> 
> > +};
> > +
> > +/**
> > + * struct drm_xe_eu_stall_stream_info - EU stall stream info returned from
> > + * @DRM_XE_OBSERVATION_IOCTL_INFO observation stream fd ioctl
> > + */
> > +struct drm_xe_eu_stall_stream_info {
> > +	/** @extensions: Pointer to the first extension struct, if any */
> > +	__u64 extensions;
> > +
> > +	/** @record_size: size of each EU stall data record */
> > +	__u64 record_size;
> > +
> > +	/** @reserved: reserved for future use */
> > +	__u64 reserved[3];
> > +};
> > +
> > +/**
> > + * struct drm_xe_eu_stall_data_pvc - EU stall data format for PVC
> 
> I thought there was an ask from one of the userspace teams that we make
> the layout discoverable?  I.e., a runtime-queryable format description
> that lists the counter type, size, and offset in the record of each
> counter that has usable data in the records?  Did we change directions
> on that?
> 
> 
> Matt
> 
> > + *
> > + * Bits		Field
> > + * 0  to 28	IP (addr)
> > + * 29 to 36	active count
> > + * 37 to 44	other count
> > + * 45 to 52	control count
> > + * 53 to 60	pipestall count
> > + * 61 to 68	send count
> > + * 69 to 76	dist_acc count
> > + * 77 to 84	sbid count
> > + * 85 to 92	sync count
> > + * 93 to 100	inst_fetch count
> > + */
> > +struct drm_xe_eu_stall_data_pvc {
> > +	__u64 ip_addr:29;
> > +	__u64 active_count:8;
> > +	__u64 other_count:8;
> > +	__u64 control_count:8;
> > +	__u64 pipestall_count:8;
> > +	__u64 send_count:8;
> > +	__u64 dist_acc_count:8;
> > +	__u64 sbid_count:8;
> > +	__u64 sync_count:8;
> > +	__u64 inst_fetch_count:8;
> > +	__u64 unused_bits:27;
> > +	__u64 unused[6];
> > +} __attribute__((packed));
> > +
> > +/**
> > + * struct drm_xe_eu_stall_data_xe2 - EU stall data format for LNL, BMG
> > + *
> > + * Bits		Field
> > + * 0  to 28	IP (addr)
> > + * 29 to 36	Tdr count
> > + * 37 to 44	other count
> > + * 45 to 52	control count
> > + * 53 to 60	pipestall count
> > + * 61 to 68	send count
> > + * 69 to 76	dist_acc count
> > + * 77 to 84	sbid count
> > + * 85 to 92	sync count
> > + * 93 to 100	inst_fetch count
> > + * 101 to 108	Active count
> > + * 109 to 111	Exid
> > + * 112		EndFlag (is always 1)
> > + */
> > +struct drm_xe_eu_stall_data_xe2 {
> > +	__u64 ip_addr:29;
> > +	__u64 tdr_count:8;
> > +	__u64 other_count:8;
> > +	__u64 control_count:8;
> > +	__u64 pipestall_count:8;
> > +	__u64 send_count:8;
> > +	__u64 dist_acc_count:8;
> > +	__u64 sbid_count:8;
> > +	__u64 sync_count:8;
> > +	__u64 inst_fetch_count:8;
> > +	__u64 active_count:8;
> > +	__u64 ex_id:3;
> > +	__u64 end_flag:1;
> > +	__u64 unused_bits:15;
> > +	__u64 unused[6];
> > +} __attribute__((packed));
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > -- 
> > 2.45.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
